
--  Procedure: If a transaction dollar amount is more than 10% of the portfolio's size (in $), then generate a case for analysis.
DELIMITER //
DROP procedure if exists rule8_procedure;
CREATE PROCEDURE rule8_procedure()
BEGIN
select DISTINCT t.pmID, e.firstName, e.lastName, t.stockSymbol, s.companyName, t.transactionDate 
from transactions t 
join stock s 
on t.stockSymbol = s.stockSymbol
JOIN portfolioManager m
on t.pmID = m.pmID
JOIN employee e
on e.empID = m.empID
join portfolio p 
on p.portfolioID = t.portfolioID
where (t.stockPrice * t.sharesTransacted) >= ((p.assetsUnderMgt/100)*10) ;
END//
DELIMITER ;

-- Calling Rule 8
call rule8_procedure();