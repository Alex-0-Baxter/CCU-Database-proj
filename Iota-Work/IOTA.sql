use master
GO

DROP DATABASE  IF Exists The_Better_Team_DB 
GO

CREATE DATABASE  The_Better_Team_DB
GO

DROP Table IF exists dbo.Categories
GO

CREATE TABLE dbo.Categories (
    Cat_ID tinyint NOT NULL PRIMARY KEY,
    FK_Burgers_ID int NULL,
    FK_DogType_ID int NULL,
    FK_Sandwich_ID int NULL,
    FK_Fries_ID int NULL,
    FK_Drink_ID int NULL,
    FK_Shake_ID int NULL,
    FK_Topping_ID int NULL
    --FK_Order_ID varchar(26) NULL
);

/*
ALTER TABLE Categories
ADD FOREIGN KEY (FK_Burgers_ID) REFERENCES Burgers(Burgers_ID); 
ALTER TABLE Categories
ADD FOREIGN KEY (FK_DogType_ID) REFERENCES Dogs(DogType_ID); 

ALTER TABLE Categories
ADD FOREIGN KEY (FK_Sandwich_ID) REFERENCES Sandwiches(Sandwich_ID); 

ALTER TABLE Categories
ADD FOREIGN KEY (FK_Fries_ID) REFERENCES Fries(Fries_ID); 

ALTER TABLE Categories
ADD FOREIGN KEY (FK_Drink_ID) REFERENCES Drinks(Drink_ID); 

ALTER TABLE Categories
ADD FOREIGN KEY (FK_Shake_ID) REFERENCES Milkshakes(Shake_ID); 

ALTER TABLE Categories
ADD FOREIGN KEY (FK_Topping_ID) REFERENCES Toppings(Topping_ID); 
*/

/* Mason's Work: Burgers & Fries Below */
DROP Table IF exists dbo.Burgers
GO

CREATE TABLE dbo.Burgers (
	Burgers_ID int IDENTITY PRIMARY KEY,
	BurgerName varchar(35) not null,
	Cals varchar(10) default(0) not null,
	Carbs nchar(10) default(0) not null,
	TotalFat nchar(10) default(0) not null,
	Sodium smallint default(0) null,
	[Description] varchar(500) null
	);
GO

DROP Table IF exists dbo.Dogs
GO
CREATE TABLE dbo.Dogs(
	DogType_ID INT IDENTITY PRIMARY KEY
	,DogName varchar(30) NOT NULL
	,Price nchar(10) default(0) NOT NULL
	,Cals varchar(10) default(0) NOT NULL
	,Carbs varchar(10) default(0) NOT NULL
	,Sodium varchar(10) default(0) NOT NULL
	,DogDescription varchar(2000) NULL
);
GO

DROP Table IF exists dbo.Sandwiches
GO

CREATE TABLE dbo.Sandwiches (
	 Sandwich_ID INT IDENTITY PRIMARY KEY
	,SandwichName varchar(30) NOT NULL
	,Price nchar(10) default(0) NULL
	,Cals varchar(10) default(0) NOT NULL
	,Carbs varchar(10) default(0) NOT NULL
	,TotalFat varchar(10) default(0) not null
	,Sodium varchar(10) default(0) NOT NULL
	,SandwichDescription varchar(2000) NULL
);
GO

DROP Table IF exists dbo.Fries
GO

CREATE TABLE dbo.Fries (
	Fries_ID int IDENTITY PRIMARY KEY,
	FriesName varchar(30) not null,
	Cals varchar(10) default(0) not null,
	Carbs nchar(10) default(0) not null,
	TotalFat nchar(10) default(0) not null,
	Sodium smallint default(0) null,
	[Description] varchar(300) null
	);
GO

DROP Table IF exists dbo.Drinks
GO

CREATE TABLE dbo.Drinks (
	 Drink_ID INT IDENTITY PRIMARY KEY
	,DrinkName varchar(30) NULL
	,Price varchar(10) default(0) NULL
	,Cals varchar(10) default(0)  NULL
	--,DrinkDescription varchar(2000) NULL
);
GO

DROP Table IF exists dbo.Milkshakes
GO

