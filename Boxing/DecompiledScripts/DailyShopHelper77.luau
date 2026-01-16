local v0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules", 10);
local v1 = v0:WaitForChild("EffectHelper", 10);
local v2 = v0:WaitForChild("Maps", 10);
local v3 = v0:WaitForChild("Crates", 10);
local v4 = v1:WaitForChild("Entrances", 10);
local v5 = v1:WaitForChild("Knockdowns", 10);
local v6 = {};
for _, v8 in v2:GetChildren() do
    if require(v8).Price then
        table.insert(v6, v8.Name);
    end;
end;
local v9 = {};
for _, v11 in v3:GetChildren() do
    local v12 = require(v11);
    if not v12.Special and v12.Price then
        table.insert(v9, v11.Name);
    end;
end;
local v13 = {};
for _, v15 in v4:GetChildren() do
    if v15:IsA("Folder") then
        for _, v17 in v15:GetChildren() do
            if not require(v17).Metadata.IgnoreShop then
                table.insert(v13, v17.Name);
            end;
        end;
    elseif v15:IsA("ModuleScript") and not require(v15).Metadata.IgnoreShop then
        table.insert(v13, v15.Name);
    end;
end;
local v18 = {};
for _, v20 in v5:GetChildren() do
    if not require(v20).Metadata.IgnoreShop then
        table.insert(v18, v20.Name);
    end;
end;
table.sort(v6);
table.sort(v9);
table.sort(v13);
table.sort(v18);
local v21 = {};
GetRawCycle = function() --[[ Line: 74 ]] --[[ Name: GetRawCycle ]]
    return (workspace:GetServerTimeNow() - 1711641600) / 21600 + 1;
end;
v21.GetCurrentCycle = function() --[[ Line: 78 ]] --[[ Name: GetCurrentCycle ]]
    return (math.floor((GetRawCycle())));
end;
v21.GetCurrentCycleInPeriod = function() --[[ Line: 82 ]] --[[ Name: GetCurrentCycleInPeriod ]]
    -- upvalues: v21 (copy)
    return v21.GetCurrentCycle() - (v21.GetCurrentPeriod() * 100 - 100) + 1;
end;
v21.GetCurrentPeriod = function() --[[ Line: 86 ]] --[[ Name: GetCurrentPeriod ]]
    -- upvalues: v21 (copy)
    return math.floor(v21.GetCurrentCycle() / 100) + 1;
end;
v21.GetTimeUntilNextSeason = function() --[[ Line: 90 ]] --[[ Name: GetTimeUntilNextSeason ]]
    -- upvalues: v21 (copy)
    return (v21.GetCurrentCycle() + 1 - GetRawCycle()) * 21600;
end;
local v22 = {};
local v23 = v21.GetCurrentPeriod();
v21.GenerateCycles = function() --[[ Line: 98 ]] --[[ Name: GenerateCycles ]]
    -- upvalues: v21 (copy), v22 (ref), v6 (copy), v9 (copy), v13 (copy), v18 (copy)
    local v24 = Random.new(v21.GetCurrentPeriod());
    local function v28(v25) --[[ Line: 101 ]] --[[ Name: shuffleArray ]]
        -- upvalues: v24 (copy)
        local v26 = {
            unpack(v25)
        };
        for v27 = 1, #v25 do
            v25[v27] = table.remove(v26, v24:NextInteger(1, #v26));
        end;
        return v25;
    end;
    v22 = {
        Maps = {}, 
        Crates = {}, 
        Entrances = {}, 
        Knockdowns = {}
    };
    local v29 = {
        Maps = {}, 
        Crates = {}, 
        Entrances = {}, 
        Knockdowns = {}
    };
    local function v40(v30, v31, v32, v33) --[[ Line: 125 ]] --[[ Name: Perform ]]
        -- upvalues: v29 (copy), v28 (copy), v22 (ref)
        if #v29[v31] <= v33 then
            local v34 = v28(table.clone(v32));
            for v35 = 1, #v34 do
                local v36 = v34[v35];
                if not table.find(v29[v31], v36) and (#v32 <= v33 * 2 or v30 < 2 or not table.find(v22[v31][v30 - 1], v36)) then
                    table.insert(v29[v31], v36);
                end;
            end;
        end;
        local v37 = {};
        for v38 = 1, v33 do
            table.insert(v37, v29[v31][v38]);
        end;
        v22[v31][v30] = v37;
        for _ = 1, v33 do
            table.remove(v29[v31], 1);
        end;
    end;
    for v41 = 1, 100 do
        v40(v41, "Maps", v6, 4);
        v40(v41, "Crates", v9, 2);
        v40(v41, "Entrances", v13, 4);
        v40(v41, "Knockdowns", v18, 3);
    end;
end;
v21.GenerateCycles();
v21.GetItems = function() --[[ Line: 163 ]] --[[ Name: GetItems ]]
    -- upvalues: v21 (copy), v23 (ref), v22 (ref)
    local v42 = v21.GetCurrentPeriod();
    if v23 < v42 then
        v23 = v42;
        v21.GenerateCycles();
    end;
    local v43 = v21.GetCurrentCycleInPeriod();
    local v44 = {};
    for v45, _ in v22 do
        v44[v45] = v22[v45][v43];
    end;
    return v44;
end;
return v21;