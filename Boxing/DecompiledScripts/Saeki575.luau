local v0 = {
    Rarity = "Mythic", 
    ShortName = "HANDS LOW", 
    DisplayName = "Hands Low Style", 
    Description = "Fast, sharp, technical - but having your hands down is risky. Great dash, start speed, and slight counter bonus at the cost of taking more counter damage. Your ultimate deals less damage, but temporarily blinds your opponents. Ultimate: Blinding Rush", 
    Titles = {
        [1] = {
            Name = "Saeki1", 
            DisplayTitle = "Footwork \240\159\145\159", 
            Quality = 2, 
            Type = "Knockdowns", 
            Amount = 50
        }, 
        [2] = {
            Name = "Saeki2", 
            DisplayTitle = "Blinding Speed \240\159\145\165", 
            Quality = 4, 
            Type = "Knockdowns", 
            Amount = 250
        }, 
        [3] = {
            Name = "Saeki3", 
            DisplayTitle = "Speed Star \240\159\140\160", 
            Quality = 9, 
            Type = "Knockdowns", 
            Amount = 500
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
        StaminaRecoverySpeed = 6.1, 
        StaminaBreakAnimId = 13633645648, 
        StaminaBreakTime = 1.3666666666666667, 
        BlockEnergy = 43, 
        BlockPercent = 70, 
        BlockDebounce = 0.3, 
        BlockBreakTime = 1.6666666666666667, 
        BlockRecoveryTime = 1.5, 
        BlockRecoverySpeed = 0.35, 
        BlockingWalkSpeed = 5, 
        UltimateHitMult = 0.345, 
        UltimateHurtMult = 0.575, 
        CounterHurtMult = 1.15
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
        Damage = 1.15, 
        BlockDamage = 1.8, 
        Recover = 100, 
        BreakRecover = 0.075, 
        Startup = 0.16666666666666666, 
        TrackTime = 0.16666666666666666, 
        CounterMult = 3.55, 
        MinTime = 0, 
        MaxTime = 0.8333333333333334, 
        StunTime = 0.9, 
        MoveDelay = 0.25, 
        AnimSpeed = 1.2, 
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
        AnimId = 13992044377, 
        AnimSpeed = 0.95, 
        Stamina = 15, 
        Damage = 2.5, 
        BreakRecover = 0.3, 
        Startup = 0.3333333333333333, 
        TrackTime = 0.25, 
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
            TrailName = "Saeki", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
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
        AnimId = 13992264580, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 13992205894, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 13992158621, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 13992184577, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
            TargetPart = "RightHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 13992158621, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 13992165506, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
            TargetPart = "RightHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }
};
v0.Combos[2] = {
    [1] = {
        AnimId = 13992130995, 
        AnimSpeed = 0.95, 
        Stamina = 15, 
        Damage = 2.5, 
        BreakRecover = 0.3, 
        Startup = 0.3333333333333333, 
        TrackTime = 0.25, 
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
            TrailName = "Saeki", 
            TargetPart = "RightHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.9
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 68
        }
    }, 
    [2] = {
        AnimId = 13992184577, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
            TargetPart = "RightHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 13992158621, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 13992165506, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
            TargetPart = "RightHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 13992205894, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 13992264580, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 13992158621, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.1, 
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
        CounterMult = 2.5, 
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
        AnimId = 13992689531, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }, 
    [2] = {
        AnimId = 13992743441, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Saeki", 
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
        AnimSpeed = 1.1, 
        Stamina = 9, 
        DashStartup = 0.05, 
        DashTime = 0.3, 
        StartWindow = 0, 
        DashWindow = 0.175, 
        MinTime = 0.31666666666666665, 
        MaxTime = 0.31666666666666665, 
        DashDelay = 0.4666666666666667, 
        MaxDistance = 5.8, 
        Responsiveness = 25, 
        Velocity = 30
    }, 
    Forward = {
        AnimSpeed = 1.2, 
        AnimId = 13991816244
    }, 
    Backward = {
        AnimSpeed = 1.2, 
        AnimId = 13991562444, 
        MinTime = 0.31666666666666665, 
        MaxTime = 0.31666666666666665
    }, 
    Left = {
        AnimId = 13991877627
    }, 
    Right = {
        AnimId = 13991972357
    }
};
v0.UltimateInfo = {
    Effect = "Saeki", 
    PreDelay = 1, 
    Time = 10.166666666666666, 
    Offset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.7), 
    EyeDamageTime = 13, 
    DamageTimes = {
        {
            1.55, 
            2
        }, 
        {
            1.7833333333333334, 
            1
        }, 
        {
            2, 
            2
        }, 
        {
            2.8666666666666667, 
            4
        }, 
        {
            3.2, 
            4
        }, 
        {
            3.55, 
            4
        }, 
        {
            3.75, 
            4
        }, 
        {
            3.966666666666667, 
            4
        }, 
        {
            4.55, 
            5
        }, 
        {
            8.166666666666666, 
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
v0.HitboxInfo = {
    Size = Vector3.new(3, 1, 2.9000000953674316, 0)
};
v0.BlockAnimations = {
    IdleFade = 0.25, 
    Idle = 13998016343, 
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
v0.GetDash = function(_, v5, v6) --[[ Line: 706 ]] --[[ Name: GetDash ]]
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
        return "Left", (v5.CFrame.LookVector * (v10 and 0.8 or 0.3) + -v5.CFrame.RightVector * 0.9).Unit;
    else
        if v6.X > 0.5 then
            v7 = "Right";
            l_LookVector_0 = (v5.CFrame.LookVector * (v10 and 0.8 or 0.3) + v5.CFrame.RightVector * 0.9).Unit;
        end;
        return v7, l_LookVector_0;
    end;
end;
return v0;