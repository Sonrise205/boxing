local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_GetServerSeed_0 = require(l_ReplicatedStorage_0:WaitForChild("Remotes")).GetServerSeed;
local v3 = {
    ExperimentList = {}, 
    Seed = nil
};
v3._Import = function() --[[ Line: 33 ]] --[[ Name: _Import ]]
    -- upvalues: v3 (copy)
    local l_ExperimentList_0 = v3.ExperimentList;
    local function v10(v5) --[[ Line: 36 ]] --[[ Name: Register ]]
        -- upvalues: l_ExperimentList_0 (copy)
        local v6 = require(v5);
        local l_Name_0 = v5.Name;
        local v8 = 0;
        for v9 in l_Name_0:gmatch(".") do
            v8 = bit32.lshift(v8, 5) - v8 + v9:byte();
        end;
        v6.Concluded = v5.Parent == script.Concluded;
        v6.ID = v8;
        l_ExperimentList_0[l_Name_0] = v6;
    end;
    for _, v12 in script:FindFirstChild("Concluded"):GetChildren() do
        v10(v12);
    end;
    for _, v14 in script:FindFirstChild("Active"):GetChildren() do
        v10(v14);
    end;
end;
v3._GetLayers = function(v15) --[[ Line: 64 ]] --[[ Name: _GetLayers ]]
    local l_Layers_0 = v15.Layers;
    if l_Layers_0 == nil or l_Layers_0 == "*" then
        local v17 = table.create(10);
        table.insert(v17, 1);
        table.insert(v17, 2);
        table.insert(v17, 3);
        table.insert(v17, 4);
        table.insert(v17, 5);
        table.insert(v17, 6);
        table.insert(v17, 7);
        table.insert(v17, 8);
        table.insert(v17, 9);
        table.insert(v17, 10);
        v15.Layers = v17;
        return v17;
    else
        return l_Layers_0;
    end;
end;
v3.GetVariationForServer = function(v18) --[[ Line: 81 ]] --[[ Name: GetVariationForServer ]]
    -- upvalues: v3 (copy), l_RunService_0 (copy), l_GetServerSeed_0 (copy)
    local v19 = assert(v3.ExperimentList[v18], ("No experiment found by name %s"):format(v18));
    local l_Variations_0 = v19.Variations;
    if v19.Concluded then
        assert(v19.Conclusion, (("No conclusion variant (string) found for experiment %*"):format(v18)));
        return l_Variations_0[v19.Conclusion].Data, v19.Conclusion;
    else
        if l_RunService_0:IsClient() and not v3.Seed then
            v3.Seed = l_GetServerSeed_0:InvokeServer();
        end;
        local v21 = l_RunService_0:IsStudio() and v19.ForceInStudio;
        if v21 then
            return assert(l_Variations_0[v21], "Nothing found for forced variation: " .. v21).Data, v21, false;
        else
            local v22 = Random.new(v3.Seed):NextInteger(1, 10);
            if not table.find(v3._GetLayers(v19), v22) then
                return l_Variations_0.Control.Data, "Control", false;
            else
                local v23 = Random.new(v3.Seed + v19.ID);
                local v24 = v23:NextNumber();
                local v25 = 0;
                local v26 = {};
                for v27, v28 in l_Variations_0 do
                    table.insert(v26, {
                        VariationName = v27, 
                        Variation = v28
                    });
                end;
                local v29 = #v26;
                for v30 = 1, v29 do
                    local v31 = v23:NextInteger(1, v29);
                    local v32 = v26[v31];
                    local v33 = v26[v30];
                    v26[v30] = v32;
                    v26[v31] = v33;
                end;
                for _, v35 in v26 do
                    local l_Variation_0 = v35.Variation;
                    v25 = v25 + l_Variation_0.Probability;
                    if v24 <= v25 then
                        return l_Variation_0.Data, v35.VariationName, true;
                    end;
                end;
                error(("Probability of all variations below 1 for experiment %s"):format(v18));
                return;
            end;
        end;
    end;
end;
v3._Import();
if l_RunService_0:IsServer() then
    local v37 = os.time();
    v3.Seed = v37;
    l_GetServerSeed_0:SetOnServerInvoke(function() --[[ Line: 140 ]]
        -- upvalues: v37 (copy)
        return v37;
    end);
    if not l_RunService_0:IsStudio() then
        local l_Analytics_0 = require(game:GetService("ServerScriptService"):WaitForChild("Server"):WaitForChild("Analytics"));
        for v39, v40 in v3.ExperimentList do
            assert(v40.ID, ("Experiment %s has no ID field!"):format(v39));
            assert(v40.Variations, ("Experiment %s has no Variations field!"):format(v39));
            assert(v40.Variations.Control, ("Experiment %s has no control variant!"):format(v39));
            if not v40.Concluded then
                local _, v42, v43 = v3.GetVariationForServer(v39);
                if v43 then
                    l_Analytics_0:Log("ServerExperiment", {
                        ServerUID = l_Analytics_0.ServerUID, 
                        ExperimentID = v39, 
                        Variant = v42
                    });
                end;
            end;
        end;
    end;
end;
return v3;