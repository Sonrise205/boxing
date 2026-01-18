local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local _ = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_EquipGlovesOnCharacter_0 = l_ServerScriptService_0:WaitForChild("Events"):WaitForChild("EquipGlovesOnCharacter");
local v6 = l_ServerScriptService_0:WaitForChild("Combat", 10);
local v7 = require(v6:WaitForChild("NPC", 10));
local l_CreateEffect_0 = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents"):WaitForChild("CreateEffect");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local v12 = Random.new();
local v13 = {};
local l_VoidSamurai_0 = require(v6:WaitForChild("Abilities"):WaitForChild("VoidSamurai"));
v13.Init = function() --[[ Line: 29 ]] --[[ Name: Init ]]
    -- upvalues: l_ServerStorage_0 (copy), l_EquipGlovesOnCharacter_0 (copy), l_Workspace_0 (copy), v7 (copy), l_Styles_0 (copy), v12 (copy), l_CreateEffect_0 (copy), l_VoidSamurai_0 (copy)
    local l_Parent_0 = script.Parent;
    local _ = nil;
    local _ = nil;
    local _ = nil;
    local _ = function(_, _) --[[ Line: 47 ]] --[[ Name: DebugRender ]]

    end;
    local l_Assets_0 = script.Assets;
    l_Assets_0.Parent = l_ServerStorage_0;
    l_Assets_0.Name = l_Parent_0.Name;
    local v23 = {
        Name = "BalrogBreaker"
    };
    l_EquipGlovesOnCharacter_0:Fire(l_Parent_0, {
        v23, 
        v23
    });
    local v24 = l_Workspace_0:WaitForChild("States", 20);
    local v25 = v24:WaitForChild(l_Parent_0.Name, 20);
    local v26 = v25:WaitForChild("Occupied", 20);
    local v27 = v25:WaitForChild("PlayerData", 20);
    local v28 = v25:WaitForChild("CharacterData", 20);
    local _ = l_Parent_0:WaitForChild("Humanoid", 20);
    local v30 = v7.New({
        Character = l_Parent_0
    });
    while not v28.Opponent.Value do
        task.wait();
    end;
    local l_Value_0 = v28.Opponent.Value;
    while not v24:FindFirstChild(l_Value_0.Name) do
        task.wait();
    end;
    local l_v24_FirstChild_0 = v24:FindFirstChild(l_Value_0.Name);
    local l_Value_1 = l_v24_FirstChild_0.PlayerData.Style.Value;
    local l_CombatController_0 = v30.CombatController;
    local _ = function(v35, v36) --[[ Line: 101 ]] --[[ Name: GetPunchInfo ]]
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
    local v43 = 0.26;
    local v44 = 0.4;
    local function _() --[[ Line: 125 ]] --[[ Name: GetReactionTime ]]
        -- upvalues: v43 (ref), v12 (ref), v44 (ref)
        return (math.clamp(v43 + v12:NextNumber(0, v44), 0.125, 0.3));
    end;
    local v46 = 0;
    local v47 = 0;
    local v48 = true;
    local v49 = true;
    local v50 = false;
    local v51 = 5;
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
    l_Value_0:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 151 ]]
        -- upvalues: v46 (ref), v47 (ref)
        v46 = v46 + 1;
        v47 = v47 + 1;
    end);
    local v54 = 0.5;
    local v55 = l_Parent_0:GetAttribute("HardMode") or false;
    local v56 = l_Parent_0:GetAttribute("EasyMode") or false;
    if v55 then
        l_Parent_0:SetAttribute("DamageMult", 1.1);
        l_Parent_0:SetAttribute("HealthMult", 1.1);
    elseif v56 then
        v43 = 0.28;
        v54 = 0.8;
        v49 = false;
        l_Parent_0:SetAttribute("DamageMult", 0.5);
        l_Parent_0:SetAttribute("HealthMult", 0.5);
        l_Parent_0:SetAttribute("FirstMult", 0.9);
    else
        v43 = 0.26;
        l_Parent_0:SetAttribute("DamageMult", 0.8);
        l_Parent_0:SetAttribute("HealthMult", 0.8);
    end;
    local v57 = l_Parent_0:GetAttribute("BabyMode") or false;
    if v57 then
        v43 = 0.32;
        v54 = 0.8;
        v49 = false;
        l_Parent_0:SetAttribute("DamageMult", 0.3);
        l_Parent_0:SetAttribute("HealthMult", 0.3);
    end;
    if not v55 then
        l_Value_0:GetAttributeChangedSignal("MatchKD"):Connect(function() --[[ Line: 192 ]]
            -- upvalues: l_Value_0 (copy), l_Parent_0 (copy)
            if (l_Value_0:GetAttribute("MatchKD") or 0) < 2 then
                return;
            else
                l_Parent_0:SetAttribute("DamageMult", 0.12);
                return;
            end;
        end);
    end;
    local v58 = 0;
    local l_Value_2 = v26.LockedOn.Value;
    local v60 = l_Value_2 and game.Players:GetPlayerFromCharacter(l_Value_2);
    l_Parent_0:SetAttribute("IsBasicSamurai", true);
    local v61 = nil;
    v61 = v28.Cutscene.Changed:Connect(function(v62) --[[ Line: 206 ]]
        -- upvalues: v61 (ref), v28 (copy), v60 (copy), l_Workspace_0 (ref), l_Value_2 (copy), l_CreateEffect_0 (ref), l_Parent_0 (copy), l_Styles_0 (ref)
        if v62 == true then
            return;
        else
            if v61 then
                v61:Disconnect();
            end;
            v28.Cutscene.Value = true;
            v28.CanEmoteAnyways.Value = true;
            if not v60 then
                v28.Cutscene.Value = false;
                return;
            else
                local v63 = l_Workspace_0.States[l_Value_2.Name];
                local _ = v63.PlayerData;
                local l_CharacterData_0 = v63.CharacterData;
                l_CharacterData_0.Stunned.Value = true;
                l_CharacterData_0.Cutscene.Value = true;
                l_CreateEffect_0:FireClient(v60, {
                    "DramaticDialog", 
                    l_Parent_0, 
                    "LEAVE THIS PLACE... OR HE WILL BE SUMMONED.", 
                    Color3.fromRGB(187, 78, 255), 
                    1.5, 
                    0.25, 
                    CFrame.new(0, -0.95, -0.9)
                });
                task.wait(1.6);
                task.defer(function() --[[ Line: 237 ]]
                    -- upvalues: l_Styles_0 (ref), l_Parent_0 (ref)
                    l_Styles_0.VoidSamurai.ServerOnEquip({
                        Character = l_Parent_0
                    });
                end);
                task.wait(2.5);
                l_CharacterData_0.Stunned.Value = false;
                l_CharacterData_0.Cutscene.Value = false;
                v28.Cutscene.Value = false;
                return;
            end;
        end;
    end);
    l_Assets_0.Clothing.Parent = l_Parent_0;
    local v66 = {};
    local v67 = 0;
    l_Parent_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 256 ]]
        -- upvalues: v58 (ref), v47 (ref), l_Parent_0 (copy), v27 (copy), v28 (copy), v60 (copy), l_Workspace_0 (ref), l_Value_2 (copy), l_CreateEffect_0 (ref), l_Styles_0 (ref), l_VoidSamurai_0 (ref), v55 (copy), v43 (ref), v44 (ref), v54 (ref), v49 (ref), v57 (copy), v51 (ref), v48 (ref), v67 (ref), v66 (ref), l_EquipGlovesOnCharacter_0 (ref), l_Assets_0 (copy)
        v58 = v58 + 1;
        v47 = 0;
        l_Parent_0:SetAttribute("IsBasicSamurai", nil);
        if v58 == 1 then
            v27.KnockdownSet.Value = "Mahoraga";
            local v68 = nil;
            v68 = v28.Cutscene.Changed:Connect(function(v69) --[[ Line: 265 ]]
                -- upvalues: v68 (ref), l_Parent_0 (ref), v28 (ref), v60 (ref), l_Workspace_0 (ref), l_Value_2 (ref), l_CreateEffect_0 (ref), l_Styles_0 (ref), l_VoidSamurai_0 (ref)
                if v69 == true then
                    return;
                else
                    if v68 then
                        v68:Disconnect();
                    end;
                    l_Parent_0:SetAttribute("FirstMult", 1);
                    v28.Cutscene.Value = true;
                    v28.CanEmoteAnyways.Value = true;
                    if not v60 then
                        v28.Cutscene.Value = false;
                        return;
                    else
                        local v70 = l_Workspace_0.States[l_Value_2.Name];
                        local _ = v70.PlayerData;
                        local l_CharacterData_1 = v70.CharacterData;
                        l_CharacterData_1.Stunned.Value = true;
                        l_CharacterData_1.Cutscene.Value = true;
                        l_CreateEffect_0:FireClient(v60, {
                            "DramaticDialog", 
                            l_Parent_0, 
                            "TOOK YOU A WHILE TO DEAL WITH MY TRASH.", 
                            Color3.fromRGB(169, 65, 255), 
                            1.5, 
                            0.25, 
                            CFrame.new(0, -1, -0.9)
                        });
                        task.wait(1.5);
                        task.defer(function() --[[ Line: 298 ]]
                            -- upvalues: l_Styles_0 (ref), l_Parent_0 (ref)
                            l_Styles_0.VoidSamurai.ServerOnEquip({
                                Character = l_Parent_0
                            });
                        end);
                        task.wait(5);
                        l_CharacterData_1.Stunned.Value = false;
                        l_CharacterData_1.Cutscene.Value = false;
                        v28.Cutscene.Value = false;
                        if l_Value_2.Name == "TestyTestTe2st" then
                            l_Value_2:SetAttribute("HealthMult", 99999);
                        end;
                        l_VoidSamurai_0.VoidTensho(l_Parent_0);
                        return;
                    end;
                end;
            end);
            if v55 then
                v43 = 0.2;
                v44 = 0.1;
                v54 = 0.5;
                v49 = true;
                l_Parent_0:SetAttribute("DamageMult", 1.1);
                l_Parent_0:SetAttribute("HealthMult", 1.1);
            else
                v43 = 0.26;
                l_Parent_0:SetAttribute("DamageMult", 0.45);
                l_Parent_0:SetAttribute("HealthMult", 0.65);
            end;
            if v57 then
                v43 = 0.3;
                v54 = 0.8;
                v49 = true;
                l_Parent_0:SetAttribute("DamageMult", 0.4);
                l_Parent_0:SetAttribute("HealthMult", 0.4);
            end;
            v51 = 8;
            v48 = true;
            v49 = true;
            v67 = 0.022727272727272728;
            v66 = {
                "VoidTensho", 
                "VoidSlice"
            };
            return;
        elseif v58 == 2 then
            v27.KnockdownSet.Value = "Mahoraga";
            local v73 = {
                Name = "Corruption", 
                Unusual = "Spectral"
            };
            l_EquipGlovesOnCharacter_0:Fire(l_Parent_0, {
                v73, 
                v73
            });
            v67 = 0.08333333333333333;
            v66 = {
                "VoidTensho", 
                "VoidSlice", 
                "VoidMeteor"
            };
            local v74 = nil;
            v74 = v28.Cutscene.Changed:Connect(function(v75) --[[ Line: 354 ]]
                -- upvalues: v74 (ref), v28 (ref), v60 (ref), l_Workspace_0 (ref), l_Value_2 (ref), l_CreateEffect_0 (ref), l_Parent_0 (ref), l_VoidSamurai_0 (ref)
                if v75 == true then
                    return;
                else
                    if v74 then
                        v74:Disconnect();
                    end;
                    v28.Cutscene.Value = true;
                    v28.CanEmoteAnyways.Value = true;
                    if not v60 then
                        v28.Cutscene.Value = false;
                        return;
                    else
                        local v76 = l_Workspace_0.States[l_Value_2.Name];
                        local _ = v76.PlayerData;
                        local l_CharacterData_2 = v76.CharacterData;
                        l_CharacterData_2.Stunned.Value = true;
                        l_CharacterData_2.Cutscene.Value = true;
                        task.wait(2.5);
                        l_CreateEffect_0:FireClient(v60, {
                            "DramaticDialog", 
                            l_Parent_0, 
                            "I MADE A DEAL WITH THE VOID.", 
                            Color3.fromRGB(255, 55, 58), 
                            2, 
                            0.25, 
                            CFrame.new(0, -0.5, -1), 
                            true
                        });
                        task.wait(3.25);
                        l_CharacterData_2.Stunned.Value = false;
                        l_CharacterData_2.Cutscene.Value = false;
                        v28.Cutscene.Value = false;
                        l_VoidSamurai_0.VoidMeteor(l_Parent_0);
                        return;
                    end;
                end;
            end);
            task.wait(5.2);
            l_CreateEffect_0:FireClient(v60, {
                "DramaticDialog", 
                l_Parent_0, 
                "YOU LEAVE ME NO CHOICE...", 
                Color3.fromRGB(81, 0, 255), 
                2, 
                0.25, 
                CFrame.new(0, -0.5, -1)
            });
            task.wait(1.8);
            l_CreateEffect_0:FireClient(v60, {
                "Entrance", 
                l_Parent_0, 
                l_Parent_0.PrimaryPart, 
                true, 
                "VoidDemon"
            });
            task.wait(0.5);
            for _, v80 in l_Parent_0:GetChildren() do
                if v80:IsA("BasePart") and v80.Name ~= "HumanoidRootPart" then
                    for _, v82 in l_Assets_0.Aura:GetChildren() do
                        v82:Clone().Parent = v80;
                    end;
                end;
            end;
            return;
        else
            task.wait(2.2);
            l_CreateEffect_0:FireClient(v60, {
                "DramaticDialog", 
                l_Parent_0, 
                "ONE DAY, YOU'LL MAKE THE SAME DEAL...", 
                Color3.fromRGB(164, 52, 255), 
                2.5, 
                0.2, 
                CFrame.new(0, -1, 0)
            });
            return;
        end;
    end);
    local l_Parent_1 = v28.Centre.Value.Parent.Parent;
    local v84 = RaycastParams.new();
    v84.FilterType = Enum.RaycastFilterType.Include;
    v84.FilterDescendantsInstances = {
        l_Parent_1
    };
    local v85 = false;
    while task.wait() and l_Parent_0:IsDescendantOf(game) and l_Value_0:IsDescendantOf(game) do
        if l_Parent_0.PrimaryPart and l_Value_0.PrimaryPart and not v27.Disable.Value then
            local l_Magnitude_0 = (l_Parent_0.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
            if v12:NextNumber(0, 1) < v67 and not v85 then
                v85 = true;
                task.delay(5, function() --[[ Line: 468 ]]
                    -- upvalues: v85 (ref)
                    v85 = false;
                end);
                if l_Magnitude_0 < 8 then
                    v30:TryDash({
                        Direction = "Backward"
                    });
                    task.wait(0.25);
                end;
                l_VoidSamurai_0[v66[math.random(1, #v66)]](l_Parent_0);
            end;
            if l_Value_1 == "Takamura" and l_Value_0:GetAttribute("Charging") then
                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 1, 0)));
                if l_Magnitude_0 < 5 then
                    v30:TryAttack({});
                end;
            elseif v46 > 8 and l_Magnitude_0 < 4.5 and l_Value_0:GetAttribute("Punching") then
                l_Parent_0:SetAttribute("ServerPerfect", true);
                local v87 = l_Value_0:GetAttribute("LandTime") - workspace:GetServerTimeNow();
                local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("AttackingHand");
                task.wait(v87 - 0.11666666666666667);
                v30:TryDash({
                    Direction = l_l_Value_0_Attribute_0 == "RightHand" and "Left" or "Right"
                });
                if l_Value_0:GetAttribute("SlowMo") then
                    while v28.Stunned.Value do
                        task.wait();
                    end;
                    if v58 >= 2 and v28.UltimateEnergy.Value == 100 then
                        v30:TryAttack({
                            IsUltimate = true
                        });
                    else
                        local v89 = nil;
                        if v12:NextNumber(0, 1) < 0.15 then
                            local v90 = true;
                            repeat
                                v89 = v30:TryAttack({
                                    IsHeavy = v90, 
                                    TryFeint = l_Value_0
                                });
                                if v90 and v12:NextNumber(0, 1) < 0.8 then
                                    v90 = false;
                                end;
                                task.wait();
                                local l_Value_3 = v28.Stamina.Value;
                                local _ = l_Styles_0[v27.Style.Value];
                                local l_Style_1 = v27:FindFirstChild("Style");
                                local v94 = l_Styles_0[l_Style_1.Value].Combos[l_CombatController_0.CurrentCombo];
                                local v95 = v94[l_CombatController_0.CurrentPunch];
                                local v96 = v94.DefaultPunchInfo or l_Styles_0[l_Style_1.Value].DefaultPunchInfo;
                            until l_Value_3 <= (v95.Stamina or v96.Stamina) or l_Magnitude_0 > 6 or v28.Stunned.Value or v89 == "Missed";
                        else
                            repeat
                                local l_Value_4 = l_v24_FirstChild_0.CharacterData.BlockEnergy.Value;
                                local v98 = l_Styles_0[v27.Style.Value];
                                local l_Style_2 = v27:FindFirstChild("Style");
                                local v100 = l_Styles_0[l_Style_2.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                local l_HeavyAttacks_0 = l_Styles_0[l_Style_2.Value].HeavyAttacks;
                                v100 = l_HeavyAttacks_0[l_CombatController_0.CurrentHeavy];
                                local v102 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_2.Value].DefaultPunchInfo;
                                v89 = v30:TryAttack({
                                    IsHeavy = l_Value_4 < (v100.Damage or v102.Damage) * v12:NextNumber(0.7, 2.5), 
                                    TryFeint = l_Value_0
                                });
                                task.wait();
                                l_Value_4 = v28.Stamina.Value;
                                local _ = l_Styles_0[v27.Style.Value];
                                v98 = v27:FindFirstChild("Style");
                                local v104 = l_Styles_0[v98.Value].Combos[l_CombatController_0.CurrentCombo];
                                l_HeavyAttacks_0 = v104[l_CombatController_0.CurrentPunch];
                                v100 = v104.DefaultPunchInfo or l_Styles_0[v98.Value].DefaultPunchInfo;
                            until l_Value_4 <= (l_HeavyAttacks_0.Stamina or v100.Stamina) or l_Magnitude_0 > 6 or v28.Stunned.Value or v89 == "Missed";
                        end;
                    end;
                    v46 = 0;
                end;
            else
                if l_Value_0:GetAttribute("Punching") and l_Magnitude_0 < 6 or v28.Stunned.Value then
                    if not v28.Stunned.Value and l_Value_0:GetAttribute("Punching") then
                        local v105 = l_Value_0:GetAttribute("LandTime") - workspace:GetServerTimeNow();
                        local _ = l_Value_0:GetAttribute("AttackingHand");
                        task.wait(v105 - 0.11666666666666667);
                        local l_v54_0 = v54;
                        if v56 then
                            l_v54_0 = 0.85;
                        elseif v57 then
                            l_v54_0 = 1;
                        end;
                        if l_v54_0 < v12:NextNumber(0, 1) then
                            v30:TryDash({
                                Direction = if v12:NextNumber(0, 1) > 0.5 then v12:NextNumber(0, 1) > 0.5 and "Left" or "Right" else "Backward"
                            });
                            continue;
                        else
                            continue;
                        end;
                    elseif v28.BlockEnergy.Value > 10 then
                        if v30:TryBlock() then
                            repeat
                                task.wait();
                            until v28.BlockEnergy.Value < 12 or not v28.Stunned.Value;
                            v30:Unblock();
                            continue;
                        else
                            v30:Unblock();
                        end;
                    end;
                end;
                if v28.Stamina.Value < v28.MaxStamina.Value * 0.25 or v50 then
                    if v49 and l_Magnitude_0 < 5 and v28.Stamina.Value > v28.MaxStamina.Value * 0.4 then
                        local v108 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.LookVector * -5, v84);
                        if v12:NextNumber(0, 1) > v54 + 0.1 and not v108 then
                            v30:TryDash({
                                Direction = "Backward"
                            });
                        else
                            local v109 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v84) or {
                                Distance = 5000
                            };
                            local v110 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v84) or {
                                Distance = 5000
                            };
                            if v109.Distance > v110.Distance then
                                v30:TryDash({
                                    Direction = "Right"
                                });
                            else
                                v30:TryDash({
                                    Direction = "Left"
                                });
                            end;
                        end;
                    elseif l_Magnitude_0 < v51 then
                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 1, 0)));
                    else
                        local v111 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v84) or {
                            Distance = 5000
                        };
                        local v112 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v84) or {
                            Distance = 5000
                        };
                        if v111.Distance > v112.Distance then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 0, 0)));
                        else
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, 0, 0)));
                        end;
                    end;
                else
                    local v113 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 8, v84);
                    local v114 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -8, v84);
                    if v113 then
                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, -1, 0)));
                    elseif v114 then
                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, -1, 0)));
                    else
                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                    end;
                    local v115 = l_Styles_0[v27.Style.Value];
                    local l_Style_3 = v27:FindFirstChild("Style");
                    local v117 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo];
                    local v118 = v117[l_CombatController_0.CurrentPunch];
                    local v119 = v117.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                    local v120 = v118.HitboxSize or v119.HitboxSize or l_Styles_0[v27.Style.Value].HitboxInfo.Size;
                    if l_Magnitude_0 < v120.Z + v12:NextNumber(0.5, 1.25) then
                        v115 = nil;
                        if v12:NextNumber(0, 1) < 0.3 then
                            local v121 = true;
                            repeat
                                v115 = v30:TryAttack({
                                    IsHeavy = v121, 
                                    TryFeint = v121 and l_Value_0
                                });
                                v121 = v12:NextNumber(0, 1) < 0.5;
                                task.wait();
                                v117 = v28.Stamina.Value;
                                v119 = l_Styles_0[v27.Style.Value];
                                local l_Style_4 = v27:FindFirstChild("Style");
                                local v123 = l_Styles_0[l_Style_4.Value].Combos[l_CombatController_0.CurrentCombo];
                                local v124 = v123[l_CombatController_0.CurrentPunch];
                                local v125 = v123.DefaultPunchInfo or l_Styles_0[l_Style_4.Value].DefaultPunchInfo;
                            until v117 <= (v124.Stamina or v125.Stamina) or l_Magnitude_0 > 6 or v28.Stunned.Value or v115 == "Missed";
                        else
                            repeat
                                v117 = l_v24_FirstChild_0.CharacterData.BlockEnergy.Value;
                                v119 = l_Styles_0[v27.Style.Value];
                                local l_Style_5 = v27:FindFirstChild("Style");
                                local v127 = l_Styles_0[l_Style_5.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                local l_HeavyAttacks_1 = l_Styles_0[l_Style_5.Value].HeavyAttacks;
                                v127 = l_HeavyAttacks_1[l_CombatController_0.CurrentHeavy];
                                local v129 = l_HeavyAttacks_1.DefaultPunchInfo or l_Styles_0[l_Style_5.Value].DefaultPunchInfo;
                                local v130 = v117 < (v127.Damage or v129.Damage);
                                if v58 >= 2 and v130 and v28.UltimateEnergy.Value == 100 and v12:NextNumber(0, 1) < 0.2 then
                                    v30:TryAttack({
                                        IsUltimate = true
                                    });
                                else
                                    v115 = v30:TryAttack({
                                        IsHeavy = v130
                                    });
                                end;
                                task.wait();
                                v117 = v28.Stamina.Value;
                                v119 = l_Styles_0[v27.Style.Value];
                                l_Style_5 = v27:FindFirstChild("Style");
                                l_HeavyAttacks_1 = l_Styles_0[l_Style_5.Value].Combos[l_CombatController_0.CurrentCombo];
                                v127 = l_HeavyAttacks_1[l_CombatController_0.CurrentPunch];
                                v129 = l_HeavyAttacks_1.DefaultPunchInfo or l_Styles_0[l_Style_5.Value].DefaultPunchInfo;
                            until v117 <= (v127.Stamina or v129.Stamina) or l_Magnitude_0 > 6 or v28.Stunned.Value or v115 == "Missed";
                        end;
                        if v115 == "Missed" then
                            if v28.Stamina.Value > v28.MaxStamina.Value * 0.3 and l_Value_1 ~= "Bullet" and v120.Z + 5 < l_Magnitude_0 then
                                v30:TryDash({
                                    Direction = "Forward"
                                });
                            end;
                        elseif v28.Stamina.Value < v28.MaxStamina.Value * 0.4 then
                            v50 = true;
                            task.delay(v12:NextNumber(0, 0.5), function() --[[ Line: 705 ]]
                                -- upvalues: v50 (ref)
                                v50 = false;
                            end);
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
return v13;