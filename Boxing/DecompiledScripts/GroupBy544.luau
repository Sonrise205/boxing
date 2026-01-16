return function(v0, v1) --[[ Line: 3 ]] --[[ Name: GroupBy ]]
    local v2 = {};
    for v3, v4 in v0 do
        local v5 = v1(v4, v3);
        if v5 ~= nil then
            local v6 = v2[v5];
            if v6 then
                v6[v3] = v4;
            else
                v2[v5] = {
                    [v3] = v4
                };
            end;
        end;
    end;
    return v2;
end;