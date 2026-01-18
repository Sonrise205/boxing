local function v0(v1) --[[ Line: 4 ]] --[[ Name: CopyDeep ]]
    -- upvalues: v0 (copy)
    local v2 = {};
    for v3, v4 in v1 do
        v2[v3] = if typeof(v4) == "table" then v0(v4) else v4;
    end;
    return v2;
end;
return v0;