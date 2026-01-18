--[[
    AutoDodge V3 - Working Version
    
    Features:
    - Auto-dodge incoming attacks
    - Unlimited stamina & block energy
    - Press P to toggle dodge, O to toggle stamina
]]

-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

-- ============================================
-- CONFIG
-- ============================================
local Config = {
    AutoDodge = true,
    UnlimitedStamina = true,
    
    -- Keys
    DodgeToggle = Enum.KeyCode.P,
    StaminaToggle = Enum.KeyCode.O,
    
    -- Dodge settings
    DodgeWindow = 0.3,        -- React this early
    DodgeCooldown = 0.25,
    MaxDistance = 12,
    DirectionMode = "Smart",   -- Smart, Left, Right, Random
    
    Debug = false
}

-- ============================================
-- STATE
-- ============================================
local lastDodge = 0
local dodgeCount = 0
local lastAttack = nil

-- ============================================
-- GET EVENTS (with retries)
-- ============================================
local ForceDashEvent = nil
local TryDashEvent = nil

local function getEvents()
    pcall(function()
        local events = ReplicatedStorage:FindFirstChild("Events")
        if events then
            ForceDashEvent = events:FindFirstChild("ForceDash")
        end
        
        local mobile = ReplicatedStorage:FindFirstChild("MobileEvents")
        if mobile then
            TryDashEvent = mobile:FindFirstChild("TryDash")
        end
    end)
end
getEvents()

-- Retry getting events
task.spawn(function()
    for i = 1, 10 do
        if ForceDashEvent then break end
        task.wait(1)
        getEvents()
    end
    if Config.Debug then
        print("[AutoDodge] ForceDash:", ForceDashEvent and "FOUND" or "NOT FOUND")
        print("[AutoDodge] TryDash:", TryDashEvent and "FOUND" or "NOT FOUND")
    end
end)

-- ============================================
-- GET CHARACTER STATE
-- ============================================
local function getState()
    local char = LocalPlayer.Character
    if not char then return nil end
    
    local states = Workspace:FindFirstChild("States")
    if not states then return nil end
    
    local pstate = states:FindFirstChild(LocalPlayer.Name)
    if not pstate then return nil end
    
    return {
        character = char,
        charData = pstate:FindFirstChild("CharacterData"),
        occupied = pstate:FindFirstChild("Occupied"),
        playerData = pstate:FindFirstChild("PlayerData")
    }
end

-- ============================================
-- UNLIMITED STAMINA & BLOCK
-- ============================================
local function refillStats()
    if not Config.UnlimitedStamina then return end
    
    local state = getState()
    if not state or not state.charData then return end
    
    -- Refill stamina
    local stamina = state.charData:FindFirstChild("Stamina")
    local maxStam = state.charData:FindFirstChild("MaxStamina")
    if stamina then
        stamina.Value = maxStam and maxStam.Value or 100
    end
    
    -- Refill block energy
    local block = state.charData:FindFirstChild("BlockEnergy")
    local maxBlock = state.charData:FindFirstChild("MaxBlockEnergy")
    if block then
        block.Value = maxBlock and maxBlock.Value or 100
    end
    
    -- Refill ultimate
    local ult = state.charData:FindFirstChild("UltimateEnergy")
    if ult then
        ult.Value = 100
    end
end

-- ============================================
-- CHECK IF CAN DODGE
-- ============================================
local function canDodge()
    if tick() - lastDodge < Config.DodgeCooldown then
        return false, "cooldown"
    end
    
    local state = getState()
    if not state then return false, "no state" end
    if not state.character then return false, "no char" end
    if not state.occupied then return false, "no occupied" end
    
    -- Must be equipped
    local eq = state.occupied:FindFirstChild("Equipped")
    if not eq or not eq.Value then
        return false, "not equipped"
    end
    
    -- Not dashing
    local dash = state.occupied:FindFirstChild("Dashing")
    if dash and dash.Value then
        return false, "dashing"
    end
    
    -- Not stunned
    if state.charData then
        local stun = state.charData:FindFirstChild("Stunned")
        if stun and stun.Value then
            return false, "stunned"
        end
        local cut = state.charData:FindFirstChild("Cutscene")
        if cut and cut.Value then
            return false, "cutscene"
        end
    end
    
    -- Check char attributes
    local c = state.character
    if c:GetAttribute("BlockBroken") then return false, "blockbroken" end
    if c:GetAttribute("LocalSlowMo") then return false, "slowmo" end
    if c:GetAttribute("DenyDash") then return false, "denydash" end
    if c:GetAttribute("NoDash") then return false, "nodash" end
    
    return true, "ok"
end

