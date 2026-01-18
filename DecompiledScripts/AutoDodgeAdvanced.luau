--[[
    AutoDodge Advanced v4.0 - Complete Exploit Suite
    
    Features found from comprehensive codebase scan:
    1. Auto-Dodge with perfect timing
    2. Unlimited Stamina/Block/Ultimate (client-side display)
    3. HyperArmor/SuperArmor toggle
    4. DashInvulnerable exploit
    5. SlowMoNoDamage protection
    6. Hitbox/Hurtbox visualization
    7. Auto-Counter after dodge
    8. Free Dash while stunned
    9. Speed modifier
    10. Auto-Attack mode
    11. ESP/Player Info display
]]

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-- Configuration
local Config = {
    -- Main Features
    Enabled = true,
    Debug = false,
    
    -- Dodge Settings
    AutoDodge = true,
    DodgeWindow = 0.15,
    DodgeMode = "Always", -- "Always", "WhenLocked", "WhenAttacked"
    DirectionMode = "Away", -- "Away", "Left", "Right", "Random"
    MultiAttempt = true,
    MaxAttempts = 3,
    
    -- Combat Exploits
    UnlimitedStamina = true,
    HyperArmor = false,
    SuperArmor = false,
    SlowMoNoDamage = false,
    DashInvulnerable = false,
    FreeDashWhileStunned = false,
    AutoCounterAfterDodge = false,
    
    -- Visual Exploits
    VisualizeHitboxes = false,
    VisualizeHurtboxes = false,
    ESPEnabled = false,
    ShowOpponentInfo = false,
    
    -- Speed Exploits
    SpeedHack = false,
    SpeedMultiplier = 1.5,
    
    -- Auto Attack
    AutoAttack = false,
    AutoAttackDelay = 0.3,
    
    -- Keybinds
    ToggleKey = Enum.KeyCode.RightBracket,
    DodgeToggleKey = Enum.KeyCode.P,
    StaminaToggleKey = Enum.KeyCode.O,
    HyperArmorKey = Enum.KeyCode.I,
    ESPKey = Enum.KeyCode.U,
    HitboxKey = Enum.KeyCode.Y,
    AutoAttackKey = Enum.KeyCode.T,
}

-- State tracking
local State = {
    lastDodge = 0,
    lastAttack = 0,
    dodgeAttempts = 0,
    currentAttackId = nil,
    perfectDodges = 0,
    totalDodges = 0,
    isFeatureActive = {},
    espObjects = {},
    hitboxVisuals = {},
}

-- Get character utilities
local function getCharacter()
    return LocalPlayer.Character
end

local function getHumanoid()
    local char = getCharacter()
    return char and char:FindFirstChild("Humanoid")
end

local function getHumanoidRootPart()
    local char = getCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

-- Get player state data
local function getPlayerState()
    local char = getCharacter()
    if not char then return nil end
    
    local states = Workspace:FindFirstChild("States")
    if not states then return nil end
    
    local playerState = states:FindFirstChild(char.Name)
    return playerState
end

local function getCharacterData()
    local state = getPlayerState()
    return state and state:FindFirstChild("CharacterData")
end

local function getOccupied()
    local state = getPlayerState()
    return state and state:FindFirstChild("Occupied")
end

local function getPlayerData()
    local state = getPlayerState()
    return state and state:FindFirstChild("PlayerData")
end

-- Get events
local Events = nil
local MobileEvents = nil
local ForceDashEvent = nil
local TryDashEvent = nil
local TryAttackBridge = nil
local TryAbilityBridge = nil

