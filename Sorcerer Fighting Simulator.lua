local library = loadstring(game:HttpGet("https://pastebin.com/raw/r0cp9NrM"))();
local player = game:GetService("Players").LocalPlayer
local hum = player.Character.HumanoidRootPart
local RStorage = game:GetService("ReplicatedStorage");
local main = player.PlayerGui.Main.MainClient
local stats = require(main.PlayerDataClient)
local source = require(main.StatClient)
local hotbar = require(main.HotbarModule)
local keys = player.PlayerGui.Main.Front.Hotbar
local notif = require(main.NotifModule);
notif.Notify("Script Created By:Killua#0003")

local function stat_train()
        source.StaffSwing()
        source.PushUp()
end
local function rank()
    RStorage.RSPackage.Events.GeneralFunction:InvokeServer("Rank",stats.Rank +1)
end


local Main = library:CreateWindow("Main")
Main:AddLabel("Stat Farm")
Main:AddToggle("Train",function(val)
    getgenv().train = val

    while wait() do
        if getgenv().train then
            stat_train()
        end
    end
end)

Main:AddToggle("Auto Rank",function(val)
    getgenv().rank = val

    while wait() do
        if getgenv().rank then
            rank()
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
Credits:AddLabel("Script Created By:\nKilua#0003")

