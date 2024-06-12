local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/libraries/Orion.lua')))()
local Sense = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Sirius/request/library/sense/source.lua'))()

local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

OrionLib:MakeNotification({
	Name = "Mika",
	Content = "Aimbot & Assist",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Window = OrionLib:MakeWindow({Name = "MIKAim", HidePremium = false, SaveConfig = true, ConfigFolder = "mikaaim", IntroText="MIKAim", IntroIcon="rbxassetid://7743878496"})

local Aim = Window:MakeTab({
    Name = "Configuration",
    Icon = "rbxassetid://7734053495",
    PremiumOnly = false
})

local OptionsSection = Aim:AddSection({
    Name = "Options"
})

local fov = 150
local smoothing = 0
local teamCheck = true

local FOVring = Drawing.new("Circle")
    FOVring.Visible = false
    FOVring.Thickness = 1.5
    FOVring.Radius = fov
    FOVring.Transparency = 1
    FOVring.Color = Color3.fromRGB(246, 66, 114)
    FOVring.Position = workspace.CurrentCamera.ViewportSize/2

local loop

function setup()
    FOVring = Drawing.new("Circle")
    FOVring.Visible = true
    FOVring.Thickness = 1.5
    FOVring.Radius = fov
    FOVring.Transparency = 1
    FOVring.Color = Color3.fromRGB(246, 66, 114)
    FOVring.Position = workspace.CurrentCamera.ViewportSize/2

    local function getClosest(cframe)
    local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
    
    local target = nil
    local mag = math.huge
    
    for i,v in pairs(game.Players:GetPlayers()) do
        if v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= game.Players.LocalPlayer and (v.Team ~= game.Players.LocalPlayer.Team or (not teamCheck)) then
            local magBuf = (v.Character.Head.Position - ray:ClosestPoint(v.Character.Head.Position)).Magnitude
            
            if magBuf < mag then
                mag = magBuf
                target = v
            end
        end
    end
    
    return target
    end

    loop = RunService.RenderStepped:Connect(function()
    local UserInputService = game:GetService("UserInputService")
    local pressed = UserInputService:IsKeyDown(Enum.KeyCode.E) or UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) --Enum.UserInputType.MouseButton2
    local localPlay = game.Players.localPlayer.Character
    local cam = workspace.CurrentCamera
    local zz = workspace.CurrentCamera.ViewportSize/2
    
    if pressed then
        -- local Line = Drawing.new("Line")
        -- local curTar = getClosest(cam.CFrame)
        -- local ssHeadPoint = cam:WorldToScreenPoint(curTar.Character.Head.Position)
        -- ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
        -- if (ssHeadPoint - zz).Magnitude < fov then
        --     workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), smoothing)
        -- end
        local pos = getClosest(cam.CFrame)
        local CurrentCam = cam
        local AimPart = pos.Character:FindFirstChild("Head")
        if AimPart then
            local LookAt = nil
            local Distance = math.floor(0.5+(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - pos.Character:FindFirstChild("HumanoidRootPart").Position).magnitude)
            if Distance > 100 then
                local distChangeBig = Distance / 10
                LookAt = CurrentCam.CFrame:PointToWorldSpace(Vector3.new(0,0,-smoothing * distChangeBig)):Lerp(AimPart.Position,.01) -- No one esle do camera smoothing ? tf
            else
                local distChangeSmall = Distance / 10
                LookAt = CurrentCam.CFrame:PointToWorldSpace(Vector3.new(0,0,-smoothing * distChangeSmall)):Lerp(AimPart.Position,.01) -- No one esle do camera smoothing ? tf
            end
            CurrentCam.CFrame = CFrame.lookAt(CurrentCam.CFrame.Position, LookAt)
        end
    end
    
    if UserInputService:IsKeyDown(Enum.KeyCode.Delete) then
        loop:Disconnect()
        FOVring:Remove()
        Sense.Unload()
    end
    end)
end

setup()

OptionsSection:AddSlider({
    Name = "FOV",
    Min = 0,
    Max = 360,
    Default = 150,
    Color = Color3.fromRGB(246, 66, 114),
    Increment = 1,
    Callback = function(value)
        fov = value
        FOVring.Radius = value
    end
})
OptionsSection:AddSlider({
    Name = "Smoothing",
    Min = 0,
    Max = 100,
    Default = 1,
    Color = Color3.fromRGB(246, 66, 114),
    Increment = 1,
    Callback = function(value)
        smoothing = value/2
    end
})
OptionsSection:AddToggle({
    Name = "Team Check",
    Default = true,
    Callback = function(value)
        teamCheck = value
    end
})
OptionsSection:AddToggle({
    Name = "Show FOV Circle",
    Default = true,
    Callback = function(value)
        FOVring.Visible = value
    end
})
OptionsSection:AddToggle({
    Name = "Team Colors",
    Default = false,
    Callback = function(value)
        Sense.sharedSettings.useTeamColor = value
    end
})

