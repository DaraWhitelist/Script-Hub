local library = loadstring(game:HttpGet("https://pastebin.com/raw/r0cp9NrM"))();
local player = game.Players.LocalPlayer
local hum = player.Character.HumanoidRootPart
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local ClientModules = ReplicatedStorage.ClientModules;
local v5 = require(ClientModules.UI.Utility)
local UI = player.PlayerGui:WaitForChild("UI")
local Items = UI:WaitForChild("Items");
local world= UI:WaitForChild("World")
local Interact = world:WaitForChild("Interact");
local Exit = world:FindFirstChild("Exit");
local OnScreen = player.PlayerGui.UI.OnScreen
local sel1
local Common = "0.631373, 0.647059, 0.635294"
local Rare = "0.768627, 0.156863, 0.109804"
local Epic = "0.294118, 0.592157, 0.294118"
local Ultra = "0.0352941, 0.537255, 0.811765"
local Legendary = "0.419608, 0.196078, 0.486275"
local vu = game:GetService("VirtualUser")
player.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
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
local function sell(rare)
	for _,v in next,player.PlayerGui.UI.Items.Frames.Pets.Items:GetChildren() do
		if v.Name ~= "Sorter" then
		if v:FindFirstChild("ItemName") and string.match(rare,rarity(v.ItemName.Value)) then
			game:GetService("ReplicatedStorage")["Events"]["Server"]["DeletePet"]:InvokeServer(v.ItemId.Value)
		end
		end
	end
end
local function sell2(petName)
    for _,v in next,player.PlayerGui.UI.Items.Frames.Pets.Items:GetDescendants() do
        if v:IsA("ImageLabel") and v.Parent and v.Parent.Name == "Items"and v.Lock.isLoaded == false then
            if v.ItemName.Value==petName then
                game:GetService("ReplicatedStorage")["Events"]["Server"]["DeletePet"]:InvokeServer(v.ItemId.Value)
            end
        end
    end
end
--Ore Farm 
local Farming = library:CreateWindow("Farming")
Farming:AddLabel("ORE FARM")
Farming:AddToggle("Gold Ore", function(state)
	getgenv().goldore = state
	
	while wait() do
		if getgenv().goldore then
			local args = {
				[1] = workspace.Resources.Ores.World_1.Center_Ores.VIP
			}
			game:GetService("ReplicatedStorage").Events.Server.RequestSwing:InvokeServer(unpack(args))
		end
	end
end)

