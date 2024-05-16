local AdventureWorld = {}

AdventureWorld.ColdReception = function(tasksetdata)
    tasksetdata.numoptionaltasks = 4
    tasksetdata.tasks = {"Make a pick","Easy Blocked Dig that rock","Great Plains","Guarded Speak to the king",}
    tasksetdata.optionaltasks = {"Waspy Beeeees!","Guarded Squeltch","Guarded Forest hunters","Befriend the pigs","Guarded For a nice walk","Walled Kill the spiders","Killer bees!",
        "Make a Beehat","Waspy The hunters","Hounded Magic meadow","Wasps and Frogs and bugs","Guarded Walrus Desolate",}
    tasksetdata.set_pieces = {                
            ["ResurrectionStoneWinter"] = { count=1, tasks=adventure1_setpieces_tasks},
        }
    tasksetdata.required_setpieces = {}
    tasksetdata.numrandom_set_pieces = 0
    if not tasksetdata.ordered_story_setpieces then -- only use this for this mod, so for original DS adventure worlds!
        tasksetdata.ordered_story_setpieces = {}
    end
    for _,set in pairs(_G.TUNING.TELEPORTATOMOD.teleportato_layouts["forest"]) do
        table.insert(tasksetdata.ordered_story_setpieces,set)
    end
    tasksetdata.random_set_pieces = {}
    tasksetdata.ocean_prefill_setpieces = {} -- delete any ocean stuff
    tasksetdata.ocean_population = {} -- delete any ocean stuff
    tasksetdata.add_teleportato = true -- add teleportato within teleportato mod. ypu can set up _G.TUNING.TELEPORTATOMOD.teleportato_layouts to change the setpieces of them
    tasksetdata.required_prefabs = _G.ArrayUnion(required_prefabs,{"teleportato_base","teleportato_box","teleportato_crank","teleportato_ring","teleportato_potato"}) -- if ordered_story_setpieces is nil/empty, required_prefabs is set up in teleoprtato mod depending in settings there
    if _G.TUNING.ADV_DIFFICULTY==0 then
        tasksetdata.substitutes = GetRandomSubstituteList(SUBS_1, 3)
    end
    if tasksetdata.overrides==nil then
        tasksetdata.overrides = {}
    end
    tasksetdata.overrides.world_size  =  GetModConfigData("worldsizeacoldreception") or "medium"
    tasksetdata.overrides.day  =  GetModConfigData("dayacoldreception") or "longdusk" 
    tasksetdata.overrides.weather  =  "often"
    tasksetdata.overrides.frograin   =  "often"
    
    tasksetdata.overrides.season_start  =  GetModConfigData("startseasonacoldreception") or "spring"
    
    tasksetdata.overrides.deerclops  =  (_G.TUNING.ADV_DIFFICULTY==0 and "never") or (_G.TUNING.ADV_DIFFICULTY==1 and "never") or (_G.TUNING.ADV_DIFFICULTY==2 and "rare") or (_G.TUNING.ADV_DIFFICULTY==3 and "default") or "never"
    tasksetdata.overrides.dragonfly  =  "never"
    tasksetdata.overrides.bearger  =  "never"
    tasksetdata.overrides.goosemoose  =  (_G.TUNING.ADV_DIFFICULTY==0 and "never") or (_G.TUNING.ADV_DIFFICULTY==1 and "never") or (_G.TUNING.ADV_DIFFICULTY==2 and "rare") or (_G.TUNING.ADV_DIFFICULTY==3 and "default") or "never"
    tasksetdata.overrides.antliontribute = "never"
    tasksetdata.overrides.hounds  =  "never" -- no hound attacks
    
    if forest_map.TRANSLATE_TO_CLUMP~=nil then
        -- DS uses mactusk="always", but still only ~5 to 10 will spawn all over the world. seems somehow limited to one per task or so?
        -- anyway, we will reduce it for DS to Clump="often" which means 1 or 2 in up to 8 nodes (ADV_allmap_often would mean 1 or 2 in nearly every node) and also reduce it a bit in other difficulties
        tasksetdata.overrides.ADV_clump_walrus  =  (_G.TUNING.ADV_DIFFICULTY==0 and "often") or (_G.TUNING.ADV_DIFFICULTY==3 and "ADV_allmap_mostly") or (_G.TUNING.ADV_DIFFICULTY==1 and "often") or "ADV_allmap_often"
    else
        tasksetdata.overrides.walrus  =  "always"
    end
    
    tasksetdata.overrides.leifs  =  "always"
    
    tasksetdata.overrides.trees  =  "often" -- no clump_ needed, because I think trees should only spawn there where they are meant to spawn
    tasksetdata.overrides.carrot  =  "default"
    tasksetdata.overrides.berrybush  =  "never"
    
    tasksetdata.overrides.wormhole_prefab = "wormhole"
    tasksetdata.overrides.layout_mode = "LinkNodesByKeys"
    tasksetdata.overrides.start_location = "adv1"
    tasksetdata.overrides.autumn = GetModConfigData("autumnacoldreception") or "noseason"
    tasksetdata.overrides.winter = GetModConfigData("winteracoldreception") or "3__daysseason" -- 3__daysseason added by teleportato mod
    tasksetdata.overrides.spring = GetModConfigData("springacoldreception") or "5__daysseason"
    tasksetdata.overrides.summer = GetModConfigData("summeracoldreception") or "noseason"
    tasksetdata.overrides.keep_disconnected_tiles = true
    tasksetdata.overrides.no_joining_islands = true
    
    -- ALWAYS with ocean! because wormhole placement can fail. Instead we will make thinkthank unavailable when setting is set to only wormholes and placement suceeded
    tasksetdata.overrides["has_ocean"] = true
    
    -- game mode settings
    tasksetdata.overrides.portalresurection = _G.TUNING.ADV_DIFFICULTY==1 and "always" or "none"
    tasksetdata.overrides.ghostenabled = "always"
    tasksetdata.overrides.ghostsanitydrain = "always"
    tasksetdata.overrides.basicresource_regrowth = "always"
    tasksetdata.overrides.spawnmode = "fixed"
    tasksetdata.overrides.resettime = "default"

    return tasksetdata
