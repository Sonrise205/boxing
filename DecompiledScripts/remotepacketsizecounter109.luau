local v0 = {
    ["nil"] = 0, 
    EnumItem = 4, 
    boolean = 1, 
    number = 8, 
    UDim = 8, 
    UDim2 = 16, 
    Ray = 24, 
    Faces = 6, 
    Axes = 6, 
    BrickColor = 4, 
    Color3 = 12, 
    Vector2 = 8, 
    Vector3 = 12, 
    Instance = 4, 
    Vector2int16 = 4, 
    Vector3int16 = 6, 
    NumberSequenceKeypoint = 12, 
    ColorSequenceKeypoint = 16, 
    NumberRange = 8, 
    Rect = 16, 
    PhysicalProperties = 20, 
    Color3uint8 = 3
};
local v1 = {
    [CFrame.Angles(0, 0, 0)] = true, 
    [CFrame.Angles(0, 3.141592653589793, 0)] = true, 
    [CFrame.Angles(1.5707963267948966, 0, 0)] = true, 
    [CFrame.Angles(-1.5707963267948966, -3.141592653589793, 0)] = true, 
    [CFrame.Angles(0, 3.141592653589793, 3.141592653589793)] = true, 
    [CFrame.Angles(0, 0, 3.141592653589793)] = true, 
    [CFrame.Angles(-1.5707963267948966, 0, 0)] = true, 
    [CFrame.Angles(1.5707963267948966, 3.141592653589793, 0)] = true, 
    [CFrame.Angles(0, 3.141592653589793, 1.5707963267948966)] = true, 
    [CFrame.Angles(0, 0, -1.5707963267948966)] = true, 
    [CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966)] = true, 
    [CFrame.Angles(0, -1.5707963267948966, -1.5707963267948966)] = true, 
    [CFrame.Angles(0, 0, 1.5707963267948966)] = true, 
    [CFrame.Angles(0, -3.141592653589793, -1.5707963267948966)] = true, 
    [CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966)] = true, 
    [CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966)] = true, 
    [CFrame.Angles(-1.5707963267948966, -1.5707963267948966, 0)] = true, 
    [CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)] = true, 
    [CFrame.Angles(0, -1.5707963267948966, 0)] = true, 
    [CFrame.Angles(0, 1.5707963267948966, 0)] = true, 
    [CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0)] = true, 
    [CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)] = true, 
    [CFrame.Angles(0, 1.5707963267948966, 3.141592653589793)] = true, 
    [CFrame.Angles(0, -1.5707963267948966, 3.141592653589793)] = true
};
local function v2(v3, v4) --[[ Line: 69 ]] --[[ Name: GetDataByteSize ]]
    -- upvalues: v0 (copy), v2 (copy), v1 (copy)
    local v5 = typeof(v3);
    if v0[v5] then
        return v0[v5];
    elseif v5 == "string" then
        return #v3 + 2;
    elseif v5 == "table" then
        if v4[v3] then
            return 0;
        else
            v4[v3] = true;
            local v6 = 0;
            local v7 = 0;
            local v8 = 1;
            local v9 = true;
            for v10, v11 in next, v3 do
                if v10 ~= v8 then
                    v9 = false;
                else
                    v8 = v8 + 1;
                end;
                v6 = v6 + (v2(v10, v4) + 1);
                v7 = v7 + (v2(v11, v4) + 1);
            end;
            return 1 + (v9 and #v3 + v7 or v6 + v7);
        end;
    elseif v5 == "CFrame" then
        local v12 = false;
        for v13 in next, v1 do
            if v13 == v3.Rotation then
                v12 = true;
                break;
            end;
        end;
        if v12 then
            return 13;
        else
            return 21;
        end;
    elseif v5 == "NumberSequence" or v5 == "ColorSequence" then
        local v14 = 4;
        for _, v16 in next, v3.Keypoints do
            v14 = v14 + v2(v16, v4);
        end;
        return v14;
    else
        warn("Unsupported data type: " .. v5);
        return 0;
    end;
end;
local v23 = {
    RemoteOverhead = 9, 
    TypeOverhead = 1, 
    GetPacketSize = function(v17) --[[ Line: 150 ]] --[[ Name: GetPacketSize ]]
        -- upvalues: v2 (copy)
        local v18 = v17.IgnoreRemoteOffset and 0 or 9;
        local v19 = {};
        for _, v21 in ipairs(v17.PacketData) do
            v18 = v18 + (v2(v21, v19) + 1);
        end;
        return v18;
    end, 
    GetDataByteSize = function(v22) --[[ Line: 164 ]] --[[ Name: GetDataByteSize ]]
        -- upvalues: v2 (copy)
        return (v2(v22, {}));
    end
};
table.freeze(v23);
return v23;