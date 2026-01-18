local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Whistle", 
        MainId = 15562348008, 
        LoopId = 15562514749, 
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
local v9 = require(l_Modules_0.Misc.WindLines);
v0.Use = function(v10) --[[ Line: 25 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), v9 (copy), l_TweenService_0 (copy), v1 (copy)
    local v11 = v10:IsA("Player") and v10.Character or v10;
    local v12 = v11 and v11:FindFirstChild("Humanoid");
    local v13 = v12 and (v12:FindFirstChild("Animator") or v12);
    if not v13 then
        return;
    else
        local v14 = workspace.States[v11.Name];
        local l_CharacterData_0 = v14.CharacterData;
        local l_Occupied_0 = v14.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v11, 
            Emote = v0
        }) then
            return;
        else
            local v17 = {};
            local v18 = false;
            local v19 = {
                Name = "Emote", 
                FadeIn = 0.25, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v13
            };
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v11_Attribute_0 = v11:GetAttribute("Owner");
            local v22 = true;
            if v11 ~= l_Character_0 then
                v22 = l_v11_Attribute_0 and l_v11_Attribute_0 == l_Character_0.Name;
            end;
            if not v22 then
                v19.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v19);
            task.defer(function() --[[ Line: 65 ]]
                -- upvalues: l_Players_0 (ref), v11 (copy), v9 (ref)
                if (l_Players_0.LocalPlayer.Character.PrimaryPart.Position - v11.PrimaryPart.Position).Magnitude > 25 then
                    return;
                else
                    v9:Init({
                        Direction = (v11.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0)).LookVector, 
                        Speed = 20, 
                        Lifetime = 1.5, 
                        SpawnRate = 30
                    });
                    return;
                end;
            end);
            v19.AnimId = v0.Metadata.LoopId;
            v19.Looped = true;
            local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v19);
            l_l_AnimHelper_0_Anim_1:Stop(0.01);
            l_l_AnimHelper_0_Anim_1:Play(v19.FadeIn, 0.1, v19.Speed);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v19.FadeIn, v19.Weight, v19.Speed);
            task.delay(8.333333333333334, function() --[[ Line: 88 ]]
                -- upvalues: v18 (ref), l_l_AnimHelper_0_Anim_1 (copy), v19 (copy)
                if v18 then
                    return;
                else
                    l_l_AnimHelper_0_Anim_1:AdjustWeight(v19.Weight);
                    return;
                end;
            end);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v11, 
                Name = "Rustle4", 
                Parent = v11.PrimaryPart
            });
            local v25 = v11 and workspace.Welds:FindFirstChild(v11.Name);
            local v26 = v25 and v25:FindFirstChild("WeldCharacter") or v11;
            local v27 = script.Effects.Smoke:Clone();
            v27.Parent = v26.Head;
            task.delay(0.7833333333333333, function() --[[ Line: 105 ]]
                -- upvalues: v18 (ref), l_EmoteHelper_0 (ref), v11 (copy), v27 (copy)
                if v18 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v11, 
                        Name = "Rustle5", 
                        Parent = v11.PrimaryPart
                    });
                    task.wait(5.333333333333333);
                    if v18 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v11, 
                            Name = "Rustle3", 
                            Volume = 0.15, 
                            Parent = v11.PrimaryPart
                        });
                        for _, v29 in v27:GetChildren() do
                            v29.Enabled = false;
                        end;
                        return;
                    end;
                end;
            end);
            local v30 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v11, 
                Looped = v19.Looped, 
                Parent = v11.PrimaryPart, 
                DirectCopy = script.Song, 
                Name = "Emote", 
                ShouldWeld = true
            });
            local function v35() --[[ Line: 137 ]] --[[ Name: Cleanup ]]
                -- upvalues: v18 (ref), v9 (ref), v17 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_EmoteHelper_0 (ref), v10 (copy), v22 (copy), l_Occupied_0 (copy), v11 (copy), v0 (ref), v27 (copy), l_TweenService_0 (ref), v30 (copy), v1 (ref)
                if v18 then
                    return;
                else
                    v18 = true;
                    v9:Cleanup();
                    for _, v32 in v17 do
                        v32:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_1.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_l_AnimHelper_0_Anim_1:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v10);
                    if v22 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v11:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v11:SetAttribute("CurrentEmote", nil);
                    end;
                    for _, v34 in v27:GetChildren() do
                        v34.Enabled = false;
                    end;
                    l_TweenService_0:Create(v30, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(3, function() --[[ Line: 168 ]]
                        -- upvalues: v30 (ref), v27 (ref)
                        v30.Parent:Destroy();
                        v27:Destroy();
                    end);
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v10, 30);
            v11:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v11, 
                Animator = v13
            }).Event:Connect(function() --[[ Line: 186 ]]
                -- upvalues: v35 (copy)
                v35();
            end);
            task.wait(180);
            v35();
            return;
        end;
    end;
end;
return v0;