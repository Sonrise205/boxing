local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_Workspace_0 = game:GetService("Workspace");
local l_EquipGloves_0 = l_ServerScriptService_0:WaitForChild("Events"):WaitForChild("EquipGloves");
local v5 = l_ServerScriptService_0:WaitForChild("Combat", 10);
local v6 = require(v5:WaitForChild("NPC", 10));
local _ = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents"):WaitForChild("CreateEffect");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local v10 = Random.new();
return {
    Init = function() --[[ Line: 22 ]] --[[ Name: Init ]]
        -- upvalues: l_ServerStorage_0 (copy), l_EquipGloves_0 (copy), l_Workspace_0 (copy), v6 (copy), l_Styles_0 (copy), v10 (copy)
        local l_Parent_0 = script.Parent;
        local l_Assets_0 = script.Assets;
        l_Assets_0.Parent = l_ServerStorage_0;
        l_Assets_0.Name = l_Parent_0.Name;
        local v13 = {
            Name = "ChampionRanked"
        };
        l_EquipGloves_0:Fire(l_Parent_0, {
            v13, 
            v13
        });
        local v14 = l_Workspace_0:WaitForChild("States", 20);
        local v15 = v14:WaitForChild(l_Parent_0.Name, 20);
        local _ = v15:WaitForChild("Occupied", 20);
        local v17 = v15:WaitForChild("PlayerData", 20);
        local v18 = v15:WaitForChild("CharacterData", 20);
        local _ = l_Parent_0:WaitForChild("Humanoid", 20);
        local v20 = v6.New({
            Character = l_Parent_0
        });
        while not v18.Opponent.Value do
            task.wait();
        end;
        local l_Value_0 = v18.Opponent.Value;
        while not v14:FindFirstChild(l_Value_0.Name) do
            task.wait();
        end;
        local l_v14_FirstChild_0 = v14:FindFirstChild(l_Value_0.Name);
        local _ = game.Players:GetPlayerFromCharacter(l_Value_0);
        local l_Value_1 = l_v14_FirstChild_0.PlayerData.Style.Value;
        local l_CombatController_0 = v20.CombatController;
        local _ = function(v26, v27) --[[ Line: 61 ]] --[[ Name: GetPunchInfo ]]
            -- upvalues: l_Styles_0 (ref), v17 (copy), l_CombatController_0 (copy)
            local _ = l_Styles_0[v17.Style.Value];
            local l_Style_0 = v17:FindFirstChild("Style");
            local v30 = l_Styles_0[l_Style_0.Value].Combos[l_CombatController_0.CurrentCombo];
            local v31 = v30[l_CombatController_0.CurrentPunch];
            if v27 == "IsHeavy" then
                v30 = l_Styles_0[l_Style_0.Value].HeavyAttacks;
                v31 = v30[l_CombatController_0.CurrentHeavy];
            elseif v27 == "IsUltimate" then
                v30 = l_Styles_0[l_Style_0.Value].UltimateInfo;
                v31 = v30[1];
            end;
            local v32 = v30.DefaultPunchInfo or l_Styles_0[l_Style_0.Value].DefaultPunchInfo;
            return v31[v26] or v32[v26];
        end;
        local v34 = 0.2;
        local v35 = 0.4;
        local function _() --[[ Line: 85 ]] --[[ Name: GetReactionTime ]]
            -- upvalues: v34 (ref), v10 (ref), v35 (ref)
            return (math.clamp(v34 + v10:NextNumber(0, v35), 0.125, 0.3));
        end;
        local v37 = 0;
        local v38 = true;
        local v39 = false;
        local _ = os.clock();
        local _ = {
            "TakeTheL", 
            "TakeYourTime", 
            "ComeOn", 
            "Facepalm", 
            "HitMe", 
            "Troll", 
            "Heart", 
            "Lookaway", 
            "PBJT"
        };
        l_Value_0:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 109 ]]
            -- upvalues: v37 (ref)
            v37 = v37 + 1;
        end);
        local v42 = 0.5;
        local v43 = l_Parent_0:GetAttribute("HardMode") or false;
        local v44 = l_Parent_0:GetAttribute("EasyMode") or false;
        if v43 then
            l_Parent_0:SetAttribute("DamageMult", 1.3);
            l_Parent_0:SetAttribute("HealthMult", 1.5);
        elseif v44 then
            v34 = 0.22;
            v42 = 0.8;
            v38 = false;
            l_Parent_0:SetAttribute("DamageMult", 1.1);
            l_Parent_0:SetAttribute("HealthMult", 0.9);
        else
            l_Parent_0:SetAttribute("DamageMult", 1.2);
            l_Parent_0:SetAttribute("HealthMult", 1.1);
        end;
        local v45 = l_Parent_0:GetAttribute("BabyMode") or false;
        if v45 then
            v34 = 0.28;
            v42 = 0.8;
            v38 = false;
            l_Parent_0:SetAttribute("DamageMult", 0.8);
            l_Parent_0:SetAttribute("HealthMult", 0.8);
        end;
        local v46 = 0;
        l_Parent_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 147 ]]
            -- upvalues: v46 (ref), l_EquipGloves_0 (ref), l_Parent_0 (copy), v34 (ref), v35 (ref), v42 (ref), v38 (ref), v43 (copy), v44 (copy), l_Assets_0 (copy)
            v46 = v46 + 1;
            if v46 == 1 then
                local v47 = {
                    Name = "ChampionRanked", 
                    Unusual = "Cosmic"
                };
                l_EquipGloves_0:Fire(l_Parent_0, {
                    v47, 
                    v47
                });
                v34 = 0.15;
                v35 = 0.1;
                v42 = 0.5;
                v38 = true;
                if v43 then
                    l_Parent_0:SetAttribute("DamageMult", 1.5);
                    l_Parent_0:SetAttribute("HealthMult", 1.7);
                    return;
                elseif v44 then
                    v34 = 0.17;
                    l_Parent_0:SetAttribute("DamageMult", 1.1);
                    l_Parent_0:SetAttribute("HealthMult", 1.1);
                    return;
                else
                    l_Parent_0:SetAttribute("DamageMult", 1.2);
                    l_Parent_0:SetAttribute("HealthMult", 1.2);
                    return;
                end;
            elseif v46 == 2 then
                for _, v49 in l_Parent_0:GetDescendants() do
                    if v49:IsA("Shirt") then
                        v49:Destroy();
                    end;
                end;
                l_Assets_0.Shirt1.Parent = l_Parent_0;
                return;
            else
                return;
            end;
        end);
        local l_Parent_1 = v18.Centre.Value.Parent.Parent;
        local v51 = RaycastParams.new();
        v51.FilterType = Enum.RaycastFilterType.Include;
        v51.FilterDescendantsInstances = {
            l_Parent_1
        };
        while task.wait() and l_Parent_0:IsDescendantOf(game) and l_Value_0:IsDescendantOf(game) do
            if l_Parent_0.PrimaryPart and l_Value_0.PrimaryPart then
                local l_Magnitude_0 = (l_Parent_0.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
                if l_Value_1 == "Takamura" and l_Value_0:GetAttribute("Charging") then
                    l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 1, 0)));
                    if l_Magnitude_0 < 5 then
                        v20:TryAttack({});
                    end;
                elseif v37 > 8 and l_Magnitude_0 < 4.5 and l_Value_0:GetAttribute("Punching") then
                    l_Parent_0:SetAttribute("ServerPerfect", true);
                    local v53 = l_Value_0:GetAttribute("LandTime") - workspace:GetServerTimeNow();
                    local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("AttackingHand");
                    task.wait(v53 - 0.11666666666666667);
                    v20:TryDash({
                        Direction = l_l_Value_0_Attribute_0 == "RightHand" and "Left" or "Right"
                    });
                    if l_Value_0:GetAttribute("SlowMo") then
                        while v18.Stunned.Value do
                            task.wait();
                        end;
                        if v18.UltimateEnergy.Value == 100 then
                            v20:TryAttack({
                                IsUltimate = true
                            });
                        else
                            local v55 = nil;
                            if v10:NextNumber(0, 1) < 0.15 then
                                local v56 = true;
                                repeat
                                    v55 = v20:TryAttack({
                                        IsHeavy = v56, 
                                        TryFeint = l_Value_0
                                    });
                                    if v56 and v10:NextNumber(0, 1) < 0.8 then
                                        v56 = false;
                                    end;
                                    task.wait();
                                    local l_Value_2 = v18.Stamina.Value;
                                    local _ = l_Styles_0[v17.Style.Value];
                                    local l_Style_1 = v17:FindFirstChild("Style");
                                    local v60 = l_Styles_0[l_Style_1.Value].Combos[l_CombatController_0.CurrentCombo];
                                    local v61 = v60[l_CombatController_0.CurrentPunch];
                                    local v62 = v60.DefaultPunchInfo or l_Styles_0[l_Style_1.Value].DefaultPunchInfo;
                                until l_Value_2 <= (v61.Stamina or v62.Stamina) or l_Magnitude_0 > 6 or v18.Stunned.Value or v55 == "Missed";
                            else
                                repeat
                                    local l_Value_3 = l_v14_FirstChild_0.CharacterData.BlockEnergy.Value;
                                    local v64 = l_Styles_0[v17.Style.Value];
                                    local l_Style_2 = v17:FindFirstChild("Style");
                                    local v66 = l_Styles_0[l_Style_2.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                    local l_HeavyAttacks_0 = l_Styles_0[l_Style_2.Value].HeavyAttacks;
                                    v66 = l_HeavyAttacks_0[l_CombatController_0.CurrentHeavy];
                                    local v68 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_2.Value].DefaultPunchInfo;
                                    v55 = v20:TryAttack({
                                        IsHeavy = l_Value_3 < (v66.Damage or v68.Damage) * v10:NextNumber(0.7, 2.5), 
                                        TryFeint = l_Value_0
                                    });
                                    task.wait();
                                    l_Value_3 = v18.Stamina.Value;
                                    local _ = l_Styles_0[v17.Style.Value];
                                    v64 = v17:FindFirstChild("Style");
                                    local v70 = l_Styles_0[v64.Value].Combos[l_CombatController_0.CurrentCombo];
                                    l_HeavyAttacks_0 = v70[l_CombatController_0.CurrentPunch];
                                    v66 = v70.DefaultPunchInfo or l_Styles_0[v64.Value].DefaultPunchInfo;
                                until l_Value_3 <= (l_HeavyAttacks_0.Stamina or v66.Stamina) or l_Magnitude_0 > 6 or v18.Stunned.Value or v55 == "Missed";
                            end;
                        end;
                        v37 = 0;
                    end;
                else
                    if l_Value_0:GetAttribute("Punching") and l_Magnitude_0 < 6 or v18.Stunned.Value then
                        if not v18.Stunned.Value and l_Value_0:GetAttribute("Punching") then
                            local v71 = l_Value_0:GetAttribute("LandTime") - workspace:GetServerTimeNow();
                            local _ = l_Value_0:GetAttribute("AttackingHand");
                            task.wait(v71 - 0.11666666666666667);
                            local l_v42_0 = v42;
                            if v44 then
                                l_v42_0 = 0.85;
                            elseif v45 then
                                l_v42_0 = 1;
                            end;
                            if l_v42_0 < v10:NextNumber(0, 1) then
                                v20:TryDash({
                                    Direction = if v10:NextNumber(0, 1) > 0.5 then v10:NextNumber(0, 1) > 0.5 and "Left" or "Right" else "Backward"
                                });
                                continue;
                            else
                                continue;
                            end;
                        elseif v18.BlockEnergy.Value > 10 then
                            if v20:TryBlock() then
                                repeat
                                    task.wait();
                                until v18.BlockEnergy.Value < 12 or not v18.Stunned.Value;
                                v20:Unblock();
                                continue;
                            else
                                v20:Unblock();
                            end;
                        end;
                    end;
                    if v18.Stamina.Value < v18.MaxStamina.Value * 0.25 or v39 then
                        if v38 and l_Magnitude_0 < 5 and v18.Stamina.Value > v18.MaxStamina.Value * 0.4 then
                            local v74 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.LookVector * -5, v51);
                            if v10:NextNumber(0, 1) > v42 + 0.1 and not v74 then
                                v20:TryDash({
                                    Direction = "Backward"
                                });
                            else
                                local v75 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v51) or {
                                    Distance = 5000
                                };
                                local v76 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v51) or {
                                    Distance = 5000
                                };
                                if v75.Distance > v76.Distance then
                                    v20:TryDash({
                                        Direction = "Right"
                                    });
                                else
                                    v20:TryDash({
                                        Direction = "Left"
                                    });
                                end;
                            end;
                        elseif l_Magnitude_0 < 5 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 1, 0)));
                        else
                            local v77 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v51) or {
                                Distance = 5000
                            };
                            local v78 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v51) or {
                                Distance = 5000
                            };
                            if v77.Distance > v78.Distance then
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 0, 0)));
                            else
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, 0, 0)));
                            end;
                        end;
                    else
                        local v79 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 8, v51);
                        local v80 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -8, v51);
                        if v79 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, -1, 0)));
                        elseif v80 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, -1, 0)));
                        else
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                        end;
                        local v81 = l_Styles_0[v17.Style.Value];
                        local l_Style_3 = v17:FindFirstChild("Style");
                        local v83 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo];
                        local v84 = v83[l_CombatController_0.CurrentPunch];
                        local v85 = v83.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                        local v86 = v84.HitboxSize or v85.HitboxSize or l_Styles_0[v17.Style.Value].HitboxInfo.Size;
                        if l_Magnitude_0 < v86.Z + v10:NextNumber(0.5, 1.25) then
                            v81 = nil;
                            if v10:NextNumber(0, 1) < 0.3 then
                                local v87 = true;
                                repeat
                                    v81 = v20:TryAttack({
                                        IsHeavy = v87, 
                                        TryFeint = v87 and l_Value_0
                                    });
                                    v87 = v10:NextNumber(0, 1) < 0.5;
                                    task.wait();
                                    v83 = v18.Stamina.Value;
                                    v85 = l_Styles_0[v17.Style.Value];
                                    local l_Style_4 = v17:FindFirstChild("Style");
                                    local v89 = l_Styles_0[l_Style_4.Value].Combos[l_CombatController_0.CurrentCombo];
                                    local v90 = v89[l_CombatController_0.CurrentPunch];
                                    local v91 = v89.DefaultPunchInfo or l_Styles_0[l_Style_4.Value].DefaultPunchInfo;
                                until v83 <= (v90.Stamina or v91.Stamina) or l_Magnitude_0 > 6 or v18.Stunned.Value or v81 == "Missed";
                            else
                                repeat
                                    v83 = l_v14_FirstChild_0.CharacterData.BlockEnergy.Value;
                                    v85 = l_Styles_0[v17.Style.Value];
                                    local l_Style_5 = v17:FindFirstChild("Style");
                                    local v93 = l_Styles_0[l_Style_5.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                    local l_HeavyAttacks_1 = l_Styles_0[l_Style_5.Value].HeavyAttacks;
                                    v93 = l_HeavyAttacks_1[l_CombatController_0.CurrentHeavy];
                                    local v95 = l_HeavyAttacks_1.DefaultPunchInfo or l_Styles_0[l_Style_5.Value].DefaultPunchInfo;
                                    local v96 = v83 < (v93.Damage or v95.Damage);
                                    if v96 and v18.UltimateEnergy.Value == 100 and v10:NextNumber(0, 1) < 0.2 then
                                        v20:TryAttack({
                                            IsUltimate = true
                                        });
                                    else
                                        v81 = v20:TryAttack({
                                            IsHeavy = v96
                                        });
                                    end;
                                    task.wait();
                                    v83 = v18.Stamina.Value;
                                    v85 = l_Styles_0[v17.Style.Value];
                                    l_Style_5 = v17:FindFirstChild("Style");
                                    l_HeavyAttacks_1 = l_Styles_0[l_Style_5.Value].Combos[l_CombatController_0.CurrentCombo];
                                    v93 = l_HeavyAttacks_1[l_CombatController_0.CurrentPunch];
                                    v95 = l_HeavyAttacks_1.DefaultPunchInfo or l_Styles_0[l_Style_5.Value].DefaultPunchInfo;
                                until v83 <= (v93.Stamina or v95.Stamina) or l_Magnitude_0 > 6 or v18.Stunned.Value or v81 == "Missed";
                            end;
                            if v81 == "Missed" then
                                if v18.Stamina.Value > v18.MaxStamina.Value * 0.3 and l_Value_1 ~= "Bullet" and v86.Z + 5 < l_Magnitude_0 then
                                    v20:TryDash({
                                        Direction = "Forward"
                                    });
                                end;
                            elseif v18.Stamina.Value < v18.MaxStamina.Value * 0.4 then
                                v39 = true;
                                task.delay(v10:NextNumber(0, 0.5), function() --[[ Line: 423 ]]
                                    -- upvalues: v39 (ref)
                                    v39 = false;
                                end);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end
};