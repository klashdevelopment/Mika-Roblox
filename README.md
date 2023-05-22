# MikaClient for Roblox
Mika is an advanced utility client made for [Roblox](https://github.com/klashdevelopment/Mika-Roblox) and [Muck](https://github.com/klashdevelopment/Mika).

*Supported Games*
| Name | Script List | Script Roadmap |
| ---- | ----------- | -------------- |
| [Roblox Doors](https://web.roblox.com/games/6516141723) ([Mika Link](https://github.com/klashdevelopment/Mika-Roblox)) | DarkraiX, Vynixius, PlamenUtility | Doors's Mikamod, **M**Biside |
| [Muck](https://store.steampowered.com/app/1625450/Muck/) ([Mika Link](https://github.com/klashdevelopment/Mika)) | Muck's Mikamod | MitchClient |

## I need an executor/scripting software/injector!
Alrighty! No problem. I personally use Fluxus (fluxteam.net, not ANYTHING ELSE)
You can choose from some below (**Click "LinkVertize" or "LV", NOT "LV Installer" or "LinkVertize Intaller"**)

| Name | Download | Features | Reason to use |
| --- | --- | --- | --- |
| ~~Mika~~ | none | ~~Easy to use with nice UI and system~~ | Not released |
| ~~Comet 5~~ | none | ~~Amazing UI, easy keys, byfron bypass~~ | Not released |
| [Comet 3](https://cometrbx.xyz) | [WAD](https://wearedevs.net/d/Comet) or [Official](https://cometrbx.xyz/download.html) | Nice UI, easy keys, byfron bypass (Requires MS Store) | Free & Easy |
| [Fluxus](https://fluxteam.net) | [Windows](https://fluxteam.net/dl) or [Android](https://fluxteam.net/android) | Simple&Fast inject, bypass byfron, android support | Free (my personal favorite) |
| [Electron](https://ryos.lol/) | [WAD](https://wearedevs.net/d/Electron) or [Official](https://ryos.lol/) | Simple UI, byfron, Stability, LuaU | Free |

### DOORS - Choosing & Using
<details>
<summary>Use a saved copy to prevent dead-links</summary>

Simply head over to the [Saved Copy Loaders](https://github.com/klashdevelopment/Mika-Roblox/tree/main/loaders/doors/Saved%20Copies) and pick the latest one.
In this example we will use "4-21-23".
  
Change "4-21-23" at the end of this command with your picked version.
```lua
loadString(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/loaders/doors/Saved%20Copies/Load-4-21-23.lua"))()
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
loadString(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/main/loaders/doors/Loader.lua"))()
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
