local v0 = {};
local l_Places_0 = require(game.ReplicatedFirst:WaitForChild("Places"));
if l_Places_0.IsTesting() or game:GetService("RunService"):IsStudio() then

end;
v0.ShortName = "VOID SAMURAI";
v0.DisplayName = "Void Samurai Style";
v0.Description = "If you are seeing this, I will not forgive you.";
v0.EquipDebounce = 3;
v0.SpecialInfo = {
    Name = "Call of the Void", 
    Type = "VoidSamurai", 
    Cooldown = 5
};
v0.Titles = {
    [1] = {
        Name = "Void1", 
        DisplayTitle = "The Void", 
        Quality = 1337, 
        Type = "Knockdowns", 
        Amount = 999999
    }
};
v0.ServerOnEquip = function(v2) --[[ Line: 32 ]]
    -- upvalues: l_Places_0 (copy)
    if not game:GetService("RunService"):IsServer() then
        return;
    else
        local l_Player_0 = v2.Player;
        local v4 = v2.Character or l_Player_0 and l_Player_0.Character;
        if not v4 then
            return;
        elseif l_Player_0 and v4:GetAttribute("VoidEquipped") then
            return;
        else
            local v5 = workspace:WaitForChild("States", 10):WaitForChild(v4.Name, 10):WaitForChild("CharacterData", 10);
            local v6 = tick();
            if v5 and v5.Cutscene.Value and l_Player_0 then
                repeat
                    task.wait();
                until not v5.Cutscene.Value or tick() - v6 > 10;
            end;
            local l_ServerScriptService_0 = game:GetService("ServerScriptService");
            local l_Utilities_0 = require(l_ServerScriptService_0:WaitForChild("Combat"):WaitForChild("Utilities"));
            local _ = require(l_ServerScriptService_0:WaitForChild("Data"):WaitForChild("ServerShared"));
            local l_CreateEffect_0 = game:GetService("ReplicatedStorage"):WaitForChild("UnreliableRemoteEvents"):WaitForChild("CreateEffect");
            local v11 = v4 and workspace.Welds:FindFirstChild(v4.Name);
            local v12 = v11 and v11:WaitForChild("WeldCharacter", 10) or v4;
            local v13 = script.Katana:Clone();
            local v14 = script.Sageo:Clone();
            v13.Main.Transparency = 1;
            v14.Main.Transparency = 1;
            task.delay(2, function() --[[ Line: 65 ]]
                -- upvalues: v13 (copy), v14 (copy)
                v13.Main.Transparency = 0;
                v14.Main.Transparency = 0;
            end);
            v13:SetAttribute(script.Parent.Name, true);
            v14:SetAttribute(script.Parent.Name, true);
            v13.Parent = v12;
            v14.Parent = v12;
            local l_Weld_0 = Instance.new("Weld");
            l_Weld_0.Parent = v13;
            l_Weld_0.Part0 = v13;
            l_Weld_0.Part1 = v4.RightHand;
            local l_Weld_1 = Instance.new("Weld");
            l_Weld_1.Parent = v14;
            l_Weld_1.Part0 = v14;
            l_Weld_1.Part1 = v4.LeftHand;
            for _, v18 in (l_Utilities_0.GetPlayersInRange(v4.PrimaryPart.Position, 50, nil)) do
                l_CreateEffect_0:FireClient(v18, {
                    "VoidSamuraiEquip", 
                    v4
                });
            end;
            if v4:GetAttribute("Character") then
                return;
            else
                v4:SetAttribute("VoidEquipped", true);
                task.delay(1, function() --[[ Line: 97 ]]
                    -- upvalues: v4 (copy)
                    v4:SetAttribute("VoidEquipped", nil);
                end);
                local v19 = tick();
                v4:SetAttribute("HyperArmor", v19);
                v4:SetAttribute("SuperArmor", v19);
                if not l_Player_0 then
                    l_Player_0 = game.Players:GetPlayerFromCharacter(v4);
                end;
                if l_Player_0 and l_Player_0:GetAttribute("HasMegaToken") == nil then
                    l_Player_0:SetAttribute("HasMegaToken", game:GetService("BadgeService"):UserHasBadgeAsync(l_Player_0.UserId, 3.545730467785735E15));
                    if l_Places_0:IsTesting() then
                        l_Player_0:SetAttribute("HasMegaToken", true);
                    end;
                end;
                local l_v4_Attribute_0 = v4:GetAttribute("ActiveNPC");
                local v21 = nil;
                if l_Player_0 and l_Player_0:GetAttribute("HasMegaToken") or l_v4_Attribute_0 then
                    v21 = game:GetService("ReplicatedStorage").Modules.EffectHelper.VoidAura;
                end;
                if l_Player_0.UserId == 1667922853 or l_Player_0.UserId == 230322300 or l_Player_0.Name == "drowningsome" then
                    v21 = game:GetService("ReplicatedStorage").Modules.EffectHelper.BlueVoidAura;
                    v4:SetAttribute("Raiden", true);
                end;
                if v21 then
                    for _, v23 in v4:GetChildren() do
                        if v23:IsA("BasePart") and v23.Name ~= "HumanoidRootPart" then
                            for _, v25 in v21:GetChildren() do
                                local v26 = v25:Clone();
                                v26.Name = "VoidAura";
                                v26.Parent = v23;
                            end;
                        end;
                    end;
                end;
                task.delay(1, function() --[[ Line: 143 ]]
                    -- upvalues: v4 (copy), v19 (copy)
                    if v4:GetAttribute("HyperArmor") == v19 then
                        v4:SetAttribute("HyperArmor", nil);
                        v4:SetAttribute("SuperArmor", nil);
                    end;
                end);
                return;
            end;
        end;
    end;
