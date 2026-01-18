local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Pearwell", 
        MainId = 106588373989615, 
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
local v9 = nil;
local function _(v10, v11, v12) --[[ Line: 23 ]] --[[ Name: Lerp ]]
    return v10 + (v11 - v10) * v12;
end;
v0.Use = function(v14) --[[ Line: 25 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), v9 (ref), l_Modules_0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), v1 (copy)
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
            if not v9 then
                v9 = require(l_Modules_0:WaitForChild("EffectHelper"));
            end;
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
            v26.AnimId = v0.Metadata.MainId;
            v26.Looped = false;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v26);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v26.FadeIn, v26.Weight, v26.Speed);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Name = "Rustle2", 
                Parent = v15
            });
            local v28 = nil;
            local v29 = 0;
            local v30 = nil;
            local v31 = false;
            v15:SetAttribute("CurrentEmote", v0.Metadata.Name);
            for _, v33 in workspace.Live:GetChildren() do
                if v33 ~= v15 and v33.PrimaryPart and (v15.PrimaryPart.Position - v33.PrimaryPart.Position).Magnitude <= 30 and v33:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                    v31 = true;
                    local v34 = v33 and v33:FindFirstChild("Humanoid");
                    local v35 = v34 and (v34:FindFirstChild("Animator") or v34);
                    if v35 then
                        local l_v35_PlayingAnimationTracks_0 = v35:GetPlayingAnimationTracks();
                        local v37 = false;
                        for _, v39 in l_v35_PlayingAnimationTracks_0 do
                            if v39.Name == "Emote" then
                                l_l_AnimHelper_0_Anim_0.TimePosition = v39.TimePosition;
                                v39.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
                                for _, v41 in game.Workspace.Debris:GetChildren() do
                                    if v41.Name == script.Name then
                                        v30 = v41:FindFirstChildWhichIsA("Sound");
                                        if v30 then
                                            v29 = v30.TimePosition;
                                        end;
                                    end;
                                end;
                                v37 = true;
                                break;
                            end;
                        end;
                        if v37 then
                            break;
                        end;
                    end;
                end;
            end;
            if v25 then
                for _, v43 in game.Workspace.Debris:GetChildren() do
                    if v43.Name == script.Name then
                        v30 = v43:FindFirstChildWhichIsA("Sound");
                        if v30 then
                            v30.Volume = 0;
                        end;
                    end;
                end;
            end;
            local v44 = nil;
            local v45 = true;
            if l_Character_0:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                v45 = false;
            end;
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            local v46 = l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v15, 
                Animator = v17
            });
            local v47 = nil;
            local function v52() --[[ Line: 167 ]] --[[ Name: Cleanup ]]
                -- upvalues: v22 (ref), v21 (copy), v47 (ref), v44 (ref), l_l_AnimHelper_0_Anim_0 (copy), v9 (ref), v15 (copy), l_EmoteHelper_0 (ref), v14 (copy), v25 (copy), l_CharacterData_0 (copy), l_Occupied_0 (copy), v0 (ref), v30 (ref), v28 (ref)
                if v22 then
                    return;
                else
                    v22 = true;
                    for _, v49 in v21 do
                        v49:Disconnect();
                    end;
                    if v47 then
                        v47:Destroy();
                    end;
                    if v44 then
                        v44:Destroy();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    if v9 then
                        v9.SetTransparency(v15, 0);
                    end;
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
                        for _, v51 in game.Workspace.Debris:GetChildren() do
                            if v51.Name == script.Name then
                                v30 = v51:FindFirstChildWhichIsA("Sound");
                                if v30 then
                                    v30.Volume = script.Song.Volume;
                                end;
                            end;
                        end;
                    end;
                    if v28 then
                        v28.Parent:Destroy();
                    end;
                    return;
                end;
            end;
            v46.Event:Connect(function() --[[ Line: 216 ]]
                -- upvalues: v52 (copy)
                v52();
            end);
            task.wait(1.3);
            if v22 then
                return;
            else
                local v53 = l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v15, 
                    Parent = v15.PrimaryPart, 
                    DirectCopy = script.Scream, 
                    Name = "Emote"
                });
                v21[#v21 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Emit"):Connect(function() --[[ Line: 231 ]]
                    -- upvalues: v22 (ref), l_Occupied_0 (copy), v47 (ref), v15 (copy), v53 (copy), l_EmoteHelper_0 (ref), v9 (ref), v44 (ref), v21 (copy), v28 (ref), v26 (copy), v14 (copy), v45 (ref), v30 (ref), v29 (ref), l_TweenService_0 (ref), v1 (ref)
                    if v22 then
                        return;
                    else
                        l_Occupied_0.SpeedMult.Value = 0.95;
                        l_Occupied_0.LerpMult.Value = 0.95;
                        v47 = script.BOOM:Clone();
                        v47.Parent = v15.HumanoidRootPart;
                        v53:Destroy();
                        local _ = l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v15, 
                            Parent = v15.PrimaryPart, 
                            DirectCopy = script.Explode, 
                            Name = "Emote"
                        });
                        if v9 then
                            v47:Emit(1);
                            v9.SetTransparency(v15, 1);
                            if math.random(1, 2) > 1 then
                                v44 = script.Thing:Clone();
                            else
                                v44 = script.Thing2:Clone();
                            end;
                            v44.Parent = workspace.Debris;
                            v44.Position = v15.HumanoidRootPart.Position;
                            local v55 = 0;
                            local v56 = 0;
                            do
                                local l_v55_0, l_v56_0 = v55, v56;
                                v21[#v21 + 1] = game:GetService("RunService").Heartbeat:Connect(function(v59) --[[ Line: 265 ]]
                                    -- upvalues: v44 (ref), l_v55_0 (ref), l_v56_0 (ref), v15 (ref)
                                    if not v44 or not v44.Parent then
                                        return;
                                    else
                                        if l_v55_0 == 180 then
                                            l_v55_0 = 0;
                                        end;
                                        if l_v56_0 >= 10 then
                                            l_v56_0 = l_v56_0 - v59;
                                        else
                                            l_v56_0 = l_v56_0 + v59;
                                        end;
                                        v44.Position = Vector3.new(v15.HumanoidRootPart.Position.X, v15.HumanoidRootPart.Position.Y + math.cos(l_v55_0), v15.HumanoidRootPart.Position.Z);
                                        v44.CFrame = v44.CFrame * CFrame.Angles(0, math.rad(l_v56_0 / 3), 0);
                                        if v44.Name == "Thing" then
                                            v44.Weld.C0 = CFrame.new(0, 0, 0);
                                        end;
                                        return;
                                    end;
                                end);
                            end;
                        end;
                        if v44.Name == "Thing" then
                            v28 = l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v15, 
                                Looped = v26.Looped, 
                                Parent = v15.PrimaryPart, 
                                DirectCopy = script.Song, 
                                Name = "Emote", 
                                ShouldWeld = true
                            });
                        else
                            v28 = l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v15, 
                                Looped = v26.Looped, 
                                Parent = v15.PrimaryPart, 
                                DirectCopy = script.Song2, 
                                Name = "Emote", 
                                ShouldWeld = true
                            });
                        end;
                        l_EmoteHelper_0.CreateCharacterMuteZone(v14, 30);
                        task.delay(0, function() --[[ Line: 319 ]]
                            -- upvalues: v45 (ref), v30 (ref), v28 (ref), v29 (ref), l_TweenService_0 (ref), v1 (ref)
                            if not v45 then
                                return;
                            elseif v30 then
                                if v28.Name == "Song" then
                                    v28.Volume = script.Song.Volume;
                                    return;
                                else
                                    v28.Volume = script.Song2.Volume;
                                    return;
                                end;
                            else
                                v28.TimePosition = v29;
                                if v28.Name == "Song" then
                                    l_TweenService_0:Create(v28, v1, {
                                        Volume = script.Song.Volume
                                    }):Play();
                                    return;
                                else
                                    l_TweenService_0:Create(v28, v1, {
                                        Volume = script.Song2.Volume
                                    }):Play();
                                    return;
                                end;
                            end;
                        end);
                        return;
                    end;
                end);
                return;
            end;
        end;
    end;
end;
return v0;