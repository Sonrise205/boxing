local v0 = {};
v0.DeepCopy = function(v1) --[[ Line: 27 ]] --[[ Name: DeepCopy ]]
    -- upvalues: v0 (copy)
    local v2 = table.clone(v1);
    for v3, v4 in v2 do
        if typeof(v4) == "table" then
            v2[v3] = v0.DeepCopy(v4);
        end;
    end;
    return v2;
end;
v0.MergeDictionary = function(v5, v6) --[[ Line: 63 ]] --[[ Name: MergeDictionary ]]
    local v7 = table.clone(v5);
    for v8, v9 in v6 do
        v7[v8] = v9;
    end;
    return v7;
end;
v0.Keys = function(v10) --[[ Line: 93 ]] --[[ Name: Keys ]]
    local v11 = {};
    for v12 in v10 do
        table.insert(v11, v12);
    end;
    return v11;
end;
v0.Values = function(v13) --[[ Line: 120 ]] --[[ Name: Values ]]
    local v14 = {};
    for _, v16 in v13 do
        table.insert(v14, v16);
    end;
    return v14;
end;
v0.MergeArrays = function(v17, v18) --[[ Line: 145 ]] --[[ Name: MergeArrays ]]
    local v19 = table.clone(v17);
    table.move(v18, 1, #v18, #v19 + 1, v19);
    return v19;
end;
v0.Reconcile = function(v20, v21) --[[ Line: 177 ]] --[[ Name: Reconcile ]]
    -- upvalues: v0 (copy)
    local v22 = table.clone(v20);
    for v23, v24 in v21 do
        if v22[v23] == nil then
            if typeof(v24) == "table" then
                v22[v23] = v0.DeepCopy(v24);
            else
                v22[v23] = v24;
            end;
        elseif typeof(v21[v23]) == "table" then
            if typeof(v24) == "table" then
                v22[v23] = v0.Reconcile(v24, v21[v23]);
            else
                v22[v23] = v0.DeepCopy(v21[v23]);
            end;
        end;
    end;
    return v22;
end;
v0.IsArray = function(v25) --[[ Line: 213 ]] --[[ Name: IsArray ]]
    local v26 = 0;
    for _ in v25 do
        v26 = v26 + 1;
    end;
    return v26 == #v25;
end;
v0.IsDictionary = function(v28) --[[ Line: 235 ]] --[[ Name: IsDictionary ]]
    local v29 = 0;
    for _ in v28 do
        v29 = v29 + 1;
    end;
    return v29 ~= #v28;
end;
v0.ToString = function(v31) --[[ Line: 264 ]] --[[ Name: ToString ]]
    local v32 = {};
    for v33, v34 in v31 do
        local v35 = nil;
        v35 = if typeof(v33) == "string" then ("\"%*\""):format((tostring(v33))) else tostring(v33);
        local _ = nil;
        local v37 = tostring(v34);
        table.insert(v32, (("\t[%*] = %*"):format(v35, if typeof(v34) == "string" then ("\"%*\""):format(v37) else v37)));
    end;
    return "{\n" .. table.concat(v32, "\n") .. "\n}";
end;
v0.ToArrayString = function(v38) --[[ Line: 288 ]] --[[ Name: ToArrayString ]]
    local v39 = {};
    for _, v41 in v38 do
        local _ = nil;
        local v43 = tostring(v41);
        table.insert(v39, if typeof(v41) == "string" then ("\"%*\""):format(v43) else v43);
    end;
    return "{" .. table.concat(v39, ", ") .. "}";
end;
v0.From = function(v44) --[[ Line: 317 ]] --[[ Name: From ]]
    local v45 = typeof(v44);
    if v45 == "string" then
        return string.split(v44, "");
    elseif v45 == "Color3" then
        return {
            v44.R, 
            v44.G, 
            v44.B
        };
    elseif v45 == "Vector2" then
        return {
            v44.X, 
            v44.Y
        };
    elseif v45 == "Vector3" then
        return {
            v44.X, 
            v44.Y, 
            v44.Z
        };
    elseif v45 == "NumberSequence" then
        return v44.Keypoints;
    elseif v45 == "Vector3int16" then
        return {
            v44.X, 
            v44.Y, 
            v44.Z
        };
    elseif v45 == "Vector2int16" then
        return {
            v44.X, 
            v44.Y
        };
    else
        return {
            v44
        };
    end;
end;
v0.Filter = function(v46, v47) --[[ Line: 360 ]] --[[ Name: Filter ]]
    local v48 = {};
    for _, v50 in v46 do
        if v47(v50) then
            table.insert(v48, v50);
        end;
    end;
    return v48;
end;
v0.Some = function(v51, v52) --[[ Line: 387 ]] --[[ Name: Some ]]
    for _, v54 in v51 do
        if v52(v54) == true then
            return true;
        end;
    end;
    return false;
end;
v0.IsFlat = function(v55) --[[ Line: 411 ]] --[[ Name: IsFlat ]]
    for _, v57 in v55 do
        if typeof(v57) == "table" then
            return false;
        end;
    end;
    return true;
end;
v0.Every = function(v58, v59) --[[ Line: 437 ]] --[[ Name: Every ]]
    for v60, v61 in v58 do
        if not v59(v61) then
            return false, v60;
        end;
    end;
    return true;
end;
v0.HasKey = function(v62, v63) --[[ Line: 465 ]] --[[ Name: HasKey ]]
    return v62[v63] ~= nil;
end;
v0.HasValue = function(v64, v65) --[[ Line: 483 ]] --[[ Name: HasValue ]]
    for _, v67 in v64 do
        if v67 == v65 then
            return true;
        end;
    end;
    return false;
end;
v0.IsEmpty = function(v68) --[[ Line: 506 ]] --[[ Name: IsEmpty ]]
    return next(v68) == nil;
end;
return table.freeze(v0);