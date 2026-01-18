local v0 = {};
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
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
    v9.Archivable = false;
    v12.Parent = v10;
    for _, v14 in pairs(v12:GetDescendants()) do
        if v14:IsA("LocalScript") then
            v14:Destroy();
        end;
    end;
    return v12;
end;
v0.tweenViewportFrame = function(v15, v16, v17) --[[ Line: 44 ]] --[[ Name: tweenViewportFrame ]]
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
v0.updateCameraFrame = function(v19) --[[ Line: 52 ]] --[[ Name: updateCameraFrame ]]
    local v20 = false;
    if typeof(v19) == "Instance" then
        v20 = v19:IsA("Camera");
    end;
    assert(v20, "Argument must be a Camera instance!");
    v19.CFrame = workspace.CurrentCamera.CFrame;
end;
v0.handleCharactersInViewport = function(v21, v22, v23, v24, v25) --[[ Line: 57 ]] --[[ Name: handleCharactersInViewport ]]
    -- upvalues: v0 (copy), l_RunService_0 (copy)
    local v26 = false;
    if typeof(v25) == "Instance" then
        v26 = v25:IsA("ViewportFrame");
    end;
    assert(v26, "Argument must be a ViewportFrame instance!");
    local v27 = v0.setupViewportFrame(v25);
    v26 = v25:FindFirstChild("WorldModel");
    v26.Parent = v25;
    v23.Parent = v26;
    v24.Parent = v26;
    local v28 = {};
    local v29 = {};
    for _, v31 in ipairs(v21:GetDescendants()) do
        if v31:IsA("Motor6D") then
            local l_v23_FirstChild_0 = v23:FindFirstChild(v31.Name, true);
            if l_v23_FirstChild_0 then
                table.insert(v28, {
                    v31, 
                    l_v23_FirstChild_0
                });
            end;
        end;
    end;
    for _, v34 in ipairs(v22:GetDescendants()) do
        if v34:IsA("Motor6D") then
            local l_v24_FirstChild_0 = v24:FindFirstChild(v34.Name, true);
            if l_v24_FirstChild_0 then
                table.insert(v29, {
                    v34, 
                    l_v24_FirstChild_0
                });
            end;
        end;
    end;
    local function v40() --[[ Line: 90 ]] --[[ Name: updateParts ]]
        -- upvalues: v28 (copy), v29 (copy)
        for _, v37 in ipairs(v28) do
            v37[2].Transform = v37[1].Transform;
        end;
        for _, v39 in ipairs(v29) do
            v39[2].Transform = v39[1].Transform;
        end;
    end;
    local v41 = false;
    task.delay(0.2, function() --[[ Line: 101 ]]
        -- upvalues: v41 (ref)
        v41 = true;
    end);
    local v42 = nil;
    v42 = l_RunService_0.PreSimulation:Connect(function() --[[ Line: 107 ]]
        -- upvalues: v41 (ref), v25 (copy), v42 (ref), v40 (copy), v27 (copy)
        if v41 and v25.Parent == nil then
            v42:Disconnect();
            v42 = nil;
            return;
        else
            v40();
            v27.CFrame = workspace.CurrentCamera.CFrame;
            return;
        end;
    end);
    task.spawn(function() --[[ Line: 119 ]]
        -- upvalues: v0 (ref), v25 (copy)
        v0.tweenViewportFrame(v25, 0, 0.2);
    end);
    return v42;
end;
GetPlayerData = function(v43) --[[ Line: 126 ]] --[[ Name: GetPlayerData ]]
    if not v43 then
        return;
    else
        local l_FirstChild_0 = workspace:WaitForChild("States"):FindFirstChild(v43.Name);
        if not l_FirstChild_0 then
            return;
        else
            return l_FirstChild_0:FindFirstChild("PlayerData");
        end;
    end;
end;
v0.main = function(v45, v46) --[[ Line: 135 ]] --[[ Name: main ]]
    -- upvalues: l_Players_0 (copy), v0 (copy), l_ReplicatedStorage_0 (copy)
    local v47 = script:FindFirstChild("Viewport") and script.Viewport:Clone();
    if not v47 then
        error("Viewport GUI not found in script!");
    end;
    v47.Parent = l_Players_0.LocalPlayer.PlayerGui;
    local l_VPF_0 = v47:WaitForChild("VPF");
    local v49 = v0.cloneCharacterToViewport(v45, l_VPF_0);
    local v50 = v0.cloneCharacterToViewport(v46, l_VPF_0);
    for _, v52 in ipairs(v49:GetDescendants()) do
        if v52:IsA("BaseScript") then
            v52.Enabled = false;
        elseif v52:IsA("BasePart") then
            v52.CollisionGroup = "None";
        end;
    end;
    for _, v54 in ipairs(v50:GetDescendants()) do
        if v54:IsA("BaseScript") then
            v54.Enabled = false;
        elseif v54:IsA("BasePart") then
            v54.CollisionGroup = "None";
        end;
    end;
    local v55 = GetPlayerData(v49);
    if v55 then
        l_ReplicatedStorage_0.Events.EquipGloves:Fire(v49, v55.Gloves.Value);
    end;
    local v56 = GetPlayerData(v50);
    if v55 then
        l_ReplicatedStorage_0.Events.EquipGloves:Fire(v50, v56.Gloves.Value);
    end;
    v50.Parent = workspace.Debris;
    v49.Parent = workspace.Debris;
    task.wait();
    return l_VPF_0, (v0.handleCharactersInViewport(v45, v46, v49, v50, l_VPF_0));
end;
return v0;