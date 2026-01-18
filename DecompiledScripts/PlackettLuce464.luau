local v0 = require(script.Parent.Parent.Util);
local v1 = require(script.Parent.Parent.Constants);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy), v0 (copy)
    v3 = v3 or {};
    local v4 = v1.epsilon(v3);
    local v5 = v0.teamRating(v2, v3);
    local v6 = v0.c(v5, v3);
    local v7 = v0.sumQ(v5, v6);
    local v8 = v0.a(v5);
    local v9 = {};
    for v10, v11 in ipairs(v5) do
        local v12, v13, v14, v15 = unpack(v11);
        local v16 = math.exp(v12 / v6);
        local v17 = 0;
        local v18 = 0;
        for v19, v20 in ipairs(v5) do
            if v20[4] <= v15 then
                local v21 = v16 / v7[v19];
                if v10 == v19 then
                    v17 = v17 + (1 - v21) / v8[v19];
                else
                    v17 = v17 + -v21 / v8[v19];
                end;
                v18 = v18 + v21 * (1 - v21) / v8[v19];
            end;
        end;
        local v22 = v0.gamma(v6, v13, v3);
        local v23 = v17 * (v13 / v6);
        local v24 = v22 * v18 * (v13 / v6 ^ 2);
        local v25 = {};
        for _, v27 in ipairs(v14) do
            table.insert(v25, {
                v27.mu + v27.sigma ^ 2 / v13 * v23, 
                v27.sigma * math.sqrt((math.max(1 - v27.sigma ^ 2 / v13 * v24, v4)))
            });
        end;
        v9[v10] = v25;
    end;
    return v9;
end;