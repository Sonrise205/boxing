local v0 = {
    Rarity = "Mythic", 
    ShortName = "BULLET", 
    DisplayName = "Bullet Style", 
    Description = "A combination of insane talent, arrogance, and absolutely killer instinct. Your heavy Thunderbolt attacks deal high counter damage, but your base damage and dash are weak. Special Ability: Attacking after an opponent dashes releases a bullet jab instantly. Ultimate: Cheating Combo", 
    Titles = {
        [1] = {
            Name = "Bullet1", 
            DisplayTitle = "Bloodthirsty \240\159\165\169", 
            Quality = 14, 
            Type = "Knockdowns", 
            Amount = 50
        }, 
        [2] = {
            Name = "Bullet2", 
            DisplayTitle = "The Owari Dragon \240\159\144\178", 
            Quality = 4, 
            Type = "Knockdowns", 
            Amount = 250
        }, 
        [3] = {
            Name = "Bullet3", 
            DisplayTitle = "The Deathblow Dragon \240\159\144\137", 
            Quality = 15, 
            Type = "Knockdowns", 
            Amount = 500
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
        UltimateHitMult = 0.3, 
        UltimateHurtMult = 0.5, 
        IgnoreStartPunchAfterDashTime = 0.42, 
        CounterHurtMult = 1.4
    }, 
    Combos = {}, 
    DefaultMoverInfo = {
        Responsiveness = 75, 
        MaxDistance = 0.8, 
        Velocity = 20, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 8.7, 
        Damage = 1.32, 
        BlockDamage = 1.32, 
        Recover = 100, 
        BreakRecover = 0.19, 
        CounterMult = 1.5, 
        Startup = 0.2, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.3333333333333333, 
        StunTime = 0.9, 
        MoveDelay = 0.25, 
        AnimSpeed = 1, 
        FadeIn = 0.1, 
        PlayHeavyLayer = true, 
        HitSound = "Bullet", 
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
        AnimId = 14839057752, 
        AnimSpeed = 1.0514285714285716, 
        Stamina = 20, 
        Damage = 4, 
        BreakRecover = 0.3, 
        Startup = 0.35, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.6666666666666666, 
        StunTime = 0.8, 
        MoveDelay = 0.25, 
        MoverInfo = {
            MaxDistance = 2.7, 
            Velocity = 30, 
            Responsiveness = 70
        }, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Bullet", 
            TargetPart = "LeftHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.9
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 68
        }, 
        HitSound = "Hit1"
    }, 
    [2] = {
        AnimId = 14831964198, 
        AnimSpeed = 0.8, 
        StunTime = 0.9, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Bullet", 
            TargetPart = "LeftHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ExtraEffect = {
            Effect = "BulletJab", 
            EffectDelay = 0.10833333333333334
        }
    }, 
    [3] = {
        AnimId = 14831987660, 
        AnimSpeed = 0.8, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Bullet", 
            TargetPart = "LeftHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ExtraEffect = {
            Effect = "BulletJab", 
            EffectDelay = 0.10833333333333334
        }
    }, 
    [4] = {
        AnimId = 14831994212, 
        AnimSpeed = 0.8, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Bullet", 
            TargetPart = "LeftHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }
};
v0.Combos[2] = {
    [1] = {
        AnimId = 14839295360, 
        AnimSpeed = 1.0514285714285716, 
        Stamina = 20, 
        Damage = 4, 
        BreakRecover = 0.3, 
        Startup = 0.35, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.6666666666666666, 
        StunTime = 0.8, 
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
            TrailName = "Bullet", 
            TargetPart = "RightHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.9
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 68
        }, 
        HitSound = "Hit1"
    }, 
    [2] = {
        AnimId = 14831964198, 
        AnimSpeed = 0.8, 
        StunTime = 0.9, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Bullet", 
            TargetPart = "LeftHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ExtraEffect = {
            Effect = "BulletJab", 
            EffectDelay = 0.10833333333333334
        }
    }, 
    [3] = {
        AnimId = 14831987660, 
        AnimSpeed = 0.8, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Bullet", 
            TargetPart = "LeftHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ExtraEffect = {
            Effect = "BulletJab", 
            EffectDelay = 0.10833333333333334
        }
    }, 
    [4] = {
        AnimId = 14831994212, 
        AnimSpeed = 0.8, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Bullet", 
            TargetPart = "LeftHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ExtraEffect = {
            Effect = "BulletJab", 
            EffectDelay = 0.10833333333333334
        }
    }
};
v0.Combos[99] = {
    [1] = {
        AnimId = 14831964198, 
        AnimSpeed = 1.1428571428571428, 
        Stamina = 20, 
        Damage = 4, 
        BreakRecover = 0.3, 
        Startup = 0.11666666666666667, 
        TrackTime = 0.16666666666666666, 
        StunTime = 0.7, 
        MinTime = 0, 
        MaxTime = 0.6666666666666666, 
        MoveDelay = 0.25, 
        MoverInfo = {
            Responsiveness = 75, 
            MaxDistance = 0.8, 
            Velocity = 20, 
            MaxTime = 0.3333333333333333
        }, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Bullet", 
            TargetPart = "LeftHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.9
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 68
        }, 
        HitSound = "Bullet", 
        ExtraEffect = {
            Effect = "BulletJab", 
            EffectDelay = 0.05
        }
    }, 
    [2] = {
        AnimId = 14831987660, 
        AnimSpeed = 0.8, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        MoverInfo = {
            Responsiveness = 75, 
            MaxDistance = 0.8, 
            Velocity = 20, 
            MaxTime = 0.3333333333333333
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Bullet", 
            TargetPart = "LeftHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ExtraEffect = {
            Effect = "BulletJab", 
            EffectDelay = 0.10833333333333334
        }
    }, 
    [3] = {
        AnimId = 14831994212, 
        AnimSpeed = 0.8, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Bullet", 
            TargetPart = "LeftHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ExtraEffect = {
            Effect = "BulletJab", 
            EffectDelay = 0.10833333333333334
        }
    }, 
    [4] = {
        AnimId = 14831964198, 
        AnimSpeed = 0.8, 
        StunTime = 0.9, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        MoverInfo = {
            Responsiveness = 75, 
            MaxDistance = 0.8, 
            Velocity = 20, 
            MaxTime = 0.3333333333333333
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Bullet", 
            TargetPart = "LeftHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }, 
        ExtraEffect = {
            Effect = "BulletJab", 
            EffectDelay = 0.10833333333333334
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
        Damage = 6.2, 
        CounterMult = 2.5, 
        Recover = 0, 
        BreakRecover = 1, 
        Startup = 0.48333333333333334, 
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
        }, 
        ExtraCounterEffect = "BulletCounter"
    }, 
    [1] = {
        AnimId = 14832580338, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "LeftHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Bullet", 
            TargetPart = "RightHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }, 
    [2] = {
        AnimId = 14833268348, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "RightHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Bullet", 
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
        Stamina = 12, 
        DashStartup = 0.05, 
        DashTime = 0.3, 
        StartWindow = 0, 
        DashWindow = 0.2, 
        MinTime = 0.25, 
        MaxTime = 0.4666666666666667, 
        DashDelay = 0.6666666666666666, 
        MaxDistance = 6, 
        Responsiveness = 25, 
        Velocity = 30
    }, 
    Forward = {
        AnimSpeed = 0.9, 
        AnimId = 13633646038, 
        MaxDistance = 6, 
        Responsiveness = 40, 
        Velocity = 70
    }, 
    Backward = {
        AnimId = 13633645960, 
        AnimSpeed = 0.85
    }, 
    Left = {
        AnimId = 13633645849
    }, 
    Right = {
        AnimId = 13633645781
    }
};
v0.UltimateInfo = {
    Effect = "Bullet", 
    PreDelay = 1, 
    Time = 11.166666666666666, 
    Offset = CFrame.new(0, 0, 0.01), 
    EndOffset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5), 
    DamageTimes = {
        {
            4.083333333333333, 
            10
        }, 
        {
            5.533333333333333, 
            1
        }, 
        {
            5.7, 
            2
        }, 
        {
            5.95, 
            2
        }, 
        {
            6.116666666666666, 
            2
        }, 
        {
            6.266666666666667, 
            2
        }, 
        {
            6.466666666666667, 
            2
        }, 
        {
            6.616666666666666, 
            2
        }, 
        {
            6.783333333333333, 
            2
        }, 
        {
            6.9, 
            2
        }, 
        {
            7.033333333333333, 
            2
        }, 
        {
            7.116666666666666, 
            2
        }, 
        {
            7.333333333333333, 
            2
        }, 
        {
            7.6, 
            2
        }, 
        {
            8.916666666666666, 
            5
        }, 
        {
            9.516666666666667, 
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
        AnimId = 13654532887, 
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
    Size = Vector3.new(3, 1, 3, 0)
};
v0.BlockAnimations = {
    IdleFade = 0.4166666666666667, 
    Idle = 13657073780, 
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
v0.GetDash = function(_, v5, v6) --[[ Line: 789 ]] --[[ Name: GetDash ]]
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