local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Modules.Cutscene.Cutscene);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v5 = {};
v5.__index = v5;
v5.new = function(v6, _) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v8 = setmetatable({}, v5);
    v8.Nanomachines = nil;
    v8.NanomachinesOverlay = nil;
    v8.DefaultOverlayTransparencies = {};
    v8.CachedFrames = nil;
    v8.Player = v6;
    v8.Character = v8.Player.Character or v8.Player.CharacterAdded:Wait();
    v8.CurrentFrame = 0;
    v8.ActiveConnection = nil;
    v8.CurrentId = nil;
    v8.GetCharacterData = function() --[[ Line: 28 ]]
        -- upvalues: v8 (copy)
        if not v8.Player.Character then
            return;
        else
            local l_FirstChild_0 = workspace:WaitForChild("States"):FindFirstChild(v8.Character.Name);
            if not l_FirstChild_0 then
                return;
            else
                return l_FirstChild_0:FindFirstChild("CharacterData");
            end;
        end;
    end;
    return v8;
end;
v5.InitNanomachines = function(v10, v11, v12) --[[ Line: 39 ]] --[[ Name: InitNanomachines ]]
    v10.Nanomachines = v11:Clone();
    local l_SurfaceAppearances_0 = v10.Nanomachines.SurfaceAppearances;
    local l_Base_0 = v10.Nanomachines.Base;
    local _ = tick();
    local l_l_SurfaceAppearances_0_Children_0 = l_SurfaceAppearances_0:GetChildren();
    table.sort(l_l_SurfaceAppearances_0_Children_0, function(v17, v18) --[[ Line: 48 ]]
        return tonumber(v17.Name) < tonumber(v18.Name);
    end);
    local v19 = #l_l_SurfaceAppearances_0_Children_0;
    local v20 = {};
    for _, v22 in (v10.Nanomachines:GetChildren()) do
        v20[v22.Name] = v22;
    end;
    for v23 = 1, v19 do
        local v24 = l_l_SurfaceAppearances_0_Children_0[v23];
        if v24 then
            local v25 = l_Base_0:Clone();
            v25.Name = v24.Name;
            v25.Parent = v10.Nanomachines.Frames;
            local v26 = l_l_SurfaceAppearances_0_Children_0[math.clamp(v23 - math.max(math.floor(10 * (1 - (v23 - 1) / (v19 - 1))), 0), 1, v19)];
            for _, v28 in ipairs(v25:GetChildren()) do
                local _ = nil;
                (if string.find(v28.Name, "LowerArm") and v26 then v26:Clone() else v24:Clone()).Parent = v28;
                local v30 = v20[v28.Name];
                if v30 then
                    local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                    l_WeldConstraint_0.Part0 = v30;
                    l_WeldConstraint_0.Part1 = v28;
                    l_WeldConstraint_0.Parent = v30;
                end;
            end;
        end;
    end;
    if l_SurfaceAppearances_0 then
        l_SurfaceAppearances_0:Destroy();
    end;
    if l_Base_0 then
        l_Base_0:Destroy();
    end;
    v10.CachedFrames = workspace.Debris:FindFirstChild("NanomachineFrames");
    if not v10.CachedFrames then
        v10.CachedFrames = v10.Nanomachines.Frames:Clone();
        for _, v33 in v10.CachedFrames:GetDescendants() do
            if v33:IsA("BasePart") then
                v33.Transparency = 0;
                v33.Anchored = true;
            end;
            if v33:IsA("Weld") then
                v33:Destroy();
            end;
        end;
        v10.CachedFrames.Name = "NanomachineFrames";
        v10.CachedFrames.Parent = workspace.Debris;
        v10.CachedFrames:PivotTo(CFrame.new(0, -100, 0));
        v10.CachedFrames:SetAttribute("Usage", 0);
    end;
    local v34 = v12 and workspace.Welds:WaitForChild(v12.Name, 10);
    local v35 = v34 and v34:WaitForChild("WeldCharacter", 10);
    if not v35 then
        return;
    else
        for _, v37 in v10.Nanomachines:GetChildren() do
            local l_v35_FirstChild_0 = v35:FindFirstChild(v37.Name);
            if l_v35_FirstChild_0 then
                local l_Weld_0 = Instance.new("Weld");
                l_Weld_0.Parent = l_v35_FirstChild_0;
                l_Weld_0.Part0 = l_v35_FirstChild_0;
                l_Weld_0.Part1 = v37;
            end;
        end;
        v10.Nanomachines.Parent = v35;
        for _, v41 in v10.Nanomachines:GetChildren() do
            local l_v35_FirstChild_1 = v35:FindFirstChild(v41.Name);
            if l_v35_FirstChild_1 then
                local l_Weld_1 = Instance.new("Weld");
                l_Weld_1.Parent = l_v35_FirstChild_1;
                l_Weld_1.Part0 = l_v35_FirstChild_1;
                l_Weld_1.Part1 = v41;
            end;
        end;
        v10.CachedFrames:SetAttribute("Usage", v10.CachedFrames:GetAttribute("Usage") + 1);
        v10.NanomachinesOverlay = script.NanomachinesOverlay:Clone();
        v10.NanomachinesOverlay.Parent = v10.Player.PlayerGui;
        for _, v45 in v10.NanomachinesOverlay.Main:GetChildren() do
            if v45:IsA("ImageLabel") then
                v10.DefaultOverlayTransparencies[v45.Name] = v45.ImageTransparency;
                v45.ImageTransparency = 1;
            end;
        end;
        return;
    end;
