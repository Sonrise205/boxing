local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Muscle", 
        MainId = 17191975650, 
        Rarity = "Rare"
    }
};
local v1 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v11, v12, v13) --[[ Line: 23 ]] --[[ Name: Lerp ]]
    return v11 + (v12 - v11) * v13;
end;
v0.Use = function(v15) --[[ Line: 25 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_CollectionService_0 (copy), l_TweenService_0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_RunService_0 (copy), v1 (copy)
    local v16 = v15:IsA("Player") and v15.Character or v15;
    local v17 = v16 and v16:FindFirstChild("Humanoid");
    local v18 = v17 and (v17:FindFirstChild("Animator") or v17);
    if not v18 then
        return;
    else
        local v19 = workspace.States[v16.Name];
        local l_CharacterData_0 = v19.CharacterData;
        local l_Occupied_0 = v19.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v16, 
            Emote = v0
        }) then
            return;
        else
            local v22 = {};
            local v23 = false;
            local v24 = script.BarbellModel:Clone();
            v24.Name = "Barbell";
            v24.Parent = v16.PrimaryPart;
            local v25 = script.Barbell:Clone();
            v25.Parent = v16.PrimaryPart;
            v25.Part0 = v16.PrimaryPart;
            v25.Part1 = v24;
            if not l_CharacterData_0.Opponent.Value then
                l_CollectionService_0:AddTag(v25, "SpectateC0");
            end;
            v24.Transparency = 1;
            task.delay(0.16666666666666666, function() --[[ Line: 60 ]]
                -- upvalues: v23 (ref), v24 (copy), l_TweenService_0 (ref)
                if v23 then
                    return;
                else
                    v24.LocalTransparencyModifier = 1;
                    v24.Transparency = 0;
                    l_TweenService_0:Create(v24, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        LocalTransparencyModifier = 0
                    }):Play();
                    return;
                end;
            end);
            local v26 = {
                Name = "Emote", 
                FadeIn = 0.25, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v18, 
                Looped = true
            };
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v16_Attribute_0 = v16:GetAttribute("Owner");
            local v29 = true;
            if v16 ~= l_Character_0 then
                v29 = l_v16_Attribute_0 and l_v16_Attribute_0 == l_Character_0.Name;
            end;
            if not v29 then
                v26.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v26);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v26.FadeIn, v26.Weight, v26.Speed);
            local v31 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v16, 
                Looped = v26.Looped, 
                Parent = v16.PrimaryPart, 
                DirectCopy = script.Swipes, 
                Name = "Emote", 
                ShouldWeld = true
            });
            local v32 = 1;
            local v33 = script.Dust.Attachment:Clone();
            local v34 = script.Dust.Attachment:Clone();
            v33.Parent = v16.LeftFoot;
            v34.Parent = v16.RightFoot;
            v22[1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Step"):Connect(function() --[[ Line: 111 ]]
                -- upvalues: v32 (ref), v33 (copy), v34 (copy)
                v32 = v32 + 1;
                if v32 % 3 == 0 then
                    v33.Particle:Emit(1);
                    v32 = 1;
                    return;
                else
                    v34.Particle:Emit(1);
                    return;
                end;
            end);
            local function v38() --[[ Line: 123 ]] --[[ Name: Cleanup ]]
                -- upvalues: v23 (ref), v22 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v15 (copy), l_Occupied_0 (copy), v16 (copy), v0 (ref), v29 (copy), l_RunService_0 (ref), v25 (copy), v24 (copy), l_TweenService_0 (ref), v31 (copy), v1 (ref), v34 (copy), v33 (copy)
                if v23 then
                    return;
                else
                    v23 = true;
                    for _, v36 in v22 do
                        v36:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v15);
                    l_Occupied_0.SpeedMult.Value = 0;
                    l_Occupied_0.LerpMult.Value = 0;
                    if v16:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v16:SetAttribute("CurrentEmote", nil);
                    end;
                    if v29 then
                        l_Occupied_0.ForceMove.Value = false;
                        l_RunService_0:UnbindFromRenderStep("ForceMove");
                    end;
                    v25:Destroy();
                    v24.Parent = workspace.Debris;
                    v24.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 1, math.random(10, 30) * 1.8, math.random(-10, 10) * 1);
                    v24.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20) * 0.3, math.random(-20, 20) * 0.3, math.random(-20, 20) * 0.3);
                    l_TweenService_0:Create(v31, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(3, function() --[[ Line: 154 ]]
                        -- upvalues: v31 (ref), v24 (ref), v34 (ref), v33 (ref)
                        v31.Parent:Destroy();
                        if v24 then
                            v24:Destroy();
                        end;
                        if v34 then
                            v34:Destroy();
                        end;
                        if v33 then
                            v33:Destroy();
                        end;
                    end);
                    if v24 and v24.Transparency < 0.5 then
                        local _ = l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v16, 
                            Parent = v16.PrimaryPart, 
                            Name = "Fling", 
                            Speed = math.random(0.9, 1.1)
                        });
                    end;
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v15, 30);
            v16:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 0.85;
            l_Occupied_0.LerpMult.Value = 0.95;
            task.delay(0.25, function() --[[ Line: 177 ]]
                -- upvalues: v23 (ref), l_Occupied_0 (copy)
                if v23 then
                    return;
                else
                    l_Occupied_0.ForceMove.Value = true;
                    return;
                end;
            end);
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v16, 
                Animator = v18
            }).Event:Connect(function() --[[ Line: 188 ]]
                -- upvalues: v38 (copy)
                v38();
            end);
            if v29 then
                l_RunService_0:BindToRenderStep("ForceMove", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 193 ]]
                    -- upvalues: v23 (ref), l_CharacterData_0 (copy), v17 (copy), l_Occupied_0 (copy), v16 (copy)
                    if v23 then
                        return;
                    elseif l_CharacterData_0.Cutscene.Value then
                        return;
                    else
                        v17.WalkSpeed = 12;
                        local l_v17_0 = v17;
                        l_v17_0.WalkSpeed = l_v17_0.WalkSpeed * (1 + -1 * l_Occupied_0.SpeedMult.Value);
                        l_v17_0 = v16.PrimaryPart.CFrame.LookVector;
                        v17:Move(l_v17_0, false);
                        local l_Value_0 = l_Occupied_0.LockedOn.Value;
                        if not l_Value_0 then
                            return;
                        elseif (v16.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude > 2.5 then
                            return;
                        else
                            v17:Move(l_v17_0 / 3, false);
                            return;
                        end;
                    end;
                end);
            end;
            task.wait(180);
            if v23 then
                return;
            else
                v38();
                return;
            end;
        end;
    end;
end;
return v0;