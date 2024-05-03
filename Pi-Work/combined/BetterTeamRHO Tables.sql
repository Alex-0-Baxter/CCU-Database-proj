USE master
GO

DROP DATABASE IF EXISTS teamBetter_Pi

CREATE DATABASE teamBetter_Pi
GO

USE teamBetter_Pi
GO

/* This query is for all the tables for Better Team. It does NOT include any procedures/etc. */

/* Burgers, Fries, Employees & Timecard, etc. TABLES */

DROP Table IF exists dbo.Categories
GO


/*CREATE TABLE Category (
	[Ca_ID] INT IDENTITY PRIMARY KEY,
	[Category] [varchar](20) NOT NULL
);
GO*/


CREATE TABLE dbo.Categories (
    Cat_ID tinyint NOT NULL PRIMARY KEY,
    FK_Burgers_ID int NULL,
    FK_DogType_ID int NULL,
    FK_Sandwich_ID int NULL,
    FK_Fries_ID int NULL,
    FK_Drink_ID int NULL,
    FK_Shake_ID int NULL,
    FK_Topping_ID int NULL,
    FK_Order_ID varchar(26) NULL
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



DROP Table IF exists dbo.Burgers
GO

CREATE TABLE dbo.Burgers (
	Burgers_ID int IDENTITY PRIMARY KEY,
	BurgerName varchar(35) not null,
	Price int not null,
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
	,ShakeDescription varchar(2000) NULL
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
	 ('Hamburger','1','840','39','43','430','Fresh, hand-formed patties hot off the grill and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.')
	,('Cheeseburger','2','980','40','55','1050','American-style cheese melted between fresh patties and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.')
	,('Bacon Burger','3','920','39','50','690','Hand-formed patties hot off the grill, layered with strips of crispy apple-wood smoked bacon and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.')
	,('Bacon Cheeseburger','4','1060','40','62','1310','Fresh patties hot off the grill with American-style cheese and crispy apple-wood smoked bacon. Placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.')
	,('Little Hamburger','5','540','39','26','380','Fresh, hand-formed patty hot off the grill. Add as many toppings as you want.')
	,('Little Cheeseburger','6','610','39.5','32','690','Fresh, hand-formed patty hot off the grill with American-style cheese. Add as many toppings as you want.')
	,('Little Bacon Burger','7','620','39','33','640','Fresh, hand-formed patty hot off the grill with strips of crispy apple-wood smoked bacon on top. Add as many toppings as you want.')
	,('Little Bacon Cheeseburger','8','690','39.5','39','950','Fresh, hand-formed patty hot off the grill with American-style cheese and strips of crispy apple-wood smoked bacon on top. Add as many toppings as you want.')
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

--- Timecard/Clock procedures on other sql file

/* Shifts, Employees, timecard and positions */


/*ALTER TABLE Employees
DROP CONSTRAINT FK_PositionID;

-- Now you can drop the Positions table
DROP TABLE IF EXISTS Positions;

-- Drop the Employees table
DROP TABLE IF EXISTS Employees;*/


CREATE TABLE Positions (
	PositionID int IDENTITY PRIMARY KEY,
	PositionName varchar(255) NOT NULL
);



CREATE TABLE Employees (
	Employee_ID int IDENTITY PRIMARY KEY,
	PositionID int NOT NULL,
	Username varchar(255) NOT NULL,
	Pin varchar(4) NOT NULL,
	FirstName varchar(255) NOT NULL,
	LastName varchar(255) NOT NULL,
	FOREIGN KEY (PositionID) REFERENCES Positions(PositionID),
	[CreateDateTime] datetime DEFAULT GETDATE(),
	[ModifiedDateTime] datetime DEFAULT GETDATE()
);

INSERT INTO Positions (PositionName) VALUES ('Cook');
INSERT INTO Positions (PositionName) VALUES ('Server');
INSERT INTO Positions (PositionName) VALUES ('Cashier');
INSERT INTO Positions (PositionName) VALUES ('Manager');
INSERT INTO Positions (PositionName) VALUES ('Owner');

DROP TABLE if EXISTS Shifts

CREATE TABLE Shifts (
    Shift_ID int IDENTITY PRIMARY KEY,
    Employee_ID int NOT NULL,
    PositionID int NOT NULL,
    StartTime datetime NOT NULL,
    EndTime datetime NOT NULL,
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID),
    FOREIGN KEY (PositionID) REFERENCES Positions(PositionID),
    CreateDateTime datetime DEFAULT GETDATE(),
    ModifiedDateTime datetime DEFAULT GETDATE()
);

DROP TABLE if EXISTS Timecard

CREATE TABLE Timecard (
    Timecard_ID int IDENTITY PRIMARY KEY,
    Employee_ID int NOT NULL,
    Shift_ID int NOT NULL,
    CheckInTime datetime NOT NULL,
    CheckOutTime datetime NOT NULL,
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID),
    FOREIGN KEY (Shift_ID) REFERENCES Shifts(Shift_ID),
    CreateDateTime datetime DEFAULT GETDATE(),
    ModifiedDateTime datetime DEFAULT GETDATE()
);





