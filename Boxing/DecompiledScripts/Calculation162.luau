task.defer(function() --[[ Line: 1 ]]
    if game:GetService("RunService"):IsClient() then
        local l_ContentProvider_0 = game:GetService("ContentProvider");
        local l_Animation_0 = Instance.new("Animation");
        local _ = game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("EffectHelper");
        l_Animation_0.AnimationId = "rbxassetid://" .. 17183599502;
        l_ContentProvider_0:PreloadAsync({
            l_Animation_0
        });
        l_Animation_0:Destroy();
    end;
end);
local v3 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Calculation", 
        MainId = 17182002822, 
        CameraId = 17183599502, 
        Rarity = "Legendary"
    }
};
local v4 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v12, v13, v14) --[[ Line: 37 ]] --[[ Name: Lerp ]]
    return v12 + (v13 - v12) * v14;
end;
v3.Use = function(v16) --[[ Line: 39 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v3 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), v4 (copy), l_ReplicatedStorage_0 (copy)
    local v17 = v16:IsA("Player") and v16.Character or v16;
    local v18 = v17 and v17:FindFirstChild("Humanoid");
    local v19 = v18 and (v18:FindFirstChild("Animator") or v18);
    if not v19 then
        return;
    else
        local l_FirstChild_0 = workspace.Welds:FindFirstChild(v17.Name);
        local v21 = l_FirstChild_0 and l_FirstChild_0:FindFirstChild("WeldCharacter");
        if not v21 then
            return;
        else
            local v22 = workspace.States[v17.Name];
            local l_CharacterData_0 = v22.CharacterData;
            local l_Occupied_0 = v22.Occupied;
            if not l_EmoteHelper_0.CanContinue({
                CharacterData = l_CharacterData_0, 
                Character = v17, 
                Emote = v3
            }) then
                return;
            else
                local v25 = {};
                local v26 = false;
                local v27 = {
                    Name = "Emote", 
                    FadeIn = 0.2, 
                    Weight = 1, 
                    Speed = 1, 
                    AnimId = v3.Metadata.MainId, 
                    Priority = Enum.AnimationPriority.Action, 
                    Animator = v19
                };
                local l_Character_0 = l_Players_0.LocalPlayer.Character;
                local l_v17_Attribute_0 = v17:GetAttribute("Owner");
                local v30 = true;
                if v17 ~= l_Character_0 then
                    v30 = l_v17_Attribute_0 and l_v17_Attribute_0 == l_Character_0.Name;
                end;
                if not v30 then
                    v27.Priority = Enum.AnimationPriority.Action;
                end;
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v27);
                l_l_AnimHelper_0_Anim_0:Stop(0.01);
                l_l_AnimHelper_0_Anim_0:Play(v27.FadeIn, v27.Weight, v27.Speed);
                l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v17, 
                    Name = "Rustle3", 
                    Parent = v17.PrimaryPart, 
                    Volume = 0.4
                });
                task.delay(4.166666666666667, function() --[[ Line: 93 ]]
                    -- upvalues: v26 (ref), l_EmoteHelper_0 (ref), v17 (copy)
                    if v26 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v17, 
                            Name = "Rustle4", 
                            Parent = v17.PrimaryPart, 
                            Volume = 0.4
                        });
                        task.wait(0.5833333333333334);
                        if v26 then
                            return;
                        else
                            l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v17, 
                                Name = "Rustle5", 
                                Parent = v17.PrimaryPart, 
                                Volume = 0.3
                            });
                            return;
                        end;
                    end;
                end);
                local v32 = script.Head:Clone();
                v32.Parent = workspace.Debris;
                local l_Weld_0 = Instance.new("Weld");
                l_Weld_0.Parent = v32;
                l_Weld_0.Part0 = v32;
                l_Weld_0.Part1 = v17.Head;
                local v34 = l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v17, 
                    Parent = v17.PrimaryPart, 
                    DirectCopy = script.Song, 
                    Name = "Emote", 
                    ShouldWeld = true
                });
                v34.TimePosition = 7;
                task.delay(0.3, function() --[[ Line: 130 ]]
                    -- upvalues: v26 (ref), l_TweenService_0 (ref), v32 (copy), l_EmoteHelper_0 (ref), v17 (copy)
                    if v26 then
                        return;
                    else
                        l_TweenService_0:Create(v32.Brain.Highlight, TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FillTransparency = 0.2, 
                            OutlineTransparency = 0
                        }):Play();
                        task.wait(0.3333333333333333);
                        if v26 then
                            return;
                        else
                            v32.Brain.Numbers.Enabled = true;
                            task.wait(2.533333333333333);
                            if v26 then
                                return;
                            else
                                v32.Brain.Numbers.Enabled = false;
                                task.wait(0.5);
                                if v26 then
                                    return;
                                else
                                    l_TweenService_0:Create(v32.Brain.Highlight, TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        FillTransparency = 1, 
                                        OutlineTransparency = 1
                                    }):Play();
                                    task.wait(0.5);
                                    if v26 then
                                        return;
                                    else
                                        l_EmoteHelper_0:PlaySound({
                                            SourceCharacter = v17, 
                                            Name = "Realization", 
                                            Parent = v17.PrimaryPart
                                        });
                                        return;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end);
                local l_CameraSettings_0 = workspace:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_0:WaitForChild("CameraTarget");
                local l_CameraMode_0 = l_CameraSettings_0:WaitForChild("CameraMode");
                local l_CurrentCamera_0 = workspace.CurrentCamera;
                local v39 = nil;
                local v40 = CFrame.new(0, 0, 0);
                local v41 = false;
                local v42 = nil;
                local l_DefaultAtmosphere_0 = game.Lighting.DefaultAtmosphere;
                local v44 = {
                    Density = l_DefaultAtmosphere_0.Density, 
                    Glare = l_DefaultAtmosphere_0.Glare, 
                    Color = l_DefaultAtmosphere_0.Color, 
                    Haze = l_DefaultAtmosphere_0.Haze
                };
                local function v45() --[[ Line: 181 ]] --[[ Name: CleanupLocal ]]
                    -- upvalues: v41 (ref), l_TweenService_0 (ref), v34 (copy), v4 (ref), v30 (copy), l_CameraMode_0 (copy), l_CharacterData_0 (copy), v39 (ref), v42 (ref), l_DefaultAtmosphere_0 (copy), v44 (copy), l_CurrentCamera_0 (copy)
                    if v41 then
                        return;
                    else
                        v41 = true;
                        l_TweenService_0:Create(v34, v4, {
                            Volume = 0
                        }):Play();
                        if v30 and (l_CameraMode_0.Value == "Cutscene" or l_CameraMode_0.Value == "Freecam") then
                            l_CameraMode_0.Value = "";
                            l_CharacterData_0.Cutscene.Value = false;
                            game:GetService("RunService"):UnbindFromRenderStep("EmoteCamera");
                        end;
                        if v39 then
                            v39:Destroy();
                        end;
                        if v42 then
                            v42:Destroy();
                        end;
                        l_TweenService_0:Create(l_DefaultAtmosphere_0, TweenInfo.new(0.6333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v44):Play();
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FieldOfView = 70
                        }):Play();
                        return;
                    end;
                end;
                task.delay(3.5, function() --[[ Line: 200 ]]
                    -- upvalues: v26 (ref), v40 (ref), l_TweenService_0 (ref)
                    if v26 then
                        return;
                    else
                        for v46 = 1, 90 do
                            v40 = CFrame.new(0, 0, 0):Lerp(CFrame.new(0.5, -0.2, 0.5), l_TweenService_0:GetValue(v46 / 90, Enum.EasingStyle.Quad, Enum.EasingDirection.Out));
                            task.wait(0.016666666666666666);
                        end;
                        return;
                    end;
                end);
                task.delay(2.3, function() --[[ Line: 210 ]]
                    -- upvalues: v26 (ref), v32 (copy), l_EmoteHelper_0 (ref), v17 (copy), v45 (copy)
                    if v26 then
                        return;
                    else
                        v32.Brain.Attachment.Zap:Emit(1);
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v17, 
                            Name = "Zap", 
                            Parent = v17.PrimaryPart, 
                            Volume = 0.025, 
                            Speed = 1.1
                        });
                        task.wait(1);
                        if v26 then
                            return;
                        else
                            v32.Brain.Attachment.Zap:Emit(1);
                            l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v17, 
                                Name = "Zap", 
                                Parent = v17.PrimaryPart, 
                                Volume = 0.04, 
                                Speed = 1.2
                            });
                            task.wait(0.16666666666666666);
                            if v26 then
                                return;
                            else
                                v32.Eye.EyeSpark.Enabled = true;
                                v32.Trail.Enabled = true;
                                v32.Eye.Spark:Emit(5);
                                task.wait(1.25);
                                if v26 then
                                    return;
                                else
                                    v32.Eye.EyeSpark.Enabled = false;
                                    task.wait(0.6666666666666666);
                                    if v26 then
                                        return;
                                    else
                                        v45();
                                        v32.Trail.Enabled = false;
                                        return;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end);
                local function v50() --[[ Line: 251 ]] --[[ Name: Cleanup ]]
                    -- upvalues: v26 (ref), v25 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v16 (copy), v30 (copy), l_Occupied_0 (copy), v17 (copy), v3 (ref), v45 (copy), l_Weld_0 (copy), v32 (copy), l_TweenService_0 (ref), v34 (copy), v4 (ref)
                    if v26 then
                        return;
                    else
                        v26 = true;
                        for _, v48 in v25 do
                            v48:Disconnect();
                        end;
                        l_l_AnimHelper_0_Anim_0.Looped = false;
                        l_l_AnimHelper_0_Anim_0:Stop(0.01);
                        l_EmoteHelper_0.DestroyCharacterMuteZone(v16);
                        if v30 then
                            l_Occupied_0.SpeedMult.Value = 0;
                            l_Occupied_0.LerpMult.Value = 0;
                        end;
                        if v17:GetAttribute("CurrentEmote") == v3.Metadata.Name then
                            v17:SetAttribute("CurrentEmote", nil);
                        end;
                        v45();
                        l_Weld_0:Destroy();
                        v32.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 3, math.random(10, 30) * 2.5, math.random(-10, 10) * 3);
                        v32.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                        l_TweenService_0:Create(v34, v4, {
                            Volume = 0
                        }):Play();
                        task.delay(3, function() --[[ Line: 281 ]]
                            -- upvalues: v32 (ref), v34 (ref)
                            if v32 then
                                v32:Destroy();
                            end;
                            if v34.Parent then
                                v34.Parent:Destroy();
                            end;
                        end);
                        local _ = l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v17, 
                            Parent = v17.PrimaryPart, 
                            Name = "Fling", 
                            Speed = math.random(0.9, 1.1)
                        });
                        return;
                    end;
                end;
                local v51 = 1000;
                if l_Occupied_0.LockedOn.Value then
                    v51 = (v17.PrimaryPart.Position - l_Occupied_0.LockedOn.Value.PrimaryPart.Position).Magnitude;
                end;
                if v30 and v51 >= 8 and not l_CharacterData_0.Cutscene.Value then
                    l_CameraMode_0.Value = "Cutscene";
                    l_CharacterData_0.Cutscene.Value = true;
                    local _ = l_CurrentCamera_0.CFrame;
                    local _ = l_CurrentCamera_0.CFrame;
                    v39 = l_ReplicatedStorage_0:WaitForChild("Assets").Camera:Clone();
                    v39.Parent = workspace.Debris;
                    local v54 = v21.PrimaryPart.CFrame * CFrame.new(0, 0, 0);
                    v39:PivotTo(v54);
                    local v55 = {
                        Animator = v39.AnimationController.Animator, 
                        AnimId = v3.Metadata.CameraId
                    };
                    local _ = l_AnimHelper_0:CreateAnim(v55);
                    l_TweenService_0:Create(workspace.CurrentCamera, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        FieldOfView = 35
                    }):Play();
                    game:GetService("RunService"):BindToRenderStep("EmoteCamera", Enum.RenderPriority.Camera.Value, function(_) --[[ Line: 325 ]]
                        -- upvalues: v26 (ref), l_CurrentCamera_0 (copy), v39 (ref), v40 (ref)
                        if v26 then
                            return;
                        else
                            l_CurrentCamera_0.CFrame = v39.Head.CFrame * v40;
                            return;
                        end;
                    end);
                    v42 = Instance.new("ColorCorrectionEffect");
                    v42.Enabled = true;
                    v42.Brightness = 0;
                    v42.Saturation = 0;
                    v42.Contrast = 0;
                    v42.Parent = game.Lighting;
                    task.delay(0.16666666666666666, function() --[[ Line: 337 ]]
                        -- upvalues: v26 (ref), l_TweenService_0 (ref), l_DefaultAtmosphere_0 (copy), v42 (ref), v44 (copy)
                        if v26 then
                            return;
                        else
                            l_TweenService_0:Create(l_DefaultAtmosphere_0, TweenInfo.new(0.6333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Density = 0.5, 
                                Glare = 0, 
                                Haze = 5, 
                                Color = Color3.fromRGB(0, 0, 0)
                            }):Play();
                            task.wait(0.2);
                            if v26 then
                                return;
                            else
                                l_TweenService_0:Create(v42, TweenInfo.new(0.18333333333333332, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    Brightness = 0.5
                                }):Play();
                                task.wait(0.18333333333333332);
                                if v26 then
                                    return;
                                else
                                    l_TweenService_0:Create(v42, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        Saturation = -0.4, 
                                        Brightness = 0.3, 
                                        Contrast = 1.5
                                    }):Play();
                                    task.wait(2.816666666666667);
                                    if v26 then
                                        return;
                                    else
                                        l_TweenService_0:Create(v42, TweenInfo.new(0.55, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            Saturation = 0, 
                                            Brightness = 0, 
                                            Contrast = 0
                                        }):Play();
                                        l_TweenService_0:Create(l_DefaultAtmosphere_0, TweenInfo.new(0.6333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v44):Play();
                                        return;
                                    end;
                                end;
                            end;
                        end;
                    end);
                end;
                v17:SetAttribute("CurrentEmote", v3.Metadata.Name);
                l_Occupied_0.SpeedMult.Value = 1;
                l_Occupied_0.LerpMult.Value = 1;
                l_EmoteHelper_0.AddConnections({
                    CharacterData = l_CharacterData_0, 
                    Character = v17, 
                    Animator = v19
                }).Event:Connect(function() --[[ Line: 385 ]]
                    -- upvalues: v50 (copy)
                    v50();
                end);
                task.wait(6.333333333333333);
                if v26 then
                    return;
                else
                    l_l_AnimHelper_0_Anim_0:Stop(0.5);
                    v50();
                    return;
                end;
            end;
        end;
    end;
end;
return v3;