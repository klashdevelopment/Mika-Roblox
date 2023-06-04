local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Simple Walkspeed", HidePremium = false, SaveConfig = true, ConfigFolder = "Orion"})
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

local PlayerSection = PlayerTab:AddSection({
	Name = "Player"
})


PlayerSection:AddSlider({
	Name = "Walkspeed",
	Min = 16,
	Max = 100,
	Default = 5,
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
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump Height",
	Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

--Player Tab End--

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
