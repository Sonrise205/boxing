local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Gear Second", 
        MainId = 15582807030, 
        StartId = 15582802070, 
        Rarity = "Mythic"
    }
};
local v1 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_NumberSequenceTween_0 = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v10, v11, v12) --[[ Line: 24 ]] --[[ Name: Lerp ]]
    return v10 + (v11 - v10) * v12;
end;
v0.Use = function(v14) --[[ Line: 26 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_NumberSequenceTween_0 (copy), l_TweenService_0 (copy), v1 (copy)
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
                AnimId = v0.Metadata.StartId, 
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
            v23.AnimId = v0.Metadata.MainId;
            v23.Looped = true;
            local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v23);
            l_l_AnimHelper_0_Anim_1:Stop(0.01);
            l_l_AnimHelper_0_Anim_1:Play(v23.FadeIn, 0.1, v23.Speed);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v23.FadeIn, v23.Weight, v23.Speed);
            task.delay(2.966666666666667, function() --[[ Line: 77 ]]
                -- upvalues: v22 (ref), l_l_AnimHelper_0_Anim_1 (copy), v23 (copy)
                if v22 then
                    return;
                else
                    l_l_AnimHelper_0_Anim_1:AdjustWeight(v23.Weight);
                    return;
                end;
            end);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Name = "Rustle1", 
                Parent = v15.PrimaryPart
            });
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Name = "Rustle3", 
                Parent = v15.PrimaryPart
            });
            local v29 = script.Effects.Main:Clone();
            v29.Parent = v15.UpperTorso;
            local v30 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Parent = v15.PrimaryPart, 
                DirectCopy = script.Song, 
                Name = "Emote", 
                ShouldWeld = true
            });
            local v31 = {};
            local v32 = {};
            task.delay(1.3333333333333333, function() --[[ Line: 108 ]]
                -- upvalues: v22 (ref), v29 (copy), v15 (copy), v31 (copy), l_NumberSequenceTween_0 (ref), v32 (copy), l_EmoteHelper_0 (ref), l_TweenService_0 (ref), v30 (copy), v1 (ref)
                if v22 then
                    return;
                else
                    for _, v34 in v29:GetChildren() do
                        v34:Emit(v34.Rate);
                    end;
                    local v35 = script.Effects.Smoke:Clone();
                    v35.Parent = v15.UpperTorso;
                    table.insert(v31, v35);
                    local v36 = script.Effects.Smoke2:Clone();
                    v36.Parent = v15.UpperTorso;
                    table.insert(v31, v36);
                    for _, v38 in script.Beams:GetChildren() do
                        local l_v15_FirstChild_0 = v15:FindFirstChild(v38.Name);
                        if l_v15_FirstChild_0 then
                            local v40 = v38.A0:Clone();
                            v40.Parent = l_v15_FirstChild_0;
                            local v41 = v38.A1:Clone();
                            v41.Parent = l_v15_FirstChild_0;
                            local v42 = v38.Beam:Clone();
                            v42.Parent = l_v15_FirstChild_0;
                            v42.Attachment0 = v40;
                            v42.Attachment1 = v41;
                            l_NumberSequenceTween_0.Tween(v42, 20, 0.6);
                            table.insert(v32, v42);
                            table.insert(v32, v40);
                            table.insert(v32, v41);
                        end;
                    end;
                    task.wait(0.36666666666666664);
                    if v22 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v15, 
                            Name = "Rustle4", 
                            Parent = v15.PrimaryPart
                        });
                        l_TweenService_0:Create(v30, v1, {
                            Volume = 0.05
                        }):Play();
                        return;
                    end;
                end;
            end);
            local function v55() --[[ Line: 156 ]] --[[ Name: Cleanup ]]
                -- upvalues: v22 (ref), v21 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_EmoteHelper_0 (ref), v14 (copy), v26 (copy), l_Occupied_0 (copy), v15 (copy), v0 (ref), v29 (copy), v31 (copy), v32 (copy), l_NumberSequenceTween_0 (ref), l_TweenService_0 (ref), v30 (copy), v1 (ref)
                if v22 then
                    return;
                else
                    v22 = true;
                    for _, v44 in v21 do
                        v44:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_1.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_l_AnimHelper_0_Anim_1:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v14);
                    if v26 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v15:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v15:SetAttribute("CurrentEmote", nil);
                    end;
                    for _, v46 in v29:GetChildren() do
                        v46.Enabled = false;
                    end;
                    for _, v48 in v31 do
                        v48.Enabled = false;
                    end;
                    for _, v50 in v32 do
                        if v50:IsA("Beam") then
                            l_NumberSequenceTween_0.Tween(v50, 10);
                        end;
                    end;
                    l_TweenService_0:Create(v30, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(3, function() --[[ Line: 195 ]]
                        -- upvalues: v30 (ref), v29 (ref), v31 (ref), v32 (ref)
                        if v30.Parent then
                            v30.Parent:Destroy();
                        end;
                        v29:Destroy();
                        for _, v52 in v31 do
                            v52:Destroy();
                        end;
                        for _, v54 in v32 do
                            v54:Destroy();
                        end;
                    end);
                    return;
                end;
            end;
            v15:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v15, 
                Animator = v17
            }).Event:Connect(function() --[[ Line: 220 ]]
                -- upvalues: v55 (copy)
                v55();
            end);
            task.wait(180);
            v55();
            return;
        end;
    end;
end;
return v0;