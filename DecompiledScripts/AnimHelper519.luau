local l_Players_0 = game:GetService("Players");
local l_Animation_0 = script:WaitForChild("Animation");
local v2 = {};
local function v7(v3) --[[ Line: 8 ]] --[[ Name: cleanupAnimator ]]
    -- upvalues: v2 (copy)
    local v4 = v2[v3];
    if v4 then
        for _, v6 in pairs(v4) do
            if v6 and v6:IsA("AnimationTrack") then
                v6:Stop(0);
                v6:Destroy();
            end;
        end;
        v2[v3] = nil;
    end;
end;
PlayerAdded = function(v8) --[[ Line: 22 ]] --[[ Name: PlayerAdded ]]
    -- upvalues: v2 (copy), v7 (copy)
    v8.CharacterAdded:Connect(function(v9) --[[ Line: 23 ]]
        -- upvalues: v2 (ref)
        local l_Humanoid_0 = v9:FindFirstChild("Humanoid");
        local v11 = l_Humanoid_0 and (l_Humanoid_0:FindFirstChild("Animator") or l_Humanoid_0);
        if v11 then
            v2[v11] = {};
        end;
    end);
    v8.CharacterRemoving:Connect(function(v12) --[[ Line: 31 ]]
        -- upvalues: v7 (ref)
        local l_Humanoid_1 = v12:FindFirstChild("Humanoid");
        local v14 = l_Humanoid_1 and (l_Humanoid_1:FindFirstChild("Animator") or l_Humanoid_1);
        if v14 then
            v7(v14);
        end;
    end);
end;
l_Players_0.PlayerAdded:Connect(PlayerAdded);
for _, v16 in ipairs(l_Players_0:GetPlayers()) do
    PlayerAdded(v16);
end;
local v17 = {
    [Enum.AnimationPriority.Core] = 1, 
    [Enum.AnimationPriority.Idle] = 2, 
    [Enum.AnimationPriority.Movement] = 3, 
    [Enum.AnimationPriority.Action] = 4, 
    [Enum.AnimationPriority.Action2] = 5, 
    [Enum.AnimationPriority.Action3] = 6, 
    [Enum.AnimationPriority.Action4] = 7
};
local function _(v18, v19, v20) --[[ Line: 56 ]] --[[ Name: Lerp ]]
    return v18 + (v19 - v18) * v20;
