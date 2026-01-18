local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerStorage");
local _ = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local _ = l_ServerScriptService_0:WaitForChild("Events"):WaitForChild("EquipGloves");
local v6 = l_ServerScriptService_0:WaitForChild("Combat", 10);
local v7 = require(v6:WaitForChild("NPC", 10));
local _ = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents"):WaitForChild("CreateEffect");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local v11 = Random.new();
return {
    Init = function() --[[ Line: 25 ]] --[[ Name: Init ]]
        -- upvalues: l_Workspace_0 (copy), v7 (copy), l_Styles_0 (copy), v11 (copy)
        local l_Parent_0 = script.Parent;
        local _ = nil;
        local _ = nil;
        local _ = nil;
        local _ = function(_, _) --[[ Line: 43 ]] --[[ Name: DebugRender ]]

        end;
        local v19 = l_Workspace_0:WaitForChild("States", 20);
        local v20 = v19:WaitForChild(l_Parent_0.Name, 20);
        local _ = v20:WaitForChild("Occupied", 20);
        local v22 = v20:WaitForChild("PlayerData", 20);
        local v23 = v20:WaitForChild("CharacterData", 20);
        local _ = l_Parent_0:WaitForChild("Humanoid", 20);
        local v25 = v7.New({
            Character = l_Parent_0
        });
        while not v23.Opponent.Value do
            task.wait();
        end;
        local l_Value_0 = v23.Opponent.Value;
        while not v19:FindFirstChild(l_Value_0.Name) do
            task.wait();
        end;
        local l_v19_FirstChild_0 = v19:FindFirstChild(l_Value_0.Name);
        local l_Value_1 = l_v19_FirstChild_0.PlayerData.Style.Value;
        local l_CombatController_0 = v25.CombatController;
        local _ = function(v30, v31) --[[ Line: 93 ]] --[[ Name: GetPunchInfo ]]
            -- upvalues: l_Styles_0 (ref), v22 (copy), l_CombatController_0 (copy)
            local _ = l_Styles_0[v22.Style.Value];
            local l_Style_0 = v22:FindFirstChild("Style");
            local v34 = l_Styles_0[l_Style_0.Value].Combos[l_CombatController_0.CurrentCombo];
            local v35 = v34[l_CombatController_0.CurrentPunch];
            if v31 == "IsHeavy" then
                v34 = l_Styles_0[l_Style_0.Value].HeavyAttacks;
                v35 = v34[l_CombatController_0.CurrentHeavy];
            elseif v31 == "IsUltimate" then
                v34 = l_Styles_0[l_Style_0.Value].UltimateInfo;
                v35 = v34[1];
            end;
            local v36 = v34.DefaultPunchInfo or l_Styles_0[l_Style_0.Value].DefaultPunchInfo;
            return v35[v30] or v36[v30];
        end;
        local v38 = l_Parent_0:GetAttribute("HardMode") or false;
        local _ = l_Parent_0:GetAttribute("EasyMode") or false;
        local v40 = v38 and 0.22 or 0.27;
        local function _() --[[ Line: 120 ]] --[[ Name: GetReactionTime ]]
            -- upvalues: v40 (copy), v11 (ref)
            return (math.clamp(v40 + v11:NextNumber(0, 0.1), 0.125, 0.35));
        end;
        local v42 = 0;
        local v43 = v38 and 16 or 30;
        local v44 = not v38;
        local v45 = false;
        local v46 = not v38;
        l_Value_0:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 139 ]]
            -- upvalues: v42 (ref)
            v42 = v42 + 1;
        end);
        local l_Parent_1 = v23.Centre.Value.Parent.Parent;
        local v48 = RaycastParams.new();
        v48.FilterType = Enum.RaycastFilterType.Include;
        v48.FilterDescendantsInstances = {
            l_Parent_1
        };
        while task.wait() and l_Parent_0:IsDescendantOf(game) and l_Value_0:IsDescendantOf(game) do
            if l_Parent_0.PrimaryPart and l_Value_0.PrimaryPart then
                local l_Magnitude_0 = (l_Parent_0.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
                if v43 < v42 and l_Magnitude_0 < 4.5 and l_Value_0:GetAttribute("Punching") and (l_Value_0:GetAttribute("IsHeavy") or v38) then
                    l_Parent_0:SetAttribute("ServerPerfect", true);
                    local v50 = l_Value_0:GetAttribute("LandTime") - workspace:GetServerTimeNow();
                    local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("AttackingHand");
                    task.wait(v50 - 0.11666666666666667);
                    v25:TryDash({
                        Direction = l_l_Value_0_Attribute_0 == "RightHand" and "Left" or "Right"
                    });
                    if l_Value_0:GetAttribute("SlowMo") then
                        while v23.Stunned.Value do
                            task.wait();
                        end;
                        if v23.UltimateEnergy.Value == 100 then
                            v25:TryAttack({
                                IsUltimate = true
                            });
                        else
                            v25:TryAttack({
                                IsHeavy = true
                            });
                        end;
                        v42 = 0;
                    end;
                else
                    if (l_Value_0:GetAttribute("Punching") and l_Magnitude_0 < 8 or v23.Stunned.Value) and v23.BlockEnergy.Value > 8 then
                        if v44 and l_Value_0:GetAttribute("Punching") and l_Value_0:GetAttribute("IsUltimate") then
                            v25:Unblock();
                            continue;
                        else
                            if v46 and v11:NextNumber(0, 1) < 0.5 then
                                task.wait(1.2);
                            else
                                task.wait((math.clamp(v40 + v11:NextNumber(0, 0.1), 0.125, 0.35)));
                            end;
                            if not v23.Stunned.Value and l_Value_0:GetAttribute("Punching") and v38 and v11:NextNumber(0, 1) > 0.5 then
                                v25:TryDash({
                                    Direction = v11:NextNumber(0, 1) > 0.5 and "Left" or "Right"
                                });
                            end;
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, 1, 0)));
                            if v25:TryBlock() then
                                local v52 = v38 and 12 or v11:NextNumber(4, 10);
                                repeat
                                    task.wait();
                                until v23.BlockEnergy.Value < v52 or not v23.Stunned.Value or v44 and l_Value_0:GetAttribute("IsUltimate");
                                v25:Unblock();
                            else
                                v25:Unblock();
                            end;
                            task.wait(math.clamp(v40 + v11:NextNumber(0, 0.1), 0.125, 0.35) / 2);
                        end;
                    end;
                    if v23.Stamina.Value < v23.MaxStamina.Value * 0.4 or v45 then
                        if v38 and l_Magnitude_0 < 5 and v23.Stamina.Value > v23.MaxStamina.Value * 0.25 then
                            local v53 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.LookVector * -5, v48);
                            if v11:NextNumber(0, 1) > 0.5 and not v53 then
                                v25:TryDash({
                                    Direction = "Backward"
                                });
                            else
                                local v54 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v48) or {
                                    Distance = 5000
                                };
                                local v55 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v48) or {
                                    Distance = 5000
                                };
                                if v54.Distance > v55.Distance then
                                    v25:TryDash({
                                        Direction = "Right"
                                    });
                                else
                                    v25:TryDash({
                                        Direction = "Left"
                                    });
                                end;
                            end;
                        elseif l_Magnitude_0 < 6 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, 1, 0)));
                        else
                            local v56 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v48) or {
                                Distance = 5000
                            };
                            local v57 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v48) or {
                                Distance = 5000
                            };
                            if v56.Distance > v57.Distance then
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 0, 0)));
                            else
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, 0, 0)));
                            end;
                        end;
                    else
                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                        local v58 = l_Styles_0[v22.Style.Value];
                        local l_Style_1 = v22:FindFirstChild("Style");
                        local v60 = l_Styles_0[l_Style_1.Value].Combos[l_CombatController_0.CurrentCombo];
                        local v61 = v60[l_CombatController_0.CurrentPunch];
                        local v62 = v60.DefaultPunchInfo or l_Styles_0[l_Style_1.Value].DefaultPunchInfo;
                        if l_Magnitude_0 < (v61.HitboxSize or v62.HitboxSize or l_Styles_0[v22.Style.Value].HitboxInfo.Size).Z + v11:NextNumber(0.5, 1.5) then
                            v58 = nil;
                            if v11:NextNumber(0, 1) < 0.5 then
                                local v63 = true;
                                repeat
                                    v58 = v25:TryAttack({
                                        IsHeavy = v63
                                    });
                                    if v63 and v11:NextNumber(0, 1) < 0.8 then
                                        v63 = false;
                                    end;
                                    task.wait();
                                    v60 = v23.Stamina.Value;
                                    v62 = l_Styles_0[v22.Style.Value];
                                    local l_Style_2 = v22:FindFirstChild("Style");
                                    local v65 = l_Styles_0[l_Style_2.Value].Combos[l_CombatController_0.CurrentCombo];
                                    local v66 = v65[l_CombatController_0.CurrentPunch];
                                    local v67 = v65.DefaultPunchInfo or l_Styles_0[l_Style_2.Value].DefaultPunchInfo;
                                until v60 <= (v66.Stamina or v67.Stamina) or l_Magnitude_0 > 8 or v23.Stunned.Value or v58 == "Missed";
                            else
                                repeat
                                    v60 = l_v19_FirstChild_0.CharacterData.BlockEnergy.Value;
                                    local v68 = l_Styles_0[v22.Style.Value];
                                    local l_Style_3 = v22:FindFirstChild("Style");
                                    local v70 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                    local l_HeavyAttacks_0 = l_Styles_0[l_Style_3.Value].HeavyAttacks;
                                    v70 = l_HeavyAttacks_0[l_CombatController_0.CurrentHeavy];
                                    local v72 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                                    local v73 = v60 < (v70.Damage or v72.Damage) * v11:NextNumber(0.7, 2.5);
                                    v60 = workspace:GetServerTimeNow();
                                    v58 = v25:TryAttack({
                                        IsHeavy = v73
                                    });
                                    task.wait();
                                    v61 = v23.Stamina.Value;
                                    v68 = l_Styles_0[v22.Style.Value];
                                    l_Style_3 = v22:FindFirstChild("Style");
                                    l_HeavyAttacks_0 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo];
                                    v70 = l_HeavyAttacks_0[l_CombatController_0.CurrentPunch];
                                    v72 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                                until v61 <= (v70.Stamina or v72.Stamina) or l_Magnitude_0 > 8 or v23.Stunned.Value or v58 == "Missed";
                            end;
                            if v58 == "Missed" then
                                if v23.Stamina.Value > v23.MaxStamina.Value * 0.6 then
                                    if not v38 or l_Value_1 ~= "Bullet" then
                                        v25:TryDash({
                                            Direction = "Forward"
                                        });
                                    end;
                                else
                                    v25:TryDash({
                                        Direction = "Backward"
                                    });
                                end;
                            elseif v23.Stamina.Value < v23.MaxStamina.Value * 0.5 then
                                v45 = true;
                                task.delay(v11:NextNumber(1, 3), function() --[[ Line: 323 ]]
                                    -- upvalues: v45 (ref)
                                    v45 = false;
                                end);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end
};