local v0 = {};
local function _(v1, v2) --[[ Line: 3 ]] --[[ Name: PowVec3 ]]
    return (Vector3.new(math.pow(v1.X, v2), math.pow(v1.Y, v2), (math.pow(v1.Z, v2))));
end;
local function v6(v4, v5) --[[ Line: 11 ]] --[[ Name: PowColor3 ]]
    return Color3.new(math.pow(v4.r, v5), math.pow(v4.g, v5), (math.pow(v4.b, v5)));
end;
v0.Color3ToVector3 = function(_, v8) --[[ Line: 19 ]] --[[ Name: Color3ToVector3 ]]
    return (Vector3.new(v8.r, v8.g, v8.b));
end;
v0.Vector3ToColor3 = function(_, v10) --[[ Line: 23 ]] --[[ Name: Vector3ToColor3 ]]
    return Color3.new(v10.X, v10.Y, v10.Z);
end;
v0.LerpColor = function(_, v12, v13, v14, v15) --[[ Line: 27 ]] --[[ Name: LerpColor ]]
    -- upvalues: v6 (copy)
    local v16 = v15 or 2;
    local v17 = Color3.new(math.pow(v12.r, v16), math.pow(v12.g, v16), (math.pow(v12.b, v16)));
    local v18 = Color3.new(math.pow(v13.r, v16), math.pow(v13.g, v16), (math.pow(v13.b, v16)));
    return v6(v17:lerp(v18, v14), 1 / v16);
end;
return v0;