-- ============================================
-- GET DIRECTION
-- ============================================
local function getDirection(hand)
    if Config.DirectionMode == "Smart" then
        if hand == "RightHand" then return "Left"
        elseif hand == "LeftHand" then return "Right"
        else return math.random() > 0.5 and "Left" or "Right"
        end
    elseif Config.DirectionMode == "Left" then return "Left"
    elseif Config.DirectionMode == "Right" then return "Right"
    else return math.random() > 0.5 and "Left" or "Right"
    end
end

-- ============================================
-- DO DODGE
-- ============================================
local function doDodge(direction)
    local ok, reason = canDodge()
    if not ok then
        if Config.Debug then print("[AutoDodge] Can't dodge:", reason) end
        return false
    end
    
    lastDodge = tick()
    dodgeCount = dodgeCount + 1
    
    if Config.Debug then print("[AutoDodge] DODGE", direction) end
    
    local state = getState()
    
    -- Set perfect dodge attributes
    if state and state.character then
        pcall(function()
            state.character:SetAttribute("Perfect", true)
            state.character:SetAttribute("NeededDirection", direction)
        end)
    end
    
    -- Method 1: ForceDash
    if ForceDashEvent then
        local success = pcall(function()
            ForceDashEvent:Fire({
                Direction = direction,
                IgnoreChecks = false
            })
        end)
        if success then
            if Config.Debug then print("[AutoDodge] Used ForceDash") end
            return true
        end
    end
    
    -- Method 2: TryDash with simulated input
    if TryDashEvent then
        if state and state.character then
            local vec = direction == "Left" and Vector3.new(-1,0,0) or Vector3.new(1,0,0)
            pcall(function()
                state.character:SetAttribute("SimulatedInput", vec)
            end)
        end
        
        local success = pcall(function()
            TryDashEvent:Fire()
        end)
        
        task.delay(0.1, function()
            if state and state.character then
                pcall(function()
                    state.character:SetAttribute("SimulatedInput", nil)
                end)
            end
        end)
        
        if success then
            if Config.Debug then print("[AutoDodge] Used TryDash") end
            return true
        end
    end
    
    if Config.Debug then print("[AutoDodge] No dodge method worked!") end
    return false
end

-- ============================================
-- CHECK FOR ATTACKS
-- ============================================
local function checkAttack()
    local state = getState()
    if not state or not state.occupied then return nil end
    
    -- Get opponent
    local locked = state.occupied:FindFirstChild("LockedOn")
    if not locked or not locked.Value then return nil end
    local opp = locked.Value
    
    -- Check distance
    if state.character and state.character.PrimaryPart and opp.PrimaryPart then
        local dist = (state.character.PrimaryPart.Position - opp.PrimaryPart.Position).Magnitude
        if dist > Config.MaxDistance then return nil end
    end
    
    -- Check if attacking
    local punching = opp:GetAttribute("Punching")
    if not punching then return nil end
    
    local landTime = opp:GetAttribute("LandTime")
    if not landTime then return nil end
    
    return {
        time = landTime,
        hand = opp:GetAttribute("AttackingHand"),
        id = tostring(landTime)
    }
end

-- ============================================
-- MAIN LOOP
-- ============================================
local function update()
    -- Always refill stats
    refillStats()
    
    -- Auto dodge
    if not Config.AutoDodge then return end
    
    local attack = checkAttack()
    if not attack then
        lastAttack = nil
        return
    end
    
    -- Skip same attack
    if attack.id == lastAttack then return end
    
    -- Check timing
    local now = Workspace:GetServerTimeNow()
    local timeLeft = attack.time - now
    
    if timeLeft > 0 and timeLeft <= Config.DodgeWindow then
        local dir = getDirection(attack.hand)
        if doDodge(dir) then
            lastAttack = attack.id
        end
    end
end

