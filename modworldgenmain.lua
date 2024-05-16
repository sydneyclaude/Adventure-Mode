local modimport = modimport
GLOBAL.setfenv(1, GLOBAL)

modimport("main/util")

local AdventureWorlds = require "adventureworlds"

local IsTheFrontEnd = rawget(_G, "TheFrontEnd") and rawget(_G, "IsInFrontEnd") and IsInFrontEnd()
if IsTheFrontEnd then return end
