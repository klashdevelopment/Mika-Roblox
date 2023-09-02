
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Mika BigPB") then
	game.Players.LocalPlayer.PlayerGui["Mika BigPB"]:Destroy()
end
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui
gui.Name = "Mika BigPB"
local cooldown = false
local btn = Instance.new("TextButton")
btn.Name = "MB"
btn.Parent = gui
btn.Position = UDim2.new(0.2, 0, 0.2, 0)
btn.TextColor3 = Color3.fromRGB(0, 0, 0)
btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
btn.Text = "Autokill (F)"
btn.AnchorPoint = Vector2.new(0.5, 0.5)
btn.Size = UDim2.fromOffset(200, 30)
local temp = Instance.new("UICorner")
temp.Parent = btn


local btnR = Instance.new("TextButton")
btnR.Name = "MB"
btnR.Parent = gui
btnR.Position = UDim2.new(0.2, 0, 0.2, 35)
btnR.TextColor3 = Color3.fromRGB(0, 0, 0)
btnR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
btnR.Text = "Nokick Autokill (R)"
btnR.AnchorPoint = Vector2.new(0.5, 0.5)
btnR.Size = UDim2.fromOffset(200, 30)
local temp = Instance.new("UICorner")
temp.Parent = btnR

local savedTp = CFrame.new(0, 0, 0)
local beenSaved = false

local btn2 = Instance.new("TextButton")
btn2.Name = "MB2"
btn2.Parent = gui
btn2.Position = UDim2.new(0.2, 0, 0.2, -35)
btn2.TextColor3 = Color3.fromRGB(0, 0, 0)
btn2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
btn2.Text = "SaveTP - X, LoadTP - V"
btn2.AnchorPoint = Vector2.new(0.5, 0.5)
btn2.Size = UDim2.fromOffset(200, 30)
local temp2 = Instance.new("UICorner")
temp2.Parent = btn2
function lookat(playerone, playertwo)
	root_part_one = playerone.HumanoidRootPart
	root_part_two = playertwo.HumanoidRootPart
	root_part_one.CFrame = CFrame.new(root_part_one.Position, root_part_two.Position)
end

function tween()
if cooldown then return end
	local PrePoint = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

	cooldown = true
	local t = Instance.new("TextLabel")
	t.Parent = gui
	t.Text = "3 - Mika"
	t.AnchorPoint = Vector2.new(0.5, 0.5)
	t.Position = UDim2.fromScale(0.5, 0.3)
	t.TextSize = 20
	t.ZIndex = 2000
	wait(1)
	t.Text = "2 - Mika"
	wait(1)
	t.Text = "1 - Mika"
	wait(1)
	btnR.Text = "RUNNING..."
	t:Destroy()

		for _,p in pairs(game.Players:GetPlayers()) do
		local function set()
			if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X - p.Character.HumanoidRootPart.CFrame.X > 200 then
				return
			end
			if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z - p.Character.HumanoidRootPart.CFrame.Z > 200 then
				return
			end
			game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(0.5),{CFrame = CFrame.new(
				p.Character.HumanoidRootPart.CFrame.X,
				p.Character.HumanoidRootPart.CFrame.Y + 3,
				p.Character.HumanoidRootPart.CFrame.Z
			)}):Play()
			lookat(game.Players.LocalPlayer.Character, p.Character)
		end
			if game.Players.LocalPlayer.Team == nil then
				if p ~= game.Players.LocalPlayer then
					if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then break end
					set()
					wait(0.2)
				end
			else
				if p ~= game.Players.LocalPlayer and p.Team ~= game.Players.LocalPlayer.Team then
					if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then break end
					set()
					wait(0.2)
					set()
					wait(0.2)
					set()
					wait(0.2)
					set()
					wait(0.2)
					set()
					wait(0.2)
					set()
					wait(0.2)
					set()
					wait(0.1)
				end
			end
		end
		game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(0.5),{CFrame=PrePoint}):Play()
	wait(1)
	btnR.Text = "ON COOLDOWN (9)"
	wait(1)
	btnR.Text = "ON COOLDOWN (8)"
	wait(1)
	btnR.Text = "ON COOLDOWN (7)"
	wait(1)
	btnR.Text = "ON COOLDOWN (6)"
	wait(1)
	btnR.Text = "ON COOLDOWN (5)"
	wait(1)
	btnR.Text = "ON COOLDOWN (4)"
	wait(1)
	btnR.Text = "ON COOLDOWN (3)"
	wait(1)
	btnR.Text = "ON COOLDOWN (2)"
	wait(1)
	btnR.Text = "ON COOLDOWN (1)"
	cooldown = false
	btnR.Text = "Nokick Autokill (R)"
