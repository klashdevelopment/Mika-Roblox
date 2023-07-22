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
PlayerSection2:AddToggle({ Name = "Infinite Jump", Default = false, Save = true, Flag = "movement_character_infinitejump" });
PlayerSection2:AddToggle({ Name = "Click-Teleport", Default = false, Save = true, Flag = "movement_teleporting_clicktp" });
            
            
            
local function connect(signal, callback)
    local connection = signal:Connect(callback);
    table.insert(OrionLib.Connections, connection);
    return connection;
end
connect(game:GetService("UserInputService").InputBegan, function(input, processed)
    if input.UserInputType.Name == "MouseButton1" and not processed and OrionLib.Flags["movement_teleporting_clicktp"].Value then
        local character = game.Players.LocalPlayer.Character;
        local camPos = workspace.CurrentCamera.CFrame.Position;
		local mouse = game.Players.LocalPlayer:GetMouse();
        local ray = Ray.new(camPos, mouse.Hit.Position - camPos);
        local _, hit, normal = workspace:FindPartOnRayWithIgnoreList(ray, { camera });
        if hit and normal then
            character:PivotTo(CFrame.new(hit + normal));
        end
    end
    if input.KeyCode.Name == "Space" and not processed and OrionLib.Flags["movement_character_infinitejump"].Value then
        local character = game.Players.LocalPlayer.Character;
        local humanoid = character and character:FindFirstChildOfClass("Humanoid");
        if humanoid then
            humanoid:ChangeState("Jumping");
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
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
expi:AddToggle({
	Name = "Flight",
	Default = flightEnabled,
	Callback = function(Value)
		flightEnabled = Value
	end
})
local xray = {};
local function isCharacterPart(part)
    for _, player in next, game.Players:GetPlayers() do
        if player.Character and part:IsDescendantOf(player.Character) then
            return true;
        end
    end
    return false;
end
expi:AddToggle({ Name = "X-Ray", Default = false, Save = true, Flag = "other_game_xray", Callback = function(value)
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
expi:AddSlider({ Name = "Flight Speed", Min = 10, Max = 200, Default = 100, ValueName = "studs/s", Save = true, Flag = "flyspeed" });

expi:AddButton({
	Name = "Invisible",
	Callback = function()
		Invisible()
	end
})
expi:AddButton({
	Name = "Visible",
	Callback = function()
		TurnVisible()
	end
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
