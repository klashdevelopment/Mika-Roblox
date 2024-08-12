local RootGUI = gethui() or game.CoreGui or game:GetService("Players").LocalPlayer.PlayerGui

local padding = 5
function calcYRow(row, objectHeight)
	local yRow = row-1
	return yRow*objectHeight+(padding*yRow)+1
end

function randomstring(length)
	local res = ""
	for i = 1, length do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end

function input(danger, yRow)
	local joyInput = Instance.new("Frame")
	joyInput.Name = "JoyInput"
	joyInput.Active = true
	joyInput.BackgroundColor3 = Color3.fromRGB(12, 14, 15)
	joyInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
	joyInput.BorderSizePixel = 0
	joyInput.Position = UDim2.fromOffset(2, calcYRow(yRow, 36))
	joyInput.Selectable = true
	joyInput.Size = UDim2.new(1, -5, 0, 36)

	local uIStroke = Instance.new("UIStroke")
	uIStroke.Name = "UIStroke"
	uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uIStroke.Color = Color3.fromRGB(18, 70, 123)
	uIStroke.Parent = joyInput

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 6)
	uICorner.Parent = joyInput

	local input = Instance.new("TextBox")
	input.Name = "Input"
	input.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	input.PlaceholderText = "Placeholder..."
	input.Text = ""
	input.TextColor3 = Color3.fromRGB(255, 255, 255)
	input.TextSize = 16
	input.TextXAlignment = Enum.TextXAlignment.Left
	input.Active = false
	input.AnchorPoint = Vector2.new(0.5, 0.5)
	input.BackgroundColor3 = Color3.fromRGB(11, 13, 14)
	input.BackgroundTransparency = 0
	input.BorderColor3 = Color3.fromRGB(0, 0, 0)
	input.BorderSizePixel = 0
	input.Position = UDim2.fromScale(0.5, 0.5)
	input.Selectable = false
	input.Size = UDim2.fromScale(0.9, 1)
	input.Parent = joyInput
	
	local inputFrame = joyInput
	local outline = uICorner

	local function changeColor(color)
		uIStroke.Color = Color3.fromHex(color)
	end
	local function changeWidth(width)
		uIStroke.Thickness = width
	end

	if not danger then
		changeColor("#12467b")
		changeWidth(1)

		input.Focused:Connect(function()
			changeColor("#0b6bcb")
			changeWidth(2)
		end)
		input.FocusLost:Connect(function()
			changeColor("#12467b")
			changeWidth(1)
		end)
	else
		changeColor("#7d1212")
		changeWidth(1)

		input.Focused:Connect(function()
			changeColor("#c41c1c")
			changeWidth(2)
		end)
		input.FocusLost:Connect(function()
			changeColor("#7d1212")
			changeWidth(1)
		end)
	end
	
	return joyInput
end

