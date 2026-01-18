--!native
local v0 = false;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local _ = game:GetService("SoundService");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("StarterGui");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0:WaitForChild("AnimHelper"));
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local l_DashShared_0 = require(l_Modules_0:WaitForChild("DashShared"));
local l_CombatShared_0 = require(l_Modules_0:WaitForChild("CombatShared"));
local l_CustomControlsShared_0 = require(l_Modules_0:WaitForChild("CustomControlsShared"));
local v17 = nil;
local v18 = nil;
local v19 = nil;
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local _ = require(l_ReplicatedStorage_0:WaitForChild("InfoToString"));
local v22 = game.PlaceId == l_Places_0.Trading;
local v23;
if game:GetService("RunService"):IsClient() then
    v23 = shared.BridgeNet2;
    if not v23 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v23 = shared.BridgeNet2;
        v0 = v23;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v23 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v24 = v23.ReferenceBridge("HandleEquip");
local _ = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents"):WaitForChild("TryDash");
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = require(l_LocalPlayer_0:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls();
local l_EffectHelper_0 = require(l_ReplicatedStorage_0:WaitForChild("Modules"):WaitForChild("EffectHelper"));
local v30 = l_Workspace_0:WaitForChild("States"):WaitForChild(l_LocalPlayer_0.Name);
local l_CharacterData_0 = v30:WaitForChild("CharacterData");
local l_PlayerData_0 = v30:WaitForChild("PlayerData");
local l_Occupied_0 = v30:WaitForChild("Occupied");
local l_Style_0 = l_PlayerData_0:WaitForChild("Style");
local v35 = l_Styles_0[l_Style_0.Value];
local l_CoreInfo_0 = v35.CoreInfo;
local _ = l_ReplicatedStorage_0.Events;
l_Style_0.Changed:Connect(function() --[[ Line: 61 ]]
    -- upvalues: v35 (ref), l_Styles_0 (copy), l_Style_0 (copy), l_CoreInfo_0 (ref)
    v35 = l_Styles_0[l_Style_0.Value];
    l_CoreInfo_0 = v35.CoreInfo;
end);
local function _(v38, v39, v40) --[[ Line: 66 ]] --[[ Name: Lerp ]]
    return v38 + (v39 - v38) * v40;
end;
SwitchEquip = function() --[[ Line: 70 ]] --[[ Name: SwitchEquip ]]
    -- upvalues: l_PlayerData_0 (copy), l_CharacterData_0 (copy), v22 (copy), l_Occupied_0 (copy), v35 (ref), l_Workspace_0 (copy)
    if l_PlayerData_0.Disable.Value then
        return;
    elseif l_CharacterData_0.Cutscene.Value or l_CharacterData_0.Opponent.Value or EquipDebounce then
        return;
    elseif v22 and not l_Occupied_0.Equipped.Value and humanoid:GetState() == Enum.HumanoidStateType.Swimming then
        return;
    else
        EquipDebounce = true;
        local v42 = v35.EquipDebounce or 0.5;
        if not l_Occupied_0.Equipped.Value then

        end;
        task.delay(v42, function() --[[ Line: 88 ]]
            EquipDebounce = false;
        end);
        if l_Occupied_0.Equipped.Value then
            l_Occupied_0.LockedOn.Value = nil;
        elseif l_Workspace_0.CurrentMenu.Value ~= "" then
            return;
        end;
        l_Occupied_0.Equipped.Value = not l_Occupied_0.Equipped.Value;
        local _ = l_Occupied_0.Equipped.Value;
        if v35.ClientOnEquip then
            v35.ClientOnEquip({
                Character = character
            });
        end;
        return;
    end;
end;
l_Workspace_0.CurrentMenu.Changed:Connect(function(v44) --[[ Line: 108 ]]
    -- upvalues: l_Occupied_0 (copy)
    if v44 == "" or v44 == "Emotes" then
        return;
    else
        if l_Occupied_0.Equipped.Value then
            SwitchEquip();
        end;
        return;
    end;
end);
local v45 = {};
for _, v47 in l_Occupied_0:GetChildren() do
    v45[v47.Name] = v47.Value;
end;
while not l_LocalPlayer_0.Character do
    task.wait();
end;
local function v58(v48) --[[ Line: 119 ]] --[[ Name: HandleCharacter ]]
    -- upvalues: l_Workspace_0 (copy), l_RunService_0 (copy), l_CurrentCamera_0 (copy), l_Occupied_0 (copy), v45 (copy), v22 (copy), v18 (ref), l_CombatShared_0 (copy), v17 (ref), l_DashShared_0 (copy), v19 (ref), l_CustomControlsShared_0 (copy), l_EffectHelper_0 (copy), v24 (copy), l_UserInputService_0 (copy)
    if not v48 then
        return;
    else
        character = nil;
        humanoid = v48:WaitForChild("Humanoid");
        humanoid.AutoRotate = false;
        local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
        local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
        l_CameraMode_0.Value = "";
        l_CurrentCamera_1.FieldOfView = 70;
        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
        l_CurrentCamera_0.CameraSubject = humanoid;
        for _, v52 in l_Occupied_0:GetChildren() do
            v52.Value = v45[v52.Name];
        end;
        local v53 = {
            "FallingDown", 
            "RunningNoPhysics", 
            "Ragdoll", 
            "GettingUp", 
            "Flying", 
            "Seated", 
            "Swimming"
        };
        if v22 then
            v53 = {};
        end;
        for _, v55 in v53 do
            humanoid:SetStateEnabled(Enum.HumanoidStateType[v55], false);
        end;
        character = v48;
        local v56 = {
            Character = character
        };
        if not v18 then
            v18 = l_CombatShared_0.New(v56);
        else
            v18:Init(v56);
        end;
        if not v17 then
            v17 = l_DashShared_0.New(v56);
        else
            v17:Init(v56);
        end;
        if not v19 then
            v19 = l_CustomControlsShared_0.New(v56);
        else
            v19:Init(v56);
        end;
        humanoid.Died:Connect(function() --[[ Line: 185 ]]
            -- upvalues: l_Occupied_0 (ref), l_EffectHelper_0 (ref)
            if l_Occupied_0.Equipped.Value then
                SwitchEquip();
            end;
            l_EffectHelper_0.MainTransition({
                FadeTime = 1, 
                HoldTime = 1
            });
            ShiftLock(false);
        end);
        local function _() --[[ Line: 198 ]] --[[ Name: ShouldShiftLock ]]
            -- upvalues: l_Occupied_0 (ref), l_Workspace_0 (ref)
            return l_Occupied_0.Equipped.Value and not (l_Workspace_0.CurrentMenu.Value == "Emotes");
        end;
        l_Occupied_0.Equipped.Changed:Connect(function() --[[ Line: 202 ]]
            -- upvalues: v24 (ref), l_Occupied_0 (ref), l_UserInputService_0 (ref), l_Workspace_0 (ref)
            v24:Fire(l_Occupied_0.Equipped.Value);
            l_UserInputService_0.MouseIconEnabled = not (l_Occupied_0.Equipped.Value and not (l_Workspace_0.CurrentMenu.Value == "Emotes"));
            ShiftLock(l_Occupied_0.Equipped.Value and not (l_Workspace_0.CurrentMenu.Value == "Emotes"));
        end);
        l_Workspace_0.CurrentMenu.Changed:Connect(function() --[[ Line: 209 ]]
            -- upvalues: l_UserInputService_0 (ref), l_Occupied_0 (ref), l_Workspace_0 (ref)
            l_UserInputService_0.MouseIconEnabled = not (l_Occupied_0.Equipped.Value and not (l_Workspace_0.CurrentMenu.Value == "Emotes"));
            ShiftLock(l_Occupied_0.Equipped.Value and not (l_Workspace_0.CurrentMenu.Value == "Emotes"));
        end);
        return;
    end;
end;
v58(l_LocalPlayer_0.Character);
TryDash = function(v59) --[[ Line: 222 ]] --[[ Name: TryDash ]]
    -- upvalues: v17 (ref)
    v17:TryDash(v59);
end;
l_RunService_0:BindToRenderStep("Control", Enum.RenderPriority.Camera.Value + 1, function(v60) --[[ Line: 226 ]]
    -- upvalues: v19 (ref)
    if not v19 then
        return;
    else
        v19:Update(v60);
        return;
    end;
end);
ShiftLock = function(v61) --[[ Line: 231 ]] --[[ Name: ShiftLock ]]
    -- upvalues: l_UserInputService_0 (copy)
    if v61 then
        l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.LockCenter;
        return;
    else
        l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.Default;
        return;
    end;
end;
l_LocalPlayer_0.CharacterAdded:Connect(v58);
EquipDebounce = false;
local l_Keybinds_0 = require(l_ReplicatedStorage_0:WaitForChild("Keybinds"));
local _ = game:GetService("GuiService");
local function _() --[[ Line: 248 ]] --[[ Name: IsXbox ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    return l_LocalPlayer_0:GetAttribute("Interface") == "Controller";
end;
local function _() --[[ Line: 252 ]] --[[ Name: GetInterface ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    return l_LocalPlayer_0:GetAttribute("Interface");
end;
l_UserInputService_0.InputBegan:Connect(function(v66, v67) --[[ Line: 253 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Keybinds_0 (copy), l_Workspace_0 (copy)
    if not character or not humanoid or humanoid.Health <= 0 then
        return;
    else
        local _ = v66.UserInputType;
        local l_KeyCode_0 = v66.KeyCode;
        local v70 = l_LocalPlayer_0:GetAttribute("Interface") == "Controller";
        local v71 = l_KeyCode_0 == l_Keybinds_0.GetKeybind("Dash");
        if v70 then
            v71 = l_KeyCode_0 == l_Keybinds_0.GetGamepadBind("Dash");
        elseif v67 then
            return;
        end;
        if v71 then
            TryDash();
        elseif v66.KeyCode == Enum.KeyCode.One or v66.KeyCode == Enum.KeyCode.ButtonL1 then
            SwitchEquip();
        end;
        if l_LocalPlayer_0.Name == "drowningsome" and l_KeyCode_0 == Enum.KeyCode.P then
            l_Workspace_0.TestingValue.Value = not l_Workspace_0.TestingValue.Value;
        end;
        return;
    end;
end);
local l_MobileEvents_0 = l_ReplicatedStorage_0:WaitForChild("MobileEvents");
local l_TryDash_1 = l_MobileEvents_0:WaitForChild("TryDash");
local l_TrySwitchEquip_0 = l_MobileEvents_0:WaitForChild("TrySwitchEquip");
l_TryDash_1.Event:Connect(function() --[[ Line: 287 ]]
    TryDash();
end);
l_TrySwitchEquip_0.Event:Connect(function() --[[ Line: 291 ]]
    SwitchEquip();
end);