local function initializeEvents()
    pcall(function()
        Events = ReplicatedStorage:WaitForChild("Events", 5)
        MobileEvents = ReplicatedStorage:WaitForChild("MobileEvents", 5)
        
        if Events then
            ForceDashEvent = Events:FindFirstChild("ForceDash")
        end
        
        if MobileEvents then
            TryDashEvent = MobileEvents:FindFirstChild("TryDash")
        end
        
        -- Try to get BridgeNet2 references
        local success, bridgeNet = pcall(function()
            return shared.BridgeNet2 or require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2", 5))
        end)
        
        if success and bridgeNet then
            pcall(function()
                TryAttackBridge = bridgeNet.ReferenceBridge("TryAttack")
                TryAbilityBridge = bridgeNet.ReferenceBridge("TryAbility")
            end)
        end
    end)
    
    if Config.Debug then
        print("[AutoDodge] Events initialized:")
        print("  ForceDash:", ForceDashEvent and "FOUND" or "NOT FOUND")
        print("  TryDash:", TryDashEvent and "FOUND" or "NOT FOUND")
        print("  TryAttackBridge:", TryAttackBridge and "FOUND" or "NOT FOUND")
        print("  TryAbilityBridge:", TryAbilityBridge and "FOUND" or "NOT FOUND")
    end
end

-- Attribute management
local function setAttribute(name, value)
    local char = getCharacter()
    if char then
        pcall(function()
            char:SetAttribute(name, value)
        end)
    end
end

local function getAttribute(name)
    local char = getCharacter()
    if char then
        return char:GetAttribute(name)
    end
    return nil
end

-- Combat exploit functions
local function refillStats()
    if not Config.UnlimitedStamina then return end
    
    local charData = getCharacterData()
    if not charData then return end
    
    pcall(function()
        local stamina = charData:FindFirstChild("Stamina")
        local block = charData:FindFirstChild("BlockEnergy")
        local ult = charData:FindFirstChild("UltimateEnergy")
        local ability = charData:FindFirstChild("AbilityEnergy")
        
        if stamina then stamina.Value = 130 end
        if block then block.Value = 100 end
        if ult then ult.Value = 100 end
        if ability then ability.Value = 100 end
    end)
end

local function toggleHyperArmor(enabled)
    if enabled then
        setAttribute("HyperArmor", tick())
        setAttribute("SuperArmor", tick())
        State.isFeatureActive.HyperArmor = true
    else
        setAttribute("HyperArmor", nil)
        setAttribute("SuperArmor", nil)
        State.isFeatureActive.HyperArmor = false
    end
end

local function toggleSlowMoNoDamage(enabled)
    setAttribute("SlowMoNoDamage", enabled and tick() or nil)
    State.isFeatureActive.SlowMoNoDamage = enabled
end

local function toggleDashInvulnerable(enabled)
    setAttribute("DashInvulnerable", enabled and true or nil)
    State.isFeatureActive.DashInvulnerable = enabled
end

local function toggleFreeDash(enabled)
    setAttribute("ClientFreeDash", enabled and Workspace:GetServerTimeNow() or nil)
    setAttribute("FreeDash", enabled and true or nil)
    State.isFeatureActive.FreeDash = enabled
end

-- Dodge direction calculation
local function getDodgeDirection()
    local char = getCharacter()
    local hrp = getHumanoidRootPart()
    if not char or not hrp then return "Left", Vector3.new(-1, 0, 0) end
    
    local charData = getCharacterData()
    local opponent = charData and charData:FindFirstChild("Opponent") and charData.Opponent.Value
    
    local direction = "Left"
    local dirVector = Vector3.new(-1, 0, 0)
    
    if Config.DirectionMode == "Away" and opponent then
        local oppPos = opponent.PrimaryPart and opponent.PrimaryPart.Position
        local myPos = hrp.Position
        
        if oppPos then
            local awayDir = (myPos - oppPos).Unit
            local rightDot = hrp.CFrame.RightVector:Dot(awayDir)
            
            if rightDot > 0.3 then
                direction = "Right"
                dirVector = hrp.CFrame.RightVector
            else
                direction = "Left"
                dirVector = -hrp.CFrame.RightVector
            end
        end
    elseif Config.DirectionMode == "Left" then
        direction = "Left"
        dirVector = -hrp.CFrame.RightVector
    elseif Config.DirectionMode == "Right" then
        direction = "Right"
        dirVector = hrp.CFrame.RightVector
    elseif Config.DirectionMode == "Random" then
        if math.random() > 0.5 then
            direction = "Right"
            dirVector = hrp.CFrame.RightVector
        else
            direction = "Left"
            dirVector = -hrp.CFrame.RightVector
        end
    end
    
    return direction, dirVector
