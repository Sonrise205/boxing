local v0 = {
    spacing = 8, 
    image = "rbxasset://textures/Cursors/Gamepad/Pointer.png", 
    imageSize = Vector2.new(2, 2)
};
local v1 = {};
local v2 = {};
local l_Model_0 = Instance.new("Model");
l_Model_0.Name = "PathDisplayPoints";
local l_Part_0 = Instance.new("Part");
l_Part_0.Anchored = true;
l_Part_0.CanCollide = false;
l_Part_0.Transparency = 1;
l_Part_0.Name = "PathDisplayAdornee";
l_Part_0.CFrame = CFrame.new(0, 0, 0);
l_Part_0.Parent = l_Model_0;
local v5 = {};
local v6 = 30;
for v7 = 1, v6 do
    local l_ImageHandleAdornment_0 = Instance.new("ImageHandleAdornment");
    l_ImageHandleAdornment_0.Archivable = false;
    l_ImageHandleAdornment_0.Adornee = l_Part_0;
    l_ImageHandleAdornment_0.Image = v0.image;
    l_ImageHandleAdornment_0.Size = v0.imageSize;
    v5[v7] = l_ImageHandleAdornment_0;
end;
local function _() --[[ Line: 34 ]] --[[ Name: retrieveFromPool ]]
    -- upvalues: v5 (copy), v6 (ref)
    local v9 = v5[1];
    if not v9 then
        return nil;
    else
        local l_v5_0 = v5;
        local l_v5_1 = v5;
        local l_v6_0 = v6;
        local v13 = v5[v6];
        local v14 = nil;
        l_v5_0[1] = v13;
        l_v5_1[l_v6_0] = v14;
        v6 = v6 - 1;
        return v9;
    end;
end;
local function _(v16) --[[ Line: 45 ]] --[[ Name: returnToPool ]]
    -- upvalues: v6 (ref), v5 (copy)
    v6 = v6 + 1;
    v5[v6] = v16;
end;
local function v32(v18, _) --[[ Line: 50 ]] --[[ Name: renderPoint ]]
    -- upvalues: v6 (ref), v5 (copy), l_Model_0 (copy)
    if v6 == 0 then
        return nil;
    else
        local v20 = Ray.new(v18 + Vector3.new(0, 2, 0, 0), (Vector3.new(0, -8, 0, 0)));
        local l_workspace_PartOnRayWithIgnoreList_0, v22, v23 = workspace:FindPartOnRayWithIgnoreList(v20, {
            game.Players.LocalPlayer.Character, 
            workspace.CurrentCamera
        });
        if not l_workspace_PartOnRayWithIgnoreList_0 then
            return nil;
        else
            local v24 = CFrame.new(v22, v22 + v23);
            local v25 = v5[1];
            local v26;
            if not v25 then
                v26 = nil;
            else
                local l_v5_2 = v5;
                local l_v5_3 = v5;
                local l_v6_1 = v6;
                local v30 = v5[v6];
                local v31 = nil;
                l_v5_2[1] = v30;
                l_v5_3[l_v6_1] = v31;
                v6 = v6 - 1;
                v26 = v25;
            end;
            v26.CFrame = v24;
            v26.Parent = l_Model_0;
            return v26;
        end;
    end;
end;
v0.setCurrentPoints = function(v33) --[[ Line: 69 ]] --[[ Name: setCurrentPoints ]]
    -- upvalues: v1 (ref)
    if typeof(v33) == "table" then
        v1 = v33;
        return;
    else
        v1 = {};
        return;
    end;
end;
v0.clearRenderedPath = function() --[[ Line: 77 ]] --[[ Name: clearRenderedPath ]]
    -- upvalues: v2 (ref), v6 (ref), v5 (copy), l_Model_0 (copy)
    for _, v35 in ipairs(v2) do
        v35.Parent = nil;
        v6 = v6 + 1;
        v5[v6] = v35;
    end;
    v2 = {};
    l_Model_0.Parent = nil;
end;
v0.renderPath = function() --[[ Line: 86 ]] --[[ Name: renderPath ]]
    -- upvalues: v0 (copy), v1 (ref), v2 (ref), v32 (copy), l_Model_0 (copy)
    v0.clearRenderedPath();
    if not v1 or #v1 == 0 then
        return;
    else
        local v36 = #v1;
        local v37 = v1[v36];
        local v38 = 0;
        v2[1] = v32(v37, true);
        if not v2[1] then
            return;
        else
            while true do
                local v39 = v1[v36];
                local v40 = v1[v36 - 1];
                if v36 >= 2 then
                    local v41 = v40 - v39;
                    local l_magnitude_0 = v41.magnitude;
                    if l_magnitude_0 < v38 then
                        v38 = v38 - l_magnitude_0;
                        v36 = v36 - 1;
                    else
                        local v43 = v39 + v41.unit * v38;
                        local v44 = v32(v43, false);
                        if v44 then
                            v2[#v2 + 1] = v44;
                        end;
                        v38 = v38 + v0.spacing;
                    end;
                else
                    break;
                end;
            end;
            l_Model_0.Parent = workspace.CurrentCamera;
            return;
        end;
    end;
end;
return v0;