local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Ultimate Apology", 
        MainId = 15837323254, 
        Rarity = "Mythic"
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
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), v1 (copy)
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
                FadeIn = 0.55, 
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
                Volume = 0.4
            });
            task.delay(0.6666666666666666, function() --[[ Line: 73 ]]
                -- upvalues: v21 (ref), l_EmoteHelper_0 (ref), v14 (copy)
                if v21 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v14, 
                        Name = "Rustle3", 
                        Parent = v14.PrimaryPart, 
                        Volume = 0.4
                    });
                    task.wait(0.6666666666666666);
                    if v21 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v14, 
                            Name = "Rustle4", 
                            Parent = v14.PrimaryPart, 
                            Volume = 0.3
                        });
                        task.wait(1);
                        if v21 then
                            return;
                        else
                            l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v14, 
                                Name = "Rustle2", 
                                Parent = v14.PrimaryPart, 
                                Volume = 0.3
                            });
                            task.wait(0.7333333333333333);
                            if v21 then
                                return;
                            else
                                l_EmoteHelper_0:PlaySound({
                                    SourceCharacter = v14, 
                                    Name = "Rustle1", 
                                    Parent = v14.PrimaryPart, 
                                    Volume = 0.3
                                });
                                task.wait(3);
                                if v21 then
                                    return;
                                else
                                    l_EmoteHelper_0:PlaySound({
                                        SourceCharacter = v14, 
                                        Name = "Rustle2", 
                                        Parent = v14.PrimaryPart, 
                                        Volume = 0.3
                                    });
                                    local v27 = script.Effects.Smoke:Clone();
                                    v27.Parent = v14.UpperTorso;
                                    for _, v29 in v27:GetChildren() do
                                        v29:Emit(2);
                                    end;
                                    task.wait(3);
                                    v27:Destroy();
                                    return;
                                end;
                            end;
                        end;
                    end;
                end;
            end);
            local v30 = nil;
            task.delay(0.3, function() --[[ Line: 130 ]]
                -- upvalues: v21 (ref), v30 (ref), l_EmoteHelper_0 (ref), v14 (copy), v22 (copy)
                if v21 then
                    return;
                else
                    v30 = l_EmoteHelper_0:PlaySound({
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
            local v31 = {};
            local function _(v32) --[[ Line: 145 ]] --[[ Name: CreateTrail ]]
                -- upvalues: v14 (copy), v31 (copy)
                local l_v14_FirstChild_0 = v14:FindFirstChild(v32);
                if not l_v14_FirstChild_0 then
                    return;
                else
                    local v34 = script.Trail:Clone();
                    v34.Parent = v14;
                    local l_Attachment0_0 = v34.Attachment0;
                    local l_Attachment1_0 = v34.Attachment1;
                    l_Attachment0_0.Parent = l_v14_FirstChild_0;
                    l_Attachment1_0.Parent = l_v14_FirstChild_0;
                    v34:Destroy();
                    table.insert(v31, l_Attachment0_0);
                    table.insert(v31, l_Attachment1_0);
                    return;
                end;
            end;
            local l_LeftHand_0 = v14:FindFirstChild("LeftHand");
            if l_LeftHand_0 then
                local v39 = script.Trail:Clone();
                v39.Parent = v14;
                local l_Attachment0_1 = v39.Attachment0;
                local l_Attachment1_1 = v39.Attachment1;
                l_Attachment0_1.Parent = l_LeftHand_0;
                l_Attachment1_1.Parent = l_LeftHand_0;
                v39:Destroy();
                table.insert(v31, l_Attachment0_1);
                table.insert(v31, l_Attachment1_1);
            end;
            l_LeftHand_0 = v14:FindFirstChild("RightHand");
            if l_LeftHand_0 then
                local v42 = script.Trail:Clone();
                v42.Parent = v14;
                local l_Attachment0_2 = v42.Attachment0;
                local l_Attachment1_2 = v42.Attachment1;
                l_Attachment0_2.Parent = l_LeftHand_0;
                l_Attachment1_2.Parent = l_LeftHand_0;
                v42:Destroy();
                table.insert(v31, l_Attachment0_2);
                table.insert(v31, l_Attachment1_2);
            end;
            l_LeftHand_0 = v14:FindFirstChild("LeftFoot");
            if l_LeftHand_0 then
                local v45 = script.Trail:Clone();
                v45.Parent = v14;
                local l_Attachment0_3 = v45.Attachment0;
                local l_Attachment1_3 = v45.Attachment1;
                l_Attachment0_3.Parent = l_LeftHand_0;
                l_Attachment1_3.Parent = l_LeftHand_0;
                v45:Destroy();
                table.insert(v31, l_Attachment0_3);
                table.insert(v31, l_Attachment1_3);
            end;
            l_LeftHand_0 = v14:FindFirstChild("RightFoot");
            if l_LeftHand_0 then
                local v48 = script.Trail:Clone();
                v48.Parent = v14;
                local l_Attachment0_4 = v48.Attachment0;
                local l_Attachment1_4 = v48.Attachment1;
                l_Attachment0_4.Parent = l_LeftHand_0;
                l_Attachment1_4.Parent = l_LeftHand_0;
                v48:Destroy();
                table.insert(v31, l_Attachment0_4);
                table.insert(v31, l_Attachment1_4);
            end;
            l_LeftHand_0 = function() --[[ Line: 168 ]] --[[ Name: Cleanup ]]
                -- upvalues: v21 (ref), v20 (copy), v31 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v13 (copy), v25 (copy), l_Occupied_0 (copy), v14 (copy), v0 (ref), v30 (ref), l_TweenService_0 (ref), v1 (ref)
                if v21 then
                    return;
                else
                    v21 = true;
                    for _, v52 in v20 do
                        v52:Disconnect();
                    end;
                    for _, v54 in v31 do
                        if v54 then
                            v54:Destroy();
                        end;
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
                    if v30 then
                        l_TweenService_0:Create(v30, v1, {
                            Volume = 0
                        }):Play();
                        task.delay(1, function() --[[ Line: 195 ]]
                            -- upvalues: v30 (ref)
                            if v30 and v30.Parent then
                                v30.Parent:Destroy();
                            end;
                        end);
                    end;
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v13, 30);
            v14:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v14, 
                Animator = v16
            }).Event:Connect(function() --[[ Line: 215 ]]
                -- upvalues: l_LeftHand_0 (copy)
                l_LeftHand_0();
            end);
            task.wait(6.666666666666667);
            if v21 then
                return;
            else
                l_l_AnimHelper_0_Anim_0:Stop(0.6666666666666666);
                task.wait(0.6666666666666666);
                l_LeftHand_0();
                return;
            end;
        end;
    end;
end;
return v0;