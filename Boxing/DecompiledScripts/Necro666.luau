local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Necro", 
        MainId = 17579498248, 
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
        if not (l_FirstChild_0 and l_FirstChild_0:FindFirstChild("WeldCharacter")) then
            return;
        else
            local v19 = workspace.States[v15.Name];
            local l_CharacterData_0 = v19.CharacterData;
            local l_Occupied_0 = v19.Occupied;
            if not l_EmoteHelper_0.CanContinue({
                CharacterData = l_CharacterData_0, 
                Character = v15, 
                Emote = v0
            }) then
                return;
            else
                local v22 = {};
                local v23 = false;
                local v24 = {
                    Name = "Emote", 
                    FadeIn = 0.2, 
                    Weight = 1, 
                    Speed = 1, 
                    AnimId = v0.Metadata.MainId, 
                    Priority = Enum.AnimationPriority.Action, 
                    Animator = v17, 
                    Looped = true
                };
                local l_Character_0 = l_Players_0.LocalPlayer.Character;
                local l_v15_Attribute_0 = v15:GetAttribute("Owner");
                local v27 = true;
                if v15 ~= l_Character_0 then
                    v27 = l_v15_Attribute_0 and l_v15_Attribute_0 == l_Character_0.Name;
                end;
                if not v27 then
                    v24.Priority = Enum.AnimationPriority.Action;
                end;
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v24);
                l_l_AnimHelper_0_Anim_0:Stop(0.01);
                l_l_AnimHelper_0_Anim_0:Play(v24.FadeIn, v24.Weight, v24.Speed);
                local v29 = l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v15, 
                    Looped = v24.Looped, 
                    Parent = v15.PrimaryPart, 
                    DirectCopy = script.Song, 
                    Name = "Emote", 
                    ShouldWeld = true, 
                    PartName = v0.Metadata.Name
                });
                local l_Volume_0 = v29.Volume;
                v29.Volume = 0;
                l_TweenService_0:Create(v29, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Volume = l_Volume_0
                }):Play();
                local l_Main_0 = script.Main;
                local _ = script.Particles;
                local v33 = l_Main_0.Model:Clone();
                local v34 = l_Main_0.Bump:Clone();
                local v35 = l_Main_0.Inner:Clone();
                v33.Parent = v15.PrimaryPart;
                v34.Parent = v15.PrimaryPart;
                v35.Parent = v15.PrimaryPart;
                v35.Part0 = v15.PrimaryPart;
                v35.Part1 = v33.Inner;
                v33.Inner.Bump.Part0 = v33.Inner;
                v33.Inner.Bump.Part1 = v34;
                v33.Inner.Outer.Part0 = v33.Inner;
                v33.Inner.Outer.Part1 = v33.Outer;
                task.delay(0.016666666666666666, function() --[[ Line: 107 ]]
                    -- upvalues: v23 (ref), v35 (copy), v33 (copy), l_CharacterData_0 (copy), l_CollectionService_0 (ref)
                    if v23 then
                        return;
                    else
                        v35.C0 = CFrame.new(0, 0.068, 0);
                        v33.Inner.Bump.C0 = CFrame.new(0, -0.068, 0);
                        v33.Inner.Outer.C0 = CFrame.new(0, 0.008, 0);
                        v35.C1 = CFrame.new();
                        v33.Inner.Bump.C1 = CFrame.new();
                        v33.Inner.Outer.C1 = CFrame.new();
                        if not l_CharacterData_0.Opponent.Value then
                            l_CollectionService_0:AddTag(v35, "SpectateC0");
                            l_CollectionService_0:AddTag(v33.Inner.Bump, "SpectateC0");
                            l_CollectionService_0:AddTag(v33.Inner.Outer, "SpectateC0");
                        end;
                        return;
                    end;
                end);
                local v36 = script.Particles.Attachment:Clone();
                local v37 = script.Particles.HeartFX:Clone();
                v36.Parent = v15.PrimaryPart;
                v37.Parent = v15.PrimaryPart;
                task.defer(function() --[[ Line: 131 ]]
                    -- upvalues: v23 (ref), v37 (copy), v36 (copy)
                    while true do
                        if not v23 then
                            task.wait(2.4000000000000004);
                            if v23 then
                                return;
                            else
                                for _, v39 in v37:GetChildren() do
                                    v39.Color = ColorSequence.new(Color3.fromRGB(98, 255, 55));
                                    v39.Enabled = true;
                                end;
                                task.wait(3.033333333333333);
                                if v23 then
                                    return;
                                else
                                    for _, v41 in v37:GetChildren() do
                                        v41.Enabled = false;
                                    end;
                                    task.wait(3.4833333333333334);
                                    if v23 then
                                        return;
                                    else
                                        for _, v43 in v37:GetChildren() do
                                            v43.Color = ColorSequence.new(Color3.fromRGB(215, 53, 53));
                                            v43.Enabled = true;
                                        end;
                                        task.wait(3.0166666666666666);
                                        if v23 then
                                            return;
                                        else
                                            for _, v45 in v37:GetChildren() do
                                                v45.Enabled = false;
                                            end;
                                            task.wait(0.25);
                                            if v23 then
                                                return;
                                            else
                                                v36.Triangles:Emit(20);
                                                v36.Hole.Enabled = true;
                                                v36.Shape.Enabled = true;
                                                task.wait(0.4);
                                                if v23 then
                                                    return;
                                                else
                                                    v36.Hole.Enabled = false;
                                                    v36.Shape.Enabled = false;
                                                    task.wait(3.0999999999999996);
                                                    if v23 then
                                                        return;
                                                    else
                                                        for _, v47 in v37:GetChildren() do
                                                            v47.Color = ColorSequence.new(Color3.fromRGB(98, 255, 55));
                                                            v47.Enabled = true;
                                                        end;
                                                        task.wait(2.5);
                                                        if v23 then
                                                            return;
                                                        else
                                                            for _, v49 in v37:GetChildren() do
                                                                v49.Enabled = false;
                                                            end;
                                                            task.wait(8.4);
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        else
                            return;
                        end;
                    end;
                end);
                local l_Size_0 = v33.Inner.Size;
                local l_Size_1 = v33.Outer.Size;
                task.defer(function() --[[ Line: 199 ]]
                    -- upvalues: v23 (ref), v33 (copy), l_Size_0 (copy), l_Size_1 (copy), l_TweenService_0 (ref), v34 (copy)
                    while true do
                        if not v23 then
                            v33.Inner.Size = l_Size_0 * 1.35;
                            v33.Outer.Size = l_Size_1 * 1.35;
                            local v52 = TweenInfo.new(0.08333333333333333, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                            local v53 = TweenInfo.new(0.08333333333333333, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut);
                            local v54 = TweenInfo.new(0.16666666666666666, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut);
                            local _ = TweenInfo.new(0.06666666666666667, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                            l_TweenService_0:Create(v33.Inner, v54, {
                                Size = l_Size_0
                            }):Play();
                            l_TweenService_0:Create(v33.Outer, v54, {
                                Size = l_Size_1
                            }):Play();
                            v34.Size = Vector3.new(4.765999794006348, 3.9690001010894775, 0.06800000369548798, 0);
                            l_TweenService_0:Create(v34, v53, {
                                Size = Vector3.new(1.722000002861023, 1.434000015258789, 0.02500000037252903, 0)
                            }):Play();
                            if v23 then
                                return;
                            else
                                task.wait(0.16666666666666666);
                                for v56 = 1, 51 do
                                    if v23 then
                                        return;
                                    elseif v56 == 55 then
                                        task.wait(0.9166666666666666);
                                    else
                                        task.wait(0.1);
                                        if v23 then
                                            return;
                                        else
                                            l_TweenService_0:Create(v33.Inner, v54, {
                                                Size = l_Size_0 * 1.35
                                            }):Play();
                                            l_TweenService_0:Create(v33.Outer, v54, {
                                                Size = l_Size_1 * 1.35
                                            }):Play();
                                            l_TweenService_0:Create(v34, v52, {
                                                Size = Vector3.new(4.765999794006348, 3.9690001010894775, 0.06800000369548798, 0)
                                            }):Play();
                                            task.wait(0.06666666666666667);
                                            if v23 then
                                                return;
                                            else
                                                l_TweenService_0:Create(v33.Inner, v54, {
                                                    Size = l_Size_0
                                                }):Play();
                                                l_TweenService_0:Create(v33.Outer, v54, {
                                                    Size = l_Size_1
                                                }):Play();
                                                l_TweenService_0:Create(v34, v53, {
                                                    Size = Vector3.new(1.722000002861023, 1.434000015258789, 0.02500000037252903, 0)
                                                }):Play();
                                                task.wait(0.16666666666666666);
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        else
                            return;
                        end;
                    end;
                end);
                local l_CurrentCamera_0 = workspace.CurrentCamera;
                local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
                v22[1] = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 247 ]]
                    -- upvalues: v23 (ref), l_CharacterData_0 (copy), v15 (copy), l_CurrentCamera_0 (copy), v29 (copy), v27 (copy), l_FieldOfView_0 (copy)
                    if v23 then
                        return;
                    elseif l_CharacterData_0.Cutscene.Value then
                        return;
                    else
                        local v59 = 25;
                        local l_Magnitude_0 = (v15.PrimaryPart.Position - l_CurrentCamera_0.CFrame.Position).Magnitude;
                        local v61 = ((v29.PlaybackLoudness - 250) / 210) ^ 2 / 2.5;
                        if v27 then
                            v59 = 50;
                        else
                            v61 = v61 / 2;
                        end;
                        if workspace.Settings.ReduceCameraShake.Value then
                            v61 = v61 / 3;
                        end;
                        if v59 < l_Magnitude_0 then
                            return;
                        else
                            local l_l_CurrentCamera_0_0 = l_CurrentCamera_0;
                            local l_l_FieldOfView_0_0 = l_FieldOfView_0;
                            local l_v61_0 = v61;
                            local v65 = math.clamp(l_Magnitude_0 / v59, 0, 1);
                            l_l_CurrentCamera_0_0.FieldOfView = l_l_FieldOfView_0_0 - (l_v61_0 + (0 - l_v61_0) * v65);
                            return;
                        end;
                    end;
                end);
                local function v73() --[[ Line: 272 ]] --[[ Name: Cleanup ]]
                    -- upvalues: v23 (ref), v22 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v14 (copy), v35 (copy), v34 (copy), v33 (copy), v29 (copy), l_TweenService_0 (ref), v1 (ref), v37 (copy), v36 (copy), v15 (copy), v27 (copy), l_Occupied_0 (copy), v0 (ref)
                    if v23 then
                        return;
                    else
                        v23 = true;
                        for _, v67 in v22 do
                            v67:Disconnect();
                        end;
                        l_l_AnimHelper_0_Anim_0.Looped = false;
                        l_l_AnimHelper_0_Anim_0:Stop(0.01);
                        l_EmoteHelper_0.DestroyCharacterMuteZone(v14);
                        if v35 then
                            v35:Destroy();
                        end;
                        if v34 then
                            v34:Destroy();
                        end;
                        v33.Inner.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 3, math.random(10, 30) * 2.5, math.random(-10, 10) * 3);
                        v33.Inner.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                        if v29 then
                            l_TweenService_0:Create(v29, v1, {
                                Volume = 0
                            }):Play();
                        end;
                        for _, v69 in v37:GetChildren() do
                            v69.Enabled = false;
                        end;
                        for _, v71 in v36:GetChildren() do
                            v71.Enabled = false;
                        end;
                        task.delay(3, function() --[[ Line: 302 ]]
                            -- upvalues: v36 (ref), v37 (ref), v29 (ref), v33 (ref)
                            if v36 then
                                v36:Destroy();
                            end;
                            if v37 then
                                v37:Destroy();
                            end;
                            if v29 then
                                v29.Parent:Destroy();
                            end;
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
                        if v27 then
                            l_Occupied_0.SpeedMult.Value = 0;
                            l_Occupied_0.LerpMult.Value = 0;
                        end;
                        if v15:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                            v15:SetAttribute("CurrentEmote", nil);
                        end;
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
                }).Event:Connect(function() --[[ Line: 338 ]]
                    -- upvalues: v73 (copy)
                    v73();
                end);
                task.wait(180);
                if v23 then
                    return;
                else
                    v73();
                    return;
                end;
            end;
        end;
    end;
end;
return v0;