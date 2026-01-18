local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Rock, Paper, Scissors (2P)", 
        MainId = 19000160407, 
        StartId = 19000158963, 
        CharacterAnim = 19000161998, 
        OtherCharacterAnim = 19000164032, 
        Fail = 19000170038, 
        Win = 19000172001, 
        Rarity = "Mythic", 
        RequiresExtraInfo = true
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
local function _(v10, v11, v12) --[[ Line: 32 ]] --[[ Name: Lerp ]]
    return v10 + (v11 - v10) * v12;
end;
v0.GetExtraInfo = function() --[[ Line: 34 ]] --[[ Name: GetExtraInfo ]]
    return math.random(1, 10);
end;
v0.Start = function(v14) --[[ Line: 38 ]] --[[ Name: Start ]]
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
            task.delay(0.3333333333333333, function() --[[ Line: 89 ]]
                -- upvalues: v22 (ref), l_l_AnimHelper_0_Anim_1 (copy), v23 (copy)
                if v22 then
                    return;
                else
                    l_l_AnimHelper_0_Anim_1:AdjustWeight(v23.Weight);
                    return;
                end;
            end);
            task.delay(0.3333333333333333, function() --[[ Line: 94 ]]
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
            local function v31() --[[ Line: 104 ]] --[[ Name: Cleanup ]]
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
            }).Event:Connect(function() --[[ Line: 146 ]]
                -- upvalues: v31 (copy)
                v31();
            end);
            l_EmoteHelper_0.CreatePrompt({
                Character = v15, 
                Emote = script.Name, 
                DisplayName = v0.Metadata.DisplayName, 
                MaxDistance = 7
            });
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
v0.DualEmote = function(v32, v33, v34) --[[ Line: 163 ]] --[[ Name: DualEmote ]]
    -- upvalues: v0 (copy), l_EmoteHelper_0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy)
    if v32:GetAttribute("CurrentEmote") ~= v0.Metadata.Name then
        return;
    else
        l_EmoteHelper_0.ClearPrompts(v32);
        l_EmoteHelper_0.ClearPrompts(v33);
        l_EmoteHelper_0.StopAnimsHelper(v32);
        l_EmoteHelper_0.StopAnimsHelper(v33);
        local v35 = v32 and v32:FindFirstChild("Humanoid");
        local v36 = v35 and (v35:FindFirstChild("Animator") or v35);
        if not v36 then
            return;
        else
            local v37 = v33 and v33:FindFirstChild("Humanoid");
            local v38 = v37 and (v37:FindFirstChild("Animator") or v37);
            if not v38 then
                return;
            else
                v32:SetAttribute("InDualEmote", v0.Metadata.Name);
                v33:SetAttribute("InDualEmote", v0.Metadata.Name);
                local v39 = workspace.States[v32.Name];
                local l_CharacterData_1 = v39.CharacterData;
                local l_Occupied_1 = v39.Occupied;
                local v42 = workspace.States[v33.Name];
                local l_CharacterData_2 = v42.CharacterData;
                local l_Occupied_2 = v42.Occupied;
                local v45 = {};
                local v46 = {};
                local v47 = false;
                local l_Character_1 = l_Players_0.LocalPlayer.Character;
                local v49 = {
                    Name = "NoName", 
                    FadeIn = 0.3, 
                    Weight = 1, 
                    Speed = 1, 
                    NameFade = 0.3333333333333333, 
                    AnimId = v0.Metadata.CharacterAnim, 
                    Priority = Enum.AnimationPriority.Action, 
                    Animator = v36
                };
                if v32 == l_Character_1 then
                    v49.Priority = Enum.AnimationPriority.Action;
                end;
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v49);
                l_l_AnimHelper_0_Anim_2:Stop(0.01);
                local v51 = {
                    Name = "NoNameWhat", 
                    FadeIn = 0.3, 
                    Weight = 1, 
                    Speed = 1, 
                    NameFade = 0.3333333333333333, 
                    AnimId = v0.Metadata.OtherCharacterAnim, 
                    Priority = Enum.AnimationPriority.Action2, 
                    Animator = v38
                };
                if v33 == l_Character_1 then
                    v51.Priority = Enum.AnimationPriority.Action;
                end;
                local l_l_AnimHelper_0_Anim_3 = l_AnimHelper_0:CreateAnim(v51);
                l_l_AnimHelper_0_Anim_3:Stop(0.01);
                l_l_AnimHelper_0_Anim_2:Play(0, v51.Weight, v51.Speed);
                l_l_AnimHelper_0_Anim_3:Play(v51.FadeIn, v51.Weight, v51.Speed);
                task.defer(function() --[[ Line: 247 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_3 (copy), l_l_AnimHelper_0_Anim_2 (copy), v47 (ref)
                    repeat
                        task.wait(0.1);
                        l_l_AnimHelper_0_Anim_3.TimePosition = l_l_AnimHelper_0_Anim_2.TimePosition;
                    until v47;
                end);
                l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v33, 
                    Name = "Rustle2", 
                    Parent = v33.PrimaryPart, 
                    Volume = 0.35
                });
                task.delay(0.16666666666666666, function() --[[ Line: 260 ]]
                    -- upvalues: v47 (ref), l_EmoteHelper_0 (ref), v33 (copy)
                    if v47 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v33, 
                            Name = "Rustle4", 
                            Parent = v33.PrimaryPart, 
                            Volume = 0.25
                        });
                        task.wait(0.25);
                        if v47 then
                            return;
                        else
                            l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v33, 
                                Name = "Rustle5", 
                                Parent = v33.PrimaryPart, 
                                Volume = 0.65
                            });
                            task.wait(0.38333333333333336);
                            if v47 then
                                return;
                            else
                                l_EmoteHelper_0:PlaySound({
                                    SourceCharacter = v33, 
                                    Name = "Rustle5", 
                                    Parent = v33.PrimaryPart, 
                                    Volume = 0.65
                                });
                                task.wait(0.4);
                                if v47 then
                                    return;
                                else
                                    l_EmoteHelper_0:PlaySound({
                                        SourceCharacter = v33, 
                                        Name = "Rustle5", 
                                        Parent = v33.PrimaryPart, 
                                        Volume = 0.65
                                    });
                                    return;
                                end;
                            end;
                        end;
                    end;
                end);
                local v53 = script.Effects.Attachment:Clone();
                v53.Parent = v32.Head;
                local v54 = script.Effects.Attachment:Clone();
                v54.Parent = v33.Head;
                local v55 = nil;
                local v56 = nil;
                local v57 = v34 % 2 == 0;
                print(v34);
                if v34 == 0 then
                    v55 = "Rock";
                    v56 = "Scissors";
                elseif v34 <= 8 then
                    v55 = "Scissors";
                    v56 = "Paper";
                else
                    v55 = "Paper";
                    v56 = "Rock";
                end;
                print(v57);
                local v58 = {
                    Name = "Emote", 
                    FadeIn = 0.4, 
                    Weight = 1, 
                    Speed = 0.8, 
                    AnimId = v57 and v0.Metadata.Win or v0.Metadata.Fail, 
                    Priority = Enum.AnimationPriority.Core, 
                    Animator = v36
                };
                local l_l_AnimHelper_0_Anim_4 = l_AnimHelper_0:CreateAnim(v58);
                l_l_AnimHelper_0_Anim_4:Stop(0.01);
                v58.AnimId = v57 and v0.Metadata.Fail or v0.Metadata.Win;
                v58.Animator = v38;
                local l_l_AnimHelper_0_Anim_5 = l_AnimHelper_0:CreateAnim(v58);
                l_l_AnimHelper_0_Anim_5:Stop(0.01);
                l_l_AnimHelper_0_Anim_4:Play(v58.FadeIn, v58.Weight, 0);
                l_l_AnimHelper_0_Anim_5:Play(v58.FadeIn, v58.Weight, 0);
                task.delay(1.2333333333333334, function() --[[ Line: 348 ]]
                    -- upvalues: v47 (ref), v53 (copy), v57 (copy), v55 (ref), v56 (ref), v54 (copy), l_EmoteHelper_0 (ref), v32 (copy), l_Character_1 (copy), v33 (copy), l_l_AnimHelper_0_Anim_2 (copy), l_l_AnimHelper_0_Anim_3 (copy), l_l_AnimHelper_0_Anim_4 (copy), l_l_AnimHelper_0_Anim_5 (copy), v58 (copy)
                    if v47 then
                        return;
                    else
                        v53.Orb:Emit(1);
                        v53.Ring:Emit(1);
                        v53[v57 and v55 or v56]:Emit(1);
                        v54.Orb:Emit(1);
                        v54.Ring:Emit(1);
                        v54[v57 and v56 or v55]:Emit(1);
                        if v55 == "Rock" or v56 == "Rock" then
                            l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v32, 
                                Name = "VineBoom", 
                                Parent = v32.PrimaryPart, 
                                Volume = 0.15
                            });
                        end;
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v32, 
                            Parent = v32.PrimaryPart, 
                            DirectCopy = script.SFX, 
                            Name = "Emote", 
                            ShouldWeld = true
                        });
                        task.wait(0.6333333333333333);
                        if v47 then
                            return;
                        else
                            if l_Character_1 == v32 or l_Character_1 == v33 then
                                l_EmoteHelper_0:PlaySound({
                                    SourceCharacter = v32, 
                                    Parent = v32.PrimaryPart, 
                                    DirectCopy = v57 and script.Win or script.Fail, 
                                    Name = "Emote", 
                                    ShouldWeld = true
                                });
                            end;
                            task.wait(0.2);
                            if v47 then
                                return;
                            else
                                l_l_AnimHelper_0_Anim_2:Stop(0.3333333333333333);
                                l_l_AnimHelper_0_Anim_3:Stop(0.3333333333333333);
                                l_l_AnimHelper_0_Anim_4.Priority = Enum.AnimationPriority.Action;
                                l_l_AnimHelper_0_Anim_5.Priority = Enum.AnimationPriority.Action;
                                l_l_AnimHelper_0_Anim_4:AdjustSpeed(v58.Speed);
                                l_l_AnimHelper_0_Anim_5:AdjustSpeed(v58.Speed);
                                return;
                            end;
                        end;
                    end;
                end);
                local function v65() --[[ Line: 402 ]] --[[ Name: Cleanup ]]
                    -- upvalues: v47 (ref), v45 (copy), v46 (copy), l_l_AnimHelper_0_Anim_2 (copy), l_l_AnimHelper_0_Anim_3 (copy), l_l_AnimHelper_0_Anim_4 (copy), l_l_AnimHelper_0_Anim_5 (copy), l_Character_1 (copy), v32 (copy), v33 (copy), l_Occupied_1 (copy), l_Occupied_2 (copy), v0 (ref)
                    if v47 then
                        return;
                    else
                        v47 = true;
                        for _, v62 in v45 do
                            v62:Disconnect();
                        end;
                        for _, v64 in v46 do
                            v64:Pause();
                        end;
                        l_l_AnimHelper_0_Anim_2.Looped = false;
                        l_l_AnimHelper_0_Anim_3.Looped = false;
                        l_l_AnimHelper_0_Anim_2:Stop(0.01);
                        l_l_AnimHelper_0_Anim_3:Stop(0.01);
                        if l_l_AnimHelper_0_Anim_4 then
                            l_l_AnimHelper_0_Anim_4.Looped = false;
                            l_l_AnimHelper_0_Anim_4:Stop(0.01);
                        end;
                        if l_l_AnimHelper_0_Anim_5 then
                            l_l_AnimHelper_0_Anim_5.Looped = false;
                            l_l_AnimHelper_0_Anim_5:Stop(0.01);
                        end;
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
                local l_LookVector_0 = v32.PrimaryPart.CFrame.LookVector;
                local l_LookVector_1 = v33.PrimaryPart.CFrame.LookVector;
                local v68 = tick();
                if l_Character_1 == v32 or l_Character_1 == v33 then
                    v45[#v45 + 1] = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 486 ]]
                        -- upvalues: v68 (copy), l_TweenService_0 (ref), v32 (copy), v33 (copy), l_Occupied_1 (copy), l_LookVector_0 (copy), l_Occupied_2 (copy), l_LookVector_1 (copy)
                        local v69 = math.clamp((tick() - v68) / 0.7, 0, 1);
                        local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v69, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                        local v71 = CFrame.lookAt(v32.PrimaryPart.Position, v33.PrimaryPart.Position);
                        local l_Target_0 = l_Occupied_1.Target;
                        local l_l_LookVector_0_0 = l_LookVector_0;
                        l_Target_0.Value = l_l_LookVector_0_0 + (v71.LookVector - l_l_LookVector_0_0) * l_l_TweenService_0_Value_0;
                        l_Target_0 = l_Occupied_2.Target;
                        l_l_LookVector_0_0 = l_LookVector_1;
                        l_Target_0.Value = l_l_LookVector_0_0 + (-v71.LookVector - l_l_LookVector_0_0) * l_l_TweenService_0_Value_0;
                    end);
                end;
                local v74 = l_EmoteHelper_0.AddConnections({
                    CharacterData = l_CharacterData_1, 
                    Character = v32, 
                    Animator = v36
                });
                local v75 = l_EmoteHelper_0.AddConnections({
                    CharacterData = l_CharacterData_2, 
                    Character = v33, 
                    Animator = v38
                });
                v74.Event:Connect(function() --[[ Line: 508 ]]
                    -- upvalues: v65 (copy)
                    v65();
                end);
                v75.Event:Connect(function() --[[ Line: 512 ]]
                    -- upvalues: v65 (copy)
                    v65();
                end);
                task.wait(2.966666666666667);
                if v47 then
                    return;
                else
                    if l_l_AnimHelper_0_Anim_2 then
                        l_l_AnimHelper_0_Anim_2:Stop(0.3333333333333333);
                    end;
                    if l_l_AnimHelper_0_Anim_3 then
                        l_l_AnimHelper_0_Anim_3:Stop(0.3333333333333333);
                    end;
                    if l_l_AnimHelper_0_Anim_4 then
                        l_l_AnimHelper_0_Anim_4:Stop(0.8333333333333334);
                    end;
                    if l_l_AnimHelper_0_Anim_5 then
                        l_l_AnimHelper_0_Anim_5:Stop(0.8333333333333334);
                    end;
                    task.wait(0.75);
                    v65();
                    return;
                end;
            end;
        end;
    end;
end;
v0.Use = function(v76, v77, v78) --[[ Line: 539 ]] --[[ Name: Use ]]
    -- upvalues: v0 (copy)
    if not (v76:GetAttribute("CurrentEmote") == script.Name) then
        v0.Start(v76);
        return;
    else
        v0.DualEmote(v76, v77, v78);
        return;
    end;
end;
return v0;