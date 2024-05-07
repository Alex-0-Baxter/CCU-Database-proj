/****************************************
*PLEASE READ							*
*EXECUTE QUERIES IN THIS ORDER			*
*TABLES									*
*EMPLOYEE INSERTS						*
*PROCEDURES								*
*****************************************/


USE master
GO
USE teamBetter_Pi
GO



-- BurgerMenuItems Procedure
Create Procedure BurgersMenuItems As
	Select 'Burgers' AS 'Category', BurgerName AS MenuName, Price, Cals AS Calories, Carbs, TotalFat AS Fat, Sodium, [Description] AS MenuDescription From dbo.Burgers 
Go

-- CompleteBurgesrMenu Procedure
Create Procedure CompleteBurgerMenu As
	Select Category, BurgerName, Price, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Burgers Join Categories On Categories.ID = fk_Category
	Where Category = 'Burgers' And OrderingArrangement > 0
	Order By OrderingArrangement
Go


-- CompleteBurgersToppingsMenu Procedure
CREATE PROCEDURE CompleteBurgerToppingsMenu 
As
	Select ToppingName, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Toppings Join Categories On Categories.FK_Topping_ID = Topping_ID
	Where Categories.FK_Topping_ID = Toppings.Topping_ID
Go

-- ToppingsMenuItems Procedure
Create Procedure ToppingsMenuItems As
	Select ToppingName, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Toppings
Go

-- DogsMenuItems Procedure
Create Procedure DogsMenuItems As
	Select DogName, Price, Cals, Carbs, Sodium, DogDescription
	From dbo.Dogs
Go

-- CompleteDogsMenu Procedure
CREATE OR ALTER PROCEDURE CompleteDogsMenu 
As Begin
	Select DogName, Price, Cals, Carbs, Sodium, DogDescription
	From dbo.Dogs 
	Join Categories On Categories.FK_DogType_ID = Dogs.DogType_ID
END
Go 

-- CompleteDogsToppingsMenu Procedure
Create Procedure CompleteDogsToppingsMenu 
As
	Select ToppingName, Cals, Carbs, TotalFat, Sodium,[Description]
	From dbo.Toppings Join Categories On Categories.FK_Topping_ID = Topping_ID
	Where Categories.FK_Topping_ID= Topping_ID
Go

-- CompleteShakesMenu Procedure
Create Procedure CompleteShakesMenu 
As
	Select ShakeName, Price, Cals, Carbs, Sodium, ShakeDescription
	From dbo.Milkshakes Join Categories On Categories.FK_Shake_ID = Shake_ID
	Where FK_Shake_ID = Shake_ID
Go
-- FriesMenuItems Procedure
Create Procedure FriesMenuItems As
	Select FriesName, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Fries

Go

-- CompleteFriesMenu Procedure
Create Procedure CompleteFriesMenu As
	Select FriesName, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Fries Join Categories On Categories.FK_Fries_ID = Fries_ID
	Where Categories.FK_Fries_ID = Fries_ID
Go

-- SandwichesMenuItems Procedure
Create Procedure SandwichesMenuItems As
	Select SandwichName, Price, Cals, Carbs, TotalFat, Sodium, ShakeDescription
	From dbo.Sandwiches
Go

-- CompleteSandwichesMenu Procedure
Create Procedure CompleteSandwichesMenu As
	Select SandwichName, Price, Cals, Carbs, TotalFat, Sodium, ShakeDescription
	From dbo.Sandwiches Join Categories On Categories.FK_Sandwich_ID = Sandwich_ID
	Where Categories.FK_Sandwich_ID = Sandwich_ID
Go
-- DrinksMenuItems Procedure
Create Procedure DrinksMenuItems As
	Select DrinkName, Price, Cals
	From dbo.Drinks
Go

-- CompleteDrinksMenu Procedure
Create Procedure CompleteDrinksMenu As
	Select DrinkName, Price, Cals
	From dbo.Drinks Join Categories On Categories.FK_Drink_ID = Drink_ID
	Where Categories.FK_Drink_ID = Drink_ID
Go

-- MixinsMenuItems Procedure
Create Procedure MixinsMenuItems As --NEED FIX ?? what is happening?
	Select Category, ItemName, Price, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Mixins
	Where Category = 'Mixins' And MenuPlacement > 0
	Order By MenuPlacement
GO

-- CompleteMixinsMenu Procedure
Create Procedure CompleteMixinsMenu As
	Select Category, MixinName, Price, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Mixins Join Categories On Categories.ID = fk_Category
	Where Category = 'Mixins' And OrderingArrangement > 0
	Order By OrderingArrangement
Go



/* Mason Work */

/* Mason's Work: Burgers & Fries on teamBetterTABLES_Pi */

BEGIN TRY

DROP LOGIN Cook

END TRY

BEGIN CATCH

END CATCH

BEGIN TRY

DROP LOGIN Ser

END TRY

BEGIN CATCH

END CATCH

BEGIN TRY

DROP LOGIN Cass

END TRY

BEGIN CATCH

END CATCH

BEGIN TRY

DROP LOGIN Manny

END TRY

BEGIN CATCH

END CATCH

BEGIN TRY

DROP LOGIN Sam

END TRY

BEGIN CATCH

END CATCH
GO
 

-- Empty Roles

BEGIN TRY

