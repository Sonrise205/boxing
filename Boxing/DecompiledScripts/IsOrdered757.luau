local function v8(v0, v1) --[[ Line: 1 ]] --[[ Name: _IsOrdered ]]
    if v1 then
        local v2 = v0[1];
        for v3 = 2, #v0 do
            local v4 = v0[v3];
            if v4 < v2 then
                return false;
            else
                v2 = v4;
            end;
        end;
        return true;
    else
        local v5 = v0[1];
        for v6 = 2, #v0 do
            local v7 = v0[v6];
            if v5 < v7 then
                return false;
            else
                v5 = v7;
            end;
        end;
        return true;
    end;
end;
return function(v9, v10) --[[ Line: 39 ]] --[[ Name: IsOrdered ]]
    -- upvalues: v8 (copy)
    if v10 == nil and v9[1] ~= nil and v9[2] ~= nil then
        return (v8(v9, v9[1] < v9[2]));
    else
        return (v8(v9, v10));
    end;
end;