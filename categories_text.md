use master
GO

DROP DATABASE  IF Exists The_Better_Team_DB 
GO

CREATE DATABASE  The_Better_Team_DB
GO

CREATE TABLE Categories(
	 Cat_ID tinyint NOT NULL PRIMARY KEY
	,Burgers varchar(26) NULL
	,Dogs varchar(26) NULL
	,Sandwiches varchar(26) NULL
	,Fries varchar(26) NULL
	,Drinks varchar(26) NULL
	,Milkshakes varchar(26) NULL
	,FK_Order_ID varchar(26) NULL
);
