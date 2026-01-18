local l_CommonUtilities_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("CommonUtilities"));
local l_Basic_0 = require(script.Parent:WaitForChild("Basic"));
local v2 = l_CommonUtilities_0.DeepCopy(l_Basic_0);
Init = function() --[[ Line: 7 ]] --[[ Name: Init ]]
    -- upvalues: l_Basic_0 (ref), v2 (ref), l_CommonUtilities_0 (copy)
    l_Basic_0 = require(script.Parent:WaitForChild("Basic"));
    v2 = l_CommonUtilities_0.DeepCopy(l_Basic_0);
    v2.Init = Init;
    v2.Rarity = nil;
    v2.Shiny = true;
    v2.HiddenRarity = "Uncommon";
    v2.ShortName = "BALD";
    v2.DisplayName = "Bald Style";
    v2.Description = "In exchange for gaining strength, have you lost something important as a human being? Emotions used to swirl within you when you fought. Fear, impatience, anger... but now... day after day, after one punch you just go home unharmed and wash off your gloves.";
    v2.BaseStyleName = "Basic";
    v2.Titles = {
        [1] = {
            Name = "Bald1", 
            DisplayTitle = "Baldy \240\159\145\168\226\128\141\240\159\166\178", 
            Quality = 5, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "Bald2", 
            DisplayTitle = "Hero for Fun \240\159\166\184\226\128\141", 
            Quality = 0, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "Bald3", 
            DisplayTitle = "One Punch Man \240\159\145\138", 
            Quality = 12, 
            Type = "Knockdowns", 
            Amount = 750
        }
    };
    local l_States_0 = workspace:WaitForChild("States");
    local _ = workspace:WaitForChild("Live");
    local l_Catalog_0 = game:GetService("ReplicatedStorage"):WaitForChild("Catalog");
    local _ = require(l_Catalog_0:WaitForChild("SearchHelper"));
    local l_CollectionService_0 = game:GetService("CollectionService");
    local _ = game:GetService("Players");
    v2.AddAppearance = function(v9) --[[ Line: 60 ]]
        -- upvalues: l_States_0 (copy), l_CollectionService_0 (copy)
        local l_Player_0 = v9.Player;
        local v11 = v9.Character or l_Player_0 and l_Player_0.Character;
        if not v11 then
            return;
        else
            local v12 = l_States_0:WaitForChild(l_Player_0 and l_Player_0.Name or v11.Name);
            local v13 = v12 and v12:WaitForChild("PlayerData");
            local v14 = v13 and v13:WaitForChild("ShinyOutfits");
            local v15 = v13 and v13:WaitForChild("Style");
            if not v15 then
                return;
            else
                local v16 = v11 and workspace.Welds:FindFirstChild(v11.Name);
                local v17 = v16 and v16:FindFirstChild("WeldCharacter");
                local v18 = v11.Name == "SpinDummy";
                if v18 then
                    v17 = v11;
                end;
                if not v17 then
                    return;
                else
                    if v11 then
                        if v11:GetAttribute("ShinyOutfitId") == script.Name then
                            return;
                        else
                            v11:SetAttribute("ShinyOutfitId", script.Name);
                        end;
                    end;
                    local l_UpperTorso_0 = v11:FindFirstChild("UpperTorso");
                    if not l_UpperTorso_0 then
                        return;
                    else
                        local v20 = script.Cape:Clone();
                        v20.Parent = v17;
                        local l_Weld_0 = Instance.new("Weld");
                        l_Weld_0.Parent = v20;
                        l_Weld_0.Part0 = v20.Target;
                        l_Weld_0.Part1 = l_UpperTorso_0;
                        l_CollectionService_0:AddTag(v20.Cape, "SmartBone");
                        local v22 = {};
                        local l_Catalog_1 = game:GetService("ReplicatedStorage"):WaitForChild("Catalog");
                        local l_SearchHelper_1 = require(l_Catalog_1:WaitForChild("SearchHelper"));
                        local function v29(v25, v26) --[[ Line: 104 ]] --[[ Name: SetShinyOutfit ]]
                            -- upvalues: v14 (copy), l_Player_0 (copy), v18 (copy), l_SearchHelper_1 (copy)
                            local l_Value_0 = v14.Value;
                            if v26 ~= nil then
                                l_Value_0 = v26;
                            end;
                            local v28 = l_Player_0 or v25;
                            if v18 then
                                v28 = v25;
                            end;
                            v28:SetAttribute("SOHD_Replace_BackAccessory_" .. script.Name, "");
                            l_Player_0:SetAttribute("Bald", l_Value_0);
                            v25:SetAttribute("Bald", l_Value_0);
                            if l_Player_0 and not v18 then
                                l_SearchHelper_1.UpdateAppearance(l_Player_0);
                                return;
                            else
                                l_SearchHelper_1.UpdateModelAppearance(v25);
                                return;
                            end;
                        end;
                        local v30 = v11 and v11:WaitForChild("Humanoid", 20);
                        if v30 and v30:FindFirstChild("HumanoidDescription", 20) then
                            v29(v11);
                            v22[#v22 + 1] = v14.Changed:Connect(function() --[[ Line: 130 ]]
                                -- upvalues: v29 (copy), v11 (copy)
                                v29(v11);
                            end);
                        end;
                        v22[#v22 + 1] = v15.Changed:Connect(function() --[[ Line: 136 ]]
                            -- upvalues: v15 (copy), v22 (copy), l_Player_0 (copy), v11 (copy), v20 (copy), l_SearchHelper_1 (copy)
                            if v15.Value == script.Name then
                                return;
                            else
                                for _, v32 in v22 do
                                    v32:Disconnect();
                                end;
                                l_Player_0:SetAttribute("Bald", nil);
                                v11:SetAttribute("Bald", nil);
                                if v11 and v11:GetAttribute("ShinyOutfitId") == script.Name then
                                    v11:SetAttribute("ShinyOutfitId", nil);
                                end;
                                if v20 then
                                    v20:Destroy();
                                end;
                                l_SearchHelper_1.UpdateModelAppearance(v11);
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
        local function v44(v33) --[[ Line: 156 ]] --[[ Name: StyleEquipped ]]
            -- upvalues: l_States_0 (copy), v2 (ref), l_CollectionService_0 (copy)
            local l_Player_1 = v33.Player;
            local v35 = v33.Character or l_Player_1 and l_Player_1.Character;
            if not v35 then
                return;
            else
                local v36 = l_States_0:WaitForChild(v35.Name);
                local v37 = v36 and v36:WaitForChild("PlayerData");
                local v38 = v37 and v37:WaitForChild("Style");
                if not v38 then
                    return;
                else
                    v2.AddAppearance(v33);
                    for _, v40 in v35:GetChildren() do
                        if v40:IsA("BasePart") then
                            l_CollectionService_0:AddTag(v40, "SmartCollider");
                        end;
                    end;
                    local v41 = nil;
                    v41 = v38.Changed:Connect(function() --[[ Line: 174 ]]
                        -- upvalues: v41 (ref), v35 (copy), l_CollectionService_0 (ref)
                        v41:Disconnect();
                        for _, v43 in v35:GetChildren() do
                            if v43:IsA("BasePart") then
                                l_CollectionService_0:RemoveTag(v43, "SmartCollider");
                            end;
                        end;
                    end);
                    return;
                end;
            end;
        end;
        local l_v44_0 = v44 --[[ copy: 6 -> 7 ]];
        v2.ServerOnSet = function(v46) --[[ Line: 184 ]]
            -- upvalues: l_v44_0 (copy), l_States_0 (copy)
            if not game:GetService("RunService"):IsServer() then
                return;
            else
                l_v44_0(v46);
                local l_Player_2 = v46.Player;
                if not l_Player_2 then
                    return;
                else
                    local v48 = l_States_0:WaitForChild(l_Player_2.Name);
                    local v49 = v48 and v48:WaitForChild("PlayerData");
                    local v50 = v49 and v49:WaitForChild("Style");
                    if not v50 then
                        return;
                    else
                        local v51 = {};
                        v51[#v51 + 1] = workspace.Live.ChildAdded:Connect(function(v52) --[[ Line: 199 ]]
                            -- upvalues: l_Player_2 (copy), v46 (copy), l_v44_0 (ref)
                            if v52.Name ~= l_Player_2.Name then
                                return;
                            else
                                task.wait(0.5);
                                if not v52 or v52.Parent ~= workspace.Live then
                                    return;
                                else
                                    v46.Character = v52;
                                    l_v44_0(v46);
                                    return;
                                end;
                            end;
                        end);
                        v51[#v51 + 1] = v50.Changed:Connect(function() --[[ Line: 210 ]]
                            -- upvalues: v51 (copy)
                            for _, v54 in v51 do
                                v54:Disconnect();
                            end;
                        end);
                        return;
                    end;
                end;
            end;
        end;
    end;
    local v55 = {};
    v2.OnClientDash = function(v56) --[[ Line: 219 ]]
        -- upvalues: v55 (copy)
        local l_Player_3 = v56.Player;
        local v58 = v56.Character or l_Player_3 and l_Player_3.Character;
        if not v58 then
            return;
        else
            local v59 = v58 and workspace.Welds:FindFirstChild(v58.Name);
            local v60 = v59 and v59:FindFirstChild("WeldCharacter");
            if not v60 then
                return;
            else
                local l_Cape_0 = v60:FindFirstChild("Cape");
                if not l_Cape_0 then
                    return;
                else
                    local l_Attribute_0 = script.Cape.Cape:GetAttribute("Stiffness");
                    local l_Attribute_1 = script.Cape.Cape:GetAttribute("Force");
                    local function _(v64, v65) --[[ Line: 235 ]] --[[ Name: SetCapeAttribute ]]
                        -- upvalues: l_Cape_0 (copy)
                        local v66 = l_Cape_0 and l_Cape_0:FindFirstChild("Cape");
                        if not v66 then
                            return;
                        else
                            v66:SetAttribute(v64, v65);
                            return;
                        end;
                    end;
                    local v68 = tick();
                    v55[v58.Name] = v68;
                    task.delay(0.3, function() --[[ Line: 245 ]]
                        -- upvalues: v58 (copy), v55 (ref), v68 (copy), l_Attribute_1 (copy), l_Cape_0 (copy), l_Attribute_0 (copy)
                        if v58:GetAttribute("PerfectDodged") then
                            task.wait(1);
                        end;
                        if v55[v58.Name] == v68 then
                            v55[v58.Name] = nil;
                            local l_l_Attribute_1_0 = l_Attribute_1;
                            local v70 = l_Cape_0 and l_Cape_0:FindFirstChild("Cape");
                            if v70 then
                                v70:SetAttribute("Force", l_l_Attribute_1_0);
                            end;
                            l_l_Attribute_1_0 = l_Attribute_0;
                            v70 = l_Cape_0 and l_Cape_0:FindFirstChild("Cape");
                            if not v70 then
                                return;
                            else
                                v70:SetAttribute("Stiffness", l_l_Attribute_1_0);
                            end;
                        end;
                    end);
                    local v71 = l_Cape_0 and l_Cape_0:FindFirstChild("Cape");
                    if v71 then
                        v71:SetAttribute("Force", (Vector3.new(0, 300, 0, 0)));
                    end;
                    v71 = l_Cape_0 and l_Cape_0:FindFirstChild("Cape");
                    if not v71 then
                        return;
                    else
                        v71:SetAttribute("Stiffness", 0.92);
                        return;
                    end;
                end;
            end;
        end;
    end;
    v2.CoreInfo.HitAnimWeight = 0.1;
    v2.CoreInfo.BodyHitAnimWeight = 0.2;
    v2.CoreInfo.HitNameFade = 0.15;
    v2.DefaultPunchInfo = {
        ShakeInfo = {
            Preset = "LightHit", 
            FoV = 68
        }
    };
    v2.Combos[1] = {
        [1] = {
            AnimId = 98927429932333, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Basic", 
                TargetPart = "RightHand", 
                DelayTime = 0.35, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.9
            }, 
            ShakeInfo = {
                Preset = "HardHit2", 
                FoV = 66
            }
        }, 
        [2] = {
            AnimId = 108659666685772, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Basic", 
                TargetPart = "LeftHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [3] = {
            AnimId = 117082961041671, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Basic", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }
    };
    v2.Combos[2] = {
        [1] = {
            AnimId = 108624119958121, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Basic", 
                TargetPart = "LeftHand", 
                DelayTime = 0.35, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.9
            }, 
            ShakeInfo = {
                Preset = "HardHit2", 
                FoV = 66
            }
        }, 
        [2] = {
            AnimId = 117082961041671, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Basic", 
                TargetPart = "RightHand", 
                DelayTime = 0.15, 
                HoldTime = 0.11666666666666667, 
                TimeScale = 0.7
            }
        }, 
        [3] = {
            AnimId = 108659666685772, 
            AnimSpeed = 1, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "Forward"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Basic", 
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
            HitSound = "Heavy1", 
            ShakeInfo = {
                Preset = "SuperHardHit", 
                WaitTime = 0.25, 
                Fade = 0.3, 
                FoVMult = 1.5, 
                FoV = 64
            }
        }, 
        [1] = {
            AnimId = 97884152972123, 
            AnimSpeed = 0.98, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Basic", 
                TargetPart = "RightHand", 
                DelayTime = 0.3333333333333333, 
                HoldTime = 0.25, 
                TimeScale = 1
            }
        }, 
        [2] = {
            AnimId = 88422781192423, 
            AnimSpeed = 0.98, 
            HitInfo = {
                Direction = "Forward", 
                AnimName = "ForwardHeavy"
            }, 
            TrailInfo = {
                EffectName = "AttackTrail", 
                TrailName = "Basic", 
                TargetPart = "RightHand", 
                DelayTime = 0.3333333333333333, 
                HoldTime = 0.25, 
                TimeScale = 1
            }
        }
    };
    v2.DashInfo = {
        Forward = {
            AnimId = 122520936615217
        }, 
        Backward = {
            AnimId = 87906959823742, 
            AnimSpeed = 1
        }, 
        Left = {
            AnimId = 77816775394219, 
            UseForSlowMoAnimOnly = true
        }, 
        Right = {
            AnimId = 108210480294665, 
            UseForSlowMoAnimOnly = true
        }
    };
    l_CommonUtilities_0.DeepMergeMissing(v2.Combos, l_Basic_0.Combos);
    l_CommonUtilities_0.DeepMergeMissing(v2.DashInfo, l_Basic_0.DashInfo);
    l_CommonUtilities_0.DeepMergeMissing(v2.HeavyAttacks, l_Basic_0.HeavyAttacks);
    l_CommonUtilities_0.DeepMergeMissing(v2.DefaultPunchInfo, l_Basic_0.DefaultPunchInfo);
    v2.UltimateInfo = {
        Effect = "Saitama", 
        PreDelay = 1, 
        Time = 17.916666666666668, 
        Offset = CFrame.new(0, 3, 0), 
        DamageTimes = {
            {
                15.833333333333334, 
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
        IdleFade = 0.08333333333333333, 
        Idle = 140419142725132, 
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
if not require(game.ReplicatedFirst:WaitForChild("Places")):IsTesting() and script:FindFirstChild("Testing") then
    task.spawn(function() --[[ Line: 591 ]]
        local l_FirstChild_0 = game:GetService("ReplicatedFirst"):WaitForChild("Animations", 10):FindFirstChild(script.Name);
        if l_FirstChild_0 then
            l_FirstChild_0:Destroy();
        end;
    end);
    return v2;
else
    Init();
    game:GetService("ReplicatedStorage"):WaitForChild("Events", 30):WaitForChild("RemoteConfigLoaded", 30).Event:Connect(function() --[[ Line: 606 ]]
        Init();
    end);
    return v2;
end;