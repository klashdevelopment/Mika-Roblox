-- ESP FUNCTIONS

local drawingNew = Drawing.new;
local wtvp = workspace.CurrentCamera.WorldToViewportPoint;
local function worldToViewportPoint(position)
    local screenPosition, onScreen = wtvp(workspace.CurrentCamera, position);
    return Vector2.new(screenPosition.X, screenPosition.Y);
end
local function wtvpOnScreen(position)
    local screenPosition, onScreen = wtvp(workspace.CurrentCamera, position);
    return onScreen
end
local function newTextEspObject(name, position, color)
	local Text = Drawing.new("Text")
	Text.Color = color
	Text.Text = name
	Text.Size = 16
	Text.Center = true
	Text.Outline = true
	Text.OutlineColor = Color3.fromRGB(0, 0, 0)
	Text.Position = position
	Text.Font = UI
	return Text
end
local function newLineEspObject(to, from, color, thickness)
	local Line = Drawing.new("Line")
	Line.Color = color
	Line.Thickness = thickness
	Line.From = from
	Line.To = to
	return Line
end


local function getNextRoom()
	local curroom = "0"
	for _,x in pairs(workspace.CurrentRooms:GetChildren()) do
		if tonumber(x.Name) > tonumber(curroom) then
			curroom = x.Name
		end
	end
	return tonumber(curroom)
end
local function formatRoomName(room)
	if room.Name == "50" then
		return "Figure Library"
	elseif room.Name == "100" then
		return "Floor 1 Finale"
	elseif room.Name == "51" then
		return "Jeff Shop"
	elseif room.Assets:FindFirstChild("Rolltop_Desk") and room:FindFirstChild("DoorLattice") then
		return "Door "..tostring(tonumber(room.Name)+1).." (Corner Loot)"
	elseif room.Assets:FindFirstChild("Rolltop_Desk") and room.Assets:FindFirstChild("Window_Tall") then
		return "Door "..tostring(tonumber(room.Name)+1).." (Tall Window Loot)"
	else
		return "Door "..tostring(tonumber(room.Name)+1)
	end
end
local function findRoomByName(name, fallbackRoomNumber)
	if workspace.CurrentRooms:FindFirstChild(name, false) then
		return workspace.CurrentRooms:FindFirstChild(name, false)
	else
		if workspace.CurrentRooms:FindFirstChild(fallbackRoomNumber, false) then
			return workspace.CurrentRooms:FindFirstChild(fallbackRoomNumber, false)
		else
			return workspace.CurrentRooms:FindFirstChild(""..getNextRoom().."", false)
		end
	end
end


local doorEsp = false
local function AddSpecialPartESP(part, outlineColor, fillColor, fillTransparency)
	local Highlight = Instance.new("Highlight")
	Highlight.Enabled = true
	Highlight.FillColor = fillColor
	Highlight.FillTransparency = fillTransparency
	Highlight.Name = "MikaESP"
	Highlight.OutlineColor = outlineColor
	Highlight.OutlineTransparency = 0
	Highlight.Parent = part
	return Highlight
end
local function AddPartESP(part, color)
	return AddSpecialPartESP(part, color, color, 0.75)
end
local function GetNextRoomDoor()
	return findRoomByName(getNextRoom()-1, "1"):WaitForChild("Door")
end
local function GetNextRoomDoorPos()
	return worldToViewportPoint(findRoomByName(getNextRoom()-1, "1"):WaitForChild("Door").Door.Position)
end
local function GetNextRoomDoorOnscreen()
	return wtvpOnScreen(findRoomByName(getNextRoom()-1, "1"):WaitForChild("Door").Door.Position)
end
local centerScreen = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)

local function ToggleLights(room, value)
	for i,x in pairs(room.Assets.Light_Fixtures:GetChildren()) do
		x.LightFixture.Neon.CenterAttach.SpotLight.Enabled = value
		x.LightFixture.Neon.CenterAttach.SpotLight.Brightness = (value and 2 or 0)
		x.LightFixture.Neon.Material = Enum.Material.Neon
	end
end
local objects = {}
local toRemove = {}
while true do

	for _,x in pairs(GetNextRoomDoor().Parent.Assets:GetChildren()) do
		if x.Name == "Table" then
			for _,y in pairs(x:GetChildren()) do
				if y.Name == "KeyObtain" then
					if objects["Key"..getNextRoom()] == nil then
						y:SetAttribute("EspName", "Key"..getNextRoom())
						objects["Key"..getNextRoom()] = y
					end
				end
			end
		elseif x.Name == "KeyObtain" then
			if objects["Key"..getNextRoom()] == nil then
				x.Hitbox:SetAttribute("EspName", "Key "..getNextRoom())
				objects["Key"..getNextRoom()] = x.Hitbox
			end
		end
	end
	if objects[getNextRoom()] == nil then
		local y = GetNextRoomDoor().Door
		y:SetAttribute("EspName", formatRoomName(findRoomByName(getNextRoom()-1, "1")))
		objects[getNextRoom()] = y
		objects[getNextRoom()-1] = nil
	end
	ToggleLights(findRoomByName(getNextRoom()-1, "1"), true)
	for _,object in pairs(objects) do
		local npos = worldToViewportPoint(object.Position)
		local x = newTextEspObject(object:GetAttribute("EspName"), npos, Color3.fromRGB(0, 255, 0))
		local y = newLineEspObject(npos, centerScreen, Color3.fromRGB(0, 255, 0), 1)
		local z = AddPartESP(object.Name == "KeyObtain" and object.Parent or object, Color3.fromRGB(0, 255, 0))
		x.Visible = wtvpOnScreen(object.Position)
		y.Visible = wtvpOnScreen(object.Position)
		z.Enabled = wtvpOnScreen(object.Position)
		table.insert(toRemove, x)
		table.insert(toRemove, y)
		table.insert(toRemove, z)
	end
	wait(0.01)
	for _,obj in pairs(toRemove) do
		obj:Remove()
	end
end
