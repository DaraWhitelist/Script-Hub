local library = loadstring(game:HttpGet("https://pastebin.com/raw/r0cp9NrM"))();
local plr = game.Players.LocalPlayer
local chr = plr.Character
local hum = chr.HumanoidRootPart
local path = game:GetService("ReplicatedStorage")
local island = game:GetService("Workspace").Resources.Island
local sell = game:GetService("Workspace").Resources.Sell["5"]
local num = 1
local plr = game.Players.LocalPlayer
local chr = plr.Character
local path = game:GetService("ReplicatedStorage")

--Setup
--Change name of FireServer
for _,v in pairs(path:GetDescendants()) do
	if v:IsA("RemoteEvent") and v.Name == "" then 
		v.Name = tostring(num)
		num+=1
	end
end

--Change Model Ore
num =1
for _,v in pairs(path:GetChildren()) do
    if v:IsA("Model") then
        if v.Name == "1" then 
		    v.Name = "1_"..tostring(num)
		    num+=1
        end
        if v.Name == "2" then
            v.Name = "SandStone"
        end
        if v.Name == "3" then
            v.Name = "Coal"
        end
        if v.Name == "4" then
            v.Name = "Iron"
        end
        if v.Name == "5" then
            v.Name = "Mithril"
        end
        if v.Name == "6" then
            v.Name = "Admantite"
        end
        if v.Name == "7" then
            v.Name = "Runite"
        end
        if v.Name == "8" then
            v.Name = "Silver"
        end
        if v.Name == "9" then
            v.Name = "Gold"
        end
        if v.Name == "10" then
            v.Name = "Ruby"
        end
        if v.Name == "11" then
            v.Name = "Emerald"
        end
        if v.Name == "12" then
            v.Name = "Diamond"
        end
        if v.Name == "13" then
            v.Name = "Obsidian"
        end
        if v.Name == "14" then
            v.Name = "Rainbowite"
        end
        if v.Name == "15" then
            v.Name = "Sand Gem"
        end
        if v.Name == "16" then
            v.Name = "Volcanite"
        end
        if v.Name == "17" then
            v.Name = "Bossite"
        end
    end
end
if path:FindFirstChild("1_16") then
path["1_16"].Name = "spawnOre"
path["1_17"].Name = "InfOre_1"
path["1_18"].Name = "InfOre_2"
path["1_19"].Name = "InfOre_3"
path["1_20"].Name = "InfOre_4"
path["1_21"].Name = "InfOre_5"
end
--Functions
--AutoFarm
local function farming(type)
	for _,v in next,path:GetChildren() do
		if v.Name and string.match(v.Name,type) then
			path.Communication.Events["3"]:FireServer(v)
		end
	end
end
--AutoCollect(Gems)(Coins)
local function autoCollect(type)
	for _,v in next,game:GetService("Workspace").Resources.Currency:GetChildren() do
		if string.match(v.Name,type) then
		hum.CFrame = v.CFrame
		end
	end
end

--AutoSell
local function autoSell()
	placeHolder = hum.CFrame 
	hum.CFrame = sell.CFrame 
	wait(.5)
	hum.CFrame = placeHolder
end

local Farming = library:CreateWindow("Farming")
Farming:AddLabel("ORE FARM")
Farming:AddToggle("Center Ore", function(state)
    getgenv().centerOre = state
    while wait() do
        if getgenv().centerOre then
            farming("spawnOre")
        end
    end
end)
Farming:AddToggle("Stone Farm(0 Power)", function(state)
    getgenv().Stone = state
	
	while wait() do
		if getgenv().Stone then
            farming("1_")
		end
	end
end)

Farming:AddToggle("Sandstone Farm", function(state)
    getgenv().Sandstone = state
	
	while wait() do
		if getgenv().Sandstone then
            farming("Sandstone")
		end
	end
end)
Farming:AddToggle("Coal Farm", function(state)
    getgenv().Coal = state
	
	while wait() do
		if getgenv().Coal then
            farming("Coal")
		end
	end
end)
Farming:AddToggle("Iron Farm", function(state)
    getgenv().Iron = state
	
	while wait() do
		if getgenv().Iron then
            farming("Iron")
		end
	end
end)
Farming:AddToggle("Mithril Farm", function(state)
    getgenv().Mithril = state
	
	while wait() do
		if getgenv().Mithril then
            farming("Mithril")
		end
	end
end)
Farming:AddToggle("Admantite Farm", function(state)
    getgenv().Admantite = state
	
	while wait() do
		if getgenv().Admantite then
            farming("Admantite")
		end
	end
end)
Farming:AddToggle("Runite Farm", function(state)
    getgenv().Runite = state
	
	while wait() do
		if getgenv().Runite then
            farming("Runite")
		end
	end
end)
Farming:AddToggle("Silver Farm", function(state)
    getgenv().Silver = state
	
	while wait() do
		if getgenv().Silver then
            farming("Silver")
		end
	end
end)
Farming:AddToggle("Gold Farm", function(state)
    getgenv().Gold = state
	
	while wait() do
		if getgenv().Gold then
            farming("Gold")
		end
	end
end)

