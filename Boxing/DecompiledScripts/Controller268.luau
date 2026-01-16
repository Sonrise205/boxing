local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerStorage");
local _ = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Cleaner_0 = require(game:GetService("ReplicatedFirst"):WaitForChild("Cleaner"));
local l_EquipGlovesOnCharacter_0 = l_ServerScriptService_0:WaitForChild("Events"):WaitForChild("EquipGlovesOnCharacter");
local v7 = l_ServerScriptService_0:WaitForChild("Combat", 10);
local v8 = require(v7:WaitForChild("NPC", 10));
local l_CreateEffect_0 = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents"):WaitForChild("CreateEffect");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local v12 = Random.new();
return {
    Init = function() --[[ Line: 27 ]] --[[ Name: Init ]]
        -- upvalues: l_Cleaner_0 (copy), l_EquipGlovesOnCharacter_0 (copy), l_Workspace_0 (copy), v8 (copy), l_Styles_0 (copy), v12 (copy), l_CreateEffect_0 (copy)
        local v13 = l_Cleaner_0.new();
        local l_Parent_0 = script.Parent;
        v13:Add(l_Parent_0.AncestryChanged:Connect(function(_, v16) --[[ Line: 31 ]]
            -- upvalues: v13 (copy)
            if v16 == nil then
                v13:Clean();
            end;
        end));
        local _ = nil;
        local _ = nil;
        local _ = nil;
        local _ = function(_, _) --[[ Line: 52 ]] --[[ Name: DebugRender ]]

        end;
        local v23 = {
            Name = "Classic"
        };
        l_EquipGlovesOnCharacter_0:Fire(l_Parent_0, {
            v23, 
            v23
        });
        local v24 = l_Workspace_0:WaitForChild("States", 20);
        local v25 = v24:WaitForChild(l_Parent_0.Name, 20);
        local _ = v25:WaitForChild("Occupied", 20);
        local v27 = v25:WaitForChild("PlayerData", 20);
        local v28 = v25:WaitForChild("CharacterData", 20);
        local _ = l_Parent_0:WaitForChild("Humanoid", 20);
        local v30 = v8.New({
            Character = l_Parent_0
        });
        while not v28.Opponent.Value and l_Parent_0:IsDescendantOf(game) do
            task.wait();
        end;
        local l_Value_0 = v28.Opponent.Value;
        while not v24:FindFirstChild(l_Value_0.Name) and l_Parent_0:IsDescendantOf(game) do
            task.wait();
        end;
        local l_v24_FirstChild_0 = v24:FindFirstChild(l_Value_0.Name);
        local l_Value_1 = l_v24_FirstChild_0.PlayerData.Style.Value;
        local l_CombatController_0 = v30.CombatController;
        local _ = function(v35, v36) --[[ Line: 104 ]] --[[ Name: GetPunchInfo ]]
            -- upvalues: l_Styles_0 (ref), v27 (copy), l_CombatController_0 (copy)
            local _ = l_Styles_0[v27.Style.Value];
            local l_Style_0 = v27:FindFirstChild("Style");
            local v39 = l_Styles_0[l_Style_0.Value].Combos[l_CombatController_0.CurrentCombo];
            local v40 = v39[l_CombatController_0.CurrentPunch];
            if v36 == "IsHeavy" then
                v39 = l_Styles_0[l_Style_0.Value].HeavyAttacks;
                v40 = v39[l_CombatController_0.CurrentHeavy];
            elseif v36 == "IsUltimate" then
                v39 = l_Styles_0[l_Style_0.Value].UltimateInfo;
                v40 = v39[1];
            end;
            local v41 = v39.DefaultPunchInfo or l_Styles_0[l_Style_0.Value].DefaultPunchInfo;
            return v40[v35] or v41[v35];
        end;
        local v43 = l_Parent_0:GetAttribute("HardMode") or false;
        local v44 = l_Parent_0:GetAttribute("EasyMode") or false;
        local v45 = v43 and 0.22 or 0.27;
        local function _() --[[ Line: 131 ]] --[[ Name: GetReactionTime ]]
            -- upvalues: v45 (copy), v12 (ref)
            return (math.clamp(v45 + v12:NextNumber(0, 0.1), 0.125, 0.35));
        end;
        local v47 = 0;
        local v48 = v43 and 16 or 30;
        local v49 = false;
        local v50 = not v43;
        if v43 then
            l_Parent_0:SetAttribute("DamageMult", 1);
            l_Parent_0:SetAttribute("HealthMult", 2);
        elseif v44 then
            l_Parent_0:SetAttribute("DamageMult", 0.8);
            l_Parent_0:SetAttribute("HealthMult", 1);
        else
            l_Parent_0:SetAttribute("DamageMult", 1);
            l_Parent_0:SetAttribute("HealthMult", 1.5);
        end;
        v13:Add(l_Value_0:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 162 ]]
            -- upvalues: v47 (ref)
            v47 = v47 + 1;
        end));
        local l_Parent_1 = v28.Centre.Value.Parent.Parent;
        local v52 = RaycastParams.new();
        v52.FilterType = Enum.RaycastFilterType.Include;
        v52.FilterDescendantsInstances = {
            l_Parent_1
        };
        v28.CanEmoteAnyways.Value = true;
        local v53 = true;
        repeat
            task.wait(0.5);
        until not v28.Cutscene.Value or not l_Parent_0:IsDescendantOf(game);
        local v54 = l_Workspace_0.States[l_Value_0.Name];
        local _ = v54.PlayerData;
        local l_CharacterData_0 = v54.CharacterData;
        local v57 = l_Value_0 and game.Players:GetPlayerFromCharacter(l_Value_0);
        l_CharacterData_0.Stunned.Value = true;
        l_CharacterData_0.Cutscene.Value = true;
        task.wait(1);
        print(v57);
        l_CreateEffect_0:FireClient(v57, {
            "DramaticDialog", 
            workspace.Misc.DialogBringus, 
            "I WAS SO NERVOUS, I COULDN'T MOVE MY BODY RIGHT, HAHA!", 
            Color3.fromRGB(71, 71, 71), 
            2.5, 
            0.25, 
            CFrame.new(0, -1.3, -1.2)
        });
        v13:Add(l_Parent_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 201 ]]
            -- upvalues: l_CreateEffect_0 (ref), v57 (copy)
            l_CreateEffect_0:FireClient(v57, {
                "DramaticDialog", 
                workspace.Misc.DialogBringus, 
                "AND THAT WAS HOW I WON MY FIRST BOXING MATCH.", 
                Color3.fromRGB(71, 71, 71), 
                2.5, 
                0.25, 
                CFrame.new(0, -1.3, -1.2)
            });
        end));
        task.wait(3);
        l_CharacterData_0.Stunned.Value = false;
        l_CharacterData_0.Cutscene.Value = false;
        task.delay(0, function() --[[ Line: 217 ]]
            -- upvalues: l_Value_0 (copy), l_CreateEffect_0 (ref), l_Parent_0 (copy), v53 (ref)
            print("What......");
            local v58 = {
                "Threat"
            };
            local l_PlayerFromCharacter_0 = game.Players:GetPlayerFromCharacter(l_Value_0);
            local v60 = v58[math.random(1, #v58)];
            l_CreateEffect_0:FireClient(l_PlayerFromCharacter_0, {
                "UseEmote", 
                l_Parent_0, 
                v60
            });
            task.wait(3);
            v53 = false;
        end);
        while task.wait() do
            if not v53 then
                v28.CanEmoteAnyways.Value = true;
                if l_Parent_0:IsDescendantOf(game) and l_Value_0:IsDescendantOf(game) then
                    if l_Parent_0.PrimaryPart and l_Value_0.PrimaryPart then
                        local l_Magnitude_0 = (l_Parent_0.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
                        if v48 < v47 and l_Magnitude_0 < 4.5 and l_Value_0:GetAttribute("Punching") and (l_Value_0:GetAttribute("IsHeavy") or v43) then
                            l_Parent_0:SetAttribute("ServerPerfect", true);
                            local v62 = (l_Value_0:GetAttribute("LandTime") or workspace:GetServerTimeNow()) - workspace:GetServerTimeNow();
                            local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("AttackingHand");
                            task.wait(v62 - 0.11666666666666667);
                            v30:TryDash({
                                Direction = l_l_Value_0_Attribute_0 == "RightHand" and "Left" or "Right"
                            });
                            if l_Value_0:GetAttribute("SlowMo") then
                                while v28.Stunned.Value do
                                    task.wait();
                                end;
                                if v28.UltimateEnergy.Value == 100 then
                                    v30:TryAttack({
                                        IsUltimate = true
                                    });
                                else
                                    v30:TryAttack({
                                        IsHeavy = true
                                    });
                                end;
                                v47 = 0;
                            end;
                        else
                            if (l_Value_0:GetAttribute("Punching") and l_Magnitude_0 < 8 or v28.Stunned.Value) and v28.BlockEnergy.Value > 8 then
                                if l_Value_0:GetAttribute("Punching") and l_Value_0:GetAttribute("IsUltimate") then
                                    v30:Unblock();
                                    continue;
                                else
                                    if v50 and v12:NextNumber(0, 1) < 0.5 then
                                        task.wait(1.2);
                                    else
                                        task.wait((math.clamp(v45 + v12:NextNumber(0, 0.1), 0.125, 0.35)));
                                    end;
                                    if not v28.Stunned.Value and l_Value_0:GetAttribute("Punching") and v43 and v12:NextNumber(0, 1) > 0.5 then
                                        v30:TryDash({
                                            Direction = v12:NextNumber(0, 1) > 0.5 and "Left" or "Right"
                                        });
                                    end;
                                    l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, 1, 0)));
                                    if v30:TryBlock() then
                                        local v64 = v43 and 12 or v12:NextNumber(4, 10);
                                        repeat
                                            task.wait();
                                        until v28.BlockEnergy.Value < v64 or not v28.Stunned.Value or l_Value_0:GetAttribute("IsUltimate");
                                        v30:Unblock();
                                    else
                                        v30:Unblock();
                                    end;
                                    task.wait(math.clamp(v45 + v12:NextNumber(0, 0.1), 0.125, 0.35) / 2);
                                end;
                            end;
                            if v28.Stamina.Value < v28.MaxStamina.Value * 0.4 or v49 then
                                if v43 and l_Magnitude_0 < 5 and v28.Stamina.Value > v28.MaxStamina.Value * 0.25 then
                                    local v65 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.LookVector * -5, v52);
                                    if v12:NextNumber(0, 1) > 0.5 and not v65 then
                                        v30:TryDash({
                                            Direction = "Backward"
                                        });
                                    else
                                        local v66 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v52) or {
                                            Distance = 5000
                                        };
                                        local v67 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v52) or {
                                            Distance = 5000
                                        };
                                        if v66.Distance > v67.Distance then
                                            v30:TryDash({
                                                Direction = "Right"
                                            });
                                        else
                                            v30:TryDash({
                                                Direction = "Left"
                                            });
                                        end;
                                    end;
                                elseif l_Magnitude_0 < 6 then
                                    l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, 1, 0)));
                                else
                                    local v68 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v52) or {
                                        Distance = 5000
                                    };
                                    local v69 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v52) or {
                                        Distance = 5000
                                    };
                                    if v68.Distance > v69.Distance then
                                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 0, 0)));
                                    else
                                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, 0, 0)));
                                    end;
                                end;
                            else
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                                local v70 = l_Styles_0[v27.Style.Value];
                                local l_Style_1 = v27:FindFirstChild("Style");
                                local v72 = l_Styles_0[l_Style_1.Value].Combos[l_CombatController_0.CurrentCombo];
                                local v73 = v72[l_CombatController_0.CurrentPunch];
                                local v74 = v72.DefaultPunchInfo or l_Styles_0[l_Style_1.Value].DefaultPunchInfo;
                                if l_Magnitude_0 < (v73.HitboxSize or v74.HitboxSize or l_Styles_0[v27.Style.Value].HitboxInfo.Size).Z + v12:NextNumber(0.5, 1.5) then
                                    v70 = nil;
                                    if v12:NextNumber(0, 1) < 0.5 then
                                        local v75 = true;
                                        repeat
                                            v70 = v30:TryAttack({
                                                IsHeavy = v75
                                            });
                                            if v75 and v12:NextNumber(0, 1) < 0.8 then
                                                v75 = false;
                                            end;
                                            task.wait();
                                            v72 = v28.Stamina.Value;
                                            v74 = l_Styles_0[v27.Style.Value];
                                            local l_Style_2 = v27:FindFirstChild("Style");
                                            local v77 = l_Styles_0[l_Style_2.Value].Combos[l_CombatController_0.CurrentCombo];
                                            local v78 = v77[l_CombatController_0.CurrentPunch];
                                            local v79 = v77.DefaultPunchInfo or l_Styles_0[l_Style_2.Value].DefaultPunchInfo;
                                        until v72 <= (v78.Stamina or v79.Stamina) or l_Magnitude_0 > 8 or v28.Stunned.Value or v70 == "Missed";
                                    else
                                        repeat
                                            v72 = l_v24_FirstChild_0.CharacterData.BlockEnergy.Value;
                                            local v80 = l_Styles_0[v27.Style.Value];
                                            local l_Style_3 = v27:FindFirstChild("Style");
                                            local v82 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                            local l_HeavyAttacks_0 = l_Styles_0[l_Style_3.Value].HeavyAttacks;
                                            v82 = l_HeavyAttacks_0[l_CombatController_0.CurrentHeavy];
                                            local v84 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                                            local v85 = v72 < (v82.Damage or v84.Damage) * v12:NextNumber(0.7, 2.5);
                                            v72 = workspace:GetServerTimeNow();
                                            v70 = v30:TryAttack({
                                                IsHeavy = v85
                                            });
                                            task.wait();
                                            v73 = v28.Stamina.Value;
                                            v80 = l_Styles_0[v27.Style.Value];
                                            l_Style_3 = v27:FindFirstChild("Style");
                                            l_HeavyAttacks_0 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo];
                                            v82 = l_HeavyAttacks_0[l_CombatController_0.CurrentPunch];
                                            v84 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                                        until v73 <= (v82.Stamina or v84.Stamina) or l_Magnitude_0 > 8 or v28.Stunned.Value or v70 == "Missed";
                                    end;
                                    if v70 == "Missed" then
                                        if v28.Stamina.Value > v28.MaxStamina.Value * 0.6 then
                                            if not v43 or l_Value_1 ~= "Bullet" then
                                                v30:TryDash({
                                                    Direction = "Forward"
                                                });
                                            end;
                                        else
                                            v30:TryDash({
                                                Direction = "Backward"
                                            });
                                        end;
                                    elseif v28.Stamina.Value < v28.MaxStamina.Value * 0.5 then
                                        v49 = true;
                                        task.delay(v12:NextNumber(1, 3), function() --[[ Line: 412 ]]
                                            -- upvalues: v49 (ref)
                                            v49 = false;
                                        end);
                                    end;
                                end;
                            end;
                        end;
                    end;
                else
                    break;
                end;
            end;
        end;
    end
};