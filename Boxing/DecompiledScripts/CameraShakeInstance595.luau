local v0 = {};
v0.__index = v0;
local l_new_0 = Vector3.new;
local l_noise_0 = math.noise;
v0.CameraShakeState = {
    FadingIn = 0, 
    FadingOut = 1, 
    Sustained = 2, 
    Inactive = 3
};
v0.new = function(v3, v4, v5, v6) --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: l_new_0 (copy), v0 (copy)
    if v5 == nil then
        v5 = 0;
    end;
    if v6 == nil then
        v6 = 0;
    end;
    assert(type(v3) == "number", "Magnitude must be a number");
    assert(type(v4) == "number", "Roughness must be a number");
    assert(type(v5) == "number", "FadeInTime must be a number");
    assert(type(v6) == "number", "FadeOutTime must be a number");
    return (setmetatable({
        Magnitude = v3, 
        Roughness = v4, 
        PositionInfluence = l_new_0(), 
        RotationInfluence = l_new_0(), 
        DeleteOnInactive = true, 
        roughMod = 1, 
        magnMod = 1, 
        fadeOutDuration = v6, 
        fadeInDuration = v5, 
        sustain = v5 > 0, 
        currentFadeTime = v5 > 0 and 0 or 1, 
        tick = Random.new():NextNumber(-100, 100), 
        _camShakeInstance = true
    }, v0));
end;
v0.UpdateShake = function(v7, v8) --[[ Line: 58 ]] --[[ Name: UpdateShake ]]
    -- upvalues: l_noise_0 (copy), l_new_0 (copy)
    local l_tick_0 = v7.tick;
    local l_currentFadeTime_0 = v7.currentFadeTime;
    local v11 = l_new_0(l_noise_0(l_tick_0, 0) * 0.5, l_noise_0(0, l_tick_0) * 0.5, l_noise_0(l_tick_0, l_tick_0) * 0.5);
    if v7.fadeInDuration > 0 and v7.sustain then
        if l_currentFadeTime_0 < 1 then
            l_currentFadeTime_0 = l_currentFadeTime_0 + v8 / v7.fadeInDuration;
        elseif v7.fadeOutDuration > 0 then
            v7.sustain = false;
        end;
    end;
    if not v7.sustain then
        l_currentFadeTime_0 = l_currentFadeTime_0 - v8 / v7.fadeOutDuration;
    end;
    if v7.sustain then
        v7.tick = l_tick_0 + v8 * v7.Roughness * v7.roughMod;
    else
        v7.tick = l_tick_0 + v8 * v7.Roughness * v7.roughMod * l_currentFadeTime_0;
    end;
    v7.currentFadeTime = l_currentFadeTime_0;
    return v11 * v7.Magnitude * v7.magnMod * l_currentFadeTime_0;
end;
v0.InterpolateDistance = function(v12, v13) --[[ Line: 94 ]] --[[ Name: InterpolateDistance ]]
    local l_MinDistance_0 = v13.MinDistance;
    local l_MaxDistance_0 = v13.MaxDistance;
    local v16 = v13.Center or Vector3.new();
    local v17 = 1 - math.clamp((((v13.Target or Vector3.new()) - v16).Magnitude - l_MinDistance_0) / (l_MaxDistance_0 - l_MinDistance_0), 0, 1);
    v12.Magnitude = v12.Magnitude * v17;
    v12.Roughness = v12.Roughness * v17;
end;
v0.StartFadeOut = function(v18, v19) --[[ Line: 109 ]] --[[ Name: StartFadeOut ]]
    if v19 == 0 then
        v18.currentFadeTime = 0;
    end;
    v18.fadeOutDuration = v19;
    v18.fadeInDuration = 0;
    v18.sustain = false;
end;
v0.StartFadeIn = function(v20, v21) --[[ Line: 120 ]] --[[ Name: StartFadeIn ]]
    if v21 == 0 then
        v20.currentFadeTime = 1;
    end;
    v20.fadeInDuration = v21 or v20.fadeInDuration;
    v20.fadeOutDuration = 0;
    v20.sustain = true;
end;
v0.GetScaleRoughness = function(v22) --[[ Line: 130 ]] --[[ Name: GetScaleRoughness ]]
    return v22.roughMod;
end;
v0.SetScaleRoughness = function(v23, v24) --[[ Line: 135 ]] --[[ Name: SetScaleRoughness ]]
    v23.roughMod = v24;
end;
v0.GetScaleMagnitude = function(v25) --[[ Line: 140 ]] --[[ Name: GetScaleMagnitude ]]
    return v25.magnMod;
end;
v0.SetScaleMagnitude = function(v26, v27) --[[ Line: 145 ]] --[[ Name: SetScaleMagnitude ]]
    v26.magnMod = v27;
end;
v0.GetNormalizedFadeTime = function(v28) --[[ Line: 150 ]] --[[ Name: GetNormalizedFadeTime ]]
    return v28.currentFadeTime;
end;
v0.IsShaking = function(v29) --[[ Line: 155 ]] --[[ Name: IsShaking ]]
    local v30 = true;
    if v29.currentFadeTime <= 0 then
        v30 = v29.sustain;
    end;
    return v30;
end;
v0.IsFadingOut = function(v31) --[[ Line: 160 ]] --[[ Name: IsFadingOut ]]
    return not v31.sustain and v31.currentFadeTime > 0;
end;
v0.IsFadingIn = function(v32) --[[ Line: 165 ]] --[[ Name: IsFadingIn ]]
    local v33 = false;
    if v32.currentFadeTime < 1 then
        v33 = v32.sustain and v32.fadeInDuration > 0;
    end;
    return v33;
end;
v0.GetState = function(v34) --[[ Line: 170 ]] --[[ Name: GetState ]]
    -- upvalues: v0 (copy)
    if v34:IsFadingIn() then
        return v0.CameraShakeState.FadingIn;
    elseif v34:IsFadingOut() then
        return v0.CameraShakeState.FadingOut;
    elseif v34:IsShaking() then
        return v0.CameraShakeState.Sustained;
    else
        return v0.CameraShakeState.Inactive;
    end;
end;
return v0;