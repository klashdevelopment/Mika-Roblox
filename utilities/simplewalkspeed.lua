local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local CJRPGameId = 6843988672

local loadingText = "KlashDevelopment"
local titleText = "Mikate"
if game.PlaceId == CJRPGameId then
	loadingText = "Mikate for County Jail RP"
	titleText = "Mikate for CJRP"
	loadstring(game:HttpGet('https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/scripts/CJRPBypassScript.lua'))()
end
local sws = OrionLib:MakeWindow({Name = titleText, Icon = "rbxassetid://7733965386", HidePremium = false, SaveConfig = true, ConfigFolder = "Mikate", IntroText = loadingText, IntroIcon = "rbxassetid://7733965386"})

local PlayerTab = sws:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://7733954760",
	PremiumOnly = false
})

function tweenTp(part, cframe)
	local ts = game:GetService("TweenService")
	local tw = ts:Create(part,TweenInfo.new(1),{CFrame = cframe})
	return tw
end
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

local minws = 0
local minjh = 0
local minjp = 0
local mingr = 0

local maxws = 500
local maxjh = 500
local maxjp = 500
local maxgr = 500
if game.PlaceId == CJRPGameId then
	maxws = 20
	minws = 16
	maxgr = setgravity
	mingr = setgravity
	maxjh = setjumpheight
	minjh = setjumpheight
	maxjp = setjumppower
	minjp = setjumpheight
	PlayerSection:AddParagraph("County Jail Roleplay - Warnings", "You are in a high-anicheat game. Your options are limited. See the CJRP tab for this game's exploits. JumpHeight, JumpPower, and Gravity are locked. Walkspeed is capped, and bannable cheats are disabled.")
end

PlayerSection:AddSlider({
	Name = "Walkspeed",
	Min = minws,
	Max = maxws,
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
	Min = minjp,
	Max = maxjp,
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
	Min = minjh,
	Max = maxjh,
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
	Min = mingr,
	Max = maxgr,
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
	Name = "Use JumpPower not JumpHeight",
	Default = game.Players.LocalPlayer.Character.Humanoid.UseJumpPower,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = Value
	end    
})



local PlayerSection2 = PlayerTab:AddSection({
	Name = "Others"
})
PlayerSection2:AddToggle({ Name = "Fake Lag", Default = false, Save = true, Flag = "other_exploits_fakelag", Callback = function(value)
                game:GetService("NetworkClient"):SetOutgoingKBPSLimit(value and 1 or 0);
            end });
