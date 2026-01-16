local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Concentration", 
        MainId = 17578890648, 
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
            local v27 = {};
            local l_v13_Attribute_0 = v13:GetAttribute("LastDante");
            local v29 = {
                RoyalGuard = Color3.fromRGB(57, 229, 255), 
                Gunslinger = Color3.fromRGB(88, 37, 255), 
                Trickster = Color3.fromRGB(255, 245, 98), 
                Swordmaster = Color3.fromRGB(214, 21, 24)
            };
            task.delay(0.25, function() --[[ Line: 76 ]]
                -- upvalues: v21 (ref), v14 (copy), l_v13_Attribute_0 (copy), v29 (copy), v27 (copy), l_EmoteHelper_0 (ref)
                if v21 then
                    return;
                else
                    for _, v31 in v14:GetChildren() do
                        if v31:IsA("BasePart") and v31.Name ~= "HumanoidRootPart" then
                            for _, v33 in script.Aura:GetChildren() do
                                local v34 = v33:Clone();
                                v34.Parent = v31;
                                if l_v13_Attribute_0 then
                                    v34.Color = ColorSequence.new(v29[l_v13_Attribute_0]);
                                end;
                                table.insert(v27, v34);
                            end;
                        end;
                    end;
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v14, 
                        Parent = v14.PrimaryPart, 
                        DirectCopy = script.SFX, 
                        Name = "Emote", 
                        ShouldWeld = true
                    });
                    task.wait(1);
                    if v21 then
                        return;
                    else
                        for _, v36 in v27 do
                            if v36.Name == "Aura" then
                                v36.Enabled = false;
                            end;
                        end;
                        task.wait(1.5);
                        if v21 then
                            return;
                        else
                            for _, v38 in v27 do
                                v38.Enabled = false;
                            end;
                            task.delay(5, function() --[[ Line: 117 ]]
                                -- upvalues: v27 (ref)
                                for _, v40 in v27 do
                                    v40:Destroy();
                                end;
                            end);
                            return;
                        end;
                    end;
                end;
            end);
            task.delay(0.25, function() --[[ Line: 124 ]]
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
            local function v47() --[[ Line: 136 ]] --[[ Name: Cleanup ]]
                -- upvalues: v21 (ref), v20 (copy), v27 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v13 (copy), v25 (copy), l_Occupied_0 (copy), v14 (copy), v0 (ref)
                if v21 then
                    return;
                else
                    v21 = true;
                    for _, v42 in v20 do
                        v42:Disconnect();
                    end;
                    for _, v44 in v27 do
                        v44.Enabled = false;
                    end;
                    task.delay(5, function() --[[ Line: 148 ]]
                        -- upvalues: v27 (ref)
                        for _, v46 in v27 do
                            v46:Destroy();
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
            }).Event:Connect(function() --[[ Line: 179 ]]
                -- upvalues: v47 (copy)
                v47();
            end);
            task.wait(3);
            if v21 then
                return;
            else
                l_l_AnimHelper_0_Anim_0:Stop(0.6666666666666666);
                task.wait(0.6666666666666666);
                v47();
                return;
            end;
        end;
    end;
end;
return v0;