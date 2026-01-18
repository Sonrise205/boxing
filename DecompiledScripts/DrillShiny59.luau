local l_CommonUtilities_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("CommonUtilities"));
local l_Date_0 = require(script.Parent:WaitForChild("Date"));
local v2 = l_CommonUtilities_0.DeepCopy(l_Date_0);
Init = function() --[[ Line: 7 ]] --[[ Name: Init ]]
    -- upvalues: l_Date_0 (ref), v2 (ref), l_CommonUtilities_0 (copy)
    l_Date_0 = require(script.Parent:WaitForChild("Date"));
    v2 = l_CommonUtilities_0.DeepCopy(l_Date_0);
    v2.Init = Init;
    v2.Rarity = nil;
    v2.Shiny = true;
    local _ = require(game.ReplicatedFirst:WaitForChild("Places"));
    v2.HiddenRarity = "Rare";
    v2.ShortName = "DRILL";
    v2.DisplayName = "Drill Style";
    v2.Description = "So can we wander for a spell, and live in parallel? I want it to be true, to be like you, my heart sings a chorus out of tune. And I could leave it on a shelf or keep it to myself, but nothing could conceal the things I feel. My love, can you teach me to be real?";
    v2.BaseStyleName = "Date";
    v2.Titles = {
        [1] = {
            Name = "Drill1", 
            DisplayTitle = "Mesmerizer \226\173\144", 
            Quality = 13, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "Drill2", 
            DisplayTitle = "Liar Dancer \240\159\149\186", 
            Quality = 4, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "Drill3", 
            DisplayTitle = "Birdbrain \240\159\144\166", 
            Quality = 14, 
            Type = "Knockdowns", 
            Amount = 750
        }
    };
    local l_States_0 = workspace:WaitForChild("States");
    local _ = workspace:WaitForChild("Live");
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local _ = game:GetService("CollectionService");
    v2.AddAppearance = function(v8) --[[ Line: 63 ]]
        -- upvalues: l_States_0 (copy)
        local l_Player_0 = v8.Player;
        local v10 = v8.Character or l_Player_0 and l_Player_0.Character;
        if not v10 then
            return;
        else
            local v11 = l_States_0:WaitForChild(l_Player_0 and l_Player_0.Name or v10.Name);
            local v12 = v11 and v11:WaitForChild("PlayerData");
            local v13 = v12 and v12:WaitForChild("ShinyOutfits");
            local v14 = v12 and v12:WaitForChild("Style");
            if not v14 then
                return;
            else
                local v15 = v10 and workspace.Welds:FindFirstChild(v10.Name);
                local v16 = v15 and v15:FindFirstChild("WeldCharacter");
                local v17 = v10.Name == "SpinDummy";
                if v17 then
                    v16 = v10;
                end;
                if not v16 then
                    return;
                else
                    if v10 then
                        if v10:GetAttribute("ShinyOutfitId") == script.Name then
                            return;
                        else
                            v10:SetAttribute("ShinyOutfitId", script.Name);
                        end;
                    end;
                    local v18 = {};
                    local l_Catalog_0 = game:GetService("ReplicatedStorage"):WaitForChild("Catalog");
                    local l_SearchHelper_0 = require(l_Catalog_0:WaitForChild("SearchHelper"));
                    local v21 = v10 and v10:WaitForChild("Humanoid", 20);
                    local v22 = v21 and v21:FindFirstChild("HumanoidDescription", 20);
                    v10:SetAttribute("R6", script.Name);
                    l_Player_0:SetAttribute("R6", script.Name);
                    local function _(v23, v24) --[[ Line: 99 ]] --[[ Name: SetShinyOutfit ]]
                        -- upvalues: v13 (copy), l_Player_0 (copy), v17 (copy), l_SearchHelper_0 (copy)
                        local l_Value_0 = v13.Value;
                        if v24 ~= nil then
                            l_Value_0 = v24;
                        end;
                        local v26 = l_Player_0 or v23;
                        if v17 then
                            v26 = v23;
                        end;
                        task.wait(0.1);
                        if l_Player_0 and not v17 then
                            l_SearchHelper_0.UpdateAppearance(l_Player_0);
                            return;
                        else
                            l_SearchHelper_0.UpdateModelAppearance(v23);
                            return;
                        end;
                    end;
                    if v22 then
                        local _ = v13.Value;
                        local v29 = l_Player_0 or v10;
                        if v17 then
                            v29 = v10;
                        end;
                        task.wait(0.1);
                        if l_Player_0 and not v17 then
                            l_SearchHelper_0.UpdateAppearance(l_Player_0);
                        else
                            l_SearchHelper_0.UpdateModelAppearance(v10);
                        end;
                        v18[#v18 + 1] = v13.Changed:Connect(function() --[[ Line: 118 ]]
                            -- upvalues: v10 (copy), v13 (copy), l_Player_0 (copy), v17 (copy), l_SearchHelper_0 (copy)
                            local l_v10_0 = v10;
                            local _ = v13.Value;
                            local v32 = l_Player_0 or l_v10_0;
                            if v17 then
                                v32 = l_v10_0;
                            end;
                            task.wait(0.1);
                            if l_Player_0 and not v17 then
                                l_SearchHelper_0.UpdateAppearance(l_Player_0);
                                return;
                            else
                                l_SearchHelper_0.UpdateModelAppearance(l_v10_0);
                                return;
                            end;
                        end);
                    end;
                    v18[#v18 + 1] = v14.Changed:Connect(function() --[[ Line: 124 ]]
                        -- upvalues: v14 (copy), v18 (copy), v10 (copy), v13 (copy), l_Player_0 (copy), v17 (copy), l_SearchHelper_0 (copy)
                        if v14.Value == script.Name then
                            return;
                        else
                            for _, v34 in v18 do
                                v34:Disconnect();
                            end;
                            if v10 and v10:GetAttribute("ShinyOutfitId") == script.Name then
                                v10:SetAttribute("ShinyOutfitId", nil);
                            end;
                            local l_v10_1 = v10;
                            local l_Value_3 = v13.Value;
                            l_Value_3 = false;
                            local v37 = l_Player_0 or l_v10_1;
                            if v17 then
                                v37 = l_v10_1;
                            end;
                            task.wait(0.1);
                            if l_Player_0 and not v17 then
                                l_SearchHelper_0.UpdateAppearance(l_Player_0);
                                return;
                            else
                                l_SearchHelper_0.UpdateModelAppearance(l_v10_1);
                                return;
                            end;
                        end;
                    end);
                    return;
                end;
            end;
        end;
    end;
    if game:GetService("RunService"):IsServer() then
        local _ = game:GetService("CollectionService");
        local _ = game:GetService("Players");
        local function v45(v40) --[[ Line: 143 ]] --[[ Name: StyleEquipped ]]
            -- upvalues: l_States_0 (copy), v2 (ref)
            local l_Player_1 = v40.Player;
            local v42 = v40.Character or l_Player_1 and l_Player_1.Character;
            if not v42 then
                return;
            else
                local v43 = l_States_0:WaitForChild(v42.Name);
                local v44 = v43 and v43:WaitForChild("PlayerData");
                if not (v44 and v44:WaitForChild("Style")) then
                    return;
                else
                    v2.AddAppearance(v40);
                    return;
                end;
            end;
        end;
        local l_v45_0 = v45 --[[ copy: 7 -> 8 ]];
        v2.ServerOnSet = function(v47) --[[ Line: 156 ]]
            -- upvalues: l_v45_0 (copy), l_States_0 (copy)
            if not game:GetService("RunService"):IsServer() then
                return;
            else
                l_v45_0(v47);
                local l_Player_2 = v47.Player;
                if not l_Player_2 then
                    return;
                else
                    local v49 = l_States_0:WaitForChild(l_Player_2.Name);
                    local v50 = v49 and v49:WaitForChild("PlayerData");
                    local v51 = v50 and v50:WaitForChild("Style");
                    if not v51 then
                        return;
                    else
                        local v52 = {};
                        v52[#v52 + 1] = workspace.Live.ChildAdded:Connect(function(v53) --[[ Line: 171 ]]
                            -- upvalues: l_Player_2 (copy), v47 (copy), l_v45_0 (ref)
                            if v53.Name ~= l_Player_2.Name then
                                return;
                            else
                                task.wait(0.5);
                                if not v53 or v53.Parent ~= workspace.Live then
                                    return;
                                else
                                    v47.Character = v53;
                                    l_v45_0(v47);
                                    return;
                                end;
                            end;
                        end);
                        v52[#v52 + 1] = v51.Changed:Connect(function() --[[ Line: 182 ]]
                            -- upvalues: v52 (copy)
                            for _, v55 in v52 do
                                v55:Disconnect();
                            end;
                        end);
                        return;
                    end;
                end;
            end;
        end;
    end;
    local _ = game:GetService("TweenService");
    local _ = game:GetService("Players");
    local _ = l_ReplicatedStorage_0:WaitForChild("Modules");
    v2.CoreInfo.StaminaBreakAnimId = 107198092986049;
    v2.HitAnimations = {
        Left = 117258508166668, 
        Right = 114113555416861, 
        Forward = 107210331223338, 
        BodyLeft = 85019357965412, 
        BodyRight = 70478248244994, 
        BodyForward = 97761930318609, 
        LeftHeavy = 123795563057260, 
        RightHeavy = 133086399321214, 
        ForwardHeavy = 116754122128423, 
        BodyLeftHeavy = 101086960524335, 
        BodyRightHeavy = 101086960524335, 
        BodyForwardHeavy = 101086960524335
    };
    v2.DefaultPunchInfo = {
        ShakeInfo = {
            Preset = "LightHit", 
            FoV = 68
        }
    };
    v2.Combos[1] = {
        [1] = {
            AnimId = 102595654855558, 
            AnimSpeed = 0.8, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "LeftHand", 
                DelayTime = 0.25, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.9
            }
        }, 
        [2] = {
            AnimId = 96911934100663, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.85
            }
        }, 
        [3] = {
            AnimId = 130940409118543, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "LeftHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.85
            }
        }, 
        [4] = {
            AnimId = 74589177978288, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "LeftHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.85
            }
        }, 
        [5] = {
            AnimId = 88534720542482, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.85
            }
        }, 
        [6] = {
            AnimId = 111324338842587, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "RightHand", 
                DelayTime = 0.25, 
                HoldTime = 0.25, 
                TimeScale = 1
            }
        }, 
        [7] = {
            AnimId = 106275682722189, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "LeftHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.85
            }
        }
    };
    v2.Combos[2] = {
        [1] = {
            AnimId = 104017347392682, 
            AnimSpeed = 0.8, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "RightHand", 
                DelayTime = 0.25, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.85
            }
        }, 
        [2] = {
            AnimId = 130940409118543, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "LeftHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.85
            }
        }, 
        [3] = {
            AnimId = 96911934100663, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.85
            }
        }, 
        [4] = {
            AnimId = 111324338842587, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "RightHand", 
                DelayTime = 0.25, 
                HoldTime = 0.25, 
                TimeScale = 1
            }
        }, 
        [5] = {
            AnimId = 106275682722189, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "LeftHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.85
            }
        }, 
        [6] = {
            AnimId = 123111409535992, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.85
            }
        }
    };
    v2.HeavyAttacks = {
        [1] = {
            AnimId = 86115875909719, 
            AnimSpeed = 0.93, 
            ExtraEffect = {
                Effect = "Baguette", 
                EffectDelay = 0.4666666666666667
            }, 
            HitInfo = {
                Direction = "LeftHeavy", 
                AnimName = "LeftHeavy"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "RightHand", 
                DelayTime = 0.43333333333333335, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.85
            }
        }
    };
    v2.DashInfo = {
        Forward = {
            AnimSpeed = 1, 
            AnimId = 79327453770931
        }, 
        Backward = {
            AnimSpeed = 1, 
            AnimId = 75102334138170
        }, 
        Left = {
            AnimId = 103019787829777, 
            AnimSpeed = 1, 
            UseForSlowMoAnimOnly = true
        }, 
        Right = {
            AnimId = 117360292097507, 
            AnimSpeed = 1, 
            UseForSlowMoAnimOnly = true
        }
    };
    l_CommonUtilities_0.DeepMergeMissing(v2.Combos, l_Date_0.Combos);
    l_CommonUtilities_0.DeepMergeMissing(v2.DashInfo, l_Date_0.DashInfo);
    l_CommonUtilities_0.DeepMergeMissing(v2.HeavyAttacks, l_Date_0.HeavyAttacks);
    l_CommonUtilities_0.DeepMergeMissing(v2.DefaultPunchInfo, l_Date_0.DefaultPunchInfo);
    v2.UltimateInfo = {
        Effect = "Teto", 
        PreDelay = 1, 
        Time = 18.333333333333332, 
        Offset = CFrame.Angles(0, 0, 0.01), 
        EndOffset = CFrame.new(0, 0, 3.5), 
        StartOffset = CFrame.Angles(0, 0, 0) * CFrame.new(0, 0, 0), 
        CentreOffset = CFrame.new(-3, 0, -4), 
        DamageTimes = {
            {
                7.28, 
                25
            }, 
            {
                13.2, 
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
            AnimId = 73012096613745, 
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
    v2.BlockAnimations = {
        IdleFade = 0, 
        Idle = 77560262181375, 
        Break = 123097803141658, 
        Left = 72653367855540, 
        Right = 108587783258448, 
        Forward = 137530122853551, 
        BodyLeft = 72653367855540, 
        BodyRight = 108587783258448, 
        BodyForward = 137530122853551
    };
    return v2;
end;
v2.Init = Init;
Init();
if not require(game.ReplicatedFirst:WaitForChild("Places")):IsTesting() and script:FindFirstChild("Testing") then
    task.spawn(function() --[[ Line: 650 ]]
        local l_FirstChild_0 = game:GetService("ReplicatedFirst"):WaitForChild("Animations", 10):FindFirstChild(script.Name);
        if l_FirstChild_0 then
            l_FirstChild_0:Destroy();
        end;
    end);
    return v2;
else
    Init();
    game:GetService("ReplicatedStorage"):WaitForChild("Events", 30):WaitForChild("RemoteConfigLoaded", 30).Event:Connect(function() --[[ Line: 665 ]]
        Init();
    end);
    return v2;
end;