/* Here is my work for Assignment Lambda. This code includes the Employee and Positions tables (It does not include the
CheckIn/CheckOut times yet, will be implemented later). This code also includes the EmployeeStatus and DatabaseRole
procedures. Prof. Yeates knows more about this code that I do. */

---------------------------------------------------------------

use master
GO

DROP DATABASE IF EXISTS LinkMason_Lambda
GO

CREATE DATABASE LinkMason_Lambda
GO

--------------------- SECURITY PROCEDURES ---------------------

-- Begin with Logins

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

-- Drop Roles

DROP ROLE IF EXISTS Cooks

DROP ROLE IF EXISTS Servers

DROP ROLE IF EXISTS Cashiers

DROP ROLE IF EXISTS Managers

DROP ROLE IF EXISTS Owners

-- Drop users

DROP USER IF EXISTS Cook

DROP USER IF EXISTS Ser

DROP USER IF EXISTS Cass

DROP USER IF EXISTS Manny

DROP USER IF EXISTS Sam

 

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

-- Creating roles
CREATE ROLE Cooks;
CREATE ROLE Servers;
CREATE ROLE Cashiers;
CREATE ROLE Managers;
CREATE ROLE Owners;

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
GRANT EXECUTE ON Employees TO Owners;

-----------------------------------------------------------------

INSERT INTO Positions (PositionName) VALUES ('Cook');
INSERT INTO Positions (PositionName) VALUES ('Server');
INSERT INTO Positions (PositionName) VALUES ('Cashier');
INSERT INTO Positions (PositionName) VALUES ('Manager');
INSERT INTO Positions (PositionName) VALUES ('Owner');

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
	FOREIGN KEY (PositionID) REFERENCES Positions(PositionID)
);

CREATE PROCEDURE DatabaseRole
    @user VARCHAR(30)
AS
BEGIN
    DECLARE @userRole VARCHAR(30)

    SET @userRole = (
        SELECT DP1.name AS DatabaseRoleName
        FROM sys.database_role_members AS DRM
        RIGHT OUTER JOIN sys.database_principals AS DP1
        ON DRM.role_principal_id = DP1.principal_id
        LEFT OUTER JOIN sys.database_principals AS DP2
        ON DRM.member_principal_id = DP2.principal_id
        WHERE DP1.type = 'R' AND DP2.name = @user
    )

    SELECT COALESCE(@user, '') AS [Name], COALESCE(@userRole, '') AS [Role]
END

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