end
function run()
if cooldown then return end
	local PrePoint = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

	cooldown = true
	local t = Instance.new("TextLabel")
	t.Parent = gui
	t.Text = "3 - Mika"
	t.AnchorPoint = Vector2.new(0.5, 0.5)
	t.Position = UDim2.fromScale(0.5, 0.3)
	t.TextSize = 20
	t.ZIndex = 2000
	wait(1)
	t.Text = "2 - Mika"
	wait(1)
	t.Text = "1 - Mika"
	wait(1)
	btn.Text = "RUNNING..."
	t:Destroy()

		for _,p in pairs(game.Players:GetPlayers()) do
		local function set()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
				p.Character.HumanoidRootPart.CFrame.X,
				p.Character.HumanoidRootPart.CFrame.Y + 3,
				p.Character.HumanoidRootPart.CFrame.Z
			)
		end
			if game.Players.LocalPlayer.Team == nil then
				if p ~= game.Players.LocalPlayer then
					if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then break end
					set()
					wait(0.2)
				end
			else
				if p ~= game.Players.LocalPlayer and p.Team ~= game.Players.LocalPlayer.Team then
					if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then break end
					set()
					wait(0.02)
					set()
					wait(0.02)
					set()
					wait(0.02)
					set()
					wait(0.02)
					set()
					wait(0.02)
					set()
					wait(0.02)
					set()
					wait(0.1)
				end
			end
		end
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PrePoint
	wait(1)
	btn.Text = "ON COOLDOWN (9)"
	wait(1)
	btn.Text = "ON COOLDOWN (8)"
	wait(1)
	btn.Text = "ON COOLDOWN (7)"
	wait(1)
	btn.Text = "ON COOLDOWN (6)"
	wait(1)
	btn.Text = "ON COOLDOWN (5)"
	wait(1)
	btn.Text = "ON COOLDOWN (4)"
	wait(1)
	btn.Text = "ON COOLDOWN (3)"
	wait(1)
	btn.Text = "ON COOLDOWN (2)"
	wait(1)
	btn.Text = "ON COOLDOWN (1)"
	cooldown = false
	btn.Text = "Autokill (F)"
end
btnR.MouseButton1Click:Connect(tween)
btn.MouseButton1Click:Connect(run)

game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.F then
		run()
	end
	if input.KeyCode == Enum.KeyCode.R then
		tween()
	end
	if input.KeyCode == Enum.KeyCode.X then
		if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			savedTp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
			beenSaved = true
			local t = Instance.new("TextLabel")
			t.Parent = gui
			t.Text = "Position Saved"
			t.AnchorPoint = Vector2.new(0.5, 0.5)
			t.Position = UDim2.fromScale(0.5, 0.3)
			t.TextSize = 20
			t.ZIndex = 2000
			wait(1)
			t:Destroy()
		end
	end
	
	if input.KeyCode == Enum.KeyCode.V then
		if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and beenSaved then
			game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = savedTp
			local t = Instance.new("TextLabel")
			t.Parent = gui
			t.Text = "Position Loaded"
			t.AnchorPoint = Vector2.new(0.5, 0.5)
			t.Position = UDim2.fromScale(0.5, 0.3)
			t.TextSize = 20
			t.ZIndex = 2000
			wait(1)
			t:Destroy()
		end
	end
end)
