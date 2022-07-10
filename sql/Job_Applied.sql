--DROP DB IF EXISTS
DROP DATABASE IF EXISTS JobPortal;

--CREATE DB IF NOT EXISTS
CREATE DATABASE IF NOT EXISTS JobPortal;

--USE JobPortal DATABASE
USE JobPortal;

CREATE TABLE  Job_Applied  (
 AppliedID INT NOT NULL AUTO_INCREMENT,
 UserID  INT NOT NULL,
 JobID  INT NOT NULL,
 DesiredPay  VARCHAR(20) DEFAULT NULL,
 AdditionalUrls  VARCHAR(50) DEFAULT NULL,
 Comments  VARCHAR(500) DEFAULT NULL,
 Resume  longblob DEFAULT NULL,
 AppliedOn DATE DEFAULT NULL,
 PRIMARY KEY ( UserID, JobID, AppliedID ),
 KEY  UserID  ( UserID ),
 KEY  JobID  ( JobID ),
 CONSTRAINT  job_applied_ibfk_1  FOREIGN KEY ( UserID ) REFERENCES  users  ( UserID ) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT  job_applied_ibfk_2  FOREIGN KEY ( JobID ) REFERENCES  jobs  ( JobID ) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB
