local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Franky", 
        MainId = 17572156677, 
        Rarity = "Rare"
    }
};
local _ = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v9, v10, v11) --[[ Line: 21 ]] --[[ Name: Lerp ]]
    return v9 + (v10 - v9) * v11;
end;
v0.Use = function(v13) --[[ Line: 23 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy)
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
                FadeIn = 0.3, 
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
            local v27 = nil;
            local v28 = nil;
            task.delay(1.5833333333333333, function() --[[ Line: 67 ]]
                -- upvalues: v21 (ref), v27 (ref), v14 (copy), v28 (ref)
                if v21 then
                    return;
                else
                    v27 = script.Effects.FX1:Clone();
                    v27.Parent = v14.RightLowerArm;
                    v28 = script.Effects.FX2:Clone();
                    v28.Parent = v14.RightLowerArm;
                    task.wait(0.25);
                    if v21 then
                        return;
                    else
                        v27.Ring:Emit(1);
                        v28.Ring:Emit(1);
                        task.wait(1.0833333333333333);
                        if v21 then
                            return;
                        else
                            if v27 and v28 then
                                for _, v30 in v27:GetChildren() do
                                    v30.Enabled = false;
                                end;
                                for _, v32 in v28:GetChildren() do
                                    v32.Enabled = false;
                                end;
                            end;
                            task.delay(1, function() --[[ Line: 95 ]]
                                -- upvalues: v27 (ref), v28 (ref)
                                if v27 then
                                    v27:Destroy();
                                end;
                                if v28 then
                                    v28:Destroy();
                                end;
                            end);
                            return;
                        end;
                    end;
                end;
            end);
            task.delay(0.25, function() --[[ Line: 101 ]]
                -- upvalues: l_EmoteHelper_0 (ref), v14 (copy), v21 (ref)
                l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v14, 
                    Name = "Rustle3", 
                    Parent = v14.PrimaryPart, 
                    Volume = 0.8
                });
                task.wait(0.4166666666666667);
                if v21 then
                    return;
                else
                    for _ = 1, 3 do
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v14, 
                            Name = "FeintRustle", 
                            Parent = v14.PrimaryPart, 
                            Volume = 0.05
                        });
                        task.wait(0.23333333333333334);
                        if v21 then
                            return;
                        end;
                    end;
                    task.wait(0.16666666666666666);
                    if v21 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v14, 
                            Parent = v14.PrimaryPart, 
                            DirectCopy = script.SFX, 
                            Name = "Emote", 
                            ShouldWeld = true
                        });
                        return;
                    end;
                end;
            end);
            local function v40() --[[ Line: 136 ]] --[[ Name: Cleanup ]]
                -- upvalues: v21 (ref), v20 (copy), v27 (ref), v28 (ref), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v13 (copy), v25 (copy), l_Occupied_0 (copy), v14 (copy), v0 (ref)
                if v21 then
                    return;
                else
                    v21 = true;
                    for _, v35 in v20 do
                        v35:Disconnect();
                    end;
                    if v27 and v28 then
                        for _, v37 in v27:GetChildren() do
                            v37.Enabled = false;
                        end;
                        for _, v39 in v28:GetChildren() do
                            v39.Enabled = false;
                        end;
                    end;
                    task.delay(1, function() --[[ Line: 154 ]]
                        -- upvalues: v27 (ref), v28 (ref)
                        if v27 then
                            v27:Destroy();
                        end;
                        if v28 then
                            v28:Destroy();
                        end;
                    end);
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
                    return;
                end;
            end;
            v14:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v14, 
                Animator = v16
            }).Event:Connect(function() --[[ Line: 184 ]]
                -- upvalues: v40 (copy)
                v40();
            end);
            task.wait(3.5833333333333335);
            if v21 then
                return;
            else
                l_l_AnimHelper_0_Anim_0:Stop(0.25);
                task.wait(0.25);
                v40();
                return;
            end;
        end;
    end;
end;
return v0;