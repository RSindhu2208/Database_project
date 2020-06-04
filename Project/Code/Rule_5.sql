-- creating a view joining stock, employee, portfolio manager and transctions table to get the potential insider trader for a "Short" or "Sell" transaction
create view rule5 as 
select t1.pmID, e.firstName, e.lastName, t1.stockSymbol, s.companyName, t1.transactionDate, s.dayPercentMove 
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


-- PROCEDURE: If a "short" or "sell" transaction type was executed within 15 days of a subsequent 10%-day stock price move downward, then generate a case for analysis
DELIMITER //
DROP procedure if exists rule5_procedure;
DROP Table if exists rule5Table;
CREATE PROCEDURE rule5_procedure()
BEGIN
  DECLARE j INT;
  SET j = 0;
   select count(*) into @length2 from rule5;
    WHILE j < @length2 DO
        create table if not exists rule5Table select pmID, firstName, lastName, stockSymbol, companyName, dayPercentMove from rule5 where transactionDate <= CURDATE() and transactionDate >= DATE_ADD(CURDATE(), INTERVAL -15 DAY) and dayPercentMove < -10;
        insert into rule5Table select pmID, firstName, lastName, stockSymbol, companyName, dayPercentMove from rule5 where transactionDate <= CURDATE() and transactionDate >= DATE_ADD(CURDATE(), INTERVAL -15 DAY) and dayPercentMove < -10;
        SET j = j + 1;
    END WHILE;
  select DISTINCT pmID, firstName, lastName, stockSymbol, companyName, dayPercentMove from rule5Table;
call rule5_cases();
END//
DELIMITER ;


--  Adding values to the cases table to record insider trading cases
DELIMITER //
drop procedure if exists rule5_cases;
create procedure rule5_cases()
BEGIN
  DECLARE k INT;
  SET k = 0;
  select count(*) into @length from rule5Table;
	WHILE (k < @length) DO
		insert into cases (caseDate, pmID, ruleID) values (curdate(), (select pmID from rule5Table LIMIT k,1) , 5);
        SET k = k + 1;
	END WHILE;
END//
DELIMITER ; 


-- Calling Rule 4
CALL rule5_procedure();