function inputWithButton(yRow)
	local joyInputWithButton = Instance.new("Frame")
	joyInputWithButton.Name = "JoyInputWithButton"
	joyInputWithButton.Active = true
	joyInputWithButton.BackgroundColor3 = Color3.fromRGB(12, 14, 15)
	joyInputWithButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	joyInputWithButton.BorderSizePixel = 0
	joyInputWithButton.Position = UDim2.fromOffset(2, calcYRow(yRow, 36))
	joyInputWithButton.Selectable = true
	joyInputWithButton.Size = UDim2.new(1, -5, 0, 36)

	local uIStroke = Instance.new("UIStroke")
	uIStroke.Name = "UIStroke"
	uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uIStroke.Color = Color3.fromRGB(18, 70, 123)
	uIStroke.Parent = joyInputWithButton

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 6)
	uICorner.Parent = joyInputWithButton

	local input = Instance.new("TextBox")
	input.Name = "Input"
	input.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	input.PlaceholderText = "Input with button..."
	input.Text = ""
	input.TextColor3 = Color3.fromRGB(255, 255, 255)
	input.TextSize = 16
	input.TextXAlignment = Enum.TextXAlignment.Left
	input.Active = false
	input.AnchorPoint = Vector2.new(0, 0.5)
	input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	input.BackgroundTransparency = 1
	input.BorderColor3 = Color3.fromRGB(0, 0, 0)
	input.BorderSizePixel = 0
	input.Position = UDim2.new(0, 10, 0.5, 0)
	input.Selectable = false
	input.Size = UDim2.new(1, -97, 1, 0)
	input.Parent = joyInputWithButton

	local inputFrame = joyInputWithButton
	local outline = uIStroke

	local function changeColor(color)
		outline.Color = Color3.fromHex(color)
	end
	local function changeWidth(width)
		outline.Thickness = width
	end

	changeColor("#12467b")
	changeWidth(1)

	inputFrame.Input.Focused:Connect(function()
		changeColor("#0b6bcb")
		changeWidth(2)
	end)
	inputFrame.Input.FocusLost:Connect(function()
		changeColor("#12467b")
		changeWidth(1)
	end)

	local buttonInside = Instance.new("TextButton")
	buttonInside.Name = "ButtonInside"
	buttonInside.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	buttonInside.Text = "Default"
	buttonInside.TextColor3 = Color3.fromRGB(255, 255, 255)
	buttonInside.TextSize = 16
	buttonInside.AutoButtonColor = false
	buttonInside.AnchorPoint = Vector2.new(0, 0.5)
	buttonInside.BackgroundColor3 = Color3.fromRGB(11, 107, 203)
	buttonInside.BorderColor3 = Color3.fromRGB(0, 0, 0)
	buttonInside.BorderSizePixel = 0
	buttonInside.Position = UDim2.new(1, -82, 0.5, 0)
	buttonInside.Size = UDim2.fromOffset(77, 26)

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.CornerRadius = UDim.new(0, 6)
	uICorner1.Parent = buttonInside

	local hoverColor = Instance.new("LocalScript")
	hoverColor.Name = "HoverColor"
	hoverColor.Parent = buttonInside

	buttonInside.Parent = joyInputWithButton
	
	local btn = buttonInside

	local btnColor = "#0b6bcb"
	local btnHover = "#185EA5"
	local btnActive = "#12467b"

	btn.BackgroundColor3 = Color3.fromHex(btnColor)

	local isHovered = false

	btn.MouseEnter:Connect(function(x, y) 
		btn.BackgroundColor3 = Color3.fromHex(btnHover)
		isHovered = true
	end)
	btn.MouseLeave:Connect(function(x, y)
		btn.BackgroundColor3 = Color3.fromHex(btnColor)
		isHovered = false
	end)
	btn.MouseButton1Down:Connect(function(x, y)
		btn.BackgroundColor3 = Color3.fromHex(btnActive)
	end)
	btn.MouseButton1Up:Connect(function(x, y)
		btn.BackgroundColor3 = Color3.fromHex(btnColor)
		if isHovered then
			btn.BackgroundColor3 = Color3.fromHex(btnHover)
		else
			btn.BackgroundColor3 = Color3.fromHex(btnColor)
		end
	end)
	
	return joyInputWithButton
end

function buttonNormal(yRow)
	local joyButton = Instance.new("TextButton")
	joyButton.Name = "JoyButton"
	joyButton.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	joyButton.Text = "Default"
	joyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	joyButton.TextSize = 16
	joyButton.AutoButtonColor = false
	joyButton.BackgroundColor3 = Color3.fromRGB(11, 107, 203)
	joyButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	joyButton.BorderSizePixel = 0
	joyButton.Position = UDim2.fromOffset(2, calcYRow(yRow, 36))
	joyButton.Size = UDim2.new(1, -5, 0, 36)

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 6)
	uICorner.Parent = joyButton
	
	local btnColor = "#0b6bcb"
	local btnHover = "#185EA5"
	local btnActive = "#12467b"

	local btn = joyButton
	btn.BackgroundColor3 = Color3.fromHex(btnColor)

	local isHovered = false

	btn.MouseEnter:Connect(function(x, y) 
		btn.BackgroundColor3 = Color3.fromHex(btnHover)
		isHovered = true
	end)
	btn.MouseLeave:Connect(function(x, y)
		btn.BackgroundColor3 = Color3.fromHex(btnColor)
		isHovered = false
	end)
	btn.MouseButton1Down:Connect(function(x, y)
		btn.BackgroundColor3 = Color3.fromHex(btnActive)
	end)
	btn.MouseButton1Up:Connect(function(x, y)
		btn.BackgroundColor3 = Color3.fromHex(btnColor)
		if isHovered then
			btn.BackgroundColor3 = Color3.fromHex(btnHover)
		else
			btn.BackgroundColor3 = Color3.fromHex(btnColor)
		end
	end)
	
	return joyButton