-- ============================================
-- GUI
-- ============================================
local function makeGUI()
    pcall(function()
        local old = LocalPlayer.PlayerGui:FindFirstChild("AutoDodgeV3")
        if old then old:Destroy() end
        
        local gui = Instance.new("ScreenGui")
        gui.Name = "AutoDodgeV3"
        gui.ResetOnSpawn = false
        gui.Parent = LocalPlayer.PlayerGui
        
        local f = Instance.new("Frame")
        f.Name = "Main"
        f.Size = UDim2.new(0, 180, 0, 75)
        f.Position = UDim2.new(0, 10, 0.5, -37)
        f.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
        f.BackgroundTransparency = 0.15
        f.BorderSizePixel = 0
        f.Parent = gui
        Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)
        
        local t = Instance.new("TextLabel")
        t.Size = UDim2.new(1, 0, 0, 20)
        t.BackgroundTransparency = 1
        t.Text = "INVINCIBILITY v3"
        t.TextColor3 = Color3.fromRGB(255, 215, 0)
        t.TextSize = 13
        t.Font = Enum.Font.GothamBlack
        t.Parent = f
        
        local d = Instance.new("TextLabel")
        d.Name = "Dodge"
        d.Size = UDim2.new(0.5, 0, 0, 18)
        d.Position = UDim2.new(0, 0, 0, 22)
        d.BackgroundTransparency = 1
        d.Text = "Dodge: ON"
        d.TextColor3 = Color3.fromRGB(100, 255, 100)
        d.TextSize = 11
        d.Font = Enum.Font.GothamBold
        d.Parent = f
        
        local s = Instance.new("TextLabel")
        s.Name = "Stamina"
        s.Size = UDim2.new(0.5, 0, 0, 18)
        s.Position = UDim2.new(0.5, 0, 0, 22)
        s.BackgroundTransparency = 1
        s.Text = "Stam: ON"
        s.TextColor3 = Color3.fromRGB(100, 255, 100)
        s.TextSize = 11
        s.Font = Enum.Font.GothamBold
        s.Parent = f
        
        local c = Instance.new("TextLabel")
        c.Name = "Count"
        c.Size = UDim2.new(1, 0, 0, 16)
        c.Position = UDim2.new(0, 0, 0, 40)
        c.BackgroundTransparency = 1
        c.Text = "Dodges: 0"
        c.TextColor3 = Color3.fromRGB(180, 180, 180)
        c.TextSize = 10
        c.Font = Enum.Font.Gotham
        c.Parent = f
        
        local h = Instance.new("TextLabel")
        h.Size = UDim2.new(1, 0, 0, 14)
        h.Position = UDim2.new(0, 0, 0, 58)
        h.BackgroundTransparency = 1
        h.Text = "[P] Dodge   [O] Stamina"
        h.TextColor3 = Color3.fromRGB(100, 100, 100)
        h.TextSize = 9
        h.Font = Enum.Font.Gotham
        h.Parent = f
    end)
end

local function updateGUI()
    pcall(function()
        local gui = LocalPlayer.PlayerGui:FindFirstChild("AutoDodgeV3")
        if not gui then return end
        local m = gui:FindFirstChild("Main")
        if not m then return end
        
        local d = m:FindFirstChild("Dodge")
        if d then
            d.Text = "Dodge: " .. (Config.AutoDodge and "ON" or "OFF")
            d.TextColor3 = Config.AutoDodge and Color3.fromRGB(100,255,100) or Color3.fromRGB(255,100,100)
        end
        
        local s = m:FindFirstChild("Stamina")
        if s then
            s.Text = "Stam: " .. (Config.UnlimitedStamina and "ON" or "OFF")
            s.TextColor3 = Config.UnlimitedStamina and Color3.fromRGB(100,255,100) or Color3.fromRGB(255,100,100)
        end
        
        local c = m:FindFirstChild("Count")
        if c then
            c.Text = "Dodges: " .. dodgeCount
        end
    end)
end

-- ============================================
-- INPUT
-- ============================================
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    
    if input.KeyCode == Config.DodgeToggle then
        Config.AutoDodge = not Config.AutoDodge
        print("[AutoDodge]", Config.AutoDodge and "ON" or "OFF")
        updateGUI()
    elseif input.KeyCode == Config.StaminaToggle then
        Config.UnlimitedStamina = not Config.UnlimitedStamina
        print("[Stamina]", Config.UnlimitedStamina and "UNLIMITED" or "NORMAL")
        updateGUI()
    end
end)

-- ============================================
-- START
-- ============================================
makeGUI()
RunService.Heartbeat:Connect(update)
RunService.Heartbeat:Connect(updateGUI)

print("╔════════════════════════════════════╗")
print("║   INVINCIBILITY SCRIPT LOADED!     ║")
print("╠════════════════════════════════════╣")
print("║  [P] = Toggle Auto-Dodge           ║")
print("║  [O] = Toggle Unlimited Stamina    ║")
print("╠════════════════════════════════════╣")
print("║  Dodge: " .. (Config.AutoDodge and "ON " or "OFF") .. "   Stamina: " .. (Config.UnlimitedStamina and "ON " or "OFF") .. "         ║")
print("╚════════════════════════════════════╝")

-- Export
return {
    ToggleDodge = function() Config.AutoDodge = not Config.AutoDodge; updateGUI(); return Config.AutoDodge end,
    ToggleStamina = function() Config.UnlimitedStamina = not Config.UnlimitedStamina; updateGUI(); return Config.UnlimitedStamina end,
    Debug = function() Config.Debug = true; print("Debug ON") end,
    GetStats = function() return {dodges = dodgeCount} end
}
