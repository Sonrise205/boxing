local v4 = {
    Rarity = "Legendary", 
    ShortName = "SHOTGUN", 
    DisplayName = "Shotgun Style", 
    Description = "A prodigy known for your relentless, pinpoint jabs. You dominate the ring from a distance with your extraordinary speed and your signature barrage. Ability: Speed-o-Meter - Allows you to throw a one-handed barrage or enter Prodigy mode, which unlocks faster punches and the ability to throw a stronger two-handed barrage. Ultimate: Rhythm Hell.", 
    Titles = {
        [1] = {
            Name = "Shotgun1", 
            DisplayTitle = "Superstar \240\159\140\159", 
            Quality = 5, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "Shotgun2", 
            DisplayTitle = "The Prodigy \240\159\143\134", 
            Quality = 13, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "Shotgun3", 
            DisplayTitle = "Expired \240\159\165\128", 
            Quality = 14, 
            Type = "Knockdowns", 
            Amount = 750
        }, 
        [4] = {
            Name = "Shotgun3", 
            DisplayTitle = "Expired \240\159\165\128", 
            Quality = 14, 
            Type = "Knockdowns", 
            Amount = 750
        }
    }, 
    SpecialInfo = {
        Name = "Speed-o-Meter", 
        Type = "Shotgun", 
        Cooldown = 3, 
        MinStamina = 1, 
        IsMeter = true, 
        SpecialCheck = function(v0) --[[ Line: 53 ]] --[[ Name: SpecialCheck ]]
            local l_CharacterData_0 = v0.CharacterData;
            local l_Character_0 = v0.Character;
            local v3 = l_CharacterData_0.Cutscene.Value and not l_Character_0:GetAttribute("SlowMo");
            if l_CharacterData_0.Stunned.Value or v3 then
                return false;
            else
                return true;
            end;
        end
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
        BlockEnergy = 43, 
        BlockPercent = 70, 
        BlockDebounce = 0.3, 
        BlockBreakTime = 1.6666666666666667, 
        BlockRecoveryTime = 1.5, 
        BlockRecoverySpeed = 0.35, 
        BlockingWalkSpeed = 5, 
        UltimateHitMult = 0.3, 
        UltimateHurtMult = 0.5, 
        CounterHurtMult = 1.2, 
        IgnoreEnergy = true
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
        Damage = 1.7, 
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
        }, 
        ThrownCharge = 6.005999999999999
    }
};
v4.Combos[1] = {
    [1] = {
        ThrownCharge = 12.011999999999999, 
        AnimId = 15443949271, 
        Stamina = 20, 
        Damage = 3, 
        BreakRecover = 0.3, 
        Startup = 0.3333333333333333, 
        TrackTime = 0.16666666666666666, 
        AnimSpeed = 1.15, 
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
            TrailName = "Shotgun", 
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
        AnimId = 15443969659, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Shotgun", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }, 
    [3] = {
        AnimId = 15416196762, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Shotgun", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }, 
    [4] = {
        AnimId = 15443969659, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Shotgun", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
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
            TrailName = "Shotgun", 
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
            TrailName = "Shotgun", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.85
        }
    }, 
    [7] = {
        AnimId = 13633649308, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Shotgun", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }
};
v4.Combos[2] = {
    [1] = {
        ThrownCharge = 12.011999999999999, 
        AnimId = 15416041119, 
        Stamina = 20, 
        Damage = 3, 
        BreakRecover = 0.3, 
        Startup = 0.3333333333333333, 
        TrackTime = 0.16666666666666666, 
        AnimSpeed = 1.15, 
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
            TrailName = "Shotgun", 
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
        AnimId = 15443969659, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Shotgun", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }, 
    [3] = {
        AnimId = 13905183614, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Shotgun", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }, 
    [4] = {
        AnimId = 15443969659, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Shotgun", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }, 
    [5] = {
        AnimId = 15416196762, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Shotgun", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }
};
v4.HeavyAttacks = {
    DefaultMoverInfo = {
        Responsiveness = 70, 
        MaxDistance = 2.7, 
        Velocity = 30, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 20, 
        Damage = 6, 
        BlockDamage = 7, 
        Recover = 0, 
        BreakRecover = 1, 
        Startup = 0.4666666666666667, 
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
        ThrownCharge = 12.011999999999999, 
        AnimId = 92087279601177, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Shotgun", 
            TargetPart = "RightHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.25, 
            TimeScale = 1
        }, 
        AnimSpeed = 0.9285714285714286
    }
};
v4.DashInfo = {
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
        AnimId = 15415708390, 
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
v4.UltimateInfo = {
    Effect = "Shotgun", 
    PreDelay = 1, 
    Time = 15.833333333333334, 
    Offset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5), 
    DamageTimes = {
        {
            1.9166666666666667, 
            10
        }, 
        {
            3.4166666666666665, 
            1.5
        }, 
        {
            3.55, 
            1.5
        }, 
        {
            3.683333333333333, 
            1.5
        }, 
        {
            3.816666666666667, 
            1.5
        }, 
        {
            3.95, 
            1.5
        }, 
        {
            4.083333333333333, 
            1.5
        }, 
        {
            4.216666666666667, 
            1.5
        }, 
        {
            4.35, 
            1.5
        }, 
        {
            4.483333333333333, 
            1.5
        }, 
        {
            4.616666666666666, 
            1.5
        }, 
        {
            4.75, 
            1.5
        }, 
        {
            4.883333333333334, 
            1.5
        }, 
        {
            5.016666666666667, 
            1.5
        }, 
        {
            5.15, 
            1.5
        }, 
        {
            5.283333333333333, 
            1.5
        }, 
        {
            5.416666666666667, 
            1.5
        }, 
        {
            5.55, 
            1.5
        }, 
        {
            5.683333333333334, 
            1.5
        }, 
        {
            5.816666666666666, 
            1.5
        }, 
        {
            5.916666666666667, 
            1.5
        }, 
        {
            8.5, 
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
v4.HitboxInfo = {
    Size = Vector3.new(3, 1, 2.9000000953674316, 0)
};
v4.BlockAnimations = {
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
v4.HitAnimations = {
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
v4.GetDash = function(_, v9, v10) --[[ Line: 715 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v4 (copy)
    local v11 = "Forward";
    local l_LookVector_0 = v9.CFrame.LookVector;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    if v10.X < -0.5 or v10.X > 0.5 then
        v13 = l_RayHelper_0:GetCharactersExcept({
            v9.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v18, v19 = l_RayHelper_0:GetRayWithWhiteList(v9.CFrame.Position, v9.CFrame.Position + l_LookVector_0, v4.DashInfo.DefaultInfo.MaxDistance, v13);
        v14 = l_l_RayHelper_0_RayWithWhiteList_0;
        v15 = v18;
        v16 = v19;
    end;
    if v10.Z > 0.8 then
        return "Backward", -v9.CFrame.LookVector;
    elseif v10.X < -0.5 then
        return "Left", (v9.CFrame.LookVector * (v14 and 0.4 or 1) + -v9.CFrame.RightVector * 0.5).Unit;
    else
        if v10.X > 0.5 then
            v11 = "Right";
            l_LookVector_0 = (v9.CFrame.LookVector * (v14 and 0.4 or 1) + v9.CFrame.RightVector * 0.5).Unit;
        end;
        return v11, l_LookVector_0;
    end;
end;
return v4;