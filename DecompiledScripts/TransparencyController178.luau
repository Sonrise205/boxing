local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v2 = setmetatable({}, v1);
    v2.transparencyDirty = false;
    v2.enabled = false;
    v2.lastTransparency = nil;
    local v3 = nil;
    local v4 = nil;
    v2.descendantAddedConn = v3;
    v2.descendantRemovingConn = v4;
    v2.toolDescendantAddedConns = {};
    v2.toolDescendantRemovingConns = {};
    v2.cachedParts = {};
    return v2;
end;
v1.HasToolAncestor = function(v5, v6) --[[ Line: 30 ]] --[[ Name: HasToolAncestor ]]
    if v6.Parent == nil then
        return false;
    else
        assert(v6.Parent, "");
        return v6.Parent:IsA("Tool") or v5:HasToolAncestor(v6.Parent);
    end;
end;
v1.IsValidPartToModify = function(v7, v8) --[[ Line: 36 ]] --[[ Name: IsValidPartToModify ]]
    if v8:IsA("BasePart") or v8:IsA("Decal") then
        return not v7:HasToolAncestor(v8);
    else
        return false;
    end;
end;
v1.CachePartsRecursive = function(v9, v10) --[[ Line: 43 ]] --[[ Name: CachePartsRecursive ]]
    if v10 then
        if v9:IsValidPartToModify(v10) then
            v9.cachedParts[v10] = true;
            v9.transparencyDirty = true;
        end;
        for _, v12 in pairs(v10:GetChildren()) do
            v9:CachePartsRecursive(v12);
        end;
    end;
end;
v1.TeardownTransparency = function(v13) --[[ Line: 55 ]] --[[ Name: TeardownTransparency ]]
    for v14, _ in pairs(v13.cachedParts) do
        v14.LocalTransparencyModifier = 0;
    end;
    v13.cachedParts = {};
    v13.transparencyDirty = true;
    v13.lastTransparency = nil;
    if v13.descendantAddedConn then
        v13.descendantAddedConn:disconnect();
        v13.descendantAddedConn = nil;
    end;
    if v13.descendantRemovingConn then
        v13.descendantRemovingConn:disconnect();
        v13.descendantRemovingConn = nil;
    end;
    for v16, v17 in pairs(v13.toolDescendantAddedConns) do
        v17:Disconnect();
        v13.toolDescendantAddedConns[v16] = nil;
    end;
    for v18, v19 in pairs(v13.toolDescendantRemovingConns) do
        v19:Disconnect();
        v13.toolDescendantRemovingConns[v18] = nil;
    end;
end;
v1.SetupTransparency = function(v20, v21) --[[ Line: 81 ]] --[[ Name: SetupTransparency ]]
    v20:TeardownTransparency();
    if v20.descendantAddedConn then
        v20.descendantAddedConn:disconnect();
    end;
    v20.descendantAddedConn = v21.DescendantAdded:Connect(function(v22) --[[ Line: 85 ]]
        -- upvalues: v20 (copy), v21 (copy)
        if v20:IsValidPartToModify(v22) then
            v20.cachedParts[v22] = true;
            v20.transparencyDirty = true;
            return;
        else
            if v22:IsA("Tool") then
                if v20.toolDescendantAddedConns[v22] then
                    v20.toolDescendantAddedConns[v22]:Disconnect();
                end;
                v20.toolDescendantAddedConns[v22] = v22.DescendantAdded:Connect(function(v23) --[[ Line: 93 ]]
                    -- upvalues: v20 (ref)
                    v20.cachedParts[v23] = nil;
                    if v23:IsA("BasePart") or v23:IsA("Decal") then
                        v23.LocalTransparencyModifier = 0;
                    end;
                end);
                if v20.toolDescendantRemovingConns[v22] then
                    v20.toolDescendantRemovingConns[v22]:disconnect();
                end;
                v20.toolDescendantRemovingConns[v22] = v22.DescendantRemoving:Connect(function(v24) --[[ Line: 101 ]]
                    -- upvalues: v21 (ref), v20 (ref)
                    wait();
                    if v21 and v24 and v24:IsDescendantOf(v21) and v20:IsValidPartToModify(v24) then
                        v20.cachedParts[v24] = true;
                        v20.transparencyDirty = true;
                    end;
                end);
            end;
            return;
        end;
    end);
    if v20.descendantRemovingConn then
        v20.descendantRemovingConn:disconnect();
    end;
    v20.descendantRemovingConn = v21.DescendantRemoving:connect(function(v25) --[[ Line: 113 ]]
        -- upvalues: v20 (copy)
        if v20.cachedParts[v25] then
            v20.cachedParts[v25] = nil;
            v25.LocalTransparencyModifier = 0;
        end;
    end);
    v20:CachePartsRecursive(v21);
end;
v1.Enable = function(v26, v27) --[[ Line: 124 ]] --[[ Name: Enable ]]
    if v26.enabled ~= v27 then
        v26.enabled = v27;
    end;
end;
v1.SetSubject = function(v28, v29) --[[ Line: 130 ]] --[[ Name: SetSubject ]]
    local v30 = nil;
    if v29 and v29:IsA("Humanoid") then
        v30 = v29.Parent;
    end;
    if v29 and v29:IsA("VehicleSeat") and v29.Occupant then
        v30 = v29.Occupant.Parent;
    end;
    if v30 then
        v28:SetupTransparency(v30);
        return;
    else
        v28:TeardownTransparency();
        return;
    end;
end;
v1.Update = function(v31, v32) --[[ Line: 145 ]] --[[ Name: Update ]]
    -- upvalues: l_CameraUtils_0 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if l_CurrentCamera_0 and v31.enabled then
        local l_magnitude_0 = (l_CurrentCamera_0.Focus.p - l_CurrentCamera_0.CoordinateFrame.p).magnitude;
        local v35 = l_magnitude_0 < 2 and 1 - (l_magnitude_0 - 0.5) / 1.5 or 0;
        if v35 < 0.5 then
            v35 = 0;
        end;
        if v31.lastTransparency and v35 < 1 and v31.lastTransparency < 0.95 then
            local v36 = v35 - v31.lastTransparency;
            local v37 = 2.8 * v32;
            v36 = math.clamp(v36, -v37, v37);
            v35 = v31.lastTransparency + v36;
        else
            v31.transparencyDirty = true;
        end;
        v35 = math.clamp(l_CameraUtils_0.Round(v35, 2), 0, 1);
        if v31.transparencyDirty or v31.lastTransparency ~= v35 then
            for v38, _ in pairs(v31.cachedParts) do
                v38.LocalTransparencyModifier = v35;
            end;
            v31.transparencyDirty = false;
            v31.lastTransparency = v35;
        end;
    end;
end;
return v1;