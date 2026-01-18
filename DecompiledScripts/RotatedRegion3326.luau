local l_GJK_0 = require(script:WaitForChild("GJK"));
local l_Supports_0 = require(script:WaitForChild("Supports"));
local l_Vertices_0 = require(script:WaitForChild("Vertices"));
local v3 = {};
v3.__index = v3;
local function v6(v4, v5) --[[ Line: 86 ]] --[[ Name: getCorners ]]
    return {
        v4:PointToWorldSpace((Vector3.new(-v5.x, v5.y, v5.z))), 
        v4:PointToWorldSpace((Vector3.new(-v5.x, -v5.y, v5.z))), 
        v4:PointToWorldSpace((Vector3.new(-v5.x, -v5.y, -v5.z))), 
        v4:PointToWorldSpace((Vector3.new(v5.x, -v5.y, -v5.z))), 
        v4:PointToWorldSpace((Vector3.new(v5.x, v5.y, -v5.z))), 
        v4:PointToWorldSpace((Vector3.new(v5.x, v5.y, v5.z))), 
        v4:PointToWorldSpace((Vector3.new(v5.x, -v5.y, v5.z))), 
        v4:PointToWorldSpace((Vector3.new(-v5.x, v5.y, -v5.z)))
    };
end;
local function v15(v7) --[[ Line: 99 ]] --[[ Name: worldBoundingBox ]]
    local v8 = {};
    local v9 = {};
    local v10 = {};
    for v11 = 1, #v7 do
        local l_x_0 = v7[v11].x;
        local l_y_0 = v7[v11].y;
        local l_z_0 = v7[v11].z;
        v8[v11] = l_x_0;
        v9[v11] = l_y_0;
        v10[v11] = l_z_0;
    end;
    return Vector3.new(math.min(unpack(v8)), math.min(unpack(v9)), (math.min(unpack(v10)))), (Vector3.new(math.max(unpack(v8)), math.max(unpack(v9)), (math.max(unpack(v10)))));
