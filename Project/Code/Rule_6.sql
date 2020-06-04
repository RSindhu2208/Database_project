-- creating a view joining stock, employee, portfolio manager and transctions table to get the potential insider trader for a "Short" or "Sell" transaction
create view rule6 as 
select t1.pmID, e.firstName, e.lastName, t1.stockSymbol, s.companyName, t1.transactionDate, s.weekPercentMove 
from transactions t1 
join stock s 
on t1.stockSymbol = s.stockSymbol
JOIN portfolioManager m
on t1.pmID = m.pmID
JOIN employee e
on e.empID = m.empID
JOIN transactionType t2
on t2.typeID = t1.typeID
WHERE t2.transactionName = "Short" OR t2.transactionName = "Sell"
and t1.transactionDate <= CURDATE() and t1.transactionDate >= date_add(CURDATE(), INTERVAL -15 DAY);


-- PROCEDURE: If a "short" or "sell" transaction type was executed within 15 days of a subsequent 20% stock price move downward over 7-days, then generate a case for analysis.
DELIMITER //
DROP procedure if exists rule6_procedure;
DROP Table if exists rule6Table;
CREATE PROCEDURE rule6_procedure()
BEGIN
	DECLARE j INT;
  SET j = 0;
   select count(*) into @length1 from rule6;
    WHILE j < @length1 DO
        create table if not exists rule6Table select pmID, firstName, lastName, stockSymbol, companyName, weekPercentMove from rule6 where transactionDate <= CURDATE() and transactionDate >= DATE_ADD(CURDATE(), INTERVAL -15 DAY) and weekPercentMove < -20;
        insert into rule6Table select pmID, firstName, lastName, stockSymbol, companyName, weekPercentMove from rule6 where transactionDate <= CURDATE() and transactionDate >= DATE_ADD(CURDATE(), INTERVAL -15 DAY) and weekPercentMove < -20;
        SET j = j + 1;
    END WHILE;
  select DISTINCT pmID, firstName, lastName, stockSymbol, companyName, weekPercentMove from rule6Table;
call rule6_cases();
END//
DELIMITER ;


--  Adding values to the cases table to record insider trading cases
DELIMITER //
drop procedure if exists rule6_cases;
create procedure rule6_cases()
BEGIN
  DECLARE k INT;
  SET k = 0;
  select count(*) into @length from rule6Table;
	WHILE (k < @length) DO
		insert into cases (caseDate, pmID, ruleID) values (curdate(), (select pmID from rule6Table LIMIT k,1) , 6);
        SET k = k + 1;
	END WHILE;
END//
DELIMITER ; 


-- Calling Rule 6
CALL rule6_procedure();