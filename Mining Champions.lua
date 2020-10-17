local player = game.Players.LocalPlayer
local hum = player.Character.HumanoidRootPart
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local ClientModules = ReplicatedStorage.ClientModules;
local v5 = require(ClientModules.UI.Utility)
local UI = player.PlayerGui:WaitForChild("UI")
local world= UI:WaitForChild("World")
local Interact = world:WaitForChild("Interact");
local Exit = world:FindFirstChild("Exit");
local OnScreen = player.PlayerGui.UI.OnScreen
local sel1
local library = loadstring(game:HttpGet("https://pastebin.com/raw/JsdM2jiP",tR1e))()
local Common = "0.631373, 0.647059, 0.635294"
local Rare = "0.768627, 0.156863, 0.109804"
local Epic = "0.294118, 0.592157, 0.294118"
local Ultra = "0.0352941, 0.537255, 0.811765"
local Legendary = "0.419608, 0.196078, 0.486275"
library.options.underlinecolor = "rainbow"
local vu = game:GetService("VirtualUser")
player.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

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
-- Mining Champion Tab
local Mining = library:CreateWindow("Mining Champion")
Mining:Section("-Gold Ore Farm -")
local FarmOre = Mining:Toggle("Farm Gold Ore", {flag = "G0"})
spawn(function()
	while wait(.01) do
		if Mining.flags.G0 then
			local args = {
				[1] = workspace.Resources.Ores.World_1.Center_Ores.VIP
			}
		
			game:GetService("ReplicatedStorage").Events.Server.RequestSwing:InvokeServer(unpack(args))
		end
	end
end)
Mining:Section("- Ore Farm -")
local FarmOre = Mining:Toggle("Farm Center Ore", {flag = "center"})
local FarmOre = Mining:Toggle("Farm All", {flag = "O0"})
local FarmOre = Mining:Toggle("Farm Starter", {flag = "O1"})
local FarmOre = Mining:Toggle("Farm Grassland", {flag = "O2"})
local FarmOre = Mining:Toggle("Farm Desert", {flag = "O3"})
local FarmOre = Mining:Toggle("Farm Jungle", {flag = "O4"})
local FarmOre = Mining:Toggle("Farm Frozen", {flag = "O5"})
local FarmOre = Mining:Toggle("Farm Space", {flag = "O6"})
local FarmOre = Mining:Toggle("Farm Alien", {flag = "O7"})
-- AutoFarm
spawn(function()
    while wait(.01) do
        if Mining.flags.center then
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
spawn(function()
    while wait(.01) do
		if Mining.flags.O0 then
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
spawn(function()
    while wait(.01) do
		if Mining.flags.O1 then
			farming("Island_1","Ore")
		end
	end
end)
spawn(function()
    while wait(.01) do
		if Mining.flags.O2 then
			farming("Island_2","Ore")
		end
	end
end)
spawn(function()
    while wait(.01) do
		if Mining.flags.O3 then
			farming("Island_3","Ore")
		end
	end
end)
spawn(function()
    while wait(.01) do
		if Mining.flags.O4 then
			farming("Island_4","Ore")
		end
	end
end)
spawn(function()
    while wait(.01) do
		if Mining.flags.O5 then
			print("yes")
			farming("Island_5","Ore")
		end
	end
end)
spawn(function()
    while wait(.01) do
		if Mining.flags.O6 then
			farming("Island_6","Ore")
		end
	end
end)
spawn(function()
    while wait(.01) do
		if Mining.flags.O7 then
			farming("Island_7","Ore")
		end
	end
end)
Mining:Section("Gem Farm")
local FarmGems = Mining:Toggle("Farm All", {flag = "R0"})
local FarmGems = Mining:Toggle("Farm Starter", {flag = "R1"})
local FarmGems = Mining:Toggle("Farm Grassland", {flag = "R2"})
local FarmGems = Mining:Toggle("Farm Desert", {flag = "R3"})
local FarmGems = Mining:Toggle("Farm Jungle", {flag = "R4"})
local FarmGems = Mining:Toggle("Farm Frozen", {flag = "R5"})
local FarmGems = Mining:Toggle("Farm Space", {flag = "R6"})
local FarmGems = Mining:Toggle("Farm Alien", {flag = "R7"})
spawn(function()
    while wait(.01) do
        if Mining.flags.R0 then
            for _,v in next,game:GetService("Workspace")["Resources"]["Ores"]["World_1"]:GetDescendants() do
                if v.Name and string.match(v.Name,"Gem") then
                    for i=1,6 do
                        game:GetService("ReplicatedStorage")["Events"]["Server"]["RequestSwing"]:InvokeServer(v)
                    end	
                end
            end
        end
    end
end)
spawn(function()
    while wait(.01) do
		if Mining.flags.R1 then
			farming("Island_1","Gem")
		end
	end
end)
spawn(function()
    while wait(.01) do
		if Mining.flags.R2 then
			farming("Island_2","Gem")
		end
	end
end)
spawn(function()
    while wait(.01) do
		if Mining.flags.R3 then
			farming("Island_3","Gem")
		end
	end
end)
spawn(function()
    while wait(.01) do
		if Mining.flags.R4 then
			farming("Island_4","Gem_4")
		end
	end
end)
spawn(function()
    while wait(.01) do
		if Mining.flags.R5 then
			farming("Island_5","Gem_5")
		end
	end
end)
spawn(function()
    while wait(.01) do
		if Mining.flags.R6 then
			farming("Island_6","Gem_6")
		end
	end
end)
spawn(function()
    while wait(.01) do
		if Mining.flags.R7 then
			farming("Island_7","Gem_7")
		end
	end
end)
--Teleports Tab
local Teleport = library:CreateWindow("Teleports")

local function teleport(place,num,boolV)
	local c= "Exit"
	if boolV then
		c = "Enter"
	end
	local island = game:GetService("Workspace").Resources.Interaction.Worlds[place].Islands[num][c]
	game:GetService("ReplicatedStorage").Events.Server.RequestIslandTeleport:InvokeServer(place,num,island)
end

Teleport:Button("Spawn",function()
	local spawn = game:GetService("Workspace").Spawn
	hum.CFrame = spawn.CFrame
end)
Teleport:Button("Grassland",function()
	teleport("1","2")
end)
Teleport:Button("Desert",function()
	teleport("1","3")
end)
Teleport:Button("Jungle",function()
	teleport("1","4")
end)
Teleport:Button("Frozen",function()
	teleport("1","5")
end)
Teleport:Button("Space",function()
	teleport("1","6")
end)
Teleport:Button("Alien",function()
	teleport("1","7")
end)
Teleport:Button("Halloween",function()
	teleport("Halloween 2020","2",true)
end)
Teleport:Button("Halloween 2",function()
	teleport("Halloween 2020","2")
end)
		
--Pets Tab
local Pets = library:CreateWindow("Pet Stuff")
-- Open Pets
Pets:Section("--Open Eggs--")
Pets:Dropdown("Eggs", {location = _G, flag = "Egg", list = {
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
	"Skeleton Egg 180K Candy"
}
})
Pets:Dropdown("#Eggs to Open", {location = _G, flag = "Number", list = {
    "1",
    "3"
    }
})
local Eggs = Pets:Toggle("Open Eggs", {flag = "TEgg"}) 

-- Sell Pets
Pets:Section("Sell Pets")
local Common = Pets:Toggle("Sell All Common", {flag = "SCommon"}) 
local Rare = Pets:Toggle("Sell All Rare", {flag = "SRare"}) 
local Epic = Pets:Toggle("Sell All Epic", {flag = "SEpic"}) 
local Ultra = Pets:Toggle("Sell All Ultra", {flag = "SUltra"})
local choice = Pets:Dropdown("Sell Specific Legendary",{location = _G, flag = "choose", list = {
    "Parrot",
	"Anubis",
	"Rocket",
	"Ice Wyvern",
	"The Mummy",--[[
		"Name"
	]]
    }
})
local choiceSell = Pets:Toggle("Legendary Sell",{flag="SPet"})
--local Limited = Pets:Toggle("Sell All Limited",{flag = "SLimited"})

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
spawn(function()
	while wait(1) do
		if Pets.flags.SPet then
			sell2(_G.choose)
		end
	end
end)
-- Open Crystals
spawn(function()
	while wait(0) do
		local oh1
        if Pets.flags.TEgg then
			if string.match(_G.Egg,"Starter") then
				oh1 = "1"
			end
			if string.match(_G.Egg,"Gold") then
				oh1 = "2"
			end
			if string.match(_G.Egg,"Grass") then
				oh1 = "3"
			end
			if string.match(_G.Egg,"Desert") then
				oh1 = "4"
			end
			if string.match(_G.Egg,"Jungle") then
				oh1 = "5"
			end
			if string.match(_G.Egg,"Ice") then
				oh1 = "6"
			end
			if string.match(_G.Egg,"1M") then
				oh1 = "1M"
			end
			if string.match(_G.Egg,"Space") then
				oh1 = "7"
			end
			if string.match(_G.Egg,"Alien") then
				oh1 = "8"
			end
			if string.match(_G.Egg,"Pumpkin") then
				oh1 = "Pumpkin"
			end
			if string.match(_G.Egg,"Terror") then
				oh1 = "Terror"
			end
			if string.match(_G.Egg,"Skeleton") then
				oh1 = "Skeleton"
			end
            local oh2 = _G.Number
            game:GetService("ReplicatedStorage")["Events"]["Server"]["BuyEgg"]:InvokeServer(oh1,tonumber(oh2))
        end
    end
end)    

-- Sell All Commons
spawn(function() 
    while wait(1) do 
        if Pets.flags.SCommon then
            sell("Common")
        end
    end
end)
-- Sell All Rare
spawn(function() 
    while wait(1) do 
        if Pets.flags.SRare then
            sell("Rare")
        end
    end
end)
-- Sell All Epics
spawn(function() 
    while wait(1) do 
        if Pets.flags.SEpic then
            sell("Epic")
        end
    end
end)
-- Sell All Ultras
spawn(function() 
    while wait(1) do 
        if Pets.flags.SUltra then
            sell("Ultra")
        end
    end
end)
--[[Sell All Limited
spawn(function() 
    while wait(1) do 
        if Pets.flags.SLimited then
            sell("Limited")
        end
    end
end)]]

Pets:Section("Other Pet Stuff")
local shine = Pets:Toggle("Auto Shiny", {flag = "AShiny"})
local bestOre = Pets:Toggle("Auto Best Ore",{flag = "BOre"})
local bestGem = Pets:Toggle("Auto Best Gem",{flag = "BGem"})
local bestCoins = Pets:Toggle("Auto Best Coins",{flag = "BCoins"})
spawn(function()
	while wait(1) do
		if Pets.flags.AShiny then
			shiny()
		end
	end
end)
spawn(function()
	while wait(1) do
		if Pets.flags.BOre then
			game:GetService("ReplicatedStorage").Events.Server.BestOre:InvokeServer()
		end
	end
end) 
spawn(function()
	while wait(1) do
		if Pets.flags.BGem then
			game:GetService("ReplicatedStorage").Events.Server.BestGem:InvokeServer()
		end
	end
end) 
spawn(function()
	while wait(1) do
		if Pets.flags.BCoins then
			game:GetService("ReplicatedStorage").Events.Server.BestCoin:InvokeServer()
		end
	end
end)  
-- Misc
local Misc = library:CreateWindow("Misc")
Misc:Section("--== Other Stuff ==--")


Misc:Bind("Toggle Key",
{flag = "Toggle", owo = tR1e, default = Enum.KeyCode.RightControl},
function()
library.toggled = not library.toggled;
for i, data in next, library.queue do
local pos = (library.toggled and data.p or UDim2.new(-1, 0, -0.5,0))
data.w:TweenPosition(pos, (library.toggled and 'Out' or 'In'), 'Quad', 0.15, tR1e)
wait();
end
end)
--/ Destroy GUI \--
local Kill = Misc:Button("Destroy GUI", function()

	game:GetService("CoreGui").ScreenGui:Destroy()

end)
local x =Exit:Clone()
x.Parent = game.Workspace
local price = world.Price.ImageLabel:Clone()
price.Parent = game.Workspace
u2 = Interact.Button.MouseButton1Click:Connect(function()
	v5.ClosePage(UI, world);
		if u2 ~= nil then
			u2:Disconnect();
			world.TextLabel.Text = "World Purchase"
			price.Parent = world.Price
			x.Parent = world
			print("done")
		end;
end);
local Credits = library:CreateWindow("Credits")
local label = Credits:Label("Script Created By:\nDeidara#2637")
local label  = Credits:Label("---====Discord Server====---")
local disc = Credits:Button("Copy Discord Server Link", function()

	setclipboard("https://discord.gg/GpXjWhD")

end)
if Exit then
	Exit:Destroy()
end
if #world.Price:GetChildren() > 0 then
	world.Price.ImageLabel:Destroy()
end

if world.Price.Visible == false then
	world.Price.Visible = true
end
world.Details.Text = "Join my server"
world.Price.Text = "link in Credits"
world.TextLabel.Text = "Stay Updated"
world.CanClose.Value = true
Interact.TextLabel.Text = "Enjoy!!"
v5.DisplayPage(plr, UI, world)

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
