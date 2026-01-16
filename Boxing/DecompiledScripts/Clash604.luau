local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Clash (2P)", 
        MainId = 19006234215, 
        StartId = 19006187996, 
        CharacterAnim = 19006253028, 
        OtherCharacterAnim = 19006259459, 
        Rarity = "Mythic"
    }
};
local _ = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v10, v11, v12) --[[ Line: 27 ]] --[[ Name: Lerp ]]
    return v10 + (v11 - v10) * v12;
end;
v0.Start = function(v14) --[[ Line: 29 ]] --[[ Name: Start ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy)
    local v15 = v14:IsA("Player") and v14.Character or v14;
    local v16 = v15 and v15:FindFirstChild("Humanoid");
    local v17 = v16 and (v16:FindFirstChild("Animator") or v16);
    if not v17 then
        return;
    else
        local v18 = workspace.States[v15.Name];
        local l_CharacterData_0 = v18.CharacterData;
        local l_Occupied_0 = v18.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v15, 
            Emote = v0
        }) then
            return;
        else
            local v21 = {};
            local v22 = false;
            local v23 = {
                Name = "Emote", 
                FadeIn = 0.15, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.StartId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v17
            };
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v15_Attribute_0 = v15:GetAttribute("Owner");
            local v26 = true;
            if v15 ~= l_Character_0 then
                v26 = l_v15_Attribute_0 and l_v15_Attribute_0 == l_Character_0.Name;
            end;
            if not v26 then
                v23.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v23);
            v23.AnimId = v0.Metadata.MainId;
            v23.Looped = true;
            local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v23);
            l_l_AnimHelper_0_Anim_1:Stop(0.01);
            l_l_AnimHelper_0_Anim_1:Play(v23.FadeIn, 0.1, v23.Speed);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v23.FadeIn, v23.Weight, v23.Speed);
            task.delay(1, function() --[[ Line: 80 ]]
                -- upvalues: v22 (ref), l_l_AnimHelper_0_Anim_1 (copy), v23 (copy)
                if v22 then
                    return;
                else
                    l_l_AnimHelper_0_Anim_1:AdjustWeight(v23.Weight);
                    return;
                end;
            end);
            task.delay(0.3333333333333333, function() --[[ Line: 85 ]]
                -- upvalues: v22 (ref), l_EmoteHelper_0 (ref), v15 (copy)
                if v22 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v15, 
                        Name = "Rustle3", 
                        Parent = v15.PrimaryPart, 
                        Volume = 0.4
                    });
                    return;
                end;
            end);
            local function v31() --[[ Line: 95 ]] --[[ Name: Cleanup ]]
                -- upvalues: v22 (ref), v21 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v15 (copy), l_EmoteHelper_0 (ref), v14 (copy), v26 (copy), l_Occupied_0 (copy), v0 (ref)
                if v22 then
                    return;
                else
                    v22 = true;
                    for _, v30 in v21 do
                        v30:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_1.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_l_AnimHelper_0_Anim_1:Stop(0.01);
                    if v15:GetAttribute("InDualEmote") then
                        return;
                    else
                        l_EmoteHelper_0.ClearPrompts(v15);
                        l_EmoteHelper_0.DestroyCharacterMuteZone(v14);
                        if v26 then
                            l_Occupied_0.SpeedMult.Value = 0;
                            l_Occupied_0.LerpMult.Value = 0;
                        end;
                        if v15:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                            v15:SetAttribute("CurrentEmote", nil);
                        end;
                        return;
                    end;
                end;
            end;
            v15:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v15, 
                Animator = v17
            }).Event:Connect(function() --[[ Line: 137 ]]
                -- upvalues: v31 (copy)
                v31();
            end);
            if v15.Name ~= "AndreBerto" then
                l_EmoteHelper_0.CreatePrompt({
                    Character = v15, 
                    Emote = script.Name, 
                    DisplayName = v0.Metadata.DisplayName, 
                    MaxDistance = 7
                });
            end;
            task.wait(180);
            if v22 then
                return;
            else
                v31();
                return;
            end;
        end;
    end;
