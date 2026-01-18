local v0 = {};
game.Players.PlayerRemoving:Connect(function(v1) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    v0[v1] = nil;
end);
local v2 = Random.new();
local v3 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Gun-Trick-Sword", 
        MainId = 17590323912, 
        RoyalGuardId = 17590295633, 
        GunslingerId = 17590304548, 
        TricksterId = 17590309573, 
        SwordmasterId = 17590300029, 
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
local function _(v12, v13, v14) --[[ Line: 35 ]] --[[ Name: Lerp ]]
    return v12 + (v13 - v12) * v14;
end;
Aura = function(v16, v17) --[[ Line: 37 ]] --[[ Name: Aura ]]
    -- upvalues: l_EmoteHelper_0 (copy), v2 (copy)
    local v18 = v16:IsA("Player") and v16.Character or v16;
    local v19 = {};
    local v20 = script.Effect.Attachment:Clone();
    v20.Parent = v18.PrimaryPart;
    for _, v22 in v20:GetChildren() do
        v22.Color = ColorSequence.new(v17);
        v22:Emit(v22.Rate);
    end;
    for _, v24 in v18:GetChildren() do
        if v24:IsA("BasePart") and v24.Name ~= "HumanoidRootPart" then
            for _, v26 in script.Aura:GetChildren() do
                local v27 = v26:Clone();
                v27.Enabled = false;
                v27.Parent = v24;
                v27.Color = ColorSequence.new(v17);
                v27:Emit(v27.Rate);
                table.insert(v19, v27);
            end;
        end;
    end;
    l_EmoteHelper_0:PlaySound({
        SourceCharacter = v18, 
        Parent = v18.PrimaryPart, 
        DirectCopy = script.SFX, 
        Name = "Emote", 
        ShouldWeld = true, 
        Speed = v2:NextNumber(1.9, 2.15)
    });
    l_EmoteHelper_0:PlaySound({
        SourceCharacter = v18, 
        Parent = v18.PrimaryPart, 
        DirectCopy = script.SFX2, 
        Name = "Emote", 
        ShouldWeld = true
    });
    task.delay(5, function() --[[ Line: 82 ]]
        -- upvalues: v19 (copy), v20 (copy)
        for _, v29 in v19 do
            v29:Destroy();
        end;
        v20:Destroy();
    end);
end;
Swordmaster = function(v30) --[[ Line: 91 ]] --[[ Name: Swordmaster ]]
    -- upvalues: l_EmoteHelper_0 (copy), v3 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy)
    local v31 = v30:IsA("Player") and v30.Character or v30;
    local v32 = v31 and v31:FindFirstChild("Humanoid");
    local v33 = v32 and (v32:FindFirstChild("Animator") or v32);
    if not v33 then
        return;
    else
        local v34 = workspace.States[v31.Name];
        local l_CharacterData_0 = v34.CharacterData;
        local l_Occupied_0 = v34.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v31, 
            Emote = v3
        }) then
            return;
        else
            local v37 = {};
            local v38 = false;
            local v39 = {
                Name = "Emote", 
                FadeIn = 0.1, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v3.Metadata.SwordmasterId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v33
            };
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v31_Attribute_0 = v31:GetAttribute("Owner");
            local v42 = true;
            if v31 ~= l_Character_0 then
                v42 = l_v31_Attribute_0 and l_v31_Attribute_0 == l_Character_0.Name;
            end;
            if not v42 then
                v39.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v39);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v39.FadeIn, v39.Weight, v39.Speed);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v31, 
                Name = "Rustle1", 
                Parent = v31.PrimaryPart, 
                Volume = 0.2
            });
            Aura(v30, Color3.fromRGB(214, 21, 24));
            local function v46() --[[ Line: 143 ]] --[[ Name: Cleanup ]]
                -- upvalues: v38 (ref), v37 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v30 (copy), v42 (copy), l_Occupied_0 (copy), v31 (copy), v3 (ref)
                if v38 then
                    return;
                else
                    v38 = true;
                    for _, v45 in v37 do
                        v45:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v30);
                    if v42 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v31:GetAttribute("CurrentEmote") == v3.Metadata.Name then
                        v31:SetAttribute("CurrentEmote", nil);
                    end;
                    return;
                end;
            end;
            v31:SetAttribute("CurrentEmote", v3.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v31, 
                Animator = v33
            }).Event:Connect(function() --[[ Line: 176 ]]
                -- upvalues: v46 (copy)
                v46();
            end);
            task.wait(1.6666666666666667);
            if v38 then
                return;
            else
                l_l_AnimHelper_0_Anim_0:Stop(0.5);
                task.wait(0.5);
                v46();
                return;
            end;
        end;
    end;
