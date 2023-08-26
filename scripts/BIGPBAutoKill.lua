local PrePoint = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui
local t = Instance.new("TextLabel")
t.Parent = gui
t.Text = "5 - Mika"
t.AnchorPoint = Vector2.new(0.5, 0.5)
t.Position = UDim2.fromScale(0.5, 0.3)
t.TextSize = 20
t.ZIndex = 2000
wait(1)
t.Text = "4 - Mika"
wait(1)
t.Text = "3 - Mika"
wait(1)
t.Text = "2 - Mika"
wait(1)
t.Text = "1 - Mika"
wait(1)
t:Destroy()

for k, v in pairs({1}) do
	for _,p in pairs(game.Players:GetPlayers()) do
		if p.Team ~= game.Players.LocalPlayer.Team then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
			wait(0.2)
		end
	end
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PrePoint
