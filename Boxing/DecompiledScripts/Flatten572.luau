local function v0(v1, v2) --[[ Line: 2 ]] --[[ Name: Flatten ]]
    -- upvalues: v0 (copy)
    v2 = v2 or 1e999;
    if v2 == 0 then
        return;
    else
        local v3 = {};
        for v4, v5 in v1 do
            if typeof(v5) == "table" then
                local v6 = v0(v5, v2 - 1);
                if v6 then
                    for v7, v8 in v6 do
                        v3[v7] = v8;
                    end;
                end;
            else
                v3[v4] = v5;
            end;
        end;
        return v3;
    end;
end;
return v0;