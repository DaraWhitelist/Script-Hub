local function getDiner() 
	for i,v in pairs(game.Workspace.Tycoons:GetChildren()) do
		if v.Player.Value == game.Players.LocalPlayer then
			return v
		end
	end
end

local Diner = getDiner()
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
			game:GetService("ReplicatedStorage").Events.ClientTycoonInput:FireServer(unpack(args))
	end
end