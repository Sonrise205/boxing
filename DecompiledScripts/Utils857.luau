local v0 = {};
local v1 = require(script.Debris);
local l_Camera_0 = game.Workspace.Camera;
local function _(v3) --[[ Line: 5 ]] --[[ Name: ShakeCamera ]]
    -- upvalues: l_Camera_0 (copy)
    l_Camera_0.CFrame = l_Camera_0.CFrame * v3;
end;
local _ = Enum.RenderPriority.Camera.Value + 1;
local v6 = {};
local l_TweenService_0 = game:GetService("TweenService");
v0.FixMesh = function(_, v9) --[[ Line: 44 ]] --[[ Name: FixMesh ]]
    local l_Highlight_0 = Instance.new("Highlight");
    l_Highlight_0.Parent = v9;
    l_Highlight_0.OutlineTransparency = 1;
    l_Highlight_0.FillTransparency = 1;
    return l_Highlight_0;
end;
v0.Randomrange = function() --[[ Line: 52 ]]
    return math.random(0, 360) * 0.1;
end;
v6.SwapParents = function(v11, v12) --[[ Line: 56 ]]
    local v13 = {};
    for _, v15 in v11 do
        if v15 and v15.Parent then
            local v16 = v15:Clone();
            table.insert(v13, v16);
            v16.Parent = v12;
        end;
    end;
    return v13;
end;
v6.GroupFX = function(v17) --[[ Line: 68 ]]
    local l_Model_0 = Instance.new("Model");
    for _, v20 in v17 do
        local v21 = v20.Parent ~= workspace.Debris and v20:Clone() or v20;
        if v21 then
            v21.Parent = l_Model_0;
        end;
    end;
    return l_Model_0;
end;
v6.Debris = function(...) --[[ Line: 79 ]]
    -- upvalues: v1 (copy)
    return v1:AddItem(...);
end;
v6.GetFXDescendants = function(v22) --[[ Line: 83 ]]
    local v23 = {};
    for _, v25 in v22:GetDescendants() do
        if v25:IsA("ParticleEmitter") or v25:IsA("Beam") or v25:IsA("Trial") then
            table.insert(v23, v25);
        end;
    end;
    return v23;
end;
v6.ChangeFXColor = function(v26, v27) --[[ Line: 93 ]]
    if v26:IsA("PointLight") or v26:IsA("SpotLight") or v26:IsA("SurfaceLight") then
        v26.Color = v27;
        return;
    else
        if v26:IsA("ParticleEmitter") or v26:IsA("Beam") or v26:IsA("Trial") then
            v26.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, v27), 
                ColorSequenceKeypoint.new(1, v27)
            });
        end;
        return;
    end;
end;
v6.GroundColor = function(v28) --[[ Line: 104 ]]
    if not v28:IsA("BasePart") then
        v28 = v28.Parent;
    end;
    local v29 = RaycastParams.new();
    v29.FilterType = Enum.RaycastFilterType.Include;
    v29.FilterDescendantsInstances = {
        workspace.Rings, 
        workspace.Base
    };
    local v30 = workspace:Raycast(v28.Position + Vector3.new(0, 5, 0, 0), Vector3.new(0, -10, 0, 0), v29);
    if not v30 then
        return;
    else
        local function v33(v31, v32) --[[ Line: 119 ]] --[[ Name: ChangeColor ]]
            v31.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, v32), 
                ColorSequenceKeypoint.new(1, v32)
            });
        end;
        for _, v35 in next, v28:GetDescendants() do
            if (v35.Name == "AfterSmoke" or v35.Name == "Smoke" or v35:GetAttribute("FxSmoke")) and (v35:IsA("ParticleEmitter") or v35:IsA("Beam") or v35:IsA("Trail") or v35:IsA("PointLight") or v35:IsA("BasePart")) then
                v33(v35, v30.Instance.Color);
            end;
        end;
        return;
    end;
