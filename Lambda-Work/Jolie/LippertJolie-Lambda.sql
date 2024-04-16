USE master
GO

DROP DATABASE IF EXISTS The_Better_Team_DB
GO

CREATE DATABASE The_Better_Team_DB
GO

USE The_Better_Team_DB
GO
--SEQUENCE USED IN TICKET (0-99)
CREATE SEQUENCE AssignTicket
	START With 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 99
	CYCLE
;

CREATE TABLE Categories (
	[ID] INT IDENTITY PRIMARY KEY,
	[Category] [varchar](20) NOT NULL
);
GO
INSERT INTO Categories (Category) VALUES 
('Burgers'),('Dogs'),('Drinks'),('Fries'),('Shakes'),('Sandwiches'),
('Mixins'),('Toppings'),('MenuText'),('Special'),('Large')
GO

CREATE TABLE OrderStatus(
	[StatusID] INT IDENTITY PRIMARY KEY NOT NULL, 
	[ItemStatus] VARCHAR(12) NOT NULL
);
GO
INSERT INTO OrderStatus VALUES
('Ordering'),('Queued'),('Cooking'),('Completed'),
('Bagged'),('Picked-up'),('Abandoned')
GO

CREATE TABLE Orders (
	[OrderID] INT IDENTITY PRIMARY KEY NOT NULL, 
	Ticket INT DEFAULT (NEXT VALUE FOR AssignTicket),
	[CustomerName] [varchar](30) DEFAULT (NULL),
	[fk_OrderStatus] INT REFERENCES OrderStatus(StatusID)
);
GO

