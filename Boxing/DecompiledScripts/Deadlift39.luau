local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Deadlift", 
        MainId = 17190859191, 
        Rarity = "Mythic"
    }
};
local _ = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v10, v11, v12) --[[ Line: 22 ]] --[[ Name: Lerp ]]
    return v10 + (v11 - v10) * v12;
end;
v0.Use = function(v14) --[[ Line: 24 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_CollectionService_0 (copy), l_TweenService_0 (copy), l_ReplicatedStorage_0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy)
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
            local v23 = script.BarbellModel:Clone();
            v23.Name = "Barbell";
            v23.Parent = v15.PrimaryPart;
            local v24 = script.Barbell:Clone();
            v24.Parent = v15.PrimaryPart;
            v24.Part0 = v15.PrimaryPart;
            v24.Part1 = v23;
            if not l_CharacterData_0.Opponent.Value then
                l_CollectionService_0:AddTag(v24, "SpectateC0");
            end;
            v23.Transparency = 1;
            task.delay(0.2, function() --[[ Line: 59 ]]
                -- upvalues: v22 (ref), v23 (copy), l_TweenService_0 (ref)
                if v22 then
                    return;
                else
                    v23.LocalTransparencyModifier = 1;
                    v23.Transparency = 0;
                    l_TweenService_0:Create(v23, TweenInfo.new(0.75, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        LocalTransparencyModifier = 0
                    }):Play();
                    task.wait(0.4166666666666667);
                    if v22 then
                        return;
                    else
                        v23.LocalTransparencyModifier = 0;
                        task.wait(5.416666666666667);
                        if v22 then
                            return;
                        else
                            l_TweenService_0:Create(v23, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                Transparency = 1
                            }):Play();
                            return;
                        end;
                    end;
                end;
            end);
            local v25 = require(l_ReplicatedStorage_0.Modules.EffectHelper);
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v15_Attribute_0 = v15:GetAttribute("Owner");
            local v28 = true;
            if v15 ~= l_Character_0 then
                v28 = l_v15_Attribute_0 and l_v15_Attribute_0 == l_Character_0.Name;
            end;
            local v29 = nil;
            task.delay(0, function() --[[ Line: 85 ]]
                -- upvalues: l_EmoteHelper_0 (ref), v15 (copy), v22 (ref), v29 (ref), v28 (copy), v25 (copy), l_TweenService_0 (ref)
                l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v15, 
                    Name = "Rustle3", 
                    Parent = v15.PrimaryPart, 
                    Volume = 0.4
                });
                task.wait(0.3333333333333333);
                if v22 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v15, 
                        Parent = v15.PrimaryPart, 
                        DirectCopy = script.Start, 
                        Name = "Emote", 
                        ShouldWeld = true
                    });
                    task.wait(0.6666666666666666);
                    if v22 then
                        return;
                    else
                        v29 = l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v15, 
                            Parent = v15.PrimaryPart, 
                            DirectCopy = script.Mid, 
                            Name = "Emote", 
                            ShouldWeld = true
                        });
                        if v28 then
                            local v30 = {
                                Preset = "LightHit", 
                                WaitTime = 0.3, 
                                FadeIn = 1.5
                            };
                            task.delay(0.25, function() --[[ Line: 122 ]]
                                -- upvalues: v22 (ref), v25 (ref), v30 (copy)
                                if v22 then
                                    return;
                                else
                                    v25.CameraShake(v30);
                                    return;
                                end;
                            end);
                        end;
                        v29.Volume = 0;
                        l_TweenService_0:Create(v29, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Volume = 0.2
                        }):Play();
                        task.wait(2.8666666666666667);
                        if v29 then
                            l_TweenService_0:Create(v29, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                Volume = 0
                            }):Play();
                            task.delay(1, function() --[[ Line: 137 ]]
                                -- upvalues: v29 (ref)
                                if v29 then
                                    v29:Destroy();
                                end;
                            end);
                        end;
                        if v22 then
                            return;
                        else
                            l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v15, 
                                Parent = v15.PrimaryPart, 
                                DirectCopy = script.Slam, 
                                Name = "Emote", 
                                ShouldWeld = true
                            });
                            task.wait(0.6666666666666666);
                            if v22 then
                                return;
                            else
                                l_EmoteHelper_0:PlaySound({
                                    SourceCharacter = v15, 
                                    Name = "Rustle1", 
                                    Parent = v15.PrimaryPart, 
                                    Volume = 0.2
                                });
                                task.wait(0.9166666666666666);
                                if v22 then
                                    return;
                                else
                                    l_EmoteHelper_0:PlaySound({
                                        SourceCharacter = v15, 
                                        Name = "Rustle4", 
                                        Parent = v15.PrimaryPart, 
                                        Volume = 0.3
                                    });
                                    return;
                                end;
                            end;
                        end;
                    end;
                end;
            end);
            if v28 then
                local v31 = {
                    Preset = "MedHit", 
                    FoV = 67, 
                    WaitTime = 0.25, 
                    FadeIn = 1
                };
                local l_v31_0 = v31 --[[ copy: 17 -> 20 ]];
                task.delay(4, function() --[[ Line: 178 ]]
                    -- upvalues: v22 (ref), v25 (copy), l_v31_0 (copy)
                    if v22 then
                        return;
                    else
                        v25.CameraShake(l_v31_0);
                        return;
                    end;
                end);
            end;
            local v33 = {
                Name = "Emote", 
                FadeIn = 0.25, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v17
            };
            if not v28 then
                v33.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v33);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v33.FadeIn, v33.Weight, v33.Speed);
            local function v38() --[[ Line: 204 ]] --[[ Name: Cleanup ]]
                -- upvalues: v22 (ref), v21 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v14 (copy), l_Occupied_0 (copy), v15 (copy), v0 (ref), v24 (copy), v23 (copy), v29 (ref)
                if v22 then
                    return;
                else
                    v22 = true;
                    for _, v36 in v21 do
                        v36:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v14);
                    l_Occupied_0.SpeedMult.Value = 0;
                    l_Occupied_0.LerpMult.Value = 0;
                    if v15:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v15:SetAttribute("CurrentEmote", nil);
                    end;
                    v24:Destroy();
                    v23.Parent = workspace.Debris;
                    v23.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 1, math.random(10, 30) * 1.8, math.random(-10, 10) * 1);
                    v23.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20) * 0.3, math.random(-20, 20) * 0.3, math.random(-20, 20) * 0.3);
                    task.delay(3, function() --[[ Line: 229 ]]
                        -- upvalues: v23 (ref)
                        if v23 then
                            v23:Destroy();
                        end;
                    end);
                    if v29 then
                        v29:Destroy();
                    end;
                    if v23 and v23.Transparency < 0.5 then
                        local _ = l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v15, 
                            Parent = v15.PrimaryPart, 
                            Name = "Fling", 
                            Speed = math.random(0.9, 1.1)
                        });
                    end;
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v14, 30);
            v15:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v15, 
                Animator = v17
            }).Event:Connect(function() --[[ Line: 259 ]]
                -- upvalues: v38 (copy)
                v38();
            end);
            task.wait(7);
            if v22 then
                return;
            else
                l_l_AnimHelper_0_Anim_0:Stop(0.5);
                v38();
                return;
            end;
        end;
    end;
end;
return v0;