end;
v0.VFXHandle = function(v36, v37) --[[ Line: 140 ]]
    -- upvalues: v6 (copy), l_TweenService_0 (copy)
    if not v36 then
        return;
    else
        local v38 = typeof(v36) == "table";
        if v37.Debris then
            if v38 then
                for _, v40 in v36 do
                    v6.Debris(v40, v37.Debris);
                end;
            else
                v6.Debris(v36, v37.Debris);
            end;
        end;
        if v37.Toggle then
            if typeof(v37.Toggle) == "table" then
                local v41 = v38 and v36 or v36:GetDescendants();
                for _, v43 in v41 do
                    if v43:IsA("ParticleEmitter") and table.find(v37.Toggle, "ParticleEmitter") or v43:IsA("Beam") and table.find(v37.Toggle, "Beam") or v43:IsA("Trial") and table.find(v37.Toggle, "Trail") then
                        v43.Enabled = v37.Toggle[1] == "On";
                    end;
                    if v43:IsA("PointLight") or v43:IsA("SpotLight") or v43:IsA("SurfaceLight") then
                        l_TweenService_0:Create(v43, TweenInfo.new(v37.Debris or 1, Enum.EasingStyle.Sine), {
                            Brightness = 0
                        }):Play();
                    end;
                end;
            else
                local v44 = v38 and v36 or v36:GetDescendants();
                for _, v46 in v44 do
                    if v46:IsA("ParticleEmitter") or v46:IsA("Beam") or v46:IsA("Trial") then
                        v46.Enabled = v37.Toggle == "On";
                    end;
                    if v46:IsA("PointLight") or v46:IsA("SpotLight") or v46:IsA("SurfaceLight") then
                        l_TweenService_0:Create(v46, TweenInfo.new(v37.Debris or 1, Enum.EasingStyle.Sine), {
                            Brightness = 0
                        }):Play();
                    end;
                end;
            end;
        end;
        if typeof(v37.Toggle) ~= "table" and v37.Emit then
            local v47 = v38 and v36 or v36:GetDescendants();
            for _, v49 in v47 do
                local l_v49_Attributes_0 = v49:GetAttributes();
                if l_v49_Attributes_0 and not v49:GetAttribute("Disabled") then
                    if v49:IsA("ParticleEmitter") then
                        local l_EmitDelay_0 = l_v49_Attributes_0.EmitDelay;
                        local v52 = l_v49_Attributes_0.EmitDuration or 0;
                        task.delay(l_EmitDelay_0, function() --[[ Line: 191 ]]
                            -- upvalues: v52 (copy), v49 (copy), l_v49_Attributes_0 (copy)
                            if v52 > 0 then
                                task.defer(function() --[[ Line: 193 ]]
                                    -- upvalues: v49 (ref), v52 (ref)
                                    v49.Enabled = true;
                                    task.wait(v52);
                                    v49.Enabled = false;
                                end);
                                return;
                            else
                                v49:Emit(l_v49_Attributes_0.EmitCount);
                                return;
                            end;
                        end);
                    end;
                    if v49:IsA("PointLight") or v49:IsA("SpotLight") or v49:IsA("SurfaceLight") then
                        local _ = v49.Brightness;
                        l_TweenService_0:Create(v49, TweenInfo.new(l_v49_Attributes_0.TweenTime or 1, Enum.EasingStyle.Sine), {
                            Brightness = 0
                        }):Play();
                    end;
                end;
            end;
        end;
        return {
            EditColor = function(v54, v55) --[[ Line: 212 ]] --[[ Name: EditColor ]]
                -- upvalues: v6 (ref), v36 (copy)
                v54 = v54 == "All" and v6.GetFXDescendants(v36) or v54;
                if type(v54) == "table" then
                    for _, v57 in v54 do
                        if v55.Color == "GroundColor" then
                            v6.GroundColor(v57);
                        else
                            v6.ChangeFXColor(v57, v55.Color);
                        end;
                    end;
                    return;
                elseif v55.Color == "GroundColor" then
                    v6.GroundColor(v54);
                    return;
                else
                    v6.ChangeFXColor(v54, v55.Color);
                    return;
                end;
            end, 
            EditProperties = function(v58, v59) --[[ Line: 231 ]] --[[ Name: EditProperties ]]
                -- upvalues: v6 (ref), v36 (copy)
                v58 = v58 == "All" and v6.GetFXDescendants(v36) or v58;
                if type(v58) == "table" then
                    for _, v61 in v58 do
                        for v62, v63 in v59 do
                            if v61 and v61[v62] then
                                v61[v62] = v63;
                            end;
                        end;
                    end;
                    return;
                else
                    for v64, v65 in v59 do
                        if v64 and v64[v64] then
                            v64[v64] = v65;
                        end;
                    end;
                    return;
                end;
            end
        };
    end;
end;
v0.CreateOrgin = function(v66, v67) --[[ Line: 255 ]]
    local l_Position_0 = v66.Position;
    local v69 = workspace:Raycast(l_Position_0, Vector3.new(0, -15, 0, 0), v67);
    if not v69 or not v69.Instance then

    end;
    return l_Position_0, v66, v69;
