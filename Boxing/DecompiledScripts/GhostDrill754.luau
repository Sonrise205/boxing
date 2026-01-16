local l_CommonUtilities_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("CommonUtilities"));
local l_AncientGhost_0 = require(script.Parent:WaitForChild("AncientGhost"));
local v2 = l_CommonUtilities_0.DeepCopy(l_AncientGhost_0);
Init = function() --[[ Line: 7 ]] --[[ Name: Init ]]
    -- upvalues: l_AncientGhost_0 (ref), v2 (ref), l_CommonUtilities_0 (copy)
    l_AncientGhost_0 = require(script.Parent:WaitForChild("AncientGhost"));
    v2 = l_CommonUtilities_0.DeepCopy(l_AncientGhost_0);
    v2.Init = Init;
    v2.Rarity = nil;
    v2.Shiny = true;
    local _ = require(game.ReplicatedFirst:WaitForChild("Places"));
    v2.Unobtainable = true;
    v2.Hidden = true;
    v2.HiddenRarity = "Legendary";
    v2.ShortName = "GHOST DRILL";
    v2.DisplayName = "Ghost Drill Style";
    v2.Description = "A chimera that's out for revenge. Your fast jabs and strong heavys outmatch every other.";
    v2.BaseStyleName = "AncientGhost";
    local l_LocalPlayer_0 = game.Players.LocalPlayer;
    local function v10() --[[ Line: 31 ]] --[[ Name: IsVictimBlocking ]]
        -- upvalues: l_LocalPlayer_0 (copy)
        local l_Character_0 = l_LocalPlayer_0.Character;
        if not l_Character_0 then
            return;
        else
            local l_FirstChild_0 = workspace.States:FindFirstChild(l_Character_0.Name);
            local v7 = l_FirstChild_0 and l_FirstChild_0:FindFirstChild("Occupied");
            if not v7 then
                return;
            else
                local l_Value_0 = v7.LockedOn.Value;
                if not l_Value_0 then
                    return;
                else
                    local l_FirstChild_1 = workspace.States:FindFirstChild(l_Value_0.Name);
                    return (l_FirstChild_1 and l_FirstChild_1:FindFirstChild("CharacterData")).Blocking.Value;
                end;
            end;
        end;
    end;
    v2.SpecialInfo = {
        Name = "BIRDBRAIN", 
        Type = "GhostDrill", 
        MinAttackTime = 0, 
        MinTimeSinceLastDamage = 0, 
        Cooldown = 5, 
        IsMeter = true, 
        GetSpecialHeavy = function(_) --[[ Line: 57 ]] --[[ Name: GetSpecialHeavy ]]
            -- upvalues: v10 (copy)
            if v10() then
                return 9;
            else
                return 8;
            end;
        end, 
        Use = function() --[[ Line: 65 ]] --[[ Name: Use ]]
            -- upvalues: v10 (copy)
            local v12 = false;
            for _ = 1, 4 do
                if v10() then
                    local _ = game:GetService("ReplicatedFirst");
                    local v15;
                    if game:GetService("RunService"):IsClient() then
                        v15 = shared.BridgeNet2;
                        if not v15 then
                            repeat
                                task.wait();
                            until shared.BridgeNet2;
                            v15 = shared.BridgeNet2;
                            v12 = v15;
                        else
                            v12 = true;
                        end;
                    end;
                    if not v12 then
                        if not v12 then
                            v15 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
                        end;
                    end;
                    v12 = false;
                    v15.ReferenceBridge("TryAbility"):Fire(workspace:GetServerTimeNow());
                    return;
                else
                    task.wait(0.016666666666666666);
                end;
            end;
        end
    };
    v2.CoreInfo.MeterCharge = 10;
    v2.Titles = {
        [1] = {
            Name = "GhostDrill1", 
            DisplayTitle = "katatea \226\173\144", 
            Quality = 13, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "GhostDrill2", 
            DisplayTitle = "katatea \240\159\149\186", 
            Quality = 4, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "GhostDrill3", 
            DisplayTitle = "katatea \240\159\144\166", 
            Quality = 14, 
            Type = "Knockdowns", 
            Amount = 750
        }
    };
    local l_States_0 = workspace:WaitForChild("States");
    local _ = workspace:WaitForChild("Live");
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local _ = game:GetService("CollectionService");
    v2.AddAppearance = function(v20) --[[ Line: 119 ]]
        -- upvalues: l_States_0 (copy)
        local l_Player_0 = v20.Player;
        local v22 = v20.Character or l_Player_0 and l_Player_0.Character;
        if not v22 then
            return;
        else
            local v23 = l_States_0:WaitForChild(l_Player_0 and l_Player_0.Name or v22.Name);
            local v24 = v23 and v23:WaitForChild("PlayerData");
            local v25 = v24 and v24:WaitForChild("ShinyOutfits");
            local v26 = v24 and v24:WaitForChild("Style");
            if not v26 then
                return;
            else
                local v27 = v22 and workspace.Welds:FindFirstChild(v22.Name);
                local v28 = v27 and v27:FindFirstChild("WeldCharacter");
                local v29 = v22.Name == "SpinDummy";
                if v29 then
                    v28 = v22;
                end;
                if not v28 then
                    return;
                else
                    if v22 then
                        if v22:GetAttribute("ShinyOutfitId") == script.Name then
                            return;
                        else
                            v22:SetAttribute("ShinyOutfitId", script.Name);
                        end;
                    end;
                    local v30 = {};
                    local l_Catalog_0 = game:GetService("ReplicatedStorage"):WaitForChild("Catalog");
                    local l_SearchHelper_0 = require(l_Catalog_0:WaitForChild("SearchHelper"));
                    local v33 = v22 and v22:WaitForChild("Humanoid", 20);
                    local v34 = v33 and v33:FindFirstChild("HumanoidDescription", 20);
                    v22:SetAttribute("R6", script.Name);
                    l_Player_0:SetAttribute("R6", script.Name);
                    local function _(v35, v36) --[[ Line: 155 ]] --[[ Name: SetShinyOutfit ]]
                        -- upvalues: v25 (copy), l_Player_0 (copy), v29 (copy), l_SearchHelper_0 (copy)
                        local l_Value_1 = v25.Value;
                        if v36 ~= nil then
                            l_Value_1 = v36;
                        end;
                        local v38 = l_Player_0 or v35;
                        if v29 then
                            v38 = v35;
                        end;
                        task.wait(0.1);
                        if l_Player_0 and not v29 then
                            l_SearchHelper_0.UpdateAppearance(l_Player_0);
                            return;
                        else
                            l_SearchHelper_0.UpdateModelAppearance(v35);
                            return;
                        end;
                    end;
                    if v34 then
                        local _ = v25.Value;
                        local v41 = l_Player_0 or v22;
                        if v29 then
                            v41 = v22;
                        end;
                        task.wait(0.1);
                        if l_Player_0 and not v29 then
                            l_SearchHelper_0.UpdateAppearance(l_Player_0);
                        else
                            l_SearchHelper_0.UpdateModelAppearance(v22);
                        end;
                        v30[#v30 + 1] = v25.Changed:Connect(function() --[[ Line: 174 ]]
                            -- upvalues: v22 (copy), v25 (copy), l_Player_0 (copy), v29 (copy), l_SearchHelper_0 (copy)
                            local l_v22_0 = v22;
                            local _ = v25.Value;
                            local v44 = l_Player_0 or l_v22_0;
                            if v29 then
                                v44 = l_v22_0;
                            end;
                            task.wait(0.1);
                            if l_Player_0 and not v29 then
                                l_SearchHelper_0.UpdateAppearance(l_Player_0);
                                return;
                            else
                                l_SearchHelper_0.UpdateModelAppearance(l_v22_0);
                                return;
                            end;
                        end);
                    end;
                    v30[#v30 + 1] = v26.Changed:Connect(function() --[[ Line: 180 ]]
                        -- upvalues: v26 (copy), v30 (copy), v22 (copy), v25 (copy), l_Player_0 (copy), v29 (copy), l_SearchHelper_0 (copy)
                        if v26.Value == script.Name then
                            return;
                        else
                            for _, v46 in v30 do
                                v46:Disconnect();
                            end;
                            if v22 and v22:GetAttribute("ShinyOutfitId") == script.Name then
                                v22:SetAttribute("ShinyOutfitId", nil);
                            end;
                            local l_v22_1 = v22;
                            local l_Value_4 = v25.Value;
                            l_Value_4 = false;
                            local v49 = l_Player_0 or l_v22_1;
                            if v29 then
                                v49 = l_v22_1;
                            end;
                            task.wait(0.1);
                            if l_Player_0 and not v29 then
                                l_SearchHelper_0.UpdateAppearance(l_Player_0);
                                return;
                            else
                                l_SearchHelper_0.UpdateModelAppearance(l_v22_1);
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
        local function v57(v52) --[[ Line: 199 ]] --[[ Name: StyleEquipped ]]
            -- upvalues: l_States_0 (copy), v2 (ref)
            local l_Player_1 = v52.Player;
            local v54 = v52.Character or l_Player_1 and l_Player_1.Character;
            if not v54 then
                return;
            else
                local v55 = l_States_0:WaitForChild(v54.Name);
                local v56 = v55 and v55:WaitForChild("PlayerData");
                if not (v56 and v56:WaitForChild("Style")) then
                    return;
                else
                    v2.AddAppearance(v52);
                    return;
                end;
            end;
        end;
        local l_v57_0 = v57 --[[ copy: 9 -> 10 ]];
        v2.ServerOnSet = function(v59) --[[ Line: 212 ]]
            -- upvalues: l_v57_0 (copy), l_States_0 (copy)
            if not game:GetService("RunService"):IsServer() then
                return;
            else
                l_v57_0(v59);
                local l_Player_2 = v59.Player;
                if not l_Player_2 then
                    return;
                else
                    local v61 = l_States_0:WaitForChild(l_Player_2.Name);
                    local v62 = v61 and v61:WaitForChild("PlayerData");
                    local v63 = v62 and v62:WaitForChild("Style");
                    if not v63 then
                        return;
                    else
                        local v64 = {};
                        v64[#v64 + 1] = workspace.Live.ChildAdded:Connect(function(v65) --[[ Line: 227 ]]
                            -- upvalues: l_Player_2 (copy), v59 (copy), l_v57_0 (ref)
                            if v65.Name ~= l_Player_2.Name then
                                return;
                            else
                                task.wait(0.5);
                                if not v65 or v65.Parent ~= workspace.Live then
                                    return;
                                else
                                    v59.Character = v65;
                                    l_v57_0(v59);
                                    return;
                                end;
                            end;
                        end);
                        v64[#v64 + 1] = v63.Changed:Connect(function() --[[ Line: 238 ]]
                            -- upvalues: v64 (copy)
                            for _, v67 in v64 do
                                v67:Disconnect();
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
            AnimSpeed = 2, 
            Startup = 0.18333333333333332, 
            Stamina = 20, 
            Damage = 7, 
            BlockDamage = 5, 
            Recover = 0, 
            BreakRecover = 1, 
            MinTime = 0, 
            MaxTime = 0.5, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            HideStartup = true, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "LeftHand", 
                DelayTime = 0.18333333333333332, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.9
            }, 
            HitSound = "GhostJabLanded", 
            HitSoundSpeedMult = 1.5, 
            BlockStunTime = 0.3333333333333333
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
            AnimSpeed = 2, 
            Startup = 0.18333333333333332, 
            Damage = 7, 
            BlockDamage = 7.5, 
            Recover = 0, 
            BreakRecover = 1, 
            MinTime = 0, 
            MaxTime = 0.5, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            ExtraEffect = {
                Effect = "GhostJabRightHand", 
                EffectDelay = 0.25
            }, 
            HideStartup = true, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "RightHand", 
                DelayTime = 0.18333333333333332, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.85
            }, 
            HitSound = "GhostJabLanded", 
            HitSoundSpeedMult = 1.5, 
            BlockStunTime = 0.3333333333333333
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
    v2.Combos[3] = v2.Combos[1];
    v2.HeavyAttacks = {
        DefaultPunchInfo = {
            Stamina = 30, 
            Damage = 12, 
            BlockDamage = 8.5, 
            Recover = 0, 
            BreakRecover = 1, 
            StunTime = 0.5, 
            MoveDelay = 0.25, 
            AnimSpeed = 0.93, 
            FadeIn = 0.1, 
            HitSound = "SluggerM2", 
            KnockbackInfo = {
                Distance = 1, 
                TargetTime = 0.2, 
                HitIndex = 1
            }, 
            HitboxSize = Vector3.new(2, 2, 6, 0)
        }, 
        [1] = {
            AnimId = 86115875909719, 
            AnimSpeed = 1, 
            FireAnimTime = 0.38333333333333336, 
            MinTime = 1.3333333333333333, 
            MaxTime = 2.6666666666666665, 
            HyperArmor = true, 
            HyperArmorEndsOnHit = true, 
            StartSound = "TakamuraStartup", 
            HeavyDebounce = 0.7, 
            Startup = 0.26666666666666666, 
            TrackTime = 0.16666666666666666, 
            ExtraEffect = {
                Effect = "GhostBaguette", 
                EffectDelay = 0.26666666666666666
            }, 
            HitInfo = {
                Direction = "LeftHeavy", 
                AnimName = "LeftHeavy"
            }, 
            HideStartup = true, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "RightHand", 
                DelayTime = 0.26666666666666666, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.85
            }, 
            ChargeInfo = {
                MinDamage = 12, 
                MaxDamage = 30, 
                PauseAnim = true, 
                MinBlockDamage = 8.5, 
                MaxBlockDamage = 13, 
                MinBreak = 0.7, 
                MaxBreak = 1, 
                MinShakeInfo = {
                    Preset = "SuperHardHit", 
                    WaitTime = 0.15, 
                    Fade = 0.3, 
                    FoVMult = 1.5, 
                    FoV = 66
                }, 
                MaxShakeInfo = {
                    Preset = "SuperHardHit", 
                    WaitTime = 0.25, 
                    Fade = 0.3, 
                    FoVMult = 1.5, 
                    FoV = 62
                }
            }
        }, 
        [8] = {
            AnimId = 17527292876, 
            Startup = 0.23333333333333334, 
            AnimSpeed = 2.1, 
            Stamina = 15, 
            Damage = 12, 
            StunTime = 3.3333333333333335, 
            SapStamina = 100, 
            MeterCharge = 0, 
            HitboxSize = Vector3.new(3, 1, 2.5, 0), 
            HitSound = "HammerM2", 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "BodyForwardHeavy"
            }, 
            ShakeInfo = {
                Preset = "SuperHardHit", 
                WaitTime = 0.1, 
                Fade = 0.4, 
                FoVMult = 1, 
                FoV = 62
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "LeftHand", 
                DelayTime = 0.4166666666666667, 
                HoldTime = 0.25, 
                TimeScale = 1
            }
        }, 
        [9] = {
            AnimId = 17522968535, 
            Startup = 0.5166666666666667, 
            StartupScale = 0.6, 
            SapStamina = 30, 
            HitboxSize = Vector3.new(3, 1, 2.5, 0), 
            MeterCharge = 0, 
            Stamina = 15, 
            Damage = 8, 
            StunTime = 0.6666666666666666, 
            HitSound = "HammerM2", 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "BodyForwardHeavy"
            }, 
            ShakeInfo = {
                Preset = "SuperHardHit", 
                WaitTime = 0.25, 
                Fade = 0.6, 
                FoVMult = 1, 
                FoV = 62
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Teto", 
                TargetPart = "LeftHand", 
                DelayTime = 0.4166666666666667, 
                HoldTime = 0.25, 
                TimeScale = 1
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
    l_CommonUtilities_0.DeepMergeMissing(v2.Combos, l_AncientGhost_0.Combos);
    l_CommonUtilities_0.DeepMergeMissing(v2.DashInfo, l_AncientGhost_0.DashInfo);
    l_CommonUtilities_0.DeepMergeMissing(v2.HeavyAttacks, l_AncientGhost_0.HeavyAttacks);
    l_CommonUtilities_0.DeepMergeMissing(v2.DefaultPunchInfo, l_AncientGhost_0.DefaultPunchInfo);
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
    task.spawn(function() --[[ Line: 926 ]]
        local l_FirstChild_2 = game:GetService("ReplicatedFirst"):WaitForChild("Animations", 10):FindFirstChild(script.Name);
        if l_FirstChild_2 then
            l_FirstChild_2:Destroy();
        end;
    end);
    return v2;
else
    Init();
    game:GetService("ReplicatedStorage"):WaitForChild("Events", 30):WaitForChild("RemoteConfigLoaded", 30).Event:Connect(function() --[[ Line: 941 ]]
        Init();
    end);
    return v2;
end;