end;
v0.ServerOnUnequip = function(v27) --[[ Line: 151 ]]
    local l_Player_1 = v27.Player;
    local v29 = v27.Character or l_Player_1 and l_Player_1.Character;
    if not v29 then
        return;
    else
        local l_ServerScriptService_1 = game:GetService("ServerScriptService");
        local l_Utilities_1 = require(l_ServerScriptService_1:WaitForChild("Combat"):WaitForChild("Utilities"));
        local _ = require(l_ServerScriptService_1:WaitForChild("Data"):WaitForChild("ServerShared"));
        local l_CreateEffect_1 = game:GetService("ReplicatedStorage"):WaitForChild("UnreliableRemoteEvents"):WaitForChild("CreateEffect");
        for _, v35 in (l_Utilities_1.GetPlayersInRange(v29.PrimaryPart.Position, 50, nil)) do
            l_CreateEffect_1:FireClient(v35, {
                "VoidSamuraiUnequip", 
                v29
            });
        end;
        local v36 = v29 and workspace.Welds:FindFirstChild(v29.Name);
        local v37 = v36 and v36:WaitForChild("WeldCharacter", 10) or v29;
        local v38 = {};
        for _, v40 in v29:GetDescendants() do
            if v40.Name == "VoidAura" then
                table.insert(v38, v40);
                v40.Enabled = false;
            end;
        end;
        task.delay(3, function() --[[ Line: 184 ]]
            -- upvalues: v37 (copy), v38 (copy)
            for _, v42 in v37:GetChildren() do
                if v42:GetAttribute(script.Parent.Name) then
                    v42:Destroy();
                end;
            end;
            for _, v44 in v38 do
                v44:Destroy();
            end;
        end);
        return;
    end;