end

AdventureWorld.KingWinter = function(tasksetdata)
    
    tasksetdata.numoptionaltasks = 2
    tasksetdata.tasks = {"Resource-rich Tier2","Sanity-Blocked Great Plains","Hounded Greater Plains","Insanity-Blocked Necronomicon",}
    tasksetdata.optionaltasks = {"Walrus Desolate","Walled Kill the spiders","The Deep Forest","Forest hunters",}
    tasksetdata.set_pieces = {                
            -- ["WesUnlock"] = { restrict_to="background", tasks={ "Hounded Greater Plains", "Walrus Desolate", "Walled Kill the spiders", "The Deep Forest", "Forest hunters" }},
            ["ResurrectionStoneWinter"] = { count=1, tasks={"Resource-rich Tier2","Sanity-Blocked Great Plains","Hounded Greater Plains","Insanity-Blocked Necronomicon", 
                                                    "Walrus Desolate","Walled Kill the spiders","The Deep Forest","Forest hunters"}},
            ["MacTuskTown"] = { tasks={"Insanity-Blocked Necronomicon", "Hounded Greater Plains", "Sanity-Blocked Great Plains"} },
        }
    tasksetdata.required_setpieces = {}
    tasksetdata.numrandom_set_pieces = 0
    if not tasksetdata.ordered_story_setpieces then -- only use this for this mod, so for original DS adventure worlds!
        tasksetdata.ordered_story_setpieces = {}
    end
    for _,set in pairs(_G.TUNING.TELEPORTATOMOD.teleportato_layouts["forest"]) do
        table.insert(tasksetdata.ordered_story_setpieces,set)
    end
    tasksetdata.random_set_pieces = {}
    tasksetdata.ocean_prefill_setpieces = {} -- delete any ocean stuff
    tasksetdata.ocean_population = {} -- delete any ocean stuff
    tasksetdata.add_teleportato = true -- add teleportato within teleportato mod. ypu can set up _G.TUNING.TELEPORTATOMOD.teleportato_layouts to change the setpieces of them
    tasksetdata.required_prefabs = _G.ArrayUnion(required_prefabs,{"teleportato_base","teleportato_box","teleportato_crank","teleportato_ring","teleportato_potato"}) -- if ordered_story_setpieces is nil/empty, required_prefabs is set up in teleoprtato mod depending in settings there
    if _G.TUNING.ADV_DIFFICULTY==0 then
        tasksetdata.substitutes = GetRandomSubstituteList(SUBS_1, 3)
    end
    if tasksetdata.overrides==nil then
        tasksetdata.overrides = {}
    end
    tasksetdata.overrides.world_size = GetModConfigData("worldsizekingofwinter") or "medium"
    tasksetdata.overrides.wormhole_prefab = "wormhole"
    tasksetdata.overrides.layout_mode = "LinkNodesByKeys"
    tasksetdata.overrides.day  =  GetModConfigData("daykingofwinter") or "longdusk" 

    tasksetdata.overrides.start_location = "adv2"

    tasksetdata.overrides.loop  =  "never"
    tasksetdata.overrides.branching  =  "least"
    
    tasksetdata.overrides.season_start  =  GetModConfigData("startseasonkingofwinter") or "winter"
    tasksetdata.overrides.weather  =  (_G.TUNING.ADV_DIFFICULTY==0 and "often") or (_G.TUNING.ADV_DIFFICULTY==1 and "often") or (_G.TUNING.ADV_DIFFICULTY==2 and "always") or (_G.TUNING.ADV_DIFFICULTY==3 and "always") or "often"      
    
    tasksetdata.overrides.deerclops  =  (_G.TUNING.ADV_DIFFICULTY==0 and "often") or (_G.TUNING.ADV_DIFFICULTY==1 and "default") or (_G.TUNING.ADV_DIFFICULTY==2 and "often") or (_G.TUNING.ADV_DIFFICULTY==3 and "always") or "often"
    tasksetdata.overrides.dragonfly  =  "never"
    tasksetdata.overrides.bearger  =  "never"
    tasksetdata.overrides.goosemoose  =  "never"
    tasksetdata.overrides.antliontribute = "never"
    tasksetdata.overrides.hounds  =  "never"
    if forest_map.TRANSLATE_TO_CLUMP~=nil then
        -- DS uses mactusk="always", but still only ~5 to 10 will spawn all over the world. seems somehow limited to one per task or so?
        -- anyway, we will reduce it for DS to Clump="often" which means 1 or 2 in up to 8 nodes (ADV_allmap_often would mean 1 or 2 in nearly every node) and also reduce it a bit in other difficulties
        tasksetdata.overrides.ADV_clump_walrus  =  (_G.TUNING.ADV_DIFFICULTY==0 and "often") or (_G.TUNING.ADV_DIFFICULTY==3 and "ADV_allmap_mostly") or (_G.TUNING.ADV_DIFFICULTY==1 and "often") or "ADV_allmap_often"
    else
        tasksetdata.overrides.walrus  =  "always"
    end
    
    tasksetdata.overrides.carrot = (_G.TUNING.ADV_DIFFICULTY==0 and "rare") or (_G.TUNING.ADV_DIFFICULTY==1 and "default") or (_G.TUNING.ADV_DIFFICULTY==2 and "rare") or (_G.TUNING.ADV_DIFFICULTY==3 and "never") or "rare"          
    tasksetdata.overrides.berrybush  =  (_G.TUNING.ADV_DIFFICULTY==0 and "rare") or (_G.TUNING.ADV_DIFFICULTY==1 and "default") or (_G.TUNING.ADV_DIFFICULTY==2 and "rare") or (_G.TUNING.ADV_DIFFICULTY==3 and "never") or "rare"
    
    tasksetdata.overrides.autumn = GetModConfigData("autumnkingofwinter") or "noseason"
    tasksetdata.overrides.winter = GetModConfigData("winterkingofwinter") or "verylongseason"
    tasksetdata.overrides.spring = GetModConfigData("springkingofwinter") or "noseason"
    tasksetdata.overrides.summer = GetModConfigData("summerkingofwinter") or "noseason"
    tasksetdata.overrides.keep_disconnected_tiles = true
    tasksetdata.overrides.no_joining_islands = true
    
    -- ALWAYS with ocean! because wormhole placement can fail. Instead we will make thinkthank unavailable when setting is set to only wormholes and placement suceeded
    tasksetdata.overrides["has_ocean"] = true
    
    -- game mode settings
    tasksetdata.overrides.portalresurection = _G.TUNING.ADV_DIFFICULTY==1 and "always" or "none"
    tasksetdata.overrides.ghostenabled = "always"
    tasksetdata.overrides.ghostsanitydrain = "always"
    tasksetdata.overrides.basicresource_regrowth = "always"
    tasksetdata.overrides.spawnmode = "fixed"
    tasksetdata.overrides.resettime = "default"

    return tasksetdata
