
local mikate = nil
function SetupDarken()
	local darken = Instance.new("ScreenGui")
	darken.Name = "Darken"
	darken.Enabled = true
	darken.ResetOnSpawn = false
	darken.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local frame = Instance.new("Frame")
	frame.Name = "Frame"
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
	frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	frame.BorderSizePixel = 0
	frame.Position = UDim2.fromScale(0.5, 0.5)
	frame.Size = UDim2.fromOffset(573, 304)

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 12)
	uICorner.Parent = frame

	local tabs = Instance.new("Frame")
	tabs.Name = "Tabs"
	tabs.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabs.BorderSizePixel = 0
	tabs.Position = UDim2.fromScale(-0.000338, -0.000411)
	tabs.Size = UDim2.fromOffset(172, 304)

	local scrollingFrame = Instance.new("ScrollingFrame")
	scrollingFrame.Name = "ScrollingFrame"
	scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.XY
	scrollingFrame.BottomImage = ""
	scrollingFrame.MidImage = ""
	scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
	scrollingFrame.ScrollBarImageTransparency = 1
	scrollingFrame.ScrollBarThickness = 4
	scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
	scrollingFrame.TopImage = ""
	scrollingFrame.Active = true
	scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scrollingFrame.BackgroundTransparency = 1
	scrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	scrollingFrame.BorderSizePixel = 0
	scrollingFrame.Position = UDim2.fromScale(0.00112, 0)
	scrollingFrame.Size = UDim2.fromOffset(171, 304)

	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "TextLabel"
	textLabel.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Light,
		Enum.FontStyle.Normal
	)
	textLabel.RichText = true
	textLabel.Text = "Dummy Script"
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.TextScaled = true
	textLabel.TextSize = 14
	textLabel.TextWrapped = true
	textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.BackgroundTransparency = 1
	textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	textLabel.BorderSizePixel = 0
	textLabel.Position = UDim2.fromScale(0.112, 0.023)
	textLabel.Size = UDim2.fromOffset(133, 26)
	textLabel.Parent = scrollingFrame

	local tabButton = Instance.new("TextButton")
	tabButton.Name = "TabButton"
	tabButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabButton.TextSize = 14
	tabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabButton.BackgroundTransparency = 1
	tabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabButton.BorderSizePixel = 0
	tabButton.Position = UDim2.fromScale(0.065, 0.138)
	tabButton.Size = UDim2.fromOffset(148, 26)
	tabButton.Visible = false
	tabButton.Parent = scrollingFrame

	scrollingFrame.Parent = tabs

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.CornerRadius = UDim.new(0, 12)
	uICorner1.Parent = tabs

	tabs.Parent = frame

	local exitBtn = Instance.new("TextButton")
	exitBtn.Name = "ExitBtn"
	exitBtn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	exitBtn.Text = "X"
	exitBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	exitBtn.TextSize = 30
	exitBtn.TextWrapped = true
	exitBtn.BackgroundColor3 = Color3.fromRGB(190, 190, 190)
	exitBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	exitBtn.BorderSizePixel = 0
	exitBtn.Position = UDim2.fromScale(0.97, -0.0526)
	exitBtn.Size = UDim2.fromOffset(33, 33)
	exitBtn.ZIndex = 4

	local uICorner2 = Instance.new("UICorner")
	uICorner2.Name = "UICorner"
	uICorner2.CornerRadius = UDim.new(0, 12)
	uICorner2.Parent = exitBtn

	exitBtn.Parent = frame

	local tabContent = Instance.new("Frame")
	tabContent.Name = "TabContent"
	tabContent.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
	tabContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabContent.BorderSizePixel = 0
	tabContent.Position = UDim2.fromScale(0.3, 0)
	tabContent.Size = UDim2.fromOffset(401, 302)

	local uICorner3 = Instance.new("UICorner")
	uICorner3.Name = "UICorner"
	uICorner3.CornerRadius = UDim.new(0, 12)
	uICorner3.Parent = tabContent

	local tabBtnExample = Instance.new("TextButton")
	tabBtnExample.Name = "TabBtnExample"
	tabBtnExample.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	tabBtnExample.Text = "Button Name"
	tabBtnExample.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabBtnExample.TextSize = 14
	tabBtnExample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabBtnExample.BackgroundTransparency = 0.95
	tabBtnExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabBtnExample.BorderSizePixel = 0
	tabBtnExample.Position = UDim2.fromScale(0.0574, 0.142)
	tabBtnExample.Size = UDim2.fromOffset(354, 33)
	tabBtnExample.Visible = false

	local uICorner4 = Instance.new("UICorner")
	uICorner4.Name = "UICorner"
	uICorner4.Parent = tabBtnExample

	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = "ImageLabel"
	imageLabel.Image = "rbxassetid://12333784627"
	imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel.BackgroundTransparency = 1
	imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	imageLabel.BorderSizePixel = 0
	imageLabel.Position = UDim2.fromScale(0.911, 0.04)
	imageLabel.Size = UDim2.fromOffset(29, 29)
	imageLabel.Parent = tabBtnExample

	tabBtnExample.Parent = tabContent

	local tabToggleExample = Instance.new("TextButton")
	tabToggleExample.Name = "TabToggleExample"
	tabToggleExample.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	tabToggleExample.Text = "Button Name"
	tabToggleExample.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabToggleExample.TextSize = 14
	tabToggleExample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabToggleExample.BackgroundTransparency = 0.95
	tabToggleExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabToggleExample.BorderSizePixel = 0
	tabToggleExample.Position = UDim2.fromScale(0.0574, 0.142)
	tabToggleExample.Size = UDim2.fromOffset(354, 33)
	tabToggleExample.Visible = false

	local uICorner5 = Instance.new("UICorner")
	uICorner5.Name = "UICorner"
	uICorner5.Parent = tabToggleExample

	local imageLabel1 = Instance.new("ImageLabel")
	imageLabel1.Name = "ImageLabel"
	imageLabel1.Image = "rbxassetid://7310154850"
	imageLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel1.BackgroundTransparency = 1
	imageLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	imageLabel1.BorderSizePixel = 0
	imageLabel1.Position = UDim2.fromScale(0.907, 0)
	imageLabel1.Size = UDim2.fromOffset(33, 33)

	local toggle = Instance.new("ImageLabel")
	toggle.Name = "Toggle"
	toggle.Image = "rbxassetid://5825681337"
	toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	toggle.BackgroundTransparency = 1
	toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	toggle.BorderSizePixel = 0
	toggle.Position = UDim2.fromScale(0.182, 0.182)
	toggle.Size = UDim2.fromOffset(21, 21)
	toggle.Visible = false
	toggle.Parent = imageLabel1

	imageLabel1.Parent = tabToggleExample

	tabToggleExample.Parent = tabContent

	local tabSliderExample = Instance.new("Frame")
	tabSliderExample.Name = "TabSliderExample"
	tabSliderExample.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
	tabSliderExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabSliderExample.BorderSizePixel = 0
	tabSliderExample.Position = UDim2.fromScale(0.057, 0.142)
	tabSliderExample.Size = UDim2.fromOffset(354, 33)
	tabSliderExample.Visible = false

	local uICorner6 = Instance.new("UICorner")
	uICorner6.Name = "UICorner"
	uICorner6.Parent = tabSliderExample

	local uIStroke = Instance.new("UIStroke")
	uIStroke.Name = "UIStroke"
	uIStroke.Color = Color3.fromRGB(255, 255, 255)
	uIStroke.Parent = tabSliderExample

	local value = Instance.new("Frame")
	value.Name = "Value"
	value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	value.BorderColor3 = Color3.fromRGB(0, 0, 0)
	value.BorderSizePixel = 0
	value.Position = UDim2.fromScale(-0.00232, -0.00952)
	value.Size = UDim2.fromOffset(0, 33)

	local uICorner7 = Instance.new("UICorner")
	uICorner7.Name = "UICorner"
	uICorner7.Parent = value

	value.Parent = tabSliderExample

	local valueText = Instance.new("TextLabel")
	valueText.Name = "ValueText"
	valueText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	valueText.TextColor3 = Color3.fromRGB(0, 0, 0)
	valueText.TextSize = 19
	valueText.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	valueText.TextStrokeTransparency = 0
	valueText.TextTransparency = 0.3
	valueText.TextXAlignment = Enum.TextXAlignment.Right
	valueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	valueText.BackgroundTransparency = 1
	valueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	valueText.BorderSizePixel = 0
	valueText.Position = UDim2.fromScale(0.41, 0)
	valueText.Size = UDim2.fromOffset(200, 33)

	local uIStroke1 = Instance.new("UIStroke")
	uIStroke1.Name = "UIStroke"
	uIStroke1.Color = Color3.fromRGB(255, 255, 255)
	uIStroke1.Thickness = 1.5
	uIStroke1.Parent = valueText

	valueText.Parent = tabSliderExample

	tabSliderExample.Parent = tabContent

	local tabLabelExample = Instance.new("TextLabel")
	tabLabelExample.Name = "TabLabelExample"
	tabLabelExample.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	tabLabelExample.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabLabelExample.TextSize = 22
	tabLabelExample.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	tabLabelExample.TextWrapped = true
	tabLabelExample.TextXAlignment = Enum.TextXAlignment.Left
	tabLabelExample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabLabelExample.BackgroundTransparency = 0.95
	tabLabelExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabLabelExample.BorderSizePixel = 0
	tabLabelExample.Position = UDim2.fromScale(0.057, 0.142)
	tabLabelExample.Size = UDim2.fromOffset(354, 33)
	tabLabelExample.Visible = false

	local uICorner8 = Instance.new("UICorner")
	uICorner8.Name = "UICorner"
	uICorner8.Parent = tabLabelExample

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingLeft = UDim.new(0, 10)
	uIPadding.Parent = tabLabelExample

	tabLabelExample.Parent = tabContent

	local tabTextExample = Instance.new("Frame")
	tabTextExample.Name = "TabTextExample"
	tabTextExample.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
	tabTextExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabTextExample.BorderSizePixel = 0
	tabTextExample.Position = UDim2.fromScale(0.057, 0.142)
	tabTextExample.Size = UDim2.fromOffset(354, 33)
	tabTextExample.Visible = false

	local uICorner9 = Instance.new("UICorner")
	uICorner9.Name = "UICorner"
	uICorner9.Parent = tabTextExample

	local uIStroke2 = Instance.new("UIStroke")
	uIStroke2.Name = "UIStroke"
	uIStroke2.Color = Color3.fromRGB(255, 255, 255)
	uIStroke2.Thickness = 0.6
	uIStroke2.Parent = tabTextExample

	local valueText1 = Instance.new("TextLabel")
	valueText1.Name = "ValueText"
	valueText1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	valueText1.TextColor3 = Color3.fromRGB(255, 255, 255)
	valueText1.TextSize = 19
	valueText1.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	valueText1.TextXAlignment = Enum.TextXAlignment.Left
	valueText1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	valueText1.BackgroundTransparency = 1
	valueText1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	valueText1.BorderSizePixel = 0
	valueText1.Size = UDim2.fromScale(0.5, 1)

	local uIPadding1 = Instance.new("UIPadding")
	uIPadding1.Name = "UIPadding"
	uIPadding1.PaddingLeft = UDim.new(0, 10)
	uIPadding1.Parent = valueText1

	valueText1.Parent = tabTextExample

	local content = Instance.new("TextBox")
	content.Name = "Content"
	content.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json")
	content.PlaceholderColor3 = Color3.fromRGB(186, 186, 186)
	content.PlaceholderText = "Label..."
	content.Text = ""
	content.TextColor3 = Color3.fromRGB(255, 255, 255)
	content.TextSize = 14
	content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	content.BackgroundTransparency = 0.9
	content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	content.BorderSizePixel = 0
	content.Position = UDim2.fromScale(0.5, 0)
	content.Size = UDim2.fromScale(0.5, 1)
	content.Parent = tabTextExample

	tabTextExample.Parent = tabContent

	tabContent.Parent = frame

	local minBtn = Instance.new("TextButton")
	minBtn.Name = "MinBtn"
	minBtn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	minBtn.Text = "-"
	minBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	minBtn.TextSize = 43
	minBtn.TextWrapped = true
	minBtn.BackgroundColor3 = Color3.fromRGB(190, 190, 190)
	minBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	minBtn.BorderSizePixel = 0
	minBtn.Position = UDim2.fromScale(0.902, -0.0526)
	minBtn.Size = UDim2.fromOffset(33, 33)
	minBtn.ZIndex = 4

	local uICorner10 = Instance.new("UICorner")
	uICorner10.Name = "UICorner"
	uICorner10.CornerRadius = UDim.new(0, 12)
	uICorner10.Parent = minBtn

	minBtn.Parent = frame

	local bgframe = Instance.new("Frame")
	bgframe.Name = "Bgframe"
	bgframe.BackgroundColor3 = Color3.fromRGB(121, 121, 121)
	bgframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bgframe.BorderSizePixel = 0
	bgframe.Position = UDim2.fromScale(0.89, -0.0757)
	bgframe.Size = UDim2.fromOffset(87, 49)
	bgframe.ZIndex = 3

	local uICorner11 = Instance.new("UICorner")
	uICorner11.Name = "UICorner"
	uICorner11.CornerRadius = UDim.new(0, 15)
	uICorner11.Parent = bgframe

	bgframe.Parent = frame

	frame.Parent = darken

	local loadingFrame = Instance.new("Frame")
	loadingFrame.Name = "LoadingFrame"
	loadingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	loadingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	loadingFrame.BorderSizePixel = 0
	loadingFrame.Position = UDim2.fromScale(0.454, 0.506)
	loadingFrame.Size = UDim2.fromOffset(127, 50)
	loadingFrame.Visible = false

	local textLabel1 = Instance.new("TextLabel")
	textLabel1.Name = "TextLabel"
	textLabel1.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
	textLabel1.Text = "Mika UI"
	textLabel1.TextColor3 = Color3.fromRGB(0, 0, 0)
	textLabel1.TextSize = 27
	textLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel1.BackgroundTransparency = 1
	textLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	textLabel1.BorderSizePixel = 0
	textLabel1.Position = UDim2.fromScale(-0.00439, 0)
	textLabel1.Size = UDim2.fromOffset(124, 50)
	textLabel1.Parent = loadingFrame

	local uICorner12 = Instance.new("UICorner")
	uICorner12.Name = "UICorner"
	uICorner12.Parent = loadingFrame

	loadingFrame.Parent = darken
	
	mikate = darken
	darken.Parent = game.Players.LocalPlayer.PlayerGui
