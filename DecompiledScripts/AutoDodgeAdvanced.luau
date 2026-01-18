--[[
    Boxing Exploit Hub v4.0
    Made by: Rise
    
    Comprehensive exploit suite based on full codebase analysis
    Press U to hide/unhide UI
]]

-- Load Fluent UI Library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

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
    -- Dodge Settings
    AutoDodge = false,
    DodgeWindow = 0.15,
    DodgeMode = "Always",
    DirectionMode = "Away",
    MultiAttempt = true,
    MaxAttempts = 3,
    
    -- Combat Exploits
    UnlimitedStamina = false,
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
    
    -- Speed/Movement
    SpeedHack = false,
    SpeedMultiplier = 1.5,
    
    -- Auto Features
    AutoAttack = false,
    AutoAttackDelay = 0.3,
    AutoBlock = false,
    
    -- Misc
    AntiAFK = true,
    InfiniteJump = false,
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
    connections = {},
}

-- Utility Functions
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

local function getPlayerState()
    local char = getCharacter()
    if not char then return nil end
    local states = Workspace:FindFirstChild("States")
    if not states then return nil end
    return states:FindFirstChild(char.Name)
end

local function getCharacterData()
    local state = getPlayerState()
    return state and state:FindFirstChild("CharacterData")
end

local function getOccupied()
    local state = getPlayerState()
    return state and state:FindFirstChild("Occupied")
end

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

-- Get Events
local Events, MobileEvents, ForceDashEvent, TryDashEvent
local TryAttackBridge, TryAbilityBridge, HandleBlockBridge

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
        
        local success, bridgeNet = pcall(function()
            return shared.BridgeNet2 or require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2", 5))
        end)
        
        if success and bridgeNet then
            pcall(function()
                TryAttackBridge = bridgeNet.ReferenceBridge("TryAttack")
                TryAbilityBridge = bridgeNet.ReferenceBridge("TryAbility")
                HandleBlockBridge = bridgeNet.ReferenceBridge("HandleBlock")
            end)
        end
    end)
end

-- Combat Functions
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
    else
        setAttribute("HyperArmor", nil)
        setAttribute("SuperArmor", nil)
    end
end

local function toggleSlowMoNoDamage(enabled)
    setAttribute("SlowMoNoDamage", enabled and tick() or nil)
end

local function toggleDashInvulnerable(enabled)
    setAttribute("DashInvulnerable", enabled and true or nil)
end

local function toggleFreeDash(enabled)
    setAttribute("ClientFreeDash", enabled and Workspace:GetServerTimeNow() or nil)
    setAttribute("FreeDash", enabled and true or nil)
end

-- Dodge Functions
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
    elseif Config.DirectionMode == "Backward" then
        direction = "Backward"
        dirVector = -hrp.CFrame.LookVector
    end
    
    return direction, dirVector
end

local function executeDodge(direction, isPerfect)
    local char = getCharacter()
    if not char then return end
    
    State.lastDodge = tick()
    State.totalDodges = State.totalDodges + 1
    
    if isPerfect then
        State.perfectDodges = State.perfectDodges + 1
    end
    
    setAttribute("NeededDirection", direction)
    if isPerfect then
        setAttribute("Perfect", Workspace:GetServerTimeNow())
    end
    
    local _, dirVector = getDodgeDirection()
    
    if ForceDashEvent then
        pcall(function()
            ForceDashEvent:Fire({
                Direction = direction,
                MoveVector = dirVector
            })
        end)
        return true
    end
    
    if TryDashEvent then
        setAttribute("SimulatedInput", dirVector)
        pcall(function()
            TryDashEvent:Fire()
        end)
        task.delay(0.1, function()
            setAttribute("SimulatedInput", nil)
        end)
        return true
    end
    
    return false
end

local function shouldDodge()
    if not Config.AutoDodge then return false end
    
    local char = getCharacter()
    if not char then return false end
    
    local occupied = getOccupied()
    local charData = getCharacterData()
    
    if not occupied or not charData then return false end
    
    local dashing = occupied:FindFirstChild("Dashing")
    if dashing and dashing.Value then return false end
    
    if tick() - State.lastDodge < 0.3 then return false end
    
    if Config.DodgeMode == "WhenLocked" then
        local lockedOn = occupied:FindFirstChild("LockedOn")
        if not lockedOn or not lockedOn.Value then return false end
    end
    
    local opponent = charData:FindFirstChild("Opponent")
    if not opponent or not opponent.Value then return false end
    
    local oppChar = opponent.Value
    local punching = oppChar:GetAttribute("Punching")
    local landTime = oppChar:GetAttribute("LandTime")
    
    if not punching and not landTime then return false end
    
    if landTime then
        local serverTime = Workspace:GetServerTimeNow()
        local timeUntilHit = landTime - serverTime
        local ping = Workspace:FindFirstChild("Ping") and Workspace.Ping.Value or 0.05
        local adjustedTime = timeUntilHit - (ping / 2) + 0.045 + 0.15
        
        if adjustedTime > 0 and adjustedTime < Config.DodgeWindow then
            return true, true
        end
    end
    
    if punching then
        return true, false
    end
    
    return false
