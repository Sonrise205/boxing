local v0 = {
    RollbackTime = 0.15, 
    FrameDelay = 0.04, 
    DashM1Frames = 0, 
    DashM2Frames = 0, 
    M1FeintStart = 3, 
    M2FeintStart = 0, 
    DoubleDashingWindow = 0.8, 
    DoubleDashingClearTime = 1, 
    DoubleDashingStaminaCost = 30, 
    FeintReadStart = 5.5, 
    FeintRemoveFrames = 0.06666666666666667, 
    DoubleDashFeintMult = 2, 
    DualExchangeTime = 0.017, 
    DegradePunish = 20, 
    PerfectDodgeDamageCap = 7, 
    DoubleDashFrameMult = 1, 
    SlowDownDecrementRate = 0.020699999999999996, 
    MinPerfectDodgeMeterDistance = 11, 
    PerfectDodgeDecrementRateMult = 1, 
    EyeDamageCounterMult = 1.2, 
    VisualizeHurtboxes = false, 
    VisualizeHitboxes = false, 
    DebugMode = true, 
    DefaultHitboxSize = Vector3.new(3, 5.5, 0.699999988079071, 0), 
    FightingHitboxSize = Vector3.new(3, 6, 2.25, 0), 
    ADR_Light = 0.15, 
    ADR_Heavy = 0.2, 
    ADR_LightFeint = 0.1, 
    ADR_HeavyFeint = 0.1, 
    ADR_AntiHealMult = 0, 
    ADR_DamageMult = 0.9, 
    ComboResetTime = 0.65
};
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_SettingValueHelper_0 = require(l_ReplicatedStorage_0:WaitForChild("PrivateServerPlusModules"):WaitForChild("SettingValueHelper"));
v0.CalculateStartupMult = function(v3) --[[ Line: 59 ]] --[[ Name: CalculateStartupMult ]]
    -- upvalues: l_SettingValueHelper_0 (copy)
    local v4 = nil;
    if v3.CurrentPunch == 1 and not v3.IsHeavy and not v3.IsUltimate then
        v4 = 1.08;
    end;
    if v3.IsHeavy then
        v4 = 1.02;
    end;
    if v3.IsFeint then
        v4 = v4 / 1.05;
    end;
    v4 = if v4 then v4 * (v3.Character:GetAttribute("FirstMult") or 1) else 1;
    local l_StyleInfo_0 = v3.StyleInfo;
    if l_StyleInfo_0 then
        local _ = l_StyleInfo_0.CoreInfo;
    end;
    return v4 * ((if v3.IsHeavy then l_SettingValueHelper_0.GetValue("HeavyAttackSpeedMultiplier") else l_SettingValueHelper_0.GetValue("LightAttackSpeedMultiplier")) or 1);
end;
v0.GetTimeLeftToDodge = function(v7) --[[ Line: 100 ]] --[[ Name: GetTimeLeftToDodge ]]
    -- upvalues: v0 (copy)
    return v7 - workspace.Ping.Value / 2 + 0.045 + v0.RollbackTime;
end;
local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
v0.CanPerfectDodge = function(v9) --[[ Line: 107 ]] --[[ Name: CanPerfectDodge ]]
    -- upvalues: l_CommonUtilities_0 (copy)
    if not v9 then
        return;
    else
        local v10 = l_CommonUtilities_0.GetCharacterData(v9);
        if not v10 then
            return;
        elseif v9:GetAttribute("SlowMoDebounce") then
            return;
        elseif v9:GetAttribute("DoubleDashing") then
            return;
        elseif v9:GetAttribute("InStatic") then
            return;
        else
            local l_Value_0 = v10.Opponent.Value;
            if v10.PerfectDodgeMeter.Value <= 0.01 and l_Value_0 then
                local v12 = l_CommonUtilities_0.GetCharacterData(l_Value_0);
                if not v12 then
                    return;
                elseif v12.PerfectDodgeMeter.Value > 0.01 then
                    return;
                elseif (v9:GetAttribute("LastAttackAttempt") or 0) <= (l_Value_0:GetAttribute("LastAttackAttempt") or 0) then
                    return;
                end;
            end;
            return true;
        end;
    end;
end;
return v0;