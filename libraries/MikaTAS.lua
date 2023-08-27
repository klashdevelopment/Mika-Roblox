local MikaTAS = {}
local Running = false
local Frames = {}
local TimeStart = tick()

local Player = game:GetService("Players").LocalPlayer
local getChar = function()
    local Character = Player.Character
    if Character then
        return Character
    else
        Player.CharacterAdded:Wait()
        return getChar()
    end
end


local MikaTAS:StartRecord = function()
    Frames = {}
    Running = true
    TimeStart = tick()
    while Running == true do
        game:GetService("RunService").Heartbeat:wait()
        local Character = getChar()
        table.insert(Frames, {
            Character.HumanoidRootPart.CFrame,
            Character.Humanoid:GetState().Value,
            tick() - TimeStart
        })
    end
end

local MikaTAS:StopRecord = function()
    Running = false
end

local MikaTAS:Play = function()
    local Character = getChar()
    local TimePlay = tick()
    local FrameCount = #Frames
    local NewFrames = FrameCount
    local OldFrame = 1
    local TASLoop
    TASLoop = game:GetService("RunService").Heartbeat:Connect(function()
        local NewFrames = OldFrame + 60
        local CurrentTime = tick()
        if (CurrentTime - TimePlay) >= Frames[FrameCount][3] then
            TASLoop:Disconnect()
        end
        for i = OldFrame, NewFrames do
            local Frame = Frames[i]
            if Frame[3] <= CurrentTime - TimePlay then
                OldFrame = i
                Character.HumanoidRootPart.CFrame = Frame[1]
                Character.Humanoid:ChangeState(Frame[2])
            end
        end
    end)
end
return MikaTAS
