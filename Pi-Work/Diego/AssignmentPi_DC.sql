use master
GO

DROP DATABASE  IF Exists The_Better_Team_DB
GO

CREATE DATABASE  The_Better_Team_DB
GO

DROP Table IF exists Inventory
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
CREATE TABLE dbo.Inventory (
    Inventory_ID int IDENTITY PRIMARY KEY,
    Ingredient VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    Food_Item VARCHAR(50) NOT NULL,
    Category_Item_ID tinyint,
);
GO

DROP PROCEDURE IF EXISTS ReportFoodInventory
GO
CREATE PROCEDURE ReportFoodInventory
AS
BEGIN
    SELECT Ingredient, Quantity, Food_Item, Category_Item_ID
    FROM dbo.Inventory;
END;
GO

DROP PROCEDURE IF EXISTS StockFoodItem
GO
CREATE PROCEDURE StockFoodItem
    @Ingredient VARCHAR(50),
    @Quantity INT,
    @Food_Item VARCHAR(50),
    @Category_Item_ID TINYINT
AS
BEGIN
    -- Check if the ingredient already exists in the inventory
    IF EXISTS (SELECT 1 FROM dbo.Inventory WHERE Ingredient = @Ingredient AND Food_Item = @Food_Item)
    BEGIN
        -- Ingredient already exists, so update the quantity
        UPDATE dbo.Inventory
        SET Quantity = Quantity + @Quantity
        WHERE Ingredient = @Ingredient AND Food_Item = @Food_Item;
    END
    ELSE
    BEGIN
        -- Ingredient doesn't exist, so insert a new row
        INSERT INTO dbo.Inventory (Ingredient, Quantity, Food_Item, Category_Item_ID)
        VALUES (@Ingredient, @Quantity, @Food_Item, @Category_Item_ID);
    END
END;

GO

DROP PROCEDURE IF EXISTS UseFoodItem;
GO

CREATE PROCEDURE UseFoodItem
    @Ingredient VARCHAR(50),
    @Quantity INT,
    @Food_Item VARCHAR(50),
    @Category_Item_ID TINYINT
AS
BEGIN
    -- Check if the ingredient already exists in the inventory
    IF EXISTS (SELECT 1 FROM dbo.Inventory WHERE Ingredient = @Ingredient AND Food_Item = @Food_Item)
    BEGIN
        -- Ingredient exists, so update the quantity
        UPDATE dbo.Inventory
        SET Quantity = Quantity - @Quantity
        WHERE Ingredient = @Ingredient AND Food_Item = @Food_Item;
        
        -- Check if the updated quantity is less than or equal to zero
        IF (SELECT Quantity FROM dbo.Inventory WHERE Ingredient = @Ingredient AND Food_Item = @Food_Item) <= 0
        BEGIN
            -- Raise an error if the quantity becomes negative or zero
            RAISERROR('Cannot use %d units of %s. Insufficient quantity.', 16, 1, @Quantity, @Ingredient);
            -- Rollback the transaction
            ROLLBACK TRANSACTION;
            RETURN;
        END
    END
    ELSE
    BEGIN
        -- Ingredient doesn't exist, so insert a new row (Optional: You can handle this case based on your requirements)
        -- For simplicity, raising an error here
        RAISERROR('Ingredient %s for %s does not exist in inventory.', 16, 1, @Ingredient, @Food_Item);
        -- Rollback the transaction
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO

CREATE TRIGGER trg_OutOfStock
ON Inventory
AFTER UPDATE
AS
	BEGIN
    -- Check if the Quantity column is being decreased
    IF EXISTS (
        SELECT 1 
        FROM deleted d 
        JOIN inserted i ON d.Inventory_ID = i.Inventory_ID 
        WHERE d.Quantity > i.Quantity
    )
    BEGIN
        -- Check if any items are out of stock
        IF EXISTS (
            SELECT 1 
            FROM inserted 
            WHERE Quantity < 0
        )
        BEGIN
            -- Raise an error
            RAISERROR('Cannot decrease quantity. Some items are out of stock.', 16, 1);
            -- Cancel the update operation
            ROLLBACK TRANSACTION;
            RETURN;
        END
    END
END;
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

EXEC UseFoodItem 'Ground Beef', 10, 'Burger', 1;
GO
EXEC ReportFoodInventory;
GO