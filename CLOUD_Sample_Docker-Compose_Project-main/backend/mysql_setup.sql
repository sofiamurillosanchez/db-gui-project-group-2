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
   CONSTRAINT ck_bool CHECK ('tagged_user' IN (1,0))
 
   PRIMARY KEY (`user_id`),
   UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
);
-- insert sample entry
INSERT INTO `db`.`user` (`role`) VALUES ('Moderator');
 
CREATE TABLE `db`.`Event`
	
CREATE TABLE `db`.`Ticket`
CREATE TABLE `db`.`Report`
CREATE TABLE `db`. `BannedIPs_Superlist`
CREATE TABLE `db`. `Business`
CREATE TABLE `db`. `Event_Request`
