drop schema if exists itrap;
create schema itrap;
USE itrap;

-- Transaction-Type Table (1)
CREATE TABLE transactionType (
    typeID int(100) NOT NULL,
    transactionName VARCHAR(100) NOT NULL,
    PRIMARY KEY (typeID)
);

-- Employee Table (2)
CREATE TABLE employee (
    empID INT(100) NOT NULL,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    empRole VARCHAR(100) NOT NULL,
    hireDate DATE NOT NULL,
    officeLocation VARCHAR(100) NOT NULL,
    empStatus VARCHAR(100) NOT NULL,
    PRIMARY KEY (empID)
);

-- Portfolio Manager Table (3)
CREATE TABLE portfolioManager (
    pmID INT(100) NOT NULL,
    empID INT(100) NOT NULL,
    investmentDepartment VARCHAR(100) NOT NULL,
    investmentSector VARCHAR(100) NOT NULL,
    defaultExchange VARCHAR(100) NOT NULL,
    PRIMARY KEY (pmID),
    FOREIGN KEY (empID) REFERENCES employee (empID)
);

-- Industry Table (4)
CREATE TABLE industry (
    industryID INT(100) NOT NULL,
    sector VARCHAR(100) NOT NULL,
    numberCompetitors INT(100) NOT NULL,
    PRIMARY KEY (industryID)
);

-- Firm Postion Table (5)
CREATE TABLE firmPosition (
    positionID INT(100) NOT NULL,
    stockSymbol VARCHAR(100) NOT NULL,
    sharesOwned INT(20) NOT NULL,
    firstPurchaseDate DATE NOT NULL,
    PRIMARY KEY (positionId)
);

-- Stock Table (6)
CREATE TABLE stock (
    stockSymbol VARCHAR(100) NOT NULL,
    companyName VARCHAR(100) NOT NULL,
    stockPrice FLOAT(100,7) NOT NULL,
    dayPercentMove FLOAT(10,3) NOT NULL,
    stockVolume INT(10) NOT NULL,
    exchangeListed VARCHAR(10) NOT NULL,
    outstandingShares INT(40) NOT NULL,
    marketCap FLOAT(100,7) NOT NULL,
    industryID INT(100) NOT NULL,
    PositionID INT(100) NOT NULL,
    weekPercentMove FLOAT(10,3) NOT NULL,
    PRIMARY KEY (stockSymbol),
    FOREIGN KEY (industryID) REFERENCES industry(industryID)
);

-- Portfolio Table (7)
CREATE TABLE portfolio (
    portfolioID int(10) NOT NULL,
    clientName VARCHAR(100) NOT NULL,
    assetsUnderMgt FLOAT(100,3) NOT NULL,
    numberHoldings int(10) NOT NULL,
    numberTradesYear int(4) NOT NULL,
    pmID int(10) NOT NULL,
    PRIMARY KEY (portfolioID),
    FOREIGN KEY (pmID) REFERENCES portfolioManager(pmID) 
);

-- Transactions Table (8)
CREATE TABLE transactions (
    transactionID int(10) NOT NULL,
    typeID int(10) NOT NULL,
    transactionDate DATE NOT NULL,
    stockSymbol VARCHAR(100) NOT NULL,
    portfolioID int(10) NOT NULL,
    pmID int(10) NOT NULL,
    sharesTransacted int(255) NOT NULL,
    stockPrice FLOAT(100,7) NOT NULL,
    PRIMARY KEY (transactionID),
    FOREIGN KEY (typeID) REFERENCES transactionType(typeid),
    FOREIGN KEY (stockSymbol) REFERENCES stock(stockSymbol),
    FOREIGN KEY (portfolioID) REFERENCES portfolio(portfolioID),
    FOREIGN KEY (pmID) REFERENCES portfolioManager(pmID)
);


-- Holdings Table (10)
CREATE TABLE holding (
    stockSymbol VARCHAR(100) NOT NULL,
    portfolioID INT(10) NOT NULL,
    PRIMARY KEY (stockSymbol, portfolioID)
);


-- News Type Table (11)
CREATE TABLE newsType (
    newsTypeID INT(10) NOT NULL,
    typeName VARCHAR(100) NOT NULL,
    criticality INT(10) NOT NULL,
    PRIMARY KEY (newsTypeID)
);


