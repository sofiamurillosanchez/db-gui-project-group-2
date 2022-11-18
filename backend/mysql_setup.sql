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







INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('alda.pacocha@gmail.com','Lee Yates','1998-05-31','123456789a','Bloodhound','(372) 489-6636','Moderator','Houston- Texas','15108','131.231.26.88',0,1,1);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('alicia66@yahoo.com','Katherine Ryan','2007-10-21','anthony','EUQINOMprojects','(314) 471-8003','User','Lubbock- Texas','10451','131.231.26.88',0,1,2);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('ana34@hotmail.com','Julia Sims','2008-07-16','aaaaaa','Heartbaker','(678) 722-3519','Host','Cleveland- Ohio','40356','162.94.19.52',0,1,3);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('anika.homenick@yahoo.com','Madeline Weber','1993-06-17','FQRG7CS493','Upcider','(664) 560-9722','Owner','Addison- Texas','60068','92.87.222.84',0,1,4);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('annamae.emard@cremin.com','Kristy Hunter','1994-10-07','liverpool','Zenbi','(622) 685-3828','Moderator','Addison- Texas','08527','162.94.19.52',0,1,5);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('aorn@yahoo.com','Kerry Love','2008-03-22','gwerty123','orangeland','(836) 452-1553','Host','Lubbock- Texas','30126','228.146.59.100',1,0,6);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('ara15@hotmail.com','Jeanne Stokes','2007-01-18','123456a','Monarch','(335) 473-3573','User','New York City- New York','42431','91.195.59.103',1,0,7);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('arlo.brown@mosciski.com','Alma Mcgee','2002-08-21','gwerty','Powerhouse','(627) 398-1381','Host','Miami- Florida','08043','202.42.2.203',1,0,8);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('ashtyn.cummings@pagac.com','Ada Figueroa','1995-07-21','hunter','LaserAway','(913) 901-5938','Owner','Denver- Colorado','98801','191.183.77.66',0,0,9);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('beahan.randal@hayes.net','Sue Cox','1999-06-07','987654321','Mochica','(413) 680-3018','Moderator','Kansas City- Kansas','42431','218.51.235.104',0,0,10);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('beer.giuseppe@yahoo.com','Sarah Carlson','2005-07-19','zxcvbn','Zenbi','(264) 611-7284','User','Cleveland- Ohio','60053','246.171.244.202',0,0,11);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('bernard10@gmail.com','Becky Johnston','2005-11-16','gwerty','defEYEned','(703) 472-9162','Owner','Denver- Colorado','10451','230.138.68.181',0,0,12);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('berniece68@gmail.com','Willie Price','1999-06-07','iloveyou','Delarosa','(233) 363-3721','Host','Tusla- Oklahoma','40356','184.120.49.250',0,0,13);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('bfarrell@nienow.com','Pearl Sutton','2008-04-14','131313','Fiorella','(314) 471-8003','Owner','Kansas City- Kansas','01923','117.235.122.242',0,0,14);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('bogan.davonte@yahoo.com','Angelica Allen','2005-09-12','gfhjkm','EUQINOMprojects','(233) 363-3721','Owner','Dallas- Texas','18966','130.196.13.150',0,0,15);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('bogan.peyton@gmail.com','Shannon Mcbride','2007-04-30','hunter','Polish','(413) 680-3018','Moderator','Juno- Alaska','93555','164.155.152.246',0,0,16);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('buck.schroeder@padberg.com','Salvador Perry','2009-06-02','789456123','Terroir','(869) 672-4615','Host','Lubbock- Texas','28079','164.155.152.246',0,0,17);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('cary76@larkin.org','Barbara Henderson','2014-09-21','andrew','Blackbird','(913) 901-5938','Moderator','Dallas- Texas','18966','246.171.244.202',0,0,18);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('casper.rogahn@hotmail.com','Kenneth Phillips','1994-04-12','123654','Spruce','(664) 560-9722','Host','Texarkana- Arkansas','28079','131.231.26.88',0,0,19);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('cassandra92@gmail.com','Marilyn Mcdaniel','1995-10-21','987654','Parsnips','(836) 452-1553','User','Atlanta- Georgia','37160','189.142.115.255',0,0,20);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('cecile82@fay.com','Lucy Sharp','1994-10-07','angel1','Coqueta','(678) 722-3519','Host','Lubbock- Texas','06010','225.183.145.230',0,0,21);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('chasity.tremblay@hotmail.com','Wade Richards','1991-07-09','112233','Lynchart','(440) 875-1572','Moderator','Lubbock- Texas','01923','111.214.164.56',0,0,22);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('clarissa.wiegand@gmail.com','Edna Alexander','2009-02-19','soccer','MUFG','(335) 473-3573','Host','Chicago- Illinois','15108','191.183.77.66',0,0,23);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('clay30@hotmail.com','Rafael Todd','2009-11-30','bitch1','Jaxson','(726) 265-8616','Host','Juno- Alaska','46077','196.243.164.143',0,0,24);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('cloyd.ruecker@mitchell.com','Irving Garrett','2007-08-14','11111111','Bravado','(542) 798-5673','Owner','Richmond- Virginia','18966','218.40.10.31',0,0,25);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('cordia.gorczany@gmail.com','Marcos Potter','2015-11-07','555555','Monroe','(462) 678-3568','User','Tusla- Oklahoma','06902','131.231.26.88',0,0,26);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('corine04@yahoo.com','Nichole Moran','1991-07-09','1111','Olivos','(537) 770-7396','User','Cleveland- Ohio','98801','133.64.218.7',0,0,27);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('darrel88@kessler.com','Marty Morgan','2009-04-22','anthony','Robberbaron','(911) 897-1483','Host','Atlanta- Georgia','07006','111.214.164.56',0,0,28);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('dena.hoppe@yahoo.com','Wanda Gilbert','1995-10-21','111111','Elixir','(627) 398-1381','Owner','Los Angeles- California','60053','21.85.233.61',0,0,29);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('devin93@schowalter.biz','Darryl Frank','1992-03-01','zag12wsx','Wildhawk','(911) 897-1483','Host','Phoenix- Arizona','84119','227.214.141.212',0,0,30);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('dustin90@hotmail.com','Opal Moreno','2011-09-25','homelesspa','FraenkelLAB','(542) 798-5673','Owner','Las Vegas- Nevada','07017','202.42.2.203',0,0,31);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('dwalsh@harvey.com','Garry Owens','2010-07-04','123','Bouche','(703) 472-9162','Host','Chicago- Illinois','60053','93.154.230.78',0,0,32);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('eichmann.israel@hammes.com','Martha Williamson','2005-09-12','a123456','Corks','(264) 611-7284','Owner','Richmond- Virginia','07017','133.64.218.7',0,0,33);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('ellen.macejkovic@yahoo.com','Shannon Mcbride','1993-09-11','12345a','VinoRosso','(836) 452-1553','Host','Waco- Texas','47130','189.142.115.255',0,0,34);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('ellis.block@murazik.biz','Jane Bishop','1991-12-09','FQRG7CS493','Hakkasan','(494) 595-1500','Owner','Chicago- Illinois','42431','131.231.26.88',0,0,35);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('emely.kub@farrell.org','Nicholas White','2007-01-18','love','Mochica','(264) 611-7284','Moderator','Tusla- Oklahoma','22405','225.183.145.230',0,0,36);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('evelyn47@yahoo.com','Madeline Weber','2012-07-02','999999','Tradition','(271) 813-6726','Owner','San Diego- California','59101','162.94.19.52',0,0,37);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('fabian.hansen@marks.com','Alton Henry','2013-10-12','linkedin','Picaro','(678) 722-3519','Host','Baltimore- Maryland','15108','93.154.230.78',0,0,38);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('fbrown@hotmail.com','Felipe Brewer','2012-09-06','159357','Cultivar','(250) 692-2174','User','Los Angeles- California','47130','196.243.164.143',0,0,39);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('fhauck@langosh.com','Melissa Goodwin','2005-09-12','asd123','Grasslands','(673) 907-6572','User','Seattle- Washington','23228','191.183.77.66',0,0,40);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('filiberto64@armstrong.com','Keith Hammond','2008-03-22','1q2w3e4r5t','Chambers','(526) 734-2905','Host','Houston- Texas','06010','91.195.59.103',0,0,41);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('fleta00@schultz.com','Julia Sims','2001-09-13','thomas','PianoFight','(869) 672-4615','Moderator','Denver- Colorado','60068','21.85.233.61',0,0,42);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('gail75@macejkovic.com','Percy Murphy','1994-04-12','michelle','Split','(526) 734-2905','User','Lubbock- Texas','14150','225.183.145.230',0,0,43);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('gregorio.ferry@marquardt.com','Homer Carpenter','2005-06-03','Status','artocrat','(869) 672-4615','Host','Juno- Alaska','18966','182.42.77.81',0,0,44);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('grimes.verner@kutch.com','Felipe Brewer','1992-10-06','target123','Cultivar','(372) 489-6636','Moderator','Los Angeles- California','64151','112.235.135.102',0,0,45);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('hanna30@hudson.com','Leo Long','2012-01-11','aaaaaa','Asiento','(883) 433-9817','Moderator','Austin- Texas','92220','131.231.26.88',0,0,46);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('hauck.maudie@yahoo.com','Salvador Perry','1992-03-14','123','Celandine','(869) 672-4615','Owner','Miami- Florida','93555','225.183.145.230',0,0,47);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('hemard@yahoo.com','Kristin Francis','2003-07-13','lovely','BAIT','(491) 367-8515','Host','Waco- Texas','46077','112.235.135.102',0,0,48);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('hyatt.maia@gmail.com','Katie Walsh','2007-02-20','linkedin','Terroir','(335) 473-3573','User','Baltimore- Maryland','42431','117.235.122.242',0,0,49);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('joshua.raynor@gmail.com','Thelma Graves','2015-10-28','charlie','Driftwood','(627) 398-1381','User','Denver- Colorado','37343','194.15.165.252',0,0,50);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('kaden.reichel@bogan.com','Marcos Potter','2001-09-13','princess1','8sixty','(498) 985-5203','User','Texarkana- Arkansas','93555','41.158.172.204',0,0,51);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('kaleigh.osinski@hotmail.com','Nicholas White','2003-08-25','target123','Dekko','(911) 897-1483','Host','Salt Lake City- Utah','33435','189.142.115.255',0,0,52);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('kasandra.bauch@hotmail.com','Homer Carpenter','2006-08-02','12qwaszx','Swig','(372) 489-6636','Host','Houston- Texas','15108','228.146.59.100',0,0,53);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('katrina32@gmail.com','Tanya Ward','2015-10-28','linkedin','1AM','(462) 678-3568','User','New York City- New York','22405','21.85.233.61',0,0,54);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('katrine.stanton@langosh.org','Roland Wright','2015-11-07','hunter','Wish','(264) 611-7284','User','Miami- Florida','59101','230.138.68.181',0,0,55);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('kirlin.hannah@quitzon.com','Cecil Logan','2006-08-02','qwert','Brewcade','(264) 611-7284','Owner','Dallas- Texas','06902','202.42.2.203',0,0,56);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('koss.grant@yahoo.com','Sherman Daniel','2005-09-12','789456','MUFG','(954) 545-2100','User','Houston- Texas','01923','230.138.68.181',0,0,57);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('kveum@yahoo.com','Shari Sanders','1993-03-23','qwer1234','Rumors','(462) 678-3568','Moderator','Lubbock- Texas','98801','3.220.186.237',0,0,58);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('leo92@king.com','Dolores Kim','2007-01-18','master','Campsyte','(726) 265-8616','User','San Francisco- California','90260','40.197.231.196',0,0,59);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('lera.hudson@gmail.com','Jermaine Sparks','1991-12-09','333333','EUQINOMprojects','(542) 798-5673','Host','Addison- Texas','98801','239.124.113.156',0,0,60);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('lonie.spencer@cruickshank.org','Irving Garrett','1997-10-06','football1','Biergarten','(542) 798-5673','User','Seattle- Washington','10451','133.64.218.7',0,0,61);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('lonnie.dach@gmail.com','Kristopher Rios','2015-07-05','master','Crawstation','(664) 560-9722','Moderator','Miami- Florida','85302','202.42.2.203',0,0,62);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('lyric.emard@yahoo.com','Chad Hall','1997-01-27','qazwsx','Boniva','(443) 516-5327','Host','New York City- New York','90260','93.154.230.78',0,0,63);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('marcelo.quigley@yahoo.com','Marilyn Mcdaniel','1993-06-17','password1','Hearth','(462) 678-3568','User','Kansas City- Kansas','07006','194.15.165.252',0,0,64);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('marcus18@douglas.info','Elisa Reyes','2002-12-03','123456a','Modernist','(491) 367-8515','User','San Diego- California','14150','133.64.218.7',0,0,65);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('mozelle.heathcote@yahoo.com','Madeline Weber','1993-06-17','11111111','Dekko','(440) 875-1572','Moderator','Miami- Florida','98801','21.85.233.61',0,0,66);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('murazik.liza@prosacco.com','Katie Walsh','2003-12-10','welcome','Perbacco','(537) 770-7396','Moderator','Atlanta- Georgia','98444','225.183.145.230',0,0,67);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('myriam.volkman@windler.com','Alma Mcgee','1994-10-07','112233','Skinnovation','(541) 675-4625','Owner','Chicago- Illinois','30126','202.42.2.203',0,0,68);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('nyost@altenwerth.com','Jane Bishop','1992-03-01','iloveyou','Tradition','(836) 452-1553','Host','San Antonio- Texas','98444','162.94.19.52',0,0,69);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('orville.haag@gottlieb.com','Dan Spencer','2010-11-16','131313','BAIT','(498) 985-5203','User','Kansas City- Kansas','07017','79.252.127.251',0,0,70);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('osbaldo21@hotmail.com','Lee Yates','2015-06-20','jordan23','Supernatural','(542) 798-5673','Owner','Texarkana- Arkansas','10451','191.183.77.66',0,0,71);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('paucek.laila@hotmail.com','Sean Mcdonald','2006-05-21','jesus1','Amber','(443) 516-5327','Host','Phoenix- Arizona','30126','164.155.152.246',0,0,72);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('phoebe.kirlin@yahoo.com','Chad Hall','2010-11-16','shadow','Muka','(804) 766-9508','Moderator','Los Angeles- California','40356','133.64.218.7',0,0,73);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('plakin@yahoo.com','Salvador Perry','1991-01-22','asdasd','Jackalope','(627) 398-1381','User','Staunton- Virginia','10451','202.42.2.203',0,0,74);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('qschroeder@hotmail.com','Melissa Goodwin','1998-05-31','welcome','MaSo','(937) 922-4512','Host','Charlottesville- Virginia','01923','91.195.59.103',0,0,75);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('reba.gislason@gmail.com','Roland Wright','1994-05-07','FQRG7CS493','Hanaro','(703) 472-9162','Moderator','Richmond- Virginia','37343','202.42.2.203',0,0,76);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('rebekah28@hotmail.com','Kenny Fox','1999-04-13','11111111','Kahnfections','(372) 489-6636','Host','Seattle- Washington','08043','218.51.235.104',0,0,77);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('robel.reba@hotmail.com','Corey Gutierrez','2009-11-30','1234','Earthbody','(443) 516-5327','Owner','Atlanta- Georgia','22405','194.15.165.252',0,0,78);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('sam87@hotmail.com','Edna Alexander','2006-08-02','1qaz2wsx','Redford','(913) 901-5938','Moderator','Las Vegas- Nevada','01923','40.197.231.196',0,0,79);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('samson.schaefer@kessler.com','Elisa Reyes','2003-07-13','jordan23','Wish','(494) 595-1500','Host','Waco- Texas','47130','3.220.186.237',0,0,80);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('savannah35@batz.biz','Ada Figueroa','1991-12-09','fuckyou1','Skinworx','(440) 875-1572','Host','Waco- Texas','16335','194.15.165.252',0,0,81);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('sawayn.raymundo@abshire.com','Elias Wheeler','1993-03-23','monkey','Grasslands','(271) 813-6726','Owner','Texarkana- Arkansas','60068','239.124.113.156',0,0,82);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('susan66@robel.com','Katie Walsh','1995-12-06','000000','BLOW','(883) 433-9817','Moderator','Atlanta- Georgia','93555','227.214.141.212',0,0,83);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('swaniawski.shayna@yahoo.com','Pearl Sutton','2009-04-22','baseball','Mezcalito','(439) 240-6348','Moderator','Salt Lake City- Utah','22405','111.214.164.56',0,0,84);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('swift.blanche@gmail.com','Opal Moreno','2005-09-12','qwerty','Picaro','(627) 398-1381','Moderator','Dallas- Texas','06010','202.42.2.203',0,0,85);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('tillman.citlalli@gmail.com','Ruth Gardner','2009-02-19','qwerty1','Goforaloop','(491) 367-8515','Host','Kansas City- Kansas','22405','182.42.77.81',0,0,86);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('tlangworth@hotmail.com','Shannon Mcbride','1993-03-23','asdf','ABV','(372) 489-6636','User','Las Vegas- Nevada','83651','9.217.252.158',0,0,87);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('twila70@hotmail.com','Kristy Hunter','2015-10-28','12345a','CAPITAL','(498) 985-5203','User','Miami- Florida','46321','174.73.222.116',0,0,88);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('usporer@gmail.com','Mark Morrison','1994-02-15','jennifer','Vertigo','(836) 452-1553','Owner','Lubbock- Texas','18966','218.51.235.104',0,0,89);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('vcummerata@gmail.com','Edna Alexander','2005-05-31','hello1','Dekko','(869) 672-4615','Moderator','Las Vegas- Nevada','46077','3.220.186.237',0,0,90);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('velda.leffler@koss.biz','Mark Morrison','2011-02-02','monkey','VOILA','(443) 516-5327','User','San Antonio- Texas','70001','92.87.222.84',0,0,91);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('wehner.adella@gmail.com','Martha Williamson','2011-02-02','homelesspa','Jaxson','(883) 433-9817','Host','Los Angeles- California','07006','92.87.222.84',0,0,92);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('weissnat.alfonzo@yahoo.com','Roland Wright','1996-12-26','joshua','Tradition','(498) 985-5203','Moderator','Denver- Colorado','46077','145.124.110.185',0,0,93);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('wilkinson.elinor@yahoo.com','Mark Morrison','2009-04-22','1qaz2wsx','hugomento','(491) 367-8515','User','Chicago- Illinois','42431','31.144.4.102',0,0,94);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('wisozk.maritza@gmail.com','Ernestine Cross','2002-12-03','888888','Hakkasan','(537) 770-7396','User','New York City- New York','64151','31.144.4.102',0,0,95);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('wolf.mossie@yahoo.com','Jimmie Gray','1997-10-06','123456a','Blackthorn','(335) 473-3573','User','Lubbock- Texas','46321','174.73.222.116',0,0,96);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('wunsch.brando@schoen.com','Kerry Love','2012-07-02','lovely','Redford','(733) 383-6508','User','Charlotte- North Carolina','59101','31.144.4.102',0,0,97);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('xlang@wilderman.com','Luke Burke','1996-12-26','jordan','artocrat','(498) 985-5203','User','Baltimore- Maryland','92083','111.214.164.56',0,0,98);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('yadira52@hotmail.com','Donnie Patrick','1995-12-06','hello','Starbelly','(542) 798-5673','Host','Staunton- Virginia','08527','184.120.49.250',0,0,99);
INSERT IGNORE INTO `User` (`email`,`name`,`dob`,`password`,`company`,`phone_number`,`role`,`location`,`zip_code`,`ip_address`,`tagged_user`,`is_host`,`User_id`) VALUES ('ypouros@schiller.com','Cecil Logan','2005-11-16','lovely','Spruce','(491) 367-8515','User','San Diego- California','98801','93.154.230.78',0,0,100);


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







