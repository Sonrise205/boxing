local v0 = require(script.Parent.Constants);
local v12 = {
    score = function(v1, v2) --[[ Line: 4 ]] --[[ Name: score ]]
        if v1 < v2 then
            return 0;
        elseif v2 < v1 then
            return 1;
        else
            return 0.5;
        end;
    end, 
    rankings = function(v3, v4) --[[ Line: 13 ]] --[[ Name: rankings ]]
        v4 = v4 or {};
        local v5 = {};
        for v6 in ipairs(v3) do
            table.insert(v5, v4[v6] or v6);
        end;
        local v7 = {};
        local v8 = 1;
        for v9 = 1, #v5 do
            if v9 > 1 and v5[v9 - 1] < v5[v9] then
                v8 = v9;
            end;
            v7[v9] = v8;
        end;
        for v10, _ in ipairs(v7) do
            v7[v10] = v7[v10] - 1;
        end;
        return v7;
    end
};
v12.teamRating = function(v13, v14) --[[ Line: 33 ]] --[[ Name: teamRating ]]
    -- upvalues: v12 (copy)
    local v15 = v12.rankings(v13, v14.rank);
    local v16 = {};
    for v17, v18 in ipairs(v13) do
        local v19 = 0;
        local v20 = 0;
        for _, v22 in ipairs(v18) do
            v19 = v19 + v22.mu;
            v20 = v20 + v22.sigma ^ 2;
        end;
        table.insert(v16, {
            v19, 
            v20, 
            v18, 
            v15[v17]
        });
    end;
    return v16;
end;
v12.ladderPairs = function(v23) --[[ Line: 47 ]] --[[ Name: ladderPairs ]]
    local v24 = #v23;
    if v24 == 0 then
        return {
            {}
        };
    else
        local v25 = {};
        table.move(v23, 1, v24 - 1, 2, v25);
        local v26 = {};
        table.move(v23, 2, v24, 1, v26);
        local v27 = {};
        for v28 = 1, v24 do
            if v25[v28] then
                table.insert(v27, {
                    v25[v28], 
                    v26[v28]
                });
            else
                table.insert(v27, {
                    v26[v28]
                });
            end;
        end;
        return v27;
    end;
end;
v12.permutations = function(v29) --[[ Line: 67 ]] --[[ Name: permutations ]]
    local v30 = #v29 + 1;
    local v31 = {
        {
            unpack(v29)
        }
    };
    local v32 = {};
    for _ = 1, v30 - 1 do
        table.insert(v32, 1);
    end;
    local v34 = 1;
    while v34 < v30 do
        if v32[v34] < v34 then
            if v34 % 2 == 1 then
                local v35 = v29[1];
                local v36 = v29[v34];
                v29[v34] = v35;
                v29[1] = v36;
            else
                local v37 = v32[v34];
                local v38 = v29[v37];
                local v39 = v29[v34];
                v29[v34] = v38;
                v29[v37] = v39;
            end;
            table.insert(v31, {
                unpack(v29)
            });
            v32[v34] = v32[v34] + 1;
            v34 = 1;
        else
            v32[v34] = 1;
            v34 = v34 + 1;
        end;
    end;
    return v31;
end;
v12.c = function(v40, v41) --[[ Line: 94 ]] --[[ Name: c ]]
    -- upvalues: v0 (copy)
    local v42 = v0.betaSq(v41);
    local v43 = 0;
    for _, v45 in ipairs(v40) do
        v43 = v43 + (v45[2] + v42);
    end;
    return (math.sqrt(v43));
end;
v12.sumQ = function(v46, v47) --[[ Line: 103 ]] --[[ Name: sumQ ]]
    local v48 = {};
    for _, v50 in ipairs(v46) do
        local v51 = 0;
        for _, v53 in ipairs(v46) do
            if v53[4] >= v50[4] then
                v51 = v51 + math.exp(v53[1] / v47);
            end;
        end;
        table.insert(v48, v51);
    end;
    return v48;
end;
v12.a = function(v54) --[[ Line: 117 ]] --[[ Name: a ]]
    local v55 = {};
    for _, v57 in ipairs(v54) do
        local v58 = {};
        for _, v60 in ipairs(v54) do
            if v57[4] == v60[4] then
                table.insert(v58, v60);
            end;
        end;
        table.insert(v55, #v58);
    end;
    return v55;
end;
v12.gamma = function(v61, v62, v63) --[[ Line: 137 ]] --[[ Name: gamma ]]
    if v63 and v63.gamma then
        return v63.gamma(v61, v62, v63);
    else
        return math.sqrt(v62) / v61;
    end;
end;
v12.unwind = function(v64, v65) --[[ Line: 145 ]] --[[ Name: unwind ]]
    local v66 = {};
    local v67 = {};
    local v68 = {};
    local v69 = {};
    for v70 = 1, #v65 do
        local v71 = 1e999;
        local v72 = nil;
        for v73, v74 in ipairs(v65) do
            if not table.find(v69, v73) and v74 < v71 then
                v71 = v74;
                v72 = v73;
            end;
        end;
        table.insert(v69, v72);
        v68[v72] = v70;
    end;
    for v75, v76 in ipairs(v64) do
        v66[v68[v75]] = v76;
        v67[v68[v75]] = v75;
    end;
    return v66, v67;
end;
return v12;