ALTER ROLE [Cooks] DROP MEMBER Cook

END TRY

BEGIN CATCH

END CATCH

BEGIN TRY

ALTER ROLE [Servers] DROP MEMBER Ser

END TRY

BEGIN CATCH

END CATCH

BEGIN TRY

ALTER ROLE [Cashiers] DROP MEMBER Cass

END TRY

BEGIN CATCH

END CATCH

BEGIN TRY

ALTER ROLE [Servers] DROP MEMBER [Managers]

END TRY

BEGIN CATCH

END CATCH

BEGIN TRY

ALTER ROLE [Cashiers] DROP MEMBER [Managers]

END TRY

BEGIN CATCH

END CATCH

BEGIN TRY

ALTER ROLE [Managers] DROP MEMBER Manny

END TRY

BEGIN CATCH

END CATCH

BEGIN TRY

ALTER ROLE [Owners] DROP MEMBER Sam

END TRY

BEGIN CATCH

END CATCH
GO
/*-- Drop users

DROP USER IF EXISTS Cook
DROP USER IF EXISTS Ser
DROP USER IF EXISTS Cass
DROP USER IF EXISTS Manny
DROP USER IF EXISTS Sam
GO
-- Drop Roles

DROP ROLE IF EXISTS Cooks
DROP ROLE IF EXISTS Servers
DROP ROLE IF EXISTS Cashiers
DROP ROLE IF EXISTS Managers
DROP ROLE IF EXISTS Owners
GO
*/
-- Creating logins/users
CREATE LOGIN Cook WITH PASSWORD = 'pass';
CREATE LOGIN Ser WITH PASSWORD = 'pass';
CREATE LOGIN Cass WITH PASSWORD = 'pass';
CREATE LOGIN Manny WITH PASSWORD = 'pass';
CREATE LOGIN Sam WITH PASSWORD = 'pass';

CREATE USER Cook FROM LOGIN Cook;
CREATE USER Ser FROM LOGIN Ser;
CREATE USER Cass FROM LOGIN Cass;
CREATE USER Manny FROM LOGIN Manny;
CREATE USER Sam FROM LOGIN Sam;
GO
-- Creating roles

CREATE ROLE Cooks;
CREATE ROLE Servers;
CREATE ROLE Cashiers;
CREATE ROLE Managers;
CREATE ROLE Owners;
/*
--GRANT SELECT ON teamBetter_Pi TO [DeathStarOne\cruze];
GRANT ALTER ON ROLE::Cooks TO [DeathStarOne\cruze];

*/

-- Adding members to roles
ALTER ROLE Cooks ADD MEMBER Cook;
ALTER ROLE Servers ADD MEMBER Ser;
ALTER ROLE Cashiers ADD MEMBER Cass;
ALTER ROLE Servers ADD MEMBER Manny;
ALTER ROLE Cashiers ADD MEMBER Manny;
ALTER ROLE Managers ADD MEMBER Manny;
ALTER ROLE Owners ADD MEMBER Sam;

-- Granting permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON Orders TO Cooks;
GRANT SELECT, INSERT, UPDATE ON Items TO Servers;
GRANT SELECT, INSERT, UPDATE ON Extras TO Servers;
GRANT SELECT, INSERT, UPDATE ON Orders TO Servers;
GRANT SELECT, INSERT, UPDATE ON Items TO Cashiers;
GRANT DELETE ON Orders TO Managers;
GRANT SELECT ON Orders TO Managers;
GRANT SELECT ON Employees TO Owners;
GRANT DELETE ON Employees TO Owners;

/* Shift and Timecard tables are on the other sql file, with triggers as well */
GO


CREATE OR ALTER PROCEDURE TimePunch /* Help */
    @Employee_ID INT,
    @Action VARCHAR(10) -- 'ClockIn' or 'ClockOut'
AS
BEGIN
    DECLARE @Shift_ID INT

    -- Check if employee has an open shift
    SELECT @Shift_ID = Shift_ID
    FROM Shifts
    WHERE Employee_ID = @Employee_ID
    AND EndTime IS NULL;

    IF @Action = 'ClockIn' AND @Shift_ID IS NULL
    BEGIN
        -- Clock in
        INSERT INTO Shifts (Employee_ID, PositionID, StartTime)
        VALUES (@Employee_ID, (SELECT PositionID FROM Employees WHERE Employee_ID = @Employee_ID), GETDATE());
    END
    ELSE IF @Action = 'ClockOut' AND @Shift_ID IS NOT NULL
    BEGIN
        -- Clock out
        UPDATE Shifts
        SET EndTime = GETDATE()
        WHERE Shift_ID = @Shift_ID;
    END
    ELSE
    BEGIN
        -- Invalid action or no open shift
        RAISERROR('Invalid action or no open shift', 16, 1);
	END
END
GO

/*
---CLOCK IN---

EXEC TimePunch @Employee_ID = 517, @Action = 'ClockIn';

---CLOCK OUT---

EXEC TimePunch @Employee_ID = 517, @Action = 'ClockOut';
*/
---------------------------------------------------------------

CREATE PROCEDURE DatabaseRole
    @user VARCHAR(30)
