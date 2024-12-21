# Joy UI

Get started by importing:
```lua
local JoyUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/libraries/JoyUI.lua"))()
```

Or use the example script [found here](https://github.com/klashdevelopment/Mika-Roblox/blob/main/scripts/JoyUIExample.lua)

Make a window. It's reccomended to only have 1 window atm cuz draggability is WIP
```lua
local Window = JoyUI:createWindow({
    title = "My Script"
})
```

Soon you'll add tabs - but currently tabs dont exist - only windows.

Here's the elements:

### Buttons
Buttons come in 4 styles: outline, plain, soft, normal.

![image](https://github.com/user-attachments/assets/4d35a4db-26e8-4ffd-a7b5-7f3bbd6b0a6b)

Here's an implementation:

```lua
Window.AddButton(
    "Content", -- Text content of the button
    "style", -- One of 4 styles from above
    nil -- Function as a callback for when button is clicked
)
```

### Inputs
Inputs come in 2 colors, danger and normal

![image](https://github.com/user-attachments/assets/440a486f-30f1-4582-a115-03505670d0ef)

Here's the implementation:
```lua
Window.AddInput(
    "Placeholder", -- Placeholder content for no content.
    "Default text", -- The default content. Leave blank for none.
    false, -- Is a danger button? (red)
    function(value) end -- On change. Called for every single letter change
)
```


### Inputs with Nested Buttons
Nesteds dont support colors:

![image](https://github.com/user-attachments/assets/20e2b49e-3634-4bc5-ae11-58a700139586)


Here's the implementation:
```lua
Window.AddInputWithButton(
    "Placeholder", -- Placeholder content for no content.
    "Default text", -- The default content. Leave blank for none.
    "Button text", -- Text of the button inside.
    function(value) end, -- On input change - Called for every letter change
    function() end -- On button clicked.
)
```


### Switches or Checkboxes
AddSwitch and AddCheckbox have the same syntax, just a different look:

![image](https://github.com/user-attachments/assets/aef603e9-9cf1-4760-bd44-f91203936d06)

Here's the implementation - Swap AddSwitch and AddCheckbox in:
```lua
Window.Add________(
    "Label content", -- Label of the selection
    false, -- Default value
    function(boolValue) end -- Callback when toggled on/off
)
```



## Final Instructions
You then need to Initialize the library:
```lua
local Window = ... -- Define your window

-- Add objects here

Window.Init()
-- Window.Destroy() later on if you need, although the GUI comes with a trash button in the top right.
