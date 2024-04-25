USE master
GO

Drop Database IF exists better 
GO

create database better 
GO

Use better
GO

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
('Specitlty Orders'    , 0, 9);

-------------------------------Display Procedures--------------------------
DROP PROCEDURE IF  exists IconArrangement
GO

CREATE PROCEDURE IconArrangement -- get answers by looking at 5guys website -- must have an identifier to allow menue item order. this shoudl be able to be referenced by other tables
AS
BEGIN
    SELECT Catagory, IconOrder 
    FROM Placement
	Where IconOrder <> 0
    Order By IconOrder
END;

DROP PROCEDURE IF EXISTS MenuItemPlacement
GO

CREATE PROCEDURE MenuItemPlacement
AS
BEGIN
    SELECT Catagory, MenuOrder 
    FROM Placement
	WHERE MenuOrder <> 0
    Order By MenuOrder
END;

---------------------------------BACKUP PROCEDURES--------------------------
--CREATE PROCEDURE 

--CREATE PROCEDURE 

--CREATE PROCEDURE 

----------------------------------VIEW--------------------------

-- CREATE OF ALTER VIEW 

-- CREATE OF ALTER VIEW 

-------------------------------Display Procedures--------------------------

EXEC IconArrangement
GO

EXEC MenuItemPlacement
GO



