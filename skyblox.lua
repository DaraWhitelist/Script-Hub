local islands = {
    Vector3.new(82.2911148, 181.00087, -636.676453, -0.192075238, -5.48558132e-09, -0.981380224, 2.24475851e-08, 1, -9.98308991e-09, 0.981380224, -2.39471198e-08, -0.192075238),
    Vector3.new(707.517151, 189.787491, -198.329605, -0.825760007, 7.00507954e-08, -0.564021647, 1.42222973e-07, 1, -8.40238386e-08, 0.564021647, -1.49600353e-07, -0.825760007),
    Vector3.new(1423.55981, 387.04718, 32.6220703, -0.744653523, -5.19697032e-08, -0.667451382, -2.61031801e-08, 1, -4.87404463e-08, 0.667451382, -1.8872143e-08, -0.744653523),
    Vector3.new(1758.17017, 408.255035, -969.620361, 0.816521823, 8.83404027e-06, -0.577314556, -7.81683138e-06, 1, 4.24625796e-06, 0.577314556, 1.04560866e-06, 0.816521823),
    Vector3.new(705.10376, 269.007538, -1899.28613, 0.316972256, -1.43609853e-08, 0.94843483, -6.47603144e-08, 1, 3.67850355e-08, -0.94843483, -7.30807699e-08, 0.316972256)

}
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