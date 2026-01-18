local v0 = {};
v0.__index = v0;
local l_profilebegin_0 = debug.profilebegin;
local l_profileend_0 = debug.profileend;
local l_new_0 = Vector3.new;
local l_new_1 = CFrame.new;
local l_Angles_0 = CFrame.Angles;
local l_rad_0 = math.rad;
local v7 = l_new_0();
local l_CameraShakeInstance_0 = require(script:WaitForChild("CameraShakeInstance"));
local l_CameraShakeState_0 = l_CameraShakeInstance_0.CameraShakeState;
v0.CameraShakeInstance = l_CameraShakeInstance_0;
v0.Presets = require(script:WaitForChild("CameraShakePresets"));
v0.new = function(v10, v11) --[[ Line: 72 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), v0 (copy)
    assert(type(v10) == "number", "RenderPriority must be a number (e.g.: Enum.RenderPriority.Camera.Value)");
    assert(type(v11) == "function", "Callback must be a function");
    return (setmetatable({
        _running = false, 
        _renderName = "CameraShaker", 
        _renderPriority = v10, 
        _posAddShake = v7, 
        _rotAddShake = v7, 
        _camShakeInstances = {}, 
        _removeInstances = {}, 
        _callback = v11
    }, v0));
end;
v0.Start = function(v12) --[[ Line: 93 ]] --[[ Name: Start ]]
    -- upvalues: l_profilebegin_0 (copy), l_profileend_0 (copy)
    if v12._running then
        return;
    else
        v12._running = true;
        local l__callback_0 = v12._callback;
        game:GetService("RunService"):BindToRenderStep(v12._renderName, v12._renderPriority, function(v14) --[[ Line: 97 ]]
            -- upvalues: l_profilebegin_0 (ref), v12 (copy), l_profileend_0 (ref), l__callback_0 (copy)
            l_profilebegin_0("CameraShakerUpdate");
            local v15 = v12:Update(v14);
            l_profileend_0();
            l__callback_0(v15);
        end);
        return;
    end;
end;
v0.Stop = function(v16) --[[ Line: 106 ]] --[[ Name: Stop ]]
    if not v16._running then
        return;
    else
        game:GetService("RunService"):UnbindFromRenderStep(v16._renderName);
        v16._running = false;
        return;
    end;
end;
local l_Settings_0 = workspace:WaitForChild("Settings");
v0.Update = function(v18, v19) --[[ Line: 114 ]] --[[ Name: Update ]]
    -- upvalues: v7 (copy), l_CameraShakeState_0 (copy), l_Settings_0 (copy), l_new_1 (copy), l_Angles_0 (copy), l_rad_0 (copy)
    local l_v7_0 = v7;
    local l_v7_1 = v7;
    local l__camShakeInstances_0 = v18._camShakeInstances;
    for v23 = 1, #l__camShakeInstances_0 do
        local v24 = l__camShakeInstances_0[v23];
        local l_v24_State_0 = v24:GetState();
        if l_v24_State_0 == l_CameraShakeState_0.Inactive and v24.DeleteOnInactive then
            v18._removeInstances[#v18._removeInstances + 1] = v23;
        elseif l_v24_State_0 ~= l_CameraShakeState_0.Inactive then
            l_v7_0 = l_v7_0 + v24:UpdateShake(v19) * v24.PositionInfluence;
            l_v7_1 = l_v7_1 + v24:UpdateShake(v19) * v24.RotationInfluence;
        end;
    end;
    for v26 = #v18._removeInstances, 1, -1 do
        local v27 = v18._removeInstances[v26];
        table.remove(l__camShakeInstances_0, v27);
        v18._removeInstances[v26] = nil;
    end;
    local v28 = 1;
    if l_Settings_0.ReduceCameraShake.Value then
        v28 = 0.425;
    end;
    return l_new_1(l_v7_0 * v28) * l_Angles_0(0, l_rad_0(l_v7_1.Y * v28), 0) * l_Angles_0(l_rad_0(l_v7_1.X * v28), 0, (l_rad_0(l_v7_1.Z * v28)));
end;
v0.Shake = function(v29, v30) --[[ Line: 157 ]] --[[ Name: Shake ]]
    local v31 = false;
    if type(v30) == "table" then
        v31 = v30._camShakeInstance;
    end;
    assert(v31, "ShakeInstance must be of type CameraShakeInstance");
    v29._camShakeInstances[#v29._camShakeInstances + 1] = v30;
    return v30;
end;
v0.ShakeSustain = function(v32, v33) --[[ Line: 164 ]] --[[ Name: ShakeSustain ]]
    local v34 = false;
    if type(v33) == "table" then
        v34 = v33._camShakeInstance;
    end;
    assert(v34, "ShakeInstance must be of type CameraShakeInstance");
    v32._camShakeInstances[#v32._camShakeInstances + 1] = v33;
    v33:StartFadeIn(v33.fadeInDuration);
    return v33;
end;
v0.ShakeOnce = function(v35, v36, v37, v38, v39, v40, v41) --[[ Line: 172 ]] --[[ Name: ShakeOnce ]]
    -- upvalues: l_CameraShakeInstance_0 (copy)
    local v42 = l_CameraShakeInstance_0.new(v36, v37, v38, v39);
    v42.PositionInfluence = typeof(v40) == "Vector3" and v40 or Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
    v42.RotationInfluence = typeof(v41) == "Vector3" and v41 or Vector3.new(1, 1, 1, 0);
    v35._camShakeInstances[#v35._camShakeInstances + 1] = v42;
    return v42;
end;
v0.StartShake = function(v43, v44, v45, v46, v47, v48) --[[ Line: 181 ]] --[[ Name: StartShake ]]
    -- upvalues: l_CameraShakeInstance_0 (copy)
    local v49 = l_CameraShakeInstance_0.new(v44, v45, v46);
    v49.PositionInfluence = typeof(v47) == "Vector3" and v47 or Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
    v49.RotationInfluence = typeof(v48) == "Vector3" and v48 or Vector3.new(1, 1, 1, 0);
    v49:StartFadeIn(v46);
    v43._camShakeInstances[#v43._camShakeInstances + 1] = v49;
    return v49;
end;
return v0;