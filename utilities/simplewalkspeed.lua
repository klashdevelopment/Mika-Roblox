local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local CJRPGameId = 6843988672

local loadingText = "KlashDevelopment"
local titleText = "Mikate"
if game.PlaceId == CJRPGameId then
	loadingText = "Mikate for County Jail RP"
	titleText = "Mikate for CJRP"
	loadstring(game:HttpGet('https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/scripts/CJRPBypassScript.lua'))()
end
local sws = OrionLib:MakeWindow({Name = titleText, Icon = "rbxassetid://8834748103", HidePremium = false, SaveConfig = true, ConfigFolder = "Mikate", IntroText = loadingText, IntroIcon = "rbxassetid://4483345998"})

local PlayerTab = sws:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Noclip = nil
local Clip = nil
function UnlockParts(character)
	for _, part in ipairs(character:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Locked = true
		end
	end
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
if game.PlaceId ~= CJRPGameId then
PlayerSection2:AddToggle({ Name = "Infinite Jump", Default = false, Save = true, Flag = "movement_character_infinitejump" });
PlayerSection2:AddToggle({ Name = "Click-Teleport", Default = false, Save = true, Flag = "movement_teleporting_clicktp" });
end
PlayerSection2:AddButton({
	Name = "Unlock Player Parts",
	Callback = function()
		UnlockParts(game.Players.LocalPlayer.Character)
	end
})
            
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
	Icon = "rbxassetid://4483345998",
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
})end

local Cgui = sws:MakeTab({
	Name = "Core UI",
	Icon = "rbxassetid://4483345998",
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

if game.PlaceId ~= CJRPGameId then
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
end

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
	Icon = "rbxassetid://4483345998",
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
