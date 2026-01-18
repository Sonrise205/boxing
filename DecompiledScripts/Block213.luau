local v0 = false;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("CollectionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("ReplicatedFirst");
local _ = game:GetService("TweenService");
local _ = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local v12;
if game:GetService("RunService"):IsClient() then
    v12 = shared.BridgeNet2;
    if not v12 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v12 = shared.BridgeNet2;
        v0 = v12;
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
local v13 = v12.ReferenceBridge("HandleBlock");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
local _ = l_Parent_0:WaitForChild("HumanoidRootPart");
local l_Humanoid_0 = l_Parent_0:WaitForChild("Humanoid");
local l_Animator_0 = l_Humanoid_0:WaitForChild("Animator");
local v19 = l_Workspace_0:WaitForChild("States"):WaitForChild(l_LocalPlayer_0.Name);
local l_CharacterData_0 = v19:WaitForChild("CharacterData");
local l_PlayerData_0 = v19:WaitForChild("PlayerData");
local l_Occupied_0 = v19:WaitForChild("Occupied");
local l_Style_0 = l_PlayerData_0:WaitForChild("Style");
local v24 = nil;
local v25 = true;
TryBlock = function() --[[ Line: 42 ]] --[[ Name: TryBlock ]]
    -- upvalues: l_PlayerData_0 (copy), l_CharacterData_0 (copy), v24 (ref), v25 (ref), l_Occupied_0 (copy), l_Parent_0 (copy), l_Styles_0 (copy), l_Style_0 (copy), v13 (copy), l_Workspace_0 (copy), l_Animator_0 (copy), l_AnimHelper_0 (copy)
    if l_PlayerData_0.Disable.Value then
        return;
    elseif not l_CharacterData_0.Equipped.Value or l_CharacterData_0.Toxic.Value then
        return;
    else
        local v26 = tick();
        v24 = v26;
        local function v27() --[[ Line: 50 ]] --[[ Name: CheckBlock ]]
            -- upvalues: v25 (ref), l_Occupied_0 (ref), l_CharacterData_0 (ref), l_Parent_0 (ref)
            if not v25 or l_Occupied_0.Blocking.Value or l_CharacterData_0.Blocking.Value or l_CharacterData_0.Cutscene.Value then
                return;
            elseif l_Parent_0:GetAttribute("StaminaBroken") or l_Parent_0:GetAttribute("SlowMo") or l_Parent_0:GetAttribute("Punching") or l_Parent_0:GetAttribute("NoBlock") then
                return;
            elseif l_CharacterData_0.Stamina.Value <= 0 then
                return;
            elseif not l_Occupied_0.CanBlock.Value or l_Occupied_0.Punching.Value then
                return;
            else
                return true;
            end;
        end;
        if v27() ~= true then
            repeat
                task.wait(0.03333333333333333);
            until v27() == true or v26 ~= v24;
        end;
        if v26 ~= v24 then
            return;
        else
            local l_CoreInfo_0 = l_Styles_0[l_Style_0.Value].CoreInfo;
            if l_CoreInfo_0.IgnoreStartPunchAbility then
                l_Parent_0:SetAttribute("IgnoreStart", nil);
            end;
            if l_CoreInfo_0.NoBlock then
                return;
            else
                v13:Fire(true);
                l_Occupied_0.Blocking.Value = true;
                local l_BlockAnimations_0 = l_Styles_0[l_Style_0.Value].BlockAnimations;
                local v30 = {
                    Name = "BlockClient", 
                    FadeIn = l_Styles_0[l_Style_0.Value].BlockAnimations.IdleFade or 0.08333333333333333, 
                    Weight = 2, 
                    Looped = true, 
                    AnimId = l_BlockAnimations_0[l_Workspace_0.StyleMode.Value .. "Idle"] or l_BlockAnimations_0.Idle, 
                    Priority = l_BlockAnimations_0.IdlePriority or Enum.AnimationPriority.Action, 
                    Animator = l_Animator_0
                };
                l_AnimHelper_0:CreateAnim(v30);
                return;
            end;
        end;
    end;
end;
TryUnblock = function() --[[ Line: 93 ]] --[[ Name: TryUnblock ]]
    -- upvalues: v24 (ref), l_Occupied_0 (copy), l_Parent_0 (copy), v13 (copy), l_Styles_0 (copy), l_Style_0 (copy), v25 (ref), l_Animator_0 (copy)
    v24 = tick();
    if not l_Occupied_0.Blocking.Value then
        return;
    else
        l_Parent_0:SetAttribute("TimeSinceLastUnblock", tick());
        v13:Fire(false);
        l_Occupied_0.Blocking.Value = false;
        local v31 = l_Styles_0[l_Style_0.Value].CoreInfo.BlockDebounce or 0.5;
        v25 = false;
        task.delay(v31, function() --[[ Line: 107 ]]
            -- upvalues: v25 (ref)
            v25 = true;
        end);
        for _, v33 in (l_Animator_0:GetPlayingAnimationTracks()) do
            if v33.Priority ~= Enum.AnimationPriority.Idle and v33.Name == "BlockClient" then
                v33:Stop(0.25);
            end;
        end;
        return;
    end;
end;
local l_Keybinds_0 = require(l_ReplicatedStorage_0:WaitForChild("Keybinds"));
local function _() --[[ Line: 123 ]] --[[ Name: GetInterface ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    return l_LocalPlayer_0:GetAttribute("Interface");
end;
l_UserInputService_0.InputBegan:Connect(function(v36, v37) --[[ Line: 125 ]]
    -- upvalues: l_Humanoid_0 (copy), l_LocalPlayer_0 (copy), l_Keybinds_0 (copy)
    if not l_Humanoid_0 or l_Humanoid_0.Health <= 0 then
        return;
    else
        local _ = v36.UserInputType;
        local l_KeyCode_0 = v36.KeyCode;
        local v40 = l_LocalPlayer_0:GetAttribute("Interface") == "Controller";
        local v41 = l_KeyCode_0 == l_Keybinds_0.GetKeybind("Block");
        if v40 then
            v41 = l_KeyCode_0 == l_Keybinds_0.GetGamepadBind("Block");
        elseif v37 then
            return;
        end;
        if v41 then
            TryBlock();
        end;
        return;
    end;
end);
l_UserInputService_0.InputEnded:Connect(function(v42, v43) --[[ Line: 162 ]]
    -- upvalues: l_Humanoid_0 (copy), l_LocalPlayer_0 (copy), l_Keybinds_0 (copy)
    if not l_Humanoid_0 or l_Humanoid_0.Health <= 0 then
        return;
    else
        local _ = v42.UserInputType;
        local l_KeyCode_1 = v42.KeyCode;
        local v46 = l_LocalPlayer_0:GetAttribute("Interface") == "Controller";
        local v47 = l_KeyCode_1 == l_Keybinds_0.GetKeybind("Block");
        if v46 then
            v47 = l_KeyCode_1 == l_Keybinds_0.GetGamepadBind("Block");
        elseif v43 then
            return;
        end;
        if v47 then
            TryUnblock();
        end;
        return;
    end;
end);
l_CharacterData_0.Equipped.Changed:Connect(function(v48) --[[ Line: 182 ]]
    if not v48 then
        TryUnblock();
    end;
end);
l_ReplicatedStorage_0:WaitForChild("MobileEvents"):WaitForChild("SetBlock").Event:Connect(function(v49) --[[ Line: 193 ]]
    if v49 then
        TryBlock();
        return;
    else
        TryUnblock();
        return;
    end;
end);