--[[
    AutoDodge Advanced Script V2 - More reliable auto-dodge
    
    FIXES FROM V1:
    - Properly simulates player input direction before dodge
    - Wider timing window for more consistent triggers
    - Multiple dodge trigger methods for reliability
    - Continuous dodge attempts during attack window
    - Better state management
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
    
    -- Timing - WIDENED for more consistency
    EarlyDodgeWindow = 0.35,      -- Start checking this early
    LateDodgeWindow = 0.02,       -- Stop this late (after it's too late)
    PerfectDodgeOffset = 0.11666666666666667,
    
    -- Distance Settings
    MinDodgeDistance = 0,
    MaxDodgeDistance = 10,  -- Increased range
    
    -- Cooldowns
    DodgeCooldown = 0.25,   -- Slightly faster
    AttackTrackCooldown = 0.1, -- How often we can react to same attack
    
    -- Attack Type Reactions
    ReactToLight = true,
    ReactToHeavy = true,
    ReactToUltimate = true,
    ReactToCharge = true,
    
    -- Reliability Settings
    MultiAttempt = true,        -- Try multiple times per attack
    MaxAttemptsPerAttack = 3,   -- How many dodge attempts per attack
    AttemptInterval = 0.03,     -- Time between attempts
    
    -- Extra Features
    AutoBlock = true,
    PriorityPerfect = true,
    HumanizedTiming = false,    -- Disabled for consistency
    ForceDirection = true,      -- Force input direction before dodge
    
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
    missedDodges = 0,
    isProcessing = false,
    alternateIndex = 1,
    opponent = nil,
    opponentData = nil,
    
    -- Attack tracking
    currentAttackId = nil,
    attackAttempts = 0,
    lastAttackTime = 0
}

-- ============================================
-- SERVICES & MODULES
-- ============================================
local localPlayer = l_Players_0.LocalPlayer
local character = nil
local characterData = nil
local occupied = nil
local playerData = nil
local playerModule = nil
local controls = nil

-- Load game modules
local Modules = l_ReplicatedStorage_0:WaitForChild("Modules", 10)
local Styles, GameplaySettings

pcall(function()
    Styles = require(Modules:WaitForChild("Styles", 5))
    GameplaySettings = Styles.GameplaySettings
end)

-- Get events
local MobileEvents = l_ReplicatedStorage_0:WaitForChild("MobileEvents", 10)
local TryDashEvent = MobileEvents and MobileEvents:WaitForChild("TryDash", 5)
local Events = l_ReplicatedStorage_0:WaitForChild("Events", 10)
local ForceDashEvent = Events and Events:FindFirstChild("ForceDash")

-- Direction vectors for input simulation
local DirectionVectors = {
    Left = Vector3.new(-1, 0, 0),
    Right = Vector3.new(1, 0, 0),
    Forward = Vector3.new(0, 0, -1),
    Backward = Vector3.new(0, 0, 1)
}

-- ============================================
-- UTILITY FUNCTIONS
-- ============================================
local function debugLog(...)
    if Config.DebugMode then
        print("[AutoDodge]", string.format("%.3f", os.clock()), ...)
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

-- Get player controls for input manipulation
local function getPlayerControls()
    if controls then return controls end
    
    pcall(function()
        local playerScripts = localPlayer:WaitForChild("PlayerScripts", 5)
        if playerScripts then
            playerModule = require(playerScripts:WaitForChild("PlayerModule", 5))
            if playerModule then
                controls = playerModule:GetControls()
            end
        end
    end)
    
    return controls
end

-- ============================================
-- DODGE DIRECTION LOGIC
-- ============================================
local function calculateDodgeDirection(attackingHand)
    local mode = Config.DirectionMode
    
    if mode == "Smart" then
        -- Primary: Dodge opposite to attacking hand
        if attackingHand == "RightHand" then
            return "Left"
        elseif attackingHand == "LeftHand" then
            return "Right"
        end
        
        -- Fallback: Based on opponent position
        if State.opponent and State.opponent.PrimaryPart and character and character.PrimaryPart then
            local toOpponent = (State.opponent.PrimaryPart.Position - character.PrimaryPart.Position).Unit
            local charRight = character.PrimaryPart.CFrame.RightVector
            local dot = toOpponent:Dot(charRight)
            return dot > 0 and "Left" or "Right"
        end
        
        -- Last resort: Alternate
        State.alternateIndex = State.alternateIndex + 1
        return State.alternateIndex % 2 == 0 and "Left" or "Right"
        
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
local function canPerformDodge(ignoreProcessing)
    if not Config.Enabled then return false, "disabled" end
    if not character or not character.PrimaryPart then return false, "no character" end
    if not characterData or not occupied then return false, "no data" end
    if not ignoreProcessing and State.isProcessing then return false, "processing" end
    
    -- Check cooldown
    local timeSinceLastDodge = tick() - State.lastDodgeTime
    if timeSinceLastDodge < Config.DodgeCooldown then
        return false, "cooldown"
    end
    
    -- Character attribute checks
    local blockedAttributes = {
        "BlockBroken", "StaminaBroken", "LocalSlowMo", 
        "UsingSpecial", "DenyDash", "NoDash"
    }
    
    for _, attr in ipairs(blockedAttributes) do
        if character:GetAttribute(attr) then
            return false, "attr:" .. attr
        end
    end
    
    -- CharacterData checks
    local cutscene = characterData:FindFirstChild("Cutscene")
    if cutscene and cutscene.Value then return false, "cutscene" end
    
    local stunned = characterData:FindFirstChild("Stunned")
    if stunned and stunned.Value then return false, "stunned" end
    
    local stamina = characterData:FindFirstChild("Stamina")
    if stamina and stamina.Value < 2 then return false, "stamina" end
    
    -- Must be equipped
    local equipped = occupied:FindFirstChild("Equipped")
    if not equipped or not equipped.Value then return false, "not equipped" end
    
    -- Can't dodge if already dashing
    local dashing = occupied:FindFirstChild("Dashing")
    if dashing and dashing.Value then return false, "dashing" end
    
    return true, "ok"
end

-- ============================================
-- INPUT SIMULATION
-- ============================================
local function simulateInput(direction)
    local dirVector = DirectionVectors[direction]
    if not dirVector then return end
    
    -- Method 1: Set workspace input value if it exists
    pcall(function()
        local inputValue = l_Workspace_0:FindFirstChild("PlayerInput")
        if inputValue then
            inputValue.Value = dirVector
        end
    end)
    
    -- Method 2: Set character SimulatedInput attribute
    pcall(function()
        if character then
            character:SetAttribute("SimulatedInput", dirVector)
        end
    end)
    
    debugLog("Simulated input:", direction, dirVector)
end

local function clearSimulatedInput()
    pcall(function()
        if character then
            character:SetAttribute("SimulatedInput", nil)
        end
    end)
end

-- ============================================
-- ATTACK DETECTION
-- ============================================
local function detectIncomingAttack()
    if not State.opponent then return nil end
    
    local isPunching = State.opponent:GetAttribute("Punching")
    if not isPunching then return nil end
    
    local landTime = State.opponent:GetAttribute("LandTime")
    if not landTime then return nil end
    
    local attackInfo = {
        landTime = landTime,
        attackingHand = State.opponent:GetAttribute("AttackingHand"),
        isHeavy = State.opponent:GetAttribute("IsHeavy"),
        isUltimate = State.opponent:GetAttribute("IsUltimate"),
        isCharging = State.opponent:GetAttribute("Charging"),
        hyperArmor = State.opponent:GetAttribute("HyperArmor"),
        attackId = tostring(landTime) -- Unique ID for this attack
    }
    
    -- Filter by attack type
    if attackInfo.isUltimate and not Config.ReactToUltimate then return nil end
    if attackInfo.isHeavy and not attackInfo.isUltimate and not Config.ReactToHeavy then return nil end
    if not attackInfo.isHeavy and not attackInfo.isUltimate and not Config.ReactToLight then return nil end
    
    return attackInfo
end

-- ============================================
-- DODGE EXECUTION
-- ============================================
local function executeDodge(direction, isPerfect)
    local canDodge, reason = canPerformDodge(false)
    if not canDodge then 
        debugLog("Cannot dodge:", reason)
        return false 
    end
    
    State.isProcessing = true
    State.lastDodgeTime = tick()
    State.lastDodgeDirection = direction
    State.dodgeCount = State.dodgeCount + 1
    
    if isPerfect then
        State.perfectDodgeCount = State.perfectDodgeCount + 1
    end
    
    debugLog("DODGE!", direction, isPerfect and "[PERFECT]" or "")
    
    -- Step 1: Set up perfect dodge attributes
    if Config.PriorityPerfect then
        pcall(function()
            character:SetAttribute("Perfect", true)
            character:SetAttribute("NeededDirection", direction)
        end)
    end
    
    -- Step 2: Simulate input in the dodge direction
    if Config.ForceDirection then
        simulateInput(direction)
    end
    
    -- Step 3: Small delay to let input register
    task.delay(0.01, function()
        -- Step 4: Try multiple methods to trigger dodge
        local dodgeTriggered = false
        
        -- Method 1: ForceDash event (preferred)
        if ForceDashEvent then
            pcall(function()
                ForceDashEvent:Fire({ Direction = direction })
                dodgeTriggered = true
                debugLog("Used ForceDash")
            end)
        end
        
        -- Method 2: TryDash mobile event
        if not dodgeTriggered and TryDashEvent then
            pcall(function()
                TryDashEvent:Fire()
                dodgeTriggered = true
                debugLog("Used TryDash")
            end)
        end
        
        -- Method 3: Direct keyboard simulation (backup)
        if not dodgeTriggered then
            pcall(function()
                -- Try to find and call the dash function directly
                local dashShared = Modules:FindFirstChild("DashShared")
                if dashShared then
                    debugLog("Attempted DashShared direct call")
                end
            end)
        end
        
        -- Clear simulated input after dodge
        task.delay(0.1, function()
            clearSimulatedInput()
        end)
    end)
    
    -- Reset processing state
    task.delay(0.2, function()
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
        else
            State.opponent = nil
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
    if not attack then 
        -- Reset attack tracking when no attack
        State.currentAttackId = nil
        State.attackAttempts = 0
        return 
    end
    
    -- Calculate timing
    local currentTime = l_Workspace_0:GetServerTimeNow()
    local timeUntilLand = attack.landTime - currentTime
    
    -- Check if this is a new attack
    if attack.attackId ~= State.currentAttackId then
        State.currentAttackId = attack.attackId
        State.attackAttempts = 0
        State.lastAttackTime = currentTime
        debugLog("New attack detected, time until land:", string.format("%.3f", timeUntilLand))
    end
    
    -- Check if we've exceeded max attempts for this attack
    if State.attackAttempts >= Config.MaxAttemptsPerAttack then
        return
    end
    
    -- Determine if we should dodge
    local shouldDodge = false
    local isPerfect = false
    
    -- Check timing window
    if timeUntilLand > 0 and timeUntilLand <= Config.EarlyDodgeWindow and timeUntilLand >= Config.LateDodgeWindow then
        -- We're in the dodge window
        
        -- Use game's timing calculation if available
        if GameplaySettings and GameplaySettings.GetTimeLeftToDodge then
            local timeLeftToDodge = GameplaySettings.GetTimeLeftToDodge(timeUntilLand)
            
            -- Wider perfect window for more consistency
            if timeLeftToDodge >= -0.05 and timeLeftToDodge <= 0.15 then
                shouldDodge = true
                isPerfect = (timeLeftToDodge >= 0 and timeLeftToDodge <= 0.08)
            end
        else
            -- Fallback: use our own timing
            if timeUntilLand <= Config.PerfectDodgeOffset + 0.05 then
                shouldDodge = true
                isPerfect = (timeUntilLand <= Config.PerfectDodgeOffset + 0.02)
            end
        end
    end
    
    if shouldDodge then
        -- Check if we can dodge
        local canDodge, reason = canPerformDodge(false)
        
        if canDodge then
            local direction = calculateDodgeDirection(attack.attackingHand)
            local success = executeDodge(direction, isPerfect)
            
            if success then
                State.attackAttempts = State.attackAttempts + 1
            end
        else
            -- If we can't dodge, increment attempt counter to avoid spam
            if reason ~= "cooldown" and reason ~= "processing" then
                State.attackAttempts = State.attackAttempts + 1
                State.missedDodges = State.missedDodges + 1
                debugLog("Missed dodge opportunity:", reason)
            end
        end
    end
end

-- ============================================
-- GUI SYSTEM
-- ============================================
local gui = nil

local function createGUI()
    if not Config.ShowGUI then return end
    
    pcall(function()
        local existing = localPlayer.PlayerGui:FindFirstChild("AutoDodgeGUI")
        if existing then existing:Destroy() end
        
        gui = Instance.new("ScreenGui")
        gui.Name = "AutoDodgeGUI"
        gui.ResetOnSpawn = false
        gui.Parent = localPlayer.PlayerGui
        
        local frame = Instance.new("Frame")
        frame.Name = "MainFrame"
        frame.Size = UDim2.new(0, 200, 0, 100)
        frame.Position = UDim2.new(0, 10, 0.5, -50)
        frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        frame.BackgroundTransparency = 0.2
        frame.BorderSizePixel = 0
        frame.Parent = gui
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 10)
        corner.Parent = frame
        
        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(100, 100, 100)
        stroke.Thickness = 1
        stroke.Parent = frame
        
        local title = Instance.new("TextLabel")
        title.Name = "Title"
        title.Size = UDim2.new(1, 0, 0, 28)
        title.Position = UDim2.new(0, 0, 0, 0)
        title.BackgroundTransparency = 1
        title.Text = "AUTO DODGE V2"
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 16
        title.Font = Enum.Font.GothamBlack
        title.Parent = frame
        
        local status = Instance.new("TextLabel")
        status.Name = "Status"
        status.Size = UDim2.new(1, 0, 0, 22)
        status.Position = UDim2.new(0, 0, 0, 28)
        status.BackgroundTransparency = 1
        status.Text = "ENABLED"
        status.TextColor3 = Color3.fromRGB(100, 255, 100)
        status.TextSize = 14
        status.Font = Enum.Font.GothamBold
        status.Parent = frame
        
        local stats = Instance.new("TextLabel")
        stats.Name = "Stats"
        stats.Size = UDim2.new(1, 0, 0, 20)
        stats.Position = UDim2.new(0, 0, 0, 50)
        stats.BackgroundTransparency = 1
        stats.Text = "Dodges: 0 | Perfect: 0"
        stats.TextColor3 = Color3.fromRGB(200, 200, 200)
        stats.TextSize = 11
        stats.Font = Enum.Font.Gotham
        stats.Parent = frame
        
        local modeLabel = Instance.new("TextLabel")
        modeLabel.Name = "Mode"
        modeLabel.Size = UDim2.new(1, 0, 0, 18)
        modeLabel.Position = UDim2.new(0, 0, 0, 68)
        modeLabel.BackgroundTransparency = 1
        modeLabel.Text = "Mode: " .. Config.DodgeMode .. " | Dir: " .. Config.DirectionMode
        modeLabel.TextColor3 = Color3.fromRGB(150, 150, 200)
        modeLabel.TextSize = 10
        modeLabel.Font = Enum.Font.Gotham
        modeLabel.Parent = frame
        
        local hint = Instance.new("TextLabel")
        hint.Name = "Hint"
        hint.Size = UDim2.new(1, 0, 0, 14)
        hint.Position = UDim2.new(0, 0, 0, 84)
        hint.BackgroundTransparency = 1
        hint.Text = "Press [" .. Config.ToggleKey.Name .. "] to toggle"
        hint.TextColor3 = Color3.fromRGB(120, 120, 120)
        hint.TextSize = 9
        hint.Font = Enum.Font.Gotham
        hint.Parent = frame
    end)
end

local lastGUIUpdate = 0
local function updateGUI()
    if not gui then return end
    if tick() - lastGUIUpdate < 0.1 then return end -- Throttle updates
    lastGUIUpdate = tick()
    
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
            local perfectRate = State.dodgeCount > 0 and math.floor((State.perfectDodgeCount / State.dodgeCount) * 100) or 0
            stats.Text = string.format("Dodges: %d | Perfect: %d (%d%%)", 
                State.dodgeCount, State.perfectDodgeCount, perfectRate)
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
        print("[AutoDodge V2]", Config.Enabled and "ENABLED" or "DISABLED")
        updateGUI()
    end
end

-- ============================================
-- CHARACTER SETUP
-- ============================================
local function setupCharacter(newCharacter)
    character = newCharacter
    if not character then return end
    
    -- Wait for character to fully load
    task.wait(0.5)
    
    characterData, occupied, playerData = getStates(character)
    
    if not characterData or not occupied then
        task.delay(1, function()
            characterData, occupied, playerData = getStates(character)
        end)
    end
    
    -- Get player controls
    getPlayerControls()
    
    debugLog("Character ready:", character.Name)
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
    
    -- Main loop - use RenderStepped for faster updates
    table.insert(connections, l_RunService_0.RenderStepped:Connect(updateAutoDodge))
    
    -- GUI updates on Heartbeat (lower priority)
    table.insert(connections, l_RunService_0.Heartbeat:Connect(updateGUI))
    
    createGUI()
    
    print("╔════════════════════════════════════════╗")
    print("║     AUTO DODGE V2 - INITIALIZED        ║")
    print("╠════════════════════════════════════════╣")
    print("║  Toggle: [" .. Config.ToggleKey.Name .. "]")
    print("║  Mode: " .. Config.DodgeMode)
    print("║  Direction: " .. Config.DirectionMode)
    print("║  Status: " .. (Config.Enabled and "ENABLED" or "DISABLED"))
    print("╚════════════════════════════════════════╝")
end

local function cleanup()
    for _, conn in ipairs(connections) do
        if conn then conn:Disconnect() end
    end
    connections = {}
    if gui then gui:Destroy() gui = nil end
end

-- ============================================
-- MODULE EXPORT
-- ============================================
local AutoDodgeAdvanced = {
    Config = Config,
    State = State,
    Initialize = initialize,
    Cleanup = cleanup,
    
    Toggle = function()
        Config.Enabled = not Config.Enabled
        updateGUI()
        return Config.Enabled
    end,
    
    Enable = function() Config.Enabled = true; updateGUI() end,
    Disable = function() Config.Enabled = false; updateGUI() end,
    
    SetDodgeMode = function(mode) Config.DodgeMode = mode end,
    SetDirectionMode = function(mode) Config.DirectionMode = mode end,
    
    -- Debug helpers
    PrintStats = function()
        print("=== AutoDodge Stats ===")
        print("Total Dodges:", State.dodgeCount)
        print("Perfect Dodges:", State.perfectDodgeCount)
        print("Missed Opportunities:", State.missedDodges)
        if State.dodgeCount > 0 then
            print("Perfect Rate:", math.floor((State.perfectDodgeCount / State.dodgeCount) * 100) .. "%")
        end
    end,
    
    EnableDebug = function() 
        Config.DebugMode = true 
        print("[AutoDodge] Debug mode enabled")
    end,
    DisableDebug = function() 
        Config.DebugMode = false 
    end
}

-- Auto-initialize
initialize()

return AutoDodgeAdvanced
