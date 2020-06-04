-- creating a view joining stock, employee, portfolio manager and transctions table to get the potential insider trader
create view rule2 as 
select t.pmID, e.firstName, e.lastName, t.stockSymbol, s.companyName, t.transactionDate 
from transactions t 
join stock s 
on t.stockSymbol = s.stockSymbol
JOIN portfolioManager m
on t.pmID = m.pmID
JOIN employee e
on e.empID = m.empID
where t.transactionDate <= CURDATE() and t.transactionDate >= date_add(CURDATE(), INTERVAL -15 DAY);


-- Returns the dates from the news table which are 15 days before the date of the a major corporate announcement
CREATE VIEW minusFifteenDatesTable_Rule2 as 
select date_add(n.newsDate, INTERVAL -15 DAY) from news n join newsType t 
on n.newsTypeID = t.newsTypeID 
where t.criticality > 5;


-- Returns the dates from the news table before a major corporate announcement
CREATE VIEW newsDatesTable2 as select n.newsDate from news n join newsType t 
on n.newsTypeID = t.newsTypeID 
where t.criticality > 5;


-- PROCEDURE: If any transaction type was executed within 15 days of a major corporate announcement, then generate a case for analysis.
DELIMITER //
drop procedure if exists rule2_procedure;
DROP Table if exists rule2Table;
CREATE PROCEDURE rule2_procedure()
BEGIN
  DECLARE i INT;
  DECLARE j INT;
  SET i = 0;
  SET j = 0;
   select count(*) into @length1 from newsDatesTable2;
   select count(*) into @length2 from rule2;
  WHILE i < @length1 DO
    select * into @date1 from newsDatesTable2 LIMIT i,1;
    select * into @date2 from minusFifteenDatesTable_Rule2 LIMIT i,1;
    WHILE j < @length2 DO
        create table if not exists rule2Table select pmID, firstName, lastName, stockSymbol, companyName from rule2 where transactionDate <= @date1 and transactionDate >= @date2;
        Insert into rule2Table select pmID, firstName, lastName, stockSymbol, companyName from rule2 where transactionDate <= @date1 and transactionDate >= @date2;
        SET j = j + 1;
    END WHILE;
    SET i = i + 1;
  END WHILE;
  select distinct pmID, firstName, lastName, stockSymbol, companyName from rule2Table;
call rule2_cases();
END//
DELIMITER ;


--  Adding values to the cases table to record insider trading cases
DELIMITER //
drop procedure if exists rule2_cases;
create procedure rule2_cases()
BEGIN
  DECLARE k INT;
  SET k = 0;
  select count(*) into @length from rule2Table;
	WHILE (k < @length) DO
		insert into cases (caseDate, pmID, ruleID) values (curdate(), (select pmID from rule2Table LIMIT k,1) , 2);
        SET k = k + 1;
	END WHILE;
END//
DELIMITER ; 


-- Calling Rule 2
call rule2_procedure();