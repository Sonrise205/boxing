local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Hakari", 
        Toxicity = 1, 
        MainId = 15853182525, 
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
local function _(v9, v10, v11) --[[ Line: 23 ]] --[[ Name: Lerp ]]
    return v9 + (v10 - v9) * v11;
end;
v0.Use = function(v13) --[[ Line: 25 ]] --[[ Name: Use ]]
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
                Looped = true, 
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
                Name = "Rustle2", 
                Parent = v14.PrimaryPart, 
                Volume = 1
            });
            local v27 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v14, 
                Looped = v22.Looped, 
                Parent = v14.PrimaryPart, 
                DirectCopy = script.Song, 
                Name = "Emote", 
                ShouldWeld = true, 
                PartName = v0.Metadata.Name
            });
            local v28 = {};
            for _, v30 in script.Aura:GetChildren() do
                local v31 = v30:Clone();
                v31.Parent = v14.PrimaryPart;
                table.insert(v28, v31);
            end;
            local function v40() --[[ Line: 93 ]] --[[ Name: Cleanup ]]
                -- upvalues: v21 (ref), v20 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v13 (copy), v25 (copy), l_Occupied_0 (copy), v14 (copy), v0 (ref), v28 (copy), l_TweenService_0 (ref), v27 (copy), v1 (ref)
                if v21 then
                    return;
                else
                    v21 = true;
                    for _, v33 in v20 do
                        v33:Disconnect();
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
                    for _, v35 in v28 do
                        if v35:IsA("ParticleEmitter") then
                            v35.Enabled = false;
                            v35.TimeScale = v35.TimeScale * 2;
                        else
                            for _, v37 in v35:GetChildren() do
                                v37.Enabled = false;
                                v37.TimeScale = v37.TimeScale * 2;
                            end;
                        end;
                    end;
                    l_TweenService_0:Create(v27, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(2, function() --[[ Line: 127 ]]
                        -- upvalues: v28 (ref), v27 (ref)
                        for _, v39 in v28 do
                            v39:Destroy();
                        end;
                        v27.Parent:Destroy();
                    end);
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v13, 30);
            v14:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
            local _ = nil;
            table.insert(v20, (game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 146 ]]
                -- upvalues: v21 (ref), l_CharacterData_0 (copy), v14 (copy), l_CurrentCamera_0 (copy), v27 (copy), v25 (copy), l_FieldOfView_0 (copy)
                if v21 then
                    return;
                elseif l_CharacterData_0.Cutscene.Value then
                    return;
                else
                    local v44 = 25;
                    local l_Magnitude_0 = (v14.PrimaryPart.Position - l_CurrentCamera_0.CFrame.Position).Magnitude;
                    local v46 = ((v27.PlaybackLoudness - 150) / 210) ^ 3;
                    if v25 then
                        v44 = 50;
                        v46 = ((v27.PlaybackLoudness - 150) / 205) ^ 4.8;
                    end;
                    if workspace.Settings.ReduceCameraShake.Value then
                        v46 = v46 / 3;
                    end;
                    if v44 < l_Magnitude_0 then
                        return;
                    else
                        local l_l_CurrentCamera_0_0 = l_CurrentCamera_0;
                        local l_l_FieldOfView_0_0 = l_FieldOfView_0;
                        local l_v46_0 = v46;
                        local v50 = math.clamp(l_Magnitude_0 / v44, 0, 1);
                        l_l_CurrentCamera_0_0.FieldOfView = l_l_FieldOfView_0_0 - (l_v46_0 + (0 - l_v46_0) * v50);
                        return;
                    end;
                end;
            end)));
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v14, 
                Animator = v16
            }).Event:Connect(function() --[[ Line: 175 ]]
                -- upvalues: v40 (copy)
                v40();
            end);
            task.wait(180);
            if v21 then
                return;
            else
                v40();
                return;
            end;
        end;
    end;
end;
return v0;