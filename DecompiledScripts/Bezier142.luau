--!native
local _ = require(script.Parent.Parent.Types);
local function _(v1, v2, v3) --[[ Line: 7 ]] --[[ Name: Lerp ]]
    return v1 + (v2 - v1) * v3;
end;
local function v11(v5, v6) --[[ Line: 11 ]] --[[ Name: Bezier ]]
    local v7 = table.clone(v5);
    v6 = math.clamp(v6, 0, 1);
    while true do
        local v8 = #v7;
        if v8 > 1 then
            for v9 = 1, v8 - 1 do
                local v10 = v7[v9];
                v7[v9] = v10 + (v7[v9 + 1] - v10) * v6;
            end;
            table.remove(v7, v8);
        else
            break;
        end;
    end;
    return v7[1];
end;
return function(v12) --[[ Line: 33 ]] --[[ Name: CreateBezier ]]
    -- upvalues: v11 (copy)
    return function(v13) --[[ Line: 34 ]]
        -- upvalues: v11 (ref), v12 (copy)
        return (v11(v12, v13.Completion));
    end;
end;