local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Soldier of Dance", 
        MainId = 15838119382, 
        StartId = 15838117241, 
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
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), v1 (copy), l_RunService_0 (copy)
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
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v15_Attribute_0 = v15:GetAttribute("Owner");
            local v25 = true;
            if v15 ~= l_Character_0 then
                v25 = l_v15_Attribute_0 and l_v15_Attribute_0 == l_Character_0.Name;
            end;
            local v26 = {
                Name = "Emote", 
                FadeIn = 0.25, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.StartId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v17
            };
            if not v25 then
                v26.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v26);
            v26.AnimId = v0.Metadata.MainId;
            v26.Looped = true;
            local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v26);
            l_l_AnimHelper_0_Anim_1:Stop(0.01);
            l_l_AnimHelper_0_Anim_1:Play(v26.FadeIn, 0.1, v26.Speed);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v26.FadeIn, v26.Weight, v26.Speed);
            task.delay(0.75, function() --[[ Line: 78 ]]
                -- upvalues: v22 (ref), l_l_AnimHelper_0_Anim_1 (copy), v26 (copy)
                if v22 then
                    return;
                else
                    l_l_AnimHelper_0_Anim_1:AdjustWeight(v26.Weight);
                    return;
                end;
            end);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Name = "Rustle2", 
                Parent = v15.PrimaryPart
            });
            local v29 = nil;
            local v30 = 0;
            local v31 = nil;
            local v32 = false;
            for _, v34 in workspace.Live:GetChildren() do
                if v34 ~= v15 and v34.PrimaryPart and (v15.PrimaryPart.Position - v34.PrimaryPart.Position).Magnitude <= 30 and v34:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                    v32 = true;
                    local v35 = v34 and v34:FindFirstChild("Humanoid");
                    local v36 = v35 and (v35:FindFirstChild("Animator") or v35);
                    if v36 then
                        local l_v36_PlayingAnimationTracks_0 = v36:GetPlayingAnimationTracks();
                        local v38 = false;
                        for _, v40 in l_v36_PlayingAnimationTracks_0 do
                            if v40.Name == "Emote" then
                                l_l_AnimHelper_0_Anim_1.TimePosition = v40.TimePosition;
                                v40.TimePosition = l_l_AnimHelper_0_Anim_1.TimePosition;
                                for _, v42 in game.Workspace.Debris:GetChildren() do
                                    if v42.Name == script.Name then
                                        v31 = v42:FindFirstChildWhichIsA("Sound");
                                        if v31 then
                                            v30 = v31.TimePosition;
                                        end;
                                    end;
                                end;
                                v38 = true;
                                break;
                            end;
                        end;
                        if v38 then
                            break;
                        end;
                    end;
                end;
            end;
            if v25 then
                for _, v44 in game.Workspace.Debris:GetChildren() do
                    if v44.Name == script.Name then
                        v31 = v44:FindFirstChildWhichIsA("Sound");
                        if v31 then
                            v31.Volume = 0;
                        end;
                    end;
                end;
            end;
            v29 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Looped = v26.Looped, 
                Parent = v15.PrimaryPart, 
                DirectCopy = script.Song, 
                Name = "Emote", 
                ShouldWeld = true, 
                PartName = v0.Metadata.Name
            });
            v29.Volume = 0;
            local v45 = true;
            if l_Character_0:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                v45 = false;
            end;
            task.delay(0.25, function() --[[ Line: 168 ]]
                -- upvalues: v45 (ref), v31 (ref), v29 (ref), v30 (ref), l_TweenService_0 (ref), v1 (ref)
                if not v45 then
                    return;
                elseif v31 then
                    v29.Volume = script.Song.Volume;
                    return;
                else
                    v29.TimePosition = v30;
                    l_TweenService_0:Create(v29, v1, {
                        Volume = script.Song.Volume
                    }):Play();
                    return;
                end;
            end);
            local function v50() --[[ Line: 180 ]] --[[ Name: Cleanup ]]
                -- upvalues: v22 (ref), v25 (copy), l_Occupied_0 (copy), l_RunService_0 (ref), v21 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_EmoteHelper_0 (ref), v14 (copy), l_CharacterData_0 (copy), v15 (copy), v0 (ref), v31 (ref), l_TweenService_0 (ref), v29 (ref), v1 (ref)
                if v22 then
                    return;
                else
                    v22 = true;
                    if v25 then
                        l_Occupied_0.ForceMove.Value = false;
                        l_RunService_0:UnbindFromRenderStep("ForceMove");
                    end;
                    for _, v47 in v21 do
                        v47:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_l_AnimHelper_0_Anim_1.Looped = false;
                    l_l_AnimHelper_0_Anim_1:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v14);
                    if v25 then
                        l_CharacterData_0.Toxic.Value = false;
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v15:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v15:SetAttribute("CurrentEmote", nil);
                    end;
                    if v25 then
                        for _, v49 in game.Workspace.Debris:GetChildren() do
                            if v49.Name == script.Name then
                                v31 = v49:FindFirstChildWhichIsA("Sound");
                                if v31 then
                                    v31.Volume = script.Song.Volume;
                                end;
                            end;
                        end;
                    end;
                    l_TweenService_0:Create(v29, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(3, function() --[[ Line: 224 ]]
                        -- upvalues: v29 (ref)
                        v29.Parent:Destroy();
                    end);
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v14, 30);
            v15:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 0.9;
            l_Occupied_0.LerpMult.Value = 0.85;
            task.delay(0.25, function() --[[ Line: 235 ]]
                -- upvalues: v22 (ref), l_Occupied_0 (copy)
                if v22 then
                    return;
                else
                    l_Occupied_0.ForceMove.Value = true;
                    return;
                end;
            end);
            local v51 = l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v15, 
                Animator = v17
            });
            if v25 then
                l_RunService_0:BindToRenderStep("ForceMove", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 247 ]]
                    -- upvalues: v22 (ref), l_CharacterData_0 (copy), v16 (copy), l_Occupied_0 (copy), v15 (copy)
                    if v22 then
                        return;
                    elseif l_CharacterData_0.Cutscene.Value then
                        return;
                    else
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
            v51.Event:Connect(function() --[[ Line: 267 ]]
                -- upvalues: v50 (copy)
                v50();
            end);
            task.wait(180);
            v50();
            return;
        end;
    end;
end;
return v0;