local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local sws = OrionLib:MakeWindow({Name = "Mikate", Icon = "rbxassetid://8834748103", HidePremium = false, SaveConfig = true, ConfigFolder = "Mika SWS", IntroText = "KlashDevelopment", IntroIcon = "rbxassetid://4483345998"})


local PlayerTab = sws:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Noclip = nil
local Clip = nil

    
function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
	OrionLib:MakeNotification({
		Name = "NoClip",
		Content = "Enabled",
		Image = "rbxassetid://4483345998",
		Time = 3
	})
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
	OrionLib:MakeNotification({
		Name = "NoClip",
		Content = "Disabled",
		Image = "rbxassetid://4483345998",
		Time = 3
	})
end

local PlayerSection = PlayerTab:AddSection({
	Name = "Player"
})

local setwalkspeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local setjumpheight = game.Players.LocalPlayer.Character.Humanoid.JumpHeight
local setjumppower = game.Players.LocalPlayer.Character.Humanoid.JumpPower
local setgravity = game.Workspace.Gravity

PlayerSection:AddSlider({
	Name = "Walkspeed",
	Min = 0,
	Max = 500,
	Default = setwalkspeed,
	Color = Color3.fromRGB(255,0,0),
	Increment = 1,
	ValueName = "Walkspeed",
	Callback = function(Value)
		setwalkspeed = Value
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

PlayerSection:AddSlider({
	Name = "Jump Power",
	Min = 0,
	Max = 500,
	Default = setjumppower,
	Color = Color3.fromRGB(0,255,0),
	Increment = 1,
	ValueName = "Jump Power",
	Callback = function(Value)
			setjumppower = Value
        	game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})
PlayerSection:AddSlider({
	Name = "Jump Height",
	Min = 0,
	Max = 500,
	Default = setjumpheight,
	Color = Color3.fromRGB(0,0,255),
	Increment = 1,
	ValueName = "Jump Height",
	Callback = function(Value)
			setjumpheight = Value
        	game.Players.LocalPlayer.Character.Humanoid.JumpHeight = Value
	end    
})
PlayerSection:AddSlider({
	Name = "Gravity",
	Min = 0,
	Max = 500,
	Default = setgravity,
	Color = Color3.fromRGB(255,140,0),
	Increment = 1,
	ValueName = "Gravity",
	Callback = function(Value)
			setgravity = Value
        	game.Workspace.Gravity = Value
	end    
})

PlayerSection:AddToggle({
	Name = "No-Clip",
	Default = false,
	Callback = function(Value)
		if Value then
			noclip()
		else
			clip()
		end
	end    
})

local PlayerSection2 = PlayerTab:AddSection({
	Name = "Others"
})

local Loops = sws:MakeTab({
	Name = "Loops",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local playerlps = Loops:AddSection({
	Name = "Player Loops"
})
local loopWalkspeed = false
local loopJumpPower = false
local loopJumpHeight = false
local loopGravity = false

playerlps:AddToggle({
	Name = "Loop-Set Walkspeed",
	Default = loopWalkspeed,
	Callback = function(Value)
		loopWalkspeed = Value
	end
})
playerlps:AddToggle({
	Name = "Loop-Set JumpHeight",
	Default = loopJumpHeight,
	Callback = function(Value)
		loopJumpHeight = Value
	end
})
playerlps:AddToggle({
	Name = "Loop-Set JumpPower",
	Default = loopJumpPower,
	Callback = function(Value)
		loopJumpPower = Value
	end
})
playerlps:AddToggle({
	Name = "Loop-Set Gravity",
	Default = loopGravity,
	Callback = function(Value)
		loopGravity = Value
	end
})

local Visuals = sws:MakeTab({
	Name = "Visual",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Sitewide = Visuals:AddSection({
	Name = "All-Game"
})
Sitewide:AddButton({
	Name = "(Broken) PlayerESP",
	Callback = function() 
	    function addEsp(player, part)
	
	        local esp = Instance.new("BillboardGui", part)
	        esp.Name = "ESP"
	        esp.AlwaysOnTop = true
	        esp.Size = UDim2.new(1,0,1,0)	
	
	        local espframe = Instance.new("Frame", esp)
	        espframe.BackgroundColor = player.TeamColor
	        espframe.Size = UDim2.new(1,0,1,0)
	        espframe.BackgroundColor = player.TeamColor
	
	        local namesp = Instance.new("BillboardGui", part)
	        namesp.Name = "NAME"
	        namesp.AlwaysOnTop = true
	        namesp.Size = UDim2.new(1,0,1,0)
	        namesp.SizeOffset = Vector2.new(-0.5, 2.5)
	
	        local name = Instance.new("TextLabel", namesp)
	        name.Text = player.Name
	        name.Size = UDim2.new(2, 0,1, 0)
	        name.TextColor3 = Color3.new(0, 0, 0)
	        name.TextScaled = true
	        name.BackgroundTransparency = 1
	    end
	
	    while wait(0.1) do
	        for _, player in pairs(game:GetService("Players"):GetChildren()) do
	            if (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
	                if (game.Players.LocalPlayer ~= player) then
	                    if not (player.Character.HumanoidRootPart:FindFirstChild("ESP") and player.Character.HumanoidRootPart:FindFirstChild("NAME")) then
	                        addEsp(player, player.Character.HumanoidRootPart)
	                        else
	                        player.Character.HumanoidRootPart:FindFirstChild("ESP"):Destroy()
	                        player.Character.HumanoidRootPart:FindFirstChild("NAME"):Destroy()
	                        addEsp(player, player.Character.HumanoidRootPart)
	                    end
	                end
	            end
	        end
	    end
	end
})
Sitewide:AddToggle({
	Name = "ShowHitboxes",
	Default = settings():GetService("RenderSettings").ShowBoundingBoxes,
	Callback = function(Value)
		settings():GetService("RenderSettings").ShowBoundingBoxes = Value
	end
})
Sitewide:AddButton({
	Name = "Destroy UI",
	Callback = function()
        OrionLib:Destroy()
  	end    
})

local Credits = sws:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://8834748103",
	PremiumOnly = false
})
Credits:AddLabel("Scripting - GavinGoGaming (Klash CEO)")
Credits:AddLabel("Playtest - Reality (Klash Dev)")

while true do
	if loopWalkspeed then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = setwalkspeed
	end
	if loopJumpPower then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = setjumppower
	end
	if loopJumpHeight then
		game.Players.LocalPlayer.Character.Humanoid.JumpHeight = setjumpheight
	end
	if loopGravity then
		game.Workspace.Gravity = setgravity
	end
	wait(0.01)
end

--Settings End--

OrionLib:Init() --UI Lib End
