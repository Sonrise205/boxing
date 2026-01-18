local v1 = {
    Rarity = "Legendary", 
    ShortName = "HAWK", 
    DisplayName = "Hawk Style", 
    Description = "In your madness, you only rely on your instincts and lose sight of what's in front of you. Ability: Swayback. Ultimate: Pure Violence", 
    Titles = {
        [1] = {
            Name = "Hawk1", 
            DisplayTitle = "Hunter \240\159\166\133", 
            Quality = 4, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "Hawk2", 
            DisplayTitle = "Pure Violence \240\159\146\128", 
            Quality = 7, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "Hawk3", 
            DisplayTitle = "License to Kill \240\159\148\170", 
            Quality = 12, 
            Type = "Knockdowns", 
            Amount = 750
        }
    }, 
    SpecialInfo = {
        Type = "Hawk", 
        IgnoreUI = true
    }, 
    MeterInfo = {
        GetMode = function(v0) --[[ Line: 43 ]] --[[ Name: GetMode ]]
            if v0 <= 33 then
                return "Base";
            elseif v0 <= 67 then
                return "Bloodlust";
            else
                return "Ecstasy";
            end;
        end, 
        Type = "Hawk", 
        CutsceneMult = 0, 
        StunnedMult = 0.5, 
        MeterDecrement = 1.4, 
        MeterDelay = 2
    }
};
if game:GetService("RunService"):IsClient() then
    local l_UserInputService_0 = game:GetService("UserInputService");
    local l_TweenService_0 = game:GetService("TweenService");
    local v4 = {};
    local v5 = nil;
    local l_l_UserInputService_0_0 = l_UserInputService_0 --[[ copy: 2 -> 6 ]];
    do
        local l_v4_0, l_v5_0 = v4, v5;
        v1.MeterInfo.ModeChanged = function(v9) --[[ Line: 72 ]]
            -- upvalues: l_l_UserInputService_0_0 (copy), l_TweenService_0 (copy), l_v4_0 (ref), l_v5_0 (ref)
            if not v9 then
                v9 = "Base";
            end;
            local l_MeterCorrection_0 = game.Lighting.MeterCorrection;
            local v11 = TweenInfo.new(4.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
            local v12 = not l_l_UserInputService_0_0.KeyboardEnabled and l_l_UserInputService_0_0.TouchEnabled;
            local v13 = {
                Base = {
                    Brightness = 0, 
                    Contrast = 0, 
                    Saturation = 0, 
                    TintColor = Color3.fromRGB(255, 255, 255), 
                    VignetteTransparency = 1, 
                    Vignette2Transparency = 1
                }, 
                Bloodlust = {
                    Brightness = 0, 
                    Contrast = 0, 
                    Saturation = 0.1, 
                    TintColor = Color3.fromRGB(255, 255, 255), 
                    VignetteTransparency = v12 and 0.85 or 0.9, 
                    Vignette2Transparency = v12 and 0.3 or 0.4
                }, 
                Ecstasy = {
                    Brightness = 0, 
                    Contrast = 0.1, 
                    Saturation = 0.3, 
                    TintColor = Color3.fromRGB(255, 235, 235), 
                    VignetteTransparency = v12 and 0.6 or 0.75, 
                    Vignette2Transparency = v12 and 0 or 0.1
                }
            };
            l_TweenService_0:Create(l_MeterCorrection_0, v11, {
                Brightness = v13[v9].Brightness, 
                Contrast = v13[v9].Contrast, 
                Saturation = v13[v9].Saturation, 
                TintColor = v13[v9].TintColor
            }):Play();
            local l_Common_0 = game.Players.LocalPlayer.PlayerGui.Common;
            local l_HawkVignette_0 = l_Common_0.Meter.HawkVignette;
            local l_HawkVignette2_0 = l_Common_0.Meter.HawkVignette2;
            l_HawkVignette_0.Visible = true;
            l_HawkVignette2_0.Visible = true;
            for _, v18 in l_v4_0 do
                v18:Cancel();
            end;
            l_v4_0 = {};
            l_TweenService_0:Create(l_HawkVignette_0, v11, {
                ImageTransparency = v13[v9].VignetteTransparency
            }):Play();
            l_TweenService_0:Create(l_HawkVignette2_0, v11, {
                ImageTransparency = v13[v9].Vignette2Transparency
            }):Play();
            local v19 = TweenInfo.new(0.8, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, -1, true);
            l_v5_0 = v9;
            task.delay(5, function() --[[ Line: 139 ]]
                -- upvalues: v9 (ref), l_v5_0 (ref), l_TweenService_0 (ref), l_HawkVignette_0 (copy), v19 (copy), v13 (copy), l_HawkVignette2_0 (copy), l_v4_0 (ref)
                if v9 ~= l_v5_0 then
                    return;
                else
                    local v20 = l_TweenService_0:Create(l_HawkVignette_0, v19, {
                        ImageTransparency = v13[v9].VignetteTransparency + 0.12
                    });
                    local v21 = l_TweenService_0:Create(l_HawkVignette2_0, v19, {
                        ImageTransparency = v13[v9].Vignette2Transparency + 0.12
                    });
                    table.insert(l_v4_0, v20);
                    table.insert(l_v4_0, v21);
                    v20:Play();
                    v21:Play();
                    return;
                end;
            end);
        end;
    end;
end;
v1.CoreInfo = {
    WalkSpeed = 9, 
    Health = 100, 
    HealthRecoveryTime = 1, 
    HealthRecoverySpeed = 0.15, 
    Stamina = 100, 
    DashRecoveryTime = 0.5, 
    StaminaRecoveryTime = 0.9, 
    StaminaRecoverySpeed = 6.1, 
    StaminaBreakAnimId = 13633645648, 
    StaminaBreakTime = 1.3666666666666667, 
    BlockEnergy = 40, 
    BlockPercent = 70, 
    BlockDebounce = 0.3, 
    BlockBreakTime = 1.6666666666666667, 
    BlockRecoveryTime = 1.5, 
    BlockRecoverySpeed = 0.35, 
    BlockingWalkSpeed = 5, 
    UltimateHitMult = 0.3, 
    UltimateHurtMult = 0.5, 
    StandingSlowMo = true, 
    CounterHurtMult = 1.1
};
v1.Combos = {};
v1.DefaultMoverInfo = {
    Responsiveness = 75, 
    MaxDistance = 0.8, 
    Velocity = 20, 
    MaxTime = 0.6666666666666666
};
v1.DefaultPunchInfo = {
    Stamina = 10, 
    Damage = 1.65, 
    BlockDamage = 1.65, 
    Recover = 100, 
    BreakRecover = 0.075, 
    Startup = 0.2833333333333333, 
    TrackTime = 0.16666666666666666, 
    CounterMult = 1.5, 
    MinTime = 0, 
    MaxTime = 0.8333333333333334, 
    StunTime = 0.75, 
    MoveDelay = 0.3333333333333333, 
    AnimSpeed = 1, 
    FadeIn = 0.1, 
    NameFade = 0.25, 
    ClientFadeIn = 4, 
    ClientWeightFade = 5, 
    HitSound = "Hit1", 
    HitSoundSpeedMult = 1, 
    KnockbackInfo = {
        Distance = 1, 
        TargetTime = 0.2, 
        HitIndex = 1
    }, 
    ShakeInfo = {
        Preset = "LightHit", 
        FoV = 68
    }, 
    BlockedMeterMult = 1, 
    LightMeterMult = 2, 
    HeavyMeterMult = 2, 
    CounterMeterMult = 3.5
};
v1.Combos[1] = {
    [1] = {
        AnimId = 14135442357, 
        AnimSpeed = 0.92, 
        Stamina = 20, 
        Damage = 4, 
        BlockDamage = 4, 
        BreakRecover = 0.3, 
        Startup = 0.38333333333333336, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.6666666666666666, 
        MoveDelay = 0.25, 
        MoverInfo = {
            MaxDistance = 2.7, 
            Velocity = 30, 
            Responsiveness = 70
        }, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 0.2, 
            TimeScale = 0.6
        }, 
        ShakeInfo = {
            Preset = "HardHit2", 
            FoV = 66
        }
    }, 
    [2] = {
        AnimId = 16831311102, 
        AnimSpeed = 1.1875, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "RightHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.06666666666666667, 
            TimeScale = 0.5
        }
    }, 
    [3] = {
        AnimId = 14135720350, 
        AnimSpeed = 1.2954545454545454, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.5
        }
    }
};
v1.Combos[2] = {
    [1] = {
        AnimId = 14136120871, 
        AnimSpeed = 0.92, 
        Stamina = 20, 
        Damage = 4, 
        BlockDamage = 4, 
        BreakRecover = 0.3, 
        Startup = 0.38333333333333336, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.6666666666666666, 
        MoveDelay = 0.25, 
        MoverInfo = {
            MaxDistance = 2.7, 
            Velocity = 30, 
            Responsiveness = 70
        }, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "RightHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.6
        }, 
        ShakeInfo = {
            Preset = "HardHit2", 
            FoV = 66
        }
    }, 
    [2] = {
        AnimId = 14135720350, 
        AnimSpeed = 1.2954545454545454, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.5
        }
    }, 
    [3] = {
        AnimId = 16831311102, 
        AnimSpeed = 1.1875, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "RightHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.06666666666666667, 
            TimeScale = 0.5
        }
    }
};
v1.HeavyAttacks = {
    DefaultMoverInfo = {
        Responsiveness = 70, 
        MaxDistance = 2.7, 
        Velocity = 30, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 20, 
        Damage = 6, 
        Recover = 0, 
        BreakRecover = 1, 
        CounterMult = 1.6, 
        Startup = 0.5, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0.8666666666666667, 
        MaxTime = 1, 
        StunTime = 0.5, 
        MoveDelay = 0.25, 
        AnimSpeed = 1, 
        FadeIn = 0.1, 
        HitSound = "Heavy1", 
        HitSoundSpeedMult = 0.95, 
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
        }, 
        BlockedMeterMult = 1, 
        LightMeterMult = 2, 
        HeavyMeterMult = 2, 
        CounterMeterMult = 3.5
    }, 
    [1] = {
        AnimId = 14136372505, 
        AnimSpeed = 0.95, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }, 
    [2] = {
        AnimId = 14136346745, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "RightHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }
};
v1.DashInfo = {
    DefaultInfo = {
        FadeIn = 0.1, 
        AnimSpeed = 0.95, 
        Stamina = 16, 
        DashStartup = 0.05, 
        DashTime = 0.26666666666666666, 
        StartWindow = 0, 
        DashWindow = 0.2, 
        MinTime = 0.26666666666666666, 
        MaxTime = 0.26666666666666666, 
        DashDelay = 0.5333333333333333, 
        MaxDistance = 6, 
        Responsiveness = 25, 
        Velocity = 30
    }, 
    Forward = {
        MaxDistance = 5, 
        AnimSpeed = 1.04, 
        AnimId = 14134354195
    }, 
    Standing = {
        AnimSpeed = 1, 
        AnimId = 14133671622, 
        UseForSlowMo = true, 
        FadeIn = 0.1, 
        MaxDistance = 0, 
        DashStartup = 0, 
        DashTime = 0.16666666666666666, 
        DashWindow = 0.23333333333333334, 
        Responsiveness = 0, 
        AttackTime = 0.2, 
        DashDelay = 0.7333333333333333, 
        MinTime = 0.23333333333333334, 
        MaxTime = 0.36666666666666664, 
        StopInfo = {
            StopDelay = 0.6666666666666666, 
            StopTime = 0.25, 
            Weight = 1
        }
    }, 
    Backward = {
        AnimId = 16820850586, 
        AnimSpeed = 0.8, 
        MaxDistance = 4, 
        MinTime = 0.3, 
        MaxTime = 0.3
    }, 
    Left = {
        AnimId = 14134399588
    }, 
    Right = {
        AnimId = 14134432847
    }
};
v1.UltimateInfo = {
    Effect = "Hawk", 
    PreDelay = 1, 
    Time = 10.5, 
    Offset = CFrame.new(0, 0, 0.01), 
    EndOffset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5), 
    DamageTimes = {
        {
            2.3666666666666667, 
            5
        }, 
        {
            3.5, 
            5
        }, 
        {
            4.066666666666666, 
            5
        }, 
        {
            4.633333333333334, 
            5
        }, 
        {
            5.166666666666667, 
            10
        }, 
        {
            8.633333333333333, 
            20
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
        MinTime = 1.25, 
        MaxTime = 1.25, 
        StunTime = 0.5833333333333334, 
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
v1.HitboxInfo = {
    Size = Vector3.new(3, 1, 2.799999952316284, 0)
};
v1.BlockAnimations = {
    IdleFade = 0.25, 
    Idle = 14143609591, 
    Break = 13633646743, 
    Left = 13633646784, 
    Right = 13633646824, 
    Forward = 13633646884, 
    BodyLeft = 13633646937, 
    BodyRight = 13633646996, 
    BodyForward = 13633647037
};
v1.HitAnimations = {
    Left = 13633647117, 
    Right = 13633647192, 
    Forward = 13633647279, 
    BodyLeft = 13633647368, 
    BodyRight = 13633647448, 
    BodyForward = 13633647529, 
    LeftHeavy = 13633647670, 
    RightHeavy = 13646198530, 
    ForwardHeavy = 13705365076, 
    BodyLeftHeavy = 13633647871, 
    BodyRightHeavy = 13633648017, 
    BodyForwardHeavy = 13633648126
};
local _ = game:GetService("Workspace");
local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
v1.GetDash = function(_, v26, v27) --[[ Line: 850 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v1 (copy)
    local v28 = "Forward";
    local l_LookVector_0 = v26.CFrame.LookVector;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    if v27.X < -0.5 or v27.X > 0.5 then
        v30 = l_RayHelper_0:GetCharactersExcept({
            v26.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v35, v36 = l_RayHelper_0:GetRayWithWhiteList(v26.CFrame.Position, v26.CFrame.Position + l_LookVector_0, v1.DashInfo.DefaultInfo.MaxDistance, v30);
        v31 = l_l_RayHelper_0_RayWithWhiteList_0;
        v32 = v35;
        v33 = v36;
    end;
    if v27 == Vector3.new() then
        return "Standing", -v26.CFrame.LookVector;
    elseif v27.Z > 0.8 then
        return "Backward", -v26.CFrame.LookVector;
    elseif v27.X < -0.5 then
        return "Left", (v26.CFrame.LookVector * (v31 and 0.8 or 0.3) + -v26.CFrame.RightVector * 0.9).Unit;
    else
        if v27.X > 0.5 then
            v28 = "Right";
            l_LookVector_0 = (v26.CFrame.LookVector * (v31 and 0.8 or 0.3) + v26.CFrame.RightVector * 0.9).Unit;
        end;
        return v28, l_LookVector_0;
    end;
end;
return v1;