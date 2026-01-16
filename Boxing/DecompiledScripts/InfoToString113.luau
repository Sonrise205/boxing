local _ = game:GetService("ReplicatedStorage");
local v1 = {};
GetStringUntilEOF = function(v2, v3, v4) --[[ Line: 55 ]] --[[ Name: GetStringUntilEOF ]]
    local v5 = "";
    local v6 = #v2;
    local l_v3_0 = v3;
    while l_v3_0 <= v6 do
        local v8 = v2[l_v3_0];
        if v8 ~= v4 then
            v5 = v5 .. v8;
            l_v3_0 = l_v3_0 + 1;
        else
            break;
        end;
    end;
    return v5, l_v3_0;
end;
v1.ConvertAttack = function(v9) --[[ Line: 71 ]] --[[ Name: ConvertAttack ]]
    local v10 = {};
    local v11 = "";
    local l_CurrentCombo_0 = v9.CurrentCombo;
    local l_CurrentPunch_0 = v9.CurrentPunch;
    local l_IsHeavy_0 = v9.IsHeavy;
    local l_IsCharge_0 = v9.IsCharge;
    local l_IsUltimate_0 = v9.IsUltimate;
    local l_IsStart_0 = v9.IsStart;
    local l_IsLocked_0 = v9.IsLocked;
    local l_Victim_0 = v9.Victim;
    v11 = ((((((v11 .. tostring(l_CurrentCombo_0 < 10 and "0" .. l_CurrentCombo_0 or l_CurrentCombo_0)) .. tostring(l_CurrentPunch_0 < 10 and "0" .. l_CurrentPunch_0 or l_CurrentCombo_0)) .. tostring(l_IsHeavy_0 and "1" or "0")) .. tostring(l_IsUltimate_0 and "1" or "0")) .. tostring(l_IsCharge_0 and "1" or "0")) .. tostring(l_IsStart_0 and "1" or "0")) .. tostring(l_IsLocked_0 and "1" or "0");
    local v20 = math.clamp(v9.Ping, 0, 0.999);
    v11 = v11 .. string.format("%03f", v20):sub(3, 7);
    local l_Id_0 = v9.Id;
    table.insert(v10, v11 .. string.format("%05d", l_Id_0));
    if l_Victim_0 then
        table.insert(v10, l_Victim_0);
    end;
    return v10;
end;
v1.DeconvertAttack = function(v22) --[[ Line: 126 ]] --[[ Name: DeconvertAttack ]]
    local v23 = string.split(v22[1], "");
    return {
        CurrentCombo = tonumber(v23[1] .. v23[2]), 
        CurrentPunch = tonumber(v23[3] .. v23[4]), 
        IsHeavy = tonumber(v23[5]) == 1, 
        IsUltimate = tonumber(v23[6]) == 1, 
        IsCharge = tonumber(v23[7]) == 1, 
        IsStart = tonumber(v23[8]) == 1, 
        IsLocked = tonumber(v23[9]) == 1, 
        Ping = tonumber("0." .. v23[10] .. v23[11] .. v23[12] .. v23[13] .. v23[14]), 
        Id = tonumber(v23[15] .. v23[16] .. v23[17] .. v23[18] .. v23[19]), 
        Victim = v22[2]
    };
end;
v1.ConvertDash = function(v24) --[[ Line: 177 ]] --[[ Name: ConvertDash ]]
    local v25 = {
        [1] = v24.LookVector, 
        [2] = v24.Direction
    };
    local l_AlignInfo_0 = v24.AlignInfo;
    if l_AlignInfo_0 then
        v25[3] = l_AlignInfo_0.MaxDistance;
        v25[4] = l_AlignInfo_0.MaxTime;
        v25[5] = l_AlignInfo_0.IgnoreStun;
        v25[6] = l_AlignInfo_0.Responsiveness;
        v25[7] = l_AlignInfo_0.Velocity;
        v25[8] = l_AlignInfo_0.DashDelay;
        v25[9] = l_AlignInfo_0.LockPositionTime;
        v25[10] = l_AlignInfo_0.StartPosition;
        v25[11] = l_AlignInfo_0.LockedCharacter;
        v25[12] = l_AlignInfo_0.StartTime;
    end;
    return v25;
end;
v1.DeconvertDash = function(v27) --[[ Line: 203 ]] --[[ Name: DeconvertDash ]]
    local v28 = {
        LookVector = v27[1], 
        Direction = v27[2]
    };
    if #v27 > 2 then
        local v29 = {
            LookVector = v27[1], 
            MaxDistance = v27[3], 
            MaxTime = v27[4], 
            IgnoreStun = v27[5], 
            Responsiveness = v27[6], 
            Velocity = v27[7], 
            DashDelay = v27[8]
        };
        local v30 = false;
        if v28.Direction == "Forward" then
            v30 = v27[12];
        end;
        v29.LockedOn = v30;
        v29.LockPositionTime = v27[9];
        v29.StartPosition = v27[10];
        v29.LockedCharacter = v27[11];
        v29.StartTime = v27[12];
        v28.AlignInfo = v29;
    end;
    return v28;
end;
v1.ConvertAnimation = function(v31) --[[ Line: 231 ]] --[[ Name: ConvertAnimation ]]
    local l_StopInfo_0 = v31.StopInfo;
    local l_SpeedDelay_0 = v31.SpeedDelay;
    return {
        v31.Priority, 
        v31.Animator, 
        v31.AnimId or "-", 
        v31.NameFade or "-", 
        v31.FadeIn or "-", 
        v31.Weight or "-", 
        v31.Name or "-", 
        v31.Speed or "-", 
        v31.TimePosition or "-", 
        l_StopInfo_0 and l_StopInfo_0.StopDelay or "-", 
        l_StopInfo_0 and l_StopInfo_0.StopTime or "-", 
        l_StopInfo_0 and l_StopInfo_0.Weight or v31.Weight or "-", 
        l_SpeedDelay_0 and l_SpeedDelay_0.MaxIndex or "-", 
        l_SpeedDelay_0 and l_SpeedDelay_0.TargetSpeed or "-", 
        l_SpeedDelay_0 and l_SpeedDelay_0.Time or "-"
    };
end;
v1.DeconvertAnimation = function(v34) --[[ Line: 258 ]] --[[ Name: DeconvertAnimation ]]
    local v35 = {
        Priority = v34[1], 
        Animator = v34[2], 
        AnimId = v34[3], 
        NameFade = v34[4], 
        FadeIn = v34[5], 
        Weight = v34[6], 
        Name = v34[7], 
        AnimSpeed = v34[8], 
        TimePosition = v34[9]
    };
    if v34[10] ~= "-" then
        local v36 = {
            StopDelay = v34[10], 
            StopTime = v34[11]
        };
        if v34[12] ~= v35.Weight then
            v36.Weight = v34[12];
        end;
        v35.StopInfo = v36;
    end;
    if v34[13] ~= "-" then
        v35.SpeedDelay = {
            MaxIndex = v34[13], 
            TargetSpeed = v34[14], 
            Time = v34[15]
        };
    end;
    local v37 = {};
    for v38, v39 in v35 do
        if v39 ~= "-" then
            v37[v38] = v39;
        end;
    end;
    return v37;
end;
return v1;