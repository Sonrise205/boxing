local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Akuma", 
        MainId = 15582703234, 
        StartId = 15582700649, 
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
local function _(v9, v10, v11) --[[ Line: 22 ]] --[[ Name: Lerp ]]
    return v9 + (v10 - v9) * v11;
end;
v0.Use = function(v13) --[[ Line: 24 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_ReplicatedStorage_0 (copy)
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
                AnimId = v0.Metadata.StartId, 
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
            v22.AnimId = v0.Metadata.MainId;
            v22.Looped = true;
            local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v22);
            l_l_AnimHelper_0_Anim_1:Stop(0.01);
            l_l_AnimHelper_0_Anim_1:Play(v22.FadeIn, 0.1, v22.Speed);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v22.FadeIn, v22.Weight, v22.Speed);
            task.delay(0.25, function() --[[ Line: 75 ]]
                -- upvalues: l_EmoteHelper_0 (ref), v14 (copy), v21 (ref), l_l_AnimHelper_0_Anim_1 (copy), v22 (copy)
                local _ = l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v14, 
                    Parent = v14.PrimaryPart, 
                    DirectCopy = script.Song, 
                    Name = "Emote", 
                    ShouldWeld = true
                });
                task.wait(0.8333333333333334);
                if v21 then
                    return;
                else
                    l_l_AnimHelper_0_Anim_1:AdjustWeight(v22.Weight);
                    return;
                end;
            end);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v14, 
                Name = "Rustle3", 
                Parent = v14.PrimaryPart
            });
            local v29 = script.Effects.Main:Clone();
            v29.Parent = require(l_ReplicatedStorage_0:WaitForChild("Modules"):WaitForChild("EffectHelper")).GetWeldCharacter(v14).UpperTorso;
            local function v34() --[[ Line: 100 ]] --[[ Name: Cleanup ]]
                -- upvalues: v21 (ref), v20 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_EmoteHelper_0 (ref), v13 (copy), v25 (copy), l_Occupied_0 (copy), v14 (copy), v0 (ref), v29 (copy)
                if v21 then
                    return;
                else
                    v21 = true;
                    for _, v31 in v20 do
                        v31:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_1.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_l_AnimHelper_0_Anim_1:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v13);
                    if v25 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v14:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v14:SetAttribute("CurrentEmote", nil);
                    end;
                    for _, v33 in v29:GetChildren() do
                        v33.Enabled = false;
                    end;
                    task.delay(3, function() --[[ Line: 128 ]]
                        -- upvalues: v29 (ref)
                        v29:Destroy();
                    end);
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
            }).Event:Connect(function() --[[ Line: 144 ]]
                -- upvalues: v34 (copy)
                v34();
            end);
            task.wait(180);
            v34();
            return;
        end;
    end;
end;
return v0;