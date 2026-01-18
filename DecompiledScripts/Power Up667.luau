local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Power Up", 
        MainId = 125117010391922, 
        Rarity = "Mythic"
    }
};
local _ = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local v9 = nil;
local v10 = nil;
local v11 = nil;
local function _(v12, v13, v14) --[[ Line: 25 ]] --[[ Name: Lerp ]]
    return v12 + (v13 - v12) * v14;
end;
v0.Use = function(v16) --[[ Line: 27 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), v9 (ref), l_Modules_0 (copy), v11 (ref), l_ReplicatedStorage_0 (copy), v10 (ref), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy)
    local v17 = v16:IsA("Player") and v16.Character or v16;
    local v18 = v17 and v17:FindFirstChild("Humanoid");
    local v19 = v18 and (v18:FindFirstChild("Animator") or v18);
    if not v19 then
        return;
    else
        local v20 = workspace.States[v17.Name];
        local l_CharacterData_0 = v20.CharacterData;
        local l_Occupied_0 = v20.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v17, 
            Emote = v0
        }) then
            return;
        else
            if not v9 then
                v9 = require(l_Modules_0.Cutscene:WaitForChild("Utilities"));
            end;
            if not v11 then
                v11 = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
            end;
            if not v10 then
                v10 = require(l_Modules_0:WaitForChild("EffectHelper"));
            end;
            local v23 = v10.GetWeldCharacter(v17);
            local v24 = {};
            local v25 = false;
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v17_Attribute_0 = v17:GetAttribute("Owner");
            local v28 = true;
            if v17 ~= l_Character_0 then
                v28 = l_v17_Attribute_0 and l_v17_Attribute_0 == l_Character_0.Name;
            end;
            local v29 = {
                Name = "Emote", 
                FadeIn = 0.25, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.StartId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v19
            };
            if not v28 then
                v29.Priority = Enum.AnimationPriority.Action;
            end;
            v29.AnimId = v0.Metadata.MainId;
            v29.Looped = false;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v29);
            l_l_AnimHelper_0_Anim_0:Play(v29.FadeIn, v29.Weight, v29.Speed);
            local v31 = 0;
            local v32 = nil;
            local v33 = false;
            v17:SetAttribute("CurrentEmote", v0.Metadata.Name);
            for _, v35 in workspace.Live:GetChildren() do
                if v35 ~= v17 and v35.PrimaryPart and (v17.PrimaryPart.Position - v35.PrimaryPart.Position).Magnitude <= 30 and v35:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                    v33 = true;
                    local v36 = v35 and v35:FindFirstChild("Humanoid");
                    local v37 = v36 and (v36:FindFirstChild("Animator") or v36);
                    if v37 then
                        local l_v37_PlayingAnimationTracks_0 = v37:GetPlayingAnimationTracks();
                        local v39 = false;
                        for _, v41 in l_v37_PlayingAnimationTracks_0 do
                            if v41.Name == "Emote" then
                                l_l_AnimHelper_0_Anim_0.TimePosition = v41.TimePosition;
                                v41.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
                                for _, v43 in game.Workspace.Debris:GetChildren() do
                                    if v43.Name == script.Name then
                                        v32 = v43:FindFirstChildWhichIsA("Sound");
                                        if v32 then
                                            v31 = v32.TimePosition;
                                        end;
                                    end;
                                end;
                                v39 = true;
                                break;
                            end;
                        end;
                        if v39 then
                            break;
                        end;
                    end;
                end;
            end;
            if v28 then
                for _, v45 in game.Workspace.Debris:GetChildren() do
                    if v45.Name == script.Name then
                        v32 = v45:FindFirstChildWhichIsA("Sound");
                        if v32 then
                            v32.Volume = 0;
                        end;
                    end;
                end;
            end;
            local v46 = true;
            if l_Character_0:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                v46 = false;
            end;
            local l_Density_0 = game.Lighting.DefaultAtmosphere.Density;
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            local v48 = l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v17, 
                Animator = v19
            });
            local v49 = {};
            local v50 = nil;
            local v51 = nil;
            local v52 = nil;
            local v53 = nil;
            local v54 = nil;
            local function v61() --[[ Line: 180 ]] --[[ Name: Cleanup ]]
                -- upvalues: v25 (ref), v24 (copy), v53 (ref), v52 (ref), v51 (ref), v50 (ref), v49 (copy), v28 (copy), l_Density_0 (copy), l_TweenService_0 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v16 (copy), l_CharacterData_0 (copy), l_Occupied_0 (copy), v17 (copy), v0 (ref), v32 (ref), v54 (ref)
                if v25 then
                    return;
                else
                    v25 = true;
                    for _, v56 in v24 do
                        v56:Disconnect();
                    end;
                    if v53 then
                        v53:Destroy();
                    end;
                    if v52 then
                        v52:Destroy();
                    end;
                    if v51 then
                        v51:Destroy();
                    end;
                    if v50 then
                        v50:Destroy();
                    end;
                    for _, v58 in v49 do
                        v58:Destroy();
                    end;
                    if v28 and game.Lighting:FindFirstChildWhichIsA("Atmosphere") and game.Lighting:FindFirstChildWhichIsA("Atmosphere").Density ~= l_Density_0 then
                        l_TweenService_0:Create(game.Lighting:FindFirstChildWhichIsA("Atmosphere"), TweenInfo.new(0.5), {
                            Density = l_Density_0
                        }):Play();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v16);
                    if v28 then
                        l_CharacterData_0.Toxic.Value = false;
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v17:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v17:SetAttribute("CurrentEmote", nil);
                    end;
                    if v28 then
                        for _, v60 in game.Workspace.Debris:GetChildren() do
                            if v60.Name == script.Name then
                                v32 = v60:FindFirstChildWhichIsA("Sound");
                                if v32 then
                                    v32.Volume = script.Song.Volume;
                                end;
                            end;
                        end;
                    end;
                    if v54 then
                        v54:StartFadeOut(0.25);
                    end;
                    return;
                end;
            end;
            v48.Event:Connect(function() --[[ Line: 245 ]]
                -- upvalues: v61 (copy)
                v61();
            end);
            if v25 then
                return;
            else
                v24[#v24 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Rustle"):Connect(function() --[[ Line: 251 ]]
                    -- upvalues: v25 (ref), l_EmoteHelper_0 (ref), v17 (copy)
                    if v25 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v17, 
                            Name = "Rustle5", 
                            Parent = v17, 
                            Volume = 1
                        });
                        return;
                    end;
                end);
                v24[#v24 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("PowerUp"):Connect(function() --[[ Line: 262 ]]
                    -- upvalues: v25 (ref), v28 (copy), l_TweenService_0 (ref), v52 (ref), l_EmoteHelper_0 (ref), v17 (copy), v53 (ref), v16 (copy), v51 (ref), v23 (copy), v10 (ref), v54 (ref), v50 (ref), v9 (ref), v49 (copy), v11 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_CharacterData_0 (copy), l_Occupied_0 (copy), l_Density_0 (copy), v61 (copy)
                    if v25 then
                        return;
                    else
                        if v28 and game.Lighting:FindFirstChildWhichIsA("Atmosphere") then
                            l_TweenService_0:Create(game.Lighting:FindFirstChildWhichIsA("Atmosphere"), TweenInfo.new(0.5), {
                                Density = 0.25
                            }):Play();
                        end;
                        v52 = l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v17, 
                            Parent = v17.PrimaryPart, 
                            DirectCopy = script.Blast, 
                            Name = "Emote"
                        });
                        v52.TimePosition = 0.1;
                        v53 = l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v17, 
                            Parent = v17.PrimaryPart, 
                            DirectCopy = script.Loop, 
                            Name = "Emote"
                        });
                        l_EmoteHelper_0.CreateCharacterMuteZone(v16, 30);
                        v51 = script.Aura.HumanoidRootPart.MainAuraAttachment:Clone();
                        v51.Parent = v23:FindFirstChild("HumanoidRootPart") or v17.HumanoidRootPart;
                        if v10 and v28 then
                            v54 = v10.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 1.3, 
                                Fade = 1
                            });
                        end;
                        local v62 = {
                            math.random(50, 130), 
                            math.random(50, 130), 
                            math.random(50, 130); 
                            [math.random(1, 3)] = 165
                        };
                        local v63 = Color3.fromRGB(v62[1], v62[2], v62[3]);
                        local _ = Color3.fromRGB(v62[1] * 2, v62[2] * 2, v62[3] * 2);
                        local v65 = ColorSequence.new(v63);
                        v50 = v9.SpawnGroup(script.PowerUp, v17.HumanoidRootPart.CFrame);
                        for _, v67 in v50:GetDescendants() do
                            if v67:IsA("ParticleEmitter") then
                                table.insert(v49, v67);
                            end;
                        end;
                        for _, v69 in v51:GetDescendants() do
                            if v69:IsA("ParticleEmitter") or v69:IsA("SpotLight") then
                                table.insert(v49, v69);
                            end;
                        end;
                        for _, v71 in v49 do
                            if v71:IsA("Attachment") and v71.Name ~= "Emit" and v71.Name ~= "Cresent" then
                                for _, v73 in v71:GetDescendants() do
                                    if v73:IsA("ParticleEmitter") and v73.Parent.Name ~= "Emit" and v71.Parent.Name ~= "Cresent" then
                                        v73.Color = v65;
                                    end;
                                    if v73:IsA("SpotLight") then
                                        v73.Color = v63;
                                    end;
                                end;
                            end;
                            if v71:IsA("ParticleEmitter") then
                                v71.Color = v65;
                            end;
                        end;
                        v9.Emit(v51);
                        v9.Emit(v50);
                        task.spawn(function() --[[ Line: 346 ]]
                            -- upvalues: v11 (ref), v25 (ref), v17 (ref)
                            for _ = 1, 9 do
                                if v11 then
                                    if not v25 then
                                        task.defer(function() --[[ Line: 350 ]]
                                            -- upvalues: v11 (ref), v17 (ref)
                                            v11.CreateBubble(v17.PrimaryPart.CFrame, Vector3.new(5, 5, 5, 0), 10, Vector3.new(25, 25, 25, 0), 0.25);
                                        end);
                                    else
                                        break;
                                    end;
                                end;
                                task.wait(0.2);
                            end;
                        end);
                        task.wait(1.5);
                        if v25 then
                            return;
                        else
                            l_TweenService_0:Create(v53, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                Volume = 0
                            }):Play();
                            l_l_AnimHelper_0_Anim_0.Looped = false;
                            if v28 then
                                l_CharacterData_0.Toxic.Value = false;
                                l_Occupied_0.SpeedMult.Value = 0;
                                l_Occupied_0.LerpMult.Value = 0;
                            end;
                            v51.Spotlight.PowerUp.Brightness = 0;
                            if v28 and game.Lighting:FindFirstChildWhichIsA("Atmosphere") and game.Lighting:FindFirstChildWhichIsA("Atmosphere").Density ~= l_Density_0 then
                                l_TweenService_0:Create(game.Lighting:FindFirstChildWhichIsA("Atmosphere"), TweenInfo.new(0.5), {
                                    Density = l_Density_0
                                }):Play();
                            end;
                            l_EmoteHelper_0.DestroyCharacterMuteZone(v16);
                            task.wait(1);
                            v61();
                            return;
                        end;
                    end;
                end);
                return;
            end;
        end;
    end;
end;
return v0;