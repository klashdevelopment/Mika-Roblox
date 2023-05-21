if game.PlaceId == 6839171747 then
    local floor = game:GetService("ReplicatedStorage").GameData.Floor.Value

    if floor == "Hotel" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/saves/doors/4-21-23%20Update/Vynixius-Doors.lua"))()

    elseif floor == "Rooms" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/saves/doors/4-21-23%20Update/Vynixius-Rooms.lua"))()
    end
end
