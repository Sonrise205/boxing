local v0 = {
    Rarity = "Legendary", 
    ShortName = "IRON FIST", 
    DisplayName = "Iron Fist Style", 
    Description = "Nothing is a greater short-cut than hard work. Your hands were forged from hard training and deal MASSIVE damage and inflict slowing, but HURT you when you land them. On top of that, you take less damage when being countered while throwing your heavy punches. Ultimate: No Ribs Survived", 
    Titles = {
        [1] = {
            Name = "IronFist1", 
            DisplayTitle = "Prizefighter \240\159\146\176", 
            Quality = 5, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "IronFist2", 
            DisplayTitle = "Hope \240\159\149\138\239\184\143", 
            Quality = 0, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "IronFist3", 
            DisplayTitle = "Indomitable \240\159\140\170\239\184\143", 
            Quality = 12, 
            Type = "Knockdowns", 
            Amount = 750
        }
    }, 
    CoreInfo = {
        WalkSpeed = 9, 
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
        UltimateHitMult = 0.21, 
        UltimateHurtMult = 0.3, 
        HeavyCounterHurtMult = 0.35
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
        Damage = 2, 
        Recover = 100, 
        BreakRecover = 0.1, 
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
            FoV = 67
        }
    }
};
v0.Combos[1] = {
    [1] = {
        AnimId = 13633646543, 
        Stamina = 20, 
        Damage = 4, 
        BreakRecover = 0.3, 
        AnimSpeed = 0.9565217391304348, 
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
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "RightHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.9
        }, 
        SlowMoInfo = {
            Direction = "Left"
        }, 
        ShakeInfo = {
            Preset = "HardHit2", 
            FoV = 66
        }
    }, 
    [2] = {
        AnimId = 14536551653, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 15122177051, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "LeftHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "RightHand", 
            DelayTime = 0.2, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 13633649308, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 13633646345, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 15122177051, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "LeftHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "RightHand", 
            DelayTime = 0.2, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 15122219590, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "RightHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "LeftHand", 
            DelayTime = 0.2, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }, 
    [8] = {
        AnimId = 13664867636, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "RightHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }
};
v0.Combos[2] = {
    [1] = {
        AnimId = 13633646492, 
        Stamina = 20, 
        Damage = 4, 
        BreakRecover = 0.3, 
        AnimSpeed = 0.9565217391304348, 
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
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3, 
            HoldTime = 0.2, 
            TimeScale = 0.9
        }, 
        SlowMoInfo = {
            Direction = "Right"
        }, 
        ShakeInfo = {
            Preset = "HardHit2", 
            FoV = 66
        }
    }, 
    [2] = {
        AnimId = 15122177051, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "LeftHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "RightHand", 
            DelayTime = 0.2, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 15122219590, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "RightHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "LeftHand", 
            DelayTime = 0.2, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 13633649251, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 13633646409, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 13633646345, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 13657224763, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
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
        Stamina = 30, 
        Damage = 11, 
        BlockDamage = 7.5, 
        SelfDamage = 4, 
        Recover = 0, 
        BreakRecover = 1, 
        Startup = 0.55, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0.8666666666666667, 
        MaxTime = 1, 
        StunTime = 0.5, 
        MoveDelay = 0.25, 
        AnimSpeed = 1, 
        FadeIn = 0.1, 
        HitSound = "IronFist", 
        HeavyDebounce = 0.3, 
        KnockbackInfo = {
            Distance = 1, 
            TargetTime = 0.2, 
            HitIndex = 1
        }, 
        ShakeInfo = {
            Preset = "SuperHardHit", 
            WaitTime = 0.3, 
            Fade = 0.3, 
            FoVMult = 1.5, 
            FoV = 62
        }, 
        HitAnimSpeed = 0.9
    }, 
    [1] = {
        AnimId = 15113617054, 
        ExtraVictimHitEffect = {
            Effect = "IronFistLeft"
        }, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRightHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }, 
    [2] = {
        AnimId = 15120422666, 
        ExtraVictimHitEffect = {
            Effect = "IronFistRight"
        }, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "BodyLeftHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "RightHand", 
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
        DashWindow = 0.16666666666666666, 
        MinTime = 0.2, 
        MaxTime = 0.43333333333333335, 
        DashDelay = 0.7333333333333333, 
        MaxDistance = 6, 
        Responsiveness = 25, 
        Velocity = 30
    }, 
    Forward = {
        AnimSpeed = 0.9, 
        AnimId = 15365863137, 
        DashTime = 0.26666666666666666, 
        MaxDistance = 5.1, 
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
    Effect = "IronFist", 
    PreDelay = 1, 
    Time = 18.666666666666668, 
    Offset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.6), 
    DamageTimes = {
        {
            5.166666666666667, 
            15
        }, 
        {
            6.416666666666667, 
            20
        }, 
        {
            16.833333333333332, 
            20
        }, 
        {
            17.666666666666668, 
            20
        }
    }, 
    SelfDamageTimes = {
        {
            1.25, 
            15
        }, 
        {
            5.333333333333333, 
            5
        }, 
        {
            8.35, 
            10
        }, 
        {
            17, 
            10
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
    Size = Vector3.new(3, 1, 2.9000000953674316, 0)
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
v0.GetDash = function(_, v5, v6) --[[ Line: 743 ]] --[[ Name: GetDash ]]
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
        return "Backward", -v5.CFrame.LookVector;
    elseif v6.X < -0.5 then
        return "Left", (v5.CFrame.LookVector * (v10 and 0.4 or 1) + -v5.CFrame.RightVector * 0.5).Unit;
    else
        if v6.X > 0.5 then
            v7 = "Right";
            l_LookVector_0 = (v5.CFrame.LookVector * (v10 and 0.4 or 1) + v5.CFrame.RightVector * 0.5).Unit;
        end;
        return v7, l_LookVector_0;
    end;
end;
return v0;