PlayerSection2:AddToggle({
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
local cesp = {}
local todel = {}
if game.PlaceId ~= CJRPGameId then
PlayerSection2:AddToggle({ Name = "Infinite Jump", Default = false, Save = true, Flag = "movement_character_infinitejump" });
PlayerSection2:AddToggle({ Name = "Click-Teleport", Default = false, Save = true, Flag = "movement_teleporting_clicktp" });
end
PlayerSection2:AddSlider({
	Name = "Set Health Amount",
	Min = 0,
	Max = 100,
	Increment = 1,
	Flag = "sethealth",
	Default = 100,
	Color = Color3.fromRGB(255, 0, 255)
})
PlayerSection2:AddButton({
	Name = "Set Health",
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.Health = OrionLib.Flags["sethealth"].Value
	end
})

if game.GameId == 3690404710 then
	local DaBackrooms = sws:MakeTab({
		Name = "Da Backrooms",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
	local jsNames = {}
	local jsEvents = {}
	for k, v in pairs(game.ReplicatedStorage.Events:GetChildren()) do
		if v:IsA("RemoteEvent") then
			table.insert(jsNames, v.Name)
			jsEvents[v.Name] = v
		end
	end
	local rsNames = {}
	local rsEvents = {}
	for k, v in pairs(game.ReplicatedStorage:GetChildren()) do
		if v:IsA("RemoteEvent") then
			table.insert(rsNames, v.Name)
			rsEvents[v.Name] = v
		end
	end
	DaBackrooms:AddDropdown({
		Name = "Run Jumpscare",
		Default = "...",
		Options = jsNames,
		Flag = "runeventsel",
		Callback = function(value)
			jsEvents[value]:FireServer()
			wait(0.5)
			OrionLib.Flags["runeventsel"]:Set("...")
		end
	})
	DaBackrooms:AddDropdown({
		Name = "Run RemoteEvent",
		Default = "...",
		Options = rsNames,
		Flag = "runevent2sel",
		Callback = function(value)
			rsEvents[value]:FireServer()
			wait(0.5)
			OrionLib.Flags["runevent2sel"]:Set("...")
		end
	})
	DaBackrooms:AddToggle({
		Name = "Monster ESP",
		Default = false,
		Callback = function(value)
			for k, v in pairs(workspace.Monsters:GetChildren()) do
				if value then
					local hl = Instance.new("Highlight")
					hl.Name = "MonsterESP"
					hl.OutlineColor = Color3.fromRGB(255, 0, 0)
					hl.FillColor = Color3.fromRGB(255, 0, 0)
					hl.Parent = v
				else
					if v:FindFirstChild("MonsterESP") then
						v:FindFirstChild("MonsterESP"):Destroy()
					end
				end
			end
		end
	})
	DaBackrooms:AddToggle({
		Name = "Loot ESP",
		Default = false,
		Callback = function(value)
			for k, v in pairs(workspace.Loot:GetChildren()) do
				if value then
					local hl = Instance.new("Highlight")
					hl.Name = "LootESP"
					hl.OutlineColor = Color3.fromRGB(0, 255, 0)
					hl.FillColor = Color3.fromRGB(0, 255, 0)
					hl.Parent = v
				else
					if v:FindFirstChild("LootESP") then
						v:FindFirstChild("LootESP"):Destroy()
					end
				end
			end
		end
	})
	DaBackrooms:AddToggle({
		Name = "Items ESP (BETA)",
		Default = false,
		Callback = function(value)
			for k, v in pairs(workspace.Items:GetChildren()) do
				if value then
					local hl = Instance.new("Highlight")
					hl.Name = "ItemESP"
					hl.OutlineColor = Color3.fromRGB(255, 255, 0)
					hl.FillColor = Color3.fromRGB(255, 255, 0)
					hl.Parent = v
				else
					if v:FindFirstChild("ItemESP") then
						v:FindFirstChild("ItemESP"):Destroy()
					end
				end
			end
		end
	})
	DaBackrooms:AddToggle({
		Name = "Vault ESP",
		Default = false,
		Callback = function(value)
			for k, v in pairs(workspace.Vaults:GetChildren()) do
				if value then
					local hl = Instance.new("Highlight")
					hl.Name = "VaultESP"
					hl.OutlineColor = Color3.fromRGB(0, 255, 255)
					hl.FillColor = Color3.fromRGB(0, 255, 255)
					hl.Parent = v
				else
					if v:FindFirstChild("VaultESP") then
						v:FindFirstChild("VaultESP"):Destroy()
					end
				end
			end
		end
	})
	DaBackrooms:AddToggle({
		Name = "Suitcase ESP",
		Default = false,
		Callback = function(value)
			for k, v in pairs(workspace.Containers:GetChildren()) do
				if value then
					local hl = Instance.new("Highlight")
					hl.Name = "SuitESP"
					hl.OutlineColor = Color3.fromRGB(255, 0, 255)
					hl.FillColor = Color3.fromRGB(255, 0, 255)
					hl.Parent = v
				else
					if v:FindFirstChild("SuitESP") then
						v:FindFirstChild("SuitESP"):Destroy()
					end
				end
			end
		end
	})
	DaBackrooms:AddToggle({
		Name = "Infini-Light",
		Default = false,
		Callback = function(value)
			if value then
				local pl = Instance.new("PointLight")
				pl.Name = "InfLight"
				pl.Parent = game.Players.LocalPlayer.Character.Head
			else
				if game.Players.LocalPlayer.Character.Head:FindFirstChild("InfLight") then
					game.Players.LocalPlayer.Character.Head:FindFirstChild("InfLight"):Destroy()
				end
			end
		end
	})
end
if game.GameId == 4889315193 or game.GameId == 1668992109 then
	local TRD = sws:MakeTab({
		Name = "TotalDrama",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
	TRD:AddToggle({
		Name = "StatueESP",
		Default = false,
		Callback = function(value)
			if value then
				for k, v in pairs(workspace.Idols:GetChildren()) do
					if v.Name == "SafetyStatue" then
						local hl = Instance.new("Highlight")
						hl.Name = "StatueEsp"
						hl.OutlineColor = Color3.fromRGB(255, 255, 0)
						hl.FillColor = Color3.fromRGB(255, 255, 0)
						hl.Parent = v
					end
				end
			else
				for k, v in pairs(workspace.Idols:GetChildren()) do
					if v.Name == "SafetyStatue" then
						if v:FindFirstChild("StatueEsp") then
							v:FindFirstChild("StatueEsp"):Destroy()
						end
					end
				end
			end
		end
	})
	TRD:AddToggle({
		Name = "BagESP",
		Default = false,
		Callback = function(value)
			if value then
				for k, v in pairs(workspace.Idols:GetChildren()) do
					if v.Name == "Bag" then
						local hl = Instance.new("Highlight")
						hl.Name = "BagESP"
						hl.OutlineColor = Color3.fromRGB(255, 0, 0)
						hl.Parent = v
					end
				end
			else
				for k, v in pairs(workspace.Idols:GetChildren()) do
					if v.Name == "Bag" then
						if v:FindFirstChild("BagESP") then
							v:FindFirstChild("BagESP"):Destroy()
						end
					end
				end
			end
		end
	})
	TRD:AddButton({
		Name = "Bag Teleport",
		Callback = function()
			if value then
				for k, v in pairs(workspace.Idols:GetChildren()) do
					if v.Name == "Bag" then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.MeshPart.CFrame
					end
				end
			end
		end
	})
	TRD:AddButton({
		Name = "Statue Teleport",
		Callback = function()
			if value then
				for k, v in pairs(workspace.Idols:GetChildren()) do
					if v.Name == "SafetyStatue" then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle2.CFrame
					end
				end
			end
		end
	})
	TRD:AddButton({
		Name = "Skip Obby",
		Callback = function()
			if workspace.Assets:FindFirstChildWhichIsA("Folder") or #workspace.Assets:GetChildren()<1 then
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "Invalid",
					Text = "Wait for an Obby!"
				})
				return
			end
			local finish = workspace.Assets:FindFirstChildWhichIsA("Folder"):FindFirstChild("Finish")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = finish.CFrame
		end
	})
	TRD:AddButton({
		Name = "Coin TP",
		Callback = function()
			if workspace.Assets:FindFirstChildWhichIsA("Folder") or #workspace.Assets:GetChildren()<1 then
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "Invalid",
					Text = "Wait for an Obby!"
				})
				return
			end
			local currentCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			for k, v in pairs(workspace.Assets:FindFirstChildWhichIsA("Folder"):FindFirstChild("Coins"):GetChildren()) do
				if v.Name == "Coin" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
				end
			end
		end
	})
	TRD:AddButton({
		Name = "Diamond TP",
		Callback = function()
			if workspace.Assets:FindFirstChildWhichIsA("Folder") or #workspace.Assets:GetChildren()<1 then
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "Invalid",
					Text = "Wait for an Obby!"
				})
				return
			end
			local currentCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			for k, v in pairs(workspace.Assets:FindFirstChildWhichIsA("Folder"):FindFirstChild("Coins"):GetChildren()) do
				if v.Name == "Gem" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
				end
			end
		end
	})
end

local function connect(signal, callback)
    local connection = signal:Connect(callback);
    table.insert(OrionLib.Connections, connection);
    return connection;
end
connect(game:GetService("UserInputService").InputBegan, function(input, processed)
    if game.PlaceId ~= CJRPGameId and input.UserInputType.Name == "MouseButton1" and not processed and OrionLib.Flags["movement_teleporting_clicktp"].Value then
        local character = game.Players.LocalPlayer.Character;
        local camPos = workspace.CurrentCamera.CFrame.Position;
		local mouse = game.Players.LocalPlayer:GetMouse();
        local ray = Ray.new(camPos, mouse.Hit.Position - camPos);
        local _, hit, normal = workspace:FindPartOnRayWithIgnoreList(ray, { camera });
        if hit and normal then
            character:PivotTo(CFrame.new(hit + normal));
        end
    end
    if game.PlaceId ~= CJRPGameId then
    if input.KeyCode.Name == "Space" and not processed and OrionLib.Flags["movement_character_infinitejump"].Value then
        local character = game.Players.LocalPlayer.Character;
        local humanoid = character and character:FindFirstChildOfClass("Humanoid");
        if humanoid then
            humanoid:ChangeState("Jumping");
        end 
    end
    end
end);

