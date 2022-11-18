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

CREATE TABLE `Event` (
  `Event_id` int NOT NULL AUTO_INCREMENT,
  `Event_name` varchar(255) DEFAULT NULL,
  `Event_description` text,
  `Host_Name` varchar(255) DEFAULT NULL,
  `Host_Contact_Information` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Start_Time` time DEFAULT NULL,
  `End_Time` time DEFAULT NULL,
  `Num_Expected_Attendees` bigint DEFAULT NULL,
  `Max_Capacity` bigint DEFAULT NULL,
  `Event_Location_Name` varchar(255) DEFAULT NULL,
  `Event_Location_Address` varchar(255) DEFAULT NULL,
  `Dress_Code` varchar(255) DEFAULT NULL,
  `Ticket_Cost` decimal(10,2) DEFAULT NULL,
  `Event_Type` varchar(255) DEFAULT NULL,
  `Event_Category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Event_id`),
  KEY `Event_FK` (`Host_Contact_Information`),
  CONSTRAINT `Event_FK` FOREIGN KEY (`Host_Contact_Information`) REFERENCES `User` (`email`)
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







INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('alda.pacocha@gmail.com','Lee Yates','1998-05-31','8bc5de83cf1daf79ed5b2f13f93d7c05d01d0388','Bloodhound','(372) 489-6636','Moderator','Houston- Texas','15108','131.231.26.88',0,1,1);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('alicia66@yahoo.com','Katherine Ryan','2007-10-21','6e1a438cfe5a6c9e2165665f8c2258849ccc43f0','EUQINOMprojects','(314) 471-8003','User','Lubbock- Texas','10451','131.231.26.88',0,1,2);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('ana34@hotmail.com','Julia Sims','2008-07-16','f7a9e24777ec23212c54d7a350bc5bea5477fdbb','Heartbaker','(678) 722-3519','Host','Cleveland- Ohio','40356','162.94.19.52',0,1,3);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('anika.homenick@yahoo.com','Madeline Weber','1993-06-17','63982f24867a92bfe1c6a49304550af194a3bc0a','Upcider','(664) 560-9722','Owner','Addison- Texas','60068','92.87.222.84',0,1,4);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('annamae.emard@cremin.com','Kristy Hunter','1994-10-07','068942c83f0e6994d046f7ec01b8f42ba8f317a7','Zenbi','(622) 685-3828','Moderator','Addison- Texas','08527','162.94.19.52',0,1,5);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('aorn@yahoo.com','Kerry Love','2008-03-22','061f66a5f6f993f777c6ea07f9e05ab6cd8b38d7','orangeland','(836) 452-1553','Host','Lubbock- Texas','30126','228.146.59.100',1,0,6);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('ara15@hotmail.com','Jeanne Stokes','2007-01-18','360e46f15f432af83c77017177a759aba8a58519','Monarch','(335) 473-3573','User','New York City- New York','42431','91.195.59.103',1,0,7);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('arlo.brown@mosciski.com','Alma Mcgee','2002-08-21','f18ce40c9190c9a32a16ee0b1c8dd7013178445d','Powerhouse','(627) 398-1381','Host','Miami- Florida','08043','202.42.2.203',1,0,8);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('ashtyn.cummings@pagac.com','Ada Figueroa','1995-07-21','6e2f9e6111e77edd0c446ea7a84e25323d137a61','LaserAway','(913) 901-5938','Owner','Denver- Colorado','98801','191.183.77.66',0,0,9);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('beahan.randal@hayes.net','Sue Cox','1999-06-07','bfe54caa6d483cc3887dce9d1b8eb91408f1ea7a','Mochica','(413) 680-3018','Moderator','Kansas City- Kansas','42431','218.51.235.104',0,0,10);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('beer.giuseppe@yahoo.com','Sarah Carlson','2005-07-19','e0c95748a455c27a80fd289269120d4944d1f318','Zenbi','(264) 611-7284','User','Cleveland- Ohio','60053','246.171.244.202',0,0,11);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('bernard10@gmail.com','Becky Johnston','2005-11-16','f18ce40c9190c9a32a16ee0b1c8dd7013178445d','defEYEned','(703) 472-9162','Owner','Denver- Colorado','10451','230.138.68.181',0,0,12);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('berniece68@gmail.com','Willie Price','1999-06-07','ee8d8728f435fd550f83852aabab5234ce1da528','Delarosa','(233) 363-3721','Host','Tusla- Oklahoma','40356','184.120.49.250',0,0,13);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('bfarrell@nienow.com','Pearl Sutton','2008-04-14','f4ee7415066b23ed0c5555e3a10aa76726a995d7','Fiorella','(314) 471-8003','Owner','Kansas City- Kansas','01923','117.235.122.242',0,0,14);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('bogan.davonte@yahoo.com','Angelica Allen','2005-09-12','bcd5917b85289cf889711720ce741f75c47add13','EUQINOMprojects','(233) 363-3721','Owner','Dallas- Texas','18966','130.196.13.150',0,0,15);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('bogan.peyton@gmail.com','Shannon Mcbride','2007-04-30','6e2f9e6111e77edd0c446ea7a84e25323d137a61','Polish','(413) 680-3018','Moderator','Juno- Alaska','93555','164.155.152.246',0,0,16);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('buck.schroeder@padberg.com','Salvador Perry','2009-06-02','4b4b04529d87b5c318702bc1d7689f70b15ef4fc','Terroir','(869) 672-4615','Host','Lubbock- Texas','28079','164.155.152.246',0,0,17);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('cary76@larkin.org','Barbara Henderson','2014-09-21','02e0a999c50b1f88df7a8f5a04e1b76b35ea6a88','Blackbird','(913) 901-5938','Moderator','Dallas- Texas','18966','246.171.244.202',0,0,18);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('casper.rogahn@hotmail.com','Kenneth Phillips','1994-04-12','b2ee60370ad57d9bc3877e9024c507ab99303a64','Spruce','(664) 560-9722','Host','Texarkana- Arkansas','28079','131.231.26.88',0,0,19);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('cassandra92@gmail.com','Marilyn Mcdaniel','1995-10-21','dea742e166979027ae70b28e0a9006fb1010e760','Parsnips','(836) 452-1553','User','Atlanta- Georgia','37160','189.142.115.255',0,0,20);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('cecile82@fay.com','Lucy Sharp','1994-10-07','11594787a658a5de6a49dccfb90c889fad9eeef1','Coqueta','(678) 722-3519','Host','Lubbock- Texas','06010','225.183.145.230',0,0,21);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('chasity.tremblay@hotmail.com','Wade Richards','1991-07-09','3acd0be86de7dcccdbf91b20f94a68cea535922d','Lynchart','(440) 875-1572','Moderator','Lubbock- Texas','01923','111.214.164.56',0,0,22);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('clarissa.wiegand@gmail.com','Edna Alexander','2009-02-19','5c17fa03e6d5fc247565e1cd8ffa70e1bfe5b8d9','MUFG','(335) 473-3573','Host','Chicago- Illinois','15108','191.183.77.66',0,0,23);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('clay30@hotmail.com','Rafael Todd','2009-11-30','b22ad110ffc6f4b739e37c878e0ffcbb45f5b7e6','Jaxson','(726) 265-8616','Host','Juno- Alaska','46077','196.243.164.143',0,0,24);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('cloyd.ruecker@mitchell.com','Irving Garrett','2007-08-14','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','Bravado','(542) 798-5673','Owner','Richmond- Virginia','18966','218.40.10.31',0,0,25);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('cordia.gorczany@gmail.com','Marcos Potter','2015-11-07','b7c40b9c66bc88d38a59e554c639d743e77f1b65','Monroe','(462) 678-3568','User','Tusla- Oklahoma','06902','131.231.26.88',0,0,26);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('corine04@yahoo.com','Nichole Moran','1991-07-09','011c945f30ce2cbafc452f39840f025693339c42','Olivos','(537) 770-7396','User','Cleveland- Ohio','98801','133.64.218.7',0,0,27);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('darrel88@kessler.com','Marty Morgan','2009-04-22','6e1a438cfe5a6c9e2165665f8c2258849ccc43f0','Robberbaron','(911) 897-1483','Host','Atlanta- Georgia','07006','111.214.164.56',0,0,28);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('dena.hoppe@yahoo.com','Wanda Gilbert','1995-10-21','3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d','Elixir','(627) 398-1381','Owner','Los Angeles- California','60053','21.85.233.61',0,0,29);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('devin93@schowalter.biz','Darryl Frank','1992-03-01','068cc94a2dbad94c45fe95e5b2fefc9fea5a8edb','Wildhawk','(911) 897-1483','Host','Phoenix- Arizona','84119','227.214.141.212',0,0,30);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('dustin90@hotmail.com','Opal Moreno','2011-09-25','ab726600510d71831fb17a87a598ec755d6c3c74','FraenkelLAB','(542) 798-5673','Owner','Las Vegas- Nevada','07017','202.42.2.203',0,0,31);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('dwalsh@harvey.com','Garry Owens','2010-07-04','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Bouche','(703) 472-9162','Host','Chicago- Illinois','60053','93.154.230.78',0,0,32);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('eichmann.israel@hammes.com','Martha Williamson','2005-09-12','895b317c76b8e504c2fb32dbb4420178f60ce321','Corks','(264) 611-7284','Owner','Richmond- Virginia','07017','133.64.218.7',0,0,33);
INSERT IGNORE INTO `User`(`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('ellen.macejkovic@yahoo.com','Shannon Mcbride','1993-09-11','47c1dc4559eae95cdde6246bf4aa3fb058dd8373','VinoRosso','(836) 452-1553','Host','Waco- Texas','47130','189.142.115.255',0,0,34);
INSERT IGNORE INTO `User`(`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('ellis.block@murazik.biz','Jane Bishop','1991-12-09','63982f24867a92bfe1c6a49304550af194a3bc0a','Hakkasan','(494) 595-1500','Owner','Chicago- Illinois','42431','131.231.26.88',0,0,35);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('emely.kub@farrell.org','Nicholas White','2007-01-18','9f2feb0f1ef425b292f2f94bc8482494df430413','Mochica','(264) 611-7284','Moderator','Tusla- Oklahoma','22405','225.183.145.230',0,0,36);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('evelyn47@yahoo.com','Madeline Weber','2012-07-02','1f5523a8f535289b3401b29958d01b2966ed61d2','Tradition','(271) 813-6726','Owner','San Diego- California','59101','162.94.19.52',0,0,37);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('fabian.hansen@marks.com','Alton Henry','2013-10-12','7728240c80b6bfd450849405e8500d6d207783b6','Picaro','(678) 722-3519','Host','Baltimore- Maryland','15108','93.154.230.78',0,0,38);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('fbrown@hotmail.com','Felipe Brewer','2012-09-06','5f079981221ce504832142e9526b623bbfb6e686','Cultivar','(250) 692-2174','User','Los Angeles- California','47130','196.243.164.143',0,0,39);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('fhauck@langosh.com','Melissa Goodwin','2005-09-12','2891baceeef1652ee698294da0e71ba78a2a4064','Grasslands','(673) 907-6572','User','Seattle- Washington','23228','191.183.77.66',0,0,40);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('filiberto64@armstrong.com','Keith Hammond','2008-03-22','b80a9aed8af17118e51d4d0c2d7872ae26e2109e','Chambers','(526) 734-2905','Host','Houston- Texas','06010','91.195.59.103',0,0,41);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('fleta00@schultz.com','Julia Sims','2001-09-13','5f50a84c1fa3bcff146405017f36aec1a10a9e38','PianoFight','(869) 672-4615','Moderator','Denver- Colorado','60068','21.85.233.61',0,0,42);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('gail75@macejkovic.com','Percy Murphy','1994-04-12','7212a9e01329ea93a57f574bd9bf77695d5fdca4','Split','(526) 734-2905','User','Lubbock- Texas','14150','225.183.145.230',0,0,43);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('gregorio.ferry@marquardt.com','Homer Carpenter','2005-06-03','bae7d5be70820ed56467bd9a63744e23b47bd711','artocrat','(869) 672-4615','Host','Juno- Alaska','18966','182.42.77.81',0,0,44);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('grimes.verner@kutch.com','Felipe Brewer','1992-10-06','8f9f5c01d74fcdace2b684d1d1159615d9c45ca6','Cultivar','(372) 489-6636','Moderator','Los Angeles- California','64151','112.235.135.102',0,0,45);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('hanna30@hudson.com','Leo Long','2012-01-11','f7a9e24777ec23212c54d7a350bc5bea5477fdbb','Asiento','(883) 433-9817','Moderator','Austin- Texas','92220','131.231.26.88',0,0,46);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('hauck.maudie@yahoo.com','Salvador Perry','1992-03-14','40bd001563085fc35165329ea1ff5c5ecbdbbeef','Celandine','(869) 672-4615','Owner','Miami- Florida','93555','225.183.145.230',0,0,47);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('hemard@yahoo.com','Kristin Francis','2003-07-13','de3460832ea070effabbc7032d7594bbde1bb120','BAIT','(491) 367-8515','Host','Waco- Texas','46077','112.235.135.102',0,0,48);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('hyatt.maia@gmail.com','Katie Walsh','2007-02-20','7728240c80b6bfd450849405e8500d6d207783b6','Terroir','(335) 473-3573','User','Baltimore- Maryland','42431','117.235.122.242',0,0,49);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('joshua.raynor@gmail.com','Thelma Graves','2015-10-28','d8cd10b920dcbdb5163ca0185e402357bc27c265','Driftwood','(627) 398-1381','User','Denver- Colorado','37343','194.15.165.252',0,0,50);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('kaden.reichel@bogan.com','Marcos Potter','2001-09-13','fc84aaa687374aed41957693f32664e5f4981862','8sixty','(498) 985-5203','User','Texarkana- Arkansas','93555','41.158.172.204',0,0,51);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('kaleigh.osinski@hotmail.com','Nicholas White','2003-08-25','8f9f5c01d74fcdace2b684d1d1159615d9c45ca6','Dekko','(911) 897-1483','Host','Salt Lake City- Utah','33435','189.142.115.255',0,0,52);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('kasandra.bauch@hotmail.com','Homer Carpenter','2006-08-02','aebc3ebee2f0c8b08b43d26c2b0055b19caeaf4a','Swig','(372) 489-6636','Host','Houston- Texas','15108','228.146.59.100',0,0,53);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('katrina32@gmail.com','Tanya Ward','2015-10-28','7728240c80b6bfd450849405e8500d6d207783b6','1AM','(462) 678-3568','User','New York City- New York','22405','21.85.233.61',0,0,54);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('katrine.stanton@langosh.org','Roland Wright','2015-11-07','6e2f9e6111e77edd0c446ea7a84e25323d137a61','Wish','(264) 611-7284','User','Miami- Florida','59101','230.138.68.181',0,0,55);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('kirlin.hannah@quitzon.com','Cecil Logan','2006-08-02','19b58543c85b97c5498edfd89c11c3aa8cb5fe51','Brewcade','(264) 611-7284','Owner','Dallas- Texas','06902','202.42.2.203',0,0,56);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('koss.grant@yahoo.com','Sherman Daniel','2005-09-12','d54b76b2bad9d9946011ebc62a1d272f4122c7b5','MUFG','(954) 545-2100','User','Houston- Texas','01923','230.138.68.181',0,0,57);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('kveum@yahoo.com','Shari Sanders','1993-03-23','db25f2fc14cd2d2b1e7af307241f548fb03c312a','Rumors','(462) 678-3568','Moderator','Lubbock- Texas','98801','3.220.186.237',0,0,58);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('leo92@king.com','Dolores Kim','2007-01-18','4f26aeafdb2367620a393c973eddbe8f8b846ebd','Campsyte','(726) 265-8616','User','San Francisco- California','90260','40.197.231.196',0,0,59);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('lera.hudson@gmail.com','Jermaine Sparks','1991-12-09','77bce9fb18f977ea576bbcd143b2b521073f0cd6','EUQINOMprojects','(542) 798-5673','Host','Addison- Texas','98801','239.124.113.156',0,0,60);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('lonie.spencer@cruickshank.org','Irving Garrett','1997-10-06','fac673092fbdcab2cd92efc19675f2750ed97ca1','Biergarten','(542) 798-5673','User','Seattle- Washington','10451','133.64.218.7',0,0,61);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('lonnie.dach@gmail.com','Kristopher Rios','2015-07-05','4f26aeafdb2367620a393c973eddbe8f8b846ebd','Crawstation','(664) 560-9722','Moderator','Miami- Florida','85302','202.42.2.203',0,0,62);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('lyric.emard@yahoo.com','Chad Hall','1997-01-27','cb45c671cbc500627ea424eea5f91996221b5935','Boniva','(443) 516-5327','Host','New York City- New York','90260','93.154.230.78',0,0,63);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('marcelo.quigley@yahoo.com','Marilyn Mcdaniel','1993-06-17','e38ad214943daad1d64c102faec29de4afe9da3d','Hearth','(462) 678-3568','User','Kansas City- Kansas','07006','194.15.165.252',0,0,64);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('marcus18@douglas.info','Elisa Reyes','2002-12-03','360e46f15f432af83c77017177a759aba8a58519','Modernist','(491) 367-8515','User','San Diego- California','14150','133.64.218.7',0,0,65);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('mozelle.heathcote@yahoo.com','Madeline Weber','1993-06-17','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','Dekko','(440) 875-1572','Moderator','Miami- Florida','98801','21.85.233.61',0,0,66);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('murazik.liza@prosacco.com','Katie Walsh','2003-12-10','c0b137fe2d792459f26ff763cce44574a5b5ab03','Perbacco','(537) 770-7396','Moderator','Atlanta- Georgia','98444','225.183.145.230',0,0,67);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('myriam.volkman@windler.com','Alma Mcgee','1994-10-07','3acd0be86de7dcccdbf91b20f94a68cea535922d','Skinnovation','(541) 675-4625','Owner','Chicago- Illinois','30126','202.42.2.203',0,0,68);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('nyost@altenwerth.com','Jane Bishop','1992-03-01','ee8d8728f435fd550f83852aabab5234ce1da528','Tradition','(836) 452-1553','Host','San Antonio- Texas','98444','162.94.19.52',0,0,69);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('orville.haag@gottlieb.com','Dan Spencer','2010-11-16','f4ee7415066b23ed0c5555e3a10aa76726a995d7','BAIT','(498) 985-5203','User','Kansas City- Kansas','07017','79.252.127.251',0,0,70);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('osbaldo21@hotmail.com','Lee Yates','2015-06-20','4bfe029d971ddb359dabed0d0ab968a329ed0ab0','Supernatural','(542) 798-5673','Owner','Texarkana- Arkansas','10451','191.183.77.66',0,0,71);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('paucek.laila@hotmail.com','Sean Mcdonald','2006-05-21','d27f4469be6eadfde078a1e371c9d67d3f7512c7','Amber','(443) 516-5327','Host','Phoenix- Arizona','30126','164.155.152.246',0,0,72);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('phoebe.kirlin@yahoo.com','Chad Hall','2010-11-16','ed9d3d832af899035363a69fd53cd3be8f71501c','Muka','(804) 766-9508','Moderator','Los Angeles- California','40356','133.64.218.7',0,0,73);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('plakin@yahoo.com','Salvador Perry','1991-01-22','85136c79cbf9fe36bb9d05d0639c70c265c18d37','Jackalope','(627) 398-1381','User','Staunton- Virginia','10451','202.42.2.203',0,0,74);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('qschroeder@hotmail.com','Melissa Goodwin','1998-05-31','c0b137fe2d792459f26ff763cce44574a5b5ab03','MaSo','(937) 922-4512','Host','Charlottesville- Virginia','01923','91.195.59.103',0,0,75);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('reba.gislason@gmail.com','Roland Wright','1994-05-07','63982f24867a92bfe1c6a49304550af194a3bc0a','Hanaro','(703) 472-9162','Moderator','Richmond- Virginia','37343','202.42.2.203',0,0,76);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('rebekah28@hotmail.com','Kenny Fox','1999-04-13','a642a77abd7d4f51bf9226ceaf891fcbb5b299b8','Kahnfections','(372) 489-6636','Host','Seattle- Washington','08043','218.51.235.104',0,0,77);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('robel.reba@hotmail.com','Corey Gutierrez','2009-11-30','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','Earthbody','(443) 516-5327','Owner','Atlanta- Georgia','22405','194.15.165.252',0,0,78);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('sam87@hotmail.com','Edna Alexander','2006-08-02','c6922b6ba9e0939583f973bc1682493351ad4fe8','Redford','(913) 901-5938','Moderator','Las Vegas- Nevada','01923','40.197.231.196',0,0,79);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('samson.schaefer@kessler.com','Elisa Reyes','2003-07-13','4bfe029d971ddb359dabed0d0ab968a329ed0ab0','Wish','(494) 595-1500','Host','Waco- Texas','47130','3.220.186.237',0,0,80);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('savannah35@batz.biz','Ada Figueroa','1991-12-09','42849ade74de4722a85f06e8b1fd2a9a17d2fe4a','Skinworx','(440) 875-1572','Host','Waco- Texas','16335','194.15.165.252',0,0,81);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('sawayn.raymundo@abshire.com','Elias Wheeler','1993-03-23','ab87d24bdc7452e55738deb5f868e1f16dea5ace','Grasslands','(271) 813-6726','Owner','Texarkana- Arkansas','60068','239.124.113.156',0,0,82);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('susan66@robel.com','Katie Walsh','1995-12-06','c984aed014aec7623a54f0591da07a85fd4b762d','BLOW','(883) 433-9817','Moderator','Atlanta- Georgia','93555','227.214.141.212',0,0,83);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('swaniawski.shayna@yahoo.com','Pearl Sutton','2009-04-22','a2c901c8c6dea98958c219f6f2d038c44dc5d362','Mezcalito','(439) 240-6348','Moderator','Salt Lake City- Utah','22405','111.214.164.56',0,0,84);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('swift.blanche@gmail.com','Opal Moreno','2005-09-12','b1b3773a05c0ed0176787a4f1574ff0075f7521e','Picaro','(627) 398-1381','Moderator','Dallas- Texas','06010','202.42.2.203',0,0,85);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('tillman.citlalli@gmail.com','Ruth Gardner','2009-02-19','ad70ab97ae1376e656002641cfb067c9c94906a2','Goforaloop','(491) 367-8515','Host','Kansas City- Kansas','22405','182.42.77.81',0,0,86);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('tlangworth@hotmail.com','Shannon Mcbride','1993-03-23','3da541559918a808c2402bba5012f6c60b27661c','ABV','(372) 489-6636','User','Las Vegas- Nevada','83651','9.217.252.158',0,0,87);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('twila70@hotmail.com','Kristy Hunter','2015-10-28','47c1dc4559eae95cdde6246bf4aa3fb058dd8373','CAPITAL','(498) 985-5203','User','Miami- Florida','46321','174.73.222.116',0,0,88);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('usporer@gmail.com','Mark Morrison','1994-02-15','e3cd9f6469fc3e1acfb9f2bdbfc5a3d2bbb8e2ad','Vertigo','(836) 452-1553','Owner','Lubbock- Texas','18966','218.51.235.104',0,0,89);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('vcummerata@gmail.com','Edna Alexander','2005-05-31','88fdd585121a4ccb3d1540527aee53a77c77abb8','Dekko','(869) 672-4615','Moderator','Las Vegas- Nevada','46077','3.220.186.237',0,0,90);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('velda.leffler@koss.biz','Mark Morrison','2011-02-02','ab87d24bdc7452e55738deb5f868e1f16dea5ace','VOILA','(443) 516-5327','User','San Antonio- Texas','70001','92.87.222.84',0,0,91);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('wehner.adella@gmail.com','Martha Williamson','2011-02-02','ab726600510d71831fb17a87a598ec755d6c3c74','Jaxson','(883) 433-9817','Host','Los Angeles- California','07006','92.87.222.84',0,0,92);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('weissnat.alfonzo@yahoo.com','Roland Wright','1996-12-26','d6955d9721560531274cb8f50ff595a9bd39d66f','Tradition','(498) 985-5203','Moderator','Denver- Colorado','46077','145.124.110.185',0,0,93);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('wilkinson.elinor@yahoo.com','Mark Morrison','2009-04-22','c6922b6ba9e0939583f973bc1682493351ad4fe8','hugomento','(491) 367-8515','User','Chicago- Illinois','42431','31.144.4.102',0,0,94);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('wisozk.maritza@gmail.com','Ernestine Cross','2002-12-03','1f82c942befda29b6ed487a51da199f78fce7f05','Hakkasan','(537) 770-7396','User','New York City- New York','64151','31.144.4.102',0,0,95);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('wolf.mossie@yahoo.com','Jimmie Gray','1997-10-06','360e46f15f432af83c77017177a759aba8a58519','Blackthorn','(335) 473-3573','User','Lubbock- Texas','46321','174.73.222.116',0,0,96);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('wunsch.brando@schoen.com','Kerry Love','2012-07-02','de3460832ea070effabbc7032d7594bbde1bb120','Redford','(733) 383-6508','User','Charlotte- North Carolina','59101','31.144.4.102',0,0,97);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('xlang@wilderman.com','Luke Burke','1996-12-26','1cb5bd5a9e45420321f44c72da5d90d7f0432ffb','artocrat','(498) 985-5203','User','Baltimore- Maryland','92083','111.214.164.56',0,0,98);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('yadira52@hotmail.com','Donnie Patrick','1995-12-06','aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d','Starbelly','(542) 798-5673','Host','Staunton- Virginia','08527','184.120.49.250',0,0,99);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('ypouros@schiller.com','Cecil Logan','2005-11-16','de3460832ea070effabbc7032d7594bbde1bb120','Spruce','(491) 367-8515','User','San Diego- California','98801','93.154.230.78',0,0,100);

INSERT IGNORE INTO `Ticket` (`Ticket_ID`,`User_Email`,`Event_ID`) VALUES (0,NULL,NULL);
INSERT IGNORE INTO `Ticket` (`Ticket_ID`,`User_Email`,`Event_ID`) VALUES (1,'beer.giuseppe@yahoo',1);
INSERT IGNORE INTO `Ticket` (`Ticket_ID`,`User_Email`,`Event_ID`) VALUES (2,'bogan.peyton@gmail.',3);
INSERT IGNORE INTO `Ticket` (`Ticket_ID`,`User_Email`,`Event_ID`) VALUES (3,'buck.schroeder@padb',3);
INSERT IGNORE INTO `Ticket` (`Ticket_ID`,`User_Email`,`Event_ID`) VALUES (4,'cary76@larkin.org',5);
INSERT IGNORE INTO `Ticket` (`Ticket_ID`,`User_Email`,`Event_ID`) VALUES (5,'devin93@schowalter.',5);
INSERT IGNORE INTO `Ticket` (`Ticket_ID`,`User_Email`,`Event_ID`) VALUES (6,'fbrown@hotmail.com',2);

INSERT IGNORE INTO `Report` (`Report_ID`,`Report_Type`,`Report_Date`,`Report_Reason`,`Sent_To`,`Report_Addressed`,`Entity_Reported_ID`) VALUES (1,'User','2022-08-15','The user threatened another user with inappropriate language','CoolAdmin101',0,6);
INSERT IGNORE INTO `Report` (`Report_ID`,`Report_Type`,`Report_Date`,`Report_Reason`,`Sent_To`,`Report_Addressed`,`Entity_Reported_ID`) VALUES (2,'User','2022-08-21','The user attempted to scam hosts by stealing credit card info','CoolAdmin101',0,7);
INSERT IGNORE INTO `Report` (`Report_ID`,`Report_Type`,`Report_Date`,`Report_Reason`,`Sent_To`,`Report_Addressed`,`Entity_Reported_ID`) VALUES (3,'User','2022-08-30','The user violated a specific rule specified in TOS','CoolAdmin101',0,8);


INSERT IGNORE INTO `Events` (`Event_id`,`Event_name`,`Event_description`,`Host_Name`,`Host_Contact_Information`,`Start_Date`,`End_Date`,`Start_Time`,`End_Time`,`Num_Expected_Attendees`,`Max_Capacity`,`Event_Location_Name`,`Event_Location_Address`,`Dress_Code`,`Ticket_Cost`,`Event_Type`,`Event_Category`) VALUES (1,'Arboretum Biology Seminar','Teaching Kids Environmental Science','Lee Yates','alda.pacocha@gmail.com','2021-07-14','2021-07-14','02:00:00','05:00:00',15,50,'Children\'s Center','2316 Garland Road','Casual',10.00,'An outdoor educational event for children on environmental sciences with parent supervision','Educational');
INSERT IGNORE INTO `Events` (`Event_id`,`Event_name`,`Event_description`,`Host_Name`,`Host_Contact_Information`,`Start_Date`,`End_Date`,`Start_Time`,`End_Time`,`Num_Expected_Attendees`,`Max_Capacity`,`Event_Location_Name`,`Event_Location_Address`,`Dress_Code`,`Ticket_Cost`,`Event_Type`,`Event_Category`) VALUES (2,'Food Pantry Event','testing','Katherine Ryan','alicia66@yahoo.com','2021-08-13','2021-08-15','10:30:00','05:00:00',30,50,'North Texas Food Bank','4312 Plano Road','Casual',0.00,'An opportunity to assist those suffering from hunger in North Texas','Community Service');
INSERT IGNORE INTO `Events` (`Event_id`,`Event_name`,`Event_description`,`Host_Name`,`Host_Contact_Information`,`Start_Date`,`End_Date`,`Start_Time`,`End_Time`,`Num_Expected_Attendees`,`Max_Capacity`,`Event_Location_Name`,`Event_Location_Address`,`Dress_Code`,`Ticket_Cost`,`Event_Type`,`Event_Category`) VALUES (3,'Jazz Concert','A performance in Downtown Dallas','Kerry Love','aorn@yahoo.com','2021-08-11','2021-08-11','07:00:00','11:00:00',300,500,'AT&T Performing Arts Center',' 2403 Flora St','Casual',50.00,'A pop concert by a famous performer','Music');
INSERT IGNORE INTO `Events` (`Event_id`,`Event_name`,`Event_description`,`Host_Name`,`Host_Contact_Information`,`Start_Date`,`End_Date`,`Start_Time`,`End_Time`,`Num_Expected_Attendees`,`Max_Capacity`,`Event_Location_Name`,`Event_Location_Address`,`Dress_Code`,`Ticket_Cost`,`Event_Type`,`Event_Category`) VALUES (4,'PHD Defense','A PHD Defense on Computer networks','Madeleine Weber','anika.homenick@yahoo.com','2022-05-16','2022-05-16','02:30:00','04:30:00',30,150,'Caruth Building','3126 Plano Parkway','Formal',5.00,'Watching a PHD Thesis Defense of an SMU graduate','Educational');
INSERT IGNORE INTO `Events` (`Event_id`,`Event_name`,`Event_description`,`Host_Name`,`Host_Contact_Information`,`Start_Date`,`End_Date`,`Start_Time`,`End_Time`,`Num_Expected_Attendees`,`Max_Capacity`,`Event_Location_Name`,`Event_Location_Address`,`Dress_Code`,`Ticket_Cost`,`Event_Type`,`Event_Category`) VALUES (5,'Rock Concert','A Performance in Arlington Stadium','Kristy Hunter','annamae.emard@cremin.com','2023-01-11','2022-01-11','06:00:00','11:30:00',200,1000,'Arlington Stadium','1 AT&T Way','Casual',100.00,'A rock Concert of a famous performer. ','Music');



INSERT IGNORE INTO `Event_Request` (`Request_ID`,`Business_ID`,`Host_ID`,`Description`) VALUES (1,12856295,1,'This is a request for a environmental science event at the Arboretum');
INSERT IGNORE INTO `Event_Request` (`Request_ID`,`Business_ID`,`Host_ID`,`Description`) VALUES (2,44860275,2,'This ia a request for a community service event to give food to families suffering from food hunger in North Texas. ');
INSERT IGNORE INTO `Event_Request` (`Request_ID`,`Business_ID`,`Host_ID`,`Description`) VALUES (3,49936473,3,'This is a request for a pop concert to be hosted in downtown');
INSERT IGNORE INTO `Event_Request` (`Request_ID`,`Business_ID`,`Host_ID`,`Description`) VALUES (4,56846997,4,'This is a request to have a PHD event defense hosted for those interested in the field of computer science near SMU');
INSERT IGNORE INTO `Event_Request` (`Request_ID`,`Business_ID`,`Host_ID`,`Description`) VALUES (5,95638268,5,'This is a request for a rock concert from a famous band that wants to perform at Arlington Stadium for Dallas Fans. ');



INSERT IGNORE INTO `Business` (`Business_ID`,`Business_Name`,`Business_Location`,`Email`,`Phone_Number`,`Rating`) VALUES (12856295,'Exxon','Irving, Texas','jane.doe@exxonmobil.com','469-673-5847','3');
INSERT IGNORE INTO `Business` (`Business_ID`,`Business_Name`,`Business_Location`,`Email`,`Phone_Number`,`Rating`) VALUES (44860275,'Meta','Menlo Park, California','support@facebook.com','214-232-8547','1');
INSERT IGNORE INTO `Business` (`Business_ID`,`Business_Name`,`Business_Location`,`Email`,`Phone_Number`,`Rating`) VALUES (49936473,'Microsoft','Redmond, Washington','MSFT@contactus365.com','312-737-4619','5');
INSERT IGNORE INTO `Business` (`Business_ID`,`Business_Name`,`Business_Location`,`Email`,`Phone_Number`,`Rating`) VALUES (56846997,'Pepsi Co','Harrison, New York','Jerry@Pepsico.com','214-009-2398','4');
INSERT IGNORE INTO `Business` (`Business_ID`,`Business_Name`,`Business_Location`,`Email`,`Phone_Number`,`Rating`) VALUES (95638268,'Frito Lay','Plano, Texas','FritoPublic@fritolay.com','214-969-7555','4');

INSERT IGNORE INTO `BannedIPs_Superlist` (`IP_Address`,`Report_ID`) VALUES ('202.42.2.203',3);
INSERT IGNORE INTO `BannedIPs_Superlist` (`IP_Address`,`Report_ID`) VALUES ('228.146.59.100',1);
INSERT IGNORE INTO `BannedIPs_Superlist` (`IP_Address`,`Report_ID`) VALUES ('91.195.59.103',2);







