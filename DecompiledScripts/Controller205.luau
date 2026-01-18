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
        local function _() --[[ Line: 86 ]] --[[ Name: GetReactionTime ]]
            -- upvalues: v12 (ref)
            return (math.clamp(0.25 + v12:NextNumber(0, 0.3), 0.125, 0.3));
        end;
        local v36 = 0;
        local v37 = false;
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
        l_Value_0:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 110 ]]
            -- upvalues: v36 (ref)
            v36 = v36 + 1;
        end);
        l_Parent_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 148 ]]

        end);
        local l_Parent_1 = v19.Centre.Value.Parent.Parent;
        local v41 = RaycastParams.new();
        v41.FilterType = Enum.RaycastFilterType.Include;
        v41.FilterDescendantsInstances = {
            l_Parent_1
        };
        while task.wait() and l_Parent_0:IsDescendantOf(game) and l_Value_0:IsDescendantOf(game) do
            if l_Parent_0.PrimaryPart and l_Value_0.PrimaryPart then
                local l_Magnitude_0 = (l_Parent_0.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
                if l_Value_1 == "Takamura" and l_Value_0:GetAttribute("Charging") then
                    l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 1, 0)));
                    if l_Magnitude_0 < 5 then
                        v21:TryAttack({});
                    end;
                elseif v36 > 24 and l_Magnitude_0 < 4.5 and l_Value_0:GetAttribute("Punching") then
                    l_Parent_0:SetAttribute("ServerPerfect", true);
                    local v43 = (l_Value_0:GetAttribute("LandTime") or workspace:GetServerTimeNow()) - workspace:GetServerTimeNow();
                    local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("AttackingHand");
                    task.wait(v43 - 0.11666666666666667);
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
                            local v45 = nil;
                            if v12:NextNumber(0, 1) < 0.15 then
                                local v46 = true;
                                repeat
                                    v45 = v21:TryAttack({
                                        IsHeavy = v46, 
                                        TryFeint = l_Value_0
                                    });
                                    if v46 and v12:NextNumber(0, 1) < 0.8 then
                                        v46 = false;
                                    end;
                                    task.wait();
                                    local l_Value_2 = v19.Stamina.Value;
                                    local _ = l_Styles_0[v18.Style.Value];
                                    local l_Style_1 = v18:FindFirstChild("Style");
                                    local v50 = l_Styles_0[l_Style_1.Value].Combos[l_CombatController_0.CurrentCombo];
                                    local v51 = v50[l_CombatController_0.CurrentPunch];
                                    local v52 = v50.DefaultPunchInfo or l_Styles_0[l_Style_1.Value].DefaultPunchInfo;
                                until l_Value_2 <= (v51.Stamina or v52.Stamina) or l_Magnitude_0 > 6 or v19.Stunned.Value or v45 == "Missed";
                            else
                                repeat
                                    local l_Value_3 = l_v15_FirstChild_0.CharacterData.BlockEnergy.Value;
                                    local v54 = l_Styles_0[v18.Style.Value];
                                    local l_Style_2 = v18:FindFirstChild("Style");
                                    local v56 = l_Styles_0[l_Style_2.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                    local l_HeavyAttacks_0 = l_Styles_0[l_Style_2.Value].HeavyAttacks;
                                    v56 = l_HeavyAttacks_0[l_CombatController_0.CurrentHeavy];
                                    local v58 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_2.Value].DefaultPunchInfo;
                                    v45 = v21:TryAttack({
                                        IsHeavy = l_Value_3 < (v56.Damage or v58.Damage) * v12:NextNumber(0.7, 2.5), 
                                        TryFeint = l_Value_0
                                    });
                                    task.wait();
                                    l_Value_3 = v19.Stamina.Value;
                                    local _ = l_Styles_0[v18.Style.Value];
                                    v54 = v18:FindFirstChild("Style");
                                    local v60 = l_Styles_0[v54.Value].Combos[l_CombatController_0.CurrentCombo];
                                    l_HeavyAttacks_0 = v60[l_CombatController_0.CurrentPunch];
                                    v56 = v60.DefaultPunchInfo or l_Styles_0[v54.Value].DefaultPunchInfo;
                                until l_Value_3 <= (l_HeavyAttacks_0.Stamina or v56.Stamina) or l_Magnitude_0 > 6 or v19.Stunned.Value or v45 == "Missed";
                            end;
                        end;
                        v36 = 0;
                    end;
                else
                    if l_Value_0:GetAttribute("Punching") and l_Magnitude_0 < 6 or v19.Stunned.Value then
                        if not v19.Stunned.Value and l_Value_0:GetAttribute("Punching") then
                            local v61 = (l_Value_0:GetAttribute("LandTime") or workspace:GetServerTimeNow()) - workspace:GetServerTimeNow();
                            local _ = l_Value_0:GetAttribute("AttackingHand");
                            task.wait(v61 - 0.11666666666666667);
                            local v63 = 0.65;
                            if EasyMode then
                                v63 = 0.85;
                            elseif BabyMode then
                                v63 = 1;
                            end;
                            if v63 < v12:NextNumber(0, 1) then
                                v21:TryDash({
                                    Direction = if v12:NextNumber(0, 1) > 0.5 then v12:NextNumber(0, 1) > 0.5 and "Left" or "Right" else "Backward"
                                });
                                continue;
                            else
                                continue;
                            end;
                        elseif v19.BlockEnergy.Value > 10 then
                            if v21:TryBlock() then
                                repeat
                                    task.wait();
                                until v19.BlockEnergy.Value < 12 or not v19.Stunned.Value;
                                v21:Unblock();
                                continue;
                            else
                                v21:Unblock();
                            end;
                        end;
                    end;
                    if v19.Stamina.Value < v19.MaxStamina.Value * 0.25 or v37 then
                        if l_Magnitude_0 < 8 and v19.Stamina.Value > v19.MaxStamina.Value * 0.25 then
                            local v64 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.LookVector * -5, v41);
                            if v12:NextNumber(0, 1) > 0.75 and not v64 then
                                v21:TryDash({
                                    Direction = "Backward"
                                });
                            else
                                local v65 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v41) or {
                                    Distance = 5000
                                };
                                local v66 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v41) or {
                                    Distance = 5000
                                };
                                if v65.Distance > v66.Distance then
                                    v21:TryDash({
                                        Direction = "Right"
                                    });
                                else
                                    v21:TryDash({
                                        Direction = "Left"
                                    });
                                end;
                            end;
                        elseif l_Magnitude_0 < 6 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 1, 0)));
                        else
                            local v67 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v41) or {
                                Distance = 5000
                            };
                            local v68 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v41) or {
                                Distance = 5000
                            };
                            if v67.Distance > v68.Distance then
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 0, 0)));
                            else
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, 0, 0)));
                            end;
                        end;
                    else
                        local v69 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 8, v41);
                        local v70 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -8, v41);
                        if v69 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, -1, 0)));
                        elseif v70 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, -1, 0)));
                        else
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                        end;
                        local v71 = l_Styles_0[v18.Style.Value];
                        local l_Style_3 = v18:FindFirstChild("Style");
                        local v73 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo];
                        local v74 = v73[l_CombatController_0.CurrentPunch];
                        local v75 = v73.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                        local v76 = v74.HitboxSize or v75.HitboxSize or l_Styles_0[v18.Style.Value].HitboxInfo.Size;
                        if l_Magnitude_0 < v76.Z + v12:NextNumber(0.5, 1.25) then
                            v71 = nil;
                            if v12:NextNumber(0, 1) < 0.3 then
                                local v77 = true;
                                repeat
                                    v71 = v21:TryAttack({
                                        IsHeavy = v77, 
                                        TryFeint = v77 and l_Value_0
                                    });
                                    v77 = v12:NextNumber(0, 1) < 0.5;
                                    task.wait();
                                    v73 = v19.Stamina.Value;
                                    v75 = l_Styles_0[v18.Style.Value];
                                    local l_Style_4 = v18:FindFirstChild("Style");
                                    local v79 = l_Styles_0[l_Style_4.Value].Combos[l_CombatController_0.CurrentCombo];
                                    local v80 = v79[l_CombatController_0.CurrentPunch];
                                    local v81 = v79.DefaultPunchInfo or l_Styles_0[l_Style_4.Value].DefaultPunchInfo;
                                until v73 <= (v80.Stamina or v81.Stamina) or l_Magnitude_0 > 6 or v19.Stunned.Value or v71 == "Missed";
                            else
                                repeat
                                    v73 = l_v15_FirstChild_0.CharacterData.BlockEnergy.Value;
                                    v75 = l_Styles_0[v18.Style.Value];
                                    local l_Style_5 = v18:FindFirstChild("Style");
                                    local v83 = l_Styles_0[l_Style_5.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                    local l_HeavyAttacks_1 = l_Styles_0[l_Style_5.Value].HeavyAttacks;
                                    v83 = l_HeavyAttacks_1[l_CombatController_0.CurrentHeavy];
                                    local v85 = l_HeavyAttacks_1.DefaultPunchInfo or l_Styles_0[l_Style_5.Value].DefaultPunchInfo;
                                    local v86 = v73 < (v83.Damage or v85.Damage);
                                    if v86 and v19.UltimateEnergy.Value == 100 and v12:NextNumber(0, 1) < 0.2 then
                                        v21:TryAttack({
                                            IsUltimate = true
                                        });
                                    else
                                        v71 = v21:TryAttack({
                                            IsHeavy = v86
                                        });
                                    end;
                                    task.wait();
                                    v73 = v19.Stamina.Value;
                                    v75 = l_Styles_0[v18.Style.Value];
                                    l_Style_5 = v18:FindFirstChild("Style");
                                    l_HeavyAttacks_1 = l_Styles_0[l_Style_5.Value].Combos[l_CombatController_0.CurrentCombo];
                                    v83 = l_HeavyAttacks_1[l_CombatController_0.CurrentPunch];
                                    v85 = l_HeavyAttacks_1.DefaultPunchInfo or l_Styles_0[l_Style_5.Value].DefaultPunchInfo;
                                until v73 <= (v83.Stamina or v85.Stamina) or l_Magnitude_0 > 6 or v19.Stunned.Value or v71 == "Missed";
                            end;
                            if v71 == "Missed" then
                                if v19.Stamina.Value > v19.MaxStamina.Value * 0.4 and l_Value_1 ~= "Bullet" and v76.Z + 5 < l_Magnitude_0 then
                                    v21:TryDash({
                                        Direction = "Forward"
                                    });
                                end;
                            elseif v19.Stamina.Value < v19.MaxStamina.Value * 0.4 then
                                v37 = true;
                                task.delay(v12:NextNumber(0, 0.5), function() --[[ Line: 413 ]]
                                    -- upvalues: v37 (ref)
                                    v37 = false;
                                end);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end
};