local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Slickback", 
        MainId = 16300039798, 
        Rarity = "Rare"
    }
};
local v1 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v10, v11, v12) --[[ Line: 23 ]] --[[ Name: Lerp ]]
    return v10 + (v11 - v10) * v12;
end;
v0.Use = function(v14) --[[ Line: 25 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Modules_0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), v1 (copy)
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
                Looped = true, 
                Name = "Emote", 
                FadeIn = 0.03333333333333333, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v17
            };
            local _ = require(l_Modules_0:WaitForChild("EffectHelper"));
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v15_Attribute_0 = v15:GetAttribute("Owner");
            local v27 = true;
            if v15 ~= l_Character_0 then
                v27 = l_v15_Attribute_0 and l_v15_Attribute_0 == l_Character_0.Name;
            end;
            if not v27 then
                v23.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v23);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v23.FadeIn, v23.Weight, v23.Speed);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Name = "Rustle2", 
                Parent = v15.PrimaryPart
            });
            local v29 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Looped = v23.Looped, 
                Parent = v15.PrimaryPart, 
                DirectCopy = script.Song, 
                Name = "Emote", 
                ShouldWeld = true
            });
            local function v32() --[[ Line: 89 ]] --[[ Name: Cleanup ]]
                -- upvalues: v22 (ref), v21 (copy), v27 (copy), l_Occupied_0 (copy), l_RunService_0 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v14 (copy), v15 (copy), v0 (ref), l_TweenService_0 (ref), v29 (copy), v1 (ref)
                if v22 then
                    return;
                else
                    v22 = true;
                    for _, v31 in v21 do
                        v31:Disconnect();
                    end;
                    if v27 then
                        l_Occupied_0.ForceMove.Value = false;
                        l_RunService_0:UnbindFromRenderStep("ForceMove");
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v14);
                    if v27 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v15:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v15:SetAttribute("CurrentEmote", nil);
                    end;
                    l_TweenService_0:Create(v29, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(2, function() --[[ Line: 117 ]]
                        -- upvalues: v29 (ref)
                        v29.Parent:Destroy();
                    end);
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v14, 30);
            v15:SetAttribute("CurrentEmote", v0.Metadata.Name);
            local v33 = l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v15, 
                Animator = v17
            });
            task.delay(0.25, function() --[[ Line: 131 ]]
                -- upvalues: v22 (ref), l_Occupied_0 (copy)
                if v22 then
                    return;
                else
                    l_Occupied_0.ForceMove.Value = true;
                    return;
                end;
            end);
            if v27 then
                l_RunService_0:BindToRenderStep("ForceMove", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 137 ]]
                    -- upvalues: v22 (ref), l_CharacterData_0 (copy), l_Occupied_0 (copy), v16 (copy), v15 (copy)
                    if v22 then
                        return;
                    elseif l_CharacterData_0.Cutscene.Value then
                        return;
                    else
                        if l_Occupied_0.LockedOn.Value then
                            l_Occupied_0.SpeedMult.Value = 0.65;
                            l_Occupied_0.LerpMult.Value = 0.4;
                        else
                            l_Occupied_0.SpeedMult.Value = 0.2;
                            l_Occupied_0.LerpMult.Value = 0.825;
                        end;
                        v16.WalkSpeed = 12;
                        local l_v16_0 = v16;
                        l_v16_0.WalkSpeed = l_v16_0.WalkSpeed * (1 + -1 * l_Occupied_0.SpeedMult.Value);
                        l_v16_0 = v15.PrimaryPart.CFrame.LookVector;
                        v16:Move(l_v16_0, false);
                        local l_Value_0 = l_Occupied_0.LockedOn.Value;
                        if not l_Value_0 then
                            return;
                        elseif (v15.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude > 2.5 then
                            return;
                        else
                            v16:Move(l_v16_0 / 3, false);
                            return;
                        end;
                    end;
                end);
            end;
            v33.Event:Connect(function() --[[ Line: 165 ]]
                -- upvalues: v32 (copy)
                v32();
            end);
            task.wait(180);
            v32();
            return;
        end;
    end;
end;
return v0;