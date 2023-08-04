local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local DarkDexV5 = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/utilities/DarkDexV5.lua"
local InfiniteYield = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/utilities/InfiniteYield.lua"
local DoorsHub = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/loaders/doors/DoorsHub.lua"
local SWS = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/utilities/simplewalkspeed.lua"
local CJRP = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/scripts/CJRP.lua"
local CFC = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/scripts/CFreecam.lua"
local SynapseXSniper = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/utilities/StreamSniper.lua"
local VapeV4 = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua"

local Window = OrionLib:MakeWindow({Name = "Mika Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "MIKAHUB"})
local PlayerTab = Window:MakeTab({
	Name = "Utilities",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local PlayerSection = PlayerTab:AddSection({
	Name = "Explorers"
})

PlayerSection:AddButton({
	Name = "Dex (Closes Hub & Other Scripts)",
	Callback = function()
		loadstring(game:HttpGet(DarkDexV5))()
	end
})
PlayerSection:AddButton({
	Name = "Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet(InfiniteYield))()
	end
})

local Utils = PlayerTab:AddSection({
	Name = "Miscellaneous"
})
Utils:AddButton({
	Name = "Mikate",
	Callback = function()
		loadstring(game:HttpGet(SWS))()
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
	Name = "Cinema Freecam (SHIFT+P TOGGLE)",
	Callback = function()
		loadstring(game:HttpGet(CFC))() 
	end
})

local GameTab = Window:MakeTab({
	Name = "Game-Specific",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Game = GameTab:AddSection({
	Name = "Games"
})
Game:AddButton({
	Name = "Doors",
	Callback = function()
		loadstring(game:HttpGet(DoorsHub))()
	end
})
Game:AddButton({
	Name = "Notoriety",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/loaders/notoriety/Loader.lua"))()
	end
})
Game:AddButton({
	Name = "BedWars",
	Callback = function()
		loadstring(game:HttpGet(VapeV4))()
	end
})
Game:AddParagraph("BedWars Warning","Bedwars (Vape V4) is not controlled by mika, saved in mika's database, or sourced by mika so we can NOT guarentee quality!")

local SettingsTab = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4483345998",
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