end
function SetupBlackout()
	local blackout = Instance.new("ScreenGui")
	blackout.Name = "Blackout"
	blackout.Enabled = true
	blackout.ResetOnSpawn = false
	blackout.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local frame = Instance.new("Frame")
	frame.Name = "Frame"
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	frame.BorderSizePixel = 0
	frame.Position = UDim2.fromScale(0.5, 0.5)
	frame.Size = UDim2.fromOffset(573, 304)

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 12)
	uICorner.Parent = frame

	local tabs = Instance.new("Frame")
	tabs.Name = "Tabs"
	tabs.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabs.BorderSizePixel = 0
	tabs.Position = UDim2.fromScale(-0.000338, -0.000411)
	tabs.Size = UDim2.fromOffset(172, 304)

	local scrollingFrame = Instance.new("ScrollingFrame")
	scrollingFrame.Name = "ScrollingFrame"
	scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.XY
	scrollingFrame.BottomImage = ""
	scrollingFrame.MidImage = ""
	scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
	scrollingFrame.ScrollBarImageTransparency = 1
	scrollingFrame.ScrollBarThickness = 4
	scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
	scrollingFrame.TopImage = ""
	scrollingFrame.Active = true
	scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scrollingFrame.BackgroundTransparency = 1
	scrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	scrollingFrame.BorderSizePixel = 0
	scrollingFrame.Position = UDim2.fromScale(0.00112, 0)
	scrollingFrame.Size = UDim2.fromOffset(171, 304)

	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "TextLabel"
	textLabel.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Light,
		Enum.FontStyle.Normal
	)
	textLabel.RichText = true
	textLabel.Text = "Dummy Script"
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.TextScaled = true
	textLabel.TextSize = 14
	textLabel.TextWrapped = true
	textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.BackgroundTransparency = 1
	textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	textLabel.BorderSizePixel = 0
	textLabel.Position = UDim2.fromScale(0.112, 0.023)
	textLabel.Size = UDim2.fromOffset(133, 26)
	textLabel.Parent = scrollingFrame

	local tabButton = Instance.new("TextButton")
	tabButton.Name = "TabButton"
	tabButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabButton.TextSize = 14
	tabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabButton.BackgroundTransparency = 1
	tabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabButton.BorderSizePixel = 0
	tabButton.Position = UDim2.fromScale(0.065, 0.138)
	tabButton.Size = UDim2.fromOffset(148, 26)
	tabButton.Visible = false
	tabButton.Parent = scrollingFrame

	scrollingFrame.Parent = tabs

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.CornerRadius = UDim.new(0, 12)
	uICorner1.Parent = tabs

	tabs.Parent = frame

	local exitBtn = Instance.new("TextButton")
	exitBtn.Name = "ExitBtn"
	exitBtn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	exitBtn.Text = "X"
	exitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	exitBtn.TextSize = 30
	exitBtn.TextWrapped = true
	exitBtn.BackgroundColor3 = Color3.fromRGB(83, 83, 83)
	exitBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	exitBtn.BorderSizePixel = 0
	exitBtn.Position = UDim2.fromScale(0.97, -0.0526)
	exitBtn.Size = UDim2.fromOffset(33, 33)
	exitBtn.ZIndex = 4

	local uICorner2 = Instance.new("UICorner")
	uICorner2.Name = "UICorner"
	uICorner2.CornerRadius = UDim.new(0, 12)
	uICorner2.Parent = exitBtn

	exitBtn.Parent = frame

	local tabContent = Instance.new("Frame")
	tabContent.Name = "TabContent"
	tabContent.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	tabContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabContent.BorderSizePixel = 0
	tabContent.Position = UDim2.fromScale(0.3, 0)
	tabContent.Size = UDim2.fromOffset(401, 302)

	local uICorner3 = Instance.new("UICorner")
	uICorner3.Name = "UICorner"
	uICorner3.CornerRadius = UDim.new(0, 12)
	uICorner3.Parent = tabContent

	local tabBtnExample = Instance.new("TextButton")
	tabBtnExample.Name = "TabBtnExample"
	tabBtnExample.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	tabBtnExample.Text = "Button Name"
	tabBtnExample.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabBtnExample.TextSize = 14
	tabBtnExample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabBtnExample.BackgroundTransparency = 0.98
	tabBtnExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabBtnExample.BorderSizePixel = 0
	tabBtnExample.Position = UDim2.fromScale(0.0574, 0.142)
	tabBtnExample.Size = UDim2.fromOffset(354, 33)
	tabBtnExample.Visible = false

	local uICorner4 = Instance.new("UICorner")
	uICorner4.Name = "UICorner"
	uICorner4.Parent = tabBtnExample

	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = "ImageLabel"
	imageLabel.Image = "rbxassetid://12333784627"
	imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel.BackgroundTransparency = 1
	imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	imageLabel.BorderSizePixel = 0
	imageLabel.Position = UDim2.fromScale(0.911, 0.04)
	imageLabel.Size = UDim2.fromOffset(29, 29)
	imageLabel.Parent = tabBtnExample

	tabBtnExample.Parent = tabContent

	local tabToggleExample = Instance.new("TextButton")
	tabToggleExample.Name = "TabToggleExample"
	tabToggleExample.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	tabToggleExample.Text = "Button Name"
	tabToggleExample.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabToggleExample.TextSize = 14
	tabToggleExample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabToggleExample.BackgroundTransparency = 0.98
	tabToggleExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabToggleExample.BorderSizePixel = 0
	tabToggleExample.Position = UDim2.fromScale(0.0574, 0.142)
	tabToggleExample.Size = UDim2.fromOffset(354, 33)
	tabToggleExample.Visible = false

	local uICorner5 = Instance.new("UICorner")
	uICorner5.Name = "UICorner"
	uICorner5.Parent = tabToggleExample

	local imageLabel1 = Instance.new("ImageLabel")
	imageLabel1.Name = "ImageLabel"
	imageLabel1.Image = "rbxassetid://7310154850"
	imageLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel1.BackgroundTransparency = 1
	imageLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	imageLabel1.BorderSizePixel = 0
	imageLabel1.Position = UDim2.fromScale(0.907, 0)
	imageLabel1.Size = UDim2.fromOffset(33, 33)

	local toggle = Instance.new("ImageLabel")
	toggle.Name = "Toggle"
	toggle.Image = "rbxassetid://5825681337"
	toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	toggle.BackgroundTransparency = 1
	toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	toggle.BorderSizePixel = 0
	toggle.Position = UDim2.fromScale(0.182, 0.182)
	toggle.Size = UDim2.fromOffset(21, 21)
	toggle.Visible = false
	toggle.Parent = imageLabel1

	imageLabel1.Parent = tabToggleExample

	tabToggleExample.Parent = tabContent

	local tabSliderExample = Instance.new("Frame")
	tabSliderExample.Name = "TabSliderExample"
	tabSliderExample.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
	tabSliderExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabSliderExample.BorderSizePixel = 0
	tabSliderExample.Position = UDim2.fromScale(0.057, 0.142)
	tabSliderExample.Size = UDim2.fromOffset(354, 33)
	tabSliderExample.Visible = false

	local uICorner6 = Instance.new("UICorner")
	uICorner6.Name = "UICorner"
	uICorner6.Parent = tabSliderExample

	local uIStroke = Instance.new("UIStroke")
	uIStroke.Name = "UIStroke"
	uIStroke.Color = Color3.fromRGB(255, 255, 255)
	uIStroke.Thickness = 0.6
	uIStroke.Parent = tabSliderExample

	local value = Instance.new("Frame")
	value.Name = "Value"
	value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	value.BorderColor3 = Color3.fromRGB(0, 0, 0)
	value.BorderSizePixel = 0
	value.Position = UDim2.fromScale(-0.00232, -0.00952)
	value.Size = UDim2.fromOffset(0, 33)

	local uICorner7 = Instance.new("UICorner")
	uICorner7.Name = "UICorner"
	uICorner7.Parent = value

	value.Parent = tabSliderExample

	local valueText = Instance.new("TextLabel")
	valueText.Name = "ValueText"
	valueText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	valueText.TextColor3 = Color3.fromRGB(255, 255, 255)
	valueText.TextSize = 19
	valueText.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	valueText.TextStrokeTransparency = 0
	valueText.TextTransparency = 0.3
	valueText.TextXAlignment = Enum.TextXAlignment.Right
	valueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	valueText.BackgroundTransparency = 1
	valueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	valueText.BorderSizePixel = 0
	valueText.Position = UDim2.fromScale(0.41, 0)
	valueText.Size = UDim2.fromOffset(200, 33)

	local uIStroke1 = Instance.new("UIStroke")
	uIStroke1.Name = "UIStroke"
	uIStroke1.Transparency = 0.5
	uIStroke1.Parent = valueText

	valueText.Parent = tabSliderExample

	tabSliderExample.Parent = tabContent

	local tabLabelExample = Instance.new("TextLabel")
	tabLabelExample.Name = "TabLabelExample"
	tabLabelExample.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	tabLabelExample.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabLabelExample.TextSize = 22
	tabLabelExample.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	tabLabelExample.TextWrapped = true
	tabLabelExample.TextXAlignment = Enum.TextXAlignment.Left
	tabLabelExample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabLabelExample.BackgroundTransparency = 0.98
	tabLabelExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabLabelExample.BorderSizePixel = 0
	tabLabelExample.Position = UDim2.fromScale(0.057, 0.142)
	tabLabelExample.Size = UDim2.fromOffset(354, 33)
	tabLabelExample.Visible = false

	local uICorner8 = Instance.new("UICorner")
	uICorner8.Name = "UICorner"
	uICorner8.Parent = tabLabelExample

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingLeft = UDim.new(0, 10)
	uIPadding.Parent = tabLabelExample

	tabLabelExample.Parent = tabContent

	local tabTextExample = Instance.new("Frame")
	tabTextExample.Name = "TabTextExample"
	tabTextExample.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
	tabTextExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabTextExample.BorderSizePixel = 0
	tabTextExample.Position = UDim2.fromScale(0.057, 0.142)
	tabTextExample.Size = UDim2.fromOffset(354, 33)
	tabTextExample.Visible = false

	local uICorner9 = Instance.new("UICorner")
	uICorner9.Name = "UICorner"
	uICorner9.Parent = tabTextExample

	local uIStroke2 = Instance.new("UIStroke")
	uIStroke2.Name = "UIStroke"
	uIStroke2.Color = Color3.fromRGB(255, 255, 255)
	uIStroke2.Thickness = 0.6
	uIStroke2.Parent = tabTextExample

	local valueText1 = Instance.new("TextLabel")
	valueText1.Name = "ValueText"
	valueText1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	valueText1.TextColor3 = Color3.fromRGB(255, 255, 255)
	valueText1.TextSize = 19
	valueText1.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	valueText1.TextXAlignment = Enum.TextXAlignment.Left
	valueText1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	valueText1.BackgroundTransparency = 1
	valueText1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	valueText1.BorderSizePixel = 0
	valueText1.Size = UDim2.fromScale(0.5, 1)

	local uIPadding1 = Instance.new("UIPadding")
	uIPadding1.Name = "UIPadding"
	uIPadding1.PaddingLeft = UDim.new(0, 10)
	uIPadding1.Parent = valueText1

	valueText1.Parent = tabTextExample

	local content = Instance.new("TextBox")
	content.Name = "Content"
	content.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json")
	content.PlaceholderColor3 = Color3.fromRGB(186, 186, 186)
	content.PlaceholderText = "Label..."
	content.Text = ""
	content.TextColor3 = Color3.fromRGB(255, 255, 255)
	content.TextSize = 14
	content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	content.BackgroundTransparency = 0.9
	content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	content.BorderSizePixel = 0
	content.Position = UDim2.fromScale(0.5, 0)
	content.Size = UDim2.fromScale(0.5, 1)
	content.Parent = tabTextExample

	tabTextExample.Parent = tabContent

	tabContent.Parent = frame

	local minBtn = Instance.new("TextButton")
	minBtn.Name = "MinBtn"
	minBtn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	minBtn.Text = "-"
	minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	minBtn.TextSize = 43
	minBtn.TextWrapped = true
	minBtn.BackgroundColor3 = Color3.fromRGB(83, 83, 83)
	minBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	minBtn.BorderSizePixel = 0
	minBtn.Position = UDim2.fromScale(0.902, -0.053)
	minBtn.Size = UDim2.fromOffset(33, 33)
	minBtn.ZIndex = 4

	local uICorner10 = Instance.new("UICorner")
	uICorner10.Name = "UICorner"
	uICorner10.CornerRadius = UDim.new(0, 12)
	uICorner10.Parent = minBtn

	minBtn.Parent = frame

	local bgframe = Instance.new("Frame")
	bgframe.Name = "Bgframe"
	bgframe.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
	bgframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bgframe.BorderSizePixel = 0
	bgframe.Position = UDim2.fromScale(0.89, -0.0757)
	bgframe.Size = UDim2.fromOffset(87, 49)
	bgframe.ZIndex = 3

	local uICorner11 = Instance.new("UICorner")
	uICorner11.Name = "UICorner"
	uICorner11.CornerRadius = UDim.new(0, 15)
	uICorner11.Parent = bgframe

	bgframe.Parent = frame

	local seperator = Instance.new("Frame")
	seperator.Name = "Seperator"
	seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	seperator.BorderColor3 = Color3.fromRGB(0, 0, 0)
	seperator.BorderSizePixel = 0
	seperator.Position = UDim2.fromOffset(172, 0)
	seperator.Size = UDim2.new(0, 2, 1, 0)
	seperator.ZIndex = 6.97e+05
	seperator.Parent = frame

	frame.Parent = blackout

	local loadingFrame = Instance.new("Frame")
	loadingFrame.Name = "LoadingFrame"
	loadingFrame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
	loadingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	loadingFrame.BorderSizePixel = 0
	loadingFrame.Position = UDim2.fromScale(0.454, 0.506)
	loadingFrame.Size = UDim2.fromOffset(127, 50)
	loadingFrame.Visible = false

	local textLabel1 = Instance.new("TextLabel")
	textLabel1.Name = "TextLabel"
	textLabel1.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
	textLabel1.Text = "Mika UI"
	textLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel1.TextSize = 27
	textLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel1.BackgroundTransparency = 1
	textLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	textLabel1.BorderSizePixel = 0
	textLabel1.Position = UDim2.fromScale(-0.00439, 0)
	textLabel1.Size = UDim2.fromOffset(128, 50)
	textLabel1.Parent = loadingFrame

	local uICorner12 = Instance.new("UICorner")
	uICorner12.Name = "UICorner"
	uICorner12.CornerRadius = UDim.new(0, 15)
	uICorner12.Parent = loadingFrame

	loadingFrame.Parent = blackout
	
	mikate = blackout
	mikate.Parent = game.Players.LocalPlayer.PlayerGui
