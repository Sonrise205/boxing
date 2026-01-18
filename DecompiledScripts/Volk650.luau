local v0 = {
    Rarity = "Mythic", 
    ShortName = "WOLF", 
    DisplayName = "Wolf Style", 
    Description = "A textbook style with no major downsides - and a unique ability. You can double up on your M2 to execute a White Fang, dealing extra damage and block break. Ultimate: True White Fang", 
    Titles = {
        [1] = {
            Name = "Volk1", 
            DisplayTitle = "Arctic \226\157\132\239\184\143", 
            Quality = 2, 
            Type = "Knockdowns", 
            Amount = 50
        }, 
        [2] = {
            Name = "Volk2", 
            DisplayTitle = "The Red Wolf \240\159\144\186", 
            Quality = 14, 
            Type = "Knockdowns", 
            Amount = 250
        }, 
        [3] = {
            Name = "Volk3", 
            DisplayTitle = "White Fang \226\152\132\239\184\143", 
            Quality = 9, 
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
        Damage = 2, 
        Recover = 100, 
        BreakRecover = 0.075, 
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
        AnimId = 14088900738, 
        Stamina = 20, 
        Damage = 2.5, 
        BreakRecover = 0.3, 
        Startup = 0.35, 
        TrackTime = 0.16666666666666666, 
        AnimSpeed = 0.89, 
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
            TrailName = "Volk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 0.15, 
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
        AnimId = 13905183614, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Volk", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }, 
    [3] = {
        AnimId = 13633649308, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Volk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 13905208500, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Volk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
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
            TrailName = "Volk", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 13633649251, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Volk", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 13633646409, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Volk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }
};
v0.Combos[2] = {
    [1] = {
        AnimId = 14088986033, 
        Stamina = 20, 
        Damage = 2.5, 
        BreakRecover = 0.3, 
        Startup = 0.35, 
        TrackTime = 0.16666666666666666, 
        AnimSpeed = 0.89, 
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
            TrailName = "Volk", 
            TargetPart = "RightHand", 
            DelayTime = 0.25, 
            HoldTime = 0.15, 
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
        AnimId = 13633649308, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Volk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
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
            TrailName = "Volk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 13633646345, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Volk", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 13633649251, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Volk", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 13905183614, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Volk", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }, 
    [7] = {
        AnimId = 13905208500, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Volk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
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
        Stamina = 15, 
        Damage = 5, 
        BlockDamage = 6, 
        Recover = 0, 
        BreakRecover = 0.7, 
        Startup = 0.4, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0.4, 
        MaxTime = 0.8333333333333334, 
        ResetHeavyTime = 0.9, 
        StunTime = 0.4166666666666667, 
        MoveDelay = 0.2, 
        AnimSpeed = 1.05, 
        FadeIn = 0.1, 
        HitSound = "Heavy1", 
        KnockbackInfo = {
            Distance = 1, 
            TargetTime = 0.2, 
            HitIndex = 1
        }, 
        ShakeInfo = {
            Preset = "HardHit", 
            WaitTime = 0.1, 
            Fade = 0.1, 
            FoVMult = 1.2, 
            FoV = 66
        }, 
        HeavyDebounce = 0.7
    }, 
    [1] = {
        AnimId = 14089766799, 
        IsComboType = true, 
        ExtraWhiffTime = 0.23, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        PDFrameReduction = 0.025, 
        IsWhiteFangStart = true, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Volk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.36666666666666664, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [2] = {
        AnimId = 14089858307, 
        BreakRecover = 1, 
        Damage = 4, 
        BlockDamage = 6, 
        AnimSpeed = 0.718562874251497, 
        IgnoreFoolishTime = true, 
        Startup = 0.2783333333333333, 
        TrackTime = 0.16666666666666666, 
        PDFrameReduction = 0.025, 
        MinTime = 0.75, 
        MaxTime = 0.75, 
        ExtraWhiffTime = 0.3, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "LeftHeavy"
        }, 
        HitSound = "WhiteFang", 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Volk", 
            TargetPart = "RightHand", 
            DelayTime = 0.26666666666666666, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.5
        }, 
        ShakeInfo = {
            Preset = "HardHit", 
            WaitTime = 0.2, 
            Fade = 0.4, 
            FoVMult = 1.5, 
            FoV = 64
        }
    }
};
v0.DashInfo = {
    DefaultInfo = {
        FadeIn = 0.1, 
        AnimSpeed = 0.9, 
        Stamina = 14, 
        DashStartup = 0.05, 
        DashTime = 0.3, 
        StartWindow = 0, 
        DashWindow = 0.2, 
        MinTime = 0.2, 
        MaxTime = 0.43333333333333335, 
        DashDelay = 0.5333333333333333, 
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
    Effect = "Volk", 
    PreDelay = 1, 
    Time = 7.566666666666666, 
    Offset = CFrame.new(0, 0, 0.01), 
    EndOffset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5), 
    DamageTimes = {
        {
            1.4333333333333333, 
            5
        }, 
        {
            1.9666666666666666, 
            5
        }, 
        {
            2.2, 
            10
        }, 
        {
            3, 
            15
        }, 
        {
            4.466666666666667, 
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
    IdleFade = 0.13333333333333333, 
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
v0.GetDash = function(_, v5, v6) --[[ Line: 748 ]] --[[ Name: GetDash ]]
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