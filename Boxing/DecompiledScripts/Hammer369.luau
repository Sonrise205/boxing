local v0 = {
    Rarity = "Rare", 
    ShortName = "HAMMER", 
    DisplayName = "Hammer Style", 
    Description = "An underdog, always in the shadow of those with more talent. Ability: Body Blow - a high damaging attack that saps your opponent's stamina. Using it against a blocking enemy pries open their guard. Ultimate - Guard Crusher.", 
    Titles = {
        [1] = {
            Name = "Hammer1", 
            DisplayTitle = "Hammer \240\159\148\168", 
            Quality = 4, 
            Type = "Knockdowns", 
            Amount = 50
        }, 
        [2] = {
            Name = "Hammer2", 
            DisplayTitle = "Barf-michi \240\159\164\174", 
            Quality = 1, 
            Type = "Knockdowns", 
            Amount = 250
        }, 
        [3] = {
            Name = "Hammer3", 
            DisplayTitle = "Proof of Power \226\154\146\239\184\143", 
            Quality = 14, 
            Type = "Knockdowns", 
            Amount = 500
        }
    }
};
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local function v7() --[[ Line: 39 ]] --[[ Name: IsVictimBlocking ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        return;
    else
        local l_FirstChild_0 = workspace.States:FindFirstChild(l_Character_0.Name);
        local v4 = l_FirstChild_0 and l_FirstChild_0:FindFirstChild("Occupied");
        if not v4 then
            return;
        else
            local l_Value_0 = v4.LockedOn.Value;
            if not l_Value_0 then
                return;
            else
                local l_FirstChild_1 = workspace.States:FindFirstChild(l_Value_0.Name);
                return (l_FirstChild_1 and l_FirstChild_1:FindFirstChild("CharacterData")).Blocking.Value;
            end;
        end;
    end;
end;
v0.SpecialInfo = {
    Name = "Body Blow", 
    Type = "Hammer", 
    Cooldown = 8, 
    IsMeter = true, 
    BlockChargeMult = 3, 
    MinAttackTime = 0, 
    MinTimeSinceLastDamage = 0, 
    GetSpecialHeavy = function(_) --[[ Line: 67 ]] --[[ Name: GetSpecialHeavy ]]
        -- upvalues: v7 (copy)
        if v7() then
            return 9;
        else
            return 8;
        end;
    end, 
    Use = function() --[[ Line: 75 ]] --[[ Name: Use ]]
        -- upvalues: v7 (copy)
        local v9 = false;
        for _ = 1, 4 do
            if v7() then
                local _ = game:GetService("ReplicatedFirst");
                local v12;
                if game:GetService("RunService"):IsClient() then
                    v12 = shared.BridgeNet2;
                    if not v12 then
                        repeat
                            task.wait();
                        until shared.BridgeNet2;
                        v12 = shared.BridgeNet2;
                        v9 = v12;
                    else
                        v9 = true;
                    end;
                end;
                if not v9 then
                    if not v9 then
                        v12 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
                    end;
                end;
                v9 = false;
                v12.ReferenceBridge("TryAbility"):Fire(workspace:GetServerTimeNow());
                return;
            else
                task.wait(0.016666666666666666);
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
    Damage = 2, 
    Recover = 100, 
    BreakRecover = 0.075, 
    MeterCharge = 4, 
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
        AnimId = 17521444059, 
        MeterCharge = 10, 
        Stamina = 20, 
        Damage = 4, 
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
            TrailName = "Hammer", 
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
        AnimId = 17516452760, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hammer", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 17516447646, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hammer", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }
};
v0.Combos[2] = {
    [1] = {
        AnimId = 17513509015, 
        MeterCharge = 10, 
        Stamina = 20, 
        Damage = 4, 
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
            TrailName = "Hammer", 
            TargetPart = "LeftHand", 
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
        AnimId = 17516447646, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hammer", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 17516452760, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hammer", 
            TargetPart = "LeftHand", 
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
        MeterCharge = 20, 
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
        AnimId = 17534178729, 
        Startup = 0.5333333333333333, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hammer", 
            TargetPart = "RightHand", 
            DelayTime = 0.4166666666666667, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }, 
    [8] = {
        AnimId = 17527292876, 
        Startup = 0.45, 
        AnimSpeed = 1.05, 
        Stamina = 15, 
        Damage = 8, 
        StunTime = 0.6666666666666666, 
        SapStamina = 25, 
        MeterCharge = 0, 
        HitboxSize = Vector3.new(3, 1, 2.5, 0), 
        HitSound = "HammerM2", 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForwardHeavy"
        }, 
        ShakeInfo = {
            Preset = "SuperHardHit", 
            WaitTime = 0.1, 
            Fade = 0.4, 
            FoVMult = 1, 
            FoV = 62
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hammer", 
            TargetPart = "LeftHand", 
            DelayTime = 0.4166666666666667, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }, 
    [9] = {
        AnimId = 17522968535, 
        Startup = 0.5166666666666667, 
        StartupScale = 0.6, 
        SapStamina = 25, 
        HitboxSize = Vector3.new(3, 1, 2.5, 0), 
        MeterCharge = 0, 
        Stamina = 15, 
        Damage = 8, 
        StunTime = 0.6666666666666666, 
        HitSound = "HammerM2", 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForwardHeavy"
        }, 
        ShakeInfo = {
            Preset = "SuperHardHit", 
            WaitTime = 0.25, 
            Fade = 0.6, 
            FoVMult = 1, 
            FoV = 62
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hammer", 
            TargetPart = "LeftHand", 
            DelayTime = 0.4166666666666667, 
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
        DashWindow = 0.16666666666666666, 
        MinTime = 0.2, 
        MaxTime = 0.43333333333333335, 
        DashDelay = 0.7, 
        MaxDistance = 6, 
        Responsiveness = 25, 
        Velocity = 30
    }, 
    Forward = {
        AnimSpeed = 0.9, 
        AnimId = 13633646038, 
        DashTime = 0.26666666666666666, 
        MaxDistance = 5, 
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
    Effect = "Hammer", 
    Time = 6.666666666666667, 
    Offset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 5.1), 
    DamageTimes = {
        {
            1, 
            2.5
        }, 
        {
            1.7166666666666666, 
            2.5
        }, 
        {
            2.9166666666666665, 
            5
        }, 
        {
            4.383333333333334, 
            15
        }, 
        {
            5.383333333333334, 
            25
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
        Damage = 2, 
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
local _ = game:GetService("Workspace");
local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
v0.GetDash = function(_, v17, v18) --[[ Line: 687 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v0 (copy)
    local v19 = "Forward";
    local l_LookVector_0 = v17.CFrame.LookVector;
    local v21 = nil;
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    if v18.X < -0.5 or v18.X > 0.5 then
        v21 = l_RayHelper_0:GetCharactersExcept({
            v17.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v26, v27 = l_RayHelper_0:GetRayWithWhiteList(v17.CFrame.Position, v17.CFrame.Position + l_LookVector_0, v0.DashInfo.DefaultInfo.MaxDistance, v21);
        v22 = l_l_RayHelper_0_RayWithWhiteList_0;
        v23 = v26;
        v24 = v27;
    end;
    if v18.Z > 0.8 then
        return "Backward", -v17.CFrame.LookVector;
    elseif v18.X < -0.5 then
        return "Left", (v17.CFrame.LookVector * (v22 and 0.7 or 0.3) + -v17.CFrame.RightVector * 0.9).Unit;
    else
        if v18.X > 0.5 then
            v19 = "Right";
            l_LookVector_0 = (v17.CFrame.LookVector * (v22 and 0.7 or 0.3) + v17.CFrame.RightVector * 0.9).Unit;
        end;
        return v19, l_LookVector_0;
    end;
end;
return v0;