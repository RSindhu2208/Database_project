USE itrap;

-- creating a view joining stock, employee, portfolio manager and transctions table to get the potential insider trader
create view rule1 as 
select t.pmID, e.firstName, e.lastName, t.stockSymbol, s.companyName, t.transactionDate 
from transactions t 
join stock s 
on t.stockSymbol = s.stockSymbol
JOIN portfolioManager m
on t.pmID = m.pmID
JOIN employee e
on e.empID = m.empID
where t.transactionDate <= CURDATE() and t.transactionDate >= date_add(CURDATE(), INTERVAL -15 DAY);

-- Returns the dates from the news table which are 15 days before the date of the news type merger or acquisition
CREATE VIEW minusFifteenDatesTable_Rule1 as 
select date_add(n.newsDate, INTERVAL -15 DAY) from news n join newsType t 
on n.newsTypeID = t.newsTypeID 
where t.typeName  = "merger" OR t.typeName = "acquisition";


-- Returns the dates from the news table of the news type merger or acquisition
CREATE VIEW newsDatesTable as 
select n.newsDate from news n join newsType t 
on n.newsTypeID = t.newsTypeID 
where t.typeName  = "merger" OR t.typeName = "acquisition";


-- PRODCEDURE: If any transaction type was executed within 15 days of a company merger or acquisition (M&A) announcement, then generate a case for analysis.
DELIMITER //
drop procedure if exists rule1_procedure;
DROP Table if exists rule1Table;
CREATE PROCEDURE rule1_procedure()
BEGIN
  DECLARE i INT;
  DECLARE j INT;
  SET i = 0;
  SET j = 0;
  select count(*) into @length1 from newsDatesTable;
  select count(*) into  @length2 from rule1;
   WHILE (i < @length1) DO
    select * into @date1 from newsDatesTable LIMIT i,1;
    select * into @date2 from minusFifteenDatesTable_Rule1 LIMIT i,1;
	WHILE (j < @length2) DO
            create table if not exists rule1Table select pmID, firstName, lastName, stockSymbol, companyName from rule1 where transactionDate <= @date1 and transactionDate >= @date2;
			insert into rule1Table select pmID, firstName, lastName, stockSymbol, companyName from rule1 where transactionDate <= @date1 and transactionDate >= @date2;
			SET j = j + 1;
		END WHILE;
		SET i = i + 1;
    END WHILE;
select distinct pmID, firstName, lastName, stockSymbol, companyName from rule1Table;
call rule1_cases();
END//
DELIMITER ;

--  Adding values to the cases table to record insider trading cases
DELIMITER //
drop procedure if exists rule1_cases;
create procedure rule1_cases()
BEGIN
  DECLARE k INT;
  SET k = 0;
  select count(*) into @length from rule1Table;
	WHILE (k < @length) DO
		insert into cases (caseDate, pmID, ruleID) values (curdate(), (select pmID from rule1Table LIMIT k,1) , 1);
        SET k = k + 1;
	END WHILE;
END//
DELIMITER ; 


-- Calling Rule 1 
call rule1_procedure();
