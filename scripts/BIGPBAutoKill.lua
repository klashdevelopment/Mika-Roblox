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
btn.Position = UDim2.new(0.5, 0, 0.2)
btn.TextColor3 = Color3.fromRGB(0, 0, 0)
btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
btn.Text = "Autokill (F)"
btn.AnchorPoint = Vector2.new(0.5, 0.5)
btn.Size = UDim2.fromOffset(200, 30)
local temp = Instance.new("UICorner")
temp.Parent = btn

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
btn.MouseButton1Click:Connect(run)

game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.F then
		run()
	end
end)
