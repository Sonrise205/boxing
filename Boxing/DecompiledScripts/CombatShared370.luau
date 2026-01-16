--!native
local v0 = false;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("CollectionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("ReplicatedFirst");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_SettingValueHelper_0 = require(l_ReplicatedStorage_0:WaitForChild("PrivateServerPlusModules"):WaitForChild("SettingValueHelper"));
local v10 = l_RunService_0:IsClient();
local v11 = {};
v11.__index = v11;
local function _(v12, v13, v14) --[[ Line: 25 ]] --[[ Name: Lerp ]]
    return v12 + (v13 - v12) * v14;
end;
v11.GetInterface = function(v16) --[[ Line: 27 ]] --[[ Name: GetInterface ]]
    return v16.Player:GetAttribute("Interface");
end;
local _ = require(l_ReplicatedStorage_0.Analytics):GetVariationForServer("LagCompTest");
local l_InfoToString_0 = require(l_ReplicatedStorage_0:WaitForChild("InfoToString"));
local l_Keybinds_0 = require(l_ReplicatedStorage_0:WaitForChild("Keybinds"));
local _ = l_ReplicatedStorage_0:WaitForChild("MobileEvents"):WaitForChild("TryDash");
local l_Buwic_0 = require(l_ReplicatedStorage_0:WaitForChild("Buwic"));
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_CombatHelper_0 = require(l_Modules_0:WaitForChild("CombatHelper"));
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
if v10 then
    v25 = require(l_Modules_0:WaitForChild("AlignHelper"));
    v26 = require(l_Modules_0:WaitForChild("EffectHelper"));
    v27 = require(l_Modules_0:WaitForChild("SoundHelper"));
    v28 = require(l_Modules_0:WaitForChild("AnimHelper"));
end;
local v29 = nil;
if not v10 then
    v29 = require(game:GetService("ServerScriptService"):WaitForChild("Combat", 30):WaitForChild("Combat", 30));
end;
local v30;
if game:GetService("RunService"):IsClient() then
    v30 = shared.BridgeNet2;
    if not v30 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v30 = shared.BridgeNet2;
        v0 = v30;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v30 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v31 = v30.ReferenceBridge("TryAbility");
local v32 = v30.ReferenceBridge("TryAttack");
local _ = v30.ReferenceBridge("ReplicateTryAttack");
local _ = v30.ReferenceBridge("ReplicateLanded");
local l_UnreliableRemoteEvents_0 = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents");
local _ = l_ReplicatedStorage_0:WaitForChild("RemoteEvents");
local l_Events_0 = l_ReplicatedStorage_0:WaitForChild("Events");
local l_GameplaySettings_0 = l_Styles_0.GameplaySettings;
local v39 = Random.new();
local _ = l_Workspace_0.CurrentCamera;
local v41 = nil;
local v42 = {
    Whirlwind = "", 
    Flicker = "Hitman", 
    Smash = "Smash"
};
v11.Init = function(v43, v44) --[[ Line: 98 ]] --[[ Name: Init ]]
    -- upvalues: l_Players_0 (copy), l_Workspace_0 (copy)
    v43.CurrentPunchId = tick();
    v43.CurrentCombo = 1;
    v43.CurrentPunch = 1;
    v43.CurrentHeavy = 1;
    v43.HeavyDebounce = false;
    v43.AttackDebounce = false;
    v43.RollbackDenied = false;
    v43.HoldingDownHeavy = false;
    v43.AttributeConnection = nil;
    v43.AttributeConnections = {};
    v43.TryingSpecial = false;
    v43.WasPreviousFirstLight = false;
    v43.LastAttackType = nil;
    v43.ServerStartTime = nil;
    v43.LastInputTime = tick();
    v43.TimeForFeint = 0;
    v43.LastFeint = 0;
    v43.NextFeintTime = 0;
    v43.RollbackLandedConnection = nil;
    v43.LandedConnection = nil;
    v43.LastStartup = 0;
    v43.LastM1Input = 0;
    v43.IgnoreNextAttackDebounceTime = 0;
    v43.SpecialId = tick();
    v43.Character = v44.Character;
    v43.Player = l_Players_0:GetPlayerFromCharacter(v43.Character) or v43.Character;
    v43.RootPart = v43.Character:WaitForChild("HumanoidRootPart", 20);
    v43.Humanoid = v43.Character:WaitForChild("Humanoid", 20);
    v43.Animator = v43.Humanoid:WaitForChild("Animator", 20);
    local v45 = l_Workspace_0:WaitForChild("States", 20):WaitForChild(v43.Character.Name, 20);
    v43.CharacterData = v45:WaitForChild("CharacterData", 20);
    v43.PlayerData = v45:WaitForChild("PlayerData", 20);
    v43.Occupied = v45:WaitForChild("Occupied", 20);
    v43.Style = v43.PlayerData:WaitForChild("Style", 20);
end;
v11.New = function(v46) --[[ Line: 149 ]] --[[ Name: New ]]
    -- upvalues: v11 (copy), v25 (ref), v10 (copy), v27 (ref), l_Workspace_0 (copy), l_ReplicatedStorage_0 (copy), l_Keybinds_0 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy)
    local v47 = setmetatable({}, v11);
    v47:Init(v46);
    if v46.AlignHelper then
        v47.AlignHelper = v46.AlignHelper;
    else
        v47.AlignHelper = v25.New({
            Character = v47.Character
        });
    end;
    v47:StyleChanged();
    v47.Style.Changed:Connect(function() --[[ Line: 164 ]]
        -- upvalues: v47 (copy)
        v47:StyleChanged();
    end);
    v47.CharacterData.Opponent.Changed:Connect(function() --[[ Line: 168 ]]
        -- upvalues: v47 (copy)
        v47:StyleChanged();
    end);
    if v10 then
        v47.CharacterData.AbilityEnergy.Changed:Connect(function(v48) --[[ Line: 173 ]]
            -- upvalues: v47 (copy), v27 (ref), l_Workspace_0 (ref)
            if not v47.Occupied.Equipped.Value then
                return;
            elseif v48 ~= 100 then
                return;
            elseif SpecialInfo.IgnoreSound then
                return;
            else
                v27:PlaySound({
                    Name = "SpecialReady", 
                    Parent = l_Workspace_0
                });
                return;
            end;
        end);
    end;
    if v10 then
        local _ = l_ReplicatedStorage_0.Events;
        v11.InputBegan = function(v50, v51, v52) --[[ Line: 189 ]] --[[ Name: InputBegan ]]
            -- upvalues: l_Keybinds_0 (ref), l_RunService_0 (ref)
            if not v50.Humanoid or v50.Humanoid.Health <= 0 then
                return;
            elseif not v50.Occupied.Equipped.Value then
                return;
            else
                local l_UserInputType_0 = v51.UserInputType;
                local l_KeyCode_0 = v51.KeyCode;
                local v55 = l_UserInputType_0 == Enum.UserInputType.MouseButton1;
                local v56 = l_UserInputType_0 == Enum.UserInputType.MouseButton2;
                local v57 = v50:GetInterface() == "Controller";
                if not v57 and v52 then
                    return;
                else
                    local v58 = l_KeyCode_0 == l_Keybinds_0.GetKeybind("LightAttack");
                    local v59 = l_KeyCode_0 == l_Keybinds_0.GetKeybind("HeavyAttack");
                    local v60 = l_KeyCode_0 == l_Keybinds_0.GetKeybind("Ultimate");
                    local v61 = l_KeyCode_0 == l_Keybinds_0.GetKeybind("Special");
                    if v57 then
                        v58 = l_KeyCode_0 == l_Keybinds_0.GetGamepadBind("LightAttack");
                        v59 = l_KeyCode_0 == l_Keybinds_0.GetGamepadBind("HeavyAttack");
                        v60 = l_KeyCode_0 == l_Keybinds_0.GetGamepadBind("Ultimate");
                        v61 = l_KeyCode_0 == l_Keybinds_0.GetGamepadBind("Special");
                    end;
                    if v55 or v58 then
                        v50:TryPunch();
                        return;
                    elseif v56 or v59 then
                        v50.HoldingDownHeavy = true;
                        v50:TryPunch({
                            IsHeavy = true
                        });
                        return;
                    elseif v60 then
                        v50:TryPunch({
                            IsUltimate = true
                        });
                        return;
                    elseif v61 then
                        v50:TrySpecial();
                        return;
                    else
                        if l_RunService_0:IsStudio() and l_KeyCode_0 == Enum.KeyCode.G then
                            v50:TryPunch();
                            v50:TryPunch({
                                IsHeavy = true
                            });
                        end;
                        return;
                    end;
                end;
            end;
        end;
        l_UserInputService_0.InputBegan:Connect(function(v62, v63) --[[ Line: 242 ]]
            -- upvalues: v47 (copy)
            v47:InputBegan(v62, v63);
        end);
        v11.InputEnded = function(v64, v65, _) --[[ Line: 246 ]] --[[ Name: InputEnded ]]
            -- upvalues: l_Keybinds_0 (ref)
            local l_UserInputType_1 = v65.UserInputType;
            local l_KeyCode_1 = v65.KeyCode;
            local v69 = v64:GetInterface() == "Controller";
            local v70 = l_UserInputType_1 == Enum.UserInputType.MouseButton2;
            local v71 = l_KeyCode_1 == l_Keybinds_0.GetKeybind("HeavyAttack");
            if v69 then
                v71 = l_KeyCode_1 == l_Keybinds_0.GetGamepadBind("HeavyAttack");
            end;
            if v70 or v71 then
                v64.HoldingDownHeavy = false;
            end;
        end;
        l_UserInputService_0.InputEnded:Connect(function(v72, v73) --[[ Line: 264 ]]
            -- upvalues: v47 (copy)
            v47:InputEnded(v72, v73);
        end);
        local l_MobileEvents_0 = l_ReplicatedStorage_0:WaitForChild("MobileEvents");
        local l_TryPunch_0 = l_MobileEvents_0:WaitForChild("TryPunch");
        local l_UseSpecial_0 = l_MobileEvents_0:WaitForChild("UseSpecial");
        v11.TryPunchME = function(v77, v78) --[[ Line: 274 ]] --[[ Name: TryPunchME ]]
            if v78 then
                if v78.StopHoldingDownHeavy then
                    v77.HoldingDownHeavy = false;
                    return;
                elseif v78.IsHeavy then
                    v77.HoldingDownHeavy = true;
                end;
            end;
            v77:TryPunch(v78);
        end;
        l_TryPunch_0.Event:Connect(function(v79) --[[ Line: 289 ]]
            -- upvalues: v47 (copy)
            v47:TryPunchME(v79);
        end);
        l_UseSpecial_0.Event:Connect(function(v80) --[[ Line: 293 ]]
            -- upvalues: v47 (copy)
            v47:TrySpecial(v80);
        end);
    end;
    return v47;
