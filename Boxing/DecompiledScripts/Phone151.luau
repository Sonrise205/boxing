task.defer(function() --[[ Line: 1 ]]
    if game:GetService("RunService"):IsClient() then
        local l_ContentProvider_0 = game:GetService("ContentProvider");
        local l_Animation_0 = Instance.new("Animation");
        local _ = game.ReplicatedStorage:WaitForChild("Modules"):WaitForChild("EffectHelper");
        l_Animation_0.AnimationId = "rbxassetid://" .. 15864157061;
        l_ContentProvider_0:PreloadAsync({
            l_Animation_0
        });
        l_Animation_0.AnimationId = "rbxassetid://" .. 15864271539;
        l_ContentProvider_0:PreloadAsync({
            l_Animation_0
        });
        l_Animation_0:Destroy();
    end;
end);
local v3 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Phone Summon", 
        MainId = 15851579084, 
        CameraId = 15864157061, 
        FOVId = 15864271539, 
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
local function _(v12, v13, v14) --[[ Line: 42 ]] --[[ Name: Lerp ]]
    return v12 + (v13 - v12) * v14;
end;
v3.Use = function(v16) --[[ Line: 44 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v3 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy)
    local v17 = v16:IsA("Player") and v16.Character or v16;
    local v18 = v17 and v17:FindFirstChild("Humanoid");
    local v19 = v18 and (v18:FindFirstChild("Animator") or v18);
    if not v19 then
        return;
    else
        local v20 = workspace.States[v17.Name];
        local l_CharacterData_0 = v20.CharacterData;
        local l_Occupied_0 = v20.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v17, 
            Emote = v3
        }) then
            return;
        else
            local v23 = {};
            local v24 = false;
            local v25 = {
                Name = "Emote", 
                FadeIn = 0.3, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v3.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v19
            };
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v17_Attribute_0 = v17:GetAttribute("Owner");
            local v28 = true;
            if v17 ~= l_Character_0 then
                v28 = l_v17_Attribute_0 and l_v17_Attribute_0 == l_Character_0.Name;
            end;
            if not v28 then
                v25.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v25);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v25.FadeIn, v25.Weight, v25.Speed);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v17, 
                Name = "Rustle2", 
                Parent = v17.PrimaryPart
            });
            local v30 = nil;
            task.delay(0.23333333333333334, function() --[[ Line: 95 ]]
                -- upvalues: v24 (ref), v30 (ref), l_EmoteHelper_0 (ref), v17 (copy), v25 (copy)
                if v24 then
                    return;
                else
                    v30 = l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v17, 
                        Looped = v25.Looped, 
                        Parent = v17.PrimaryPart, 
                        DirectCopy = script.SFX, 
                        Name = "Emote", 
                        ShouldWeld = true
                    });
                    return;
                end;
            end);
            local v31 = script.Phone:Clone();
            v31.Parent = workspace.Debris;
            v31.Weld.Part0 = v17.RightHand;
            local v32 = {};
            for _, v34 in script.LeftHand:GetChildren() do
                local v35 = v34:Clone();
                v35.Parent = v17.LeftHand;
                table.insert(v32, v35);
            end;
            v17.LeftHand.Trail.Attachment0 = v17.LeftHand.A0;
            v17.LeftHand.Trail.Attachment1 = v17.LeftHand.A1;
            local l_Spark_0 = v31.Phone_typeBlinn1.Attachment.Spark;
            local l_Spark2_0 = v31.Phone_PhoneGlass.PhoneTap.Spark2;
            local l_Spark3_0 = v31.Phone_PhoneGlass.PhoneTap.Spark3;
            local l_TapLight_0 = v31.Phone_PhoneGlass.TapLight.TapLight;
            local l_FSpark_0 = v17.LeftHand.A0.FSpark;
            local l_Glow_0 = v17.LeftHand.A0.Glow;
            local l_Glory_0 = v17.LeftHand.A0.Glory;
            local l_PointLight_0 = v17.LeftHand.A0.PointLight;
            local l_Spark5_0 = v31.Phone_PhoneGlass.Spark5;
            local l_Spark6_0 = v31.Phone_PhoneGlass.Spark6;
            local l_Spark7_0 = v31.Phone_PhoneGlass.Spark7;
            local l_Spark8_0 = v31.Phone_PhoneGlass.Spark8;
            local l_Glow_1 = v31.Phone_PhoneGlass.PhoneGlow.Glow;
            local l_ThunderSmoke_0 = v31.Phone_PhoneGlass.PhoneLightning.ThunderSmoke;
            local l_ThunderStriked_0 = v31.Phone_PhoneGlass.PhoneLightning.ThunderStriked;
            local l_Spark4_0 = v31.Phone_PhoneGlass.PhoneSmash.Spark4;
            local l_Smoke_0 = v31.Phone_PhoneGlass.PhoneSmash.Smoke;
            local l_Ring1_0 = v31.Phone_PhoneGlass.PhoneSmash.Ring1;
            local l_Ring2_0 = v31.Phone_PhoneGlass.PhoneSmash.Ring2;
            local l_Ring3_0 = v31.Phone_PhoneGlass.PhoneSmash.Ring3;
            task.delay(0.3333333333333333, function() --[[ Line: 145 ]]
                -- upvalues: v24 (ref), l_Spark_0 (copy), l_TapLight_0 (copy), l_TweenService_0 (ref)
                if v24 then
                    return;
                else
                    l_Spark_0:Emit(1);
                    task.wait(0.16666666666666666);
                    if v24 then
                        return;
                    else
                        l_TapLight_0.Enabled = true;
                        local v56 = true;
                        local function v58(v57) --[[ Line: 155 ]] --[[ Name: TweenLight ]]
                            -- upvalues: v24 (ref), v56 (ref), l_TweenService_0 (ref), l_TapLight_0 (ref)
                            if v24 then
                                return;
                            else
                                if v56 then
                                    l_TweenService_0:Create(l_TapLight_0, TweenInfo.new(v57, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        Brightness = 5, 
                                        Range = 2
                                    }):Play();
                                else
                                    l_TweenService_0:Create(l_TapLight_0, TweenInfo.new(v57, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                                        Brightness = 0, 
                                        Range = 0
                                    }):Play();
                                end;
                                v56 = not v56;
                                task.wait(v57);
                                return;
                            end;
                        end;
                        v58(0.16666666666666666);
                        v58(0.16666666666666666);
                        v58(0.16666666666666666);
                        v58(0.11666666666666667);
                        v58(0.16666666666666666);
                        v58(0.1);
                        v58(0.13333333333333333);
                        v58(0.1);
                        v58(0.08333333333333333);
                        v58(0.1);
                        v58(0.11666666666666667);
                        v58(0.06666666666666667);
                        v58(0.05);
                        v58(0.05);
                        v58(0.06666666666666667);
                        v58(0.06666666666666667);
                        v58(0.05);
                        v58(0.06666666666666667);
                        v58(0.03333333333333333);
                        v58(0.03333333333333333);
                        v58(0.05);
                        v58(0.06666666666666667);
                        v58(0.15);
                        l_TweenService_0:Create(l_TapLight_0, TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                            Brightness = 0, 
                            Range = 0
                        }):Play();
                        task.wait(3.533333333333333);
                        if v24 then
                            return;
                        else
                            l_TweenService_0:Create(l_TapLight_0, TweenInfo.new(0.5833333333333334, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Brightness = 5, 
                                Range = 2
                            }):Play();
                            task.wait(0.5833333333333334);
                            if v24 then
                                return;
                            else
                                l_TweenService_0:Create(l_TapLight_0, TweenInfo.new(0.9, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    Brightness = 0, 
                                    Range = 0
                                }):Play();
                                task.wait(0.9);
                                if v24 then
                                    return;
                                else
                                    l_TweenService_0:Create(l_TapLight_0, TweenInfo.new(0.9, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                        Brightness = 6, 
                                        Range = 5
                                    }):Play();
                                    task.wait(0.9);
                                    if v24 then
                                        return;
                                    else
                                        l_TweenService_0:Create(l_TapLight_0, TweenInfo.new(0.9, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                            Brightness = 9, 
                                            Range = 10
                                        }):Play();
                                        task.wait(1);
                                        if v24 then
                                            return;
                                        else
                                            l_TweenService_0:Create(l_TapLight_0, TweenInfo.new(0.6666666666666666, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                                                Brightness = 0, 
                                                Range = 0
                                            }):Play();
                                            return;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end);
            task.delay(0.6666666666666666, function() --[[ Line: 215 ]]
                -- upvalues: v24 (ref), l_Spark2_0 (copy), l_Spark3_0 (copy)
                if v24 then
                    return;
                else
                    local function _() --[[ Line: 218 ]] --[[ Name: Emit ]]
                        -- upvalues: l_Spark2_0 (ref), l_Spark3_0 (ref)
                        l_Spark2_0:Emit(8);
                        l_Spark3_0:Emit(8);
                    end;
                    l_Spark2_0:Emit(8);
                    l_Spark3_0:Emit(8);
                    l_Spark2_0.EmissionDirection = "Right";
                    l_Spark3_0.EmissionDirection = "Right";
                    task.wait(0.2833333333333333);
                    if v24 then
                        return;
                    else
                        l_Spark2_0:Emit(8);
                        l_Spark3_0:Emit(8);
                        l_Spark2_0.EmissionDirection = "Left";
                        l_Spark3_0.EmissionDirection = "Left";
                        task.wait(0.25);
                        if v24 then
                            return;
                        else
                            l_Spark2_0:Emit(8);
                            l_Spark3_0:Emit(8);
                            l_Spark2_0.EmissionDirection = "Right";
                            l_Spark3_0.EmissionDirection = "Right";
                            task.wait(0.21666666666666667);
                            if v24 then
                                return;
                            else
                                l_Spark2_0:Emit(8);
                                l_Spark3_0:Emit(8);
                                l_Spark2_0.EmissionDirection = "Back";
                                l_Spark3_0.EmissionDirection = "Back";
                                task.wait(0.2);
                                if v24 then
                                    return;
                                else
                                    l_Spark2_0:Emit(8);
                                    l_Spark3_0:Emit(8);
                                    l_Spark2_0.EmissionDirection = "Left";
                                    l_Spark3_0.EmissionDirection = "Left";
                                    task.wait(0.18333333333333332);
                                    if v24 then
                                        return;
                                    else
                                        l_Spark2_0:Emit(8);
                                        l_Spark3_0:Emit(8);
                                        l_Spark2_0.EmissionDirection = "Right";
                                        l_Spark3_0.EmissionDirection = "Right";
                                        task.wait(0.13333333333333333);
                                        if v24 then
                                            return;
                                        else
                                            l_Spark2_0:Emit(8);
                                            l_Spark3_0:Emit(8);
                                            l_Spark2_0.EmissionDirection = "Back";
                                            l_Spark3_0.EmissionDirection = "Back";
                                            task.wait(0.11666666666666667);
                                            if v24 then
                                                return;
                                            else
                                                l_Spark2_0:Emit(8);
                                                l_Spark3_0:Emit(8);
                                                l_Spark2_0.EmissionDirection = "Top";
                                                l_Spark3_0.EmissionDirection = "Top";
                                                task.wait(0.06666666666666667);
                                                if v24 then
                                                    return;
                                                else
                                                    l_Spark2_0:Emit(8);
                                                    l_Spark3_0:Emit(8);
                                                    l_Spark2_0.EmissionDirection = "Back";
                                                    l_Spark3_0.EmissionDirection = "Back";
                                                    task.wait(0.11666666666666667);
                                                    if v24 then
                                                        return;
                                                    else
                                                        l_Spark2_0:Emit(8);
                                                        l_Spark3_0:Emit(8);
                                                        l_Spark2_0.EmissionDirection = "Top";
                                                        l_Spark3_0.EmissionDirection = "Top";
                                                        return;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end);
            task.delay(4.766666666666667, function() --[[ Line: 291 ]]
                -- upvalues: v24 (ref), v28 (copy), l_ReplicatedStorage_0 (ref)
                if v24 then
                    return;
                else
                    if v28 then
                        local v60 = require(l_ReplicatedStorage_0.Modules.EffectHelper);
                        local v61 = {
                            Preset = "LightHit", 
                            FoV = 67, 
                            WaitTime = 0.6, 
                            FadeIn = 0.3
                        };
                        task.defer(function() --[[ Line: 304 ]]
                            -- upvalues: v60 (copy), v61 (copy)
                            v60.CameraShake(v61);
                        end);
                    end;
                    return;
                end;
            end);
            task.delay(3.033333333333333, function() --[[ Line: 310 ]]
                -- upvalues: v24 (ref), l_FSpark_0 (copy), l_Glow_0 (copy), l_Glory_0 (copy), v31 (copy), v28 (copy), l_ReplicatedStorage_0 (ref)
                if v24 then
                    return;
                else
                    l_FSpark_0.Enabled = true;
                    l_Glow_0.Enabled = true;
                    l_Glory_0.Enabled = true;
                    v31.Phone_PhoneGlass.Dial:Destroy();
                    v31.Phone_PhoneGlass.SurfaceGui.Enabled = true;
                    task.wait(2.933333333333333);
                    if v24 then
                        return;
                    else
                        l_FSpark_0.Enabled = false;
                        l_Glow_0.Enabled = false;
                        l_Glory_0.Enabled = false;
                        v31.Phone_PhoneGlass.SurfaceGui.Frame.Start:Destroy();
                        if v28 then
                            local v62 = require(l_ReplicatedStorage_0.Modules.EffectHelper);
                            local v63 = {
                                Preset = "MedHit", 
                                FoV = 67, 
                                WaitTime = 0.3
                            };
                            task.defer(function() --[[ Line: 336 ]]
                                -- upvalues: v62 (copy), v63 (copy)
                                v62.CameraShake(v63);
                            end);
                        end;
                        return;
                    end;
                end;
            end);
            task.delay(4, function() --[[ Line: 342 ]]
                -- upvalues: v24 (ref), l_PointLight_0 (copy), l_TweenService_0 (ref)
                if v24 then
                    return;
                else
                    l_PointLight_0.Enabled = true;
                    l_TweenService_0:Create(l_PointLight_0, TweenInfo.new(1.4, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                        Brightness = 6, 
                        Range = 5
                    }):Play();
                    task.wait(2.1);
                    if v24 then
                        return;
                    else
                        l_TweenService_0:Create(l_PointLight_0, TweenInfo.new(1.3333333333333333, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                            Brightness = 0, 
                            Range = 0
                        }):Play();
                        return;
                    end;
                end;
            end);
            task.delay(6.033333333333333, function() --[[ Line: 355 ]]
                -- upvalues: v24 (ref), l_Spark4_0 (copy), l_Ring1_0 (copy), l_Ring2_0 (copy), l_Ring3_0 (copy), l_Smoke_0 (copy), l_Glow_1 (copy), l_Spark5_0 (copy), l_Spark6_0 (copy)
                if v24 then
                    return;
                else
                    l_Spark4_0:Emit(20);
                    l_Ring1_0:Emit(2);
                    l_Ring2_0:Emit(2);
                    l_Ring3_0:Emit(2);
                    l_Smoke_0:Emit(20);
                    task.wait(0.1);
                    if v24 then
                        return;
                    else
                        l_Glow_1.Enabled = true;
                        task.wait(1.7666666666666666);
                        if v24 then
                            return;
                        else
                            l_Spark5_0.Enabled = true;
                            l_Spark6_0.Enabled = true;
                            task.wait(1);
                            if v24 then
                                return;
                            else
                                l_Spark5_0.Enabled = false;
                                l_Spark6_0.Enabled = false;
                                l_Glow_1.Enabled = false;
                                return;
                            end;
                        end;
                    end;
                end;
            end);
            task.delay(7.883333333333334, function() --[[ Line: 381 ]]
                -- upvalues: v24 (ref), l_Spark7_0 (copy), l_Spark8_0 (copy), v17 (copy), l_ThunderSmoke_0 (copy), l_ThunderStriked_0 (copy), v28 (copy), l_ReplicatedStorage_0 (ref), l_Occupied_0 (copy), l_CharacterData_0 (copy), l_EmoteHelper_0 (ref)
                if v24 then
                    return;
                else
                    l_Spark7_0:Emit(50);
                    l_Spark8_0:Emit(50);
                    task.wait(0.9166666666666666);
                    if v24 then
                        return;
                    else
                        local v64 = script.RootPart.Lightning:Clone();
                        v64.Parent = v17.PrimaryPart;
                        v64.Lightning.Enabled = true;
                        for _, v66 in v64.End:GetChildren() do
                            v66.Enabled = true;
                        end;
                        task.wait(0.11666666666666667);
                        if v24 then
                            return;
                        else
                            l_ThunderSmoke_0:Emit(20);
                            l_ThunderStriked_0:Emit(1);
                            local v67 = nil;
                            if (v17.PrimaryPart.Position - workspace.CurrentCamera.CFrame.Position).Magnitude < 30 or v28 then
                                v67 = require(l_ReplicatedStorage_0.Modules.EffectHelper);
                                local v68 = {
                                    Preset = "SuperHardHit", 
                                    FoV = 66, 
                                    WaitTime = v28 and 0.55 or 0.1
                                };
                                local l_v68_0 = v68 --[[ copy: 3 -> 13 ]];
                                task.defer(function() --[[ Line: 415 ]]
                                    -- upvalues: v67 (ref), l_v68_0 (copy)
                                    v67.CameraShake(l_v68_0);
                                end);
                            end;
                            if v28 and not l_Occupied_0.Equipped.Value then
                                task.defer(function() --[[ Line: 421 ]]
                                    -- upvalues: v67 (ref)
                                    v67.CreateImpactFrame({
                                        Time = 0.06
                                    });
                                end);
                            end;
                            task.wait(0.8333333333333334);
                            if v24 then
                                return;
                            else
                                v64.Lightning.Enabled = false;
                                for _, v71 in v64.End:GetChildren() do
                                    v71.Enabled = false;
                                end;
                                local v72 = script.Effects:Clone();
                                v72.Parent = workspace.Debris;
                                local l_Friends_0 = v72.Friends;
                                local l_l_Friends_0_Children_0 = l_Friends_0:GetChildren();
                                l_l_Friends_0_Children_0[math.random(1, #l_l_Friends_0_Children_0)]:Emit(1);
                                local v75 = script.Effects.Summon:Clone();
                                v75.Parent = l_Friends_0;
                                for _, v77 in v75:GetChildren() do
                                    v77:Emit(v77:GetAttribute("EmitCount"));
                                end;
                                local v78 = CFrame.new(-1.5, 1, 1.2);
                                local v79 = CFrame.new(-0.5, 0.8, 1.5);
                                local l_WorldPosition_0 = l_Friends_0.WorldPosition;
                                l_Friends_0.WorldPosition = l_WorldPosition_0 + ((v17.PrimaryPart.CFrame * v79).Position - l_WorldPosition_0) * 1;
                                local v81 = tick();
                                l_WorldPosition_0 = nil;
                                l_WorldPosition_0 = game:GetService("RunService").Heartbeat:Connect(function(v82) --[[ Line: 457 ]]
                                    -- upvalues: l_CharacterData_0 (ref), v78 (copy), v79 (copy), l_Friends_0 (copy), v17 (ref), v81 (copy)
                                    if not l_CharacterData_0 then
                                        return;
                                    else
                                        local v83 = l_CharacterData_0.Equipped.Value and v78 or v79;
                                        local l_l_Friends_0_0 = l_Friends_0;
                                        local l_WorldPosition_1 = l_Friends_0.WorldPosition;
                                        local l_Position_0 = (v17.PrimaryPart.CFrame * v83 * CFrame.new(0, math.sin((tick() - v81) * 2) / 3, 0)).Position;
                                        local v87 = v82 * 5;
                                        l_l_Friends_0_0.WorldPosition = l_WorldPosition_1 + (l_Position_0 - l_WorldPosition_1) * v87;
                                        return;
                                    end;
                                end);
                                local _ = l_EmoteHelper_0:PlaySound({
                                    SourceCharacter = v17, 
                                    Parent = v17.PrimaryPart, 
                                    Name = "HawkStart", 
                                    Speed = 2, 
                                    Volume = 0.2
                                });
                                task.wait(2);
                                v64:Destroy();
                                task.wait(15);
                                v72:Destroy();
                                l_WorldPosition_0:Disconnect();
                                return;
                            end;
                        end;
                    end;
                end;
            end);
            local l_CameraSettings_0 = workspace:FindFirstChild("CameraSettings");
            local _ = l_CameraSettings_0:WaitForChild("CameraTarget");
            local l_CameraMode_0 = l_CameraSettings_0:WaitForChild("CameraMode");
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            local v93 = nil;
            local v94 = nil;
            local function v100() --[[ Line: 486 ]] --[[ Name: Cleanup ]]
                -- upvalues: v24 (ref), v32 (copy), v93 (ref), v94 (ref), v23 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v16 (copy), v28 (copy), l_Occupied_0 (copy), v17 (copy), v3 (ref), l_CameraMode_0 (copy), l_CharacterData_0 (copy), v31 (copy), l_TweenService_0 (ref), v30 (ref), v4 (ref)
                if v24 then
                    return;
                else
                    v24 = true;
                    for _, v96 in v32 do
                        v96:Destroy();
                    end;
                    if v93 then
                        v93:Destroy();
                    end;
                    if v94 then
                        v94:Destroy();
                    end;
                    for _, v98 in v23 do
                        v98:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v16);
                    if v28 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v17:GetAttribute("CurrentEmote") == v3.Metadata.Name then
                        v17:SetAttribute("CurrentEmote", nil);
                    end;
                    if v28 and (l_CameraMode_0.Value == "Cutscene" or l_CameraMode_0.Value == "Freecam") then
                        l_CameraMode_0.Value = "";
                        l_CharacterData_0.Cutscene.Value = false;
                        game:GetService("RunService"):UnbindFromRenderStep("EmoteCamera");
                    end;
                    if v31 and v31.Weld then
                        v31.Weld:Destroy();
                    end;
                    v31.Phone_PhoneGlass.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 3, math.random(10, 30) * 2.5, math.random(-10, 10) * 3);
                    v31.Phone_PhoneGlass.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                    local _ = l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v17, 
                        Parent = v17.PrimaryPart, 
                        Name = "Fling", 
                        Speed = math.random(0.9, 1.1)
                    });
                    l_TweenService_0:Create(v30, v4, {
                        Volume = 0
                    }):Play();
                    task.delay(3, function() --[[ Line: 532 ]]
                        -- upvalues: v30 (ref)
                        if v30.Parent then
                            v30.Parent:Destroy();
                        end;
                    end);
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v16, 30);
            v17:SetAttribute("CurrentEmote", v3.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v17, 
                Animator = v19
            }).Event:Connect(function() --[[ Line: 549 ]]
                -- upvalues: v100 (copy)
                v100();
            end);
            local v101 = 1000;
            if l_Occupied_0.LockedOn.Value then
                v101 = (v17.PrimaryPart.Position - l_Occupied_0.LockedOn.Value.PrimaryPart.Position).Magnitude;
            end;
            if v28 and v101 >= 8 and not l_CharacterData_0.Cutscene.Value and not l_Occupied_0.Spectating.Value then
                l_CameraMode_0.Value = "Cutscene";
                l_CharacterData_0.Cutscene.Value = true;
                local _ = l_CurrentCamera_0.CFrame;
                local _ = l_CurrentCamera_0.CFrame;
                local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
                v93 = l_Assets_0.Camera:Clone();
                v93.Parent = workspace.Debris;
                local v105 = v17.PrimaryPart.CFrame * CFrame.new(-5.03, -3.037, 1.7);
                v93:PivotTo(v105);
                local v106 = {
                    Animator = v93.AnimationController.Animator, 
                    AnimId = v3.Metadata.CameraId
                };
                local _ = l_AnimHelper_0:CreateAnim(v106);
                v94 = l_Assets_0.Camera:Clone();
                v94.Parent = workspace.Debris;
                local l_new_0 = CFrame.new;
                v94:PivotTo(l_new_0(0, 0, 0));
                v106 = {
                    Animator = v94.AnimationController.Animator, 
                    AnimId = v3.Metadata.FOVId
                };
                v105 = l_AnimHelper_0:CreateAnim(v106);
                l_l_AnimHelper_0_Anim_0:AdjustSpeed(0);
                task.wait();
                l_l_AnimHelper_0_Anim_0:AdjustSpeed(1);
                game:GetService("RunService"):BindToRenderStep("EmoteCamera", Enum.RenderPriority.Camera.Value, function(_) --[[ Line: 601 ]]
                    -- upvalues: v24 (ref), l_CurrentCamera_0 (copy), v93 (ref), v94 (ref)
                    if v24 then
                        return;
                    else
                        l_CurrentCamera_0.CFrame = v93.Head.CFrame;
                        local v110 = v94.Head.CFrame.Position.X + 5;
                        if v110 < 10 then
                            v110 = 70;
                        end;
                        l_CurrentCamera_0.FieldOfView = v110;
                        return;
                    end;
                end);
            end;
            task.wait(10);
            if v24 then
                return;
            else
                l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.5);
                task.wait(0.3333333333333333);
                if v24 then
                    return;
                else
                    v100();
                    return;
                end;
            end;
        end;
    end;
end;
return v3;