CREATE TABLE dbo.Milkshakes (
	 Shake_ID INT IDENTITY PRIMARY KEY
	,ShakeName varchar(30) NOT NULL
	,Price nchar(10) default(0) NULL
	,Cals varchar(10) default(0) NOT NULL
	,Carbs varchar(10) default(0) NOT NULL
	,Sodium varchar(10) default(0) NOT NULL
	,ShakeDescription varchar(2000) NULL
);
GO

DROP Table IF exists dbo.Toppings
GO

CREATE TABLE dbo.Toppings (
	Topping_ID int IDENTITY PRIMARY KEY,
	ToppingName varchar(20) not null,
	Cals varchar(10) default(0) not null,
	Carbs nchar(10) default(0) not null,
	TotalFat nchar(10) default(0) not null,
	Sodium smallint default(0) null,
	[Description] varchar(150) null
	);
GO
/*
INSERT INTO Categories (Cat_ID, FK_Burgers_ID, FK_DogType_ID, FK_Sandwich_ID, FK_Fries_ID, FK_Drink_ID, FK_Shake_ID, FK_Topping_ID)
VALUES   (1, 1, 1, 1, 1, 1, 1, 1)
		,(2, 2, 2, 2, 2, 2, 2, 2);

GO
*/
INSERT INTO dbo.Burgers VALUES
	 ('Hamburger','840','39','43','430','Fresh, hand-formed patties hot off the grill and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.')
	,('Cheeseburger','980','40','55','1050','American-style cheese melted between fresh patties and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.')
	,('Bacon Burger','920','39','50','690','Hand-formed patties hot off the grill, layered with strips of crispy apple-wood smoked bacon and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.')
	,('Bacon Cheeseburger','1060','40','62','1310','Fresh patties hot off the grill with American-style cheese and crispy apple-wood smoked bacon. Placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.')
	,('Little Hamburger','540','39','26','380','Fresh, hand-formed patty hot off the grill. Add as many toppings as you want.')
	,('Little Cheeseburger','610','39.5','32','690','Fresh, hand-formed patty hot off the grill with American-style cheese. Add as many toppings as you want.')
	,('Little Bacon Burger','620','39','33','640','Fresh, hand-formed patty hot off the grill with strips of crispy apple-wood smoked bacon on top. Add as many toppings as you want.')
	,('Little Bacon Cheeseburger','690','39.5','39','950','Fresh, hand-formed patty hot off the grill with American-style cheese and strips of crispy apple-wood smoked bacon on top. Add as many toppings as you want.')
GO

INSERT INTO dbo.Dogs VALUES 
	 ('Hot Dog','7.79' , '520', '40','1103', 'All-beef hot dog, split and grilled lengthwise for a caramelized exterior with any of your favorite toppings.')
	,('Cheese Dog','8.89','590','40.5','1440', 'All-beef hot dog, split and grilled lengthwise for a caramelized exterior with a layer of American-style cheese on top and any of your favorite toppings')
	,('Bacon Dog','8.59','600','40','1390', 'All-beef hot dog, split and grilled lengthwise for a caramelized exterior with a layer of apple-wood smoked bacon and any of your favorite toppings')
	,('Bacon Cheese Dog','9.79','670','40.5','1700', 'All-beef hot dog, split and grilled lengthwise for a caramelized exterior, American-style cheese on top, a layer of apple-wood smoked bacon and any of your favorite toppings.')
GO

INSERT INTO dbo.Sandwiches VALUES 
	 ('Veggie Sandwich', '5.69', '280', '60', '15', '1040', 'Freshly grilled onions, mushrooms and green peppers layered with lettuce and tomatoes on a soft, toasted sesame seed bun. Or start with the bun and build your own from scratch. Not a veggie burger.')
	,('Cheese Veggie Sandwich', '6.79', '420', '60.7', '21', '1350', 'Freshly grilled onions, mushrooms and green peppers layered with lettuce, tomatoes and slices of American-style cheese on a soft, toasted sesame seed bun. Or start with the bun and cheese and build your own from scratch. Not a veggie burger.')
	,('Grilled Cheese', '6.49', '470', '41', '26', '715', 'Slices of American-style cheese melted on an inside-out sesame seed bun with toppings of your choice and grilled until golden brown.')
	,('BLT', '8.39', '600', '42', '34', '931', 'Strips of crispy apple-wood smoked bacon from one of America’s last smokehouses, fresh tomato slices, mayo and hand-shredded lettuce on a soft, toasted sesame seed bun.');
