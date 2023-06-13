local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Doors | Mikamod",
   LoadingTitle = "Doors Mikamod",
   LoadingSubtitle = "by Klash",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Mikamodder",
      FileName = "Doors"
   }
})
local Tab = Window:CreateTab("Main", 4483362458)
local Section = Tab:CreateSection("Hot-Links")
local Button = Tab:CreateButton({
   Name = "DESTROY UI",
   Callback = function()
       Rayfield:Destroy()
   end,
})
local Revive = Tab:CreateButton({
   Name = "Quick Revive",
   Callback = function()
        game.ReplicatedStorage.Bricks.Revive:FireServer()
   end,
})