Farming:AddToggle("Center Ore", function(state)
	    getgenv().center = state
		
	while wait() do
		if getgenv().center == true then
			for _,v in next,game:GetService("Workspace")["Resources"]["Ores"]["World_1"]["Center_Ores"]:GetChildren() do
				if player["world"].Value == "Halloween 2020" and string.match(v.Name,"Candy_Corn_"..player["island"].Value) then
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

Farming:AddToggle("Farm All", function(state)
	getgenv().FarmA = state
	
	while wait() do
		if getgenv().FarmA then
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
Farming:AddToggle("Farm Starter",function(state) 
	getgenv().FarmS = state 
		while wait() do
			if getgenv().FarmS then
				farming("Island_1","Ore")
			end
		end
end)
Farming:AddToggle("Farm Grassland",function(state) 
	getgenv().GrassOre = state
	while wait() do
		if getgenv().GrassOre then
			farming("Island_2","Ore")
		end
	end 
end)
Farming:AddToggle("Farm Desert",function(state) 
	getgenv().DesertOre = state
	while wait() do
		if getgenv().DesertOre then
			farming("Island_3","Ore")
		end
	end 
end)
Farming:AddToggle("Farm Jungle",function(state) 
	getgenv().JungleOre = state
	while wait() do
		if getgenv().JungleOre then
			farming("Island_4","Ore")
		end
	end 
end)
Farming:AddToggle("Farm Frozen",function(state) 
	getgenv().FrozenOre = state
	while wait() do
		if getgenv().FrozenOre then
			farming("Island_5","Ore")
		end
	end 
end)
Farming:AddToggle("Farm Space",function(state) 
	getgenv().SpaceOre = state
	while wait() do
		if getgenv().SpaceOre then
			farming("Island_6","Ore")
		end
	end 
end)
Farming:AddToggle("Farm Alien",function(state) 
	getgenv().AlienOre = state
	while wait() do
		if getgenv().AlienOre then
			farming("Island_7","Ore")
		end
	end 
end)
Farming:AddLabel("GEM FARM")
Farming:AddToggle("Farm All",function(state)
	getgenv().FarmA = state
	while wait(.001) do
        if getgenv().FarmA then
			farming("Island_1","Gem")
			farming("Island_2","Gem")
			farming("Island_3","Gem")
			farming("Island_4","Gem")
			farming("Island_5","Gem")
			farming("Island_6","Gem")
			farming("Island_7","Gem")
        end
    end
end)
--Gem Farm
Farming:AddToggle("Farm Starter",function(state)
	getgenv().FarmS = state
	while wait() do
		if getgenv().FarmS then
			farming("Island_1","Gem")
		end
	end
end)
Farming:AddToggle("Farm Grassland",function(state)
	getgenv().GrassGem = state
	while wait() do
		if getgenv().GrassGem then
			farming("Island_2","Gem")
		end
	end
end)
Farming:AddToggle("Farm Desert",function(state)
	getgenv().DesertGem=state
	while wait() do
		if getgenv().DesertGem then
			farming("Island_3","Gem")
		end
	end
end)
Farming:AddToggle("Farm Jungle",function(state)
	getgenv().JungleGem=state
	while wait() do
		if getgenv().JungleGem then
			farming("Island_4","Gem")
		end
	end
end)
Farming:AddToggle("Farm Frozen",function(state)
	getgenv().FrozenGem=state
	while wait() do
		if getgenv().FrozenGem then
			farming("Island_5","Gem")
		end
	end
end)
Farming:AddToggle("Farm Space",function(state)
	getgenv().SpaceGem=state
	while wait() do
		if getgenv().SpaceGem then
			farming("Island_6","Gem")
		end
	end
end)
Farming:AddToggle("Farm Alien",function(state)
	getgenv().AlienGem=state
	while wait() do
		if getgenv().AlienGem then
			farming("Island_7","Gem")
		end
	end
end)
--Teleport
local Teleport = library:CreateWindow("Teleport")

local function teleport(place,num,boolV)
	local c= "Exit"
	if boolV then
		c = "Enter"
	end
	local island = game:GetService("Workspace").Resources.Interaction.Worlds[place].Islands[num][c]
	game:GetService("ReplicatedStorage").Events.Server.RequestIslandTeleport:InvokeServer(place,num,island)
end
Teleport:AddButton("Spawn",function()
	local spawn = game:GetService("Workspace").Spawn
	hum.CFrame = spawn.CFrame
end)

Teleport:AddButton("Grassland",function()
	teleport("1","2")
end)
Teleport:AddButton("Desert",function()
	teleport("1","3")
end)
Teleport:AddButton("Jungle",function()
	teleport("1","4")
end)
Teleport:AddButton("Frozen",function()
	teleport("1","5")
end)
Teleport:AddButton("Space",function()
	teleport("1","6")
end)
Teleport:AddButton("Alien",function()
	teleport("1","7")
end)
Teleport:AddButton("Halloween",function()
	teleport("Halloween 2020","2",true)
end)
Teleport:AddButton("Skeleton Island",function()
	teleport("Halloween 2020","2")
end)
Teleport:AddButton("Witch Island",function()
	teleport("Halloween 2020","3")
end)

--Pets
local Pets = library:CreateWindow("Pet Stuff")
local eggChoice
local oh2
Pets:AddLabel("Open Eggs")
Pets:AddDropDown("Eggs","petEgg",{
	"Starter Egg 250 Coins",
	"Gold Egg 750 Gems",
	"Grass Egg 6K Gems",
	"1M Egg 8K Gems",
	"Desert Egg 40K Gems",
	"Jungle Egg 60K Gems",
	"Ice Egg 200K Gems",
	"Space Egg 450K Gems",
	"Alien Egg 800K Gems",
	"Pumpkin Egg 500 Candy",
	"Terror Egg 60K Candy",
	"Skeleton Egg 180K Candy",
	"Witch Egg 25M Candy"
},function(choice)
	eggChoice = choice
end)
Pets:AddDropDown("#Eggs to Open","#Eggs",{
	"1",
	"3"
},function(choice)
	oh2 = choice
end)
Pets:AddToggle("Open Egg",function(state)
	getgenv().openEgg = state
	while wait() do
		if getgenv().openEgg == true then
			if string.match(eggChoice,"Starter") then
				oh1 = "1"
			end
			if string.match(eggChoice,"Gold") then
				oh1 = "2"
			end
			if string.match(eggChoice,"Grass") then
				oh1 = "3"
			end
			if string.match(eggChoice,"Desert") then
				oh1 = "4"
			end
			if string.match(eggChoice,"Jungle") then
				oh1 = "5"
			end
			if string.match(eggChoice,"Ice") then
				oh1 = "6"
			end
			if string.match(eggChoice,"1M") then
				oh1 = "1M"
			end
			if string.match(eggChoice,"Space") then
				oh1 = "7"
			end
			if string.match(eggChoice,"Alien") then
				oh1 = "8"
			end
			if string.match(eggChoice,"Pumpkin") then
				oh1 = "Pumpkin"
			end
			if string.match(eggChoice,"Terror") then
				oh1 = "Terror"
			end
			if string.match(eggChoice,"Skeleton") then
				oh1 = "Skeleton"
			end
			if string.match(eggChoice,"Witch") then
				oh1 = "Witch"
			end
            game:GetService("ReplicatedStorage")["Events"]["Server"]["BuyEgg"]:InvokeServer(oh1,tonumber(oh2))
        end
    end
end)

Pets:AddLabel("Pets Sell")
Pets:AddToggle("Activate",function(state)
	getgenv().display = state
	while wait() do
		if getgenv().display == true then
			v5.DisplayPage(player, UI, Items)
		end
	end
end)
Pets:AddToggle("Sell All Common",function(state)
	getgenv().Common=state
	while wait() do
		if getgenv().Common == true then
			sell("Common")
		end
	end
end)
Pets:AddToggle("Sell All Rare",function(state)
	getgenv().Rare=state
	while wait() do
		if getgenv().Rare == true then
			sell("Rare")
		end
	end
end)
Pets:AddToggle("Sell All Epic",function(state)
	getgenv().Epic=state
	while wait() do
		if getgenv().Epic == true then
			sell("Epic")
		end
	end
end)
Pets:AddToggle("Sell All Ultra",function(state)
	getgenv().Ultra=state
	while wait() do
		if getgenv().Ultra == true then
			sell("Ultra")
		end
	end
end)
local legendPet
Pets:AddDropDown("Sell Specific Legendary","LegendSell",{
	"Parrot",
	"Anubis",
	"Rocket",
	"Ice Wyvern",
	"The Mummy"
},function(choice)
	legendPet=choice
end)
Pets:AddToggle("Legendary Sell",function(state)
	getgenv().legendSell = state
	while wait() do
		if getgenv().legendSell == true then
			sell2(legendPet)
		end
	end
end)

Pets:AddLabel("Other Pet Stuff")
Pets:AddToggle("Auto Shiny",function(state)
	getgenv().shiny = state
	while wait() do
		if getgenv().shiny == true then
			shiny()
		end
	end
end)
Pets:AddToggle("Auto Best Ore",function(state)
	getgenv().Ore = state
	while wait() do
		if getgenv().Ore == true then
			game:GetService("ReplicatedStorage").Events.Server.BestOre:InvokeServer()
		end
	end
end)
Pets:AddToggle("Auto Best Gem",function(state)
	getgenv().Gem = state
	while wait() do
		if getgenv().Gem == true then
			game:GetService("ReplicatedStorage").Events.Server.BestGem:InvokeServer()
		end
	end
end)
Pets:AddToggle("Auto Best Coins",function(state)
	getgenv().Coin = state
	while wait() do
		if getgenv().Coin == true then
			game:GetService("ReplicatedStorage").Events.Server.BestCoin:InvokeServer()
		end
	end
end)

local Misc = library:CreateWindow("--==Misc==--")
--KeyBind
Misc:AddKeyBind("Toggle Key",Enum.KeyCode.RightShift, function()
    if game:GetService("CoreGui")["nigga"].Enabled then 
        game:GetService("CoreGui")["nigga"].Enabled = false
    else
        game:GetService("CoreGui")["nigga"].Enabled = true
    end
end)
--/ Destroy GUI \--
Misc:AddButton("Destroy GUI",function()
	game:GetService("CoreGui")["nigga"]:Destroy()
end)
local Credits = library:CreateWindow("Credits")
Credits:AddLabel("Script Created By:\nDeidara#2637")
Credits:AddLabel("---====Discord Server====---")
Credits:AddButton("Copy Discord Server Link", function()

	setclipboard("https://discord.gg/GpXjWhD")

end)
if OnScreen:FindFirstChild("Sell") then
	sel1 = OnScreen.Sell:Clone()
	sel1.Name = "Sell2"
	sel1.Parent = OnScreen
	OnScreen.Sell:Destroy()
end
local sellArea = game:GetService("Workspace").Resources.Interaction.Sell["1"]
OnScreen.Sell2.Button.MouseButton1Click:Connect(function()
	local placeHolder = hum.CFrame
	hum.CFrame  = sellArea.CFrame
	wait(.5)
	hum.CFrame = placeHolder
end)