local assets = {
	Asset("ANIM", "anim/maxwell_build.zip"),
    Asset("ANIM", "anim/max_fx.zip"),
    Asset("ANIM", "anim/maxwell_basic.zip"),
	Asset("ANIM", "anim/maxwell_adventure.zip"),
	Asset("SOUND", "sound/maxwell.fsb"),
}

local OnTalk = function(inst)
    inst.AnimState:PlayAnimation("dialog_pre")
    inst.AnimState:PushAnimation("dial_loop", true)
end

local DoneTalking = function(inst)
    inst.AnimState:PlayAnimation("dialog_pst")
    inst.AnimState:PushAnimation("idle", true)
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
	inst.entity:AddNetwork()

	inst.DynamicShadow:SetSize( 1.75, .75 )
    inst.Transform:SetTwoFaced()

    inst.AnimState:SetBank("maxwell")
    inst.AnimState:SetBuild("maxwell_build")
    inst.AnimState:PlayAnimation("appear")
    
    inst:AddComponent("talker")
    inst.components.talker.fontsize = 28
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(133/255, 140/255, 167/255)
    inst.components.talker.offset = Vector3(0,-600,0)

    inst.entity:SetPristine()
	
	 if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:ListenForEvent("ontalk", OnTalk)
    inst:ListenForEvent("donetalking", DoneTalking)
    
	inst.persists = false

    return inst
end

return Prefab("maxwell", fn, assets), 
    MakePlacer("maxwell", "maxwell", "maxwell_build", "appear")
