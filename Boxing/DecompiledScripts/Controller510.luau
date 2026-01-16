local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_Workspace_0 = game:GetService("Workspace");
local l_Cleaner_0 = require(game:GetService("ReplicatedFirst"):WaitForChild("Cleaner"));
local l_EquipGlovesOnCharacter_0 = l_ServerScriptService_0:WaitForChild("Events"):WaitForChild("EquipGlovesOnCharacter");
local _ = require(l_ReplicatedStorage_0.Catalog.SearchHelper);
local v7 = l_ServerScriptService_0:WaitForChild("Combat", 10);
local v8 = require(v7:WaitForChild("NPC", 10));
local l_CreateEffect_0 = game.ReplicatedStorage:WaitForChild("UnreliableRemoteEvents"):WaitForChild("CreateEffect");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local v12 = Random.new();
return {
    Init = function() --[[ Line: 26 ]] --[[ Name: Init ]]
        -- upvalues: l_Cleaner_0 (copy), l_ServerStorage_0 (copy), l_EquipGlovesOnCharacter_0 (copy), l_Workspace_0 (copy), v8 (copy), l_Styles_0 (copy), v12 (copy), l_CreateEffect_0 (copy)
        local v13 = l_Cleaner_0.new();
        local l_Parent_0 = script.Parent;
        v13:Add(l_Parent_0.AncestryChanged:Connect(function(_, v16) --[[ Line: 30 ]]
            -- upvalues: v13 (copy)
            if v16 == nil then
                v13:Clean();
            end;
        end));
        local l_Assets_0 = script.Assets;
        l_Assets_0.Parent = l_ServerStorage_0;
        l_Assets_0.Name = l_Parent_0.Name;
        local v18 = {
            Name = "Default"
        };
        l_EquipGlovesOnCharacter_0:Fire(l_Parent_0, {
            v18, 
            v18
        });
        local v19 = l_Workspace_0:WaitForChild("States", 20);
        local v20 = v19:WaitForChild(l_Parent_0.Name, 20);
        local v21 = v20:WaitForChild("Occupied", 20);
        local v22 = v20:WaitForChild("PlayerData", 20);
        local v23 = v20:WaitForChild("CharacterData", 20);
        local _ = l_Parent_0:WaitForChild("Humanoid", 20);
        local v25 = v8.New({
            Character = l_Parent_0
        });
        while not v23.Opponent.Value and l_Parent_0:IsDescendantOf(game) do
            task.wait();
        end;
        local l_Value_0 = v23.Opponent.Value;
        while not v19:FindFirstChild(l_Value_0.Name) and l_Parent_0:IsDescendantOf() do
            task.wait();
        end;
        local l_v19_FirstChild_0 = v19:FindFirstChild(l_Value_0.Name);
        local _ = game.Players:GetPlayerFromCharacter(l_Value_0);
        local l_Value_1 = l_v19_FirstChild_0.PlayerData.Style.Value;
        local l_CombatController_0 = v25.CombatController;
        local _ = function(v31, v32) --[[ Line: 72 ]] --[[ Name: GetPunchInfo ]]
            -- upvalues: l_Styles_0 (ref), v22 (copy), l_CombatController_0 (copy)
            local _ = l_Styles_0[v22.Style.Value];
            local l_Style_0 = v22:FindFirstChild("Style");
            local v35 = l_Styles_0[l_Style_0.Value].Combos[l_CombatController_0.CurrentCombo];
            local v36 = v35[l_CombatController_0.CurrentPunch];
            if v32 == "IsHeavy" then
                v35 = l_Styles_0[l_Style_0.Value].HeavyAttacks;
                v36 = v35[l_CombatController_0.CurrentHeavy];
            elseif v32 == "IsUltimate" then
                v35 = l_Styles_0[l_Style_0.Value].UltimateInfo;
                v36 = v35[1];
            end;
            local v37 = v35.DefaultPunchInfo or l_Styles_0[l_Style_0.Value].DefaultPunchInfo;
            return v36[v31] or v37[v31];
        end;
        local v39 = 0.2;
        local v40 = 0.4;
        local function _() --[[ Line: 96 ]] --[[ Name: GetReactionTime ]]
            -- upvalues: v39 (ref), v12 (ref), v40 (ref)
            return (math.clamp(v39 + v12:NextNumber(0, v40), 0.125, 0.3));
        end;
        local v42 = 0;
        local v43 = true;
        local v44 = false;
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
        v13:Add(l_Value_0:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 120 ]]
            -- upvalues: v42 (ref)
            v42 = v42 + 1;
        end));
        local v47 = 0.5;
        local v48 = l_Parent_0:GetAttribute("HardMode") or false;
        local v49 = l_Parent_0:GetAttribute("EasyMode") or false;
        if v49 then

        end;
        if v48 then
            v39 = 0.18;
            l_Parent_0:SetAttribute("DamageMult", 1);
            l_Parent_0:SetAttribute("HealthMult", 1);
        else
            v39 = 0.3;
            v47 = 0.8;
            l_Parent_0:SetAttribute("DamageMult", 0.1);
            l_Parent_0:SetAttribute("HealthMult", 0.4);
        end;
        local v50 = l_Parent_0:GetAttribute("BabyMode") or false;
        if v50 then
            v39 = 0.4;
            v47 = 0.8;
            v43 = false;
            l_Parent_0:SetAttribute("DamageMult", 0.1);
            l_Parent_0:SetAttribute("HealthMult", 0.3);
        end;
        local v51 = l_Workspace_0.States[l_Value_0.Name];
        local _ = v51.PlayerData;
        local l_CharacterData_0 = v51.CharacterData;
        local v54 = l_Value_0 and game.Players:GetPlayerFromCharacter(l_Value_0);
        l_Parent_0:SetAttribute("DramaticAnimId", 122148414277291);
        l_Value_0:SetAttribute("DramaticAnimId", 15112170627);
        v22.KnockdownSet.Value = "Cartoony";
        local v55 = 0;
        v13:Add(l_Parent_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 184 ]]
            -- upvalues: v55 (ref), v39 (ref), v40 (ref), v47 (ref), v43 (ref), v48 (copy), l_Parent_0 (copy), l_CreateEffect_0 (ref), v54 (copy), v23 (copy), v21 (copy), l_Workspace_0 (ref), l_Value_0 (copy), v22 (copy)
            v55 = v55 + 1;
            if v55 == 1 then
                v39 = 0.15;
                v40 = 0.1;
                v47 = 0.5;
                v43 = true;
                if v48 then
                    l_Parent_0:SetAttribute("DamageMult", 1);
                    l_Parent_0:SetAttribute("HealthMult", 1);
                else
                    l_Parent_0:SetAttribute("DamageMult", 0.12);
                    l_Parent_0:SetAttribute("HealthMult", 0.5);
                end;
                l_CreateEffect_0:FireClient(v54, {
                    "DramaticDialog", 
                    l_Parent_0, 
                    "ow", 
                    Color3.fromRGB(255, 255, 255), 
                    1, 
                    0.25, 
                    CFrame.new(0, -0.74, -1.8)
                });
                local v56 = nil;
                v56 = v23.Cutscene.Changed:Connect(function(v57) --[[ Line: 213 ]]
                    -- upvalues: v56 (ref), v23 (ref), v21 (ref), l_Workspace_0 (ref), l_CreateEffect_0 (ref), l_Parent_0 (ref), l_Value_0 (ref)
                    if v57 == true then
                        return;
                    else
                        if v56 then
                            v56:Disconnect();
                        end;
                        v23.Cutscene.Value = true;
                        v23.CanEmoteAnyways.Value = true;
                        local l_Value_2 = v21.LockedOn.Value;
                        local v59 = l_Value_2 and game.Players:GetPlayerFromCharacter(l_Value_2);
                        if not v59 then
                            v23.Cutscene.Value = false;
                            return;
                        else
                            local v60 = l_Workspace_0.States[l_Value_2.Name];
                            local _ = v60.PlayerData;
                            local l_CharacterData_1 = v60.CharacterData;
                            l_CharacterData_1.Stunned.Value = true;
                            l_CharacterData_1.Cutscene.Value = true;
                            task.wait(0.25);
                            l_CreateEffect_0:FireClient(v59, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "wow... you really are the best :D", 
                                Color3.fromRGB(255, 255, 255), 
                                2, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            task.wait(3);
                            l_CreateEffect_0:FireClient(v59, {
                                "DramaticDialog", 
                                l_Value_0, 
                                "... JUST FIGHT ALREADY.", 
                                Color3.fromRGB(176, 30, 32), 
                                1.5, 
                                0.25, 
                                CFrame.new(0, -1.05, -0.9)
                            });
                            l_CharacterData_1.Stunned.Value = false;
                            l_CharacterData_1.Cutscene.Value = false;
                            v23.Cutscene.Value = false;
                            task.wait(2);
                            l_CreateEffect_0:FireClient(v59, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "OK... sorry... if im annoying..", 
                                Color3.fromRGB(255, 255, 255), 
                                2.5, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            task.wait(1.25);
                            l_CreateEffect_0:FireClient(v59, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "i just really respect you a lot SIR", 
                                Color3.fromRGB(255, 255, 255), 
                                2, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            task.wait(3);
                            return;
                        end;
                    end;
                end);
                v22.KnockdownSet.Value = "Fling";
                return;
            elseif v55 == 2 then
                l_CreateEffect_0:FireClient(v54, {
                    "DramaticDialog", 
                    l_Parent_0, 
                    "eh-", 
                    Color3.fromRGB(255, 255, 255), 
                    1, 
                    0.25, 
                    CFrame.new(0, -0.74, -1.8)
                });
                local v63 = nil;
                v63 = v23.Cutscene.Changed:Connect(function(v64) --[[ Line: 302 ]]
                    -- upvalues: v63 (ref), v23 (ref), v21 (ref), l_Workspace_0 (ref), l_CreateEffect_0 (ref), l_Parent_0 (ref), v48 (ref)
                    if v64 == true then
                        return;
                    else
                        if v63 then
                            v63:Disconnect();
                        end;
                        v23.Cutscene.Value = true;
                        v23.CanEmoteAnyways.Value = true;
                        local l_Value_3 = v21.LockedOn.Value;
                        local v66 = l_Value_3 and game.Players:GetPlayerFromCharacter(l_Value_3);
                        if not v66 then
                            v23.Cutscene.Value = false;
                            return;
                        else
                            local v67 = l_Workspace_0.States[l_Value_3.Name];
                            local _ = v67.PlayerData;
                            local l_CharacterData_2 = v67.CharacterData;
                            l_CharacterData_2.Stunned.Value = true;
                            l_CharacterData_2.Cutscene.Value = true;
                            task.wait(0.25);
                            l_CreateEffect_0:FireClient(v66, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "ow, ow, ow... starting to really feel dizzy, haha...", 
                                Color3.fromRGB(255, 255, 255), 
                                2, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            task.wait(3);
                            l_CreateEffect_0:FireClient(v66, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "but... im not giving up..", 
                                Color3.fromRGB(255, 255, 255), 
                                2.5, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            if v48 then
                                l_Parent_0:SetAttribute("DamageMult", 1);
                                l_Parent_0:SetAttribute("HealthMult", 1);
                            else
                                l_Parent_0:SetAttribute("DamageMult", 0.15);
                                l_Parent_0:SetAttribute("HealthMult", 0.65);
                            end;
                            task.wait(3);
                            l_CharacterData_2.Stunned.Value = false;
                            l_CharacterData_2.Cutscene.Value = false;
                            v23.Cutscene.Value = false;
                            return;
                        end;
                    end;
                end);
                v22.KnockdownSet.Value = "Fling";
                v47 = 0.6;
                l_Parent_0:SetAttribute("FirstMult", 0.7);
                return;
            elseif v55 == 3 then
                l_CreateEffect_0:FireClient(v54, {
                    "DramaticDialog", 
                    l_Parent_0, 
                    "i-", 
                    Color3.fromRGB(255, 255, 255), 
                    1, 
                    0.25, 
                    CFrame.new(0, -0.74, -1.8)
                });
                local v70 = nil;
                v70 = v23.Cutscene.Changed:Connect(function(v71) --[[ Line: 380 ]]
                    -- upvalues: v70 (ref), v23 (ref), v21 (ref), l_Workspace_0 (ref), l_CreateEffect_0 (ref), l_Value_0 (ref), l_Parent_0 (ref), v48 (ref)
                    if v71 == true then
                        return;
                    else
                        if v70 then
                            v70:Disconnect();
                        end;
                        v23.Cutscene.Value = true;
                        v23.CanEmoteAnyways.Value = true;
                        local l_Value_4 = v21.LockedOn.Value;
                        local v73 = l_Value_4 and game.Players:GetPlayerFromCharacter(l_Value_4);
                        if not v73 then
                            v23.Cutscene.Value = false;
                            return;
                        else
                            local v74 = l_Workspace_0.States[l_Value_4.Name];
                            local _ = v74.PlayerData;
                            local l_CharacterData_3 = v74.CharacterData;
                            l_CharacterData_3.Stunned.Value = true;
                            l_CharacterData_3.Cutscene.Value = true;
                            task.wait(0.25);
                            l_CreateEffect_0:FireClient(v73, {
                                "DramaticDialog", 
                                l_Value_0, 
                                "JUST GIVE UP.", 
                                Color3.fromRGB(176, 30, 32), 
                                1.5, 
                                0.25, 
                                CFrame.new(0, -1.05, -0.9)
                            });
                            task.wait(2);
                            l_CreateEffect_0:FireClient(v73, {
                                "DramaticDialog", 
                                l_Value_0, 
                                "YOU CAN'T WIN.", 
                                Color3.fromRGB(176, 30, 32), 
                                2.5, 
                                0.25, 
                                CFrame.new(0, -1.05, -0.9)
                            });
                            l_CharacterData_3.Stunned.Value = false;
                            l_CharacterData_3.Cutscene.Value = false;
                            v23.Cutscene.Value = false;
                            task.wait(5);
                            l_CreateEffect_0:FireClient(v73, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "it doesn't..", 
                                Color3.fromRGB(255, 255, 255), 
                                2, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            task.wait(3);
                            l_CreateEffect_0:FireClient(v73, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "matter... if i win.. or lose...", 
                                Color3.fromRGB(255, 255, 255), 
                                2.5, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            task.wait(4);
                            l_CreateEffect_0:FireClient(v73, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "i won't give up on myself...", 
                                Color3.fromRGB(255, 255, 255), 
                                2.5, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            if v48 then
                                l_Parent_0:SetAttribute("DamageMult", 1);
                                l_Parent_0:SetAttribute("HealthMult", 1);
                            else
                                l_Parent_0:SetAttribute("DamageMult", 0.2);
                                l_Parent_0:SetAttribute("HealthMult", 0.8);
                            end;
                            task.wait(3);
                            return;
                        end;
                    end;
                end);
                return;
            elseif v55 == 4 then
                l_CreateEffect_0:FireClient(v54, {
                    "DramaticDialog", 
                    l_Value_0, 
                    "AT THIS RATE.. YOU MIGHT DIE...", 
                    Color3.fromRGB(176, 30, 32), 
                    1.5, 
                    0.25, 
                    CFrame.new(0, -1.05, -0.9)
                });
                local v77 = nil;
                v77 = v23.Cutscene.Changed:Connect(function(v78) --[[ Line: 489 ]]
                    -- upvalues: v77 (ref), v23 (ref), v21 (ref), l_Workspace_0 (ref), l_CreateEffect_0 (ref), l_Parent_0 (ref), l_Value_0 (ref), v48 (ref)
                    if v78 == true then
                        return;
                    else
                        if v77 then
                            v77:Disconnect();
                        end;
                        v23.Cutscene.Value = true;
                        v23.CanEmoteAnyways.Value = true;
                        local l_Value_5 = v21.LockedOn.Value;
                        local v80 = l_Value_5 and game.Players:GetPlayerFromCharacter(l_Value_5);
                        if not v80 then
                            v23.Cutscene.Value = false;
                            return;
                        else
                            local v81 = l_Workspace_0.States[l_Value_5.Name];
                            local _ = v81.PlayerData;
                            local l_CharacterData_4 = v81.CharacterData;
                            l_CharacterData_4.Stunned.Value = true;
                            l_CharacterData_4.Cutscene.Value = true;
                            task.wait(0.25);
                            l_CreateEffect_0:FireClient(v80, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "i don't care... i don't...", 
                                Color3.fromRGB(255, 255, 255), 
                                2, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            task.wait(3);
                            l_CreateEffect_0:FireClient(v80, {
                                "DramaticDialog", 
                                l_Value_0, 
                                "YOU'RE INSANE. WHY FIGHT IF YOU CAN'T WIN?", 
                                Color3.fromRGB(176, 30, 32), 
                                1.5, 
                                0.25, 
                                CFrame.new(0, -1.05, -0.9)
                            });
                            task.wait(2.2);
                            l_CreateEffect_0:FireClient(v80, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "because... i'm done giving up on myself", 
                                Color3.fromRGB(176, 30, 32), 
                                2.5, 
                                0.25, 
                                CFrame.new(0, -1.05, -0.9)
                            });
                            task.wait(4);
                            l_CreateEffect_0:FireClient(v80, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "i'm done quitting..... i quit quitting", 
                                Color3.fromRGB(255, 255, 255), 
                                2.5, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            task.wait(3);
                            l_CreateEffect_0:FireClient(v80, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "just stop holding back on me already...", 
                                Color3.fromRGB(255, 255, 255), 
                                2.5, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            task.wait(3);
                            l_CreateEffect_0:FireClient(v80, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "im going to use everything i have...", 
                                Color3.fromRGB(255, 255, 255), 
                                2.5, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            task.wait(3);
                            v23.Cutscene.Value = false;
                            require(game.ServerScriptService.Combat.Abilities.Joe).Use(l_Parent_0);
                            l_Parent_0:SetAttribute("DramaticAnimId", 137484305839453);
                            task.wait(1);
                            l_CharacterData_4.Stunned.Value = false;
                            l_CharacterData_4.Cutscene.Value = false;
                            if v48 then
                                l_Parent_0:SetAttribute("DamageMult", 2);
                                l_Parent_0:SetAttribute("HealthMult", 1);
                                return;
                            else
                                l_Parent_0:SetAttribute("DamageMult", 0.5);
                                l_Parent_0:SetAttribute("HealthMult", 1);
                                return;
                            end;
                        end;
                    end;
                end);
                v47 = 0.6;
                l_Parent_0:SetAttribute("FirstMult", 1);
                v22.KnockdownSet.Value = "Fling";
                return;
            elseif v55 == 5 then
                l_CreateEffect_0:FireClient(v54, {
                    "DramaticDialog", 
                    l_Parent_0, 
                    "no...", 
                    Color3.fromRGB(255, 255, 255), 
                    1, 
                    0.25, 
                    CFrame.new(0, -0.74, -1.8)
                });
                local v84 = nil;
                v84 = v23.Cutscene.Changed:Connect(function(v85) --[[ Line: 623 ]]
                    -- upvalues: v84 (ref), v23 (ref), v21 (ref), l_Workspace_0 (ref), l_CreateEffect_0 (ref), l_Value_0 (ref), l_Parent_0 (ref), v48 (ref)
                    if v85 == true then
                        return;
                    else
                        if v84 then
                            v84:Disconnect();
                        end;
                        v23.Cutscene.Value = true;
                        v23.CanEmoteAnyways.Value = true;
                        local l_Value_6 = v21.LockedOn.Value;
                        local v87 = l_Value_6 and game.Players:GetPlayerFromCharacter(l_Value_6);
                        if not v87 then
                            v23.Cutscene.Value = false;
                            return;
                        else
                            local v88 = l_Workspace_0.States[l_Value_6.Name];
                            local _ = v88.PlayerData;
                            local l_CharacterData_5 = v88.CharacterData;
                            l_CharacterData_5.Stunned.Value = true;
                            l_CharacterData_5.Cutscene.Value = true;
                            task.wait(0.25);
                            l_CreateEffect_0:FireClient(v87, {
                                "DramaticDialog", 
                                l_Value_0, 
                                "HAH.. HAH... NOT.. BAD.. KID...", 
                                Color3.fromRGB(176, 30, 32), 
                                2.5, 
                                0.25, 
                                CFrame.new(0, -1.05, -0.9)
                            });
                            task.wait(4);
                            l_CreateEffect_0:FireClient(v87, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "i'm...", 
                                Color3.fromRGB(255, 255, 255), 
                                2, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            task.wait(3);
                            l_CreateEffect_0:FireClient(v87, {
                                "DramaticDialog", 
                                l_Parent_0, 
                                "not. not...", 
                                Color3.fromRGB(176, 30, 32), 
                                2.5, 
                                0.25, 
                                CFrame.new(0, -0.95, -0.9)
                            });
                            task.wait(4);
                            l_CharacterData_5.Stunned.Value = false;
                            l_CharacterData_5.Cutscene.Value = false;
                            v23.Cutscene.Value = false;
                            for _ = 1, 6 do
                                l_CreateEffect_0:FireClient(v87, {
                                    "DramaticDialog", 
                                    l_Parent_0, 
                                    "im not giving up", 
                                    Color3.fromRGB(255, 255, 255), 
                                    1, 
                                    0.25, 
                                    CFrame.new(0, -0.95, -0.9)
                                });
                                task.wait(0.5);
                            end;
                            if v48 then
                                l_Parent_0:SetAttribute("DamageMult", 1.5);
                                l_Parent_0:SetAttribute("HealthMult", 1.5);
                            else
                                l_Parent_0:SetAttribute("DamageMult", 0.6);
                                l_Parent_0:SetAttribute("HealthMult", 1.1);
                            end;
                            task.wait(0.5);
                            return;
                        end;
                    end;
                end);
                v22.KnockdownSet.Value = "Barbarian";
                return;
            else
                if v55 == 6 then
                    l_Parent_0:SetAttribute("BurnMode", nil);
                    l_CreateEffect_0:FireClient(v54, {
                        "DramaticDialog", 
                        l_Value_0, 
                        "YOU'RE SOMETHING SPECIAL, KID...", 
                        Color3.fromRGB(176, 30, 32), 
                        2.5, 
                        0.25, 
                        CFrame.new(0, -1.05, -0.9)
                    });
                    task.wait(3.5);
                    l_CreateEffect_0:FireClient(v54, {
                        "DramaticDialog", 
                        l_Value_0, 
                        "A GEM LIKE YOU...", 
                        Color3.fromRGB(176, 30, 32), 
                        1.5, 
                        0.25, 
                        CFrame.new(0, -1.05, -0.9)
                    });
                    task.wait(3);
                    l_CreateEffect_0:FireClient(v54, {
                        "DramaticDialog", 
                        workspace.Misc.DialogBringus, 
                        "NEEDS A TRAINER.", 
                        Color3.fromRGB(176, 30, 32), 
                        2.5, 
                        0.25, 
                        CFrame.new(0, -0.95, -0.9)
                    });
                end;
                return;
            end;
        end));
        v13:Add(l_Value_0:GetAttributeChangedSignal("KnockedDown"):Connect(function() --[[ Line: 753 ]]
            -- upvalues: l_CreateEffect_0 (ref), v54 (copy), l_Parent_0 (copy)
            local v92 = {
                "ah.. AH!! I DID IT!", 
                "s-sORRY!!!", 
                "w-woah...", 
                "wait.. i did it??", 
                "sorry...", 
                "i can do this.. i can win!"
            };
            l_CreateEffect_0:FireClient(v54, {
                "DramaticDialog", 
                l_Parent_0, 
                v92[math.random(1, #v92)], 
                Color3.fromRGB(255, 255, 255), 
                2.5, 
                0.25, 
                CFrame.new(0, -0.95, -1.2)
            });
        end));
        local l_Parent_1 = v23.Centre.Value.Parent.Parent;
        local v94 = RaycastParams.new();
        v94.FilterType = Enum.RaycastFilterType.Include;
        v94.FilterDescendantsInstances = {
            l_Parent_1
        };
        repeat
            task.wait(0.5);
        until not v23.Cutscene.Value;
        l_CharacterData_0.Stunned.Value = true;
        l_CharacterData_0.Cutscene.Value = true;
        task.wait(1);
        l_CreateEffect_0:FireClient(v54, {
            "DramaticDialog", 
            l_Parent_0, 
            "p-p-pleased to meet you SIR!!!", 
            Color3.fromRGB(255, 255, 255), 
            2.5, 
            0.25, 
            CFrame.new(0, -0.95, -0.9)
        });
        task.wait(3.2);
        l_CreateEffect_0:FireClient(v54, {
            "DramaticDialog", 
            l_Value_0, 
            "...", 
            Color3.fromRGB(176, 30, 32), 
            1.5, 
            0.25, 
            CFrame.new(0, -0.95, -0.9)
        });
        task.wait(3.2);
        l_CreateEffect_0:FireClient(v54, {
            "DramaticDialog", 
            l_Parent_0, 
            "i..i.. i.. i've been a fan of you for a really long TIME SIR!!!", 
            Color3.fromRGB(255, 255, 255), 
            2.5, 
            0.25, 
            CFrame.new(0, -0.95, -0.9)
        });
        task.wait(3);
        l_CharacterData_0.Stunned.Value = false;
        l_CharacterData_0.Cutscene.Value = false;
        while task.wait() and l_Parent_0:IsDescendantOf(game) and l_Value_0:IsDescendantOf(game) do
            if l_Parent_0.PrimaryPart and l_Value_0.PrimaryPart then
                local l_Magnitude_0 = (l_Parent_0.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
                if l_Value_1 == "Takamura" and l_Value_0:GetAttribute("Charging") then
                    l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 1, 0)));
                    if l_Magnitude_0 < 5 then
                        v25:TryAttack({});
                    end;
                elseif v42 > 8 and l_Magnitude_0 < 4.5 and l_Value_0:GetAttribute("Punching") then
                    l_Parent_0:SetAttribute("ServerPerfect", true);
                    local v96 = (l_Value_0:GetAttribute("LandTime") or workspace:GetServerTimeNow()) - workspace:GetServerTimeNow();
                    local l_l_Value_0_Attribute_0 = l_Value_0:GetAttribute("AttackingHand");
                    task.wait(v96 - 0.11666666666666667);
                    v25:TryDash({
                        Direction = l_l_Value_0_Attribute_0 == "RightHand" and "Left" or "Right"
                    });
                    if l_Value_0:GetAttribute("SlowMo") then
                        while v23.Stunned.Value do
                            task.wait();
                        end;
                        local v98 = nil;
                        if v12:NextNumber(0, 1) < 0.15 then
                            local v99 = true;
                            repeat
                                v98 = v25:TryAttack({
                                    IsHeavy = v99, 
                                    TryFeint = l_Value_0
                                });
                                if v99 and v12:NextNumber(0, 1) < 0.8 then
                                    v99 = false;
                                end;
                                task.wait();
                                local l_Value_7 = v23.Stamina.Value;
                                local _ = l_Styles_0[v22.Style.Value];
                                local l_Style_1 = v22:FindFirstChild("Style");
                                local v103 = l_Styles_0[l_Style_1.Value].Combos[l_CombatController_0.CurrentCombo];
                                local v104 = v103[l_CombatController_0.CurrentPunch];
                                local v105 = v103.DefaultPunchInfo or l_Styles_0[l_Style_1.Value].DefaultPunchInfo;
                            until l_Value_7 <= (v104.Stamina or v105.Stamina) or l_Magnitude_0 > 6 or v23.Stunned.Value or v98 == "Missed";
                        else
                            repeat
                                local l_Value_8 = l_v19_FirstChild_0.CharacterData.BlockEnergy.Value;
                                local v107 = l_Styles_0[v22.Style.Value];
                                local l_Style_2 = v22:FindFirstChild("Style");
                                local v109 = l_Styles_0[l_Style_2.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                local l_HeavyAttacks_0 = l_Styles_0[l_Style_2.Value].HeavyAttacks;
                                v109 = l_HeavyAttacks_0[l_CombatController_0.CurrentHeavy];
                                local v111 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_2.Value].DefaultPunchInfo;
                                v98 = v25:TryAttack({
                                    IsHeavy = l_Value_8 < (v109.Damage or v111.Damage) * v12:NextNumber(0.7, 2.5), 
                                    TryFeint = l_Value_0
                                });
                                task.wait();
                                l_Value_8 = v23.Stamina.Value;
                                local _ = l_Styles_0[v22.Style.Value];
                                v107 = v22:FindFirstChild("Style");
                                local v113 = l_Styles_0[v107.Value].Combos[l_CombatController_0.CurrentCombo];
                                l_HeavyAttacks_0 = v113[l_CombatController_0.CurrentPunch];
                                v109 = v113.DefaultPunchInfo or l_Styles_0[v107.Value].DefaultPunchInfo;
                            until l_Value_8 <= (l_HeavyAttacks_0.Stamina or v109.Stamina) or l_Magnitude_0 > 6 or v23.Stunned.Value or v98 == "Missed";
                        end;
                        v42 = 0;
                    end;
                else
                    if l_Value_0:GetAttribute("Punching") and l_Magnitude_0 < 6 or v23.Stunned.Value then
                        if not v23.Stunned.Value and l_Value_0:GetAttribute("Punching") then
                            local v114 = (l_Value_0:GetAttribute("LandTime") or workspace:GetServerTimeNow()) - workspace:GetServerTimeNow();
                            local _ = l_Value_0:GetAttribute("AttackingHand");
                            task.wait(v114 - 0.11666666666666667);
                            local l_v47_0 = v47;
                            if v49 then
                                l_v47_0 = 0.85;
                            elseif v50 then
                                l_v47_0 = 1;
                            end;
                            if l_v47_0 < v12:NextNumber(0, 1) then
                                v25:TryDash({
                                    Direction = if v12:NextNumber(0, 1) > 0.5 then v12:NextNumber(0, 1) > 0.5 and "Left" or "Right" else "Backward"
                                });
                                continue;
                            else
                                continue;
                            end;
                        elseif v23.BlockEnergy.Value > 10 then
                            if v25:TryBlock() then
                                repeat
                                    task.wait();
                                until v23.BlockEnergy.Value < 12 or not v23.Stunned.Value;
                                v25:Unblock();
                                continue;
                            else
                                v25:Unblock();
                            end;
                        end;
                    end;
                    if v23.Stamina.Value < v23.MaxStamina.Value * 0.25 or v44 then
                        if v43 and l_Magnitude_0 < 5 and v23.Stamina.Value > v23.MaxStamina.Value * 0.4 then
                            local v117 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.LookVector * -5, v94);
                            if v12:NextNumber(0, 1) > v47 + 0.1 and not v117 then
                                v25:TryDash({
                                    Direction = "Backward"
                                });
                            else
                                local v118 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v94) or {
                                    Distance = 5000
                                };
                                local v119 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v94) or {
                                    Distance = 5000
                                };
                                if v118.Distance > v119.Distance then
                                    v25:TryDash({
                                        Direction = "Right"
                                    });
                                else
                                    v25:TryDash({
                                        Direction = "Left"
                                    });
                                end;
                            end;
                        elseif l_Magnitude_0 < 5 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 1, 0)));
                        else
                            local v120 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 5, v94) or {
                                Distance = 5000
                            };
                            local v121 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -5, v94) or {
                                Distance = 5000
                            };
                            if v120.Distance > v121.Distance then
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, 0, 0)));
                            else
                                l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, 0, 0)));
                            end;
                        end;
                    else
                        local v122 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * 8, v94);
                        local v123 = workspace:Raycast(l_Parent_0.PrimaryPart.Position, l_Parent_0.PrimaryPart.CFrame.RightVector * -8, v94);
                        if v122 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(-1, 0, -1, 0)));
                        elseif v123 then
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(1, 0, -1, 0)));
                        else
                            l_Parent_0:SetAttribute("SimulatedInput", (Vector3.new(0, 0, -1, 0)));
                        end;
                        local v124 = l_Styles_0[v22.Style.Value];
                        local l_Style_3 = v22:FindFirstChild("Style");
                        local v126 = l_Styles_0[l_Style_3.Value].Combos[l_CombatController_0.CurrentCombo];
                        local v127 = v126[l_CombatController_0.CurrentPunch];
                        local v128 = v126.DefaultPunchInfo or l_Styles_0[l_Style_3.Value].DefaultPunchInfo;
                        local v129 = v127.HitboxSize or v128.HitboxSize or l_Styles_0[v22.Style.Value].HitboxInfo.Size;
                        if l_Magnitude_0 < v129.Z + v12:NextNumber(0.5, 1.25) then
                            v124 = nil;
                            if v12:NextNumber(0, 1) < 0.3 then
                                local v130 = true;
                                repeat
                                    v124 = v25:TryAttack({
                                        IsHeavy = v130, 
                                        TryFeint = v130 and l_Value_0
                                    });
                                    v130 = v12:NextNumber(0, 1) < 0.5;
                                    task.wait();
                                    v126 = v23.Stamina.Value;
                                    v128 = l_Styles_0[v22.Style.Value];
                                    local l_Style_4 = v22:FindFirstChild("Style");
                                    local v132 = l_Styles_0[l_Style_4.Value].Combos[l_CombatController_0.CurrentCombo];
                                    local v133 = v132[l_CombatController_0.CurrentPunch];
                                    local v134 = v132.DefaultPunchInfo or l_Styles_0[l_Style_4.Value].DefaultPunchInfo;
                                until v126 <= (v133.Stamina or v134.Stamina) or l_Magnitude_0 > 6 or v23.Stunned.Value or v124 == "Missed";
                            else
                                repeat
                                    v126 = l_v19_FirstChild_0.CharacterData.BlockEnergy.Value;
                                    v128 = l_Styles_0[v22.Style.Value];
                                    local l_Style_5 = v22:FindFirstChild("Style");
                                    local v136 = l_Styles_0[l_Style_5.Value].Combos[l_CombatController_0.CurrentCombo][l_CombatController_0.CurrentPunch];
                                    local l_HeavyAttacks_1 = l_Styles_0[l_Style_5.Value].HeavyAttacks;
                                    v136 = l_HeavyAttacks_1[l_CombatController_0.CurrentHeavy];
                                    local v138 = l_HeavyAttacks_1.DefaultPunchInfo or l_Styles_0[l_Style_5.Value].DefaultPunchInfo;
                                    local v139 = v126 < (v136.Damage or v138.Damage);
                                    if v139 and v23.UltimateEnergy.Value == 100 and v12:NextNumber(0, 1) < 0.2 then
                                        v25:TryAttack({
                                            IsUltimate = true
                                        });
                                    else
                                        v124 = v25:TryAttack({
                                            IsHeavy = v139
                                        });
                                    end;
                                    task.wait();
                                    v126 = v23.Stamina.Value;
                                    v128 = l_Styles_0[v22.Style.Value];
                                    l_Style_5 = v22:FindFirstChild("Style");
                                    l_HeavyAttacks_1 = l_Styles_0[l_Style_5.Value].Combos[l_CombatController_0.CurrentCombo];
                                    v136 = l_HeavyAttacks_1[l_CombatController_0.CurrentPunch];
                                    v138 = l_HeavyAttacks_1.DefaultPunchInfo or l_Styles_0[l_Style_5.Value].DefaultPunchInfo;
                                until v126 <= (v136.Stamina or v138.Stamina) or l_Magnitude_0 > 6 or v23.Stunned.Value or v124 == "Missed";
                            end;
                            if v124 == "Missed" then
                                if v23.Stamina.Value > v23.MaxStamina.Value * 0.3 and l_Value_1 ~= "Bullet" and v129.Z + 5 < l_Magnitude_0 then
                                    v25:TryDash({
                                        Direction = "Forward"
                                    });
                                end;
                            elseif v23.Stamina.Value < v23.MaxStamina.Value * 0.4 then
                                v44 = true;
                                task.delay(v12:NextNumber(0, 0.5), function() --[[ Line: 1046 ]]
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