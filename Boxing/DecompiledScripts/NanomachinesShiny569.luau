local l_CommonUtilities_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("CommonUtilities"));
local l_Turtle_0 = require(script.Parent:WaitForChild("Turtle"));
local v2 = l_CommonUtilities_0.DeepCopy(l_Turtle_0);
Init = function() --[[ Line: 7 ]] --[[ Name: Init ]]
    -- upvalues: l_Turtle_0 (ref), v2 (ref), l_CommonUtilities_0 (copy)
    l_Turtle_0 = require(script.Parent:WaitForChild("Turtle"));
    v2 = l_CommonUtilities_0.DeepCopy(l_Turtle_0);
    v2.Init = Init;
    v2.Rarity = nil;
    v2.Shiny = true;
    v2.HiddenRarity = "Uncommon";
    v2.ShortName = "NANOMACHINES";
    v2.DisplayName = "Nanomachines Style";
    v2.Description = "Nanomachines, son. They harden in response to physical trauma. After all, we're making the mother of all omelettes here - can't fret over every egg.";
    v2.BaseStyleName = "Turtle";
    v2.Titles = {
        [1] = {
            Name = "Nanomachines1", 
            DisplayTitle = "Nanomachines, son \240\159\164\150", 
            Quality = 10, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "Nanomachines2", 
            DisplayTitle = "Armstrong \240\159\146\170", 
            Quality = 13, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "Nanomachines3", 
            DisplayTitle = "Senator \240\159\143\155\239\184\143", 
            Quality = 12, 
            Type = "Knockdowns", 
            Amount = 750
        }
    };
    local _ = workspace:WaitForChild("States");
    local _ = workspace:WaitForChild("Live");
    local l_Catalog_0 = game:GetService("ReplicatedStorage"):WaitForChild("Catalog");
    local _ = require(l_Catalog_0:WaitForChild("SearchHelper"));
    local _ = game:GetService("CollectionService");
    local l_Players_0 = game:GetService("Players");
    if game:GetService("RunService"):IsServer() then
        v2.ServerOnSet = function(v9) --[[ Line: 67 ]]
            -- upvalues: l_CommonUtilities_0 (ref), l_Players_0 (copy)
            local v10 = false;
            if not game:GetService("RunService"):IsServer() then
                return;
            else
                local l_Player_0 = v9.Player;
                if not l_Player_0 then
                    return;
                else
                    local v12 = l_CommonUtilities_0.GetPlayerData(l_Player_0);
                    local v13 = v12 and v12:WaitForChild("Style", 20);
                    if not v13 then
                        return;
                    else
                        local _ = game:GetService("ReplicatedFirst");
                        local v15;
                        if game:GetService("RunService"):IsClient() then
                            v15 = shared.BridgeNet2;
                            if not v15 then
                                repeat
                                    task.wait();
                                until shared.BridgeNet2;
                                v15 = shared.BridgeNet2;
                                v10 = v15;
                            else
                                v10 = true;
                            end;
                        end;
                        if not v10 then
                            if not v10 then
                                v15 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
                            end;
                        end;
                        v10 = false;
                        local v16 = v15.ReferenceBridge("CreateEffect");
                        local v17 = {};
                        v17[#v17 + 1] = l_Players_0.PlayerAdded:Connect(function(v18) --[[ Line: 82 ]]
                            -- upvalues: v13 (copy), v16 (copy), l_Player_0 (copy)
                            local v19 = tick();
                            repeat
                                task.wait(1);
                            until v18 and v18:GetAttribute("Loaded") or tick() - v19 > 10;
                            if v13.Value ~= script.Name then
                                return;
                            else
                                v16:Fire(v18, {
                                    "Nanomachines", 
                                    l_Player_0
                                });
                                return;
                            end;
                        end);
                        for _, v21 in l_Players_0:GetChildren() do
                            v16:Fire(v21, {
                                "Nanomachines", 
                                l_Player_0
                            });
                        end;
                        v17[#v17 + 1] = v13.Changed:Connect(function() --[[ Line: 104 ]]
                            -- upvalues: v13 (copy), v17 (copy)
                            if v13.Value == script.Name then
                                return;
                            else
                                for _, v23 in v17 do
                                    v23:Disconnect();
                                end;
                                return;
                            end;
                        end);
                        return;
                    end;
                end;
            end;
        end;
    end;
    v2.CoreInfo.HitAnimWeight = 0.8;
    v2.CoreInfo.BodyHitAnimWeight = 0.8;
    v2.CoreInfo.HitNameFade = 0.15;
    v2.CoreInfo.BlockHitAnimWeight = 0.13;
    v2.CoreInfo.BlockBodyHitAnimWeight = 0.13;
    v2.CoreInfo.BlockHitNameFade = 0.2;
    v2.CoreInfo.BlockEffect = "NanomachinesBlock";
    v2.CoreInfo.CustomBlockImage = "rbxassetid://80230300422182";
    v2.DefaultPunchInfo = {
        ShakeInfo = {
            Preset = "MedHit2", 
            FoV = 68
        }, 
        HitSound = "NanomachinesHit", 
        ExtraHitSound = "NanomachinesHitLayer"
    };
    v2.Combos[1] = {
        [1] = {
            AnimId = 80317009248755, 
            AnimSpeed = 0.89, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.35, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.9
            }, 
            ShakeInfo = {
                Preset = "HardHit", 
                WaitTime = 0.15, 
                Fade = 0.3, 
                FoVMult = 1.5, 
                FoV = 63
            }
        }, 
        [2] = {
            AnimId = 102429250347006, 
            AnimSpeed = 0.7, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "LeftHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [3] = {
            AnimId = 90731859225074, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [4] = {
            HitSound = "NanomachinesKnee", 
            HitSoundSpeedMult = 0.85, 
            AnimId = 83626998824789, 
            AnimSpeed = 0.85, 
            AnimWeight = 10000, 
            HitInfo = {
                Direction = "BodyForward", 
                AnimName = "BodyForward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [5] = {
            HitSound = "NanomachinesKnee", 
            HitSoundSpeedMult = 0.85, 
            AnimId = 138259842066802, 
            AnimSpeed = 0.85, 
            AnimWeight = 10000, 
            HitInfo = {
                Direction = "BodyForward", 
                AnimName = "BodyForward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [6] = {
            HitSound = "NanomachinesKnee", 
            HitSoundSpeedMult = 0.85, 
            AnimId = 87210705073791, 
            AnimSpeed = 0.85, 
            AnimWeight = 10000, 
            HitInfo = {
                Direction = "BodyForward", 
                AnimName = "BodyForward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [7] = {
            HitSound = "NanomachinesKnee", 
            HitSoundSpeedMult = 0.85, 
            AnimId = 87210705073791, 
            AnimSpeed = 0.85, 
            AnimWeight = 10000, 
            HitInfo = {
                Direction = "BodyForward", 
                AnimName = "BodyForward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [8] = {
            AnimId = 90731859225074, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [9] = {
            AnimId = 75228099678461, 
            AnimSpeed = 0.8, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }
    };
    v2.Combos[2] = {
        [1] = {
            AnimId = 120729225532765, 
            AnimSpeed = 0.89, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "LeftHand", 
                DelayTime = 0.35, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.9
            }, 
            ShakeInfo = {
                Preset = "HardHit", 
                WaitTime = 0.15, 
                Fade = 0.3, 
                FoVMult = 1.5, 
                FoV = 63
            }
        }, 
        [2] = {
            AnimId = 90731859225074, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [3] = {
            AnimId = 136148192944790, 
            AnimSpeed = 0.8, 
            HitInfo = {
                Direction = "Right", 
                AnimName = "Right"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "LeftHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [4] = {
            AnimId = 90731859225074, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [5] = {
            AnimId = 136148192944790, 
            AnimSpeed = 0.8, 
            HitInfo = {
                Direction = "Right", 
                AnimName = "Right"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "LeftHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [6] = {
            AnimId = 75228099678461, 
            AnimSpeed = 0.8, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [7] = {
            HitSound = "NanomachinesKnee", 
            HitSoundSpeedMult = 0.85, 
            AnimId = 134594587784200, 
            AnimSpeed = 0.8, 
            HitInfo = {
                Direction = "BodyForward", 
                AnimName = "BodyForward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [8] = {
            AnimId = 136148192944790, 
            AnimSpeed = 0.8, 
            HitInfo = {
                Direction = "Right", 
                AnimName = "Right"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "LeftHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }
    };
    v2.HeavyAttacks = {
        DefaultPunchInfo = {
            AnimSpeed = 1, 
            ShakeInfo = {
                Preset = "SuperHardHit", 
                WaitTime = 0.25, 
                Fade = 0.3, 
                FoVMult = 1.5, 
                FoV = 64
            }, 
            HitSound = "NanomachinesHeavy", 
            ExtraHitSound = "NanomachinesHitLayer"
        }, 
        [1] = {
            AnimId = 112847114174261, 
            AnimSpeed = 0.9, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.3333333333333333, 
                HoldTime = 0.25, 
                TimeScale = 1
            }, 
            ExtraEffect = {
                Effect = "NanomachinesM2", 
                EffectDelay = 0.16666666666666666
            }
        }, 
        [2] = {
            AnimId = 95027327849873, 
            AnimSpeed = 0.9, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Nanomachines", 
                TargetPart = "RightHand", 
                DelayTime = 0.3333333333333333, 
                HoldTime = 0.25, 
                TimeScale = 1
            }, 
            ExtraEffect = {
                Effect = "NanomachinesM2", 
                EffectDelay = 0.16666666666666666
            }
        }
    };
    v2.DashInfo = {
        Forward = {
            AnimSpeed = 1, 
            AnimId = 72533212159892
        }, 
        Backward = {
            AnimId = 138535149095438, 
            AnimSpeed = 0.9
        }, 
        Left = {
            AnimId = 120251159339570, 
            UseForSlowMoAnimOnly = true
        }, 
        Right = {
            AnimId = 119189790722000, 
            UseForSlowMoAnimOnly = true
        }
    };
    l_CommonUtilities_0.DeepMergeMissing(v2.Combos, l_Turtle_0.Combos);
    l_CommonUtilities_0.DeepMergeMissing(v2.DashInfo, l_Turtle_0.DashInfo);
    l_CommonUtilities_0.DeepMergeMissing(v2.HeavyAttacks, l_Turtle_0.HeavyAttacks);
    l_CommonUtilities_0.DeepMergeMissing(v2.DefaultPunchInfo, l_Turtle_0.DefaultPunchInfo);
    v2.UltimateInfo = {
        Effect = "NanoMachine", 
        PreDelay = 1, 
        Time = 19.666666666666668, 
        Offset = CFrame.new(0, 3, 0), 
        DamageTimes = {
            {
                16, 
                10
            }, 
            {
                17.48, 
                15
            }, 
            {
                18.58, 
                20
            }
        }
    };
    l_CommonUtilities_0.DeepMergeMissing(v2.UltimateInfo, l_Turtle_0.UltimateInfo);
    v2.BlockAnimations = {
        IdleFade = 0.08333333333333333, 
        IdlePriority = Enum.AnimationPriority.Core, 
        Idle = 0, 
        Break = 13633646743, 
        Left = 13633646784, 
        Right = 13633646824, 
        Forward = 13633646884, 
        BodyLeft = 13633646937, 
        BodyRight = 13633646996, 
        BodyForward = 13633647037
    };
    return v2;
end;
v2.Init = Init;
Init();
if not require(game.ReplicatedFirst:WaitForChild("Places")):IsTesting() and script:FindFirstChild("Testing") then
    task.spawn(function() --[[ Line: 692 ]]
        local l_FirstChild_0 = game:GetService("ReplicatedFirst"):WaitForChild("Animations", 10):FindFirstChild(script.Name);
        if l_FirstChild_0 then
            l_FirstChild_0:Destroy();
        end;
    end);
    return v2;
else
    game:GetService("ReplicatedStorage"):WaitForChild("Events", 30):WaitForChild("RemoteConfigLoaded", 30).Event:Connect(function() --[[ Line: 705 ]]
        Init();
    end);
    return v2;
end;