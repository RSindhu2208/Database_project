
-- Creating DataBase Analyst User
CREATE USER 'databaseAnalyst'@'localhost' IDENTIFIED BY 'da';
GRANT ALL ON itrap.* TO 'databaseAnalyst'@'localhost';

-- Create Compliance Analyst User
CREATE USER 'complainceAnalyst'@'localhost' IDENTIFIED BY 'ca';
GRANT SELECT, UPDATE, DELETE, INSERT ON itrap.* TO 'complainceAnalyst'@'localhost';

-- Create Compliance Manager User
CREATE USER 'complainceManager'@'localhost' IDENTIFIED BY 'cm';
GRANT SELECT, UPDATE, DELETE, INSERT ON itrap.* TO 'complainceManager'@'localhost';

-- Create Chief Regulatory Officer User
CREATE USER 'chiefRegulatoryManager'@'localhost' IDENTIFIED BY 'crm';
GRANT SELECT ON itrap.* TO 'chiefRegulatoryManager'@'localhost';

-- Create External Compliance Analyst User
CREATE USER 'externalComplianceAnalyst'@'localhost' IDENTIFIED BY 'sakila';
GRANT SELECT, INSERT on itrap.observation TO 'externalComplianceAnalyst'@'localhost';

