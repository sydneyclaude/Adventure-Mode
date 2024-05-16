local AddStategraphState = AddStategraphState
GLOBAL.setfenv(1, GLOBAL)

local states = {
    State{ 
        name = "throne_sit",
        tags = { "busy", "nopredict", "nomorph" },
        onenter = function(inst)
            inst.components.locomotor:StopMoving()
            inst.AnimState:Hide("ARM_carry") 
            inst.AnimState:Show("ARM_normal")
            inst.AnimState:PlayAnimation("appear")
            inst.AnimState:PushAnimation("throne_loop", true)
        end,
    },
}

for k, v in pairs(states) do
    AddStategraphState("wilson", v) 
end