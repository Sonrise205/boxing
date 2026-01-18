local v0 = {};
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
v0.setupViewportFrame = function(v4) --[[ Line: 7 ]] --[[ Name: setupViewportFrame ]]
    local v5 = false;
    if typeof(v4) == "Instance" then
        v5 = v4:IsA("ViewportFrame");
    end;
    assert(v5, "Argument must be a ViewportFrame instance!");
    local l_Camera_0 = Instance.new("Camera");
    l_Camera_0.Parent = v4;
    v4.CurrentCamera = l_Camera_0;
    l_Camera_0.FieldOfView = 50;
    return l_Camera_0;
end;
v0.cloneCharacterToViewport = function(v7, v8) --[[ Line: 17 ]] --[[ Name: cloneCharacterToViewport ]]
    local v9 = false;
    if typeof(v7) == "Instance" then
        v9 = v7:IsA("Model");
    end;
    assert(v9, "Argument must be a Model instance!");
    v9 = false;
    if typeof(v8) == "Instance" then
        v9 = v8:IsA("ViewportFrame");
    end;
    assert(v9, "Argument must be a ViewportFrame instance!");
    v7.Archivable = true;
    local v10 = v7:Clone();
    v10.Parent = v8;
    for _, v12 in pairs(v10:GetDescendants()) do
        if v12.Name ~= "HumanoidRootPart" and (v12:IsA("BasePart") or v12:IsA("MeshPart") or v12.Name == "face") then
            v12.Transparency = 0;
        end;
    end;
    return v10;
end;
v0.tweenViewportFrame = function(v13, v14, v15) --[[ Line: 32 ]] --[[ Name: tweenViewportFrame ]]
    -- upvalues: l_TweenService_0 (copy)
    local v16 = false;
    if typeof(v13) == "Instance" then
        v16 = v13:IsA("ViewportFrame");
    end;
    assert(v16, "Argument must be a ViewportFrame instance!");
    assert(typeof(v14) == "number", "Argument must be a number!");
    assert(typeof(v15) == "number", "Argument must be a number!");
    l_TweenService_0:Create(v13, TweenInfo.new(v15), {
        ImageTransparency = v14
    }):Play();
end;
v0.handleCharacterInViewport = function(v17, v18, v19) --[[ Line: 40 ]] --[[ Name: handleCharacterInViewport ]]
    -- upvalues: v0 (copy), l_RunService_0 (copy)
    local v20 = false;
    if typeof(v17) == "Instance" then
        v20 = v17:IsA("Model");
    end;
    assert(v20, "Argument must be a Model instance!");
    v20 = false;
    if typeof(v19) == "Instance" then
        v20 = v19:IsA("ViewportFrame");
    end;
    assert(v20, "Argument must be a ViewportFrame instance!");
    local v21 = v0.setupViewportFrame(v19);
    v20 = Instance.new("WorldModel");
    v20.Parent = v19;
    v18.Parent = v20;
    local v22 = {};
    for _, v24 in v17:GetDescendants() do
        if v24:IsA("Motor6D") then
            for _, v26 in v18:GetDescendants() do
                if v26:IsA("Motor6D") and v26.Name == v24.Name then
                    table.insert(v22, {
                        v24, 
                        v26
                    });
                end;
            end;
        end;
    end;
    local _ = function() --[[ Line: 65 ]] --[[ Name: UpdateParts ]]
        -- upvalues: v22 (copy)
        for _, v28 in v22 do
            local v29 = v28[1];
            v28[2].Transform = v29.Transform;
        end;
    end;
    local v31 = false;
    task.delay(0.2, function() --[[ Line: 75 ]]
        -- upvalues: v31 (ref)
        v31 = true;
    end);
    task.spawn(function() --[[ Line: 83 ]]
        -- upvalues: v31 (ref), v19 (copy), v22 (copy), v21 (copy), l_RunService_0 (ref)
        while not v31 or v19.Parent ~= nil do
            for _, v33 in v22 do
                local v34 = v33[1];
                v33[2].Transform = v34.Transform;
            end;
            v21.CFrame = workspace.CurrentCamera.CFrame;
            l_RunService_0.PreSimulation:Wait();
        end;
    end);
    task.spawn(function() --[[ Line: 101 ]]
        -- upvalues: v0 (ref), v19 (copy)
        v0.tweenViewportFrame(v19, 0, 0.2);
    end);
    return false;
end;
GetPlayerData = function(v35) --[[ Line: 107 ]] --[[ Name: GetPlayerData ]]
    if not v35 then
        return;
    else
        local l_FirstChild_0 = workspace:WaitForChild("States"):FindFirstChild(v35.Name);
        if not l_FirstChild_0 then
            return;
        else
            return l_FirstChild_0:FindFirstChild("PlayerData");
        end;
    end;
end;
v0.main = function(v37, v38) --[[ Line: 115 ]] --[[ Name: main ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v0 (copy)
    local v39 = script.Viewport:Clone();
    v39.Parent = v37.PlayerGui;
    local l_VPF_0 = v39:WaitForChild("VPF");
    v38.Archivable = true;
    local v41 = v38:Clone();
    v38.Archivable = false;
    for _, v43 in v41:GetDescendants() do
        if v43:IsA("BaseScript") then
            v43.Enabled = false;
        elseif v43:IsA("BasePart") then
            v43.CollisionGroup = "None";
        end;
    end;
    local v44 = GetPlayerData(v41);
    if v44 then
        l_ReplicatedStorage_0.Events.EquipGloves:Fire(v41, v44.Gloves.Value);
    end;
    v41.Parent = workspace.Debris;
    task.wait();
    return l_VPF_0, (v0.handleCharacterInViewport(v38, v41, l_VPF_0));
end;
return v0;