repeat wait() until game:IsLoaded()

local cache = {}
local Services = setmetatable({}, {
    __index = function(_, serviceName)
        local service = cache[serviceName]
        if not service then
            service = cloneref(game:GetService(serviceName))
            cache[serviceName] = service
        end
        return service
    end
})
local executor = identifyexecutor():lower()

local options = ({...})[1] or { Method = 1, Keybind = "F", ShowMethodDictionary = true }
assert(options.Method >= 1 and options.Method <= 3, "Method must be between one and three.")
assert(string.len(options.Keybind) == 1, "Keybind needs to be a KEYBIND!")

local content = Services.HttpService:JSONEncode(options)
writefile("data.txt", content)


-- Initiating handler
loadstring(game:HttpGet("https://raw.githubusercontent.com/klashdevelopment/Mika-Roblox/fe/FEChatBypass/core.lua", true))()
          