/* Placement Table */

drop table if exists Placement

CREATE TABLE Placement (
	Catagory NVARCHAR(25),--FK_Catagories NVARCHAR(25) PRIMARY KEY, when I have a catagory table I this will be an FK
    MenuOrder  NVARCHAR(25),
	IconOrder  NVARCHAR(25)
); 

INSERT INTO Placement (Catagory, IconOrder, MenuOrder) VALUES
('Burger'              , 1, 2),
('Dogs'                , 2, 3),
('Drinks'              , 3, 4),
('Fries'               , 4, 5),
('Milkshake Mix-Ins'   , 5, 6),
('Sandwiches'          , 6, 7),
('Toppings'            , 7, 8),
('Large Orders'        , 0, 1),
('Specialty Orders'    , 0, 9);

/* Category/Inventory Tables w/ fk from Diego? Don't we already have categories? */

DROP Table IF exists Inventory
GO

CREATE TABLE dbo.Inventory (
    Inventory_ID int IDENTITY PRIMARY KEY,
    Ingredient VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    Food_Item VARCHAR(50) NOT NULL,
    Category_Item_ID tinyint,
);
GO

INSERT INTO dbo.Inventory (Ingredient, Quantity, Food_Item, Category_Item_ID)
VALUES 
    -- Burgers
    ('Ground Beef', 500, 'Burger', 1),
    ('Cheese', 200, 'Burger', 1),
    ('Bacon', 100, 'Burger', 1),
    ('Lettuce', 200, 'Burger', 1),
    ('Tomato', 150, 'Burger', 1),
    ('Onion', 100, 'Burger', 1),
    ('Pickles', 100, 'Burger', 1),
    ('Bun', 400, 'Burger', 1),
    -- Hot Dogs
    ('Hot Dog', 300, 'Hot Dog', 2),
    ('Hot Dog Bun', 400, 'Hot Dog', 2),
    -- Sandwiches
    -- (Assuming no specific ingredients for sandwiches are mentioned)
    -- Fries
    ('French Fries', 800, 'Fries', 4),
    ('Peanuts', 200, 'Fries', 4),
    -- Drinks
    ('Soda', 500, 'Drink', 5),
    ('Iced Tea', 400, 'Drink', 5),
    -- Shakes
    ('Vanilla Ice Cream', 200, 'Shake', 6),
    ('Chocolate Ice Cream', 200, 'Shake', 6),
    ('Strawberry Ice Cream', 200, 'Shake', 6),
    ('Milk', 300, 'Shake', 6),
    ('Whipped Cream', 200, 'Shake', 6),
    ('Cherry', 150, 'Shake', 6),
    -- Toppings
    ('Mayo', 150, 'Topping', 7),
    ('Ketchup', 200, 'Topping', 7),
    ('Mustard', 100, 'Topping', 7),
    ('Relish', 100, 'Topping', 7),
    ('Onions', 150, 'Topping', 7),
    ('Jalapeno Peppers', 100, 'Topping', 7),
    ('Green Peppers', 100, 'Topping', 7),
    ('BAR-B-QUE Sauce', 200, 'Topping', 7),
    ('Hot Sauce', 150, 'Topping', 7),
    ('A1 Sauce', 100, 'Topping', 7);
GO

----------------------
--- ^ALL GOOD ABOVE^
-----------------------

/* Menu Orders, itemss, etc */

/*CREATE TABLE Category (
	[Ca_ID] INT IDENTITY PRIMARY KEY,
	[Category] [varchar](20) NOT NULL
);
GO*/

/*INSERT INTO Category(Category) VALUES 
('Burgers'),('Dogs'),('Drinks'),('Fries'),('Shakes'),('Sandwiches'),
('Mixins'),('Toppings'),('MenuText'),('Special'),('Large')
GO */

DROP TABLE IF exists OrderStatus
Go

CREATE TABLE OrderStatus(
	[StatusID] INT IDENTITY PRIMARY KEY NOT NULL, 
	[ItemStatus] VARCHAR(12) NOT NULL
);
GO

INSERT INTO OrderStatus VALUES
('Ordering'),('Queued'),('Cooking'),('Completed'),
('Bagged'),('Picked-up'),('Abandoned')
GO

DROP TABLE IF exists Orders
Go

CREATE SEQUENCE AssignTicket
	START With 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 99
	CYCLE
;

