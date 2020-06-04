
INSERT into employee (empID, firstName, lastName, emprole, hireDate, officeLocation, empStatus)
values (1122989, "Sarah", "Joseph", "Project Manager-BizOps", '2008-03-30', "Boston", "FT");

INSERT into portfolioManager (pmID, empID, investmentDepartment, investmentSector, defaultExchange)
values (001276584, 1122989, "Derivates", "Retail", "NIKKEI");

INSERT into industry (industryID, sector, numberCompetitors)
values (5, "Retail", 55);

INSERT into stock (stockSymbol, companyName, stockPrice, dayPercentMove, stockVolume, exchangeListed, outstandingShares, marketCap, industryID, PositionID, weekPercentMove)
values ("CANON" , "Canon", 301.11, 4.2, 16, "NIKKEI", 32, 3857373.27, 5, 9, -2.2);

INSERT into portfolio (portfolioID, clientName, assetsUnderMgt, numberHoldings, numberTradesYear, pmID)
values (13, "Berkshire Hathaway", 97342625.23, 135, 975, 001276584);

INSERT into transactions (transactionID, typeID, transactionDate, stockSymbol, portfolioID, pmID, sharesTransacted, stockPrice)
values (9, 2, '2018-11-20', "CANON", 13, 001276584, 10000, 301.11),
(10, 2, '2018-10-15', "CANON", 13, 001276584, 10000, 301.11),
(11, 2, '2018-10-16', "CANON", 13, 001276584, 10000, 301.11),
(12, 2, '2018-10-17', "CANON", 13, 001276584, 15000, 301.11),
(13, 2, '2018-10-18', "CANON", 13, 001276584, 15000, 301.11),
(14, 2, '2018-10-19', "CANON", 13, 001276584, 15000, 301.11);

INSERT into rule(ruleID, ruleType, probability)
values (7, "If more than 5 separate transactions of the same stock and of a particular type were executed within a single portfolio and within a 7-day timeframe, then generate a case for analysis", 0.50);