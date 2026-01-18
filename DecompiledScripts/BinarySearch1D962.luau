return function(v0, v1, v2) --[[ Line: 2 ]] --[[ Name: BinarySearch1D ]]
    local v3 = 1;
    local v4 = #v0;
    local v5 = math.floor((v3 + v4) / 2);
    while true do
        if v3 <= v4 then
            local v6 = v0[v5];
            if v6 == v1 then
                return v5;
            else
                if v6 < v1 then
                    v3 = v5 + 1;
                else
                    v4 = v5 - 1;
                end;
                v5 = math.floor((v3 + v4) / 2);
            end;
        else
            return v2 and v5 or nil;
        end;
    end;
end;