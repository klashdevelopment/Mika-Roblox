-- Change this theme to one of the ones below
-- Sunshine (light)
-- Darken (default, dark)
-- Blackout (ultra dark)
MikaUITheme = "Darken"



game.Players.LocalPlayer:SetAttribute("themeOfMika", MikaUITheme)
local MikaUI = loadstring(game:HttpGet("https://x.klash.dev/libraries/MikaUI.lua"))()

local MainTab = MikaUI:AddTab("Labels")
local CoolTab = MikaUI:AddTab("Interactive")
local EpicTab = MikaUI:AddTab("Scripts")

EpicTab.InsertLoadstringButton("Mikate", "https://x.klash.dev/mikate")
CoolTab.InsertButton("Notify Me", function()
	game.StarterGui:SetCore("SendNotification", {Title = "It worked", Text = "WOW!"})
end)
MainTab.InsertLabel("Mika UI - Welcome")
MainTab.InsertLabel("This is an example script.")
CoolTab.InsertTextInput("Text thing", "placehldr", "", false, function(value)
	game.StarterGui:SetCore("SendNotification", {Title = "Updated", Text = value})
end)
CoolTab.InsertTextInput("Clearing text", "wow cool", "", true, function(value)
	game.StarterGui:SetCore("SendNotification", {Title = "Updated", Text = value})
end)
CoolTab.InsertCheckbox("Notifications", true, function(value)
	if value then
		game.StarterGui:SetCore("SendNotification", {Title = "Cog", Text = "WOW!"})
	end
end)
CoolTab.InsertSlider("Slider", "studs/s", 0, 100, 1, 16, Color3.fromRGB(255, 255, 0), function(value)
	print("Value ".. value)
end)

MikaUI:Init("Mika UI")
