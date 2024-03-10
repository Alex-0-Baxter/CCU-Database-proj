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
CREATE TABLE Dog (
	DogType_ID INT IDENTITY PRIMARY KEY
	,DogName varchar(30) NOT NULL
	,Price nchar(10) default(0) NOT NULL
	,Cals varchar(10) default(0) NOT NULL
	,Carbs varchar(10) default(0) NOT NULL
	,Sodium varchar(10) default(0) NOT NULL
	,DogDescription varchar(2000) NULL
);

CREATE TABLE Shake (
	Shake_ID INT IDENTITY PRIMARY KEY
	,ShakeName varchar(30) NOT NULL
	,Price nchar(10) default(0) NULL
	,Cals varchar(10) default(0) NOT NULL
	,Carbs varchar(10) default(0) NOT NULL
	,Sodium varchar(10) default(0) NOT NULL
	,DogDescription varchar(2000) NULL

);


INSERT INTO Dog VALUES 
	('Hot Dog','7.79' , '520', '40','1103', 'All-beef hot dog, split and grilled lengthwise for a caramelized exterior with any of your favorite toppings.'),
	('Cheese Dog','8.89','590','40.5','1440', 'All-beef hot dog, split and grilled lengthwise for a caramelized exterior with a layer of American-style cheese on top and any of your favorite toppings'),
	('Bacon Dog','8.59','600','40','1390', 'All-beef hot dog, split and grilled lengthwise for a caramelized exterior with a layer of apple-wood smoked bacon and any of your favorite toppings'),
	('Bacon Cheese Dog','9.79','670','40.5','1700', 'All-beef hot dog, split and grilled lengthwise for a caramelized exterior, American-style cheese on top, a layer of apple-wood smoked bacon and any of your favorite toppings.')
GO

INSERT INTO Shake VALUES
	('Bacon','6.09','80','0','260','Crispy, sweet applewood-smoked bacon chopped and mixed for a salty crunch in your shake.'),
	('Bananas','6.09','30', '7-28','2-10','Real bananas in your handspun milkshake.'),
	('Strawberries','6.09','20','0','5-20','Fresh strawberries in homemade simple syrup.'),
	('Chocolate','6.09','40','8-32','10-39','Chocolate and fudge added to your handspun milkshake.'),
	('Oreo Cookies','6.09','65','10-40','53-210','Crushed Oreo Cookies mixed with creamy malt.'),
	('Penut Butter','6.09','90','4-16','110-440','Natural, creamy peanut butter with a touch of honey.'),
	('Salted Caramel','6.09','45','10-41','24-98','Sweet caramel with a savory kick.'),
	('Lotus Biscoff','6.09','0','0','0','Lotus’ classic caramelized cookie pieces.')
GO

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


/* Mason's Work: Burgers & Fries Below */

CREATE TABLE Burgers (
			Burgers_ID int IDENTITY PRIMARY KEY,
			BurgerName varchar(20) not null,
			Cals varchar(10) default(0) not null,
			Carbs nchar(10) default(0) not null,
			TotalFat nchar(10) default(0) not null,
			Sodium smallint default(0) null,
			[Description] varchar(150) null
			);

INSERT INTO Burgers VALUES
	('Hamburger','840','39','43','430','Fresh, hand-formed patties hot off the grill and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.')
	,('Cheeseburger','980','40','55','1050','American-style cheese melted between fresh patties and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.')
	,('Bacon Burger','920','39','50','690','Hand-formed patties hot off the grill, layered with strips of crispy apple-wood smoked bacon and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.')
	,('Bacon Cheeseburger','1060','40','62','1310','Fresh patties hot off the grill with American-style cheese and crispy apple-wood smoked bacon. Placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.')
	,('Little Hamburger','540','39','26','380','Fresh, hand-formed patty hot off the grill. Add as many toppings as you want.')
	,('Little Cheeseburger','610','39.5','32','690','Fresh, hand-formed patty hot off the grill with American-style cheese. Add as many toppings as you want.')
	,('Little Bacon Burger','620','39','33','640','Fresh, hand-formed patty hot off the grill with strips of crispy apple-wood smoked bacon on top. Add as many toppings as you want.')
	,('Little Bacon Cheeseburger','690','39.5','39','950','Fresh, hand-formed patty hot off the grill with American-style cheese and strips of crispy apple-wood smoked bacon on top. Add as many toppings as you want.')
GO

CREATE TABLE Fries (
			Fries_ID int IDENTITY PRIMARY KEY,
			FriesName varchar(30) not null,
			Cals varchar(10) default(0) not null,
			Carbs nchar(10) default(0) not null,
			TotalFat nchar(10) default(0) not null,
			Sodium smallint default(0) null,
			[Description] varchar(300) null
			);

INSERT INTO Fries VALUES
	('Five Guys Style','530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside.')
	,('Cajun Style','530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside.')
GO

/*-*/