end;
v11.StyleChanged = function(v81) --[[ Line: 301 ]] --[[ Name: StyleChanged ]]
    -- upvalues: l_Styles_0 (copy), l_Workspace_0 (copy)
    local v82 = l_Styles_0[v81.Style.Value];
    v81.CurrentPunch = 1;
    v81.CurrentCombo = 1;
    v81.CurrentHeavy = 1;
    if v82.MeterInfo then
        local v83 = v81.Character:GetAttribute("LastDamage") or 0;
        if l_Workspace_0:GetServerTimeNow() - v83 < 0.5 then
            v81.CurrentPunch = 2;
        end;
    end;
    v81.Player:SetAttribute("Special", nil);
    l_Workspace_0.StyleMode.Value = "";
    workspace.CurrentSpecialFrame.Value = "";
    local l_CoreInfo_0 = l_Styles_0[v81.Style.Value].CoreInfo;
    if not l_CoreInfo_0.IgnoreEnergy then
        v81.CharacterData.AbilityEnergy.Value = l_CoreInfo_0.StartAbilityEnergy or 100;
    end;
    if SpecialInfo and SpecialInfo.Removed then
        SpecialInfo.Removed();
    end;
    SpecialInfo = v82.SpecialInfo;
    if SpecialInfo then
        if SpecialInfo.Added then
            SpecialInfo.Added();
        end;
        if SpecialInfo.IgnoreUI then
            return;
        else
            v81.Player:SetAttribute("Special", SpecialInfo.Name);
        end;
    end;
end;
GetPlayerData = function(v85) --[[ Line: 340 ]] --[[ Name: GetPlayerData ]]
    -- upvalues: l_Workspace_0 (copy)
    if not v85 then
        return;
    else
        local l_FirstChild_0 = l_Workspace_0:WaitForChild("States"):FindFirstChild(v85.Name);
        if not l_FirstChild_0 then
            return;
        else
            return l_FirstChild_0:FindFirstChild("PlayerData");
        end;
    end;
end;
GetCharacterData = function(v87) --[[ Line: 348 ]] --[[ Name: GetCharacterData ]]
    -- upvalues: l_Workspace_0 (copy)
    if not v87 then
        return;
    else
        local l_FirstChild_1 = l_Workspace_0:WaitForChild("States"):FindFirstChild(v87.Name);
        if not l_FirstChild_1 then
            return;
        else
            return l_FirstChild_1:FindFirstChild("CharacterData");
        end;
    end;
end;
v11.UpdatePunch = function(v89) --[[ Line: 357 ]] --[[ Name: UpdatePunch ]]
    -- upvalues: l_Styles_0 (copy)
    local v90 = l_Styles_0[v89.Style.Value].Combos[v89.CurrentCombo];
    v89.CurrentPunch = v89.CurrentPunch + 1;
    local v91 = 2;
    repeat
        v91 = v91 + 1;
    until not v90[v91];
    if v91 - 1 < v89.CurrentPunch then
        v89.CurrentPunch = 2;
    end;
end;
v11.UpdateCombo = function(v92) --[[ Line: 376 ]] --[[ Name: UpdateCombo ]]
    -- upvalues: l_Styles_0 (copy), v41 (ref)
    if not v92.CurrentPunchId then
        return;
    else
        v92.CurrentPunch = 1;
        local v93 = #l_Styles_0[v92.Style.Value].Combos;
        v92.CurrentCombo = v92.CurrentCombo + 1;
        if v93 < v92.CurrentCombo or v92.CurrentCombo > 90 then
            v92.CurrentCombo = 1;
        end;
        v41 = v92.Character:GetAttribute("LocalDashTime");
        return;
    end;
end;
v11.UpdateHeavy = function(v94) --[[ Line: 391 ]] --[[ Name: UpdateHeavy ]]
    -- upvalues: l_Styles_0 (copy)
    local v95 = #l_Styles_0[v94.Style.Value].HeavyAttacks;
    v94.CurrentHeavy = v94.CurrentHeavy + 1;
    if v95 < v94.CurrentHeavy then
        v94.CurrentHeavy = 1;
    end;
