 
INSERT into employee (empID, firstName, lastName, emprole, hireDate, officeLocation, empStatus)
values (1122696, "Mark", "Batista", "Credit Derivatives Analyst", '2009-10-11', "New York", "FT"),
(1122369, "Yuzhe", "Li", "Database Developer", '2012-07-20', "New York", "CT");
 
INSERT into portfolioManager (pmID, empID, investmentDepartment, investmentSector, defaultExchange)
values (001225950, 1122696, "Equities", "Finance", "NSE"),
(001247965, 1122369, "Equities", "Finance", "NSE");
 
INSERT into stock (stockSymbol, companyName, stockPrice, dayPercentMove, stockVolume, exchangeListed, outstandingShares, marketCap, industryID, PositionID, weekPercentMove)
values ("RELIANCE" , "Reliance Industries Ltd", 1109.75, -3.1, 35, "NSE", 18, 3452453.65, 1, 7, -22.5),
("ICICIBANK", "ICICI Bank Pvt Ltd", 356.49, -1.4, 45, "NSE", 24, 5357677.98, 1, 8, -23.3);

INSERT into portfolio (portfolioID, clientName, assetsUnderMgt, numberHoldings, numberTradesYear, pmID)
values (69, "Fidelity Investments", 76462844.45, 21, 434, 001225950),
(74, "Vanguard Capital", 20475395.22, 48, 232, 001247965);
 
INSERT into transactions (transactionID, typeID, transactionDate, stockSymbol, portfolioID, pmID, sharesTransacted, stockPrice)
values (7, 3, '2018-11-20', "RELIANCE", 69, 001225950, 35000, 1109.75),
(8, 2, '2018-11-20', "ICICIBANK", 74, 001247965, 50000, 356.49);
 
INSERT into news (articleID, newsTypeID, summary, stockSymbol, newsDate)
values (838585, 2, "Questionable merger by Reliance Industries", "RELIANCE", '2018-12-01'),
(909848, 3, "ICICI Bank cuts workforce in half", "ICICIBANK", '2018-12-02');
 
INSERT into rule(ruleID, ruleType, probability)
values (6, "If a SHORT or SELL transaction type was executed within 15 days of a subsequent 20% stock price move downward over 7-days, then generate a case for analysis", 0.60);