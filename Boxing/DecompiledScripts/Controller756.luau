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
local _ = l_ReplicatedStorage_0.Maps.m_TakeoverExpo.NPCs.Coach;
return {
    Init = function() --[[ Line: 29 ]] --[[ Name: Init ]]
        -- upvalues: l_Cleaner_0 (copy), l_EquipGlovesOnCharacter_0 (copy), l_Workspace_0 (copy), v8 (copy), l_Styles_0 (copy), v12 (copy), l_CreateEffect_0 (copy)
        local v14 = l_Cleaner_0.new();
        local l_Parent_0 = script.Parent;
        v14:Add(l_Parent_0.AncestryChanged:Connect(function(_, v17) --[[ Line: 33 ]]
            -- upvalues: v14 (copy)
            if v17 == nil then
                v14:Clean();
            end;
        end));
        local _ = nil;
        local _ = nil;
        local _ = nil;
        local _ = function(_, _) --[[ Line: 54 ]] --[[ Name: DebugRender ]]

        end;
        local v24 = {
            Name = "Dragon"
        };
        l_EquipGlovesOnCharacter_0:Fire(l_Parent_0, {
            v24, 
            v24
        });
        local v25 = l_Workspace_0:WaitForChild("States", 20);
        local v26 = v25:WaitForChild(l_Parent_0.Name, 20);
        local v27 = v26:WaitForChild("Occupied", 20);
        local v28 = v26:WaitForChild("PlayerData", 20);
        local v29 = v26:WaitForChild("CharacterData", 20);
        local _ = l_Parent_0:WaitForChild("Humanoid", 20);
        local v31 = v8.New({
            Character = l_Parent_0
        });
        while not v29.Opponent.Value and l_Parent_0:IsDescendantOf(game) do
            task.wait();
        end;
        local l_Value_0 = v29.Opponent.Value;
        while not v25:FindFirstChild(l_Value_0.Name) and l_Parent_0:IsDescendantOf(game) do
            task.wait();
        end;
        local l_v25_FirstChild_0 = v25:FindFirstChild(l_Value_0.Name);
        local l_Value_1 = l_v25_FirstChild_0.PlayerData.Style.Value;
        local l_CombatController_0 = v31.CombatController;
        local _ = function(v36, v37) --[[ Line: 104 ]] --[[ Name: GetPunchInfo ]]
            -- upvalues: l_Styles_0 (ref), v28 (copy), l_CombatController_0 (copy)
            local _ = l_Styles_0[v28.Style.Value];
            local l_Style_0 = v28:FindFirstChild("Style");
            local v40 = l_Styles_0[l_Style_0.Value].Combos[l_CombatController_0.CurrentCombo];
            local v41 = v40[l_CombatController_0.CurrentPunch];
            if v37 == "IsHeavy" then
                v40 = l_Styles_0[l_Style_0.Value].HeavyAttacks;
                v41 = v40[l_CombatController_0.CurrentHeavy];
            elseif v37 == "IsUltimate" then
                v40 = l_Styles_0[l_Style_0.Value].UltimateInfo;
                v41 = v40[1];
            end;
            local v42 = v40.DefaultPunchInfo or l_Styles_0[l_Style_0.Value].DefaultPunchInfo;
            return v41[v36] or v42[v36];
        end;
        local v44 = l_Parent_0:GetAttribute("HardMode") or false;
        local v45 = l_Parent_0:GetAttribute("EasyMode") or false;
        local v46 = v44 and 0.22 or 0.27;
        local v47 = nil;
        local function _() --[[ Line: 132 ]] --[[ Name: GetReactionTime ]]
            -- upvalues: v47 (ref), v46 (ref), v12 (ref)
            if v47 then
                return v47;
            else
                return (math.clamp(v46 + v12:NextNumber(0, 0.1), 0.125, 0.35));
            end;
        end;
        local v49 = 0;
        local v50 = v44 and 16 or 30;
        local l_v44_0 = v44;
        local l_v44_1 = v44;
        local v53 = not v44;
        local v54 = false;
        local v55 = not v44;
        local v56 = 6;
        local v57 = 0.25;
        local v58 = 0.6;
        if v44 then
            l_Parent_0:SetAttribute("DamageMult", 1.1);
            l_Parent_0:SetAttribute("HealthMult", 1.1);
        elseif v45 then
            l_Parent_0:SetAttribute("DamageMult", 0.5);
            l_Parent_0:SetAttribute("HealthMult", 0.65);
        else
            l_Parent_0:SetAttribute("DamageMult", 0.5);
            l_Parent_0:SetAttribute("HealthMult", 1);
        end;
        v14:Add(l_Value_0:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 166 ]]
            -- upvalues: v49 (ref)
            v49 = v49 + 1;
        end));
        v14:Add(l_Value_0:GetAttributeChangedSignal("IsHeavy"):Connect(function() --[[ Line: 170 ]]
            -- upvalues: v47 (ref)
            v47 = 0.35;
            task.delay(1, function() --[[ Line: 173 ]]
                -- upvalues: v47 (ref)
                v47 = nil;
            end);
        end));
        local v59 = l_Workspace_0.States[l_Value_0.Name];
        local _ = v59.PlayerData;
        local l_CharacterData_0 = v59.CharacterData;
        local v62 = l_Value_0 and game.Players:GetPlayerFromCharacter(l_Value_0);
        l_Parent_0:SetAttribute("DramaticAnimId", 13904461287);
        l_Value_0:SetAttribute("DramaticAnimId", 14459678144);
        local v63 = 0;
        v14:Add(l_Parent_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 189 ]]
            -- upvalues: v63 (ref), v50 (ref), v44 (copy), v46 (ref), v28 (copy), l_CreateEffect_0 (ref), v62 (copy), l_Value_0 (copy), v29 (copy), v27 (copy), l_Workspace_0 (ref), l_Parent_0 (copy), v55 (ref), v56 (ref), l_v44_0 (ref), l_v44_1 (ref), v57 (ref), v58 (ref), v53 (ref)
            v63 = v63 + 1;
            if v63 == 1 then
                v50 = v44 and 12 or 24;
                v46 = v44 and 0.2 or 0.26;
                v28.KnockdownSet.Value = "Fling";
                task.wait(2);
                l_CreateEffect_0:FireClient(v62, {
                    "DramaticDialog", 
                    workspace.Misc.DialogCoach, 
                    "THAT'S THE WAY!!! GOOD JOB, BRINGUS!", 
                    Color3.fromRGB(71, 71, 71), 
                    2.5, 
                    0.25, 
                    CFrame.new(0, -1.1, -1.1)
                });
                task.wait(4);
                l_CreateEffect_0:FireClient(v62, {
                    "DramaticDialog", 
                    l_Value_0, 
                    "HAH... HAH.. IT'S ALL THANKS... TO YOUR TRAINING... (im about to pass out)", 
                    Color3.fromRGB(71, 71, 71), 
                    3, 
                    0.25, 
                    CFrame.new(0, -1.05, -0.9)
                });
                local v64 = nil;
                v64 = v29.Cutscene.Changed:Connect(function(v65) --[[ Line: 222 ]]
                    -- upvalues: v64 (ref), v29 (ref), v27 (ref), l_Workspace_0 (ref), l_CreateEffect_0 (ref), l_Parent_0 (ref)
                    if v65 == true then
                        return;
                    else
                        if v64 then
                            v64:Disconnect();
                        end;
                        v29.Cutscene.Value = true;
                        v29.CanEmoteAnyways.Value = true;
                        local l_Value_2 = v27.LockedOn.Value;
                        local v67 = l_Value_2 and game.Players:GetPlayerFromCharacter(l_Value_2);
                        if not v67 then
                            v29.Cutscene.Value = false;
                            return;
                        else
                            local v68 = l_Workspace_0.States[l_Value_2.Name];
                            local _ = v68.PlayerData;
                            local l_CharacterData_1 = v68.CharacterData;
                            l_CharacterData_1.Stunned.Value = true;
                            l_CharacterData_1.Cutscene.Value = true;
                            task.wait(0.25);
                            l_CreateEffect_0:FireClient(v67, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "I HATE TO RUIN YOUR LITTLE CHAT, BUT I'M NOT OUT YET.", 
                                Color3.fromRGB(90, 24, 148), 
                                3.5, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            task.wait(4);
                            l_CharacterData_1.Stunned.Value = false;
                            l_CharacterData_1.Cutscene.Value = false;
                            v29.Cutscene.Value = false;
                            return;
                        end;
                    end;
                end);
                v55 = false;
                v56 = 8;
                l_v44_0 = true;
                l_v44_1 = true;
                return;
            elseif v63 == 2 then
                v50 = v44 and 8 or 12;
                v46 = v44 and 0.2 or 0.24;
                v28.KnockdownSet.Value = "Barbarian";
                l_CreateEffect_0:FireClient(v62, {
                    "DramaticDialog", 
                    l_Parent_0, 
                    "MY HAT... YOU...", 
                    Color3.fromRGB(90, 24, 148), 
                    2.5, 
                    0.25, 
                    CFrame.new(0, -0.95, -0.9)
                });
                if v44 then
                    l_Parent_0:SetAttribute("DamageMult", 1.2);
                    l_Parent_0:SetAttribute("HealthMult", 1.2);
                else
                    l_Parent_0:SetAttribute("DamageMult", 0.6);
                    l_Parent_0:SetAttribute("HealthMult", 1);
                end;
                local v71 = nil;
                v71 = v29.Cutscene.Changed:Connect(function(v72) --[[ Line: 296 ]]
                    -- upvalues: v71 (ref), v29 (ref), v27 (ref), l_Workspace_0 (ref), l_CreateEffect_0 (ref), l_Value_0 (ref)
                    if v72 == true then
                        return;
                    else
                        if v71 then
                            v71:Disconnect();
                        end;
                        v29.Cutscene.Value = true;
                        v29.CanEmoteAnyways.Value = true;
                        local l_Value_3 = v27.LockedOn.Value;
                        local v74 = l_Value_3 and game.Players:GetPlayerFromCharacter(l_Value_3);
                        if not v74 then
                            v29.Cutscene.Value = false;
                            return;
                        else
                            local v75 = l_Workspace_0.States[l_Value_3.Name];
                            local _ = v75.PlayerData;
                            local l_CharacterData_2 = v75.CharacterData;
                            l_CharacterData_2.Stunned.Value = true;
                            l_CharacterData_2.Cutscene.Value = true;
                            task.wait(0.25);
                            l_CreateEffect_0:FireClient(v74, {
                                "DramaticDialog", 
                                workspace.Misc.DialogCoach, 
                                "... SO THAT'S WHY HE WEARS THE HAT...", 
                                Color3.fromRGB(170, 34, 36), 
                                2.5, 
                                0.25, 
                                CFrame.new(0, -1.1, -1.1)
                            });
                            task.wait(3.2);
                            l_CreateEffect_0:FireClient(v74, {
                                "DramaticDialog", 
                                l_Value_0, 
                                "WOAH... HE LOOKS... HE LOOKS...", 
                                Color3.fromRGB(71, 71, 71), 
                                1.5, 
                                0.25, 
                                CFrame.new(0, -1.05, -0.9)
                            });
                            task.wait(2.2);
                            l_CreateEffect_0:FireClient(v74, {
                                "DramaticDialog", 
                                l_Value_0, 
                                "HE LOOKS SO COOL!!!", 
                                Color3.fromRGB(71, 71, 71), 
                                1.5, 
                                0.25, 
                                CFrame.new(0, -1.05, -0.9)
                            });
                            task.wait(4.2);
                            l_CreateEffect_0:FireClient(v74, {
                                "DramaticDialog", 
                                workspace.Misc.DialogCoach, 
                                "... WHAT?", 
                                Color3.fromRGB(170, 34, 36), 
                                2.5, 
                                0.25, 
                                CFrame.new(0, -1.1, -1.1)
                            });
                            task.wait(2);
                            l_CharacterData_2.Stunned.Value = false;
                            l_CharacterData_2.Cutscene.Value = false;
                            v29.Cutscene.Value = false;
                            return;
                        end;
                    end;
                end);
                v57 = 0.1;
                v58 = 0.3;
                v53 = false;
                return;
            else
                l_CreateEffect_0:FireClient(v62, {
                    "DramaticDialog", 
                    l_Parent_0, 
                    "ALL MY LIFE, I TRIED TO HIDE MY BALDNESS... BUT YOU...", 
                    Color3.fromRGB(90, 24, 148), 
                    3.5, 
                    0.25, 
                    CFrame.new(0, -0.95, -0.9)
                });
                return;
            end;
        end));
        local l_Parent_1 = v29.Centre.Value.Parent.Parent;
        local v79 = RaycastParams.new();
        v79.FilterType = Enum.RaycastFilterType.Include;
        v79.FilterDescendantsInstances = {
            l_Parent_1
        };
        repeat
            task.wait(0.5);
        until not v29.Cutscene.Value;
        l_CharacterData_0.Stunned.Value = true;
        l_CharacterData_0.Cutscene.Value = true;
        task.wait(1);
        v14:Add(l_Value_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 401 ]]
            -- upvalues: l_CreateEffect_0 (ref), v62 (copy)
            local v80 = {
                "STAY COMPOSED! REMEMBER TO BREATH!", 
                "DON'T LET THEM GET IN YOUR HEAD!!", 
                "YOU'RE DOING FINE! RELAX!!", 
                "DON'T RUSH THINGS! YOU'RE DOING FINE!!", 
                "IT'S JUST A MISTAKE. YOU ARE STRONGER!", 
                "DON'T GET ANGRY HERE! REMEMBER OUR TRAINING!"
            };
            l_CreateEffect_0:FireClient(v62, {
                "DramaticDialog", 
                workspace.Misc.DialogCoach, 
                v80[math.random(1, #v80)], 
                Color3.fromRGB(170, 34, 36), 
                2.5, 
                0.25, 
                CFrame.new(0, -1.1, -1.1)
            });
        end));
        l_CreateEffect_0:FireClient(v62, {
            "DramaticDialog", 
            l_Parent_0, 
            "LET'S DO THIS, KID.", 
            Color3.fromRGB(90, 24, 148), 
            1.5, 
            0.25, 
            CFrame.new(0, -0.95, -0.9)
        });
        task.wait(2.2);
        l_CreateEffect_0:FireClient(v62, {
            "DramaticDialog", 
            l_Value_0, 
            "I'M READY, OLD MAN!", 
            Color3.fromRGB(71, 71, 71), 
            1.5, 
            0.25, 
            CFrame.new(0, -0.95, -0.9)
        });
        task.wait(3);
        l_CharacterData_0.Stunned.Value = false;
        l_CharacterData_0.Cutscene.Value = false;
        while task.wait() and l_Parent_0:IsDescendantOf(game) and l_Value_0:IsDescendantOf(game) do
            if l_Parent_0.PrimaryPart and l_Value_0.PrimaryPart then
                local l_Magnitude_0 = (l_Parent_0.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
                if v50 < v49 and l_Magnitude_0 < 4.5 and l_Value_0:GetAttribute("Punching") and not l_Value_0:GetAttribute("IsHeavy") then
                    l_Parent_0:SetAttribute("ServerPerfect", true);
                    local v82 = (l_Value_0:GetAttribute("LandTime") or workspace:GetServerTimeNow()) - workspace:GetServerTimeNow();
                    local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("AttackingHand");
                    task.wait(v82 - 0.11666666666666667);
                    v31:TryDash({
                        Direction = l_l_Value_0_Attribute_0 == "RightHand" and "Left" or "Right"
                    });
                    if l_Value_0:GetAttribute("SlowMo") then
                        while v29.Stunned.Value do
                            task.wait();
                        end;
                        if v29.UltimateEnergy.Value == 100 then
                            v31:TryAttack({
                                IsUltimate = true
                            });
                        else
                            v31:TryAttack({
                                IsHeavy = true
                            });
                        end;
                        v49 = 0;
                    end;
                else
                    if (l_Value_0:GetAttribute("Punching") and l_Magnitude_0 < 8 or v29.Stunned.Value) and v29.BlockEnergy.Value > 8 then
                        if v53 and l_Value_0:GetAttribute("Punching") and l_Value_0:GetAttribute("IsUltimate") then
                            v31:Unblock();
                            continue;
                        else
                            if v55 and v12:NextNumber(0, 1) < 0.5 then
                                task.wait(1.2);
                            else
                                task.wait(v47 or math.clamp(v46 + v12:NextNumber(0, 0.1), 0.125, 0.35));
                            end;
                            if not v29.Stunned.Value and l_Value_0:GetAttribute("Punching") and l_v44_0 and v12:NextNumber(0, 1) > 0.5 then
                                v31:TryDash({
                                    Direction = v12:NextNumber(0, 1) > 0.5 and "Left" or "Right"
                                });
                            end;
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, 1, 0)));
                            if v31:TryBlock() then
                                local v84 = v44 and 12 or v12:NextNumber(4, 10);
                                repeat
                                    task.wait();
                                until v29.BlockEnergy.Value < v84 or not v29.Stunned.Value or v53 and l_Value_0:GetAttribute("IsUltimate");
                                v31:Unblock();
                            else
                                v31:Unblock();
                            end;
                            task.wait((v47 or math.clamp(v46 + v12:NextNumber(0, 0.1), 0.125, 0.35)) / 2);
                        end;
                    end;
                    if v29.Stamina.Value < v29.MaxStamina.Value * 0.4 or v54 then
                        if l_v44_1 and l_Magnitude_0 < 5 and v29.Stamina.Value > v29.MaxStamina.Value * v57 then
                            local v85 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.LookVector * -5, v79);
                            if v12:NextNumber(0, 1) > 0.5 and not v85 then
                                v31:TryDash({
                                    Direction = "Backward"
                                });
                            else
                                local v86 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v79) or {
                                    Distance = 5000
                                };
                                local v87 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v79) or {
                                    Distance = 5000
                                };
                                if v86.Distance > v87.Distance then
                                    v31:TryDash({
                                        Direction = "Right"
                                    });
                                else
                                    v31:TryDash({
                                        Direction = "Left"
                                    });
                                end;
                            end;
                        elseif l_Magnitude_0 < v56 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, 1, 0)));
                        else
                            local v88 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v79) or {
                                Distance = 5000
                            };
                            local v89 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v79) or {
                                Distance = 5000
                            };
                            if v88.Distance > v89.Distance then
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 0, 0)));
                            else
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, 0, 0)));
                            end;
                        end;
                    else
                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                        local v90 = l_Styles_0[v28.Style.Value];
                        local l_Style_1 = v28:FindFirstChild("Style");
                        local v92 = l_Styles_0[l_Style_1.Value].Combos[l_CombatController_0.CurrentCombo];
                        local v93 = v92[l_CombatController_0.CurrentPunch];
                        local v94 = v92.DefaultPunchInfo or l_Styles_0[l_Style_1.Value].DefaultPunchInfo;
                        if l_Magnitude_0 < (v93.HitboxSize or v94.HitboxSize or l_Styles_0[v28.Style.Value].HitboxInfo.Size).Z + v12:NextNumber(0.5, 1.5) then
                            v90 = nil;
                            if v12:NextNumber(0, 1) < 0.5 then
                                local v95 = true;
                                repeat
                                    v90 = v31:TryAttack({
                                        IsHeavy = v95
                                    });
                                    if v95 and v12:NextNumber(0, 1) < 0.8 then
                                        v95 = false;
                                    end;
                                    task.wait();
                                    v92 = v29.Stamina.Value;
                                    v94 = l_Styles_0[v28.Style.Value];
                                    local l_Style_2 = v28:FindFirstChild("Style");
                                    local v97 = l_Styles_0[l_Style_2.Value].Combos[l_CombatController_0.CurrentCombo];
                                    local v98 = v97[l_CombatController_0.CurrentPunch];
                                    local v99 = v97.DefaultPunchInfo or l_Styles_0[l_Style_2.Value].DefaultPunchInfo;
                                until v92 <= (v98.Stamina or v99.Stamina) or l_Magnitude_0 > 8 or v29.Stunned.Value or v90 == "Missed";
                            else
                                repeat
                                    v92 = l_v25_FirstChild_0.CharacterData.BlockEnergy.Value;
                                    local v100 = l_Styles_0[v28.Style.Value];
                                    local l_Style_3 = v28:FindFirstChild("Style");
                                    local v102 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                    local l_HeavyAttacks_0 = l_Styles_0[l_Style_3.Value].HeavyAttacks;
                                    v102 = l_HeavyAttacks_0[l_CombatController_0.CurrentHeavy];
                                    local v104 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                                    local v105 = v92 < (v102.Damage or v104.Damage) * v12:NextNumber(0.7, 2.5);
                                    v92 = workspace:GetServerTimeNow();
                                    v90 = v31:TryAttack({
                                        IsHeavy = v105
                                    });
                                    task.wait();
                                    v93 = v29.Stamina.Value;
                                    v100 = l_Styles_0[v28.Style.Value];
                                    l_Style_3 = v28:FindFirstChild("Style");
                                    l_HeavyAttacks_0 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo];
                                    v102 = l_HeavyAttacks_0[l_CombatController_0.CurrentPunch];
                                    v104 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                                until v93 <= (v102.Stamina or v104.Stamina) or l_Magnitude_0 > 8 or v29.Stunned.Value or v90 == "Missed";
                            end;
                            if v90 == "Missed" then
                                if v29.Stamina.Value > v29.MaxStamina.Value * v58 then
                                    if not v44 or l_Value_1 ~= "Bullet" then
                                        v31:TryDash({
                                            Direction = "Forward"
                                        });
                                    end;
                                else
                                    v31:TryDash({
                                        Direction = "Backward"
                                    });
                                end;
                            elseif v29.Stamina.Value < v29.MaxStamina.Value * 0.5 then
                                v54 = true;
                                task.delay(v12:NextNumber(1, 3), function() --[[ Line: 622 ]]
                                    -- upvalues: v54 (ref)
                                    v54 = false;
                                end);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end
};