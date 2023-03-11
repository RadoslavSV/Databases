--1 a)
--CREATE TABLE Product2(
--  maker CHAR(1) NOT NULL ,
--  model CHAR(4) NOT NULL ,
--  type VARCHAR(7) NOT NULL 
--);

--CREATE TABLE Printer2(
--  code INT NOT NULL,
--  model CHAR(4) NOT NULL,
--  price DECIMAL(5,2) NOT NULL
--);


--1 á)
--INSERT INTO Product2
--VALUES('T','2774','Laptop');
--INSERT INTO Product2
--VALUES('G','1004','PC');
--INSERT INTO Printer2
--VALUES(778,'3055',400);


--1 â)
--ALTER TABLE Printer2 ADD type VARCHAR(6);

--ALTER TABLE Printer2 ADD color CHAR(1);


--1 ã)
--ALTER TABLE Printer2 DROP COLUMN price;


--1 ä)
--DROP TABLE Product2;
--DROP TABLE Printer2;






--2
--CREATE TABLE Users(
--  id INTEGER NOT NULL,
--  email VARCHAR(60) NOT NULL,
--  password VARCHAR(20) NOT NULL,
--  dateRegistered CHAR(10) NOT NULL
--);
--INSERT INTO Users
--VALUES(1,'ivan.ivanov1995@gmail.com','78787878','03-10-2016');
--INSERT INTO Users
--VALUES(105,'georgi.skeleta@mail.bg','skeleta','18-07-1956');
--INSERT INTO Users
--VALUES(20016440,'barbie_girl@abv.bg','123654','14-05-2007');


--CREATE TABLE Friends(
--  friend_one INTEGER NOT NULL,
--  friend_two INTEGER NOT NULL
--);
--INSERT INTO Friends
--VALUES(1,105);
--INSERT INTO Friends
--VALUES(105,20016440);


--CREATE TABLE Walls(
--  receiver_Id INTEGER NOT NULL,
--  sender_Id INTEGER NOT NULL,
--  text VARCHAR(150) NOT NULL,
--  date CHAR(10) NOT NULL
--);
--INSERT INTO Walls
--VALUES(1,105,'Yavete se na izpit po OS.','20-04-2020');


--CREATE TABLE Groups(
--  id INTEGER NOT NULL,
--  name VARCHAR(20) NOT NULL,
--  description VARCHAR(50) DEFAULT ''
--);
--INSERT INTO Groups
--VALUES(55,'KKK','Nie sme Ku Klux Klan');
--INSERT INTO Groups
--VALUES(12,'The New Group','');


--CREATE TABLE GroupMembers(
--  group_Id INTEGER NOT NULL,
--  member_Id INTEGER NOT NULL
--);
--INSERT INTO GroupMembers
--VALUES(55,105);
--INSERT INTO GroupMembers
--VALUES(55,20016440);


--SELECT *
--FROM Users
--SELECT *
--FROM Friends
--SELECT *
--FROM Walls
--SELECT *
--FROM Groups
--SELECT *
--FROM GroupMembers