local library = loadstring(game:HttpGet("https://pastebin.com/raw/r0cp9NrM"))(); --UI Library
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local TycoonEvent = ReplicatedStorage.Events.ClientTycoonInput
--functions--
local function getDiner() 
	for i,v in pairs(game.Workspace.Tycoons:GetChildren()) do
		if v.Player.Value == game.Players.LocalPlayer then
			return v
		end
	end
end
local Diner = getDiner()
local function getMoney()
    for i,v in pairs(Diner.Items.OftenFiltered.Surface:GetDescendants()) do
	    if v:IsA("ObjectValue") and v.Name == "Bill" then
		    	print(v)
			    local args = {
    			    [1] = Diner,
    			    [2] = {
        			    ["name"] = "CollectBill",
       		 	    ["model"] = v.Parent
    			    }
			    }
			    TycoonEvent:FireServer(unpack(args))
	    end
    end
end

local Tycoon = library:CreateWindow("Restaurant Tycoon 2")
Tycoon:AddLabel("Money")
Tycoon:AddToggle("AutoCollect Money", function(state)
    getgenv().collect = state

    while wait() do
        if getgenv().collect then
            getMoney()
        end
    end            
end)
Tycoon:AddToggle("Fast Service(Waiters)", function(state)
    getgenv().waiter = state

    while wait() do
        if getgenv().waiter then
            game:GetService("ReplicatedStorage").Events.PathfindTargetReached:FireServer("W0")
	        game:GetService("ReplicatedStorage").Events.PathfindTargetReached:FireServer("W1")
	        game:GetService("ReplicatedStorage").Events.PathfindTargetReached:FireServer("C1")
	        game:GetService("ReplicatedStorage").Events.PathfindTargetReached:FireServer("C2")
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
Credits:AddLabel("Script Created By:\nKillua#0003")
