local v0 = require(script.Parent);
local v1 = {
    SpecialInfo = v0.SpecialInfo, 
    DefaultMoverInfo = v0.DefaultMoverInfo, 
    DefaultPunchInfo = {
        Stamina = 8.8, 
        Damage = 1.8181818181818181, 
        BlockDamage = 1.4814814814814814, 
        Recover = 100, 
        BreakRecover = 0.1, 
        CounterMult = 1.5, 
        Startup = 0.16666666666666666, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.8333333333333334, 
        StunTime = 0.9, 
        MoveDelay = 0.25, 
        AnimSpeed = 1.2, 
        FadeIn = 0.1, 
        ClientFadeIn = 4, 
        ClientWeightFade = 5, 
        HitSound = "Hit1", 
        HitSoundSpeedMult = 1.35, 
        ExtraHitSound = "FastHit", 
        KnockbackInfo = {
            Distance = 1, 
            TargetTime = 0.2, 
            HitIndex = 1
        }, 
        ShakeInfo = {
            Preset = "LightHit", 
            FoV = 67.5
        }
    }, 
    Combos = {}
};
v1.Combos[1] = {
    [1] = {
        AnimId = 13633645580, 
        AnimSpeed = 0.95, 
        Stamina = 20, 
        Damage = 4, 
        BreakRecover = 0.3, 
        Startup = 0.3333333333333333, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.5, 
        MoveDelay = 0.2, 
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
            TrailName = "FreedomFlicker", 
            TargetPart = "LeftHand", 
            DelayTime = 0.26666666666666666, 
            HoldTime = 0.15, 
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
        AnimId = 13633987522, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomFlicker", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.85
        }
    }, 
    [3] = {
        AnimId = 13633988132, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomFlicker", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.85
        }
    }, 
    [4] = {
        AnimId = 15416196762, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomFlicker", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.85
        }
    }, 
    [5] = {
        AnimId = 15627336070, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomFlicker", 
            TargetPart = "LeftHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.08333333333333333, 
            TimeScale = 0.7
        }
    }, 
    [6] = {
        AnimId = 15627478074, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomFlicker", 
            TargetPart = "RightHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }, 
    [7] = {
        AnimId = 13633645300, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomFlicker", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.85
        }
    }, 
    [8] = {
        AnimId = 13633988204, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomFlicker", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.85
        }
    }
};
v1.Combos[2] = {
    [1] = {
        AnimId = 13633645143, 
        AnimSpeed = 0.95, 
        Stamina = 20, 
        Damage = 4, 
        BreakRecover = 0.3, 
        Startup = 0.3333333333333333, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0, 
        MaxTime = 0.5, 
        MoveDelay = 0.2, 
        MoverInfo = {
            MaxDistance = 2.7, 
            Velocity = 30, 
            Responsiveness = 70
        }, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomFlicker", 
            TargetPart = "LeftHand", 
            DelayTime = 0.26666666666666666, 
            HoldTime = 0.15, 
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
        AnimId = 13633988284, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomFlicker", 
            TargetPart = "RightHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.85
        }
    }, 
    [3] = {
        AnimId = 13633987522, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomFlicker", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.85
        }
    }, 
    [4] = {
        AnimId = 13633988204, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomFlicker", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.85
        }
    }, 
    [5] = {
        AnimId = 13633988132, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "FreedomFlicker", 
            TargetPart = "LeftHand", 
            DelayTime = 0.15, 
            HoldTime = 0.11666666666666667, 
            TimeScale = 0.85
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
            TrailName = "FreedomFlicker", 
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
            TrailName = "FreedomFlicker", 
            TargetPart = "RightHand", 
            DelayTime = 0.08333333333333333, 
            HoldTime = 0.16666666666666666, 
            TimeScale = 0.7
        }
    }
};
deepcopy = function(v2, v3) --[[ Line: 398 ]] --[[ Name: deepcopy ]]
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
v1.HeavyAttacks = {
    DefaultMoverInfo = {
        Responsiveness = 70, 
        MaxDistance = 2.7, 
        Velocity = 30, 
        MaxTime = 0.6666666666666666
    }, 
    DefaultPunchInfo = {
        Stamina = 25, 
        Damage = 4, 
        Recover = 0, 
        BreakRecover = 1, 
        Startup = 0.5, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0.8666666666666667, 
        MaxTime = 1, 
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
for _, v9 in v1.HeavyAttacks do
    if v9.TrailInfo then
        v9.TrailInfo.TrailName = "FreedomFlicker";
    end;
end;
v1.UltimateInfo = v0.UltimateInfo;
v1.HitboxInfo = {
    Size = Vector3.new(3, 1, 3.4000000953674316, 0)
};
v1.CoreInfo = deepcopy(v0.CoreInfo);
v1.CoreInfo.WalkSpeed = 7;
v1.CoreInfo.BlockEnergy = 46;
v1.BlockAnimations = v0.BlockAnimations;
v1.HitAnimations = v0.HitAnimations;
v1.DashInfo = {
    DefaultInfo = {
        FadeIn = 0.1, 
        AnimSpeed = 1.2, 
        Stamina = 20, 
        DashStartup = 0.05, 
        DashTime = 0.26666666666666666, 
        StartWindow = 0, 
        DashWindow = 0.2, 
        MinTime = 0.31666666666666665, 
        MaxTime = 0.31666666666666665, 
        DashDelay = 0.5333333333333333, 
        MaxDistance = 6.2, 
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
v1.GetDash = function(_, v14, v15) --[[ Line: 560 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v1 (copy)
    local v16 = "Forward";
    local l_LookVector_0 = v14.CFrame.LookVector;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    if v15.X < -0.5 or v15.X > 0.5 then
        v18 = l_RayHelper_0:GetCharactersExcept({
            v14.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v23, v24 = l_RayHelper_0:GetRayWithWhiteList(v14.CFrame.Position, v14.CFrame.Position + l_LookVector_0, v1.DashInfo.DefaultInfo.MaxDistance, v18);
        v19 = l_l_RayHelper_0_RayWithWhiteList_0;
        v20 = v23;
        v21 = v24;
    end;
    if v15.Z > 0.8 then
        return "Backward", -v14.CFrame.LookVector;
    elseif v15.X < -0.5 then
        return "Left", (v14.CFrame.LookVector * (v19 and 0.8 or 0.3) + -v14.CFrame.RightVector * 0.9).Unit;
    else
        if v15.X > 0.5 then
            v16 = "Right";
            l_LookVector_0 = (v14.CFrame.LookVector * (v19 and 0.8 or 0.3) + v14.CFrame.RightVector * 0.9).Unit;
        end;
        return v16, l_LookVector_0;
    end;
end;
return v1;