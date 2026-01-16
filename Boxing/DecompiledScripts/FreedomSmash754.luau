local v0 = require(script.Parent);
local v1 = {
    SpecialInfo = v0.SpecialInfo, 
    DefaultMoverInfo = v0.DefaultMoverInfo, 
    DefaultPunchInfo = {
        Stamina = 10, 
        Damage = 1.3888888888888888, 
        BlockDamage = 2.314814814814815, 
        Recover = 100, 
        BreakRecover = 0.075, 
        CounterMult = 1.5, 
        Startup = 0.2, 
        TrackTime = 0.16666666666666666, 
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
            FoV = 69
        }
    }
};
deepcopy = function(v2, v3) --[[ Line: 51 ]] --[[ Name: deepcopy ]]
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
v1.CoreInfo = deepcopy(v0.CoreInfo);
v1.CoreInfo.WalkSpeed = 9;
v1.CoreInfo.BlockEnergy = 50;
v1.Combos = {};
v1.Combos[1] = {
    [1] = {
        AnimId = 13633646543, 
        Stamina = 20, 
        Damage = 2.8, 
        BreakRecover = 0.3, 
        AnimSpeed = 1.0952380952380953, 
        Startup = 0.35, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.5, 
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
            TrailName = "FreedomSmash", 
            TargetPart = "RightHand", 
            DelayTime = 0.31666666666666665, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.9
        }, 
        SlowMoInfo = {
            Direction = "Left"
        }, 
        ShakeInfo = {
            Preset = "HardHit2", 
            FoV = 66
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
            TrailName = "FreedomSmash", 
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
            TrailName = "FreedomSmash", 
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
            TrailName = "FreedomSmash", 
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
            TrailName = "FreedomSmash", 
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
            TrailName = "FreedomSmash", 
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
            TrailName = "FreedomSmash", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }
};
v1.Combos[2] = {
    [1] = {
        AnimId = 13633646492, 
        Stamina = 20, 
        Damage = 2.8, 
        BreakRecover = 0.3, 
        AnimSpeed = 1.0952380952380953, 
        Startup = 0.35, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.5, 
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
            TrailName = "FreedomSmash", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3, 
            HoldTime = 0.2, 
            TimeScale = 0.9
        }, 
        SlowMoInfo = {
            Direction = "Right"
        }, 
        ShakeInfo = {
            Preset = "HardHit2", 
            FoV = 66
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
            TrailName = "FreedomSmash", 
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
            TrailName = "FreedomSmash", 
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
            TrailName = "FreedomSmash", 
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
            TrailName = "FreedomSmash", 
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
            TrailName = "FreedomSmash", 
            TargetPart = "RightHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }
};
v1.HeavyAttacks = {
    DefaultMoverInfo = {
        Responsiveness = 70, 
        MaxDistance = 2.7, 
        Velocity = 30, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 25, 
        Damage = 8.333333333333332, 
        BlockDamage = 8.796296296296296, 
        Recover = 0, 
        BreakRecover = 1, 
        Startup = 0.5333333333333333, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0.95, 
        MaxTime = 1.1666666666666667, 
        StunTime = 0.5, 
        MoveDelay = 0.25, 
        AnimSpeed = 1.03125, 
        FadeIn = 0.1, 
        HitSound = "Smash", 
        KnockbackInfo = {
            Distance = 1, 
            TargetTime = 0.2, 
            HitIndex = 1
        }, 
        ShakeInfo = {
            Preset = "SuperHardHit", 
            WaitTime = 0.25, 
            Fade = 0.3, 
            FoVMult = 1.5, 
            FoV = 64
        }, 
        ExtraEffect = {
            Effect = "SmashPunch", 
            EffectDelay = 0.5
        }
    }, 
    [1] = {
        AnimId = 15628864286, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "RightHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomSmash", 
            TargetPart = "LeftHand", 
            DelayTime = 0.4166666666666667, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }, 
    [2] = {
        AnimId = 15628951728, 
        ExtraEffect = {
            Effect = "SmashPunchRight", 
            EffectDelay = 0.5
        }, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "LeftHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomSmash", 
            TargetPart = "RightHand", 
            DelayTime = 0.4166666666666667, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    }
};
v1.UltimateInfo = v0.UltimateInfo;
v1.HitboxInfo = v0.HitboxInfo;
v1.BlockAnimations = v0.BlockAnimations;
v1.HitAnimations = v0.HitAnimations;
v1.DashInfo = {
    DefaultInfo = {
        FadeIn = 0.1, 
        AnimSpeed = 1.2, 
        Stamina = 18, 
        DashStartup = 0.05, 
        DashTime = 0.26666666666666666, 
        StartWindow = 0, 
        DashWindow = 0.2, 
        MinTime = 0.31666666666666665, 
        MaxTime = 0.31666666666666665, 
        DashDelay = 0.4666666666666667, 
        MaxDistance = 7.5, 
        Responsiveness = 25, 
        Velocity = 42
    }, 
    Forward = {
        AnimSpeed = 1.25, 
        AnimId = 13991816244
    }, 
    Backward = {
        AnimSpeed = 0.9, 
        AnimId = 15626456275, 
        MinTime = 0.3, 
        MaxTime = 0.3
    }, 
    Left = {
        AnimId = 15626688240
    }, 
    Right = {
        AnimId = 15626728563
    }
};
local _ = game:GetService("Workspace");
local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
v1.GetDash = function(_, v12, v13) --[[ Line: 555 ]] --[[ Name: GetDash ]]
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
    if v13.Z > 0.8 then
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