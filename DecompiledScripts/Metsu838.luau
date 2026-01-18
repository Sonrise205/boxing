local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Metsu", 
        MainId = 18983160436, 
        Rarity = "Mythic"
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
            local v27 = {};
            local v28 = script.Effects.StepEffect:Clone();
            v28.Parent = v14.RightFoot;
            local v29 = script.Effects.Kanji:Clone();
            v29.Parent = v14.PrimaryPart;
            task.delay(0.5666666666666667, function() --[[ Line: 74 ]]
                -- upvalues: v21 (ref), l_EmoteHelper_0 (ref), v14 (copy), v29 (copy)
                if v21 then
                    return;
                else
                    task.wait(1.2666666666666666);
                    if v21 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v14, 
                            Parent = v14.PrimaryPart, 
                            DirectCopy = script.KanjiSFX, 
                            Name = "Emote", 
                            ShouldWeld = true
                        });
                        v29.Intro:Emit(1);
                        task.wait(0.31666666666666665);
                        if v21 then
                            return;
                        else
                            print(v21);
                            v29.Loop:Emit(1);
                            task.wait(1.9333333333333333);
                            if v21 then
                                return;
                            else
                                v29.Ember:Emit(1);
                                return;
                            end;
                        end;
                    end;
                end;
            end);
            task.delay(0.5, function() --[[ Line: 100 ]]
                -- upvalues: v21 (ref), l_EmoteHelper_0 (ref), v14 (copy), v28 (copy)
                if v21 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v14, 
                        Parent = v14.PrimaryPart, 
                        DirectCopy = script.RockSFX, 
                        Name = "Emote", 
                        ShouldWeld = true
                    });
                    task.defer(function() --[[ Line: 111 ]]
                        -- upvalues: v28 (ref), v21 (ref)
                        for _ = 1, 5 do
                            v28.Flame:Emit(3);
                            if v21 then
                                return;
                            else
                                task.wait(0.08333333333333333);
                            end;
                        end;
                    end);
                    for _ = 1, 5 do
                        v28.Ember:Emit(5);
                        if v21 then
                            return;
                        else
                            task.wait(0.08333333333333333);
                        end;
                    end;
                    return;
                end;
            end);
            task.delay(0.26666666666666666, function() --[[ Line: 128 ]]
                -- upvalues: v21 (ref), l_EmoteHelper_0 (ref), v14 (copy), v28 (copy)
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
                    task.wait(0.26666666666666666);
                    if v21 then
                        return;
                    else
                        v28.Impact:Emit(1);
                        v28.Crack:Emit(1);
                        v28.Wind:Emit(10);
                        v28.Pebble:Emit(15);
                        return;
                    end;
                end;
            end);
            task.delay(0.5, function() --[[ Line: 148 ]]
                -- upvalues: v21 (ref), v14 (copy), v27 (copy)
                if v21 then
                    return;
                else
                    for _, v33 in script.AuraRig:GetChildren() do
                        for _, v35 in v33:GetChildren() do
                            local l_v14_FirstChild_0 = v14:FindFirstChild(v33.Name);
                            if l_v14_FirstChild_0 then
                                local v37 = v35:Clone();
                                v37.Parent = l_v14_FirstChild_0;
                                table.insert(v27, v37);
                            end;
                        end;
                    end;
                    task.wait(2.5);
                    if v21 then
                        return;
                    else
                        for _, v39 in v27 do
                            v39.Enabled = false;
                        end;
                        task.wait(1.5);
                        if v21 then
                            return;
                        else
                            for _, v41 in v27 do
                                if v41:IsA("ParticleEmitter") then
                                    v41.Enabled = false;
                                else
                                    for _, v43 in v41:GetChildren() do
                                        v43.Enabled = false;
                                    end;
                                end;
                            end;
                            task.delay(5, function() --[[ Line: 183 ]]
                                -- upvalues: v27 (ref)
                                for _, v45 in v27 do
                                    v45:Destroy();
                                end;
                            end);
                            return;
                        end;
                    end;
                end;
            end);
            task.delay(0.25, function() --[[ Line: 190 ]]
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
                    return;
                end;
            end);
            local function v54() --[[ Line: 202 ]] --[[ Name: Cleanup ]]
                -- upvalues: v21 (ref), v20 (copy), v27 (copy), v28 (copy), v29 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v13 (copy), v25 (copy), l_Occupied_0 (copy), v14 (copy), v0 (ref)
                if v21 then
                    return;
                else
                    v21 = true;
                    for _, v47 in v20 do
                        v47:Disconnect();
                    end;
                    for _, v49 in v27 do
                        if v49:IsA("ParticleEmitter") then
                            v49.Enabled = false;
                        else
                            for _, v51 in v49:GetChildren() do
                                v51.Enabled = false;
                            end;
                        end;
                    end;
                    task.delay(5, function() --[[ Line: 220 ]]
                        -- upvalues: v27 (ref), v28 (ref), v29 (ref)
                        for _, v53 in v27 do
                            v53:Destroy();
                        end;
                        if v28 then
                            v28:Destroy();
                        end;
                        if v29 then
                            v29:Destroy();
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
            }).Event:Connect(function() --[[ Line: 254 ]]
                -- upvalues: v54 (copy)
                v54();
            end);
            task.wait(4.333333333333333);
            if v21 then
                return;
            else
                l_l_AnimHelper_0_Anim_0:Stop(0.6666666666666666);
                task.wait(0.3333333333333333);
                v54();
                return;
            end;
        end;
    end;
end;
return v0;