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

local loadedesp;
local espLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Sirius/main/library/esp/esp.lua"))();
wait(0.1)
local visuals = sws:MakeTab({ Name = "ESPs",
	Icon = "rbxassetid://4483345998" });
    do
        local esp = visuals:AddSection({ Name = "ESP" });
        do
            esp:AddButton({ Name = "Enable Esp", Callback = function()
            		if not loadedesp then
            			espLibrary:Load();
						espLibrary.options.enabled = true;
						loadedesp = true;
					end
            	end
            })
            esp:AddButton({ Name = "Disable Esp", Callback = function()
            		if loadedesp then
						espLibrary.options.enabled = false;
            			espLibrary:Unload();
						loadedesp = false;
					end
            	end
            })
        end
    end
    
local Credits = sws:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://8834748103",
	PremiumOnly = false
})
Credits:AddLabel("Scripting - GavinGoGaming (Klash CEO)")
Credits:AddLabel("Playtest - Reality (Klash Dev)")

OrionLib:Init()

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