end

function buttonOutline(yRow)
	local joyButtonOutline = Instance.new("TextButton")
	joyButtonOutline.Name = "JoyButtonOutline"
	joyButtonOutline.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	joyButtonOutline.Text = "Outline"
	joyButtonOutline.TextColor3 = Color3.fromRGB(255, 255, 255)
	joyButtonOutline.TextSize = 16
	joyButtonOutline.AutoButtonColor = false
	joyButtonOutline.Modal = true
	joyButtonOutline.BackgroundColor3 = Color3.fromRGB(11, 13, 14)
	joyButtonOutline.BackgroundTransparency = 0
	joyButtonOutline.BorderColor3 = Color3.fromRGB(0, 0, 0)
	joyButtonOutline.BorderSizePixel = 0
	joyButtonOutline.Position = UDim2.fromOffset(2, calcYRow(yRow, 36))
	joyButtonOutline.Size = UDim2.new(1, -5, 0, 36)

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 6)
	uICorner.Parent = joyButtonOutline

	local uIStroke = Instance.new("UIStroke")
	uIStroke.Name = "UIStroke"
	uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uIStroke.Color = Color3.fromRGB(18, 70, 123)
	uIStroke.Parent = joyButtonOutline
	
	local btn = joyButtonOutline

	local btnHover = "#0a2744"
	local btnActive = "#12467b"

	local isHovered = false

	btn.MouseEnter:Connect(function(x, y) 
		btn.BackgroundColor3 = Color3.fromHex(btnHover)
		btn.BackgroundTransparency = 0
		isHovered = true
	end)
	btn.MouseLeave:Connect(function(x, y)
		btn.BackgroundTransparency = 1
		isHovered = false
	end)
	btn.MouseButton1Down:Connect(function(x, y)
		btn.BackgroundColor3 = Color3.fromHex(btnActive)
		btn.BackgroundTransparency = 0
	end)
	btn.MouseButton1Up:Connect(function(x, y)
		btn.BackgroundTransparency = 1
	end)
	
	return joyButtonOutline
end

function buttonPlain(yRow)
	local joyButtonPlain = Instance.new("TextButton")
	joyButtonPlain.Name = "JoyButtonPlain"
	joyButtonPlain.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	joyButtonPlain.Text = "Plain"
	joyButtonPlain.TextColor3 = Color3.fromRGB(255, 255, 255)
	joyButtonPlain.TextSize = 16
	joyButtonPlain.AutoButtonColor = false
	joyButtonPlain.BackgroundColor3 = Color3.fromRGB(11, 107, 203)
	joyButtonPlain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	joyButtonPlain.BorderSizePixel = 0
	joyButtonPlain.Position = UDim2.fromOffset(2, calcYRow(yRow, 36))
	joyButtonPlain.Size = UDim2.new(1, -5, 0, 36)

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 6)
	uICorner.Parent = joyButtonPlain

	local btn = joyButtonPlain

	local btnColor = "#0c0e0f"
	local btnHover = "#0a2744"
	local btnActive = "#12467b"

	btn.BackgroundColor3 = Color3.fromHex(btnColor)

	local isHovered = false

	btn.MouseEnter:Connect(function(x, y) 
		btn.BackgroundColor3 = Color3.fromHex(btnHover)
		isHovered = true
	end)
	btn.MouseLeave:Connect(function(x, y)
		btn.BackgroundColor3 = Color3.fromHex(btnColor)
		isHovered = false
	end)
	btn.MouseButton1Down:Connect(function(x, y)
		btn.BackgroundColor3 = Color3.fromHex(btnActive)
	end)
	btn.MouseButton1Up:Connect(function(x, y)
		btn.BackgroundColor3 = Color3.fromHex(btnColor)
		if isHovered then
			btn.BackgroundColor3 = Color3.fromHex(btnHover)
		else
			btn.BackgroundColor3 = Color3.fromHex(btnColor)
		end
	end)
	
	return joyButtonPlain
end

