local v0 = require(script.Parent);
local v1 = {
    SpecialInfo = v0.SpecialInfo, 
    DefaultMoverInfo = v0.DefaultMoverInfo, 
    Combos = {}, 
    DefaultMoverInfo = {
        Responsiveness = 75, 
        MaxDistance = 0.8, 
        Velocity = 20, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 10, 
        Damage = 1.9, 
        BlockDamage = 1.9, 
        Recover = 100, 
        BreakRecover = 0.45, 
        Startup = 0.23333333333333334, 
        TrackTime = 0.16666666666666666, 
        CounterMult = 1.6, 
        MinTime = 0, 
        MaxTime = 0.8333333333333334, 
        StunTime = 0.75, 
        MoveDelay = 0.3333333333333333, 
        AnimSpeed = 1, 
        FadeIn = 0.1, 
        NameFade = 0.25, 
        ClientFadeIn = 4, 
        HitSound = "Hit1", 
        ExtraHitSound = "HawkM1_2", 
        KnockbackInfo = {
            Distance = 1, 
            TargetTime = 0.2, 
            HitIndex = 1
        }, 
        ShakeInfo = {
            Preset = "Hawk3", 
            FoV = 67
        }, 
        BlockedMeterMult = 0.3, 
        LightMeterMult = 0.6, 
        HeavyMeterMult = 0.6, 
        CounterMeterMult = 1.05
    }
};
v1.Combos[1] = {
    [1] = {
        AnimId = 14135442357, 
        AnimSpeed = 1.0076190476190479, 
        Stamina = 20, 
        Damage = 5, 
        BreakRecover = 0.5, 
        Startup = 0.35, 
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
            TrailName = "Hawk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 0.2, 
            TimeScale = 0.6
        }, 
        ShakeInfo = {
            Preset = "HardHit2", 
            FoV = 66
        }
    }, 
    [2] = {
        AnimId = 14135534886, 
        AnimSpeed = 1.4805194805194806, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "RightHand", 
            DelayTime = 0.25, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.5
        }
    }, 
    [3] = {
        AnimId = 14135720350, 
        AnimSpeed = 1.4805194805194806, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.5
        }
    }, 
    [4] = {
        AnimId = 14135844085, 
        AnimSpeed = 1.3571428571428572, 
        NameFade = 0.4, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "RightHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.06666666666666667, 
            TimeScale = 0.5
        }
    }, 
    [5] = {
        AnimId = 14135442357, 
        AnimSpeed = 1.4805194805194806, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.5
        }
    }
};
v1.Combos[2] = {
    [1] = {
        AnimId = 14136120871, 
        AnimSpeed = 1.0076190476190479, 
        Stamina = 20, 
        Damage = 5, 
        BreakRecover = 0.5, 
        Startup = 0.35, 
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
            TrailName = "Hawk", 
            TargetPart = "RightHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.13333333333333333, 
            TimeScale = 0.6
        }, 
        ShakeInfo = {
            Preset = "HardHit2", 
            FoV = 66
        }
    }, 
    [2] = {
        AnimId = 14135720350, 
        AnimSpeed = 1.4805194805194806, 
        NameFade = 0.25, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.5
        }
    }, 
    [3] = {
        AnimId = 14135976347, 
        AnimSpeed = 1.3571428571428572, 
        NameFade = 0.4, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "RightHand", 
            DelayTime = 0.25, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.5
        }
    }, 
    [4] = {
        AnimId = 14135442357, 
        AnimSpeed = 1.4805194805194806, 
        NameFade = 0.25, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.5
        }
    }, 
    [5] = {
        AnimId = 14135844085, 
        AnimSpeed = 1.3571428571428572, 
        NameFade = 0.35, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "RightHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.06666666666666667, 
            TimeScale = 0.5
        }
    }, 
    [6] = {
        AnimId = 14135720350, 
        AnimSpeed = 1.4805194805194806, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.5
        }
    }, 
    [7] = {
        AnimId = 14135534886, 
        AnimSpeed = 1.4805194805194806, 
        NameFade = 0.2, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "RightHand", 
            DelayTime = 0.25, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.5
        }
    }
};
deepcopy = function(v2, v3) --[[ Line: 369 ]] --[[ Name: deepcopy ]]
    v3 = v3 or {};
    local v4 = type(v2);
    local v5 = nil;
    if v4 == "table" then
        if v3[v2] then
            return v3[v2];
        else
            v5 = {};
            v3[v2] = v5;
            for v6, v7 in next, v2 do
                v5[deepcopy(v6, v3)] = deepcopy(v7, v3);
            end;
            setmetatable(v5, deepcopy(getmetatable(v2), v3));
            return v5;
        end;
    else
        return v2;
    end;
