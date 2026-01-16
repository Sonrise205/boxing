local v0 = {
    HiddenRarity = "Legendary", 
    ShortName = "GHOST (Ancient)", 
    DisplayName = "Ghost of the Past", 
    Description = "An ancient style that once ravaged the world, now tamed and wielded only be the Champion of all Champions. Extremum vitae spiritum edere.", 
    Titles = {
        [1] = {
            Name = "AncientGhost1", 
            DisplayTitle = "can i have prime ghost", 
            Quality = 10, 
            Type = "Knockdowns", 
            Amount = 999
        }, 
        [2] = {
            Name = "AncientGhost2", 
            DisplayTitle = "7Lackin", 
            Quality = 1, 
            Type = "Knockdowns", 
            Amount = 4999
        }, 
        [3] = {
            Name = "AncientGhost3", 
            DisplayTitle = "7Stackin", 
            Quality = 10, 
            Type = "Knockdowns", 
            Amount = 9999
        }
    }, 
    CoreInfo = {
        WalkSpeed = 10, 
        Health = 100, 
        HealthRecoveryTime = 1, 
        HealthRecoverySpeed = 0.15, 
        Stamina = 100, 
        DashRecoveryTime = 0.5, 
        StaminaRecoveryTime = 0.9, 
        StaminaRecoverySpeed = 6.6, 
        StaminaBreakAnimId = 13633645648, 
        StaminaBreakTime = 1.3666666666666667, 
        BlockEnergy = 43, 
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
        Damage = 1.85, 
        BlockDamage = 1.9, 
        MeterCharge = 5, 
        Recover = 100, 
        BreakRecover = 0.1, 
        Startup = 0.25, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.8333333333333334, 
        StunTime = 0.9, 
        MoveDelay = 0.25, 
        AnimSpeed = 1, 
        FadeIn = 0.1, 
        HitSound = "Hit1", 
        HitSoundSpeedMult = 1.2, 
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
        AnimId = 14460389379, 
        Stamina = 20, 
        Damage = 5, 
        BlockDamage = 5, 
        BreakRecover = 0.3, 
        AnimSpeed = 0.8666666666666667, 
        Startup = 0.25, 
        TrackTime = 0.16666666666666666, 
        VictimBlockDelay = 0.36666666666666664, 
        MinTime = 0, 
        MaxTime = 0.5, 
        MoveDelay = 0.2, 
        MoverInfo = {
            MaxDistance = 1, 
            Velocity = 30, 
            Responsiveness = 70
        }, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "LeftHand", 
            DelayTime = 0, 
            HoldTime = 0, 
            TimeScale = 1
        }, 
        SlowMoInfo = {
            Direction = "Left"
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 65
        }, 
        ExtraEffect = {
            Effect = "GhostJab", 
            EffectDelay = 0.25
        }, 
        HideStartup = true, 
        NoFollowIfBlock = true, 
        HitSound = "GhostJab", 
        HitSoundSpeedMult = 1.5, 
        BlockStunTime = 0.3333333333333333
    }, 
    [2] = {
        AnimId = 13657224763, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "LeftHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 13905208500, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.85
        }
    }, 
    [4] = {
        AnimId = 13905183614, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }, 
    [5] = {
        AnimId = 13664787070, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "LeftHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 13633646409, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 13633649251, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }
};
v0.Combos[2] = {
    [1] = {
        AnimId = 14460389379, 
        Stamina = 20, 
        Damage = 5, 
        BlockDamage = 5, 
        BreakRecover = 0.3, 
        AnimSpeed = 0.8666666666666667, 
        Startup = 0.25, 
        TrackTime = 0.16666666666666666, 
        VictimBlockDelay = 0.36666666666666664, 
        MinTime = 0, 
        MaxTime = 0.5, 
        MoveDelay = 0.2, 
        MoverInfo = {
            MaxDistance = 1, 
            Velocity = 30, 
            Responsiveness = 70
        }, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "LeftHand", 
            DelayTime = 0, 
            HoldTime = 0, 
            TimeScale = 1
        }, 
        SlowMoInfo = {
            Direction = "Left"
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 65
        }, 
        ExtraEffect = {
            Effect = "GhostJab", 
            EffectDelay = 0.25
        }, 
        HideStartup = true, 
        NoFollowIfBlock = true, 
        HitSound = "GhostJab", 
        HitSoundSpeedMult = 1.5, 
        BlockStunTime = 0.3333333333333333
    }, 
    [2] = {
        AnimId = 13633646345, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 13633646409, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 13664867636, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "RightHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 13905183614, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }, 
    [6] = {
        AnimId = 13657224763, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "LeftHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 13661831408, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "RightHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [8] = {
        AnimId = 13664787070, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "LeftHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }
};
v0.Combos[3] = {
    [1] = {
        AnimId = 14460389379, 
        Stamina = 20, 
        Damage = 5, 
        BlockDamage = 5, 
        BreakRecover = 0.3, 
        AnimSpeed = 0.8666666666666667, 
        Startup = 0.25, 
        TrackTime = 0.16666666666666666, 
        VictimBlockDelay = 0.36666666666666664, 
        MinTime = 0, 
        MaxTime = 0.5, 
        MoveDelay = 0.2, 
        MoverInfo = {
            MaxDistance = 1, 
            Velocity = 30, 
            Responsiveness = 70
        }, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "LeftHand", 
            DelayTime = 0, 
            HoldTime = 0, 
            TimeScale = 1
        }, 
        SlowMoInfo = {
            Direction = "Left"
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 65
        }, 
        ExtraEffect = {
            Effect = "GhostJab", 
            EffectDelay = 0.25
        }, 
        HideStartup = true, 
        NoFollowIfBlock = true, 
        HitSound = "GhostJab", 
        HitSoundSpeedMult = 1.5, 
        BlockStunTime = 0.3333333333333333
    }, 
    [2] = {
        AnimId = 13657224763, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "LeftHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 13664867636, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "RightHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 13905183614, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }, 
    [5] = {
        AnimId = 13664787070, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "LeftHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 13633646409, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 13633646345, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
            TargetPart = "RightHand", 
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
        Recover = 0, 
        BreakRecover = 1, 
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
            Distance = 0.6, 
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
        AnimId = 14489703113, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Ghost", 
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
        MaxTime = 0.43333333333333335, 
        DashDelay = 0.36666666666666664, 
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
    Effect = "Ghost", 
    PreDelay = 1, 
    Time = 12.75, 
    Offset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.75), 
    DamageTimes = {
        {
            1.0833333333333333, 
            5
        }, 
        {
            3.7666666666666666, 
            5
        }, 
        {
            6.9, 
            10
        }, 
        {
            10.65, 
            10
        }, 
        {
            11.433333333333334, 
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
        Damage = 1.5, 
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
        AnimId = 13633643492, 
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
    Size = Vector3.new(3, 1, 3.200000047683716, 0)
};
v0.BlockAnimations = {
    IdleFade = 0.25, 
    Idle = 14089271826, 
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
v0.GetDash = function(_, v5, v6) --[[ Line: 915 ]] --[[ Name: GetDash ]]
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
        return "Left", (v5.CFrame.LookVector * (v10 and 0.7 or 0.3) + -v5.CFrame.RightVector * 0.9).Unit;
    else
        if v6.X > 0.5 then
            v7 = "Right";
            l_LookVector_0 = (v5.CFrame.LookVector * (v10 and 0.7 or 0.3) + v5.CFrame.RightVector * 0.9).Unit;
        end;
        return v7, l_LookVector_0;
    end;
end;
return v0;