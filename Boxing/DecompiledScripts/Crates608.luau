local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Gloves_0 = l_ReplicatedStorage_0:WaitForChild("Gloves");
local v2 = {};
local function v3(v4) --[[ Line: 6 ]] --[[ Name: LockTable ]]
    -- upvalues: v3 (copy)
    for _, v6 in v4 do
        if type(v6) == "table" then
            v3(v6);
        end;
    end;
    if not table.isfrozen(v4) then
        table.freeze(v4);
    end;
end;
local l_script_Children_0 = script:GetChildren();
for _, v9 in l_script_Children_0 do
    v2[v9.Name] = require(v9);
    local v10 = {
        Uncommon = {}, 
        Rare = {}, 
        Mythic = {}, 
        Legendary = {}
    };
    for _, v12 in v2[v9.Name].Drops do
        if not v2[v9.Name].IsGameRewardFormat then
            if type(v12) == "table" and v12.Rarity then
                table.insert(v10[v12.Rarity], v12);
                local l_Weight_0 = v12.Weight;
                if l_Weight_0 then
                    for _ = 1, l_Weight_0 - 1 do
                        table.insert(v10[v12.Rarity], v12);
                    end;
                end;
            else
                local l_l_Gloves_0_FirstChild_0 = l_Gloves_0:FindFirstChild(v12);
                if l_l_Gloves_0_FirstChild_0 then
                    table.insert(v10[require(l_l_Gloves_0_FirstChild_0.Metadata).Rarity], v12);
                end;
            end;
        end;
    end;
    v2[v9.Name].DropsByRarity = v10;
end;
local v16 = {};
for _, v18 in l_Gloves_0:GetChildren() do
    table.insert(v16, v18.Name);
end;
local v19 = {};
for _, v21 in l_ReplicatedStorage_0:WaitForChild("Modules", 10):WaitForChild("UnusualHelper", 10):WaitForChild("Effects", 10):GetChildren() do
    table.insert(v19, v21.Name);
end;
table.sort(v16, function(v22, v23) --[[ Line: 70 ]]
    return v22 < v23;
end);
table.sort(v19, function(v24, v25) --[[ Line: 71 ]]
    return v24 < v25;
end);
local v26 = {};
local v27 = {};
local v28 = 1;
for _, v30 in v16 do
    v26[v30] = v28;
    v27[v28] = v30;
    v28 = v28 + 1;
    for _, v32 in v19 do
        local v33 = v30 .. "_" .. v32;
        v26[v33] = v28;
        v27[v28] = v33;
        v28 = v28 + 1;
    end;
end;
v2.GetIdFromGloveName = function(v34, v35) --[[ Line: 93 ]] --[[ Name: GetIdFromGloveName ]]
    -- upvalues: v26 (copy)
    if v35 then
        v34 = v34 .. "_" .. v35;
    end;
    return v26[v34] or 1;
end;
v2.GetGloveNameFromId = function(v36) --[[ Line: 101 ]] --[[ Name: GetGloveNameFromId ]]
    -- upvalues: v27 (copy)
    local v37 = v27[v36];
    local v38 = string.split(v37, "_");
    return v38[1], v38[2];
end;
v2.CheckIfGloveIsUnique = function(v39) --[[ Line: 111 ]] --[[ Name: CheckIfGloveIsUnique ]]
    -- upvalues: l_Gloves_0 (copy), l_script_Children_0 (copy), v2 (copy)
    if not v39.Unusual then
        return false;
    elseif v39.Name == "Troll" and v39.Unusual == "Troll" then
        return false;
    elseif not v39.Name then
        return false;
    else
        local l_l_Gloves_0_FirstChild_1 = l_Gloves_0:FindFirstChild(v39.Name);
        if l_l_Gloves_0_FirstChild_1 and l_l_Gloves_0_FirstChild_1:FindFirstChild("Metadata") and require(l_l_Gloves_0_FirstChild_1.Metadata).SellPrice then
            return true;
        else
            local v41 = {
                "Love", 
                "Troll"
            };
            for _, v43 in l_script_Children_0 do
                local v44 = v2[v43.Name];
                local l_Drops_0 = v44.Drops;
                local l_Unusuals_0 = v44.Unusuals;
                if l_Drops_0 and l_Unusuals_0 and (table.find(l_Drops_0, v39.Name) and table.find(l_Unusuals_0, v39.Unusual) or table.find(v41, v39.Unusual)) then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v3(v2);
return v2;