AS
BEGIN
    DECLARE @userRole VARCHAR(30)

    SELECT @userRole = DP1.name
    FROM sys.database_role_members AS DRM
    RIGHT OUTER JOIN sys.database_principals AS DP1
    ON DRM.role_principal_id = DP1.principal_id
    LEFT OUTER JOIN sys.database_principals AS DP2
    ON DRM.member_principal_id = DP2.principal_id
    WHERE DP1.type = 'R' AND DP2.name = @user;

    SELECT COALESCE(@user, '') AS [Name], COALESCE(@userRole, '') AS [Role];
END
GO

-----------------------------------------------------------------

CREATE PROCEDURE EmployeeStatus
    @kind VARCHAR(30)
AS
BEGIN
    DECLARE @Today DATE = GETDATE();

    IF @kind = 'ALL'
    BEGIN
        SELECT
            FirstName,
            LastName
            -- , CheckInTime, CheckOutTime, DATEDIFF(HOUR, CheckInTime, CheckOutTime) AS HoursWorked
        FROM
            Employees;
    END
    ELSE IF @kind = 'HERE'
    BEGIN
        SELECT
            FirstName,
            LastName
            -- , CheckInTime, CheckOutTime, DATEDIFF(HOUR, CheckInTime, CheckOutTime) AS HoursWorked
        FROM
            Employees
        WHERE
            CheckInDate = @Today;
    END
    ELSE
    BEGIN
        SELECT
            FirstName,
            LastName
            -- , CheckInTime, CheckOutTime, DATEDIFF(HOUR, CheckInTime, CheckOutTime) AS HoursWorked
        FROM
            Employees
        WHERE
            FirstName = @kind;
    END
END
GO


---Display Procedures---

DROP PROCEDURE IF  exists IconArrangement
GO

CREATE PROCEDURE IconArrangement 
AS
BEGIN
    SELECT Catagory, IconOrder 
    FROM Placement
	Where IconOrder <> 0
    Order By IconOrder
END

DROP PROCEDURE IF EXISTS MenuItemPlacement
GO

CREATE PROCEDURE MenuItemPlacement
AS
BEGIN
    SELECT Catagory, MenuOrder 
    FROM Placement
	WHERE MenuOrder <> 0
    Order By MenuOrder
END
GO
---BACKUP PROCEDURES---