end

AdventureWorld.GameAFoot = function(tasksetdata)
    
    tasksetdata.numoptionaltasks = 4
    tasksetdata.tasks = {-- Enemies: Lots of hound mounds and maxwell traps everywhere. Frequent hound invasions.
        "Resource-Rich","Lots-o-Spiders","Lots-o-Tentacles","Lots-o-Tallbirds","Lots-o-Chessmonsters",}
    tasksetdata.optionaltasks = {"The hunters","Trapped Forest hunters","Wasps and Frogs and bugs","Tentacle-Blocked The Deep Forest","Hounded Greater Plains","Merms ahoy",}
    tasksetdata.set_pieces = {                
            ["SimpleBase"] = { tasks={"Lots-o-Spiders", "Lots-o-Tentacles", "Lots-o-Tallbirds", "Lots-o-Chessmonsters"}},
            -- ["WesUnlock"] = { restrict_to="background", tasks={ "The hunters", "Trapped Forest hunters", "Wasps and Frogs and bugs", "Tentacle-Blocked The Deep Forest", "Hounded Greater Plains", "Merms ahoy" }},
            ["ResurrectionStone"] = { count=1, tasks={"Resource-Rich","Lots-o-Spiders","Lots-o-Tentacles","Lots-o-Tallbirds","Lots-o-Chessmonsters", "The hunters","Trapped Forest hunters",
                                                    "Wasps and Frogs and bugs","Tentacle-Blocked The Deep Forest","Hounded Greater Plains","Merms ahoy"} },
        }
    tasksetdata.required_setpieces = {}
    tasksetdata.numrandom_set_pieces = 0
    if not tasksetdata.ordered_story_setpieces then -- only use this for this mod, so for original DS adventure worlds!
        tasksetdata.ordered_story_setpieces = {}
    end
    for _,set in pairs(_G.TUNING.TELEPORTATOMOD.teleportato_layouts["forest"]) do
        table.insert(tasksetdata.ordered_story_setpieces,set)
    end
    tasksetdata.random_set_pieces = {}
    tasksetdata.ocean_prefill_setpieces = {} -- delete any ocean stuff
    tasksetdata.ocean_population = {} -- delete any ocean stuff
    tasksetdata.add_teleportato = true -- add teleportato within teleportato mod. ypu can set up _G.TUNING.TELEPORTATOMOD.teleportato_layouts to change the setpieces of them
    tasksetdata.required_prefabs = _G.ArrayUnion(required_prefabs,{"teleportato_base","teleportato_box","teleportato_crank","teleportato_ring","teleportato_potato"}) -- if ordered_story_setpieces is nil/empty, required_prefabs is set up in teleoprtato mod depending in settings there
    if _G.TUNING.ADV_DIFFICULTY==0 then
        tasksetdata.substitutes = GetRandomSubstituteList(SUBS_1, 3)
    end
    if tasksetdata.overrides==nil then
        tasksetdata.overrides = {}
    end
    tasksetdata.overrides.day = GetModConfigData("daythegameisafoot") or "longdusk" 

    tasksetdata.overrides.season_start = GetModConfigData("startseasonthegameisafoot") or "winter"

    if forest_map.TRANSLATE_TO_CLUMP~=nil then
        tasksetdata.overrides.ADV_clump_spiders = "ADV_allmap_often"
    else
        tasksetdata.overrides.spiders = "often"
    end
    
    tasksetdata.overrides.world_size = GetModConfigData("worldsizethegameisafoot") or "medium"
    tasksetdata.overrides.branching = "default"
    tasksetdata.overrides.loop = "never"
    
    tasksetdata.overrides.deerclops  =  (_G.TUNING.ADV_DIFFICULTY==0 and "default") or (_G.TUNING.ADV_DIFFICULTY==1 and "rare") or (_G.TUNING.ADV_DIFFICULTY==2 and "default") or (_G.TUNING.ADV_DIFFICULTY==3 and "often") or "default"
    tasksetdata.overrides.dragonfly  =  "never"
    tasksetdata.overrides.bearger  =  "never"
    tasksetdata.overrides.goosemoose  =  (_G.TUNING.ADV_DIFFICULTY==0 and "never") or (_G.TUNING.ADV_DIFFICULTY==1 and "rare") or (_G.TUNING.ADV_DIFFICULTY==2 and "default") or (_G.TUNING.ADV_DIFFICULTY==3 and "often") or "never"
    tasksetdata.overrides.antliontribute = "never"
    tasksetdata.overrides.wormhole_prefab = "wormhole"
    tasksetdata.overrides.layout_mode = "LinkNodesByKeys"
    tasksetdata.overrides.start_location = "adv3"
    tasksetdata.overrides.autumn = GetModConfigData("autumnthegameisafoot") or ((_G.TUNING.ADV_DIFFICULTY==1 and "veryshortseason") or "noseason")
    tasksetdata.overrides.winter = GetModConfigData("winterthegameisafoot") or "noseason"
    tasksetdata.overrides.spring = GetModConfigData("springthegameisafoot") or "verylongseason"
    tasksetdata.overrides.summer = GetModConfigData("summerthegameisafoot") or "noseason"
    tasksetdata.overrides.keep_disconnected_tiles = true
    tasksetdata.overrides.no_joining_islands = true
    
    -- ALWAYS with ocean! because wormhole placement can fail. Instead we will make thinkthank unavailable when setting is set to only wormholes and placement suceeded
    tasksetdata.overrides["has_ocean"] = true
    
    -- game mode settings
    tasksetdata.overrides.portalresurection = _G.TUNING.ADV_DIFFICULTY==1 and "always" or "none"
    tasksetdata.overrides.ghostenabled = "always"
    tasksetdata.overrides.ghostsanitydrain = "always"
    tasksetdata.overrides.basicresource_regrowth = "always"
    tasksetdata.overrides.spawnmode = "fixed"
    tasksetdata.overrides.resettime = "default"

    return tasksetdata