GO

INSERT INTO dbo.Fries VALUES
	 ('Five Guys Style','530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside.')
	,('Cajun Style','530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside.')
GO

INSERT INTO dbo.Drinks VALUES
	 ('Regular', '2.95', '0-360')
	,('Large', '3.25', '0-520')
	,('Dasani', '2.95', '0')
	,('Bottles', '3.50', '0-240')
	,('Coca-Cola', NULL, '240')
	,('Coca-Cola Zero', NULL, '0')
	,('Diet Coke', NULL, '0')
	,('Sprite', NULL, '240')
	,('Simply Lemonade', NULL, '160')
	
 GO

 INSERT INTO dbo.Milkshakes VALUES
	('Bacon','6.09','80','0','260','Crispy, sweet applewood-smoked bacon chopped and mixed for a salty crunch in your shake.')
	,('Bananas','6.09','30', '7-28','2-10','Real bananas in your handspun milkshake.')
	,('Strawberries','6.09','20','0','5-20','Fresh strawberries in homemade simple syrup.')
	,('Chocolate','6.09','40','8-32','10-39','Chocolate and fudge added to your handspun milkshake.')
	,('Oreo Cookies','6.09','65','10-40','53-210','Crushed Oreo Cookies mixed with creamy malt.')
	,('Penut Butter','6.09','90','4-16','110-440','Natural, creamy peanut butter with a touch of honey.')
	,('Salted Caramel','6.09','45','10-41','24-98','Sweet caramel with a savory kick.')
	,('Lotus Biscoff','6.09','0','0','0','Lotus’ classic caramelized cookie pieces.')
GO


INSERT INTO dbo.Toppings VALUES 
	 ('Mayo', '110', '0', '11', '70', 'A layer of mayonnaise, always evenly spread. Thick, smooth and never too much or too little, unless you ask for more or less!')
	,('Pickles', '5', '1', '0', '260', 'Five Mount Olive Pickles to bring that salty, briny, and crunchy texture to your Five Guys burger, dog or sandwich.')
	,('Tomoatoes', '10', '2', '0', '3', 'Two slices for an even tomato-to-bite ratio every time.')
	,('Lettuce', '5', '1', '0', '3', 'Our lettuce is torn by hand for optimum freshness and traction to hold the pickles on top.')
	,('Grilled Onions', '10', '2', '0', '1', 'Fresh onions, hand chopped and grilled on our flat top grill.')
	,('Grilled Mushrooms', '20', '1', '0', '55', 'Baby portobella mushrooms, hand picked and freshly packed. Grilled until golden for extra taste and body.')
	,('Ketchup', '30', '5', '0', '160', 'Heinz ketchup only, please.')
	,('Mustard', '0', '0', '0', '55', 'French’s mustard. You can always get extra sauce on the side – just ask.')
	,('Relish', '15', '4', '0', '85','Sweet and sour relish. ')
	,('Onions', '10', '2', '0','','Fresh, hand-chopped, and evenly spread.')
	,('Jalapeno Peppers', '5', '<1', '0', '0','Fresh Jalapeño peppers chopped in-house for the spiciest bite.')
	,('Green Peppers', '5', '1', '0', '1','A row of fresh, thinly sliced green peppers.')
	,('BAR-B-QUE Sauce', '50', '15', '0', '400', 'Rich, smoky Cattlemen’s Brand BBQ sauce.')
	,('Hot Sauce', '0', '0', '0', '200', 'Frank’s Original Hot Sauce – for an extra kick to your sandwiches.')
	,('A1 Sauce', '15', '3', '0', '280', 'The classic A1 Original Steak Sauce.')
GO




SELECT * FROM dbo.Categories
SELECT * FROM dbo.Burgers
SELECT * FROM dbo.Dogs
SELECT * FROM dbo.Sandwiches
SELECT * FROM dbo.Fries
SELECT * FROM dbo.Drinks
SELECT * FROM dbo.Milkshakes
SELECT * FROM dbo.Toppings
/*-*/
