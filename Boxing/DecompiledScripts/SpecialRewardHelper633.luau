local v0 = {};
local _ = function(v1) --[[ Line: 4 ]] --[[ Name: chooseWeighted ]]
    local v2 = 0;
    for _, v4 in v1 do
        v2 = v2 + v4;
    end;
    local v5 = math.random() * v2;
    local v6 = 0;
    for v7, v8 in v1 do
        v6 = v6 + v8;
        if v5 <= v6 then
            return v7;
        end;
    end;
end;
local function _(v10) --[[ Line: 22 ]] --[[ Name: getRandomFromRange ]]
    if not v10 or not v10.min then
        return nil;
    elseif v10.step == 0 then
        return v10.min;
    else
        local v11 = (v10.max - v10.min) / v10.step + 1;
        local v12 = math.random(1, v11);
        return v10.min + (v12 - 1) * v10.step;
    end;
end;
v0.GetRandomReward = function(v14) --[[ Line: 38 ]] --[[ Name: GetRandomReward ]]
    local v15 = false;
    local v16 = false;
    local l_Rates_0 = v14.Rates;
    local v18 = 0;
    for _, v20 in l_Rates_0 do
        v18 = v18 + v20;
    end;
    local v21 = math.random() * v18;
    local v22 = 0;
    local v23;
    for v24, v25 in l_Rates_0 do
        v22 = v22 + v25;
        if v21 <= v22 then
            v23 = v24;
            v15 = true;
        end;
        if v15 then
            break;
        end;
    end;
    if not v15 then
        v23 = nil;
    end;
    v15 = false;
    l_Rates_0 = v14.Drops[v23];
    if not l_Rates_0 then
        warn("Rarity not found:", v23);
        return nil;
    else
        v21 = l_Rates_0.distribution;
        v22 = 0;
        for _, v27 in v21 do
            v22 = v22 + v27;
        end;
        local v28 = math.random() * v22;
        local v29 = 0;
        for v30, v31 in v21 do
            v29 = v29 + v31;
            if v28 <= v29 then
                v18 = v30;
                v16 = true;
            end;
            if v16 then
                break;
            end;
        end;
        if not v16 then
            v18 = nil;
        end;
        v16 = false;
        v22 = l_Rates_0[v18];
        if not v22 or not v22.min then
            v21 = nil;
        elseif v22.step == 0 then
            v21 = v22.min;
        else
            v28 = (v22.max - v22.min) / v22.step + 1;
            v29 = math.random(1, v28);
            v21 = v22.min + (v29 - 1) * v22.step;
        end;
        v29 = (v14.Rates[v23] or 0) * (l_Rates_0.distribution[v18] or 0);
        return {
            Rarity = v23, 
            Type = v18, 
            Amount = v21, 
            Chance = v29
        };
    end;
end;
return v0;