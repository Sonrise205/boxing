local v0 = {};
local l_TweenService_0 = game:GetService("TweenService");
local l_Debris_0 = game:GetService("Debris");
local _ = game.ReplicatedStorage.Modules;
local v4 = require(script.MeshEmit);
local _ = workspace.CurrentCamera;
local _ = Random.new();
local l_RunService_0 = game:GetService("RunService");
local v8 = require(script.BoatTween);
v0.CreateTween = function(v9, v10) --[[ Line: 29 ]] --[[ Name: CreateTween ]]
    -- upvalues: v8 (copy)
    return (v8.Create(v9, v10));
end;
v0.Clone = function(v11, v12, v13) --[[ Line: 34 ]] --[[ Name: Clone ]]
    v11 = v11:Clone();
    if typeof(v13) == "Vector3" then
        if v11:IsA("BasePart") then
            v11.Position = v13;
        elseif v11:IsA("Model") then
            v11:PivotTo(CFrame.new(v13));
        end;
    elseif typeof(v13) == "CFrame" then
        if v11:IsA("Model") then
            v11:PivotTo(v13);
        else
            v11.CFrame = v13;
        end;
    end;
    v11.Parent = v12;
    return v11;
end;
v0.DelayDestruction = function(v14, v15) --[[ Line: 55 ]] --[[ Name: DelayDestruction ]]
    task.delay(v14, function() --[[ Line: 56 ]]
        -- upvalues: v15 (copy)
        v15:Destroy();
    end);
end;
v0.IsTableEmpty = function(v16) --[[ Line: 61 ]] --[[ Name: IsTableEmpty ]]
    for _, _ in v16 do
        return false;
    end;
    return true;
end;
v0.DeepCloneTable = function(v19) --[[ Line: 68 ]] --[[ Name: DeepCloneTable ]]
    -- upvalues: v0 (copy)
    local v20 = {};
    for v21, v22 in v19 do
        if type(v22) == "table" then
            v20[v21] = v0.DeepCloneTable(v22);
        else
            v20[v21] = v22;
        end;
    end;
    return v20;
end;
v0.Weld = function(v23, v24) --[[ Line: 80 ]] --[[ Name: Weld ]]
    local l_WeldConstraint_0 = Instance.new("WeldConstraint");
    l_WeldConstraint_0.Part0 = v23;
    l_WeldConstraint_0.Part1 = v24;
    l_WeldConstraint_0.Parent = v23;
    return l_WeldConstraint_0;
end;
v0.SetVelocity = function(v26, v27, v28) --[[ Line: 88 ]] --[[ Name: SetVelocity ]]
    -- upvalues: l_Debris_0 (copy)
    if not v26 or not v26:FindFirstChild("HumanoidRootPart") then
        warn("Character or HumanoidRootPart not found");
        return;
    else
        local l_HumanoidRootPart_0 = v26.HumanoidRootPart;
        local l_Attachment_0 = Instance.new("Attachment");
        l_Attachment_0.Name = "VelocityAttachment";
        l_Attachment_0.Parent = l_HumanoidRootPart_0;
        local l_LinearVelocity_0 = Instance.new("LinearVelocity");
        l_LinearVelocity_0.Name = "CharacterVelocity";
        l_LinearVelocity_0.MaxForce = 1e999;
        l_LinearVelocity_0.VectorVelocity = v27;
        l_LinearVelocity_0.Attachment0 = l_Attachment_0;
        l_LinearVelocity_0.Parent = l_HumanoidRootPart_0;
        l_Debris_0:AddItem(l_LinearVelocity_0, v28);
        return;
    end;
end;
v0.toggleAllEmitters = function(v32, v33) --[[ Line: 110 ]] --[[ Name: toggleAllEmitters ]]
    for _, v35 in v32:GetDescendants() do
        if v35:IsA("ParticleEmitter") then
            v35.Enabled = v33 or false;
        end;
    end;
end;
v0.doEmitCount = function(v36) --[[ Line: 118 ]] --[[ Name: doEmitCount ]]
    for _, v38 in pairs(v36:GetDescendants()) do
        if v38:IsA("ParticleEmitter") then
            if v38:GetAttribute("EmitDuration") then
                v38.Enabled = true;
                task.delay(v38:GetAttribute("EmitDuration"), function() --[[ Line: 125 ]]
                    -- upvalues: v38 (copy)
                    v38.Enabled = false;
                end);
            end;
            if v38:GetAttribute("EmitDelay") then
                task.spawn(function() --[[ Line: 137 ]]
                    -- upvalues: v38 (copy)
                    task.wait(v38:GetAttribute("EmitDelay"));
                    v38:Emit(v38:GetAttribute("EmitCount") or 0);
                end);
            else
                v38:Emit(v38:GetAttribute("EmitCount") or 0);
            end;
        end;
    end;
