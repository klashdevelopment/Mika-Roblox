# MikaTAS
**MikaTAS is Mika's TAS and Teleportation library**

## Importing
```lua
local MikaTAS = loadstring(game:HttpGet("https://x.klash.dev/libraries/MikaTAS"))()
```

### Simple Teleporting
Save a CFrame with a key:
```lua
MikaTAS:SavePosition("the_key", cframe)
```
Unsave it:
```lua
MikaTAS:UnsavePosition("the_key")
```

Finally, teleport!
TeleportTo uses direct-cframe setting, so anticheats can detect it.
```lua
MikaTAS:TeleportTo("the_key")
```
TweenTo uses tweening, so it is more smooth and *less* detectable.
```lua
MikaTAS:TweenTo("the_key", duration)
```

### TAS - Recording Movement
First, start recording movement.
```
MikaTAS:StartRecord()
```
Then, stop recording.
```
MikaTAS:StopRecord()
```
Finally, play back your TAS!
```
MikaTAS:Play()
```
