--[[
    AutoDodge Script - Makes the player nearly invincible by automatically dodging incoming attacks
    
    This script monitors the opponent for incoming attacks and automatically triggers
    perfect dodges at the optimal time, similar to how NPCs perform perfect dodges.
    
    Features:
    - Automatic perfect dodge timing
    - Smart direction selection (dodges opposite to attacking hand)
    - Configurable dodge modes
    - Toggle on/off with keybind
]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage")
local l_RunService_0 = game:GetService("RunService")
local l_Players_0 = game:GetService("Players")
local l_UserInputService_0 = game:GetService("UserInputService")
local l_Workspace_0 = game:GetService("Workspace")

-- Configuration
local AutoDodgeConfig = {
    Enabled = true,                           -- Master toggle for auto-dodge
    ToggleKey = Enum.KeyCode.P,               -- Key to toggle auto-dodge on/off
    DodgeMode = "Smart",                      -- "Smart" = opposite of attacking hand, "Random" = random left/right, "Left" = always left, "Right" = always right
    DodgeTimingOffset = 0.11666666666666667,  -- Timing offset before attack lands (from NPC controllers)
    MinDistance = 0,                          -- Minimum distance to opponent to trigger auto-dodge (0 = always)
    MaxDistance = 8,                          -- Maximum distance to opponent for auto-dodge
    AutoBlock = false,                        -- Also auto-block when dodge is on cooldown
    DodgeCooldown = 0.35,                     -- Minimum time between auto-dodges
    PerfectDodgeMode = true,                  -- Try to trigger perfect dodges for slowmo
    ReactToHeavyAttacks = true,               -- React to heavy attacks
    ReactToLightAttacks = true,               -- React to light attacks  
    ReactToUltimates = true,                  -- React to ultimate attacks
    DebugMode = false                         -- Print debug information
}

-- State variables
local lastDodgeTime = 0
local isProcessingDodge = false
local autoDodgeConnection = nil

-- Get required modules
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules")
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"))
local l_GameplaySettings_0 = l_Styles_0.GameplaySettings

-- Local player references
local localPlayer = l_Players_0.LocalPlayer
local character = nil
local characterData = nil
local occupied = nil
local opponent = nil
local opponentData = nil

-- Get the TryDash event/bridge
local l_MobileEvents_0 = l_ReplicatedStorage_0:WaitForChild("MobileEvents")
local l_TryDash_0 = l_MobileEvents_0:WaitForChild("TryDash")

-- Debug print function
local function debugPrint(...)
    if AutoDodgeConfig.DebugMode then
        print("[AutoDodge]", ...)
    end
end

-- Function to get character data from workspace states
local function getCharacterData(char)
    if not char then return nil end
    local states = l_Workspace_0:FindFirstChild("States")
    if not states then return nil end
    local charState = states:FindFirstChild(char.Name)
    if not charState then return nil end
    return charState:FindFirstChild("CharacterData")
end

-- Function to get occupied data from workspace states
local function getOccupiedData(char)
    if not char then return nil end
    local states = l_Workspace_0:FindFirstChild("States")
    if not states then return nil end
    local charState = states:FindFirstChild(char.Name)
    if not charState then return nil end
    return charState:FindFirstChild("Occupied")
end

-- Function to determine the best dodge direction
local function getDodgeDirection(attackingHand)
    if AutoDodgeConfig.DodgeMode == "Smart" then
        -- Dodge opposite to the attacking hand for best evasion
        if attackingHand == "RightHand" then
            return "Left"
        elseif attackingHand == "LeftHand" then
            return "Right"
        else
            -- Default to random if hand unknown
            return math.random() > 0.5 and "Left" or "Right"
        end
    elseif AutoDodgeConfig.DodgeMode == "Random" then
        return math.random() > 0.5 and "Left" or "Right"
    elseif AutoDodgeConfig.DodgeMode == "Left" then
        return "Left"
    elseif AutoDodgeConfig.DodgeMode == "Right" then
        return "Right"
    elseif AutoDodgeConfig.DodgeMode == "Backward" then
        return "Backward"
    else
        return "Left"
    end
end

-- Function to check if we can dodge
local function canDodge()
    if not character or not character.PrimaryPart then return false end
    if not characterData or not occupied then return false end
    
    -- Check cooldown
    if tick() - lastDodgeTime < AutoDodgeConfig.DodgeCooldown then
        return false
    end
    
    -- Check if already dodging
    if isProcessingDodge then return false end
    
    -- Check if we're in a state that allows dodging
    if character:GetAttribute("BlockBroken") then return false end
    if character:GetAttribute("StaminaBroken") then return false end
    if character:GetAttribute("LocalSlowMo") then return false end
    if character:GetAttribute("UsingSpecial") then return false end
    if character:GetAttribute("DenyDash") then return false end
    
    -- Check character data states
    local cutscene = characterData:FindFirstChild("Cutscene")
    if cutscene and cutscene.Value then return false end
    
    local stunned = characterData:FindFirstChild("Stunned")
    if stunned and stunned.Value then return false end
    
    local stamina = characterData:FindFirstChild("Stamina")
    if stamina and stamina.Value <= 1 then return false end
    
    -- Check if equipped (must be in fight mode)
    local equipped = occupied:FindFirstChild("Equipped")
    if not equipped or not equipped.Value then return false end
    
    -- Check if already dashing
    local dashing = occupied:FindFirstChild("Dashing")
    if dashing and dashing.Value then return false end
    
    return true
end

-- Function to check if opponent is attacking
local function isOpponentAttacking()
    if not opponent then return false, nil, nil end
    
    local isPunching = opponent:GetAttribute("Punching")
    if not isPunching then return false, nil, nil end
    
    local landTime = opponent:GetAttribute("LandTime")
    local attackingHand = opponent:GetAttribute("AttackingHand")
    local isHeavy = opponent:GetAttribute("IsHeavy")
    local isUltimate = opponent:GetAttribute("IsUltimate")
    
    -- Check attack type filters
    if isUltimate and not AutoDodgeConfig.ReactToUltimates then
        return false, nil, nil
    end
    if isHeavy and not isUltimate and not AutoDodgeConfig.ReactToHeavyAttacks then
        return false, nil, nil
    end
    if not isHeavy and not isUltimate and not AutoDodgeConfig.ReactToLightAttacks then
        return false, nil, nil
    end
    
    return true, landTime, attackingHand
end

-- Function to check distance to opponent
local function getDistanceToOpponent()
    if not character or not character.PrimaryPart then return math.huge end
    if not opponent or not opponent.PrimaryPart then return math.huge end
    
    return (character.PrimaryPart.Position - opponent.PrimaryPart.Position).Magnitude
end

-- Function to trigger the dodge
local function triggerDodge(direction)
    if not canDodge() then return end
    
    isProcessingDodge = true
    lastDodgeTime = tick()
    
    debugPrint("Triggering dodge:", direction)
    
    -- Set the perfect dodge attribute for slowmo potential
    if AutoDodgeConfig.PerfectDodgeMode then
        character:SetAttribute("Perfect", true)
        character:SetAttribute("NeededDirection", direction)
    end
    
    -- Fire the dodge event
    l_TryDash_0:Fire()
    
    -- Reset processing flag after a short delay
    task.delay(0.1, function()
        isProcessingDodge = false
    end)
end

-- Main auto-dodge loop
local function autoDodgeUpdate()
    if not AutoDodgeConfig.Enabled then return end
    if not character then return end
    
    -- Update opponent reference
    if occupied then
        local lockedOn = occupied:FindFirstChild("LockedOn")
        if lockedOn and lockedOn.Value then
            opponent = lockedOn.Value
        else
            opponent = nil
        end
    end
    
    if not opponent then return end
    
    -- Check distance
    local distance = getDistanceToOpponent()
    if distance < AutoDodgeConfig.MinDistance or distance > AutoDodgeConfig.MaxDistance then
        return
    end
    
    -- Check if opponent is attacking
    local attacking, landTime, attackingHand = isOpponentAttacking()
    if not attacking or not landTime then return end
    
    -- Calculate time until attack lands
    local currentTime = l_Workspace_0:GetServerTimeNow()
    local timeUntilLand = landTime - currentTime
    
    -- Get the optimal dodge timing using game's own calculation
    local timeLeftToDodge = l_GameplaySettings_0.GetTimeLeftToDodge(timeUntilLand)
    
    -- Check if it's time to dodge (slightly before the attack would land)
    -- We want to dodge when timeLeftToDodge is very close to 0 but still positive
    if timeLeftToDodge > 0 and timeLeftToDodge < 0.05 then
        local direction = getDodgeDirection(attackingHand)
        triggerDodge(direction)
    -- Alternative: dodge based on raw timing offset
    elseif timeUntilLand > 0 and timeUntilLand <= AutoDodgeConfig.DodgeTimingOffset + 0.02 then
        local direction = getDodgeDirection(attackingHand)
        triggerDodge(direction)
    end
end

-- Function to initialize character references
local function initializeCharacter(newCharacter)
    character = newCharacter
    if not character then return end
    
    characterData = getCharacterData(character)
    occupied = getOccupiedData(character)
    
    -- Wait for data if not immediately available
    if not characterData or not occupied then
        task.delay(1, function()
            if character then
                characterData = getCharacterData(character)
                occupied = getOccupiedData(character)
            end
        end)
    end
    
    debugPrint("Character initialized:", character.Name)
end

-- Toggle auto-dodge with keybind
local function onInputBegan(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == AutoDodgeConfig.ToggleKey then
        AutoDodgeConfig.Enabled = not AutoDodgeConfig.Enabled
        print("[AutoDodge]", AutoDodgeConfig.Enabled and "ENABLED" or "DISABLED")
    end
end

-- Initialize the auto-dodge system
local function initialize()
    -- Setup character
    initializeCharacter(localPlayer.Character)
    localPlayer.CharacterAdded:Connect(initializeCharacter)
    
    -- Setup input handling
    l_UserInputService_0.InputBegan:Connect(onInputBegan)
    
    -- Start the main update loop
    autoDodgeConnection = l_RunService_0.Heartbeat:Connect(autoDodgeUpdate)
    
    print("[AutoDodge] System initialized! Press", AutoDodgeConfig.ToggleKey.Name, "to toggle")
    print("[AutoDodge] Current status:", AutoDodgeConfig.Enabled and "ENABLED" or "DISABLED")
end

-- Cleanup function
local function cleanup()
    if autoDodgeConnection then
        autoDodgeConnection:Disconnect()
        autoDodgeConnection = nil
    end
end

-- Module return for external access/configuration
local AutoDodge = {
    Config = AutoDodgeConfig,
    Initialize = initialize,
    Cleanup = cleanup,
    Toggle = function()
        AutoDodgeConfig.Enabled = not AutoDodgeConfig.Enabled
        return AutoDodgeConfig.Enabled
    end,
    SetEnabled = function(enabled)
        AutoDodgeConfig.Enabled = enabled
    end,
    SetDodgeMode = function(mode)
        AutoDodgeConfig.DodgeMode = mode
    end,
    SetDebugMode = function(enabled)
        AutoDodgeConfig.DebugMode = enabled
    end
}

-- Auto-initialize when script runs
initialize()

return AutoDodge
