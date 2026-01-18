local v0 = {
    Rarity = "Rare", 
    ShortName = "CHARGE", 
    DisplayName = "Charge Style", 
    Description = "You can run, but you can't hide. A hyper-aggressive, textbook in-fighter who doesn't know the meaning of stepping backwards. Unique Ability: Stampede - charges into your opponent, unleashing powerful body shots that sap their stamina Ultimate: Raging Bull", 
    Titles = {
        [1] = {
            Name = "Charge1", 
            DisplayTitle = "Matador \240\159\144\130", 
            Quality = 3, 
            Type = "Knockdowns", 
            Amount = 50
        }, 
        [2] = {
            Name = "Charge2", 
            DisplayTitle = "Stampede \240\159\144\151", 
            Quality = 5, 
            Type = "Knockdowns", 
            Amount = 250
        }, 
        [3] = {
            Name = "Charge3", 
            DisplayTitle = "1 Round \240\159\146\165", 
            Quality = 14, 
            Type = "Knockdowns", 
            Amount = 500
        }
    }, 
    SpecialInfo = {
        Name = "Stampede", 
        Type = "Combo", 
        Cooldown = 9.5, 
        IsMeter = true
    }, 
    CoreInfo = {
        WalkSpeed = 8, 
        Health = 100, 
        HealthRecoveryTime = 1, 
        HealthRecoverySpeed = 0.15, 
        Stamina = 100, 
        DashRecoveryTime = 0.5, 
        StaminaRecoveryTime = 0.9, 
        StaminaRecoverySpeed = 6.6, 
        StaminaBreakAnimId = 13633645648, 
        StaminaBreakTime = 1.3666666666666667, 
        BlockEnergy = 50, 
        BlockPercent = 70, 
        BlockDebounce = 0.3, 
        BlockBreakTime = 1.6666666666666667, 
        BlockRecoveryTime = 1.5, 
        BlockRecoverySpeed = 0.35, 
        BlockingWalkSpeed = 5, 
        UltimateHitMult = 0.3, 
        UltimateHurtMult = 0.5
    }, 
    Combos = {}, 
    DefaultMoverInfo = {
        Responsiveness = 75, 
        MaxDistance = 0.8, 
        Velocity = 20, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 10, 
        Damage = 1.9, 
        Recover = 100, 
        BreakRecover = 0.075, 
        MeterCharge = 5.459999999999999, 
        Startup = 0.2, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.8333333333333334, 
        StunTime = 0.9, 
        MoveDelay = 0.25, 
        AnimSpeed = 1, 
        FadeIn = 0.1, 
        HitSound = "Hit1", 
        KnockbackInfo = {
            Distance = 1, 
            TargetTime = 0.2, 
            HitIndex = 1
        }, 
        ShakeInfo = {
            Preset = "LightHit", 
            FoV = 69
        }
    }
};
v0.Combos[1] = {
    [1] = {
        AnimId = 16040690802, 
        Stamina = 20, 
        Damage = 4.2, 
        MeterCharge = 10.919999999999998, 
        AnimSpeed = 0.98, 
        BreakRecover = 0.3, 
        Startup = 0.36666666666666664, 
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
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3, 
            HoldTime = 0.2, 
            TimeScale = 0.9
        }, 
        SlowMoInfo = {
            Direction = "Right"
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 68
        }
    }, 
    [2] = {
        AnimId = 16032143337, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 16031906485, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 16032143337, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 16031906485, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 16037707451, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 16038856772, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }
};
v0.Combos[2] = {
    [1] = {
        AnimId = 16040900599, 
        Stamina = 20, 
        Damage = 4.2, 
        MeterCharge = 10.919999999999998, 
        AnimSpeed = 0.92, 
        BreakRecover = 0.3, 
        Startup = 0.36666666666666664, 
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
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.3, 
            HoldTime = 0.2, 
            TimeScale = 0.9
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 68
        }
    }, 
    [2] = {
        AnimId = 16038856772, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 16037707451, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 16031906485, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 16032143337, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }
};
v0.Combos[99] = {
    ComboResetTime = 0.6333333333333334, 
    [1] = {
        CooldownSettings = {
            Slowdown = 0.8, 
            HoldTime = 0.7
        }, 
        MeterCharge = 0, 
        AnimId = 16056237292, 
        Stamina = 33, 
        Damage = 5, 
        AnimSpeed = 1, 
        BreakRecover = 0.3, 
        Startup = 0.44166666666666665, 
        TrackTime = 0.2, 
        MinTime = 0, 
        MaxTime = 1.0833333333333333, 
        MoveDelay = 0.25, 
        HitSound = "Headbutt", 
        SetSlowDown = 0.2, 
        SapStamina = 16.5, 
        NoFollowIfBlock = true, 
        BlockStunTime = 1.1666666666666667, 
        FollowHeadTime = 0.43333333333333335, 
        HitboxTrackTime = 0.2, 
        HitboxSize = Vector3.new(3, 1, 4, 0), 
        HitCFrameOffset = CFrame.new(0, -1, 0), 
        ExtraEffect = {
            Effect = "Charge", 
            EffectDelay = 0.1
        }, 
        MoverInfo = {
            MaxTime = 0.3333333333333333, 
            MaxDistance = 7.2, 
            Velocity = 100, 
            Responsiveness = 40, 
            ReplicateDelay = 0.36666666666666664
        }, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForwardHeavy"
        }, 
        ShakeInfo = {
            Preset = "HardHit", 
            FoV = 65, 
            WaitTime = 0.3, 
            Fade = 0.6
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [2] = {
        CooldownSettings = {
            Slowdown = 0.8, 
            HoldTime = 0.7
        }, 
        MeterCharge = 0, 
        AnimId = 16056853447, 
        HitCFrameOffset = CFrame.new(0, -1.6, 0), 
        HitSound = "BodyShot", 
        SetSlowDown = 0.2, 
        SapStamina = 3.5, 
        Stamina = 5, 
        Damage = 1, 
        Startup = 0.16666666666666669, 
        AnimSpeed = 1.2, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        CooldownSettings = {
            Slowdown = 0.8, 
            HoldTime = 0.7
        }, 
        MeterCharge = 0, 
        AnimId = 16056945915, 
        HitCFrameOffset = CFrame.new(0, -1.6, 0), 
        HitSound = "BodyShot", 
        SetSlowDown = 0.2, 
        SapStamina = 3.5, 
        Stamina = 5, 
        Damage = 1, 
        Startup = 0.16666666666666669, 
        AnimSpeed = 1.2, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }
};
v0.HeavyAttacks = {
    DefaultMoverInfo = {
        Responsiveness = 70, 
        MaxDistance = 2.7, 
        Velocity = 30, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 20, 
        Damage = 6, 
        MeterCharge = 10.919999999999998, 
        Recover = 0, 
        BreakRecover = 1, 
        Startup = 0.5, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0.8666666666666667, 
        MaxTime = 1, 
        StunTime = 0.5, 
        MoveDelay = 0.25, 
        AnimSpeed = 0.91, 
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
        AnimId = 16040680842, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "RightHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }
};
v0.DashInfo = {
    DefaultInfo = {
        FadeIn = 0.1, 
        AnimSpeed = 0.9, 
        Stamina = 10, 
        DashStartup = 0.05, 
        DashTime = 0.3, 
        StartWindow = 0, 
        DashWindow = 0.2, 
        MinTime = 0.2, 
        MaxTime = 0.43333333333333335, 
        DashDelay = 0.6333333333333333, 
        MaxDistance = 6, 
        Responsiveness = 25, 
        Velocity = 30
    }, 
    Forward = {
        AnimSpeed = 0.9, 
        AnimId = 13633646038, 
        DashTime = 0.26666666666666666, 
        MaxDistance = 7, 
        Responsiveness = 40, 
        Velocity = 70
    }, 
    Backward = {
        AnimId = 13633645960, 
        AnimSpeed = 0.85, 
        MinTime = 0.4, 
        MaxTime = 0.6666666666666666
    }, 
    Left = {
        AnimId = 13633645849
    }, 
    Right = {
        AnimId = 13633645781
    }
};
v0.UltimateInfo = {
    Effect = "Charge", 
    PreDelay = 1, 
    Time = 6.5, 
    Offset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.6), 
    DamageTimes = {
        {
            0.43333333333333335, 
            5
        }, 
        {
            1.2666666666666666, 
            10
        }, 
        {
            1.9833333333333334, 
            5
        }, 
        {
            2.216666666666667, 
            2
        }, 
        {
            2.5166666666666666, 
            2
        }, 
        {
            2.716666666666667, 
            2
        }, 
        {
            2.9166666666666665, 
            2
        }, 
        {
            3.1166666666666667, 
            2
        }, 
        {
            3.45, 
            2
        }, 
        {
            4, 
            1
        }, 
        {
            4.433333333333334, 
            1
        }, 
        {
            4.916666666666667, 
            1
        }, 
        {
            5.716666666666667, 
            15
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
v0.HitboxInfo = {
    Size = Vector3.new(3, 1, 2.799999952316284, 0)
};
v0.BlockAnimations = {
    IdleFade = 0.08333333333333333, 
    Idle = 13633646664, 
    Break = 13633646743, 
    Left = 13633646784, 
    Right = 13633646824, 
    Forward = 13633646884, 
    BodyLeft = 13633646937, 
    BodyRight = 13633646996, 
    BodyForward = 13633647037
};
v0.HitAnimations = {
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
v0.GetDash = function(_, v5, v6) --[[ Line: 807 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v0 (copy)
    local v7 = "Forward";
    local l_LookVector_0 = v5.CFrame.LookVector;
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    if v6.X < -0.5 or v6.X > 0.5 then
        v9 = l_RayHelper_0:GetCharactersExcept({
            v5.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v14, v15 = l_RayHelper_0:GetRayWithWhiteList(v5.CFrame.Position, v5.CFrame.Position + l_LookVector_0, v0.DashInfo.DefaultInfo.MaxDistance, v9);
        v10 = l_l_RayHelper_0_RayWithWhiteList_0;
        v11 = v14;
        v12 = v15;
    end;
    if v6.Z > 0.8 then
        return "None", l_LookVector_0;
    elseif v6.X < -0.5 then
        return "Left", (v5.CFrame.LookVector * (v10 and 0.4 or 1) + -v5.CFrame.RightVector * 0.3).Unit;
    else
        if v6.X > 0.5 then
            v7 = "Right";
            l_LookVector_0 = (v5.CFrame.LookVector * (v10 and 0.4 or 1) + v5.CFrame.RightVector * 0.3).Unit;
        end;
        return v7, l_LookVector_0;
    end;
end;
return v0;