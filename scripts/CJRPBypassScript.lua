local oldnamecall; oldnamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    
    if self.Name == "Exploits" then
        if args[1] ~= "Check"  then
            return wait(9e9)
        end
    end
    if self.Name == "ErrorLogs" then return wait(9e9) end
    if getnamecallmethod() == "Kick" then return wait(9e9) end
    return oldnamecall(self, unpack(args))
end)

local Char = game.Players.LocalPlayer.Character
local OldParent = Char.Parent
local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
local OldPos = HRP.CFrame
Char.Parent = game
local HRP1 = HRP:Clone()
HRP1.Parent = Char
HRP = HRP:Destroy()
HRP1.CFrame = OldPos
Char.Parent = OldParent
-- local colors = {
--     SchemeColor = Color3.fromRGB(105,105,105),
--     Background = Color3.fromRGB(0, 0, 0),
--     Header = Color3.fromRGB(0, 0, 0),
--     TextColor = Color3.fromRGB(0,255,0),
--     ElementColor = Color3.fromRGB(20, 20, 20)
-- }

-- local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
-- local Window = Library.CreateLib("County jail roleplay", colors)

-- --MAIN
-- local Main = Window:NewTab("Main")
-- local MainSection = Main:NewSection("Main")


-- MainSection:NewToggle("Auto sprint", "Makes you auto sprint", function(v)
--     if v then
--         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
--     else
--         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
--     end
-- end)

-- MainSection:NewToggle("Shift lock", "Makes it so you can use shift lock", function(v)
--     if v then
--         game.Players.LocalPlayer.DevEnableMouseLock = true
--     else
--         game.Players.LocalPlayer.DevEnableMouseLock = false
--     end
-- end)

-- MainSection:NewButton("Esp", "See players through walls", function() 
--     function addEsp(player, part)

--         local esp = Instance.new("BillboardGui", part)
--         esp.Name = "ESP"
--         esp.AlwaysOnTop = true
--         esp.Size = UDim2.new(1,0,1,0)	

--         local espframe = Instance.new("Frame", esp)
--         espframe.BackgroundColor = player.TeamColor
--         espframe.Size = UDim2.new(1,0,1,0)
--         espframe.BackgroundColor = player.TeamColor

--         local namesp = Instance.new("BillboardGui", part)
--         namesp.Name = "NAME"
--         namesp.AlwaysOnTop = true
--         namesp.Size = UDim2.new(1,0,1,0)
--         namesp.SizeOffset = Vector2.new(-0.5, 2.5)

--         local name = Instance.new("TextLabel", namesp)
--         name.Text = player.Name
--         name.Size = UDim2.new(2, 0,1, 0)
--         name.TextColor3 = Color3.new(0, 0, 0)
--         name.TextScaled = true
--         name.BackgroundTransparency = 1
--     end

--     while wait(0.1) do
--         for _, player in pairs(game:GetService("Players"):GetChildren()) do
--             if (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
--                 if (game.Players.LocalPlayer ~= player) then
--                     if not (player.Character.HumanoidRootPart:FindFirstChild("ESP") and player.Character.HumanoidRootPart:FindFirstChild("NAME")) then
--                         addEsp(player, player.Character.HumanoidRootPart)
--                         else
--                         player.Character.HumanoidRootPart:FindFirstChild("ESP"):Destroy()
--                         player.Character.HumanoidRootPart:FindFirstChild("NAME"):Destroy()
--                         addEsp(player, player.Character.HumanoidRootPart)
--                     end
--                 end
--             end
--         end
--     end
-- end)

-- MainSection:NewButton("No doors", "Makes it so there are no doors", function()
--     for i, v in pairs(game.Workspace.Map.MapRandom:GetChildren()) do
--         if v.Name == "MetalDoor" then 
--             v:Destroy()
--         end
--     end
--    for i, v in pairs(game.Workspace.SC:GetChildren()) do
--         if v.Name == "MetalDoor" then 
--             v:Destroy()
--         end
--     end
--    for i, v in pairs(game.Workspace.SC:GetChildren()) do
--         if v.Name == "SolitaryDoor" then 
--             v:Destroy()
--         end
--     end
--     for i, v in pairs(game.Workspace.Map.MapRandom:GetChildren()) do
--         if v.Name == "Model" then 
--            if v:FindFirstChild("Door") then
--                 v:FindFirstChild("Door"):Destroy()
--             end
--         end
--     end
-- end)

-- --PLAYER
-- local Player = Window:NewTab("Player")
-- local PlayerSection = Player:NewSection("Player")

-- PlayerSection:NewSlider("Speed", "Sets your speed", 250, 16, function(v)
--     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
-- end)

-- PlayerSection:NewSlider("Jump Power", "Sets your jump power", 250, 50, function(v)
--     game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
-- end)

-- PlayerSection:NewSlider("Gravity", "Sets gravity", 196.2, 0, function(v)
--     game.Workspace.Gravity = v
-- end)

-- --TELEPORTS
-- local Teleport = Window:NewTab("Teleport")
-- local TeleportSection = Teleport:NewSection("Teleport")

-- TeleportSection:NewLabel("Warning: HIGH CHANGE OF BEING KICKED")

-- TeleportSection:NewButton("Criminal hideout", "Tp to crim hideout", function()
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(336.363007, -6.59994698, -1382.54431, 0.468962431, -9.15751528e-08, 0.88321811, 1.2847738e-08, 1, 9.686174e-08, -0.88321811, -3.40771642e-08, 0.468962431)
-- end)

-- TeleportSection:NewButton("Top of prison", "Tp to top of prison ", function()
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-327.103882, 81.2895355, -1114.79846, -0.590741754, 4.8605111e-09, 0.806860685, 2.43108325e-08, 1, 1.17751595e-08, -0.806860685, 2.65715343e-08, -0.590741754)
-- end)

