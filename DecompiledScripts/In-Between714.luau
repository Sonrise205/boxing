local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "67", 
        MainId = 136735765904577, 
        Rarity = "Rare", 
        Toxic = 1.5
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
local v13 = nil;
v0.Use = function(v14) --[[ Line: 27 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), v13 (ref), l_Modules_0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), v1 (copy)
    local v15 = v14:IsA("Player") and v14.Character or v14;
    local v16 = v15 and v15:FindFirstChild("Humanoid");
    local v17 = v16 and (v16:FindFirstChild("Animator") or v16);
    if not v17 then
        return;
    else
        local v18 = workspace.States[v15.Name];
        local l_CharacterData_0 = v18.CharacterData;
        local l_Occupied_0 = v18.Occupied;
        local v21 = l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v15, 
            Emote = v0
        });
        if not v13 then
            v13 = require(l_Modules_0:WaitForChild("EffectHelper"));
        end;
        local v22 = v13.GetWeldCharacter(v15);
        if not v21 then
            return;
        else
            local v23 = {};
            local v24 = false;
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v15_Attribute_0 = v15:GetAttribute("Owner");
            local v27 = true;
            if v15 ~= l_Character_0 then
                v27 = l_v15_Attribute_0 and l_v15_Attribute_0 == l_Character_0.Name;
            end;
            local v28 = {
                Name = "Emote", 
                FadeIn = 0.25, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.StartId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v17
            };
            if not v27 then
                v28.Priority = Enum.AnimationPriority.Action;
            end;
            v28.AnimId = v0.Metadata.MainId;
            v28.Looped = true;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v28);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v28.FadeIn, v28.Weight, v28.Speed);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Name = "Rustle2", 
                Parent = v15.PrimaryPart
            });
            local v30 = nil;
            local v31 = 0;
            local v32 = nil;
            local v33 = false;
            v15:SetAttribute("CurrentEmote", v0.Metadata.Name);
            for _, v35 in workspace.Live:GetChildren() do
                if v35 ~= v15 and v35.PrimaryPart and (v15.PrimaryPart.Position - v35.PrimaryPart.Position).Magnitude <= 30 and v35:GetAttribute("CurrentEmote") == v0.Metadata.Name then
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
            if v27 then
                for _, v45 in game.Workspace.Debris:GetChildren() do
                    if v45.Name == script.Name then
                        v32 = v45:FindFirstChildWhichIsA("Sound");
                        if v32 then
                            v32.Volume = 0;
                        end;
                    end;
                end;
            end;
            v30 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Looped = v28.Looped, 
                Parent = v15.PrimaryPart, 
                DirectCopy = script.Song, 
                Name = "Emote", 
                ShouldWeld = true, 
                PartName = v0.Metadata.Name
            });
            v30.TimePosition = 16;
            local v46 = true;
            if l_Character_0:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                v46 = false;
            end;
            task.delay(0.25, function() --[[ Line: 168 ]]
                -- upvalues: v46 (ref), v32 (ref), v30 (ref), v31 (ref), l_TweenService_0 (ref), v1 (ref)
                if not v46 then
                    return;
                elseif v32 then
                    v30.Volume = script.Song.Volume;
                    return;
                else
                    v30.TimePosition = v31;
                    l_TweenService_0:Create(v30, v1, {
                        Volume = script.Song.Volume
                    }):Play();
                    return;
                end;
            end);
            local v47 = script.SixVFX:Clone();
            v47.Parent = v22:FindFirstChild("RightHand") or v15.RightHand;
            v47["6"]:Emit(1);
            local v48 = script.SevenVFX:Clone();
            v48.Parent = v22:FindFirstChild("LeftHand") or v15.RightHand;
            task.delay(0.2, function() --[[ Line: 187 ]]
                -- upvalues: v47 (copy), v48 (copy)
                v47["6"]:Emit(1);
                v48["7"]:Emit(1);
            end);
            local function v53() --[[ Line: 192 ]] --[[ Name: Cleanup ]]
                -- upvalues: v24 (ref), v47 (copy), v48 (copy), v23 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v14 (copy), v27 (copy), l_CharacterData_0 (copy), l_Occupied_0 (copy), v15 (copy), v0 (ref), v32 (ref), l_TweenService_0 (ref), v30 (ref), v1 (ref)
                if v24 then
                    return;
                else
                    v24 = true;
                    v47:Destroy();
                    v48:Destroy();
                    for _, v50 in v23 do
                        v50:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v14);
                    if v27 then
                        l_CharacterData_0.Toxic.Value = false;
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v15:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v15:SetAttribute("CurrentEmote", nil);
                    end;
                    if v27 then
                        for _, v52 in game.Workspace.Debris:GetChildren() do
                            if v52.Name == script.Name then
                                v32 = v52:FindFirstChildWhichIsA("Sound");
                                if v32 then
                                    v32.Volume = script.Song.Volume;
                                end;
                            end;
                        end;
                    end;
                    l_TweenService_0:Create(v30, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(3, function() --[[ Line: 231 ]]
                        -- upvalues: v30 (ref)
                        v30.Parent:Destroy();
                    end);
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v14, 30);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v15, 
                Animator = v17
            }).Event:Connect(function() --[[ Line: 247 ]]
                -- upvalues: v53 (copy)
                v53();
            end);
            task.wait(180);
            v53();
            return;
        end;
    end;
end;
return v0;