local enemiesTab = Window:MakeTab({
    Name = "Enemy ESPs",
    Icon = "rbxassetid://7733696665",
    PremiumOnly = false
})
local friendlyTab = Window:MakeTab({
    Name = "Friendly ESPs",
    Icon = "rbxassetid://7733696665",
    PremiumOnly = false
})

function espSections(enemies, defaults)
    enemies:AddToggle({
        Name = "Enabled",
        Default = false,
        Callback = function(value)
            Sense.teamSettings.enemy.enabled = value
        end
    })
    enemies:AddToggle({
        Name = "Box Enabled",
        Default = true,
        Callback = function(value)
            Sense.teamSettings.enemy.box = value
        end
    })
    enemies:AddToggle({
        Name = "Box3d Enabled",
        Default = false,
        Callback = function(value)
            Sense.teamSettings.enemy.box3d = value
        end
    })
    enemies:AddToggle({
        Name = "Health Bar Enabled",
        Default = true,
        Callback = function(value)
            Sense.teamSettings.enemy.healthBar = value
        end
    })
    enemies:AddToggle({
        Name = "Tracers Enabled",
        Default = true,
        Callback = function(value)
            Sense.teamSettings.enemy.tracer = value
        end
    })
    enemies:AddToggle({
        Name = "Offscreen Arrows Enabled",
        Default = true,
        Callback = function(value)
            Sense.teamSettings.enemy.offScreenArrow = value
        end
    })
    enemies:AddToggle({
        Name = "Chams Enabled",
        Default = false,
        Callback = function(value)
            Sense.teamSettings.enemy.chams = value
        end
    })
    enemies:AddColorpicker({
        Name = "Box Color",
        Default = Color3.fromRGB(246, 66, 114),
        Callback = function(value)
            Sense.teamSettings.enemy.boxColor[1] = value
            Sense.teamSettings.enemy.box3dColor[1] = value
        end
    })
    enemies:AddColorpicker({
        Name = "Tracer/Arrow Color",
        Default = Color3.fromRGB(246, 66, 114),
        Callback = function(value)
            Sense.teamSettings.enemy.offScreenArrowColor[1] = value
            Sense.teamSettings.enemy.tracerColor[1] = value
        end
    })
end

espSections(enemiesTab, true)
espSections(friendlyTab, false)

local Buttons = Window:MakeTab({
    Name = "UI Options",
    Icon = "rbxassetid://7743867310",
    PremiumOnly = false
})

Buttons:AddButton({
    Name = "Destroy All",
    Callback = function()
        loop:Disconnect()
        FOVring:Remove()
        Sense.Unload()
        OrionLib:Destroy()
    end
})

local Tutorial = Window:MakeTab({
    Name = "Recommended",
    Icon = "rbxassetid://7733956210",
    PremiumOnly = false
})
local Guide = Tutorial:AddSection({
    Name = "Recommended Settings"
})
Guide:AddLabel("FOV: 80 (small), 150 (regular), 210 (large)")
Guide:AddLabel("Smoothing: 0-1 (risky), 3 (regular), 5+ (safe)")
Guide:AddLabel("Enemy ESP: Enabled, leave defaults")
Guide:AddLabel("Friendly ESP: Disabled (unless FFA), leave defaults")

local Credits = Tutorial:AddSection({
    Name = "Credits"
})
Credits:AddLabel("GavinGoGaming - Developer of all things Mika")
Credits:AddLabel("Reality - Playtester of all things Mika")
Credits:AddLabel("Thank you for choosing & using Mika!")

local Links = Tutorial:AddSection({
    Name = "Links"
})
Links:AddLabel("[MIKA]")
Links:AddLabel("Github - klashdevelopment/Mika-Roblox")
Links:AddLabel("")
Links:AddLabel("[KLASH]")
Links:AddLabel("Discord - .gg/epBXp5hHBQ")
Links:AddLabel("Website - klash.dev")
Links:AddLabel("Twitter - klashdev")
Links:AddLabel("")
Links:AddLabel("[GAVIN]")
Links:AddLabel("Github - gavingogaming")
Links:AddLabel("Twitter - gavingogaming")
Links:AddLabel("Website - pages.gavingogaming.com")

OrionLib:Init()
Sense.Load()
