--DROP DATABASE IF EXISTS db;  //Do NOT DO THIS THE CODE COMMENTED TO LEFT UNLESS WANT TO DELETE ALL TABLES IN DB!
 
-- create database db
CREATE DATABASE IF NOT EXISTS db;
 
-- use newly create database
USE db;
 
-- create user table in db
CREATE TABLE if not exists `db`.`User`(
   `email` VARCHAR(255) NOT NULL UNIQUE,
   `name` VARCHAR(255),
   `dob` DATE,
   `password` VARCHAR(255) NOT NULL,
   `company` VARCHAR(255),
   `phone_number` VARCHAR(15),
   `role` VARCHAR(45),
   `location` VARCHAR(50),
   `zip_code` VARCHAR (10),
   `ip_address` VARCHAR(50) UNIQUE,
   `tagged_user` BOOLEAN,
   `is_host` BOOLEAN,
   `User_ID` int DEFAULT NULL, 
   PRIMARY KEY (`email`)
);

LOAD DATA INFILE 'Users.csv' 
INTO TABLE User
FIELDS TERMINATED BY ',';

CREATE TABLE `db`.`Event`(
   `Event_id` INT NOT NULL AUTO_INCREMENT,
   `Event_name` VARCHAR(255) NOT NULL,
   `Event_description` TEXT,
   `Host_email` VARCHAR(255) NOT NULL,
   `Start Date` DATE NOT NULL,
   `End Date` DATE  NOT NULL,
   `Start_Time` TIME NOT NULL,
   `End_Time` TIME NOT NULL,
   `Event_Location_Name` VARCHAR(255),
   `Event_Location_Address` VARCHAR(255),
   `Ticket_Cost` Decimal(10, 2),
	PRIMARY KEY (`event_id`)
);

 
CREATE TABLE if not exists `db`.`Ticket`(
	`Ticket_ID` BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
	`User_Email` VARCHAR(255) NOT NULL,
	`Event_ID` BIGINT NOT NULL,
   PRIMARY KEY (`Ticket_ID`)
);

CREATE TABLE if not exists `db`.`Report`(
	`Report_ID` BIGINT UNIQUE,
	`Report_Type` CHAR(25),
	`Report_Date` DATE,
	`Report_Reason` VARCHAR(255),
	`Sent_To` VARCHAR(255),
	`Report_Addressed` BOOLEAN,
	`Entity_Reported_ID` BIGINT,
   PRIMARY KEY (`Report_ID`)
);
CREATE TABLE if not exists `db`. `BannedIPs_Superlist`(
   `IP_Address` varchar(50) UNIQUE,
   `Report_ID` BIGINT,
   PRIMARY KEY (`IP_Address`)
);
 
CREATE TABLE if not exists `db`. `Business`(
   `Business_ID` BIGINT UNIQUE,
   `Business_Name` VARCHAR(255),
   `Business_Location` VARCHAR(255),
   `Email` VARCHAR(255),
   `Phone_Number` VARCHAR(255),
   `Rating` VARCHAR(5),
   PRIMARY KEY (`Business_ID`)
);

CREATE TABLE if not exists `db`. `Event_Request`(
	`Request_ID`  BIGINT UNIQUE,
	`Business_ID` BIGINT,
	`Host_ID` BIGINT,
	`Description` TEXT,
   PRIMARY KEY (`Request_ID`)
);