end;
v0.DualEmote = function(v32, v33) --[[ Line: 156 ]] --[[ Name: DualEmote ]]
    -- upvalues: v0 (copy), l_EmoteHelper_0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_ReplicatedStorage_0 (copy), l_TweenService_0 (copy), l_Modules_0 (copy), l_RunService_0 (copy)
    if v32:GetAttribute("CurrentEmote") ~= v0.Metadata.Name then
        return;
    else
        l_EmoteHelper_0.ClearPrompts(v32);
        l_EmoteHelper_0.ClearPrompts(v33);
        l_EmoteHelper_0.StopAnimsHelper(v33);
        local v34 = v32 and v32:FindFirstChild("Humanoid");
        local v35 = v34 and (v34:FindFirstChild("Animator") or v34);
        if not v35 then
            return;
        else
            local v36 = v33 and v33:FindFirstChild("Humanoid");
            local v37 = v36 and (v36:FindFirstChild("Animator") or v36);
            if not v37 then
                return;
            else
                v32:SetAttribute("InDualEmote", v0.Metadata.Name);
                v33:SetAttribute("InDualEmote", v0.Metadata.Name);
                local v38 = workspace.States[v32.Name];
                local l_CharacterData_1 = v38.CharacterData;
                local l_Occupied_1 = v38.Occupied;
                local v41 = workspace.States[v33.Name];
                local l_CharacterData_2 = v41.CharacterData;
                local l_Occupied_2 = v41.Occupied;
                local v44 = {};
                local v45 = {};
                local v46 = false;
                local l_Character_1 = l_Players_0.LocalPlayer.Character;
                local v48 = {
                    Name = "DualEmote", 
                    FadeIn = 0.1, 
                    Weight = 1, 
                    Speed = 1, 
                    AnimId = v0.Metadata.CharacterAnim, 
                    Priority = Enum.AnimationPriority.Action3, 
                    Animator = v35
                };
                if v32 == l_Character_1 then
                    v48.Priority = Enum.AnimationPriority.Action;
                end;
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v48);
                l_l_AnimHelper_0_Anim_2:Stop(0.01);
                local v50 = {
                    Name = "DualEmote", 
                    FadeIn = 0.1, 
                    Weight = 1, 
                    Speed = 1, 
                    AnimId = v0.Metadata.OtherCharacterAnim, 
                    Priority = Enum.AnimationPriority.Action3, 
                    Animator = v37
                };
                if v33 == l_Character_1 then
                    v50.Priority = Enum.AnimationPriority.Action;
                end;
                local l_l_AnimHelper_0_Anim_3 = l_AnimHelper_0:CreateAnim(v50);
                l_l_AnimHelper_0_Anim_3:Stop(0.01);
                l_l_AnimHelper_0_Anim_2:Play(0, v50.Weight, v50.Speed);
                l_l_AnimHelper_0_Anim_3:Play(v50.FadeIn, v50.Weight, v50.Speed);
                task.defer(function() --[[ Line: 237 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_3 (copy), l_l_AnimHelper_0_Anim_2 (copy), v46 (ref)
                    repeat
                        task.wait(0.1);
                        l_l_AnimHelper_0_Anim_3.TimePosition = l_l_AnimHelper_0_Anim_2.TimePosition;
                    until v46;
                end);
                l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v33, 
                    Name = "Rustle4", 
                    Parent = v33.PrimaryPart, 
                    Volume = 0.35
                });
                local v52 = nil;
                local v53 = nil;
                if l_Character_1 == v32 or l_Character_1 == v33 then
                    v52 = require(l_ReplicatedStorage_0.Modules.EffectHelper);
                    v53 = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
                end;
                task.delay(0.8166666666666667, function() --[[ Line: 258 ]]
                    -- upvalues: v46 (ref), l_EmoteHelper_0 (ref), v32 (copy), l_TweenService_0 (ref), v52 (ref), v53 (ref)
                    if v46 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v32, 
                            Parent = v32.PrimaryPart, 
                            DirectCopy = script.Slash, 
                            Name = "Emote", 
                            ShouldWeld = true
                        });
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v32, 
                            Parent = v32.PrimaryPart, 
                            DirectCopy = script.Lightning, 
                            Name = "Emote", 
                            ShouldWeld = true
                        });
                        local v54 = l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v32, 
                            Parent = v32.PrimaryPart, 
                            DirectCopy = script.Rattle, 
                            Name = "Emote", 
                            ShouldWeld = true
                        });
                        task.delay(2, function() --[[ Line: 285 ]]
                            -- upvalues: l_TweenService_0 (ref), v54 (copy)
                            l_TweenService_0:Create(v54, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Volume = 0
                            }):Play();
                        end);
                        if v52 then
                            local v55 = {
                                Preset = "LightHit", 
                                FoV = 67, 
                                WaitTime = 3, 
                                FadeIn = 0.05
                            };
                            local l_v55_0 = v55 --[[ copy: 1 -> 9 ]];
                            task.defer(function() --[[ Line: 297 ]]
                                -- upvalues: v52 (ref), l_v55_0 (copy)
                                v52.CameraShake(l_v55_0);
                            end);
                        end;
                        local v57 = script.Effects.Start:Clone();
                        v57.Parent = v32.PrimaryPart;
                        for _, v59 in v57:GetChildren() do
                            v59:Emit(v59:GetAttribute("EmitCount"));
                        end;
                        task.delay(0.3, function() --[[ Line: 310 ]]
                            -- upvalues: v57 (copy)
                            for _, v61 in v57:GetChildren() do
                                v61:Emit(v61:GetAttribute("EmitCount"));
                            end;
                            task.wait(5);
                            v57:Destroy();
                        end);
                        task.wait(2.3);
                        if v46 then
                            return;
                        else
                            l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v32, 
                                Parent = v32.PrimaryPart, 
                                DirectCopy = script.Final, 
                                Name = "Emote", 
                                ShouldWeld = true
                            });
                            if v52 then
                                local v62 = {
                                    Preset = "HardHit", 
                                    FoV = 67, 
                                    WaitTime = 0.3, 
                                    FadeIn = 0.3
                                };
                                local l_v62_0 = v62 --[[ copy: 2 -> 8 ]];
                                task.defer(function() --[[ Line: 340 ]]
                                    -- upvalues: v52 (ref), l_v62_0 (copy)
                                    v52.CameraShake(l_v62_0);
                                end);
                            end;
                            if v53 then
                                task.defer(function() --[[ Line: 346 ]]
                                    -- upvalues: v53 (ref), v32 (ref)
                                    v53.CreateBubble(v32.PrimaryPart.CFrame, Vector3.new(5, 5, 5, 0), 0.6, Vector3.new(55, 55, 55, 0), 0.5);
                                end);
                            end;
                            local v64 = script.Effects.Clash:Clone();
                            v64.Parent = v32.PrimaryPart;
                            for _, v66 in v64:GetChildren() do
                                v66:Emit(v66:GetAttribute("EmitCount"));
                            end;
                            task.delay(5, function() --[[ Line: 358 ]]
                                -- upvalues: v64 (copy)
                                v64:Destroy();
                            end);
                            return;
                        end;
                    end;
                end);
                local function v71() --[[ Line: 363 ]] --[[ Name: Cleanup ]]
                    -- upvalues: v46 (ref), v44 (copy), v45 (copy), l_l_AnimHelper_0_Anim_2 (copy), l_l_AnimHelper_0_Anim_3 (copy), l_Character_1 (copy), v32 (copy), v33 (copy), l_Occupied_1 (copy), l_Occupied_2 (copy), v0 (ref)
                    if v46 then
                        return;
                    else
                        v46 = true;
                        for _, v68 in v44 do
                            v68:Disconnect();
                        end;
                        for _, v70 in v45 do
                            v70:Pause();
                        end;
                        l_l_AnimHelper_0_Anim_2.Looped = false;
                        l_l_AnimHelper_0_Anim_3.Looped = false;
                        l_l_AnimHelper_0_Anim_2:Stop(0.01);
                        l_l_AnimHelper_0_Anim_3:Stop(0.01);
                        if l_Character_1 == v32 or l_Character_1 == v33 then
                            l_Occupied_1.SpeedMult.Value = 0;
                            l_Occupied_1.LerpMult.Value = 0;
                            l_Occupied_2.SpeedMult.Value = 0;
                            l_Occupied_2.LerpMult.Value = 0;
                        end;
                        l_Occupied_1.Target.Value = Vector3.new();
                        l_Occupied_2.Target.Value = Vector3.new();
                        if v32:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                            v32:SetAttribute("CurrentEmote", nil);
                        end;
                        if v32:GetAttribute("InDualEmote") == v0.Metadata.Name then
                            v32:SetAttribute("InDualEmote", nil);
                        end;
                        if v33:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                            v33:SetAttribute("CurrentEmote", nil);
                        end;
                        if v33:GetAttribute("InDualEmote") == v0.Metadata.Name then
                            v33:SetAttribute("InDualEmote", nil);
                        end;
                        return;
                    end;
                end;
                v33:SetAttribute("CurrentEmote", v0.Metadata.Name);
                l_Occupied_1.SpeedMult.Value = 1;
                l_Occupied_1.LerpMult.Value = 1;
                l_Occupied_2.SpeedMult.Value = 1;
                l_Occupied_2.LerpMult.Value = 1;
                if l_Character_1 == v33 then
                    local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
                    local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                    local v74 = CFrame.lookAt(v32.PrimaryPart.Position, v33.PrimaryPart.Position);
                    local _, v76, _ = l_RayHelper_0:GetRayWithWhiteList(v32.PrimaryPart.Position, (v74 * CFrame.new(0, 0, -6.4) * CFrame.Angles(0, 3.141592653589793, 0)).Position, 6.4, l_l_RayHelper_0_EnvironmentWhitelist_0);
                    v45[#v45 + 1] = l_TweenService_0:Create(v33.PrimaryPart, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        CFrame = CFrame.lookAt(v76, v32.PrimaryPart.Position)
                    }):Play();
                end;
                local l_LookVector_0 = v32.PrimaryPart.CFrame.LookVector;
                local l_LookVector_1 = v33.PrimaryPart.CFrame.LookVector;
                local v80 = tick();
                if l_Character_1 == v32 or l_Character_1 == v33 then
                    v44[#v44 + 1] = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 443 ]]
                        -- upvalues: v80 (copy), l_TweenService_0 (ref), v32 (copy), v33 (copy), l_Occupied_1 (copy), l_LookVector_0 (copy), l_Occupied_2 (copy), l_LookVector_1 (copy)
                        local v81 = math.clamp((tick() - v80) / 0.7, 0, 1);
                        local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v81, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                        local v83 = CFrame.lookAt(v32.PrimaryPart.Position, v33.PrimaryPart.Position);
                        local l_Target_0 = l_Occupied_1.Target;
                        local l_l_LookVector_0_0 = l_LookVector_0;
                        l_Target_0.Value = l_l_LookVector_0_0 + (v83.LookVector - l_l_LookVector_0_0) * l_l_TweenService_0_Value_0;
                        l_Target_0 = l_Occupied_2.Target;
                        l_l_LookVector_0_0 = l_LookVector_1;
                        l_Target_0.Value = l_l_LookVector_0_0 + (-v83.LookVector - l_l_LookVector_0_0) * l_l_TweenService_0_Value_0;
                    end);
                end;
                local v86 = l_EmoteHelper_0.AddConnections({
                    CharacterData = l_CharacterData_1, 
                    Character = v32, 
                    Animator = v35
                });
                local v87 = l_EmoteHelper_0.AddConnections({
                    CharacterData = l_CharacterData_2, 
                    Character = v33, 
                    Animator = v37
                });
                v86.Event:Connect(function() --[[ Line: 465 ]]
                    -- upvalues: v71 (copy)
                    v71();
                end);
                v87.Event:Connect(function() --[[ Line: 469 ]]
                    -- upvalues: v71 (copy)
                    v71();
                end);
                task.wait(3.5833333333333335);
                if v46 then
                    return;
                elseif v46 then
                    return;
                else
                    l_l_AnimHelper_0_Anim_2:Stop(0.75);
                    l_l_AnimHelper_0_Anim_3:Stop(0.75);
                    task.wait(0.75);
                    v71();
                    return;
                end;
            end;
        end;
    end;
end;
v0.Use = function(v88, v89) --[[ Line: 484 ]] --[[ Name: Use ]]
    -- upvalues: v0 (copy)
    if not (v88:GetAttribute("CurrentEmote") == script.Name) then
        v0.Start(v88);
        return;
    else
        v0.DualEmote(v88, v89);
        return;
    end;
end;
return v0;