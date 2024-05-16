GLOBAL.setfenv(1, GLOBAL)

local AdventureWorlds = require "adventureworlds"

function GetRandomSubstituteList(substitutes, num_choices)
    local subs = {}
    local list = {}

    for k,v in pairs(substitutes) do 
        list[k] = v.weight
    end

    for i=1,num_choices do
        local choice = weighted_random_choice(list)
        list[choice] = nil
        subs[choice] = substitutes[choice]
    end

    return subs
end

function AddAdventureWorld(name, tasksetdata)
    if checkstring(name) and type(tasksetdata) == "function" then
        AdventureWorlds[name] = tasksetdata
    end
end