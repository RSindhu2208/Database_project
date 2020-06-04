
INSERT into employee (empID, firstName, lastName, emprole, hireDate, officeLocation, empStatus)
values (1122928, "Sindhu", "Raghavendra", "Research Analyst", '2014-06-24', "Boston", "CT");

INSERT into portfolioManager (pmID, empID, investmentDepartment, investmentSector, defaultExchange)
values (001234514, 1122928, "Equities", "Technology/Social Media", "NYSE");

INSERT into industry (industryID, sector, numberCompetitors)
values (3, "Social Media", 10);

INSERT into stock (stockSymbol, companyName, stockPrice, dayPercentMove, stockVolume, exchangeListed, outstandingShares, marketCap, industryID, PositionID, weekPercentMove)
values ("TWTR" , "Twitter", 31.11, 11.15, 15, "NYSE", 4, 764124.44, 3, 3, 7.34);

INSERT into portfolio (portfolioID, clientName, assetsUnderMgt, numberHoldings, numberTradesYear, pmID)
values (12, "Mark Cuban", 4642576.20, 7, 50, 001234514);

INSERT into transactions (transactionID, typeID, transactionDate, stockSymbol, portfolioID, pmID, sharesTransacted, stockPrice)
values (3, 1, '2018-11-20', "TWTR", 12, 001234514, 15000, 31.11);

INSERT into newsType (newsTypeID, typeName, criticality)
values (2, "Merger", 4);

INSERT into news (articleID, newsTypeID, summary, stockSymbol, newsDate)
values (345256, 2, "Impending Corporate Merger", "TWTR", '2018-11-26');

INSERT into rule (ruleID, ruleType, probability)
values (3, "If a BUY transaction type was executed within 15 days of a subsequent 10%-day stock price uptrend, then generate a case for analysis", 0.65);
