
INSERT into transactionType (typeID, transactionName)
values (3, "SHORT");
 
INSERT into employee (empID, firstName, lastName, emprole, hireDate, officeLocation, empStatus)
values (1122758, "Jacob", "Sequiera", "Data Analyst", '2013-09-23', "Boston", "FT"),
(1122687, "Daniel", "Joseph", "Compliance Analyst", '2010-05-02', "Las Vegas", "CT");
 
INSERT into portfolioManager (pmID, empID, investmentDepartment, investmentSector, defaultExchange)
values (001236997, 1122758, "Equities", "Healthcare", "NYSE"),
(001238098, 1122687, "Equities", "Healthcare", "NYSE");
 
INSERT into stock (stockSymbol, companyName, stockPrice, dayPercentMove, stockVolume, exchangeListed, outstandingShares, marketCap, industryID, PositionID, weekPercentMove)
values ("VRTX" , "Vertex Pharmaceuticals", 356.43, -12.1, 12, "NYSE", 5, 5054560.36, 2, 5, 4.5),
("GILD", "Gilead Sciences", 74.56, -11.4, 34, "NYSE", 76, 345356.24, 2, 6, 3.3);

INSERT into portfolio (portfolioID, clientName, assetsUnderMgt, numberHoldings, numberTradesYear, pmID)
values (23, "BlackRock Capital", 1232396.67, 9, 54, 001236997),
(67, "Ventura Capital", 3534734.45, 45, 56, 001238098);
 
INSERT into transactions (transactionID, typeID, transactionDate, stockSymbol, portfolioID, pmID, sharesTransacted, stockPrice)
values (5, 3, '2018-11-20', "VRTX", 23, 001236997, 30000, 356.43),
(6, 2, '2018-11-20', "GILD", 67, 001238098, 20800, 74.56);
 
INSERT into news (articleID, newsTypeID, summary, stockSymbol, newsDate)
values (345346, 3, "Decrease in position of VRTX", "VRTX", '2018-11-27'),
(238583, 3, "Massive Sell-off", "GILD", '2018-11-27');
 
INSERT into rule(ruleID, ruleType, probability)
values (5, "If a SHORT or SELL transaction type was executed within 15 days of a subsequent 10%-day stock price downtrend, then generate a case for analysis", 0.75);