local invisRunning = false;
local invisDied;
local invisFix;
	local Player = game.Players.LocalPlayer
	repeat wait(.1) until Player.Character
	local Character = Player.Character
	local IsInvis = false
	local IsRunning = true
	local CF
	local Void = workspace.FallenPartsDestroyHeight
	local InvisibleCharacter
	
function Respawn()
		IsRunning = false
		if IsInvis == true then
			pcall(function()
				Player.Character = Character
				wait()
				Character.Parent = workspace
				Character:FindFirstChildWhichIsA'Humanoid':Destroy()
				IsInvis = false
				InvisibleCharacter.Parent = nil
				invisRunning = false
			end)
		elseif IsInvis == false then
			pcall(function()
				Player.Character = Character
				wait()
				Character.Parent = workspace
				Character:FindFirstChildWhichIsA'Humanoid':Destroy()
				TurnVisible()
			end)
		end
	end
	function TurnVisible()
		if IsInvis == false then return end
		invisFix:Disconnect()
		invisDied:Disconnect()
		CF = workspace.CurrentCamera.CFrame
		Character = Character
		local CF_1 = Player.Character.HumanoidRootPart.CFrame
		Character.HumanoidRootPart.CFrame = CF_1
		InvisibleCharacter:Destroy()
		Player.Character = Character
		Character.Parent = workspace
		IsInvis = false
		Player.Character.Animate.Disabled = true
		Player.Character.Animate.Disabled = false
		invisDied = Character:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
			Respawn()
			invisDied:Disconnect()
		end)
		invisRunning = false
	end
function Invisible()
	if invisRunning then return end
	invisRunning = true
	-- Full credit to AmokahFox @V3rmillion
	Character.Archivable = true
	InvisibleCharacter = Character:Clone()
	InvisibleCharacter.Parent = game:GetService'Lighting'
	InvisibleCharacter.Name = ""

	invisFix = game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			local IsInteger
			if tostring(Void):find'-' then
				IsInteger = true
			else
				IsInteger = false
			end
			local Pos = Player.Character.HumanoidRootPart.Position
			local Pos_String = tostring(Pos)
			local Pos_Seperate = Pos_String:split(', ')
			local X = tonumber(Pos_Seperate[1])
			local Y = tonumber(Pos_Seperate[2])
			local Z = tonumber(Pos_Seperate[3])
			if IsInteger == true then
				if Y <= Void then
					Respawn()
				end
			elseif IsInteger == false then
				if Y >= Void then
					Respawn()
				end
			end
		end)
	end)

	for i,v in pairs(InvisibleCharacter:GetDescendants())do
		if v:IsA("BasePart") then
			if v.Name == "HumanoidRootPart" then
				v.Transparency = 1
			else
				v.Material = Enum.Material.ForceField
				v.Color = Color3.fromRGB(25,25,25)
			end
		end
	end

	
	invisDied = InvisibleCharacter:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
		Respawn()
		invisDied:Disconnect()
	end)

	if IsInvis == true then return end
	IsInvis = true
	CF = workspace.CurrentCamera.CFrame
	local CF_1 = Player.Character.HumanoidRootPart.CFrame
	Character:MoveTo(Vector3.new(0,math.pi*1000000,0))
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	wait(.2)
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	InvisibleCharacter = InvisibleCharacter
	Character.Parent = game:GetService'Lighting'
	InvisibleCharacter.Parent = workspace
	InvisibleCharacter.HumanoidRootPart.CFrame = CF_1
	Player.Character = InvisibleCharacter
	workspace.CurrentCamera:remove()
	wait(.1)
	repeat wait() until Player.Character ~= nil
	workspace.CurrentCamera.CameraSubject = Player.Character:FindFirstChildWhichIsA('Humanoid')
	workspace.CurrentCamera.CameraType = "Custom"
	Player.CameraMinZoomDistance = 0.5
	Player.CameraMaxZoomDistance = 400
	Player.CameraMode = "Classic"
	Player.Character.Head.Anchored = false
	Player.Character.Animate.Disabled = true
	Player.Character.Animate.Disabled = false
end
local flightEnabled = false
local expi = sws:MakeTab({
	Name = "Exploits",
	Icon = "rbxassetid://7743872929",
	PremiumOnly = false
})
if game.PlaceId ~= CJRPGameId then
expi:AddToggle({
	Name = "Flight",
	Default = flightEnabled,
	Callback = function(Value)
		flightEnabled = Value
	end
})
end
local xray = {};
local function isCharacterPart(part)
    for _, player in next, game.Players:GetPlayers() do
        if player.Character and part:IsDescendantOf(player.Character) then
            return true;
        end
    end
    return false;
end
expi:AddToggle({ Name = "X-Ray", Default = false, Callback = function(value)
                if value then
                    for _, part in next, workspace:GetDescendants() do
                        if part:IsA("BasePart") and part.Transparency ~= 1 and not part:IsDescendantOf(workspace.CurrentCamera) and not isCharacterPart(part) then
                            if not xray[part] or xray[part] ~= part.Transparency then
                                xray[part] = part.Transparency;
                            end
                            part.Transparency = 0.75;
                        end
                    end
                else
                    for _, part in next, workspace:GetDescendants() do
                        if xray[part] then
                            part.Transparency = xray[part];
                        end
                    end
                end
            end });

            expi:AddButton({ Name = "Rejoin Game", Callback = function()
                game:GetService("TeleportService"):Teleport(game.PlaceId);
            end });
            if game.PlaceId ~= CJRPGameId then
expi:AddSlider({ Name = "Flight Speed", Min = 10, Max = 200, Default = 100, ValueName = "studs/s", Save = true, Flag = "flyspeed" });

expi:AddButton({
	Name = "Invisible (DO NOT USE)",
	Callback = function()
		Invisible()
	end
})
expi:AddButton({
	Name = "Visible (DO NOT USE)",
	Callback = function()
		TurnVisible()
	end
})end
local playerIcon = 7743871002

