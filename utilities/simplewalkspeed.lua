local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "SimpleWalkspeed", HidePremium = false, SaveConfig = true, ConfigFolder = "Mika SWS"})
local PlayerTab = Window:MakeTab({
	Name = "Config",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local x = 0
game.Players.LocalPlayer.Character.Humanoid.Changed:Connect(function(property)
     if x == 1 then
	    if property == "Health" then
	    	game.Players.LocalPlayer.Character.Humanoid.Health = 99999
	    end
    end
end)
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


PlayerSection:AddSlider({
	Name = "Walkspeed",
	Min = 16,
	Max = 100,
	Default = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Walkspeed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

PlayerSection:AddSlider({
	Name = "Jump Height",
	Min = 40,
	Max = 400,
	Default = game.Players.LocalPlayer.Character.Humanoid.JumpPower,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump Height",
	Callback = function(Value)
        	game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

PlayerSection:AddToggle({
	Name = "Simple NoClip",
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
	Name = "GUI"
})
PlayerSection2:AddButton({
	Name = "Toggle Infinite HP",
	Callback = function()
		if x == 1 then
			x = 0
			OrionLib:MakeNotification({
				Name = "INFINITEHP",
				Content = "Disabled",
				Image = "rbxassetid://4483345998",
				Time = 3
			})
		else
			x = 1
			OrionLib:MakeNotification({
				Name = "INFINITEHP",
				Content = "Enabled",
				Image = "rbxassetid://4483345998",
				Time = 3
			})
		end
  	end    
})
PlayerSection2:AddButton({
	Name = "Destroy UI",
	Callback = function()
        OrionLib:Destroy()
  	end    
})

--Settings End--

OrionLib:Init() --UI Lib End