end

AdventureWorld.Archipelago = function(tasksetdata)
    
    tasksetdata.numoptionaltasks = 0
    tasksetdata.tasks = {"IslandHop_Start","IslandHop_Hounds","IslandHop_Forest","IslandHop_Savanna","IslandHop_Rocky","IslandHop_Merm",}
    -- tasksetdata.tasks = {"IslandHop_Start wormhole","IslandHop_Hounds wormhole","IslandHop_Forest wormhole","IslandHop_Savanna wormhole","IslandHop_Rocky wormhole","IslandHop_Merm wormhole",}
    tasksetdata.optionaltasks = {}
    tasksetdata.set_pieces = {                
            -- ["WesUnlock"] = { restrict_to="background", tasks={ "IslandHop_Start", "IslandHop_Hounds", "IslandHop_Forest", "IslandHop_Savanna", "IslandHop_Rocky", "IslandHop_Merm" } },
               -- INFO: wormholes alternative code in tasksroomslayouts.lua as room_choices. This should be more secure than adding it as setpiece
               ["Wormhole_Mod"] = { count= 12, tasks={ "IslandHop_Start", "IslandHop_Hounds", "IslandHop_Forest", "IslandHop_Savanna", "IslandHop_Rocky", "IslandHop_Merm" } }, -- adds the setpiece at max once per task, set count to 12, to make sure always all 6 are spawned.., but it still may be less
               ["Wormhole_Mod2"] = { count= 12, tasks={ "IslandHop_Start", "IslandHop_Hounds", "IslandHop_Forest", "IslandHop_Savanna", "IslandHop_Rocky", "IslandHop_Merm" } }, -- adds the setpiece at max once per task
               ["Wormhole_Mod3"] = { count= 12, tasks={ "IslandHop_Start", "IslandHop_Hounds", "IslandHop_Forest", "IslandHop_Savanna", "IslandHop_Rocky", "IslandHop_Merm" } }, -- adds the setpiece at max once per task
        }
    tasksetdata.required_setpieces = {}
    tasksetdata.numrandom_set_pieces = 0
    if not tasksetdata.ordered_story_setpieces then -- only use this for this mod, so for original DS adventure worlds!
        tasksetdata.ordered_story_setpieces = {}
    end
    for _,set in pairs(_G.TUNING.TELEPORTATOMOD.teleportato_layouts["forest"]) do
        table.insert(tasksetdata.ordered_story_setpieces,set)
    end
    tasksetdata.random_set_pieces = {}
    tasksetdata.ocean_prefill_setpieces = {} -- delete any ocean stuff
    tasksetdata.ocean_population = {} -- delete any ocean stuff
    tasksetdata.add_teleportato = true -- add teleportato within teleportato mod. ypu can set up _G.TUNING.TELEPORTATOMOD.teleportato_layouts to change the setpieces of them
    tasksetdata.required_prefabs = _G.ArrayUnion(required_prefabs,{"teleportato_base","teleportato_box","teleportato_crank","teleportato_ring","teleportato_potato"}) -- if ordered_story_setpieces is nil/empty, required_prefabs is set up in teleoprtato mod depending in settings there
    if _G.TUNING.ADV_DIFFICULTY==0 then
        tasksetdata.substitutes = GetRandomSubstituteList(SUBS_1, 3)
    end
    if tasksetdata.overrides==nil then
        tasksetdata.overrides = {}
    end
    tasksetdata.overrides.world_size = GetModConfigData("worldsizearchipelago") or "medium"
    tasksetdata.overrides.day  =  GetModConfigData("dayarchipelago") or "default"
    tasksetdata.overrides.roads = "never"
    tasksetdata.overrides.weather = (_G.TUNING.ADV_DIFFICULTY==0 and "default") or (_G.TUNING.ADV_DIFFICULTY==1 and "rare") or (_G.TUNING.ADV_DIFFICULTY==2 and "default") or (_G.TUNING.ADV_DIFFICULTY==3 and "often") or "default"
    tasksetdata.overrides.deerclops = (_G.TUNING.ADV_DIFFICULTY==0 and "default") or (_G.TUNING.ADV_DIFFICULTY==1 and "rare") or (_G.TUNING.ADV_DIFFICULTY==2 and "default") or (_G.TUNING.ADV_DIFFICULTY==3 and "often") or "default"
    tasksetdata.overrides.dragonfly  =  "never"
    tasksetdata.overrides.bearger  =  (_G.TUNING.ADV_DIFFICULTY==0 and "never") or (_G.TUNING.ADV_DIFFICULTY==1 and "never") or (_G.TUNING.ADV_DIFFICULTY==2 and "rare") or (_G.TUNING.ADV_DIFFICULTY==3 and "default") or "never"
    tasksetdata.overrides.goosemoose  =  (_G.TUNING.ADV_DIFFICULTY==0 and "never") or (_G.TUNING.ADV_DIFFICULTY==1 and "never") or (_G.TUNING.ADV_DIFFICULTY==2 and "rare") or (_G.TUNING.ADV_DIFFICULTY==3 and "default") or "never"
    tasksetdata.overrides.antliontribute = "never"
    tasksetdata.overrides.hounds = (_G.TUNING.ADV_DIFFICULTY==0 and "default") or (_G.TUNING.ADV_DIFFICULTY==1 and "default") or (_G.TUNING.ADV_DIFFICULTY==2 and "often") or (_G.TUNING.ADV_DIFFICULTY==3 and "always") or "default"
    tasksetdata.overrides.season_start = GetModConfigData("startseasonarchipelago") or "default"
    tasksetdata.overrides.wormhole_prefab = "wormhole"
    tasksetdata.overrides.layout_mode = "LinkNodesByKeys"
    tasksetdata.overrides.start_location = "adv4"
    tasksetdata.overrides.autumn = GetModConfigData("autumnarchipelago") or "shortseason"
    tasksetdata.overrides.winter = GetModConfigData("winterarchipelago") or "shortseason"
    tasksetdata.overrides.spring = GetModConfigData("springarchipelago") or (_G.TUNING.ADV_DIFFICULTY==0 and "noseason") or "shortseason"
    tasksetdata.overrides.summer = GetModConfigData("summerarchipelago") or (_G.TUNING.ADV_DIFFICULTY==0 and "noseason") or "shortseason"
    tasksetdata.overrides.keep_disconnected_tiles = true
    tasksetdata.overrides.no_wormholes_to_disconnected_tiles = false
    tasksetdata.overrides.no_joining_islands = true
    
    -- ALWAYS with ocean! because wormhole placement can fail. Instead we will make thinkthank unavailable when setting is set to only wormholes and placement suceeded
    tasksetdata.overrides["has_ocean"] = true

    -- game mode settings
    tasksetdata.overrides.portalresurection = _G.TUNING.ADV_DIFFICULTY==1 and "always" or "none"
    tasksetdata.overrides.ghostenabled = "always"
    tasksetdata.overrides.ghostsanitydrain = "always"
    tasksetdata.overrides.basicresource_regrowth = "always"
    tasksetdata.overrides.spawnmode = "fixed"
    tasksetdata.overrides.resettime = "default"

    return tasksetdata
