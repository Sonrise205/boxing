local function v4(v0) --[[ Line: 1 ]] --[[ Name: CFrameToString ]]
    local v1, v2, v3 = v0:ToOrientation();
    return string.format("CFrame(%s,%s,%s,%s,%s,%s)", v0.X, v0.Y, v0.Z, v1, v2, v3);
end;
local function v9(v5) --[[ Line: 5 ]] --[[ Name: Vector3ToString ]]
    local l_x_0 = v5.x;
    local l_y_0 = v5.y;
    local l_z_0 = v5.z;
    return string.format("Vector3(%s,%s,%s)", l_x_0, l_y_0, l_z_0);
end;
local function v13(v10) --[[ Line: 9 ]] --[[ Name: Vector2ToString ]]
    local l_x_1 = v10.x;
    local l_y_1 = v10.y;
    return string.format("Vector2(%s,%s)", l_x_1, l_y_1);
end;
local function v18(v14) --[[ Line: 13 ]] --[[ Name: ColorToString ]]
    local l_r_0 = v14.r;
    local l_g_0 = v14.g;
    local l_b_0 = v14.b;
    return string.format("Color(%s,%s,%s)", l_r_0 * 255, l_g_0 * 255, l_b_0 * 255);
end;
local function _(v19) --[[ Line: 18 ]] --[[ Name: StringToCFrame ]]
    local v20, v21, v22, v23, v24, v25 = v19:match("CFrame%((.-),(.-),(.-),(.-),(.-),(.-)%)");
    return CFrame.new(v20, v21, v22) * CFrame.Angles(v23, v24, v25);
end;
local function _(v27) --[[ Line: 22 ]] --[[ Name: StringToVector3 ]]
    local v28, v29, v30 = v27:match("Vector3%((.-),(.-),(.-)%)");
    return (Vector3.new(v28, v29, v30));
end;
local function v35(v32) --[[ Line: 26 ]] --[[ Name: StringToVector2 ]]
    local v33, v34 = v32:match("Vector2%((.-),(.-)%)");
    return Vector2.new(v33, v34);
end;
local function v40(v36) --[[ Line: 30 ]] --[[ Name: StringToColor ]]
    local v37, v38, v39 = v36:match("Color%((.-),(.-),(.-)%)");
    return Color3.fromRGB(v37, v38, v39);
end;
local function _(v41) --[[ Line: 34 ]] --[[ Name: StringToBool ]]
    if v41:match("Bool%((.+)%)") == "true" then
        return true;
    else
        return false;
    end;
end;
return {
    function(v43) --[[ Line: 58 ]] --[[ Name: ValueToString ]]
        -- upvalues: v4 (copy), v9 (copy), v13 (copy), v18 (copy)
        local v44 = typeof(v43);
        if v44 == "Instance" then
            return;
        elseif v44 == "CFrame" then
            return v4(v43);
        elseif v44 == "Vector3" then
            return v9(v43);
        elseif v44 == "Vector2" then
            return v13(v43);
        elseif v44 == "Color3" then
            return v18(v43);
        elseif v44 == "EnumItem" then
            return v43.Name;
        elseif v44 == "boolean" then
            return string.format("Bool(%s)", (tostring(v43)));
        elseif tostring(v43) then
            return (tostring(v43));
        else
            return;
        end;
    end, 
    function(v45) --[[ Line: 43 ]] --[[ Name: StringToValue ]]
        -- upvalues: v35 (copy), v40 (copy)
        if v45:match("CFrame") then
            local v46, v47, v48, v49, v50, v51 = v45:match("CFrame%((.-),(.-),(.-),(.-),(.-),(.-)%)");
            return CFrame.new(v46, v47, v48) * CFrame.Angles(v49, v50, v51);
        elseif v45:match("Vector3") then
            local v52, v53, v54 = v45:match("Vector3%((.-),(.-),(.-)%)");
            return (Vector3.new(v52, v53, v54));
        elseif v45:match("Vector2") then
            return v35(v45);
        elseif v45:match("Color") then
            return v40(v45);
        elseif v45:match("Bool") then
            if v45:match("Bool%((.+)%)") == "true" then
                return true;
            else
                return false;
            end;
        else
            return v45;
        end;
    end
};