end;
v0.MeshHandler = function(v39, v40) --[[ Line: 153 ]] --[[ Name: MeshHandler ]]
    -- upvalues: l_Debris_0 (copy), v4 (copy)
    for _, v42 in v40 do
        local v43 = v42.mesh:Clone();
        v43.Parent = workspace.MeshSpawn;
        local v44 = v39 * v42.offset;
        if v42.orientation then
            v44 = v44 * CFrame.Angles(math.rad(v42.orientation.X), math.rad(v42.orientation.Y), (math.rad(v42.orientation.Z)));
        end;
        v43:PivotTo(v44);
        l_Debris_0:AddItem(v43, 1);
        v4(v43.Start);
        return v42;
    end;
end;
v0.TweenBeams = function(v45, v46, v47) --[[ Line: 176 ]] --[[ Name: TweenBeams ]]
    -- upvalues: l_TweenService_0 (copy), l_RunService_0 (copy), l_Debris_0 (copy)
    local v48 = v45.Parent:Clone();
    v48.Parent = workspace.MeshSpawn;
    v47 = v47 or v48.CFrame;
    for _, v50 in v48:GetDescendants() do
        if v50:IsA("Beam") then
            v50.Enabled = true;
            local v51 = {
                Width0 = v50.Width0, 
                Width1 = v50.Width1, 
                TextureSpeed = v50.TextureSpeed, 
                Brightness = v50.Brightness
            };
            local v52 = l_TweenService_0:Create(v50, TweenInfo.new(v46.Duration, Enum.EasingStyle[v46.Easing], Enum.EasingDirection[v46.EasingDirection]), v46.Properties);
            v52:Play();
            v52.Completed:Once(function() --[[ Line: 195 ]]
                -- upvalues: v50 (copy), v51 (copy)
                v50.Enabled = false;
                for v53, v54 in v51 do
                    v50[v53] = v54;
                end;
            end);
        end;
    end;
    l_TweenService_0:Create(v48, TweenInfo.new(v46.Duration, Enum.EasingStyle[v46.Easing], Enum.EasingDirection[v46.EasingDirection]), {
        Position = (v47 * v46.Offset).Position
    }):Play();
    local v55 = 0;
    local v56 = nil;
    v56 = l_RunService_0.Heartbeat:Connect(function(v57) --[[ Line: 211 ]]
        -- upvalues: v48 (copy), v46 (copy), v55 (ref), v56 (ref)
        local l_v48_0 = v48;
        l_v48_0.CFrame = l_v48_0.CFrame * CFrame.Angles(0, 0, (math.rad(v46.RotationSpeed)));
        v55 = v55 + v57;
        if v55 > 5 and v56 then
            v56:Disconnect();
        end;
    end);
    l_Debris_0:AddItem(v48, 5);
end;
v0.TweenHighlight = function(v59, v60, v61, v62, v63) --[[ Line: 229 ]] --[[ Name: TweenHighlight ]]
    -- upvalues: l_TweenService_0 (copy), l_Debris_0 (copy)
    local l_Highlight_0 = Instance.new("Highlight");
    l_Highlight_0.Parent = v59;
    l_Highlight_0.Adornee = v59;
    l_Highlight_0.DepthMode = v62 or Enum.HighlightDepthMode.Occluded;
    l_Highlight_0.FillColor = v60 or Color3.new(1, 1, 1);
    l_Highlight_0.OutlineColor = v60 or Color3.new(1, 1, 1);
    l_Highlight_0.FillTransparency = v63;
    l_Highlight_0.OutlineTransparency = 0;
    local v65 = TweenInfo.new(v61 or 1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
    local v66 = {
        FillTransparency = 1, 
        OutlineTransparency = 1
    };
    l_TweenService_0:Create(l_Highlight_0, v65, v66):Play();
    l_Debris_0:AddItem(l_Highlight_0, v61);
    return l_Highlight_0;
end;
v0.TweenPartSize = function(v67, v68) --[[ Line: 248 ]] --[[ Name: TweenPartSize ]]
    -- upvalues: l_TweenService_0 (copy)
    if v67 and v67:IsA("BasePart") then
        local v69 = TweenInfo.new(v68 or 1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
        local v70 = {
            Size = Vector3.new(0, 0, 0, 0)
        };
        local v71 = l_TweenService_0:Create(v67, v69, v70);
        v71:Play();
        return v71;
    else
        return;
    end;
end;
warn("VFXUtilities Module loaded successfully!");
return v0;