end
function SetupSunshine()
	local sunshine = Instance.new("ScreenGui")
	sunshine.Name = "Sunshine"
	sunshine.Enabled = true
	sunshine.ResetOnSpawn = false
	sunshine.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local frame = Instance.new("Frame")
	frame.Name = "Frame"
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.BackgroundColor3 = Color3.fromRGB(222, 197, 153)
	frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	frame.BorderSizePixel = 0
	frame.Position = UDim2.fromScale(0.5, 0.5)
	frame.Size = UDim2.fromOffset(573, 304)

	local uICorner = Instance.new("UICorner")
	uICorner.Name = "UICorner"
	uICorner.CornerRadius = UDim.new(0, 12)
	uICorner.Parent = frame

	local tabs = Instance.new("Frame")
	tabs.Name = "Tabs"
	tabs.BackgroundColor3 = Color3.fromRGB(153, 136, 106)
	tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabs.BorderSizePixel = 0
	tabs.Position = UDim2.fromScale(-0.000338, -0.000411)
	tabs.Size = UDim2.fromOffset(172, 304)

	local scrollingFrame = Instance.new("ScrollingFrame")
	scrollingFrame.Name = "ScrollingFrame"
	scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.XY
	scrollingFrame.BottomImage = ""
	scrollingFrame.MidImage = ""
	scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
	scrollingFrame.ScrollBarImageTransparency = 1
	scrollingFrame.ScrollBarThickness = 4
	scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
	scrollingFrame.TopImage = ""
	scrollingFrame.Active = true
	scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scrollingFrame.BackgroundTransparency = 1
	scrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	scrollingFrame.BorderSizePixel = 0
	scrollingFrame.Position = UDim2.fromScale(0.00112, 0)
	scrollingFrame.Size = UDim2.fromOffset(171, 304)

	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "TextLabel"
	textLabel.FontFace = Font.new(
		"rbxasset://fonts/families/GothamSSm.json",
		Enum.FontWeight.Light,
		Enum.FontStyle.Normal
	)
	textLabel.RichText = true
	textLabel.Text = "Dummy Script"
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.TextScaled = true
	textLabel.TextSize = 14
	textLabel.TextWrapped = true
	textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.BackgroundTransparency = 1
	textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	textLabel.BorderSizePixel = 0
	textLabel.Position = UDim2.fromScale(0.112, 0.023)
	textLabel.Size = UDim2.fromOffset(133, 26)
	textLabel.Parent = scrollingFrame

	local tabButton = Instance.new("TextButton")
	tabButton.Name = "TabButton"
	tabButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabButton.TextSize = 14
	tabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tabButton.BackgroundTransparency = 1
	tabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabButton.BorderSizePixel = 0
	tabButton.Position = UDim2.fromScale(0.065, 0.138)
	tabButton.Size = UDim2.fromOffset(148, 26)
	tabButton.Visible = false
	tabButton.Parent = scrollingFrame

	scrollingFrame.Parent = tabs

	local uICorner1 = Instance.new("UICorner")
	uICorner1.Name = "UICorner"
	uICorner1.CornerRadius = UDim.new(0, 12)
	uICorner1.Parent = tabs

	tabs.Parent = frame

	local exitBtn = Instance.new("TextButton")
	exitBtn.Name = "ExitBtn"
	exitBtn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	exitBtn.Text = "X"
	exitBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	exitBtn.TextSize = 30
	exitBtn.TextWrapped = true
	exitBtn.BackgroundColor3 = Color3.fromRGB(253, 248, 220)
	exitBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	exitBtn.BorderSizePixel = 0
	exitBtn.Position = UDim2.fromScale(0.97, -0.0526)
	exitBtn.Size = UDim2.fromOffset(33, 33)
	exitBtn.ZIndex = 4

	local uICorner2 = Instance.new("UICorner")
	uICorner2.Name = "UICorner"
	uICorner2.CornerRadius = UDim.new(0, 12)
	uICorner2.Parent = exitBtn

	exitBtn.Parent = frame

	local tabContent = Instance.new("Frame")
	tabContent.Name = "TabContent"
	tabContent.BackgroundColor3 = Color3.fromRGB(222, 197, 153)
	tabContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabContent.BorderSizePixel = 0
	tabContent.Position = UDim2.fromScale(0.3, 0)
	tabContent.Size = UDim2.fromOffset(401, 302)

	local uICorner3 = Instance.new("UICorner")
	uICorner3.Name = "UICorner"
	uICorner3.CornerRadius = UDim.new(0, 12)
	uICorner3.Parent = tabContent

	local tabBtnExample = Instance.new("TextButton")
	tabBtnExample.Name = "TabBtnExample"
	tabBtnExample.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	tabBtnExample.Text = "Button Name"
	tabBtnExample.TextColor3 = Color3.fromRGB(0, 0, 0)
	tabBtnExample.TextSize = 14
	tabBtnExample.BackgroundColor3 = Color3.fromRGB(247, 238, 191)
	tabBtnExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabBtnExample.BorderSizePixel = 0
	tabBtnExample.Position = UDim2.fromScale(0.0574, 0.142)
	tabBtnExample.Size = UDim2.fromOffset(354, 33)
	tabBtnExample.Visible = false

	local uICorner4 = Instance.new("UICorner")
	uICorner4.Name = "UICorner"
	uICorner4.Parent = tabBtnExample

	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Name = "ImageLabel"
	imageLabel.Image = "rbxassetid://12333784627"
	imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel.BackgroundTransparency = 1
	imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	imageLabel.BorderSizePixel = 0
	imageLabel.Position = UDim2.fromScale(0.911, 0.04)
	imageLabel.Size = UDim2.fromOffset(29, 29)
	imageLabel.Parent = tabBtnExample

	tabBtnExample.Parent = tabContent

	local tabToggleExample = Instance.new("TextButton")
	tabToggleExample.Name = "TabToggleExample"
	tabToggleExample.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	tabToggleExample.Text = "Button Name"
	tabToggleExample.TextColor3 = Color3.fromRGB(0, 0, 0)
	tabToggleExample.TextSize = 14
	tabToggleExample.BackgroundColor3 = Color3.fromRGB(247, 238, 191)
	tabToggleExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabToggleExample.BorderSizePixel = 0
	tabToggleExample.Position = UDim2.fromScale(0.0574, 0.142)
	tabToggleExample.Size = UDim2.fromOffset(354, 33)
	tabToggleExample.Visible = false

	local uICorner5 = Instance.new("UICorner")
	uICorner5.Name = "UICorner"
	uICorner5.Parent = tabToggleExample

	local imageLabel1 = Instance.new("ImageLabel")
	imageLabel1.Name = "ImageLabel"
	imageLabel1.Image = "rbxassetid://7310154850"
	imageLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	imageLabel1.BackgroundTransparency = 1
	imageLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	imageLabel1.BorderSizePixel = 0
	imageLabel1.Position = UDim2.fromScale(0.907, 0)
	imageLabel1.Size = UDim2.fromOffset(33, 33)

	local toggle = Instance.new("ImageLabel")
	toggle.Name = "Toggle"
	toggle.Image = "rbxassetid://5825681337"
	toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	toggle.BackgroundTransparency = 1
	toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	toggle.BorderSizePixel = 0
	toggle.Position = UDim2.fromScale(0.182, 0.182)
	toggle.Size = UDim2.fromOffset(21, 21)
	toggle.Visible = false
	toggle.Parent = imageLabel1

	imageLabel1.Parent = tabToggleExample

	tabToggleExample.Parent = tabContent

	local tabSliderExample = Instance.new("Frame")
	tabSliderExample.Name = "TabSliderExample"
	tabSliderExample.BackgroundColor3 = Color3.fromRGB(247, 238, 191)
	tabSliderExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabSliderExample.BorderSizePixel = 0
	tabSliderExample.Position = UDim2.fromScale(0.057, 0.142)
	tabSliderExample.Size = UDim2.fromOffset(354, 33)
	tabSliderExample.Visible = false

	local uICorner6 = Instance.new("UICorner")
	uICorner6.Name = "UICorner"
	uICorner6.Parent = tabSliderExample

	local uIStroke = Instance.new("UIStroke")
	uIStroke.Name = "UIStroke"
	uIStroke.Color = Color3.fromRGB(255, 255, 255)
	uIStroke.Parent = tabSliderExample

	local value = Instance.new("Frame")
	value.Name = "Value"
	value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	value.BorderColor3 = Color3.fromRGB(0, 0, 0)
	value.BorderSizePixel = 0
	value.Position = UDim2.fromScale(-0.00232, -0.00952)
	value.Size = UDim2.fromOffset(0, 33)

	local uICorner7 = Instance.new("UICorner")
	uICorner7.Name = "UICorner"
	uICorner7.Parent = value

	value.Parent = tabSliderExample

	local valueText = Instance.new("TextLabel")
	valueText.Name = "ValueText"
	valueText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	valueText.TextColor3 = Color3.fromRGB(0, 0, 0)
	valueText.TextSize = 19
	valueText.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	valueText.TextStrokeTransparency = 0
	valueText.TextTransparency = 0.3
	valueText.TextXAlignment = Enum.TextXAlignment.Right
	valueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	valueText.BackgroundTransparency = 1
	valueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	valueText.BorderSizePixel = 0
	valueText.Position = UDim2.fromScale(0.41, 0)
	valueText.Size = UDim2.fromOffset(200, 33)

	local uIStroke1 = Instance.new("UIStroke")
	uIStroke1.Name = "UIStroke"
	uIStroke1.Color = Color3.fromRGB(255, 255, 255)
	uIStroke1.Parent = valueText

	valueText.Parent = tabSliderExample

	tabSliderExample.Parent = tabContent

	local tabLabelExample = Instance.new("TextLabel")
	tabLabelExample.Name = "TabLabelExample"
	tabLabelExample.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	tabLabelExample.TextColor3 = Color3.fromRGB(0, 0, 0)
	tabLabelExample.TextSize = 22
	tabLabelExample.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	tabLabelExample.TextWrapped = true
	tabLabelExample.TextXAlignment = Enum.TextXAlignment.Left
	tabLabelExample.BackgroundColor3 = Color3.fromRGB(247, 238, 191)
	tabLabelExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabLabelExample.BorderSizePixel = 0
	tabLabelExample.Position = UDim2.fromScale(0.057, 0.142)
	tabLabelExample.Size = UDim2.fromOffset(354, 33)
	tabLabelExample.Visible = false

	local uICorner8 = Instance.new("UICorner")
	uICorner8.Name = "UICorner"
	uICorner8.Parent = tabLabelExample

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingLeft = UDim.new(0, 10)
	uIPadding.Parent = tabLabelExample

	tabLabelExample.Parent = tabContent

	local tabTextExample = Instance.new("Frame")
	tabTextExample.Name = "TabTextExample"
	tabTextExample.BackgroundColor3 = Color3.fromRGB(247, 238, 191)
	tabTextExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tabTextExample.BorderSizePixel = 0
	tabTextExample.Position = UDim2.fromScale(0.057, 0.142)
	tabTextExample.Size = UDim2.fromOffset(354, 33)
	tabTextExample.Visible = false

	local uICorner9 = Instance.new("UICorner")
	uICorner9.Name = "UICorner"
	uICorner9.Parent = tabTextExample

	local uIStroke2 = Instance.new("UIStroke")
	uIStroke2.Name = "UIStroke"
	uIStroke2.Color = Color3.fromRGB(255, 255, 255)
	uIStroke2.Thickness = 0.6
	uIStroke2.Parent = tabTextExample

	local valueText1 = Instance.new("TextLabel")
	valueText1.Name = "ValueText"
	valueText1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	valueText1.TextColor3 = Color3.fromRGB(0, 0, 0)
	valueText1.TextSize = 19
	valueText1.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	valueText1.TextXAlignment = Enum.TextXAlignment.Left
	valueText1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	valueText1.BackgroundTransparency = 1
	valueText1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	valueText1.BorderSizePixel = 0
	valueText1.Size = UDim2.fromScale(0.5, 1)

	local uIPadding1 = Instance.new("UIPadding")
	uIPadding1.Name = "UIPadding"
	uIPadding1.PaddingLeft = UDim.new(0, 10)
	uIPadding1.Parent = valueText1

	valueText1.Parent = tabTextExample

	local content = Instance.new("TextBox")
	content.Name = "Content"
	content.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json")
	content.PlaceholderColor3 = Color3.fromRGB(90, 90, 90)
	content.PlaceholderText = "Label..."
	content.Text = ""
	content.TextColor3 = Color3.fromRGB(0, 0, 0)
	content.TextSize = 14
	content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	content.BackgroundTransparency = 0.9
	content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	content.BorderSizePixel = 0
	content.Position = UDim2.fromScale(0.5, 0)
	content.Size = UDim2.fromScale(0.5, 1)
	content.Parent = tabTextExample

	tabTextExample.Parent = tabContent

	tabContent.Parent = frame

	local minBtn = Instance.new("TextButton")
	minBtn.Name = "MinBtn"
	minBtn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
	minBtn.Text = "-"
	minBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
	minBtn.TextSize = 43
	minBtn.TextWrapped = true
	minBtn.BackgroundColor3 = Color3.fromRGB(253, 248, 220)
	minBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	minBtn.BorderSizePixel = 0
	minBtn.Position = UDim2.fromScale(0.902, -0.0526)
	minBtn.Size = UDim2.fromOffset(33, 33)
	minBtn.ZIndex = 4

	local uICorner10 = Instance.new("UICorner")
	uICorner10.Name = "UICorner"
	uICorner10.CornerRadius = UDim.new(0, 12)
	uICorner10.Parent = minBtn

	minBtn.Parent = frame

	local bgframe = Instance.new("Frame")
	bgframe.Name = "Bgframe"
	bgframe.BackgroundColor3 = Color3.fromRGB(179, 151, 122)
	bgframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bgframe.BorderSizePixel = 0
	bgframe.Position = UDim2.fromScale(0.89, -0.0757)
	bgframe.Size = UDim2.fromOffset(87, 49)
	bgframe.ZIndex = 3

	local uICorner11 = Instance.new("UICorner")
	uICorner11.Name = "UICorner"
	uICorner11.CornerRadius = UDim.new(0, 15)
	uICorner11.Parent = bgframe

	bgframe.Parent = frame

	frame.Parent = sunshine

	local loadingFrame = Instance.new("Frame")
	loadingFrame.Name = "LoadingFrame"
	loadingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	loadingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	loadingFrame.BorderSizePixel = 0
	loadingFrame.Position = UDim2.fromScale(0.454, 0.506)
	loadingFrame.Size = UDim2.fromOffset(127, 50)
	loadingFrame.Visible = false

	local textLabel1 = Instance.new("TextLabel")
	textLabel1.Name = "TextLabel"
	textLabel1.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
	textLabel1.Text = "Mika UI"
	textLabel1.TextColor3 = Color3.fromRGB(0, 0, 0)
	textLabel1.TextSize = 27
	textLabel1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	textLabel1.BackgroundTransparency = 1
	textLabel1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	textLabel1.BorderSizePixel = 0
	textLabel1.Position = UDim2.fromScale(-0.00439, 0)
	textLabel1.Size = UDim2.fromOffset(124, 50)
	textLabel1.Parent = loadingFrame

	local uICorner12 = Instance.new("UICorner")
	uICorner12.Name = "UICorner"
	uICorner12.Parent = loadingFrame

	loadingFrame.Parent = sunshine
	
	mikate = sunshine
	sunshine.Parent = game.Players.LocalPlayer.PlayerGui
