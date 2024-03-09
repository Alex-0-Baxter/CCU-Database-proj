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
	,Toppings varchar(26) NULL
	,FK_Order_ID varchar(26) NULL
);

CREATE TABLE Toppings (
			Topping_ID int IDENTITY PRIMARY KEY,
			ToppingName varchar(20) not null,
			Cals varchar(10) default(0) not null,
			Carbs nchar(10) default(0) not null,
			TotalFat nchar(10) default(0) not null,
			Sodium smallint default(0) null,
			[Description] varchar(150) null
			);

CREATE TABLE Sandwhiches (
			Sandwich_ID int IDENTITY PRIMARY KEY,
			SandwhichName varchar(30) not null,
			Cals varchar(10) default(0) not null,
			Carbs nchar(10) default(0) not null,
			TotalFat nchar(10) default(0) not null,
			Sodium smallint default(0) null,
			[Description] varchar(300) null
			);

INSERT INTO Toppings VALUES ('Mayo', '110', '0', '11', '70', 'A layer of mayonnaise, always evenly spread. Thick, smooth and never too much or too little, unless you ask for more or less!');
INSERT INTO Toppings VALUES ('Lettuce', '5', '1', '0', '3', 'Our lettuce is torn by hand for optimum freshness and traction to hold the pickles on top.');
INSERT INTO Toppings VALUES ('Pickles', '5', '1', '0', '260', 'Five Mount Olive Pickles to bring that salty, briny, and crunchy texture to your Five Guys burger, dog or sandwich.');
INSERT INTO Toppings VALUES ('Tomoatoes', '10', '2', '0', '3', 'Two slices for an even tomato-to-bite ratio every time.');
INSERT INTO Toppings VALUES ('Grilled Onions', '10', '2', '0', '1', 'Fresh onions, hand chopped and grilled on our flat top grill.');
INSERT INTO Toppings VALUES ('Grilled Mushrooms', '20', '1', '0', '55', 'Baby portobella mushrooms, hand picked and freshly packed. Grilled until golden for extra taste and body.');
INSERT INTO Toppings VALUES ('Ketchup', '30', '5', '0', '160', 'Heinz ketchup only, please.');
INSERT INTO Toppings VALUES ('Mustard', '0', '0', '0', '55', 'French’s mustard. You can always get extra sauce on the side – just ask.');
INSERT INTO Toppings VALUES ('Relish', '15', '4', '0', '85','Sweet and sour relish. ');
INSERT INTO Toppings VALUES ('Onions', '10', '2', '0','','Fresh, hand-chopped, and evenly spread.');
INSERT INTO Toppings VALUES ('Jalapeno Peppers', '5', '<1', '0', '0','Fresh Jalapeño peppers chopped in-house for the spiciest bite.');
INSERT INTO Toppings VALUES ('Green Peppers', '5', '1', '0', '1','A row of fresh, thinly sliced green peppers.');
INSERT INTO Toppings VALUES ('BAR-B-QUE Sauce', '50', '15', '0', '400', 'Rich, smoky Cattlemen’s Brand BBQ sauce.');
INSERT INTO Toppings VALUES ('Hot Sauce', '0', '0', '0', '200', 'Frank’s Original Hot Sauce – for an extra kick to your sandwiches.');
INSERT INTO Toppings VALUES ('A1 Sauce', '15', '3', '0', '280', 'The classic A1 Original Steak Sauce.');
