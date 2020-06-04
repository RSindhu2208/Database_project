
INSERT into employee (empID, firstName, lastName, emprole, hireDate, officeLocation, empStatus)
values (1122344, "Ahmed", "Habtoor", "Portfolio Manager", '2013-08-24', "Connecticut", "FT");

INSERT into portfolioManager (pmID, empID, investmentDepartment, investmentSector, defaultExchange)
values (001256789, 1122344, "Fixed Income", "Retail", "ASX");

INSERT into industry (industryID, sector, numberCompetitors)
values (7, "Energy", 45);

INSERT into stock (stockSymbol, companyName, stockPrice, dayPercentMove, stockVolume, exchangeListed, outstandingShares, marketCap, industryID, PositionID, weekPercentMove)
values ("AJQ" , "Armour Energy Limited", 220.10, 6.5, 16, "ASX", 25, 387465.14, 7, 11, 1.5);

INSERT into portfolio (portfolioID, clientName, assetsUnderMgt, numberHoldings, numberTradesYear, pmID)
values (43, "American Capital", 782342.69, 234, 456, 001256789);

INSERT into transactions (transactionID, typeID, transactionDate, stockSymbol, portfolioID, pmID, sharesTransacted, stockPrice)
values (16, 3, '2018-11-20', "AJQ", 43, 001256789, 5000, 220.10),
(17, 3, '2018-11-20', "AJQ", 43, 001256789, 5000, 220.10);

INSERT into rule(ruleID, ruleType, probability)
values (9, "If a portfolio manager transacted outside his/her's investment specialty twice in the same day, then generate a case for analysis", 0.50);