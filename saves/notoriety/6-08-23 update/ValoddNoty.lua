
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Noty Gui", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroEnabled = true, IntroText = "Notoriety Gui" })

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

local Tab = Window:MakeTab({
	Name = "MainTab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "MainSection"
})

Tab:AddButton({
	Name = "Tp to keycard",
	Callback = function()
      		        for i, v in pairs(game.Workspace.Map:GetChildren()) do
            if v.Name == "KeyCard" then
                game.Players.LocalPlayer.Character:MoveTo(v.KeyCard.Position)
            end
        end
    end
})

Tab:AddButton({
	Name = "infinite Stamina",
	Callback = function()
      		        playerLocal = game.Players.LocalPlayer
        game.Workspace.Criminals[playerLocal.Name].Stamina.Value = 2 ^ 60
    end
})



Tab:AddButton({
	Name = "No NPC",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/2567-rblx/scripts/main/Notoriety/RemoveNPCs.lua",true))()
  	end    
})

Tab:AddButton({
	Name = "Noclip (Press E to clip)",
	Callback = function()
      		 noclip = false
        game:GetService("RunService").Stepped:connect(
            function()
                if noclip then
                    game.Players.LocalPlayer.Character.Head.CanCollide = false
                    game.Players.LocalPlayer.Character.Torso.CanCollide = false
                end
            end
        )
        plr = game.Players.LocalPlayer
        mouse = plr:GetMouse()
        mouse.KeyDown:connect(
            function(key)
                key = string.lower(key)
                if key == "e" then
                    noclip = not noclip
                    game.Players.LocalPlayer.Character.Head.CanCollide = true
                    game.Players.LocalPlayer.Character.Torso.CanCollide = true
                end
            end
        )
    end     
})	

Tab:AddButton({
	Name = "Force to vote Reset",
	Callback = function()
      		        game:GetService("ReplicatedStorage").RS_Package.Remotes.VoteReset:FireServer()
    end   
})

Tab:AddButton({
	Name = "Get BodyBags",
	Callback = function()
        playerLocal = game.Players.LocalPlayer
        game.Workspace.Criminals[playerLocal.Name].BodyBags.Value = 1
    end  
})

Tab:AddButton({
	Name = "Get Cable ties",
	Callback = function()
        playerLocal = game.Players.LocalPlayer
        game.Workspace.Criminals[playerLocal.Name].CableTies.Value = 1
    end  
})

Tab:AddButton({
	Name = "Tp Bags to Car",
	Callback = function()
        for _, v in pairs(game.Workspace.Bags:GetChildren()) do
            v:MoveTo(game.Workspace.BagSecuredArea.FloorPart.Position)
        end
    end
})	

