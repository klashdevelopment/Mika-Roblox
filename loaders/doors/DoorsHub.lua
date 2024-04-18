local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/libraries/Orion.lua')))()

OrionLib:MakeNotification({
	Name = "Mika",
	Content = "Doors Injection Archive",
	Image = "rbxassetid://4483345998",
	Time = 5
})


local Window = OrionLib:MakeWindow({Name = "Mika Doors Injector", HidePremium = false, SaveConfig = true, ConfigFolder = "mikadoorsinjectionservice"})

--Player Tab--

local PlayerTab2 = Window:MakeTab({
	Name = "Latest",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local PlayerSection2 = PlayerTab2:AddSection({
	Name = "Scripts"
})
-- PlayerSection2:AddButton({
-- 	Name = "Doors Mikamod",
-- 	Callback = function()
-- 		loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/scripts/DoorsMikamod.lua"))()
--   	end    
-- })
PlayerSection2:AddButton({
	Name = "Rooms Auto-Farm",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/DaRealGeo/roblox/master/rooms-autowalk"))()
  	end    
})
-- PlayerSection2:AddButton({
-- 	Name = "PlamenUtil",
-- 	Callback = function()
--         loadstring(game:HttpGet('https://raw.githubusercontent.com/plamen6789/UtilitiesHub/main/UtilitiesGUI'))()
--   	end    
-- })
PlayerSection2:AddButton({
	Name = "Vynixius",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua"))()
  	end    
})
PlayerSection2:AddButton({
	Name = "Vynixius Rooms",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/The%20Rooms/Script.lua"))()
  	end    
})
PlayerSection2:AddButton({
	Name = "Darkrai-X",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()
  	end    
})
PlayerSection2:AddButton({
	Name = "King Script (OP)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/scripts/DoorsMikamod.lua"))()
  	end    
})
PlayerSection2:AddButton({
	Name = "Destroy",
	Callback = function()
        OrionLib:Destroy()
  	end    
})


local PlayerTab = Window:MakeTab({
	Name = "4-21-23",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local PlayerSection = PlayerTab:AddSection({
	Name = "Saved Bundle"
})
PlayerSection:AddButton({
	Name = "all (no morphz)",
	Callback = function()
		update = "4-21-23"
		loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/loaders/doors/Saved%20Copies/Load-4-21-23.lua"))()
  	end    
})
PlayerSection:AddButton({

		Name="Doors Morphs",Callback=function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/scripts/DoorMorph.lua"))()
		end
	})
PlayerSection:AddButton({
	Name = "Rooms Autowalk",
	Callback = function()
		update = "4-21-23"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/saves/doors/" .. update .. "%20Update/RoomsAuto.lua"))()
  	end    
})
PlayerSection:AddButton({
	Name = "PlamenUtil",
	Callback = function()
		update = "4-21-23"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/saves/doors/" .. update .. "%20Update/PlamenUtil.lua"))()
  	end    
})
PlayerSection:AddButton({
	Name = "Vynixius",
	Callback = function()
		update = "4-21-23"
		loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/saves/doors/" .. update .. "%20Update/Vynixius.lua"))()
  	end    
})
PlayerSection:AddButton({
	Name = "Darkrai-X",
	Callback = function()
		update = "4-21-23"
		loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/saves/doors/" .. update .. "%20Update/Darkrai-X.lua"))()
  	end    
})
PlayerSection:AddButton({
	Name = "Destroy",
	Callback = function()
        OrionLib:Destroy()
  	end    
})
OrionLib:Init()
