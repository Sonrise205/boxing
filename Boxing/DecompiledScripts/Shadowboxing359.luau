local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Shadowboxing", 
        MainId = 15590031538, 
        Rarity = "Rare"
    }
};
local _ = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v9, v10, v11) --[[ Line: 21 ]] --[[ Name: Lerp ]]
    return v9 + (v10 - v9) * v11;
end;
v0.Use = function(v13) --[[ Line: 23 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy)
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
                FadeIn = 0.2, 
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
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v14, 
                Name = "Rustle5", 
                Parent = v14.PrimaryPart, 
                Volume = 0.8
            });
            task.delay(1.6, function() --[[ Line: 73 ]]
                -- upvalues: l_EmoteHelper_0 (ref), v14 (copy), v21 (ref)
                l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v14, 
                    Name = "SwingBig", 
                    Parent = v14.PrimaryPart, 
                    Volume = 0.15
                });
                task.wait(0.21666666666666667);
                if v21 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v14, 
                        Name = "SwingBig", 
                        Parent = v14.PrimaryPart, 
                        Volume = 0.15
                    });
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v14, 
                        Name = "Rustle2", 
                        Parent = v14.PrimaryPart, 
                        Volume = 0.3
                    });
                    task.wait(0.21666666666666667);
                    if v21 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v14, 
                            Name = "Swing", 
                            Parent = v14.PrimaryPart, 
                            Volume = 0.15
                        });
                        task.wait(0.45);
                        if v21 then
                            return;
                        else
                            l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v14, 
                                Name = "Rustle3", 
                                Parent = v14.PrimaryPart, 
                                Speed = 1.2, 
                                Volume = 0.9
                            });
                            return;
                        end;
                    end;
                end;
            end);
            local function v29() --[[ Line: 118 ]] --[[ Name: Cleanup ]]
                -- upvalues: v21 (ref), v20 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v13 (copy), v25 (copy), l_Occupied_0 (copy), v14 (copy), v0 (ref)
                if v21 then
                    return;
                else
                    v21 = true;
                    for _, v28 in v20 do
                        v28:Disconnect();
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
            }).Event:Connect(function() --[[ Line: 151 ]]
                -- upvalues: v29 (copy)
                v29();
            end);
            task.wait(4.316666666666666);
            if v21 then
                return;
            else
                l_l_AnimHelper_0_Anim_0:Stop(0.5);
                task.wait(0.5);
                v29();
                return;
            end;
        end;
    end;
end;
return v0;