end

AdventureWorld.TwoWorlds = function(tasksetdata)
    
    -- tasksetdata.override_level_string=true -- test out what this does ?
    tasksetdata.tasks = {"Land of Plenty", -- Part 1 - Easy peasy - lots of stuff
                        "The other side",}  -- Part 2 - Lets kill them off
    tasksetdata.required_setpieces = {}
    tasksetdata.numoptionaltasks = 0
    tasksetdata.optionaltasks = {}
    tasksetdata.set_pieces = {                
            ["MaxPigShrine"] = {tasks={"Land of Plenty"}},
            ["MaxMermShrine"] = {tasks={"The other side"}},
            ["ResurrectionStone"] = { count=2, tasks={"Land of Plenty", "The other side" } },
            -- INFO: wormholes alternative code in tasksroomslayouts.lua as room_choices. This should be more secure than adding it as setpiece
            ["Wormhole_Mod"] = { count= 4, tasks={ "Land of Plenty", "The other side" } }, -- adds the setpiece at max once per task
            ["Wormhole_Mod2"] = { count= 4, tasks={ "Land of Plenty", "The other side" } }, -- adds the setpiece at max once per task
            }
    tasksetdata.numrandom_set_pieces = 0
    if not tasksetdata.ordered_story_setpieces then -- only use this for this mod, so for original DS adventure worlds!
        tasksetdata.ordered_story_setpieces = {}
    end
    for _,set in pairs(_G.TUNING.TELEPORTATOMOD.teleportato_layouts["forest"]) do
        table.insert(tasksetdata.ordered_story_setpieces,set)
    end
    tasksetdata.random_set_pieces = {}
    tasksetdata.ocean_prefill_setpieces = {} -- delete any ocean stuff
    tasksetdata.ocean_population = {} -- delete any ocean stuff
    tasksetdata.add_teleportato = true -- add teleportato within teleportato mod. ypu can set up _G.TUNING.TELEPORTATOMOD.teleportato_layouts to change the setpieces of them
    tasksetdata.required_prefabs = _G.ArrayUnion(required_prefabs,{"teleportato_base","teleportato_box","teleportato_crank","teleportato_ring","teleportato_potato"}) -- if ordered_story_setpieces is nil/empty, required_prefabs is set up in teleoprtato mod depending in settings there -- _G.ArrayUnion(required_prefabs,{"pigking"})
    if _G.TUNING.ADV_DIFFICULTY==0 then
        tasksetdata.substitutes = GetRandomSubstituteList(SUBS_1, 3)
    end
    if tasksetdata.overrides==nil then
        tasksetdata.overrides = {}
    end
    tasksetdata.overrides.day  =  GetModConfigData("daytwoworlds") or ((_G.TUNING.ADV_DIFFICULTY==0 and "default") or (_G.TUNING.ADV_DIFFICULTY==1 and "longday") or (_G.TUNING.ADV_DIFFICULTY==2 and "default") or (_G.TUNING.ADV_DIFFICULTY==3 and "longdusk") or "default") 
    tasksetdata.overrides.season_start  =  GetModConfigData("startseasontwoworlds") or "default"
    
    tasksetdata.overrides.weather = (_G.TUNING.ADV_DIFFICULTY==0 and "rare") or (_G.TUNING.ADV_DIFFICULTY==1 and "rare") or (_G.TUNING.ADV_DIFFICULTY==2 and "default") or (_G.TUNING.ADV_DIFFICULTY==3 and "often") or "rare" 
    
    tasksetdata.overrides.roads  =  "never"
    tasksetdata.overrides.dragonfly  =  "never"
    tasksetdata.overrides.bearger  =  (_G.TUNING.ADV_DIFFICULTY==0 and "never") or (_G.TUNING.ADV_DIFFICULTY==1 and "never") or (_G.TUNING.ADV_DIFFICULTY==2 and "rare") or (_G.TUNING.ADV_DIFFICULTY==3 and "default") or "never"
    tasksetdata.overrides.goosemoose  =  "never"
    tasksetdata.overrides.antliontribute = "never"
    tasksetdata.overrides.world_size = GetModConfigData("worldsizetwoworlds") or "medium"
    tasksetdata.overrides.wormhole_prefab = "wormhole"
    tasksetdata.overrides.layout_mode = "LinkNodesByKeys"
    tasksetdata.overrides.start_location = "adv5"
    tasksetdata.overrides.autumn = GetModConfigData("autumntwoworlds") or ((_G.TUNING.ADV_DIFFICULTY==1 and "veryshortseason") or (_G.TUNING.ADV_DIFFICULTY==0 and "verylongseason") or "noseason")
    tasksetdata.overrides.winter = GetModConfigData("wintertwoworlds") or "noseason"
    tasksetdata.overrides.spring = GetModConfigData("springtwoworlds") or "noseason"
    tasksetdata.overrides.summer = GetModConfigData("summertwoworlds") or (_G.TUNING.ADV_DIFFICULTY==0 and "noseason") or "verylongseason"
    tasksetdata.overrides.keep_disconnected_tiles = true
    tasksetdata.overrides.no_wormholes_to_disconnected_tiles = false
    tasksetdata.overrides.no_joining_islands = true
    
    -- ALWAYS with ocean! because wormhole placement can fail. Instead we will make thinkthank unavailable when setting is set to only wormholes and placement suceeded
    tasksetdata.overrides["has_ocean"] = true

    -- game mode settings
    tasksetdata.overrides.portalresurection = _G.TUNING.ADV_DIFFICULTY==1 and "always" or "none"
    tasksetdata.overrides.ghostenabled = "always"
    tasksetdata.overrides.ghostsanitydrain = "always"
    tasksetdata.overrides.basicresource_regrowth = "always"
    tasksetdata.overrides.spawnmode = "fixed"
    tasksetdata.overrides.resettime = "default"

    return tasksetdata
