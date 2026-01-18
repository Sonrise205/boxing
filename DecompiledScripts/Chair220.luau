local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Motivation Chair", 
        MainId = 15564818855, 
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
local function _(v10, v11, v12) --[[ Line: 22 ]] --[[ Name: Lerp ]]
    return v10 + (v11 - v10) * v12;
end;
v0.Use = function(v14) --[[ Line: 24 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), l_CollectionService_0 (copy), v1 (copy)
    local v15 = v14:IsA("Player") and v14.Character or v14;
    local v16 = v15 and v15:FindFirstChild("Humanoid");
    local v17 = v16 and (v16:FindFirstChild("Animator") or v16);
    if not v17 then
        return;
    else
        local l_FirstChild_0 = workspace.Welds:FindFirstChild(v15.Name);
        local v19 = l_FirstChild_0 and l_FirstChild_0:FindFirstChild("WeldCharacter");
        if not v19 then
            return;
        else
            local v20 = workspace.States[v15.Name];
            local l_CharacterData_0 = v20.CharacterData;
            local l_Occupied_0 = v20.Occupied;
            if not l_EmoteHelper_0.CanContinue({
                CharacterData = l_CharacterData_0, 
                Character = v15, 
                Emote = v0
            }) then
                return;
            else
                local v23 = {};
                local v24 = false;
                local v25 = {
                    Name = "Emote", 
                    FadeIn = 0.25, 
                    Weight = 1, 
                    Speed = 1, 
                    AnimId = v0.Metadata.MainId, 
                    Priority = Enum.AnimationPriority.Action, 
                    Animator = v17, 
                    Looped = true
                };
                local l_Character_0 = l_Players_0.LocalPlayer.Character;
                local l_v15_Attribute_0 = v15:GetAttribute("Owner");
                local v28 = true;
                if v15 ~= l_Character_0 then
                    v28 = l_v15_Attribute_0 and l_v15_Attribute_0 == l_Character_0.Name;
                end;
                if not v28 then
                    v25.Priority = Enum.AnimationPriority.Action;
                end;
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v25);
                l_l_AnimHelper_0_Anim_0:Stop(0.01);
                l_l_AnimHelper_0_Anim_0:Play(v25.FadeIn, v25.Weight, v25.Speed);
                local v30 = l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v15, 
                    Looped = v25.Looped, 
                    Parent = v15.PrimaryPart, 
                    DirectCopy = script.Song, 
                    Name = "Emote", 
                    ShouldWeld = true
                });
                local v31 = CFrame.Angles(0, 3.141592653589793, 0);
                local v32 = v19.PrimaryPart.CFrame * CFrame.new(0, -1.2, 0) * v31;
                local v33 = script.Chair:Clone();
                v33.LocalTransparencyModifier = 1;
                v33.Parent = workspace.Debris;
                v33.CFrame = v32;
                local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                l_WeldConstraint_0.Parent = v33;
                l_WeldConstraint_0.Part0 = v33;
                l_WeldConstraint_0.Part1 = v19.PrimaryPart;
                local _ = v33.Position;
                l_TweenService_0:Create(v33, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    LocalTransparencyModifier = 0
                }):Play();
                task.defer(function() --[[ Line: 99 ]]
                    -- upvalues: v24 (ref), l_TweenService_0 (ref), v33 (copy), v19 (copy), l_WeldConstraint_0 (ref), v15 (copy), l_CharacterData_0 (copy), l_CollectionService_0 (ref)
                    for v36 = 1, 30 do
                        if v24 then
                            return;
                        else
                            local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v36 / 30, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                            v33.Position = v19.PrimaryPart.Position - Vector3.new(0, 1.5 + -0.30000000000000004 * l_l_TweenService_0_Value_0, 0);
                            task.wait();
                        end;
                    end;
                    if v24 then
                        return;
                    else
                        if l_WeldConstraint_0 then
                            l_WeldConstraint_0:Destroy();
                        end;
                        l_WeldConstraint_0 = Instance.new("Weld");
                        l_WeldConstraint_0.Parent = v33;
                        l_WeldConstraint_0.Part0 = v33;
                        l_WeldConstraint_0.Part1 = v15.PrimaryPart;
                        l_WeldConstraint_0.C1 = CFrame.new(0, -1.2, 0) * CFrame.Angles(0, 3.141592653589793, 0);
                        l_WeldConstraint_0.Name = "Reverse";
                        if not l_CharacterData_0.Opponent.Value then
                            l_CollectionService_0:AddTag(l_WeldConstraint_0, "SpectateC0");
                        end;
                        return;
                    end;
                end);
                local function v41() --[[ Line: 124 ]] --[[ Name: Cleanup ]]
                    -- upvalues: v24 (ref), v23 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v14 (copy), l_Occupied_0 (copy), v15 (copy), v0 (ref), l_WeldConstraint_0 (ref), v33 (copy), l_TweenService_0 (ref), v30 (copy), v1 (ref)
                    if v24 then
                        return;
                    else
                        v24 = true;
                        for _, v39 in v23 do
                            v39:Disconnect();
                        end;
                        l_l_AnimHelper_0_Anim_0.Looped = false;
                        l_l_AnimHelper_0_Anim_0:Stop(0.01);
                        l_EmoteHelper_0.DestroyCharacterMuteZone(v14);
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                        if v15:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                            v15:SetAttribute("CurrentEmote", nil);
                        end;
                        l_WeldConstraint_0:Destroy();
                        v33.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 3, math.random(10, 30) * 2.5, math.random(-10, 10) * 3);
                        v33.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                        l_TweenService_0:Create(v30, v1, {
                            Volume = 0
                        }):Play();
                        task.delay(3, function() --[[ Line: 149 ]]
                            -- upvalues: v30 (ref), v33 (ref)
                            v30.Parent:Destroy();
                            if v33 then
                                v33:Destroy();
                            end;
                        end);
                        local _ = l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v15, 
                            Parent = v15.PrimaryPart, 
                            Name = "Fling", 
                            Speed = math.random(0.9, 1.1)
                        });
                        return;
                    end;
                end;
                l_EmoteHelper_0.CreateCharacterMuteZone(v14, 30);
                v15:SetAttribute("CurrentEmote", v0.Metadata.Name);
                l_Occupied_0.SpeedMult.Value = 0.9;
                l_Occupied_0.LerpMult.Value = 0.6;
                l_EmoteHelper_0.AddConnections({
                    CharacterData = l_CharacterData_0, 
                    Character = v15, 
                    Animator = v17
                }).Event:Connect(function() --[[ Line: 174 ]]
                    -- upvalues: v41 (copy)
                    v41();
                end);
                task.wait(180);
                v41();
                return;
            end;
        end;
    end;
end;
return v0;