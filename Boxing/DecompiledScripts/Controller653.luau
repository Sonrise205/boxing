local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_Workspace_0 = game:GetService("Workspace");
local l_EquipGlovesOnCharacter_0 = l_ServerScriptService_0:WaitForChild("Events"):WaitForChild("EquipGlovesOnCharacter");
local v5 = l_ServerScriptService_0:WaitForChild("Combat", 10);
local v6 = require(v5:WaitForChild("NPC", 10));
local l_CreateEffect_0 = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents"):WaitForChild("CreateEffect");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local v10 = Random.new();
local v11 = {};
local l_VoidSamurai_0 = require(v5:WaitForChild("Abilities"):WaitForChild("VoidSamurai"));
v11.Init = function() --[[ Line: 24 ]] --[[ Name: Init ]]
    -- upvalues: l_ServerStorage_0 (copy), l_EquipGlovesOnCharacter_0 (copy), l_Workspace_0 (copy), v6 (copy), l_Styles_0 (copy), v10 (copy), l_CreateEffect_0 (copy), l_VoidSamurai_0 (copy)
    local l_Parent_0 = script.Parent;
    local l_Assets_0 = script.Assets;
    l_Assets_0.Parent = l_ServerStorage_0;
    l_Assets_0.Name = l_Parent_0.Name;
    local v15 = {
        Name = "Berserk"
    };
    l_EquipGlovesOnCharacter_0:Fire(l_Parent_0, {
        v15, 
        v15
    });
    local v16 = l_Workspace_0:WaitForChild("States", 20);
    local v17 = v16:WaitForChild(l_Parent_0.Name, 20);
    local v18 = v17:WaitForChild("Occupied", 20);
    local v19 = v17:WaitForChild("PlayerData", 20);
    local v20 = v17:WaitForChild("CharacterData", 20);
    local _ = l_Parent_0:WaitForChild("Humanoid", 20);
    l_Parent_0:SetAttribute("DragonTitle", "NO MORE GAMES");
    l_Parent_0:SetAttribute("DragonSpecialTitle", "RAVEN, THE HEARTLESS");
    l_Parent_0:SetAttribute("DragonShirtTemplate", l_Assets_0.Shirt3.ShirtTemplate);
    l_Parent_0:SetAttribute("Yakuza", true);
    l_Parent_0:SetAttribute("Raven", true);
    local v22 = v6.New({
        Character = l_Parent_0
    });
    while not v20.Opponent.Value do
        task.wait();
    end;
    local l_Value_0 = v20.Opponent.Value;
    while not v16:FindFirstChild(l_Value_0.Name) do
        task.wait();
    end;
    local l_v16_FirstChild_0 = v16:FindFirstChild(l_Value_0.Name);
    local l_PlayerFromCharacter_0 = game.Players:GetPlayerFromCharacter(l_Value_0);
    local l_Value_1 = l_v16_FirstChild_0.PlayerData.Style.Value;
    local l_CombatController_0 = v22.CombatController;
    local _ = function(v28, v29) --[[ Line: 69 ]] --[[ Name: GetPunchInfo ]]
        -- upvalues: l_Styles_0 (ref), v19 (copy), l_CombatController_0 (copy)
        local _ = l_Styles_0[v19.Style.Value];
        local l_Style_0 = v19:FindFirstChild("Style");
        local v32 = l_Styles_0[l_Style_0.Value].Combos[l_CombatController_0.CurrentCombo];
        local v33 = v32[l_CombatController_0.CurrentPunch];
        if v29 == "IsHeavy" then
            v32 = l_Styles_0[l_Style_0.Value].HeavyAttacks;
            v33 = v32[l_CombatController_0.CurrentHeavy];
        elseif v29 == "IsUltimate" then
            v32 = l_Styles_0[l_Style_0.Value].UltimateInfo;
            v33 = v32[1];
        end;
        local v34 = v32.DefaultPunchInfo or l_Styles_0[l_Style_0.Value].DefaultPunchInfo;
        return v33[v28] or v34[v28];
    end;
    local v36 = 0.25;
    local function _() --[[ Line: 92 ]] --[[ Name: GetReactionTime ]]
        -- upvalues: v36 (ref), v10 (ref)
        return (math.clamp(v36 + v10:NextNumber(0, 0.1), 0.125, 0.3));
    end;
    local v38 = l_Parent_0:GetAttribute("HardMode") or false;
    local v39 = l_Parent_0:GetAttribute("EasyMode") or false;
    local v40 = 0;
    local v41 = v38 and 10 or 28;
    local v42 = true;
    local v43 = false;
    local v44 = false;
    local v45 = os.clock();
    local v46 = false;
    local v47 = false;
    local v48 = false;
    local v49 = {
        "PointUp", 
        "WarmUp", 
        "ComeOn", 
        "Facepalm", 
        "HitMe", 
        "WindUp", 
        "Heart"
    };
    l_Value_0:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 120 ]]
        -- upvalues: v40 (ref)
        v40 = v40 + 1;
    end);
    if v38 then
        l_Parent_0:SetAttribute("DamageMult", 1.1);
        l_Parent_0:SetAttribute("HealthMult", 1.2);
    elseif v39 then
        l_Parent_0:SetAttribute("DamageMult", 0.3);
        l_Parent_0:SetAttribute("HealthMult", 0.55);
        l_Parent_0:SetAttribute("FirstMult", 0.85);
    else
        l_Parent_0:SetAttribute("DamageMult", 1);
        l_Parent_0:SetAttribute("HealthMult", 1);
    end;
    local v50 = l_Parent_0:GetAttribute("BabyMode") or false;
    if v50 then
        v36 = 0.25;
        v42 = false;
        l_Parent_0:SetAttribute("DamageMult", 0.55);
        l_Parent_0:SetAttribute("HealthMult", 0.65);
    end;
    local l_Value_2 = v18.LockedOn.Value;
    local v52 = l_Value_2 and game.Players:GetPlayerFromCharacter(l_Value_2);
    local v53 = nil;
    v53 = v20.Cutscene.Changed:Connect(function(v54) --[[ Line: 148 ]]
        -- upvalues: v53 (ref), v20 (copy), v52 (copy), l_Workspace_0 (ref), l_Value_2 (copy), l_CreateEffect_0 (ref), l_Parent_0 (copy)
        if v54 == true then
            return;
        else
            if v53 then
                v53:Disconnect();
            end;
            v20.Cutscene.Value = true;
            v20.CanEmoteAnyways.Value = true;
            if not v52 then
                v20.Cutscene.Value = false;
                return;
            else
                local v55 = l_Workspace_0.States[l_Value_2.Name];
                local _ = v55.PlayerData;
                local l_CharacterData_0 = v55.CharacterData;
                l_CharacterData_0.Stunned.Value = true;
                l_CharacterData_0.Cutscene.Value = true;
                task.wait(1);
                l_CreateEffect_0:FireClient(v52, {
                    "DramaticDialog", 
                    l_Parent_0, 
                    "SO YOU'RE THE ONE WHO BEAT MY BROTHER?", 
                    Color3.fromRGB(225, 57, 255), 
                    2, 
                    0.25, 
                    CFrame.new(0, -1, -1)
                });
                task.wait(2);
                l_CharacterData_0.Stunned.Value = false;
                l_CharacterData_0.Cutscene.Value = false;
                v20.Cutscene.Value = false;
                return;
            end;
        end;
    end);
    local v58 = 0;
    local v59 = {};
    local v60 = 20;
    if v38 then
        v60 = 10;
    end;
    local v61 = false;
    local v62 = 0;
    l_Parent_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 198 ]]
        -- upvalues: v62 (ref), v19 (copy), l_Parent_0 (copy), l_Assets_0 (copy), v20 (copy), v52 (copy), l_Workspace_0 (ref), l_Value_2 (copy), l_CreateEffect_0 (ref), v38 (copy), v39 (copy), v50 (copy), v42 (ref), v43 (ref), l_EquipGlovesOnCharacter_0 (ref), v18 (copy), l_Styles_0 (ref), l_VoidSamurai_0 (ref), v61 (ref), v60 (ref), v58 (ref), v59 (ref), v49 (ref)
        v62 = v62 + 1;
        if v62 == 1 then
            v19.KnockdownSet.Value = "Default";
            l_Parent_0.Face1.Handle.Transparency = 1;
            l_Parent_0.Face2.Handle.Transparency = 0;
            for _, v64 in l_Parent_0:GetDescendants() do
                if v64:IsA("Shirt") then
                    v64:Destroy();
                end;
            end;
            l_Assets_0.Shirt2.Parent = l_Parent_0;
            local v65 = nil;
            v65 = v20.Cutscene.Changed:Connect(function(v66) --[[ Line: 216 ]]
                -- upvalues: v65 (ref), v20 (ref), v52 (ref), l_Workspace_0 (ref), l_Value_2 (ref), l_CreateEffect_0 (ref), l_Parent_0 (ref)
                if v66 == true then
                    return;
                else
                    if v65 then
                        v65:Disconnect();
                    end;
                    v20.Cutscene.Value = true;
                    v20.CanEmoteAnyways.Value = true;
                    if not v52 then
                        v20.Cutscene.Value = false;
                        return;
                    else
                        local v67 = l_Workspace_0.States[l_Value_2.Name];
                        local _ = v67.PlayerData;
                        local l_CharacterData_1 = v67.CharacterData;
                        l_CharacterData_1.Stunned.Value = true;
                        l_CharacterData_1.Cutscene.Value = true;
                        l_CreateEffect_0:FireClient(v52, {
                            "DramaticDialog", 
                            l_Parent_0, 
                            "HAHAHA!!! MORE, MORE!", 
                            Color3.fromRGB(255, 255, 255), 
                            2, 
                            0.25, 
                            CFrame.new(0, -0.45, -0.9)
                        });
                        task.wait(1);
                        l_CharacterData_1.Stunned.Value = false;
                        l_CharacterData_1.Cutscene.Value = false;
                        v20.Cutscene.Value = false;
                        return;
                    end;
                end;
            end);
            return;
        elseif v62 == 2 then
            v19.KnockdownSet.Value = "Champion";
            l_Parent_0.Face2.Handle.Transparency = 1;
            l_Parent_0.First2.Handle.Transparency = 1;
            l_Parent_0.Ponytail.Handle.Transparency = 1;
            l_Parent_0.Face3.Handle.Transparency = 0;
            l_Parent_0.Hair3.Handle.Transparency = 0;
            for _, v71 in l_Parent_0:GetDescendants() do
                if v71:IsA("Pants") then
                    v71:Destroy();
                end;
            end;
            l_Assets_0.PantsFinal.Parent = l_Parent_0;
            if v38 then
                l_Parent_0:SetAttribute("DamageMult", 1.1);
                l_Parent_0:SetAttribute("HealthMult", 1.1);
            elseif v39 then
                l_Parent_0:SetAttribute("DamageMult", 0.5);
                l_Parent_0:SetAttribute("HealthMult", 0.7);
                l_Parent_0:SetAttribute("FirstMult", 0.9);
            else
                l_Parent_0:SetAttribute("DamageMult", 1.2);
                l_Parent_0:SetAttribute("HealthMult", 1);
            end;
            if v50 then
                l_Parent_0:SetAttribute("DamageMult", 0.5);
                l_Parent_0:SetAttribute("HealthMult", 0.5);
            end;
            v42 = true;
            v43 = true;
            v19.KnockdownSet.Value = "Champion";
            local v72 = {
                Name = "Berserk", 
                Unusual = "Flames"
            };
            l_EquipGlovesOnCharacter_0:Fire(l_Parent_0, {
                v72, 
                v72
            });
            v19.Style.Value = "VoidSamurai";
            local v73 = nil;
            v73 = v20.Cutscene.Changed:Connect(function(v74) --[[ Line: 298 ]]
                -- upvalues: v73 (ref), v20 (ref), v18 (ref), l_Workspace_0 (ref), l_Parent_0 (ref), l_Assets_0 (ref), l_CreateEffect_0 (ref), l_Styles_0 (ref), l_VoidSamurai_0 (ref), v61 (ref), v60 (ref), v58 (ref), v59 (ref)
                if v74 == true then
                    return;
                else
                    if v73 then
                        v73:Disconnect();
                    end;
                    v20.Cutscene.Value = true;
                    v20.CanEmoteAnyways.Value = true;
                    local l_Value_3 = v18.LockedOn.Value;
                    local v76 = l_Value_3 and game.Players:GetPlayerFromCharacter(l_Value_3);
                    if not v76 then
                        v20.Cutscene.Value = false;
                        return;
                    else
                        local v77 = l_Workspace_0.States[l_Value_3.Name];
                        local _ = v77.PlayerData;
                        local l_CharacterData_2 = v77.CharacterData;
                        l_CharacterData_2.Stunned.Value = true;
                        l_CharacterData_2.Cutscene.Value = true;
                        for _, v81 in l_Parent_0:GetChildren() do
                            if v81:IsA("BasePart") and v81.Name ~= "HumanoidRootPart" then
                                for _, v83 in l_Assets_0.Aura:GetChildren() do
                                    v83:Clone().Parent = v81;
                                end;
                            end;
                        end;
                        task.wait(0.25);
                        l_CreateEffect_0:FireClient(v76, {
                            "UseEmote", 
                            l_Parent_0, 
                            "Dragon"
                        });
                        task.wait(1.5);
                        l_CreateEffect_0:FireClient(v76, {
                            "DramaticDialog", 
                            l_Parent_0, 
                            "BETTER DODGE TO THE SIDE...", 
                            Color3.fromRGB(169, 65, 255), 
                            1.5, 
                            0.25, 
                            CFrame.new(0, -1, -0.9)
                        });
                        task.wait(1.5);
                        task.defer(function() --[[ Line: 352 ]]
                            -- upvalues: l_Styles_0 (ref), l_Parent_0 (ref)
                            l_Styles_0.VoidSamurai.ServerOnEquip({
                                Character = l_Parent_0
                            });
                        end);
                        task.wait(5);
                        l_CharacterData_2.Stunned.Value = false;
                        l_CharacterData_2.Cutscene.Value = false;
                        v20.Cutscene.Value = false;
                        l_VoidSamurai_0.VoidTensho(l_Parent_0);
                        v61 = true;
                        task.delay(v60, function() --[[ Line: 367 ]]
                            -- upvalues: v61 (ref)
                            v61 = false;
                        end);
                        v58 = 0.016666666666666666;
                        v59 = {
                            "VoidTensho"
                        };
                        return;
                    end;
                end;
            end);
            local v84 = nil;
            v84 = v20.Cutscene.Changed:Connect(function(v85) --[[ Line: 377 ]]
                -- upvalues: v84 (ref), l_Parent_0 (ref), v20 (ref), v52 (ref), l_Workspace_0 (ref), l_Value_2 (ref)
                if v85 == true then
                    return;
                else
                    if v84 then
                        v84:Disconnect();
                    end;
                    l_Parent_0:SetAttribute("FirstMult", 1);
                    v20.Cutscene.Value = true;
                    v20.CanEmoteAnyways.Value = true;
                    if not v52 then
                        v20.Cutscene.Value = false;
                        return;
                    else
                        local v86 = l_Workspace_0.States[l_Value_2.Name];
                        local _ = v86.PlayerData;
                        local l_CharacterData_3 = v86.CharacterData;
                        l_CharacterData_3.Stunned.Value = true;
                        l_CharacterData_3.Cutscene.Value = true;
                        return;
                    end;
                end;
            end);
            v49 = nil;
            return;
        else
            task.wait(1.3);
            l_CreateEffect_0:FireClient(v52, {
                "DramaticDialog", 
                l_Parent_0, 
                "YOU'RE STRONG... THE TOKEN'S YOURS...", 
                Color3.fromRGB(120, 55, 157), 
                2.5, 
                0.2, 
                CFrame.new(0, -0.7, -0.7)
            });
            return;
        end;
    end);
    local l_Parent_1 = v20.Centre.Value.Parent.Parent;
    local v90 = RaycastParams.new();
    v90.FilterType = Enum.RaycastFilterType.Include;
    v90.FilterDescendantsInstances = {
        l_Parent_1
    };
    while task.wait() and l_Parent_0:IsDescendantOf(game) and l_Value_0:IsDescendantOf(game) do
        if l_Parent_0.PrimaryPart and l_Value_0.PrimaryPart then
            if os.clock() - v45 > 3 then
                v45 = os.clock();
                v46 = v10:NextNumber(0, 1) > 0.5;
            end;
            local l_Magnitude_0 = (l_Parent_0.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
            if l_Value_1 == "Takamura" and l_Value_0:GetAttribute("Charging") then
                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(v46 and -1 or 1, 0, 1)));
                if l_Magnitude_0 < 5 then
                    v22:TryAttack({});
                end;
            else
                if v10:NextNumber(0, 1) < v58 and not v61 then
                    v61 = true;
                    task.delay(v60, function() --[[ Line: 448 ]]
                        -- upvalues: v61 (ref)
                        v61 = false;
                    end);
                    if l_Magnitude_0 < 8 then
                        v22:TryDash({
                            Direction = "Backward"
                        });
                        task.wait(0.25);
                    end;
                    l_VoidSamurai_0[v59[math.random(1, #v59)]](l_Parent_0);
                end;
                if not v47 and l_Magnitude_0 > 6 then
                    if not v48 and workspace:GetServerTimeNow() - (l_Parent_0:GetAttribute("LastLanded") or workspace:GetServerTimeNow()) > 20 then
                        v48 = true;
                        v22:TryAttack({});
                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                    elseif v48 and workspace:GetServerTimeNow() - (l_Parent_0:GetAttribute("LastLanded") or workspace:GetServerTimeNow()) < 30 then
                        v48 = false;
                    end;
                    if v49 and not v48 and (v20.CanEmoteAnyways.Value or not v20.Cutscene.Value and not v20.Stunned.Value) then
                        v20.Blocking.Value = false;
                        local v92 = v49[math.random(1, #v49)];
                        l_CreateEffect_0:FireClient(l_PlayerFromCharacter_0, {
                            "UseEmote", 
                            l_Parent_0, 
                            v92
                        });
                        task.wait(0.15);
                        v47 = true;
                        task.delay(15, function() --[[ Line: 489 ]]
                            -- upvalues: v47 (ref)
                            v47 = false;
                        end);
                    end;
                end;
                if v41 < v40 and l_Magnitude_0 < 4.5 and l_Value_0:GetAttribute("Punching") then
                    l_Parent_0:SetAttribute("ServerPerfect", true);
                    local v93 = l_Value_0:GetAttribute("LandTime") - workspace:GetServerTimeNow();
                    local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("AttackingHand");
                    task.wait(v93 - 0.11666666666666667);
                    v22:TryDash({
                        Direction = l_l_Value_0_Attribute_0 == "RightHand" and "Left" or "Right"
                    });
                    if l_Value_0:GetAttribute("SlowMo") then
                        while v20.Stunned.Value do
                            task.wait();
                        end;
                        if v20.UltimateEnergy.Value == 100 then
                            v22:TryAttack({
                                IsUltimate = true
                            });
                        else
                            local v95 = nil;
                            if v10:NextNumber(0, 1) < 0.5 then
                                local v96 = true;
                                repeat
                                    v95 = v22:TryAttack({
                                        IsHeavy = v96, 
                                        TryFeint = l_Value_0
                                    });
                                    if v96 and v10:NextNumber(0, 1) < 0.8 then
                                        v96 = false;
                                    end;
                                    task.wait();
                                    local l_Value_4 = v20.Stamina.Value;
                                    local _ = l_Styles_0[v19.Style.Value];
                                    local l_Style_1 = v19:FindFirstChild("Style");
                                    local v100 = l_Styles_0[l_Style_1.Value].Combos[l_CombatController_0.CurrentCombo];
                                    local v101 = v100[l_CombatController_0.CurrentPunch];
                                    local v102 = v100.DefaultPunchInfo or l_Styles_0[l_Style_1.Value].DefaultPunchInfo;
                                until l_Value_4 <= (v101.Stamina or v102.Stamina) or l_Magnitude_0 > 8 or v20.Stunned.Value or v95 == "Missed";
                            else
                                repeat
                                    local l_Value_5 = l_v16_FirstChild_0.CharacterData.BlockEnergy.Value;
                                    local v104 = l_Styles_0[v19.Style.Value];
                                    local l_Style_2 = v19:FindFirstChild("Style");
                                    local v106 = l_Styles_0[l_Style_2.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                    local l_HeavyAttacks_0 = l_Styles_0[l_Style_2.Value].HeavyAttacks;
                                    v106 = l_HeavyAttacks_0[l_CombatController_0.CurrentHeavy];
                                    local v108 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_2.Value].DefaultPunchInfo;
                                    v95 = v22:TryAttack({
                                        IsHeavy = l_Value_5 < (v106.Damage or v108.Damage) * v10:NextNumber(0.7, 2.5), 
                                        TryFeint = l_Value_0
                                    });
                                    task.wait();
                                    l_Value_5 = v20.Stamina.Value;
                                    local _ = l_Styles_0[v19.Style.Value];
                                    v104 = v19:FindFirstChild("Style");
                                    local v110 = l_Styles_0[v104.Value].Combos[l_CombatController_0.CurrentCombo];
                                    l_HeavyAttacks_0 = v110[l_CombatController_0.CurrentPunch];
                                    v106 = v110.DefaultPunchInfo or l_Styles_0[v104.Value].DefaultPunchInfo;
                                until l_Value_5 <= (l_HeavyAttacks_0.Stamina or v106.Stamina) or l_Magnitude_0 > 8 or v20.Stunned.Value or v95 == "Missed";
                            end;
                        end;
                        v40 = 0;
                    end;
                else
                    if l_Value_0:GetAttribute("Punching") and l_Magnitude_0 < 6 or v20.Stunned.Value then
                        if not v20.Stunned.Value and l_Value_0:GetAttribute("Punching") then
                            local l_wait_0 = task.wait;
                            local v112 = v10:NextNumber(0, 0.1);
                            l_wait_0((math.clamp(v36 + v112, 0.125, 0.3)));
                            if v10:NextNumber(0, 1) > 0.63 then
                                v22:TryDash({
                                    Direction = v10:NextNumber(0, 1) > 0.5 and "Left" or "Right"
                                });
                            end;
                        end;
                        if v20.BlockEnergy.Value > 10 then
                            if v22:TryBlock() then
                                local v113 = v10:NextNumber(5, 12);
                                repeat
                                    task.wait();
                                until v20.BlockEnergy.Value < v113 or not v20.Stunned.Value;
                                v22:Unblock();
                                continue;
                            else
                                v22:Unblock();
                                continue;
                            end;
                        end;
                    end;
                    if v20.Stamina.Value < v20.MaxStamina.Value * 0.2 or v44 then
                        if v42 and l_Magnitude_0 < 8 and v20.Stamina.Value > v20.MaxStamina.Value * 0.25 then
                            local v114 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.LookVector * -5, v90);
                            if v10:NextNumber(0, 1) > 0.6 and not v114 then
                                v22:TryDash({
                                    Direction = "Backward"
                                });
                            else
                                local v115 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v90) or {
                                    Distance = 5000
                                };
                                local v116 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v90) or {
                                    Distance = 5000
                                };
                                if v115.Distance > v116.Distance then
                                    v22:TryDash({
                                        Direction = "Right"
                                    });
                                else
                                    v22:TryDash({
                                        Direction = "Left"
                                    });
                                end;
                            end;
                        elseif l_Magnitude_0 < 6 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(v46 and -1 or 1, 0, 1)));
                        else
                            local v117 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v90) or {
                                Distance = 5000
                            };
                            local v118 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v90) or {
                                Distance = 5000
                            };
                            if v117.Distance > v118.Distance then
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 0, 0)));
                            else
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, 0, 0)));
                            end;
                        end;
                    else
                        l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                        local v119 = l_Styles_0[v19.Style.Value];
                        local l_Style_3 = v19:FindFirstChild("Style");
                        local v121 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo];
                        local v122 = v121[l_CombatController_0.CurrentPunch];
                        local v123 = v121.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                        if l_Magnitude_0 < (v122.HitboxSize or v123.HitboxSize or l_Styles_0[v19.Style.Value].HitboxInfo.Size).Z + v10:NextNumber(0.5, 1.25) then
                            v119 = nil;
                            if v43 and l_Magnitude_0 > 6 and v20.Stamina.Value > v20.MaxStamina.Value * 0.75 and l_Value_1 ~= "Bullet" then
                                v22:TryDash({
                                    Direction = "Forward"
                                });
                            end;
                            l_Style_3 = 0.3;
                            if v39 or v50 then
                                l_Style_3 = 0.6;
                            end;
                            if v10:NextNumber(0, 1) < l_Style_3 then
                                v121 = true;
                                repeat
                                    v119 = v22:TryAttack({
                                        IsHeavy = v121, 
                                        TryFeint = v121 and l_Value_0
                                    });
                                    v121 = v10:NextNumber(0, 1) < 0.5;
                                    task.wait();
                                    v122 = v20.Stamina.Value;
                                    local _ = l_Styles_0[v19.Style.Value];
                                    local l_Style_4 = v19:FindFirstChild("Style");
                                    local v126 = l_Styles_0[l_Style_4.Value].Combos[l_CombatController_0.CurrentCombo];
                                    local v127 = v126[l_CombatController_0.CurrentPunch];
                                    local v128 = v126.DefaultPunchInfo or l_Styles_0[l_Style_4.Value].DefaultPunchInfo;
                                until v122 <= (v127.Stamina or v128.Stamina) or l_Magnitude_0 > 6 or v20.Stunned.Value or v119 == "Missed";
                            else
                                repeat
                                    v122 = l_v16_FirstChild_0.CharacterData.BlockEnergy.Value;
                                    local v129 = l_Styles_0[v19.Style.Value];
                                    local l_Style_5 = v19:FindFirstChild("Style");
                                    local v131 = l_Styles_0[l_Style_5.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                    local l_HeavyAttacks_1 = l_Styles_0[l_Style_5.Value].HeavyAttacks;
                                    v131 = l_HeavyAttacks_1[l_CombatController_0.CurrentHeavy];
                                    local v133 = l_HeavyAttacks_1.DefaultPunchInfo or l_Styles_0[l_Style_5.Value].DefaultPunchInfo;
                                    v119 = v22:TryAttack({
                                        IsHeavy = v122 < (v131.Damage or v133.Damage) * v10:NextNumber(0.7, 2.5)
                                    });
                                    task.wait();
                                    v122 = v20.Stamina.Value;
                                    local _ = l_Styles_0[v19.Style.Value];
                                    v129 = v19:FindFirstChild("Style");
                                    local v135 = l_Styles_0[v129.Value].Combos[l_CombatController_0.CurrentCombo];
                                    l_HeavyAttacks_1 = v135[l_CombatController_0.CurrentPunch];
                                    v131 = v135.DefaultPunchInfo or l_Styles_0[v129.Value].DefaultPunchInfo;
                                until v122 <= (l_HeavyAttacks_1.Stamina or v131.Stamina) or l_Magnitude_0 > 6 or v20.Stunned.Value or v119 == "Missed";
                            end;
                            if v119 == "Missed" then
                                if v20.Stamina.Value > v20.MaxStamina.Value * 0.4 then
                                    v22:TryDash({
                                        Direction = "Forward"
                                    });
                                end;
                            elseif v20.Stamina.Value < v20.MaxStamina.Value * 0.4 then
                                v44 = true;
                                v121 = v10:NextNumber(1, 3);
                                if v39 or v50 then
                                    v121 = v10:NextNumber(2, 4);
                                end;
                                task.delay(v121, function() --[[ Line: 686 ]]
                                    -- upvalues: v44 (ref)
                                    v44 = false;
                                end);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
return v11;