CREATE TABLE Orders (
	[OrderID] INT IDENTITY PRIMARY KEY NOT NULL, 
	Ticket INT DEFAULT (NEXT VALUE FOR AssignTicket), 
	[CustomerName] [varchar](30) DEFAULT (NULL),
	[fk_OrderStatus] INT REFERENCES OrderStatus(StatusID),
	[CreateDateTime] datetime DEFAULT GETDATE(),
	[ModifiedDateTime] datetime DEFAULT GETDATE()
);
GO

DROP TABLE IF exists MenuItems
GO

CREATE TABLE MenuItems2 (
   menuItemID2 int IDENTITY PRIMARY KEY,
   MenuName VARCHAR(30) UNIQUE NOT NULL,
   fk_Category tinyint FOREIGN KEY REFERENCES dbo.Categories(Cat_ID),
   Price SMALLMONEY NULL,
   Calories VARCHAR(8) DEFAULT(''),
   Carbs VARCHAR(8) DEFAULT(''),
   Fat VARCHAR(8) DEFAULT(''),
   Sodium VARCHAR(8) DEFAULT(''),
   MenuDescription VARCHAR(500) NULL,
   [CreateDateTime] datetime DEFAULT GETDATE(),
   [ModifiedDateTime] datetime DEFAULT GETDATE()
);
GO
INSERT INTO MenuItems2 (MenuName, Price, Calories, Carbs, Fat, Sodium, MenuDescription) VALUES
('Hamburger',9.19,'840','39','43','430','Fresh, hand-formed patties hot off the grill and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.'),
('Cheeseburger',9.99,'980','40','55','1050','American style cheese melted between fresh patties and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.'),
('Bacon Burger',10.29,'920','39','50','690','Hand-formed patties hot off the grill, layered with strips of crispy apple-wood smoked bacon and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.'),
('Bacon Cheeseburger',10.96,'1060','40','62','1310','Fresh patties hot off the grill with American style cheese and crispy apple-wood smoked bacon. Placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.'),
('Little Hamburger',6.69,'540','39','26','380','Fresh, hand-formed patty hot off the grill. Add as many toppings as you want.'),
('Little Cheeseburger',7.89,'610','39.5','39','950','Fresh, hand-formed patty hot off the grill with American-style cheese. Add as many toppings as you want.'),
('Little Bacon Burger',8.19,'620','39','33','640','Fresh, hand-formed patty hot off the grill with strips of crispy apple-wood smoked bacon on top. Add as many toppings as you want.'),
('Little Bacon Cheeseburger',8.99,'690','39.5','39','950','Fresh, hand-formed patty hot off the grill with American-style cheese and strips of crispy apple-wood smoked bacon on top. Add as many toppings as you want.'),
('Hot Dog',6.39,'520','40','35','1130','All-beef hot dog, split and grilled lengthwise for a caramelized exterior with any of your favorite toppings.'),
('Cheese Dog',7.29,'590','40.5','41','700','All-beef hot dog, split and grilled lengthwise for a caramelized exterior with a layer of American-style cheese on top and any of your favorite toppings.'),
('Bacon Dog',7.69,'600','40','42','1390','All-beef hot dog, split and grilled lengthwise for a caramelized exterior with a layer of apple-wood smoked bacon and any of your favorite toppings'),
('Bacon Cheese Dog',8.49,'60','40.5','48','1700','All-beef hot dog, split and grilled lengthwise for a caramelized exterior, American-style cheese on top, a layer of apple-wood smoked bacon and any of your favorite toppings.'),
('Regular Drink',2.89,'0','0','0','0',''),
('Large Drink',3.29,'0','0','0','0',''),
('Bottled Water',5.59,'0','0','0','0',''),
('Honest Tea Bottle',3.19,'0','0','0','0',''),
('Simply Lemonade Bottle',3.19,'0','0','0','0',''),
('Coke Bottle',3.19,'0','0','0','0',''),
('Diet Coke Bottle',3.19,'0','0','0','0',''),
('Small Drink',3.19,'0','0','0','0',''),
('Little Fries',4.19,'530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside. '),
('Little Cajun Fries',4.19,'530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside. '),
('Regular Fries',5.49,'530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside. '),
('Cajun Fries',5.49,'530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside. '),
('Large Fries',6.99,'530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside. '),
('Large Cajun Fries',6.99,'530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside. '),
('Shakes',5.99,'20-82','5-19','0','3-11','Rich, smooth.'),
('VEGGIE SANDWICH',8.5,'280','60','15','1040','Freshly grilled onions, mushrooms and green peppers layered with lettuce and tomatoes on a soft, toasted sesame seed bun. Or start with the bun and build your own from scratch. Not a veggie burger.'),
('CHEESE VEGGIE SANDWICH',10.5,'420','60.7','21','1350','Freshly grilled onions, mushrooms and green peppers layered with lettuce, tomatoes and slices of American-style cheese on a soft, toasted sesame seed bun. Or start with the bun and cheese and build your own from scratch. Not a veggie burger.'),
('GRILLED CHEESE',7.5,'470','41','26','715','Slices of American-style cheese melted on an inside-out sesame seed bun with toppings of your choice and grilled until golden brown.'),
('BLT',7.5,'600','42','34','931','Strips of crispy apple-wood smoked bacon from one of America’s last smokehouses, fresh tomato slices, mayo and hand-shredded lettuce on a soft, toasted sesame seed bun.'),
('Bacon',0,'80','0','7','260','Crispy, sweet applewood-smoked bacon chopped and mixed for a salty crunch in your shake.'),
('Bananas',0,'30','7-28','0','2-10','Real bananas in your handspun milkshake.'),
('Reese''s Cups',0,'150','16','8','98','REESE''S classic combination of chocolate and peanut butter.'),
('Strawberries',0,'20','0','0','5-20','Fresh strawberries in homemade simple syrup.'),
('Chocolate',0,'40','8-32','1-4','10-39','Chocolate and fudge added to your handspun milkshake.'),
('MALTED MILK',0,'60','10-40','1-5','67-268','An old school American classic.'),
('OREO COOKIES',0,'65','10-40','3-10','53-210','Crushed Oreo Cookies mixed with creamy malt.'),
('PEANUT BUTTER',0,'90','4-16','7.5-30','110-440','Crispy, sweet applewood-smoked bacon chopped and mixed for a salty crunch in your shake.'),
('SALTED CARAMEL',0,'45','10-41','0-1','24-98','Sweet caramel with a savory kick.'),
('VANILLA',0,'20-82','5-19','0','3-11','Rich, smooth vanilla.'),
('Mayo',0,'110','0','11','70','A layer of mayonnaise, always evenly spread. Thick, smooth and never too much or too little, unless you ask for more or less!'),
('Lettuce',0,'5','1','0','3','Our lettuce is torn by hand for optimum freshness and traction to hold the pickles on top.'),
('Pickles',0,'5','1','0','260','Five Mount Olive Pickles to bring that salty, briny, and crunchy texture to your Five Guys burger, dog or sandwich.'),
('Tomatoes',0,'10','2','0','3','Two slices for an even tomato-to-bite ratio every time.'),
('Grilled Onions',0,'10','2','0','1','Fresh onions, hand chopped and grilled on our flat top grill.'),
('Grilled Mushrooms',0,'20','1','0','55','Baby portobella mushrooms, hand picked and freshly packed. Grilled until golden for extra taste and body.'),
('Ketchup',0,'30','5','0','160','Heinz ketchup only, please.'),
('Mustard',0,'0','0','0','55','French’s mustard. You can always get extra sauce on the side – just ask.'),
('Relish',0,'15','4','0','85','Sweet and sour relish.'),
('Onions',0,'10','2','0','0','Fresh, hand-chopped, and evenly spread.'),
('Jalapeno Peppers',0,'5','<1','0','0','Fresh Jalapeño peppers chopped in-house for the spiciest bite.'),
('Green Peppers',0,'5','1','0','1','A row of fresh, thinly sliced green peppers.'),
('Bar-b-Que Sauce',0,'50','15','0','400','Rich, smoky Cattlemen’s Brand BBQ sauce.'),
('Hot Sauce',0,'0','0','0','1','Frank’s Original Hot Sauce – for an extra kick to your sandwiches.'),
('A1 Sauce',0,'15','3','0','280','The classic A1 Original Steak Sauce.'),
('NO BUN (BOWL)',0,'15','3','0','280',''),
('NO BUN (LETTUCE)',0,'15','3','0','280',''),
('Plain',0,'','','','',''),
('Add Patty',2.22,'','','','','')
GO

DROP TABLE IF EXISTS Items
GO

CREATE TABLE Items(
	ItemID INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
	fk_OrderID INT REFERENCES Orders(OrderID) ON DELETE CASCADE,
	fk_MenuItem INT REFERENCES MenuItems2(MenuItemID2),
	Quantity SMALLINT NOT NULL
)
GO

DROP TABLE IF EXISTS Extras
GO

CREATE TABLE Extras (
	[ExtraID] [int] IDENTITY(1,1)  PRIMARY KEY NOT NULL,
	[fk_Item] [int] REFERENCES [dbo].[Items] ([ItemID]),
	[fk_MenuItem] [int] REFERENCES [dbo].[MenuItems2] ([menuItemID2]),
	ExtraName VARCHAR(20) NULL
)
GO

/* END */ ------------------------------
