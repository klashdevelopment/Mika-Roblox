
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "CLICK PAINTING",
		Text = "CLICK TH EVENT PAINTING",
	})


local wClickDetector = Instance.new("ClickDetector")
local part = Instance.new("Part")
part.CFrame = CFrame.new(-1248.42358, 0.985137939, 595.412292, -0.889782429, 0, -0.456385165, 0, 1, 0, 0.456385165, 0, -0.889782429)
part.Transparency = 1
part.Anchored = true
part.CanCollide = false
wClickDetector.Parent = part
part.Parent = workspace.Lobby["TH Stuff"].Wizard
wClickDetector.MouseClick:Connect(function()
	game.Players.LocalPlayer.Character.Head.Transparency = 1
	game.Players.LocalPlayer.Character.Head.face.Transparency = 1
end)

local hClickDetector = Instance.new("ClickDetector")
hClickDetector.Parent = workspace.Lobby["TH Event Teleporter"]["DaPainting"]
hClickDetector.MouseClick:Connect(function()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Scientist Clicked",
		Text = "HEADLESS STEP 1/2 DONE",
	})
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "CLICK THE WIZARD"
		Text = "ON THE FIREPLACE",
	})
end)