end;
Trickster = function(v47) --[[ Line: 188 ]] --[[ Name: Trickster ]]
    -- upvalues: l_EmoteHelper_0 (copy), v3 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy)
    local v48 = v47:IsA("Player") and v47.Character or v47;
    local v49 = v48 and v48:FindFirstChild("Humanoid");
    local v50 = v49 and (v49:FindFirstChild("Animator") or v49);
    if not v50 then
        return;
    else
        local v51 = workspace.States[v48.Name];
        local l_CharacterData_1 = v51.CharacterData;
        local l_Occupied_1 = v51.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_1, 
            Character = v48, 
            Emote = v3
        }) then
            return;
        else
            local v54 = {};
            local v55 = false;
            local v56 = {
                Name = "Emote", 
                FadeIn = 0.1, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v3.Metadata.TricksterId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v50
            };
            local l_Character_1 = l_Players_0.LocalPlayer.Character;
            local l_v48_Attribute_0 = v48:GetAttribute("Owner");
            local v59 = true;
            if v48 ~= l_Character_1 then
                v59 = l_v48_Attribute_0 and l_v48_Attribute_0 == l_Character_1.Name;
            end;
            if not v59 then
                v56.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v56);
            l_l_AnimHelper_0_Anim_1:Stop(0.01);
            l_l_AnimHelper_0_Anim_1:Play(v56.FadeIn, v56.Weight, v56.Speed);
            Aura(v47, Color3.fromRGB(255, 245, 98));
            task.delay(0.08333333333333333, function() --[[ Line: 234 ]]
                -- upvalues: v55 (ref), l_EmoteHelper_0 (ref), v48 (copy)
                if v55 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v48, 
                        Name = "Rustle4", 
                        Parent = v48.PrimaryPart, 
                        Volume = 1
                    });
                    return;
                end;
            end);
            local function v63() --[[ Line: 244 ]] --[[ Name: Cleanup ]]
                -- upvalues: v55 (ref), v54 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_EmoteHelper_0 (ref), v47 (copy), v59 (copy), l_Occupied_1 (copy), v48 (copy), v3 (ref)
                if v55 then
                    return;
                else
                    v55 = true;
                    for _, v62 in v54 do
                        v62:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_1.Looped = false;
                    l_l_AnimHelper_0_Anim_1:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v47);
                    if v59 then
                        l_Occupied_1.SpeedMult.Value = 0;
                        l_Occupied_1.LerpMult.Value = 0;
                    end;
                    if v48:GetAttribute("CurrentEmote") == v3.Metadata.Name then
                        v48:SetAttribute("CurrentEmote", nil);
                    end;
                    return;
                end;
            end;
            v48:SetAttribute("CurrentEmote", v3.Metadata.Name);
            l_Occupied_1.SpeedMult.Value = 1;
            l_Occupied_1.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_1, 
                Character = v48, 
                Animator = v50
            }).Event:Connect(function() --[[ Line: 277 ]]
                -- upvalues: v63 (copy)
                v63();
            end);
            task.wait(1.6666666666666667);
            if v55 then
                return;
            else
                l_l_AnimHelper_0_Anim_1:Stop(0.5);
                task.wait(0.5);
                v63();
                return;
            end;
        end;
    end;