end

AdventureWorld.Darkness = function(tasksetdata)
    
    tasksetdata.tasks = {"Swamp start","Battlefield","Walled Kill the spiders","advSanity-Blocked Spider Queendom",}
    tasksetdata.numoptionaltasks = 2
    tasksetdata.optionaltasks = {"Killer bees!","Chessworld","Tentacle-Blocked The Deep Forest","advTentacle-Blocked Spider Swamp",
        "Trapped Forest hunters","Waspy The hunters","Hounded Magic meadow",}
    tasksetdata.set_pieces = {
            ["RuinedBase"] = {tasks={"Swamp start", "Battlefield", "Walled Kill the spiders", "Killer bees!"}},
            ["ResurrectionStoneLit"] = { count=4, tasks={"Swamp start", "Battlefield", "Walled Kill the spiders", "advSanity-Blocked Spider Queendom","Killer bees!",
            "Chessworld","Tentacle-Blocked The Deep Forest", "advTentacle-Blocked Spider Swamp","Trapped Forest hunters","Waspy The hunters","Hounded Magic meadow", }},}
    if _G.TUNING.ADV_DIFFICULTY==0 then
        tasksetdata.substitutes = _G.MergeMaps( {["pighouse"] = {perstory=1,weight=1,pertask=1}}, -- pighouses replaced by pigs (see resource_sub... gamefile)
                                 GetRandomSubstituteList(SUBS_1, 3) )
    else
        tasksetdata.substitutes = {["pighouse"] = {perstory=1,weight=1,pertask=1}}
    end
    tasksetdata.required_setpieces = {}
    tasksetdata.numrandom_set_pieces = 0
    if not tasksetdata.ordered_story_setpieces then -- only use this for this mod, so for original DS adventure worlds!
        tasksetdata.ordered_story_setpieces = {}
    end
    for _,set in pairs(_G.TUNING.TELEPORTATOMOD.teleportato_layouts["forest"]) do
        table.insert(tasksetdata.ordered_story_setpieces,set)
    end
    tasksetdata.random_set_pieces = {}
    tasksetdata.ocean_prefill_setpieces = {} -- delete any ocean stuff
    tasksetdata.ocean_population = {} -- delete any ocean stuff
    tasksetdata.add_teleportato = true -- add teleportato within teleportato mod. ypu can set up _G.TUNING.TELEPORTATOMOD.teleportato_layouts to change the setpieces of them
    tasksetdata.required_prefabs = _G.ArrayUnion(required_prefabs,{"teleportato_base","teleportato_box","teleportato_crank","teleportato_ring","teleportato_potato"}) -- if ordered_story_setpieces is nil/empty, required_prefabs is set up in teleoprtato mod depending in settings there
    if tasksetdata.overrides==nil then
        tasksetdata.overrides = {}
    end
    tasksetdata.overrides.branching = "never"
    tasksetdata.overrides.day = GetModConfigData("daydarkness") or "onlynight"
    tasksetdata.overrides.season_start = GetModConfigData("startseasondarkness") or "autumn"
    tasksetdata.overrides.weather = "often"

    tasksetdata.overrides.boons = "always"
    
    tasksetdata.overrides.roads = "never"
    tasksetdata.overrides.berrybush = "never"
    
    if forest_map.TRANSLATE_TO_CLUMP~=nil then
        tasksetdata.overrides.ADV_clump_spiders = "ADV_allmap_often"
        tasksetdata.overrides.ADV_clump_fireflies = (_G.TUNING.ADV_DIFFICULTY==3 and "ADV_allmap_often") or "ADV_allmap_always"
        tasksetdata.overrides.ADV_clump_bunnymen = (_G.TUNING.ADV_DIFFICULTY==0 and "ADV_allmap_never") or (_G.TUNING.ADV_DIFFICULTY==1 and "mostly") or "ADV_allmap_often"
        tasksetdata.overrides.ADV_clump_flower_cave = (_G.TUNING.ADV_DIFFICULTY==0 and "ADV_allmap_never") or (_G.TUNING.ADV_DIFFICULTY==1 and "ADV_allmap_always") or (_G.TUNING.ADV_DIFFICULTY==2 and "ADV_allmap_mostly") or (_G.TUNING.ADV_DIFFICULTY==3 and "ADV_allmap_often") or "ADV_allmap_never"
        tasksetdata.overrides.ADV_clump_maxwelllight_area = (_G.TUNING.ADV_DIFFICULTY==0 and "ADV_allmap_always") or (_G.TUNING.ADV_DIFFICULTY==1 and "ADV_allmap_always") or (_G.TUNING.ADV_DIFFICULTY==2 and "ADV_allmap_mostly") or (_G.TUNING.ADV_DIFFICULTY==3 and "ADV_allmap_often") or "ADV_allmap_always" 
        tasksetdata.overrides.ADV_clump_pigtorch = (_G.TUNING.ADV_DIFFICULTY==0 and "ADV_allmap_never") or "ADV_allmap_often"
    else
        tasksetdata.overrides.spiders = "often"
        tasksetdata.overrides.fireflies = (_G.TUNING.ADV_DIFFICULTY==3 and "often") or "always"
        tasksetdata.overrides.bunnymen = (_G.TUNING.ADV_DIFFICULTY==0 and "never") or (_G.TUNING.ADV_DIFFICULTY==1 and "default") or (_G.TUNING.ADV_DIFFICULTY==2 and "rare") or (_G.TUNING.ADV_DIFFICULTY==3 and "rare") or "never"
        tasksetdata.overrides.flower_cave = (_G.TUNING.ADV_DIFFICULTY==0 and "never") or (_G.TUNING.ADV_DIFFICULTY==1 and "always") or (_G.TUNING.ADV_DIFFICULTY==2 and "often") or (_G.TUNING.ADV_DIFFICULTY==3 and "rare") or "never"
        tasksetdata.overrides.maxwelllight_area = (_G.TUNING.ADV_DIFFICULTY==0 and "always") or (_G.TUNING.ADV_DIFFICULTY==1 and "always") or (_G.TUNING.ADV_DIFFICULTY==2 and "often") or (_G.TUNING.ADV_DIFFICULTY==3 and "rare") or "always" 
        tasksetdata.overrides.pigtorch = (_G.TUNING.ADV_DIFFICULTY==0 and "never") or (_G.TUNING.ADV_DIFFICULTY==1 and "often") or (_G.TUNING.ADV_DIFFICULTY==2 and "default") or (_G.TUNING.ADV_DIFFICULTY==3 and "rare") or "never" 
    end

    tasksetdata.overrides.dragonfly  =  "never"
    tasksetdata.overrides.bearger  =  (_G.TUNING.ADV_DIFFICULTY==0 and "never") or (_G.TUNING.ADV_DIFFICULTY==1 and "never") or (_G.TUNING.ADV_DIFFICULTY==2 and "rare") or (_G.TUNING.ADV_DIFFICULTY==3 and "default") or "never"
    tasksetdata.overrides.goosemoose  =  "never"
    tasksetdata.overrides.antliontribute = "never"
    tasksetdata.overrides.world_size = GetModConfigData("worldsizedarkness") or "medium"
    tasksetdata.overrides.wormhole_prefab = "wormhole"
    tasksetdata.overrides.layout_mode = "LinkNodesByKeys"
    tasksetdata.overrides.start_location = "adv6"
    tasksetdata.overrides.autumn = GetModConfigData("autumndarkness") or ((_G.TUNING.ADV_DIFFICULTY==0 and "verylongseason") or (_G.TUNING.ADV_DIFFICULTY==1 and "shortseason") or (_G.TUNING.ADV_DIFFICULTY==2 and "veryshortseason") or (_G.TUNING.ADV_DIFFICULTY==3 and "noseason") or "noseason")
    tasksetdata.overrides.winter = GetModConfigData("winterdarkness") or "noseason"
    tasksetdata.overrides.spring = GetModConfigData("springdarkness") or "noseason"
    tasksetdata.overrides.summer = GetModConfigData("summerdarkness") or ((_G.TUNING.ADV_DIFFICULTY==0 and "noseason") or (_G.TUNING.ADV_DIFFICULTY==1 and "shortseason") or (_G.TUNING.ADV_DIFFICULTY==2 and "default") or (_G.TUNING.ADV_DIFFICULTY==3 and "verylongseason") or "verylongseason")
    tasksetdata.overrides.keep_disconnected_tiles = true
    tasksetdata.overrides.no_wormholes_to_disconnected_tiles = true
    tasksetdata.overrides.no_joining_islands = true
    
    -- ALWAYS with ocean! because wormhole placement can fail. Instead we will make thinkthank unavailable when setting is set to only wormholes and placement suceeded
    tasksetdata.overrides["has_ocean"] = true
    
    -- game mode settings
    tasksetdata.overrides.portalresurection = _G.TUNING.ADV_DIFFICULTY==1 and "always" or "none"
    tasksetdata.overrides.ghostenabled = "always"
    tasksetdata.overrides.ghostsanitydrain = "always"
    tasksetdata.overrides.basicresource_regrowth = "always"
    tasksetdata.overrides.spawnmode = "fixed"
    tasksetdata.overrides.resettime = "default"
    
    return tasksetdata