end


if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Darken") then
	game.Players.LocalPlayer.PlayerGui:FindFirstChild("Darken"):Destroy()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Mika Script Already Loaded",
		Text = "We have deleted your previously loaded MikaUI script."
	})
end
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Blackout") then
	game.Players.LocalPlayer.PlayerGui:FindFirstChild("Blackout"):Destroy()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Mika Script Already Loaded",
		Text = "We have deleted your previously loaded MikaUI script."
	})
end
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Sunshine") then
	game.Players.LocalPlayer.PlayerGui:FindFirstChild("Sunshine"):Destroy()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Mika Script Already Loaded",
		Text = "We have deleted your previously loaded MikaUI script."
	})
end


if game.Players.LocalPlayer:GetAttribute("themeOfMika") == "Darken" or game.Players.LocalPlayer:GetAttribute("themeOfMika") == nil then
	SetupDarken()
elseif game.Players.LocalPlayer:GetAttribute("themeOfMika") == "Sunshine" then
	SetupSunshine()
elseif game.Players.LocalPlayer:GetAttribute("themeOfMika") == "Blackout" then
	SetupBlackout()
end


local UDim2_new = UDim2.new

local UserInputService = game:GetService("UserInputService")

local DraggableObject 		= {}
DraggableObject.__index 	= DraggableObject

