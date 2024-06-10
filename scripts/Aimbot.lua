local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/libraries/Orion.lua')))()
local Sense = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Sirius/request/library/sense/source.lua'))()

local RunService = game:GetService("RunService")

OrionLib:MakeNotification({
	Name = "Mika",
	Content = "Aimbot & Assist",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Window = OrionLib:MakeWindow({Name = "MIKAim", HidePremium = false, SaveConfig = true, ConfigFolder = "mikaaim"})

local Aim = Window:MakeTab({
    Name = "Configuration",
    Icon = "rbxassetid://7743878496",
    PremiumOnly = false
})

local OptionsSection = Aim:AddSection({
    Name = "Options"
})

local fov = 150
local smoothing = 1
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
        local Line = Drawing.new("Line")
        local curTar = getClosest(cam.CFrame)
        local ssHeadPoint = cam:WorldToScreenPoint(curTar.Character.Head.Position)
        ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
        if (ssHeadPoint - zz).Magnitude < fov then
            workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), smoothing)
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
    Max = 50,
    Default = 1,
    Color = Color3.fromRGB(246, 66, 114),
    Increment = 1,
    Callback = function(value)
        smoothing = value
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

local ESPs = Window:MakeTab({
    Name = "ESPs",
    Icon = "rbxassetid://7733696665",
    PremiumOnly = false
})

local globalsTab = ESPs:AddSection({Name="Global Settings"})
local enemiesTab = ESPs:AddSection({Name="Enemy Team"})
local friendlyTab = ESPs:AddSection({Name="Friendly Team"})

globalsTab:AddToggle({
    Name = "Use Team Colors",
    Default = false,
    Callback = function(value)
        Sense.sharedSettings.useTeamColor = value
    end
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
    Name = "Buttons",
    Icon = "rbxassetid://7743878496",
    PremiumOnly = false
})

Buttons:AddButton({
    Name = "Destroy - Remove",
    Callback = function()
        loop:Disconnect()
        FOVring:Remove()
        Sense.Unload()
    end
})
Buttons:AddButton({
    Name = "Destroy - Bring Back",
    Callback = function()
        setup()
    end
})
Buttons:AddButton({
    Name = "Destroy - Everything",
    Callback = function()
        loop:Disconnect()
        FOVring:Remove()
        Sense.Unload()
        OrionLib:Destroy()
    end
})

OrionLib:Init()
Sense.Load()