function buttonSoft(yRow)
	local joyButtonSoft = Instance.new("TextButton")
	joyButtonSoft.Name = "JoyButtonSoft"
	joyButtonSoft.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	joyButtonSoft.Text = "Soft"
	joyButtonSoft.TextColor3 = Color3.fromRGB(255, 255, 255)
	joyButtonSoft.TextSize = 16
	joyButtonSoft.AutoButtonColor = false
	joyButtonSoft.Modal = true
	joyButtonSoft.BackgroundColor3 = Color3.fromRGB(11, 107, 203)
	joyButtonSoft.BorderColor3 = Color3.fromRGB(0, 0, 0)
	joyButtonSoft.BorderSizePixel = 0
	joyButtonSoft.Position = UDim2.fromOffset(2, calcYRow(yRow, 36))
	joyButtonSoft.Size = UDim2.new(1, -5, 0, 36)

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 6)
	uICorner.Parent = joyButtonSoft

	local btn = joyButtonSoft

	local btnColor = "#0a2744"
	local btnHover = "#185fa4"
	local btnActive = "#12467b"

	btn.BackgroundColor3 = Color3.fromHex(btnColor)

	local isHovered = false

	btn.MouseEnter:Connect(function(x, y) 
		btn.BackgroundColor3 = Color3.fromHex(btnHover)
		isHovered = true
	end)
	btn.MouseLeave:Connect(function(x, y)
		btn.BackgroundColor3 = Color3.fromHex(btnColor)
		isHovered = false
	end)
	btn.MouseButton1Down:Connect(function(x, y)
		btn.BackgroundColor3 = Color3.fromHex(btnActive)
	end)
	btn.MouseButton1Up:Connect(function(x, y)
		btn.BackgroundColor3 = Color3.fromHex(btnColor)
		if isHovered then
			btn.BackgroundColor3 = Color3.fromHex(btnHover)
		else
			btn.BackgroundColor3 = Color3.fromHex(btnColor)
		end
	end)

	return joyButtonSoft
end

function checkbox(yRow, Default, OnCheck)
	local joyCheckbox = Instance.new("Frame")
	joyCheckbox.Name = "JoyCheckbox"
	joyCheckbox.BackgroundColor3 = Color3.fromRGB(11, 13, 14)
	joyCheckbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	joyCheckbox.BorderSizePixel = 0
	joyCheckbox.Position = UDim2.fromOffset(2, calcYRow(yRow, 36))
	joyCheckbox.Size = UDim2.new(1, -5, 0, 36)

	local uIStroke = Instance.new("UIStroke")
	uIStroke.Name = "UIStroke"
	uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uIStroke.Color = Color3.fromRGB(50, 56, 62)
	uIStroke.Parent = joyCheckbox

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 6)
	uICorner.Parent = joyCheckbox

	local checkbox = Instance.new("ImageButton")
	checkbox.Name = "Checkbox"
	checkbox.Image = "rbxassetid://18898021370"
	checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	checkbox.BackgroundTransparency = 1
	checkbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	checkbox.BorderSizePixel = 0
	checkbox.Position = UDim2.fromOffset(10, 8)
	checkbox.Size = UDim2.fromOffset(20, 20)

	local uIStroke1 = Instance.new("UIStroke")
	uIStroke1.Name = "UIStroke"
	uIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uIStroke1.Color = Color3.fromRGB(50, 56, 62)
	uIStroke1.Parent = checkbox

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.CornerRadius = UDim.new(0, 6)
	uICorner1.Parent = checkbox

	local box = checkbox

	local function updateImage()
		if box:GetAttribute("Checked") == true then
			box.ImageTransparency = 0
		else
			box.ImageTransparency = 1
		end
	end

	box:SetAttribute("Checked", Default) -- DEFAULT CHECKED
	updateImage()

	box.MouseButton1Click:Connect(function() 
		box:SetAttribute("Checked", not box:GetAttribute("Checked"))
		updateImage()
		OnCheck(box:GetAttribute("Checked"))
	end)

	checkbox.Parent = joyCheckbox

	local label = Instance.new("TextLabel")
	label.Name = "Label"
	label.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	label.Text = "Checkbox"
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextSize = 16
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label.BackgroundTransparency = 1
	label.BorderColor3 = Color3.fromRGB(0, 0, 0)
	label.BorderSizePixel = 0
	label.Position = UDim2.fromOffset(40, 0)
	label.Size = UDim2.new(1, -50, 1, 0)
	label.Parent = joyCheckbox
	
	return joyCheckbox
