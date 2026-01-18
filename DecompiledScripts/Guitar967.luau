local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Guitar", 
        MainId = 15578484225, 
        LoopId = 13633642843, 
        Toxicity = 2, 
        Rarity = "Legendary"
    }
};
local v1 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v11, v12, v13) --[[ Line: 26 ]] --[[ Name: Lerp ]]
    return v11 + (v12 - v11) * v13;
end;
Shuffle = function(v15) --[[ Line: 28 ]] --[[ Name: Shuffle ]]
    for v16 = #v15, 2, -1 do
        local v17 = math.random(v16);
        local v18 = v15[v17];
        local v19 = v15[v16];
        v15[v16] = v18;
        v15[v17] = v19;
    end;
    return v15;
end;
v0.Use = function(v20) --[[ Line: 36 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), l_CollectionService_0 (copy), v1 (copy)
    local v21 = v20:IsA("Player") and v20.Character or v20;
    local v22 = v21 and v21:FindFirstChild("Humanoid");
    local v23 = v22 and (v22:FindFirstChild("Animator") or v22);
    if not v23 then
        return;
    else
        local v24 = v21.Name == "Father Bringus";
        if v24 then
            local l_Guitar_0 = v21:FindFirstChild("Guitar");
            if l_Guitar_0 then
                l_Guitar_0:Destroy();
            end;
        end;
        local l_FirstChild_0 = workspace.Welds:FindFirstChild(v21.Name);
        local v27 = l_FirstChild_0 and l_FirstChild_0:FindFirstChild("WeldCharacter") or v21;
        if not v27 then
            return;
        else
            local v28 = workspace.States[v21.Name];
            local l_CharacterData_0 = v28.CharacterData;
            local l_Occupied_0 = v28.Occupied;
            if not l_EmoteHelper_0.CanContinue({
                CharacterData = l_CharacterData_0, 
                Character = v21, 
                Emote = v0
            }) then
                return;
            else
                local v31 = {};
                local v32 = false;
                local v33 = {
                    Name = "Emote", 
                    FadeIn = 0.1, 
                    Weight = 1, 
                    Speed = 1, 
                    AnimId = v0.Metadata.MainId, 
                    Priority = Enum.AnimationPriority.Action, 
                    Animator = v23, 
                    Looped = true
                };
                local l_Character_0 = l_Players_0.LocalPlayer.Character;
                local l_v21_Attribute_0 = v21:GetAttribute("Owner");
                local v36 = true;
                if v21 ~= l_Character_0 then
                    v36 = l_v21_Attribute_0 and l_v21_Attribute_0 == l_Character_0.Name;
                end;
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v33);
                v33.AnimId = v0.Metadata.LoopId;
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v33);
                l_l_AnimHelper_0_Anim_1:Stop(0.01);
                l_l_AnimHelper_0_Anim_1.Looped = false;
                l_l_AnimHelper_0_Anim_1.Priority = Enum.AnimationPriority.Action;
                l_l_AnimHelper_0_Anim_1:Play(v33.FadeIn, v33.Weight, v33.Speed);
                l_l_AnimHelper_0_Anim_0:Stop(0.01);
                l_l_AnimHelper_0_Anim_0.Looped = false;
                l_l_AnimHelper_0_Anim_0.Priority = Enum.AnimationPriority.Action;
                l_l_AnimHelper_0_Anim_0:Play(v33.FadeIn, v33.Weight, v33.Speed);
                l_l_AnimHelper_0_Anim_1.Looped = true;
                l_l_AnimHelper_0_Anim_0.Looped = true;
                l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v21, 
                    Name = "Rustle2", 
                    Parent = v21.PrimaryPart
                });
                local v39 = 0;
                local v40 = 0;
                local v41 = nil;
                local v42 = 100;
                local v43 = {
                    [15363961159] = {
                        Volume = 0.7
                    }, 
                    [15001083538] = {
                        IsTrading = true
                    }, 
                    [15001484444] = {
                        IsTrading = true
                    }, 
                    [15001490681] = {
                        IsTrading = true
                    }, 
                    [15001496242] = {
                        IsTrading = true
                    }, 
                    [15001528547] = {
                        IsTrading = true
                    }, 
                    [1842181552] = {
                        IsTrading = true
                    }
                };
                local v44 = {
                    13389416338, 
                    13389643405, 
                    13389797577, 
                    13389714118, 
                    13389727055, 
                    15363961159, 
                    15001083538, 
                    15001484444, 
                    15001490681, 
                    15001496242, 
                    15001528547, 
                    15001546661, 
                    1842181552
                };
                Shuffle(v44);
                if v24 then
                    v44 = {
                        13389416338, 
                        13389643405, 
                        13389797577, 
                        13389714118, 
                        13389727055, 
                        14190790797, 
                        15363961159, 
                        15001083538, 
                        15001490681, 
                        15001496242, 
                        15001528547, 
                        15001546661, 
                        1842181552
                    };
                    Shuffle(v44);
                    table.insert(v44, 1, 15001484444);
                end;
                local l_Character_1 = l_Players_0.LocalPlayer.Character;
                local v46 = l_Character_1 and workspace.States[l_Character_1.Name];
                local v47 = v46 and v46.CharacterData;
                local function v48() --[[ Line: 138 ]] --[[ Name: PlaySong ]]
                    -- upvalues: v32 (ref), v40 (ref), v41 (ref), v43 (copy), v44 (ref), l_EmoteHelper_0 (ref), v21 (copy), v24 (copy), v47 (copy), l_l_AnimHelper_0_Anim_1 (copy), v48 (copy)
                    if v32 then
                        return;
                    else
                        v40 = v40 + 1;
                        if v41 then
                            v41.Parent:Destroy();
                        end;
                        local v49 = v43[v44[v40]];
                        v41 = l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v21, 
                            Name = "Emote", 
                            Volume = v49 and v49.Volume or 0.3, 
                            SoundId = v44[v40], 
                            Parent = v21.PrimaryPart, 
                            IgnoreDelete = true, 
                            ShouldWeld = true
                        });
                        task.wait(1);
                        if v24 and not v47.Opponent.Value then
                            v41.RollOffMinDistance = 15;
                            v41.RollOffMaxDistance = 150;
                        end;
                        task.wait(v41.TimeLength);
                        l_l_AnimHelper_0_Anim_1:AdjustSpeed(0, 0.05);
                        l_l_AnimHelper_0_Anim_1:AdjustWeight(1, 0.1);
                        if v40 >= #v44 then
                            v40 = 0;
                        end;
                        v48();
                        return;
                    end;
                end;
                task.defer(function() --[[ Line: 179 ]]
                    -- upvalues: v48 (copy)
                    v48();
                end);
                if v24 then
                    v47.Opponent.Changed:Connect(function(v50) --[[ Line: 184 ]]
                        -- upvalues: v41 (ref)
                        v41.RollOffMinDistance = v50 and 0 or 15;
                        v41.RollOffMaxDistance = v50 and 0 or 150;
                    end);
                end;
                local v51 = nil;
                v51 = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 191 ]]
                    -- upvalues: v41 (ref), v39 (ref), v42 (ref), v21 (copy), v43 (copy), v44 (ref), v40 (ref), l_l_AnimHelper_0_Anim_1 (copy)
                    if not v41 then
                        return;
                    else
                        v39 = v39 + 1;
                        if v39 % 4 == 0 then
                            v39 = 0;
                            v42 = (v21.PrimaryPart.Position - workspace.CurrentCamera.CFrame.Position).Magnitude;
                        end;
                        if v42 > 100 then
                            return;
                        else
                            local v53 = math.clamp(v41.PlaybackLoudness / 60, 0, 2.3);
                            local v54 = math.clamp(v41.PlaybackLoudness / 150, 0.98, 1.01);
                            local v55 = v43[v44[v40]];
                            if v55 and v55.IsTrading then
                                v53 = math.clamp(v41.PlaybackLoudness / 120, 0, 2.8);
                                v54 = math.clamp(v41.PlaybackLoudness / 290, 0.98, 1.01);
                            end;
                            l_l_AnimHelper_0_Anim_1:AdjustSpeed(v53, 0.05);
                            l_l_AnimHelper_0_Anim_1:AdjustWeight(v54, 0.1);
                            return;
                        end;
                    end;
                end);
                local v56 = CFrame.Angles(0, 0, 0);
                local v57 = v27.PrimaryPart.CFrame * v56;
                local v58 = script.Chair:Clone();
                v58.Parent = workspace.Debris;
                v58.CFrame = v57 * CFrame.new(0, -1.98, 0);
                local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                l_WeldConstraint_0.Parent = v58;
                l_WeldConstraint_0.Part0 = v58;
                l_WeldConstraint_0.Part1 = v27.PrimaryPart;
                local _ = v58.Position;
                local l_Part_0 = Instance.new("Part");
                l_Part_0.Anchored = true;
                l_Part_0.CFrame = v21.UpperTorso.CFrame;
                l_Part_0.CFrame = l_Part_0.CFrame * CFrame.new(-0.982, 0.501, -1.07);
                l_Part_0.Orientation = l_Part_0.Orientation + Vector3.new(7.320000171661377, -2.990000009536743, 67.71700286865234, 0);
                local l_CFrame_0 = l_Part_0.CFrame;
                l_Part_0:Destroy();
                local v63 = script.Guitar:Clone();
                v63.Parent = workspace.Debris;
                local _ = v63.PrimaryPart.Orientation;
                v63.PrimaryPart.CFrame = l_CFrame_0;
                local l_WeldConstraint_1 = Instance.new("WeldConstraint");
                l_WeldConstraint_1.Parent = v63.PrimaryPart;
                l_WeldConstraint_1.Part0 = v63.PrimaryPart;
                l_WeldConstraint_1.Part1 = v21.UpperTorso;
                v63.PrimaryPart.CFrame = l_CFrame_0;
                task.defer(function() --[[ Line: 254 ]]
                    -- upvalues: v32 (ref), v27 (copy), v56 (copy), l_TweenService_0 (ref), v58 (copy), v63 (copy), l_WeldConstraint_0 (ref), v21 (copy), l_CharacterData_0 (copy), l_CollectionService_0 (ref)
                    for v66 = 1, 20 do
                        if v32 then
                            return;
                        else
                            local l_Position_1 = (v27.PrimaryPart.CFrame * v56 * CFrame.new(0, -1.98, 0)).Position;
                            local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v66 / 20, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                            local l_v58_0 = v58;
                            local v70 = l_Position_1 - Vector3.new(0, 1, 0, 0);
                            l_v58_0.Position = v70 + (l_Position_1 - v70) * l_l_TweenService_0_Value_0;
                            for _, v72 in v63:GetChildren() do
                                v72.LocalTransparencyModifier = 1 + -1 * math.clamp(v66 / 20 * 2, 0, 1);
                            end;
                            task.wait();
                        end;
                    end;
                    if v32 then
                        return;
                    else
                        if l_WeldConstraint_0 then
                            l_WeldConstraint_0:Destroy();
                        end;
                        l_WeldConstraint_0 = Instance.new("Weld");
                        l_WeldConstraint_0.Parent = v58;
                        l_WeldConstraint_0.Part0 = v58;
                        l_WeldConstraint_0.Part1 = v21.PrimaryPart;
                        l_WeldConstraint_0.C1 = CFrame.new(0, -1.98, 0) * CFrame.Angles(0, 3.141592653589793, 0);
                        l_WeldConstraint_0.Name = "Reverse";
                        if not l_CharacterData_0.Opponent.Value then
                            l_CollectionService_0:AddTag(l_WeldConstraint_0, "SpectateC0");
                        end;
                        return;
                    end;
                end);
                local l_FirstChild_1 = workspace.Welds:FindFirstChild(v21.Name);
                local v74 = l_FirstChild_1 and l_FirstChild_1:FindFirstChild("WeldCharacter") or v21;
                for _, v76 in v74:GetDescendants() do
                    if string.find(v76.Name, "GloveModel") then
                        for _, v78 in v76:GetDescendants() do
                            if v78:IsA("ParticleEmitter") then
                                v78.Enabled = false;
                            elseif v78:IsA("BasePart") then
                                v78.LocalTransparencyModifier = 1;
                            end;
                        end;
                    end;
                end;
                v21.LeftHand.Transparency = 0;
                v21.RightHand.Transparency = 0;
                local function v88() --[[ Line: 304 ]] --[[ Name: Cleanup ]]
                    -- upvalues: v32 (ref), v31 (copy), v51 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_EmoteHelper_0 (ref), v20 (copy), v36 (copy), l_Occupied_0 (copy), v21 (copy), v0 (ref), l_WeldConstraint_0 (ref), l_WeldConstraint_1 (copy), v58 (copy), v63 (copy), v41 (ref), l_TweenService_0 (ref), v1 (ref)
                    if v32 then
                        return;
                    else
                        v32 = true;
                        for _, v80 in v31 do
                            v80:Disconnect();
                        end;
                        if v51 then
                            v51:Disconnect();
                        end;
                        l_l_AnimHelper_0_Anim_0.Looped = false;
                        l_l_AnimHelper_0_Anim_0:Stop(0.01);
                        l_l_AnimHelper_0_Anim_1.Looped = false;
                        l_l_AnimHelper_0_Anim_1:Stop(0.01);
                        l_EmoteHelper_0.DestroyCharacterMuteZone(v20);
                        if v36 then
                            l_Occupied_0.SpeedMult.Value = 0;
                            l_Occupied_0.LerpMult.Value = 0;
                        end;
                        if v21:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                            v21:SetAttribute("CurrentEmote", nil);
                        end;
                        l_WeldConstraint_0:Destroy();
                        l_WeldConstraint_1:Destroy();
                        v58.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 3, math.random(10, 30) * 2.5, math.random(-10, 10) * 3);
                        v58.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                        v63.PrimaryPart.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 2.3, math.random(10, 30) * 2.75, math.random(-10, 10) * 2.3);
                        v63.PrimaryPart.AssemblyAngularVelocity = Vector3.new(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5));
                        if v41 then
                            l_TweenService_0:Create(v41, v1, {
                                Volume = 0
                            }):Play();
                        end;
                        task.delay(3, function() --[[ Line: 344 ]]
                            -- upvalues: v41 (ref), v63 (ref), v58 (ref)
                            if v41 then
                                v41.Parent:Destroy();
                            end;
                            if v63 then
                                v63:Destroy();
                            end;
                            if v58 then
                                v58:Destroy();
                            end;
                        end);
                        local _ = l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v21, 
                            Parent = v21.PrimaryPart, 
                            Name = "Fling", 
                            Speed = math.random(0.9, 1.1)
                        });
                        local l_FirstChild_2 = workspace.Welds:FindFirstChild(v21.Name);
                        local v83 = l_FirstChild_2 and l_FirstChild_2:FindFirstChild("WeldCharacter") or v21;
                        for _, v85 in v83:GetDescendants() do
                            if string.find(v85.Name, "GloveModel") then
                                for _, v87 in v85:GetDescendants() do
                                    if v87:IsA("ParticleEmitter") then
                                        v87.Enabled = true;
                                    elseif v87:IsA("BasePart") then
                                        v87.LocalTransparencyModifier = 0;
                                    end;
                                end;
                            end;
                        end;
                        v21.LeftHand.Transparency = 1;
                        v21.RightHand.Transparency = 1;
                        return;
                    end;
                end;
                l_EmoteHelper_0.CreateCharacterMuteZone(v20, v24 and 90 or 30);
                v21:SetAttribute("CurrentEmote", v0.Metadata.Name);
                l_Occupied_0.SpeedMult.Value = 1;
                l_Occupied_0.LerpMult.Value = 1;
                l_EmoteHelper_0.AddConnections({
                    CharacterData = l_CharacterData_0, 
                    Character = v21, 
                    Animator = v23
                }).Event:Connect(function() --[[ Line: 388 ]]
                    -- upvalues: v88 (copy)
                    v88();
                end);
                if v24 then
                    return;
                else
                    task.wait(180);
                    v88();
                    return;
                end;
            end;
        end;
    end;
end;
return v0;