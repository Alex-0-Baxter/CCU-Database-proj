Drop Procedure if Exists BurgerMenuItems
Go

Create Procedure BurgerMenuItems As
	Select Category, BurgerName, Price, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Burgers Join Categories On Categories.ID = fk_Category
	Where Category = 'Burgers' And MenuPlacement > 0
	Order By MenuPlacement
Go


Drop Procedure if Exists CompleteBurgersMenu
Go

Create Procedure CompleteBurgersMenu As
	Select Category, BurgerName, Price, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Burgers Join Categories On Categories.ID = fk_Category
	Where Category = 'Burgers' And OrderingArrangement > 0
	Order By OrderingArrangement
Go
