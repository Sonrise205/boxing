local v3 = {
    GetCircularPosition = function(v0, v1, v2) --[[ Line: 5 ]] --[[ Name: GetCircularPosition ]]
        return v0 + Vector3.new(math.cos(v2) * v1, 0, math.sin(v2) * v1);
    end
};
v3.GetCircularCFrame = function(v4, v5, v6, v7) --[[ Line: 9 ]] --[[ Name: GetCircularCFrame ]]
    -- upvalues: v3 (copy)
    local v8 = v3.GetCircularPosition(v4, v6, v7);
    return CFrame.lookAt(v4, v4 + v5) * CFrame.new(v8);
end;
v3.GetAngleBetweenVectors = function(v9, v10, v11) --[[ Line: 14 ]] --[[ Name: GetAngleBetweenVectors ]]
    v9 = v9.Unit;
    v10 = v10.Unit;
    if v11 then
        local v12 = v9:Dot(v10);
        return (math.atan2(v9.X * v10.Z - v9.Z * v10.X, v12));
    else
        return (math.acos((v9:Dot(v10))));
    end;
end;
return v3;