end;
Gunslinger = function(v64) --[[ Line: 289 ]] --[[ Name: Gunslinger ]]
    -- upvalues: l_EmoteHelper_0 (copy), v3 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy)
    local v65 = v64:IsA("Player") and v64.Character or v64;
    local v66 = v65 and v65:FindFirstChild("Humanoid");
    local v67 = v66 and (v66:FindFirstChild("Animator") or v66);
    if not v67 then
        return;
    else
        local v68 = workspace.States[v65.Name];
        local l_CharacterData_2 = v68.CharacterData;
        local l_Occupied_2 = v68.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_2, 
            Character = v65, 
            Emote = v3
        }) then
            return;
        else
            local v71 = {};
            local v72 = false;
            local v73 = {
                Name = "Emote", 
                FadeIn = 0.1, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v3.Metadata.GunslingerId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v67
            };
            local l_Character_2 = l_Players_0.LocalPlayer.Character;
            local l_v65_Attribute_0 = v65:GetAttribute("Owner");
            local v76 = true;
            if v65 ~= l_Character_2 then
                v76 = l_v65_Attribute_0 and l_v65_Attribute_0 == l_Character_2.Name;
            end;
            if not v76 then
                v73.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v73);
            l_l_AnimHelper_0_Anim_2:Stop(0.01);
            l_l_AnimHelper_0_Anim_2:Play(v73.FadeIn, v73.Weight, v73.Speed);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v65, 
                Name = "Rustle5", 
                Parent = v65.PrimaryPart, 
                Volume = 1
            });
            Aura(v64, Color3.fromRGB(88, 37, 255));
            local function v80() --[[ Line: 341 ]] --[[ Name: Cleanup ]]
                -- upvalues: v72 (ref), v71 (copy), l_l_AnimHelper_0_Anim_2 (copy), l_EmoteHelper_0 (ref), v64 (copy), v76 (copy), l_Occupied_2 (copy), v65 (copy), v3 (ref)
                if v72 then
                    return;
                else
                    v72 = true;
                    for _, v79 in v71 do
                        v79:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_2.Looped = false;
                    l_l_AnimHelper_0_Anim_2:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v64);
                    if v76 then
                        l_Occupied_2.SpeedMult.Value = 0;
                        l_Occupied_2.LerpMult.Value = 0;
                    end;
                    if v65:GetAttribute("CurrentEmote") == v3.Metadata.Name then
                        v65:SetAttribute("CurrentEmote", nil);
                    end;
                    return;
                end;
            end;
            v65:SetAttribute("CurrentEmote", v3.Metadata.Name);
            l_Occupied_2.SpeedMult.Value = 1;
            l_Occupied_2.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_2, 
                Character = v65, 
                Animator = v67
            }).Event:Connect(function() --[[ Line: 374 ]]
                -- upvalues: v80 (copy)
                v80();
            end);
            task.wait(1.6666666666666667);
            if v72 then
                return;
            else
                l_l_AnimHelper_0_Anim_2:Stop(0.5);
                task.wait(0.5);
                v80();
                return;
            end;
        end;
    end;