end

AdventureWorld.MaxwellHome = function(tasksetdata)
    
    -- tasksetdata.nomaxwell=true
    tasksetdata.hideminimap = true
    -- tasksetdata.teleportaction = "restart"
    -- tasksetdata.teleportmaxwell = "ADVENTURE_6_TELEPORTFAIL"
    tasksetdata.tasks = {"MaxHome"}
    tasksetdata.required_setpieces = {}
    tasksetdata.numoptionaltasks = 0
    tasksetdata.optionaltasks = {}
    tasksetdata.set_pieces = {} -- vermutlich keine
    tasksetdata.numrandom_set_pieces = 0
    tasksetdata.random_set_pieces = {}
    tasksetdata.required_prefabs = {}
    tasksetdata.ocean_prefill_setpieces = {} -- delete any ocean stuff
    tasksetdata.ocean_population = {} -- delete any ocean stuff
    if tasksetdata.overrides==nil then
        tasksetdata.overrides = {}
    end
    tasksetdata.overrides.start_location = "adv7"  --- wenn wir keine startlocation zufügen, wird default verwendet, welches default setpiece und clearing verwendet, welches ein multiplayer portal beinhaltet.
    tasksetdata.overrides.wormhole_prefab = "wormhole"
    tasksetdata.overrides.layout_mode = "LinkNodesByKeys"  
    tasksetdata.overrides.day  =  "onlynight" 
    tasksetdata.overrides.weather  =  "never"
    tasksetdata.overrides.creepyeyes  =  "always"
    tasksetdata.overrides.roads  =  "never"
    tasksetdata.overrides.boons  =  "never"
    tasksetdata.overrides.deerclops = "never"
    tasksetdata.overrides.dragonfly  =  "never"
    tasksetdata.overrides.bearger  =  "never"
    tasksetdata.overrides.goosemoose  =  "never"
    tasksetdata.overrides.antliontribute = "never"
    tasksetdata.overrides.hounds  =  "never"
    tasksetdata.overrides.world_size = "medium"
    tasksetdata.overrides.autumn = "verylongseason"
    tasksetdata.overrides.winter = "noseason"
    tasksetdata.overrides.spring = "noseason"
    tasksetdata.overrides.summer = "noseason"
    tasksetdata.overrides.keep_disconnected_tiles = true
    tasksetdata.overrides.no_wormholes_to_disconnected_tiles = true
    tasksetdata.overrides.no_joining_islands = true
    -- ALWAYS with ocean! because wormhole placement can fail. Instead we will make thinkthank unavailable when setting is set to only wormholes and placement suceeded
    tasksetdata.overrides["has_ocean"] = true
    
    -- game mode settings
    tasksetdata.overrides.portalresurection = _G.TUNING.ADV_DIFFICULTY==1 and "always" or "none"
    tasksetdata.overrides.ghostenabled = "always"
    tasksetdata.overrides.ghostsanitydrain = "always"
    tasksetdata.overrides.basicresource_regrowth = "always"
    tasksetdata.overrides.spawnmode = "fixed"
    tasksetdata.overrides.resettime = "default"
    
    return tasksetdata
end

return AdventureWorld