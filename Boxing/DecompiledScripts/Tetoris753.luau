local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = script.Name, 
        MainId = 82377425435460, 
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
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v14_Attribute_0 = v14:GetAttribute("Owner");
            local v24 = true;
            if v14 ~= l_Character_0 then
                v24 = l_v14_Attribute_0 and l_v14_Attribute_0 == l_Character_0.Name;
            end;
            local v25 = {
                Name = "Emote", 
                FadeIn = 0.25, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.StartId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v16
            };
            if not v24 then
                v25.Priority = Enum.AnimationPriority.Action;
            end;
            v25.AnimId = v0.Metadata.MainId;
            v25.Looped = true;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v25);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v25.FadeIn, v25.Weight, v25.Speed);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v14, 
                Name = "Rustle2", 
                Parent = v14.PrimaryPart
            });
            local v27 = nil;
            local v28 = 0;
            local v29 = nil;
            local v30 = false;
            v14:SetAttribute("CurrentEmote", v0.Metadata.Name);
            for _, v32 in workspace.Live:GetChildren() do
                if v32 ~= v14 and v32.PrimaryPart and (v14.PrimaryPart.Position - v32.PrimaryPart.Position).Magnitude <= 30 and v32:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                    v30 = true;
                    local v33 = v32 and v32:FindFirstChild("Humanoid");
                    local v34 = v33 and (v33:FindFirstChild("Animator") or v33);
                    if v34 then
                        local l_v34_PlayingAnimationTracks_0 = v34:GetPlayingAnimationTracks();
                        local v36 = false;
                        for _, v38 in l_v34_PlayingAnimationTracks_0 do
                            if v38.Name == "Emote" then
                                l_l_AnimHelper_0_Anim_0.TimePosition = v38.TimePosition;
                                v38.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
                                for _, v40 in game.Workspace.Debris:GetChildren() do
                                    if v40.Name == script.Name then
                                        v29 = v40:FindFirstChildWhichIsA("Sound");
                                        if v29 then
                                            v28 = v29.TimePosition;
                                        end;
                                    end;
                                end;
                                v36 = true;
                                break;
                            end;
                        end;
                        if v36 then
                            break;
                        end;
                    end;
                end;
            end;
            if v24 then
                for _, v42 in game.Workspace.Debris:GetChildren() do
                    if v42.Name == script.Name then
                        v29 = v42:FindFirstChildWhichIsA("Sound");
                        if v29 then
                            v29.Volume = 0;
                        end;
                    end;
                end;
            end;
            v27 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v14, 
                Looped = v25.Looped, 
                Parent = v14.PrimaryPart, 
                DirectCopy = script.Song, 
                Name = "Emote", 
                ShouldWeld = true, 
                PartName = v0.Metadata.Name
            });
            v27.TimePosition = 16;
            local v43 = true;
            if l_Character_0:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                v43 = false;
            end;
            local v44 = script.Microphone:Clone();
            v44.Parent = v14;
            v44.Weld.Part0 = v14.LeftHand;
            local v45 = script.MainLight:Clone();
            v45.Parent = v14.HumanoidRootPart;
            local v46 = script["Fading Music Note"]:Clone();
            v46.Parent = v14.HumanoidRootPart;
            task.delay(0.25, function() --[[ Line: 170 ]]
                -- upvalues: v43 (ref), v29 (ref), v27 (ref), v28 (ref), l_TweenService_0 (ref), v1 (ref)
                if not v43 then
                    return;
                elseif v29 then
                    v27.Volume = script.Song.Volume;
                    return;
                else
                    v27.TimePosition = v28;
                    l_TweenService_0:Create(v27, v1, {
                        Volume = script.Song.Volume
                    }):Play();
                    return;
                end;
            end);
            local function v51() --[[ Line: 182 ]] --[[ Name: Cleanup ]]
                -- upvalues: v21 (ref), v46 (copy), v45 (copy), v44 (copy), v20 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v13 (copy), v24 (copy), l_CharacterData_0 (copy), l_Occupied_0 (copy), v14 (copy), v0 (ref), v29 (ref), l_TweenService_0 (ref), v27 (ref), v1 (ref)
                if v21 then
                    return;
                else
                    v21 = true;
                    if v46 then
                        v46:Destroy();
                    end;
                    if v45 then
                        v45:Destroy();
                    end;
                    if v44 then
                        v44:Destroy();
                    end;
                    for _, v48 in v20 do
                        v48:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v13);
                    if v24 then
                        l_CharacterData_0.Toxic.Value = false;
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v14:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v14:SetAttribute("CurrentEmote", nil);
                    end;
                    if v24 then
                        for _, v50 in game.Workspace.Debris:GetChildren() do
                            if v50.Name == script.Name then
                                v29 = v50:FindFirstChildWhichIsA("Sound");
                                if v29 then
                                    v29.Volume = script.Song.Volume;
                                end;
                            end;
                        end;
                    end;
                    l_TweenService_0:Create(v27, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(3, function() --[[ Line: 230 ]]
                        -- upvalues: v27 (ref)
                        v27.Parent:Destroy();
                    end);
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v13, 30);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v14, 
                Animator = v16
            }).Event:Connect(function() --[[ Line: 246 ]]
                -- upvalues: v51 (copy)
                v51();
            end);
            task.wait(180);
            v51();
            return;
        end;
    end;
end;
return v0;