local fcRunning = false

local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value
Spring = {} do
	Spring.__index = Spring

	function Spring.new(freq, pos)
		local self = setmetatable({}, Spring)
		self.f = freq
		self.p = pos
		self.v = pos*0
		return self
	end

	function Spring:Update(dt, goal)
		local f = self.f*2*math.pi
		local p0 = self.p
		local v0 = self.v

		local offset = goal - p0
		local decay = math.exp(-f*dt)

		local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
		local v1 = (f*dt*(offset*f - v0) + v0)*decay

		self.p = p1
		self.v = v1

		return p1
	end

	function Spring:Reset(pos)
		self.p = pos
		self.v = pos*0
	end
end

local cameraPos = Vector3.new()
local cameraRot = Vector2.new()
local Input = {}
	keyboard = {
		W = 0,
		A = 0,
		S = 0,
		D = 0,
		E = 0,
		Q = 0,
		Up = 0,
		Down = 0,
		LeftShift = 0,
	}

	mouse = {
		Delta = Vector2.new(),
	}

	NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
	PAN_MOUSE_SPEED = Vector2.new(1, 1)*(math.pi/64)
	NAV_ADJ_SPEED = 0.75
	NAV_SHIFT_MUL = 0.25

	navSpeed = 1

	function Input.Vel(dt)
		navSpeed = math.clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)

		local kKeyboard = Vector3.new(
			keyboard.D - keyboard.A,
			keyboard.E - keyboard.Q,
			keyboard.S - keyboard.W
		)*NAV_KEYBOARD_SPEED

		local shift = game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift)

		return (kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
	end

	function Input.Pan(dt)
		local kMouse = mouse.Delta*PAN_MOUSE_SPEED
		mouse.Delta = Vector2.new()
		return kMouse
	end
	

	do
		function Keypress(action, state, input)
			keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
			return Enum.ContextActionResult.Sink
		end

		function MousePan(action, state, input)
			local delta = input.Delta
			mouse.Delta = Vector2.new(-delta.y, -delta.x)
			return Enum.ContextActionResult.Sink
		end

		function Zero(t)
			for k, v in pairs(t) do
				t[k] = v*0
			end
		end

		function Input.StartCapture()
			game:GetService("ContextActionService"):BindActionAtPriority("FreecamKeyboard",Keypress,false,INPUT_PRIORITY,
				Enum.KeyCode.W,
				Enum.KeyCode.A,
				Enum.KeyCode.S,
				Enum.KeyCode.D,
				Enum.KeyCode.E,
				Enum.KeyCode.Q,
				Enum.KeyCode.Up,
				Enum.KeyCode.Down
			)
			game:GetService("ContextActionService"):BindActionAtPriority("FreecamMousePan",MousePan,false,INPUT_PRIORITY,Enum.UserInputType.MouseMovement)
		end

		function Input.StopCapture()
			navSpeed = 1
			Zero(keyboard)
			Zero(mouse)
			game:GetService("ContextActionService"):UnbindAction("FreecamKeyboard")
			game:GetService("ContextActionService"):UnbindAction("FreecamMousePan")
		end
	end
function GetFocusDistance(cameraFrame)
	local znear = 0.1
	local viewport = workspace.CurrentCamera.ViewportSize
	local projy = 2*math.tan(cameraFov/2)
	local projx = viewport.x/viewport.y*projy
	local fx = cameraFrame.rightVector
	local fy = cameraFrame.upVector
	local fz = cameraFrame.lookVector

	local minVect = Vector3.new()
	local minDist = 512

	for x = 0, 1, 0.5 do
		for y = 0, 1, 0.5 do
			local cx = (x - 0.5)*projx
			local cy = (y - 0.5)*projy
			local offset = fx*cx - fy*cy + fz
			local origin = cameraFrame.p + offset*znear
			local _, hit = workspace:FindPartOnRay(Ray.new(origin, offset.unit*minDist))
			local dist = (hit - origin).magnitude
			if minDist > dist then
				minDist = dist
				minVect = offset.unit
			end
		end
	end

	return fz:Dot(minVect)*minDist
end
local velSpring = Spring.new(5, Vector3.new())
local panSpring = Spring.new(5, Vector2.new())
local function StepFreecam(dt)
	local vel = velSpring:Update(dt, Input.Vel(dt))
	local pan = panSpring:Update(dt, Input.Pan(dt))

	local zoomFactor = math.sqrt(math.tan(math.rad(70/2))/math.tan(math.rad(cameraFov/2)))

	cameraRot = cameraRot + pan*Vector2.new(0.75, 1)*8*(dt/zoomFactor)
	cameraRot = Vector2.new(math.clamp(cameraRot.x, -math.rad(90), math.rad(90)), cameraRot.y%(2*math.pi))

	local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*Vector3.new(1, 1, 1)*64*dt)
	cameraPos = cameraCFrame.p

	workspace.CurrentCamera.CFrame = cameraCFrame
	workspace.CurrentCamera.Focus = cameraCFrame*CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
	workspace.CurrentCamera.FieldOfView = cameraFov
end

local PlayerState = {} do
	mouseBehavior = ""
	mouseIconEnabled = ""
	cameraType = ""
	cameraFocus = ""
	cameraCFrame = ""
	cameraFieldOfView = ""

	function PlayerState.Push()
		cameraFieldOfView = workspace.CurrentCamera.FieldOfView
		workspace.CurrentCamera.FieldOfView = 70

		cameraType = workspace.CurrentCamera.CameraType
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom

		cameraCFrame = workspace.CurrentCamera.CFrame
		cameraFocus = workspace.CurrentCamera.Focus

		mouseIconEnabled = game:GetService("UserInputService").MouseIconEnabled
		game:GetService("UserInputService").MouseIconEnabled = true

		mouseBehavior = game:GetService("UserInputService").MouseBehavior
		game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
	end

	function PlayerState.Pop()
		workspace.CurrentCamera.FieldOfView = 70

		workspace.CurrentCamera.CameraType = cameraType
		cameraType = nil

		workspace.CurrentCamera.CFrame = cameraCFrame
		cameraCFrame = nil

		workspace.CurrentCamera.Focus = cameraFocus
		cameraFocus = nil

		game:GetService("UserInputService").MouseIconEnabled = mouseIconEnabled
		mouseIconEnabled = nil

		game:GetService("UserInputService").MouseBehavior = mouseBehavior
		mouseBehavior = nil
	end
