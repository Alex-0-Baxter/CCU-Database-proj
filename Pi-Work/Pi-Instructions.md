

## Instructions - Assignment Pi
This is a Team Assignment.  Put all the pieces together and make them work.  With this assignment, most parts of the Front-end are operational.  You need to share tables but only the responsible member can modify a table’s columns or data types – you can combine or divide tables if that makes more sense.
1.  Get the Python Front End to Respond
2.  Complete or improve Assignment Omicron
3.  Complete the following by team responsibility:



A:  Research how to do backups and restores – present this week 
     We will review in class and look at coding this into stored procedures.
     Complete these three procedures from class (you don't have triggers to turn in)

```SQL
--------------------- BACKUP PROCEDURES ---------------------

CREATE PROCEDURE FiveGuysManualFullBackup

CREATE PROCEDURE FiveGuysDailyBackup

CREATE PROCEDURE FiveGuysRestoreDatabase ( @usersDay CHAR(3) )

B:  Write two generic Stored Procedures to replace what you coded in Lambda if that makes sense (it depends on your table structure)

--------------------- COMPLETE MENU ITEM PROCEDURES ---------------------

CREATE PROCEDURE BurgersMenuItems

CREATE PROCEDURE CompleteBurgersMenu

CREATE PROCEDURE CompleteBurgerToppingsMenu

CREATE PROCEDURE ToppingsMenuItems

CREATE PROCEDURE DogsMenuItems

CREATE PROCEDURE CompleteDogsMenu

CREATE PROCEDURE CompleteDogToppingsMenu

CREATE PROCEDURE CompleteShakesMenu

CREATE PROCEDURE FriesMenuItems

CREATE PROCEDURE CompleteFriesMenu

CREATE PROCEDURE SandwichesMenuItems

CREATE PROCEDURE CompleteSandwichesMenu

CREATE PROCEDURE DrinksMenuItems

CREATE PROCEDURE CompleteDrinksMenu

CREATE PROCEDURE MixinsMenuItems

CREATE PROCEDURE CompleteMixinsMenu

CREATE OR ALTER TRIGGER to protect tables during UPDATE

C:  Complete these stored procedures:

--------------------- COMPLETE ORDERING PROCEDURES ---------------------

CREATE PROCEDURE MakeNewOrder

CREATE PROCEDURE AddMenuItem @orderNumber INT,

CREATE PROCEDURE StartOrder

CREATE PROCEDURE AdvanceOrder
CREATE PROCEDURE StateOfOrdering @kind VARCHAR(30)

CREATE OR ALTER TRIGGER to protect tables during UPDATE

D:  Continue Security work

--------------------- COMPLETE HARD-CODED SECURITY CODE ---------------------

Drop and Create Logins, Roles, Users, Role members, GRANT and DENY privileges

--------------------- WORK ON SECURITY PROCEDURES TO DO THESE ---------------------

Drop and Create Logins, Roles, Users, Role members, GRANT and DENY privileges

 

------------------------  Complete Employee Related Tables ------------------------

CREATE TABLE Positions

CREATE TABLE Employee

CREATE TABLE Shifts

CREATE TABLE TimeCard

CREATE OR ALTER TRIGGER to protect tables during UPDATE

E:  Continue to work on INSERT statements for Ingredients

--------------------- INVENTORY ---------------------

 

INSERT INTO INVENTORY TABLE Ingredients

 

CREATE PROCEDURE StockFoodItem

CREATE PROCEDURE UseFoodItem

Attempt CREATE PROCEDURE UseMenuItem

Attempt CREATE PROCEDURE UpdateMenuItemIngredients

CREATE OR ALTER TRIGGER to protect tables during UPDATE

CREATE OR ALTER FUNCTION MenuItemAvailability @item VARCHAR() RETURNS

Example of System calls for Users and their Roles

DROP PROCEDURE IF EXISTS DatabaseRole
GO
CREATE PROCEDURE DatabaseRole @user VARCHAR(30) WITH EXECUTE AS OWNER AS 
DECLARE @userName VARCHAR(30)
DECLARE @userRole VARCHAR(30)
    SET @userName =
	(SELECT dp.NAME AS [Name] 
	FROM sys.database_permissions p
	LEFT OUTER JOIN sys.all_objects o ON p.major_id = o.OBJECT_ID
	INNER JOIN sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
	WHERE dp.NAME = @user )

    SET @userRole =
	(SELECT DP1.name AS DatabaseRoleName 
	FROM sys.database_role_members AS DRM  
	RIGHT OUTER JOIN sys.database_principals AS DP1 ON DRM.role_principal_id = DP1.principal_id  
	LEFT OUTER JOIN sys.database_principals AS DP2  ON DRM.member_principal_id = DP2.principal_id  
	WHERE DP1.type = 'R' AND DP2.name = @user)

    SELECT COALESCE( @userName,' ') AS [Name],COALESCE( @userRole, ' ') AS [Role]

GO

```