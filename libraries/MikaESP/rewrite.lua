local MikaUI = {
	players = {},
	parts = {},
	enabled = true
}

-- Core Functions
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
local function DrawText(name, position, color)
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
local function DrawLine(to, from, color, thickness)
	local Line = Drawing.new("Line")
	Line.Color = color
	Line.Thickness = thickness
	Line.From = from
	Line.To = to
	return Line
end

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
local centerScreen = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y - 10)

-- Runframe

local rendering = {}
local runframeevent = nil

local function RunFrame()
	if game.Players.LocalPlayer:FindFirstChild("Stopmui") then
		for k, render in pairs(rendering) do
			render.Highlight.FillTransparency = 1
			render.Highlight.OutlineTransparency = 1
			render.Tracer:Remove()
			render.Text:Remove()
			table.remove(rendering, table.find(rendering, render))
		end
		wait(0.01)
		runframeevent:Disconnect()
		game.Players.LocalPlayer:FindFirstChild("Stopmui"):Destroy()
		return
	end
	-- Delete past rendered
	for k, render in pairs(rendering) do
		if render.Highlight:GetAttribute("Remove") then
			render.Highlight:Destroy()
		end
		render.Tracer:Remove()
		render.Text:Remove()
		table.remove(rendering, table.find(rendering, render))
	end
	wait()
	-- Create new rendered
	for k, v in pairs(MikaUI.parts) do
		local Highlight = AddPartESP(v.Part, v.Color)
		local Tracer = DrawLine(worldToViewportPoint(v.Part.Position), centerScreen, v.Color, 1)
		local Text = DrawText(v.Text, worldToViewportPoint(v.Part.Position), v.Color)
		table.insert(rendering, {
			Highlight = Highlight,
			Tracer = Tracer,
			Text = Text
		})
	end
end

function MikaUI:Insert(part, text, color)
	if part:IsA("Part") or part:IsA("MeshPart") or part:IsA("TrussPart") or part:IsA("BasePart") or part:IsA("Part") then
		table.insert(MikaUI.parts, {
			Part = part,
			Color = color,
			Text = text
		})
	end
end
function MikaUI:RemovePartUsingText(text)
	for k, v in pairs(MikaUI.parts) do
		if v.Text == text then
			table.remove(MikaUI.parts, table.find(v))
		end
	end
end
function MikaUI:RemovePartUsingPart(part)
	for k, v in pairs(MikaUI.parts) do
		if v.Part == part then
			table.remove(MikaUI.parts, table.find(v))
		end
	end
end

function MikaUI:Init()
	local RunService = game:GetService("RunService")
	runframeevent = RunService.RenderStepped:Connect(RunFrame)
end

return MikaUI
