local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local v7 = {
    Rarity = "Legendary", 
    ShortName = "SUPERNOVA", 
    DisplayName = "Supernova Style", 
    Description = "A naturally gifted prizefighter worn down by dirty fights and inevitable damage. Special Ability - Rush opponents down with Comet, regain your energy with Eject, and break their spirit with fast Re-Entries. Destroy your opponent before your light fades... Ultimate: Rushlight", 
    Titles = {
        [1] = {
            Name = "Supernova1", 
            DisplayTitle = "Dying Star \240\159\140\160", 
            Quality = 0, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "Supernova2", 
            DisplayTitle = "Supernova \226\152\132\239\184\143", 
            Quality = 8, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "Supernova3", 
            DisplayTitle = "Work of Art \240\159\140\140", 
            Quality = 10, 
            Type = "Knockdowns", 
            Amount = 750
        }
    }, 
    InfoByMode = {
        DashDuringPunches = {
            EnergyNeeded = 0, 
            EnergyCost = 5, 
            Cooldown = 0, 
            UltimateDebounce = 1
        }, 
        PunchDuringDashes = {
            EnergyNeeded = 0, 
            EnergyCost = 10, 
            Cooldown = 0, 
            UltimateDebounce = 1
        }, 
        Eject = {
            EnergyCost = 20, 
            Cooldown = 3
        }, 
        ["Re-Entry"] = {
            EnergyCost = 5, 
            Cooldown = 3, 
            MinTimeSinceLastDamage = 0.85
        }, 
        Comet = {
            EnergyCost = 30, 
            Cooldown = 3
        }, 
        Overheat = {
            EnergyCost = 100, 
            Cooldown = 10, 
            HoldDownTime = 1
        }
    }
};
for v8, _ in v7.InfoByMode do
    local v10 = v7.InfoByMode[v8];
    v7.InfoByMode[v8].GetEnergyNeeded = function() --[[ Line: 85 ]]
        -- upvalues: v10 (copy)
        local l_EnergyCost_0 = v10.EnergyCost;
        return v10.EnergyNeeded or l_EnergyCost_0;
    end;
    v7.InfoByMode[v8].GetEnergyCost = function() --[[ Line: 90 ]]
        -- upvalues: v10 (copy)
        return v10.EnergyCost;
    end;
