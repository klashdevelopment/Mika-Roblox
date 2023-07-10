# MikaClient for Roblox
Mika is the #1 fully open-sourced utility client for [Roblox](https://github.com/klashdevelopment/Mika-Roblox), [Unity](https://github.com/klashdevelopment/Mika-Others), and [Muck](https://github.com/klashdevelopment/Mika).

We provide Injectors, Scripts, and most importantly: **NO KEY SYSTEM OR OBFUSCATION on our handmade scripts.**

*Supported Games*
| Name | Script List | Script Roadmap |
| ---- | ----------- | -------------- |
| [Roblox Doors](https://web.roblox.com/games/6516141723) ([Mika Link](https://github.com/klashdevelopment/Mika-Roblox)) | DarkraiX, Vynixius, PlamenUtil, Doors's Mikamod, Rooms Autofarm | Doors Autofarm, Better Mikamod |
| [Notoriety](https://web.roblox.com/games/21532277) ([Mika Link](https://github.com/klashdevelopment/Mika-Roblox)) | ValoddNotyGui | Noto's Mikamod |
| [Muck](https://store.steampowered.com/app/1625450/Muck/) ([Mika Link](https://github.com/klashdevelopment/Mika)) | Muck's Mikamod | MitchClient |
| [Unity/Itch.io games](https://github.com/klashdevelopment/Mika-Others) | Karlson (Dani), MinecraftClone (SamHogan) | Off the Balls (Dani), Balls? (Dani) |

## I need an executor/scripting software/injector!
Alrighty! No problem. I personally use Fluxus (fluxteam.net, not ANYTHING ELSE)
You can choose from some below (**Click "LinkVertize" or "LV", NOT "LV Installer" or "LinkVertize Intaller"**)

| Name | Download | Features | Reason to use |
| --- | --- | --- | --- |
| [Mikan](https://mika.fly.dev) | [Web Client](https://mika.fly.dev)([Web Source](https://github.com/klashdevelopment/Mikan)) [Windows Client](https://github.com/klashdevelopment/Mikan-Desktop/releases/latest)([Windows Source](https://github.com/klashdevelopment/Mikan-Desktop)) | **SCRIPT EDITOR ONLY** | Custom-made script editor, fully open sourced. |
| ~~Comet 5~~ | none | ~~Amazing UI, easy keys, byfron bypass~~ | Bugged atm lmao |
| [Comet 3](https://cometrbx.xyz) | [WAD](https://wearedevs.net/d/Comet) or [Official](https://cometrbx.xyz/download.html) | Nice UI, easy keys, byfron bypass (Requires MS Store) | Free & Easy |
| [Fluxus](https://fluxteam.net) | [Windows](https://fluxteam.net/dl) or [Android](https://fluxteam.net/android) | Simple&Fast inject, bypass byfron, android support | Free (my personal favorite) |
| [Electron](https://ryos.lol/) | [WAD](https://wearedevs.net/d/Electron) or [Official](https://ryos.lol/) | Simple UI, byfron, Stability, LuaU | Free |


# Using
if you want individual games/scripts, see below.

To use, please inject the game-specific HUB (See below), or the Mika Script (RECCOMENDED):
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/loaders/MikaHub.lua"))()
```

**The scripts below are game specific, but all included in the mika script above.**

## Gamespecifics & More
### NOTORIETY - Using
**Using saved copy**
The latest copy is **6-8-23**.
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/loaders/notoriety/Load-6-08-23.lua"))()
```
**Latest Copy**
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/loaders/notoriety/Loader.lua"))()
```



### DOORS - Choosing & Using
<details>
  <summary><b>Use the brand new Doors Loader Hub</b></summary>
  
  From this new hub, you can access all the scripts in one!
  
  ```lua
  loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/loaders/doors/DoorsHub.lua"))()
  ```
  
</details>
<details>
<summary>Use a saved copy to prevent dead-links</summary>

Simply head over to the [Saved Copy Loaders](https://github.com/klashdevelopment/Mika-Roblox/tree/main/loaders/doors/Saved%20Copies) and pick the latest one.
In this example we will use "4-21-23".
  
Change "4-21-23" at the end of this command with your picked version.
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/loaders/doors/Saved%20Copies/Load-4-21-23.lua"))()
```
  
Then, add this into your scripting software and load it up!<br>

| Pros      | Cons |
| ----------- | ----------- |
| Prevents deadlinks      | You will have to manually update it every time it updates.       |
| Code will not be modified   | If the game releases an anticheat for this version, you may be at risk of getting banned.        |
</details>
<details>
  
<summary>Use the latest versions of the script bundle</summary>

Simply use the [one main Loader](https://github.com/klashdevelopment/Mika-Roblox/tree/main/loaders/doors/Loader.lua) as the link in your script!

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/loaders/doors/Loader.lua"))()
```

A this into your scripting software, inject, and load it up!
  
  
| Pros      | Cons |
| ----------- | ----------- |
| Always recive the latest version.      | If the link changes on any of the scripts, you will get a deadlink. We try to keep our links updated       |
| Recive the latest bypasses.   | Features may be removed in future updates.        |
</details>

## Unsaved Scripts

Some scripts are not savable due to being protected. We respect this.  Due to this, they are not included in our loader. If you choose to use these scripts they are below.
| Game | Script Name | Code Snippet |
| ---- | ----------- | ------------ |
| Doors | [MSDoors](https://github.com/mstudio45/MSDOORS) | `loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSDOORS.lua"),true))()` |