end;
RoyalGuard = function(v81) --[[ Line: 386 ]] --[[ Name: RoyalGuard ]]
    -- upvalues: l_EmoteHelper_0 (copy), v3 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy)
    local v82 = v81:IsA("Player") and v81.Character or v81;
    local v83 = v82 and v82:FindFirstChild("Humanoid");
    local v84 = v83 and (v83:FindFirstChild("Animator") or v83);
    if not v84 then
        return;
    else
        local v85 = workspace.States[v82.Name];
        local l_CharacterData_3 = v85.CharacterData;
        local l_Occupied_3 = v85.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_3, 
            Character = v82, 
            Emote = v3
        }) then
            return;
        else
            local v88 = {};
            local v89 = false;
            local v90 = {
                Name = "Emote", 
                FadeIn = 0.1, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v3.Metadata.RoyalGuardId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v84
            };
            local l_Character_3 = l_Players_0.LocalPlayer.Character;
            local l_v82_Attribute_0 = v82:GetAttribute("Owner");
            local v93 = true;
            if v82 ~= l_Character_3 then
                v93 = l_v82_Attribute_0 and l_v82_Attribute_0 == l_Character_3.Name;
            end;
            if not v93 then
                v90.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_3 = l_AnimHelper_0:CreateAnim(v90);
            l_l_AnimHelper_0_Anim_3:Stop(0.01);
            l_l_AnimHelper_0_Anim_3:Play(v90.FadeIn, v90.Weight, v90.Speed);
            task.delay(0.21666666666666667, function() --[[ Line: 429 ]]
                -- upvalues: v89 (ref), l_EmoteHelper_0 (ref), v82 (copy)
                if v89 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v82, 
                        Name = "Rustle3", 
                        Parent = v82.PrimaryPart, 
                        Volume = 1
                    });
                    return;
                end;
            end);
            Aura(v81, Color3.fromRGB(57, 229, 255));
            local function v97() --[[ Line: 441 ]] --[[ Name: Cleanup ]]
                -- upvalues: v89 (ref), v88 (copy), l_l_AnimHelper_0_Anim_3 (copy), l_EmoteHelper_0 (ref), v81 (copy), v93 (copy), l_Occupied_3 (copy), v82 (copy), v3 (ref)
                if v89 then
                    return;
                else
                    v89 = true;
                    for _, v96 in v88 do
                        v96:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_3.Looped = false;
                    l_l_AnimHelper_0_Anim_3:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v81);
                    if v93 then
                        l_Occupied_3.SpeedMult.Value = 0;
                        l_Occupied_3.LerpMult.Value = 0;
                    end;
                    if v82:GetAttribute("CurrentEmote") == v3.Metadata.Name then
                        v82:SetAttribute("CurrentEmote", nil);
                    end;
                    return;
                end;
            end;
            v82:SetAttribute("CurrentEmote", v3.Metadata.Name);
            l_Occupied_3.SpeedMult.Value = 1;
            l_Occupied_3.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_3, 
                Character = v82, 
                Animator = v84
            }).Event:Connect(function() --[[ Line: 474 ]]
                -- upvalues: v97 (copy)
                v97();
            end);
            task.wait(2.5833333333333335);
            if v89 then
                return;
            else
                l_l_AnimHelper_0_Anim_3:Stop(0.5);
                task.wait(0.5);
                v97();
                return;
            end;
        end;
    end;
end;
v3.Use = function(v98) --[[ Line: 486 ]] --[[ Name: Use ]]
    -- upvalues: v0 (copy)
    if not v0[v98] then
        v0[v98] = 1;
        if v98.Name == "Father Bringus" then
            v0[v98] = 3;
        end;
        if v98.Name == "AndreBerto" then
            v0[v98] = 2;
        end;
    end;
    local v99 = v0[v98] % 4;
    task.spawn(function() --[[ Line: 501 ]]
        -- upvalues: v99 (copy), v98 (copy), v0 (ref)
        if v99 == 1 then
            v98:SetAttribute("LastDante", "RoyalGuard");
            RoyalGuard(v98);
            return;
        elseif v99 == 2 then
            v98:SetAttribute("LastDante", "Gunslinger");
            Gunslinger(v98);
            return;
        elseif v99 == 3 then
            v98:SetAttribute("LastDante", "Trickster");
            Trickster(v98);
            return;
        else
            v98:SetAttribute("LastDante", "Swordmaster");
            v0[v98] = 0;
            Swordmaster(v98);
            return;
        end;
    end);
    task.wait(0.05);
    local l_v0_0 = v0;
    l_v0_0[v98] = l_v0_0[v98] + 1;
end;
return v3;