local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local _ = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_EquipGloves_0 = l_ServerScriptService_0:WaitForChild("Events"):WaitForChild("EquipGloves");
local v6 = l_ServerScriptService_0:WaitForChild("Combat", 10);
local v7 = require(v6:WaitForChild("NPC", 10));
local l_CreateEffect_0 = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents"):WaitForChild("CreateEffect");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local v11 = Random.new();
return {
    Init = function() --[[ Line: 25 ]] --[[ Name: Init ]]
        -- upvalues: l_ServerStorage_0 (copy), l_EquipGloves_0 (copy), l_Workspace_0 (copy), v7 (copy), l_Styles_0 (copy), v11 (copy), l_CreateEffect_0 (copy)
        local l_Parent_0 = script.Parent;
        local _ = nil;
        local _ = nil;
        local _ = nil;
        local _ = function(_, _) --[[ Line: 43 ]] --[[ Name: DebugRender ]]

        end;
        local l_Assets_0 = script.Assets;
        l_Assets_0.Parent = l_ServerStorage_0;
        l_Assets_0.Name = l_Parent_0.Name;
        local v20 = {
            Name = "Dragon"
        };
        l_EquipGloves_0:Fire(l_Parent_0, {
            v20, 
            v20
        });
        local v21 = l_Workspace_0:WaitForChild("States", 20);
        local v22 = v21:WaitForChild(l_Parent_0.Name, 20);
        local v23 = v22:WaitForChild("Occupied", 20);
        local v24 = v22:WaitForChild("PlayerData", 20);
        local v25 = v22:WaitForChild("CharacterData", 20);
        local _ = l_Parent_0:WaitForChild("Humanoid", 20);
        l_Parent_0.Head.Transparency = 1;
        l_Parent_0.Head.FirstHead.Transparency = 0;
        l_Parent_0:SetAttribute("Yakuza", true);
        local v27 = v7.New({
            Character = l_Parent_0
        });
        while not v25.Opponent.Value do
            task.wait();
        end;
        local l_Value_0 = v25.Opponent.Value;
        while not v21:FindFirstChild(l_Value_0.Name) do
            task.wait();
        end;
        local l_v21_FirstChild_0 = v21:FindFirstChild(l_Value_0.Name);
        local l_Value_1 = l_v21_FirstChild_0.PlayerData.Style.Value;
        local l_CombatController_0 = v27.CombatController;
        local _ = function(v32, v33) --[[ Line: 102 ]] --[[ Name: GetPunchInfo ]]
            -- upvalues: l_Styles_0 (ref), v24 (copy), l_CombatController_0 (copy)
            local _ = l_Styles_0[v24.Style.Value];
            local l_Style_0 = v24:FindFirstChild("Style");
            local v36 = l_Styles_0[l_Style_0.Value].Combos[l_CombatController_0.CurrentCombo];
            local v37 = v36[l_CombatController_0.CurrentPunch];
            if v33 == "IsHeavy" then
                v36 = l_Styles_0[l_Style_0.Value].HeavyAttacks;
                v37 = v36[l_CombatController_0.CurrentHeavy];
            elseif v33 == "IsUltimate" then
                v36 = l_Styles_0[l_Style_0.Value].UltimateInfo;
                v37 = v36[1];
            end;
            local v38 = v36.DefaultPunchInfo or l_Styles_0[l_Style_0.Value].DefaultPunchInfo;
            return v37[v32] or v38[v32];
        end;
        local v40 = l_Parent_0:GetAttribute("HardMode") or false;
        local v41 = l_Parent_0:GetAttribute("EasyMode") or false;
        local v42 = v40 and 0.22 or 0.27;
        local function _() --[[ Line: 129 ]] --[[ Name: GetReactionTime ]]
            -- upvalues: v42 (ref), v11 (ref)
            return (math.clamp(v42 + v11:NextNumber(0, 0.1), 0.125, 0.35));
        end;
        local v44 = 0;
        local v45 = v40 and 16 or 30;
        local l_v40_0 = v40;
        local l_v40_1 = v40;
        local v48 = not v40;
        local v49 = false;
        local v50 = not v40;
        local v51 = 6;
        local v52 = 0.25;
        local v53 = 0.6;
        if v40 then
            l_Parent_0:SetAttribute("DamageMult", 1.1);
            l_Parent_0:SetAttribute("HealthMult", 1.1);
        elseif v41 then
            l_Parent_0:SetAttribute("DamageMult", 0.9);
            l_Parent_0:SetAttribute("HealthMult", 0.65);
        else
            l_Parent_0:SetAttribute("DamageMult", 1);
            l_Parent_0:SetAttribute("HealthMult", 1);
        end;
        l_Value_0:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 160 ]]
            -- upvalues: v44 (ref)
            v44 = v44 + 1;
        end);
        local v54 = 0;
        l_Parent_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 166 ]]
            -- upvalues: v54 (ref), v45 (ref), v40 (copy), v42 (ref), v24 (copy), l_Parent_0 (copy), l_Assets_0 (copy), v50 (ref), v51 (ref), l_v40_0 (ref), l_v40_1 (ref), v41 (copy), l_EquipGloves_0 (ref), v25 (copy), v23 (copy), l_Workspace_0 (ref), l_CreateEffect_0 (ref), v52 (ref), v53 (ref), v48 (ref)
            v54 = v54 + 1;
            if v54 == 1 then
                v45 = v40 and 12 or 24;
                v42 = v40 and 0.2 or 0.26;
                v24.KnockdownSet.Value = "Fling";
                l_Parent_0.Head.Transparency = 0;
                l_Parent_0.Head.FirstHead.Transparency = 1;
                l_Parent_0.Hair2.Handle.Transparency = 0;
                for _, v56 in l_Parent_0:GetDescendants() do
                    if v56:IsA("Shirt") or v56:IsA("Pants") then
                        v56:Destroy();
                    end;
                end;
                l_Assets_0.Shirt.Parent = l_Parent_0;
                l_Assets_0.Pants.Parent = l_Parent_0;
                v50 = false;
                v51 = 8;
                l_v40_0 = true;
                l_v40_1 = true;
                return;
            elseif v54 == 2 then
                v45 = v40 and 8 or 12;
                v42 = v40 and 0.2 or 0.24;
                v24.KnockdownSet.Value = "Yakuza";
                l_Parent_0:SetAttribute("DamageMult", 1.2);
                l_Parent_0:SetAttribute("HealthMult", 1);
                if v41 then
                    l_Parent_0:SetAttribute("DamageMult", 1);
                    l_Parent_0:SetAttribute("HealthMult", 0.8);
                end;
                v24.Style.Value = "Charge";
                local v57 = {
                    Name = "Dragon", 
                    Unusual = "Dragon Fire"
                };
                l_EquipGloves_0:Fire(l_Parent_0, {
                    v57, 
                    v57
                });
                l_Parent_0.Head.Transparency = 1;
                l_Parent_0.Head.FirstHead.Transparency = 1;
                l_Parent_0.Face.Handle.Transparency = 0;
                l_Parent_0.Scars.Handle.Transparency = 0;
                local v58 = nil;
                v58 = v25.Cutscene.Changed:Connect(function(v59) --[[ Line: 219 ]]
                    -- upvalues: v58 (ref), v25 (ref), v23 (ref), l_Workspace_0 (ref), l_CreateEffect_0 (ref), l_Parent_0 (ref)
                    if v59 == true then
                        return;
                    else
                        if v58 then
                            v58:Disconnect();
                        end;
                        v25.Cutscene.Value = true;
                        v25.CanEmoteAnyways.Value = true;
                        local l_Value_2 = v23.LockedOn.Value;
                        local v61 = l_Value_2 and game.Players:GetPlayerFromCharacter(l_Value_2);
                        if not v61 then
                            v25.Cutscene.Value = false;
                            return;
                        else
                            local v62 = l_Workspace_0.States[l_Value_2.Name];
                            local _ = v62.PlayerData;
                            local l_CharacterData_0 = v62.CharacterData;
                            l_CharacterData_0.Stunned.Value = true;
                            l_CharacterData_0.Cutscene.Value = true;
                            task.wait(0.25);
                            l_CreateEffect_0:FireClient(v61, {
                                "UseEmote", 
                                l_Parent_0, 
                                "Dragon"
                            });
                            task.wait(2);
                            l_CharacterData_0.Stunned.Value = false;
                            l_CharacterData_0.Cutscene.Value = false;
                            v25.Cutscene.Value = false;
                            return;
                        end;
                    end;
                end);
                v52 = 0.1;
                v53 = 0.3;
                v48 = false;
                return;
            else
                v24.KnockdownSet.Value = "Gear5";
                return;
            end;
        end);
        local l_Parent_1 = v25.Centre.Value.Parent.Parent;
        local v66 = RaycastParams.new();
        v66.FilterType = Enum.RaycastFilterType.Include;
        v66.FilterDescendantsInstances = {
            l_Parent_1
        };
        while task.wait() and l_Parent_0:IsDescendantOf(game) and l_Value_0:IsDescendantOf(game) do
            if l_Parent_0.PrimaryPart and l_Value_0.PrimaryPart then
                local l_Magnitude_0 = (l_Parent_0.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
                if v45 < v44 and l_Magnitude_0 < 4.5 and l_Value_0:GetAttribute("Punching") and (l_Value_0:GetAttribute("IsHeavy") or v40) then
                    l_Parent_0:SetAttribute("ServerPerfect", true);
                    local v68 = l_Value_0:GetAttribute("LandTime") - workspace:GetServerTimeNow();
                    local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("AttackingHand");
                    task.wait(v68 - 0.11666666666666667);
                    v27:TryDash({
                        Direction = l_l_Value_0_Attribute_0 == "RightHand" and "Left" or "Right"
                    });
                    if l_Value_0:GetAttribute("SlowMo") then
                        while v25.Stunned.Value do
                            task.wait();
                        end;
                        if v25.UltimateEnergy.Value == 100 then
                            v27:TryAttack({
                                IsUltimate = true
                            });
                        else
                            v27:TryAttack({
                                IsHeavy = true
                            });
                        end;
                        v44 = 0;
                    end;
                else
                    if (l_Value_0:GetAttribute("Punching") and l_Magnitude_0 < 8 or v25.Stunned.Value) and v25.BlockEnergy.Value > 8 then
                        if v48 and l_Value_0:GetAttribute("Punching") and l_Value_0:GetAttribute("IsUltimate") then
                            v27:Unblock();
                            continue;
                        else
                            if v50 and v11:NextNumber(0, 1) < 0.5 then
                                task.wait(1.2);
                            else
                                task.wait((math.clamp(v42 + v11:NextNumber(0, 0.1), 0.125, 0.35)));
                            end;
                            if not v25.Stunned.Value and l_Value_0:GetAttribute("Punching") and l_v40_0 and v11:NextNumber(0, 1) > 0.5 then
                                v27:TryDash({
                                    Direction = v11:NextNumber(0, 1) > 0.5 and "Left" or "Right"
                                });
                            end;
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, 1, 0)));
                            if v27:TryBlock() then
                                local v70 = v40 and 12 or v11:NextNumber(4, 10);
                                repeat
                                    task.wait();
                                until v25.BlockEnergy.Value < v70 or not v25.Stunned.Value or v48 and l_Value_0:GetAttribute("IsUltimate");
                                v27:Unblock();
                            else
                                v27:Unblock();
                            end;
                            task.wait(math.clamp(v42 + v11:NextNumber(0, 0.1), 0.125, 0.35) / 2);
                        end;
                    end;
                    if v25.Stamina.Value < v25.MaxStamina.Value * 0.4 or v49 then
                        if l_v40_1 and l_Magnitude_0 < 5 and v25.Stamina.Value > v25.MaxStamina.Value * v52 then
                            local v71 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.LookVector * -5, v66);
                            if v11:NextNumber(0, 1) > 0.5 and not v71 then
                                v27:TryDash({
                                    Direction = "Backward"
                                });
                            else
                                local v72 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v66) or {
                                    Distance = 5000
                                };
                                local v73 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v66) or {
                                    Distance = 5000
                                };
                                if v72.Distance > v73.Distance then
                                    v27:TryDash({
                                        Direction = "Right"
                                    });
                                else
                                    v27:TryDash({
                                        Direction = "Left"
                                    });
                                end;
                            end;
                        elseif l_Magnitude_0 < v51 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, 1, 0)));
                        else
                            local v74 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v66) or {
                                Distance = 5000
                            };
                            local v75 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v66) or {
                                Distance = 5000
                            };
                            if v74.Distance > v75.Distance then
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 0, 0)));
                            else
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, 0, 0)));
                            end;
                        end;
                    else
                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                        local v76 = l_Styles_0[v24.Style.Value];
                        local l_Style_1 = v24:FindFirstChild("Style");
                        local v78 = l_Styles_0[l_Style_1.Value].Combos[l_CombatController_0.CurrentCombo];
                        local v79 = v78[l_CombatController_0.CurrentPunch];
                        local v80 = v78.DefaultPunchInfo or l_Styles_0[l_Style_1.Value].DefaultPunchInfo;
                        if l_Magnitude_0 < (v79.HitboxSize or v80.HitboxSize or l_Styles_0[v24.Style.Value].HitboxInfo.Size).Z + v11:NextNumber(0.5, 1.5) then
                            v76 = nil;
                            if v11:NextNumber(0, 1) < 0.5 then
                                local v81 = true;
                                repeat
                                    v76 = v27:TryAttack({
                                        IsHeavy = v81
                                    });
                                    if v81 and v11:NextNumber(0, 1) < 0.8 then
                                        v81 = false;
                                    end;
                                    task.wait();
                                    v78 = v25.Stamina.Value;
                                    v80 = l_Styles_0[v24.Style.Value];
                                    local l_Style_2 = v24:FindFirstChild("Style");
                                    local v83 = l_Styles_0[l_Style_2.Value].Combos[l_CombatController_0.CurrentCombo];
                                    local v84 = v83[l_CombatController_0.CurrentPunch];
                                    local v85 = v83.DefaultPunchInfo or l_Styles_0[l_Style_2.Value].DefaultPunchInfo;
                                until v78 <= (v84.Stamina or v85.Stamina) or l_Magnitude_0 > 8 or v25.Stunned.Value or v76 == "Missed";
                            else
                                repeat
                                    v78 = l_v21_FirstChild_0.CharacterData.BlockEnergy.Value;
                                    local v86 = l_Styles_0[v24.Style.Value];
                                    local l_Style_3 = v24:FindFirstChild("Style");
                                    local v88 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                    local l_HeavyAttacks_0 = l_Styles_0[l_Style_3.Value].HeavyAttacks;
                                    v88 = l_HeavyAttacks_0[l_CombatController_0.CurrentHeavy];
                                    local v90 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                                    local v91 = v78 < (v88.Damage or v90.Damage) * v11:NextNumber(0.7, 2.5);
                                    v78 = workspace:GetServerTimeNow();
                                    v76 = v27:TryAttack({
                                        IsHeavy = v91
                                    });
                                    task.wait();
                                    v79 = v25.Stamina.Value;
                                    v86 = l_Styles_0[v24.Style.Value];
                                    l_Style_3 = v24:FindFirstChild("Style");
                                    l_HeavyAttacks_0 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo];
                                    v88 = l_HeavyAttacks_0[l_CombatController_0.CurrentPunch];
                                    v90 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                                until v79 <= (v88.Stamina or v90.Stamina) or l_Magnitude_0 > 8 or v25.Stunned.Value or v76 == "Missed";
                            end;
                            if v76 == "Missed" then
                                if v25.Stamina.Value > v25.MaxStamina.Value * v53 then
                                    if not v40 or l_Value_1 ~= "Bullet" then
                                        v27:TryDash({
                                            Direction = "Forward"
                                        });
                                    end;
                                else
                                    v27:TryDash({
                                        Direction = "Backward"
                                    });
                                end;
                            elseif v25.Stamina.Value < v25.MaxStamina.Value * 0.5 then
                                v49 = true;
                                task.delay(v11:NextNumber(1, 3), function() --[[ Line: 445 ]]
                                    -- upvalues: v49 (ref)
                                    v49 = false;
                                end);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end
};