end;
v11.Punch = function(v96, v97) --[[ Line: 402 ]] --[[ Name: Punch ]]
    -- upvalues: l_Workspace_0 (copy), l_Styles_0 (copy), l_SettingValueHelper_0 (copy), v10 (copy), v26 (ref), l_TweenService_0 (copy), v42 (copy), v41 (ref), l_GameplaySettings_0 (copy), v39 (copy), v28 (ref), l_Events_0 (copy), l_UnreliableRemoteEvents_0 (copy), v27 (ref), l_CombatHelper_0 (copy), l_InfoToString_0 (copy), l_Buwic_0 (copy), v32 (copy), v29 (ref)
    if l_Workspace_0.CurrentMenu.Value == "Emotes" then
        return;
    elseif v96.PlayerData.Disable.Value then
        return;
    elseif v96.RollbackDenied then
        return false;
    elseif (not v97 or not v97.IgnoreDenyPunches) and v96.DenyPunches then
        return;
    else
        v96.PunchResult = nil;
        if v96.Occupied.ReverseInputs.Value then
            if not v97 then
                v97 = {
                    IsHeavy = true
                };
            else
                local v98 = 0;
                for _, _ in v97 do
                    v98 = v98 + 1;
                end;
                if v98 == 1 and v97.IsHeavy then
                    v97 = nil;
                end;
            end;
        end;
        local l_CoreInfo_1 = l_Styles_0[v96.Style.Value].CoreInfo;
        if not v97 then
            v96.LastM1Input = tick();
        end;
        local v102 = v97 and v97.IsUltimate;
        if v102 and (v96.CharacterData.UltimateEnergy.Value < 100 or v96.Character:GetAttribute("HyperArmor") or v96.Character:GetAttribute("UltimateDebounce")) then
            return false;
        else
            local l_CurrentPunchId_0 = v96.CurrentPunchId;
            local v104 = tick();
            local v105 = false;
            local v106 = v97 and v97.IsHeavy or false;
            if v97 and v97.IgnoreDebounces then
                v96.HeavyDebounce = false;
                v96.AttackDebounce = false;
            end;
            if (v96.CurrentPunch == 1 or v106) and (not v97 or not v97.NotFeintable) and not v96.DenyPunches then
                local v107 = v106 and "Heavy" or "Light";
                if v102 then
                    v107 = "Ultimate";
                end;
                local v108 = not (v107 == v96.LastAttackType);
                local v109 = v96.TimeForFeint - tick();
                local v110 = v109 > 0;
                if v106 and l_Styles_0[v96.Style.Value].HeavyAttacks[v96.CurrentHeavy].NoFeint then
                    v108 = false;
                end;
                local _ = v106 and 3 or 3;
                if v108 and v110 and not v102 and v96.LastAttackType ~= "Ultimate" then
                    if l_SettingValueHelper_0.GetValue("DisableFeints") or v96.GeneralFeintDebounce then
                        return;
                    else
                        v96.GeneralFeintDebounce = v104;
                        task.delay(3, function() --[[ Line: 547 ]]
                            -- upvalues: v96 (copy), v104 (copy)
                            if v96.GeneralFeintDebounce ~= v104 then
                                return;
                            else
                                v96.GeneralFeintDebounce = nil;
                                return;
                            end;
                        end);
                        v96.LastFeint = tick();
                        v105 = true;
                        if v106 then
                            if v96.M2FeintDebounce then
                                return;
                            else
                                v96.M2FeintDebounce = true;
                                task.delay(3, function() --[[ Line: 564 ]]
                                    -- upvalues: v96 (copy)
                                    v96.M2FeintDebounce = nil;
                                end);
                                v96.CurrentHeavy = 1;
                            end;
                        elseif v96.M1FeintDebounce then
                            return;
                        else
                            v96.M1FeintDebounce = true;
                            task.delay(3, function() --[[ Line: 575 ]]
                                -- upvalues: v96 (copy)
                                v96.M1FeintDebounce = nil;
                            end);
                        end;
                        if v10 then
                            task.spawn(function() --[[ Line: 581 ]]
                                -- upvalues: v26 (ref), v96 (copy)
                                v26.FeintEffect({
                                    v96.Character
                                });
                            end);
                            for _, v113 in (v96.Animator:GetPlayingAnimationTracks()) do
                                if v113.Name == "Server" then
                                    task.spawn(function() --[[ Line: 591 ]]
                                        -- upvalues: v113 (copy), v96 (copy), l_CurrentPunchId_0 (copy), l_TweenService_0 (ref)
                                        local l_Speed_0 = v113.Speed;
                                        for v115 = 1, 5 do
                                            if v96.CurrentPunchId ~= l_CurrentPunchId_0 then
                                                return;
                                            else
                                                local v116 = math.clamp(v115 / 5, 0, 1);
                                                local l_v113_0 = v113;
                                                local v118 = l_Speed_0 * 0.6;
                                                local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v116, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                                                l_v113_0:AdjustSpeed(l_Speed_0 + (v118 - l_Speed_0) * l_l_TweenService_0_Value_0);
                                                task.wait(0.03333333333333333);
                                                if v96.NextFeintTime == 0 then
                                                    v113:AdjustSpeed(l_Speed_0);
                                                end;
                                            end;
                                        end;
                                    end);
                                end;
                            end;
                        end;
                        local v120 = 4 + -4 * math.clamp((0.3 - v109) / 0.3, 0, 1);
                        task.wait(v120 / 60);
                        if v96.Occupied.LockedOn.Value and v96.NextFeintTime == 0 then
                            return;
                        else
                            v96.Occupied.CanPunch.Value = true;
                            v96.Occupied.CanBlock.Value = true;
                            v96.AttackDebounce = false;
                        end;
                    end;
                end;
            end;
            if SpecialInfo and SpecialInfo.Type == "Freedom" then
                local v121 = v97 and v97.IsHeavy;
                v96.LastAttackType = v121 and "Heavy" or "Light";
                if v96.Character:GetAttribute("EatNextFreedomInput") then
                    local v122 = v121 and "Smash" or "Flicker";
                    l_Workspace_0.StyleMode.Value = v122;
                    local v123 = v42[l_Workspace_0.StyleMode.Value] or "";
                    if v96.Style.Value ~= "Freedom" .. v123 then
                        v96.Character:SetAttribute("EatNextFreedomInput", tick());
                        return;
                    end;
                end;
            end;
            if not v96.Occupied.CanPunch.Value or v96.Occupied.Blocking.Value or v96.CharacterData.Blocking.Value or v96.CharacterData.Stunned.Value or v96.CharacterData.Cutscene.Value or v96.CharacterData.Toxic.Value or v96.Character:GetAttribute("BlockBroken") or v96.Character:GetAttribute("StaminaBroken") or v96.Character:GetAttribute("LocalSlowMo") or v96.Character:GetAttribute("UsingSpecial") or v96.Character:GetAttribute("NoLocalPunch") or v96.Character:GetAttribute("SuperStunned") or v96.Character:GetAttribute("NPCInvuln") then
                if v96.Occupied.Punching.Value and v96.CurrentPunch >= 2 then
                    return;
                else
                    return false;
                end;
            elseif v96.CharacterData.Stamina.Value <= 0 then
                return;
            else
                v96.LastInputTime = tick();
                local v124 = v97 and v97.IsHeavy;
                v96.LastAttackType = v124 and "Heavy" or "Light";
                if (v124 or v102) and v96.HeavyDebounce then
                    return false;
                elseif v96.AttackDebounce then
                    return false;
                else
                    local v125 = 0.25 + v96.LastStartup + workspace.Ping.Value;
                    local v126 = false;
                    if v96.CurrentPunch == 1 then
                        v126 = not (v124 or v102);
                    end;
                    if v96.CurrentPunch <= 2 then
                        v125 = v125 + (workspace.Ping.Value + 0.2);
                    end;
                    local v127 = l_Styles_0[v96.Style.Value].Combos[v96.CurrentCombo];
                    if v127 and v127.ComboResetTime and v96.CurrentPunch == 1 then
                        v125 = v127.ComboResetTime + v96.LastStartup;
                    end;
                    if v96.PlayerData.Style.Value ~= v96.PreviousStyle then
                        v125 = v125 + 0.4;
                    end;
                    v96.PreviousStyle = v96.PlayerData.Style.Value;
                    if v124 then
                        v96.CurrentPunch = 1;
                        v125 = 0;
                    end;
                    local l_Attribute_0 = v96.Character:GetAttribute("LocalDashTime");
                    if v96.Character:GetAttribute("UpdateNextCombo") then
                        v96.Character:SetAttribute("UpdateNextCombo", nil);
                        v96:UpdateCombo();
                    elseif v125 < v104 - l_CurrentPunchId_0 or v126 and v96.WasPreviousFirstLight then
                        v96:UpdateCombo();
                    elseif not v126 and l_Attribute_0 ~= v41 then
                        v96:UpdateCombo();
                    end;
                    if v97 and v97.IsSpecialCombo then
                        v96.CurrentCombo = 99;
                        v96.CurrentPunch = 1;
                    end;
                    if v96.CurrentHeavy >= 5 then
                        v96.CurrentHeavy = 1;
                    end;
                    if v97 and v97.SpecialHeavy then
                        v96.CurrentHeavy = v97.SpecialHeavy;
                    end;
                    if v96.Style.Value == "Ippo" then
                        local l_Attribute_1 = v96.Character:GetAttribute("DempseyCombo");
                        if l_Attribute_1 then
                            l_Attribute_1 = math.min(l_Attribute_1, l_Styles_0[v96.Style.Value].MaxUpdates);
                        end;
                        if l_Attribute_1 and l_Styles_0[v96.Style.Value].Combos[90 + l_Attribute_1] then
                            v96.CurrentCombo = 90 + l_Attribute_1;
                            v96.CurrentPunch = 1;
                            v96.Character:SetAttribute("DempseyCombo", nil);
                        end;
                    elseif v96.Style.Value == "SwitchHit" then
                        local v130 = l_Workspace_0.StyleMode.Value == "Southpaw" and 2 or 1;
                        v96.CurrentHeavy = v130;
                        v96.CurrentCombo = v130;
                    end;
                    v96.Character:SetAttribute("LastLocalPunchTime", tick());
                    v96.ServerStartTime = l_Workspace_0:GetServerTimeNow();
                    local v131 = false;
                    if v96.CurrentPunch == 1 then
                        v131 = not v124 and not v102;
                    end;
                    local l_IgnoreStartPunchAfterDashTime_0 = l_CoreInfo_1.IgnoreStartPunchAfterDashTime;
                    local l_IgnoreStartPunchAbility_0 = l_CoreInfo_1.IgnoreStartPunchAbility;
                    local v134 = false;
                    local v135 = v96.Occupied.LockedOn.Value and v96.ServerStartTime - (v96.Occupied.LockedOn.Value:GetAttribute("LastDashTime") or 0);
                    if l_IgnoreStartPunchAfterDashTime_0 then
                        v134 = v131 and l_IgnoreStartPunchAfterDashTime_0 and v135 and v135 < l_IgnoreStartPunchAfterDashTime_0;
                        local l_Value_0 = v96.Occupied.LockedOn.Value;
                        if l_Value_0 and l_Value_0:GetAttribute("NoBullet") then
                            v134 = false;
                        end;
                    end;
                    if l_IgnoreStartPunchAbility_0 then
                        v134 = v96.Character:GetAttribute("IgnoreStart");
                    end;
                    if v96.CurrentPunch > 1 or v105 then
                        v134 = nil;
                    end;
                    if v134 then
                        v96.CurrentCombo = 99;
                        v96.CurrentPunch = 1;
                        v134 = nil;
                    end;
                    local v137 = l_Styles_0[v96.Style.Value].Combos[v96.CurrentCombo];
                    local v138 = v137[v96.CurrentPunch];
                    if not v138 then
                        return false;
                    else
                        if v124 then
                            v137 = l_Styles_0[v96.Style.Value].HeavyAttacks;
                            v138 = v137[v96.CurrentHeavy];
                        end;
                        if v102 then
                            v137 = l_Styles_0[v96.Style.Value].UltimateInfo;
                            v138 = v137[1];
                        end;
                        local l_MoverInfo_0 = v138.MoverInfo;
                        local v140 = v137.DefaultPunchInfo or l_Styles_0[v96.Style.Value].DefaultPunchInfo;
                        local v141 = v137.DefaultMoverInfo or l_Styles_0[v96.Style.Value].DefaultMoverInfo;
                        local function v143(v142) --[[ Line: 825 ]] --[[ Name: GetPunchInfo ]]
                            -- upvalues: v138 (ref), v140 (copy)
                            return v138[v142] or v140[v142];
                        end;
                        if not v96.PreviousGetPunchInfo then
                            v96.PreviousGetPunchInfo = {};
                        end;
                        table.insert(v96.PreviousGetPunchInfo, v143);
                        while #v96.PreviousGetPunchInfo > 2 do
                            table.remove(v96.PreviousGetPunchInfo, 1);
                        end;
                        local function _(v144) --[[ Line: 835 ]] --[[ Name: GetMoverInfo ]]
                            -- upvalues: l_MoverInfo_0 (copy), v141 (copy)
                            return l_MoverInfo_0 and l_MoverInfo_0[v144] or v141[v144];
                        end;
                        local v146 = v138.ResetHeavyTime or v140.ResetHeavyTime;
                        if v146 and v146 < v104 - l_CurrentPunchId_0 then
                            v96.CurrentHeavy = 1;
                            v138 = v137[v96.CurrentHeavy];
                        end;
                        local l_Attribute_2 = v96.Character:GetAttribute("TimeSinceLastUnblock");
                        local v148 = v138.AfterBlockDelay or v140.AfterBlockDelay;
                        if v148 and l_Attribute_2 and not v124 and tick() - l_Attribute_2 < v148 then
                            return false;
                        else
                            v96.CurrentPunchId = v104;
                            v96.Character:SetAttribute("CurrentPunchId", v96.CurrentPunchId);
                            v96.Occupied.Dashing.Value = false;
                            v96.Occupied.CanPunch.Value = false;
                            v96.Occupied.StopRotate.Value = false;
                            v96.Occupied.Punching.Value = true;
                            v96.Occupied.CanBlock.Value = false;
                            if not v96.Occupied.LockedOn.Value then
                                v96.Occupied.StopRotate.Value = true;
                            end;
                            local v149 = v138.OnUse or v140.OnUse;
                            if v149 then
                                v149(v96.Character);
                            end;
                            local v150 = v138.IsComboType or v140.IsComboType;
                            local v151 = tick();
                            local v152 = v138.Startup or v140.Startup;
                            local v153 = v138.MinTime or v140.MinTime;
                            local v154 = v138.MaxTime or v140.MaxTime;
                            local v155 = v138.AnimSpeed or v140.AnimSpeed;
                            local v156 = (v138.MoveDelay or v140.MoveDelay) / 2;
                            v96.LastStartup = v152;
                            local l_Value_1 = l_Workspace_0.Ping.Value;
                            local v158 = l_Value_1 / 5;
                            if v96.CurrentPunch == 1 or v124 then
                                local l_l_Value_1_0 = l_Value_1;
                                local v160 = 0.06666666666666667;
                                if v124 then
                                    v160 = 0.06666666666666667;
                                end;
                                local v161 = math.clamp((l_l_Value_1_0 - 0.1) / 0.13999999999999999, 0, 1);
                                v158 = 0 + (v160 - 0) * v161;
                            end;
                            local l_v152_0 = v152;
                            l_v152_0 = v152 - v158;
                            local v163 = l_GameplaySettings_0.CalculateStartupMult({
                                Character = v96.Character, 
                                CurrentPunch = v96.CurrentPunch, 
                                IsFeint = v105, 
                                IsHeavy = v124, 
                                IsUltimate = v102, 
                                StyleInfo = l_Styles_0[v96.Style.Value]
                            });
                            v152 = v152 / v163;
                            v155 = v155 * v163;
                            v96.Character:SetAttribute("LocalIsHeavy", v124);
                            v96.Character:SetAttribute("LocalIsFeinting", v105 and tick() or nil);
                            local v164 = v138.CooldownSettings or v140.CooldownSettings;
                            if v164 then
                                local v165 = v164.Slowdown + v39:NextNumber(-0.025, 0.025);
                                local l_HoldTime_0 = v164.HoldTime;
                                v96.Player:SetAttribute("AbilitySlowdown", v165);
                                local l_v165_0 = v165 --[[ copy: 41 -> 95 ]];
                                task.delay(l_HoldTime_0, function() --[[ Line: 982 ]]
                                    -- upvalues: v96 (copy), l_v165_0 (copy)
                                    if v96.Player:GetAttribute("AbilitySlowdown") == l_v165_0 then
                                        v96.Player:SetAttribute("AbilitySlowdown", nil);
                                    end;
                                end);
                            end;
                            local v168 = v138.IsWhiteFangStart or v140.IsWhiteFangStart;
                            local _ = v96.Character:GetAttribute("LastLanded");
                            local v170 = false;
                            local v171 = v138.AttackDebounce or v140.AttackDebounce;
                            if v171 then
                                v96.AttackDebounce = true;
                            end;
                            local v172 = v138.ChargeInfo or v140.ChargeInfo;
                            local v173 = nil;
                            local v174 = v138.HeavyDebounce or v140.HeavyDebounce or 0.1;
                            if v124 then
                                local v175 = tick();
                                v96.HeavyDebounce = v175;
                                if v150 then
                                    v96.HeavyDebounce = false;
                                else
                                    local l_v154_0 = v154;
                                    if v172 then
                                        l_v154_0 = v154 / 2;
                                    end;
                                    local l_v175_0 = v175 --[[ copy: 48 -> 94 ]];
                                    task.delay(l_v154_0 + v174, function() --[[ Line: 1015 ]]
                                        -- upvalues: v96 (copy), l_v175_0 (copy)
                                        if v96.HeavyDebounce ~= l_v175_0 then
                                            return;
                                        else
                                            v96.HeavyDebounce = false;
                                            return;
                                        end;
                                    end);
                                end;
                            end;
                            local v178 = false;
                            if not v138.TrackTime then
                                local _ = v140.TrackTime;
                            end;
                            local function v206(v180) --[[ Line: 1030 ]] --[[ Name: PlayHitAnimation ]]
                                -- upvalues: v138 (ref), l_Styles_0 (ref), v124 (ref), v140 (copy), v28 (ref), v96 (copy), v39 (ref), v26 (ref)
                                local l_Humanoid_0 = v180:FindFirstChild("Humanoid");
                                local _ = l_Humanoid_0:FindFirstChild("Animator") or l_Humanoid_0;
                                local l_HitInfo_0 = v138.HitInfo;
                                local l_AnimName_0 = l_HitInfo_0.AnimName;
                                local l_Direction_0 = l_HitInfo_0.Direction;
                                local v186 = GetPlayerData(v180);
                                local v187 = GetCharacterData(v180);
                                local v188 = l_Styles_0[v186:FindFirstChild("Style").Value];
                                if not v186 or not v187 or not l_Humanoid_0 or l_Humanoid_0.Health <= 0 then
                                    return;
                                else
                                    local l_Value_2 = v187.Blocking.Value;
                                    local v190 = l_Value_2 and v188.BlockAnimations or v188.HitAnimations;
                                    if l_Value_2 and v124 then
                                        l_AnimName_0 = l_AnimName_0:sub(1, -6);
                                    end;
                                    local v191 = v190[l_AnimName_0];
                                    if v191 then
                                        local v192 = l_Humanoid_0:FindFirstChild("Animator") or l_Humanoid_0;
                                        local v193 = v188.CoreInfo.HitNameFade or 0.001;
                                        local v194 = v138.AnimWeight or v140.AnimWeight or 1000;
                                        local v195 = l_Value_2 and "BlockHitAnimWeight" or "HitAnimWeight";
                                        local v196 = l_Value_2 and "BlockBodyHitAnimWeight" or "BodyHitAnimWeight";
                                        if v188.CoreInfo[v195] then
                                            v194 = v188.CoreInfo[v195] or v194;
                                        end;
                                        if string.find(l_AnimName_0, "Body") then
                                            v194 = v188.CoreInfo[v196] or v194;
                                        end;
                                        local v197 = false;
                                        if v188.CoreInfo[v195] or v188.CoreInfo[v196] then
                                            v197 = true;
                                        end;
                                        local v198 = {
                                            Priority = Enum.AnimationPriority.Action4, 
                                            Animator = v192, 
                                            AnimId = v191, 
                                            NameFade = v193 or 0.1, 
                                            FadeIn = 0.05, 
                                            Weight = v194, 
                                            Name = "HitAnim", 
                                            OverrideWeight = v197
                                        };
                                        if l_Value_2 then
                                            v198.StopInfo = {
                                                StopDelay = 0.35, 
                                                StopTime = 0.5
                                            };
                                        else
                                            v198.StopInfo = {
                                                StopDelay = v124 and 0.6666666666666666 or 0.5, 
                                                StopTime = 0.3333333333333333
                                            };
                                        end;
                                        local _ = v28:CreateAnim(v198);
                                        task.delay(0.2, function() --[[ Line: 1103 ]]

                                        end);
                                    end;
                                    local v200 = CFrame.lookAt(v180.PrimaryPart.Position, v96.Character.PrimaryPart.Position) * CFrame.new(0, 0, -0.7);
                                    if l_Direction_0 == "Right" then
                                        v200 = v200 * CFrame.new(v39:NextNumber(0.3, 0.8), 1 + v39:NextNumber(0, 0.4), 0);
                                    elseif l_Direction_0 == "Left" then
                                        v200 = v200 * CFrame.new(-v39:NextNumber(0.3, 0.8), 1 + v39:NextNumber(0, 0.4), 0);
                                    elseif l_Direction_0 == "Forward" then
                                        v200 = v200 * CFrame.new(0, 1, 0);
                                    end;
                                    local v201 = v138.HitEffect or v140.HitEffect;
                                    local v202 = if l_Value_2 then v188.CoreInfo.BlockEffect or "BlockMain" else v201 or v124 and "HeavyMain" or "HitMain";
                                    local l_TrailInfo_0 = v138.TrailInfo;
                                    local v204 = l_TrailInfo_0 and type(l_TrailInfo_0.TargetPart) == "string" and l_TrailInfo_0.TargetPart or "RightHand";
                                    local v205 = {
                                        v202, 
                                        v180, 
                                        v200, 
                                        v96.Character, 
                                        v204
                                    };
                                    task.delay(0.0125, function() --[[ Line: 1132 ]]
                                        -- upvalues: v26 (ref), v202 (copy), v205 (copy)
                                        v26[v202](v205);
                                    end);
                                    return;
                                end;
                            end;
                            local v207 = v138.ExtraEffect or v140.ExtraEffect;
                            if v207 then
                                local v208 = {
                                    v207.Effect, 
                                    v96.Character, 
                                    v207.EffectDelay, 
                                    v207
                                };
                                local v209 = v208[1];
                                local l_v209_0 = v209 --[[ copy: 53 -> 92 ]];
                                local l_v208_0 = v208 --[[ copy: 52 -> 93 ]];
                                task.defer(function() --[[ Line: 1151 ]]
                                    -- upvalues: v96 (copy), v10 (ref), v26 (ref), l_v209_0 (copy), l_v208_0 (copy)
                                    if v96.Character.Name == "PunchingGuy" then
                                        return;
                                    elseif not v10 then
                                        return;
                                    else
                                        v26[l_v209_0](l_v208_0);
                                        return;
                                    end;
                                end);
                            end;
                            local v212 = nil;
                            local v213 = v105 and 0.2 or v138.ClientWeightFade or v140.ClientWeightFade or v138.WeightFade or v140.WeightFade or 0.05;
                            local v214 = v96.Occupied.LockedOn.Value and v96.Occupied.LockedOn.Value:GetAttribute("IsFeinting");
                            if v105 and v124 and not v172 and v96.CurrentCombo < 90 then
                                v212 = l_GameplaySettings_0.M1FeintStart / 60;
                                v213 = 1;
                            elseif v105 and not v124 then
                                v212 = l_GameplaySettings_0.M2FeintStart / 60;
                            elseif not v105 and v214 then
                                v212 = l_GameplaySettings_0.FeintReadStart / 60;
                            end;
                            local v215 = v105 and 10000 or 1000;
                            local v216 = v138.NameFade or v140.NameFade or 0.1;
                            local v217 = v105 and 0.2 or v138.ClientFadeIn or v140.ClientFadeIn or v138.FadeIn or v140.FadeIn;
                            local v218 = v138.ExtraWhiffTime or v140.ExtraWhiffTime or 0;
                            if v96.Character:GetAttribute("DashFollowupWindow") and not v172 then
                                if not v97 or not v97.IsSpecialCombo then
                                    v212 = (v124 and l_GameplaySettings_0.DashM2Frames or l_GameplaySettings_0.DashM1Frames) / 60;
                                end;
                                if v212 then
                                    v152 = v152 - v212;
                                end;
                                v216 = v216 / 2;
                                v217 = v217 / 2;
                                v215 = v215 * 10;
                                for _, v220 in (v96.Animator:GetPlayingAnimationTracks()) do
                                    if v220.Name == "Remove10" then
                                        v220.Name = "Server";
                                    end;
                                end;
                            end;
                            local v221 = v138.AnimPriority or v140.AnimPriority or Enum.AnimationPriority.Action;
                            local l_Attribute_4 = v96.Character:GetAttribute("HyperArmor");
                            if l_Attribute_4 then
                                v221 = Enum.AnimationPriority.Action3;
                                v96.Occupied.FaceAnyways.Value = true;
                                task.delay(v152 * 0.8, function() --[[ Line: 1217 ]]
                                    -- upvalues: v96 (copy)
                                    v96.Occupied.FaceAnyways.Value = false;
                                end);
                            end;
                            local v223 = {
                                AnimId = v138.AnimId, 
                                AnimSpeed = v155, 
                                Priority = v221, 
                                FadeIn = v217, 
                                WeightFade = v213, 
                                NameFade = v216, 
                                Animator = v96.Animator, 
                                Weight = v215, 
                                Name = "Server", 
                                TimePosition = v212, 
                                OverrideWeight = v138.OverrideWeight or v140.OverrideWeight
                            };
                            if v105 then
                                v223.NameFade = 0.13333333333333333;
                            end;
                            v96.Character:SetAttribute("LocalCompensatedTime", workspace:GetServerTimeNow() + l_v152_0);
                            if not l_CoreInfo_1.DashDuringPunches or v96.CurrentPunch > 1 then

                            end;
                            v96.TimeForFeint = tick() + l_v152_0 - (v138.FeintFramesToRemove or v140.FeintFramesToRemove or 0.016666666666666666);
                            v96.Character:SetAttribute("TimeForFeint", v96.TimeForFeint);
                            if v96.CurrentPunch == 1 or v124 then
                                v96.NextFeintTime = l_Workspace_0:GetServerTimeNow() + (l_v152_0 - 0.03333333333333333);
                            else
                                v96.NextFeintTime = 0;
                            end;
                            if v172 then
                                v96.NextFeintTime = v96.NextFeintTime - l_v152_0 / 2;
                            end;
                            local v224 = 0;
                            local _ = l_v152_0 / 2;
                            local v226 = l_Value_1 * 2 - (v152 - l_v152_0);
                            if v96.CurrentPunch == 1 or v124 and not v172 then
                                v224 = math.clamp(v226, 0, v105 and 0 or 0.05);
                                local v227 = l_Value_1 * 60 * 2;
                                local v228 = 60 / (60 + v227 + (v152 - l_v152_0) * 60);
                                if not v124 then
                                    v228 = 60 / (60 + v227 + (v152 - (v152 - l_v152_0)) * 60 - v224 * 60);
                                end;
                                v223.AnimSpeed = v155 * v228;
                            end;
                            local v229 = v138.LockedAnimSpeed or v140.LockedAnimSpeed;
                            if v229 then
                                v223.AnimSpeed = v229;
                            end;
                            if v124 then
                                l_Value_1 = math.clamp(l_Value_1, 0, 0.2);
                            end;
                            if v172 then
                                v224 = 0;
                            end;
                            if v96.CurrentPunch > 1 then
                                v223.Weight = 50000;
                                v224 = 0;
                            end;
                            if v105 then
                                v224 = 0.08333333333333333;
                            end;
                            local v230 = nil;
                            if v10 and v96.CharacterData.Stamina.Value > 0.1 then
                                if v224 == 0 then
                                    v230 = v28:CreateAnim(v223);
                                else
                                    task.delay(v224, function() --[[ Line: 1310 ]]
                                        -- upvalues: v104 (copy), v96 (copy), v230 (ref), v28 (ref), v223 (copy), v105 (ref), v224 (ref), v172 (copy), l_Value_1 (ref), v226 (copy), v155 (ref)
                                        if v104 ~= v96.CurrentPunchId then
                                            return;
                                        elseif v96.CharacterData.Stunned.Value then
                                            return;
                                        else
                                            v230 = v28:CreateAnim(v223);
                                            if v105 then
                                                v230.TimePosition = v224;
                                            end;
                                            if v172 then
                                                task.wait(l_Value_1);
                                            end;
                                            task.wait(v226 - 0.016666666666666666);
                                            if v104 ~= v96.CurrentPunchId then
                                                return;
                                            elseif v96.CharacterData.Stunned.Value then
                                                return;
                                            else
                                                v230:AdjustSpeed(v155);
                                                return;
                                            end;
                                        end;
                                    end);
                                end;
                            end;
                            local v231 = true;
                            if v96.CurrentPunch ~= 1 then
                                v231 = v124;
                            end;
                            local v232 = true;
                            if v96.CurrentPunch ~= 1 then
                                v232 = v124 or v102;
                            end;
                            local v233 = not v124 and v96.CurrentPunch > 1;
                            if v232 then
                                v96.AttackDebounce = true;
                                task.delay(l_v152_0 + 0.2, function() --[[ Line: 1338 ]]
                                    -- upvalues: v96 (copy), v104 (copy)
                                    if v96.CurrentPunchId ~= v104 then
                                        return;
                                    else
                                        v96.AttackDebounce = false;
                                        return;
                                    end;
                                end);
                            end;
                            local v234 = v138.PassThrough or v140.PassThrough;
                            local function v237() --[[ Line: 1346 ]] --[[ Name: ComboMaxTimeEnd ]]
                                -- upvalues: v104 (copy), v96 (copy), v178 (ref), v170 (ref), v124 (ref), v102 (copy), v138 (ref), v140 (copy), v234 (copy)
                                if v104 ~= v96.CurrentPunchId then
                                    return;
                                else
                                    v178 = true;
                                    v96.AttackDebounce = false;
                                    if v170 then
                                        return;
                                    else
                                        v170 = true;
                                        if v124 then
                                            v96:UpdateHeavy();
                                        elseif not v102 then
                                            v96:UpdatePunch();
                                        end;
                                        v96.Occupied.CanPunch.Value = true;
                                        v96.Occupied.CanBlock.Value = true;
                                        v96.Occupied.Punching.Value = false;
                                        v96.Occupied.StopRotate.Value = false;
                                        v96.AttackDebounce = false;
                                        v96.PunchResult = "Landed";
                                        local v235 = v138.RetryTime or v140.RetryTime;
                                        local v236 = tick() - v96.LastM1Input;
                                        if v235 and v236 < v235 then
                                            v96:TryPunch();
                                        end;
                                        if v234 then
                                            v96:TryPunch();
                                        end;
                                        return;
                                    end;
                                end;
                            end;
                            if v96.LandedConnection then
                                v96.LandedConnection:Disconnect();
                            end;
                            local l_LookVector_0 = (CFrame.new(v96.RootPart.Position) * l_Workspace_0.Rotation.Value).LookVector;
                            if v10 then
                                if not v96.Occupied.LockedOn.Value then
                                    l_LookVector_0 = (l_Workspace_0.CurrentCamera.CFrame.LookVector * Vector3.new(1, 0, 1, 0)).Unit;
                                else
                                    local l_Value_3 = v96.Occupied.LockedOn.Value;
                                    local v240 = l_Value_3 and l_Value_3.PrimaryPart and v96.RootPart and CFrame.lookAt(v96.RootPart.Position, l_Value_3.PrimaryPart.Position);
                                    if v240 then
                                        l_LookVector_0 = Vector3.new(v240.LookVector.X, 0, v240.LookVector.Z).Unit;
                                    end;
                                end;
                            else
                                l_LookVector_0 = (v96.RootPart.CFrame.LookVector * Vector3.new(1, 0, 1, 0)).Unit;
                            end;
                            l_LookVector_0 = l_LookVector_0 * (l_MoverInfo_0 and l_MoverInfo_0.LookVectorMult or v141.LookVectorMult or Vector3.new(1, 1, 1, 0));
                            local v241 = {
                                LockedOn = v96.Occupied.LockedOn.Value, 
                                LookVector = l_LookVector_0, 
                                LockPositionTime = v152, 
                                Responsiveness = l_MoverInfo_0 and l_MoverInfo_0.Responsiveness or v141.Responsiveness, 
                                MaxDistance = (l_MoverInfo_0 and l_MoverInfo_0.MaxDistance or v141.MaxDistance) / (v105 and 3 or 1.5), 
                                Velocity = l_MoverInfo_0 and l_MoverInfo_0.Velocity or v141.Velocity, 
                                MaxTime = l_MoverInfo_0 and l_MoverInfo_0.MaxTime or v141.MaxTime, 
                                RayInfo = v138.RayInfo or v140.RayInfo, 
                                DashDelay = v156, 
                                StartPosition = v96.Character.PrimaryPart.Position
                            };
                            local function v255() --[[ Line: 1418 ]] --[[ Name: Landed ]]
                                -- upvalues: v96 (copy), l_Workspace_0 (ref), v97 (ref), v231 (copy), v104 (copy), l_MoverInfo_0 (copy), v141 (copy), v241 (ref), v232 (copy), v230 (ref), v138 (ref), v140 (copy), v218 (ref), v150 (copy), v237 (copy), v171 (copy), v151 (copy), v153 (copy), l_v152_0 (ref), v234 (copy), v172 (copy), v168 (copy), l_GameplaySettings_0 (ref), v134 (ref), v233 (copy), v170 (ref), v124 (ref), v102 (copy)
                                if v96.LandedConnection then
                                    v96.LandedConnection:Disconnect();
                                end;
                                if SpecialInfo and SpecialInfo.Type == "Supernova" then
                                    local l_Attribute_5 = v96.Character:GetAttribute("LastVictim");
                                    local v243 = v96.CharacterData.Opponent.Value or l_Attribute_5 and l_Workspace_0.Live:FindFirstChild(l_Attribute_5);
                                    local v244 = GetCharacterData(v243);
                                    l_Workspace_0.StyleMode.Value = "Comet";
                                    if v244.Stunned.Value then
                                        local v245 = v97 and v97.SpecialHeavy or 0;
                                        local v246 = 1.2;
                                        if v245 == 5 then
                                            l_Workspace_0.StyleMode.Value = "Re-Entry";
                                            task.delay(1.1, function() --[[ Line: 1437 ]]
                                                -- upvalues: l_Workspace_0 (ref)
                                                if l_Workspace_0.StyleMode.Value == "Re-Entry" then
                                                    l_Workspace_0.StyleMode.Value = "Comet";
                                                end;
                                            end);
                                        elseif v245 <= 5 and not v231 then
                                            l_Workspace_0.StyleMode.Value = "Eject";
                                            local v247 = nil;
                                            local l_v244_0 = v244 --[[ copy: 2 -> 6 ]];
                                            do
                                                local l_v247_0 = v247;
                                                l_v247_0 = v244.Stunned.Changed:Connect(function() --[[ Line: 1451 ]]
                                                    -- upvalues: l_v244_0 (copy), l_v247_0 (ref), l_Workspace_0 (ref)
                                                    if l_v244_0.Stunned.Value then
                                                        return;
                                                    else
                                                        if l_v247_0 then
                                                            l_v247_0:Disconnect();
                                                        end;
                                                        l_Workspace_0.StyleMode.Value = "Comet";
                                                        return;
                                                    end;
                                                end);
                                                task.delay(v246, function() --[[ Line: 1458 ]]
                                                    -- upvalues: l_v247_0 (ref), v96 (ref), v104 (ref), l_Workspace_0 (ref)
                                                    if l_v247_0 then
                                                        l_v247_0:Disconnect();
                                                    end;
                                                    if v96.CurrentPunchId == v104 and l_Workspace_0.StyleMode.Value == "Entry" then
                                                        l_Workspace_0.StyleMode.Value = "Comet";
                                                    end;
                                                end);
                                            end;
                                        end;
                                    end;
                                end;
                                if l_MoverInfo_0 and l_MoverInfo_0.OnlyAfterLanded or v141.OnlyAfterLanded then
                                    v96.AlignHelper:MoveAlignPosition(v241);
                                end;
                                if not v232 then
                                    return;
                                else
                                    if v230 then
                                        v230:AdjustSpeed(v138.AnimSpeed or v140.AnimSpeed);
                                    end;
                                    local v250 = v97 and v97.IgnoreSetLastLanded;
                                    if not v250 then
                                        v96.LastLandedTime = tick();
                                    end;
                                    if v218 > 0 and v150 then
                                        v218 = 0;
                                        task.spawn(function() --[[ Line: 1488 ]]
                                            -- upvalues: v237 (ref)
                                            v237();
                                        end);
                                    end;
                                    if not v250 then
                                        v96.TimeForFeint = 0;
                                        v96.NextFeintTime = 0;
                                    end;
                                    if v171 then
                                        task.wait(0.06666666666666667);
                                        v96.AttackDebounce = false;
                                        return;
                                    else
                                        local v251 = tick() - v151;
                                        local v252 = math.max(math.max(v153, l_v152_0 * 1.2) - v251, 0) + 0.1;
                                        if v234 then
                                            v252 = 0;
                                        end;
                                        if v172 then
                                            v252 = 0;
                                        end;
                                        if v96.IsSupernovaComet then
                                            v96.Occupied.CanPunch.Value = false;
                                        end;
                                        task.wait(v252);
                                        if v168 then
                                            task.wait(l_GameplaySettings_0.RollbackTime);
                                        end;
                                        if v138.NoFollowIfBlock or v140.NoFollowIfBlock then
                                            local l_Attribute_6 = v96.Character:GetAttribute("LastVictim");
                                            local v254 = v96.CharacterData.Opponent.Value or l_Attribute_6 and l_Workspace_0.Live:FindFirstChild(l_Attribute_6);
                                            if GetCharacterData(v254).Blocking.Value then
                                                return;
                                            end;
                                        end;
                                        if v104 ~= v96.CurrentPunchId then
                                            return;
                                        elseif not v134 and v233 then
                                            return;
                                        elseif v150 then
                                            return;
                                        elseif v170 then
                                            return;
                                        else
                                            v170 = true;
                                            if v124 then
                                                v96:UpdateHeavy();
                                            elseif not v102 then
                                                v96:UpdatePunch();
                                            end;
                                            v96.Occupied.CanPunch.Value = true;
                                            v96.Occupied.CanBlock.Value = true;
                                            v96.Occupied.Punching.Value = false;
                                            task.wait(v234 or 0.15);
                                            if v104 ~= v96.CurrentPunchId then
                                                return;
                                            else
                                                v96.Occupied.StopRotate.Value = false;
                                                if v234 then
                                                    v96.AttackDebounce = false;
                                                    v96:TryPunch();
                                                end;
                                                v96.PunchResult = "Landed";
                                                return;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                            if v10 then
                                v96.LandedConnection = l_Events_0.Landed.Event:Connect(function() --[[ Line: 1570 ]]
                                    -- upvalues: v255 (copy)
                                    v255();
                                end);
                            else
                                v96.LandedConnection = v96.Character:GetAttributeChangedSignal("LastDamage"):Connect(function() --[[ Line: 1574 ]]
                                    -- upvalues: v255 (copy)
                                    v255();
                                end);
                            end;
                            local function v257() --[[ Line: 1580 ]] --[[ Name: MaxTimeEnd ]]
                                -- upvalues: v96 (copy), v104 (copy), v178 (ref), v171 (copy), v170 (ref), v124 (ref), v102 (copy), v126 (copy), v138 (ref), v140 (copy), l_Workspace_0 (ref)
                                if v96.CurrentPunchId ~= v104 then
                                    return;
                                elseif v178 then
                                    return;
                                else
                                    v178 = true;
                                    if v171 and v96.AttackDebounce then
                                        v96.AttackDebounce = false;
                                    end;
                                    v96.Occupied.CanBlock.Value = true;
                                    v96.Occupied.StopRotate.Value = false;
                                    if v170 then
                                        return;
                                    else
                                        v170 = true;
                                        if v124 then
                                            v96:UpdateHeavy();
                                        elseif not v102 and v96.CurrentPunch == 1 then
                                            v96.WasPreviousFirstLight = v126;
                                        end;
                                        local v256 = v138.VictimBlockDelay or v140.VictimBlockDelay;
                                        if not v96.Occupied.LockedOn.Value or not v256 then

                                        end;
                                        v96.NextFeintTime = 0;
                                        v96.Occupied.Punching.Value = false;
                                        v96.Occupied.CanPunch.Value = true;
                                        v96.Occupied.CanBlock.Value = true;
                                        v96.PunchResult = "Missed";
                                        if v96.FeintConnection then
                                            v96.FeintConnection:Disconnect();
                                        end;
                                        if v96.LandedConnection then
                                            v96.LandedConnection:Disconnect();
                                        end;
                                        if v96.RollbackLandedConnection then
                                            v96.RollbackLandedConnection:Disconnect();
                                        end;
                                        return;
                                    end;
                                end;
                            end;
                            if v96.FeintConnection then
                                v96.FeintConnection:Disconnect();
                            end;
                            if v10 then
                                v96.FeintConnection = l_UnreliableRemoteEvents_0.RollbackFeint.OnClientEvent:Connect(function() --[[ Line: 1632 ]]
                                    -- upvalues: v96 (copy)
                                    if v96.FeintConnection then
                                        v96.FeintConnection:Disconnect();
                                    end;
                                end);
                            end;
                            if v96.RollbackLandedConnection then
                                v96.RollbackLandedConnection:Disconnect();
                            end;
                            v96.RollbackLandedConnection = l_Events_0.RollbackLanded.Event:Connect(function() --[[ Line: 1665 ]]
                                -- upvalues: v96 (copy)
                                if v96.RollbackLandedConnection then
                                    v96.RollbackLandedConnection:Disconnect();
                                end;
                                v96.CurrentPunch = 1;
                                v96.RollbackDenied = true;
                                task.wait(0.6);
                                v96.RollbackDenied = false;
                            end);
                            if v96.ForceMaxTimeEndConnection then
                                v96.ForceMaxTimeEndConnection:Disconnect();
                            end;
                            v96.ForceMaxTimeEndConnection = l_Events_0.ForceMaxTimeEnd.Event:Connect(function() --[[ Line: 1675 ]]
                                -- upvalues: v96 (copy), v257 (copy)
                                if v96.ForceMaxTimeEndConnection then
                                    v96.ForceMaxTimeEndConnection:Disconnect();
                                end;
                                if v96.CurrentPunch > 1 then
                                    return;
                                elseif v96.CurrentHeavy >= 5 then
                                    return;
                                else
                                    v96.HeavyDebounce = false;
                                    v96.AttackDebounce = false;
                                    local l_InSupernovaCombo_0 = v96.InSupernovaCombo;
                                    v257();
                                    if l_InSupernovaCombo_0 then
                                        v96.InSupernovaCombo = true;
                                        v96.Character:SetAttribute("InSupernovaCombo", true);
                                    end;
                                    return;
                                end;
                            end);
                            local v259 = v138.FollowHeadTime or v140.FollowHeadTime;
                            if v259 then
                                v96.Occupied.FollowHead.Value = true;
                                task.delay(v259, function() --[[ Line: 1701 ]]
                                    -- upvalues: v96 (copy)
                                    v96.Occupied.FollowHead.Value = false;
                                end);
                            end;
                            local v260 = l_MoverInfo_0 and l_MoverInfo_0.ReplicateDelay or v141.ReplicateDelay;
                            if v260 then
                                v156 = v260;
                            end;
                            if l_MoverInfo_0 and l_MoverInfo_0.IgnoreLockedOn or v141.IgnoreLockedOn then
                                v241.LockedOn = nil;
                            end;
                            local l_Value_4 = v96.Occupied.LockedOn.Value;
                            local v262 = l_Value_4 and l_Workspace_0.States:FindFirstChild(l_Value_4.Name);
                            local v263 = v262 and v262:FindFirstChild("CharacterData");
                            local v264 = v138.ThrownCharge or v140.ThrownCharge;
                            if v264 then
                                v264 = v264 * (1 - (v96.Character:GetAttribute("AbilitySlowdown") or 0));
                                local v265 = 0;
                                if l_Value_4 and l_Value_4.PrimaryPart then
                                    v265 = (v96.RootPart.Position - l_Value_4.PrimaryPart.Position).Magnitude;
                                end;
                                if v265 < 9 then
                                    v96.CharacterData.AbilityEnergy.Value = math.clamp(v96.CharacterData.AbilityEnergy.Value + v264, 0, 100);
                                end;
                            end;
                            if l_Value_4 and l_Value_4.PrimaryPart and (not v263 or not v263.Dashing.Value) and not v172 then
                                local _ = (v96.RootPart.Position - l_Value_4.PrimaryPart.Position).Magnitude;
                                if v96.CurrentPunch > 1 then
                                    v241 = {
                                        LookVector = l_LookVector_0, 
                                        LockedOn = v96.Occupied.LockedOn.Value, 
                                        MaxDistance = 3, 
                                        LockPositionTime = v152, 
                                        Responsiveness = (l_MoverInfo_0 and l_MoverInfo_0.Responsiveness or v141.Responsiveness) / 1.5, 
                                        Velocity = l_MoverInfo_0 and l_MoverInfo_0.Velocity or v141.Velocity, 
                                        MaxTime = l_MoverInfo_0 and l_MoverInfo_0.MaxTime or v141.MaxTime, 
                                        RayInfo = v138.RayInfo or v140.RayInfo, 
                                        DashDelay = 0, 
                                        StartPosition = v96.Character.PrimaryPart.Position
                                    };
                                end;
                            end;
                            if not v172 then
                                if v104 ~= v96.CurrentPunchId then
                                    return;
                                else
                                    if v241.MaxDistance >= 0 and not v96.IsSupernovaComet then
                                        v96.AlignHelper:StopMovement();
                                    end;
                                    task.defer(function() --[[ Line: 1766 ]]
                                        -- upvalues: v105 (ref), v241 (ref), v96 (copy), l_Attribute_4 (copy), l_Workspace_0 (ref), l_MoverInfo_0 (copy), v141 (copy)
                                        if v105 then
                                            v241.Direction = "StepIn";
                                        end;
                                        if v96.Character.Name == "PunchingGuy" or v96.Character:GetAttribute("NoStepIn") then
                                            return;
                                        else
                                            if l_Attribute_4 then
                                                local v267 = v96.Character:GetAttribute("LastDamaged") or 0;
                                                if l_Workspace_0:GetServerTimeNow() - v267 < 0.67 and v96.CurrentPunch < 2 then
                                                    return;
                                                end;
                                            end;
                                            if v241.MaxDistance < 0 then
                                                return;
                                            elseif l_MoverInfo_0 and l_MoverInfo_0.OnlyAfterLanded or v141.OnlyAfterLanded then
                                                return;
                                            elseif v96.IsSupernovaComet then
                                                return;
                                            else
                                                v96.AlignHelper:MoveAlignPosition(v241);
                                                return;
                                            end;
                                        end;
                                    end);
                                end;
                            end;
                            local v268 = {
                                IsHeavy = v124, 
                                IsUltimate = v102, 
                                CurrentHeavy = v96.CurrentHeavy, 
                                CurrentCombo = v96.CurrentCombo, 
                                CurrentPunch = v124 and v96.CurrentHeavy or v96.CurrentPunch, 
                                IsCharge = v172 and true or false, 
                                Character = v96.Character
                            };
                            if v134 then
                                v268.CurrentPunch = v268.CurrentPunch + 1;
                            end;
                            local v269 = v231 and v96.Occupied.LockedOn.Value;
                            v268.Ping = l_Value_1;
                            v268.Id = Random.new():NextInteger(0, 99999);
                            local l_LastFeint_0 = v96.LastFeint;
                            if v10 then
                                task.delay(v152 - 0.1, function() --[[ Line: 1833 ]]
                                    -- upvalues: v96 (copy), l_LastFeint_0 (copy), v27 (ref), v39 (ref), v124 (ref)
                                    if v96.CharacterData.Stunned.Value or v96.Occupied.Stunned.Value then
                                        return;
                                    elseif v96.CurrentPunch > 1 then
                                        return;
                                    elseif l_LastFeint_0 ~= v96.LastFeint then
                                        return;
                                    else
                                        v27:PlaySound({
                                            Name = "Step", 
                                            Volume = 0.06666666666666667, 
                                            Parent = v96.RootPart, 
                                            Speed = v39:NextNumber(1.4, 1.6), 
                                            PartName = v96.Character.Name .. "Start"
                                        });
                                        task.wait(0.1);
                                        if v96.CharacterData.Stunned.Value or v96.Occupied.Stunned.Value then
                                            return;
                                        elseif l_LastFeint_0 ~= v96.LastFeint then
                                            return;
                                        else
                                            v27:PlaySound({
                                                Name = v124 and "SwingBig" or "Swing", 
                                                Parent = v96.RootPart, 
                                                Speed = v39:NextNumber(0.85, 1.15), 
                                                PartName = v96.Character.Name .. "Start"
                                            });
                                            return;
                                        end;
                                    end;
                                end);
                            end;
                            local v271 = false;
                            if v96.CurrentPunch > 1 then
                                v271 = not v124 and not v102;
                            end;
                            local function v277() --[[ Line: 1866 ]] --[[ Name: TryAttack ]]
                                -- upvalues: v104 (copy), v96 (copy), l_CombatHelper_0 (ref), v268 (copy), v170 (ref), l_Value_1 (ref), v269 (copy), v134 (ref), v102 (copy), v10 (ref), v124 (ref), v152 (ref), v151 (copy), v271 (copy), v138 (ref), v140 (copy), v27 (ref), v39 (ref), v206 (copy)
                                if v104 ~= v96.CurrentPunchId then
                                    return;
                                else
                                    v96.NextFeintTime = 0;
                                    local v272 = l_CombatHelper_0:TryAttack(v268);
                                    if v104 ~= v96.CurrentPunchId then
                                        return;
                                    elseif v96.CharacterData.Stunned.Value or v96.Occupied.Stunned.Value then
                                        return;
                                    else
                                        if not v170 then
                                            v96.Occupied.StopRotate.Value = true;
                                        end;
                                        v268.StartTime = nil;
                                        v268.AlignInfo = nil;
                                        v268.Ping = l_Value_1;
                                        if v269 then
                                            local _ = v96.RootPart.Position;
                                        end;
                                        if not v272 and v134 then
                                            v96.CurrentCombo = 1;
                                            v96.CurrentPunch = 1;
                                            return;
                                        else
                                            if v102 then
                                                v96.Character:SetAttribute("UltimateDebounce", v104);
                                                task.delay(0.7, function() --[[ Line: 1909 ]]
                                                    -- upvalues: v96 (ref), v104 (ref)
                                                    if v96.Character:GetAttribute("UltimateDebounce") == v104 then
                                                        v96.Character:SetAttribute("UltimateDebounce", nil);
                                                    end;
                                                end);
                                            end;
                                            if v10 and v272 and (v96.CurrentPunch > 1 or v124 or v102 or v134) then
                                                task.delay(v152 - (tick() - v151), function() --[[ Line: 1917 ]]
                                                    -- upvalues: v96 (ref), v271 (ref), v272 (copy), v138 (ref), v140 (ref), v27 (ref), v39 (ref), v124 (ref), v206 (ref)
                                                    if v96.CharacterData.Stamina.Value <= 0 then
                                                        return;
                                                    else
                                                        if v271 then
                                                            task.defer(function() --[[ Line: 1921 ]]
                                                                -- upvalues: v272 (ref), v138 (ref), v140 (ref), v27 (ref), v96 (ref), v39 (ref), v124 (ref)
                                                                if v272:GetAttribute("DashInvulnerable") then
                                                                    return;
                                                                else
                                                                    local v274 = GetCharacterData(v272);
                                                                    local v275 = v274 and v274.Blocking.Value and "GuardHit" or v138.HitSound or v140.HitSound;
                                                                    v27:PlaySound({
                                                                        Name = v275, 
                                                                        Parent = v96.RootPart, 
                                                                        Speed = v39:NextNumber(0.9, 1.1) * (v138.HitSoundSpeedMult or v140.HitSoundSpeedMult or 1)
                                                                    });
                                                                    local v276 = v138.PlayHeavyLayer or v140.PlayHeavyLayer;
                                                                    if v124 or v276 then
                                                                        v27:PlaySound({
                                                                            Name = "HeavyLayer", 
                                                                            Parent = v96.RootPart, 
                                                                            Speed = v39:NextNumber(0.9, 1.1)
                                                                        });
                                                                        v27:PlaySound({
                                                                            Name = "Crush", 
                                                                            Parent = v96.RootPart, 
                                                                            Speed = v39:NextNumber(0.9, 1.1)
                                                                        });
                                                                    end;
                                                                    return;
                                                                end;
                                                            end);
                                                            v206(v272);
                                                        end;
                                                        return;
                                                    end;
                                                end);
                                            end;
                                            return;
                                        end;
                                    end;
                                end;
                            end;
                            if v172 then
                                task.delay(v154 + 0.65, function() --[[ Line: 1960 ]]
                                    -- upvalues: v104 (copy), v96 (copy), v257 (copy)
                                    if v104 ~= v96.CurrentPunchId then
                                        return;
                                    else
                                        v257();
                                        return;
                                    end;
                                end);
                                task.delay(v152 * 0.1, function() --[[ Line: 1965 ]]
                                    -- upvalues: v155 (ref), v104 (copy), v96 (copy), v230 (ref), v154 (copy), v105 (ref), v152 (ref), l_Value_1 (ref), v138 (ref), v140 (copy), v173 (ref), l_Attribute_4 (copy), v124 (ref), v241 (ref), v277 (copy), v257 (copy)
                                    local l_v155_0 = v155;
                                    local v279 = false;
                                    task.defer(function() --[[ Line: 1969 ]]
                                        -- upvalues: v279 (ref), v104 (ref), v96 (ref), v230 (ref), l_v155_0 (copy)
                                        for v280 = 1, 13 do
                                            if v279 then
                                                return;
                                            elseif v104 ~= v96.CurrentPunchId then
                                                if v230 then
                                                    v230:Stop(0.1);
                                                end;
                                                return;
                                            else
                                                if v230 then
                                                    if v279 then
                                                        return;
                                                    else
                                                        local l_v230_0 = v230;
                                                        local l_l_v155_0_0 = l_v155_0;
                                                        local v283 = v280 / 13;
                                                        l_v230_0:AdjustSpeed(l_l_v155_0_0 + (0.075 - l_l_v155_0_0) * v283);
                                                    end;
                                                end;
                                                task.wait(0.016666666666666666);
                                                if v279 then
                                                    return;
                                                end;
                                            end;
                                        end;
                                    end);
                                    local v284 = tick();
                                    repeat
                                        task.wait();
                                    until not v96.HoldingDownHeavy or tick() - v104 > v154 * 0.6 or v105;
                                    task.wait(v152 * 0.63 - (tick() - v284) - l_Value_1);
                                    local v285 = 0.1;
                                    if v96.Style == "GhostDrill" then
                                        v285 = 0;
                                    end;
                                    task.wait(v285);
                                    task.delay(l_Value_1, function() --[[ Line: 1998 ]]
                                        -- upvalues: v279 (ref), v104 (ref), v96 (ref), v230 (ref), l_v155_0 (copy), v138 (ref), v140 (ref), v152 (ref)
                                        v279 = true;
                                        if v104 ~= v96.CurrentPunchId then
                                            if v230 then
                                                v230:Stop(0.05);
                                            end;
                                            return;
                                        else
                                            if v230 then
                                                v230:AdjustSpeed(l_v155_0);
                                                v230.TimePosition = v138.FireAnimTime or v140.FireAnimTime or v152 - 0.03333333333333333;
                                            end;
                                            return;
                                        end;
                                    end);
                                    if v104 ~= v96.CurrentPunchId then
                                        return;
                                    else
                                        v279 = true;
                                        v173 = tick() - v284;
                                        task.defer(function() --[[ Line: 2017 ]]
                                            -- upvalues: l_Attribute_4 (ref), v96 (ref), v124 (ref), v241 (ref)
                                            if l_Attribute_4 and (v96.CurrentPunch <= 1 or v124) then
                                                return;
                                            else
                                                v241.DashDelay = 0;
                                                v96.AlignHelper:MoveAlignPosition(v241);
                                                return;
                                            end;
                                        end);
                                        v277();
                                        task.wait(0.65);
                                        v257();
                                        return;
                                    end;
                                end);
                            else
                                local l_l_v152_0_0 = l_v152_0;
                                if not v96.Occupied.LockedOn.Value then
                                    l_l_v152_0_0 = 0;
                                end;
                                task.delay(l_l_v152_0_0, function() --[[ Line: 2056 ]]
                                    -- upvalues: v277 (copy)
                                    v277();
                                end);
                                if v96.CurrentPunch > 1 and not v134 and not v124 or v150 then
                                    local v287 = math.max(v152, v153) * (v138.DelayMult or v140.DelayMult or 1.15);
                                    task.delay(v287 + v218, function() --[[ Line: 2062 ]]
                                        -- upvalues: v237 (copy)
                                        v237();
                                    end);
                                else
                                    task.delay(v154, function() --[[ Line: 2066 ]]
                                        -- upvalues: v124 (ref), l_GameplaySettings_0 (ref), v218 (ref), v257 (copy)
                                        if not v124 then
                                            task.wait(l_GameplaySettings_0.RollbackTime + 0.05);
                                        end;
                                        task.wait(v218);
                                        v257();
                                    end);
                                end;
                            end;
                            if v10 then
                                local v288 = v138.StartupDelay or v140.StartupDelay;
                                if v288 then
                                    task.wait(v288);
                                end;
                                local v289 = v138.TrailInfo or v140.TrailInfo;
                                if v289 then
                                    local l_v289_0 = v289 --[[ copy: 90 -> 91 ]];
                                    task.defer(function() --[[ Line: 2088 ]]
                                        -- upvalues: v26 (ref), l_v289_0 (copy), v96 (copy)
                                        v26[l_v289_0.EffectName]({
                                            Character = v96.Character, 
                                            TrailInfo = l_v289_0
                                        });
                                    end);
                                end;
                            end;
                            v268.IsStart = true;
                            v268.IsLocked = v96.Occupied.LockedOn.Value and true or false;
                            if v96.CurrentPunchId ~= v104 then
                                return;
                            else
                                local v291 = l_InfoToString_0.ConvertAttack(v268);
                                v96.LastTransit = tick();
                                if v10 then
                                    local v292 = l_Buwic_0.new();
                                    v292:writeString(v291[1]);
                                    v292:writei8(v105 and 1 or 0);
                                    v32:Fire({
                                        v292:toBuffer(), 
                                        l_Value_4
                                    });
                                else
                                    v291[2] = v105;
                                    v291[3] = l_Value_4;
                                    v291[4] = v96.Character;
                                    v29.TryAttack(v96.Character, v291);
                                end;
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v11.TryPunch = function(v293, v294) --[[ Line: 2133 ]] --[[ Name: TryPunch ]]
    local v295 = tick();
    local v296 = not (((v294 and v294.IsHeavy or false) and "Heavy" or "Light") == v293.LastAttackType);
    local l_Attribute_7 = v293.Character:GetAttribute("DashFollowupWindow");
    if v294 and v294.OnlyTryOnce then
        return v293:Punch(v294);
    elseif not l_Attribute_7 and not v296 then
        v293:Punch(v294);
        return;
    else
        while tick() - v295 <= 0.2 and v293:Punch(v294) == false do
            task.wait(0.016666666666666666);
        end;
        return;
    end;