end

-- Execute dodge
local function executeDodge(direction, isPerfect)
    local char = getCharacter()
    if not char then return end
    
    State.lastDodge = tick()
    State.totalDodges = State.totalDodges + 1
    
    if isPerfect then
        State.perfectDodges = State.perfectDodges + 1
    end
    
    -- Set dodge attributes
    setAttribute("NeededDirection", direction)
    if isPerfect then
        setAttribute("Perfect", Workspace:GetServerTimeNow())
    end
    
    local _, dirVector = getDodgeDirection()
    
    -- Method 1: ForceDash with direction
    if ForceDashEvent then
        pcall(function()
            ForceDashEvent:Fire({
                Direction = direction,
                MoveVector = dirVector
            })
        end)
        if Config.Debug then print("[AutoDodge] Used ForceDash") end
        return true
    end
    
    -- Method 2: TryDash with simulated input
    if TryDashEvent then
        setAttribute("SimulatedInput", dirVector)
        pcall(function()
            TryDashEvent:Fire()
        end)
        task.delay(0.1, function()
            setAttribute("SimulatedInput", nil)
        end)
        if Config.Debug then print("[AutoDodge] Used TryDash") end
        return true
    end
    
    return false
end

-- Auto counter after dodge
local function autoCounter()
    if not Config.AutoCounterAfterDodge then return end
    if not TryAttackBridge then return end
    
    task.delay(0.05, function()
        pcall(function()
            TryAttackBridge:Fire({})
        end)
    end)
end

-- Check if should dodge
local function shouldDodge()
    if not Config.AutoDodge or not Config.Enabled then return false end
    
    local char = getCharacter()
    if not char then return false end
    
    local occupied = getOccupied()
    local charData = getCharacterData()
    
    if not occupied or not charData then return false end
    
    -- Check if already dashing
    local dashing = occupied:FindFirstChild("Dashing")
    if dashing and dashing.Value then return false end
    
    -- Check dodge cooldown
    if tick() - State.lastDodge < 0.3 then return false end
    
    -- Check mode
    if Config.DodgeMode == "WhenLocked" then
        local lockedOn = occupied:FindFirstChild("LockedOn")
        if not lockedOn or not lockedOn.Value then return false end
    end
    
    -- Check opponent state
    local opponent = charData:FindFirstChild("Opponent")
    if not opponent or not opponent.Value then return false end
    
    local oppChar = opponent.Value
    local punching = oppChar:GetAttribute("Punching")
    local landTime = oppChar:GetAttribute("LandTime")
    
    if not punching and not landTime then return false end
    
    -- Check timing for perfect dodge
    if landTime then
        local serverTime = Workspace:GetServerTimeNow()
        local timeUntilHit = landTime - serverTime
        local ping = Workspace:FindFirstChild("Ping") and Workspace.Ping.Value or 0.05
        
        local adjustedTime = timeUntilHit - (ping / 2) + 0.045 + 0.15 -- RollbackTime
        
        if adjustedTime > 0 and adjustedTime < Config.DodgeWindow then
            return true, true -- Should dodge, is perfect timing
        end
    end
    
    if punching then
        return true, false -- Should dodge, not perfect timing
    end
    
    return false
end

-- Auto attack function
local function autoAttack()
    if not Config.AutoAttack then return end
    if tick() - State.lastAttack < Config.AutoAttackDelay then return end
    
    local charData = getCharacterData()
    if not charData then return end
    
    local opponent = charData:FindFirstChild("Opponent")
    if not opponent or not opponent.Value then return end
    
    local occupied = getOccupied()
    if occupied then
        local stunned = occupied:FindFirstChild("Stunned")
        if stunned and stunned.Value then return end
    end
    
    State.lastAttack = tick()
    
    if TryAttackBridge then
        pcall(function()
            TryAttackBridge:Fire({})
        end)
    end
end

