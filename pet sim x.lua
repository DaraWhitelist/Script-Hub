local function area()
    local place ={}
    for i,v in pairs(game:GetService("Workspace")["__MAP"].Teleports:GetChildren()) do
        table.insert(place,tostring(v))
    end
    return place
end
local place = area()
if game.PlaceId == 6284583030 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Pet Simulator X", "Sentinel")


        local Home = Window:NewTab("Home")
        local HomeSection = Home:NewSection("Credits")
        local Player = Window:NewTab("Player")
        local PlayerSection = Player:NewSection("Player")
        PlayerSection:NewSlider("WalkSpeed", "Faster Moves", 250, 16, function(s)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
        end)
            PlayerSection:NewSlider("JumpPower", "Jumps Higher", 250, 50, function(s)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
            end)
        local AutoFarm = Window:NewTab("AutoFarm")
        local AutoFarmSection = AutoFarm:NewSection("AutoFarm")
        AutoFarmSection:NewDropdown("Areas","All Areas", place--[[{
            "Town",
            "Forest",
            "Beach",
            "Mine",
            "Winter",
            "Glacier",
            "Desert",
            "Volcano"]]
        ,function(choice)
       
            areaChoice = choice
        end)
        AutoFarmSection:NewToggle("AutoFarm", "AutoFarms Everything", function(s)
                
                _G.Stop = not s
                _G.World = "Spawn"
                _G.Area = areaChoice
                loadstring(game:HttpGet('https://pastebin.com/raw/tGUJRjqb'))()

        end)

    
    end

    while wait() do
        if place[1] ~=area()[1] then
            for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
                if tonumber(v.Name) then
                    v:Destroy()
                end
            end
            wait(1)
            loadstring(game:HttpGet('https://pastebin.com/raw/tGUJRjqb'))()
        wait(3)
        end
    end
    
