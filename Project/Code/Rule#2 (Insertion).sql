
INSERT into transactionType (typeID, transactionName)
values (2, "SELL");

INSERT into employee (empID, firstName, lastName, emprole, hireDate, officeLocation, empStatus)
values (1122357, " Anoop", "Joseph", "Business Analyst", '2013-05-04', "Boston", "FT");

INSERT into portfolioManager (pmID, empID, investmentDepartment, investmentSector, defaultExchange)
values (001235869, 1122357, "Fixed Income", "Healthcare", "NASDAQ");

INSERT into industry (industryID, sector, numberCompetitors)
values (2, "Biotechnology", 10);

INSERT into stock (stockSymbol, companyName, stockPrice, dayPercentMove, stockVolume, exchangeListed, outstandingShares, marketCap, industryID, PositionID, weekPercentMove)
values ("ABMD" , "Abiomed", 299.41, -0.73, 20, "NASDAQ", 5, 684697.05, 2, 2, -5.26);

INSERT into portfolio (portfolioID, clientName, assetsUnderMgt, numberHoldings, numberTradesYear, pmID)
values (10, "Kevin O'Leary", 344556.32, 5, 6, 001235869);

INSERT into transactions (transactionID, typeID, transactionDate, stockSymbol, portfolioID, pmID, sharesTransacted, stockPrice)
values (2, 2, '2018-11-20', "ABMD", 10, 001235869, 20000, 299.41);

INSERT into newsType (newsTypeID, typeName, criticality)
values (3, "Major Announcement", 6);

INSERT into news (articleID, newsTypeID, summary, stockSymbol, newsDate)
values (356434, 3, "Major Sell-off", "ABMD", '2018-11-24');

INSERT into rule (ruleID, ruleType, probability)
values (2, "If any transaction type was executed within 15 days of a major corporate announcement, then generate a case for analysis", 0.90);
