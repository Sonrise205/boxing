local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Karaoke", 
        MainId = 15570949446, 
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
            local v22 = {
                Name = "Emote", 
                FadeIn = 0.25, 
                Weight = 1, 
                Speed = 1, 
                Looped = true, 
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
                v22.Weight = 1000;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v22);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v22.FadeIn, v22.Weight, v22.Speed);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v14, 
                Name = "Rustle1", 
                Parent = v14.PrimaryPart
            });
            local v27 = v14 and workspace.Welds:FindFirstChild(v14.Name);
            local v28 = v27 and v27:FindFirstChild("WeldCharacter") or v14;
            local v29 = script.Microphone:Clone();
            v29.Parent = v28;
            local l_Weld_0 = Instance.new("Weld");
            l_Weld_0.Parent = v29;
            l_Weld_0.Part0 = v29;
            l_Weld_0.Part1 = v14.LeftHand;
            l_Weld_0.C0 = CFrame.new(0, 0, 0.35) * CFrame.Angles(1.5707963267948966, 0, 0);
            local v31 = nil;
            local v32 = false;
            for _, v34 in workspace.Live:GetChildren() do
                if v34 ~= v14 and v34.PrimaryPart and (v14.PrimaryPart.Position - v34.PrimaryPart.Position).Magnitude <= 30 and v34:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                    v32 = true;
                    local v35 = v34 and v34:FindFirstChild("Humanoid");
                    local v36 = v35 and (v35:FindFirstChild("Animator") or v35);
                    if v36 then
                        local l_v36_PlayingAnimationTracks_0 = v36:GetPlayingAnimationTracks();
                        local v38 = false;
                        for _, v40 in l_v36_PlayingAnimationTracks_0 do
                            if v40.Name == "Emote" then
                                l_l_AnimHelper_0_Anim_0.TimePosition = v40.TimePosition;
                                v40.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
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
            if not v32 then
                v31 = l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v14, 
                    Looped = v22.Looped, 
                    Parent = v14.PrimaryPart, 
                    DirectCopy = script.Song, 
                    Name = "Emote", 
                    ShouldWeld = true, 
                    PartName = v0.Metadata.Name
                });
                local v41 = {
                    0, 
                    109, 
                    211, 
                    281
                };
                v31.TimePosition = v41[math.random(0, #v41)];
            end;
            local function v53() --[[ Line: 136 ]] --[[ Name: Cleanup ]]
                -- upvalues: v21 (ref), v20 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v13 (copy), v25 (copy), l_CharacterData_0 (copy), l_Occupied_0 (copy), v14 (copy), v0 (ref), v29 (copy), l_TweenService_0 (ref), v1 (ref)
                if v21 then
                    return;
                else
                    v21 = true;
                    for _, v43 in v20 do
                        v43:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v13);
                    if v25 then
                        l_CharacterData_0.Toxic.Value = false;
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v14:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v14:SetAttribute("CurrentEmote", nil);
                    end;
                    v29:Destroy();
                    local v44 = true;
                    for _, v46 in workspace.Live:GetChildren() do
                        if v46 ~= v14 and v46.PrimaryPart and (v14.PrimaryPart.Position - v46.PrimaryPart.Position).Magnitude <= 30 and v46:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                            v44 = false;
                            break;
                        end;
                    end;
                    if v44 then
                        local v47 = nil;
                        for _, v49 in workspace.Debris:GetChildren() do
                            if v49.Name == v0.Metadata.Name then
                                if not v47 then
                                    v47 = v49;
                                else
                                    local l_Magnitude_0 = (v14.PrimaryPart.Position - v47.Position).Magnitude;
                                    local _ = (v14.PrimaryPart.Position - v49.Position).Magnitude;
                                    if l_Magnitude_0 < l_Magnitude_0 then
                                        v47 = v49;
                                    end;
                                end;
                            end;
                        end;
                        l_TweenService_0:Create(v47.Emote, v1, {
                            Volume = 0
                        }):Play();
                        do
                            local l_v47_0 = v47;
                            task.delay(1, function() --[[ Line: 195 ]]
                                -- upvalues: l_v47_0 (ref)
                                l_v47_0:Destroy();
                            end);
                        end;
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
            }).Event:Connect(function() --[[ Line: 213 ]]
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