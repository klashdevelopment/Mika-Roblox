local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local sws = OrionLib:MakeWindow({Name = "SimpleWalkspeed", HidePremium = false, SaveConfig = true, ConfigFolder = "Mika SWS"})
local PlayerTab = sws:MakeTab({
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
	Color = Color3.fromRGB(255,0,0),
	Increment = 1,
	ValueName = "Walkspeed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

PlayerSection:AddSlider({
	Name = "Jump Power",
	Min = 40,
	Max = 400,
	Default = game.Players.LocalPlayer.Character.Humanoid.JumpPower,
	Color = Color3.fromRGB(0,255,0),
	Increment = 1,
	ValueName = "Jump Power",
	Callback = function(Value)
        	game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})
PlayerSection:AddSlider({
	Name = "Jump Height",
	Min = 40,
	Max = 400,
	Default = game.Players.LocalPlayer.Character.Humanoid.JumpHeight,
	Color = Color3.fromRGB(0,0,255),
	Increment = 1,
	ValueName = "Jump Height",
	Callback = function(Value)
        	game.Players.LocalPlayer.Character.Humanoid.JumpHeight = Value
	end    
})
PlayerSection:AddSlider({
	Name = "Jump Gravity",
	Min = 40,
	Max = 400,
	Default = ,
	Color = Color3.fromRGB(0,0,255),
	Increment = 1,
	ValueName = "Jump Height",
	Callback = function(Value)
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
PlayerSection2:AddToggle({
	Name = "InfiniteHP Beta",
	Default = false,
	Callback = function(Value)
		if Value then
			OrionLib:MakeNotification({
				Name = "InfiniteHP",
				Content = "Enabled",
				Image = "rbxassetid://4483345998",
				Time = 3
			})
			x = 1
		else
			OrionLib:MakeNotification({
				Name = "InfiniteHP",
				Content = "Disabled",
				Image = "rbxassetid://4483345998",
				Time = 3
			})
			x = 0
		end
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
	Name = "PlayerESP",
	Default = false,
	Callback = function(Value)
		if Value then
			while wait(0.1) do
		        for _, player in pairs(game:GetService("Players"):GetChildren()) do
		            if (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
		                if (game.Players.LocalPlayer ~= player) then
		                    if not (player.Character.HumanoidRootPart:FindFirstChild("ESP") and player.Character.HumanoidRootPart:FindFirstChild("NAME")) then
		                        addEsp(player, player.Character.HumanoidRootPart)
		                    end
		                end
		            end
		        end
		    end
		else
			while wait(0.1) do
		        for _, player in pairs(game:GetService("Players"):GetChildren()) do
		            if (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
		                if (game.Players.LocalPlayer ~= player) then
		                    if (player.Character.HumanoidRootPart:FindFirstChild("ESP") and player.Character.HumanoidRootPart:FindFirstChild("NAME")) then
		                        player.Character.HumanoidRootPart:FindFirstChild("ESP"):Destroy()
		                        player.Character.HumanoidRootPart:FindFirstChild("NAME"):Destroy()
		                    end
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

--Settings End--

OrionLib:Init() --UI Lib End
