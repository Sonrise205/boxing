local _ = game:GetService("RunService");
local _ = game:GetService("Players");
local v2 = {
    Rarity = "Legendary", 
    ShortName = "WHITE ASH", 
    DisplayName = "White Ash Style", 
    Description = "Your soul is unconquerable, and you only grow stronger with every down you take. Ability: Burn - landing counters allows you to sacrifice your own health and block in order to become even stronger. The longer you Burn, the slower and weaker your opponent gets. Ultimate: Cross Counter", 
    Titles = {
        [1] = {
            Name = "Joe1", 
            DisplayTitle = "Messenger from Hell \226\155\169\239\184\143", 
            Quality = 14, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "Joe2", 
            DisplayTitle = "Never the Champion \240\159\143\134", 
            Quality = 13, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "Joe3", 
            DisplayTitle = "Pure White Ash \240\159\148\165", 
            Quality = 16, 
            Type = "Knockdowns", 
            Amount = 750
        }
    }
};
local _ = {};
v2.SpecialInfo = {
    Name = "Burn", 
    Type = "Joe", 
    IgnoreSound = true, 
    SpecialCheck = function(v4) --[[ Line: 53 ]] --[[ Name: SpecialCheck ]]
        local l_CharacterData_0 = v4.CharacterData;
        local l_Character_0 = v4.Character;
        if l_CharacterData_0.Cutscene.Value then
            return false;
        elseif l_Character_0:GetAttribute("SlowMo") then
            return;
        else
            return true;
        end;
    end
};
v2.QTEInfo = {
    GamepadTime = 1.3, 
    MobileTime = 1.3, 
    PCTime = 1.3
};
v2.CoreInfo = {
    WalkSpeed = 9.25, 
    ExtraKnockdown = true, 
    Health = 100, 
    HealthRecoveryTime = 1, 
    HealthRecoverySpeed = 0.15, 
    Stamina = 100, 
    DashRecoveryTime = 0.5, 
    StaminaRecoveryTime = 0.9, 
    StaminaRecoverySpeed = 6.1, 
    StaminaBreakAnimId = 13633645648, 
    StaminaBreakTime = 1.3666666666666667, 
    BlockEnergy = 50, 
    BlockPercent = 70, 
    BlockDebounce = 0.3, 
    BlockBreakTime = 1.6666666666666667, 
    BlockRecoveryTime = 1.5, 
    BlockRecoverySpeed = 0.35, 
    BlockingWalkSpeed = 5, 
    UltimateHitMult = 0.9, 
    UltimateHurtMult = 0.5, 
    AbilityDelay = 0.5, 
    StartAbilityEnergy = 0, 
    DamageTakenMult = 1.4285714285714286, 
    UltDamageTakenMult = 1.4285714285714286, 
    DualExchangeWindowMult = 1.5, 
    CounterHurtMult = 0.76, 
    GotCounteredMultAdd = 8, 
    MaxKnockdowns = 4, 
    HasDizzyIdle = true
};
v2.Combos = {};
v2.DefaultMoverInfo = {
    Responsiveness = 75, 
    MaxDistance = 0.8, 
    Velocity = 20, 
    MaxTime = 0.6666666666666666
};
v2.DefaultPunchInfo = {
    Stamina = 10, 
    Damage = 1.8, 
    BlockDamage = 1.8, 
    BonusDamagePerStock = 0.115, 
    CounterMultAdd = 16.666666666666668, 
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
        FoV = 67
    }
};
v2.Combos[1] = {
    [1] = {
        AnimId = 131226878949233, 
        AnimSpeed = 0.9130434782608695, 
        Stamina = 12, 
        Damage = 4, 
        BreakRecover = 0.25, 
        Startup = 0.35, 
        TrackTime = 0.25, 
        MinTime = 0.31666666666666665, 
        MaxTime = 0.6666666666666666, 
        MoveDelay = 0.25, 
        MoverInfo = {
            MaxDistance = 2.7, 
            Velocity = 30, 
            Responsiveness = 70
        }, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.6
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
        AnimId = 83082048682801, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "RightHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [3] = {
        AnimId = 74412533418186, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "LeftHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [4] = {
        AnimId = 103787612894134, 
        AnimSpeed = 1.25, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "RightHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [5] = {
        AnimId = 105409581488958, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "LeftHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [6] = {
        AnimId = 73444315793712, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "LeftHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [7] = {
        AnimId = 14536551653, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }
};
v2.Combos[2] = {
    [1] = {
        AnimId = 96325452826219, 
        AnimSpeed = 1, 
        Stamina = 12, 
        Damage = 4, 
        BreakRecover = 0.25, 
        Startup = 0.35, 
        TrackTime = 0.25, 
        MinTime = 0.31666666666666665, 
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
            TrailName = "Joe", 
            TargetPart = "RightHand", 
            DelayTime = 0.3, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.6
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
        AnimId = 73444315793712, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "LeftHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [3] = {
        AnimId = 14536551653, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 74412533418186, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "LeftHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [5] = {
        AnimId = 140112535296827, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "RightHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [6] = {
        AnimId = 85605358705814, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "LeftHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [7] = {
        AnimId = 83025104143221, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "RightHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }
};
v2.Combos[3] = {
    [1] = {
        AnimId = 129055872518170, 
        AnimSpeed = 1, 
        Stamina = 12, 
        Damage = 4, 
        BreakRecover = 0.25, 
        Startup = 0.35, 
        TrackTime = 0.25, 
        MinTime = 0.31666666666666665, 
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
            TrailName = "Joe", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.6
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
        AnimId = 103787612894134, 
        AnimSpeed = 1.25, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "RightHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [3] = {
        AnimId = 83079150813379, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "LeftHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }
};
v2.HeavyAttacks = {
    DefaultMoverInfo = {
        Responsiveness = 70, 
        MaxDistance = 2.7, 
        Velocity = 30, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 20, 
        Damage = 6.5, 
        BonusDamagePerStock = 0.4, 
        CounterMultAdd = 20, 
        Recover = 0, 
        BreakRecover = 1, 
        Startup = 0.48333333333333334, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0.8666666666666667, 
        MaxTime = 1, 
        StunTime = 0.5, 
        MoveDelay = 0.25, 
        AnimSpeed = 0.9354838709677419, 
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
        AnimId = 81379025818158, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Joe", 
            TargetPart = "RightHand", 
            DelayTime = 0.38333333333333336, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 1
        }
    }
};
v2.DashInfo = {
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
v2.UltimateInfo = {
    IsCounter = true, 
    CounterDelay = 0.2, 
    HasJoeQTE = true, 
    SecretFailRequirement = 3, 
    RenderSameCFrame = 1, 
    IgnoreServerCollisions = true, 
    Effect = "Start-Up", 
    PreDelay = 1, 
    Time = 3.6666666666666665, 
    Offset = CFrame.new(0, 0, 0.01), 
    EndOffset = CFrame.new(0, 0, 3.5), 
    StartOffset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5), 
    DamageTimes = {
        {
            0, 
            0
        }
    }, 
    DefaultMoverInfo = {
        Responsiveness = 0, 
        MaxDistance = 0, 
        Velocity = 0, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 20, 
        Damage = 1, 
        Recover = 0, 
        BreakRecover = 1, 
        Startup = 1, 
        TrackTime = 0.16666666666666666, 
        MinTime = 1, 
        MaxTime = 1.1666666666666667, 
        StunTime = 0.5, 
        MoveDelay = 0, 
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
        AnimId = 104994432162446, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "UltimateTrail", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 1, 
            TimeScale = 1
        }
    }
};
v2.SuccessUltimateInfo = {
    Effect = "JoeSuccess", 
    PreDelay = 0, 
    Time = 7.5, 
    StartOffset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5), 
    Offset = CFrame.new(), 
    RenderSameCFrame = 0, 
    ReturnToStartCFrames = true, 
    IgnoreServerCollisions = true, 
    DamageTimes = {
        {
            1.9333333333333333, 
            25
        }
    }, 
    SelfDamageTimes = {
        {
            1.9333333333333333, 
            5
        }
    }
};
v2.FailedUltimateInfo = {
    Effect = "JoeFailed", 
    PreDelay = 0, 
    Time = 7.5, 
    StartOffset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5), 
    Offset = CFrame.new(), 
    RenderSameCFrame = 0, 
    ReturnToStartCFrames = true, 
    IgnoreServerCollisions = true, 
    DamageTimes = {
        {
            0, 
            15
        }
    }, 
    SelfDamageTimes = {
        {
            3.65, 
            10
        }, 
        {
            5.333333333333333, 
            10
        }
    }
};
v2.SecretUltimateInfo = {
    Effect = "Joe", 
    PreDelay = 1, 
    Time = 23.166666666666668, 
    Offset = CFrame.new(0, 0, 0.01), 
    EndOffset = CFrame.new(0, 0, 3.5), 
    StartOffset = CFrame.Angles(0, 3.141592653589793, 0), 
    RenderSameCFrame = 1, 
    ReturnToStartCFrames = true, 
    IgnoreServerCollisions = true, 
    DamageTimes = {
        {
            16.066666666666666, 
            10
        }, 
        {
            17.883333333333333, 
            25
        }, 
        {
            18.733333333333334, 
            10
        }, 
        {
            19.233333333333334, 
            10
        }, 
        {
            20.9, 
            25
        }
    }, 
    SelfDamageTimes = {
        {
            0.8333333333333334, 
            10
        }, 
        {
            7.45, 
            5
        }, 
        {
            8.05, 
            5
        }, 
        {
            9.616666666666667, 
            10
        }
    }
};
v2.HitboxInfo = {
    Size = Vector3.new(3, 1, 3, 0)
};
v2.BlockAnimations = {
    IdleFade = 0.25, 
    Idle = 83641791249831, 
    Break = 13633646743, 
    Left = 13633646784, 
    Right = 13633646824, 
    Forward = 13633646884, 
    BodyLeft = 13633646937, 
    BodyRight = 13633646996, 
    BodyForward = 13633647037
};
v2.HitAnimations = {
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
v2.GetDash = function(_, v11, v12) --[[ Line: 923 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v2 (copy)
    local v13 = "Forward";
    local l_LookVector_0 = v11.CFrame.LookVector;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    if v12.X < -0.5 or v12.X > 0.5 then
        v15 = l_RayHelper_0:GetCharactersExcept({
            v11.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v20, v21 = l_RayHelper_0:GetRayWithWhiteList(v11.CFrame.Position, v11.CFrame.Position + l_LookVector_0, v2.DashInfo.DefaultInfo.MaxDistance, v15);
        v16 = l_l_RayHelper_0_RayWithWhiteList_0;
        v17 = v20;
        v18 = v21;
    end;
    if v12.Z > 0.8 then
        return "Backward", -v11.CFrame.LookVector;
    elseif v12.X < -0.5 then
        return "Left", (v11.CFrame.LookVector * (v16 and 0.7 or 0.5) + -v11.CFrame.RightVector * 0.5).Unit;
    else
        if v12.X > 0.5 then
            v13 = "Right";
            l_LookVector_0 = (v11.CFrame.LookVector * (v16 and 0.7 or 0.5) + v11.CFrame.RightVector * 0.5).Unit;
        end;
        return v13, l_LookVector_0;
    end;
end;
return v2;