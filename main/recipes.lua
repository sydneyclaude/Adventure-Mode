local AddRecipe2 = AddRecipe2
local AddRecipeToFilter = AddRecipeToFilter
GLOBAL.setfenv(1, GLOBAL)

AddRecipe2("diviningrod", {Ingredient("twigs", 1), Ingredient("nightmarefuel", 4), Ingredient("gears", 1)}, TECH.NONE) -- SCIENCE_TWO does not work for whatever reason?!
AddRecipeToFilter("diviningrod", "MAGIC")
