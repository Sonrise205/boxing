local v0 = false;
local v1 = {};
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local l_HitboxManager_0 = require(l_Modules_0:WaitForChild("HitboxManager"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("PrivateServerPlusModules"):WaitForChild("SettingValueHelper"));
local l_InfoToString_0 = require(l_ReplicatedStorage_0:WaitForChild("InfoToString"));
local _ = l_ReplicatedStorage_0:WaitForChild("RemoteEvents"):WaitForChild("TryAttackBE");
local v12;
if game:GetService("RunService"):IsClient() then
    if not shared.BridgeNet2 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v0 = shared.BridgeNet2;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v12 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local l_TryAttack2_0 = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents"):WaitForChild("TryAttack2");
local v14 = l_RunService_0:IsClient();
local v15 = nil;
if not v14 then
    v15 = require(game:GetService("ServerScriptService"):WaitForChild("Combat", 30):WaitForChild("Combat", 30));
end;
local function _(v16, v17, v18) --[[ Line: 31 ]] --[[ Name: Lerp ]]
    return v16 + (v17 - v16) * v18;
end;
v1.TryAttack = function(_, v21) --[[ Line: 33 ]] --[[ Name: TryAttack ]]
    -- upvalues: l_Workspace_0 (copy), l_Styles_0 (copy), l_HitboxManager_0 (copy), v14 (copy), l_TryAttack2_0 (copy), l_InfoToString_0 (copy), v15 (ref)
    local l_Character_0 = v21.Character;
    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
    if not l_Character_0 and not l_HumanoidRootPart_0 then
        return;
    else
        local l_FirstChild_0 = l_Workspace_0:WaitForChild("States"):FindFirstChild(l_Character_0.Name);
        if not l_FirstChild_0 then
            return;
        else
            local l_PlayerData_0 = l_FirstChild_0:FindFirstChild("PlayerData");
            local l_CharacterData_0 = l_FirstChild_0:FindFirstChild("CharacterData");
            local l_Occupied_0 = l_FirstChild_0:FindFirstChild("Occupied");
            local l_Style_0 = l_PlayerData_0:FindFirstChild("Style");
            local v29 = l_Styles_0[l_Style_0.Value];
            local l_Size_0 = v29.HitboxInfo.Size;
            local l_IsHeavy_0 = v21.IsHeavy;
            local l_IsUltimate_0 = v21.IsUltimate;
            local l_CurrentCombo_0 = v21.CurrentCombo;
            local l_CurrentPunch_0 = v21.CurrentPunch;
            local l_IsCharge_0 = v21.IsCharge;
            local v36 = v29.Combos[l_CurrentCombo_0];
            local v37 = v36[l_CurrentPunch_0];
            local v38 = v36.DefaultPunchInfo or l_Styles_0[l_Style_0.Value].DefaultPunchInfo;
            local function _(v39) --[[ Line: 60 ]] --[[ Name: GetPunchInfo ]]
                -- upvalues: v37 (ref), v38 (copy)
                return v37[v39] or v38[v39];
            end;
            if l_CharacterData_0.Stamina.Value <= 0 then
                return;
            else
                local l_Value_0 = l_Occupied_0.LockedOn.Value;
                if l_IsHeavy_0 then
                    v37 = l_Styles_0[l_Style_0.Value].HeavyAttacks[l_CurrentPunch_0];
                elseif l_IsUltimate_0 then
                    v37 = l_Styles_0[l_Style_0.Value].UltimateInfo[1];
                    l_Size_0 = l_Size_0 - Vector3.new(0.6000000238418579, 0, 0, 0);
                elseif l_CurrentPunch_0 > 1 and not l_IsHeavy_0 and not l_IsUltimate_0 then
                    l_Size_0 = l_Size_0 + Vector3.new(0, 0, 0.25, 0);
                end;
                l_Size_0 = l_Size_0 + Vector3.new(0, 0, 1.5, 0);
                local v42 = v37.HitboxSize or v38.HitboxSize;
                if v42 then
                    l_Size_0 = v42;
                end;
                local _ = tick();
                if not v37.HitboxTrackTime then
                    local _ = v38.HitboxTrackTime;
                end;
                local l_l_HitboxManager_0_Hitbox_0 = l_HitboxManager_0:CreateHitbox({
                    Size = l_Size_0, 
                    CFrame = l_HumanoidRootPart_0.CFrame * CFrame.new(0, 0, -l_Size_0.Z / 1.5)
                });
                local function _() --[[ Line: 93 ]] --[[ Name: SetCFrame ]]
                    -- upvalues: l_l_HitboxManager_0_Hitbox_0 (copy), l_HumanoidRootPart_0 (copy), l_Size_0 (ref)
                    l_l_HitboxManager_0_Hitbox_0.CFrame = l_HumanoidRootPart_0.CFrame * CFrame.new(0, 0, -l_Size_0.Z / 1.5);
                end;
                local v47 = {
                    Character = l_Character_0, 
                    Hitbox = l_l_HitboxManager_0_Hitbox_0
                };
                local v48 = nil;
                l_l_HitboxManager_0_Hitbox_0.CFrame = l_HumanoidRootPart_0.CFrame * CFrame.new(0, 0, -l_Size_0.Z / 1.5);
                v48 = l_HitboxManager_0:GetClosestCharacter(v47);
                if l_l_HitboxManager_0_Hitbox_0 then
                    l_l_HitboxManager_0_Hitbox_0:Destroy();
                end;
                if v48 == -1 or not v48 or v48.Parent ~= l_Workspace_0.Live then
                    v48 = false;
                end;
                if v48 then
                    l_Occupied_0.LockedOn.Value = v48;
                end;
                v21.IsLocked = l_Occupied_0.LockedOn.Value and true or false;
                if v14 then
                    if l_IsCharge_0 then
                        l_TryAttack2_0:FireServer({
                            "Charge", 
                            l_InfoToString_0.ConvertAttack(v21)
                        });
                    elseif v21.IsLocked and l_CurrentPunch_0 > 1 and not l_CharacterData_0.Opponent.Value then
                        local v49 = v21.IsLocked and (l_Character_0.PrimaryPart.Position - l_Occupied_0.LockedOn.Value.PrimaryPart.Position).Magnitude;
                        l_TryAttack2_0:FireServer({
                            v48, 
                            v49
                        });
                    end;
                elseif l_IsCharge_0 then
                    v15.ChargeAttack(l_Character_0, {
                        "Charge", 
                        l_InfoToString_0.ConvertAttack(v21)
                    });
                end;
                local v50 = l_Value_0 and l_Workspace_0.States:FindFirstChild(l_Value_0.Name);
                if v50 then
                    local _ = v50:FindFirstChild("CharacterData");
                end;
                if v48 and v48:GetAttribute("DashInvulnerable") then
                    return;
                else
                    return v48;
                end;
            end;
        end;
    end;
end;
return v1;