end;
v3.new = function(v16, v17) --[[ Line: 109 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_Vertices_0 (copy), l_Supports_0 (copy), v15 (copy)
    local v18 = setmetatable({}, v3);
    v18.CFrame = v16;
    v18.Size = v17;
    v18.Shape = "Block";
    v18.Set = l_Vertices_0.Block(v16, v17 / 2);
    v18.Support = l_Supports_0.PointCloud;
    v18.Centroid = v16.p;
    v18.AlignedRegion3 = Region3.new(v15(v18.Set));
    return v18;
end;
v3.Block = v3.new;
v3.Wedge = function(v19, v20) --[[ Line: 127 ]] --[[ Name: Wedge ]]
    -- upvalues: v3 (copy), l_Vertices_0 (copy), l_Supports_0 (copy), v15 (copy)
    local v21 = setmetatable({}, v3);
    v21.CFrame = v19;
    v21.Size = v20;
    v21.Shape = "Wedge";
    v21.Set = l_Vertices_0.Wedge(v19, v20 / 2);
    v21.Support = l_Supports_0.PointCloud;
    v21.Centroid = l_Vertices_0.GetCentroid(v21.Set);
    v21.AlignedRegion3 = Region3.new(v15(v21.Set));
    return v21;
end;
v3.CornerWedge = function(v22, v23) --[[ Line: 143 ]] --[[ Name: CornerWedge ]]
    -- upvalues: v3 (copy), l_Vertices_0 (copy), l_Supports_0 (copy), v15 (copy)
    local v24 = setmetatable({}, v3);
    v24.CFrame = v22;
    v24.Size = v23;
    v24.Shape = "CornerWedge";
    v24.Set = l_Vertices_0.CornerWedge(v22, v23 / 2);
    v24.Support = l_Supports_0.PointCloud;
    v24.Centroid = l_Vertices_0.GetCentroid(v24.Set);
    v24.AlignedRegion3 = Region3.new(v15(v24.Set));
    return v24;
end;
v3.Cylinder = function(v25, v26) --[[ Line: 159 ]] --[[ Name: Cylinder ]]
    -- upvalues: v3 (copy), l_Supports_0 (copy), v15 (copy), v6 (copy)
    local v27 = setmetatable({}, v3);
    v27.CFrame = v25;
    v27.Size = v26;
    v27.Shape = "Cylinder";
    v27.Set = {
        v25, 
        v26 / 2
    };
    v27.Support = l_Supports_0.Cylinder;
    v27.Centroid = v25.p;
    v27.AlignedRegion3 = Region3.new(v15((v6(unpack(v27.Set)))));
    return v27;
end;
v3.Ball = function(v28, v29) --[[ Line: 175 ]] --[[ Name: Ball ]]
    -- upvalues: v3 (copy), l_Supports_0 (copy), v15 (copy), v6 (copy)
    local v30 = setmetatable({}, v3);
    v30.CFrame = v28;
    v30.Size = v29;
    v30.Shape = "Ball";
    v30.Set = {
        v28, 
        v29 / 2
    };
    v30.Support = l_Supports_0.Ellipsoid;
    v30.Centroid = v28.p;
    v30.AlignedRegion3 = Region3.new(v15((v6(unpack(v30.Set)))));
    return v30;
end;
v3.FromPart = function(v31) --[[ Line: 191 ]] --[[ Name: FromPart ]]
    -- upvalues: v3 (copy), l_Vertices_0 (copy)
    return v3[l_Vertices_0.Classify(v31)](v31.CFrame, v31.Size);
end;
v3.CastPoint = function(v32, v33) --[[ Line: 197 ]] --[[ Name: CastPoint ]]
    -- upvalues: l_GJK_0 (copy), l_Supports_0 (copy)
    return l_GJK_0.new(v32.Set, {
        v33
    }, v32.Centroid, v33, v32.Support, l_Supports_0.PointCloud):IsColliding();
end;
v3.CastPart = function(v34, v35) --[[ Line: 202 ]] --[[ Name: CastPart ]]
    -- upvalues: v3 (copy), l_GJK_0 (copy)
    local v36 = v3.FromPart(v35);
    return l_GJK_0.new(v34.Set, v36.Set, v34.Centroid, v36.Centroid, v34.Support, v36.Support):IsColliding();
end;
v3.FindPartsInRegion3 = function(v37, v38, v39) --[[ Line: 208 ]] --[[ Name: FindPartsInRegion3 ]]
    local v40 = {};
    local l_PartsInRegion3_0 = game.Workspace:FindPartsInRegion3(v37.AlignedRegion3, v38, v39);
    for v42 = 1, #l_PartsInRegion3_0 do
        if v37:CastPart(l_PartsInRegion3_0[v42]) then
            table.insert(v40, l_PartsInRegion3_0[v42]);
        end;
    end;
    return v40;
end;
v3.FindPartsInRegion3WithIgnoreList = function(v43, v44, v45) --[[ Line: 219 ]] --[[ Name: FindPartsInRegion3WithIgnoreList ]]
    v44 = v44 or {};
    local v46 = {};
    local l_PartsInRegion3WithIgnoreList_0 = game.Workspace:FindPartsInRegion3WithIgnoreList(v43.AlignedRegion3, v44, v45);
    for v48 = 1, #l_PartsInRegion3WithIgnoreList_0 do
        if v43:CastPart(l_PartsInRegion3WithIgnoreList_0[v48]) then
            table.insert(v46, l_PartsInRegion3WithIgnoreList_0[v48]);
        end;
    end;
    return v46;
end;
v3.FindPartsInRegion3WithWhiteList = function(v49, v50, v51) --[[ Line: 231 ]] --[[ Name: FindPartsInRegion3WithWhiteList ]]
    v50 = v50 or {};
    local v52 = {};
    local l_PartsInRegion3WithWhiteList_0 = game.Workspace:FindPartsInRegion3WithWhiteList(v49.AlignedRegion3, v50, v51);
    for v54 = 1, #l_PartsInRegion3WithWhiteList_0 do
        if v49:CastPart(l_PartsInRegion3WithWhiteList_0[v54]) then
            table.insert(v52, l_PartsInRegion3WithWhiteList_0[v54]);
        end;
    end;
    return v52;
end;
v3.Cast = function(v55, v56, v57) --[[ Line: 243 ]] --[[ Name: Cast ]]
    return v55:FindPartsInRegion3WithIgnoreList(type(v56) == "table" and v56 or {
        v56
    }, v57);
end;
return v3;