end;
v11.Special = function(v298, v299) --[[ Line: 2172 ]] --[[ Name: Special ]]
    -- upvalues: l_Workspace_0 (copy), v27 (ref), v10 (copy), v26 (ref), v42 (copy), v31 (copy), l_Events_0 (copy), l_RunService_0 (copy), v41 (ref)
    if not v298.Occupied.Equipped.Value then
        return;
    elseif not SpecialInfo or SpecialInfo.IgnoreUI then
        return;
    else
        v298.CurrentSpecialId = tick();
        local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
        local v301 = v298.Character:GetAttribute("LastDamage") or 0;
        local v302 = v298.Character:GetAttribute("LocalDashTime") or 0;
        local v303 = l_l_Workspace_0_ServerTimeNow_0 - v301;
        local v304 = l_l_Workspace_0_ServerTimeNow_0 - v302;
        local v305 = false;
        local v306 = SpecialInfo and SpecialInfo.MinStamina;
        if v306 and v298.CharacterData.Stamina.Value < v306 then
            v305 = true;
        end;
        local function _() --[[ Line: 2193 ]] --[[ Name: PlayError ]]
            -- upvalues: v298 (copy), v27 (ref), l_Workspace_0 (ref)
            if tick() - v298.SpecialId > 0.2 then
                v27:PlaySound({
                    Name = "Error", 
                    Speed = 1.5, 
                    Volume = 0.2, 
                    Parent = l_Workspace_0
                });
            end;
        end;
        local v308 = {
            Occupied = v298.Occupied, 
            Character = v298.Character, 
            CharacterData = v298.CharacterData, 
            CurrentPunchId = v298.CurrentPunchId
        };
        if (not SpecialInfo or v298.CharacterData.AbilityEnergy.Value < 100) and not SpecialInfo.IgnoreAbilityEnergyCheck then
            if tick() - v298.SpecialId > 0.2 then
                v27:PlaySound({
                    Name = "Error", 
                    Speed = 1.5, 
                    Volume = 0.2, 
                    Parent = l_Workspace_0
                });
            end;
            return;
        else
            local v309 = v299 and v299.IsFinalAttempt;
            if SpecialInfo.SpecialCheck then
                if not SpecialInfo.SpecialCheck(v308) then
                    if v309 and tick() - v298.SpecialId > 0.2 then
                        v27:PlaySound({
                            Name = "Error", 
                            Speed = 1.5, 
                            Volume = 0.2, 
                            Parent = l_Workspace_0
                        });
                    end;
                    return false;
                end;
            else
                local v310 = SpecialInfo.MinTimeSinceLastDamage or 0.35;
                local l_IgnoreStun_0 = SpecialInfo.IgnoreStun;
                local l_Value_5 = v298.Occupied.CanPunch.Value;
                if SpecialInfo.Type == "Supernova" then
                    if l_Workspace_0.StyleMode.Value == "Re-Entry" then
                        v304 = 10;
                        v310 = SpecialInfo.GetSpecialInfo("Re-Entry").MinTimeSinceLastDamage;
                        l_IgnoreStun_0 = true;
                        l_Value_5 = true;
                    elseif l_Workspace_0.StyleMode.Value == "Eject" then
                        v310 = 0;
                    elseif l_Workspace_0.StyleMode.Value == "Comet" then
                        v310 = 0.5;
                    end;
                end;
                if v305 or v303 < v310 or v304 < 0.4 or not l_Value_5 or v298.CharacterData.Cutscene.Value or not l_IgnoreStun_0 and (v298.CharacterData.Stunned.Value or v298.Occupied.Stunned.Value) then
                    if v309 and tick() - v298.SpecialId > 0.2 then
                        v27:PlaySound({
                            Name = "Error", 
                            Speed = 1.5, 
                            Volume = 0.2, 
                            Parent = l_Workspace_0
                        });
                    end;
                    return false;
                elseif v298.CharacterData.Blocking.Value and not SpecialInfo.IgnoreBlock then
                    if v309 and tick() - v298.SpecialId > 0.2 then
                        v27:PlaySound({
                            Name = "Error", 
                            Speed = 1.5, 
                            Volume = 0.2, 
                            Parent = l_Workspace_0
                        });
                    end;
                    return false;
                elseif not l_Value_5 then
                    return false;
                end;
            end;
            if (v299 and v299.PushDirection) == "Up" and SpecialInfo.Type == "Shotgun" then
                return;
            else
                v298.SpecialId = tick();
                local v313 = false;
                if SpecialInfo.Type == "Shotgun" then
                    v313 = true;
                    if v10 then
                        v298.CharacterData.AbilityEnergy.Value = 0;
                        v26.QuickReloadMinigame();
                        return;
                    end;
                end;
                if SpecialInfo.Type == "Combo" or SpecialInfo.Type == "Heavy" or SpecialInfo.Type == "Hammer" or SpecialInfo.Type == "GhostDrill" then
                    if tick() - v298.CurrentPunchId < (SpecialInfo.MinAttackTime or 0.8) then
                        return;
                    else
                        local _ = nil;
                        if (if SpecialInfo.Type == "Combo" then v298:TryPunch({
                            IsSpecialCombo = true
                        }) else v298:TryPunch({
                            SpecialHeavy = SpecialInfo.GetSpecialHeavy(v308) or 9, 
                            IsHeavy = true
                        })) == false then
                            return;
                        elseif not v298.Occupied.Punching.Value then
                            return;
                        end;
                    end;
                elseif SpecialInfo.Type == "Freedom" then
                    if v298.Character:GetAttribute("EatNextFreedomInput") then
                        return;
                    else
                        local v315 = tick();
                        v298.Character:SetAttribute("EatNextFreedomInput", v315);
                        v298.CharacterData.AbilityEnergy.Value = 0;
                        local v316 = nil;
                        v316 = v298.Character:GetAttributeChangedSignal("EatNextFreedomInput"):Connect(function() --[[ Line: 2343 ]]
                            -- upvalues: v42 (ref), l_Workspace_0 (ref), v298 (copy), v308 (copy), v316 (ref), v31 (ref)
                            local v317 = v42[l_Workspace_0.StyleMode.Value] or "";
                            if v298.Style.Value == "Freedom" .. v317 then
                                return;
                            elseif not SpecialInfo.SpecialCheck(v308) then
                                return;
                            else
                                if v316 then
                                    v316:Disconnect();
                                end;
                                v298.Character:SetAttribute("EatNextFreedomInput", nil);
                                v298.CharacterData.AbilityEnergy.Value = 100;
                                v31:Fire(v317);
                                return;
                            end;
                        end);
                        task.spawn(function() --[[ Line: 2359 ]]
                            -- upvalues: v298 (copy), v316 (ref)
                            for v318 = 1, 60 do
                                if v298.Character:GetAttribute("EatNextFreedomInput") then
                                    v298.CharacterData.AbilityEnergy.Value = 100 + -100 * (v318 / 60);
                                    task.wait(0.016666666666666666);
                                else
                                    break;
                                end;
                            end;
                            if v316 then
                                v316:Disconnect();
                            end;
                            if not v298.Character:GetAttribute("EatNextFreedomInput") then
                                return;
                            else
                                v298.Character:SetAttribute("EatNextFreedomInput", nil);
                                v298.CharacterData.AbilityEnergy.Value = 100;
                                return;
                            end;
                        end);
                        return;
                    end;
                elseif SpecialInfo.Type == "SwitchHit" then
                    if v298.Character:GetAttribute("StartedStatic") then
                        return;
                    else
                        v31:Fire(l_Workspace_0.StyleMode.Value == "Southpaw");
                        return;
                    end;
                elseif SpecialInfo.Type == "Supernova" then
                    local v319 = l_Workspace_0.StyleMode.Value .. "Cooldown";
                    if v298.Character:GetAttribute(v319) then
                        if tick() - v298.SpecialId > 0.2 then
                            v27:PlaySound({
                                Name = "Error", 
                                Speed = 1.5, 
                                Volume = 0.2, 
                                Parent = l_Workspace_0
                            });
                        end;
                        return false;
                    else
                        local v320 = SpecialInfo.GetSpecialInfo(l_Workspace_0.StyleMode.Value);
                        local l_EnergyCost_0 = v320.EnergyCost;
                        if (v320.EnergyNeeded or l_EnergyCost_0) > v298.CharacterData.AbilityEnergy.Value then
                            if tick() - v298.SpecialId > 0.2 then
                                v27:PlaySound({
                                    Name = "Error", 
                                    Speed = 1.5, 
                                    Volume = 0.2, 
                                    Parent = l_Workspace_0
                                });
                            end;
                            return false;
                        else
                            v298.Character:SetAttribute(v319, true);
                            task.delay(v320.Cooldown, function() --[[ Line: 2408 ]]
                                -- upvalues: v298 (copy), v319 (copy)
                                v298.Character:SetAttribute(v319, nil);
                            end);
                            local l_Value_6 = l_Workspace_0.StyleMode.Value;
                            if l_Value_6 == "Eject" then
                                v298.DenyPunches = true;
                                v298:TryPunch({
                                    SpecialHeavy = 5, 
                                    IsHeavy = true, 
                                    IgnoreDebounces = true, 
                                    IgnoreDenyPunches = true, 
                                    IgnoreSetLastLanded = true
                                });
                                if v298.CurrentHeavy == 5 then
                                    task.delay(SpecialInfo.GetSpecialInfo("Re-Entry").MinTimeSinceLastDamage, function() --[[ Line: 2426 ]]
                                        -- upvalues: v298 (copy)
                                        v298.DenyPunches = nil;
                                    end);
                                else
                                    v298.DenyPunches = nil;
                                    v298.Character:SetAttribute(v319, nil);
                                    return;
                                end;
                            elseif l_Value_6 == "Re-Entry" then
                                if v298.DenyPunches then
                                    v298.Character:SetAttribute(v319, nil);
                                    return false;
                                else
                                    v298.DenyPunches = true;
                                    task.delay(0.35, function() --[[ Line: 2447 ]]
                                        -- upvalues: v298 (copy)
                                        v298.DenyPunches = nil;
                                    end);
                                    l_Events_0.ForceDash:Fire({
                                        IgnoreChecks = true, 
                                        IgnoreStun = true, 
                                        Direction = "Re-Entry", 
                                        MoveVector = Vector3.new()
                                    });
                                    v298.LastLandedTime = v298.LastLandedTime - 1;
                                end;
                            elseif l_Value_6 == "Comet" then
                                local v323 = tick() - (workspace:GetAttribute("LastCutsceneEnded") or 0);
                                if not v298.Occupied.CanPunch.Value or v298.Occupied.Punching.Value or v298.Occupied.Dashing.Value or v323 < 0.5 then
                                    if tick() - v298.SpecialId > 0.2 then
                                        v27:PlaySound({
                                            Name = "Error", 
                                            Speed = 1.5, 
                                            Volume = 0.2, 
                                            Parent = l_Workspace_0
                                        });
                                    end;
                                    v298.Character:SetAttribute(v319, nil);
                                    return false;
                                else
                                    v298:TryPunch({
                                        SpecialHeavy = 9, 
                                        IsHeavy = true, 
                                        IgnoreDebounces = true, 
                                        OnlyTryOnce = true
                                    });
                                    if v298.CurrentHeavy ~= 9 then
                                        if tick() - v298.SpecialId > 0.2 then
                                            v27:PlaySound({
                                                Name = "Error", 
                                                Speed = 1.5, 
                                                Volume = 0.2, 
                                                Parent = l_Workspace_0
                                            });
                                        end;
                                        v298.Character:SetAttribute(v319, nil);
                                        return;
                                    else
                                        v298.CharacterData.AbilityEnergy.Value = math.clamp(v298.CharacterData.AbilityEnergy.Value - l_EnergyCost_0, 0, 100);
                                        v298.IsSupernovaComet = true;
                                        local v324 = tick();
                                        v298.Character:SetAttribute("CantDashDuringPunches", v324);
                                        local v325 = nil;
                                        v325 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 2504 ]]
                                            -- upvalues: v298 (copy)
                                            local l_Value_7 = v298.Occupied.LockedOn.Value;
                                            local v327 = 100;
                                            if l_Value_7 and l_Value_7.PrimaryPart then
                                                v327 = (v298.RootPart.Position - l_Value_7.PrimaryPart.Position).Magnitude;
                                            end;
                                            if v327 <= 6 then
                                                v298.AlignHelper:SetProperties({
                                                    MaxVelocity = 40, 
                                                    Responsiveness = 60
                                                });
                                            end;
                                            if v327 <= 4 then
                                                v298.AlignHelper:SetProperties({
                                                    MaxVelocity = 20, 
                                                    Responsiveness = 30
                                                });
                                            end;
                                            if v327 <= 3.5 then
                                                v298.AlignHelper:StopMovement();
                                            end;
                                        end);
                                        task.delay(0.03333333333333333, function() --[[ Line: 2533 ]]
                                            -- upvalues: l_Events_0 (ref), v41 (ref), v298 (copy)
                                            l_Events_0.ForceDash:Fire({
                                                IgnoreChecks = true, 
                                                IgnoreStun = true, 
                                                Direction = "Comet", 
                                                MoveVector = Vector3.new()
                                            });
                                            task.wait(0.03333333333333333);
                                            v41 = v298.Character:GetAttribute("LocalDashTime");
                                        end);
                                        task.wait(0.5);
                                        workspace.FoVMult.Value = 3;
                                        if v325 then
                                            v325:Disconnect();
                                        end;
                                        v298.IsSupernovaComet = nil;
                                        if v298.Character:GetAttribute("CantDashDuringPunches") == v324 then
                                            v298.Character:SetAttribute("CantDashDuringPunches", nil);
                                        end;
                                        return;
                                    end;
                                end;
                            elseif l_Value_6 == "Overheat" then

                            end;
                            v298.CharacterData.AbilityEnergy.Value = math.clamp(v298.CharacterData.AbilityEnergy.Value - l_EnergyCost_0, 0, 100);
                            v31:Fire(l_Value_6);
                            return;
                        end;
                    end;
                elseif SpecialInfo.Type == "Dash" then
                    l_Events_0.ForceDash:Fire(SpecialInfo.ExtraInfo);
                elseif not v313 then
                    v31:Fire(false);
                end;
                v298.CharacterData.AbilityEnergy.Value = 0;
                if SpecialInfo.Use then
                    SpecialInfo.Use();
                end;
                return;
            end;
        end;
    end;
end;
v11.TrySpecial = function(v328, v329) --[[ Line: 2581 ]] --[[ Name: TrySpecial ]]
    local v330 = tick();
    v328.CurrentSpecialId = nil;
    while true do
        local v331 = tick() - v330;
        if v331 <= 0.2 then
            local v332 = false;
            if v331 + 0.016666666666666666 > 0.2 then
                if not v329 then
                    v329 = {};
                end;
                v329.IsFinalAttempt = true;
                v332 = true;
            end;
            local v333 = v328:Special(v329);
            if not v332 and v333 == false then
                task.wait(0.016666666666666666);
            else
                break;
            end;
        else
            break;
        end;
    end;
end;
return v11;