-- Sets up a new draggable object
function DraggableObject.new(Object)
	local self 			= {}
	self.Object			= Object.ScrollingFrame.TextLabel
	self.DragStarted	= nil
	self.DragEnded		= nil
	self.Dragged		= nil
	self.Dragging		= false

	setmetatable(self, DraggableObject)

	return self
end

-- Enables dragging
function DraggableObject:Enable()
	local object			= self.Object
	local objectToMove      = self.Object.Parent.Parent.Parent
	local dragInput			= nil
	local dragStart			= nil
	local startPos			= nil
	local preparingToDrag	= false

	-- Updates the element
	local function update(input)
		local delta 		= input.Position - dragStart
		local newPosition	= UDim2_new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		objectToMove.Position 	= newPosition

		return newPosition
	end

	self.InputBegan = object.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			preparingToDrag = true
			--[[if self.DragStarted then
				self.DragStarted()
			end
			
			dragging	 	= true
			dragStart 		= input.Position
			startPos 		= Element.Position
			--]]

			local connection 
			connection = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End and (self.Dragging or preparingToDrag) then
					self.Dragging = false
					connection:Disconnect()

					if self.DragEnded and not preparingToDrag then
						self.DragEnded()
					end

					preparingToDrag = false
				end
			end)
		end
	end)

	self.InputChanged = object.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	self.InputChanged2 = UserInputService.InputChanged:Connect(function(input)
		if object.Parent == nil then
			self:Disable()
			return
		end

		if preparingToDrag then
			preparingToDrag = false

			if self.DragStarted then
				self.DragStarted()
			end

			self.Dragging	= true
			dragStart 		= input.Position
			startPos 		= object.Position
		end

		if input == dragInput and self.Dragging then
			local newPosition = update(input)

			if self.Dragged then
				self.Dragged(newPosition)
			end
		end
	end)
