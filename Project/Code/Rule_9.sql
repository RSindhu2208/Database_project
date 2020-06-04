
-- Procedure: If a portfolio manager transacted outside his/her's investment specialty twice in the same day, then generate a case for analysis.
DELIMITER //
DROP procedure if exists rule9_procedure;
CREATE PROCEDURE rule9_procedure()
BEGIN
select t.pmID, e.firstName, e.lastName, count(m.investmentSector) as "No. of Sectors" 
from transactions t 
join stock s 
on t.stockSymbol = s.stockSymbol
JOIN portfolioManager m
on t.pmID = m.pmID
JOIN employee e
on e.empID = m.empID
join industry i 
on i.industryID = s.industryID
where m.investmentSector != i.sector
having count(t.transactionID) >= 2 and count(i.sector) >= 2;
END//
DELIMITER ;

-- Calling Rule 9
call rule9_procedure();


select * from transactions;