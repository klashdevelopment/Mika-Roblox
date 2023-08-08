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
local options = {}
local function makeCheckbox(text, value, toggleFunction)
	options[value] = false
	local TextBtn = Instance.new("TextButton")
	TextBtn.Size = UDim2.fromOffset(180, 40)
	TextBtn.Position = UDim2.fromOffset(10, (40+40*#options))
	TextBtn.Text = "(off) Toggle "..text
	TextBtn.MouseButton1Click:Connect(function()
		toggleFunction()
		options[value] = not options[value]
		TextBtn.Text = "("..options[value] and "on" or "off"..") Toggle "..text
	end)
	return TextBtn
end	
local function makeButton(ylevel, text, toggleFunction)
	local TextBtn = Instance.new("TextButton")
	TextBtn.Size = UDim2.fromOffset(180, 40)
	TextBtn.Position = UDim2.fromOffset(10, ylevel)
	TextBtn.Text = text
	TextBtn.MouseButton1Click:Connect(toggleFunction)
	return TextBtn
end
local function makeButtonRow2(ylevel, text, toggleFunction)
	local TextBtn = Instance.new("TextButton")
	TextBtn.Size = UDim2.fromOffset(180, 40)
	TextBtn.Position = UDim2.fromOffset(190, ylevel)
	TextBtn.Text = text
	TextBtn.MouseButton1Click:Connect(toggleFunction)
	return TextBtn
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
	return tonumber(curroom)-1
end
local function formatRoomName(room)
	if room.Name == "49" then
		return "Figure Library"
	elseif room.Name == "99" then
		return "Floor 1 Finale"
	elseif room.Name == "50" then
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
local function GetCurrentRoom()
	return findRoomByName(getNextRoom(), "1")
end
local function GetNextRoom()
	return findRoomByName(getNextRoom()+1, "1")
end
local function GetNextRoomDoor()
	return GetCurrentRoom():WaitForChild("Door")
end
local function GetNextRoomDoorPos()
	return worldToViewportPoint(GetNextRoomDoor().Door.Position)
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
local MESSAGE_TEXT
local function renderUi()
	local coreUi = game.Players.LocalPlayer.PlayerGui.MainUI
	if coreUi:FindFirstChild("mikadoor") then
		coreUi:FindFirstChild("mikadoor"):Destroy()
	end
	local frame = Instance.new("Frame")
	frame.Name = "mikadoor"
	frame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	frame.Position = UDim2.fromOffset(10, 40)
	frame.Size = UDim2.fromOffset(400, 400)
	frame.Parent = coreUi
	local uiCorner = Instance.new("UICorner")
	uiCorner.CornerRadius = UDim.new(0, 14)
	uiCorner.Parent = frame
	local text = Instance.new("TextLabel")
	text.Text = "Doors | Mika"
	text.Position = UDim2.fromOffset(50, 15)
	text.TextSize = 10
	text.Parent = frame
	text.TextColor3 = Color3.fromRGB(255, 255, 255)
	local textBtn = Instance.new("TextButton")
	textBtn.Text = "coming soon"
	textBtn.TextScaled = true
	textBtn.TextSize = 12
	textBtn.Parent = frame
	textBtn.Size = UDim2.fromOffset(40, 40)
	textBtn.Position = UDim2.new(1, -40, 0, 0)
	local lightUpRoom = makeButton(40, "Light Up Room", function()
		ToggleLights(GetCurrentRoom(), true)
	end)
	lightUpRoom.Parent = frame
	local removeDoor = makeButton(80, "Remove Door", function()
		GetNextRoomDoor():Destroy()
	end)
	removeDoor.Parent = frame
	local removePaintingPuzzleDoor = makeButton(120, "Remove Painting Puzzle Door", function()
		GetNextRoom().Assets.Paintings.MovingDoor:Destroy()
	end)
	removePaintingPuzzleDoor.Parent = frame
	local removeSeekTrigger = makeButton(160, "Remove Seek Trigger", function()
		GetNextRoom().TriggerEventCollision:Destroy()
	end)
	removeSeekTrigger.Parent = frame
	MESSAGE_TEXT = Instance.new("TextLabel")
	MESSAGE_TEXT.Text = ""
	MESSAGE_TEXT.Position = UDim2.fromOffset(100, 380)
	MESSAGE_TEXT.TextSize = 20
	MESSAGE_TEXT.TextColor3 = Color3.fromRGB(255, 0, 0)
	MESSAGE_TEXT.Parent = frame
	MESSAGE_TEXT.TextStrokeTransparency = 0
end
renderUi()
local rushing = false
local objects = {}
local toRemove = {}
print(GetCurrentRoom().Name)
while true do
	if workspace.CurrentRooms:FindFirstChild("50") then
		local hl = Instance.new("Highlight")
		hl.FillColor = Color3.fromRGB(255, 0,0)
		hl.FillTransparency = 0.75
		hl.OutlineColor = Color3.fromRGB(255, 0,0)
		hl.OutlineTransparency = 0
		hl.Parent = workspace.CurrentRooms["50"].FigureSetup.FigureRagdoll
		for k, v in pairs(workspace.CurrentRooms["50"].Assets:GetChildren()) do
			if v.Name == "Super Cool Bookshelf With Hint Book" then
				if v:FindFirstChild("LiveHintBook") then
				local hl = Instance.new("Highlight")
				hl.FillColor = Color3.fromRGB(255, 255,0)
				hl.FillTransparency = 0.75
				hl.OutlineColor = Color3.fromRGB(255, 255,0)
				hl.OutlineTransparency = 0
				hl.Parent = v["LiveHintBook"]
				v["LiveHintBook"].ActivateEventPrompt.MaxActivationDistance = 10
				v["LiveHintBook"].ActivateEventPrompt.RequiresLineOfSight = false
				end
			end
		end
	end
	if workspace:FindFirstChild("RushMoving") then
		rushing = true
		MESSAGE_TEXT.Text = "RUSH SPAWNED"
	end
	if rushing and not workspace:FindFirstChild("RushMoving") then
		MESSAGE_TEXT.Text = ""
	end
	for _,x in pairs(GetCurrentRoom().Assets:GetChildren()) do
		if x.Name == "LeverForGate" then
			if objects["Lever"..getNextRoom()] == nil then
				x.Main:SetAttribute("EspName", "Lever")
				objects["Lever"..getNextRoom()] = x.Main
			end
		end
		if x.Name == "Table" or x.Name == "Dresser" then
			for _,y in pairs(x:GetChildren()) do
				if y.Name == "KeyObtain" then
					x.Hitbox:SetAttribute("EspName", "Key "..getNextRoom())
					x.Hitbox:SetAttribute("color", Color3.fromRGB(255, 255, 0))
					table.insert(objects,x.Hitbox)
				elseif y.Name == "DrawerContainer" then
					for _,z in pairs(y:GetChildren()) do
						if y.Name == "KeyObtain" then
							x.Hitbox:SetAttribute("EspName", "Key "..getNextRoom())
							x.Hitbox:SetAttribute("color", Color3.fromRGB(255, 255, 0))
							table.insert(objects,x.Hitbox)
						elseif y.Name == "GoldPile" then
							y:SetAttribute("EspName", "fat cash")
							objects["fat cash"] = y
						end
					end
				end
			end
		elseif x.Name == "KeyObtain" then
			x.Hitbox:SetAttribute("EspName", "Key "..getNextRoom())
			x.Hitbox:SetAttribute("color", Color3.fromRGB(255, 255, 0))
			table.insert(objects,x.Hitbox)
		end
	end
	if objects[getNextRoom()] == nil then
		local y = GetCurrentRoom().Door.Door
		y:SetAttribute("EspName", formatRoomName(GetCurrentRoom()))
		objects[getNextRoom()] = y
		objects[getNextRoom()-1] = nil
	end
	for _,object in pairs(objects) do
		local npos = worldToViewportPoint(object.Position)

local color = Color3.fromRGB(0, 255, 0)
if object:GetAttribute("color") ~= nil then
	color = object:GetAttribute("color")
end

		local x = newTextEspObject(object:GetAttribute("EspName"), npos, color)
		local y = newLineEspObject(npos, centerScreen, color, 1)
		local z = AddPartESP(object, color)
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
