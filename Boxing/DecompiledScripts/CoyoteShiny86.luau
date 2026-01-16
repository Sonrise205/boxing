local l_CommonUtilities_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("CommonUtilities"));
local l_Volk_0 = require(script.Parent:WaitForChild("Volk"));
local v2 = l_CommonUtilities_0.DeepCopy(l_Volk_0);
Init = function() --[[ Line: 7 ]] --[[ Name: Init ]]
    -- upvalues: l_Volk_0 (ref), v2 (ref), l_CommonUtilities_0 (copy)
    l_Volk_0 = require(script.Parent:WaitForChild("Volk"));
    v2 = l_CommonUtilities_0.DeepCopy(l_Volk_0);
    v2.Init = Init;
    v2.Rarity = nil;
    v2.Shiny = true;
    v2.HiddenRarity = "Mythic";
    v2.ShortName = "COYOTE";
    v2.DisplayName = "Coyote Style";
    v2.Description = "I always envied the weak. Whenever we made friends, their souls would waste away just from being near us. Because we were so alone, we split our soul in two. I don't know which was our original form.";
    v2.BaseStyleName = "Volk";
    v2.Titles = {
        [1] = {
            Name = "Coyote1", 
            DisplayTitle = "Solitude \240\159\144\186", 
            Quality = 12, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "Coyote2", 
            DisplayTitle = "Cero \240\159\140\128", 
            Quality = 16, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "Coyote3", 
            DisplayTitle = "Primera Espada \240\159\151\161\239\184\143", 
            Quality = 7, 
            Type = "Knockdowns", 
            Amount = 750
        }
    };
    local l_States_0 = workspace:WaitForChild("States");
    local _ = workspace:WaitForChild("Live");
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local l_CollectionService_0 = game:GetService("CollectionService");
    v2.AddAppearance = function(v7) --[[ Line: 57 ]]
        -- upvalues: l_States_0 (copy), l_CollectionService_0 (copy)
        local l_Player_0 = v7.Player;
        local v9 = v7.Character or l_Player_0 and l_Player_0.Character;
        if not v9 then
            return;
        else
            local v10 = l_States_0:WaitForChild(l_Player_0 and l_Player_0.Name or v9.Name);
            local v11 = v10 and v10:WaitForChild("PlayerData");
            local v12 = v11 and v11:WaitForChild("ShinyOutfits");
            local v13 = v11 and v11:WaitForChild("Style");
            if not v13 then
                return;
            else
                local v14 = v9 and workspace.Welds:FindFirstChild(v9.Name);
                local v15 = v14 and v14:FindFirstChild("WeldCharacter");
                local v16 = v9.Name == "SpinDummy";
                if v16 then
                    v15 = v9;
                end;
                if not v15 then
                    return;
                else
                    if v9 then
                        if v9:GetAttribute("ShinyOutfitId") == script.Name then
                            return;
                        else
                            v9:SetAttribute("ShinyOutfitId", script.Name);
                        end;
                    end;
                    local l_LeftLowerArm_0 = v9:FindFirstChild("LeftLowerArm");
                    local l_RightLowerArm_0 = v9:FindFirstChild("RightLowerArm");
                    local l_UpperTorso_0 = v9:FindFirstChild("UpperTorso");
                    if not l_UpperTorso_0 or not l_LeftLowerArm_0 or not l_RightLowerArm_0 then
                        return;
                    else
                        local v20 = script.Gun:Clone();
                        v20.Parent = v15;
                        v20.Name = "LeftGun";
                        local l_Weld_0 = Instance.new("Weld");
                        l_Weld_0.Parent = v20;
                        l_Weld_0.Part0 = v20.Target;
                        l_Weld_0.Part1 = l_LeftLowerArm_0;
                        local v22 = script.Gun:Clone();
                        v22.Parent = v15;
                        v22.Name = "RightGun";
                        local l_Weld_1 = Instance.new("Weld");
                        l_Weld_1.Parent = v22;
                        l_Weld_1.Part0 = v22.Target;
                        l_Weld_1.Part1 = l_RightLowerArm_0;
                        local v24 = script.Cape:Clone();
                        v24.Parent = v15;
                        local l_Weld_2 = Instance.new("Weld");
                        l_Weld_2.Parent = v24;
                        l_Weld_2.Part0 = v24.Target;
                        l_Weld_2.Part1 = l_UpperTorso_0;
                        l_CollectionService_0:AddTag(v24.Cape, "SmartBone");
                        local v26 = {};
                        local l_Catalog_0 = game:GetService("ReplicatedStorage"):WaitForChild("Catalog");
                        local l_SearchHelper_0 = require(l_Catalog_0:WaitForChild("SearchHelper"));
                        local function v33(v29, v30) --[[ Line: 121 ]] --[[ Name: SetShinyOutfit ]]
                            -- upvalues: v12 (copy), l_Player_0 (copy), v16 (copy), l_SearchHelper_0 (copy), v24 (copy), l_CollectionService_0 (ref)
                            local l_Value_0 = v12.Value;
                            if v30 ~= nil then
                                l_Value_0 = v30;
                            end;
                            local v32 = l_Player_0 or v29;
                            if v16 then
                                v32 = v29;
                            end;
                            v32:SetAttribute("SOHD_Add_NeckAccessory_" .. script.Name, l_Value_0 and ",18645924795");
                            v32:SetAttribute("SOHD_Add_WaistAccessory_" .. script.Name, l_Value_0 and ",14959852137");
                            v32:SetAttribute("SOHD_Replace_BackAccessory_" .. script.Name, l_Value_0 and "");
                            v32:SetAttribute("SOHD_Replace_Pants_" .. script.Name, l_Value_0 and "10654366770");
                            v32:SetAttribute("SOHD_Replace_Shirt_" .. script.Name, l_Value_0 and "10654531993");
                            if l_Player_0 and not v16 then
                                l_SearchHelper_0.UpdateAppearance(l_Player_0);
                            else
                                l_SearchHelper_0.UpdateModelAppearance(v29);
                            end;
                            if not v24 or not v24:FindFirstChild("Cape") then
                                return;
                            else
                                v24.Cape.Transparency = l_Value_0 and 0 or 1;
                                if l_Value_0 then
                                    l_CollectionService_0:AddTag(v24.Cape, "SmartBone");
                                    return;
                                else
                                    l_CollectionService_0:RemoveTag(v24.Cape, "SmartBone");
                                    return;
                                end;
                            end;
                        end;
                        local v34 = v9 and v9:WaitForChild("Humanoid", 20);
                        if v34 and v34:FindFirstChild("HumanoidDescription", 20) then
                            v33(v9);
                            v26[#v26 + 1] = v12.Changed:Connect(function() --[[ Line: 156 ]]
                                -- upvalues: v33 (copy), v9 (copy)
                                v33(v9);
                            end);
                        end;
                        v26[#v26 + 1] = v13.Changed:Connect(function() --[[ Line: 162 ]]
                            -- upvalues: v13 (copy), v26 (copy), v9 (copy), v33 (copy), v20 (copy), v22 (copy), v24 (copy)
                            if v13.Value == script.Name then
                                return;
                            else
                                for _, v36 in v26 do
                                    v36:Disconnect();
                                end;
                                if v9 and v9:GetAttribute("ShinyOutfitId") == script.Name then
                                    v9:SetAttribute("ShinyOutfitId", nil);
                                end;
                                v33(v9, false);
                                if v20 then
                                    v20:Destroy();
                                end;
                                if v22 then
                                    v22:Destroy();
                                end;
                                if v24 then
                                    v24:Destroy();
                                end;
                                return;
                            end;
                        end);
                        return;
                    end;
                end;
            end;
        end;
    end;
    if game:GetService("RunService"):IsServer() then
        local _ = game:GetService("CollectionService");
        local _ = game:GetService("Players");
        local function v44(v39) --[[ Line: 186 ]] --[[ Name: StyleEquipped ]]
            -- upvalues: l_States_0 (copy), v2 (ref)
            local l_Player_1 = v39.Player;
            local v41 = v39.Character or l_Player_1 and l_Player_1.Character;
            if not v41 then
                return;
            else
                local v42 = l_States_0:WaitForChild(v41.Name);
                local v43 = v42 and v42:WaitForChild("PlayerData");
                if not (v43 and v43:WaitForChild("Style")) then
                    return;
                else
                    v2.AddAppearance(v39);
                    return;
                end;
            end;
        end;
        local l_v44_0 = v44 --[[ copy: 6 -> 9 ]];
        v2.ServerOnSet = function(v46) --[[ Line: 199 ]]
            -- upvalues: l_v44_0 (copy), l_States_0 (copy)
            if not game:GetService("RunService"):IsServer() then
                return;
            else
                l_v44_0(v46);
                local l_Player_2 = v46.Player;
                if not l_Player_2 then
                    return;
                else
                    local v48 = l_States_0:WaitForChild(l_Player_2.Name);
                    local v49 = v48 and v48:WaitForChild("PlayerData");
                    local v50 = v49 and v49:WaitForChild("Style");
                    if not v50 then
                        return;
                    else
                        local v51 = {};
                        v51[#v51 + 1] = workspace.Live.ChildAdded:Connect(function(v52) --[[ Line: 214 ]]
                            -- upvalues: l_Player_2 (copy), v46 (copy), l_v44_0 (ref)
                            if v52.Name ~= l_Player_2.Name then
                                return;
                            else
                                task.wait(0.5);
                                if not v52 or v52.Parent ~= workspace.Live then
                                    return;
                                else
                                    v46.Character = v52;
                                    l_v44_0(v46);
                                    return;
                                end;
                            end;
                        end);
                        v51[#v51 + 1] = v50.Changed:Connect(function() --[[ Line: 225 ]]
                            -- upvalues: v51 (copy)
                            for _, v54 in v51 do
                                v54:Disconnect();
                            end;
                        end);
                        return;
                    end;
                end;
            end;
        end;
    end;
    local l_TweenService_0 = game:GetService("TweenService");
    local l_Players_1 = game:GetService("Players");
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local v58 = nil;
    local v59 = nil;
    v2.OnClientDash = function(v60) --[[ Line: 240 ]]
        -- upvalues: v58 (ref), v59 (ref), l_Modules_0 (copy), l_Players_1 (copy), l_CommonUtilities_0 (ref), l_TweenService_0 (copy)
        local l_Player_3 = v60.Player;
        local v62 = v60.Character or l_Player_3 and l_Player_3.Character;
        if not v62 then
            return;
        else
            if not v58 or not v59 then
                v58 = require(l_Modules_0:WaitForChild("EffectHelper"));
                v59 = require(l_Modules_0:WaitForChild("SoundHelper"));
            end;
            task.wait(0.06666666666666667);
            local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
            l_ColorCorrectionEffect_0.Name = "DashCC";
            l_ColorCorrectionEffect_0.Parent = game.Lighting;
            local l_Character_0 = l_Players_1.LocalPlayer.Character;
            local v65 = l_CommonUtilities_0.GetOccupied(l_Character_0);
            if l_Character_0 == v62 or v65.LockedOn.Value == v62 then
                local l_CurrentCamera_0 = workspace.CurrentCamera;
                if v65.LockedOn.Value then
                    l_CurrentCamera_0.FieldOfView = l_CurrentCamera_0.FieldOfView - 2.5;
                    workspace.FoVMult.Value = 1;
                end;
                l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(0.2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true), {
                    Contrast = 0.12
                }):Play();
            end;
            local v67 = script.DashVFX:Clone();
            v67.CanCollide = false;
            v67.Parent = workspace.Debris;
            v67.Position = v62.HumanoidRootPart.Position;
            for _, v69 in (v67:GetDescendants()) do
                if v69:IsA("ParticleEmitter") or v69:IsA("Beam") then
                    if v69:GetAttribute("EmitDelay") == nil then
                        v69:SetAttribute("EmitDelay", 0);
                    end;
                    task.delay(v69:GetAttribute("EmitDelay"), function() --[[ Line: 284 ]]
                        -- upvalues: v69 (copy)
                        if v69:GetAttribute("EmitDuration") then
                            v69.Enabled = true;
                            task.delay(v69:GetAttribute("EmitDuration"), function() --[[ Line: 288 ]]
                                -- upvalues: v69 (ref)
                                v69.Enabled = false;
                            end);
                        end;
                        if v69:IsA("ParticleEmitter") then
                            v69:Emit(v69:GetAttribute("EmitCount"));
                        end;
                    end);
                end;
            end;
            local v70 = v59:PlaySound({
                Name = "FlashStep", 
                Parent = v62
            });
            task.delay(0.5, function() --[[ Line: 305 ]]
                -- upvalues: v70 (copy), l_TweenService_0 (ref)
                if not v70 then
                    return;
                else
                    l_TweenService_0:Create(v70, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Volume = 0
                    }):Play();
                    return;
                end;
            end);
            v58.SetTransparency(v62, 1);
            local v71 = nil;
            v71 = v62:GetAttributeChangedSignal("Punching"):Connect(function() --[[ Line: 313 ]]
                -- upvalues: v58 (ref), v62 (copy)
                v58.SetTransparency(v62, 0);
            end);
            task.wait(0.16666666666666666);
            if v71 then
                v71:Disconnect();
            end;
            v58.SetTransparency(v62, 0);
            task.wait(5);
            l_ColorCorrectionEffect_0:Destroy();
            v67:Destroy();
            return;
        end;
    end;
    v2.CoreInfo.HitAnimWeight = 0.8;
    v2.CoreInfo.BodyHitAnimWeight = 0.8;
    v2.DefaultPunchInfo = {
        ShakeInfo = {
            Preset = "LightHit", 
            FoV = 68
        }
    };
    v2.Combos[1] = {
        [1] = {
            AnimId = 113768654669666, 
            AnimSpeed = 0.92, 
            HitInfo = {
                Direction = "Right", 
                AnimName = "Right"
            }
        }, 
        [2] = {
            AnimId = 78145065754820, 
            AnimSpeed = 0.9, 
            Startup = 0.23333333333333334, 
            HitSound = "Kick1", 
            HitInfo = {
                Direction = "Right", 
                AnimName = "BodyRight"
            }
        }, 
        [3] = {
            AnimId = 118983067083447, 
            AnimSpeed = 1.05, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            ExtraEffect = {
                Effect = "CoyoteHeavyRight", 
                EffectDelay = 0.18333333333333332, 
                IsMini = true, 
                CFrameOffset = CFrame.new(0.4, 1.543, -1.5), 
                OrientationOffset = Vector3.new(3.505000114440918, 13.817999839782715, 22.715999603271484, 0)
            }
        }, 
        [4] = {
            AnimId = 114511879398391, 
            AnimSpeed = 1.05, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            ExtraEffect = {
                Effect = "CoyoteHeavyLeft", 
                EffectDelay = 0.18333333333333332, 
                IsMini = true, 
                CFrameOffset = CFrame.new(-1.5, 1.421, -1.5), 
                OrientationOffset = Vector3.new(-3.240000009536743, -12.29699993133545, -7.2769999504089355, 0)
            }
        }, 
        [5] = {
            AnimId = 132657647006930, 
            AnimSpeed = 0.72, 
            Startup = 0.25, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            ExtraEffect = {
                Effect = "CoyoteHeavyLeft", 
                EffectDelay = 0.2, 
                IsMini = true, 
                CFrameOffset = CFrame.new(-1.5, 1.421, -2.5), 
                OrientationOffset = Vector3.new(-3.240000009536743, -12.29699993133545, -7.2769999504089355, 0)
            }
        }, 
        [6] = {
            AnimId = 134551872269076, 
            AnimSpeed = 1.32, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }
        }, 
        [7] = {
            AnimId = 13905208500, 
            AnimSpeed = 1.05, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy"
            }
        }
    };
    v2.Combos[2] = {
        [1] = {
            AnimId = 134551872269076, 
            AnimSpeed = 0.92, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }
        }, 
        [2] = {
            AnimId = 13905208500, 
            AnimSpeed = 1.05, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy"
            }
        }, 
        [3] = {
            AnimId = 118983067083447, 
            AnimSpeed = 1.05, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            ExtraEffect = {
                Effect = "CoyoteHeavyRight", 
                EffectDelay = 0.18333333333333332, 
                IsMini = true, 
                CFrameOffset = CFrame.new(0.4, 1.543, -1.5), 
                OrientationOffset = Vector3.new(3.505000114440918, 13.817999839782715, 22.715999603271484, 0)
            }
        }, 
        [4] = {
            AnimId = 82014032988740, 
            AnimSpeed = 1.05, 
            Startup = 0.23333333333333334, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            ExtraEffect = {
                Effect = "CoyoteHeavyLeft", 
                EffectDelay = 0.18333333333333332, 
                IsMini = true, 
                CFrameOffset = CFrame.new(-1.5, 1.421, -1.5), 
                OrientationOffset = Vector3.new(-3.240000009536743, -12.29699993133545, -7.2769999504089355, 0)
            }
        }, 
        [5] = {
            AnimId = 132657647006930, 
            AnimSpeed = 0.72, 
            Startup = 0.25, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            ExtraEffect = {
                Effect = "CoyoteHeavyLeft", 
                EffectDelay = 0.2, 
                IsMini = true, 
                CFrameOffset = CFrame.new(-1.5, 1.421, -2.5), 
                OrientationOffset = Vector3.new(-3.240000009536743, -12.29699993133545, -7.2769999504089355, 0)
            }
        }, 
        [6] = {
            AnimId = 82014032988740, 
            AnimSpeed = 1.05, 
            Startup = 0.23333333333333334, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            ExtraEffect = {
                Effect = "CoyoteHeavyLeft", 
                EffectDelay = 0.18333333333333332, 
                IsMini = true, 
                CFrameOffset = CFrame.new(-1.5, 1.421, -1.5), 
                OrientationOffset = Vector3.new(-3.240000009536743, -12.29699993133545, -7.2769999504089355, 0)
            }
        }, 
        [7] = {
            AnimId = 134551872269076, 
            AnimSpeed = 1.32, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }
        }
    };
    v2.HeavyAttacks = {
        DefaultPunchInfo = {
            AnimSpeed = 1, 
            HitSound = "Heavy1", 
            ShakeInfo = {
                Preset = "SuperHardHit", 
                WaitTime = 0.25, 
                Fade = 0.3, 
                FoVMult = 1.5, 
                FoV = 64
            }
        }, 
        [1] = {
            AnimId = 130250886272579, 
            AnimSpeed = 0.89, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy"
            }, 
            ExtraEffect = {
                Effect = "CoyoteHeavyLeft", 
                EffectDelay = 0.4, 
                CFrameOffset = CFrame.new(-0.138, 1.422, -3.55), 
                OrientationOffset = Vector3.new(-3.2730000019073486, -5.191999912261963, -8.503999710083008, 0)
            }
        }, 
        [2] = {
            AnimId = 132573294363403, 
            AnimSpeed = 0.95, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy"
            }, 
            ExtraEffect = {
                Effect = "CoyoteHeavyRight", 
                EffectDelay = 0.2833333333333333, 
                CFrameOffset = CFrame.new(0, 1.387, -3.018), 
                OrientationOffset = Vector3.new(-1.0460000038146973, 9.46500015258789, 37.130001068115234, 0)
            }
        }
    };
    v2.DashInfo = {
        Forward = {
            AnimSpeed = 0.9, 
            AnimId = 17060437446
        }, 
        Backward = {
            AnimSpeed = 0.8, 
            AnimId = 17067178396
        }, 
        Left = {
            AnimId = 17072887986
        }, 
        Right = {
            AnimId = 17073059579
        }
    };
    l_CommonUtilities_0.DeepMergeMissing(v2.Combos, l_Volk_0.Combos);
    l_CommonUtilities_0.DeepMergeMissing(v2.DashInfo, l_Volk_0.DashInfo);
    l_CommonUtilities_0.DeepMergeMissing(v2.HeavyAttacks, l_Volk_0.HeavyAttacks);
    l_CommonUtilities_0.DeepMergeMissing(v2.DefaultPunchInfo, l_Volk_0.DefaultPunchInfo);
    v2.UltimateInfo = {
        Effect = "Coyote", 
        PreDelay = 1, 
        Time = 16.166666666666668, 
        Offset = CFrame.Angles(0, 0, 0.01), 
        EndOffset = CFrame.new(0, 0, 3.5), 
        StartOffset = CFrame.Angles(0, 0, 0) * CFrame.new(0, 0, 3.5), 
        DamageTimes = {
            {
                7.28, 
                25
            }, 
            {
                13.2, 
                25
            }
        }, 
        DefaultMoverInfo = {
            Responsiveness = 70, 
            MaxDistance = 2.7, 
            Velocity = 30, 
            MaxTime = 0.6666666666666666
        }, 
        DefaultPunchInfo = {
            Stamina = 20, 
            Damage = 1, 
            Recover = 0, 
            BreakRecover = 1, 
            Startup = 0.6333333333333333, 
            TrackTime = 0.16666666666666666, 
            MinTime = 1, 
            MaxTime = 1.1333333333333333, 
            StunTime = 0.5, 
            MoveDelay = 0.43333333333333335, 
            AnimSpeed = 1, 
            FadeIn = 0.1, 
            HitSound = "Heavy1", 
            KnockbackInfo = {
                Distance = 1, 
                TargetTime = 0.2, 
                HitIndex = 1
            }, 
            ShakeInfo = {
                Preset = "HardHit", 
                WaitTime = 0.15, 
                Fade = 0.3, 
                FoVMult = 1.5, 
                FoV = 65
            }
        }, 
        [1] = {
            AnimId = 13633645717, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "UltimateTrail", 
                TargetPart = "RightHand", 
                DelayTime = 0.43333333333333335, 
                HoldTime = 0.21666666666666667, 
                TimeScale = 1
            }
        }
    };
    v2.BlockAnimations = {
        IdleFade = 0.08333333333333333, 
        Idle = 140419142725132, 
        Break = 13633646743, 
        Left = 13633646784, 
        Right = 13633646824, 
        Forward = 13633646884, 
        BodyLeft = 13633646937, 
        BodyRight = 13633646996, 
        BodyForward = 13633647037
    };
    return v2;
end;
if not require(game.ReplicatedFirst:WaitForChild("Places")):IsTesting() and script:FindFirstChild("Testing") then
    task.spawn(function() --[[ Line: 747 ]]
        local l_FirstChild_0 = game:GetService("ReplicatedFirst"):WaitForChild("Animations", 10):FindFirstChild(script.Name);
        if l_FirstChild_0 then
            l_FirstChild_0:Destroy();
        end;
    end);
    return v2;
else
    Init();
    game:GetService("ReplicatedStorage"):WaitForChild("Events", 30):WaitForChild("RemoteConfigLoaded", 30).Event:Connect(function() --[[ Line: 762 ]]
        Init();
    end);
    return v2;
end;