CREATE TABLE MenuItems (
   menuItemID int IDENTITY PRIMARY KEY,
   MenuName VARCHAR(30) UNIQUE NOT NULL,
   fk_Category int FOREIGN KEY REFERENCES Categories(ID),
   Price SMALLMONEY NULL,
   Calories VARCHAR(8) DEFAULT(''),
   Carbs VARCHAR(8) DEFAULT(''),
   Fat VARCHAR(8) DEFAULT(''),
   Sodium VARCHAR(8) DEFAULT(''),
   MenuDescription VARCHAR(500) NULL
);
GO
INSERT INTO MenuItems VALUES
('Hamburger',1,9.19,'840','39','43','430','Fresh, hand-formed patties hot off the grill and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.'),
('Cheeseburger',1,9.99,'980','40','55','1050','American style cheese melted between fresh patties and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.'),
('Bacon Burger',1,10.29,'920','39','50','690','Hand-formed patties hot off the grill, layered with strips of crispy apple-wood smoked bacon and placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.'),
('Bacon Cheeseburger',1,10.96,'1060','40','62','1310','Fresh patties hot off the grill with American style cheese and crispy apple-wood smoked bacon. Placed on a soft, toasted sesame seed bun. Choose as many toppings as you want.'),
('Little Hamburger',1,6.69,'540','39','26','380','Fresh, hand-formed patty hot off the grill. Add as many toppings as you want.'),
('Little Cheeseburger',1,7.89,'610','39.5','39','950','Fresh, hand-formed patty hot off the grill with American-style cheese. Add as many toppings as you want.'),
('Little Bacon Burger',1,8.19,'620','39','33','640','Fresh, hand-formed patty hot off the grill with strips of crispy apple-wood smoked bacon on top. Add as many toppings as you want.'),
('Little Bacon Cheeseburger',1,8.99,'690','39.5','39','950','Fresh, hand-formed patty hot off the grill with American-style cheese and strips of crispy apple-wood smoked bacon on top. Add as many toppings as you want.'),
('Hot Dog',2,6.39,'520','40','35','1130','All-beef hot dog, split and grilled lengthwise for a caramelized exterior with any of your favorite toppings.'),
('Cheese Dog',2,7.29,'590','40.5','41','700','All-beef hot dog, split and grilled lengthwise for a caramelized exterior with a layer of American-style cheese on top and any of your favorite toppings.'),
('Bacon Dog',2,7.69,'600','40','42','1390','All-beef hot dog, split and grilled lengthwise for a caramelized exterior with a layer of apple-wood smoked bacon and any of your favorite toppings'),
('Bacon Cheese Dog',2,8.49,'60','40.5','48','1700','All-beef hot dog, split and grilled lengthwise for a caramelized exterior, American-style cheese on top, a layer of apple-wood smoked bacon and any of your favorite toppings.'),
('Regular Drink',3,2.89,'0','0','0','0',''),
('Large Drink',3,3.29,'0','0','0','0',''),
('Bottled Water',3,5.59,'0','0','0','0',''),
('Honest Tea Bottle',3,3.19,'0','0','0','0',''),
('Simply Lemonade Bottle',3,3.19,'0','0','0','0',''),
('Coke Bottle',3,3.19,'0','0','0','0',''),
('Diet Coke Bottle',3,3.19,'0','0','0','0',''),
('Small Drink',3,3.19,'0','0','0','0',''),
('Little Fries',4,4.19,'530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside. '),
('Little Cajun Fries',4,4.19,'530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside. '),
('Regular Fries',4,5.49,'530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside. '),
('Cajun Fries',4,5.49,'530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside. '),
('Large Fries',4,6.99,'530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside. '),
('Large Cajun Fries',4,6.99,'530-1310','131','41','962','Freshly made boardwalk-style fries, cooked in pure, cholesterol-free, 100% peanut oil, and then showered with a heavy dose of Cajun spice. Cut fresh and cooked twice – firm on the outside and mashed potato on the inside. '),
('Shakes',5,5.99,'20-82','5-19','0','3-11','Rich, smooth.'),
('VEGGIE SANDWICH',6,8.5,'280','60','15','1040','Freshly grilled onions, mushrooms and green peppers layered with lettuce and tomatoes on a soft, toasted sesame seed bun. Or start with the bun and build your own from scratch. Not a veggie burger.'),
('CHEESE VEGGIE SANDWICH',6,10.5,'420','60.7','21','1350','Freshly grilled onions, mushrooms and green peppers layered with lettuce, tomatoes and slices of American-style cheese on a soft, toasted sesame seed bun. Or start with the bun and cheese and build your own from scratch. Not a veggie burger.'),
('GRILLED CHEESE',6,7.5,'470','41','26','715','Slices of American-style cheese melted on an inside-out sesame seed bun with toppings of your choice and grilled until golden brown.'),
('BLT',6,7.5,'600','42','34','931','Strips of crispy apple-wood smoked bacon from one of America’s last smokehouses, fresh tomato slices, mayo and hand-shredded lettuce on a soft, toasted sesame seed bun.'),
('Bacon',7,0,'80','0','7','260','Crispy, sweet applewood-smoked bacon chopped and mixed for a salty crunch in your shake.'),
('Bananas',7,0,'30','7-28','0','2-10','Real bananas in your handspun milkshake.'),
('Reese''s Cups',7,0,'150','16','8','98','REESE''S classic combination of chocolate and peanut butter.'),
('Strawberries',7,0,'20','0','0','5-20','Fresh strawberries in homemade simple syrup.'),
('Chocolate',7,0,'40','8-32','1-4','10-39','Chocolate and fudge added to your handspun milkshake.'),
('MALTED MILK',7,0,'60','10-40','1-5','67-268','An old school American classic.'),
('OREO COOKIES',7,0,'65','10-40','3-10','53-210','Crushed Oreo Cookies mixed with creamy malt.'),
('PEANUT BUTTER',7,0,'90','4-16','7.5-30','110-440','Crispy, sweet applewood-smoked bacon chopped and mixed for a salty crunch in your shake.'),
('SALTED CARAMEL',7,0,'45','10-41','0-1','24-98','Sweet caramel with a savory kick.'),
('VANILLA',7,0,'20-82','5-19','0','3-11','Rich, smooth vanilla.'),
('Mayo',8,0,'110','0','11','70','A layer of mayonnaise, always evenly spread. Thick, smooth and never too much or too little, unless you ask for more or less!'),
('Lettuce',8,0,'5','1','0','3','Our lettuce is torn by hand for optimum freshness and traction to hold the pickles on top.'),
('Pickles',8,0,'5','1','0','260','Five Mount Olive Pickles to bring that salty, briny, and crunchy texture to your Five Guys burger, dog or sandwich.'),
('Tomatoes',8,0,'10','2','0','3','Two slices for an even tomato-to-bite ratio every time.'),
('Grilled Onions',8,0,'10','2','0','1','Fresh onions, hand chopped and grilled on our flat top grill.'),
('Grilled Mushrooms',8,0,'20','1','0','55','Baby portobella mushrooms, hand picked and freshly packed. Grilled until golden for extra taste and body.'),
('Ketchup',8,0,'30','5','0','160','Heinz ketchup only, please.'),
('Mustard',8,0,'0','0','0','55','French’s mustard. You can always get extra sauce on the side – just ask.'),
('Relish',8,0,'15','4','0','85','Sweet and sour relish.'),
('Onions',8,0,'10','2','0','0','Fresh, hand-chopped, and evenly spread.'),
('Jalapeno Peppers',8,0,'5','<1','0','0','Fresh Jalapeño peppers chopped in-house for the spiciest bite.'),
('Green Peppers',8,0,'5','1','0','1','A row of fresh, thinly sliced green peppers.'),
('Bar-b-Que Sauce',8,0,'50','15','0','400','Rich, smoky Cattlemen’s Brand BBQ sauce.'),
('Hot Sauce',8,0,'0','0','0','1','Frank’s Original Hot Sauce – for an extra kick to your sandwiches.'),
('A1 Sauce',8,0,'15','3','0','280','The classic A1 Original Steak Sauce.'),
('NO BUN (BOWL)',8,0,'15','3','0','280',''),
('NO BUN (LETTUCE)',8,0,'15','3','0','280',''),
('Plain',8,0,'','','','',''),
('Add Patty',8,2.22,'','','','','')
GO