end

function switch(yRow, Default, OnCheck)
	local joySwitch = Instance.new("Frame")
	joySwitch.Name = "JoySwitch"
	joySwitch.BackgroundColor3 = Color3.fromRGB(11, 13, 14)
	joySwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
	joySwitch.BorderSizePixel = 0
	joySwitch.Position = UDim2.fromOffset(2, calcYRow(yRow, 36))
	joySwitch.Size = UDim2.new(1, -5, 0, 36)

	local uIStroke = Instance.new("UIStroke")
	uIStroke.Name = "UIStroke"
	uIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uIStroke.Color = Color3.fromRGB(50, 56, 62)
	uIStroke.Parent = joySwitch

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 6)
	uICorner.Parent = joySwitch

	local label = Instance.new("TextLabel")
	label.Name = "Label"
	label.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	label.Text = "Switch"
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextSize = 16
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label.BackgroundTransparency = 1
	label.BorderColor3 = Color3.fromRGB(0, 0, 0)
	label.BorderSizePixel = 0
	label.Position = UDim2.fromOffset(50, 0)
	label.Size = UDim2.new(1, -60, 1, 0)
	label.Parent = joySwitch

	local switch = Instance.new("ImageButton")
	switch.Name = "Switch"
	switch.ImageTransparency = 1
	switch.BackgroundColor3 = Color3.fromRGB(11, 107, 203)
	switch.BorderColor3 = Color3.fromRGB(0, 0, 0)
	switch.BorderSizePixel = 0
	switch.Position = UDim2.fromOffset(10, 8)
	switch.Size = UDim2.fromOffset(35, 20)

	local uIStroke1 = Instance.new("UIStroke")
	uIStroke1.Name = "UIStroke"
	uIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uIStroke1.Color = Color3.fromRGB(50, 56, 62)
	uIStroke1.Parent = switch

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.CornerRadius = UDim.new(1, 0)
	uICorner1.Parent = switch

	local knob = Instance.new("Frame")
	knob.Name = "Knob"
	knob.Active = true
	knob.AnchorPoint = Vector2.new(0, 0.5)
	knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	knob.BorderColor3 = Color3.fromRGB(0, 0, 0)
	knob.BorderSizePixel = 0
	knob.Position = UDim2.new(0, 16, 0.5, 0)
	knob.Selectable = true
	knob.Size = UDim2.fromOffset(18, 18)

	local uICorner2 = Instance.new("UICorner")
	uICorner2.Name = "UICorner"
	uICorner2.CornerRadius = UDim.new(1, 0)
	uICorner2.Parent = knob

	knob.Parent = switch
	switch.Parent = joySwitch

	local box = switch
	local ColorChecked = "#0b6bcb"
	local ColorNormal = "#0b0d0e"

	local function updateColor()
		if box:GetAttribute("Checked") then
			knob:TweenPosition(UDim2.new(0, 16, 0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2)
			box.BackgroundColor3 = Color3.fromHex(ColorChecked)
		else
			knob:TweenPosition(UDim2.new(0, 1, 0.5, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2)
			box.BackgroundColor3 = Color3.fromHex(ColorNormal)
		end
	end

	box:SetAttribute("Checked", Default) -- default 
	if box:GetAttribute("Checked") then
		knob.Position = UDim2.new(0, 16, 0.5, 0)
		box.BackgroundColor3 = Color3.fromHex(ColorChecked)
	else
		knob.Position = UDim2.new(0, 1, 0.5, 0)
		box.BackgroundColor3 = Color3.fromHex(ColorNormal)
	end

	box.MouseButton1Click:Connect(function() 
		box:SetAttribute("Checked", not box:GetAttribute("Checked"))
		updateColor()
		OnCheck(box:GetAttribute("Checked"))
	end)
	
	return joySwitch
end

function _updateExample(value)
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "Updated",
		Text = "To: "..tostring(value)
	})
end
function _clickExample()
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "Clicked",
		Text = "detected a click"
	})
end

