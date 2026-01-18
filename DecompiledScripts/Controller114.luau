local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerStorage");
local l_Workspace_0 = game:GetService("Workspace");
local _ = require(game:GetService("ReplicatedFirst"):WaitForChild("Cleaner"));
local l_EquipGlovesOnCharacter_0 = l_ServerScriptService_0:WaitForChild("Events"):WaitForChild("EquipGlovesOnCharacter");
local _ = require(l_ReplicatedStorage_0.Catalog.SearchHelper);
local v7 = l_ServerScriptService_0:WaitForChild("Combat", 10);
local v8 = require(v7:WaitForChild("NPC", 10));
local _ = game.ReplicatedStorage:WaitForChild("UnreliableRemoteEvents"):WaitForChild("CreateEffect");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local v12 = Random.new();
return {
    Init = function() --[[ Line: 27 ]] --[[ Name: Init ]]
        -- upvalues: l_EquipGlovesOnCharacter_0 (copy), l_Workspace_0 (copy), v8 (copy), l_Styles_0 (copy), v12 (copy)
        local l_Parent_0 = script.Parent;
        local v14 = {
            Name = "BertoGloves"
        };
        l_EquipGlovesOnCharacter_0:Fire(l_Parent_0, {
            v14, 
            v14
        });
        local v15 = l_Workspace_0:WaitForChild("States", 20);
        local v16 = v15:WaitForChild(l_Parent_0.Name, 20);
        local _ = v16:WaitForChild("Occupied", 20);
        local v18 = v16:WaitForChild("PlayerData", 20);
        local v19 = v16:WaitForChild("CharacterData", 20);
        local _ = l_Parent_0:WaitForChild("Humanoid", 20);
        local v21 = v8.New({
            Character = l_Parent_0
        });
        while not v19.Opponent.Value do
            task.wait();
        end;
        local l_Value_0 = v19.Opponent.Value;
        while not v15:FindFirstChild(l_Value_0.Name) do
            task.wait();
        end;
        local l_v15_FirstChild_0 = v15:FindFirstChild(l_Value_0.Name);
        local _ = game.Players:GetPlayerFromCharacter(l_Value_0);
        local l_Value_1 = l_v15_FirstChild_0.PlayerData.Style.Value;
        local l_CombatController_0 = v21.CombatController;
        local _ = function(v27, v28) --[[ Line: 62 ]] --[[ Name: GetPunchInfo ]]
            -- upvalues: l_Styles_0 (ref), v18 (copy), l_CombatController_0 (copy)
            local _ = l_Styles_0[v18.Style.Value];
            local l_Style_0 = v18:FindFirstChild("Style");
            local v31 = l_Styles_0[l_Style_0.Value].Combos[l_CombatController_0.CurrentCombo];
            local v32 = v31[l_CombatController_0.CurrentPunch];
            if v28 == "IsHeavy" then
                v31 = l_Styles_0[l_Style_0.Value].HeavyAttacks;
                v32 = v31[l_CombatController_0.CurrentHeavy];
            elseif v28 == "IsUltimate" then
                v31 = l_Styles_0[l_Style_0.Value].UltimateInfo;
                v32 = v31[1];
            end;
            local v33 = v31.DefaultPunchInfo or l_Styles_0[l_Style_0.Value].DefaultPunchInfo;
            return v32[v27] or v33[v27];
        end;
        local v35 = math.clamp(l_Parent_0:GetAttribute("DifficultyScale") or 0.5, 0.01, 1);
        local l_PlayerFromCharacter_1 = game.Players:GetPlayerFromCharacter(l_Value_0);
        if l_PlayerFromCharacter_1 and l_PlayerFromCharacter_1:GetAttribute("Interface") == "Touch" then
            v35 = v35 * 0.75;
        end;
        local v37 = math.lerp(0.8, 0.3, v35);
        local v38 = math.lerp(0.5, 0.3, v35);
        local function _() --[[ Line: 93 ]] --[[ Name: GetReactionTime ]]
            -- upvalues: v37 (copy), v12 (ref), v38 (copy)
            return (math.clamp(v37 + v12:NextNumber(0, v38), 0.3, 0.8));
        end;
        local v40 = 0;
        local v41 = math.lerp(64, 32, v35);
        local v42 = true;
        local v43 = true;
        local v44 = false;
        local v45 = math.lerp(1, 0.75, v35);
        if v35 < 0.5 then
            v42 = false;
            v43 = false;
        end;
        l_Parent_0:SetAttribute("DamageMult", (math.lerp(0.6, 1.1, v35)));
        l_Parent_0:SetAttribute("HealthMult", (math.lerp(0.6, 1.1, v35)));
        local v46 = math.lerp(8, 6, v35);
        local v47 = math.lerp(0.8, 0.55, v35);
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
        l_Value_0:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 126 ]]
            -- upvalues: v40 (ref)
            v40 = v40 + 1;
        end);
        local v50 = 0;
        l_Parent_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 162 ]]
            -- upvalues: v50 (ref), v19 (copy), l_Parent_0 (copy)
            v50 = v50 + 1;
            local v51 = nil;
            v51 = v19.Cutscene.Changed:Connect(function(v52) --[[ Line: 166 ]]
                -- upvalues: v51 (ref), l_Parent_0 (ref)
                if v52 == true then
                    return;
                else
                    if v51 then
                        v51:Disconnect();
                    end;
                    print("HELLO! BERTO WAS KNOCKED DOWN, SETTING CHANGEDFIRE!");
                    l_Parent_0:SetAttribute("ChangedFire", tick());
                    task.wait(0.5);
                    if l_Parent_0:GetAttribute("DifficultyScale") then
                        l_Parent_0:SetAttribute("DifficultyScale", (math.clamp(l_Parent_0:GetAttribute("DifficultyScale") + 0.01, 0, 1)));
                    end;
                    return;
                end;
            end);
        end);
        local l_Parent_1 = v19.Centre.Value.Parent.Parent;
        local v54 = RaycastParams.new();
        v54.FilterType = Enum.RaycastFilterType.Include;
        v54.FilterDescendantsInstances = {
            l_Parent_1
        };
        while task.wait() and l_Parent_0:IsDescendantOf(game) and l_Value_0:IsDescendantOf(game) do
            if l_Parent_0.PrimaryPart and l_Value_0.PrimaryPart then
                local l_Magnitude_0 = (l_Parent_0.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
                if v35 < 0.75 and l_Value_1 == "Takamura" and l_Value_0:GetAttribute("Charging") then
                    l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 1, 0)));
                    if l_Magnitude_0 < 5 then
                        v21:TryAttack({});
                    end;
                elseif v41 < v40 and l_Magnitude_0 < 4.5 and l_Value_0:GetAttribute("Punching") and (l_Value_0:GetAttribute("IsHeavy") or v35 > 0.65) then
                    l_Parent_0:SetAttribute("ServerPerfect", true);
                    local v56 = (l_Value_0:GetAttribute("LandTime") or workspace:GetServerTimeNow()) - workspace:GetServerTimeNow();
                    local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("AttackingHand");
                    task.wait(v56 - 0.11666666666666667);
                    v21:TryDash({
                        Direction = l_l_Value_0_Attribute_0 == "RightHand" and "Left" or "Right"
                    });
                    if l_Value_0:GetAttribute("SlowMo") then
                        while v19.Stunned.Value do
                            task.wait();
                        end;
                        if v19.UltimateEnergy.Value == 100 then
                            v21:TryAttack({
                                IsUltimate = true
                            });
                        else
                            local v58 = nil;
                            if v12:NextNumber(0, 1) < 0.15 then
                                local v59 = true;
                                repeat
                                    v58 = v21:TryAttack({
                                        IsHeavy = v59, 
                                        TryFeint = l_Value_0
                                    });
                                    if v59 and v12:NextNumber(0, 1) < 0.8 then
                                        v59 = false;
                                    end;
                                    task.wait();
                                    local l_Value_2 = v19.Stamina.Value;
                                    local _ = l_Styles_0[v18.Style.Value];
                                    local l_Style_1 = v18:FindFirstChild("Style");
                                    local v63 = l_Styles_0[l_Style_1.Value].Combos[l_CombatController_0.CurrentCombo];
                                    local v64 = v63[l_CombatController_0.CurrentPunch];
                                    local v65 = v63.DefaultPunchInfo or l_Styles_0[l_Style_1.Value].DefaultPunchInfo;
                                until l_Value_2 <= (v64.Stamina or v65.Stamina) or l_Magnitude_0 > 6 or v19.Stunned.Value or v58 == "Missed";
                            else
                                repeat
                                    local l_Value_3 = l_v15_FirstChild_0.CharacterData.BlockEnergy.Value;
                                    local v67 = l_Styles_0[v18.Style.Value];
                                    local l_Style_2 = v18:FindFirstChild("Style");
                                    local v69 = l_Styles_0[l_Style_2.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                    local l_HeavyAttacks_0 = l_Styles_0[l_Style_2.Value].HeavyAttacks;
                                    v69 = l_HeavyAttacks_0[l_CombatController_0.CurrentHeavy];
                                    local v71 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_2.Value].DefaultPunchInfo;
                                    v58 = v21:TryAttack({
                                        IsHeavy = l_Value_3 < (v69.Damage or v71.Damage) * v12:NextNumber(0.7, 2.5), 
                                        TryFeint = l_Value_0
                                    });
                                    task.wait();
                                    l_Value_3 = v19.Stamina.Value;
                                    local _ = l_Styles_0[v18.Style.Value];
                                    v67 = v18:FindFirstChild("Style");
                                    local v73 = l_Styles_0[v67.Value].Combos[l_CombatController_0.CurrentCombo];
                                    l_HeavyAttacks_0 = v73[l_CombatController_0.CurrentPunch];
                                    v69 = v73.DefaultPunchInfo or l_Styles_0[v67.Value].DefaultPunchInfo;
                                until l_Value_3 <= (l_HeavyAttacks_0.Stamina or v69.Stamina) or l_Magnitude_0 > 6 or v19.Stunned.Value or v58 == "Missed";
                            end;
                        end;
                        v40 = 0;
                    end;
                else
                    if l_Value_0:GetAttribute("Punching") and l_Magnitude_0 < 6 or v19.Stunned.Value then
                        if not v19.Stunned.Value and l_Value_0:GetAttribute("Punching") and (l_Value_0:GetAttribute("IsHeavy") or l_Value_0:GetAttribute("CurrentPunch") == 1) then
                            local v74 = (l_Value_0:GetAttribute("LandTime") or workspace:GetServerTimeNow()) - workspace:GetServerTimeNow();
                            local _ = l_Value_0:GetAttribute("AttackingHand");
                            task.wait(v74 - 0.11666666666666667);
                            if v45 < v12:NextNumber(0, 1) then
                                v21:TryDash({
                                    Direction = if v12:NextNumber(0, 1) > 0.5 then v12:NextNumber(0, 1) > 0.5 and "Left" or "Right" else "Backward"
                                });
                                continue;
                            else
                                continue;
                            end;
                        elseif v19.BlockEnergy.Value > 10 then
                            if v21:TryBlock() then
                                while v35 >= 0.5 or v12:NextNumber(0, 1) >= math.lerp(0.1, 0, v35) do
                                    task.wait();
                                    if v19.BlockEnergy.Value < 12 or not v19.Stunned.Value then
                                        break;
                                    end;
                                end;
                                v21:Unblock();
                                continue;
                            else
                                v21:Unblock();
                            end;
                        end;
                    end;
                    if v19.Stamina.Value < v19.MaxStamina.Value * 0.25 or v44 then
                        if v43 and l_Magnitude_0 < 8 and v19.Stamina.Value > v19.MaxStamina.Value * 0.25 then
                            local v76 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.LookVector * -5, v54);
                            if v12:NextNumber(0, 1) > v45 + 0.1 and not v76 then
                                v21:TryDash({
                                    Direction = "Backward"
                                });
                            else
                                local v77 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v54) or {
                                    Distance = 5000
                                };
                                local v78 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v54) or {
                                    Distance = 5000
                                };
                                if v77.Distance > v78.Distance then
                                    v21:TryDash({
                                        Direction = "Right"
                                    });
                                else
                                    v21:TryDash({
                                        Direction = "Left"
                                    });
                                end;
                            end;
                        elseif l_Magnitude_0 < v46 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 1, 0)));
                        else
                            local v79 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v54) or {
                                Distance = 5000
                            };
                            local v80 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v54) or {
                                Distance = 5000
                            };
                            if v79.Distance > v80.Distance then
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 0, 0)));
                            else
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, 0, 0)));
                            end;
                        end;
                    else
                        local v81 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 8, v54);
                        local v82 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -8, v54);
                        if v81 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, -1, 0)));
                        elseif v82 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, -1, 0)));
                        else
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                        end;
                        local v83 = l_Styles_0[v18.Style.Value];
                        local l_Style_3 = v18:FindFirstChild("Style");
                        local v85 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo];
                        local v86 = v85[l_CombatController_0.CurrentPunch];
                        local v87 = v85.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                        local v88 = v86.HitboxSize or v87.HitboxSize or l_Styles_0[v18.Style.Value].HitboxInfo.Size;
                        if l_Magnitude_0 < v88.Z + v12:NextNumber(0.5, 1.25) then
                            v83 = nil;
                            if v12:NextNumber(0, 1) < 0.3 then
                                local v89 = true;
                                repeat
                                    v83 = v21:TryAttack({
                                        IsHeavy = v89, 
                                        TryFeint = v89 and l_Value_0
                                    });
                                    v89 = v12:NextNumber(0, 1) < 0.5;
                                    task.wait();
                                    v85 = v19.Stamina.Value;
                                    v87 = l_Styles_0[v18.Style.Value];
                                    local l_Style_4 = v18:FindFirstChild("Style");
                                    local v91 = l_Styles_0[l_Style_4.Value].Combos[l_CombatController_0.CurrentCombo];
                                    local v92 = v91[l_CombatController_0.CurrentPunch];
                                    local v93 = v91.DefaultPunchInfo or l_Styles_0[l_Style_4.Value].DefaultPunchInfo;
                                until v85 <= (v92.Stamina or v93.Stamina) or l_Magnitude_0 > 6 or v19.Stunned.Value or v83 == "Missed";
                            else
                                while true do
                                    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                                    if l_workspace_ServerTimeNow_0 - (l_Value_0:GetAttribute("LastDashTime") or 0) < 0.5 then
                                        v44 = true;
                                        task.delay(l_workspace_ServerTimeNow_0 - (l_Value_0:GetAttribute("LastDashTime") or 0) + 0.2, function() --[[ Line: 424 ]]
                                            -- upvalues: v44 (ref)
                                            v44 = false;
                                        end);
                                        break;
                                    else
                                        v86 = l_v15_FirstChild_0.CharacterData.BlockEnergy.Value;
                                        local v95 = l_Styles_0[v18.Style.Value];
                                        local l_Style_5 = v18:FindFirstChild("Style");
                                        local v97 = l_Styles_0[l_Style_5.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                        local l_HeavyAttacks_1 = l_Styles_0[l_Style_5.Value].HeavyAttacks;
                                        v97 = l_HeavyAttacks_1[l_CombatController_0.CurrentHeavy];
                                        local v99 = l_HeavyAttacks_1.DefaultPunchInfo or l_Styles_0[l_Style_5.Value].DefaultPunchInfo;
                                        v85 = v86 < (v97.Damage or v99.Damage);
                                        if v85 and v19.UltimateEnergy.Value == 100 and v12:NextNumber(0, 1) < 0.2 then
                                            v21:TryAttack({
                                                IsUltimate = true
                                            });
                                        else
                                            v83 = v21:TryAttack({
                                                IsHeavy = v85
                                            });
                                        end;
                                        task.wait();
                                        v86 = v19.Stamina.Value;
                                        v95 = l_Styles_0[v18.Style.Value];
                                        l_Style_5 = v18:FindFirstChild("Style");
                                        l_HeavyAttacks_1 = l_Styles_0[l_Style_5.Value].Combos[l_CombatController_0.CurrentCombo];
                                        v97 = l_HeavyAttacks_1[l_CombatController_0.CurrentPunch];
                                        v99 = l_HeavyAttacks_1.DefaultPunchInfo or l_Styles_0[l_Style_5.Value].DefaultPunchInfo;
                                        if v86 <= (v97.Stamina or v99.Stamina) or l_Magnitude_0 > 6 or v19.Stunned.Value or v83 == "Missed" then
                                            break;
                                        end;
                                    end;
                                end;
                            end;
                            if v83 == "Missed" then
                                if v19.Stamina.Value > v19.MaxStamina.Value * v47 and l_Value_1 ~= "Bullet" and v88.Z + 5 < l_Magnitude_0 then
                                    v21:TryDash({
                                        Direction = "Forward"
                                    });
                                end;
                            elseif v19.Stamina.Value < v19.MaxStamina.Value * 0.4 then
                                v44 = true;
                                task.delay(v12:NextNumber(0, 0.5), function() --[[ Line: 460 ]]
                                    -- upvalues: v44 (ref)
                                    v44 = false;
                                end);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end
};