end

-- Disables dragging
function DraggableObject:Disable()
	self.InputBegan:Disconnect()
	self.InputChanged:Disconnect()
	self.InputChanged2:Disconnect()

	if self.Dragging then
		self.Dragging = false

		if self.DragEnded then
			self.DragEnded()
		end
	end
end
-- END MODULE
-- START MIKAUI
local keyboxSelected = false
local MikaUI = {
	tabs = {}
}

local tabsAdded = 1
local demoTab = mikate.Frame.Tabs.ScrollingFrame.TabButton

function stringstarts(String,Start)
	return string.sub(String,1,string.len(Start))==Start
end

function Setup()
	local gui = mikate.Frame
	gui.ExitBtn.MouseButton1Click:Connect(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Mika UI Script Hidden",
			Text = "Click the ~ to show"
		})
		gui.Visible = false
	end)
	gui.MinBtn.MouseButton1Click:Connect(function()
		if gui.MinBtn.Text == "-" then
			gui.Tabs.Visible = false
			for _,x in pairs(gui:GetChildren()) do
				if x:IsA("Frame") and x.Name ~= "Bgframe" then
					x.Visible = false
				end
			end
			gui.BackgroundTransparency = 1
			gui.MinBtn.Text = "+"

			game:GetService("TweenService"):Create(gui.MinBtn, TweenInfo.new(0.5),  {Position = UDim2.new(0, -3,   -0.053, 0)}):Play()
			game:GetService("TweenService"):Create(gui.ExitBtn, TweenInfo.new(0.5), {Position = UDim2.new(0, 36, -0.053, 0)}):Play()
			game:GetService("TweenService"):Create(gui.Bgframe, TweenInfo.new(0.5), {Position = UDim2.new(0, -10, -0.076, 0)}):Play()
		else
			gui.Tabs.Visible = true
			for _,x in pairs(gui:GetChildren()) do
				if x:IsA("Frame") and x.Name ~= "Bgframe" then
					x.Visible = true
				end
			end
			gui.BackgroundTransparency = 0
			gui.MinBtn.Text = "-"

			game:GetService("TweenService"):Create(gui.MinBtn, TweenInfo.new(0.5), {Position = UDim2.new(0.902, 0, -0.053, 0)}):Play()
			game:GetService("TweenService"):Create(gui.ExitBtn, TweenInfo.new(0.5), {Position = UDim2.new(0.97, 0, -0.053, 0)}):Play()
			game:GetService("TweenService"):Create(gui.Bgframe, TweenInfo.new(0.5), {Position = UDim2.new(0.89, 0, -0.076, 0)}):Play()
		end
	end)
	game:GetService("UserInputService").InputBegan:Connect(function(input, nobodyUses)
		if input.KeyCode == Enum.KeyCode.Backquote or input.KeyCode == Enum.KeyCode.Tilde then
			gui.Visible = true
		end
	end)
