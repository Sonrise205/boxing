local l_CommonUtilities_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("CommonUtilities"));
local l_IronFist_0 = require(script.Parent:WaitForChild("IronFist"));
local v2 = l_CommonUtilities_0.DeepCopy(l_IronFist_0);
Init = function() --[[ Line: 7 ]] --[[ Name: Init ]]
    -- upvalues: l_IronFist_0 (ref), v2 (ref), l_CommonUtilities_0 (copy)
    l_IronFist_0 = require(script.Parent:WaitForChild("IronFist"));
    v2 = l_CommonUtilities_0.DeepCopy(l_IronFist_0);
    v2.Init = Init;
    v2.Hidden = true;
    v2.Rarity = nil;
    v2.Shiny = true;
    if not require(game.ReplicatedFirst:WaitForChild("Places")):IsTesting() then
        v2.Unobtainable = true;
    end;
    v2.Shiny = true;
    v2.HiddenRarity = "Legendary";
    v2.ShortName = "SACRIFICE";
    v2.DisplayName = "Sacrifice Style";
    v2.Description = "\"Liar. I don't care... if this is the end. So... I'll use everything.\"";
    v2.BaseStyleName = "IronFist";
    v2.Titles = {
        [1] = {
            Name = "Gon1", 
            DisplayTitle = "Hunter \240\159\146\179", 
            Quality = 11, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "Gon2", 
            DisplayTitle = "Rock, Paper, Scissors \226\156\130\239\184\143", 
            Quality = 9, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "Gon3", 
            DisplayTitle = "Sacrifice \240\159\146\128", 
            Quality = 15, 
            Type = "Knockdowns", 
            Amount = 750
        }
    };
    local l_States_0 = workspace:WaitForChild("States");
    local _ = workspace:WaitForChild("Live");
    v2.AddAppearance = function(v5) --[[ Line: 64 ]]
        -- upvalues: l_States_0 (copy)
        local l_Player_0 = v5.Player;
        local v7 = v5.Character or l_Player_0 and l_Player_0.Character;
        if not v7 then
            return;
        else
            local v8 = l_States_0:WaitForChild(l_Player_0 and l_Player_0.Name or v7.Name);
            local v9 = v8 and v8:WaitForChild("PlayerData");
            local v10 = v9 and v9:WaitForChild("Style");
            if not v10 then
                return;
            else
                local v11 = v7 and workspace.Welds:FindFirstChild(v7.Name);
                local v12 = v11 and v11:FindFirstChild("WeldCharacter");
                if v7.Name == "SpinDummy" then
                    v12 = v7;
                end;
                if not v12 then
                    return;
                elseif not v7:FindFirstChild("RightHand") then
                    return;
                else
                    local v13 = script.Aura:Clone();
                    v13.Parent = v12;
                    for _, v15 in v13:GetChildren() do
                        local l_v12_FirstChild_0 = v12:FindFirstChild(v15.Name);
                        if l_v12_FirstChild_0 then
                            if #v15:GetChildren() == 0 then
                                v15:Destroy();
                            end;
                            local l_Weld_0 = Instance.new("Weld");
                            l_Weld_0.Parent = v15;
                            l_Weld_0.Part0 = v15;
                            l_Weld_0.Part1 = l_v12_FirstChild_0;
                        end;
                    end;
                    local v18 = nil;
                    v18 = v10.Changed:Connect(function() --[[ Line: 104 ]]
                        -- upvalues: v18 (ref), v13 (copy)
                        v18:Disconnect();
                        if v13 then
                            v13:Destroy();
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
        local function v26(v21) --[[ Line: 115 ]] --[[ Name: StyleEquipped ]]
            -- upvalues: l_States_0 (copy), v2 (ref)
            local l_Player_1 = v21.Player;
            local v23 = v21.Character or l_Player_1 and l_Player_1.Character;
            if not v23 then
                return;
            else
                local v24 = l_States_0:WaitForChild(v23.Name);
                local v25 = v24 and v24:WaitForChild("PlayerData");
                if not (v25 and v25:WaitForChild("Style")) then
                    return;
                else
                    v2.AddAppearance(v21);
                    game:GetService("ContentProvider"):PreloadAsync(require(script.Parent.Parent.EffectHelper.GonScissors.Slash.GonSlash.ModuleScript));
                    return;
                end;
            end;
        end;
        v2.ServerOnSet = function(v27) --[[ Line: 129 ]]
            -- upvalues: v26 (copy)
            if not game:GetService("RunService"):IsServer() then
                return;
            else
                v26(v27);
                return;
            end;
        end;
    end;
    v2.Combos[1][1].AnimId = 122622710187242;
    v2.Combos[1][1].AnimSpeed = 1;
    v2.Combos[1][1].HitInfo = {
        Direction = "Left", 
        AnimName = "LeftHeavy"
    };
    v2.Combos[1][2].AnimId = 97087873307568;
    v2.Combos[2][1].AnimId = 105009254173002;
    v2.Combos[2][1].AnimSpeed = 1;
    v2.Combos[2][1].HitInfo = {
        Direction = "Right", 
        AnimName = "RightHeavy"
    };
    v2.HeavyAttacks[1] = {
        AnimId = 121038028237812, 
        ExtraEffect = {
            Effect = "GonHeavy", 
            EffectDelay = 0.55, 
            RockOrScissors = true
        }, 
        HitInfo = {
            Direction = "Right", 
            AnimName = "RightHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "LeftHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    };
    v2.HeavyAttacks[2] = {
        AnimId = 114241169739521, 
        ExtraEffect = {
            Effect = "GonHeavy", 
            EffectDelay = 0.5666666666666667, 
            RockOrScissors = false
        }, 
        HitInfo = {
            Direction = "Left", 
            AnimName = "ForwardHeavy"
        }, 
        TrailInfo = {
            EffectName = "AttackTrail", 
            TrailName = "IronFist", 
            TargetPart = "RightHand", 
            DelayTime = 0.3333333333333333, 
            HoldTime = 0.25, 
            TimeScale = 1
        }
    };
    v2.UltimateInfo = {
        Effect = "Gon", 
        PreDelay = 1, 
        Time = 25.433333333333334, 
        Offset = CFrame.Angles(0, 0, 0) * CFrame.new(0, 0, 0), 
        DamageTimes = {
            {
                5.166666666666667, 
                15
            }, 
            {
                6.416666666666667, 
                20
            }, 
            {
                16.833333333333332, 
                20
            }, 
            {
                17.666666666666668, 
                20
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
        Idle = 13633646664, 
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
    task.spawn(function() --[[ Line: 315 ]]
        local l_FirstChild_0 = game:GetService("ReplicatedFirst"):WaitForChild("Animations", 10):FindFirstChild(script.Name);
        if l_FirstChild_0 then
            l_FirstChild_0:Destroy();
        end;
    end);
    return v2;
else
    Init();
    game:GetService("ReplicatedStorage"):WaitForChild("Events", 30):WaitForChild("RemoteConfigLoaded", 30).Event:Connect(function() --[[ Line: 330 ]]
        Init();
    end);
    return v2;
end;