local v0 = {};
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local _ = game:GetService("StarterGui");
v0.setupViewportFrame = function(v6) --[[ Line: 16 ]] --[[ Name: setupViewportFrame ]]
    local v7 = false;
    if typeof(v6) == "Instance" then
        v7 = v6:IsA("ViewportFrame");
    end;
    assert(v7, "Argument must be a ViewportFrame instance!");
    local l_Camera_0 = Instance.new("Camera");
    l_Camera_0.Parent = v6;
    v6.CurrentCamera = l_Camera_0;
    l_Camera_0.FieldOfView = 50;
    return l_Camera_0;
end;
v0.cloneCharacterToViewport = function(v9, v10) --[[ Line: 25 ]] --[[ Name: cloneCharacterToViewport ]]
    local v11 = false;
    if typeof(v9) == "Instance" then
        v11 = v9:IsA("Model");
    end;
    assert(v11, "Argument must be a Model instance!");
    v11 = false;
    if typeof(v10) == "Instance" then
        v11 = v10:IsA("ViewportFrame");
    end;
    assert(v11, "Argument must be a ViewportFrame instance!");
    v9.Archivable = true;
    local v12 = v9:Clone();
    v12.Parent = v10;
    for _, v14 in pairs(v12:GetDescendants()) do
        if v14:IsA("LocalScript") then
            v14:Destroy();
        end;
    end;
    return v12;
end;
v0.tweenViewportFrame = function(v15, v16, v17) --[[ Line: 41 ]] --[[ Name: tweenViewportFrame ]]
    -- upvalues: l_TweenService_0 (copy)
    local v18 = false;
    if typeof(v15) == "Instance" then
        v18 = v15:IsA("ViewportFrame");
    end;
    assert(v18, "Argument must be a ViewportFrame instance!");
    assert(typeof(v16) == "number", "Argument must be a number!");
    assert(typeof(v17) == "number", "Argument must be a number!");
    l_TweenService_0:Create(v15, TweenInfo.new(v17), {
        ImageTransparency = v16
    }):Play();
end;
v0.updateCameraFrame = function(v19) --[[ Line: 49 ]] --[[ Name: updateCameraFrame ]]
    local v20 = false;
    if typeof(v19) == "Instance" then
        v20 = v19:IsA("Camera");
    end;
    assert(v20, "Argument must be a Camera instance!");
    v19.CFrame = workspace.CurrentCamera.CFrame;
end;
v0.handleCharacterInViewport = function(v21, v22, v23) --[[ Line: 54 ]] --[[ Name: handleCharacterInViewport ]]
    -- upvalues: v0 (copy), l_RunService_0 (copy)
    local v24 = false;
    if typeof(v21) == "Instance" then
        v24 = v21:IsA("Model");
    end;
    assert(v24, "Argument must be a Model instance!");
    v24 = false;
    if typeof(v23) == "Instance" then
        v24 = v23:IsA("ViewportFrame");
    end;
    assert(v24, "Argument must be a ViewportFrame instance!");
    local v25 = v0.setupViewportFrame(v23);
    v24 = Instance.new("WorldModel");
    v24.Parent = v23;
    v22.Parent = v24;
    local v26 = {};
    for _, v28 in ipairs(v21:GetDescendants()) do
        if v28:IsA("Motor6D") then
            for _, v30 in ipairs(v22:GetDescendants()) do
                if v30:IsA("Motor6D") and v30.Name == v28.Name then
                    table.insert(v26, {
                        v28, 
                        v30
                    });
                end;
            end;
        end;
    end;
    local _ = function() --[[ Line: 75 ]] --[[ Name: UpdateParts ]]
        -- upvalues: v26 (copy)
        for _, v32 in ipairs(v26) do
            local v33 = v32[1];
            v32[2].Transform = v33.Transform;
        end;
    end;
    local v35 = false;
    task.delay(0.2, function() --[[ Line: 84 ]]
        -- upvalues: v35 (ref)
        v35 = true;
    end);
    task.spawn(function() --[[ Line: 89 ]]
        -- upvalues: v35 (ref), v23 (copy), v25 (copy), l_RunService_0 (ref)
        while not v35 or v23.Parent ~= nil do
            v25.CFrame = workspace.CurrentCamera.CFrame;
            l_RunService_0.PreSimulation:Wait();
        end;
    end);
    task.spawn(function() --[[ Line: 101 ]]
        -- upvalues: v0 (ref), v23 (copy)
        v0.tweenViewportFrame(v23, 0, 0.2);
    end);
    return false;
end;
GetPlayerData = function(v36) --[[ Line: 108 ]] --[[ Name: GetPlayerData ]]
    if not v36 then
        return;
    else
        local l_FirstChild_0 = workspace:WaitForChild("States"):FindFirstChild(v36.Name);
        if not l_FirstChild_0 then
            return;
        else
            return l_FirstChild_0:FindFirstChild("PlayerData");
        end;
    end;
end;
v0.main = function(v38, v39) --[[ Line: 117 ]] --[[ Name: main ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v0 (copy)
    local v40 = script:FindFirstChild("Viewport") and script.Viewport:Clone();
    if not v40 then
        error("Viewport GUI not found in script!");
    end;
    v40.Parent = v38.PlayerGui;
    local l_VPF_0 = v40:WaitForChild("VPF");
    v39.Archivable = true;
    local v42 = v39:Clone();
    v39.Archivable = false;
    for _, v44 in ipairs(v42:GetDescendants()) do
        if v44:IsA("BaseScript") then
            v44.Enabled = false;
        elseif v44:IsA("BasePart") then
            v44.CollisionGroup = "None";
        end;
    end;
    local v45 = GetPlayerData(v42);
    if v45 then
        l_ReplicatedStorage_0.Events.EquipGloves:Fire(v42, v45.Gloves.Value);
    end;
    v42.Parent = workspace.Debris;
    task.wait();
    return l_VPF_0, (v0.handleCharacterInViewport(v39, v42, l_VPF_0));
end;
return v0;