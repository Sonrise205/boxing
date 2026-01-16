local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Birthday Cake (2P)", 
        MainId = 18997462778, 
        StartId = 18998618787, 
        CharacterAnim = 18999425437, 
        OtherCharacterAnim = 18999534185, 
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
            local v29 = script.Part:Clone();
            v29.Parent = v15.RightHand;
            v29.Name = "BirthdayCake";
            local v30 = script.BirthdayCake:Clone();
            v30.Parent = v15.RightHand;
            v30.Part1 = v29;
            v30.Part0 = v15.RightHand;
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
            local function v34() --[[ Line: 104 ]] --[[ Name: Cleanup ]]
                -- upvalues: v22 (ref), v21 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v15 (copy), l_EmoteHelper_0 (ref), v14 (copy), v26 (copy), l_Occupied_0 (copy), v0 (ref), v30 (copy), v29 (copy)
                if v22 then
                    return;
                else
                    v22 = true;
                    for _, v32 in v21 do
                        v32:Disconnect();
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
                        v30:Destroy();
                        v29.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 2, math.random(10, 30) * 6, math.random(-10, 10) * 2);
                        v29.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                        task.delay(3, function() --[[ Line: 139 ]]
                            -- upvalues: v29 (ref)
                            if v29 then
                                v29:Destroy();
                            end;
                        end);
                        local _ = l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v15, 
                            Parent = v15.PrimaryPart, 
                            Name = "Fling", 
                            Speed = math.random(0.9, 1.1)
                        });
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
            }).Event:Connect(function() --[[ Line: 162 ]]
                -- upvalues: v34 (copy)
                v34();
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
                v34();
                return;
            end;
        end;
    end;
end;
v0.DualEmote = function(v35, v36) --[[ Line: 179 ]] --[[ Name: DualEmote ]]
    -- upvalues: v0 (copy), l_EmoteHelper_0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), l_Modules_0 (copy), l_RunService_0 (copy)
    print(v35:GetAttribute("CurrentEmote"));
    if v35:GetAttribute("CurrentEmote") ~= v0.Metadata.Name then
        return;
    else
        l_EmoteHelper_0.ClearPrompts(v35);
        l_EmoteHelper_0.ClearPrompts(v36);
        l_EmoteHelper_0.StopAnimsHelper(v36);
        local v37 = v35 and v35:FindFirstChild("Humanoid");
        local v38 = v37 and (v37:FindFirstChild("Animator") or v37);
        if not v38 then
            return;
        else
            local v39 = v36 and v36:FindFirstChild("Humanoid");
            local v40 = v39 and (v39:FindFirstChild("Animator") or v39);
            if not v40 then
                return;
            else
                v35:SetAttribute("InDualEmote", v0.Metadata.Name);
                v36:SetAttribute("InDualEmote", v0.Metadata.Name);
                local v41 = workspace.States[v35.Name];
                local l_CharacterData_1 = v41.CharacterData;
                local l_Occupied_1 = v41.Occupied;
                local v44 = workspace.States[v36.Name];
                local l_CharacterData_2 = v44.CharacterData;
                local l_Occupied_2 = v44.Occupied;
                local v47 = {};
                local v48 = {};
                local v49 = false;
                local l_Character_1 = l_Players_0.LocalPlayer.Character;
                local v51 = {
                    Name = "DualEmote", 
                    FadeIn = 0.1, 
                    Weight = 1, 
                    Speed = 1, 
                    AnimId = v0.Metadata.CharacterAnim, 
                    Priority = Enum.AnimationPriority.Action3, 
                    Animator = v38
                };
                if v35 == l_Character_1 then
                    v51.Priority = Enum.AnimationPriority.Action;
                end;
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v51);
                l_l_AnimHelper_0_Anim_2:Stop(0.01);
                local v53 = {
                    Name = "DualEmote", 
                    FadeIn = 0.1, 
                    Weight = 1, 
                    Speed = 1, 
                    AnimId = v0.Metadata.OtherCharacterAnim, 
                    Priority = Enum.AnimationPriority.Action3, 
                    Animator = v40
                };
                if v36 == l_Character_1 then
                    v53.Priority = Enum.AnimationPriority.Action;
                end;
                local l_l_AnimHelper_0_Anim_3 = l_AnimHelper_0:CreateAnim(v53);
                l_l_AnimHelper_0_Anim_3:Stop(0.01);
                l_l_AnimHelper_0_Anim_2:Play(0, v53.Weight, v53.Speed);
                l_l_AnimHelper_0_Anim_3:Play(v53.FadeIn, v53.Weight, v53.Speed);
                task.defer(function() --[[ Line: 261 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_3 (copy), l_l_AnimHelper_0_Anim_2 (copy), v49 (ref)
                    repeat
                        task.wait(0.1);
                        l_l_AnimHelper_0_Anim_3.TimePosition = l_l_AnimHelper_0_Anim_2.TimePosition;
                    until v49;
                end);
                local v55 = nil;
                local v56 = nil;
                for _, v58 in v35.RightHand:GetChildren() do
                    if v58.Name == "BirthdayCake" then
                        if v58:IsA("Motor6D") then
                            v55 = v58;
                        else
                            v56 = v58;
                        end;
                    end;
                end;
                l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v36, 
                    Name = "Rustle4", 
                    Parent = v36.PrimaryPart, 
                    Volume = 0.35
                });
                task.delay(0.8333333333333334, function() --[[ Line: 288 ]]
                    -- upvalues: v49 (ref), l_EmoteHelper_0 (ref), v36 (copy), v35 (copy), l_TweenService_0 (ref)
                    if v49 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v36, 
                            Name = "Rustle1", 
                            Parent = v36.PrimaryPart, 
                            Volume = 0.15
                        });
                        task.wait(0.9333333333333333);
                        if v49 then
                            return;
                        else
                            l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v35, 
                                Name = "Rustle3", 
                                Parent = v35.PrimaryPart, 
                                Volume = 0.15
                            });
                            task.wait(0.7333333333333333);
                            if v49 then
                                return;
                            else
                                l_EmoteHelper_0:PlaySound({
                                    SourceCharacter = v35, 
                                    Name = "Rustle5", 
                                    Parent = v35.PrimaryPart, 
                                    Volume = 0.6
                                });
                                local v59 = l_EmoteHelper_0:PlaySound({
                                    SourceCharacter = v35, 
                                    Parent = v35.PrimaryPart, 
                                    DirectCopy = script.Yay, 
                                    Name = "Emote", 
                                    ShouldWeld = true
                                });
                                task.delay(1.5, function() --[[ Line: 325 ]]
                                    -- upvalues: l_TweenService_0 (ref), v59 (copy)
                                    l_TweenService_0:Create(v59, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        Volume = 0
                                    }):Play();
                                end);
                                task.wait(0.3333333333333333);
                                if v49 then
                                    return;
                                else
                                    l_EmoteHelper_0:PlaySound({
                                        SourceCharacter = v35, 
                                        Name = "Rustle2", 
                                        Parent = v35.PrimaryPart, 
                                        Volume = 0.2
                                    });
                                    task.wait(0.7333333333333333);
                                    if v49 then
                                        return;
                                    else
                                        l_EmoteHelper_0:PlaySound({
                                            SourceCharacter = v35, 
                                            Name = "Rustle5", 
                                            Parent = v35.PrimaryPart, 
                                            Volume = 0.6
                                        });
                                        task.wait(1.2333333333333334);
                                        if v49 then
                                            return;
                                        else
                                            l_EmoteHelper_0:PlaySound({
                                                SourceCharacter = v35, 
                                                Name = "Rustle1", 
                                                Parent = v35.PrimaryPart, 
                                                Volume = 0.2
                                            });
                                            task.wait(1);
                                            if v49 then
                                                return;
                                            else
                                                l_EmoteHelper_0:PlaySound({
                                                    SourceCharacter = v35, 
                                                    Parent = v35.PrimaryPart, 
                                                    DirectCopy = script.Laugh, 
                                                    Name = "Emote", 
                                                    ShouldWeld = true
                                                });
                                                task.wait(1.1666666666666667);
                                                if v49 then
                                                    return;
                                                else
                                                    l_EmoteHelper_0:PlaySound({
                                                        SourceCharacter = v35, 
                                                        Parent = v35.PrimaryPart, 
                                                        DirectCopy = script.Angry, 
                                                        Name = "Emote", 
                                                        ShouldWeld = true
                                                    });
                                                    return;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end);
                local v60 = false;
                task.delay(4.15, function() --[[ Line: 383 ]]
                    -- upvalues: v49 (ref), v56 (ref), v55 (ref), l_EmoteHelper_0 (ref), v35 (copy), v60 (ref)
                    if v49 then
                        return;
                    elseif not v56 or not v55 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v35, 
                            Parent = v35.PrimaryPart, 
                            DirectCopy = script.Splat, 
                            Name = "Emote", 
                            ShouldWeld = true
                        });
                        task.wait(1.3333333333333333);
                        if v49 then
                            return;
                        else
                            l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v35, 
                                Name = "Rustle2", 
                                Parent = v35.PrimaryPart, 
                                Volume = 0.25
                            });
                            task.wait(0.36666666666666664);
                            if v49 then
                                return;
                            else
                                l_EmoteHelper_0:PlaySound({
                                    SourceCharacter = v35, 
                                    Parent = v35.PrimaryPart, 
                                    DirectCopy = script.Fall, 
                                    Name = "Emote", 
                                    ShouldWeld = true
                                });
                                task.wait(0.5833333333333334);
                                if v49 then
                                    return;
                                elseif v49 then
                                    return;
                                elseif not v56 or not v55 then
                                    return;
                                else
                                    v60 = true;
                                    v55:Destroy();
                                    return;
                                end;
                            end;
                        end;
                    end;
                end);
                local function v66() --[[ Line: 429 ]] --[[ Name: Cleanup ]]
                    -- upvalues: v49 (ref), v47 (copy), v48 (copy), l_l_AnimHelper_0_Anim_2 (copy), l_l_AnimHelper_0_Anim_3 (copy), l_Character_1 (copy), v35 (copy), v36 (copy), l_Occupied_1 (copy), l_Occupied_2 (copy), v0 (ref), v60 (ref), v56 (ref), v55 (ref), l_EmoteHelper_0 (ref)
                    if v49 then
                        return;
                    else
                        v49 = true;
                        for _, v62 in v47 do
                            v62:Disconnect();
                        end;
                        for _, v64 in v48 do
                            v64:Pause();
                        end;
                        l_l_AnimHelper_0_Anim_2.Looped = false;
                        l_l_AnimHelper_0_Anim_3.Looped = false;
                        l_l_AnimHelper_0_Anim_2:Stop(0.01);
                        l_l_AnimHelper_0_Anim_3:Stop(0.01);
                        if l_Character_1 == v35 or l_Character_1 == v36 then
                            l_Occupied_1.SpeedMult.Value = 0;
                            l_Occupied_1.LerpMult.Value = 0;
                            l_Occupied_2.SpeedMult.Value = 0;
                            l_Occupied_2.LerpMult.Value = 0;
                        end;
                        l_Occupied_1.Target.Value = Vector3.new();
                        l_Occupied_2.Target.Value = Vector3.new();
                        if v35:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                            v35:SetAttribute("CurrentEmote", nil);
                        end;
                        if v35:GetAttribute("InDualEmote") == v0.Metadata.Name then
                            v35:SetAttribute("InDualEmote", nil);
                        end;
                        if v36:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                            v36:SetAttribute("CurrentEmote", nil);
                        end;
                        if v36:GetAttribute("InDualEmote") == v0.Metadata.Name then
                            v36:SetAttribute("InDualEmote", nil);
                        end;
                        if v60 then
                            return;
                        elseif not v56 or not v55 then
                            return;
                        else
                            v55:Destroy();
                            v56.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 2, math.random(10, 30) * 6, math.random(-10, 10) * 2);
                            v56.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                            task.delay(3, function() --[[ Line: 482 ]]
                                -- upvalues: v56 (ref)
                                if v56 then
                                    v56:Destroy();
                                end;
                            end);
                            local _ = l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v35, 
                                Parent = v35.PrimaryPart, 
                                Name = "Fling", 
                                Speed = math.random(0.9, 1.1)
                            });
                            return;
                        end;
                    end;
                end;
                v36:SetAttribute("CurrentEmote", v0.Metadata.Name);
                l_Occupied_1.SpeedMult.Value = 1;
                l_Occupied_1.LerpMult.Value = 1;
                l_Occupied_2.SpeedMult.Value = 1;
                l_Occupied_2.LerpMult.Value = 1;
                if l_Character_1 == v36 then
                    local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
                    local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                    local v69 = CFrame.lookAt(v35.PrimaryPart.Position, v36.PrimaryPart.Position);
                    local _, v71, _ = l_RayHelper_0:GetRayWithWhiteList(v35.PrimaryPart.Position, (v69 * CFrame.new(0, 0, -6) * CFrame.Angles(0, 3.141592653589793, 0)).Position, 6, l_l_RayHelper_0_EnvironmentWhitelist_0);
                    v48[#v48 + 1] = l_TweenService_0:Create(v36.PrimaryPart, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        CFrame = CFrame.lookAt(v71, v35.PrimaryPart.Position)
                    }):Play();
                end;
                local l_LookVector_0 = v35.PrimaryPart.CFrame.LookVector;
                local l_LookVector_1 = v36.PrimaryPart.CFrame.LookVector;
                local v75 = tick();
                if l_Character_1 == v35 or l_Character_1 == v36 then
                    v47[#v47 + 1] = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 528 ]]
                        -- upvalues: v75 (copy), l_TweenService_0 (ref), v35 (copy), v36 (copy), l_Occupied_1 (copy), l_LookVector_0 (copy), l_Occupied_2 (copy), l_LookVector_1 (copy)
                        local v76 = math.clamp((tick() - v75) / 0.7, 0, 1);
                        local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v76, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                        local v78 = CFrame.lookAt(v35.PrimaryPart.Position, v36.PrimaryPart.Position);
                        local l_Target_0 = l_Occupied_1.Target;
                        local l_l_LookVector_0_0 = l_LookVector_0;
                        l_Target_0.Value = l_l_LookVector_0_0 + (v78.LookVector - l_l_LookVector_0_0) * l_l_TweenService_0_Value_0;
                        l_Target_0 = l_Occupied_2.Target;
                        l_l_LookVector_0_0 = l_LookVector_1;
                        l_Target_0.Value = l_l_LookVector_0_0 + (-v78.LookVector - l_l_LookVector_0_0) * l_l_TweenService_0_Value_0;
                    end);
                end;
                local v81 = l_EmoteHelper_0.AddConnections({
                    CharacterData = l_CharacterData_1, 
                    Character = v35, 
                    Animator = v38
                });
                local v82 = l_EmoteHelper_0.AddConnections({
                    CharacterData = l_CharacterData_2, 
                    Character = v36, 
                    Animator = v40
                });
                v81.Event:Connect(function() --[[ Line: 550 ]]
                    -- upvalues: v66 (copy)
                    v66();
                end);
                v82.Event:Connect(function() --[[ Line: 554 ]]
                    -- upvalues: v66 (copy)
                    v66();
                end);
                task.wait(8.983333333333333);
                if v49 then
                    return;
                elseif v49 then
                    return;
                else
                    l_l_AnimHelper_0_Anim_2:Stop(0.6666666666666666);
                    l_l_AnimHelper_0_Anim_3:Stop(0.6666666666666666);
                    task.wait(0.6666666666666666);
                    v66();
                    return;
                end;
            end;
        end;
    end;
end;
v0.Use = function(v83, v84) --[[ Line: 569 ]] --[[ Name: Use ]]
    -- upvalues: v0 (copy)
    if not (v83:GetAttribute("CurrentEmote") == script.Name) then
        v0.Start(v83);
        return;
    else
        v0.DualEmote(v83, v84);
        return;
    end;
end;
return v0;