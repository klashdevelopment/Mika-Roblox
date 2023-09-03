local MikaTAS = {}
local Running = false
local Frames = {}
local Saved = {}
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

function MikaTAS:SavePosition(key, cframe)
    Saved[key] = cframe
end
function MikaTAS:UnsavePosition(key)
    Saved[key] = nil
end
function MikaTAS:TeleportTo(key)
    if Saved[key] == nil then
        error("MIKATAS - Teleporting - key is not saved")
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        error("MIKATAS - Teleporting - No HumanoidRootPart")
    end
    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = Saved[key]
end
function MikaTAS:TweenTo(key, duration)
    if Saved[key] == nil then
        error("MIKATAS - Teleporting - key is not saved")
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        error("MIKATAS - Teleporting - No HumanoidRootPart")
    end
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), TweenInfo.new(duration), {CFrame = Saved[key]})
end

function MikaTAS:StartRecord()
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

function MikaTAS:StopRecord()
    Running = false
end

function MikaTAS:Play()
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