end;
v7.SpecialInfo = {
    GetSpecialInfo = function(v12) --[[ Line: 96 ]] --[[ Name: GetSpecialInfo ]]
        -- upvalues: v7 (copy)
        return v7.InfoByMode[v12 or "Overheat"];
    end, 
    Added = function() --[[ Line: 100 ]] --[[ Name: Added ]]
        workspace.CurrentSpecialFrame.Value = "Supernova";
        workspace.StyleMode.Value = "Comet";
    end, 
    Name = "Overheat", 
    Type = "Supernova", 
    IgnoreMobileHeartbeat = true, 
    Cooldown = 0.5, 
    IsMeter = true, 
    IgnoreSound = true, 
    IgnoreAbilityEnergyCheck = true, 
    OnlyOnInputEnded = true
};
v7.CoreInfo = {
    WalkSpeed = 9, 
    Health = 100, 
    HealthRecoveryTime = 1, 
    HealthRecoverySpeed = 0.15, 
    Stamina = 130, 
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
    StartAbilityEnergy = 0, 
    NoPerfectDodges = true, 
    PunchDuringDashes = true, 
    DashDuringPunches = true, 
    PDD_DebuffWindow = 0.3333333333333333, 
    PDD_HeavyStartupMult = 0.9, 
    PDD_LightStartupMult = 0.8, 
    PDD_MinTime = 0, 
    PDD_MaxTime = 0.16666666666666666, 
    DDP_MinTime = 0, 
    DDP_MaxTime = 0.16666666666666666, 
    NeverIgnoreRollback = true, 
    DoubleDashFeintMult = 1.35, 
    EjectStaminaRecoveryTime = 1.2, 
    EjectStaminaRecoveryMult = 2, 
    CTE_PerDamage = 3, 
    MaxCTE_Stamina = 70, 
    CounterHurtMult = 1, 
    MaxCTE_CounterIntakeMult = 2, 
    CTE_ResetsPerStock = false
};
v7.Combos = {};
v7.DefaultMoverInfo = {
    Responsiveness = 75, 
    MaxDistance = 0.8, 
    Velocity = 20, 
    MaxTime = 0.6666666666666666
};
v7.DefaultPunchInfo = {
    Stamina = 10, 
    Damage = 1.5, 
    BlockDamage = 1.8, 
    Recover = 100, 
    BreakRecover = 0.075, 
    Startup = 0.16666666666666666, 
    TrackTime = 0.16666666666666666, 
    CounterMult = 2, 
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
    MeterCharge = 5, 
    SupernovaComboMeterMult = 0
};
v7.Combos[1] = {
    [1] = {
        AnimId = 78353240918569, 
        AnimSpeed = 1, 
        Stamina = 20, 
        Damage = 3.5, 
        BlockDamage = 3, 
        MeterCharge = 10, 
        BreakRecover = 0.3, 
        ServerAnimSpeedMult = 0.85, 
        Startup = 0.3333333333333333, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.7, 
        MoveDelay = 0.2, 
        MoverInfo = {
            MaxDistance = 1.8, 
            Velocity = 30, 
            Responsiveness = 70
        }, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 1
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
        AnimId = 108486424337632, 
        AnimSpeed = 0.9, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "RightHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 100113547819091, 
        HitInfo = {
            Direction = "BodyForward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.85
        }
    }, 
    [4] = {
        AnimId = 140088986370902, 
        HitInfo = {
            Direction = "BodyForward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "RightHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 76311902170333, 
        AnimSpeed = 0.9, 
        MinStamina = 1, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "LeftHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 127074425784310, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 128668254030640, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "RightHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [8] = {
        AnimId = 134719685742345, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "LeftHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }
};
v7.Combos[2] = {
    [1] = {
        AnimId = 135050093884210, 
        AnimSpeed = 0.89, 
        Stamina = 20, 
        Damage = 3.5, 
        BlockDamage = 3, 
        MeterCharge = 10, 
        BreakRecover = 0.3, 
        ServerAnimSpeedMult = 0.85, 
        Startup = 0.3333333333333333, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.7, 
        MoveDelay = 0.2, 
        MoverInfo = {
            MaxDistance = 1.8, 
            Velocity = 30, 
            Responsiveness = 70
        }, 
        HitInfo = {
            Direction = "BodyRight", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 1
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
        AnimId = 128668254030640, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "RightHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 100113547819091, 
        HitInfo = {
            Direction = "BodyForward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.85
        }
    }, 
    [4] = {
        AnimId = 140088986370902, 
        HitInfo = {
            Direction = "BodyForward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "RightHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 134719685742345, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "LeftHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 108486424337632, 
        AnimSpeed = 0.9, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "RightHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 76311902170333, 
        AnimSpeed = 0.9, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "LeftHand", 
            DelayTime = 0.11666666666666667, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [8] = {
        AnimId = 127074425784310, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }
};
v7.HeavyAttacks = {
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
        CounterMult = 2, 
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
        }, 
        MeterCharge = 100, 
        SupernovaComboMeterMult = 0
    }, 
    [1] = {
        AnimId = 105173667298396, 
        AnimSpeed = 0.95, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "RightHand", 
            DelayTime = 0.38333333333333336, 
            HoldTime = 0.23333333333333334, 
            TimeScale = 1
        }
    }, 
    [2] = {
        AnimId = 111261721602731, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "RightHand", 
            DelayTime = 0.38333333333333336, 
            HoldTime = 0.23333333333333334, 
            TimeScale = 1
        }
    }, 
    [3] = {
        AnimId = 93818626927391, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "RightHand", 
            DelayTime = 0.38333333333333336, 
            HoldTime = 0.23333333333333334, 
            TimeScale = 1
        }
    }, 
    [5] = {
        AnimId = 88353338310512, 
        Startup = 0.25, 
        AnimSpeed = 1, 
        OnUse = function(v13) --[[ Line: 735 ]] --[[ Name: OnUse ]]
            local _ = game:GetService("Players");
            local _ = game:GetService("TweenService");
            local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
            local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
            task.defer(function() --[[ Line: 743 ]]
                -- upvalues: l_EffectHelper_0 (copy), v13 (copy)
                l_EffectHelper_0.EjectAbility({
                    "hi youre stupid if you see this", 
                    v13
                });
            end);
        end, 
        IsEject = true, 
        NotDodgeable = true, 
        NoHeavyLayer = true, 
        HitEffect = "EjectLanded", 
        KnockbackInfo = {
            Distance = 5.5, 
            TargetTime = 0.6, 
            HitIndex = 2
        }, 
        StunTime = 1, 
        MoverInfo = {
            Responsiveness = 30, 
            MaxDistance = 2, 
            Velocity = 40, 
            MaxTime = 0.5, 
            LookVectorMult = Vector3.new(-1, -1, -1, 0), 
            OnlyAfterLanded = true
        }, 
        StartupScale = 0.6, 
        HitboxSize = Vector3.new(3, 1, 3.5, 0), 
        MeterCharge = 0, 
        Stamina = 15, 
        Damage = 0, 
        Recover = 0, 
        BreakRecover = 0, 
        HitSound = "HammerM2", 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForwardHeavy", 
            OverrideAnim = 78484697907954
        }, 
        ShakeInfo = {
            Preset = "HardHit", 
            WaitTime = 0.25, 
            Fade = 1, 
            FoVMult = 1, 
            FoV = 70
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "LeftHand", 
            DelayTime = 0.4166666666666667, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }, 
    [9] = {
        OnUse = function(v18) --[[ Line: 818 ]] --[[ Name: OnUse ]]
            -- upvalues: v7 (copy)
            local l_Players_1 = game:GetService("Players");
            local l_TweenService_1 = game:GetService("TweenService");
            local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
            local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
            local l_Events_0 = l_ReplicatedStorage_0:WaitForChild("Events");
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            local l_LocalPlayer_0 = l_Players_1.LocalPlayer;
            local v26 = v18 == l_LocalPlayer_0.Character;
            local v27 = l_CommonUtilities_0.GetOccupied(v18);
            local v28 = l_CommonUtilities_0.GetCharacterData(v18);
            local v29 = v26 or v28.Opponent.Value == l_LocalPlayer_0.Character;
            local v30 = v7.HeavyAttacks[9].Startup / 0.4166666666666667;
            local function _() --[[ Line: 838 ]] --[[ Name: GetDistanceToTarget ]]
                -- upvalues: v26 (copy), v27 (copy), v18 (copy)
                local v31 = 100;
                if v26 then
                    local l_Value_0 = v27.LockedOn.Value;
                    if l_Value_0 and l_Value_0.PrimaryPart and v18 and v18.PrimaryPart then
                        v31 = (v18.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
                    end;
                    if v31 < 10 then
                        workspace:SetAttribute("FoVLerpMult", 0.5);
                    end;
                end;
                return v31;
            end;
            local l_Modules_1 = l_ReplicatedStorage_0:WaitForChild("Modules");
            local l_EffectHelper_1 = require(l_Modules_1:WaitForChild("EffectHelper"));
            task.defer(function() --[[ Line: 859 ]]
                -- upvalues: l_EffectHelper_1 (copy), v18 (copy), v26 (copy), v27 (copy)
                local l_CometAbility_0 = l_EffectHelper_1.CometAbility;
                local v37 = {};
                local v38 = "hi youre stupid if you see this";
                local l_v18_0 = v18;
                local v40 = 100;
                if v26 then
                    local l_Value_1 = v27.LockedOn.Value;
                    if l_Value_1 and l_Value_1.PrimaryPart and v18 and v18.PrimaryPart then
                        v40 = (v18.PrimaryPart.Position - l_Value_1.PrimaryPart.Position).Magnitude;
                    end;
                    if v40 < 10 then
                        workspace:SetAttribute("FoVLerpMult", 0.5);
                    end;
                end;
                local l_v40_0 = v40;
                v6(v37, 1, v38, l_v18_0, l_v40_0);
                l_CometAbility_0(v37);
            end);
            task.spawn(function() --[[ Line: 867 ]]
                -- upvalues: v29 (copy), l_EffectHelper_1 (copy), v30 (copy), l_TweenService_1 (copy), l_CurrentCamera_0 (copy), v26 (copy), v27 (copy), v18 (copy), l_Events_0 (copy)
                if not v29 then
                    return;
                else
                    workspace:SetAttribute("NoSetFoV", true);
                    workspace.FoVMult.Value = 0.1;
                    task.spawn(function() --[[ Line: 872 ]]
                        -- upvalues: l_EffectHelper_1 (ref)
                        l_EffectHelper_1.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.13333333333333333, 
                            Fade = 0.2
                        });
                    end);
                    local v43 = nil;
                    task.delay(3 / v30 / 60, function() --[[ Line: 881 ]]
                        -- upvalues: l_TweenService_1 (ref), l_CurrentCamera_0 (ref), v30 (ref), v43 (ref), v26 (ref), v27 (ref), v18 (ref)
                        l_TweenService_1:Create(l_CurrentCamera_0, TweenInfo.new(8 / v30 / 60, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            FieldOfView = 100
                        }):Play();
                        task.wait(8 / v30 / 60);
                        local l_l_TweenService_1_0 = l_TweenService_1;
                        local l_l_CurrentCamera_0_0 = l_CurrentCamera_0;
                        local v46 = TweenInfo.new(23 / v30 / 60, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
                        local v47 = {};
                        local v48 = 100;
                        if v26 then
                            local l_Value_2 = v27.LockedOn.Value;
                            if l_Value_2 and l_Value_2.PrimaryPart and v18 and v18.PrimaryPart then
                                v48 = (v18.PrimaryPart.Position - l_Value_2.PrimaryPart.Position).Magnitude;
                            end;
                            if v48 < 10 then
                                workspace:SetAttribute("FoVLerpMult", 0.5);
                            end;
                        end;
                        v47.FieldOfView = v48 < 8.5 and 50 or 62;
                        v43 = l_l_TweenService_1_0:Create(l_l_CurrentCamera_0_0, v46, v47);
                        v43:Play();
                    end);
                    local v50 = nil;
                    v50 = l_Events_0.Landed.Event:Connect(function() --[[ Line: 896 ]]
                        -- upvalues: v50 (ref), l_TweenService_1 (ref), l_CurrentCamera_0 (ref), v30 (ref)
                        if v50 then
                            v50:Disconnect();
                        end;
                        l_TweenService_1:Create(l_CurrentCamera_0, TweenInfo.new(15 / v30 / 60, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            FieldOfView = 70
                        }):Play();
                        workspace.FoVMult.Value = 0.5;
                    end);
                    workspace:SetAttribute("FoVLerpMult", 0.4);
                    task.wait(30 / v30 / 60);
                    if v43 then
                        v43:Cancel();
                    end;
                    workspace.FoVMult.Value = 8;
                    workspace:SetAttribute("NoSetFoV", nil);
                    workspace:SetAttribute("FoVLerpMult", nil);
                    task.wait(0.16666666666666666);
                    if v50 then
                        v50:Disconnect();
                    end;
                    return;
                end;
            end);
        end, 
        AnimPriority = Enum.AnimationPriority.Action2, 
        MinTime = 0.8666666666666667, 
        HitEffect = "CometHit", 
        AnimId = 104558230393575, 
        Startup = 0.4166666666666667, 
        AnimSpeed = 1.068, 
        IsComet = true, 
        RemoveBackdashTime = 5, 
        FadeIn = 0, 
        NameFade = 0, 
        WeightFade = 0.3333333333333333, 
        StartupScale = 0.6, 
        HitboxSize = Vector3.new(3, 1, 3.5, 0), 
        MeterCharge = 0, 
        Stamina = 15, 
        Damage = 8, 
        StunTime = 0.6666666666666666, 
        HitSound = "HammerM2", 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyRight", 
            OverrideAnim = 103960613064963
        }, 
        ShakeInfo = {
            Preset = "SuperHardHit", 
            WaitTime = 0.25, 
            Fade = 1, 
            FoV = 50
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Supernova", 
            TargetPart = "LeftHand", 
            DelayTime = 0.4166666666666667, 
            HoldTime = 0.25, 
            TimeScale = 1
        }, 
        MoverInfo = {
            MaxDistance = -1
        }
    }
};
v7.DashInfo = {
    DefaultInfo = {
        FadeIn = 0.1, 
        AnimSpeed = 0.93, 
        Stamina = 9, 
        DashStartup = 0.0375, 
        DashTime = 0.225, 
        StartWindow = 0, 
        DashWindow = 0.175, 
        MinTime = 0.2375, 
        MaxTime = 0.2375, 
        DashDelay = 0.3875, 
        MaxDistance = 4.5, 
        Responsiveness = 32.5, 
        Velocity = 39
    }, 
    ["Re-Entry"] = {
        OnUse = function(v51) --[[ Line: 1005 ]] --[[ Name: OnUse ]]
            local l_Players_2 = game:GetService("Players");
            local l_TweenService_2 = game:GetService("TweenService");
            local l_ReplicatedStorage_1 = game:GetService("ReplicatedStorage");
            local l_CommonUtilities_1 = require(l_ReplicatedStorage_1:WaitForChild("CommonUtilities"));
            local _ = l_ReplicatedStorage_1:WaitForChild("Events");
            local l_CurrentCamera_1 = workspace.CurrentCamera;
            local l_LocalPlayer_1 = l_Players_2.LocalPlayer;
            local v59 = v51 == l_LocalPlayer_1.Character;
            local v60 = l_CommonUtilities_1.GetOccupied(v51);
            local v61 = l_CommonUtilities_1.GetCharacterData(v51);
            local v62 = v59 or v61.Opponent.Value == l_LocalPlayer_1.Character;
            local l_Modules_2 = l_ReplicatedStorage_1:WaitForChild("Modules");
            local l_EffectHelper_2 = require(l_Modules_2:WaitForChild("EffectHelper"));
            task.defer(function() --[[ Line: 1025 ]]
                -- upvalues: l_EffectHelper_2 (copy), v51 (copy)
                l_EffectHelper_2.ReEntryAbility({
                    "hi youre stupid if you see this", 
                    v51
                });
            end);
            local function _() --[[ Line: 1032 ]] --[[ Name: GetDistanceToTarget ]]
                -- upvalues: v59 (copy), v60 (copy), v51 (copy)
                local v65 = 100;
                if v59 then
                    local l_Value_3 = v60.LockedOn.Value;
                    if l_Value_3 and l_Value_3.PrimaryPart and v51 and v51.PrimaryPart then
                        v65 = (v51.PrimaryPart.Position - l_Value_3.PrimaryPart.Position).Magnitude;
                    end;
                    if v65 < 10 then
                        workspace:SetAttribute("FoVLerpMult", 0.5);
                    end;
                end;
                return v65;
            end;
            task.spawn(function() --[[ Line: 1050 ]]
                -- upvalues: v62 (copy), l_EffectHelper_2 (copy), l_TweenService_2 (copy), l_CurrentCamera_1 (copy)
                if not v62 then
                    return;
                else
                    workspace.FoVMult.Value = 0.1;
                    task.spawn(function() --[[ Line: 1054 ]]
                        -- upvalues: l_EffectHelper_2 (ref)
                        l_EffectHelper_2.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.06666666666666667, 
                            Fade = 0.2
                        });
                    end);
                    task.wait(0.05);
                    l_TweenService_2:Create(l_CurrentCamera_1, TweenInfo.new(0.13333333333333333, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                        FieldOfView = 95
                    }):Play();
                    workspace:SetAttribute("FoVLerpMult", 0.2);
                    task.wait(0.1);
                    workspace:SetAttribute("NoSetFoV", nil);
                    workspace:SetAttribute("FoVLerpMult", nil);
                    workspace.FoVMult.Value = 3;
                    local function _(v68, v69, v70) --[[ Line: 1076 ]] --[[ Name: Lerp ]]
                        return v68 + (v69 - v68) * v70;
                    end;
                    for v72 = 1, 60 do
                        workspace:SetAttribute("FoVLerpMult", 0.2 + 0.8 * (v72 / 30));
                        task.wait(0.03333333333333333);
                    end;
                    workspace:SetAttribute("FoVLerpMult", nil);
                    return;
                end;
            end);
        end, 
        DashTime = 0.075, 
        MinTime = 0.0375, 
        MaxTime = 0.0375, 
        AnimSpeed = 1.1, 
        AnimId = 13991816244, 
        MaxDistance = 10, 
        Responsiveness = 70, 
        Velocity = 108, 
        Stamina = 0, 
        IgnoreDashSpamLevel = true
    }, 
    Comet = {
        AnimSpeed = 1.45, 
        AnimId = 0, 
        DashTime = 0.5, 
        DashWindow = 0.43333333333333335, 
        CometVulnerableTime = 0.43333333333333335, 
        MaxDistance = 11, 
        Responsiveness = 67.5, 
        Velocity = 125.55000000000001, 
        IgnoreAnimation = true, 
        DelayDashInvincible = 0.16666666666666666, 
        IgnoreDashSpamLevel = true
    }, 
    Forward = {
        AnimSpeed = 0.9, 
        AnimId = 139193884136170
    }, 
    Backward = {
        AnimId = 87521434357702, 
        AnimSpeed = 1, 
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
            StopDelay = 0.25, 
            StopTime = 0.25, 
            Weight = 1
        }
    }, 
    Left = {
        AnimId = 135040443621884
    }, 
    Right = {
        AnimId = 98031314057692
    }
};
v7.UltimateInfo = {
    Effect = "Supernova", 
    PreDelay = 1, 
    Time = 19.933333333333334, 
    Offset = CFrame.Angles(0, 0, 0.01), 
    DamageTimes = {
        {
            7.666666666666667, 
            10
        }, 
        {
            8.833333333333334, 
            15
        }, 
        {
            8.833333333333334, 
            10
        }, 
        {
            16.466666666666665, 
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
        AnimId = 13676665379, 
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
v7.HitboxInfo = {
    Size = Vector3.new(3, 1, 2.9000000953674316, 0)
};
v7.BlockAnimations = {
    IdleFade = 0.13333333333333333, 
    Idle = 108580056057602, 
    Break = 13633646743, 
    Left = 13633646784, 
    Right = 13633646824, 
    Forward = 13633646884, 
    BodyLeft = 13633646937, 
    BodyRight = 13633646996, 
    BodyForward = 13633647037
};
v7.HitAnimations = {
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
local l_Modules_3 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_RayHelper_0 = require(l_Modules_3:WaitForChild("RayHelper"));
v7.GetDash = function(_, v77, v78) --[[ Line: 1293 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v7 (copy)
    local v79 = "Backward";
    local l_LookVector_0 = v77.CFrame.LookVector;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    if v78.X < -0.5 or v78.X > 0.5 then
        v81 = l_RayHelper_0:GetCharactersExcept({
            v77.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v86, v87 = l_RayHelper_0:GetRayWithWhiteList(v77.CFrame.Position, v77.CFrame.Position + l_LookVector_0, v7.DashInfo.DefaultInfo.MaxDistance, v81);
        v82 = l_l_RayHelper_0_RayWithWhiteList_0;
        v83 = v86;
        v84 = v87;
    end;
    if v78.X < -0.5 then
        return "Left", (v77.CFrame.LookVector * (v82 and 0.2 or 0.6) + -v77.CFrame.RightVector * 0.5).Unit;
    elseif v78.X > 0.5 then
        return "Right", (v77.CFrame.LookVector * (v82 and 0.2 or 0.6) + v77.CFrame.RightVector * 0.5).Unit;
    else
        if v78.Z < -0.5 then
            v79 = "Forward";
            l_LookVector_0 = v77.CFrame.LookVector;
        end;
        return v79, l_LookVector_0;
    end;
end;
return v7;