end

function StartFreecam(pos)
	if fcRunning then
		StopFreecam()
	end
	local cameraCFrame = workspace.CurrentCamera.CFrame
	if pos then
		cameraCFrame = pos
	end
	cameraRot = Vector2.new()
	cameraPos = cameraCFrame.p
	cameraFov = workspace.CurrentCamera.FieldOfView

	velSpring:Reset(Vector3.new())
	panSpring:Reset(Vector2.new())

	PlayerState.Push()
	game:GetService("RunService"):BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	Input.StartCapture()
	fcRunning = true
end

function StopFreecam()
	if not fcRunning then return end
	Input.StopCapture()
	game:GetService("RunService"):UnbindFromRenderStep("Freecam")
	PlayerState.Pop()
	workspace.Camera.FieldOfView = 70
	fcRunning = false
end

function AnchorPlayer(player,value)
	for k, v in pairs(player.Character:GetChildren()) do
		if v:IsA("Part") or v:IsA("MeshPart") then
			v.Anchored = value
		end
	end
end

local camera = sws:MakeTab({
	Name = "Camera",
	Icon = "rbxassetid://7733708692",
	PremiumOnly = false
})
camera:AddSlider({
	Name = "Minimum ThirdPerson Zoom",
	Min = 0,
	Max = 120,
	Default = game.Players.LocalPlayer.CameraMinZoomDistance,
	Increment = 1,
	ValueName = "studs",
	Callback = function(value)
		game.Players.LocalPlayer.CameraMinZoomDistance = value
	end
})
camera:AddSlider({
	Name = "Maximum ThirdPerson Zoom",
	Min = 0,
	Max = 120,
	Default = game.Players.LocalPlayer.CameraMaxZoomDistance,
	Increment = 1,
	ValueName = "studs",
	Callback = function(value)
		game.Players.LocalPlayer.CameraMaxZoomDistance = value
	end
})
camera:AddSlider({
	Name = "Zoom Level",
	Min = 0,
	Max = 120,
	Default = game.Players.LocalPlayer.CameraMinZoomDistance,
	Increment = 1,
	ValueName = "studs",
	Callback = function(value)
		local speaker = game.Players.LocalPlayer
		local camMax = speaker.CameraMaxZoomDistance
		local camMin = speaker.CameraMinZoomDistance
		if camMax < tonumber(value) then
			camMax = value
		end
		speaker.CameraMaxZoomDistance = value
		speaker.CameraMinZoomDistance = value
		wait()
		speaker.CameraMaxZoomDistance = camMax
		speaker.CameraMinZoomDistance = camMin
	end
})
camera:AddToggle({
	Name = "Freecam",
	Default = false,
	Callback = function(value)
		if value then
			StartFreecam()
		else
			StopFreecam()
		end
	end
})
camera:AddToggle({
	Name = "Freeze/Anchor",
	Default = false,
	Callback = function(value)
		AnchorPlayer(game.Players.LocalPlayer, value)
	end
})
camera:AddDropdown({
	Name = "Camera Type",
	Default = workspace.CurrentCamera.CameraType.Name,
	Options = {"Fixed","Attach","Watch","Track","Follow","Custom","Scriptable","Orbital"},
	Callback = function(cam)
		workspace.CurrentCamera.CameraType = Enum.CameraType[cam]
	end
})
camera:AddDropdown({
	Name = "Camera Type",
	Default = game.Players.LocalPlayer.CameraMode,
	Options = {"Classic", "LockFirstPerson"},
	Callback = function(cam)
		game.Players.LocalPlayer.CameraMode = cam
	end
})
camera:AddToggle({
	Name = "Shift Lock Enabled",
	Default = game.Players.LocalPlayer.DevEnableMouseLock,
	Callback = function(value)
		game.Players.LocalPlayer.DevEnableMouseLock = value
	end
})
function UnlockParts(character)
	for _, part in ipairs(character:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Locked = false
		end
	end
end
function LockParts(character)
	for _, part in ipairs(character:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Locked = true
		end
	end
end
camera:AddToggle({
	Name = "Locked Player",
	Default = true,
	Callback = function(value)
		if value then
			LockParts(game.Players.LocalPlayer.Character)
		else
			UnlockParts(game.Players.LocalPlayer.Character)
		end
	end
})

local currentPartsSelected = {}
local PartManip2 = sws:MakeTab({
	Name = "Multi-Parts",
	Icon = "rbxassetid://8997388430",
	PremiumOnly = false
})
local partSel2 = PartManip2:AddSection({Name = "Part Selection"})
partSel2:AddToggle({
	Name = "Part Selector",
	Flag = "selParts",
	Default = false
})
partSel2:AddButton({
	Name = "Remove Selected Part ESP",
	Callback = function()
		for k, cps in pairs(currentPartsSelected) do
			for k, v in pairs(cps:GetChildren()) do
				if v:IsA("Highlight") then
					v:Destroy()
				end
			end
		end
	end
})
local parts2 = PartManip2:AddSection({Name = "Part Manipulation"})
parts2:AddButton({
	Name = "Toggle Part X-Ray",
	Callback = function()
		for k, currentPartSelected in pairs(currentPartsSelected) do
		if currentPartSelected ~= nil then
			if currentPartSelected:GetAttribute("xray") then
				currentPartSelected.Transparency = currentPartSelected:GetAttribute("prexraytsp")
				currentPartSelected:SetAttribute("xray", false)
			else
				currentPartSelected:SetAttribute("prexraytsp", currentPartSelected.Transparency)
				currentPartSelected.Transparency = 0.25
				currentPartSelected:SetAttribute("xray", true)
			end
		end
		end
	end
})
parts2:AddButton({
	Name = "Destroy Parts",
	Callback = function()
		for k, currentPartSelected in pairs(currentPartsSelected) do
		if currentPartSelected ~= nil then
			currentPartSelected:Destroy()
		end
		end
	end
})
parts2:AddButton({
	Name = "Disable Part Collision",
	Callback = function()
		for k, currentPartSelected in pairs(currentPartsSelected) do
		if currentPartSelected ~= nil then
			currentPartSelected.CanCollide = false
		end
		end
	end
})
parts2:AddButton({
	Name = "Enable Part Collision",
	Callback = function()
		for k, currentPartSelected in pairs(currentPartsSelected) do
			if currentPartSelected ~= nil then
				currentPartSelected.CanCollide = true
			end
		end
	end
})
parts2:AddButton({
	Name = "Disable Part Querying",
	Callback = function()
		for k, currentPartSelected in pairs(currentPartsSelected) do
		if currentPartSelected ~= nil then
			currentPartSelected.CanQuery = false
			currentPartSelected.CanTouch = false
		end
		end
	end
})
parts2:AddButton({
	Name = "Enable Part Querying",
	Callback = function()
		for k, currentPartSelected in pairs(currentPartsSelected) do
		if currentPartSelected ~= nil then
			currentPartSelected.CanQuery = true
			currentPartSelected.CanTouch = true
		end
		end
	end
})
local PartManip = sws:MakeTab({
	Name = "Parts",
	Icon = "rbxassetid://8997388430",
	PremiumOnly = false
})
local partSel = PartManip:AddSection({Name = "Part Selection"})
function getMouseTarget()
	local cursorPosition = game:GetService("UserInputService"):GetMouseLocation()
	local oray = game.workspace.CurrentCamera:ViewportPointToRay(cursorPosition.x, cursorPosition.y, 0)
	local ray = Ray.new(game.Workspace.CurrentCamera.CFrame.p,(oray.Direction * 1000))
	return workspace:FindPartOnRay(ray)
end
local currentPartSelected = nil
partSel:AddToggle({
	Name = "Part Selector",
	Flag = "selPart",
	Default = false
})
partSel:AddButton({
	Name = "Remove Selected Part ESP",
	Callback = function()
		if currentPartSelected ~= nil then
			currentPartSelected:FindFirstChild("Highlight"):Destroy()
		end
	end
})
game:GetService("UserInputService").InputBegan:Connect(function(input, thing)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		if OrionLib.Flags["selPart"].Value then
			local part, pos = getMouseTarget()
			if part == nil then return end
			OrionLib.Flags["selPart"]:Set(false)
			currentPartSelected = part
			part:FindFirstChild("Highlight").FillColor = Color3.fromRGB(0, 255, 0)
			part:FindFirstChild("Highlight").OutlineColor = Color3.fromRGB(0, 255, 0)
		elseif OrionLib.Flags["selParts"].Value then
			local part, pos = getMouseTarget()
			if part == nil then return end
			for k, v in pairs(currentPartsSelected) do
				if v == part then
					table.remove(currentPartsSelected, k)
					break
				end
			end
			table.insert(currentPartsSelected, part)
			part:FindFirstChild("Highlight").FillColor = Color3.fromRGB(0, 255, 0)
			part:FindFirstChild("Highlight").OutlineColor = Color3.fromRGB(0, 255, 0)
		end
	end
end)
local parts = PartManip:AddSection({Name = "Part Manipulation"})
parts:AddButton({
	Name = "Toggle Part X-Ray",
	Callback = function()
		if currentPartSelected ~= nil then
			if currentPartSelected:GetAttribute("xray") then
				currentPartSelected.Transparency = currentPartSelected:GetAttribute("prexraytsp")
				currentPartSelected:SetAttribute("xray", false)
			else
				currentPartSelected:SetAttribute("prexraytsp", currentPartSelected.Transparency)
				currentPartSelected.Transparency = 0.25
				currentPartSelected:SetAttribute("xray", true)
			end
		end
	end
})
parts:AddButton({
	Name = "Destroy Part",
	Callback = function()
		if currentPartSelected ~= nil then
			currentPartSelected:Destroy()
		end
	end
})
parts:AddButton({
	Name = "Disable Part Collision",
	Callback = function()
		if currentPartSelected ~= nil then
			currentPartSelected.CanCollide = false
		end
	end
})
parts:AddButton({
	Name = "Enable Part Collision",
	Callback = function()
		if currentPartSelected ~= nil then
			currentPartSelected.CanCollide = true
		end
	end
})
parts:AddButton({
	Name = "Disable Part Querying",
	Callback = function()
		if currentPartSelected ~= nil then
			currentPartSelected.CanQuery = false
			currentPartSelected.CanTouch = false
		end
	end
})
parts:AddButton({
	Name = "Enable Part Querying",
	Callback = function()
		if currentPartSelected ~= nil then
			currentPartSelected.CanQuery = true
			currentPartSelected.CanTouch = true
		end
	end
})

local tools = sws:MakeTab({
	Name = "Tools",
	Icon = "rbxassetid://7733955511",
	PremiumOnly = false
})
local replToolsNames = {}
local replTools = {}
local workToolsNames = {}
local workTools = {}
function workToolsAdd(object)
	for k, v in pairs(object:GetChildren()) do
		if v:IsA("Tool") then
			table.insert(workToolsNames, v.Name)
			workTools[v.Name] = v
		end
		if #v:GetChildren() > 0 then
			workToolsAdd(v)
		end
	end
end
function replToolsAdd(object)
	for k, v in pairs(object:GetChildren()) do
		if v:IsA("Tool") then
			table.insert(replToolsNames, v.Name)
			replTools[v.Name] = v
		end
		if #v:GetChildren() > 0 then
			replToolsAdd(v)
		end
	end
end
replToolsAdd(game.ReplicatedStorage)
replToolsAdd(game.ReplicatedFirst)
replToolsAdd(game.Lighting)
workToolsAdd(workspace)


function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

local givers = tools:AddSection({Name = "Tool Givers"})
givers:AddDropdown({
	Name = "ReplFirst, ReplStorage, Lighting Tools",
	Flag = "rpdd",
	Options = replToolsNames,
	Callback = function(option)
		local tool = replTools[option]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
		OrionLib.Flags["rpdd"]:Set("None")
	end
})
givers:AddDropdown({
	Name = "Workspace Tools",
	Flag = "wtdd",
	Options = workToolsNames,
	Callback = function(option)
		local child = workTools[option]
		if game.Players.LocalPlayer.Character and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(child)
		end
		OrionLib.Flags["wtdd"]:Set("None")
	end
})
workspace.ChildAdded:Connect(function(child)
	if game.Players.LocalPlayer.Character and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then
		table.insert(workToolsNames, child.Name)
		workTools[child.Name] = child
		OrionLib.Flags["wtdd"]:Refresh(workToolsNames, true)
	end
end)
game.ReplicatedStorage.ChildAdded:Connect(function(child)
	if game.Players.LocalPlayer.Character and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then
		table.insert(replToolsNames, child.Name)
		replTools[child.Name] = child
		OrionLib.Flags["rpdd"]:Refresh(replToolsNames, true)
	end
end)
game.ReplicatedFirst.ChildAdded:Connect(function(child)
	if game.Players.LocalPlayer.Character and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then
		table.insert(replToolsNames, child.Name)
		replTools[child.Name] = child
		OrionLib.Flags["rpdd"]:Refresh(replToolsNames, true)
	end
end)
game.Lighting.ChildAdded:Connect(function(child)
	if game.Players.LocalPlayer.Character and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then
		table.insert(replToolsNames, child.Name)
		replTools[child.Name] = child
		OrionLib.Flags["rpdd"]:Refresh(replToolsNames, true)
	end
end)
givers:AddButton({
	Name = "Client BTools (Classic)",
	Callback = function()
		for i = 1, 4 do
			local Tool = Instance.new("HopperBin")
			Tool.BinType = i
			Tool.Name = randomString()
			Tool.Parent = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
		end
	end
})

givers:AddButton({
	Name = "Client BTools (F3X)",
	Callback = function()
		loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
	end
})
local grabtoolsFunc = nil
givers:AddToggle({
	Name = "Auto Grab Tools",
	Default = false,
	Callback = function(value)
		if value then
			local humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
			for _, child in ipairs(workspace:GetChildren()) do
				if game.Players.LocalPlayer.Character and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then
					humanoid:EquipTool(child)
				end
			end

			

			grabtoolsFunc = workspace.ChildAdded:Connect(function(child)
				if game.Players.LocalPlayer.Character and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then
					humanoid:EquipTool(child)
				end
			end)
		else
			if grabtoolsFunc then 
				grabtoolsFunc:Disconnect() 
			end
		end
	end
})

local Cgui = sws:MakeTab({
	Name = "Core UI",
	Icon = "rbxassetid://7734022107",
	PremiumOnly = false
})
if game:GetService("Chat"):FindFirstChild("ClientChatModules") then
local chatSettings = require(game:GetService("Chat").ClientChatModules.ChatSettings)
local chatFrame = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame

local Chat = Cgui:AddSection({
	Name = "Chat"
})
Chat:AddToggle({
	Name = "Chat Box Visibility",
	Default = chatFrame.ChatChannelParentFrame.Visible,
	Callback = function(state)
		chatFrame.ChatChannelParentFrame.Visible = state
	end
})
Chat:AddToggle({
	Name = "Chat Draggable",
	Default = chatSettings.WindowDraggable,
	Callback = function(state)
		chatSettings.WindowDraggable = state
	end
})
Chat:AddToggle({
	Name = "Chat Resizable",
	Default = chatSettings.WindowResizable,
	Callback = function(state)
		chatSettings.WindowResizable = state
	end
})
end
local GenUI = Cgui:AddSection({
	Name = "General Core UI"
})
GenUI:AddToggle({
	Name = "Mouse Cursor",
	Default = game:GetService("UserInputService").MouseIconEnabled,
	Callback = function(state)
		game:GetService("UserInputService").MouseIconEnabled = state
	end
})
GenUI:AddToggle({
	Name = "No Lag",
	Default = false,
	Callback = function(value)
        for i,v in pairs(workspace:GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("BasePart") then
                if value then
                    v:SetAttribute("NolagMaterial", v.Material)
                    v.Material = "SmoothPlastic"
                else
					if v:GetAttribute("NolagMaterial") then
                    v.Material = v:GetAttribute("NolagMaterial")
					end
                end
            end
        end
	end
})
GenUI:AddButton({
	Name = "Enable Reset Character",
	Callback = function()
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
	end
})
GenUI:AddButton({
	Name = "Disable Reset Character",
	Callback = function()
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", false)
	end
})

if game.PlaceId ~= CJRPGameId then
local Loops = sws:MakeTab({
	Name = "Loops",
	Icon = "rbxassetid://7743872492",
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
end

local Visuals = sws:MakeTab({
	Name = "Visual",
	Icon = "rbxassetid://7733774602",
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
	Icon = "rbxassetid://7733799682" });
    do
        local esp = visuals:AddSection({ Name = "ESP" });
        do
        	if game.PlaceId ~= CJRPGameId then
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
            else
            esp:AddButton({
				Name = "Enable JailRP ESP",
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
			end
        end
    end
    
local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
local clippin = sws:MakeTab({
	Name = "Clipping",
	Icon = "rbxassetid://7733671493",
	PremiumOnly = false
})
local clipping = clippin:AddSection({ Name = "Forward-Clips" })
if game.PlaceId ~= CJRPGameId then
clipping:AddSlider({Name="Forward Clip Value",Min=0,Max=200,Default=5,ValueName="studs",Flag="cclipval"})
clipping:AddButton({Name="Forward Clip", Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * OrionLib.Flags["cclipval"].Value
end})
end
clipping:AddButton({Name="Clip Forward (5 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 5
end})
clipping:AddButton({Name="Clip Forward (10 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 10
end})
clipping:AddButton({Name="Clip Forward (15 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 15
end})
clipping:AddButton({Name="Clip Forward (20 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 20
end})
if game.PlaceId ~= CJRPGameId then
clipping:AddButton({Name="Clip Forward (50 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 50
end})
clipping:AddButton({Name="Clip Forward (75 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 75
end})
clipping:AddButton({Name="Clip Forward (100 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * 100
end})
end
local clipping2 = clippin:AddSection({ Name = "Backward-Clips" })
if game.PlaceId ~= CJRPGameId then
clipping2:AddSlider({Name="Backward Clip Value",Min=0,Max=200,Default=5,ValueName="studs",Flag="cclipval2"})
clipping2:AddButton({Name="Backward Clip", Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * -OrionLib.Flags["cclipval2"].Value
end})
end
clipping2:AddButton({Name="Clip Backward (5 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * -5
end})
clipping2:AddButton({Name="Clip Backward (10 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * -10
end})
clipping2:AddButton({Name="Clip Backward (15 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * -15
end})
clipping2:AddButton({Name="Clip Backward (20 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * -20
end})
if game.PlaceId ~= CJRPGameId then
clipping2:AddButton({Name="Clip Backward (50 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * -50
end})
clipping2:AddButton({Name="Clip Backward (75 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * -75
end})
clipping2:AddButton({Name="Clip Backward (100 studs)",Callback=function()
	hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * -100
end})
end

local Credits = sws:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://8834748103",
	PremiumOnly = false
})
Credits:AddLabel("Scripting - GavinGoGaming (Klash CEO)")
Credits:AddLabel("Playtest - Reality (Klash Dev)")

if game.PlaceId == CJRPGameId then
	local CJRP = sws:MakeTab({
		Name = "CJRP",
		Icon = "rbxassetid://14171508365",
		PremiumOnly = false
	})
	local CJRPSection = CJRP:AddSection({ Name = "County Jail Roleplay" })
	CJRPSection:AddParagraph("                                  -- Teleportation --", "For these to work, you must stand atleast semi-close to the location for it to work.")
	CJRPSection:AddButton({
		Name = "Maxsec Keycard (Works Best in Maxsec)",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(96, -6, -433)
		end
	})
	CJRPSection:AddParagraph("                                   -- Destruction --", "")
	
	function destroyIfDoor(l)
		if l.Name == "MetalDoor" then 
		   	l:Destroy()
		end
		if l.Name == "BarsDoor" then 
		    l:Destroy()
		end
		if l.Name == "Door" then 
		   	l:Destroy()
		end
		if l.Name == "GlassDoor" then 
		    l:Destroy()
		end
		if l.Name == "SolitaryDoor" then 
		    l:Destroy()
		end
		if l.Name == "WindowMetalDoor" then 
		    l:Destroy()
		end
		if l.Name == "WoodDoor" then 
		    l:Destroy()
		end
		
		if l.Name == "Model" then 
			for _,v in pairs(l:GetChildren()) do
				destroyIfDoor(v)
			end
		end
	end
	function destroyIfFence(l)
		if l.Name == "Part" then 
		   	l:Destroy()
		end
		if l.Name == "Prop/Barbed" then 
		   	l:Destroy()
		end
	end
	CJRPSection:AddButton({
		Name = "Destroy Doors",
		Callback = function(Value)
		    for i, v in pairs(game.Workspace["Prop/Outside"]:GetChildren()) do
		        destroyIfDoor(v)
		    end
		    for i, v in pairs(game.Workspace["Prop/Outside"].SheriffOffice:GetChildren()) do
		        destroyIfDoor(v)
		    end
		    for i, v in pairs(game.Workspace.TopFloor:GetChildren()) do
		        destroyIfDoor(v)
		    end
		    for i, v in pairs(game.Workspace.Doors:GetChildren()) do
		        destroyIfDoor(v)
		    end
		    for i, v in pairs(game.Workspace.Map:GetChildren()) do
		    	if v.Name == "Cell" then
		    		for i, x in pairs(v:GetChildren()) do
				        destroyIfDoor(x)
				    end
		    	else
		    		destroyIfDoor(v)
		    	end
		    end
		end
	})
	CJRPSection:AddButton({
		Name = "Destroy Fences",
		Callback = function(Value)
		    for i, v in pairs(game.Workspace["Fence"]:GetChildren()) do
		        destroyIfFence(v)
		    end
		    for i, v in pairs(game.Workspace["Fence"].BarbedHitbox:GetChildren()) do
		        destroyIfFence(v)
		    end
		    for i, v in pairs(game.Workspace["Fence"].BarbedWire:GetChildren()) do
		        destroyIfFence(v)
		    end
		    for i, v in pairs(game.Workspace["Fence"].FenceChain:GetChildren()) do
		        destroyIfFence(v)
		    end
		    for i, v in pairs(game.Workspace["Fence"].FenceBottoms:GetChildren()) do
		        destroyIfFence(v)
		    end
		end
	})
	CJRPSection:AddButton({
		Name = "Destroy Exit/Enter Gate",
		Callback = function(Value)
		    game.Workspace.Fence["ExitGate"]:Destroy()
		    game.Workspace.Fence["EnterenceGate"]:Destroy()
		    game.Workspace.Fence["GateControl"]:Destroy()
		end
	})
end

OrionLib:Init()
local hls = {}

while true do
	if OrionLib.Flags["selPart"].Value or OrionLib.Flags["selParts"].Value then
		local part, pos = getMouseTarget()
		for k, v in pairs(hls) do
			if v ~= part then
				if OrionLib.Flags["selParts"].Value then
					local containsHl = false
					for z, x in pairs(currentPartsSelected) do
						if x == v.Parent then
							containsHl = true
							v.FillColor = Color3.fromRGB(0, 255, 0)
							v.OutlineColor = Color3.fromRGB(0, 255, 0)
						end
					end
					if not containsHl then
						table.remove(hls, k)
						v:Destroy()
					end
				elseif OrionLib.Flags["selPart"].Value then
					table.remove(hls, k)
					v:Destroy()
				end
			end
		end
		local hl = Instance.new("Highlight")
		hl.Parent = part
		table.insert(hls, hl)
	end
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
	if flightEnabled then
		local rootPart = game.Players.LocalPlayer.Character.Humanoid.RootPart;
		local camera = workspace.CurrentCamera;
		local inputService = game:GetService("UserInputService");
            local velocity = Vector3.zero;
            if inputService:IsKeyDown(Enum.KeyCode.W) then
                velocity += camera.CFrame.LookVector;
            end
            if inputService:IsKeyDown(Enum.KeyCode.S) then
                velocity += -camera.CFrame.LookVector;
            end
            if inputService:IsKeyDown(Enum.KeyCode.D) then
                velocity += camera.CFrame.RightVector;
            end
            if inputService:IsKeyDown(Enum.KeyCode.A) then
                velocity += -camera.CFrame.RightVector;
            end
            if inputService:IsKeyDown(Enum.KeyCode.Space) then
                velocity += rootPart.CFrame.UpVector;
            end
            if inputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                velocity += -rootPart.CFrame.UpVector;
            end
            rootPart.Velocity = velocity * OrionLib.Flags["flyspeed"].Value;
	end
	wait(0.01)
end
