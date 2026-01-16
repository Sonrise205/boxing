local v0 = {};
local l_Lighting_0 = game:GetService("Lighting");
local _ = workspace.CurrentCamera;
local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Utilities);
local _ = {
    FRAME_WAIT_TIME = 0.03
};
v0.adjustHumanoidProperties = function(v6, v7, v8) --[[ Line: 16 ]] --[[ Name: adjustHumanoidProperties ]]
    v6.WalkSpeed = v8.WalkSpeed or 16;
    v6.JumpPower = v8.JumpPower or 50;
    v6.AutoRotate = v8.AutoRotate ~= false;
    v7.Anchored = v8.Anchored or false;
end;
v0.onMarkerReached = function(v9, v10, v11) --[[ Line: 23 ]] --[[ Name: onMarkerReached ]]
    return (v9:GetMarkerReachedSignal(v10):Connect(v11));
end;
v0.createColorCorrectionEffect = function(v12) --[[ Line: 28 ]] --[[ Name: createColorCorrectionEffect ]]
    -- upvalues: l_Lighting_0 (copy)
    local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
    l_ColorCorrectionEffect_0.Parent = l_Lighting_0;
    if v12 then
        l_ColorCorrectionEffect_0.Contrast = v12.Contrast or 0;
        l_ColorCorrectionEffect_0.Saturation = v12.Saturation or 0;
        l_ColorCorrectionEffect_0.Brightness = v12.Brightness or 0;
    end;
    return l_ColorCorrectionEffect_0;
end;
v0.adjustEffectProperties = function(v14, v15) --[[ Line: 41 ]] --[[ Name: adjustEffectProperties ]]
    for _, v17 in ipairs(v14:GetDescendants()) do
        if v17:IsA("Beam") then
            for v18, v19 in pairs(v15) do
                v17[v18] = v19;
            end;
        end;
    end;
end;
v0.createHighlight = function(v20, v21) --[[ Line: 51 ]] --[[ Name: createHighlight ]]
    v21 = v21 or {};
    local v22 = script.HighlightTemplate:Clone();
    v22.Parent = workspace.Debris;
    v22.Adornee = v20;
    v22.FillTransparency = v21.FillTransparency or 0;
    v22.OutlineTransparency = v21.OutlineTransparency or 1;
    v22.FillColor = v21.FillColor or Color3.new(0, 0, 0);
    return v22;
end;
v0.showSequenceFrames = function(v23, v24) --[[ Line: 65 ]] --[[ Name: showSequenceFrames ]]
    v24 = v24 or 0.03;
    for v25, v26 in ipairs(v23) do
        if v26 and v26:IsA("GuiObject") then
            v26.Visible = true;
            task.wait(v24);
            v26.Visible = v25 == #v23;
        else
            warn("Invalid frame detected at index:", v25);
        end;
    end;
end;
v0.SetTransparency = function(v27, v28) --[[ Line: 80 ]] --[[ Name: SetTransparency ]]
    for _, v30 in v27:GetDescendants() do
        if v30.Name == "UnusualParticle" then
            v30.Enabled = v28 == 0;
        end;
        if (v30:IsA("BasePart") or v30:IsA("Decal")) and v30.LocalTransparencyModifier < 1000 then
            v30.LocalTransparencyModifier = v28;
        end;
    end;
    local l_FirstChild_0 = workspace.Welds:FindFirstChild(v27.Name);
    if l_FirstChild_0 then
        for _, v33 in l_FirstChild_0:GetDescendants() do
            if v33.Name == "UnusualParticle" then
                v33.Enabled = v28 == 0;
            end;
            if (v33:IsA("BasePart") or v33:IsA("Decal")) and v33.LocalTransparencyModifier < 1000 then
                v33.LocalTransparencyModifier = v28;
            end;
        end;
    end;
end;
return v0;