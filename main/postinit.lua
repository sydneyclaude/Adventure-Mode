local modimport = modimport
GLOBAL.setfenv(1, GLOBAL)

modimport("postinit/entityscript")

local postinit = {
    prefabs = {
        "wormhole",
        "player_classified",
    },
    stategraphs = {
        "SGwilson",
        "SGwilson_client",
    },
    components = {
    },
    widgets = {
    },
    multipleprefabs = {
    },
}

for k, v in pairs(postinit) do
    for i = 1, #v do
        modimport("postinit/" .. k .. "/" .. postinit[k][i])
    end
end
