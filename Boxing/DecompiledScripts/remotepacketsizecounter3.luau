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
local function _(v2, v3) --[[ Line: 74 ]] --[[ Name: GetVLQSize ]]
    return (math.max(math.ceil((math.log(v3 + v2, 128))), v2));
end;
local function v5(v6, v7) --[[ Line: 78 ]] --[[ Name: GetDataByteSize ]]
    -- upvalues: v0 (copy), v5 (copy), v1 (copy)
    local v8 = typeof(v6);
    if v0[v8] then
        return v0[v8];
    elseif v8 == "string" then
        return math.max(math.ceil((math.log(#v6 + 1, 128))), 1) + #v6;
    elseif v8 == "table" then
        if v7[v6] then
            return 0;
        else
            v7[v6] = true;
            local v9 = 0;
            local v10 = 0;
            local v11 = 1;
            local v12 = v6[1] ~= nil;
            for v13, v14 in next, v6 do
                v11 = v11 + 1;
                if not v12 then
                    v9 = v9 + (v5(v13, v7) + 1);
                end;
                v10 = v10 + (v5(v14, v7) + 1);
            end;
            if v12 then
                return math.max(math.ceil((math.log(v11 + 1, 128))), 1) + v10;
            else
                return math.max(math.ceil((math.log(v11 + 1, 128))), 1) + v9 + v10;
            end;
        end;
    elseif v8 == "CFrame" then
        local v15 = false;
        for v16 in next, v1 do
            if v16 == v6.Rotation then
                v15 = true;
                break;
            end;
        end;
        if v15 then
            return 13;
        else
            return 19;
        end;
    elseif v8 == "NumberSequence" or v8 == "ColorSequence" then
        local v17 = 4;
        for _, v19 in next, v6.Keypoints do
            v17 = v17 + v5(v19, v7);
        end;
        return v17;
    else
        warn("Unsupported data type: " .. v8);
        return 0;
    end;
end;
local v26 = {
    BaseRemoteOverhead = 9, 
    RemoteFunctionOverhead = 2, 
    ClientToServerOverhead = 5, 
    TypeOverhead = 1, 
    GetPacketSize = function(v20) --[[ Line: 172 ]] --[[ Name: GetPacketSize ]]
        -- upvalues: v5 (copy)
        local v21 = 9;
        if v20.RemoteType == "RemoteFunction" then
            v21 = v21 + 2;
        end;
        if v20.RunContext == "Client" then
            v21 = v21 + 5;
        end;
        local v22 = {};
        for _, v24 in ipairs(v20.PacketData) do
            v21 = v21 + (v5(v24, v22) + 1);
        end;
        return v21;
    end, 
    GetDataByteSize = function(v25) --[[ Line: 194 ]] --[[ Name: GetDataByteSize ]]
        -- upvalues: v5 (copy)
        return v5(v25, {}) + 1;
    end
};
table.freeze(v26);
return v26;