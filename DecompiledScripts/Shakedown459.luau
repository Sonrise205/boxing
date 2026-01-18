local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Shakedown", 
        MainId = 16300075476, 
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
v0.Use = function(v9) --[[ Line: 22 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Modules_0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), v1 (copy)
    local v10 = v9:IsA("Player") and v9.Character or v9;
    local v11 = v10 and v10:FindFirstChild("Humanoid");
    local v12 = v11 and (v11:FindFirstChild("Animator") or v11);
    if not v12 then
        return;
    else
        local v13 = workspace.States[v10.Name];
        local l_CharacterData_0 = v13.CharacterData;
        local l_Occupied_0 = v13.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v10, 
            Emote = v0
        }) then
            return;
        else
            local v16 = {};
            local v17 = false;
            local v18 = {
                Looped = true, 
                Name = "Emote", 
                FadeIn = 0.03333333333333333, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v12
            };
            local _ = require(l_Modules_0:WaitForChild("EffectHelper"));
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v10_Attribute_0 = v10:GetAttribute("Owner");
            local v22 = true;
            if v10 ~= l_Character_0 then
                v22 = l_v10_Attribute_0 and l_v10_Attribute_0 == l_Character_0.Name;
            end;
            if not v22 then
                v18.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v18);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v18.FadeIn, v18.Weight, v18.Speed);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v10, 
                Name = "Rustle3", 
                Parent = v10.PrimaryPart
            });
            local v24 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v10, 
                Looped = v18.Looped, 
                Parent = v10.PrimaryPart, 
                DirectCopy = script.Song, 
                Name = "Emote", 
                ShouldWeld = true
            });
            local function v27() --[[ Line: 86 ]] --[[ Name: Cleanup ]]
                -- upvalues: v17 (ref), v16 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v9 (copy), v22 (copy), l_Occupied_0 (copy), v10 (copy), v0 (ref), l_TweenService_0 (ref), v24 (copy), v1 (ref)
                if v17 then
                    return;
                else
                    v17 = true;
                    for _, v26 in v16 do
                        v26:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v9);
                    if v22 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v10:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v10:SetAttribute("CurrentEmote", nil);
                    end;
                    l_TweenService_0:Create(v24, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(2, function() --[[ Line: 109 ]]
                        -- upvalues: v24 (ref)
                        v24.Parent:Destroy();
                    end);
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v9, 30);
            v10:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v10, 
                Animator = v12
            }).Event:Connect(function() --[[ Line: 126 ]]
                -- upvalues: v27 (copy)
                v27();
            end);
            task.wait(180);
            v27();
            return;
        end;
    end;
end;
return v0;