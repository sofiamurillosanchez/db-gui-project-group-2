DROP DATABASE IF EXISTS db;
 
-- create database db
CREATE DATABASE IF NOT EXISTS db;
 
-- use newly create database
USE db;
 
-- create user table in db
CREATE TABLE `db`.`User` (
   `email` VARCHAR(255),
   `name` VARCHAR(255),
   `dob` DATE,
   `password` VARCHAR(255),
   `company` VARCHAR(255),
   `phone_number` VARCHAR(15),
   `role` VARCHAR(45),
   `location` VARCHAR(50),
   `zip_code` VARCHAR (10),
   `ip_address` VARCHAR(50),
   `tagged_user` BOOLEAN,
   `is_host` BOOLEAN,
 
   PRIMARY KEY (`email`)
);
 
LOAD DATA INFILE 'Example_Users_Data.txt' 
INTO TABLE User
FIELDS TERMINATED BY ',';

CREATE TABLE `db`.`Event`(
   `Event_id` INT NOT NULL AUTO_INCREMENT,
   `Event_name` VARCHAR(255),
   `Event_description` TEXT,
   `Event_Image` BLOB,
   `Host_Name` VARCHAR(255),
   `Host Contact Information` VARCHAR(255),
   `Host User ID` BIGINT,
   `Start Date` DATE,
   `End Date` DATE,
   `Start Time` TIME,
   `End Time` TIME,
   `Num_Expected_Attendees` TIME,
   `Max_Capacity` TIME,
   `Event_Location_Name` VARCHAR(255),
   `Event_Location_Address` VARCHAR(255),
   `Dress_Code` VARCHAR(255),
   `Ticket_Cost` Decimal(10, 2),
   `Minimum_Age_Requirement` INT, 
   `Event_Type` VARCHAR(255),
   `Event_Category` VARCHAR(255),
   `Event_Activities` VARCHAR(255),
   `Status`  CHAR(25),
	PRIMARY KEY (`event_id`)
);
 
CREATE TABLE `db`.`Ticket`(
	`Ticket_ID` BIGINT,
	`User_ID` BIGINT,
	`Event_ID` BIGINT
 
);
CREATE TABLE `db`.`Report`(
	`Report_ID` BIGINT,
	`Report_Type` CHAR(25),
	`Report_Date` DATE,
	`Report_Reason` VARCHAR(255),
	`Sent_To` VARCHAR(255),
	`Report_Addressed` BOOLEAN,
	`Entity_Reported_ID` BIGINT
);
CREATE TABLE `db`. `BannedIPs_Superlist`(
   `IP_Address` NUMERIC,
   `Report_ID` BIGINT
);
 
CREATE TABLE `db`. `Business`(
   `Business_ID` BIGINT,
   `Business_Name` VARCHAR(255),
   `Business_Location` VARCHAR(255),
   `Email` VARCHAR(255),
   `Phone_Number` VARCHAR(255),
   `Rating` VARCHAR(5)
);

CREATE TABLE `db`. `Event_Request`(
	`Request_ID`  BIGINT,
	`Business_ID` BIGINT,
	`Host_ID` BIGINT,
	`Description` TEXT
);
 
 

