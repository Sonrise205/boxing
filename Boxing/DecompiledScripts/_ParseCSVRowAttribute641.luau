local l__Deserialize_0 = require(script.Parent:WaitForChild("_Deserialize"));
return function(v1) --[[ Line: 4 ]] --[[ Name: Rows ]]
    -- upvalues: l__Deserialize_0 (copy)
    local v2 = {};
    local v3 = {};
    for v4, v5 in v1 do
        if v4 ~= 1 or string.sub(v5[1], 1, 1) ~= "_" then
            local v6 = v1[v4];
            local v7 = #v6;
            local v8 = true;
            if v7 < 2 then
                v8 = v7 == 0;
            end;
            assert(v8, "Row must have at least 2 columns (to define key or path, and value)");
            local v9 = table.create(v7);
            v8 = 0;
            for _, v11 in v6 do
                if v11 == "" then
                    v8 = v8 + 1;
                end;
            end;
            if v8 ~= v7 then
                for v12, v13 in v6 do
                    if v13 == "" then
                        local v14 = v3[v4 - 1];
                        assert(v14, (("Row %* has no previous row to pull down value from: %* %* %*"):format(v4, v14, v12, v13)));
                        v13 = v14[v12];
                    end;
                    if v13:match("%.") and v12 < v7 then
                        for _, v16 in string.split(v13, ".") do
                            table.insert(v9, v16);
                        end;
                    else
                        table.insert(v9, v13);
                    end;
                end;
                local l_v2_0 = v2;
                for v18 = 1, #v9 - 2 do
                    local v19 = l__Deserialize_0(v9[v18]);
                    local v20 = l_v2_0[v19];
                    if not v20 then
                        v20 = {};
                        l_v2_0[v19] = v20;
                    end;
                    l_v2_0 = v20;
                end;
                l_v2_0[l__Deserialize_0(v9[#v9 - 1])] = l__Deserialize_0(v9[#v9]);
                v3[v4] = v9;
            end;
        end;
    end;
    return v2;
end;