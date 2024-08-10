-- Change this theme to one of the ones below
-- Sunshine (light)
-- Darken (default, dark)
-- Blackout (ultra dark)
MikaUITheme = "Blackout"
game.Players.LocalPlayer:SetAttribute("themeOfMika", MikaUITheme)
local MikaUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/libraries/MikaUI.lua"))()

local scriptName = "My Script"
local scriptTheme = "Darken"
local finalScript = [[]]
local scriptElements = {}
local changesMade = false

local Basic = MikaUI:AddTab("Basic Info")
Basic.InsertTextInput("Script Name", "script name...", "My Script", false, function(value)
	scriptName = value
	changesMade = true
end)
Basic.InsertTextInput("Script Theme","theme", "Darken", true, function(value)
	if value == "Darken" or value == "Blackout" or value == "Sunshine" then
		scriptTheme = value
		changesMade = true
	else
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Invalid Theme",
			Text = "Theme setting not saved."
		})
	end
end)
Basic.InsertButton("Build Script", function()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Building Script",
		Text = "This may take some time."
	})
	finalScript = [[
-- Script Made using Mika UI Creator
MikaUITheme = "]]..scriptTheme..[["
game.Players.LocalPlayer:SetAttribute("themeOfMika", MikaUITheme)
local MikaUI = loadstring(game:HttpGet("https://x.klash.dev/libraries/MikaUI.lua"))()

MikaUI:Init("]]..scriptName..[[")
	]]
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Built Script",
		Text = "Script is now copyable/runnable."
	})
	changesMade = false
end)
Basic.InsertButton("Copy Script", function()
	if finalScript == "" then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Script Not Built",
			Text = "Build script first!"
		})
		return
	end
	if changesMade then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Unbuilt Changes",
			Text = "Build script first!"
		})
		return
	end
	setclipboard(finalScript)
end)
Basic.InsertButton("Run Script", function()
	if finalScript == "" then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Script Not Built",
			Text = "Build script first!"
		})
		return
	end
	if changesMade then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Unbuilt Changes",
			Text = "Build script first!"
		})
		return
	end
	loadstring(finalScript)()
end)

MikaUI:Init("Mika UI Creator")
