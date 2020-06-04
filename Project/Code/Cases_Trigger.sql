DELIMITER //
DROP TRIGGER if exists cases_backup;
CREATE TRIGGER cases_backup
AFTER INSERT
ON cases FOR EACH ROW
BEGIN
	INSERT INTO casesBackup 
	(CaseID, CaseDate, pmID, ruleID)
    VALUES (New.CaseID, New.CaseDate, New.pmID, New.ruleID);
END//
DELIMITER ;

USE itrap;

DELIMITER //
DROP TRIGGER if exists cases_backup;
CREATE EVENT IF NOT EXISTS `cases_backup_event`
ON SCHEDULE
  EVERY 20 DAY_HOUR   -- Everyday at 8 pm
  COMMENT 'Cases table Back-up'
  DO
	CREATE TRIGGER cases_backup
	AFTER INSERT
	ON cases FOR EACH ROW
	BEGIN
		INSERT INTO casesBackup 
		(CaseID, CaseDate, pmID, ruleID)
		VALUES (New.CaseID, New.CaseDate, New.pmID, New.ruleID);
	END//
DELIMITER ;