end;
return {
    CreateAnim = function(_, v23) --[[ Line: 60 ]] --[[ Name: CreateAnim ]]
        -- upvalues: v17 (copy), v2 (copy), l_Animation_0 (copy)
        local l_Animator_0 = v23.Animator;
        if not l_Animator_0 or not l_Animator_0:IsDescendantOf(game) then
            return;
        else
            local v25 = tonumber(v23.AnimId);
            if not v25 or v25 == 0 then
                return;
            else
                local v26 = v23.FadeIn or 0;
                local v27 = v23.Weight or 1;
                local v28 = v23.AnimSpeed or 1;
                local v29 = v23.Name or "Attack";
                local v30 = v23.Looped or false;
                local v31 = v23.NameFade or 0.1;
                local v32 = v23.Priority or Enum.AnimationPriority.Action2;
                if not v23.IsViewport and (not l_Animator_0.Parent or not l_Animator_0.Parent:IsDescendantOf(workspace)) then
                    return;
                else
                    local function _(v33) --[[ Line: 80 ]] --[[ Name: isServerAnim ]]
                        local v34 = true;
                        if v33 ~= "Server" then
                            v34 = v33 == "HitAnim";
                        end;
                        return v34;
                    end;
                    for _, v37 in l_Animator_0:GetPlayingAnimationTracks() do
                        if v17[v37.Priority] >= 4 then
                            local l_Name_0 = v37.Name;
                            local v39 = true;
                            if l_Name_0 ~= "Server" then
                                v39 = l_Name_0 == "HitAnim";
                            end;
                            local v40 = true;
                            if v29 ~= "Server" then
                                v40 = v29 == "HitAnim";
                            end;
                            if v39 and v29 == "Knockdown" then
                                v37:AdjustWeight(0.01, 0.05);
                                v37.Priority = Enum.AnimationPriority.Core;
                            elseif l_Name_0 == v29 or v40 and v39 then
                                v37:AdjustWeight(0.01, v31);
                            elseif l_Name_0 ~= "Emote" and l_Name_0 ~= "DualEmote" and l_Name_0 ~= "BlockClient" then
                                if l_Name_0 == "Remove10" then
                                    v37.Priority = Enum.AnimationPriority.Core;
                                    v37:AdjustWeight(0.01, 0.35);
                                elseif l_Name_0 == "Remove" or v17[v37.Priority] < v17[v32] then
                                    v37.Priority = Enum.AnimationPriority.Core;
                                    v37:AdjustWeight(0.01, 0.05);
                                end;
                            end;
                        end;
                    end;
                    if not v2[l_Animator_0] then
                        v2[l_Animator_0] = {};
                    end;
                    local v41 = v2[l_Animator_0][v25];
                    if v41 and (not v41:IsDescendantOf(game) or v41:GetDebugId() == "") then
                        v2[l_Animator_0][v25] = nil;
                        v41 = nil;
                    end;
                    if not v41 then
                        l_Animation_0.AnimationId = "rbxassetid://" .. v25;
                        v41 = l_Animator_0:LoadAnimation(l_Animation_0);
                        v2[l_Animator_0][v25] = v41;
                    else
                        v41:Stop(0);
                    end;
                    v41.Name = v29;
                    v41.Priority = v32;
                    v41.Looped = v30;
                    v27 = math.max(v27, 0.01);
                    v41:Play(v26, 1, v27);
                    v41:AdjustSpeed(v28);
                    if v23.OverrideWeight then
                        v41:AdjustWeight(v27);
                    else
                        v41:AdjustWeight(1);
                    end;
                    local l_TimePosition_0 = v23.TimePosition;
                    if l_TimePosition_0 then
                        task.spawn(function() --[[ Line: 159 ]]
                            -- upvalues: v41 (ref), l_TimePosition_0 (copy), v28 (ref)
                            repeat
                                task.wait();
                            until v41.IsPlaying;
                            if l_TimePosition_0 < 0 then
                                task.wait(0.1);
                                v41:AdjustSpeed(0.4);
                                task.wait((math.abs(l_TimePosition_0 * 1.4)));
                                v41:AdjustSpeed(v28);
                                return;
                            else
                                v41.TimePosition = l_TimePosition_0;
                                return;
                            end;
                        end);
                    end;
                    local l_SpeedDelay_0 = v23.SpeedDelay;
                    if l_SpeedDelay_0 then
                        task.delay(l_SpeedDelay_0.Time, function() --[[ Line: 176 ]]
                            -- upvalues: l_SpeedDelay_0 (copy), v28 (ref), v41 (ref)
                            local v44 = l_SpeedDelay_0.MaxIndex or 20;
                            v28 = l_SpeedDelay_0.TargetSpeed;
                            for v45 = 1, v44 do
                                local l_v41_0 = v41;
                                local l_v28_0 = v28;
                                local v48 = v45 / v44;
                                l_v41_0:AdjustSpeed(l_v28_0 + (0.15 - l_v28_0) * v48);
                                task.wait();
                            end;
                        end);
                    end;
                    local l_StopInfo_0 = v23.StopInfo;
                    if l_StopInfo_0 then
                        local v50 = l_StopInfo_0.StopDelay or 0;
                        local v51 = l_StopInfo_0.StopTime or 0;
                        local l_v51_0 = v51 --[[ copy: 17 -> 20 ]];
                        task.delay(v50, function() --[[ Line: 192 ]]
                            -- upvalues: v41 (ref), v28 (ref), l_v51_0 (copy)
                            if v41.Speed == v28 then
                                v41:Stop(l_v51_0);
                            end;
                        end);
                    end;
                    local v53 = (v41.Length > 0.05 and v41.Length or 3) / math.max(v41.Speed, 0.01) + 1;
                    task.delay(v53, function() --[[ Line: 202 ]]
                        -- upvalues: v2 (ref), l_Animator_0 (copy), v25 (copy), v41 (ref)
                        if v2[l_Animator_0] and v2[l_Animator_0][v25] == v41 then
                            v2[l_Animator_0][v25] = nil;
                            v41:Destroy();
                        end;
                    end);
                    return v41;
                end;
            end;
        end;
    end, 
    Restore = function(_, v55, v56, v57) --[[ Line: 213 ]] --[[ Name: Restore ]]
        v57 = v57 or 0.1;
        for _, v59 in v55:GetPlayingAnimationTracks() do
            if v59.Name == v56 then
                v59:AdjustWeight(1, v57);
            end;
        end;
    end
};