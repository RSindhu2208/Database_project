
-- Procedure: If a portfolio manager executed more than 3 trades outside his/her default exchange in the same day, then generate a case for analysis.
DELIMITER //
Drop procedure if exists rule10_procedure;
CREATE PROCEDURE rule10_procedure()
BEGIN
select t.pmID, e.firstName, e.lastName, count(s.exchangeListed) as "No. of Exchanges" 
from transactions t 
right join stock s 
on t.stockSymbol = s.stockSymbol
JOIN portfolioManager m
on t.pmID = m.pmID
JOIN employee e
on e.empID = m.empID
where s.exchangeListed != m.defaultExchange
having count(t.transactionID) >= 3;
END//
DELIMITER ;

-- calling rule 10
call rule10_procedure();