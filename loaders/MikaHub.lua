local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local OldDarkDexV5 = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/utilities/DarkDexV5.lua"
local DarkDexV5 = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/utilities/SecureDexV3.lua"
local InfiniteYield = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/utilities/InfiniteYield.lua"
local DoorsHub = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/loaders/doors/DoorsHub.lua"
local SWS = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/utilities/simplewalkspeed.lua"
local CJRP = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/scripts/CJRP.lua"
local CFC = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/scripts/CFreecam.lua"
local SynapseXSniper = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/utilities/StreamSniper.lua"
local Quillo = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/utilities/quillo.lua"
local VapeV4 = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua"
local dingus = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/saves/dingus.lua"
local bpb1 = loadstring(game:HttpGet("https://scriptblox.com/raw/BIG-Paintball!-Novice-Hub-4906"))
local bpb2 = loadstring(game:HttpGet("https://x.klash.dev/scripts/BIGPBAutoKill"))
local hoho = loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))

local uix = game.Players.LocalPlayer.PlayerGui
local screen = Instance.new("ScreenGui")
screen.Parent = uix
screen.Name = "MikaHubUiButtons"
local btn = Instance.new("TextButton")
btn.Size = UDim2.fromOffset(40, 40)
btn.BorderColor3 = Color3.fromRGB(255, 255, 255)
btn.BorderSizePixel = 1
btn.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Text = "Quillo"
btn.Parent = screen
btn.Position = UDim2.new(1, -80, 0, -30)
btn.MouseButton1Click:Connect(function()
	screen:Destroy()
	loadstring(game:HttpGet("https://x.klash.dev/quillo"))()
end)
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = btn

local Window = OrionLib:MakeWindow({Name = "Mika Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "MIKAHUB", IntroText="KlashDevelopment", IntroIcon = "rbxassetid://7733965313"})
local PlayerTab = Window:MakeTab({
	Name = "Utilities",
	Icon = "rbxassetid://7733954611",
	PremiumOnly = false
})

local PlayerSection = PlayerTab:AddSection({
	Name = "Explorers"
})

PlayerSection:AddButton({
	Name = "Dex V5 (cleaner)",
	Callback = function()
		loadstring(game:HttpGet(OldDarkDexV5))()
	end
})
PlayerSection:AddButton({
	Name = "Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet(InfiniteYield))()
	end
})
PlayerSection:AddButton({
	Name = "Mikate",
	Callback = function()
		loadstring(game:HttpGet(SWS))()
	end
})

local Utils = PlayerTab:AddSection({
	Name = "Miscellaneous"
})
Utils:AddButton({
	Name = "orca",
	Callback = function()
		loadstring(game:HttpGet("https://x.klash.dev/utilities/orca"))()
	end
})
Utils:AddButton({
	Name = "Simple Spy",
	Callback = function()
		loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
	end
})
Utils:AddButton({
	Name = "Stream Sniper",
	Callback = function()
		OrionLib:MakeNotification({
			Name = "Stream Sniper",
			Content = "This sniper was programmed 100% by SynapseX. All credit goes to them.",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
		loadstring(game:HttpGet(SynapseXSniper))()
	end
})
Utils:AddButton({
	Name = "Cinema Freecam (Shift+P)",
	Callback = function()
		loadstring(game:HttpGet(CFC))() 
	end
})
Utils:AddButton({
	Name = "SecureDex X3",
	Callback = function()
		loadstring(game:HttpGet(DarkDexV5))()
	end
})

local GameTab = Window:MakeTab({
	Name = "Game-Specific",
	Icon = "rbxassetid://7733799795",
	PremiumOnly = false
})
local Game = GameTab:AddSection({
	Name = "Games"
})
Game:AddButton({
	Name = "Doors (MIKA)",
	Callback = function()
		loadstring(game:HttpGet(DoorsHub))()
	end
})
Game:AddButton({
	Name = "Blox Fruits (HOHO)",
	Callback = function()
		hoho()
	end
})
Game:AddButton({
	Name = "BIG Painball (MIKA/NOV)",
	Callback = function()
		bpb1()
		bpb2()
	end
})
Game:AddButton({
	Name = "Notoriety (MIKA)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/loaders/notoriety/Loader.lua"))()
	end
})
Game:AddButton({
	Name = "Vape V4 (BEDWARS)",
	Callback = function()
		loadstring(game:HttpGet(VapeV4))()
	end
})
Game:AddButton({
	Name = "Arsenal (OWL)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
	end
})
Game:AddButton({
	Name = "Dingus",
	Callback = function()
		loadstring(game:HttpGet(dingus))()
	end
})
Game:AddButton({
	Name = "Murder Mystery 2 (VYN)",
	Callback = function()
		loadstring(game:GetObjects("rbxassetid://4001118261")[1].Source)()
	end
})

local SettingsTab = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://7734053495",
	PremiumOnly = false
})

local SettingsSection = SettingsTab:AddSection({
	Name = "Settings"
})

SettingsSection:AddButton({
	Name = "Destroy UI",
	Callback = function()
        OrionLib:Destroy()
  	end    
})

OrionLib:Init()