local Tab = Window:MakeTab({
	Name = "UniversalTab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Esp",
	Callback = function()
    for i, v in pairs(game.Workspace.Police:GetChildren()) do
            for i, l in pairs(v:GetChildren()) do
                if l:IsA("Part") and not l:FindFirstChild("Chams") then
                    local Box = Instance.new("BoxHandleAdornment", l)
                    Box.Size = l.Size
                    Box.Name = "Chams"
                    Box.Color3 = Color3.new(1, 0, 0)
                    Box.Adornee = l
                    Box.AlwaysOnTop = true
                    Box.ZIndex = 5
                    Box.Transparency = .5
                end
            end
        end
        for i, v in pairs(game.Workspace.Cameras:GetChildren()) do
            for i, l in pairs(v:GetChildren()) do
                if l:IsA("MeshPart") and not l:FindFirstChild("Chams") then
                    local Box = Instance.new("BoxHandleAdornment", l)
                    Box.Size = l.Size
                    Box.Name = "Chams"
                    Box.Color3 = Color3.new(0, 0, 1)
                    Box.Adornee = l
                    Box.AlwaysOnTop = true
                    Box.ZIndex = 5
                    Box.Transparency = .5
                end
            end
        end
        for i, v in pairs(game.Workspace.Citizens:GetChildren()) do
            for i, l in pairs(v:GetChildren()) do
                if l:IsA("Part") and not l:FindFirstChild("Chams") then
                    local Box = Instance.new("BoxHandleAdornment", l)
                    Box.Size = l.Size
                    Box.Name = "Chams"
                    Box.Color3 = Color3.new(1, 1, 1)
                    Box.Adornee = l
                    Box.AlwaysOnTop = true
                    Box.ZIndex = 5
                    Box.Transparency = .5
                end
            end
        end

        for i, v in pairs(game.Workspace.SafeSpots:GetChildren()) do
            for i, l in pairs(v:GetChildren()) do
                if l:IsA("Part") or l:IsA("UnionOperation") and not l:FindFirstChild("Chams") then
                    local Box = Instance.new("BoxHandleAdornment", l)
                    Box.Size = l.Size
                    Box.Name = "Chams"
                    Box.Color3 = Color3.new(0, 1, 0)
                    Box.Adornee = l
                    Box.AlwaysOnTop = true
                    Box.ZIndex = 5
                    Box.Transparency = .5
                end
            end
        end

        for i, v in pairs(game.Workspace.Lootables:GetChildren()) do
            for i, l in pairs(v:GetChildren()) do
                if l:IsA("Part") or l:IsA("UnionOperation") and not l:FindFirstChild("Chams") then
                    local Box = Instance.new("BoxHandleAdornment", l)
                    Box.Size = l.Size
                    Box.Name = "Chams"
                    Box.Color3 = Color3.new(0, 1, 0)
                    Box.Adornee = l
                    Box.AlwaysOnTop = true
                    Box.ZIndex = 5
                    Box.Transparency = .5
                end
            end
        end

        if game.Workspace:FindFirstChild("BigLoot") then
            for i, v in pairs(game.Workspace.BigLoot:GetChildren()) do
                for i, l in pairs(v:GetChildren()) do
                    if l:IsA("Part") or l:IsA("UnionOperation") and not l:FindFirstChild("Chams") then
                        local Box = Instance.new("BoxHandleAdornment", l)
                        Box.Size = l.Size
                        Box.Name = "Chams"
                        Box.Color3 = Color3.new(0, 1, 0)
                        Box.Adornee = l
                        Box.AlwaysOnTop = true
                        Box.ZIndex = 5
                        Box.Transparency = .5
                    end
                end
            end
        else
            for i, v in pairs(game.Workspace:GetChildren()) do
                if
                    v.Name == "DepositGoldBar" or v.Name == "DepositMoney" or v.Name == "DepositMoneyStack" or
                        v.Name == "DepositRing"
                 then
                    for i, l in pairs(v:GetChildren()) do
                        if l:IsA("Part") and not l:FindFirstChild("Chams") then
                            local Box = Instance.new("BoxHandleAdornment", l)
                            Box.Size = l.Size
                            Box.Name = "Chams"
                            Box.Color3 = Color3.new(0, 1, 0)
                            Box.Adornee = l
                            Box.AlwaysOnTop = true
                            Box.ZIndex = 5
                            Box.Transparency = .5
                        end
                    end
                end
            end
        end

        for i, v in pairs(game.Workspace.Map:GetChildren()) do
            if v.Name == "MilitaryCrateTimed" or v.Name == "OpenMilitaryCrate" or v.Name == "MilitaryCrateUntimed" then
                for i, l in pairs(v:GetChildren()) do
                    if l:IsA("Part") and not l:FindFirstChild("Chams") then
                        local Box = Instance.new("BoxHandleAdornment", l)
                        Box.Size = l.Size
                        Box.Name = "Chams"
                        Box.Color3 = Color3.new(0, 1, 0)
                        Box.Adornee = l
                        Box.AlwaysOnTop = true
                        Box.ZIndex = 5
                        Box.Transparency = .5
                    end
                end
            end
        end

        for i, v in pairs(game.Workspace.RandomLoot:GetChildren()) do
            if v.Name == "DepositGoldBar" or v.Name == "DepositMoneyStack" then
                for i, l in pairs(v:GetChildren()) do
                    if l:IsA("Part") and not l:FindFirstChild("Chams") then
                        local Box = Instance.new("BoxHandleAdornment", l)
                        Box.Size = l.Size
                        Box.Name = "Chams"
                        Box.Color3 = Color3.new(0, 1, 0)
                        Box.Adornee = l
                        Box.AlwaysOnTop = true
                        Box.ZIndex = 5
                        Box.Transparency = .5
                    end
                end
            end
        end

        for i, v in pairs(game.Workspace.Map.Houses:GetChildren()) do
            for i, l in pairs(v.doorBell:GetChildren()) do
                if b.IsA("Part") and not l:FindFirstChild("Chams") then
                    local Box = Instance.new("BoxHandleAdornment", l)
                    Box.Size = l.Size
                    Box.Name = "Chams"
                    Box.Color3 = Color3.new(0, 1, 0)
                    Box.Adornee = l
                    Box.AlwaysOnTop = true
                    Box.ZIndex = 5
                    Box.Transparency = .5
                end
            end
        end
        for i, v in pairs(game.Workspace.Map:GetChildren()) do
            for i, l in pairs(v.doorBell:GetChildren()) do
                if b.IsA("Part") and not l:FindFirstChild("Chams") then
                    local Box = Instance.new("BoxHandleAdornment", l)
                    Box.Size = l.Size
                    Box.Name = "Chams"
                    Box.Color3 = Color3.new(0, 1, 0)
                    Box.Adornee = l
                    Box.AlwaysOnTop = true
                    Box.ZIndex = 5
                    Box.Transparency = .5
                end
            end
        end
    end	
})

Tab:AddButton({
	Name = "Infinite Damage",
	Callback = function()
        for i, v in pairs(getgc(true)) do
            if typeof(v) == "table" and rawget(v, "Damage") then
                v.Damage = 999999999
            end
        end
    end
    
})

Tab:AddButton({
	Name = "Show Hitboxes",
	Callback = function()
        settings():GetService("RenderSettings").ShowBoundingBoxes = true
    end
})
Tab:AddButton({
	Name = "Hide Hitboxes",
	Callback = function()
        settings():GetService("RenderSettings").ShowBoundingBoxes = false
    end
})

local Tab = Window:MakeTab({
	Name = "MainMenu Tab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddLabel("Note : The script that are in here is works only in main menu")

Tab:AddButton({
	Name = "Infinite Skill point",
	Callback = function()
      		loadstring(game:GetObjects("rbxassetid://4763830754")[1].Source)()
  	end    
})

local Tab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddLabel("OrionLib : Shlexware Stebulous dawid-scripts bingolsaac")
Tab:AddLabel("modify : Ovalodd")
