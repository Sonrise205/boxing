local v0 = {
    Rarity = "Mythic", 
    ShortName = "IPPO", 
    DisplayName = "Ippo Style", 
    Description = "An in-fighter that never backs down. Ability: Dempsey Roll - you can use your ability repeatedly to dodge and advance with each time you press it. Once it's charged up, you can unload a flurry of hooks. Ultimate: Tiger Crusher", 
    Titles = {
        [1] = {
            Name = "Ippo1", 
            DisplayTitle = "Understar \226\173\144", 
            Quality = 5, 
            Type = "Knockdowns", 
            Amount = 50
        }, 
        [2] = {
            Name = "Ippo2", 
            DisplayTitle = "The Challenger \240\159\146\168", 
            Quality = 8, 
            Type = "Knockdowns", 
            Amount = 250
        }, 
        [3] = {
            Name = "Ippo3", 
            DisplayTitle = "Inner Light \240\159\148\165", 
            Quality = 10, 
            Type = "Knockdowns", 
            Amount = 500
        }
    }
};
local l_Workspace_0 = game:GetService("Workspace");
local l_Events_0 = game:GetService("ReplicatedStorage"):WaitForChild("Events");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
v0.SpecialInfo = {
    Name = "Dempsey", 
    Type = "Ippo", 
    Cooldown = 5, 
    IsMeter = true, 
    IgnoreIds = true, 
    IgnoreSound = true, 
    Use = function() --[[ Line: 50 ]] --[[ Name: Use ]]
        -- upvalues: l_Events_0 (copy), l_LocalPlayer_0 (copy), l_Workspace_0 (copy)
        l_Events_0.ForceDash:Fire({
            Direction = "Dempsey"
        });
        local l_Character_0 = l_LocalPlayer_0.Character;
        if not l_Character_0 then
            return;
        else
            local l_FirstChild_0 = l_Workspace_0.States:FindFirstChild(l_Character_0.Name);
            local v6 = l_FirstChild_0 and l_FirstChild_0:FindFirstChild("CharacterData");
            if not v6 then
                return;
            else
                v6.AbilityEnergy.Value = 100;
                return;
            end;
        end;
    end
};
v0.CoreInfo = {
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
    UltimateHitMult = 0.3, 
    UltimateHurtMult = 0.5
};
v0.Combos = {};
v0.DefaultMoverInfo = {
    Responsiveness = 75, 
    MaxDistance = 0.8, 
    Velocity = 20, 
    MaxTime = 0.6666666666666666
};
v0.DefaultPunchInfo = {
    Stamina = 10, 
    Damage = 1.85, 
    Recover = 100, 
    BreakRecover = 0.075, 
    MeterCharge = 5, 
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
};
v0.Combos[1] = {
    [1] = {
        AnimId = 17344373052, 
        MeterCharge = 15, 
        Stamina = 20, 
        Damage = 4.2, 
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
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.9
        }, 
        SlowMoInfo = {
            Direction = "Left"
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 68
        }
    }, 
    [2] = {
        AnimId = 17344326434, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
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
        AnimId = 17344347047, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
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
v0.Combos[2] = {
    [1] = {
        AnimId = 17344358211, 
        MeterCharge = 15, 
        Stamina = 20, 
        Damage = 4.2, 
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
        AnimId = 17344272310, 
        HitInfo = {
            Direction = "Forward", 
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
        AnimId = 17344118247, 
        HitInfo = {
            Direction = "Forward", 
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
v0.Combos[3] = {
    [1] = {
        AnimId = 17344373052, 
        MeterCharge = 15, 
        Stamina = 20, 
        Damage = 4.2, 
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
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
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
        AnimId = 17344118247, 
        HitInfo = {
            Direction = "Forward", 
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
    [3] = {
        AnimId = 17344347047, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
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
        AnimId = 17344326434, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
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
        AnimId = 17344272310, 
        HitInfo = {
            Direction = "Forward", 
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
v0.Combos[92] = {
    [1] = {
        AnimId = 17363933081, 
        MeterCharge = 0, 
        Stamina = 6.5, 
        Damage = 4.056, 
        BreakRecover = 0.7, 
        Startup = 0.26666666666666666, 
        TrackTime = 0.16666666666666666, 
        AnimSpeed = 1.375, 
        MinTime = 0, 
        MaxTime = 0.6666666666666666, 
        MoveDelay = 0.25, 
        MoverInfo = {
            MaxDistance = 1.7, 
            Velocity = 30, 
            Responsiveness = 70
        }, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "LeftHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.9
        }, 
        SlowMoInfo = {
            Direction = "Left"
        }, 
        ShakeInfo = {
            Preset = "HardHit", 
            WaitTime = 0.15, 
            Fade = 0.3, 
            FoVMult = 1.5, 
            FoV = 65
        }, 
        HitSound = "Heavy1", 
        PlayHeavyLayer = true
    }, 
    [2] = {
        MoverInfo = {
            Responsiveness = 75, 
            MaxDistance = 0.3, 
            Velocity = 20, 
            MaxTime = 0.6666666666666666
        }, 
        AnimSpeed = 0.8823529411764706, 
        MeterCharge = 0, 
        Stamina = 6.5, 
        Damage = 1.6900000000000002, 
        BlockDamage = 1.4280500000000003, 
        BreakRecover = 0.325, 
        AnimId = 17363958693, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ShakeInfo = {
            Preset = "MediumHit", 
            FoV = 68.5
        }, 
        HitSound = "Heavy1", 
        PlayHeavyLayer = true
    }, 
    [3] = {
        MoverInfo = {
            Responsiveness = 75, 
            MaxDistance = 0.3, 
            Velocity = 20, 
            MaxTime = 0.6666666666666666
        }, 
        AnimSpeed = 0.8823529411764706, 
        MeterCharge = 0, 
        Stamina = 6.5, 
        Damage = 1.6900000000000002, 
        BlockDamage = 1.4280500000000003, 
        BreakRecover = 0.325, 
        AnimId = 17363886341, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ShakeInfo = {
            Preset = "MediumHit", 
            FoV = 68.5
        }, 
        HitSound = "Heavy1", 
        PlayHeavyLayer = true
    }
};
v0.Combos[93] = {
    [1] = {
        AnimId = 17363933081, 
        MeterCharge = 0, 
        Stamina = 6.5, 
        Damage = 4.647500000000001, 
        BreakRecover = 0.7, 
        Startup = 0.26666666666666666, 
        TrackTime = 0.16666666666666666, 
        AnimSpeed = 1.375, 
        MinTime = 0, 
        MaxTime = 0.6666666666666666, 
        MoveDelay = 0.25, 
        MoverInfo = {
            MaxDistance = 1.7, 
            Velocity = 30, 
            Responsiveness = 70
        }, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "LeftHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.9
        }, 
        SlowMoInfo = {
            Direction = "Left"
        }, 
        ShakeInfo = {
            Preset = "HardHit", 
            WaitTime = 0.15, 
            Fade = 0.3, 
            FoVMult = 1.5, 
            FoV = 65
        }, 
        HitSound = "Heavy1", 
        PlayHeavyLayer = true
    }, 
    [2] = {
        MoverInfo = {
            Responsiveness = 75, 
            MaxDistance = 0.3, 
            Velocity = 20, 
            MaxTime = 0.6666666666666666
        }, 
        Stamina = 6.5, 
        MeterCharge = 0, 
        Damage = 1.8590000000000004, 
        BlockDamage = 1.5708550000000006, 
        BreakRecover = 0.325, 
        AnimId = 17363958693, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ShakeInfo = {
            Preset = "MediumHit", 
            FoV = 68.5
        }, 
        HitSound = "Heavy1", 
        PlayHeavyLayer = true
    }, 
    [3] = {
        MoverInfo = {
            Responsiveness = 75, 
            MaxDistance = 0.3, 
            Velocity = 20, 
            MaxTime = 0.6666666666666666
        }, 
        Stamina = 6.5, 
        MeterCharge = 0, 
        Damage = 1.8590000000000004, 
        BlockDamage = 1.5708550000000006, 
        BreakRecover = 0.325, 
        AnimId = 17363886341, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ShakeInfo = {
            Preset = "MediumHit", 
            FoV = 68.5
        }, 
        HitSound = "Heavy1", 
        PlayHeavyLayer = true
    }, 
    [4] = {
        MoverInfo = {
            Responsiveness = 75, 
            MaxDistance = 0.3, 
            Velocity = 20, 
            MaxTime = 0.6666666666666666
        }, 
        Stamina = 6.5, 
        MeterCharge = 0, 
        Damage = 2.028, 
        BlockDamage = 1.7136600000000002, 
        BreakRecover = 0.325, 
        AnimId = 17363958693, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        ShakeInfo = {
            Preset = "MediumHit", 
            FoV = 68.5
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        HitSound = "Heavy1", 
        PlayHeavyLayer = true
    }, 
    [5] = {
        MoverInfo = {
            Responsiveness = 75, 
            MaxDistance = 0.3, 
            Velocity = 20, 
            MaxTime = 0.6666666666666666
        }, 
        Stamina = 6.5, 
        MeterCharge = 0, 
        Damage = 2.028, 
        BlockDamage = 1.7136600000000002, 
        BreakRecover = 0.325, 
        AnimId = 17363886341, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        ShakeInfo = {
            Preset = "MediumHit", 
            FoV = 68.5
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        HitSound = "Heavy1", 
        PlayHeavyLayer = true
    }, 
    [6] = {
        MoverInfo = {
            Responsiveness = 75, 
            MaxDistance = 0.3, 
            Velocity = 20, 
            MaxTime = 0.6666666666666666
        }, 
        Stamina = 6.5, 
        MeterCharge = 0, 
        Damage = 2.1970000000000005, 
        BlockDamage = 1.8564650000000007, 
        BreakRecover = 0.325, 
        AnimId = 17363958693, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        ShakeInfo = {
            Preset = "MediumHit", 
            FoV = 68.5
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        HitSound = "Heavy1", 
        PlayHeavyLayer = true
    }, 
    [7] = {
        MoverInfo = {
            Responsiveness = 75, 
            MaxDistance = 0.3, 
            Velocity = 20, 
            MaxTime = 0.6666666666666666
        }, 
        Stamina = 6.5, 
        MeterCharge = 0, 
        Damage = 2.1970000000000005, 
        BlockDamage = 1.8564650000000007, 
        BreakRecover = 0.325, 
        AnimId = 17363886341, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ShakeInfo = {
            Preset = "MediumHit", 
            FoV = 68.5
        }, 
        HitSound = "Heavy1", 
        PlayHeavyLayer = true
    }, 
    [8] = {
        MoverInfo = {
            Responsiveness = 75, 
            MaxDistance = 0.3, 
            Velocity = 20, 
            MaxTime = 0.6666666666666666
        }, 
        Stamina = 6.5, 
        MeterCharge = 0, 
        Damage = 2.366, 
        BlockDamage = 1.9992700000000003, 
        BreakRecover = 0.325, 
        AnimId = 17363958693, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ShakeInfo = {
            Preset = "MediumHit", 
            FoV = 68.5
        }, 
        HitSound = "Heavy1", 
        PlayHeavyLayer = true
    }, 
    [9] = {
        MoverInfo = {
            Responsiveness = 75, 
            MaxDistance = 0.3, 
            Velocity = 20, 
            MaxTime = 0.6666666666666666
        }, 
        Stamina = 6.5, 
        MeterCharge = 0, 
        Damage = 2.366, 
        BlockDamage = 1.9992700000000003, 
        BreakRecover = 0.325, 
        AnimId = 17363886341, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ShakeInfo = {
            Preset = "MediumHit", 
            FoV = 68.5
        }, 
        HitSound = "Heavy1", 
        PlayHeavyLayer = true
    }
};
v0.MaxUpdates = 3;
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
        Recover = 0, 
        BreakRecover = 1, 
        MeterCharge = 25, 
        Startup = 0.5, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0.8666666666666667, 
        MaxTime = 1, 
        StunTime = 0.5, 
        MoveDelay = 0.25, 
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
        AnimId = 17344284300, 
        AnimSpeed = 0.97, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }, 
    [2] = {
        AnimId = 17344307191, 
        AnimSpeed = 0.9, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
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
        DashWindow = 0.2, 
        MinTime = 0.2, 
        MaxTime = 0.36666666666666664, 
        DashDelay = 0.5, 
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
    Dempsey = {
        DashWindow = 0.20833333333333334, 
        DashDelay = 0, 
        MinTime = 0, 
        MaxTime = 0, 
        MaxDistance = 0, 
        Stamina = 2.5, 
        IgnoreDashSpamLevel = true, 
        IgnoreSound = true, 
        IgnoreEffects = true, 
        IgnoreAnimation = true
    }, 
    Left = {
        AnimId = 13633645849
    }, 
    Right = {
        AnimId = 13633645781
    }
};
v0.UltimateInfo = {
    Effect = "Ippo", 
    PreDelay = 1, 
    Time = 12.25, 
    Offset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.6), 
    DamageTimes = {
        {
            3, 
            10
        }, 
        {
            8, 
            5
        }, 
        {
            8.433333333333334, 
            5
        }, 
        {
            8.766666666666667, 
            5
        }, 
        {
            9.233333333333333, 
            5
        }, 
        {
            9.6, 
            5
        }, 
        {
            10.033333333333333, 
            5
        }, 
        {
            10.766666666666667, 
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
local l_Workspace_1 = game:GetService("Workspace");
local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
local v10 = 0;
TryDempsey = function() --[[ Line: 1231 ]] --[[ Name: TryDempsey ]]
    -- upvalues: l_Workspace_1 (copy), v10 (ref)
    local v11 = false;
    local l_Character_1 = game.Players.LocalPlayer.Character;
    local l_FirstChild_1 = game.Workspace.States:FindFirstChild(l_Character_1.Name);
    if not l_FirstChild_1 then
        return;
    else
        local l_Occupied_0 = l_FirstChild_1.Occupied;
        local l_CharacterData_0 = l_FirstChild_1.CharacterData;
        if l_CharacterData_0.Stamina.Value < 10 then
            return;
        else
            local l_l_Workspace_1_ServerTimeNow_0 = l_Workspace_1:GetServerTimeNow();
            local v17 = l_Character_1:GetAttribute("LastDamage") or 0;
            local v18 = l_Character_1:GetAttribute("LocalDashTime") or 0;
            local v19 = l_l_Workspace_1_ServerTimeNow_0 - v17;
            local v20 = l_l_Workspace_1_ServerTimeNow_0 - v18;
            if v19 < 0.35 or v20 < 0.35 or not l_Occupied_0.CanPunch.Value or l_CharacterData_0.Stunned.Value or l_Occupied_0.Stunned.Value or l_CharacterData_0.Cutscene.Value then
                return;
            elseif l_CharacterData_0.Blocking.Value or not l_Occupied_0.CanPunch.Value then
                return;
            elseif tick() - v10 < 0.133 then
                return;
            else
                v10 = tick();
                local _ = game:GetService("ReplicatedFirst");
                local v22;
                if game:GetService("RunService"):IsClient() then
                    v22 = shared.BridgeNet2;
                    if not v22 then
                        repeat
                            task.wait();
                        until shared.BridgeNet2;
                        v22 = shared.BridgeNet2;
                        v11 = v22;
                    else
                        v11 = true;
                    end;
                end;
                if not v11 then
                    if not v11 then
                        v22 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
                    end;
                end;
                v11 = false;
                v22.ReferenceBridge("TryAbility"):Fire("Dempsey");
                return true;
            end;
        end;
    end;
end;
v0.GetDash = function(_, v24, v25) --[[ Line: 1277 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v0 (copy)
    local v26 = "Forward";
    local l_LookVector_0 = v24.CFrame.LookVector;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    if v25.X < -0.5 or v25.X > 0.5 then
        v28 = l_RayHelper_0:GetCharactersExcept({
            v24.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v33, v34 = l_RayHelper_0:GetRayWithWhiteList(v24.CFrame.Position, v24.CFrame.Position + l_LookVector_0, v0.DashInfo.DefaultInfo.MaxDistance, v28);
        v29 = l_l_RayHelper_0_RayWithWhiteList_0;
        v30 = v33;
        v31 = v34;
    end;
    if v25.X < -0.5 then
        return "Left", (v24.CFrame.LookVector * (v29 and 0.4 or 1) + -v24.CFrame.RightVector * 0.5).Unit;
    else
        if v25.X > 0.5 then
            v26 = "Right";
            l_LookVector_0 = (v24.CFrame.LookVector * (v29 and 0.4 or 1) + v24.CFrame.RightVector * 0.5).Unit;
        end;
        return v26, l_LookVector_0;
    end;
end;
return v0;