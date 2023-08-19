-- Mika Quillo
-- Autoload Script
print("PlaceID = "..game.PlaceId)
wait()
task.spawn(function()
	loadstring(game:HttpGet("https://x.klash.dev/mikate"))()
end)
wait()
task.spawn(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/utilities/InfiniteYield.lua"))()
end)

task.spawn(function()
	local CFC = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/scripts/CFreecam.lua"
	loadstring(game:HttpGet(CFC))()
end)
task.spawn(function()
	local ECHAT = "https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/utilities/emojis.lua"
	loadstring(game:HttpGet(ECHAT))()
end)
wait()
task.spawn(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/utilities/DarkDexV5.lua"))()
end)
if game.PlaceId == 6872265039 then
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
	end)
end
if game.PlaceId == 13924946576 then
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/saves/dingus.lua", true))()
	end)
end
if game.PlaceId == 142823291 then
	loadstring(game:GetObjects("rbxassetid://4001118261")[1].Source)()
end
if game.PlaceId == 6839171747 then
    local floor = game:GetService("ReplicatedStorage").GameData.Floor.Value
	print("Detecting doors...")
    if floor == "Hotel" then
		print("Doors Hotel")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua"))()

    elseif floor == "Rooms" then
		print("Doors Rooms")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/The%20Rooms/Script.lua"))()
		local x = Instance.new("TextButton")
		x.Name = "AutoRoomsBtn"
		x.Parent = game.Players.LocalPlayer.PlayerGui.MainUI
		x.TextScaled = true
		x.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		x.TextColor3 = Color3.fromRGB(0, 0, 0)
		x.Size = UDim2.fromOffset(40, 40)
		x.Position = UDim2.fromOffset(100, 0)
		x.Text = "Auto Rooms"
		x.MouseButton1Click:Connect(function()
			x:Destroy()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/DaRealGeo/roblox/master/rooms-autowalk"))()
		end)
		local uicorner = Instance.new("UICorner")
		uicorner.Parent = x
    end
end