end

-- Auto Attack
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

-- Auto Block
local function autoBlock()
    if not Config.AutoBlock then return end
    
    local charData = getCharacterData()
    if not charData then return end
    
    local opponent = charData:FindFirstChild("Opponent")
    if not opponent or not opponent.Value then return end
    
    local oppChar = opponent.Value
    local punching = oppChar:GetAttribute("Punching")
    
    if punching and HandleBlockBridge then
        pcall(function()
            HandleBlockBridge:Fire(true)
        end)
    end
end

-- ESP Functions
local function createESP(player)
    if player == LocalPlayer then return end
    
    local esp = Instance.new("BillboardGui")
    esp.Name = "ESP_" .. player.Name
    esp.AlwaysOnTop = true
    esp.Size = UDim2.new(0, 150, 0, 60)
    esp.StudsOffset = Vector3.new(0, 3, 0)
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 0
    frame.Parent = esp
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(1, 0, 0.4, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Text = player.Name
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Parent = frame
    
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Name = "InfoLabel"
    infoLabel.Size = UDim2.new(1, 0, 0.6, 0)
    infoLabel.Position = UDim2.new(0, 0, 0.4, 0)
    infoLabel.BackgroundTransparency = 1
    infoLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
    infoLabel.TextStrokeTransparency = 0
    infoLabel.Text = "Loading..."
    infoLabel.TextScaled = true
    infoLabel.Font = Enum.Font.Gotham
    infoLabel.Parent = frame
    
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
                        if stamina then info = info .. "ST:" .. math.floor(stamina.Value) end
                        if blocking and blocking.Value then info = info .. "\n[BLOCKING]" end
                        
                        local infoLabel = esp:FindFirstChild("Frame") and esp.Frame:FindFirstChild("InfoLabel")
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
    
    if Config.ESPEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and not State.espObjects[player] then
                createESP(player)
            end
        end
    end
end

-- Hitbox Visualization
local function updateHitboxVisualization()
    for _, visual in pairs(State.hitboxVisuals) do
        if visual and visual.Parent then
            visual:Destroy()
        end
    end
    State.hitboxVisuals = {}
    
    if not Config.VisualizeHitboxes and not Config.VisualizeHurtboxes then return end
    
    if Config.VisualizeHurtboxes then
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = player.Character.HumanoidRootPart
                local visual = Instance.new("BoxHandleAdornment")
                visual.Name = "HurtboxVisual"
                visual.Adornee = hrp
                visual.Size = Vector3.new(3, 6, 2.25)
                visual.Color3 = player == LocalPlayer and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                visual.Transparency = 0.5
                visual.AlwaysOnTop = true
                visual.ZIndex = 5
                visual.Parent = hrp
                table.insert(State.hitboxVisuals, visual)
            end
        end
    end
end

-- Speed Hack
local function updateSpeedHack()
    if not Config.SpeedHack then return end
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.WalkSpeed = 9 * Config.SpeedMultiplier
    end
end

-- Infinite Jump
local function setupInfiniteJump()
    UserInputService.JumpRequest:Connect(function()
        if Config.InfiniteJump then
            local humanoid = getHumanoid()
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
end

-- Anti AFK
local function setupAntiAFK()
    local VirtualUser = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        if Config.AntiAFK then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
    end)
end

-- Main Loop
local function mainLoop()
    local should, isPerfect = shouldDodge()
    if should then
        local direction, _ = getDodgeDirection()
        executeDodge(direction, isPerfect)
    end
    
    refillStats()
    
    if Config.HyperArmor then
        toggleHyperArmor(true)
    end
    
    if Config.SlowMoNoDamage then
        toggleSlowMoNoDamage(true)
    end
    
    if Config.DashInvulnerable then
        toggleDashInvulnerable(true)
    end
    
    if Config.FreeDashWhileStunned then
        toggleFreeDash(true)
    end
    
    autoAttack()
    autoBlock()
    updateSpeedHack()
end

local function slowUpdate()
    updateESP()
    updateHitboxVisualization()
end

-- Create Fluent UI
local Window = Fluent:CreateWindow({
    Title = "Boxing Exploit Hub",
    SubTitle = "by Rise",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.U
})

-- Tabs
local Tabs = {
    Combat = Window:AddTab({ Title = "Combat", Icon = "sword" }),
    Movement = Window:AddTab({ Title = "Movement", Icon = "zap" }),
    Visuals = Window:AddTab({ Title = "Visuals", Icon = "eye" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "settings" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "save" })
}

-- ============== COMBAT TAB ==============
Tabs.Combat:AddParagraph({
    Title = "Auto Dodge",
    Content = "Automatically dodge incoming attacks with perfect timing"
})

Tabs.Combat:AddToggle("AutoDodge", {
    Title = "Auto Dodge",
    Default = false,
    Callback = function(value)
        Config.AutoDodge = value
    end
})

Tabs.Combat:AddDropdown("DodgeMode", {
    Title = "Dodge Mode",
    Values = {"Always", "WhenLocked", "WhenAttacked"},
    Multi = false,
    Default = "Always",
    Callback = function(value)
        Config.DodgeMode = value
    end
})

Tabs.Combat:AddDropdown("DirectionMode", {
    Title = "Dodge Direction",
    Values = {"Away", "Left", "Right", "Backward", "Random"},
    Multi = false,
    Default = "Away",
    Callback = function(value)
        Config.DirectionMode = value
    end
})

Tabs.Combat:AddSlider("DodgeWindow", {
    Title = "Dodge Window",
    Description = "Timing window for perfect dodge",
    Default = 0.15,
    Min = 0.05,
    Max = 0.3,
    Rounding = 2,
    Callback = function(value)
        Config.DodgeWindow = value
    end
})

Tabs.Combat:AddDivider()

Tabs.Combat:AddParagraph({
    Title = "Auto Combat",
    Content = "Automatic attack and block features"
})

Tabs.Combat:AddToggle("AutoAttack", {
    Title = "Auto Attack",
    Default = false,
    Callback = function(value)
        Config.AutoAttack = value
    end
})

Tabs.Combat:AddSlider("AutoAttackDelay", {
    Title = "Attack Delay",
    Description = "Delay between attacks",
    Default = 0.3,
    Min = 0.1,
    Max = 1,
    Rounding = 2,
    Callback = function(value)
        Config.AutoAttackDelay = value
    end
})

Tabs.Combat:AddToggle("AutoBlock", {
    Title = "Auto Block",
    Default = false,
    Callback = function(value)
        Config.AutoBlock = value
    end
})

Tabs.Combat:AddToggle("AutoCounter", {
    Title = "Auto Counter After Dodge",
    Default = false,
    Callback = function(value)
        Config.AutoCounterAfterDodge = value
    end
})

Tabs.Combat:AddDivider()

Tabs.Combat:AddParagraph({
    Title = "Combat Exploits",
    Content = "Warning: These may be detected"
})

Tabs.Combat:AddToggle("UnlimitedStamina", {
    Title = "Unlimited Stamina (Client)",
    Description = "Keeps stamina/block/ult at max (visual only)",
    Default = false,
    Callback = function(value)
        Config.UnlimitedStamina = value
    end
})

Tabs.Combat:AddToggle("HyperArmor", {
    Title = "Hyper Armor",
    Description = "Prevents knockback and interruption",
    Default = false,
    Callback = function(value)
        Config.HyperArmor = value
        if not value then
            toggleHyperArmor(false)
        end
    end
})

Tabs.Combat:AddToggle("SlowMoNoDamage", {
    Title = "SlowMo No Damage",
    Description = "No damage during slow-mo",
    Default = false,
    Callback = function(value)
        Config.SlowMoNoDamage = value
        if not value then
            toggleSlowMoNoDamage(false)
        end
    end
})

Tabs.Combat:AddToggle("DashInvulnerable", {
    Title = "Dash Invulnerable",
    Description = "Makes dashes invulnerable",
    Default = false,
    Callback = function(value)
        Config.DashInvulnerable = value
        if not value then
            toggleDashInvulnerable(false)
        end
    end
})

-- ============== MOVEMENT TAB ==============
Tabs.Movement:AddParagraph({
    Title = "Movement Features",
    Content = "Speed and movement modifications"
})

Tabs.Movement:AddToggle("SpeedHack", {
    Title = "Speed Hack",
    Default = false,
    Callback = function(value)
        Config.SpeedHack = value
        if not value then
            local humanoid = getHumanoid()
            if humanoid then
                humanoid.WalkSpeed = 9
            end
        end
    end
})

Tabs.Movement:AddSlider("SpeedMultiplier", {
    Title = "Speed Multiplier",
    Default = 1.5,
    Min = 1,
    Max = 5,
    Rounding = 1,
    Callback = function(value)
        Config.SpeedMultiplier = value
    end
})

Tabs.Movement:AddToggle("FreeDash", {
    Title = "Free Dash While Stunned",
    Description = "Allows dashing even when stunned",
    Default = false,
    Callback = function(value)
        Config.FreeDashWhileStunned = value
        if not value then
            toggleFreeDash(false)
        end
    end
})

Tabs.Movement:AddToggle("InfiniteJump", {
    Title = "Infinite Jump",
    Default = false,
    Callback = function(value)
        Config.InfiniteJump = value
    end
})

Tabs.Movement:AddButton({
    Title = "Teleport to Opponent",
    Description = "Teleports you to your current opponent",
    Callback = function()
        local charData = getCharacterData()
        if charData then
            local opponent = charData:FindFirstChild("Opponent")
            if opponent and opponent.Value and opponent.Value.PrimaryPart then
                local hrp = getHumanoidRootPart()
                if hrp then
                    hrp.CFrame = opponent.Value.PrimaryPart.CFrame * CFrame.new(0, 0, 3)
                    Fluent:Notify({
                        Title = "Teleport",
                        Content = "Teleported to " .. opponent.Value.Name,
                        Duration = 3
                    })
                end
            else
                Fluent:Notify({
                    Title = "Teleport",
                    Content = "No opponent found!",
                    Duration = 3
                })
            end
        end
    end
})

-- ============== VISUALS TAB ==============
Tabs.Visuals:AddParagraph({
    Title = "ESP Features",
    Content = "See players through walls"
})

Tabs.Visuals:AddToggle("ESP", {
    Title = "Player ESP",
    Default = false,
    Callback = function(value)
        Config.ESPEnabled = value
        Config.ShowOpponentInfo = value
        if not value then
            for _, esp in pairs(State.espObjects) do
                esp:Destroy()
            end
            State.espObjects = {}
        end
    end
})

Tabs.Visuals:AddDivider()

Tabs.Visuals:AddParagraph({
    Title = "Hitbox Visualization",
    Content = "See hitboxes and hurtboxes"
})

Tabs.Visuals:AddToggle("VisualizeHurtboxes", {
    Title = "Show Player Hurtboxes",
    Description = "Shows player hitbox areas",
    Default = false,
    Callback = function(value)
        Config.VisualizeHurtboxes = value
    end
})

Tabs.Visuals:AddToggle("VisualizeHitboxes", {
    Title = "Show Attack Hitboxes",
    Description = "Shows attack hitboxes",
    Default = false,
    Callback = function(value)
        Config.VisualizeHitboxes = value
    end
})

-- ============== MISC TAB ==============
Tabs.Misc:AddParagraph({
    Title = "Miscellaneous Features",
    Content = "Quality of life features"
})

Tabs.Misc:AddToggle("AntiAFK", {
    Title = "Anti AFK",
    Default = true,
    Callback = function(value)
        Config.AntiAFK = value
    end
})

Tabs.Misc:AddButton({
    Title = "Reset Stats Counter",
    Description = "Reset perfect dodge statistics",
    Callback = function()
        State.perfectDodges = 0
        State.totalDodges = 0
        Fluent:Notify({
            Title = "Stats Reset",
            Content = "Dodge statistics have been reset",
            Duration = 3
        })
    end
})

Tabs.Misc:AddButton({
    Title = "Show Current Stats",
    Description = "Display dodge statistics",
    Callback = function()
        local rate = State.totalDodges > 0 and math.floor((State.perfectDodges / State.totalDodges) * 100) or 0
        local ping = Workspace:FindFirstChild("Ping") and math.floor(Workspace.Ping.Value * 1000) or 0
        Fluent:Notify({
            Title = "Statistics",
            Content = string.format(
                "Perfect Dodges: %d/%d (%d%%)\nCurrent Ping: %dms",
                State.perfectDodges, State.totalDodges, rate, ping
            ),
            Duration = 5
        })
    end
})

Tabs.Misc:AddDivider()

Tabs.Misc:AddParagraph({
    Title = "Credits",
    Content = "Made by Rise\nBased on comprehensive codebase analysis\n\nPress U to hide/show UI"
})

-- ============== SETTINGS TAB ==============
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("BoxingExploitHub")
SaveManager:SetFolder("BoxingExploitHub/configs")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

-- Initialize
initializeEvents()
setupInfiniteJump()
setupAntiAFK()

-- Main Loops
RunService.RenderStepped:Connect(mainLoop)

task.spawn(function()
    while task.wait(0.5) do
        pcall(slowUpdate)
    end
end)

-- Character respawn handling
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    initializeEvents()
end)

-- Select default tab
Window:SelectTab(1)

-- Welcome notification
Fluent:Notify({
    Title = "Boxing Exploit Hub",
    Content = "Loaded successfully!\nMade by Rise\nPress U to hide/show",
    Duration = 5
})

print("[Boxing Hub] Loaded successfully! Made by Rise")
print("[Boxing Hub] Press U to hide/show UI")

return Config
