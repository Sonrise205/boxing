local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_Workspace_0 = game:GetService("Workspace");
local l_EquipGloves_0 = l_ServerScriptService_0:WaitForChild("Events"):WaitForChild("EquipGloves");
local v5 = l_ServerScriptService_0:WaitForChild("Combat", 10);
local v6 = require(v5:WaitForChild("NPC", 10));
local l_CreateEffect_0 = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents"):WaitForChild("CreateEffect");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local v10 = Random.new();
return {
    Init = function() --[[ Line: 22 ]] --[[ Name: Init ]]
        -- upvalues: l_ServerStorage_0 (copy), l_EquipGloves_0 (copy), l_Workspace_0 (copy), v6 (copy), l_Styles_0 (copy), v10 (copy), l_CreateEffect_0 (copy)
        local l_Parent_0 = script.Parent;
        local l_Assets_0 = script.Assets;
        l_Assets_0.Parent = l_ServerStorage_0;
        l_Assets_0.Name = l_Parent_0.Name;
        local v13 = {
            Name = "Splash"
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
        local l_PlayerFromCharacter_0 = game.Players:GetPlayerFromCharacter(l_Value_0);
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
        local v34 = 0.25;
        local function _() --[[ Line: 84 ]] --[[ Name: GetReactionTime ]]
            -- upvalues: v34 (ref), v10 (ref)
            return (math.clamp(v34 + v10:NextNumber(0, 0.1), 0.125, 0.3));
        end;
        local v36 = 0;
        local v37 = true;
        local v38 = false;
        local v39 = false;
        local v40 = os.clock();
        local v41 = false;
        local v42 = false;
        local v43 = false;
        local v44 = {
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
            -- upvalues: v36 (ref)
            v36 = v36 + 1;
        end);
        local v45 = l_Parent_0:GetAttribute("HardMode") or false;
        local v46 = l_Parent_0:GetAttribute("EasyMode") or false;
        if v45 then
            l_Parent_0:SetAttribute("DamageMult", 1.05);
            l_Parent_0:SetAttribute("HealthMult", 1.05);
        elseif v46 then
            l_Parent_0:SetAttribute("DamageMult", 0.8);
            l_Parent_0:SetAttribute("HealthMult", 0.65);
        else
            l_Parent_0:SetAttribute("DamageMult", 1);
            l_Parent_0:SetAttribute("HealthMult", 1);
        end;
        local v47 = l_Parent_0:GetAttribute("BabyMode") or false;
        if v47 then
            v34 = 0.25;
            v37 = false;
            l_Parent_0:SetAttribute("DamageMult", 0.6);
            l_Parent_0:SetAttribute("HealthMult", 0.6);
        end;
        local v48 = 0;
        l_Parent_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 138 ]]
            -- upvalues: v48 (ref), v17 (copy), l_Parent_0 (copy), l_Assets_0 (copy), v45 (copy), v46 (copy), v47 (copy), v37 (ref), v38 (ref), l_EquipGloves_0 (ref), v44 (ref)
            v48 = v48 + 1;
            if v48 == 1 then
                v17.KnockdownSet.Value = "Cartoony";
                l_Parent_0.Face1.Handle.Transparency = 1;
                l_Parent_0.Stupid.Handle.Transparency = 0;
                task.delay(10, function() --[[ Line: 148 ]]
                    -- upvalues: l_Parent_0 (ref), v48 (ref)
                    if not l_Parent_0 or v48 > 1 then
                        return;
                    else
                        l_Parent_0.Stupid.Handle.Transparency = 1;
                        l_Parent_0.DeadpanStare.Handle.Transparency = 0;
                        return;
                    end;
                end);
                for _, v50 in l_Parent_0:GetDescendants() do
                    if v50:IsA("Shirt") or v50:IsA("Pants") then
                        v50:Destroy();
                    end;
                end;
                l_Assets_0.Shirt1.Parent = l_Parent_0;
                l_Assets_0.Pants1.Parent = l_Parent_0;
                return;
            elseif v48 == 2 then
                if v45 then
                    l_Parent_0:SetAttribute("DamageMult", 1.2);
                    l_Parent_0:SetAttribute("HealthMult", 1.2);
                elseif v46 then
                    l_Parent_0:SetAttribute("DamageMult", 1.2);
                    l_Parent_0:SetAttribute("HealthMult", 0.8);
                else
                    l_Parent_0:SetAttribute("DamageMult", 1.2);
                    l_Parent_0:SetAttribute("HealthMult", 1);
                end;
                if v47 then
                    l_Parent_0:SetAttribute("DamageMult", 0.7);
                    l_Parent_0:SetAttribute("HealthMult", 0.7);
                end;
                v37 = true;
                v38 = true;
                v17.KnockdownSet.Value = "Shatter";
                local v51 = {
                    Name = "Splash", 
                    Unusual = "Flames"
                };
                l_EquipGloves_0:Fire(l_Parent_0, {
                    v51, 
                    v51
                });
                v17.Style.Value = "Hawk";
                l_Parent_0.Face1.Handle.Transparency = 1;
                l_Parent_0.Hair2.Handle.Transparency = 1;
                l_Parent_0.DeadpanStare.Handle.Transparency = 1;
                l_Parent_0.HalfEvil.Handle.Transparency = 0;
                l_Parent_0.FinalHair.Handle.Transparency = 0;
                l_Parent_0.CrazyFace.Handle.Transparency = 0;
                for _, v53 in l_Parent_0:GetDescendants() do
                    if v53:IsA("Shirt") or v53:IsA("Pants") then
                        v53:Destroy();
                    end;
                end;
                l_Assets_0.Shirt2.Parent = l_Parent_0;
                l_Assets_0.Pants2.Parent = l_Parent_0;
                v44 = {
                    "Threat", 
                    "ComeOn", 
                    "Inspect"
                };
                return;
            else
                v17.KnockdownSet.Value = "Cartoony";
                return;
            end;
        end);
        local l_Parent_1 = v18.Centre.Value.Parent.Parent;
        local v55 = RaycastParams.new();
        v55.FilterType = Enum.RaycastFilterType.Include;
        v55.FilterDescendantsInstances = {
            l_Parent_1
        };
        while task.wait() and l_Parent_0:IsDescendantOf(game) and l_Value_0:IsDescendantOf(game) do
            if l_Parent_0.PrimaryPart and l_Value_0.PrimaryPart then
                if os.clock() - v40 > 3 then
                    v40 = os.clock();
                    v41 = v10:NextNumber(0, 1) > 0.5;
                end;
                local l_Magnitude_0 = (l_Parent_0.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
                if l_Value_1 == "Takamura" and l_Value_0:GetAttribute("Charging") then
                    l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(v41 and -1 or 1, 0, 1)));
                    if l_Magnitude_0 < 5 then
                        v20:TryAttack({});
                    end;
                else
                    if not v42 and l_Magnitude_0 > 6 then
                        if not v43 and workspace:GetServerTimeNow() - (l_Parent_0:GetAttribute("LastLanded") or workspace:GetServerTimeNow()) > 20 then
                            v43 = true;
                            v20:TryAttack({});
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                        elseif v43 and workspace:GetServerTimeNow() - (l_Parent_0:GetAttribute("LastLanded") or workspace:GetServerTimeNow()) < 30 then
                            v43 = false;
                        end;
                        if not v43 and (v18.CanEmoteAnyways.Value or not v18.Cutscene.Value and not v18.Stunned.Value) then
                            v18.Blocking.Value = false;
                            local v57 = v44[math.random(1, #v44)];
                            l_CreateEffect_0:FireClient(l_PlayerFromCharacter_0, {
                                "UseEmote", 
                                l_Parent_0, 
                                v57
                            });
                            task.wait(0.15);
                            v42 = true;
                            task.delay(7.35, function() --[[ Line: 271 ]]
                                -- upvalues: v42 (ref)
                                v42 = false;
                            end);
                        end;
                    end;
                    if v36 > 10 and l_Magnitude_0 < 4.5 and l_Value_0:GetAttribute("Punching") then
                        l_Parent_0:SetAttribute("ServerPerfect", true);
                        local v58 = l_Value_0:GetAttribute("LandTime") - workspace:GetServerTimeNow();
                        local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("AttackingHand");
                        task.wait(v58 - 0.11666666666666667);
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
                                local v60 = nil;
                                if v10:NextNumber(0, 1) < 0.5 then
                                    local v61 = true;
                                    repeat
                                        v60 = v20:TryAttack({
                                            IsHeavy = v61, 
                                            TryFeint = l_Value_0
                                        });
                                        if v61 and v10:NextNumber(0, 1) < 0.8 then
                                            v61 = false;
                                        end;
                                        task.wait();
                                        local l_Value_2 = v18.Stamina.Value;
                                        local _ = l_Styles_0[v17.Style.Value];
                                        local l_Style_1 = v17:FindFirstChild("Style");
                                        local v65 = l_Styles_0[l_Style_1.Value].Combos[l_CombatController_0.CurrentCombo];
                                        local v66 = v65[l_CombatController_0.CurrentPunch];
                                        local v67 = v65.DefaultPunchInfo or l_Styles_0[l_Style_1.Value].DefaultPunchInfo;
                                    until l_Value_2 <= (v66.Stamina or v67.Stamina) or l_Magnitude_0 > 8 or v18.Stunned.Value or v60 == "Missed";
                                else
                                    repeat
                                        local l_Value_3 = l_v14_FirstChild_0.CharacterData.BlockEnergy.Value;
                                        local v69 = l_Styles_0[v17.Style.Value];
                                        local l_Style_2 = v17:FindFirstChild("Style");
                                        local v71 = l_Styles_0[l_Style_2.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                        local l_HeavyAttacks_0 = l_Styles_0[l_Style_2.Value].HeavyAttacks;
                                        v71 = l_HeavyAttacks_0[l_CombatController_0.CurrentHeavy];
                                        local v73 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_2.Value].DefaultPunchInfo;
                                        v60 = v20:TryAttack({
                                            IsHeavy = l_Value_3 < (v71.Damage or v73.Damage) * v10:NextNumber(0.7, 2.5), 
                                            TryFeint = l_Value_0
                                        });
                                        task.wait();
                                        l_Value_3 = v18.Stamina.Value;
                                        local _ = l_Styles_0[v17.Style.Value];
                                        v69 = v17:FindFirstChild("Style");
                                        local v75 = l_Styles_0[v69.Value].Combos[l_CombatController_0.CurrentCombo];
                                        l_HeavyAttacks_0 = v75[l_CombatController_0.CurrentPunch];
                                        v71 = v75.DefaultPunchInfo or l_Styles_0[v69.Value].DefaultPunchInfo;
                                    until l_Value_3 <= (l_HeavyAttacks_0.Stamina or v71.Stamina) or l_Magnitude_0 > 8 or v18.Stunned.Value or v60 == "Missed";
                                end;
                            end;
                            v36 = 0;
                        end;
                    else
                        if l_Value_0:GetAttribute("Punching") and l_Magnitude_0 < 6 or v18.Stunned.Value then
                            if not v18.Stunned.Value and l_Value_0:GetAttribute("Punching") then
                                local l_wait_0 = task.wait;
                                local v77 = v10:NextNumber(0, 0.1);
                                l_wait_0((math.clamp(v34 + v77, 0.125, 0.3)));
                                if v10:NextNumber(0, 1) > 0.63 then
                                    v20:TryDash({
                                        Direction = v10:NextNumber(0, 1) > 0.5 and "Left" or "Right"
                                    });
                                end;
                            end;
                            if v18.BlockEnergy.Value > 10 then
                                if v20:TryBlock() then
                                    local v78 = v10:NextNumber(5, 12);
                                    repeat
                                        task.wait();
                                    until v18.BlockEnergy.Value < v78 or not v18.Stunned.Value;
                                    v20:Unblock();
                                    continue;
                                else
                                    v20:Unblock();
                                    continue;
                                end;
                            end;
                        end;
                        if v18.Stamina.Value < v18.MaxStamina.Value * 0.2 or v39 then
                            if v37 and l_Magnitude_0 < 8 and v18.Stamina.Value > v18.MaxStamina.Value * 0.25 then
                                local v79 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.LookVector * -5, v55);
                                if v10:NextNumber(0, 1) > 0.6 and not v79 then
                                    v20:TryDash({
                                        Direction = "Backward"
                                    });
                                else
                                    local v80 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v55) or {
                                        Distance = 5000
                                    };
                                    local v81 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v55) or {
                                        Distance = 5000
                                    };
                                    if v80.Distance > v81.Distance then
                                        v20:TryDash({
                                            Direction = "Right"
                                        });
                                    else
                                        v20:TryDash({
                                            Direction = "Left"
                                        });
                                    end;
                                end;
                            elseif l_Magnitude_0 < 6 then
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(v41 and -1 or 1, 0, 1)));
                            else
                                local v82 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v55) or {
                                    Distance = 5000
                                };
                                local v83 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v55) or {
                                    Distance = 5000
                                };
                                if v82.Distance > v83.Distance then
                                    l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 0, 0)));
                                else
                                    l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, 0, 0)));
                                end;
                            end;
                        else
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                            local v84 = l_Styles_0[v17.Style.Value];
                            local l_Style_3 = v17:FindFirstChild("Style");
                            local v86 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo];
                            local v87 = v86[l_CombatController_0.CurrentPunch];
                            local v88 = v86.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                            if l_Magnitude_0 < (v87.HitboxSize or v88.HitboxSize or l_Styles_0[v17.Style.Value].HitboxInfo.Size).Z + v10:NextNumber(0.5, 1.25) then
                                v84 = nil;
                                if v38 and l_Magnitude_0 > 6 and v18.Stamina.Value > v18.MaxStamina.Value * 0.75 and l_Value_1 ~= "Bullet" then
                                    v20:TryDash({
                                        Direction = "Forward"
                                    });
                                end;
                                l_Style_3 = 0.3;
                                if v46 or v47 then
                                    l_Style_3 = 0.6;
                                end;
                                if v10:NextNumber(0, 1) < l_Style_3 then
                                    v86 = true;
                                    repeat
                                        v84 = v20:TryAttack({
                                            IsHeavy = v86, 
                                            TryFeint = v86 and l_Value_0
                                        });
                                        v86 = v10:NextNumber(0, 1) < 0.5;
                                        task.wait();
                                        v87 = v18.Stamina.Value;
                                        local _ = l_Styles_0[v17.Style.Value];
                                        local l_Style_4 = v17:FindFirstChild("Style");
                                        local v91 = l_Styles_0[l_Style_4.Value].Combos[l_CombatController_0.CurrentCombo];
                                        local v92 = v91[l_CombatController_0.CurrentPunch];
                                        local v93 = v91.DefaultPunchInfo or l_Styles_0[l_Style_4.Value].DefaultPunchInfo;
                                    until v87 <= (v92.Stamina or v93.Stamina) or l_Magnitude_0 > 6 or v18.Stunned.Value or v84 == "Missed";
                                else
                                    repeat
                                        v87 = l_v14_FirstChild_0.CharacterData.BlockEnergy.Value;
                                        local v94 = l_Styles_0[v17.Style.Value];
                                        local l_Style_5 = v17:FindFirstChild("Style");
                                        local v96 = l_Styles_0[l_Style_5.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                        local l_HeavyAttacks_1 = l_Styles_0[l_Style_5.Value].HeavyAttacks;
                                        v96 = l_HeavyAttacks_1[l_CombatController_0.CurrentHeavy];
                                        local v98 = l_HeavyAttacks_1.DefaultPunchInfo or l_Styles_0[l_Style_5.Value].DefaultPunchInfo;
                                        v84 = v20:TryAttack({
                                            IsHeavy = v87 < (v96.Damage or v98.Damage) * v10:NextNumber(0.7, 2.5)
                                        });
                                        task.wait();
                                        v87 = v18.Stamina.Value;
                                        local _ = l_Styles_0[v17.Style.Value];
                                        v94 = v17:FindFirstChild("Style");
                                        local v100 = l_Styles_0[v94.Value].Combos[l_CombatController_0.CurrentCombo];
                                        l_HeavyAttacks_1 = v100[l_CombatController_0.CurrentPunch];
                                        v96 = v100.DefaultPunchInfo or l_Styles_0[v94.Value].DefaultPunchInfo;
                                    until v87 <= (l_HeavyAttacks_1.Stamina or v96.Stamina) or l_Magnitude_0 > 6 or v18.Stunned.Value or v84 == "Missed";
                                end;
                                if v84 == "Missed" then
                                    if v18.Stamina.Value > v18.MaxStamina.Value * 0.4 then
                                        v20:TryDash({
                                            Direction = "Forward"
                                        });
                                    end;
                                elseif v18.Stamina.Value < v18.MaxStamina.Value * 0.4 then
                                    v39 = true;
                                    v86 = v10:NextNumber(1, 3);
                                    if v46 or v47 then
                                        v86 = v10:NextNumber(2, 4);
                                    end;
                                    task.delay(v86, function() --[[ Line: 468 ]]
                                        -- upvalues: v39 (ref)
                                        v39 = false;
                                    end);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end
};