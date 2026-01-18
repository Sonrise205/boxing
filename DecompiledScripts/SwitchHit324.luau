local v10 = {
    Rarity = "Mythic", 
    ShortName = "SWITCH HIT", 
    DisplayName = "Switch Hit Style", 
    Description = "No matter from left or right, the Asura sees all. Being ambidextrous allows you to control the direction of your punches with your own movement, in exchange for dash mobility. Ability: Static - Disrupt your opponents rhythm by cancelling their perfect dodge OR inverting their controls. Ultimate: You Can't Hide", 
    Titles = {
        [1] = {
            Name = "SwitchHit1", 
            DisplayTitle = "Switch Hitter \226\153\190\239\184\143", 
            Quality = 7, 
            Type = "Knockdowns", 
            Amount = 50
        }, 
        [2] = {
            Name = "SwitchHit2", 
            DisplayTitle = "Destiny \240\159\142\178", 
            Quality = 9, 
            Type = "Knockdowns", 
            Amount = 250
        }, 
        [3] = {
            Name = "SwitchHit3", 
            DisplayTitle = "Asura \240\159\145\185", 
            Quality = 15, 
            Type = "Knockdowns", 
            Amount = 500
        }
    }, 
    SpecialInfo = {
        Name = "Static", 
        Type = "SwitchHit", 
        Cooldown = 10, 
        MinStamina = 1, 
        IsMeter = true, 
        SpecialCheck = function(v0) --[[ Line: 45 ]] --[[ Name: SpecialCheck ]]
            local l_CharacterData_0 = v0.CharacterData;
            local l_Character_0 = v0.Character;
            local l_Occupied_0 = v0.Occupied;
            if l_Character_0:GetAttribute("SlowMo") then
                return true;
            else
                local v4 = l_CharacterData_0.Cutscene.Value and not l_Character_0:GetAttribute("SlowMo");
                local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                local v6 = l_Character_0:GetAttribute("LastDamage") or 0;
                local v7 = l_Character_0:GetAttribute("LocalDashTime") or 0;
                local v8 = l_workspace_ServerTimeNow_0 - v6;
                local v9 = l_workspace_ServerTimeNow_0 - v7;
                if v8 < 0.35 or v9 < 0.35 or not l_Occupied_0.CanPunch.Value or l_CharacterData_0.Stunned.Value or l_Occupied_0.Stunned.Value or l_CharacterData_0.Cutscene.Value then
                    return false;
                elseif l_CharacterData_0.Blocking.Value then
                    return false;
                elseif not l_Occupied_0.CanPunch.Value then
                    return false;
                elseif l_CharacterData_0.Stunned.Value or v4 then
                    return false;
                else
                    return true;
                end;
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
        BlockEnergy = 45, 
        BlockPercent = 70, 
        BlockDebounce = 0.3, 
        BlockBreakTime = 1.6666666666666667, 
        BlockRecoveryTime = 1.5, 
        BlockRecoverySpeed = 0.35, 
        BlockingWalkSpeed = 5, 
        UltimateHitMult = 0.3, 
        UltimateHurtMult = 0.5, 
        StartAbilityEnergy = 100, 
        DashMeterAdd = 7, 
        CorrectDashMeterAdd = 3, 
        PerfectDashMeterAdd = 6
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
v10.Combos[1] = {
    [1] = {
        AnimId = 115097548621262, 
        Stamina = 20, 
        Damage = 3.5, 
        BreakRecover = 0.3, 
        Startup = 0.38333333333333336, 
        AnimSpeed = 0.9565217391304348, 
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
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "SwitchHit", 
            TargetPart = "LeftHand", 
            DelayTime = 0.35, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.9
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 68
        }
    }, 
    [2] = {
        AnimId = 127670576476765, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "SwitchHit", 
            TargetPart = "RightHand", 
            DelayTime = 0.2, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 15122219590, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "SwitchHit", 
            TargetPart = "LeftHand", 
            DelayTime = 0.2, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 111682732696142, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "SwitchHit", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 13663721593, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "SwitchHit", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }
};
v10.Combos[2] = {
    [1] = {
        AnimId = 99434389694590, 
        Stamina = 20, 
        Damage = 3.5, 
        BreakRecover = 0.3, 
        Startup = 0.35, 
        AnimSpeed = 1.0476190476190477, 
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
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "SwitchHit", 
            TargetPart = "RightHand", 
            DelayTime = 0.35, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.9
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 68
        }
    }, 
    [2] = {
        AnimId = 91530433151931, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "SwitchHit", 
            TargetPart = "LeftHand", 
            DelayTime = 0.2, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }, 
    [3] = {
        AnimId = 73810210876145, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "SwitchHit", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.7
        }
    }, 
    [4] = {
        AnimId = 139628847311182, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "SwitchHit", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [5] = {
        AnimId = 121235594875106, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "SwitchHit", 
            TargetPart = "RightHand", 
            DelayTime = 0.2, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }
};
v10.HeavyAttacks = {
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
        Recover = 0, 
        BreakRecover = 0.55, 
        Startup = 0.43333333333333335, 
        AnimSpeed = 1.0769230769230769, 
        AnimId = 131194659651050, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "SwitchHit", 
            TargetPart = "RightHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }, 
    [2] = {
        Recover = 0, 
        BreakRecover = 1, 
        Startup = 0.5166666666666667, 
        AnimSpeed = 0.9032258064516129, 
        AnimId = 132197699768902, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "SwitchHit", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }
};
v10.DashInfo = {
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
        SouthpawAnimId = 105573475162442, 
        AnimId = 13633646038, 
        DashTime = 0.26666666666666666, 
        MaxDistance = 7, 
        Responsiveness = 40, 
        Velocity = 70
    }, 
    Backward = {
        SouthpawAnimId = 138398447037758, 
        AnimId = 13633645960, 
        AnimSpeed = 0.85, 
        MinTime = 0.4, 
        MaxTime = 0.6666666666666666
    }, 
    Left = {
        AnimId = 13633645849
    }, 
    Right = {
        AnimId = 79476534552564
    }
};
v10.UltimateInfo = {
    Effect = "SwitchHit", 
    PreDelay = 1, 
    Time = 12.25, 
    Offset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.6), 
    DamageTimes = {
        {
            0.9166666666666666, 
            20
        }, 
        {
            8.666666666666666, 
            10
        }, 
        {
            9.9, 
            20
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
v10.HitboxInfo = {
    Size = Vector3.new(3, 1, 2.9000000953674316, 0)
};
v10.BlockAnimations = {
    IdleFade = 0.08333333333333333, 
    Idle = 83590988712475, 
    Break = 13633646743, 
    Left = 13633646784, 
    Right = 13633646824, 
    Forward = 13633646884, 
    BodyLeft = 13633646937, 
    BodyRight = 13633646996, 
    BodyForward = 13633647037, 
    SouthpawIdle = 73534703704918, 
    SouthpawBreak = 103319866128429, 
    SouthpawLeft = 71982357299248, 
    SouthpawRight = 76125188539637, 
    SouthpawForward = 137552923428252, 
    SouthpawBodyLeft = 71982357299248, 
    SouthpawBodyRight = 76125188539637, 
    SouthpawBodyForward = 78081482322102
};
v10.HitAnimations = {
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
    BodyForwardHeavy = 13633648126, 
    SouthpawLeft = 71531444245680, 
    SouthpawRight = 86800142120574, 
    SouthpawForward = 107408936963544, 
    SouthpawBodyLeft = 138619612843517, 
    SouthpawBodyRight = 107998879025121, 
    SouthpawBodyForward = 94265710337225, 
    SouthpawLeftHeavy = 119156040879028, 
    SouthpawRightHeavy = 123878497629624, 
    SouthpawForwardHeavy = 122364693784153, 
    SouthpawBodyLeftHeavy = 109059117799796, 
    SouthpawBodyRightHeavy = 77065018572312, 
    SouthpawBodyForwardHeavy = 73943122993747
};
local _ = game:GetService("Workspace");
local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
v10.GetDash = function(_, v15, v16) --[[ Line: 721 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v10 (copy)
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
        local l_l_RayHelper_0_RayWithWhiteList_0, v24, v25 = l_RayHelper_0:GetRayWithWhiteList(v15.CFrame.Position, v15.CFrame.Position + l_LookVector_0, v10.DashInfo.DefaultInfo.MaxDistance, v19);
        v20 = l_l_RayHelper_0_RayWithWhiteList_0;
        v21 = v24;
        v22 = v25;
    end;
    if v16.Z > 0.8 then
        return "Backward", -v15.CFrame.LookVector;
    elseif v16.X < -0.5 then
        return "Left", (v15.CFrame.LookVector * (v20 and 0.7 or 0.5) + -v15.CFrame.RightVector * 0.5).Unit;
    else
        if v16.X > 0.5 then
            v17 = "Right";
            l_LookVector_0 = (v15.CFrame.LookVector * (v20 and 0.7 or 0.5) + v15.CFrame.RightVector * 0.5).Unit;
        end;
        return v17, l_LookVector_0;
    end;
end;
return v10;