local player = game.Players.LocalPlayer
local hum = player.Character.HumanoidRootPart
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local library = loadstring(game:HttpGet("https://pastebin.com/raw/JsdM2jiP",tR1e))()

local Autofarm = library:CreateWindow("Halloween Sim")
Autofarm:Section("--Auto Farm--")
local GemFarm = Autofarm:Toggle("Farm Gem Ore", {flag = "G0"})
local CoinFarm = Autofarm:Toggle("Farm Coin Ore", {flag = "G1"})
local SoulOre = Autofarm:Toggle("Farm Soul Ore", {flag = "G2"})

spawn(function()
	while wait(.01) do
		if Autofarm.flags.G0 then
			for _,v in next, game:GetService("Workspace").Currency2Spawn:GetDescendants() do
				if v:IsA("MeshPart") and v.Name == "Anchor" then
					v.CFrame  = hum.CFrame
					wait(.1)
					v.CFrame =  v.Body.CFrame
				end
			end
		end
	end
end)
spawn(function()
	while wait(.01) do
		if Autofarm.flags.G1 then
			for _,v in next, game:GetService("Workspace").Currency1Spawn:GetDescendants() do
				if v:IsA("MeshPart") and v.Name == "Anchor" then
					v.CFrame  = hum.CFrame
					wait(.1)
					v.CFrame =  v.Body.CFrame
				end
			end
		end
	end
end)
spawn(function()
	while wait(.01) do
		if Autofarm.flags.G1 then
			for _,v in next, game:GetService("Workspace").Currency3Spawn:GetDescendants() do
				if v:IsA("MeshPart") and v.Name == "Anchor" then
					v.CFrame  = hum.CFrame
					wait(.1)
					v.CFrame =  v.Body.CFrame
				end
			end
		end
	end
end)

--Credits
local Credits = library:CreateWindow("Credits")
local label = Credits:Label("Script Created By:\nDeidara#2637")
local label  = Credits:Label("---====Discord Server====---")
local disc = Credits:Button("Copy Discord Server Link", function()

	setclipboard("https://discord.gg/GpXjWhD")

end)

--Misc
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
Misc:Button("Toggle Effects", function()
	if #game:GetService("ReplicatedStorage").UIAssets:GetChildren() ==9  then
		for _,v in next,game:GetService("ReplicatedStorage").UIAssets:GetChildren() do
			if string.match(v.Name,"Currency") then
				 v.Parent = v.Parent.Parent.Effects
			end
		end
	else
		for _,v in next,game:GetService("ReplicatedStorage").Effects:GetChildren() do
			if string.match(v.Name,"Currency") then
				 v.Parent = v.Parent.Parent.UIAssets
			end
		end
	end
end)
--/ Destroy GUI \--
local Kill = Misc:Button("Destroy GUI", function()

	game:GetService("CoreGui").ScreenGui:Destroy()

end)
