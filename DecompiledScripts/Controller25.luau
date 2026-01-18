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
        Name = "Pantera"
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
    l_Parent_0:SetAttribute("DragonTitle", "YOU'LL REGRET THAT");
    l_Parent_0:SetAttribute("DragonSpecialTitle", "RAIDEN, THE SHADOW");
    l_Parent_0:SetAttribute("DragonShirtTemplate", l_Assets_0.Shirt2.ShirtTemplate);
    l_Parent_0:SetAttribute("EventRemoveShirt", true);
    l_Parent_0:SetAttribute("Yakuza", true);
    l_Parent_0:SetAttribute("Raiden", true);
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
    local _ = function(v35, v36) --[[ Line: 108 ]] --[[ Name: GetPunchInfo ]]
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
    local v45 = v43 and 0.21 or 0.27;
    local function _() --[[ Line: 135 ]] --[[ Name: GetReactionTime ]]
        -- upvalues: v45 (ref), v12 (ref)
        return (math.clamp(v45 + v12:NextNumber(0, 0.1), 0.125, 0.35));
    end;
    local v47 = 0;
    local v48 = v43 and 16 or 36;
    local l_v43_0 = v43;
    local l_v43_1 = v43;
    local v51 = not v43;
    local v52 = false;
    local v53 = not v43;
    local v54 = 6;
    local v55 = 0.25;
    local v56 = 0.6;
    local v57 = true;
    if v43 then
        l_Parent_0:SetAttribute("DamageMult", 1.1);
        l_Parent_0:SetAttribute("HealthMult", 1.1);
    elseif v44 then
        l_Parent_0:SetAttribute("DamageMult", 0.4);
        l_Parent_0:SetAttribute("HealthMult", 0.6);
        l_Parent_0:SetAttribute("FirstMult", 0.85);
        v57 = false;
    else
        l_Parent_0:SetAttribute("DamageMult", 1);
        l_Parent_0:SetAttribute("HealthMult", 1);
    end;
    l_Value_0:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 170 ]]
        -- upvalues: v47 (ref)
        v47 = v47 + 1;
    end);
    local v58 = 0;
    local v59 = {};
    local v60 = 20;
    if v43 then
        v60 = 10;
    end;
    local v61 = false;
    local v62 = 0;
    local l_Value_2 = v26.LockedOn.Value;
    local v64 = l_Value_2 and game.Players:GetPlayerFromCharacter(l_Value_2);
    local v65 = nil;
    v65 = v28.Cutscene.Changed:Connect(function(v66) --[[ Line: 190 ]]
        -- upvalues: v65 (ref), v28 (copy), v64 (copy), l_Workspace_0 (ref), l_Value_2 (copy), l_CreateEffect_0 (ref), l_Parent_0 (copy)
        if v66 == true then
            return;
        else
            if v65 then
                v65:Disconnect();
            end;
            v28.Cutscene.Value = true;
            v28.CanEmoteAnyways.Value = true;
            if not v64 then
                v28.Cutscene.Value = false;
                return;
            else
                local v67 = l_Workspace_0.States[l_Value_2.Name];
                local _ = v67.PlayerData;
                local l_CharacterData_0 = v67.CharacterData;
                l_CharacterData_0.Stunned.Value = true;
                l_CharacterData_0.Cutscene.Value = true;
                task.wait(1);
                l_CreateEffect_0:FireClient(v64, {
                    "DramaticDialog", 
                    l_Parent_0, 
                    "I WON'T LET YOU HAVE THAT TOKEN.", 
                    Color3.fromRGB(49, 155, 255), 
                    2, 
                    0.25, 
                    CFrame.new(0, -1, -1)
                });
                task.wait(2);
                l_CharacterData_0.Stunned.Value = false;
                l_CharacterData_0.Cutscene.Value = false;
                v28.Cutscene.Value = false;
                return;
            end;
        end;
    end);
    l_Parent_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 228 ]]
        -- upvalues: v62 (ref), v48 (ref), v43 (copy), v45 (ref), v27 (copy), l_Parent_0 (copy), v28 (copy), v64 (copy), l_Workspace_0 (ref), l_Value_2 (copy), l_CreateEffect_0 (ref), v53 (ref), v54 (ref), l_v43_0 (ref), l_v43_1 (ref), l_Assets_0 (copy), v44 (copy), l_EquipGlovesOnCharacter_0 (ref), v55 (ref), v56 (ref), v51 (ref), l_Styles_0 (ref), l_VoidSamurai_0 (ref), v61 (ref), v60 (ref), v58 (ref), v59 (ref)
        v62 = v62 + 1;
        if v62 == 1 then
            v48 = v43 and 12 or 24;
            v45 = v43 and 0.2 or 0.26;
            v27.KnockdownSet.Value = "Default";
            l_Parent_0.ExtraHair1.Handle.Transparency = 1;
            l_Parent_0.HairDown2.Handle.Transparency = 0;
            local v70 = nil;
            v70 = v28.Cutscene.Changed:Connect(function(v71) --[[ Line: 241 ]]
                -- upvalues: v70 (ref), v28 (ref), v64 (ref), l_Workspace_0 (ref), l_Value_2 (ref), l_CreateEffect_0 (ref), l_Parent_0 (ref)
                if v71 == true then
                    return;
                else
                    if v70 then
                        v70:Disconnect();
                    end;
                    v28.Cutscene.Value = true;
                    v28.CanEmoteAnyways.Value = true;
                    if not v64 then
                        v28.Cutscene.Value = false;
                        return;
                    else
                        local v72 = l_Workspace_0.States[l_Value_2.Name];
                        local _ = v72.PlayerData;
                        local l_CharacterData_1 = v72.CharacterData;
                        l_CharacterData_1.Stunned.Value = true;
                        l_CharacterData_1.Cutscene.Value = true;
                        task.wait(0.25);
                        l_CreateEffect_0:FireClient(v64, {
                            "UseEmote", 
                            l_Parent_0, 
                            "Dragon"
                        });
                        task.wait(1.5);
                        l_CreateEffect_0:FireClient(v64, {
                            "DramaticDialog", 
                            l_Parent_0, 
                            "IS THAT ALL YOU'VE GOT?", 
                            Color3.fromRGB(114, 206, 255), 
                            2, 
                            0.25, 
                            CFrame.new(0, -1.35, -0.9)
                        });
                        task.wait(3);
                        l_CharacterData_1.Stunned.Value = false;
                        l_CharacterData_1.Cutscene.Value = false;
                        v28.Cutscene.Value = false;
                        return;
                    end;
                end;
            end);
            v53 = false;
            v54 = 8;
            l_v43_0 = true;
            l_v43_1 = true;
            return;
        elseif v62 == 2 then
            v27.Style.Value = "VoidSamurai";
            v27.KnockdownSet.Value = "Barbarian";
            v48 = v43 and 8 or 12;
            v45 = v43 and 0.2 or 0.24;
            for _, v76 in l_Parent_0:GetDescendants() do
                if v76:IsA("Shirt") then
                    v76:Destroy();
                end;
            end;
            l_Assets_0.Shirt3.Parent = l_Parent_0;
            l_Parent_0:SetAttribute("DamageMult", 1.2);
            l_Parent_0:SetAttribute("HealthMult", 1);
            if v44 then
                l_Parent_0:SetAttribute("DamageMult", 0.4);
                l_Parent_0:SetAttribute("HealthMult", 0.7);
                l_Parent_0:SetAttribute("FirstMult", 0.9);
            end;
            local v77 = {
                Name = "Pantera", 
                Unusual = "Crows"
            };
            l_EquipGlovesOnCharacter_0:Fire(l_Parent_0, {
                v77, 
                v77
            });
            v55 = 0.1;
            v56 = 0.3;
            v51 = false;
            local v78 = nil;
            v78 = v28.Cutscene.Changed:Connect(function(v79) --[[ Line: 323 ]]
                -- upvalues: v78 (ref), v28 (ref), v64 (ref), l_Workspace_0 (ref), l_Value_2 (ref), l_Parent_0 (ref), l_Styles_0 (ref), l_VoidSamurai_0 (ref), v61 (ref), v60 (ref), v58 (ref), v59 (ref)
                if v79 == true then
                    return;
                else
                    if v78 then
                        v78:Disconnect();
                    end;
                    v28.Cutscene.Value = true;
                    v28.CanEmoteAnyways.Value = true;
                    if not v64 then
                        v28.Cutscene.Value = false;
                        return;
                    else
                        local v80 = l_Workspace_0.States[l_Value_2.Name];
                        local _ = v80.PlayerData;
                        local l_CharacterData_2 = v80.CharacterData;
                        l_CharacterData_2.Stunned.Value = true;
                        l_CharacterData_2.Cutscene.Value = true;
                        l_Parent_0.ExtraHair1.Handle.Transparency = 1;
                        l_Parent_0.HairDown2.Handle.Transparency = 1;
                        l_Parent_0.Face1.Handle.Transparency = 1;
                        l_Parent_0.LongHair3.Handle.Transparency = 0;
                        l_Parent_0.Emo3.Handle.Transparency = 0;
                        l_Parent_0.Face3:SetAttribute("VISIBLE", true);
                        task.defer(function() --[[ Line: 351 ]]
                            -- upvalues: l_Styles_0 (ref), l_Parent_0 (ref)
                            l_Styles_0.VoidSamurai.ServerOnEquip({
                                Character = l_Parent_0
                            });
                        end);
                        task.wait(5);
                        l_CharacterData_2.Stunned.Value = false;
                        l_CharacterData_2.Cutscene.Value = false;
                        v28.Cutscene.Value = false;
                        l_VoidSamurai_0.VoidSlice(l_Parent_0);
                        v61 = true;
                        task.delay(v60, function() --[[ Line: 366 ]]
                            -- upvalues: v61 (ref)
                            v61 = false;
                        end);
                        v58 = 0.016666666666666666;
                        v59 = {
                            "VoidSlice"
                        };
                        return;
                    end;
                end;
            end);
            task.wait(5);
            l_CreateEffect_0:FireClient(v64, {
                "DramaticDialog", 
                l_Parent_0, 
                "VOID... GRANT ME YOUR POWER!", 
                Color3.fromRGB(255, 60, 60), 
                2, 
                0.25, 
                CFrame.new(0, -0.5, -1)
            });
            task.wait(0.5);
            for _, v84 in l_Parent_0:GetChildren() do
                if v84:IsA("BasePart") and v84.Name ~= "HumanoidRootPart" then
                    for _, v86 in l_Assets_0.Aura:GetChildren() do
                        v86:Clone().Parent = v84;
                    end;
                end;
            end;
            return;
        else
            task.wait(1.8);
            l_CreateEffect_0:FireClient(v64, {
                "DramaticDialog", 
                l_Parent_0, 
                "THE TOKEN... ISN'T... WITH ME... HEH...", 
                Color3.fromRGB(52, 66, 157), 
                2.5, 
                0.2, 
                CFrame.new(0, 0, 0)
            });
            return;
        end;
    end);
    local l_Parent_1 = v28.Centre.Value.Parent.Parent;
    local v88 = RaycastParams.new();
    v88.FilterType = Enum.RaycastFilterType.Include;
    v88.FilterDescendantsInstances = {
        l_Parent_1
    };
    while task.wait() and l_Parent_0:IsDescendantOf(game) and l_Value_0:IsDescendantOf(game) do
        if l_Parent_0.PrimaryPart and l_Value_0.PrimaryPart then
            local l_Magnitude_0 = (l_Parent_0.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
            if v12:NextNumber(0, 1) < v58 and not v61 then
                v61 = true;
                task.delay(v60, function() --[[ Line: 429 ]]
                    -- upvalues: v61 (ref)
                    v61 = false;
                end);
                if l_Magnitude_0 < 8 then
                    v30:TryDash({
                        Direction = "Backward"
                    });
                    task.wait(0.25);
                end;
                l_VoidSamurai_0[v59[math.random(1, #v59)]](l_Parent_0);
            end;
            if v48 < v47 and l_Magnitude_0 < 4.5 and l_Value_0:GetAttribute("Punching") and (l_Value_0:GetAttribute("IsHeavy") or v43) then
                l_Parent_0:SetAttribute("ServerPerfect", true);
                local v90 = l_Value_0:GetAttribute("LandTime") - workspace:GetServerTimeNow();
                local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("AttackingHand");
                task.wait(v90 - 0.11666666666666667);
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
                    if v51 and l_Value_0:GetAttribute("Punching") and l_Value_0:GetAttribute("IsUltimate") then
                        v30:Unblock();
                        continue;
                    else
                        if v53 and v12:NextNumber(0, 1) < 0.5 then
                            task.wait(1.2);
                        else
                            task.wait((math.clamp(v45 + v12:NextNumber(0, 0.1), 0.125, 0.35)));
                        end;
                        if not v28.Stunned.Value and l_Value_0:GetAttribute("Punching") and l_v43_0 and v12:NextNumber(0, 1) > 0.5 then
                            v30:TryDash({
                                Direction = v12:NextNumber(0, 1) > 0.5 and "Left" or "Right"
                            });
                        end;
                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, 1, 0)));
                        if v30:TryBlock() then
                            local v92 = v43 and 12 or v12:NextNumber(4, 10);
                            repeat
                                task.wait();
                            until v28.BlockEnergy.Value < v92 or not v28.Stunned.Value or v51 and l_Value_0:GetAttribute("IsUltimate");
                            v30:Unblock();
                        else
                            v30:Unblock();
                        end;
                        task.wait(math.clamp(v45 + v12:NextNumber(0, 0.1), 0.125, 0.35) / 2);
                    end;
                end;
                if v28.Stamina.Value < v28.MaxStamina.Value * 0.4 or v52 then
                    if l_v43_1 and l_Magnitude_0 < 5 and v28.Stamina.Value > v28.MaxStamina.Value * v55 then
                        local v93 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.LookVector * -5, v88);
                        if v12:NextNumber(0, 1) > 0.5 and not v93 then
                            v30:TryDash({
                                Direction = "Backward"
                            });
                        else
                            local v94 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v88) or {
                                Distance = 5000
                            };
                            local v95 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v88) or {
                                Distance = 5000
                            };
                            if v94.Distance > v95.Distance then
                                v30:TryDash({
                                    Direction = "Right"
                                });
                            else
                                v30:TryDash({
                                    Direction = "Left"
                                });
                            end;
                        end;
                    elseif l_Magnitude_0 < v54 then
                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, 1, 0)));
                    else
                        local v96 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v88) or {
                            Distance = 5000
                        };
                        local v97 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v88) or {
                            Distance = 5000
                        };
                        if v96.Distance > v97.Distance then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 0, 0)));
                        else
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, 0, 0)));
                        end;
                    end;
                else
                    l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                    local v98 = l_Styles_0[v27.Style.Value];
                    local l_Style_1 = v27:FindFirstChild("Style");
                    local v100 = l_Styles_0[l_Style_1.Value].Combos[l_CombatController_0.CurrentCombo];
                    local v101 = v100[l_CombatController_0.CurrentPunch];
                    local v102 = v100.DefaultPunchInfo or l_Styles_0[l_Style_1.Value].DefaultPunchInfo;
                    if l_Magnitude_0 < (v101.HitboxSize or v102.HitboxSize or l_Styles_0[v27.Style.Value].HitboxInfo.Size).Z + v12:NextNumber(0.5, 1.5) then
                        v98 = nil;
                        l_Style_1 = v12:NextNumber(0, 1) < 0.5;
                        if not v57 then
                            l_v24_FirstChild_0.CharacterData.Cutscene.Value = true;
                            task.delay(1, function() --[[ Line: 565 ]]
                                -- upvalues: l_v24_FirstChild_0 (copy)
                                l_v24_FirstChild_0.CharacterData.Cutscene.Value = false;
                            end);
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, 0, 0)));
                            local v103 = l_Value_0 and game.Players:GetPlayerFromCharacter(l_Value_0);
                            v103:SetAttribute("ShowDashTutorial", true);
                            l_CreateEffect_0:FireClient(v103, {
                                "DodgeTutorial", 
                                l_Parent_0
                            });
                            repeat
                                task.wait();
                                l_v24_FirstChild_0.CharacterData.Stunned.Value = true;
                                l_Value_0:SetAttribute("FreeDash", true);
                            until l_Value_0:GetAttribute("DashInvulnerable");
                            v103:SetAttribute("ShowDashTutorial", nil);
                            l_v24_FirstChild_0.CharacterData.Stunned.Value = false;
                            task.wait(1);
                            v57 = true;
                        end;
                        if l_Style_1 then
                            local v104 = true;
                            repeat
                                v98 = v30:TryAttack({
                                    IsHeavy = v104
                                });
                                if v104 and v12:NextNumber(0, 1) < 0.8 then
                                    v104 = false;
                                end;
                                task.wait();
                                v100 = v28.Stamina.Value;
                                v102 = l_Styles_0[v27.Style.Value];
                                local l_Style_2 = v27:FindFirstChild("Style");
                                local v106 = l_Styles_0[l_Style_2.Value].Combos[l_CombatController_0.CurrentCombo];
                                local v107 = v106[l_CombatController_0.CurrentPunch];
                                local v108 = v106.DefaultPunchInfo or l_Styles_0[l_Style_2.Value].DefaultPunchInfo;
                            until v100 <= (v107.Stamina or v108.Stamina) or l_Magnitude_0 > 8 or v28.Stunned.Value or v98 == "Missed";
                        else
                            repeat
                                v100 = l_v24_FirstChild_0.CharacterData.BlockEnergy.Value;
                                local v109 = l_Styles_0[v27.Style.Value];
                                local l_Style_3 = v27:FindFirstChild("Style");
                                local v111 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                local l_HeavyAttacks_0 = l_Styles_0[l_Style_3.Value].HeavyAttacks;
                                v111 = l_HeavyAttacks_0[l_CombatController_0.CurrentHeavy];
                                local v113 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                                local v114 = v100 < (v111.Damage or v113.Damage) * v12:NextNumber(0.7, 2.5);
                                v100 = workspace:GetServerTimeNow();
                                v98 = v30:TryAttack({
                                    IsHeavy = v114
                                });
                                task.wait();
                                v101 = v28.Stamina.Value;
                                v109 = l_Styles_0[v27.Style.Value];
                                l_Style_3 = v27:FindFirstChild("Style");
                                l_HeavyAttacks_0 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo];
                                v111 = l_HeavyAttacks_0[l_CombatController_0.CurrentPunch];
                                v113 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                            until v101 <= (v111.Stamina or v113.Stamina) or l_Magnitude_0 > 8 or v28.Stunned.Value or v98 == "Missed";
                        end;
                        if v98 == "Missed" then
                            if v28.Stamina.Value > v28.MaxStamina.Value * v56 then
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
                            v52 = true;
                            task.delay(v12:NextNumber(1, 3), function() --[[ Line: 636 ]]
                                -- upvalues: v52 (ref)
                                v52 = false;
                            end);
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
return v13;