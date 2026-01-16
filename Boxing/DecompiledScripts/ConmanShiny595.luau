local l_CommonUtilities_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("CommonUtilities"));
local l_Aoki_0 = require(script.Parent:WaitForChild("Aoki"));
local v2 = l_CommonUtilities_0.DeepCopy(l_Aoki_0);
Init = function() --[[ Line: 7 ]] --[[ Name: Init ]]
    -- upvalues: l_Aoki_0 (ref), v2 (ref), l_CommonUtilities_0 (copy)
    l_Aoki_0 = require(script.Parent:WaitForChild("Aoki"));
    v2 = l_CommonUtilities_0.DeepCopy(l_Aoki_0);
    v2.Init = Init;
    local l_Places_0 = require(game.ReplicatedFirst:WaitForChild("Places"));
    v2.Rarity = nil;
    v2.Shiny = true;
    v2.Hidden = true;
    if not l_Places_0:IsTesting() then
        v2.Unobtainable = true;
    end;
    v2.HiddenRarity = "Rare";
    v2.ShortName = "CONMAN";
    v2.DisplayName = "Conman Style";
    v2.Description = "Listen. Just because you have special powers doesn't make you any less human. The truth behind one\226\128\153s charm is kindness. Become a good person, that is all.";
    v2.BaseStyleName = "Aoki";
    v2.Titles = {
        [1] = {
            Name = "Conman1", 
            DisplayTitle = "Greatest Psychic \240\159\148\174", 
            Quality = 11, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "Conman2", 
            DisplayTitle = "Master \240\159\147\177", 
            Quality = 12, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "Conman3", 
            DisplayTitle = "Genuinely Good Guy \240\159\171\130", 
            Quality = 13, 
            Type = "Knockdowns", 
            Amount = 750
        }
    };
    local l_States_0 = workspace:WaitForChild("States");
    local _ = workspace:WaitForChild("Live");
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local _ = game:GetService("CollectionService");
    v2.AddAppearance = function(v8) --[[ Line: 64 ]]
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
                    local l_RightLowerArm_0 = v10:FindFirstChild("RightLowerArm");
                    if not l_RightLowerArm_0 then
                        return;
                    else
                        local v19 = script.Phone:Clone();
                        v19.Parent = v16;
                        v19.Name = "Phone";
                        local v20 = script.Weld:Clone();
                        v20.Parent = v19;
                        v20.Part0 = v19;
                        v20.Part1 = l_RightLowerArm_0;
                        local v21 = {};
                        local l_Catalog_0 = game:GetService("ReplicatedStorage"):WaitForChild("Catalog");
                        local l_SearchHelper_0 = require(l_Catalog_0:WaitForChild("SearchHelper"));
                        local function v28(v24, v25) --[[ Line: 107 ]] --[[ Name: SetShinyOutfit ]]
                            -- upvalues: v13 (copy), l_Player_0 (copy), v17 (copy), l_SearchHelper_0 (copy)
                            local l_Value_0 = v13.Value;
                            if v25 ~= nil then
                                l_Value_0 = v25;
                            end;
                            local v27 = l_Player_0 or v24;
                            if v17 then
                                v27 = v24;
                            end;
                            v27:SetAttribute("SOHD_Replace_Pants_" .. script.Name, l_Value_0 and "8298416035");
                            v27:SetAttribute("SOHD_Replace_Shirt_" .. script.Name, l_Value_0 and "8298450720");
                            task.wait(0.1);
                            if l_Player_0 and not v17 then
                                l_SearchHelper_0.UpdateAppearance(l_Player_0);
                                return;
                            else
                                l_SearchHelper_0.UpdateModelAppearance(v24);
                                return;
                            end;
                        end;
                        local v29 = v10 and v10:WaitForChild("Humanoid", 20);
                        if v29 and v29:FindFirstChild("HumanoidDescription", 20) then
                            v28(v10);
                            v21[#v21 + 1] = v13.Changed:Connect(function() --[[ Line: 131 ]]
                                -- upvalues: v28 (copy), v10 (copy)
                                v28(v10);
                            end);
                        end;
                        v21[#v21 + 1] = v14.Changed:Connect(function() --[[ Line: 137 ]]
                            -- upvalues: v14 (copy), v21 (copy), v10 (copy), v28 (copy), v19 (copy)
                            if v14.Value == script.Name then
                                return;
                            else
                                for _, v31 in v21 do
                                    v31:Disconnect();
                                end;
                                if v10 and v10:GetAttribute("ShinyOutfitId") == script.Name then
                                    v10:SetAttribute("ShinyOutfitId", nil);
                                end;
                                v28(v10, false);
                                if v19 then
                                    v19:Destroy();
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
    if game:GetService("RunService"):IsServer() then
        local _ = game:GetService("CollectionService");
        local _ = game:GetService("Players");
        local function v39(v34) --[[ Line: 159 ]] --[[ Name: StyleEquipped ]]
            -- upvalues: l_States_0 (copy), v2 (ref)
            local l_Player_1 = v34.Player;
            local v36 = v34.Character or l_Player_1 and l_Player_1.Character;
            if not v36 then
                return;
            else
                local v37 = l_States_0:WaitForChild(v36.Name);
                local v38 = v37 and v37:WaitForChild("PlayerData");
                if not (v38 and v38:WaitForChild("Style")) then
                    return;
                else
                    v2.AddAppearance(v34);
                    return;
                end;
            end;
        end;
        local l_v39_0 = v39 --[[ copy: 7 -> 8 ]];
        v2.ServerOnSet = function(v41) --[[ Line: 172 ]]
            -- upvalues: l_v39_0 (copy), l_States_0 (copy)
            if not game:GetService("RunService"):IsServer() then
                return;
            else
                l_v39_0(v41);
                local l_Player_2 = v41.Player;
                if not l_Player_2 then
                    return;
                else
                    local v43 = l_States_0:WaitForChild(l_Player_2.Name);
                    local v44 = v43 and v43:WaitForChild("PlayerData");
                    local v45 = v44 and v44:WaitForChild("Style");
                    if not v45 then
                        return;
                    else
                        local v46 = {};
                        v46[#v46 + 1] = workspace.Live.ChildAdded:Connect(function(v47) --[[ Line: 187 ]]
                            -- upvalues: l_Player_2 (copy), v41 (copy), l_v39_0 (ref)
                            if v47.Name ~= l_Player_2.Name then
                                return;
                            else
                                task.wait(0.5);
                                if not v47 or v47.Parent ~= workspace.Live then
                                    return;
                                else
                                    v41.Character = v47;
                                    l_v39_0(v41);
                                    return;
                                end;
                            end;
                        end);
                        v46[#v46 + 1] = v45.Changed:Connect(function() --[[ Line: 198 ]]
                            -- upvalues: v46 (copy)
                            for _, v49 in v46 do
                                v49:Disconnect();
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
    v2.CoreInfo.HitAnimWeight = 0.8;
    v2.CoreInfo.BodyHitAnimWeight = 0.8;
    v2.DefaultPunchInfo = {
        ShakeInfo = {
            Preset = "LightHit", 
            FoV = 68
        }
    };
    v2.Combos[1] = {
        [1] = {
            AnimId = 115548025466953, 
            AnimSpeed = 0.96, 
            HitInfo = {
                Direction = "Right", 
                AnimName = "Right"
            }
        }, 
        [2] = {
            AnimId = 91827431925504, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }
        }, 
        [3] = {
            AnimId = 123058499061430, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Right", 
                AnimName = "Right"
            }
        }, 
        [4] = {
            AnimId = 91827431925504, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }
        }, 
        [5] = {
            AnimId = 123058499061430, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Right", 
                AnimName = "Right"
            }
        }, 
        [6] = {
            AnimId = 91827431925504, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }
        }, 
        [7] = {
            AnimId = 123058499061430, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Right", 
                AnimName = "Right"
            }
        }
    };
    v2.Combos[2] = {
        [1] = {
            AnimId = 100314203115898, 
            AnimSpeed = 0.96, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }
        }, 
        [2] = {
            AnimId = 131549148714278, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Right", 
                AnimName = "Right"
            }
        }, 
        [3] = {
            AnimId = 80139320813133, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }
        }, 
        [4] = {
            AnimId = 131549148714278, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Right", 
                AnimName = "Right"
            }
        }, 
        [5] = {
            AnimId = 80139320813133, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }
        }, 
        [6] = {
            AnimId = 131549148714278, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Right", 
                AnimName = "Right"
            }
        }, 
        [7] = {
            AnimId = 80139320813133, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Left", 
                AnimName = "Left"
            }
        }
    };
    v2.HeavyAttacks = {
        [1] = {
            AnimId = 104155091958524, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy", 
                OverrideAnim = 125225739979074
            }, 
            ExtraEffect = {
                Effect = "ConmanHeavy", 
                EffectDelay = 0.5333333333333333
            }
        }
    };
    v2.DashInfo = {
        Forward = {
            AnimSpeed = 1.05, 
            AnimId = 129567106706670
        }, 
        Backward = {
            AnimSpeed = 1.1, 
            AnimId = 71391516290574
        }, 
        Left = {
            AnimId = 103629556771135, 
            AnimSpeed = 0.95, 
            UseForSlowMoAnimOnly = true
        }, 
        Right = {
            AnimId = 88411529378080, 
            AnimSpeed = 0.95, 
            UseForSlowMoAnimOnly = true
        }
    };
    l_CommonUtilities_0.DeepMergeMissing(v2.Combos, l_Aoki_0.Combos);
    l_CommonUtilities_0.DeepMergeMissing(v2.DashInfo, l_Aoki_0.DashInfo);
    l_CommonUtilities_0.DeepMergeMissing(v2.HeavyAttacks, l_Aoki_0.HeavyAttacks);
    l_CommonUtilities_0.DeepMergeMissing(v2.DefaultPunchInfo, l_Aoki_0.DefaultPunchInfo);
    v2.UltimateInfo = {
        Effect = "Coyote", 
        PreDelay = 1, 
        Time = 16.166666666666668, 
        Offset = CFrame.Angles(0, 0, 0.01), 
        EndOffset = CFrame.new(0, 0, 3.5), 
        StartOffset = CFrame.Angles(0, 0, 0) * CFrame.new(0, 0, 3.5), 
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
            AnimId = 13633645717, 
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
        IdleFade = 0.5833333333333334, 
        Idle = 116518186347779, 
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
    task.spawn(function() --[[ Line: 535 ]]
        local l_FirstChild_0 = game:GetService("ReplicatedFirst"):WaitForChild("Animations", 10):FindFirstChild(script.Name);
        if l_FirstChild_0 then
            l_FirstChild_0:Destroy();
        end;
    end);
    return v2;
else
    Init();
    game:GetService("ReplicatedStorage"):WaitForChild("Events", 30):WaitForChild("RemoteConfigLoaded", 30).Event:Connect(function() --[[ Line: 550 ]]
        Init();
    end);
    return v2;
end;