end
function MikaUI:AddTab(tabName)
	local tabElement = mikate.Frame.TabContent:Clone()
	tabElement.Parent = mikate.Frame
	tabElement.Name = "TabContent "..tabName

	table.insert(MikaUI.tabs, {Name = tabName, elements = {}, tab = tabElement})

	return {
		InsertButton = function(buttonName, callback)
			for _,tab in pairs(MikaUI.tabs) do
				if tab.Name == tabName then 
					local yLevel = 0.142*(#tab.elements+1)
					local newButton = tab.tab.TabBtnExample:Clone()
					newButton.Text = buttonName
					newButton.Position = UDim2.fromScale(0.057, yLevel)
					newButton.Parent = tab.tab
					newButton.Name = "TabButton"
					newButton.Visible = true
					newButton.MouseButton1Click:Connect(callback)
					table.insert(tab.elements, newButton)
				end
			end
		end,
		InsertLoadstringButton = function(scriptName, scriptUrl)
			for _,tab in pairs(MikaUI.tabs) do
				if tab.Name == tabName then 
					local yLevel = 0.142*(#tab.elements+1)
					local newButton = tab.tab.TabBtnExample:Clone()
					newButton.Text = scriptName
					newButton.Position = UDim2.fromScale(0.057, yLevel)
					newButton.Parent = tab.tab
					newButton.Name = "TabButton"
					newButton.Visible = true
					newButton.MouseButton1Click:Connect(function()
						loadstring(game:HttpGet(scriptUrl))()
					end)
					table.insert(tab.elements, newButton)
				end
			end
		end,
		InsertLabel = function(labelText)
			for _,tab in pairs(MikaUI.tabs) do
				if tab.Name == tabName then 
					local yLevel = 0.142*(#tab.elements+1)
					local newButton = tab.tab.TabLabelExample:Clone()
					newButton.Text = labelText
					newButton.Position = UDim2.fromScale(0.057, yLevel)
					newButton.Parent = tab.tab
					newButton.Name = "TabLabel"
					newButton.Visible = true
					table.insert(tab.elements, newButton)
				end
			end
		end,
		InsertCheckbox = function(checkboxName, default, callback)
			for _,tab in pairs(MikaUI.tabs) do
				if tab.Name == tabName then 
					local yLevel = 0.142*(#tab.elements+1)
					local newButton = tab.tab.TabToggleExample:Clone()
					newButton.Text = checkboxName
					newButton.Position = UDim2.fromScale(0.057, yLevel)
					newButton.Parent = tab.tab
					newButton.Name = "TabToggle"
					newButton.ImageLabel.Toggle.Visible = default
					newButton.Visible = true
					newButton.MouseButton1Click:Connect(function()
						newButton.ImageLabel.Toggle.Visible = not newButton.ImageLabel.Toggle.Visible
						callback(newButton.ImageLabel.Toggle.Visible)
					end)
					table.insert(tab.elements, newButton)
				end
			end
		end,
		InsertTextInput = function(inputName, placeholder, default, clearonlost, callback)
			for _,tab in pairs(MikaUI.tabs) do
				if tab.Name == tabName then 
					local yLevel = 0.142*(#tab.elements+1)
					local newButton = tab.tab.TabTextExample:Clone()
					newButton.ValueText.Text = inputName
					newButton.Content.Text = default
					newButton.Position = UDim2.fromScale(0.057, yLevel)
					newButton.Parent = tab.tab
					newButton.Name = "TabTextInput"
					newButton.Content.ClearTextOnFocus = clearonlost
					newButton.Visible = true
					newButton.Content.PlaceholderText = placeholder
					newButton.Content.FocusLost:Connect(function()
						callback(newButton.Content.Text)
					end)
					table.insert(tab.elements, newButton)
				end
			end
		end,
		InsertSlider = function(sliderName, sliderValueType, min, max, increment, default, color, callback)
			for _,tab in pairs(MikaUI.tabs) do
				if tab.Name == tabName then 
					local yLevel = 0.142*(#tab.elements+1)
					local newSlider = tab.tab.TabSliderExample:Clone()
					newSlider.UIStroke.Color = color
					newSlider.Position = UDim2.fromScale(0.057, yLevel)
					newSlider.Value.BackgroundColor3 = color
					newSlider.Parent = tab.tab
					newSlider.Name = "TabSlider"
					local Dragging = false
					local function Round(Number, Factor)
						local Result = math.floor(Number/Factor + (math.sign(Number) * 0.5)) * Factor
						if Result < 0 then Result = Result + Factor end
						return Result
					end
					local function SetValue(Value)
						local TweenService = game:GetService("TweenService")
						newSlider:SetAttribute("value", math.clamp(Round(Value, increment), min, max))
						TweenService:Create(newSlider.Value,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.fromScale((newSlider:GetAttribute("value") - min) / (max - min), 1)}):Play()
						newSlider.ValueText.Text = tostring(newSlider:GetAttribute("value")) .. " " .. sliderValueType
						callback(newSlider:GetAttribute("value"))
					end
					newSlider.InputBegan:Connect(function(Input)
						if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
							Dragging = true 
						end 
					end)
					newSlider.InputEnded:Connect(function(Input) 
						if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
							Dragging = false 
						end 
					end)

					UserInputService.InputChanged:Connect(function(Input)
						if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then 
							local SizeScale = math.clamp((Input.Position.X - newSlider.AbsolutePosition.X) / newSlider.AbsoluteSize.X, 0, 1)
							SetValue(min + ((max - min) * SizeScale))
						end
					end)

					newSlider.Visible = true

					table.insert(tab.elements, newSlider)
				end
			end
		end,
	}
end
function MikaUI:Init(title)
	Setup()
	mikate.Frame.Visible = false
	mikate.Frame.Tabs.ScrollingFrame.TextLabel.Text = title
	local o = DraggableObject.new(mikate.Frame.Tabs)
	o:Enable()
	for _,tab in pairs(MikaUI.tabs) do
		local tabButton = demoTab:Clone()
		local yLevel = 0.1*tabsAdded
		tabButton.Position = UDim2.fromScale(0.065, yLevel)
		tabButton.Parent = mikate.Frame.Tabs.ScrollingFrame
		tabButton.Text = tab.Name
		tabButton.Visible = true
		tabButton.MouseButton1Click:Connect(function()
			for _,otherTab in pairs(MikaUI.tabs) do
				if otherTab.Name ~=  tab.Name then
					otherTab.tab.Visible = false
				end
			end
			tab.tab.Visible = true
		end)
		tabsAdded += 1
	end
	mikate.LoadingFrame.Visible = true
	wait(2)
	mikate.Frame.Visible = true
	mikate.LoadingFrame.Visible = false
end

return MikaUI
