--DROP DB IF EXISTS
DROP DATABASE IF EXISTS JobPortal;

--CREATE DB IF NOT EXISTS
CREATE DATABASE IF NOT EXISTS JobPortal;

--USE JobPortal DATABASE
USE JobPortal;

CREATE TABLE Jobs (
 JobID INT NOT NULL AUTO_INCREMENT,
 JobLocation VARCHAR(100) NOT NULL,
 JobType VARCHAR(4) NOT NULL,
 JobPosition VARCHAR(50) NOT NULL,
 Salary NUMERIC(8) CHECK (Salary > 0),
 JobDescription VARCHAR(500) NOT NULL,
 Duty VARCHAR(500),
 Qualification VARCHAR(500),
 Benefits VARCHAR(500),
 CompanyName VARCHAR(200) NOT NULL,
 CreatedOn DATE DEFAULT NULL,
 PRIMARY KEY ( JobID )
) ENGINE=InnoDB;

CREATE TABLE Users (
  UserID INT NOT NULL AUTO_INCREMENT,
  Fname VARCHAR(50) NOT NULL,
  Lname VARCHAR(50) DEFAULT NULL,
  Email VARCHAR(50) NOT NULL UNIQUE,
  Phone VARCHAR(20) NOT NULL,
  Password VARCHAR(50) NOT NULL,
  Role CHAR(6) NOT NULL,
  Agreement TINYINT(1) NOT NULL,
  PRIMARY KEY ( UserID )
) ENGINE=InnoDB;

CREATE TABLE Job_Applied  (
 AppliedID INT NOT NULL AUTO_INCREMENT,
 UserID  INT NOT NULL,
 JobID  INT NOT NULL,
 DesiredPay  VARCHAR(20) DEFAULT NULL,
 AdditionalUrls  VARCHAR(50) DEFAULT NULL,
 Comments  VARCHAR(500) DEFAULT NULL,
 Resume  longblob DEFAULT NULL,
 AppliedOn DATE DEFAULT NULL,
 PRIMARY KEY ( AppliedID ),
 KEY  UserID  ( UserID ),
 KEY  JobID  ( JobID ),
 CONSTRAINT  job_applied_ibfk_1  FOREIGN KEY ( UserID ) REFERENCES  users  ( UserID ) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT  job_applied_ibfk_2  FOREIGN KEY ( JobID ) REFERENCES  jobs  ( JobID ) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;