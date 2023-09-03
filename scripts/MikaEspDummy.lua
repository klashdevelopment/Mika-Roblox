MikaUITheme = "Blackout"
game.Players.LocalPlayer:SetAttribute("themeOfMika", MikaUITheme)

local MikaESP = loadstring(game:HttpGet("https://x.klash.dev/libraries/MikaESP/rewrite"))()
local MikaUI = loadstring(game:HttpGet("https://x.klash.dev/libraries/MikaUI.lua"))()
local ESPs = MikaUI:AddTab("ESPs")
ESPs.InsertCheckbox("Head ESP", false, function(value)
	for k, v in pairs(game.Players:GetPlayers()) do
		if value then
			MikaESP:Insert(v.Character.Head, v.Name, Color3.fromRGB(255, 0, 0))
		else
			MikaESP:RemovePartUsingText(v.Name)
		end
	end
end)
MikaUI:Init("esp test")
MikaESP:Init()