end;
v0.scaleModel = function(_, v71, v72, ...) --[[ Line: 265 ]] --[[ Name: scaleModel ]]
    local v73 = {
        ...
    };
    local v74 = v73[1] or 1;
    local v75 = v73[2] or 1;
    local v76 = v73[3] or nil;
    local v77 = v73[4] or {};
    local v78 = false;
    if typeof(v71) == "Instance" then
        v78 = v71:IsA("Model");
    end;
    assert(v78, "Input must be a Model");
    v78 = false;
    if typeof(v72) == "number" then
        v78 = v72 > 0;
    end;
    assert(v78, "Scale must be a positive number");
    local v79 = {
        "VertexColor", 
        "Transparency", 
        "delay", 
        "Repeat", 
        "time"
    };
    for _, v81 in v77 do
        table.insert(v79, v81);
    end;
    v78 = function(v82) --[[ Line: 288 ]] --[[ Name: scaleAttributes ]]
        -- upvalues: v79 (copy), v74 (copy), v72 (copy)
        for v83, v84 in v82:GetAttributes() do
            if table.find(v79, v83) then
                if v83 == "time" and v74 then
                    v82:SetAttribute(v83, v84 * v74);
                end;
            elseif typeof(v84) == "Vector3" then
                v82:SetAttribute(v83, v84 * v72);
            elseif typeof(v84) == "number" then
                v82:SetAttribute(v83, v84 * v72);
            end;
        end;
    end;
    v71:ScaleTo(v76 and v76 or v72);
    for _, v86 in v71:GetDescendants() do
        if v86:IsA("CFrameValue") then
            local _ = CFrame.new(v86.Value.Position * v75) * v86.Value.Rotation;
        end;
        v78(v86);
    end;
end;
v0.delta_weld = function(_, v89, v90, v91, v92) --[[ Line: 318 ]] --[[ Name: delta_weld ]]
    local v93 = nil;
    v93 = game["Run Service"].RenderStepped:Connect(function() --[[ Line: 319 ]]
        -- upvalues: v90 (copy), v93 (ref), v89 (copy), v91 (copy)
        if not v90 then
            v93:Disconnect();
        end;
        local v94 = nil;
        if typeof(v89) == "function" then
            local l_status_0, _ = pcall(v89);
            if not l_status_0 then
                v93:Disconnect();
                return;
            else
                v94 = v89();
            end;
        elseif typeof(v89) == "Instance" then
            v94 = if v89:IsA("Model") then v89:GetPivot() else v89.CFrame;
        elseif typeof(v89) == "CFrame" then
            v94 = v89;
        end;
        if not v94 or not v90 then
            v93:Disconnect();
            return;
        elseif v90:IsA("Model") then
            v90:PivotTo(v94 * v91);
            return;
        else
            v90.CFrame = v94 * (v91 and v91 or CFrame.new());
            return;
        end;
    end);
    if v92 then
        task.delay(v92 or 15, function() --[[ Line: 356 ]]
            -- upvalues: v93 (ref)
            if v93 and typeof(v93) == "RBXScriptConnection" then
                v93:Disconnect();
            end;
        end);
    end;
    return {
        Destory = function() --[[ Line: 365 ]] --[[ Name: Destory ]]
            -- upvalues: v93 (ref)
            if v93 then
                v93:Disconnect();
            end;
        end, 
        Connection = v93
    };
end;
v0.createinfo = function(_, v98) --[[ Line: 375 ]] --[[ Name: createinfo ]]
    local l_v98_Attributes_0 = v98:GetAttributes();
    return TweenInfo.new(l_v98_Attributes_0.time, Enum.EasingStyle[l_v98_Attributes_0.style], Enum.EasingDirection[l_v98_Attributes_0.direction], tonumber(l_v98_Attributes_0.Repeat), l_v98_Attributes_0.reverse, (tonumber(l_v98_Attributes_0.delay)));
end;
v0.RaycastParams = {
    Map = function() --[[ Line: 381 ]] --[[ Name: Map ]]
        local v100 = RaycastParams.new();
        v100.FilterType = Enum.RaycastFilterType.Include;
        v100.FilterDescendantsInstances = {
            workspace.Rings, 
            workspace.Base
        };
        return v100;
    end
};
v0.OverlapParams = {
    Map = function() --[[ Line: 391 ]] --[[ Name: Map ]]
        local v101 = OverlapParams.new();
        v101.FilterType = Enum.RaycastFilterType.Include;
        v101.FilterDescendantsInstances = {
            workspace.Rings, 
            workspace.Base
        };
        return v101;
    end
};
v0.RequestRaycastParams = function(v102) --[[ Line: 400 ]]
    -- upvalues: v0 (copy)
    assert(v0.RaycastParams[v102], "Requested raycast params does not exist - " .. v102);
    return v0.RaycastParams[v102] ~= nil and v0.RaycastParams[v102]() or nil;
end;
v0.RequestOverlapParams = function(v103) --[[ Line: 405 ]]
    -- upvalues: v0 (copy)
    assert(v0.OverlapParams[v103], "Requested raycast params does not exist - " .. v103);
    return v0.OverlapParams[v103] ~= nil and v0.OverlapParams[v103]() or nil;
end;
return v0;