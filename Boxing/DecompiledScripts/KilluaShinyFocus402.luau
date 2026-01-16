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
        AnimId = 102097508174004, 
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
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Killua (Hand)", 
            TargetPart = "RightHand", 
            DelayTime = 0.3, 
            HoldTime = 0.6
        }, 
        SlowMoInfo = {
            Direction = "Left"
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 68
        }, 
        ExtraEffect = {
            Effect = "KilluaM1", 
            DelayTime = 0.31, 
            FirstCFrame = CFrame.new(0.25, -1.5, -0.753) * CFrame.Angles(-0.49029789347024705, -2.561602289859558, -0.19188149796425658), 
            LastCFrame = CFrame.new(0.25, -0.092, -0.753) * CFrame.Angles(0.29548424236264, 9.948376736367678E-4, -0.2211855761052414), 
            ParticleRotation = -125
        }, 
        HitSound = "SwordMain"
    }, 
    [2] = {
        AnimId = 103067407872035, 
        AnimSpeed = 0.9, 
        Startup = 0.23333333333333334, 
        HitSound = "Kick1", 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Forward"
        }
    }, 
    [3] = {
        AnimId = 95066956195572, 
        AnimSpeed = 1, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Right"
        }
    }, 
    [4] = {
        AnimId = 91846485445627, 
        AnimSpeed = 0.8, 
        Startup = 0.23333333333333334, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "BodyForward"
        }
    }, 
    [5] = {
        AnimId = 84812962205067, 
        AnimSpeed = 0.9, 
        Startup = 0.21666666666666667, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Killua (Hand)", 
            TargetPart = "LeftHand", 
            DelayTime = 0.2, 
            HoldTime = 0.3
        }, 
        ExtraEffect = {
            Effect = "KilluaM1", 
            DelayTime = 0.08333333333333333, 
            FirstCFrame = CFrame.new(0, 0, 0) * CFrame.Angles(0.017453292519943295, 1.5533430342749532, 3.12413936106985), 
            LastCFrame = CFrame.new(-0.177, 0.023, -0.933) * CFrame.Angles(0.017453292519943295, -0.8726646259971648, 3.12413936106985), 
            ParticleRotation = -125
        }, 
        HitSound = "SwordMain"
    }, 
    [6] = {
        AnimId = 71952658368825, 
        AnimSpeed = 1, 
        Startup = 0.2, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Left"
        }, 
        ExtraEffect = {
            Effect = "KilluaM1", 
            DelayTime = 0.08333333333333333, 
            FirstCFrame = CFrame.new(0, 0, 0) * CFrame.Angles(-0.3490658503988659, -1.0471975511965976, -0.17453292519943295), 
            LastCFrame = CFrame.new(-0.177, 0.023, -0.933) * CFrame.Angles(0.3490658503988659, 1.239183768915974, -0.5235987755982988), 
            ParticleRotation = -20
        }, 
        HitSound = "SwordMain"
    }, 
    [7] = {
        AnimId = 104923666486008, 
        AnimSpeed = 1, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Right"
        }
    }, 
    [8] = {
        AnimId = 118999369678858, 
        AnimSpeed = 1, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }
    }, 
    [9] = {
        AnimId = 79242524830849, 
        AnimSpeed = 0.9, 
        Startup = 0.23333333333333334, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Killua (Hand)", 
            TargetPart = "LeftHand", 
            DelayTime = 0.25, 
            HoldTime = 0.3
        }, 
        ExtraEffect = {
            Effect = "KilluaM1", 
            DelayTime = 0.06666666666666667, 
            FirstCFrame = CFrame.new(0.25, -1.5, -0.753) * CFrame.Angles(0.017453292519943295, 1.2217304763960306, 3.12413936106985), 
            LastCFrame = CFrame.new(0.25, -0.092, -0.753) * CFrame.Angles(0.017453292519943295, -1.5533430342749532, 3.12413936106985), 
            ParticleRotation = -125
        }, 
        ParticleRotation = -20, 
        HitSound = "SwordMain"
    }
};
v1.Combos[2] = {
    [1] = {
        AnimId = 74005426490077, 
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
            Direction = "Right", 
            AnimName = "Forward"
        }, 
        SlowMoInfo = {
            Direction = "Right"
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 68
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Killua (Hand)", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3, 
            HoldTime = 0.6
        }
    }, 
    [2] = v1.Combos[1][6], 
    [3] = v1.Combos[1][5], 
    [4] = {
        AnimId = 114251033263757, 
        AnimSpeed = 0.9, 
        Startup = 0.23333333333333334, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "Killua (Hand)", 
            TargetPart = "RightHand", 
            DelayTime = 0.25, 
            HoldTime = 0.3
        }, 
        ExtraEffect = {
            Effect = "KilluaM1", 
            DelayTime = 0.06666666666666667, 
            FirstCFrame = CFrame.new(0.25, -1.5, -0.753) * CFrame.Angles(0.017453292519943295, 1.2217304763960306, 3.12413936106985), 
            LastCFrame = CFrame.new(0.25, -0.092, -0.753) * CFrame.Angles(0.017453292519943295, -1.5533430342749532, 3.12413936106985)
        }, 
        HitSound = "SwordMain"
    }, 
    [5] = v1.Combos[1][7], 
    [6] = v1.Combos[1][9], 
    [7] = v1.Combos[1][2], 
    [8] = v1.Combos[1][3], 
    [9] = v1.Combos[1][4]
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
    [1] = v0.HeavyAttacks[1], 
    [2] = v0.HeavyAttacks[2], 
    [3] = v0.HeavyAttacks[3]
};
deepcopy = function(v2, v3) --[[ Line: 423 ]] --[[ Name: deepcopy ]]
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
v1.CoreInfo = deepcopy(require(script.Parent.Parent.Chronos).CoreInfo);
v1.CoreInfo.WalkSpeed = 10;
v1.CoreInfo.NoBlock = true;
v1.CoreInfo.IgnoreEnergy = true;
v1.CoreInfo.StartAbilityEnergy = 100;
v1.CoreInfo.NoDualCounters = true;
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v10 = {};
v1.SpecialInfo = {
    Name = "Focus", 
    Type = "KilluaShiny", 
    Cooldown = 10, 
    IsMeter = true, 
    Added = function() --[[ Line: 556 ]] --[[ Name: Added ]]
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
            v10[1] = l_Character_0:GetAttributeChangedSignal("CurrentEmote"):Connect(function() --[[ Line: 566 ]]
                -- upvalues: l_Character_0 (copy), v15 (copy)
                local l_l_Character_0_Attribute_0 = l_Character_0:GetAttribute("CurrentEmote");
                v15:Fire(l_l_Character_0_Attribute_0 and true or false);
            end);
            return;
        end;
    end, 
    Removed = function() --[[ Line: 572 ]] --[[ Name: Removed ]]
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
local v19 = nil;
local v20 = nil;
local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_CommonUtilities_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("CommonUtilities"));
v1.OnClientDash = function(v23) --[[ Line: 590 ]]
    -- upvalues: v19 (ref), v20 (ref), l_Modules_0 (copy), l_Players_0 (copy), l_CommonUtilities_0 (copy)
    local l_Player_0 = v23.Player;
    local v25 = v23.Character or l_Player_0 and l_Player_0.Character;
    if not v25 then
        return;
    else
        if not v19 or not v20 then
            v19 = require(l_Modules_0:WaitForChild("EffectHelper"));
            v20 = require(l_Modules_0:WaitForChild("SoundHelper"));
        end;
        task.wait(0.06666666666666667);
        local l_Character_1 = l_Players_0.LocalPlayer.Character;
        local _ = l_CommonUtilities_0.GetOccupied(l_Character_1);
        local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
        l_ColorCorrectionEffect_0.Name = "DashCC";
        l_ColorCorrectionEffect_0.Parent = game.Lighting;
        local v29 = v20:PlaySound({
            Name = "FlashStep", 
            Parent = v25
        });
        task.delay(0.5, function() --[[ Line: 615 ]]
            -- upvalues: v29 (copy)
            if not v29 then
                return;
            else
                game:GetService("TweenService"):Create(v29, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Volume = 0
                }):Play();
                return;
            end;
        end);
        v19.SetTransparency(v25, 1, true);
        local l_Trail_0 = v25.HumanoidRootPart:FindFirstChild("Trail");
        for _, v32 in l_Trail_0:GetChildren() do
            if v32:IsA("Trail") then
                v32.Enabled = true;
            end;
        end;
        local v33 = require(l_Modules_0.Cutscene.Utilities);
        if l_Trail_0 then
            v33.Emit(l_Trail_0);
        end;
        task.delay(0.16666666666666666, function() --[[ Line: 637 ]]
            -- upvalues: v19 (ref), v25 (copy), l_Trail_0 (copy)
            v19.SetTransparency(v25, 0, true);
            for _, v35 in l_Trail_0:GetChildren() do
                if v35:IsA("Trail") then
                    v35.Enabled = false;
                end;
            end;
        end);
        return;
    end;
