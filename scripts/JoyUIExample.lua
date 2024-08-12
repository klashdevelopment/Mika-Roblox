-- Load our UI Library
local JoyUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/libraries/JoyUI.lua"))()

-- Create a fresh window
local Window = JoyUI:createWindow({
    title = "Joy UI Script"
})

-- Add some shit to it
Window.AddButton(
    "Buttons",
    "normal",
    function()
        print("Game")
    end
)
Window.AddButton(
    "with many styles",
    "soft",
    function()
        print("Game")
    end
)
Window.AddButton(
    "Woo hoo",
    "outline",
    function()
        print("Game")
    end
)
Window.AddInput(
    "As well as colored inputs",
    "",
    true,
    function(value)
        print(value)
    end
)
Window.AddInputWithButton(
    "Placeholder",
    "With buttons inside",
    "Like me!",
    nil, nil
)
Window.AddSwitch(
    "And switches",
    true,
    nil
)
Window.AddCheckbox(
    "or checkboxes!",
    true,
    nil
)

-- Finally, boot it up
Window.Init()