end;
v0.CoreInfo = {
    WalkSpeed = 9, 
    Health = 100, 
    HealthRecoveryTime = 1, 
    HealthRecoverySpeed = 0.15, 
    Stamina = 100, 
    DashRecoveryTime = 0.5, 
    StaminaRecoveryTime = 0.9, 
    StaminaRecoverySpeed = 6.6, 
    StaminaBreakAnimId = 132647962177228, 
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
    Stamina = 9.3, 
    Damage = 2, 
    BlockDamage = 3.5, 
    Recover = 100, 
    BreakRecover = 0.15, 
    Startup = 0.21666666666666667, 
    TrackTime = 0.16666666666666666, 
    MinTime = 0, 
    MaxTime = 0.8333333333333334, 
    StunTime = 0.9, 
    MoveDelay = 0.25, 
    AnimSpeed = 1, 
    FadeIn = 0.1, 
    HitSound = "SwordMain", 
    KnockbackInfo = {
        Distance = 1, 
        TargetTime = 0.2, 
        HitIndex = 1
    }, 
    ShakeInfo = {
        Preset = "LightHit", 
        FoV = 69
    }, 
    FlipbookSpeed = 1.8
};
v0.Combos[1] = {
    [1] = {
        AnimId = 85872985404160, 
        AnimSpeed = 1, 
        Stamina = 18.6, 
        Damage = 4, 
        BreakRecover = 0.3, 
        Startup = 0.4166666666666667, 
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
            EffectName = "VoidSamuraiTrail", 
            TargetPart = "RightHand", 
            HoldTime = 1.1666666666666667, 
            MeshDelay = 0.4166666666666667, 
            FlipbookSpeed = 1.4, 
            IsStartPunch = true, 
            MeshOffset = CFrame.new(-0.245, 0.327, -0.921), 
            MeshOrientation = Vector3.new(-26.391000747680664, 2.319000005722046, 73.8030014038086, 0)
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 68
        }
    }, 
    [2] = {
        AnimId = 89545444611210, 
        AnimSpeed = 1, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "VoidSamuraiTrail", 
            TargetPart = "RightHand", 
            HoldTime = 0.6666666666666666, 
            MeshDelay = v0.DefaultPunchInfo.Startup, 
            FlipbookSpeed = v0.DefaultPunchInfo.FlipbookSpeed - 0.03333333333333333, 
            MeshOffset = CFrame.new(0.154, -0.04, -0.39), 
            MeshOrientation = Vector3.new(9.786999702453613, -111.5770034790039, -170.9199981689453, 0)
        }
    }, 
    [3] = {
        AnimId = 110332445388637, 
        AnimSpeed = 1, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "VoidSamuraiTrail", 
            TargetPart = "RightHand", 
            HoldTime = 0.6666666666666666, 
            MeshDelay = v0.DefaultPunchInfo.Startup, 
            FlipbookSpeed = v0.DefaultPunchInfo.FlipbookSpeed, 
            MeshOffset = CFrame.new(0.393, 0.145, -1.479), 
            MeshOrientation = Vector3.new(16.85700035095215, 14.003000259399414, -17.025999069213867, 0)
        }
    }, 
    [4] = {
        AnimId = 104105407291128, 
        AnimSpeed = 1, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "VoidSamuraiTrail", 
            TargetPart = "RightHand", 
            HoldTime = 0.6666666666666666, 
            MeshDelay = v0.DefaultPunchInfo.Startup, 
            FlipbookSpeed = v0.DefaultPunchInfo.FlipbookSpeed, 
            MeshOffset = CFrame.new(0.488, 0.88, -0.493), 
            MeshOrientation = Vector3.new(4.020999908447266, -156.83599853515625, -177.18600463867188, 0)
        }
    }, 
    [5] = {
        AnimId = 81544004724370, 
        AnimSpeed = 1, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "VoidSamuraiTrail", 
            TargetPart = "RightHand", 
            HoldTime = 1.1666666666666667, 
            MeshDelay = v0.DefaultPunchInfo.Startup, 
            FlipbookSpeed = v0.DefaultPunchInfo.FlipbookSpeed, 
            MeshOffset = CFrame.new(-0.142, 0.197, -1.472), 
            MeshOrientation = Vector3.new(-81.98400115966797, 44.750999450683594, 54.0620002746582, 0)
        }
    }
};
v0.Combos[2] = {
    [1] = {
        AnimId = 130698885460313, 
        AnimSpeed = 1, 
        Stamina = 18.6, 
        Damage = 4, 
        BreakRecover = 0.3, 
        Startup = 0.4166666666666667, 
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
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "VoidSamuraiTrail", 
            TargetPart = "RightHand", 
            HoldTime = 1.1666666666666667, 
            MeshDelay = 0.4166666666666667, 
            FlipbookSpeed = 1.8, 
            IsStartPunch = true, 
            MeshOffset = CFrame.new(-0.218, 0.04, -1.457), 
            MeshOrientation = Vector3.new(24.4950008392334, 78.41400146484375, 5.552999973297119, 0)
        }, 
        ShakeInfo = {
            Preset = "MedHit", 
            FoV = 68
        }
    }, 
    [2] = {
        AnimId = 104105407291128, 
        AnimSpeed = 1, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "Right"
        }, 
        TrailInfo = {
            EffectName = "VoidSamuraiTrail", 
            TargetPart = "RightHand", 
            HoldTime = 0.6666666666666666, 
            MeshDelay = v0.DefaultPunchInfo.Startup, 
            FlipbookSpeed = v0.DefaultPunchInfo.FlipbookSpeed, 
            MeshOffset = CFrame.new(0.488, 0.88, -0.493), 
            MeshOrientation = Vector3.new(4.020999908447266, -156.83599853515625, -177.18600463867188, 0)
        }
    }, 
    [3] = {
        AnimId = 110332445388637, 
        AnimSpeed = 1, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "BodyLeft"
        }, 
        TrailInfo = {
            EffectName = "VoidSamuraiTrail", 
            TargetPart = "RightHand", 
            HoldTime = 0.6666666666666666, 
            MeshDelay = v0.DefaultPunchInfo.Startup, 
            FlipbookSpeed = v0.DefaultPunchInfo.FlipbookSpeed, 
            MeshOffset = CFrame.new(0.393, 0.145, -1.479), 
            MeshOrientation = Vector3.new(16.85700035095215, 14.003000259399414, -17.025999069213867, 0)
        }
    }, 
    [4] = {
        AnimId = 89545444611210, 
        AnimSpeed = 1, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRight"
        }, 
        TrailInfo = {
            EffectName = "VoidSamuraiTrail", 
            TargetPart = "RightHand", 
            HoldTime = 0.6666666666666666, 
            MeshDelay = v0.DefaultPunchInfo.Startup, 
            FlipbookSpeed = v0.DefaultPunchInfo.FlipbookSpeed, 
            MeshOffset = CFrame.new(0.154, -0.04, -0.39), 
            MeshOrientation = Vector3.new(9.786999702453613, -111.5770034790039, -170.9199981689453, 0)
        }
    }, 
    [5] = {
        AnimId = 81544004724370, 
        AnimSpeed = 1, 
        HitInfo = {
            Direction = "Forward", 
            AnimName = "Forward"
        }, 
        TrailInfo = {
            EffectName = "VoidSamuraiTrail", 
            TargetPart = "RightHand", 
            HoldTime = 0.6666666666666666, 
            MeshDelay = v0.DefaultPunchInfo.Startup, 
            FlipbookSpeed = v0.DefaultPunchInfo.FlipbookSpeed, 
            MeshOffset = CFrame.new(-0.142, 0.197, -1.472), 
            MeshOrientation = Vector3.new(-81.98400115966797, 44.750999450683594, 54.0620002746582, 0)
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
        Stamina = 18.6, 
        Damage = 6, 
        Recover = 0, 
        BreakRecover = 1, 
        Startup = 0.5833333333333334, 
        TrackTime = 0.16666666666666666, 
        MinTime = 0.8666666666666667, 
        MaxTime = 1, 
        StunTime = 0.5, 
        MoveDelay = 0.25, 
        AnimSpeed = 1, 
        FadeIn = 0.1, 
        HitSound = "SwordHeavy", 
        KnockbackInfo = {
            Distance = 1, 
            TargetTime = 0.2, 
            HitIndex = 1
        }, 
        ShakeInfo = {
            Preset = "SuperHardHit", 
            WaitTime = 0.15, 
            Fade = 0.3, 
            FoVMult = 1.5, 
            FoV = 62
        }, 
        ExtraHitEffect = {
            EffectName = "VoidSlash", 
            AddCFrame = CFrame.new(0, -1.5, 0) * CFrame.Angles(-0.5235987755982988, 0, -0.5235987755982988)
        }
    }, 
    [1] = {
        AnimId = 95869957630168, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "BodyRightHeavy"
        }, 
        TrailInfo = {
            EffectName = "VoidSamuraiTrail", 
            TargetPart = "LeftHand", 
            HoldTime = 0.8333333333333334, 
            MeshDelay = 0.6666666666666666, 
            FlipbookSpeed = 1.3, 
            IsStartPunch = true, 
            MeshOffset = CFrame.new(-0.126, -0.003, -0.279), 
            MeshOrientation = Vector3.new(21.006000518798828, -107.24299621582031, 166.77000427246094, 0)
        }
    }
};
v0.DashInfo = {
    DefaultInfo = {
        FadeIn = 0.1, 
        AnimSpeed = 1.1, 
        Stamina = 9, 
        DashStartup = 0.05, 
        DashTime = 0.3, 
        StartWindow = 0, 
        DashWindow = 0.175, 
        MinTime = 0.31666666666666665, 
        MaxTime = 0.31666666666666665, 
        DashDelay = 0.4666666666666667, 
        MaxDistance = 5.8, 
        Responsiveness = 25, 
        Velocity = 30
    }, 
    Forward = {
        AnimSpeed = 0.9, 
        AnimId = 137403755106227
    }, 
    Backward = {
        AnimSpeed = 0.9, 
        AnimId = 132079618644712, 
        MinTime = 0.31666666666666665, 
        MaxTime = 0.31666666666666665
    }, 
    Left = {
        AnimSpeed = 0.9, 
        AnimId = 94619378319516, 
        UseForSlowMoAnimOnly = true
    }, 
    Right = {
        AnimSpeed = 0.9, 
        AnimId = 90843954505441, 
        UseForSlowMoAnimOnly = true
    }
};
v0.UltimateInfo = {
    Effect = "Samurai", 
    PreDelay = 1, 
    Time = 12, 
    Offset = CFrame.new(0, 0, 0.01), 
    EndOffset = CFrame.new(0, 0, 3.5) * CFrame.Angles(0, 3.141592653589793, 0), 
    StartOffset = CFrame.Angles(0, 3.141592653589793, 0), 
    DamageTimes = {
        {
            1.25, 
            50
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
        HitSound = "SwordHeavy", 
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
v0.HitboxInfo = {
    Size = Vector3.new(3, 1, 3.299999952316284, 0)
};
v0.BlockAnimations = {
    IdleFade = 0.08333333333333333, 
    Idle = 93717079526131, 
    Break = 13633646743, 
    Left = 111150459332408, 
    Right = 90362507750839, 
    Forward = 95311275282455, 
    BodyLeft = 111150459332408, 
    BodyRight = 90362507750839, 
    BodyForward = 95311275282455
};
v0.HitAnimations = {
    Left = 130332631422054, 
    Right = 102308427521472, 
    Forward = 140311552224326, 
    BodyLeft = 135940819399390, 
    BodyRight = 92820757003146, 
    BodyForward = 97992028351730, 
    LeftHeavy = 78990920948402, 
    RightHeavy = 108115605772957, 
    ForwardHeavy = 119844293136234, 
    BodyLeftHeavy = 135940819399390, 
    BodyRightHeavy = 92820757003146, 
    BodyForwardHeavy = 105760278967970
};
local _ = game:GetService("Workspace");
local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
v0.GetDash = function(_, v49, v50) --[[ Line: 814 ]] --[[ Name: GetDash ]]
    -- upvalues: l_RayHelper_0 (copy), v0 (copy)
    local v51 = "Forward";
    local l_LookVector_0 = v49.CFrame.LookVector;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    if v50.X < -0.5 or v50.X > 0.5 then
        v53 = l_RayHelper_0:GetCharactersExcept({
            v49.Parent
        });
        local l_l_RayHelper_0_RayWithWhiteList_0, v58, v59 = l_RayHelper_0:GetRayWithWhiteList(v49.CFrame.Position, v49.CFrame.Position + l_LookVector_0, v0.DashInfo.DefaultInfo.MaxDistance, v53);
        v54 = l_l_RayHelper_0_RayWithWhiteList_0;
        v55 = v58;
        v56 = v59;
    end;
    if v50.Z > 0.8 then
        return "Backward", -v49.CFrame.LookVector;
    elseif v50.X < -0.5 then
        return "Left", (v49.CFrame.LookVector * (v54 and 0.7 or 0.5) + -v49.CFrame.RightVector * 0.5).Unit;
    else
        if v50.X > 0.5 then
            v51 = "Right";
            l_LookVector_0 = (v49.CFrame.LookVector * (v54 and 0.7 or 0.5) + v49.CFrame.RightVector * 0.5).Unit;
        end;
        return v51, l_LookVector_0;
    end;
end;
return v0;