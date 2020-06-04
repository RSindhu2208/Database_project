-- creating a view joining stock, employee, portfolio manager and transctions table to get the potential insider transaction types
create view rule7 as 
select t1.pmID, e.firstName, e.lastName, t1.transactionDate, t1.portfolioID, count(t1.transactionID) as "No. of Transactions", s.StockSymbol 
from transactions t1 
join stock s 
on t1.stockSymbol = s.stockSymbol
JOIN portfolioManager m
on t1.pmID = m.pmID
JOIN employee e
on e.empID = m.empID
JOIN transactionType t2
on t2.typeID = t1.typeID
group by t1.pmID
having count(t1.transactionID) > 5;

drop view rule7;
select * from rule7;

-- PROCEDURE: If more than 5 separate transactions of any type were executed within a single portfolio within a 7-day timeframe, then generate a case for analysis.
DELIMITER //
DROP procedure if exists rule7_procedure;
CREATE PROCEDURE rule7_procedure()
BEGIN
DECLARE i INT;
  SET i = 0;
   select count(*) into @length1 from rule7;
   WHILE (i < @length1) DO
        select transactionDate into @date1 from rule4 LIMIT i,1;
        select date_add(transactionDate, INTERVAL 7 DAY) into @date2 from rule4 LIMIT i,1;

        select pmID, firstName, lastName,  count(transactionID) as "No. of Transactions", stockSymbol from rule7 
            where transactionDate >= @date1 and transactionDate <= @date2
            group by pmID
            having count(transactionID) > 5;
    SET i = i + 1;
    END WHILE;
END//
DELIMITER ;

-- Calling Rule_7
call rule7_procedure();