use itrap;

INSERT into transactionType (typeID, transactionName)
values (1, "BUY");

INSERT into employee (empID, firstName, lastName, emprole, hireDate, officeLocation, empStatus)
values (1122579, "Ashwin", "Madhusudan", "Compliance Analyst", '2012-04-05', "Boston", "FT");

INSERT into portfolioManager (pmID, empID, investmentDepartment, investmentSector, defaultExchange)
values (001235009, 1122579, "Fixed Income", "Information Technology", "NYSE");

INSERT into industry (industryID, sector, numberCompetitors)
values (1, "Finance", 10);

INSERT into stock (stockSymbol, companyName, stockPrice, dayPercentMove, stockVolume, exchangeListed, outstandingShares, marketCap, industryID, PositionID, weekPercentMove)
values ("XYZ" , "Charles River Systems", 100.10, 10.1, 10, "NYSE", 2, 200.20, 1, 1, 3);

INSERT into portfolio (portfolioID, clientName, assetsUnderMgt, numberHoldings, numberTradesYear, pmID)
values (25, "Massachusetts Institute of Technology", 123456.67, 3, 3, 001235009);

INSERT into transactions (transactionID, typeID, transactionDate, stockSymbol, portfolioID, pmID, sharesTransacted, stockPrice)
values (1, 1, '2018-11-20', "XYZ", 25, 001235009, 10000, 100.10);

INSERT into newsType (newsTypeID, typeName, criticality)
values (1, "Acquisition", 5);

INSERT into news (articleID, newsTypeID, summary, stockSymbol, newsDate)
values (453810, 1, "Acquisition of WMD", "XYZ", '2018-11-23');

INSERT into rule (ruleID, ruleType, probability)
values (1, "If any transaction type was executed within 15 days of a company merger or acquisition (M&A) announcement, then generate a case for analysis.", 0.90);


select * from transactions;

	