function createWindow(options)
	local joyUILibrary = Instance.new("ScreenGui")
	joyUILibrary.Name = "JoyUILibrary" .. math.random(0,10000)
	joyUILibrary.IgnoreGuiInset = true
	joyUILibrary.Enabled = true
	joyUILibrary.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	joyUILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local joyWindow = Instance.new("Frame")
	joyWindow.Name = "JoyWindow"
	joyWindow.AnchorPoint = Vector2.new(0.5, 0.5)
	joyWindow.BackgroundColor3 = Color3.fromRGB(11, 13, 14)
	joyWindow.BorderColor3 = Color3.fromRGB(0, 0, 0)
	joyWindow.BorderSizePixel = 0
	joyWindow.Position = UDim2.fromScale(0.5, 0.5)
	joyWindow.Size = UDim2.fromOffset(500, 340)
	joyWindow.SizeConstraint = Enum.SizeConstraint.RelativeXX

	local titlebar = Instance.new("Frame")
	titlebar.Name = "Titlebar"
	titlebar.BackgroundColor3 = Color3.fromRGB(11, 13, 14)
	titlebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	titlebar.BorderSizePixel = 0
	titlebar.Size = UDim2.new(1, 0, 0, 30)

	local line = Instance.new("Frame")
	line.Name = "Line"
	line.BackgroundColor3 = Color3.fromRGB(50, 56, 62)
	line.BorderColor3 = Color3.fromRGB(0, 0, 0)
	line.BorderSizePixel = 0
	line.Position = UDim2.new(0, 0, 1, -1)
	line.Size = UDim2.new(1, 0, 0, 1)
	line.Parent = titlebar

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 6)
	uICorner.Parent = titlebar

	local title = Instance.new("TextLabel")
	title.Name = "Title"
	title.FontFace = Font.new(
		"rbxassetid://12187365364",
		Enum.FontWeight.ExtraBold,
		Enum.FontStyle.Normal
	)
	title.Text = options.title
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextSize = 18
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1
	title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	title.BorderSizePixel = 0
	title.Position = UDim2.fromOffset(10, 0)
	title.Size = UDim2.new(1, -110, 1, 0)
	title.Parent = titlebar

	local buttons = Instance.new("Frame")
	buttons.Name = "Buttons"
	buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	buttons.BackgroundTransparency = 1
	buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
	buttons.BorderSizePixel = 0
	buttons.Position = UDim2.new(1, -100, 0, 0)
	buttons.Size = UDim2.new(0, 100, 1, 0)

	local line1 = Instance.new("Frame")
	line1.Name = "Line"
	line1.BackgroundColor3 = Color3.fromRGB(50, 56, 62)
	line1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	line1.BorderSizePixel = 0
	line1.Size = UDim2.new(0, 1, 1, -1)
	line1.Parent = buttons

	local line2 = Instance.new("Frame")
	line2.Name = "Line"
	line2.BackgroundColor3 = Color3.fromRGB(50, 56, 62)
	line2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	line2.BorderSizePixel = 0
	line2.Position = UDim2.fromOffset(33, 0)
	line2.Size = UDim2.new(0, 1, 1, -1)
	line2.Parent = buttons

	local line3 = Instance.new("Frame")
	line3.Name = "Line"
	line3.BackgroundColor3 = Color3.fromRGB(50, 56, 62)
	line3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	line3.BorderSizePixel = 0
	line3.Position = UDim2.fromOffset(66, 0)
	line3.Size = UDim2.new(0, 1, 1, -1)
	line3.Parent = buttons

	local minimize = Instance.new("ImageButton")
	minimize.Name = "Minimize"
	minimize.Image = "rbxassetid://7733997941"
	minimize.ScaleType = Enum.ScaleType.Crop
	minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	minimize.BackgroundTransparency = 1
	minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	minimize.BorderSizePixel = 0
	minimize.Position = UDim2.fromOffset(5, 2)
	minimize.Size = UDim2.fromOffset(25, 25)
	minimize.Parent = buttons

	local destroy = Instance.new("ImageButton")
	destroy.Name = "Destroy"
	destroy.Image = "rbxassetid://7743873871"
	destroy.ScaleType = Enum.ScaleType.Crop
	destroy.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	destroy.BackgroundTransparency = 1
	destroy.BorderColor3 = Color3.fromRGB(0, 0, 0)
	destroy.BorderSizePixel = 0
	destroy.Position = UDim2.fromOffset(39, 3)
	destroy.Size = UDim2.fromOffset(23, 23)
	destroy.Parent = buttons

	local close = Instance.new("ImageButton")
	close.Name = "Close"
	close.Image = "rbxassetid://7743878857"
	close.ScaleType = Enum.ScaleType.Crop
	close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	close.BackgroundTransparency = 1
	close.BorderColor3 = Color3.fromRGB(0, 0, 0)
	close.BorderSizePixel = 0
	close.Position = UDim2.fromOffset(71, 2)
	close.Size = UDim2.fromOffset(25, 25)
	close.Parent = buttons

	buttons.Parent = titlebar

	titlebar.Parent = joyWindow

	local uIStroke = Instance.new("UIStroke")
	uIStroke.Name = "UIStroke"
	uIStroke.Color = Color3.fromRGB(50, 56, 62)
	uIStroke.Parent = joyWindow

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.CornerRadius = UDim.new(0, 6)
	uICorner1.Parent = joyWindow

	local content = Instance.new("ScrollingFrame")
	content.Name = "Content"
	content.ScrollBarThickness = 0
	content.BackgroundColor3 = Color3.fromRGB(11, 13, 14)
	content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	content.BorderSizePixel = 0
	content.Position = UDim2.fromOffset(10, 40)
	content.Selectable = false
	content.Size = UDim2.new(1, -20, 1, -50)
	
	minimize.MouseButton1Click:Connect(function() 
		content.Visible = not content.Visible
		uIStroke.Enabled = not uIStroke.Enabled
		joyWindow.BackgroundTransparency = 1 - joyWindow.BackgroundTransparency
	end)
	close.MouseButton1Click:Connect(function()
		joyWindow.Visible = false
	end)
	destroy.MouseButton1Click:Connect(function() 
		joyUILibrary:Destroy()
	end)

	local uICorner2 = Instance.new("UICorner")
	uICorner2.Name = "UICorner"
	uICorner2.CornerRadius = UDim.new(0, 6)
	uICorner2.Parent = content

	content.Parent = joyWindow

	joyWindow.Parent = joyUILibrary
	
	local tabContents = 0
	
	return {
		AddButton = function(TextContent: string, Style: string, Click: any)
			tabContents+=1
			
			local button
			if Style == "normal" then
				button = buttonNormal(tabContents)
			elseif Style == "plain" then
				button = buttonPlain(tabContents)
			elseif Style == "outline" then
				button = buttonOutline(tabContents)
			elseif Style == "soft" then
				button = buttonSoft(tabContents)
			else
				error("Button not of type normal, plain, outline, or soft")
			end
			
			button.Text = TextContent
			button.MouseButton1Click:Connect(Click)
			
			button.Parent = content
		end,
		AddInput = function(Placeholder: string, Default: string, Danger: boolean, Changed: any)
			tabContents+=1
			
			local inputElem = input(Danger, tabContents)
			inputElem.Input.PlaceholderText = Placeholder
			inputElem.Input.Text = Default
			inputElem.Input:GetPropertyChangedSignal("Text"):Connect(function() Changed(inputElem.Input.Text) end)
			
			inputElem.Parent = content
		end,
		AddInputWithButton = function(Placeholder: string, Default: string, ButtonText: string, Changed: any, Click: any)
			tabContents+=1
			
			local elem = inputWithButton(tabContents)
			local button = elem.ButtonInside
			local inp = elem.Input
			
			inp.PlaceholderText = Placeholder
			inp.Text = Default
			button.Text = ButtonText
			
			inp:GetPropertyChangedSignal("Text"):Connect(function() Changed(inp.Text) end)
			button.MouseButton1Click:Connect(Click)
			
			elem.Parent = content
		end,
		AddSwitch = function(Label: string, DefaultChecked: boolean, Changed: any)
			tabContents+=1
			
			local elem = switch(tabContents, DefaultChecked, Changed)
			elem.Label.Text = Label
			elem.Parent = content
		end,
		AddCheckbox = function(Label: string, DefaultChecked: boolean, Changed: any)
			tabContents+=1

			local elem = checkbox(tabContents, DefaultChecked, Changed)
			elem.Label.Text = Label
			elem.Parent = content
		end,
		Init = function()
			joyUILibrary.Parent = RootGUI
		end,
		Destroy = function()
			joyUILibrary:Destroy()
		end,
	}
end

local JoyUI = {}

function JoyUI:createWindow(options)
	return createWindow(options)
end

return JoyUI
