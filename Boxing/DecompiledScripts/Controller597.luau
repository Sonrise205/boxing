local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerStorage");
local _ = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_EquipGlovesOnCharacter_0 = l_ServerScriptService_0:WaitForChild("Events"):WaitForChild("EquipGlovesOnCharacter");
local v6 = l_ServerScriptService_0:WaitForChild("Combat", 10);
local v7 = require(v6:WaitForChild("NPC", 10));
local _ = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents"):WaitForChild("CreateEffect");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local v11 = Random.new();
local l_Catalog_0 = l_ReplicatedStorage_0:WaitForChild("Catalog");
local l_SearchHelper_0 = require(l_Catalog_0:WaitForChild("SearchHelper"));
return {
    Init = function() --[[ Line: 28 ]] --[[ Name: Init ]]
        -- upvalues: l_EquipGlovesOnCharacter_0 (copy), l_Workspace_0 (copy), v7 (copy), l_Styles_0 (copy), v11 (copy), l_SearchHelper_0 (copy)
        local v14 = false;
        local l_Parent_0 = script.Parent;
        local _ = nil;
        local _ = nil;
        local _ = nil;
        local _ = function(_, _) --[[ Line: 46 ]] --[[ Name: DebugRender ]]

        end;
        local v22 = {
            Name = "Default"
        };
        l_EquipGlovesOnCharacter_0:Fire(l_Parent_0, {
            v22, 
            v22
        });
        local v23 = l_Workspace_0:WaitForChild("States", 20);
        local v24 = v23:WaitForChild(l_Parent_0.Name, 20);
        local _ = v24:WaitForChild("Occupied", 20);
        local v26 = v24:WaitForChild("PlayerData", 20);
        local v27 = v24:WaitForChild("CharacterData", 20);
        local _ = l_Parent_0:WaitForChild("Humanoid", 20);
        local v29 = v7.New({
            Character = l_Parent_0
        });
        while not v27.Opponent.Value do
            task.wait();
        end;
        local l_Value_0 = v27.Opponent.Value;
        while not v23:FindFirstChild(l_Value_0.Name) do
            task.wait();
        end;
        local l_v23_FirstChild_0 = v23:FindFirstChild(l_Value_0.Name);
        local _ = l_v23_FirstChild_0.PlayerData.Style.Value;
        local l_CombatController_0 = v29.CombatController;
        local _ = function(v34, v35) --[[ Line: 92 ]] --[[ Name: GetPunchInfo ]]
            -- upvalues: l_Styles_0 (ref), v26 (copy), l_CombatController_0 (copy)
            local _ = l_Styles_0[v26.Style.Value];
            local l_Style_0 = v26:FindFirstChild("Style");
            local v38 = l_Styles_0[l_Style_0.Value].Combos[l_CombatController_0.CurrentCombo];
            local v39 = v38[l_CombatController_0.CurrentPunch];
            if v35 == "IsHeavy" then
                v38 = l_Styles_0[l_Style_0.Value].HeavyAttacks;
                v39 = v38[l_CombatController_0.CurrentHeavy];
            elseif v35 == "IsUltimate" then
                v38 = l_Styles_0[l_Style_0.Value].UltimateInfo;
                v39 = v38[1];
            end;
            local v40 = v38.DefaultPunchInfo or l_Styles_0[l_Style_0.Value].DefaultPunchInfo;
            return v39[v34] or v40[v34];
        end;
        local v42 = 0.3;
        local function _() --[[ Line: 116 ]] --[[ Name: GetReactionTime ]]
            -- upvalues: v42 (ref), v11 (ref)
            return (math.clamp(v42 + v11:NextNumber(0, 0.1), 0.125, 0.35));
        end;
        local v44 = 0;
        local v45 = 50;
        local v46 = false;
        local v47 = false;
        local v48 = true;
        local v49 = false;
        local v50 = true;
        local v51 = 0;
        local v52 = 0;
        local v53 = 0.8;
        l_Parent_0:SetAttribute("DamageMult", 0.8);
        l_Parent_0:SetAttribute("HealthMult", 0.8);
        l_Value_0:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 138 ]]
            -- upvalues: v44 (ref)
            v44 = v44 + 1;
        end);
        local v54 = 0;
        l_Parent_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 144 ]]
            -- upvalues: v54 (ref), l_Parent_0 (copy), v45 (ref), v42 (ref), l_SearchHelper_0 (ref), v26 (copy), v50 (ref), v51 (ref), v46 (ref), v47 (ref), v52 (ref), v53 (ref), v48 (ref)
            v54 = v54 + 1;
            local v55 = l_Parent_0 and l_Parent_0:FindFirstChild("Humanoid");
            local v56 = v55 and v55:FindFirstChild("HumanoidDescription");
            if v54 == 1 then
                v45 = 24;
                v42 = 0.26;
                l_SearchHelper_0.WriteBlobToDescription(v56, "15428184094|18426469560|||||||0|12808081205|13913844619|0|0|248,248,248|248,248,248|248,248,248|248,248,248|248,248,248|248,248,248|0|12808081205|13913844619|0|0|");
                l_SearchHelper_0.UpdateModelAppearance(l_Parent_0);
                v26.KnockdownSet.Value = "Barbarian";
                v50 = false;
                v51 = 8;
                v46 = true;
                v47 = true;
                return;
            else
                if v54 == 2 then
                    v45 = 20;
                    v42 = 0.24;
                    l_SearchHelper_0.WriteBlobToDescription(v56, "|16280849601|||||||0|10075324110|15941934817|0|0|248,248,248|248,248,248|248,248,248|248,248,248|248,248,248|248,248,248|0|10075324110|15941934817|0|0|");
                    l_SearchHelper_0.UpdateModelAppearance(l_Parent_0);
                    v26.KnockdownSet.Value = "Barbarian";
                    v52 = 0.1;
                    v53 = 0.3;
                    v48 = true;
                end;
                return;
            end;
        end);
        local l_Parent_1 = v27.Centre.Value.Parent.Parent;
        local v58 = RaycastParams.new();
        v58.FilterType = Enum.RaycastFilterType.Include;
        v58.FilterDescendantsInstances = {
            l_Parent_1
        };
        while task.wait() do
            if not l_Parent_0:IsDescendantOf(game) or not l_Value_0:IsDescendantOf(game) then
                l_Parent_0:Destroy();
                break;
            elseif l_Parent_0.PrimaryPart and l_Value_0.PrimaryPart then
                local l_Magnitude_0 = (l_Parent_0.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
                if v45 < v44 and l_Magnitude_0 < 4.5 and l_Value_0:GetAttribute("Punching") then
                    l_Parent_0:SetAttribute("ServerPerfect", true);
                    local v60 = l_Value_0:GetAttribute("LandTime") - workspace:GetServerTimeNow();
                    local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("AttackingHand");
                    task.wait(v60 - 0.11666666666666667);
                    v29:TryDash({
                        Direction = l_l_Value_0_Attribute_0 == "RightHand" and "Left" or "Right"
                    });
                    if l_Value_0:GetAttribute("SlowMo") then
                        while v27.Stunned.Value do
                            task.wait();
                        end;
                        v29:TryAttack({
                            IsHeavy = true
                        });
                        v44 = 0;
                    end;
                else
                    if l_Value_0:GetAttribute("Punching") and l_Magnitude_0 < 6 or v27.Stunned.Value then
                        if not v27.Stunned.Value and l_Value_0:GetAttribute("Punching") then
                            local v62 = l_Value_0:GetAttribute("LandTime") - workspace:GetServerTimeNow();
                            task.wait(v62 - 0.11666666666666667);
                            local v63 = 0.6;
                            if v54 == 0 then
                                v63 = 1;
                            elseif v54 == 1 then
                                v63 = 0.8;
                            end;
                            if v63 < v11:NextNumber(0, 1) then
                                v29:TryDash({
                                    Direction = v11:NextNumber(0, 1) > 0.5 and "Left" or "Right"
                                });
                            end;
                            task.wait(0.05);
                            continue;
                        elseif v27.BlockEnergy.Value > 10 then
                            if v29:TryBlock() then
                                repeat
                                    task.wait();
                                until v27.BlockEnergy.Value < 12 or not v27.Stunned.Value;
                                v29:Unblock();
                                continue;
                            else
                                v29:Unblock();
                            end;
                        end;
                    end;
                    if l_Workspace_0:GetServerTimeNow() - (l_Value_0:GetAttribute("LastDashTime") or 0) < 1 then
                        task.wait(0.3);
                        local v64 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v58) or {
                            Distance = 5000
                        };
                        local v65 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v58) or {
                            Distance = 5000
                        };
                        if v64.Distance > v65.Distance then
                            v29:TryDash({
                                Direction = "Right"
                            });
                        else
                            v29:TryDash({
                                Direction = "Left"
                            });
                        end;
                        task.wait(0.5);
                    end;
                    if v27.Stamina.Value < v27.MaxStamina.Value * 0.35 or v49 then
                        if v47 and l_Magnitude_0 < 2 and v27.Stamina.Value > v27.MaxStamina.Value * v52 then
                            local v66 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.LookVector * -5, v58);
                            if v11:NextNumber(0, 1) > 0.55 and not v66 then
                                v29:TryDash({
                                    Direction = "Backward"
                                });
                            else
                                local v67 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v58) or {
                                    Distance = 5000
                                };
                                local v68 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v58) or {
                                    Distance = 5000
                                };
                                if v67.Distance > v68.Distance then
                                    v29:TryDash({
                                        Direction = "Right"
                                    });
                                else
                                    v29:TryDash({
                                        Direction = "Left"
                                    });
                                end;
                            end;
                            task.wait(0.25);
                        elseif l_Magnitude_0 < v51 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, 1, 0)));
                        else
                            local v69 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v58) or {
                                Distance = 5000
                            };
                            local v70 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v58) or {
                                Distance = 5000
                            };
                            if v69.Distance > v70.Distance then
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 0, 0)));
                            elseif l_Magnitude_0 > 3.5 then
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, 0, 0)));
                            end;
                        end;
                    else
                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                        local v71 = l_Styles_0[v26.Style.Value];
                        local l_Style_1 = v26:FindFirstChild("Style");
                        local v73 = l_Styles_0[l_Style_1.Value].Combos[l_CombatController_0.CurrentCombo];
                        local v74 = v73[l_CombatController_0.CurrentPunch];
                        local v75 = v73.DefaultPunchInfo or l_Styles_0[l_Style_1.Value].DefaultPunchInfo;
                        if l_Magnitude_0 < (v74.HitboxSize or v75.HitboxSize or l_Styles_0[v26.Style.Value].HitboxInfo.Size).Z + v11:NextNumber(0.5, 1.5) then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, 0, 0)));
                            v71 = nil;
                            l_Style_1 = v11:NextNumber(0, 1) < 0.5;
                            local v76 = 0;
                            if v54 == 0 then
                                v76 = 0.9;
                            elseif v54 == 1 then
                                v76 = 0.65;
                            end;
                            if v76 < v11:NextNumber(0, 1) then
                                v74 = tick();
                                v75 = v54 == 0 and 0.2 or 0.2;
                                repeat
                                    task.wait();
                                until l_Value_0:GetAttribute("Punching") or v75 < tick() - v74;
                            end;
                            task.wait((math.clamp(v42 + v11:NextNumber(0, 0.1), 0.125, 0.35)));
                            if l_Value_0:GetAttribute("Punching") and v11:NextNumber(0, 1) > 0.67 then
                                v74 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v58) or {
                                    Distance = 5000
                                };
                                v75 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v58) or {
                                    Distance = 5000
                                };
                                if v74.Distance > v75.Distance then
                                    v29:TryDash({
                                        Direction = "Right"
                                    });
                                else
                                    v29:TryDash({
                                        Direction = "Left"
                                    });
                                end;
                                task.wait((math.clamp(v42 + v11:NextNumber(0, 0.1), 0.125, 0.35)));
                            end;
                            if l_Parent_0:GetAttribute("Punching") then
                                l_Style_1 = v11:NextNumber(0, 1) < 0.6;
                            end;
                            if l_Style_1 then
                                v74 = true;
                                repeat
                                    v71 = v29:TryAttack({
                                        IsHeavy = v74
                                    });
                                    if v74 and v11:NextNumber(0, 1) < 0.8 then
                                        v74 = false;
                                    end;
                                    task.wait(0.05);
                                    if v54 == 3 then
                                        v75 = v27.Stamina.Value;
                                        local _ = l_Styles_0[v26.Style.Value];
                                        local l_Style_2 = v26:FindFirstChild("Style");
                                        local v79 = l_Styles_0[l_Style_2.Value].Combos[l_CombatController_0.CurrentCombo];
                                        local v80 = v79[l_CombatController_0.CurrentPunch];
                                        local v81 = v79.DefaultPunchInfo or l_Styles_0[l_Style_2.Value].DefaultPunchInfo;
                                        if v75 <= (v80.Stamina or v81.Stamina) then
                                            break;
                                        end;
                                    end;
                                until l_Magnitude_0 > 8 or v27.Stunned.Value or v71 == "Missed";
                                task.wait(v11:NextNumber(0.5, 1));
                            else
                                repeat
                                    if v54 >= 2 then
                                        v74 = true;
                                        v75 = l_v23_FirstChild_0.CharacterData.BlockEnergy.Value;
                                        local _ = l_Styles_0[v26.Style.Value];
                                        local l_Style_3 = v26:FindFirstChild("Style");
                                        local v84 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                        local l_HeavyAttacks_0 = l_Styles_0[l_Style_3.Value].HeavyAttacks;
                                        v84 = l_HeavyAttacks_0[l_CombatController_0.CurrentHeavy];
                                        local v86 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                                        v14 = v75 < (v84.Damage or v86.Damage) * v11:NextNumber(0.7, 2.5);
                                    end;
                                    if not v14 then
                                        v74 = v11:NextNumber(0, 1) > 0.7;
                                    end;
                                    v14 = false;
                                    v75 = workspace:GetServerTimeNow();
                                    v71 = v29:TryAttack({
                                        IsHeavy = v74
                                    });
                                    task.wait(0.05);
                                    if v54 >= 2 then
                                        local l_Value_2 = v27.Stamina.Value;
                                        local _ = l_Styles_0[v26.Style.Value];
                                        local l_Style_4 = v26:FindFirstChild("Style");
                                        local v90 = l_Styles_0[l_Style_4.Value].Combos[l_CombatController_0.CurrentCombo];
                                        local v91 = v90[l_CombatController_0.CurrentPunch];
                                        local v92 = v90.DefaultPunchInfo or l_Styles_0[l_Style_4.Value].DefaultPunchInfo;
                                        if l_Value_2 <= (v91.Stamina or v92.Stamina) then
                                            break;
                                        end;
                                    end;
                                until l_Magnitude_0 > 8 or v27.Stunned.Value or v71 == "Missed";
                                task.wait(v11:NextNumber(0.15, 0.5));
                                if v11:NextNumber(0, 1) > 0.67 then
                                    v74 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v58) or {
                                        Distance = 5000
                                    };
                                    v75 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v58) or {
                                        Distance = 5000
                                    };
                                    if v74.Distance > v75.Distance then
                                        v29:TryDash({
                                            Direction = "Right"
                                        });
                                    else
                                        v29:TryDash({
                                            Direction = "Left"
                                        });
                                    end;
                                    task.wait(0.1);
                                end;
                                task.wait(v11:NextNumber(0.2, 0.6));
                            end;
                            if v71 == "Missed" then
                                if v27.Stamina.Value <= v27.MaxStamina.Value * v53 then
                                    v29:TryDash({
                                        Direction = "Backward"
                                    });
                                end;
                                task.wait(0.2);
                            else
                                v49 = true;
                                task.delay(v54 == 0 and v11:NextNumber(0.5, 3) or v11:NextNumber(0.75, 2.5), function() --[[ Line: 442 ]]
                                    -- upvalues: v49 (ref)
                                    v49 = false;
                                end);
                                task.wait(v11:NextNumber(0.2, 0.5));
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end
};