local function v0(v1, v2) --[[ Line: 2 ]] --[[ Name: MutableMergeDeep ]]
    -- upvalues: v0 (copy)
    for v3, v4 in v2 do
        if typeof(v4) == "table" then
            local v5 = v1[v3];
            if not v5 then
                v5 = {};
                v1[v3] = v5;
            end;
            v0(v5, v4);
        else
            v1[v3] = v4;
        end;
    end;
end;
return v0;