-- Hitbox visualization
local function createHitboxVisual(part, color)
    local visual = Instance.new("BoxHandleAdornment")
    visual.Name = "HitboxVisual"
    visual.Adornee = part
    visual.Size = part.Size
    visual.Color3 = color
    visual.Transparency = 0.5
    visual.AlwaysOnTop = true
    visual.ZIndex = 5
    visual.Parent = part
    return visual
end

local function updateHitboxVisualization()
    -- Clear existing
    for _, visual in pairs(State.hitboxVisuals) do
        if visual and visual.Parent then
            visual:Destroy()
        end
    end
    State.hitboxVisuals = {}
    
    if not Config.VisualizeHitboxes and not Config.VisualizeHurtboxes then return end
    
    -- Find hitboxes in Workspace
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj.Name == "Hitbox" and obj:IsA("BasePart") then
            if Config.VisualizeHitboxes then
                local visual = createHitboxVisual(obj, Color3.fromRGB(255, 0, 0))
                table.insert(State.hitboxVisuals, visual)
            end
        end
    end
    
    -- Find hurtboxes (player hitboxes)
    if Config.VisualizeHurtboxes then
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = player.Character.HumanoidRootPart
                local visual = createHitboxVisual(hrp, Color3.fromRGB(0, 255, 0))
                visual.Size = Vector3.new(3, 6, 2.25) -- FightingHitboxSize from GameplaySettings
                table.insert(State.hitboxVisuals, visual)
            end
        end
    end
end

-- ESP functions
local function createESP(player)
    if player == LocalPlayer then return end
    
    local esp = Instance.new("BillboardGui")
    esp.Name = "ESP_" .. player.Name
    esp.AlwaysOnTop = true
    esp.Size = UDim2.new(0, 100, 0, 50)
    esp.StudsOffset = Vector3.new(0, 3, 0)
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Text = player.Name
    nameLabel.Parent = esp
    
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Name = "InfoLabel"
    infoLabel.Size = UDim2.new(1, 0, 0.5, 0)
    infoLabel.Position = UDim2.new(0, 0, 0.5, 0)
    infoLabel.BackgroundTransparency = 1
    infoLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
    infoLabel.TextStrokeTransparency = 0
    infoLabel.Text = "?"
    infoLabel.Parent = esp
    
    State.espObjects[player] = esp
    return esp
end

local function updateESP()
    for player, esp in pairs(State.espObjects) do
        if not player.Parent or not Config.ESPEnabled then
            esp:Destroy()
            State.espObjects[player] = nil
        else
            if player.Character and player.Character:FindFirstChild("Head") then
                esp.Parent = player.Character.Head
                
                -- Update info
                if Config.ShowOpponentInfo then
                    local states = Workspace:FindFirstChild("States")
                    local playerState = states and states:FindFirstChild(player.Name)
                    local charData = playerState and playerState:FindFirstChild("CharacterData")
                    
                    if charData then
                        local health = player.Character:FindFirstChild("Humanoid")
                        local stamina = charData:FindFirstChild("Stamina")
                        local blocking = charData:FindFirstChild("Blocking")
                        
                        local info = ""
                        if health then info = info .. "HP:" .. math.floor(health.Health) .. " " end
                        if stamina then info = info .. "ST:" .. math.floor(stamina.Value) .. " " end
                        if blocking and blocking.Value then info = info .. "[BLOCKING]" end
                        
                        local infoLabel = esp:FindFirstChild("InfoLabel")
                        if infoLabel then
                            infoLabel.Text = info
                        end
                    end
                end
            else
                esp.Parent = nil
            end
        end
    end
    
    -- Create ESP for new players
    if Config.ESPEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and not State.espObjects[player] then
                createESP(player)
            end
        end
    end
end

-- Speed hack
local function updateSpeedHack()
    if not Config.SpeedHack then return end
    
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.WalkSpeed = 9 * Config.SpeedMultiplier
    end
end

