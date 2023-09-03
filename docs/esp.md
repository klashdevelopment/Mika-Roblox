# MikaESP
** Mika's very own ESP library is not complete yet and is an unplayable state! **

## Mika ESP v2
```lua
local MikaESP = loadstring(game:HttpGet("https://x.klash.dev/libraries/MikaESP/rewrite"))()
```

### Inserting ESP Objects
Inserting takes:
- Part/Player
- Object Name
- Color
```lua
MikaESP:Insert(part, "Part Name", Color3.fromRGB(255,255,255))
```

### Removing ESP Objects
Two ways:
- using the text
- using the part/player
```lua
MikaESP:RemovePartUsingText("Part Name")
MikaESP:RemovePartUsingPart(part)
```

### Disabling MikaESP
To disable, we need a Stopmui value under the player.
If MikaESP ever finds a Stopmui it will instantly stop as soon as possible.
```lua
local Stopper = Instance.new("NumberValue")
Stopper.Name = "Stopmui"
Stopper.Parent = game.Players.LocalPlayer
```

### Finally, Init (ReqESPred)
```lua
MikaESP:Init()
```

## Looking for the OG?
MikaESP v1 is not being supported, updated, or documented anymore.
If you still REALLY want to use it, you may see here:
```lua
local MikaESP = loadstring(game:HttpGet("https://x.klash.dev/libraries/MikaESP"))()
```
