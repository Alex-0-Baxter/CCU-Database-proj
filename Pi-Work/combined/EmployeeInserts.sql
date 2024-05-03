/****************************************
*PLEASE READ							              *
*EXECUTE QUERIES IN THIS ORDER		    	*
*TABLES								                	*
*EMPLOYEE INSERTS					            	*
*PROCEDURES								              *
*****************************************/


Use teamBetter_Pi
GO


INSERT INTO Positions (PositionName) VALUES ('Cook');
INSERT INTO Positions (PositionName) VALUES ('Server');
INSERT INTO Positions (PositionName) VALUES ('Cashier');
INSERT INTO Positions (PositionName) VALUES ('Manager');
INSERT INTO Positions (PositionName) VALUES ('Owner');



INSERT INTO Employees (PositionID, Username, Pin, FirstName, LastName) VALUES (1, 'john.doe', '1234', 'John', 'Doe');
INSERT INTO Employees (PositionID, Username, Pin, FirstName, LastName) VALUES (2, 'jane.smith', '5678', 'Jane', 'Smith');
INSERT INTO Employees (PositionID, Username, Pin, FirstName, LastName) VALUES (3, 'alex.jones', '9012', 'Alex', 'Jones');
INSERT INTO Employees (PositionID, Username, Pin, FirstName, LastName) VALUES (1, 'sara.williams', '3456', 'Sara', 'Williams');
INSERT INTO Employees (PositionID, Username, Pin, FirstName, LastName) VALUES (2, 'michael.brown', '7890', 'Michael', 'Brown');
INSERT INTO Employees (PositionID, Username, Pin, FirstName, LastName) VALUES (3, 'emily.davis', '2345', 'Emily', 'Davis');
INSERT INTO Employees (PositionID, Username, Pin, FirstName, LastName) VALUES (1, 'adam.green', '6789', 'Adam', 'Green');
INSERT INTO Employees (PositionID, Username, Pin, FirstName, LastName) VALUES (2, 'lisa.johnson', '1239', 'Lisa', 'Johnson');
INSERT INTO Employees (PositionID, Username, Pin, FirstName, LastName) VALUES (3, 'peter.anderson', '4567', 'Peter', 'Anderson');
INSERT INTO Employees (PositionID, Username, Pin, FirstName, LastName) VALUES (1, 'natalie.miller', '8901', 'Natalie', 'Miller');

---CLOCK IN---

EXEC TimePunched @Employee_ID = 1, @Action = 'ClockIn';

---CLOCK OUT---

EXEC TimePunched @Employee_ID = 1, @Action = 'ClockOut';


SELECT * FROM Positions;

SELECT * FROM Employees;

SELECT * FROM Shifts;
