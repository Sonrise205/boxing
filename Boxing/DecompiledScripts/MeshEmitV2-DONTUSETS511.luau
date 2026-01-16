local v0 = {};
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local v3 = {
    "Position", 
    "Size", 
    "Transparency", 
    "Reflectance", 
    "Color"
};
local v4 = {
    "Offset", 
    "Scale", 
    "VertexColor"
};
local v5 = {
    "Color3", 
    "ZIndex", 
    "Transparency"
};
local function v25(v6, v7, v8, v9) --[[ Line: 8 ]] --[[ Name: Tween ]]
    -- upvalues: v4 (copy), v5 (copy), l_TweenService_0 (copy), v3 (copy)
    local l_SpecialMesh_0 = v6:FindFirstChildOfClass("SpecialMesh");
    local l_Decal_0 = v6:FindFirstChildOfClass("Decal");
    if l_SpecialMesh_0 or l_Decal_0 then
        l_Decal_0.Transparency = v6.Transparency;
        local v12 = {};
        local v13 = {};
        for _, v15 in pairs(v4) do
            v12[v15] = v6[v15];
        end;
        for _, v17 in pairs(v5) do
            v13[v17] = v6[v17];
        end;
        local v18 = {};
        local v19 = {};
        for v20, v21 in pairs(v8) do
            if table.find(v4, v20) then
                v19[v20] = v21;
            end;
            if table.find(v5, v20) then
                v18[v20] = v21;
            end;
        end;
        v19.Scale = v9.End:FindFirstChildOfClass("SpecialMesh").Scale;
        l_TweenService_0:Create(l_SpecialMesh_0, TweenInfo.new(v7.Duration, v7.EasingStyle, v7.EasingDirection), v19):Play();
        l_TweenService_0:Create(l_Decal_0, TweenInfo.new(v7.Duration, v7.EasingStyle, v7.EasingDirection), v18):Play();
        if v7.StayDuration then
            task.delay(v7.StayDuration, function() --[[ Line: 52 ]]
                -- upvalues: l_TweenService_0 (ref), l_SpecialMesh_0 (copy), v7 (copy), v12 (copy), l_Decal_0 (copy), v13 (copy)
                l_TweenService_0:Create(l_SpecialMesh_0, TweenInfo.new(v7.Duration, v7.EasingStyle, v7.EasingDirection), v12):Play();
                l_TweenService_0:Create(l_Decal_0, TweenInfo.new(v7.Duration, v7.EasingStyle, v7.EasingDirection), v13):Play();
            end);
            return;
        end;
    else
        local v22 = {};
        v8.Size = v9.End.Size;
        for _, v24 in pairs(v3) do
            v22[v24] = v6[v24];
        end;
        l_TweenService_0:Create(v6, TweenInfo.new(v7.Duration, v7.EasingStyle, v7.EasingDirection), v8):Play();
        if v7.StayDuration then
            task.delay(v7.StayDuration, function() --[[ Line: 71 ]]
                -- upvalues: l_TweenService_0 (ref), v6 (copy), v7 (copy), v22 (copy)
                l_TweenService_0:Create(v6, TweenInfo.new(v7.Duration, v7.EasingStyle, v7.EasingDirection), v22):Play();
            end);
        end;
    end;
end;
v0.PlayMesh = function(v26, v27) --[[ Line: 83 ]] --[[ Name: PlayMesh ]]
    -- upvalues: l_RunService_0 (copy), v25 (copy)
    print(v26:GetAttributes());
    local v28 = {
        Duration = v26:GetAttribute("TweenDuration_TweenParam"), 
        EasingStyle = v26:GetAttribute("EasingStyle_TweenParam") and Enum.EasingStyle[v26:GetAttribute("EasingStyle_TweenParam")] or Enum.EasingStyle.Linear, 
        EasingDirection = v26:GetAttribute("EasingDirection_TweenParam") and Enum.EasingDirection[v26:GetAttribute("EasingDirection_TweenParam")] or Enum.EasingDirection.Out, 
        StayDuration = v26:GetAttribute("StayDuration_TweenParam")
    };
    local v29 = {
        SpinDuration = v26:GetAttribute("SpinDuration_SpinParam"), 
        SpinSpeed = v26:GetAttribute("SpinSpeed_SpinParam") or 5
    };
    if v27 then
        for _, v31 in pairs(v26:GetDescendants()) do
            if v31:IsA("BasePart") then
                v31.CFrame = v31.CFrame * CFrame.Angles(0, (math.rad((math.random(v27[1], v27[2])))));
            end;
        end;
    end;
    local v32 = nil;
    if v29.SpinDuration then
        v32 = l_RunService_0.Stepped:Connect(function(v33) --[[ Line: 126 ]]
            -- upvalues: v26 (copy), v32 (ref), v29 (copy)
            if not v26 then
                v32:Disconnect();
                return;
            elseif v26:IsA("Model") then
                for _, v35 in pairs(v26:GetChildren()) do
                    v35.CFrame = v35.CFrame * CFrame.Angles(0, math.rad(v29.SpinSpeed), 0);
                    print(v29.SpinSpeed * v33);
                end;
                return;
            elseif v26:IsA("BasePart") then
                local l_v26_0 = v26;
                l_v26_0.CFrame = l_v26_0.CFrame * CFrame.Angles(0, math.rad(v29.SpinSpeed), 0);
                return;
            else
                error("Mesh Type not supported");
                return;
            end;
        end);
        task.delay(v29.SpinDuration, function() --[[ Line: 159 ]]
            -- upvalues: v32 (ref)
            v32:Disconnect();
        end);
    end;
    local l_v26_Attributes_0 = v26:GetAttributes();
    local v38 = {};
    for v39, v40 in pairs(l_v26_Attributes_0) do
        if string.find(v39, "_TweenProperty") then
            v38[string.split(v39, "_")[1]] = v40;
        end;
    end;
    print(v38);
    if v26:IsA("Model") then
        for _, v42 in pairs(v26:GetChildren()) do
            if v42.Name ~= "End" then
                v25(v42, v28, v38, v26);
            end;
        end;
    elseif v26:IsA("BasePart") then
        v25(v26, v28, v38);
    else
        error("Mesh Type not supported");
    end;
end;
return v0;