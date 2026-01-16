local v0 = {
    Settings = {
        DefaultModel = "PlackettLuce"
    }
};
local v1 = require(script.Constants);
local v2 = require(script.Statistics);
local v3 = require(script.Util);
local v4 = require(script.Models);
v0.Ordinal = function(v5, v6) --[[ Line: 53 ]] --[[ Name: Ordinal ]]
    -- upvalues: v1 (copy)
    local v7 = v6 or {};
    return v5.mu - v1.z(v7) * v5.sigma;
end;
v0.Rating = function(v8, v9, v10) --[[ Line: 58 ]] --[[ Name: Rating ]]
    -- upvalues: v1 (copy)
    v10 = v10 or {};
    local v11 = {};
    for v12, v13 in next, v10 do
        v11[v12] = v13;
    end;
    v11.mu = v8;
    return {
        mu = v8 or v1.mu(v10), 
        sigma = v9 or v1.sigma(v11)
    };
end;
v0.Rate = function(v14, v15) --[[ Line: 71 ]] --[[ Name: Rate ]]
    -- upvalues: v4 (copy), v0 (copy), v3 (copy)
    v15 = v15 or {};
    local v16 = v4[v15.model or v0.Settings.DefaultModel];
    if v15.rank == nil and v15.score == nil then
        local v17 = v16(v14, v15);
        for v18, v19 in ipairs(v17) do
            for v20, v21 in ipairs(v19) do
                v14[v18][v20].mu = v21[1];
                v14[v18][v20].sigma = v21[2];
            end;
        end;
        return v17;
    else
        local l_rank_0 = v15.rank;
        if not l_rank_0 then
            l_rank_0 = {};
            for v23, v24 in ipairs(v15.score) do
                l_rank_0[v23] = -v24;
            end;
        end;
        local v25, v26 = v3.unwind(v14, l_rank_0);
        local v27 = {};
        for v28, v29 in next, v15 do
            v27[v28] = v29;
        end;
        table.sort(l_rank_0);
        v27.rank = l_rank_0;
        local v30 = v16(v25, v27);
        local v31 = v3.unwind(v30, v26);
        for v32, v33 in ipairs(v31) do
            for v34, v35 in ipairs(v33) do
                v14[v32][v34].mu = v35[1];
                v14[v32][v34].sigma = v35[2];
            end;
        end;
        return v31;
    end;
end;
v0.WinProbability = function(v36, v37) --[[ Line: 109 ]] --[[ Name: WinProbability ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    v37 = v37 or {};
    local v38 = v3.teamRating(v36, v37);
    local v39 = v1.betaSq(v37);
    local v40 = #v36;
    local v41 = v40 * (v40 - 1) / 2;
    local v42 = {};
    for v43, v44 in ipairs(v38) do
        local v45 = 0;
        for v46, v47 in ipairs(v38) do
            if v43 ~= v46 then
                v45 = v45 + v2.phiMajor((v44[1] - v47[1]) / math.sqrt(v40 * v39 + v44[2] ^ 2 + v47[2] ^ 2));
            end;
        end;
        table.insert(v42, v45 / v41);
    end;
    return v42;
end;
v0.DrawProbability = function(v48, v49) --[[ Line: 129 ]] --[[ Name: DrawProbability ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    v49 = v49 or {};
    local v50 = v3.teamRating(v48, v49);
    local v51 = v1.betaSq(v49);
    local v52 = v1.beta(v49);
    local v53 = #v48;
    if v53 == 0 then
        return;
    elseif v53 == 1 then
        return 1;
    else
        local v54 = v53 * (v53 - 1) / (v53 > 2 and 1 or 2);
        local v55 = 0;
        for _, v57 in ipairs(v48) do
            v55 = v55 + #v57;
        end;
        local v58 = math.sqrt(v55) * v52 * v2.phiMajorInverse((1 / v53 + 1) / 2);
        local v59 = 0;
        for v60, v61 in ipairs(v50) do
            for v62, v63 in ipairs(v50) do
                if v60 ~= v62 then
                    local v64 = math.sqrt(v53 * v51 + v61[2] ^ 2 + v63[2] ^ 2);
                    v59 = v59 + (v2.phiMajor((v58 - v61[1] + v63[1]) / v64) - v2.phiMajor((v61[1] - v63[1] - v58) / v64));
                end;
            end;
        end;
        return math.abs(v59) / v54;
    end;
end;
return v0;