

DROP DATABASE IF EXISTS db;
 
-- create database db
CREATE DATABASE IF NOT EXISTS db;
 
-- use newly create database
USE db;
 
-- create user table in db
CREATE TABLE `db`.`user` (
   `user_id` INT NOT NULL AUTO_INCREMENT,
   `role` VARCHAR(45),
   'name' VARCHAR(255),
   'dob' DATE,
   'location' VARCHAR(50),
   'zip_code' VARCHAR (10),
   'tagged_user' BOOLEAN,
   'company' VARCHAR(255),
   'email' VARCHAR(255),
   'phone_number' VARCHAR(15),
   'ip_address' VARCHAR(50),
   'password' VARCHAR(255),
   'is_host' BOOLEAN,
   CONSTRAINT ck_bool CHECK ('tagged_user' IN (1,0)),
 
   PRIMARY KEY (`user_id`),
   UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
);
-- insert sample entry
INSERT INTO `db`.`user` (`role`) VALUES ('Moderator');
 
CREATE TABLE `db`.`Event`(
   ‘Event_id’ INT NOT NULL AUTO_INCREMENT,
   ‘Event_name’ VARCHAR(255),
   ‘Event	_description’VARCHAR(65535),
   ‘Event_Image’ IMAGE(MAX),
   ‘Host_Name’ VARCHAR(255),
   ‘Host Contact Information’ VARCHAR(255),
   ‘Host User ID’ BIGINT,
   ‘Start Date’ DATE,
   ‘End Date’ DATE,
   ‘Start Time’ TIME,
   ‘End Time’ TIME,
   ‘Num_Expected_Attendees’ TIME,
   ‘Max_Capacity’ TIME,
   ‘Event_Location_Name’ VARCHAR(255),
   ‘Event_Location_Address’ VARCHAR(255),
   ‘Dress_Code’ VARCHAR(255),
   ‘Ticket_Cost’ Decimal(10, 2),
   ‘Minimum_Age_Requirement’ INT, 
   ‘Event_Type’ VARCHAR(255),
   ‘Event_Category’ VARCHAR(255),
   ‘Event_Activities’ VARCHAR(255),
   ‘Status’  CHAR(25),
	PRIMARY KEY (`event_id`)
);
 
CREATE TABLE `db`.`Ticket`(
	‘Ticket_ID’ BIGINT,
	‘User_ID’ BIGINT,
	‘Event_ID’ BIGINT
 
);
CREATE TABLE `db`.`Report`(
	‘Report_ID’ BIGINT,
	‘Report_Type’ CHAR(25),
	‘Report_Date’ DATE,
	‘Report_Reason’ VARCHAR(255),
	‘Sent_To’ VARCHAR(255),
	‘Report_Addressed’ BOOLEAN,
	‘Entity_Reported_ID’ BIGINT
);
CREATE TABLE `db`. `BannedIPs_Superlist`(
   ‘IP_Address’ NUMERIC,
   ‘Report_ID’ BIGINT
);
 
CREATE TABLE `db`. `Business`(
   ‘Business_ID’ BIGINT,
   ‘Business_Name’ VARCHAR(255),
   ‘Business_Location’ VARCHAR(255),
   ‘Email’ VARCHAR(255),
   ‘Phone_Number’ VARCHAR(255),
   ‘Rating’ VARCHAR
);

CREATE TABLE `db`. `Event_Request`(
	‘Request_ID’  BIGINT,
	‘Business_ID’ BIGINT,
	‘Host_ID’ BIGINT,
	‘Description’ VARCHAR(65535)
);
 
 

