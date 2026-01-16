return function(v0, v1) --[[ Line: 2 ]] --[[ Name: Merge ]]
    local v2 = #v0;
    if v2 == 0 then
        return v1;
    else
        local v3 = #v1;
        if v3 == 0 then
            return v0;
        elseif v0 == v1 then
            return v0;
        else
            local v4 = table.create(v2 + v3);
            table.move(v0, 1, v2, 1, v4);
            table.move(v1, 1, v3, v2 + 1, v4);
            return v4;
        end;
    end;
end;