local function v0(v1, v2) --[[ Line: 4 ]] --[[ Name: CreatePatchDeep ]]
    -- upvalues: v0 (copy)
    local v3 = {};
    for v4, v5 in v2 do
        local v6 = v1[v4];
        local v7 = typeof(v6) == "table";
        local v8 = typeof(v5) == "table";
        if v7 and v8 then
            v3[v4] = v0(v6, v5);
        elseif v7 then
            v3[v4] = v5;
        elseif v6 == nil then
            if v8 then
                v3[v4] = v0({}, v5);
            else
                v3[v4] = v5;
            end;
        elseif v8 then
            error("Attempt to merge table into non-table value");
        end;
    end;
    return v3;
end;
return v0;