-- News Table (12)
CREATE TABLE news (
    articleID INT(10) NOT NULL,
    newsTypeID INT(10) NOT NULL,
    summary VARCHAR(100) NOT NULL,
    stockSymbol VARCHAR(100) NOT NULL,
    newsDate DATE NOT NULL,
    PRIMARY KEY (articleID),
    FOREIGN KEY (newsTypeID) REFERENCES newsType(newsTypeID)
);


-- Rule Table* (13)
CREATE TABLE rule (
    ruleID INT(10) NOT NULL,
    ruleType VARCHAR(1000) NOT NULL,
    probability FLOAT(10,7),
    PRIMARY KEY (ruleID)
);


-- Resolution Table (14)
CREATE TABLE resolution (
    resolutionID INT(10) NOT NULL,
    resolutionType VARCHAR(100) NOT NULL,
    PRIMARY KEY (resolutionID)
);


-- Cases Table (15)
CREATE TABLE cases (
    caseID INT(10) NOT NULL auto_increment,
    caseDate DATE,
    pmID INT(10),
    ruleID INT(10),
    PRIMARY KEY (caseID),
    FOREIGN KEY (pmID) REFERENCES portfolioManager (pmID),
    FOREIGN KEY (ruleID) REFERENCES rule (ruleID)
);


-- Violation Table (16)
CREATE TABLE violation (
    violationID INT(10) NOT NULL,
    caseID INT(10) NOT NULL,
    complianceApproval VARCHAR(200),
    executiveApproval VARCHAR(200),
    managerApproval VARCHAR(200),
    resolutionID INT(10),
    actionTaken VARCHAR(310),
    PRIMARY KEY (violationID),
    FOREIGN  KEY (caseID) REFERENCES cases (caseID),
    FOREIGN  KEY (resolutionID) REFERENCES resolution (resolutionID)
);


-- Obervations Table (17)
CREATE TABLE observation (
    observationID INT(10) NOT NULL,
    caseID INT(10) NOT NULL,
    observationNote VARCHAR(100) NOT NULL,
    PRIMARY KEY (observationID),
    FOREIGN KEY (caseID) REFERENCES cases (caseID)
);


-- Restriction Table (18)
CREATE TABLE restriction (
    restrictionID INT(10) NOT NULL,
    stockSymbol VARCHAR(4) NOT NULL,
    pmID INT(10) NOT NULL,
    restrictionStatus VARCHAR(100) NOT NULL,
    restrictionDate DATE NOT NULL,
    restrictionLiftDate DATE NOT NULL,
    PRIMARY KEY (restrictionID),
    FOREIGN KEY (stockSymbol) REFERENCES stock (stockSymbol),
    FOREIGN KEY (pmID) REFERENCES portfolioManager (pmID)
);

-- Conflicts of Interest Table (19)
CREATE TABLE conflictsOfInterest (
    conflictID INT(10) NOT NULL,
    pmID INT(10) NOT NULL,
    stockSymbol VARCHAR(100) NOT NULL,
    firstName VARCHAR(100) NOT NULL,
    secondName VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    PRIMARY KEY (conflictID),
    FOREIGN KEY (pmID) REFERENCES portfolioManager (pmID),
    FOREIGN KEY (stockSymbol) REFERENCES stock (stockSymbol)
);

-- Material Disclosure Table (20)
CREATE TABLE MaterialDisclosure (
    disclosureID INT(10) NOT NULL,
    pmID INT(10) NOT NULL,
    stockSymbol VARCHAR(100) NOT NULL,
    dateDisclosed DATE NOT NULL,
    meetingDate DATE NOT NULL,
    details VARCHAR(50),
    PRIMARY KEY (disclosureID),
    FOREIGN KEY (stockSymbol) REFERENCES stock (stockSymbol),
    FOREIGN KEY (pmID) REFERENCES portfolioManager (pmID)         
);

-- Cases Backup Table(15)
CREATE TABLE casesBackup (
    caseID INT(10) NOT NULL auto_increment,
    caseDate DATE,
    pmID INT(10),
    ruleID INT(10),
    PRIMARY KEY (caseID)
);