-- TeleportSection:NewButton("Armory", "Tp to Armory", function()
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-215.915161, 55.0895348, -983.178955, 0.0521132909, -7.76059963e-08, -0.998641193, -2.87163484e-08, 1, -7.92101318e-08, 0.998641193, 3.28052288e-08, 0.0521132909)
-- end)

-- TeleportSection:NewButton("Offices", "Tp to offices area", function()
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-269.652222, 55.0895386, -952.108337, 0.999963284, 1.13975114e-08, 0.00857230928, -1.15492522e-08, 1, 1.76517663e-08, -0.00857230928, -1.77501214e-08, 0.999963284)
-- end)

-- TeleportSection:NewButton("Medical", "Tp to medical area", function()
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-297.329681, 55.0895386, -1014.39978, 0.998639762, 2.04547757e-08, 0.0521407872, -1.67535887e-08, 1, -7.14215744e-08, -0.0521407872, 7.04508736e-08, 0.998639762)
-- end)

-- TeleportSection:NewButton("Laundry", "Tp to crim hideout", function()
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-424.623657, 55.0808563, -1012.55042, -0.998125553, -2.1626704e-08, 0.0611992255, -2.23590852e-08, 1, -1.12823564e-08, -0.0611992255, -1.26295667e-08, -0.998125553)
-- end)

-- TeleportSection:NewButton("Jail entrance", "tps you to location", function()
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-139.473831, 55.1145477, -1066.82349, -0.719369531, 4.04523526e-08, 0.694627583, 7.07211072e-08, 1, 1.50040904e-08, -0.694627583, 5.99183139e-08, -0.719369531)
-- end)

-- TeleportSection:NewButton("Jail Gate", "tps you to location", function()
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-122.31691, 55.0145493, -1232.04919, -0.999961615, 9.77470762e-08, 0.00876001641, 9.75165904e-08, 1, -2.6738503e-08, -0.00876001641, -2.58832298e-08, -0.999961615)
-- end)

-- TeleportSection:NewButton("Booking", "tps you to location", function()
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-219.313156, 55.0895386, -1027.4458, 0.000506559387, 3.77556901e-08, 0.999999881, 2.23951115e-08, 1, -3.77670411e-08, -0.999999881, 2.24142394e-08, 0.000506559387)
-- end)

-- TeleportSection:NewButton("Minimun Security", "tps you to location", function()
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-314.247864, 55.0895386, -1104.33948, -0.999848962, -1.18562449e-08, -0.0173813291, -1.18413483e-08, 1, -9.59943236e-10, 0.0173813291, -7.53979823e-10, -0.999848962)
-- end)

