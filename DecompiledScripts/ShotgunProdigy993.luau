local v0 = require(script.Parent);
local v1 = {
    HitboxInfo = v0.HitboxInfo, 
    DefaultMoverInfo = v0.DefaultMoverInfo, 
    Combos = {}, 
    DefaultMoverInfo = {
        Responsiveness = 75, 
        MaxDistance = 0.07692307692307693, 
        Velocity = 20, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 8, 
        Damage = 1.6, 
        BlockDamage = 1.36, 
        Recover = 100, 
        BreakRecover = 0.05, 
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
v1.Combos[1] = {
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
            MaxDistance = 2.295, 
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
v1.Combos[2] = {
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
            MaxDistance = 2.295, 
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
v1.HeavyAttacks = {
    DefaultMoverInfo = {
        Responsiveness = 70, 
        MaxDistance = 2.295, 
        Velocity = 30, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 16, 
        Damage = 6, 
        Recover = 0, 
        BreakRecover = 0.55, 
        Startup = 0.4166666666666667, 
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
        AnimId = 124784284509289, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Shotgun", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }, 
        AnimSpeed = 1.2
    }
};
deepcopy = function(v2, v3) --[[ Line: 429 ]] --[[ Name: deepcopy ]]
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
v1.UltimateInfo = v0.UltimateInfo;
v1.CoreInfo = deepcopy(v0.CoreInfo);
v1.CoreInfo.IgnoreEnergy = true;
v1.CoreInfo.CounterHurtMult = 1.5;
v1.SpecialInfo = v0.SpecialInfo;
v1.BlockAnimations = v0.BlockAnimations;
v1.HitAnimations = v0.HitAnimations;
v1.DashInfo = {
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
local _ = game:GetService("Workspace");
local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
v1.GetDash = function(_, v12, v13) --[[ Line: 519 ]] --[[ Name: GetDash ]]
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