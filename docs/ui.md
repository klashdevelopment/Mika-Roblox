# Mika UI
Mika UI is our script UI library!

## Installing
You need to pick a theme:
- Blackout (xtra dark)
- Sunshine (light/peach)
- Darken (default dark)

Set the attribute "themeOfMika" on your player to one of these, then run mika:
```lua
MikaUITheme = "Blackout"

game.Players.LocalPlayer:SetAttribute("themeOfMika", MikaUITheme)
local MikaUI = loadstring(game:HttpGet("https://x.klash.dev/libraries/MikaUI.lua"))()
```

## UI Elements
### Tabs
First, you need to make a tab.
Args:
- Name
```lua
local TabName = MikaUI:AddTab("Tab Name")
```

### Buttons
Args:
- Name
- Callback
```lua
TabName.InsertButton("Button Name", function()
	 -- Button callback
end)
```
### Loadstring Buttons
Like a button, but runs a script from a URL.
Args:
- Name
- URL
```lua
TabName.InsertLoadstringButton("Script Name", "https://x.klash.dev/")
```
### Labels
Args:
- Name
- Label
```lua
TabName.InsertLabel("Mika UI - Label!")
```
### Adaptive Text Inputs
Args:
- Name
- Placeholder
- Default (leave as "" to show placeholder)
- ClearOnFocus (clear the input when clicking on the text box)
- Callback
```lua
TabName.InsertTextInput("Text Input Name", "Placeholder", "Default", false, function(value)
  -- Callback with "value" as the new value of the text input
end)
```
### Checkbox/Toggle
Args:
- Name
- Default
- Callback
```lua
TabName.InsertCheckbox("Toggle Name", true, function(value)
	-- Callback with "value" as the new value of the checkbox
end)
```
### Sliders
Args:
- Name
- Value name
- Minimum
- Maximum
- Increment
- Default
- Color
- Callback
```lua
CoolTab.InsertSlider("Slider", "studs/s", 0, 100, 1, 16, Color3.fromRGB(255, 255, 0), function(value)
	-- Callback with value as the new value
end)
```
## INIT (REQUIRED)
```lua
MikaUI:Init("Script Title")
```
