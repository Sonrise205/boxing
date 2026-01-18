local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Sumo", 
        MainId = 17194477471, 
        Rarity = "Rare"
    }
};
local v1 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v9, v10, v11) --[[ Line: 21 ]] --[[ Name: Lerp ]]
    return v9 + (v10 - v9) * v11;
end;
v0.Use = function(v13) --[[ Line: 23 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_ReplicatedStorage_0 (copy), l_TweenService_0 (copy), v1 (copy)
    local v14 = v13:IsA("Player") and v13.Character or v13;
    local v15 = v14 and v14:FindFirstChild("Humanoid");
    local v16 = v15 and (v15:FindFirstChild("Animator") or v15);
    if not v16 then
        return;
    else
        local v17 = workspace.States[v14.Name];
        local l_CharacterData_0 = v17.CharacterData;
        local l_Occupied_0 = v17.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v14, 
            Emote = v0
        }) then
            return;
        else
            local v20 = {};
            local v21 = false;
            local v22 = {
                Name = "Emote", 
                FadeIn = 0.15, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v16
            };
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v14_Attribute_0 = v14:GetAttribute("Owner");
            local v25 = true;
            if v14 ~= l_Character_0 then
                v25 = l_v14_Attribute_0 and l_v14_Attribute_0 == l_Character_0.Name;
            end;
            if not v25 then
                v22.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v22);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v22.FadeIn, v22.Weight, v22.Speed);
            local v27 = require(l_ReplicatedStorage_0.Modules.EffectHelper);
            task.delay(0.3333333333333333, function() --[[ Line: 69 ]]
                -- upvalues: v21 (ref), l_EmoteHelper_0 (ref), v14 (copy), v25 (copy), v27 (copy)
                if v21 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v14, 
                        Name = "Rustle5", 
                        Parent = v14.PrimaryPart, 
                        Volume = 0.4
                    });
                    task.wait(1.5);
                    if v21 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v14, 
                            Name = "Rustle4", 
                            Parent = v14.PrimaryPart, 
                            Volume = 0.3
                        });
                        local v28 = {
                            Preset = "LightHit", 
                            WaitTime = 0.2, 
                            FadeIn = 0.5
                        };
                        task.wait(0.8833333333333333);
                        if v21 then
                            return;
                        else
                            if v25 then
                                task.defer(function() --[[ Line: 97 ]]
                                    -- upvalues: v21 (ref), v27 (ref), v28 (copy)
                                    if v21 then
                                        return;
                                    else
                                        v27.CameraShake(v28);
                                        return;
                                    end;
                                end);
                            end;
                            task.wait(1);
                            if v21 then
                                return;
                            else
                                l_EmoteHelper_0:PlaySound({
                                    SourceCharacter = v14, 
                                    Name = "Rustle4", 
                                    Parent = v14.PrimaryPart, 
                                    Volume = 0.3
                                });
                                task.wait(0.7333333333333333);
                                if v21 then
                                    return;
                                else
                                    if v25 then
                                        task.defer(function() --[[ Line: 116 ]]
                                            -- upvalues: v21 (ref), v27 (ref), v28 (copy)
                                            if v21 then
                                                return;
                                            else
                                                v27.CameraShake(v28);
                                                return;
                                            end;
                                        end);
                                    end;
                                    return;
                                end;
                            end;
                        end;
                    end;
                end;
            end);
            local v29 = nil;
            task.delay(0.1, function() --[[ Line: 125 ]]
                -- upvalues: v21 (ref), v29 (ref), l_EmoteHelper_0 (ref), v14 (copy), v22 (copy)
                if v21 then
                    return;
                else
                    v29 = l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v14, 
                        Looped = v22.Looped, 
                        Parent = v14.PrimaryPart, 
                        DirectCopy = script.Song, 
                        Name = "Emote", 
                        ShouldWeld = true
                    });
                    return;
                end;
            end);
            local v30 = false;
            local function v33() --[[ Line: 140 ]] --[[ Name: Cleanup ]]
                -- upvalues: v21 (ref), v20 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v13 (copy), v25 (copy), l_Occupied_0 (copy), v14 (copy), v0 (ref), v30 (ref), v29 (ref), l_TweenService_0 (ref), v1 (ref)
                if v21 then
                    return;
                else
                    v21 = true;
                    for _, v32 in v20 do
                        v32:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v13);
                    if v25 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v14:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v14:SetAttribute("CurrentEmote", nil);
                    end;
                    task.defer(function() --[[ Line: 161 ]]
                        -- upvalues: v30 (ref), v29 (ref), l_TweenService_0 (ref), v1 (ref)
                        if v30 then
                            task.wait(4);
                        end;
                        if v29 then
                            l_TweenService_0:Create(v29, v1, {
                                Volume = 0
                            }):Play();
                        end;
                        task.wait(3);
                        if v29 and v29.Parent then
                            v29.Parent:Destroy();
                        end;
                    end);
                    return;
                end;
            end;
            v14:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v14, 
                Animator = v16
            }).Event:Connect(function() --[[ Line: 184 ]]
                -- upvalues: v33 (copy)
                v33();
            end);
            task.wait(5.716666666666667);
            if v21 then
                return;
            else
                v30 = true;
                l_l_AnimHelper_0_Anim_0:Stop(0.3333333333333333);
                task.wait(0.3333333333333333);
                v33();
                return;
            end;
        end;
    end;
end;
return v0;