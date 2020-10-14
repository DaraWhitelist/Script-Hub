local library = loadstring(game:HttpGet("https://pastebin.com/raw/r0cp9NrM"))();
local player = game.Players.LocalPlayer
local hum = player.Character.HumanoidRootPart
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local ClientModules = ReplicatedStorage.ClientModules;
local v5 = require(ClientModules.UI.Utility)
local UI = player.PlayerGui:WaitForChild("UI")
local world= UI:WaitForChild("World")
local Interact = world:WaitForChild("Interact");
local Exit = world:WaitForChild("Exit");
local OnScreen = player.PlayerGui.UI.OnScreen
local sel1
local Common = "0.631373, 0.647059, 0.635294"
local Rare = "0.768627, 0.156863, 0.109804"
local Epic = "0.294118, 0.592157, 0.294118"
local Ultra = "0.0352941, 0.537255, 0.811765"
local Legendary = "0.419608, 0.196078, 0.486275"
-- functions that I use
local function rarity(petName)
	for _,v in next,player.PlayerGui.UI.Items.Frames.Pets.Items:GetChildren() do
		if v:IsA("ImageLabel") and petName == v.ItemName.Value then
			print(v.ItemName.Value)
			local color = tostring(v.Colored.ImageColor3)
			if  color == Common then 
				return "Common"
			end 
			if  color == Rare then 
				return "Rare"
			end 
			if  color == Epic then 
				return "Epic"
			end 
			if  color == Ultra then 
				return "Ultra"
			end 
			if color == Legendary then
				return "Legendary"
			end
		end
	end
	return "Unknown"
end
local function farming(area,type)
	for _,v in next,game:GetService("Workspace")["Resources"]["Ores"]["World_1"][area]:GetDescendants() do
		if v.Name and string.match(v.Name,type) then
			game:GetService("ReplicatedStorage")["Events"]["Server"]["RequestSwing"]:InvokeServer(v)	
		end
	end
end
local function shiny()
    for _,v in next,player.PlayerGui.UI.Items.Frames.Pets.Items:GetDescendants() do
        if v:IsA("ImageLabel") and v.Parent and v.Parent.Name == "Items" and v.ItemName.Value ~= "Razorfish" and v.Lock.isLoaded == false then
            game:GetService("ReplicatedStorage").Events.Server.RequestPetCraft:InvokeServer(v.ItemId.Value)
        end
    end
end
--Mining Ore
local MineOre = library:CreateWindow("--Ore Farm--")
MineOre:AddToggle("Gold Ore", function(state)
	getgenv().goldore = state
	
	while wait() do
		if getgenv().goldore ==true then
			local args = {
				[1] = workspace.Resources.Ores.World_1.Center_Ores.VIP
			}
			game:GetService("ReplicatedStorage").Events.Server.RequestSwing:InvokeServer(unpack(args))
		end
	end
end)

MineOre:AddToggle("Center Ore", function(state)
	    getgenv().center = state
		
	while wait() do
		if getgenv().center == true then
			for _,v in next,game:GetService("Workspace")["Resources"]["Ores"]["World_1"]["Center_Ores"]:GetChildren() do
				if player["world"].Value == "Halloween 2020" and v.Name == "Candy_Corn_1" then
					for i=1,10 do
                    	game:GetService("ReplicatedStorage")["Events"]["Server"]["RequestSwing"]:InvokeServer(v)
                    end
                end
                if v.Name and player["world"].Value~= "Halloween 2020" and string.match(v.Name,"Ore_"..player["island"].Value) then
                    for i=1,10 do
                    	game:GetService("ReplicatedStorage")["Events"]["Server"]["RequestSwing"]:InvokeServer(v)
                    end
                end
            end
        end
    end
end)

MineOre:AddToggle("Farm All", function(state)
	getgenv().FarmA = state
	
	while wait() do
		if getgenv().FarmA == true then
			for _,v in next,game:GetService("Workspace")["Resources"]["Ores"]["World_1"]:GetDescendants() do
				if v.Name and string.match(v.Name,"Ore") and v.Parent ~= "Center_Ores" then
					for i=1,6 do
						game:GetService("ReplicatedStorage")["Events"]["Server"]["RequestSwing"]:InvokeServer(v)
					end	
				end
			end
		end
	end
end)
MineOre:AddToggle("Farm Starter", function(state) 
getgenv().FarmS = state 
	while wait() do
		if getgenv().FarmS then
			farming("Island_1","Ore")
		end
	end
end)
MineOre:AddToggle("Farm Grassland",function(state) 
	getgenv().GrassOre = state
	while wait() do
		if getgenv().GrassOre then
			farming("Island_2","Ore")
		end
	end 
end)
MineOre:AddToggle("Farm Desert",function(state) 
	getgenv().DesertOre = state
	while wait() do
		if getgenv().DesertOre then
			farming("Island_3","Ore")
		end
	end 
end)
MineOre:AddToggle("Farm Jungle",function(state) 
	getgenv().JungleOre = state
	while wait() do
		if getgenv().JungleOre then
			farming("Island_4","Ore")
		end
	end 
end)
MineOre:AddToggle("Farm Frozen",function(state) 
	getgenv().FrozenOre = state
	while wait() do
		if getgenv().FrozenOre then
			farming("Island_5","Ore")
		end
	end 
end)
MineOre:AddToggle("Farm Space",function(state) 
	getgenv().SpaceOre = state
	while wait() do
		if getgenv().SpaceOre then
			farming("Island_6","Ore")
		end
	end 
end)
MineOre:AddToggle("Farm Alien",function(state) 
	getgenv().AlienOre = state
	while wait() do
		if getgenv().AlienOre then
			farming("Island_7","Ore")
		end
	end 
end)
