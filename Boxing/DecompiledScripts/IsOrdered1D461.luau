local function v0(v1, v2) --[[ Line: 5 ]] --[[ Name: IsOrdered1D ]]
    -- upvalues: v0 (copy)
    if v2 then
        local v3 = v1[1];
        for v4 = 2, #v1 do
            local v5 = v1[v4];
            if v5 < v3 then
                return false;
            else
                v3 = v5;
            end;
        end;
        return true;
    elseif v2 == false then
        local v6 = v1[1];
        for v7 = 2, #v1 do
            local v8 = v1[v7];
            if v6 < v8 then
                return false;
            else
                v6 = v8;
            end;
        end;
        return true;
    else
        return v0(v1, true) or v0(v1, false);
    end;
end;
return v0;