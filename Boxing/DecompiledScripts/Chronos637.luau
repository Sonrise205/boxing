local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v2 = {
    Rarity = "Legendary", 
    ShortName = "CHRONOS", 
    DisplayName = "Chronos Style", 
    Description = "While your punches may lack sting, your true strength manifests when you focus your concentration to its upper limits. Ability: Focus - emoting, countering, and perfect dodging all build up a meter that allows you to access your full potential. Ultimate: Bullet Time", 
    Titles = {
        [1] = {
            Name = "Chronos1", 
            DisplayTitle = "Speed King \226\143\177\239\184\143", 
            Quality = 3, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "Chronos2", 
            DisplayTitle = "Genius \240\159\142\147", 
            Quality = 6, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "Chronos3", 
            DisplayTitle = "Chronos \226\143\179", 
            Quality = 10, 
            Type = "Knockdowns", 
            Amount = 750
        }
    }
};
local v3 = {};
local v4 = nil;
local v5 = false;
v2.SpecialInfo = {
    Name = "Focus", 
    Type = "Chronos", 
    Cooldown = 10, 
    IsMeter = true, 
    Added = function() --[[ Line: 52 ]] --[[ Name: Added ]]
        -- upvalues: l_RunService_0 (copy), v5 (ref), l_Players_0 (copy), v3 (copy), v4 (ref)
        if l_RunService_0:IsServer() then
            return;
        elseif v5 then
            return;
        else
            v5 = true;
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            local l_Character_0 = l_LocalPlayer_0.Character;
            local l_CharacterData_0 = workspace.States:WaitForChild(l_LocalPlayer_0.Name, 10):WaitForChild("CharacterData");
            l_CharacterData_0.AbilityEnergy.Value = game:GetService("RunService"):IsStudio() and 100 or 0;
            v3[1] = l_Character_0:GetAttributeChangedSignal("CurrentEmote"):Connect(function() --[[ Line: 63 ]]
                -- upvalues: l_Character_0 (copy), v4 (ref), l_RunService_0 (ref), l_CharacterData_0 (copy)
                local l_l_Character_0_Attribute_0 = l_Character_0:GetAttribute("CurrentEmote");
                if v4 then
                    v4:Disconnect();
                end;
                if not l_l_Character_0_Attribute_0 then
                    return;
                else
                    v4 = l_RunService_0.Heartbeat:Connect(function(v10) --[[ Line: 69 ]]
                        -- upvalues: l_CharacterData_0 (ref)
                        if l_CharacterData_0.Cutscene.Value and l_CharacterData_0.CanEmoteAnyways.Value then
                            return;
                        else
                            l_CharacterData_0.AbilityEnergy.Value = math.clamp(l_CharacterData_0.AbilityEnergy.Value + v10 * 7.5, 0, 100);
                            return;
                        end;
                    end);
                    return;
                end;
            end);
            v3[2] = l_Character_0:GetAttributeChangedSignal("PerfectDodged"):Connect(function() --[[ Line: 75 ]]
                -- upvalues: l_Character_0 (copy), l_CharacterData_0 (copy)
                if l_Character_0:GetAttribute("PerfectDodged") then
                    local l_AbilityEnergy_0 = l_CharacterData_0.AbilityEnergy;
                    l_AbilityEnergy_0.Value = l_AbilityEnergy_0.Value + 20;
                end;
            end);
            return;
        end;
    end, 
    Removed = function() --[[ Line: 82 ]] --[[ Name: Removed ]]
        -- upvalues: l_RunService_0 (copy), v5 (ref), v4 (ref), v3 (copy)
        if l_RunService_0:IsServer() then
            return;
        elseif not v5 then
            return;
        else
            v5 = false;
            if v4 then
                v4:Disconnect();
            end;
            for _, v13 in v3 do
                v13:Disconnect();
            end;
            return;
        end;
    end
};
v2.CoreInfo = {
    WalkSpeed = 9.25, 
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
    UltimateHitMult = 0.3, 
    UltimateHurtMult = 0.5, 
    StartAbilityEnergy = 0, 
    DamageTakenMult = 1.1
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
    MeterCharge = 0.5, 
    CounterAbilityCharge = 23
};
v2.Combos[1] = {
    [1] = {
        AnimId = 17084497407, 
        AnimSpeed = 0.95, 
        Stamina = 15, 
        Damage = 2.5, 
        BreakRecover = 0.3, 
        Startup = 0.3333333333333333, 
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
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
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
        AnimId = 17082751571, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "LeftHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [3] = {
        AnimId = 17083377252, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "RightHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [4] = {
        AnimId = 17082751571, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "LeftHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [5] = {
        AnimId = 17082782289, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "RightHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }
};
v2.Combos[2] = {
    [1] = {
        AnimId = 17080178247, 
        AnimSpeed = 0.9, 
        Stamina = 15, 
        Damage = 2.5, 
        BreakRecover = 0.3, 
        Startup = 0.3333333333333333, 
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
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
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
        AnimId = 17082782289, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "RightHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [3] = {
        AnimId = 17083324437, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "LeftHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [4] = {
        AnimId = 17082782289, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "RightHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [5] = {
        AnimId = 17082751571, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "LeftHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [6] = {
        AnimId = 17082782289, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "RightHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [7] = {
        AnimId = 17082751571, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "LeftHand", 
            DelayTime = 0.1, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.5
        }
    }, 
    [8] = {
        AnimId = 17084050171, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "RightHand", 
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
        MeterCharge = 0.5, 
        CounterAbilityCharge = 23
    }, 
    [1] = {
        AnimId = 17091948321, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "RightHand", 
            DelayTime = 0.38333333333333336, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 1
        }
    }, 
    [2] = {
        AnimId = 17092104692, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "LeftHand", 
            DelayTime = 0.43333333333333335, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 1
        }
    }, 
    [3] = {
        AnimId = 17092008682, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
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
        AnimSpeed = 0.93, 
        Stamina = 9, 
        DashStartup = 0.05, 
        DashTime = 0.31666666666666665, 
        StartWindow = 0, 
        DashWindow = 0.175, 
        MinTime = 0.31666666666666665, 
        MaxTime = 0.31666666666666665, 
        DashDelay = 0.45, 
        MaxDistance = 5.8, 
        Responsiveness = 25, 
        Velocity = 30
    }, 
    Forward = {
        AnimSpeed = 0.9, 
        AnimId = 17060437446
    }, 
    Backward = {
        AnimSpeed = 0.8, 
        AnimId = 17067178396, 
        MinTime = 0.31666666666666665, 
        MaxTime = 0.31666666666666665, 
        MaxDistance = 4.8
    }, 
    Left = {
        AnimId = 17072887986
    }, 
    Right = {
        AnimId = 17073059579
    }
};
v2.UltimateInfo = {
    Effect = "ChronosVariant", 
    PreDelay = 1, 
    Time = 11.916666666666666, 
    Offset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5), 
    DamageTimes = {
        {
            5.583333333333333, 
            20
        }, 
        {
            10.483333333333333, 
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
v2.HitboxInfo = {
    Size = Vector3.new(3, 1, 3, 0)
};
v2.BlockAnimations = {
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
v2.GetDash = function(_, v18, v19) --[[ Line: 769 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v2 (copy)
    local v20 = "Forward";
    local l_LookVector_0 = v18.CFrame.LookVector;
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    if v19.X < -0.5 or v19.X > 0.5 then
        v22 = l_RayHelper_0:GetCharactersExcept({
            v18.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v27, v28 = l_RayHelper_0:GetRayWithWhiteList(v18.CFrame.Position, v18.CFrame.Position + l_LookVector_0, v2.DashInfo.DefaultInfo.MaxDistance, v22);
        v23 = l_l_RayHelper_0_RayWithWhiteList_0;
        v24 = v27;
        v25 = v28;
    end;
    if v19.Z > 0.8 then
        return "Backward", -v18.CFrame.LookVector;
    elseif v19.X < -0.5 then
        return "Left", (v18.CFrame.LookVector * (v23 and 0.8 or 0.3) + -v18.CFrame.RightVector * 0.9).Unit;
    else
        if v19.X > 0.5 then
            v20 = "Right";
            l_LookVector_0 = (v18.CFrame.LookVector * (v23 and 0.8 or 0.3) + v18.CFrame.RightVector * 0.9).Unit;
        end;
        return v20, l_LookVector_0;
    end;
end;
return v2;