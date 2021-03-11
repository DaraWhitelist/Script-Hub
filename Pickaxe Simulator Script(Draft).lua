--AutoFarm✅
--AutoSell✅
--Collect Coins & Gems✅
--Island Tp✅
--Unlock All Islands✅
--UpgradeAxe(Maybe)✅
--Open Egg✅


--Change name of FireServer
for _,v in pairs(path:GetDescendants()) do
	if v:IsA("RemoteEvent") and v.Name == "" then 
		v.Name = tostring(num)
		num+=1
	end
end

--Change Model Ore
--local path = game:GetService("ReplicatedStorage")
num =1
for _,v in pairs(path:GetChildren()) do
	if v:IsA("Model") and v.Name == "1" then 
		v.Name = "1_"..tostring(num)
		num+=1
	end
end
path["1_16"].Name = "spawnOre"
path["1_17"].Name = "InfOre_1"
path["1_18"].Name = "InfOre_2"
path["1_19"].Name = "InfOre_3"
path["1_20"].Name = "InfOre_4"
path["1_21"].Name = "InfOre_5"
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
--Unlock all Islands
for i=1,5 do
	hum.CFrame = island[tostring(i)].CFrame
	wait(1)
end
--OpenEggs
	--Egg1 = Starter Egg 500 Gems
	--Egg2 = Jungle Egg 5K Gems
	--Egg3 = Farm Egg 200k Gems
	--Egg4 = Tropical Egg 1M Gems
	--Egg5 = Pharoah Egg 6M Gems
	--Egg6 = Ice Egg 50M Gems
	--HolidayEgg 750 Presents
	--SantaEgg 2M Presents
	--path.Communication.Functions["35"]:FireServer('A',"Egg2",1)
--Upgrade Axe/Backpacks
	--path.Communication.Functions["37"]:FireServer('A',"Pickaxes")
	--path.Communication.Functions["37"]:FireServer('A',"Packs")
--Upgrade Ranks
	--path.Communication.Functions["39"]:FireServer('A',"Ranks",num)
--AutoSell
local function autoSell()
	placeHolder = hum.CFrame 
	hum.CFrame = sell.CFrame 
	wait(.5)
	hum.CFrame = placeHolder
end
getgenv().autoSell = false
while getgenv().autoSell do
	autoSell()
end

--Farming✅
	--AutoOre✅
	--AutoSell✅
	--AutoCoins✅
	--AutoGems✅
--Upgrade🔃
	--Auto Upgrade Pickaxe✅
	--Auto Upgrade Backpacks✅
	--Auto Rebirth🔃
--Teleports
	--Islands
	--Unlock all Islands
--Eggs
	--Auto Open Eggs
	--Auto Delete eggs based on rarity(maybe)
--Misc(Maybe)
	--Capture Flags(maybe)
	--Kill Boss(maybe)
--For Rank
	--chr.Head.Rank.TextLabel.Text
	rank ={
		["Stone"] = "1",
		["Sandstone"] = "2",
		["Coal"] = "3",
		["Iron"] = "4",
		["Mithril"] = "5",
		["Admantite"] = "6",
		["Runite"] = "7",
		["Silver"] = "8",
		["Gold"] = "9",
		["Ruby"] = "10",
		["Emerald"] = "11",
		["Diamond"] = "12",
		["Obsidian"] = "13",
 		["Rainbowite"] = "14",
 		["Sand Gem"] = "15",
 		["Volcanite"] = "16",
 		["Bossite"] = "17"
	}