local l__Deserialize_0 = require(script.Parent:WaitForChild("_Deserialize"));
return function(v1) --[[ Line: 4 ]] --[[ Name: Columns ]]
    -- upvalues: l__Deserialize_0 (copy)
    local v2 = v1[1];
    local v3 = {};
    for v4 = 2, #v1 do
        local v5 = v1[v4];
        local v6 = {};
        for v7, v8 in v5 do
            local v9 = v2[v7];
            if v9 then
                local l_v6_0 = v6;
                if v8 ~= "" then
                    v8 = l__Deserialize_0(v8);
                    if v9:match("%.") then
                        local v11 = v9:split(".");
                        for v12 = 1, #v11 - 1 do
                            local v13 = v11[v12];
                            local v14 = tonumber(v13) or v13;
                            if not l_v6_0[v14] then
                                l_v6_0[v14] = {};
                            end;
                            l_v6_0 = l_v6_0[v14];
                        end;
                        l_v6_0[v11[#v11]] = v8;
                    else
                        l_v6_0[v9] = v8;
                    end;
                end;
            end;
        end;
        table.insert(v3, v6);
    end;
    return v3;
end;