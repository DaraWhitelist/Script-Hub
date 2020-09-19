local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local ClientModules = ReplicatedStorage.ClientModules;
local v5 = require(ClientModules.UI.Utility)
local UI = player.PlayerGui:WaitForChild("UI")
local world= UI:WaitForChild("World")
local Interact = world:WaitForChild("Interact");
local Exit = world:WaitForChild("Exit");
local library = loadstring(game:HttpGet("https://pastebin.com/raw/JsdM2jiP",tR1e))()
library.options.underlinecolor = "rainbow"

local function rarity(petName)
	for _,v in next,game:GetService("Players")["LocalPlayer"]["PlayerGui"]["UI"]["Index"]["PetFrames"]:GetDescendants() do
		if v:IsA("ImageLabel") and v.Parent.Name == "Items" and v.Name == petName then
			return v.RarityLabel.Text
    	end
	end
 end
local function farming(area,type)
	for _,v in next,game:GetService("Workspace")["Resources"]["Ores"]["World_1"][area]:GetDescendants() do
		if v.Name and string.match(v.Name,type) then
			for i=1,6 do
				game:GetService("ReplicatedStorage")["Events"]["Server"]["RequestSwing"]:InvokeServer(v)
			end	
		end
	end
end
-- Mining Champion Tab
local Mining = library:CreateWindow("Mining Champion")
Mining:Section("- Ore Farm -")
local FarmOre = Mining:Toggle("Farm Center Ore", {flag = "center"})
local FarmOre = Mining:Toggle("Farm All", {flag = "O0"})
local FarmOre = Mining:Toggle("Farm Starter", {flag = "O1"})
local FarmOre = Mining:Toggle("Farm Grassland", {flag = "O2"})
local FarmOre = Mining:Toggle("Farm Desert", {flag = "O3"})
local FarmOre = Mining:Toggle("Farm Jungle", {flag = "O4"})
local FarmOre = Mining:Toggle("Farm Frozen", {flag = "05"})
-- AutoFarm
spawn(function()
    while wait(.01) do
        if Mining.flags.center then
            for _,v in next,game:GetService("Workspace")["Resources"]["Ores"]["World_1"]["Center_Ores"]:GetChildren() do
                if v.Name and string.match(v.Name,"Ore_"..game:GetService("Players")["LocalPlayer"]["island"].Value) then
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
			farming("Island_5","Ore")
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
			farming("Island_4","Gem_5")
		end
	end
end)

--Pets
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
	"Ice Egg 200K Gems"
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
--local Limited = Pets:Toggle("Sell All Limited",{flag = "SLimited"})

local function sell(rare)
    for _,v in next,game:GetService("Players").LocalPlayer.PlayerGui.UI.Items.Frames.Pets.Items:GetDescendants() do
        if v:IsA("ImageLabel") and v.Parent and v.Parent.Name == "Items" and v.ItemName.Value ~= "Razorfish" and v.Lock.isLoaded == false then
            if string.match(rare,rarity(v.ItemName.Value)) then
                game:GetService("ReplicatedStorage")["Events"]["Server"]["DeletePet"]:InvokeServer(v.ItemId.Value)
            end
        end
    end
end

-- Open Crystals
spawn(function()
	while wait(1) do
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
u2 = Interact.Button.MouseButton1Click:Connect(function()
	v5.ClosePage(UI, world);
		if u2 ~= nil then
			u2:Disconnect();
		end;
end);
if #world.Price:GetChildren() > 0 then
	world.Price.ImageLabel:Destroy()
end
if world.Price.Visible == false then
	world.Price.Visible = true
end
world.Details.Text = "Created By"
world.Price.Text = "Deidara#2637"
world.TextLabel.Text = "Mining Champions GUI"
world.CanClose.Value = true
Interact.TextLabel.Text = "Enjoy!!"
v5.DisplayPage(plr, UI, world)
