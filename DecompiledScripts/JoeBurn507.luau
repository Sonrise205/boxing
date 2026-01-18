local v0 = require(script.Parent);
deepcopy = function(v1, v2) --[[ Line: 3 ]] --[[ Name: deepcopy ]]
    v2 = v2 or {};
    local v3 = type(v1);
    local v4 = nil;
    if v3 == "table" then
        if v2[v1] then
            return v2[v1];
        else
            v4 = {};
            v2[v1] = v4;
            for v5, v6 in next, v1 do
                v4[deepcopy(v5, v2)] = deepcopy(v6, v2);
            end;
            setmetatable(v4, deepcopy(getmetatable(v1), v2));
            return v4;
        end;
    else
        return v1;
    end;
end;
local _ = game:GetService("RunService");
local _ = game:GetService("Players");
local v9 = {};
local _ = {};
v9.SpecialInfo = {
    Name = "Fade", 
    Type = "Joe", 
    Cooldown = 1, 
    IsMeter = false, 
    MinTimeSinceLastDamage = 0.35, 
    IgnoreStun = false
};
v9.WearoutInfo = {
    WearoutStartDelay = 1, 
    HealthDrainedForMaxWearout = 10, 
    MaxWearoutDashDistanceMult = 0.8, 
    MaxWearoutMovementMult = 0.8, 
    WearoutToDisableBackdash = 1
};
v9.CoreInfo = {
    WalkSpeed = 10, 
    ExtraKnockdown = true, 
    Health = 100, 
    HealthRecoveryTime = 1, 
    HealthRecoverySpeed = 0.32, 
    Stamina = 100, 
    DashRecoveryTime = 0.5, 
    StaminaRecoveryTime = 0.9, 
    StaminaRecoverySpeed = 6.1, 
    StaminaBreakAnimId = 13633645648, 
    StaminaBreakTime = 1.3666666666666667, 
    BlockEnergy = 0, 
    BlockPercent = 0, 
    BlockDebounce = 0.3, 
    BlockBreakTime = 1.6666666666666667, 
    BlockRecoveryTime = 1.5, 
    BlockRecoverySpeed = 0.35, 
    BlockingWalkSpeed = 5, 
    StartAbilityEnergy = 0, 
    UltDamageTakenMult = 1.4285714285714286, 
    UltimateHitMult = 0.9, 
    UltimateHurtMult = 1.1, 
    NoBlock = true, 
    PauseDrainAfterGettingHitTime = 1, 
    HealthDrainPerSecond = 1.5, 
    DrainLerpTime = 1, 
    HitAnimWeight = 0.45, 
    BodyHitAnimWeight = 0.6, 
    KnockbackDistanceMult = 0.45, 
    ReduceStunTime = 0.08333333333333333, 
    DualExchangeWindowMult = 2, 
    DamageTakenMult = 0.9, 
    MaxKnockdowns = 4, 
    IgnoreAntihealFromPerfectDodges = true, 
    HasDizzyIdle = true
};
v9.Combos = {};
v9.DefaultMoverInfo = {
    Responsiveness = 75, 
    MaxDistance = 0.8, 
    Velocity = 20, 
    MaxTime = 0.6666666666666666
};
v9.DefaultPunchInfo = {
    Stamina = 8, 
    Damage = 2, 
    BlockDamage = 2.2, 
    BonusDamagePerStock = 0.135, 
    Recover = 100, 
    BreakRecover = 0.2, 
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
v9.Combos[1] = {
    [1] = {
        AnimId = 100520714271030, 
        AnimSpeed = 0.9565217391304348, 
        Stamina = 15, 
        Damage = 2.3, 
        BonusDamagePerStock = 0.125, 
        BreakRecover = 0.4, 
        Startup = 0.38333333333333336, 
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
            TrailName = "JoeBurn", 
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
        AnimId = 120885568905107, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "JoeBurn", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 108969768491113, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "RightHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "JoeBurn", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 110684560222828, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "JoeBurn", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 131298082600192, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "JoeBurn", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 100658753706133, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "JoeBurn", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 14135720350, 
        AnimSpeed = 1.25, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "JoeBurn", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.5
        }
    }
};
v9.Combos[2] = {
    [1] = {
        AnimId = 135696687053964, 
        AnimSpeed = 0.9565217391304348, 
        Stamina = 15, 
        Damage = 2.3, 
        BonusDamagePerStock = 0.125, 
        BreakRecover = 0.4, 
        Startup = 0.38333333333333336, 
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
            TrailName = "JoeBurn", 
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
        AnimId = 88038418485798, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "JoeBurn", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 73315838335851, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "JoeBurn", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 14135720350, 
        AnimSpeed = 1.25, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "JoeBurn", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.5
        }
    }, 
    [5] = {
        AnimId = 118067961081434, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "LeftHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "JoeBurn", 
            TargetPart = "RightHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }
};
v9.HeavyAttacks = {
    DefaultMoverInfo = {
        Responsiveness = 70, 
        MaxDistance = 2.7, 
        Velocity = 30, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 20, 
        Damage = 6, 
        BlockDamage = 8, 
        BonusDamagePerStock = 0.5, 
        Recover = 0, 
        BreakRecover = 1, 
        Startup = 0.4166666666666667, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0.48333333333333334, 
        MaxTime = 0.6666666666666666, 
        StunTime = 0.5, 
        MoveDelay = 0.25, 
        AnimSpeed = 0.95, 
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
        AnimId = 82445692657825, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "JoeBurn", 
            TargetPart = "RightHand", 
            DelayTime = 0.38333333333333336, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 1
        }
    }
};
v9.DashInfo = {
    DefaultInfo = {
        FadeIn = 0.1, 
        AnimSpeed = 0.95, 
        Stamina = 12, 
        DashStartup = 0.05, 
        DashTime = 0.3, 
        StartWindow = 0, 
        DashWindow = 0.22, 
        MinTime = 0.2, 
        MaxTime = 0.43, 
        DashDelay = 0.5, 
        MaxDistance = 7, 
        Responsiveness = 25, 
        Velocity = 30
    }, 
    Forward = {
        MaxDistance = 7, 
        AnimSpeed = 1.04, 
        AnimId = 120349946531784
    }, 
    Left = {
        AnimId = 106857385682863
    }, 
    Right = {
        AnimId = 122787444426164
    }, 
    Standing = {
        AnimId = 92105196015875, 
        FadeIn = 0.1, 
        MaxDistance = 0, 
        DashStartup = 0, 
        DashTime = 0.16666666666666666, 
        DashWindow = 0.23333333333333334, 
        Responsiveness = 0, 
        AttackTime = 0.2, 
        DashDelay = 0.7333333333333333, 
        MinTime = 0.23333333333333334, 
        MaxTime = 0.36666666666666664, 
        StopInfo = {
            StopDelay = 0.6666666666666666, 
            StopTime = 0.25, 
            Weight = 1
        }
    }
};
v9.UltimateInfo = deepcopy(v0.UltimateInfo);
v9.SuccessUltimateInfo = deepcopy(v0.SuccessUltimateInfo);
v9.FailedUltimateInfo = deepcopy(v0.FailedUltimateInfo);
v9.SecretUltimateInfo = deepcopy(v0.SecretUltimateInfo);
v9.HitboxInfo = {
    Size = Vector3.new(3, 1, 3, 0)
};
v9.BlockAnimations = {
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
v9.HitAnimations = {
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
v9.GetDash = function(_, v15, v16) --[[ Line: 648 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v9 (copy)
    local v17 = "Forward";
    local l_LookVector_0 = v15.CFrame.LookVector;
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    if v16.X < -0.5 or v16.X > 0.5 then
        v19 = l_RayHelper_0:GetCharactersExcept({
            v15.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v24, v25 = l_RayHelper_0:GetRayWithWhiteList(v15.CFrame.Position, v15.CFrame.Position + l_LookVector_0, v9.DashInfo.DefaultInfo.MaxDistance, v19);
        v20 = l_l_RayHelper_0_RayWithWhiteList_0;
        v21 = v24;
        v22 = v25;
    end;
    if v16.Z > 0.8 then
        return "Standing", -v15.CFrame.LookVector;
    elseif v16.X < -0.5 then
        return "Left", (v15.CFrame.LookVector * (v20 and 0.4 or 1) + -v15.CFrame.RightVector * 0.3).Unit;
    else
        if v16.X > 0.5 then
            v17 = "Right";
            l_LookVector_0 = (v15.CFrame.LookVector * (v20 and 0.4 or 1) + v15.CFrame.RightVector * 0.3).Unit;
        end;
        return v17, l_LookVector_0;
    end;
end;
return v9;