end;
v5.SetTransparency = function(_, v47, v48) --[[ Line: 161 ]] --[[ Name: SetTransparency ]]
    if not v47 then
        return;
    else
        for _, v50 in v47:GetChildren() do
            if v50:IsA("BasePart") or v50:IsA("Decal") or v50:IsA("MeshPart") then
                v50.Transparency = v48;
            end;
        end;
        return;
    end;
end;
v5.ShowFrame = function(v51, v52) --[[ Line: 170 ]] --[[ Name: ShowFrame ]]
    local l_FirstChild_1 = v51.Nanomachines.Frames:FindFirstChild(v51.CurrentFrame);
    local l_FirstChild_2 = v51.Nanomachines.Frames:FindFirstChild(v52);
    if l_FirstChild_1 then
        v51:SetTransparency(l_FirstChild_1, 1);
    end;
    if l_FirstChild_2 then
        v51:SetTransparency(l_FirstChild_2, 0);
    end;
    v51.CurrentFrame = v52;
end;
v5.ShouldContinue = function(v55, v56, v57) --[[ Line: 184 ]] --[[ Name: ShouldContinue ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v58 = v55.GetCharacterData(v56);
    if v58.Opponent.Value then
        if v58.Opponent.Value == v57 or v55.Player == l_LocalPlayer_0 then
            return true;
        else
            return false;
        end;
    else
        return true;
    end;
end;
v5.PlayFlipbook = function(v59, v60, v61, v62, v63, v64) --[[ Line: 198 ]] --[[ Name: PlayFlipbook ]]
    -- upvalues: l_RunService_0 (copy)
    v61 = v61 * 1.467;
    v62 = v62 * 1.467;
    v61 = math.ceil(v61);
    if v59.ActiveConnection and type(v59.ActiveConnection.cancel) == "function" then
        v59.ActiveConnection.cancel();
        v59.ActiveConnection = nil;
    end;
    v59.CurrentId = v63;
    local v65 = 1 / v62;
    local v66 = v60 < v61 and 1 or -1;
    local v67 = tick();
    local l_v60_0 = v60;
    v59:ShowFrame(v60);
    local v69 = false;
    local v70 = nil;
    local function v71() --[[ Line: 221 ]] --[[ Name: cancel ]]
        -- upvalues: v69 (ref), v70 (ref)
        v69 = true;
        if v70 and v70.Connected then
            v70:Disconnect();
        end;
    end;
    v59.ActiveConnection = {
        cancel = v71
    };
    v70 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 231 ]]
        -- upvalues: v69 (ref), v59 (copy), v63 (copy), v70 (ref), v67 (copy), v65 (copy), v60 (copy), v66 (copy), v61 (ref), l_v60_0 (ref), v71 (copy), v64 (copy)
        if v69 or v59.CurrentId ~= v63 then
            if v70 and v70.Connected then
                v70:Disconnect();
            end;
            return;
        else
            local v72 = math.floor((tick() - v67) / v65 + 0.5);
            local v73 = v60 + v72 * v66;
            v73 = if v66 == 1 then math.clamp(v73, v60, v61) else math.clamp(v73, v61, v60);
            if v73 ~= l_v60_0 then
                v59:ShowFrame(v73);
                l_v60_0 = v73;
            end;
            if v73 == v61 then
                if v70 and v70.Connected then
                    v70:Disconnect();
                end;
                if v59.ActiveConnection and v59.ActiveConnection.cancel == v71 then
                    v59.ActiveConnection = nil;
                end;
                if not v69 and v64 then
                    task.spawn(function() --[[ Line: 268 ]]
                        -- upvalues: v64 (ref)
                        v64();
                    end);
                end;
            end;
            return;
        end;
    end);
    return v71;
end;
v5.CancelAnimation = function(v74) --[[ Line: 279 ]] --[[ Name: CancelAnimation ]]
    if v74.ActiveConnection and type(v74.ActiveConnection.cancel) == "function" then
        v74.ActiveConnection.cancel();
        v74.ActiveConnection = nil;
    end;
end;
v5.IsMobile = function(v75) --[[ Line: 286 ]] --[[ Name: IsMobile ]]
    return v75.Player:GetAttribute("Interface") == "Touch";
end;
return v5;