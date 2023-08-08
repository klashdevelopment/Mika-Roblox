-- ESP FUNCTIONS
MikaESP = {
	tracers = true,
	outline = true,
	texts = true
}

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
local centerScreen = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)

local objects = {}
local toRemove = {}

function MikaESP:AddObject(object, name)
	object:SetAttribute("EspName", name)
	objects[name] = object
end
function MikaESP:AddPlayer(object)
	object:SetAttribute("EspName", object.Character.Name)
	objects[object.Character.Name] = object.Character
	object.Character.Humanoid.Died:Connect(function()
		self:RemovePlayer(object)
		wait(4)
		self:AddPlayer(object)
	end)
end
function MikaESP:RemoveObject(name)
	objects[name] = nil
end
function MikaESP:RemovePlayer(object)
	objects[object.Name] = nil
end

function MikaESP:InitRenderTicker()
	while true do
		for _,object in pairs(objects) do
			if MikaESP.texts then
				local npos = nil
				local nponscr = nil
				if game.Players:FindFirstChild(object.Name) then
					npos = object.HumanoidRootPart.Position
					nponscr = wtvpOnScreen(object.HumanoidRootPart.Position)
				else
					npos = worldToViewportPoint(object.Position)
					nponscr = wtvpOnScreen(object.Position)
				end
				local x = newTextEspObject(object:GetAttribute("EspName"), npos, Color3.fromRGB(0, 255, 0))
				x.Visible = nponscr
				table.insert(toRemove, x)
			end
			if MikaESP.tracers then
				local npos = nil
				local nponscr = nil
				if game.Players:FindFirstChild(object.Name) then
					npos = object.HumanoidRootPart.Position
					nponscr = wtvpOnScreen(object.HumanoidRootPart.Position)
				else
					npos = worldToViewportPoint(object.Position)
					nponscr = wtvpOnScreen(object.Position)
				end
				local y = newLineEspObject(npos, centerScreen, Color3.fromRGB(0, 255, 0), 1)
				y.Visible = nponscr
				table.insert(toRemove, y)
			end
			if MikaESP.outline then
				if game.Players:FindFirstChild(object.Name) then
					for _,part in pairs(object:GetChildren()) do
						if part:IsA("MeshPart") then
							local z = AddPartESP(part, Color3.fromRGB(0, 255, 0))
							z.Enabled = wtvpOnScreen(part.Position)
							table.insert(toRemove, z)
						elseif part:IsA("Accessory") then
							local z = AddPartESP(part.Handle, Color3.fromRGB(0, 255, 0))
							z.Enabled = wtvpOnScreen(part.Handle.Position)
							table.insert(toRemove, z)
						end
					end
				else
					local z = AddPartESP(object, Color3.fromRGB(0, 255, 0))
					z.Enabled = wtvpOnScreen(object.Position)
					table.insert(toRemove, z)
				end
			end
		end
		wait(0.01)
		for _,obj in pairs(toRemove) do
			obj:Remove()
		end
	end
end

return MikaESP
