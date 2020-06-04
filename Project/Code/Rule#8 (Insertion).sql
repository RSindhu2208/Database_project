
INSERT into employee (empID, firstName, lastName, emprole, hireDate, officeLocation, empStatus)
values (1122468, "James", "Levy", "Business Analyst", '2018-02-18', "Boston", "CT");

INSERT into portfolioManager (pmID, empID, investmentDepartment, investmentSector, defaultExchange)
values (001213355, 1122468, "Derivates", "Automobile", "NIKKEI");

INSERT into industry (industryID, sector, numberCompetitors)
values (6, "Auto", 25);

INSERT into stock (stockSymbol, companyName, stockPrice, dayPercentMove, stockVolume, exchangeListed, outstandingShares, marketCap, industryID, PositionID, weekPercentMove)
values ("NSANY" , "Nissan Motor Co Ltd", 351.51, 2.5, 23, "NIKKEI", 45, 8475822.65, 6, 10, 7.2);

INSERT into portfolio (portfolioID, clientName, assetsUnderMgt, numberHoldings, numberTradesYear, pmID)
values (19, "Kevin O'Leary", 1000000, 27, 224, 001213355);

INSERT into transactions (transactionID, typeID, transactionDate, stockSymbol, portfolioID, pmID, sharesTransacted, stockPrice)
values (15, 1, '2018-11-20', "NSANY", 19, 001213355, 200000, 351.51);

INSERT into rule(ruleID, ruleType, probability)
values (8, "If a transaction dollar amount is more than 10% of the portfolio's size (in $), then generate a case for analysis", 0.50);