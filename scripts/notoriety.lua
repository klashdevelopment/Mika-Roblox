-- handmade latest for noto
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/refs/heads/main/libraries/Orion.lua')))()
local Window = OrionLib:MakeWindow({Name = "NotyPayday | mika", HidePremium = false, SaveConfig = true, ConfigFolder = "NotoGuiMika", IntroEnabled = true, IntroText = "KlashDevelopment" })

local Tab = Window:MakeTab({
	Name = "ingame",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "player"
})

Tab:AddButton({
	Name = "Find & Goto keycard",
	Callback = function()
        local found = false
      	for i, v in pairs(game.Workspace.Map:GetChildren()) do
            if v.Name == "KeyCard" then
                found = true
                game.Players.LocalPlayer.Character:MoveTo(v.KeyCard.Position)
            end
        end
        if found == false then
            
        end
    end
})

Tab:AddButton({
	Name = "Huge Stamina",
	Callback = function()
      	playerLocal = game.Players.LocalPlayer
        game.Workspace.Criminals[playerLocal.Name].Stamina.Value = 2 ^ 60
    end
})

Tab:AddButton({
	Name = "Cuff & Hostage Guards (v2)",
	Callback = function()
      	for _, Guard in ipairs(workspace.Police:GetChildren()) do
            Guard.Cuffed.Value = true
            Guard.Hostage.Value = true
        end
  	end    
})
Tab:AddButton({
	Name = "No NPC (v1)",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/2567-rblx/scripts/main/Notoriety/RemoveNPCs.lua",true))()
  	end    
})

Tab:AddButton({
	Name = "Noclip (Activate, then hold E)",
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
	Name = "Force all to Reset (v1)",
	Callback = function()
      	game:GetService("ReplicatedStorage").RS_Package.Remotes.VoteReset:FireServer()
    end   
})

Tab:AddButton({
	Name = "10 BodyBags",
	Callback = function()
        playerLocal = game.Players.LocalPlayer
        game.Workspace.Criminals[playerLocal.Name].BodyBags.Value = 10
    end  
})

Tab:AddButton({
	Name = "TP Bags to Car",
	Callback = function()
        for _, v in pairs(game.Workspace.Bags:GetChildren()) do
            v:MoveTo(game.Workspace.BagSecuredArea.FloorPart.Position)
        end
    end
})	

local Tab = Window:MakeTab({
	Name = "visual",
	Icon = "rbxassetid://7733774602",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "ESPs",
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
	Name = "[dbg] Show Hitboxes",
	Callback = function()
        settings():GetService("RenderSettings").ShowBoundingBoxes = true
    end
})
Tab:AddButton({
	Name = "[dbg] Hide Hitboxes",
	Callback = function()
        settings():GetService("RenderSettings").ShowBoundingBoxes = false
    end
})

local Tab = Window:MakeTab({
	Name = "menus",
	Icon = "rbxassetid://7733993211",
	PremiumOnly = false
})

Tab:AddLabel("These scripts are built to work in the main menu")
Tab:AddButton({
	Name = "Skillpoint Script",
	Callback = function()
      		loadstring(game:GetObjects("rbxassetid://4763830754")[1].Source)()
  	end    
})
Tab:AddButton({
    Name = "Destroy",
    Callback = function()
        OrionLib:Destroy()
    end
})

OrionLib:Init()
