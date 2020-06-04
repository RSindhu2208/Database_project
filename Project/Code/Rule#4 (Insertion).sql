
INSERT into employee (empID, firstName, lastName, emprole, hireDate, officeLocation, empStatus)
values (1122478, "Faris", "Sumadi", "Business Intelligence Analyst", '2011-10-04', "Las Vegas", "CT");

INSERT into portfolioManager (pmID, empID, investmentDepartment, investmentSector, defaultExchange)
values (001233445, 1122478, "Fixed Income", "Technology/Gaming", "NASDAQ");

INSERT into industry (industryID, sector, numberCompetitors)
values (4, "Gaming", 14);

INSERT into stock (stockSymbol, companyName, stockPrice, dayPercentMove, stockVolume, exchangeListed, outstandingShares, marketCap, industryID, PositionID, weekPercentMove)
values ("ATVI" , "Activision Blizzard", 120.10, 9.1, 12, "NASDAQ", 40, 234550.24, 4, 4, 21.5);

INSERT into portfolio (portfolioID, clientName, assetsUnderMgt, numberHoldings, numberTradesYear, pmID)
values (34, "MFS Investment Management", 1237896.67, 21, 23, 001233445);

INSERT into transactions (transactionID, typeID, transactionDate, stockSymbol, portfolioID, pmID, sharesTransacted, stockPrice)
values (4, 1, '2018-11-20', "ATVI", 34, 001233445, 25000, 120.10);

INSERT into news (articleID, newsTypeID, summary, stockSymbol, newsDate)
values (457346, 3, "Increase in position of ATVI", "ATVI", '2018-11-25');

INSERT into rule(ruleID, ruleType, probability)
values (4, "If a BUY transaction type was executed within 15 days of a subsequent 20% stock price move upward over 7-days, then generate a case for analysis", 0.70);