--CREATE PROCEDURE 
CREATE OR ALTER PROCEDURE FiveGuysManualFullBackup 
AS BEGIN
	 DECLARE @db VARCHAR(63) = N'FiveGuys'
     DECLARE @day VARCHAR(12), @backupPath VARCHAR(255), @message VARCHAR(255);
	 SET @day = REPLACE(LEFT(CONVERT(VARCHAR,GETDATE()),11),' ','_')
	 SET @backupPath = CONCAT('C:\DB_Backups\',@db,'_',@day,'_Full.bak')
     ALTER DATABASE FiveGuys SET RECOVERY FULL; -- Alter does not use variables
     BACKUP DATABASE @db TO DISK = @backupPath
	 SET @message = CONCAT_WS(' ','Completed manual',@db,'backup on',@day,'to',@backupPath)
	 SELECT @message AS 'Status of backup'
END
GO
--CREATE PROCEDURE 
CREATE OR ALTER PROCEDURE FiveGuysDailyBackup 
AS BEGIN
	 DECLARE @db VARCHAR(63) = N'FiveGuys'
     DECLARE @day VARCHAR(12), @backupPath VARCHAR(255), @message VARCHAR(255);
	 DECLARE @todaysDate VARCHAR(255) = REPLACE(LEFT(CONVERT(VARCHAR,GETDATE()),11),' ','_')
	 SET @day = LEFT(UPPER(Datename(WEEKDAY,GETDATE())),3)
	 IF @day LIKE 'SUN' BEGIN
	    SET @backupPath = CONCAT('C:\DB_Backups\',@db,'_',@day,'_Full.bak')
        ALTER DATABASE FiveGuys SET RECOVERY FULL;
        BACKUP DATABASE @db TO DISK = @backupPath
	    SET @message = CONCAT_WS(' ','Completed',@db,' ',@day,'full backup on',@todaysDate,'to',@backupPath)
	 END
	 ELSE BEGIN
	    SET @backupPath = CONCAT('C:\DB_Backups\',@db,'_',@day,'_Inc.bak')
        BACKUP LOG FiveGuys TO DISK = @backupPath
	    SET @message = CONCAT_WS(' ','Completed',@db,' ',@day,'full backup on',@todaysDate,'to',@backupPath)
	 END
	 SELECT @message AS 'Status of backup'
END
GO
--CREATE PROCEDURE FiveGuysRestoreDatabase
CREATE OR ALTER PROCEDURE FiveGuysRestoreDatabase ( @usersDay CHAR(3) ) 
AS BEGIN
-- Paramenter must be one of 'SUN', 'MON','TUE','WED','THU','FRI','SAT'
-----------------------------------------------------
-- USE master; Must be manually provided before using
-- USE [master]
-- GO
-----------------------------------------------------
	 DECLARE @db VARCHAR(63) = N'FiveGuys'
     DECLARE @day VARCHAR(12), @incrementalBackupPath VARCHAR(255), @fullBackupPath VARCHAR(255)
	 DECLARE @message VARCHAR(255);
	 DECLARE @todaysDate VARCHAR(255) = REPLACE(LEFT(CONVERT(VARCHAR,GETDATE()),11),' ','_')

	 SET @day = LEFT(UPPER(@usersDay),3)
	 IF @day IN ('SUN', 'MON','TUE','WED','THU','FRI','SAT') BEGIN 
	 
	      SET @fullBackupPath = CONCAT('C:\DB_Backups\',@db,'_SUN_Full.bak')
	      
          DROP DATABASE IF EXISTS FiveGuys
          CREATE DATABASE FiveGuys
	      
          ALTER database FiveGuys SET offline with rollback immediate;
          ALTER database FiveGuys SET offline with rollback immediate;
          
          -- Restore Database in Sunday's state 
          RESTORE DATABASE FiveGuys
             FROM DISK = @fullBackupPath
             WITH MOVE 'FiveGuys' TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FiveGuys.mdf',
             MOVE 'FiveGuys_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FiveGuys_log.ldf',
             REPLACE, NORECOVERY;

          IF @day LIKE 'SUN' BEGIN
               ALTER DATABASE FiveGuys SET online;
		       SET @message = CONCAT_WS(' ','Restored database',@db,'using day',@day,'from',@fullBackupPath)

          END ELSE BEGIN
	           SET @incrementalBackupPath = CONCAT('C:\DB_Backups\',@db,'_',@day,'_Inc.bak')
               RESTORE LOG FiveGuys FROM DISK = @incrementalBackupPath WITH NORECOVERY;
               ALTER DATABASE FiveGuys SET online;
		       SET @message = CONCAT_WS(' ','Restored database',@db,'using day',@day,'from full and incremental backup at',@incrementalBackupPath)
		  END

	 END ELSE BEGIN	    
	      SET @message = CONCAT_WS(' ','Failed to Restore database,"',@day,'" is not recongised as a day of the week')
	 END
	 SELECT @message AS 'Status of Restore'
END
GO
---VIEW---

-- CREATE OF ALTER VIEW 

-- CREATE OF ALTER VIEW 

---Display Procedures---

USE msdb ;  
GO  
EXEC dbo.sp_add_job  
    @job_name = N'Weekly FiveGuys Backup' ;  
GO  
EXEC sp_add_jobstep  
    @job_name = N'Weekly FiveGuys Backup',  
    @step_name = N'Run SP to backup database',  
    @subsystem = N'TSQL',  
    @command = N'EXEC FiveGuys.dbo.FiveGuysDailyBackup',   
    @retry_attempts = 5,  
    @retry_interval = 5 ;  
GO  
EXEC dbo.sp_add_schedule  
    @schedule_name = N'RunOnce',  
    @freq_type = 1,  
    @active_start_time = 233000 ;  
USE msdb ;  
GO  
EXEC sp_attach_schedule  
   @job_name = N'Weekly FiveGuys Backup',  
   @schedule_name = N'RunOnce';  
GO  
EXEC dbo.sp_add_jobserver  
    @job_name = N'Weekly FiveGuys Backup';  
GO 

EXEC IconArrangement
GO

EXEC MenuItemPlacement
GO




/* Diego Work */
-----------------------------------------------------------------------------------------
Drop Procedure IF EXISTS CreateFoodItem
GO
CREATE OR ALTER PROCEDURE CreateFoodItem @item VARCHAR(30), @quantity INT
AS 
BEGIN
    DECLARE @id INT, @amount INT, @message VARCHAR(255)

    SET @id = (SELECT ID FROM Ingredients WHERE Ingredient = @item)

    IF @id IS NULL
    BEGIN
        INSERT INTO Ingredients (Ingredient, Quantity) VALUES (@item, @quantity)
        SET @amount = @quantity
        SET @message = CONCAT(@item, ' created and quantity set to: ', @amount)
    END 
    ELSE
    BEGIN
        SET @message = CONCAT(@item, ' already exists. Create ignored')
    END

    SELECT @message AS 'Message', @amount AS 'Amount'
END
GO
--------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS ReportFoodInventory
GO
CREATE PROCEDURE ReportFoodInventory
AS
BEGIN
    SELECT Ingredient, Quantity, Food_Item, Category_Item_ID
    FROM dbo.Inventory;
END;
GO
-------------------------------------------------------------------------------------------------

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
-------------------------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS UseFoodItem;
GO

CREATE OR ALTER PROCEDURE UseFoodItem
    @Ingredient VARCHAR(50),
    @Quantity INT,
    @Food_Item VARCHAR(50),
    @Category_Item_ID TINYINT
AS
BEGIN
    DECLARE @message VARCHAR(255)

    IF EXISTS (SELECT 1 FROM dbo.Inventory WHERE Ingredient = @Ingredient AND Food_Item = @Food_Item)
    BEGIN
        UPDATE dbo.Inventory
        SET Quantity = Quantity - @Quantity
        WHERE Ingredient = @Ingredient AND Food_Item = @Food_Item;
        
        IF (SELECT Quantity FROM dbo.Inventory WHERE Ingredient = @Ingredient AND Food_Item = @Food_Item) <= 0
        BEGIN
            RAISERROR('Cannot use %d units of %s. Insufficient quantity.', 16, 1, @Quantity, @Ingredient);
            RETURN;
        END
        ELSE
        BEGIN
            SET @message = CONCAT(@Quantity, ' units of ', @Ingredient, ' used from ', @Food_Item)
        END
    END
    ELSE
    BEGIN
        RAISERROR('Ingredient %s for %s does not exist in inventory.', 16, 1, @Ingredient, @Food_Item);
        RETURN;
    END

    SELECT @message AS 'Message'
END
GO
-----------------------------------------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE CreateMenuItemIngredients @foodItem VARCHAR(30), @item VARCHAR(30), @amount INT
AS BEGIN
	DECLARE @id INT, @message VARCHAR(255), @foodID INT
	BEGIN	
		SET @id = (SELECT ID FROM Ingredients WHERE @item = Ingredients.Ingredient)
		IF @id IS NULL
		BEGIN
			INSERT INTO Ingredients (Ingredient, Quantity) VALUES (@item, 0)
			SET @id = SCOPE_IDENTITY()
		END 
		ELSE
		BEGIN
			IF @amount < 0
			BEGIN
				SET @message = CONCAT(@item, ', quantity cannot be set below zero')
			END
			ELSE
			BEGIN
				SET @foodID = (SELECT MenuItems2.menuItemID2 FROM MenuItems2 WHERE MenuItems2.MenuName = @foodItem)
				INSERT INTO FoodParts (fk_MenuItem, fk_Ingredient, Quantity) VALUES (@foodID, @id, @amount )
				SET @message = CONCAT(@item, ', added to ', @foodItem,': ', @amount)
			END
		END
	END
	SELECT @message AS 'Message', @amount AS 'Amount'
END
GO

--------------------------------------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE ReportMenuItemInventory @menuItem VARCHAR(30)
AS BEGIN
	DECLARE @foodID INT
	SET @foodID = (SELECT MenuItems2.menuItemID2 FROM MenuItems2 WHERE @menuItem = MenuItems2.MenuName)
	print CONCAT('Find menu item ',@menuItem, ' with ID:',@foodID)
	SELECT MenuItems2.MenuName AS [Menu Item], Ingredients.Ingredient AS [Ingredients], FoodParts.Quantity  FROM FoodParts 
	JOIN Ingredients ON Ingredients.ID = FoodParts.fk_Ingredient  
	JOIN MenuItems2 ON MenuItems2.menuItemID2 = FoodParts.fk_MenuItem
	WHERE FoodParts.fk_MenuItem = @foodID
END
GO

---------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE ReportOnMenuInventory @selection VARCHAR(30)=''
AS BEGIN

	IF UPPER(@selection) LIKE 'MISSING'
	BEGIN
		SELECT Ingredients.Ingredient AS [Missing Ingredient], Ingredients.Quantity AS [Quantity] FROM FoodParts
		JOIN Ingredients ON Ingredients.ID = FoodParts.fk_Ingredient   
		WHERE Ingredients.Quantity <= 0
	END
	IF UPPER(@selection) LIKE 'LOW'
	BEGIN
		SELECT Ingredients.Ingredient AS [Low Ingredient], Ingredients.Quantity AS [Quantity] FROM FoodParts
		JOIN Ingredients ON Ingredients.ID = FoodParts.fk_Ingredient   
		WHERE Ingredients.Quantity <= 10
	END
	ELSE
	BEGIN
		SELECT Ingredients.Ingredient AS [Ingredients], Ingredients.Quantity AS [Quantity] FROM FoodParts
		JOIN Ingredients ON Ingredients.ID = FoodParts.fk_Ingredient   
	END

END
GO

------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE ReportMenuItemIngredients @menuItem VARCHAR(30)
AS BEGIN
	DECLARE @foodID INT
	SET @foodID = (SELECT MenuItems2.menuItemID2 FROM MenuItems2 WHERE @menuItem = MenuItems2.MenuName)
	--print CONCAT('Find menu item ',@menuItem, ' with ID:',@foodID)
	SELECT MenuItems2.MenuName AS [Menu Item], Ingredients.Ingredient AS [Ingredients], FoodParts.Quantity  FROM FoodParts 
	JOIN Ingredients ON Ingredients.ID = FoodParts.fk_Ingredient  
	JOIN MenuItems2 ON MenuItems2.menuItemID2 = FoodParts.fk_MenuItem
	WHERE FoodParts.fk_MenuItem = @foodID
END
GO

---------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE ReportMenuItemInventory @selection VARCHAR(30) = ''
AS BEGIN

	IF UPPER(@selection) LIKE 'MISSING'
	BEGIN
		SELECT MenuItems2.MenuName AS [Menu Item], Ingredients.Ingredient AS [Missing Ingredient] FROM FoodParts
		JOIN Ingredients ON Ingredients.ID = FoodParts.fk_Ingredient   
		JOIN MenuItems2 ON MenuItems2.menuItemID2 = FoodParts.fk_MenuItem
		WHERE Ingredients.Quantity <= 0
	END
	IF UPPER(@selection) LIKE 'LOW'
	BEGIN
		SELECT MenuItems2.MenuName AS [Menu Item], Ingredients.Ingredient AS [Low Ingredient], Ingredients.Quantity AS [Quantity] FROM FoodParts
		JOIN Ingredients ON Ingredients.ID = FoodParts.fk_Ingredient   
		JOIN MenuItems2 ON MenuItems2.menuItemID2 = FoodParts.fk_MenuItem 
		WHERE Ingredients.Quantity <= 10
	END
	ELSE
	BEGIN
		SELECT MenuItems2.MenuName AS [Menu Item], Ingredients.Ingredient AS [Ingredients] FROM FoodParts
		JOIN Ingredients ON Ingredients.ID = FoodParts.fk_Ingredient   
		JOIN MenuItems2 ON MenuItems2.menuItemID2 = FoodParts.fk_MenuItem
	END

END
GO

--------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE UseMenuItem @foodItem VARCHAR(30), @amount INT
AS BEGIN
	DECLARE @foodID INT, @message VARCHAR(255)
	BEGIN	
		SET @foodID = (SELECT MenuItems2.menuItemID2 FROM MenuItems2 WHERE @foodItem = MenuItems2.MenuName)
		IF @foodID IS NULL
		BEGIN
			SET @message = CONCAT(@foodItem, ', cannot be found')
		END 
		ELSE IF @amount <= 0
		BEGIN
			SET @message = CONCAT(@foodItem, ',  quantity cannot be set below zero:', @amount)
		END 
		ELSE
		BEGIN
			
			CREATE TABLE #temporaryTable (ID INT IDENTITY, item INT, quantity INT )
			INSERT INTO #temporaryTable 
				SELECT Ingredients.ID AS [item], Ingredients.Quantity - (@amount * FoodParts.Quantity) AS [quantity]
				FROM FoodParts
				JOIN Ingredients ON Ingredients.ID = FoodParts.fk_Ingredient   
				WHERE FoodParts.fk_MenuItem = @foodID

			DECLARE @ingredientID INT, @amountLeft INT
			DECLARE @id INT = 1 -- Default value of first ID in the temporary table
			DECLARE @max INT = (SELECT MAX(ID) FROM #temporaryTable) -- Last value in temp. table ID column
			-- Loop until the maximum is reached
			SET XACT_ABORT ON
			BEGIN TRANSACTION
			WHILE ( @id <= @max ) BEGIN

				SET @ingredientID = (SELECT item FROM #temporaryTable WHERE @id = ID)
				SET @amountLeft = (SELECT quantity FROM #temporaryTable WHERE @id = ID)

				UPDATE Ingredients 
				SET Ingredients.Quantity = @amountLeft
				WHERE Ingredients.ID = @ingredientID

				SET @id = @id + 1 -- increment and continue through the loop
			END
			COMMIT TRANSACTION

			SET @message = CONCAT(@foodItem, ', parts removed from inventory: ', @amount)
		END
	END
	SELECT @message AS 'Message', @amount AS 'Amount'
END
GO

------------------------------------------------------------------------------
CREATE OR ALTER FUNCTION MenuItemAvailability (@menuItem VARCHAR(30))
RETURNS BIT
AS 
BEGIN
    DECLARE @result BIT = 0
    DECLARE @foodID INT;

    SET @foodID = (SELECT menuItemID2 FROM MenuItems2 WHERE MenuName = @menuItem)

    IF EXISTS (
        SELECT 1 
        FROM FoodParts 
        WHERE fk_MenuItem = @foodID
    )
    BEGIN
        SET @result = 1 
    END

    RETURN @result
END
GO

------------------------------------------------------------------------------------
DROP TRIGGER IF EXISTS trg_OutOfStock
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

-- Test CreateFoodItem procedure
EXEC CreateFoodItem 'Lettuce', 100;
EXEC CreateFoodItem 'Mustard', 40;

-- Test UseFoodItem procedure
EXEC UseFoodItem 'Lettuce', 50, 'Burger', 1;

-- Test ReportFoodInventory procedure
EXEC ReportFoodInventory;

-- Test StockFoodItem procedure
EXEC StockFoodItem 'Tomato', 30, 'Burger', 1;

-- Test ReportMenuItemInventory procedure
EXEC ReportMenuItemInventory 'Burger';

-- Test CreateMenuItemIngredients procedure
EXEC CreateMenuItemIngredients 'Burger', 'Tomato', 2;

-- Test ReportMenuItemIngredients procedure
EXEC ReportMenuItemIngredients 'Burger';

-- Test ReportOnMenuInventory procedure
EXEC ReportOnMenuInventory;

-- Test UseMenuItem procedure
EXEC UseMenuItem 'Burger', 2;

-- Test MenuItemAvailability function
DECLARE @menuItem VARCHAR(30) = 'Burger';
DECLARE @availability BIT;

SET @availability = dbo.MenuItemAvailability(@menuItem);

IF @availability = 1
    PRINT 'Menu item is available';
ELSE
    PRINT 'Menu item is not available';

/* Jolie Work */



CREATE OR ALTER PROCEDURE NewOrderMade
AS
	SET NOCOUNT ON
	DECLARE @id INT, @itemState INT
	SET @itemState = (SELECT StatusID FROM OrderStatus WHERE ItemStatus LIKE 'Ordering')
	INSERT INTO Orders (fk_OrderStatus) VALUES ( @itemState )
	SELECT @id, @itemState
GO
	
CREATE OR ALTER PROCEDURE StartOrderProcedure
	@orderID int = OrderID, 
	@customerName VARCHAR(30) = 'None Provided'
AS
	SET NOCOUNT ON
	declare @ticketNumber INT

	DECLARE @itemState INT
	SET @itemState = (SELECT StatusID FROM OrderStatus WHERE ItemStatus LIKE 'Queued')
	UPDATE Orders SET fk_OrderStatus = @itemState WHERE OrderID = @orderID
	SET @ticketNumber = (SELECT Ticket FROM Orders WHERE OrderID = @orderID)
	
	SELECT @ticketNumber, @customerName, @orderID  
GO

CREATE OR ALTER PROCEDURE AddMenuItem 
    @orderID INT, 
    @itemName VARCHAR (50), 
    @quantity SMALLINT,
    @Extras VARCHAR(MAX)
AS
BEGIN
    DECLARE @menuItemID INT; -- Declaring the missing variable

    SET @menuItemID = (SELECT menuItemID2 FROM MenuItems WHERE menuName = @itemName);
    INSERT INTO Items (ItemID, fk_MenuItem, Quantity) VALUES (@orderID, @menuItemID, @quantity);

    -- Splitting the Extras and updating the Extras table
    INSERT INTO Extras (ExtraID, fk_MenuItem, ExtraName) -- Added ExtraName column here
    SELECT @orderID, @menuItemID, value
    FROM STRING_SPLIT(@Extras, ',');

    DECLARE @price SMALLMONEY;
    SET @price = (SELECT Price FROM MenuItems WHERE MenuName = @itemName);

    DECLARE @ItemID INT;
    SET @ItemID = SCOPE_IDENTITY(); -- Retrieving the last inserted ItemID

    SELECT @orderID AS OrderID, @ItemID AS ItemID, @menuItemID AS MenuItemID, @quantity AS Quantity, @itemName AS ItemName, @price AS Price;
END;
GO

CREATE OR ALTER TRIGGER trg_MenuItems
ON MenuItems2
AFTER UPDATE
AS
	BEGIN
		UPDATE [MenuItems2]
		SET [ModifiedDateTime] = GETDATE()
		WHERE menuItemID2 IN (SELECT DISTINCT menuItemID2 FROM inserted)

	END
GO

CREATE OR ALTER PROCEDURE AdvanceOrder
@orderID INT
AS
BEGIN
	DECLARE @status VARCHAR(12) 
	DECLARE @id INT
	SET @id = (SELECT fk_OrderStatus FROM Orders WHERE @orderID = OrderID)
	IF @id < 7 
		SET @id = @id+1
	BEGIN TRY
		UPDATE Orders SET fk_OrderStatus = @id WHERE @orderID = OrderID
		SELECT 'SUCCESS', 1
	END TRY
	BEGIN CATCH
		SELECT 'FAILURE', 0
	END CATCH
END
GO

--Tuple array of Ticket, CustomerName, ItemStatus, TimeCompleted, CreateDateTime
CREATE OR ALTER PROCEDURE StateOfOrdering
@orderID INT
AS 
BEGIN
	DECLARE @status VARCHAR(12) 
	DECLARE @id INT
	SET @id = (SELECT fk_OrderStatus FROM Orders WHERE @orderID = OrderID)
	SET @status = (SELECT ItemStatus FROM OrderStatus WHERE @id = StatusID)
	SELECT Ticket, CustomerName, @status, ModifiedDateTime, CreateDateTime
	FROM Orders WHERE OrderID = @orderID
END
GO


CREATE OR ALTER PROCEDURE PickupOrder
@orderNumber INT
AS BEGIN
	DECLARE @status INT
	SET @orderNumber = (SELECT OrderID FROM Orders WHERE @orderNumber = OrderID)
	SET @status = (SELECT StatusID FROM OrderStatus WHERE ItemStatus LIKE 'bagged')
	UPDATE Orders SET fk_OrderStatus = @status +1  WHERE OrderID = @orderNumber
END
GO

CREATE OR ALTER PROCEDURE UpdateOrderStatus
@orderNumber INT
AS BEGIN
	DECLARE @status INT
	SET @orderNumber = (SELECT OrderID FROM Orders WHERE @orderNumber = OrderID)
	SET @status = (SELECT StatusID FROM OrderStatus)
	UPDATE Orders SET fk_OrderStatus = @status WHERE OrderID = @orderNumber
END
GO


CREATE OR ALTER PROCEDURE Cancel
@orderNumber INT
AS BEGIN
	DECLARE @status INT
	SET @orderNumber = (SELECT OrderID FROM Orders WHERE @orderNumber = OrderID)
	SET @status = (SELECT StatusID FROM OrderStatus WHERE ItemStatus LIKE 'canceled')
	UPDATE Orders SET fk_OrderStatus = @status  WHERE OrderID = @orderNumber
END
GO


-------BACKUPS-----------
AS BEGIN
	 DECLARE @db VARCHAR(63) = N'FiveGuys'
     DECLARE @day VARCHAR(12), @backupPath VARCHAR(255), @message VARCHAR(255);
	 SET @day = REPLACE(LEFT(CONVERT(VARCHAR,GETDATE()),11),' ','_')
	 SET @backupPath = CONCAT('C:\DB_Backups\',@db,'_',@day,'_Full.bak')
     ALTER DATABASE FiveGuys SET RECOVERY FULL; -- Alter does not use variables
     BACKUP DATABASE @db TO DISK = @backupPath
	 SET @message = CONCAT_WS(' ','Completed manual',@db,'backup on',@day,'to',@backupPath)
	 SELECT @message AS 'Status of backup'
END
GO
--EXEC FiveGuysManualFullBackup

CREATE OR ALTER PROCEDURE FiveGuysDailyBackup 
AS BEGIN
	 DECLARE @db VARCHAR(63) = N'FiveGuys'
     DECLARE @day VARCHAR(12), @backupPath VARCHAR(255), @message VARCHAR(255);
	 DECLARE @todaysDate VARCHAR(255) = REPLACE(LEFT(CONVERT(VARCHAR,GETDATE()),11),' ','_')
	 SET @day = LEFT(UPPER(Datename(WEEKDAY,GETDATE())),3)
	 IF @day LIKE 'SUN' BEGIN
	    SET @backupPath = CONCAT('C:\DB_Backups\',@db,'_',@day,'_Full.bak')
        ALTER DATABASE FiveGuys SET RECOVERY FULL;
        BACKUP DATABASE @db TO DISK = @backupPath
	    SET @message = CONCAT_WS(' ','Completed',@db,' ',@day,'full backup on',@todaysDate,'to',@backupPath)
	 END
	 ELSE BEGIN
	    SET @backupPath = CONCAT('C:\DB_Backups\',@db,'_',@day,'_Inc.bak')
        BACKUP LOG FiveGuys TO DISK = @backupPath
	    SET @message = CONCAT_WS(' ','Completed',@db,' ',@day,'full backup on',@todaysDate,'to',@backupPath)
	 END
	 SELECT @message AS 'Status of backup'
END
GO
--EXEC FiveGuysDailyBackup

CREATE OR ALTER PROCEDURE FiveGuysRestoreDatabase ( @usersDay CHAR(3) ) 
AS BEGIN
-- Paramenter must be one of 'SUN', 'MON','TUE','WED','THU','FRI','SAT'
-----------------------------------------------------
-- USE master; Must be manually provided before using
-- USE [master]
-- GO
-----------------------------------------------------
	 DECLARE @db VARCHAR(63) = N'FiveGuys'
     DECLARE @day VARCHAR(12), @incrementalBackupPath VARCHAR(255), @fullBackupPath VARCHAR(255)
	 DECLARE @message VARCHAR(255);
	 DECLARE @todaysDate VARCHAR(255) = REPLACE(LEFT(CONVERT(VARCHAR,GETDATE()),11),' ','_')

	 SET @day = LEFT(UPPER(@usersDay),3)
	 IF @day IN ('SUN', 'MON','TUE','WED','THU','FRI','SAT') BEGIN 
	 
	      SET @fullBackupPath = CONCAT('C:\DB_Backups\',@db,'_SUN_Full.bak')
	      
          DROP DATABASE IF EXISTS FiveGuys
          CREATE DATABASE FiveGuys
	      
          ALTER database FiveGuys SET offline with rollback immediate;
          ALTER database FiveGuys SET offline with rollback immediate;
          
          -- Restore Database in Sunday's state 
          RESTORE DATABASE FiveGuys
             FROM DISK = @fullBackupPath
             WITH MOVE 'FiveGuys' TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FiveGuys.mdf',
             MOVE 'FiveGuys_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FiveGuys_log.ldf',
             REPLACE, NORECOVERY;

          IF @day LIKE 'SUN' BEGIN
               ALTER DATABASE FiveGuys SET online;
		       SET @message = CONCAT_WS(' ','Restored database',@db,'using day',@day,'from',@fullBackupPath)

          END ELSE BEGIN
	           SET @incrementalBackupPath = CONCAT('C:\DB_Backups\',@db,'_',@day,'_Inc.bak')
               RESTORE LOG FiveGuys FROM DISK = @incrementalBackupPath WITH NORECOVERY;
               ALTER DATABASE FiveGuys SET online;
		       SET @message = CONCAT_WS(' ','Restored database',@db,'using day',@day,'from full and incremental backup at',@incrementalBackupPath)
		  END

	 END ELSE BEGIN	    
	      SET @message = CONCAT_WS(' ','Failed to Restore database,"',@day,'" is not recongised as a day of the week')
	 END
	 SELECT @message AS 'Status of Restore'
END
GO


/******** Copied from microsoft *************/
-- Schedule Job Named: Weekly FiveGuys Backup
USE msdb ;  
GO  
EXEC dbo.sp_add_job  
    @job_name = N'Weekly FiveGuys Backup' ;  
GO  
EXEC sp_add_jobstep  
    @job_name = N'Weekly FiveGuys Backup',  
    @step_name = N'Run SP to backup database',  
    @subsystem = N'TSQL',  
    @command = N'EXEC FiveGuys.dbo.FiveGuysDailyBackup',   
    @retry_attempts = 5,  
    @retry_interval = 5 ;  
GO  
EXEC dbo.sp_add_schedule  
    @schedule_name = N'RunOnce',  
    @freq_type = 1,  
    @active_start_time = 233000 ;  
USE msdb ;  
GO  
EXEC sp_attach_schedule  
   @job_name = N'Weekly FiveGuys Backup',  
   @schedule_name = N'RunOnce';  
GO  
EXEC dbo.sp_add_jobserver  
    @job_name = N'Weekly FiveGuys Backup';  
GO  


/* END */ 