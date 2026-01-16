local function v0(v1, v2) --[[ Line: 8 ]] --[[ Name: CreateNonOverwritingPatchDeep ]]
    -- upvalues: v0 (copy)
    local v3 = {};
    for v4, v5 in v2 do
        local v6 = v1[v4];
        if type(v5) == "table" and type(v6) == "table" then
            v3[v4] = v0(v6 or {}, v5);
        elseif v6 == nil then
            v3[v4] = v5;
        end;
    end;
    return v3;
end;
return v0;