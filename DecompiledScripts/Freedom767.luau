local v3 = {
    Rarity = "Legendary", 
    ShortName = "FREEDOM", 
    DisplayName = "Freedom Style", 
    Description = "You are not bound by a single style, since inside the ring, you are absolutely free. Unique Ability: you can swap between 3 different modes (Whirlwind, Flicker, Smash) that each have advantages and disadvantages. However, you are very fragile. Ultimate: Last Sun", 
    Titles = {
        [1] = {
            Name = "Freedom1", 
            DisplayTitle = "Carefree \240\159\141\140", 
            Quality = 5, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "Freedom2", 
            DisplayTitle = "Alpha (\206\177)", 
            Quality = 8, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "Freedom3", 
            DisplayTitle = "The Last Sun \226\152\128\239\184\143", 
            Quality = 13, 
            Type = "Knockdowns", 
            Amount = 750
        }
    }, 
    SpecialInfo = {
        Name = "Freedom", 
        Type = "Freedom", 
        IgnoreBlock = true, 
        SpecialCheck = function(v0) --[[ Line: 42 ]] --[[ Name: SpecialCheck ]]
            if v0.Occupied.Punching.Value then
                return false;
            else
                local _ = v0.Character;
                local v2 = v0.CurrentPunchId or 0;
                if tick() - v2 < 0.1 then
                    return;
                else
                    return true;
                end;
            end;
        end
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
        DamageTakenMult = 1.2, 
        DashSpamMult = 0.7, 
        CounterHurtMult = 0.8
    }, 
    Combos = {}, 
    DefaultMoverInfo = {
        Responsiveness = 75, 
        MaxDistance = 0.8, 
        Velocity = 20, 
        MaxTime = 0.65
    }, 
    DefaultPunchInfo = {
        Stamina = 9, 
        Damage = 1.712962962962963, 
        BlockDamage = 1.111111111111111, 
        Recover = 100, 
        BreakRecover = 0.075, 
        Startup = 0.2, 
        TrackTime = 0.16666666666666666, 
        CounterMult = 2, 
        MinTime = 0, 
        MaxTime = 0.8333333333333334, 
        StunTime = 0.9, 
        MoveDelay = 0.25, 
        AnimSpeed = 1.05, 
        FadeIn = 0.1, 
        HitSound = "Hit1", 
        KnockbackInfo = {
            Distance = 1, 
            TargetTime = 0.2, 
            HitIndex = 1
        }, 
        ShakeInfo = {
            Preset = "LightHit", 
            FoV = 68.5
        }
    }
};
v3.Combos[1] = {
    [1] = {
        AnimId = 15627015886, 
        AnimSpeed = 0.9, 
        Stamina = 20, 
        Damage = 3, 
        BreakRecover = 0.3, 
        Startup = 0.35, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.65, 
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
            TrailName = "Freedom", 
            TargetPart = "RightHand", 
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
        AnimId = 15627197326, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Freedom", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 15627354770, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Freedom", 
            TargetPart = "RightHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 15627336070, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Freedom", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 15627478074, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Freedom", 
            TargetPart = "RightHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 14536551653, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Freedom", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 15416196762, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Freedom", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }
};
v3.Combos[2] = {
    [1] = {
        AnimId = 15627785299, 
        AnimSpeed = 0.9, 
        Stamina = 20, 
        Damage = 3, 
        BreakRecover = 0.3, 
        Startup = 0.35, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.65, 
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
            TrailName = "Freedom", 
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
        AnimId = 15416196762, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Freedom", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }, 
    [3] = {
        AnimId = 15627336070, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Freedom", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 15627478074, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Freedom", 
            TargetPart = "RightHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 14536551653, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Kimura", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 15627197326, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Freedom", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 15627478074, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Freedom", 
            TargetPart = "RightHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }
};
v3.HeavyAttacks = {
    DefaultMoverInfo = {
        Responsiveness = 70, 
        MaxDistance = 2.7, 
        Velocity = 30, 
        MaxTime = 0.65
    }, 
    DefaultPunchInfo = {
        Stamina = 20, 
        Damage = 5, 
        Recover = 0, 
        BreakRecover = 1, 
        CounterMult = 1.5, 
        Startup = 0.5, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0.8666666666666667, 
        MaxTime = 1, 
        StunTime = 0.5, 
        MoveDelay = 0.25, 
        AnimSpeed = 0.96, 
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
        AnimId = 15627933832, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Freedom", 
            TargetPart = "RightHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }
};
v3.UltimateInfo = {
    Effect = "Freedom", 
    PreDelay = 1, 
    Time = 12.833333333333334, 
    Offset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5), 
    DamageTimes = {
        {
            1.8833333333333333, 
            10
        }, 
        {
            3.6, 
            10
        }, 
        {
            4.633333333333334, 
            2
        }, 
        {
            5.433333333333334, 
            1
        }, 
        {
            5.533333333333333, 
            1
        }, 
        {
            5.733333333333333, 
            1
        }, 
        {
            5.933333333333334, 
            1
        }, 
        {
            6.133333333333334, 
            1
        }, 
        {
            6.333333333333333, 
            1
        }, 
        {
            6.566666666666666, 
            2
        }, 
        {
            10.6, 
            10
        }, 
        {
            11.466666666666667, 
            10
        }
    }, 
    DefaultMoverInfo = {
        Responsiveness = 70, 
        MaxDistance = 2.7, 
        Velocity = 30, 
        MaxTime = 0.65
    }, 
    DefaultPunchInfo = {
        Stamina = 20, 
        Damage = 1.2, 
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
v3.HitboxInfo = {
    Size = Vector3.new(3, 1, 2.9000000953674316, 0)
};
v3.BlockAnimations = {
    IdleFade = 0.3333333333333333, 
    Idle = 15628014026, 
    Break = 13633646743, 
    Left = 13633646784, 
    Right = 13633646824, 
    Forward = 13633646884, 
    BodyLeft = 13633646937, 
    BodyRight = 13633646996, 
    BodyForward = 13633647037
};
v3.HitAnimations = {
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
v3.DashInfo = {
    DefaultInfo = {
        FadeIn = 0.1, 
        AnimSpeed = 1.2, 
        Stamina = 9, 
        DashStartup = 0.05, 
        DashTime = 0.23333333333333334, 
        StartWindow = 0, 
        DashWindow = 0.16666666666666666, 
        MinTime = 0.31666666666666665, 
        MaxTime = 0.31666666666666665, 
        DashDelay = 0.4166666666666667, 
        MaxDistance = 7, 
        Responsiveness = 25, 
        Velocity = 42
    }, 
    Forward = {
        AnimSpeed = 1.25, 
        AnimId = 13991816244
    }, 
    Standing = {
        AnimSpeed = 1.04, 
        AnimId = 15629606706, 
        Responsiveness = 0, 
        UseForSlowMo = true, 
        MaxDistance = 0, 
        DashStartup = 0, 
        DashTime = 0.16666666666666666, 
        DashWindow = 0.23333333333333334, 
        AttackTime = 0.2, 
        DashDelay = 0.7666666666666667, 
        MinTime = 0.23333333333333334, 
        MaxTime = 0.36666666666666664, 
        StopInfo = {
            StopDelay = 0.6666666666666666, 
            StopTime = 0.25, 
            Weight = 1
        }
    }, 
    Backward = {
        AnimSpeed = 0.9, 
        AnimId = 15626456275, 
        MinTime = 0.3, 
        MaxTime = 0.3
    }, 
    Left = {
        AnimId = 15626688240, 
        MaxDistance = 9.5, 
        MinDistance = 6
    }, 
    Right = {
        AnimId = 15626728563, 
        MaxDistance = 9.5, 
        MinDistance = 6
    }
};
local _ = game:GetService("Workspace");
local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
v3.GetDash = function(_, v8, v9) --[[ Line: 754 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v3 (copy)
    local v10 = "Forward";
    local l_LookVector_0 = v8.CFrame.LookVector;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    if v9.X < -0.5 or v9.X > 0.5 then
        v12 = l_RayHelper_0:GetCharactersExcept({
            v8.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v17, v18 = l_RayHelper_0:GetRayWithWhiteList(v8.CFrame.Position, v8.CFrame.Position + l_LookVector_0, v3.DashInfo.DefaultInfo.MaxDistance, v12);
        v13 = l_l_RayHelper_0_RayWithWhiteList_0;
        v14 = v17;
        v15 = v18;
    end;
    if v9 == Vector3.new() then
        return "Standing", -v8.CFrame.LookVector;
    elseif v9.Z > 0.8 then
        return "Backward", -v8.CFrame.LookVector;
    elseif v9.X < -0.5 then
        return "Left", (v8.CFrame.LookVector * (v13 and 0.8 or 0.3) + -v8.CFrame.RightVector * 0.9).Unit;
    else
        if v9.X > 0.5 then
            v10 = "Right";
            l_LookVector_0 = (v8.CFrame.LookVector * (v13 and 0.8 or 0.3) + v8.CFrame.RightVector * 0.9).Unit;
        end;
        return v10, l_LookVector_0;
    end;
end;
return v3;