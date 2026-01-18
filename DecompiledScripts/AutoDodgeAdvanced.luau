--[[
    AutoDodge Advanced Script - Enhanced auto-dodge with GUI and more features
    
    This advanced version includes:
    - GUI toggle with status display
    - Multiple dodge strategies
    - Automatic perfect dodge timing for slowmo
    - Ultimate attack evasion
    - Configurable reaction times
    - Anti-detection features
    
    Based on NPC controller patterns from the game's codebase
]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage")
local l_RunService_0 = game:GetService("RunService")
local l_Players_0 = game:GetService("Players")
local l_UserInputService_0 = game:GetService("UserInputService")
local l_Workspace_0 = game:GetService("Workspace")
local l_TweenService_0 = game:GetService("TweenService")

-- ============================================
-- CONFIGURATION
-- ============================================
local Config = {
    -- Main Settings
    Enabled = true,
    ToggleKey = Enum.KeyCode.P,
    
    -- Dodge Behavior
    DodgeMode = "Perfect",  -- "Perfect", "Quick", "Safe", "Aggressive"
    DirectionMode = "Smart", -- "Smart", "Random", "Alternate", "Left", "Right"
    
    -- Timing (tuned from NPC controller analysis)
    PerfectDodgeOffset = 0.11666666666666667,  -- Time before land to dodge for perfect
    QuickDodgeOffset = 0.2,                     -- Quick reaction dodge
    SafeDodgeOffset = 0.3,                      -- Early safe dodge
    
    -- Distance Settings
    MinDodgeDistance = 0,
    MaxDodgeDistance = 8,
    
    -- Cooldowns
    DodgeCooldown = 0.3,
    PerfectDodgeCooldown = 0.5,
    
    -- Attack Type Reactions
    ReactToLight = true,
    ReactToHeavy = true,
    ReactToUltimate = true,
    ReactToCharge = true,
    
    -- Extra Features
    AutoBlock = true,           -- Block when dodge unavailable
    AutoCounter = false,        -- Try to counter after perfect dodge
    PriorityPerfect = true,     -- Prioritize perfect dodge timing
    HumanizedTiming = true,     -- Add slight random delay to seem more human
    
    -- Visual
    ShowGUI = true,
    DebugMode = false
}

-- ============================================
-- STATE MANAGEMENT
-- ============================================
local State = {
    lastDodgeTime = 0,
    lastDodgeDirection = nil,
    dodgeCount = 0,
    perfectDodgeCount = 0,
    isProcessing = false,
    alternateIndex = 1,
    opponent = nil,
    opponentData = nil
}

-- ============================================
-- SERVICES & MODULES
-- ============================================
local localPlayer = l_Players_0.LocalPlayer
local character = nil
local characterData = nil
local occupied = nil
local playerData = nil

-- Load game modules
local Modules = l_ReplicatedStorage_0:WaitForChild("Modules", 10)
local Styles, GameplaySettings

pcall(function()
    Styles = require(Modules:WaitForChild("Styles", 5))
    GameplaySettings = Styles.GameplaySettings
end)

-- Get dodge event
local MobileEvents = l_ReplicatedStorage_0:WaitForChild("MobileEvents", 10)
local TryDashEvent = MobileEvents and MobileEvents:WaitForChild("TryDash", 5)

-- Also get the Events folder for ForceDash
local Events = l_ReplicatedStorage_0:WaitForChild("Events", 10)
local ForceDashEvent = Events and Events:FindFirstChild("ForceDash")

-- ============================================
-- UTILITY FUNCTIONS
-- ============================================
local function debugLog(...)
    if Config.DebugMode then
        print("[AutoDodge Debug]", os.clock(), ...)
    end
end

local function getStates(char)
    if not char then return nil, nil, nil end
    local states = l_Workspace_0:FindFirstChild("States")
    if not states then return nil, nil, nil end
    local charState = states:FindFirstChild(char.Name)
    if not charState then return nil, nil, nil end
    return 
        charState:FindFirstChild("CharacterData"),
        charState:FindFirstChild("Occupied"),
        charState:FindFirstChild("PlayerData")
end

local function getDistance()
    if not character or not character.PrimaryPart then return math.huge end
    if not State.opponent or not State.opponent.PrimaryPart then return math.huge end
    return (character.PrimaryPart.Position - State.opponent.PrimaryPart.Position).Magnitude
end

-- ============================================
-- DODGE DIRECTION LOGIC
-- ============================================
local function calculateDodgeDirection(attackingHand)
    local mode = Config.DirectionMode
    
    if mode == "Smart" then
        -- Dodge opposite to attacking hand
        if attackingHand == "RightHand" then
            return "Left"
        elseif attackingHand == "LeftHand" then
            return "Right"
        end
        -- Fallback: check opponent position and dodge away
        if State.opponent and State.opponent.PrimaryPart and character and character.PrimaryPart then
            local toOpponent = (State.opponent.PrimaryPart.Position - character.PrimaryPart.Position).Unit
            local charRight = character.PrimaryPart.CFrame.RightVector
            local dot = toOpponent:Dot(charRight)
            return dot > 0 and "Left" or "Right"
        end
        return math.random() > 0.5 and "Left" or "Right"
        
    elseif mode == "Random" then
        return math.random() > 0.5 and "Left" or "Right"
        
    elseif mode == "Alternate" then
        State.alternateIndex = State.alternateIndex + 1
        return State.alternateIndex % 2 == 0 and "Left" or "Right"
        
    elseif mode == "Left" then
        return "Left"
        
    elseif mode == "Right" then
        return "Right"
    end
    
    return "Left"
end

-- ============================================
-- DODGE ELIGIBILITY CHECK
-- ============================================
local function canPerformDodge()
    if not Config.Enabled then return false end
    if not character or not character.PrimaryPart then return false end
    if not characterData or not occupied then return false end
    if State.isProcessing then return false end
    
    -- Check cooldown
    local timeSinceLastDodge = tick() - State.lastDodgeTime
    if timeSinceLastDodge < Config.DodgeCooldown then
        return false
    end
    
    -- Character attribute checks
    local blockedAttributes = {
        "BlockBroken", "StaminaBroken", "LocalSlowMo", 
        "UsingSpecial", "DenyDash", "NoDash"
    }
    
    for _, attr in ipairs(blockedAttributes) do
        if character:GetAttribute(attr) then
            debugLog("Blocked by attribute:", attr)
            return false
        end
    end
    
    -- CharacterData value checks
    local dataChecks = {
        { name = "Cutscene", block = true },
        { name = "Stunned", block = true },
        { name = "Stamina", minValue = 2 }
    }
    
    for _, check in ipairs(dataChecks) do
        local value = characterData:FindFirstChild(check.name)
        if value then
            if check.block and value.Value == true then
                debugLog("Blocked by data:", check.name)
                return false
            end
            if check.minValue and value.Value < check.minValue then
                debugLog("Insufficient:", check.name, value.Value)
                return false
            end
        end
    end
    
    -- Must be equipped (in combat mode)
    local equipped = occupied:FindFirstChild("Equipped")
    if not equipped or not equipped.Value then
        return false
    end
    
    -- Can't dodge if already dashing
    local dashing = occupied:FindFirstChild("Dashing")
    if dashing and dashing.Value then
        return false
    end
    
    return true
end

-- ============================================
-- ATTACK DETECTION
-- ============================================
local function detectIncomingAttack()
    if not State.opponent then return nil end
    
    local isPunching = State.opponent:GetAttribute("Punching")
    if not isPunching then return nil end
    
    local attackInfo = {
        landTime = State.opponent:GetAttribute("LandTime"),
        attackingHand = State.opponent:GetAttribute("AttackingHand"),
        isHeavy = State.opponent:GetAttribute("IsHeavy"),
        isUltimate = State.opponent:GetAttribute("IsUltimate"),
        isCharging = State.opponent:GetAttribute("Charging"),
        hyperArmor = State.opponent:GetAttribute("HyperArmor")
    }
    
    -- Filter by attack type
    if attackInfo.isUltimate and not Config.ReactToUltimate then return nil end
    if attackInfo.isHeavy and not attackInfo.isUltimate and not Config.ReactToHeavy then return nil end
    if not attackInfo.isHeavy and not attackInfo.isUltimate and not Config.ReactToLight then return nil end
    if attackInfo.isCharging and not Config.ReactToCharge then return nil end
    
    return attackInfo
end

-- ============================================
-- DODGE EXECUTION
-- ============================================
local function executeDodge(direction, isPerfect)
    if not canPerformDodge() then return false end
    
    State.isProcessing = true
    State.lastDodgeTime = tick()
    State.lastDodgeDirection = direction
    State.dodgeCount = State.dodgeCount + 1
    
    if isPerfect then
        State.perfectDodgeCount = State.perfectDodgeCount + 1
    end
    
    debugLog("Executing dodge:", direction, isPerfect and "(PERFECT)" or "")
    
    -- Set up for perfect dodge if applicable
    if isPerfect and Config.PriorityPerfect then
        character:SetAttribute("Perfect", true)
        character:SetAttribute("NeededDirection", direction)
    end
    
    -- Trigger the dodge using the appropriate method
    if ForceDashEvent then
        ForceDashEvent:Fire({ Direction = direction })
    elseif TryDashEvent then
        TryDashEvent:Fire()
    end
    
    -- Reset processing state
    task.delay(0.15, function()
        State.isProcessing = false
    end)
    
    return true
end

-- ============================================
-- MAIN UPDATE LOOP
-- ============================================
local function updateAutoDodge()
    if not Config.Enabled then return end
    if not character then return end
    
    -- Update opponent reference
    if occupied then
        local lockedOn = occupied:FindFirstChild("LockedOn")
        if lockedOn and lockedOn.Value then
            State.opponent = lockedOn.Value
            State.opponentData = getStates(State.opponent)
        else
            State.opponent = nil
            State.opponentData = nil
        end
    end
    
    if not State.opponent then return end
    
    -- Check distance
    local distance = getDistance()
    if distance < Config.MinDodgeDistance or distance > Config.MaxDodgeDistance then
        return
    end
    
    -- Detect incoming attack
    local attack = detectIncomingAttack()
    if not attack or not attack.landTime then return end
    
    -- Calculate timing
    local currentTime = l_Workspace_0:GetServerTimeNow()
    local timeUntilLand = attack.landTime - currentTime
    
    -- Determine dodge timing based on mode
    local dodgeOffset
    if Config.DodgeMode == "Perfect" then
        dodgeOffset = Config.PerfectDodgeOffset
    elseif Config.DodgeMode == "Quick" then
        dodgeOffset = Config.QuickDodgeOffset
    elseif Config.DodgeMode == "Safe" then
        dodgeOffset = Config.SafeDodgeOffset
    elseif Config.DodgeMode == "Aggressive" then
        dodgeOffset = Config.PerfectDodgeOffset * 0.9
    else
        dodgeOffset = Config.PerfectDodgeOffset
    end
    
    -- Add humanized timing variation if enabled
    if Config.HumanizedTiming then
        dodgeOffset = dodgeOffset + (math.random() * 0.03 - 0.015)
    end
    
    -- Check if it's time to dodge
    local shouldDodge = false
    local isPerfect = false
    
    -- Use game's timing calculation if available
    if GameplaySettings and GameplaySettings.GetTimeLeftToDodge then
        local timeLeftToDodge = GameplaySettings.GetTimeLeftToDodge(timeUntilLand)
        if timeLeftToDodge > 0 and timeLeftToDodge < 0.06 then
            shouldDodge = true
            isPerfect = true
        end
    end
    
    -- Fallback timing check
    if not shouldDodge and timeUntilLand > 0 and timeUntilLand <= dodgeOffset + 0.025 then
        shouldDodge = true
        isPerfect = (timeUntilLand <= Config.PerfectDodgeOffset + 0.02)
    end
    
    if shouldDodge then
        local direction = calculateDodgeDirection(attack.attackingHand)
        executeDodge(direction, isPerfect)
    end
end

-- ============================================
-- GUI SYSTEM
-- ============================================
local gui = nil

local function createGUI()
    if not Config.ShowGUI then return end
    
    pcall(function()
        -- Remove existing GUI
        local existing = localPlayer.PlayerGui:FindFirstChild("AutoDodgeGUI")
        if existing then existing:Destroy() end
        
        gui = Instance.new("ScreenGui")
        gui.Name = "AutoDodgeGUI"
        gui.ResetOnSpawn = false
        gui.Parent = localPlayer.PlayerGui
        
        local frame = Instance.new("Frame")
        frame.Name = "MainFrame"
        frame.Size = UDim2.new(0, 180, 0, 80)
        frame.Position = UDim2.new(0, 10, 0.5, -40)
        frame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
        frame.BackgroundTransparency = 0.3
        frame.BorderSizePixel = 0
        frame.Parent = gui
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = frame
        
        local title = Instance.new("TextLabel")
        title.Name = "Title"
        title.Size = UDim2.new(1, 0, 0, 25)
        title.Position = UDim2.new(0, 0, 0, 0)
        title.BackgroundTransparency = 1
        title.Text = "AUTO DODGE"
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 14
        title.Font = Enum.Font.GothamBold
        title.Parent = frame
        
        local status = Instance.new("TextLabel")
        status.Name = "Status"
        status.Size = UDim2.new(1, 0, 0, 20)
        status.Position = UDim2.new(0, 0, 0, 25)
        status.BackgroundTransparency = 1
        status.Text = "ENABLED"
        status.TextColor3 = Color3.fromRGB(100, 255, 100)
        status.TextSize = 12
        status.Font = Enum.Font.GothamBold
        status.Parent = frame
        
        local stats = Instance.new("TextLabel")
        stats.Name = "Stats"
        stats.Size = UDim2.new(1, 0, 0, 20)
        stats.Position = UDim2.new(0, 0, 0, 45)
        stats.BackgroundTransparency = 1
        stats.Text = "Dodges: 0 | Perfect: 0"
        status.TextColor3 = Color3.fromRGB(200, 200, 200)
        stats.TextSize = 10
        stats.Font = Enum.Font.Gotham
        stats.Parent = frame
        
        local hint = Instance.new("TextLabel")
        hint.Name = "Hint"
        hint.Size = UDim2.new(1, 0, 0, 15)
        hint.Position = UDim2.new(0, 0, 0, 62)
        hint.BackgroundTransparency = 1
        hint.Text = "Press " .. Config.ToggleKey.Name .. " to toggle"
        hint.TextColor3 = Color3.fromRGB(150, 150, 150)
        hint.TextSize = 9
        hint.Font = Enum.Font.Gotham
        hint.Parent = frame
    end)
end

local function updateGUI()
    if not gui then return end
    
    pcall(function()
        local frame = gui:FindFirstChild("MainFrame")
        if not frame then return end
        
        local status = frame:FindFirstChild("Status")
        if status then
            status.Text = Config.Enabled and "ENABLED" or "DISABLED"
            status.TextColor3 = Config.Enabled and Color3.fromRGB(100, 255, 100) or Color3.fromRGB(255, 100, 100)
        end
        
        local stats = frame:FindFirstChild("Stats")
        if stats then
            stats.Text = string.format("Dodges: %d | Perfect: %d", State.dodgeCount, State.perfectDodgeCount)
        end
    end)
end

-- ============================================
-- INPUT HANDLING
-- ============================================
local function onInput(input, processed)
    if processed then return end
    
    if input.KeyCode == Config.ToggleKey then
        Config.Enabled = not Config.Enabled
        print("[AutoDodge]", Config.Enabled and "ENABLED" or "DISABLED")
        updateGUI()
    end
end

-- ============================================
-- CHARACTER SETUP
-- ============================================
local function setupCharacter(newCharacter)
    character = newCharacter
    if not character then return end
    
    characterData, occupied, playerData = getStates(character)
    
    if not characterData or not occupied then
        task.delay(1, function()
            characterData, occupied, playerData = getStates(character)
        end)
    end
    
    debugLog("Character setup complete:", character.Name)
end

-- ============================================
-- INITIALIZATION
-- ============================================
local connections = {}

local function initialize()
    -- Setup character
    setupCharacter(localPlayer.Character)
    table.insert(connections, localPlayer.CharacterAdded:Connect(setupCharacter))
    
    -- Setup input
    table.insert(connections, l_UserInputService_0.InputBegan:Connect(onInput))
    
    -- Setup main loop
    table.insert(connections, l_RunService_0.Heartbeat:Connect(updateAutoDodge))
    
    -- Setup GUI update
    table.insert(connections, l_RunService_0.Heartbeat:Connect(updateGUI))
    
    -- Create GUI
    createGUI()
    
    print("========================================")
    print("  AUTO DODGE ADVANCED - INITIALIZED")
    print("========================================")
    print("  Toggle Key:", Config.ToggleKey.Name)
    print("  Dodge Mode:", Config.DodgeMode)
    print("  Direction Mode:", Config.DirectionMode)
    print("  Status:", Config.Enabled and "ENABLED" or "DISABLED")
    print("========================================")
end

local function cleanup()
    for _, conn in ipairs(connections) do
        if conn then conn:Disconnect() end
    end
    connections = {}
    
    if gui then
        gui:Destroy()
        gui = nil
    end
end

-- ============================================
-- MODULE EXPORT
-- ============================================
local AutoDodgeAdvanced = {
    Config = Config,
    State = State,
    Initialize = initialize,
    Cleanup = cleanup,
    
    -- Quick access functions
    Toggle = function()
        Config.Enabled = not Config.Enabled
        updateGUI()
        return Config.Enabled
    end,
    
    Enable = function()
        Config.Enabled = true
        updateGUI()
    end,
    
    Disable = function()
        Config.Enabled = false
        updateGUI()
    end,
    
    SetDodgeMode = function(mode)
        Config.DodgeMode = mode
    end,
    
    SetDirectionMode = function(mode)
        Config.DirectionMode = mode
    end,
    
    GetStats = function()
        return {
            totalDodges = State.dodgeCount,
            perfectDodges = State.perfectDodgeCount,
            lastDirection = State.lastDodgeDirection
        }
    end
}

-- Auto-initialize
initialize()

return AutoDodgeAdvanced