CREATE TABLE Items(
	ItemID INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
	fk_OrderID INT REFERENCES Orders(OrderID) ON DELETE CASCADE,
	fk_MenuItem INT REFERENCES MenuItems(MenuItemID),
	Quantity SMALLINT NOT NULL
)
GO

CREATE TABLE Extras (
	[ExtraID] [int] IDENTITY(1,1)  PRIMARY KEY NOT NULL,
	[fk_Item] [int] REFERENCES [dbo].[Items] ([ItemID]),
	[fk_MenuItem] [int] REFERENCES [dbo].[MenuItems] ([menuItemID])
)
GO



CREATE PROCEDURE NewOrderMade
AS
	SET NOCOUNT ON
	DECLARE @id INT, @itemState INT
	SET @itemState = (SELECT StatusID FROM OrderStatus WHERE ItemStatus LIKE 'Ordering')
	INSERT INTO Orders (fk_OrderStatus) VALUES ( @itemState )
	SELECT @id, @itemState
	RETURN @id
GO
	
CREATE PROCEDURE StartOrderProcedure
	@orderID int = OrderID, 
	@customerName VARCHAR(30) = 'None Provided',
	@ticketNumber int = Ticket
AS
	SET NOCOUNT ON
	DECLARE @id INT, @itemState INT
	SET @itemState = (SELECT StatusID FROM OrderStatus WHERE ItemStatus LIKE 'Queued')
	SET @ticketNumber = (SELECT Ticket FROM Orders WHERE CustomerName = @customerName)
	INSERT INTO Orders (Ticket, CustomerName, fk_OrderStatus) VALUES (@ticketNumber, @customerName, @itemState )
	
	RETURN @id
GO