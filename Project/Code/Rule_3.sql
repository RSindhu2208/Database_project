-- creating a view joining stock, employee, portfolio manager and transctions table to get the potential insider trader for a "Buy" transaction
create view rule3 as 
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
WHERE t2.transactionName = "Buy"
AND t1.transactionDate <= CURDATE() and t1.transactionDate >= date_add(CURDATE(), INTERVAL -15 DAY);


-- PROCEDURE: If a "buy" transaction type was executed within 15 days of a subsequent 10%-day stock price move upward, then generate a case for analysis
DELIMITER //
DROP procedure if exists rule3_procedure;
DROP Table if exists rule3Table;
CREATE PROCEDURE rule3_procedure()
BEGIN
	DECLARE j INT;
	SET j = 0;
	select count(*) into @length1 from rule3;
	WHILE (j < @length1) DO
        create table if not exists rule3Table select pmID, firstName, lastName, stockSymbol, companyName, dayPercentMove from rule3 where transactionDate <= CURDATE() and transactionDate >= DATE_ADD(CURDATE(), INTERVAL -15 DAY) and dayPercentMove > 10;
        insert into rule3Table select pmID, firstName, lastName, stockSymbol, companyName, dayPercentMove from rule3 where transactionDate <= CURDATE() and transactionDate >= DATE_ADD(CURDATE(), INTERVAL -15 DAY) and dayPercentMove > 10;
        SET j = j + 1;
    END WHILE;
select DISTINCT pmID, firstName, lastName, stockSymbol, companyName, dayPercentMove from rule3Table;
call rule3_cases();
END//
DELIMITER ;


--  Adding values to the cases table to record insider trading cases
DELIMITER //
drop procedure if exists rule3_cases;
create procedure rule3_cases()
BEGIN
  DECLARE k INT;
  SET k = 0;
  select count(*) into @length from rule3Table;
	WHILE (k < @length) DO
		insert into cases (caseDate, pmID, ruleID) values (curdate(), (select pmID from rule3Table LIMIT k,1) , 3);
        SET k = k + 1;
	END WHILE;
END//
DELIMITER ; 


-- Calling Rule 3
CALL rule3_procedure();