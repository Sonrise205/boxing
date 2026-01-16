local v0 = require(script.Parent.Parent.Util);
local v1 = require(script.Parent.Parent.Constants);
local v2 = require(script.Parent.Parent.Statistics);
return function(v3, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v0 (copy), v2 (copy)
    v4 = v4 or {};
    local v5 = v1.betaSq(v4) * 2;
    local v6 = v1.epsilon(v4);
    local v7 = v0.teamRating(v3, v4);
    local v8 = {};
    for v9, v10 in ipairs(v7) do
        local v11, v12, v13, v14 = unpack(v10);
        local v15 = 0;
        local v16 = 0;
        for v17, v18 in ipairs(v7) do
            local v19, v20, _, v22 = unpack(v18);
            if v9 ~= v17 then
                local v23 = math.sqrt(v12 + v20 + v5);
                local v24 = (v11 - v19) / v23;
                local v25 = v12 / v23;
                local v26 = v0.gamma(v23, v12);
                if v14 < v22 then
                    v15 = v15 + v25 * v2.v(v24, v6 / v23);
                    v16 = v16 + v26 * v25 / v23 * v2.w(v24, v6 / v23);
                elseif v22 < v14 then
                    v15 = v15 + -v25 * v2.v(-v24, v6 / v23);
                    v16 = v16 + v26 * v25 / v23 * v2.w(-v24, v6 / v23);
                else
                    v15 = v15 + v25 * v2.vt(v24, v6 / v23);
                    v16 = v16 + v26 * v25 / v23 * v2.wt(v24, v6 / v23);
                end;
            end;
        end;
        local v27 = {};
        for _, v29 in ipairs(v13) do
            table.insert(v27, {
                v29.mu + v29.sigma ^ 2 / v12 * v15, 
                v29.sigma * math.sqrt((math.max(1 - v29.sigma ^ 2 / v12 * v16, v6)))
            });
        end;
        v8[v9] = v27;
    end;
    return v8;
end;