-- Create GUI
local function createGUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "AutoDodgeGUI"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 280, 0, 400)
    mainFrame.Position = UDim2.new(0, 10, 0.5, -200)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = mainFrame
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 35)
    title.BackgroundColor3 = Color3.fromRGB(75, 25, 120)
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Text = "AutoDodge v4.0 - Exploit Suite"
    title.TextSize = 16
    title.Font = Enum.Font.GothamBold
    title.Parent = mainFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = title
    
    -- Status
    local status = Instance.new("TextLabel")
    status.Name = "Status"
    status.Size = UDim2.new(1, -10, 0, 60)
    status.Position = UDim2.new(0, 5, 0, 40)
    status.BackgroundTransparency = 1
    status.TextColor3 = Color3.fromRGB(200, 200, 200)
    status.Text = "Loading..."
    status.TextSize = 12
    status.Font = Enum.Font.Gotham
    status.TextXAlignment = Enum.TextXAlignment.Left
    status.TextYAlignment = Enum.TextYAlignment.Top
    status.Parent = mainFrame
    
    -- Feature list
    local features = Instance.new("TextLabel")
    features.Name = "Features"
    features.Size = UDim2.new(1, -10, 0, 280)
    features.Position = UDim2.new(0, 5, 0, 105)
    features.BackgroundTransparency = 1
    features.TextColor3 = Color3.fromRGB(180, 180, 180)
    features.Text = [[Features (Keybinds):
[]] - Toggle All
P - Auto Dodge
O - Unlimited Stamina
I - Hyper Armor
U - ESP
Y - Hitbox Viz
T - Auto Attack

Active Features:
(updating...)]]
    features.TextSize = 11
    features.Font = Enum.Font.Gotham
    features.TextXAlignment = Enum.TextXAlignment.Left
    features.TextYAlignment = Enum.TextYAlignment.Top
    features.Parent = mainFrame
    
    -- Minimize button
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Name = "Minimize"
    minimizeBtn.Size = UDim2.new(0, 25, 0, 25)
    minimizeBtn.Position = UDim2.new(1, -30, 0, 5)
    minimizeBtn.BackgroundTransparency = 1
    minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeBtn.Text = "-"
    minimizeBtn.TextSize = 20
    minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.Parent = mainFrame
    
    local isMinimized = false
    minimizeBtn.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            mainFrame.Size = UDim2.new(0, 280, 0, 35)
            minimizeBtn.Text = "+"
        else
            mainFrame.Size = UDim2.new(0, 280, 0, 400)
            minimizeBtn.Text = "-"
        end
    end)
    
    -- Make draggable
    local dragging, dragStart, startPos
    title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
        end
    end)
    
    title.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    return gui, status, features
end

-- Update GUI
local guiInstance, statusLabel, featuresLabel = nil, nil, nil

