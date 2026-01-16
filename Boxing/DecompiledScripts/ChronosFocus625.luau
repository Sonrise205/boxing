local v0 = require(script.Parent);
local v1 = {
    HitboxInfo = v0.HitboxInfo, 
    DefaultMoverInfo = v0.DefaultMoverInfo, 
    Combos = {}, 
    DefaultMoverInfo = {
        Responsiveness = 75, 
        MaxDistance = 0.05, 
        Velocity = 20, 
        MaxTime = 0.3333333333333333
    }, 
    DefaultPunchInfo = {
        Stamina = 7.199999999999999, 
        Damage = 2, 
        BlockDamage = 1.6, 
        Recover = 100, 
        BreakRecover = 0.05, 
        Startup = 0.18333333333333332, 
        TrackTime = 0.16666666666666666, 
        CounterMult = 3.5, 
        RetryTime = 0.1, 
        MinTime = 0, 
        MaxTime = 0.8333333333333334, 
        DelayMult = 1.09, 
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
v1.Combos[1] = {
    [1] = {
        AnimId = 17084497407, 
        AnimSpeed = 0.95, 
        Stamina = 10.799999999999999, 
        Damage = 2.5, 
        BreakRecover = 0.1, 
        Startup = 0.3333333333333333, 
        TrackTime = 0.25, 
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
        AnimId = 15443969659, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "LeftHand", 
            DelayTime = 0.06666666666666667, 
            HoldTime = 0.16666666666666666
        }
    }, 
    [3] = {
        AnimId = 13905183614, 
        AnimSpeed = 1.5, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "RightHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.03333333333333333
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
            DelayTime = 0.06666666666666667, 
            HoldTime = 0.16666666666666666
        }
    }, 
    [5] = {
        AnimId = 13633649251, 
        AnimSpeed = 1.4, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "RightHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.06666666666666667
        }
    }, 
    [6] = {
        AnimId = 13992205894, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "LeftHand", 
            DelayTime = 0.06666666666666667, 
            HoldTime = 0.16666666666666666
        }
    }, 
    [7] = {
        AnimId = 17082782289, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Left"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "RightHand", 
            DelayTime = 0.06666666666666667, 
            HoldTime = 0.16666666666666666
        }
    }
};
v1.Combos[2] = {
    [1] = {
        AnimId = 17080178247, 
        AnimSpeed = 0.9, 
        Stamina = 10.799999999999999, 
        Damage = 2.5, 
        BreakRecover = 0.1, 
        Startup = 0.3333333333333333, 
        TrackTime = 0.25, 
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
            DelayTime = 0.06666666666666667, 
            HoldTime = 0.16666666666666666
        }
    }, 
    [3] = {
        AnimId = 13992205894, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "LeftHand", 
            DelayTime = 0.06666666666666667, 
            HoldTime = 0.16666666666666666
        }
    }, 
    [4] = {
        AnimId = 13905183614, 
        AnimSpeed = 1.5, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "RightHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.03333333333333333
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
            DelayTime = 0.06666666666666667, 
            HoldTime = 0.16666666666666666
        }
    }, 
    [6] = {
        AnimId = 13633649251, 
        AnimSpeed = 1.4, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Chronos", 
            TargetPart = "RightHand", 
            DelayTime = 0.13333333333333333, 
            HoldTime = 0.06666666666666667
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
            TrailName = "Chronos", 
            TargetPart = "LeftHand", 
            DelayTime = 0.06666666666666667, 
            HoldTime = 0.16666666666666666
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
        Stamina = 14.399999999999999, 
        Damage = 6, 
        Recover = 0, 
        BreakRecover = 0.55, 
        CounterMult = 2.8, 
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
deepcopy = function(v2, v3) --[[ Line: 498 ]] --[[ Name: deepcopy ]]
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
v1.UltimateInfo = {
    Effect = "Chronos", 
    PreDelay = 1, 
    Time = 15.416666666666666, 
    Offset = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 0, 3.5), 
    DamageTimes = {
        {
            5.583333333333333, 
            20
        }, 
        {
            7.166666666666667, 
            0.2
        }, 
        {
            7.55, 
            0.2
        }, 
        {
            7.816666666666666, 
            0.2
        }, 
        {
            7.933333333333334, 
            0.2
        }, 
        {
            8.133333333333333, 
            0.2
        }, 
        {
            8.333333333333334, 
            0.5
        }, 
        {
            8.45, 
            0.5
        }, 
        {
            8.583333333333334, 
            0.5
        }, 
        {
            8.766666666666667, 
            0.5
        }, 
        {
            8.916666666666666, 
            0.5
        }, 
        {
            9.1, 
            0.5
        }, 
        {
            9.3, 
            1
        }, 
        {
            13.816666666666666, 
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
v1.CoreInfo = deepcopy(v0.CoreInfo);
v1.CoreInfo.WalkSpeed = 10;
v1.CoreInfo.NoBlock = true;
v1.CoreInfo.IgnoreEnergy = true;
v1.CoreInfo.StartAbilityEnergy = nil;
v1.CoreInfo.NoDualCounters = true;
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v10 = {};
v1.SpecialInfo = {
    Name = "Focus", 
    Type = "Chronos", 
    Cooldown = 10, 
    IsMeter = true, 
    Added = function() --[[ Line: 631 ]] --[[ Name: Added ]]
        -- upvalues: l_RunService_0 (copy), l_Players_0 (copy), v10 (copy)
        local v11 = false;
        if l_RunService_0:IsServer() then
            return;
        else
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local _ = game:GetService("ReplicatedFirst");
            local v14;
            if game:GetService("RunService"):IsClient() then
                v14 = shared.BridgeNet2;
                if not v14 then
                    repeat
                        task.wait();
                    until shared.BridgeNet2;
                    v14 = shared.BridgeNet2;
                    v11 = v14;
                else
                    v11 = true;
                end;
            end;
            if not v11 then
                if not v11 then
                    v14 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
                end;
            end;
            v11 = false;
            local v15 = v14.ReferenceBridge("IsEmoting");
            v10[1] = l_Character_0:GetAttributeChangedSignal("CurrentEmote"):Connect(function() --[[ Line: 642 ]]
                -- upvalues: l_Character_0 (copy), v15 (copy)
                local l_l_Character_0_Attribute_0 = l_Character_0:GetAttribute("CurrentEmote");
                v15:Fire(l_l_Character_0_Attribute_0 and true or false);
            end);
            return;
        end;
    end, 
    Removed = function() --[[ Line: 648 ]] --[[ Name: Removed ]]
        -- upvalues: l_RunService_0 (copy), v10 (copy)
        if l_RunService_0:IsServer() then
            return;
        else
            for _, v18 in v10 do
                v18:Disconnect();
            end;
            return;
        end;
    end
};
v1.BlockAnimations = v0.BlockAnimations;
v1.HitAnimations = v0.HitAnimations;
v1.DashInfo = {
    DefaultInfo = {
        FadeIn = 0.1, 
        AnimSpeed = 1.2, 
        Stamina = 6.5, 
        DashStartup = 0.05, 
        DashTime = 0.23333333333333334, 
        StartWindow = 0, 
        DashWindow = 0.16666666666666666, 
        MinTime = 0.31666666666666665, 
        MaxTime = 0.31666666666666665, 
        DashDelay = 0.31666666666666665, 
        MaxDistance = 7, 
        Responsiveness = 25, 
        Velocity = 42
    }, 
    Forward = {
        AnimSpeed = 0.9, 
        AnimId = 17060437446
    }, 
    Backward = {
        AnimSpeed = 0.8, 
        AnimId = 17067178396, 
        MinTime = 0.3, 
        MaxTime = 0.3, 
        MaxDistance = 5
    }, 
    Left = {
        AnimId = 17072887986
    }, 
    Right = {
        AnimId = 17073059579
    }
};
local _ = game:GetService("Workspace");
local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
v1.GetDash = function(_, v23, v24) --[[ Line: 713 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v1 (copy)
    local v25 = "Forward";
    local l_LookVector_0 = v23.CFrame.LookVector;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    if v24.X < -0.5 or v24.X > 0.5 then
        v27 = l_RayHelper_0:GetCharactersExcept({
            v23.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v32, v33 = l_RayHelper_0:GetRayWithWhiteList(v23.CFrame.Position, v23.CFrame.Position + l_LookVector_0, v1.DashInfo.DefaultInfo.MaxDistance, v27);
        v28 = l_l_RayHelper_0_RayWithWhiteList_0;
        v29 = v32;
        v30 = v33;
    end;
    if v24.Z > 0.8 then
        return "Backward", -v23.CFrame.LookVector;
    elseif v24.X < -0.5 then
        return "Left", (v23.CFrame.LookVector * (v28 and 0.8 or 0.3) + -v23.CFrame.RightVector * 0.9).Unit;
    else
        if v24.X > 0.5 then
            v25 = "Right";
            l_LookVector_0 = (v23.CFrame.LookVector * (v28 and 0.8 or 0.3) + v23.CFrame.RightVector * 0.9).Unit;
        end;
        return v25, l_LookVector_0;
    end;
end;
return v1;