end;
v1.CoreInfo.IgnoreAfterimageOnDashes = true;
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
local l_Modules_1 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_RayHelper_0 = require(l_Modules_1:WaitForChild("RayHelper"));
v1.GetDash = function(_, v40, v41) --[[ Line: 703 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v1 (copy)
    local v42 = "Forward";
    local l_LookVector_0 = v40.CFrame.LookVector;
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    if v41.X < -0.5 or v41.X > 0.5 then
        v44 = l_RayHelper_0:GetCharactersExcept({
            v40.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v49, v50 = l_RayHelper_0:GetRayWithWhiteList(v40.CFrame.Position, v40.CFrame.Position + l_LookVector_0, v1.DashInfo.DefaultInfo.MaxDistance, v44);
        v45 = l_l_RayHelper_0_RayWithWhiteList_0;
        v46 = v49;
        v47 = v50;
    end;
    if v41.Z > 0.8 then
        return "Backward", -v40.CFrame.LookVector;
    elseif v41.X < -0.5 then
        return "Left", (v40.CFrame.LookVector * (v45 and 0.8 or 0.3) + -v40.CFrame.RightVector * 0.9).Unit;
    else
        if v41.X > 0.5 then
            v42 = "Right";
            l_LookVector_0 = (v40.CFrame.LookVector * (v45 and 0.8 or 0.3) + v40.CFrame.RightVector * 0.9).Unit;
        end;
        return v42, l_LookVector_0;
    end;
end;
return v1;