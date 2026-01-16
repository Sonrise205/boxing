local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Kickback", 
        MainId = 15851171997, 
        Rarity = "Rare"
    }
};
local v1 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v10, v11, v12) --[[ Line: 22 ]] --[[ Name: Lerp ]]
    return v10 + (v11 - v10) * v12;
end;
v0.Use = function(v14) --[[ Line: 24 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), v1 (copy)
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
                Name = "Emote", 
                FadeIn = 0.25, 
                Weight = 1, 
                Speed = 1, 
                Looped = true, 
                AnimId = v0.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v17
            };
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v15_Attribute_0 = v15:GetAttribute("Owner");
            local v26 = true;
            if v15 ~= l_Character_0 then
                v26 = l_v15_Attribute_0 and l_v15_Attribute_0 == l_Character_0.Name;
            end;
            if not v26 then
                v23.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v23);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v23.FadeIn, v23.Weight, v23.Speed);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Name = "Rustle1", 
                Parent = v15.PrimaryPart
            });
            local v28 = nil;
            local v29 = 0.7;
            local v30 = nil;
            local v31 = false;
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
            if v26 then
                for _, v43 in game.Workspace.Debris:GetChildren() do
                    if v43.Name == script.Name then
                        v30 = v43:FindFirstChildWhichIsA("Sound");
                        if v30 then
                            v30.Volume = 0;
                        end;
                    end;
                end;
            end;
            v28 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Looped = v23.Looped, 
                Parent = v15.PrimaryPart, 
                DirectCopy = script.Song, 
                Name = "Emote", 
                ShouldWeld = true, 
                PartName = v0.Metadata.Name
            });
            v28.TimePosition = v29;
            v28.Volume = 0;
            if l_Character_0:GetAttribute("CurrentEmote") ~= v0.Metadata.Name then
                l_TweenService_0:Create(v28, v1, {
                    Volume = script.Song.Volume
                }):Play();
            end;
            local function v48() --[[ Line: 152 ]] --[[ Name: Cleanup ]]
                -- upvalues: v22 (ref), v21 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v14 (copy), v26 (copy), l_CharacterData_0 (copy), l_Occupied_0 (copy), v15 (copy), v0 (ref), v30 (ref), l_TweenService_0 (ref), v28 (ref), v1 (ref)
                if v22 then
                    return;
                else
                    v22 = true;
                    for _, v45 in v21 do
                        v45:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v14);
                    if v26 then
                        l_CharacterData_0.Toxic.Value = false;
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v15:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v15:SetAttribute("CurrentEmote", nil);
                    end;
                    if v26 then
                        for _, v47 in game.Workspace.Debris:GetChildren() do
                            if v47.Name == script.Name then
                                v30 = v47:FindFirstChildWhichIsA("Sound");
                                if v30 then
                                    v30.Volume = script.Song.Volume;
                                end;
                            end;
                        end;
                    end;
                    l_TweenService_0:Create(v28, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(3, function() --[[ Line: 187 ]]
                        -- upvalues: v28 (ref)
                        v28.Parent:Destroy();
                    end);
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v14, 30);
            v15:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v15, 
                Animator = v17
            }).Event:Connect(function() --[[ Line: 204 ]]
                -- upvalues: v48 (copy)
                print("what....");
                v48();
            end);
            task.wait(180);
            v48();
            return;
        end;
    end;
end;
return v0;