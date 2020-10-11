--Crop Farming 
--Turn to Function
local blocks = game:GetService("Workspace").Islands["474019491-island"].Blocks
local plr = game.Players.LocalPlayer
local chr = plr.Character
local hum = chr.HumanoidRootPart
local function harvest(crop)
    for _,v in next,blocks:GetChildren() do
        if v.Name == crop then
            hum.CFrame = v.CFrame
            game:GetService("ReplicatedStorage").Remotes.Functions["CLIENT_HARVEST_CROP_REQUEST"]:InvokeServer({["model"] = v,["player"] = plr})
        end
    end
end
local function crop(name)
    for _,v in next,blocks:GetChildren() do
        if v.Name == name then
            hum.CFrame = v.CFrame
            game:GetService("ReplicatedStorage").Remotes.Functions["CLIENT_HARVEST_CROP_REQUEST"]:InvokeServer({["model"] = v,["player"] = plr})
            game:GetService("ReplicatedStorage").Remotes.Functions["CLIENT_BLOCK_PLACE_REQUEST"]:InvokeServer({["model"] = v,["cframe"] = hum.CFrame})
        end
    end
end
chr.grapeSeeds
--Spawnables
--[[local plr = game.Players.LocalPlayer
local chr = plr.Character
local hum = chr.HumanoidRootPart]]
for _,v in next, game:GetService("Workspace").Islands["474019491-island"].Blocks:GetChildren() do
	if string.match(v.Name,"Rock") then
		hum.CFrame = v.CFrame
		wait(.5)
		game:GetService("ReplicatedStorage").Remotes.Functions["CLIENT_BLOCK_HIT_REQUEST"]:InvokeServer({
		["secret"]="mullet",
		["part"]=v.MeshPart,
		["block"]=v,
		["norm"]=v.CFrame,
		["pos"]=Vector3.new(0,1,0)})
	end
end