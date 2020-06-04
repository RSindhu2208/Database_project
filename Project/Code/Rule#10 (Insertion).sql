
INSERT into employee (empID, firstName, lastName, emprole, hireDate, officeLocation, empStatus)
values (1122862, "Sandra", "Philips", "Portfolio Manager", '2006-10-03', "New York", "FT");

INSERT into portfolioManager (pmID, empID, investmentDepartment, investmentSector, defaultExchange)
values (001215536, 1122862, "Equities", "Technology/Social Media", "NSE");

INSERT into stock (stockSymbol, companyName, stockPrice, dayPercentMove, stockVolume, exchangeListed, outstandingShares, marketCap, industryID, PositionID, weekPercentMove)
values ("FB" , "Facebook", 145.50, 7.5, 20, "NYSE", 13, 97465298.24, 3, 12, 4.89),
("SNAP", "Snapchat", 9.9, 3.85, 200, "NYSE", 29, 972638.10, 3, 13, 1.2);

INSERT into portfolio (portfolioID, clientName, assetsUnderMgt, numberHoldings, numberTradesYear, pmID)
values (30, "Bezos Foundation", 8979222.22, 98, 323, 001215536);

INSERT into transactions (transactionID, typeID, transactionDate, stockSymbol, portfolioID, pmID, sharesTransacted, stockPrice)
values (18, 1, '2018-11-20', "FB", 30, 001215536, 4100, 145.50),
(19, 1, '2018-11-20', "FB", 30, 001215536, 4100, 145.50),
(20, 1, '2018-11-20', "SNAP", 30, 001215536, 4500, 9.9),
(21, 1, '2018-11-20', "SNAP", 30, 001215536, 4500, 9.9);

INSERT into rule(ruleID, ruleType, probability)
values (10, "if a portfolio manager executed more than 3 trades outside his/her default exchange, then generate a case for analysis", 0.50);