Farming:AddToggle("Ruby Farm", function(state)
    getgenv().Ruby = state
	
	while wait() do
		if getgenv().Ruby then
            farming("Ruby")
		end
	end
end)
Farming:AddToggle("Emerald Farm", function(state)
    getgenv().Emerald = state
	
	while wait() do
		if getgenv().Emerald then
            farming("Emerald")
		end
	end
end)
Farming:AddToggle("Diamond Farm", function(state)
    getgenv().Diamond = state
	
	while wait() do
		if getgenv().Diamond then
            farming("Diamond")
		end
	end
end)
Farming:AddToggle("Obsidian Farm", function(state)
    getgenv().Obsidian = state
	
	while wait() do
		if getgenv().Obsidian then
            farming("Obsidian")
		end
	end
end)
Farming:AddToggle("Rainbowite Farm", function(state)
    getgenv().Rainbowite = state
	
	while wait() do
		if getgenv().Rainbowite then
            farming("Rainbowite")
		end
	end
end)
Farming:AddToggle("Sand Gem Farm", function(state)
    getgenv().sandGem = state
	
	while wait() do
		if getgenv().sandGem then
            farming("Sand Gem")
		end
	end
end)
Farming:AddToggle("Volcanite Farm", function(state)
    getgenv().Volcanite = state
	
	while wait() do
		if getgenv().Volcanite then
            farming("Volcanite")
		end
	end
end)
Farming:AddToggle("Bossite Farm", function(state)
    getgenv().Bossite = state
	
	while wait() do
		if getgenv().Bossite then
            farming("Bossite")
		end
	end
end)



--Farming 2
local Farming2 = library:CreateWindow("Farming 2")
--Event Stuff
Farming2:AddLabel("Event")
Farming2:AddToggle("Farm Presents", function(state)
    getgenv().present = state

    while wait() do
        if getgenv().present then
            farming("50")
            farming("51")
        end
    end
end)

--Auto Stuff
Farming2:AddLabel("Auto Stuff")
Farming2:AddToggle("AutoSell", function(state)
    getgenv().autoSell = state

    while wait() do
        if getgenv().autoSell then
            autoSell()
        end
    end
end) 
Farming2:AddToggle("Auto Coins", function(state)
    getgenv().coins = state
    while wait() do
        if getgenv().coins then
            autoCollect("Coins")
        end
    end
end)

Farming2:AddToggle("Auto Gems", function(state)
    getgenv().gems = state
    while wait() do
        if getgenv().gems then
            autoCollect("Gems")
        end
    end
end)
--Upgrade
local Upgrade = library:CreateWindow("Upgrade")
Upgrade:AddToggle("Upgrade Pickaxes",function(state)
    getgenv().pickaxes = state
    while wait() do
        if getgenv().pickaxes then
            path.Communication.Functions["37"]:FireServer('A',"Pickaxes")
            path.Communication.Functions["38"]:FireServer('A',"Pickaxes")
        end
    end
end)
Upgrade:AddToggle("Upgrade Backpacks", function(state)
    getgenv().backpacks = state
    while wait() do
        if getgenv().backpacks then
            path.Communication.Functions["37"]:FireServer('A',"Packs")
            path.Communication.Functions["38"]:FireServer('A',"Packs")
        end
    end
end)
Upgrade:AddToggle("Auto Ranks",function(state)
    getgenv().ranks = state
    while wait() do
        if getgenv().ranks then
            path.Communication.Functions["37"]:FireServer('A',"Ranks")
            path.Communication.Functions["38"]:FireServer('A',"Ranks")
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
Misc:AddButton("Unlock All Islands", function()
    for i=1,5 do
        hum.CFrame = island[tostring(i)].CFrame
        wait(1)
    end
end)
Misc:AddButton("Destroy GUI",function()
	game:GetService("CoreGui")["nigga"]:Destroy()
end)
local Credits = library:CreateWindow("Credits")
Credits:AddLabel("Script Created By:\nDeidara#2637")
Credits:AddLabel("---====Discord Server====---")
Credits:AddButton("Copy Discord Server Link", function()

	setclipboard("https://discord.gg/GpXjWhD")

end)