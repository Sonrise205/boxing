local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Seahorse", 
        VisualId = 15850154564, 
        MainId = 15850178624, 
        SeahorseId = 15850643062, 
        Rarity = "Mythic"
    }
};
local v1 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v10, v11, v12) --[[ Line: 26 ]] --[[ Name: Lerp ]]
    return v10 + (v11 - v10) * v12;
end;
v0.Use = function(v14) --[[ Line: 28 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Modules_0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_CollectionService_0 (copy), l_TweenService_0 (copy), v1 (copy)
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
                Looped = true, 
                Name = "Emote", 
                FadeIn = 0.3333333333333333, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.VisualId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v17
            };
            local _ = require(l_Modules_0:WaitForChild("EffectHelper"));
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v15_Attribute_0 = v15:GetAttribute("Owner");
            local v27 = true;
            if v15 ~= l_Character_0 then
                v27 = l_v15_Attribute_0 and l_v15_Attribute_0 == l_Character_0.Name;
            end;
            if not v27 then
                v23.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v23);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v23.FadeIn, v23.Weight, v23.Speed);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Name = "Rustle5", 
                Parent = v15.PrimaryPart
            });
            local v29 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v15, 
                Looped = v23.Looped, 
                Parent = v15.PrimaryPart, 
                DirectCopy = script.Song, 
                Name = "Emote", 
                ShouldWeld = true
            });
            local v30 = script.Seahorse:Clone();
            v30.Parent = workspace.Debris;
            v30.PrimaryPart.CFrame = v15.PrimaryPart.CFrame;
            local l_Weld_0 = Instance.new("Weld");
            l_Weld_0.Parent = v30;
            l_Weld_0.Part0 = v30.RootPart;
            l_Weld_0.Part1 = v15.PrimaryPart;
            l_Weld_0.C0 = CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0) * CFrame.new(0, 3, 0);
            local v32 = {
                Looped = true, 
                Name = "Emote", 
                FadeIn = 0.2, 
                Weight = 1, 
                Speed = v23.Speed, 
                AnimId = v0.Metadata.SeahorseId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v30.AnimationController.Animator
            };
            local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v32);
            task.defer(function() --[[ Line: 113 ]]
                -- upvalues: v22 (ref), l_Weld_0 (copy), v30 (copy), l_CharacterData_0 (copy), l_CollectionService_0 (ref)
                for v34 = 1, 10 do
                    if v22 then
                        return;
                    else
                        l_Weld_0.C0 = CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0) * CFrame.new(0, 5 + -2 * (v34 / 10), 0);
                        for _, v36 in v30:GetChildren() do
                            if v36:IsA("BasePart") then
                                v36.LocalTransparencyModifier = 1 + -1 * (v34 / 10);
                            end;
                        end;
                        task.wait();
                    end;
                end;
                if v22 then
                    return;
                else
                    l_Weld_0.Name = "Reverse";
                    if not l_CharacterData_0.Opponent.Value then
                        l_CollectionService_0:AddTag(l_Weld_0, "SpectateC0");
                    end;
                    return;
                end;
            end);
            l_l_AnimHelper_0_Anim_1.TimePosition = 0;
            l_l_AnimHelper_0_Anim_0.TimePosition = 0;
            task.delay(0.5, function() --[[ Line: 138 ]]
                -- upvalues: l_l_AnimHelper_0_Anim_1 (copy), l_l_AnimHelper_0_Anim_0 (copy)
                l_l_AnimHelper_0_Anim_1.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
                l_l_AnimHelper_0_Anim_0.TimePosition = l_l_AnimHelper_0_Anim_1.TimePosition;
            end);
            local function v40() --[[ Line: 143 ]] --[[ Name: Cleanup ]]
                -- upvalues: v22 (ref), v21 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_EmoteHelper_0 (ref), v14 (copy), v27 (copy), l_Occupied_0 (copy), v15 (copy), v0 (ref), l_Weld_0 (copy), v30 (copy), l_TweenService_0 (ref), v29 (copy), v1 (ref)
                if v22 then
                    return;
                else
                    v22 = true;
                    for _, v38 in v21 do
                        v38:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_l_AnimHelper_0_Anim_1.Looped = false;
                    l_l_AnimHelper_0_Anim_1:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v14);
                    if v27 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v15:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v15:SetAttribute("CurrentEmote", nil);
                    end;
                    if l_Weld_0 then
                        l_Weld_0:Destroy();
                    end;
                    v30.RootPart.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 3, math.random(10, 30) * 2.5, math.random(-10, 10) * 3);
                    v30.RootPart.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                    local _ = l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v15, 
                        Parent = v15.PrimaryPart, 
                        Name = "Fling", 
                        Speed = math.random(0.9, 1.1)
                    });
                    task.delay(5, function() --[[ Line: 180 ]]
                        -- upvalues: v30 (ref)
                        if v30 then
                            v30:Destroy();
                        end;
                    end);
                    l_TweenService_0:Create(v29, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(2, function() --[[ Line: 185 ]]
                        -- upvalues: v29 (ref)
                        v29.Parent:Destroy();
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
            }).Event:Connect(function() --[[ Line: 202 ]]
                -- upvalues: v40 (copy)
                v40();
            end);
            task.wait(180);
            v40();
            return;
        end;
    end;
end;
return v0;