-- TeleportSection:NewButton("Medium Security", "tps you to location", function()
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-477.212677, 55.0895386, -1101.60815, -0.999966383, 3.47456783e-08, -0.00819647498, 3.47585001e-08, 1, -1.4214987e-09, 0.00819647498, -1.70634817e-09, -0.999966383)
-- end)

-- TeleportSection:NewButton("Maximum Security", "tps you to location", function()
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-277.586243, 26.1895714, -1018.50568, 0.999388874, -1.95616359e-08, -0.0349553935, 2.37195739e-08, 1, 1.18535141e-07, 0.0349553935, -1.19291826e-07, 0.999388874)
-- end)

-- TeleportSection:NewButton("Sherifs office", "tps you to location", function()
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-660.968445, -6.48399353, -1837.78394, 0.964358926, 1.80992471e-10, -0.264597595, 3.21332544e-10, 1, 1.85516569e-09, 0.264597595, -1.87406934e-09, 0.964358926)
-- end)


-- local Items = Window:NewTab("Items")
-- local ItemsSection = Items:NewSection("Items")

-- ItemsSection:NewLabel("Warning: Dont do these to fast or you get kicked")

-- ItemsSection:NewDropdown("Armory guns", "Gives you a gun from amory", {"MP5", "M4A1", "G36C", "R870"}, function(gunoption)
-- local currentpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
--     for i, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
--         if v:IsA("Folder") then
--             if v.Name == "Model" then
--                 local mod = v
--                 if mod:FindFirstChild("Gun Locker") then
--                     local locker = mod:FindFirstChild("Gun Locker")
--                     if locker:FindFirstChild("Model") then
--                         local mod2 = locker:FindFirstChild("Model")
--                         if mod2:FindFirstChild("Weapons") then
--                            local guns = mod2:FindFirstChild("Weapons")
--                             if guns:FindFirstChild(gunoption) then
--                                 local gunmodel = guns:FindFirstChild(gunoption)
--                                 local clickgun = gunmodel:FindFirstChild("ClickDetector")
--                                 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-218.068634, 55.0895386, -983.327454, -0.0173887406, 1.83069844e-08, -0.999848783, 4.28920117e-08, 1, 1.75638011e-08, 0.999848783, -4.25801154e-08, -0.0173887406)
--                                 wait(.3)
--                                 fireclickdetector(clickgun)
--                                 wait(.3)
--                                 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentpos
--                             end
--                         end
--                     end
--                 end
--             end
--         end
--     end
-- end)

-- ItemsSection:NewButton("Glock 17", "Gives you a Glock 17", function()
--     local currentpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-212.886551, 55.0895386, -977.853821, -0.522397339, 1.88075084e-08, -0.8527022, -3.65331729e-08, 1, 4.44379538e-08, 0.8527022, 5.43661862e-08, -0.522397339)
--     wait(.3)
--     fireclickdetector(game:GetService("Workspace").Map.MapRandom["Glock 17"].ClickDetector)
--     wait(.3)
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentpos
-- end)

-- ItemsSection:NewButton("Keycard (Max Sec keycard)", "Gives you a Keycard", function()
--     local currentpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-272.473694, 26.1895714, -1021.36755, 0.956415832, -2.53464894e-08, -0.292008072, -2.75597989e-10, 1, -8.7703306e-08, 0.292008072, 8.39613108e-08, 0.956415832)
--     wait(.2)
--     fireproximityprompt(game:GetService("Workspace").Keycard.Handle.Attachment.ProximityPrompt)
--     wait(.2)
--     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentpos
-- end)

-- --Settings
-- local Settings = Window:NewTab("Settings")
-- local SettingsSection = Settings:NewSection("Settings")

-- SettingsSection:NewKeybind("Toggle UI", "Toggles ui", Enum.KeyCode.F, function()
-- 	Library:ToggleUI()
-- end)


-- --Credits
-- local Credits = Window:NewTab("Credits")
-- local CreditsSection = Credits:NewSection("Credits")

-- CreditsSection:NewLabel("Creator: NightHubGames, Mika from Klash")