local function updateGUI()
    if not statusLabel or not featuresLabel then return end
    
    local rate = State.totalDodges > 0 and math.floor((State.perfectDodges / State.totalDodges) * 100) or 0
    
    statusLabel.Text = string.format(
        "Status: %s\nPerfect Dodges: %d/%d (%d%%)\nPing: %dms",
        Config.Enabled and "ACTIVE" or "DISABLED",
        State.perfectDodges, State.totalDodges, rate,
        math.floor((Workspace:FindFirstChild("Ping") and Workspace.Ping.Value or 0) * 1000)
    )
    
    local activeList = {}
    if Config.AutoDodge then table.insert(activeList, "AutoDodge") end
    if Config.UnlimitedStamina then table.insert(activeList, "UnlimitedStamina") end
    if Config.HyperArmor then table.insert(activeList, "HyperArmor") end
    if Config.SlowMoNoDamage then table.insert(activeList, "SlowMoNoDamage") end
    if Config.DashInvulnerable then table.insert(activeList, "DashInvuln") end
    if Config.FreeDashWhileStunned then table.insert(activeList, "FreeDash") end
    if Config.AutoCounterAfterDodge then table.insert(activeList, "AutoCounter") end
    if Config.ESPEnabled then table.insert(activeList, "ESP") end
    if Config.VisualizeHitboxes then table.insert(activeList, "HitboxViz") end
    if Config.AutoAttack then table.insert(activeList, "AutoAttack") end
    if Config.SpeedHack then table.insert(activeList, "SpeedHack") end
    
    featuresLabel.Text = [[Features (Keybinds):
[]] - Toggle All
P - Auto Dodge
O - Unlimited Stamina  
I - Hyper Armor
U - ESP
Y - Hitbox Viz
T - Auto Attack

Active Features:
]] .. (#activeList > 0 and table.concat(activeList, ", ") or "None")
end

-- Input handling
local function handleInput(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Config.ToggleKey then
        Config.Enabled = not Config.Enabled
        print("[AutoDodge] " .. (Config.Enabled and "ENABLED" or "DISABLED"))
    elseif input.KeyCode == Config.DodgeToggleKey then
        Config.AutoDodge = not Config.AutoDodge
        print("[AutoDodge] Auto Dodge: " .. (Config.AutoDodge and "ON" or "OFF"))
    elseif input.KeyCode == Config.StaminaToggleKey then
        Config.UnlimitedStamina = not Config.UnlimitedStamina
        print("[AutoDodge] Unlimited Stamina: " .. (Config.UnlimitedStamina and "ON" or "OFF"))
    elseif input.KeyCode == Config.HyperArmorKey then
        Config.HyperArmor = not Config.HyperArmor
        toggleHyperArmor(Config.HyperArmor)
        print("[AutoDodge] Hyper Armor: " .. (Config.HyperArmor and "ON" or "OFF"))
    elseif input.KeyCode == Config.ESPKey then
        Config.ESPEnabled = not Config.ESPEnabled
        Config.ShowOpponentInfo = Config.ESPEnabled
        print("[AutoDodge] ESP: " .. (Config.ESPEnabled and "ON" or "OFF"))
    elseif input.KeyCode == Config.HitboxKey then
        Config.VisualizeHitboxes = not Config.VisualizeHitboxes
        Config.VisualizeHurtboxes = Config.VisualizeHitboxes
        updateHitboxVisualization()
        print("[AutoDodge] Hitbox Viz: " .. (Config.VisualizeHitboxes and "ON" or "OFF"))
    elseif input.KeyCode == Config.AutoAttackKey then
        Config.AutoAttack = not Config.AutoAttack
        print("[AutoDodge] Auto Attack: " .. (Config.AutoAttack and "ON" or "OFF"))
    end
end

-- Main loop
local function mainLoop()
    -- Auto dodge check
    local should, isPerfect = shouldDodge()
    if should then
        local direction, _ = getDodgeDirection()
        local success = executeDodge(direction, isPerfect)
        
        if success and isPerfect and Config.AutoCounterAfterDodge then
            autoCounter()
        end
    end
    
    -- Refill stats
    refillStats()
    
    -- Update exploits
    if Config.HyperArmor and not State.isFeatureActive.HyperArmor then
        toggleHyperArmor(true)
    end
    
    if Config.FreeDashWhileStunned then
        toggleFreeDash(true)
    end
    
    -- Auto attack
    autoAttack()
    
    -- Speed hack
    updateSpeedHack()
end

-- Slower update loop
local function slowUpdate()
    updateESP()
    updateHitboxVisualization()
    updateGUI()
end

-- Initialize
local function initialize()
    print("[AutoDodge] Initializing v4.0...")
    
    -- Wait for character
    if not getCharacter() then
        LocalPlayer.CharacterAdded:Wait()
        task.wait(1)
    end
    
    -- Initialize events
    initializeEvents()
    
    -- Create GUI
    guiInstance, statusLabel, featuresLabel = createGUI()
    
    -- Connect input
    UserInputService.InputBegan:Connect(handleInput)
    
    -- Main loop - fast update for combat
    RunService.RenderStepped:Connect(mainLoop)
    
    -- Slow update for visuals
    task.spawn(function()
        while task.wait(0.5) do
            pcall(slowUpdate)
        end
    end)
    
    -- Character respawn handling
    LocalPlayer.CharacterAdded:Connect(function()
        task.wait(1)
        initializeEvents()
        State.perfectDodges = 0
        State.totalDodges = 0
    end)
    
    print("[AutoDodge] v4.0 Loaded!")
    print("[AutoDodge] Press ] to toggle, P for dodge, O for stamina")
end

-- Start
initialize()

return Config
