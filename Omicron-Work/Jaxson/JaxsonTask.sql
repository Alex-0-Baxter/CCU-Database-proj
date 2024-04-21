-- Drop existing procedures if they exist
Drop Procedure if Exists BurgerMenuItems
Go

Drop Procedure if Exists CompleteBurgerMenu
Go

Drop Procedure if Exists CompleteBurgerToppingsMenu
Go

Drop Procedure if Exists ToppingsMenuItems
Go

Drop Procedure if Exists DogsMenuItems
Go

Drop Procedure if Exists CompleteDogsMenu
Go

Drop Procedure if Exists CompleteDogsToppingsMenu
Go

Drop Procedure if Exists CompleteShakesMenu
Go

Drop Procedure if Exists FriesMenuItems
Go

Drop Procedure if Exists CompleteFriesMenu
Go

Drop Procedure if Exists SandwichesMenuItems
Go

Drop Procedure if Exists CompleteSandwichesMenu
Go

Drop Procedure if Exists DrinksMenuItems
Go

Drop Procedure if Exists CompleteDrinksMenu
Go

Drop Procedure if Exists MixinsMenuItems
Go

Drop Procedure if Exists CompleteMixinsMenu
Go

-- BurgerMenuItems Procedure
Create Procedure BurgersMenuItems As
	Select Category, BurgerName, Price, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Burgers Join Categories On Categories.ID = fk_Category
	Where Category = 'Burgers' And MenuPlacement > 0
	Order By MenuPlacement
Go

-- CompleteBurgesrMenu Procedure
Create Procedure CompleteBurgerMenu As
	Select Category, BurgerName, Price, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Burgers Join Categories On Categories.ID = fk_Category
	Where Category = 'Burgers' And OrderingArrangement > 0
	Order By OrderingArrangement
Go

-- CompleteBurgersToppingsMenu Procedure
Create Procedure CompleteBurgerToppingsMenu As
	Select Category, BurgerName, Price, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Toppings Join Categories On Categories.ID = fk_Category
	Where Category = 'Toppings' And MenuPlacement > 0
	Order By MenuPlacement
Go

-- ToppingsMenuItems Procedure
Create Procedure ToppingsMenuItems As
	Select Category, ToppingName, Price, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Toppings
	Where Category = 'Toppings' And MenuPlacement > 0
	Order By MenuPlacement
Go

-- DogsMenuItems Procedure
Create Procedure DogsMenuItems As
	Select Category, DogName, Price, Cals, Carbs, TotalFat, Sodium, DogDescription
	From dbo.HotDogs
	Where Category = 'Hot Dogs' And MenuPlacement > 0
	Order By MenuPlacement
Go

-- CompleteDogsMenu Procedure
Create Procedure CompleteDogsMenu As
	Select Category, DogName, Price, Cals, Carbs, TotalFat, Sodium, DogDescription
	From dbo.HotDogs Join Categories On Categories.ID = fk_Category
	Where Category = 'Hot Dogs' And OrderingArrangement > 0
	Order By OrderingArrangement
Go

-- CompleteDogsToppingsMenu Procedure
Create Procedure CompleteDogsToppingsMenu As
	Select Category, DogName, Price, Cals, Carbs, TotalFat, Sodium, DogDescription
	From dbo.Toppings Join Categories On Categories.ID = fk_Category
	Where Category = 'Toppings' And MenuPlacement > 0
	Order By MenuPlacement
Go

-- CompleteShakesMenu Procedure
Create Procedure CompleteShakesMenu As
	Select Category, ShakeName, Price, Cals, Carbs, TotalFat, Sodium, ShakeDescription
	From dbo.Shakes Join Categories On Categories.ID = fk_Category
	Where Category = 'Shakes' And OrderingArrangement > 0
	Order By OrderingArrangement
Go

-- FriesMenuItems Procedure
Create Procedure FriesMenuItems As
	Select Category, FriesName, Price, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Fries
	Where Category = 'Fries' And MenuPlacement > 0
	Order By MenuPlacement
Go

-- CompleteFriesMenu Procedure
Create Procedure CompleteFriesMenu As
	Select Category, FriesName, Price, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Fries Join Categories On Categories.ID = fk_Category
	Where Category = 'Fries' And OrderingArrangement > 0
	Order By OrderingArrangement
Go

-- SandwichesMenuItems Procedure
Create Procedure SandwichesMenuItems As
	Select Category, SandwichName, Price, Cals, Carbs, TotalFat, Sodium, SandwichDescription
	From dbo.Sandwiches
	Where Category = 'Sandwiches' And MenuPlacement > 0
	Order By MenuPlacement
Go

-- CompleteSandwichesMenu Procedure
Create Procedure CompleteSandwichesMenu As
	Select Category, SandwichName, Price, Cals, Carbs, TotalFat, Sodium, SandwichDescription
	From dbo.Sandwiches Join Categories On Categories.ID = fk_Category
	Where Category = 'Sandwiches' And OrderingArrangement > 0
	Order By OrderingArrangement
Go

-- DrinksMenuItems Procedure
Create Procedure DrinksMenuItems As
	Select Category, DrinkName, Price, Cals, Carbs, TotalFat, Sodium, DrinkDescription
	From dbo.Drinks
	Where Category = 'Drinks' And MenuPlacement > 0
	Order By MenuPlacement
Go

-- CompleteDrinksMenu Procedure
Create Procedure CompleteDrinksMenu As
	Select Category, DrinkName, Price, Cals, Carbs, TotalFat, Sodium, DrinkDescription
	From dbo.Drinks Join Categories On Categories.ID = fk_Category
	Where Category = 'Drinks' And OrderingArrangement > 0
	Order By OrderingArrangement
Go

-- MixinsMenuItems Procedure
Create Procedure MixinsMenuItems As
	Select Category, ItemName, Price, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Mixins
	Where Category = 'Mixins' And MenuPlacement > 0
	Order By MenuPlacement
Go

-- CompleteMixinsMenu Procedure
Create Procedure CompleteMixinsMenu As
	Select Category, MixinName, Price, Cals, Carbs, TotalFat, Sodium, [Description]
	From dbo.Mixins Join Categories On Categories.ID = fk_Category
	Where Category = 'Mixins' And OrderingArrangement > 0
	Order By OrderingArrangement
Go