end;
v1.MeterInfo = deepcopy(v0.MeterInfo);
v1.MeterInfo.MeterDecrement = 4;
v1.MeterInfo.MeterDelay = 1.3;
v1.HeavyAttacks = {
    DefaultMoverInfo = {
        Responsiveness = 70, 
        MaxDistance = 2.7, 
        Velocity = 30, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 20, 
        Damage = 6.5, 
        Recover = 0, 
        BreakRecover = 1, 
        CounterMult = 1.6, 
        Startup = 0.5, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0.8666666666666667, 
        MaxTime = 1, 
        StunTime = 0.5, 
        MoveDelay = 0.25, 
        AnimSpeed = 1, 
        FadeIn = 0.1, 
        HitSound = "Heavy1", 
        HitSoundSpeedMult = 0.95, 
        ExtraHitSound = "HawkM1_2", 
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
        BlockedMeterMult = 0.3, 
        LightMeterMult = 0.6, 
        HeavyMeterMult = 0.6, 
        CounterMeterMult = 1.05
    }, 
    [1] = {
        AnimId = 14136372505, 
        AnimSpeed = 0.95, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }, 
    [2] = {
        AnimId = 14136346745, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Hawk", 
            TargetPart = "RightHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }
};
v1.UltimateInfo = v0.UltimateInfo;
v1.HitboxInfo = {
    Size = Vector3.new(3, 1, 2.799999952316284, 0)
};
v1.CoreInfo = deepcopy(v0.CoreInfo);
v1.CoreInfo.WalkSpeed = 10;
v1.CoreInfo.BlockEnergy = 46;
v1.CoreInfo.CounterHurtMult = 1.2;
v1.BlockAnimations = v0.BlockAnimations;
v1.HitAnimations = v0.HitAnimations;
v1.DashInfo = {
    DefaultInfo = {
        FadeIn = 0.1, 
        AnimSpeed = 0.95, 
        Stamina = 16, 
        DashStartup = 0.05, 
        DashTime = 0.26666666666666666, 
        StartWindow = 0, 
        DashWindow = 0.2, 
        MinTime = 0.26666666666666666, 
        MaxTime = 0.26666666666666666, 
        DashDelay = 0.5333333333333333, 
        MaxDistance = 6, 
        Responsiveness = 25, 
        Velocity = 30
    }, 
    Forward = {
        MaxDistance = 6.5, 
        AnimSpeed = 1.04, 
        AnimId = 14134354195
    }, 
    Standing = {
        AnimSpeed = 1, 
        AnimId = 14133671622, 
        Responsiveness = 0, 
        UseForSlowMo = true, 
        FadeIn = 0.1, 
        MaxDistance = 0, 
        DashStartup = 0, 
        DashTime = 0.16666666666666666, 
        DashWindow = 0.23333333333333334, 
        AttackTime = 0.23333333333333334, 
        DashDelay = 0.7333333333333333, 
        MinTime = 0.23333333333333334, 
        MaxTime = 0.36666666666666664, 
        StopInfo = {
            StopDelay = 0.6666666666666666, 
            StopTime = 0.25, 
            Weight = 1
        }
    }, 
    Backward = {
        AnimId = 16820850586, 
        AnimSpeed = 0.8, 
        MaxDistance = 3.5, 
        MinTime = 0.3, 
        MaxTime = 0.3
    }, 
    Left = {
        AnimId = 14134399588
    }, 
    Right = {
        AnimId = 14134432847
    }
};
local _ = game:GetService("Workspace");
local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
v1.GetDash = function(_, v12, v13) --[[ Line: 586 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v1 (copy)
    local v14 = "Forward";
    local l_LookVector_0 = v12.CFrame.LookVector;
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    if v13.X < -0.5 or v13.X > 0.5 then
        v16 = l_RayHelper_0:GetCharactersExcept({
            v12.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v21, v22 = l_RayHelper_0:GetRayWithWhiteList(v12.CFrame.Position, v12.CFrame.Position + l_LookVector_0, v1.DashInfo.DefaultInfo.MaxDistance, v16);
        v17 = l_l_RayHelper_0_RayWithWhiteList_0;
        v18 = v21;
        v19 = v22;
    end;
    if v13 == Vector3.new() then
        return "Standing", -v12.CFrame.LookVector;
    elseif v13.Z > 0.8 then
        return "Backward", -v12.CFrame.LookVector;
    elseif v13.X < -0.5 then
        return "Left", (v12.CFrame.LookVector * (v17 and 0.8 or 0.3) + -v12.CFrame.RightVector * 0.9).Unit;
    else
        if v13.X > 0.5 then
            v14 = "Right";
            l_LookVector_0 = (v12.CFrame.LookVector * (v17 and 0.8 or 0.3) + v12.CFrame.RightVector * 0.9).Unit;
        end;
        return v14, l_LookVector_0;
    end;
end;
return v1;