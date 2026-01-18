local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_RunService_0 = game:GetService("RunService");
local l_TypeGuard_0 = require(l_ReplicatedFirst_0:WaitForChild("TypeGuard"));
local v5 = l_RunService_0:IsClient();
local l_RecordExperiment_0 = require(l_ReplicatedStorage_0:WaitForChild("Remotes")).RecordExperiment;
local v7 = {
    ExperimentList = {}, 
    Analytics = nil
};
v7._Import = function() --[[ Line: 37 ]] --[[ Name: _Import ]]
    -- upvalues: v7 (copy)
    local l_ExperimentList_0 = v7.ExperimentList;
    local function v14(v9) --[[ Line: 40 ]] --[[ Name: Register ]]
        -- upvalues: l_ExperimentList_0 (copy)
        local v10 = require(v9);
        local l_Name_0 = v9.Name;
        local v12 = 0;
        if string.sub(l_Name_0, 1, 1) == "_" then
            return;
        else
            for v13 in l_Name_0:gmatch(".") do
                v12 = bit32.lshift(v12, 5) - v12 + v13:byte();
            end;
            v10.Concluded = v9.Parent == script.Concluded;
            v10.ID = v12;
            l_ExperimentList_0[l_Name_0] = v10;
            return;
        end;
    end;
    for _, v16 in script:FindFirstChild("Concluded"):GetChildren() do
        v14(v16);
    end;
    for _, v18 in script:FindFirstChild("Active"):GetChildren() do
        v14(v18);
    end;
end;
v7._GetLayer = function(v19) --[[ Line: 78 ]] --[[ Name: _GetLayer ]]
    return Random.new(v19.UserId):NextInteger(1, 10);
end;
v7._GetLayers = function(v20) --[[ Line: 82 ]] --[[ Name: _GetLayers ]]
    local l_Layers_0 = v20.Layers;
    if l_Layers_0 == nil or l_Layers_0 == "*" then
        local v22 = table.create(10);
        table.insert(v22, 1);
        table.insert(v22, 2);
        table.insert(v22, 3);
        table.insert(v22, 4);
        table.insert(v22, 5);
        table.insert(v22, 6);
        table.insert(v22, 7);
        table.insert(v22, 8);
        table.insert(v22, 9);
        table.insert(v22, 10);
        v20.Layers = v22;
        return v22;
    else
        return l_Layers_0;
    end;
end;
v7._GetVariationForFeature = function(v23, v24) --[[ Line: 99 ]] --[[ Name: _GetVariationForFeature ]]
    -- upvalues: v7 (copy), l_RunService_0 (copy)
    local v25 = assert(v7.ExperimentList[v23], "No experiment found by name " .. v23);
    local l_ID_0 = v25.ID;
    local l_Variations_0 = v25.Variations;
    local l_UserId_0 = v24.UserId;
    local v29 = Random.new(l_UserId_0 + l_ID_0);
    local v30 = v7._GetLayer(v24);
    local v31 = l_RunService_0:IsStudio() and v25.ForceInStudio;
    if v31 then
        return assert(l_Variations_0[v31], "Nothing found for forced variation: " .. v31).Data, v31, false;
    else
        local l_ForceUsers_0 = v25.ForceUsers;
        if l_ForceUsers_0 then
            local v33 = l_ForceUsers_0[v24.UserId];
            if v33 then
                return assert(l_Variations_0[v33], "Nothing found for forced variation: " .. v33).Data, v33, false;
            end;
        end;
        if table.find(v7._GetLayers(v25), v30) then
            local v34 = v29:NextNumber();
            local v35 = 0;
            local v36 = {};
            for v37, v38 in l_Variations_0 do
                table.insert(v36, {
                    VariationName = v37, 
                    Variation = v38
                });
            end;
            local v39 = #v36;
            for v40 = 1, v39 do
                local v41 = v29:NextInteger(1, v39);
                local v42 = v36[v41];
                local v43 = v36[v40];
                v36[v40] = v42;
                v36[v41] = v43;
            end;
            for _, v45 in v36 do
                local l_VariationName_0 = v45.VariationName;
                local l_Variation_0 = v45.Variation;
                v35 = v35 + l_Variation_0.Probability;
                if v34 <= v35 then
                    return l_Variation_0.Data, l_VariationName_0, true;
                end;
            end;
            error("Probabilities did not add up to 1 for experiment " .. v23 .. ", got " .. v35);
        end;
        return l_Variations_0.Control.Data, "Control", false;
    end;
end;
v7.GetVariationForFeature = function(v48, v49) --[[ Line: 160 ]] --[[ Name: GetVariationForFeature ]]
    -- upvalues: v7 (copy), v5 (copy), l_RecordExperiment_0 (copy), l_RunService_0 (copy)
    local v50 = v7.ExperimentList[v48];
    if v50.Concluded then
        assert(v50.Conclusion, (("No conclusion variant (string) found for experiment %*"):format(v48)));
        return v50.Variations[v50.Conclusion].Data, v50.Conclusion;
    else
        local v51, v52, v53 = v7._GetVariationForFeature(v48, v49);
        if not v53 then
            return v51, v52;
        else
            local v54 = require(game:GetService("ServerScriptService"):WaitForChild("Data"):WaitForChild("DataManager")).AwaitProfile(v49);
            if not v54 then
                return v51, v52;
            elseif v54.Data.Analytics.Enrolment[v48] then
                return v51, v52;
            elseif v5 then
                l_RecordExperiment_0:FireServer(v48);
                return v51, v52;
            else
                local l_Analytics_0 = v7.Analytics;
                if not l_Analytics_0 then
                    return v51, v52;
                else
                    v54.Data.Analytics.Enrolment[v48] = true;
                    if not l_RunService_0:IsStudio() then
                        task.spawn(l_Analytics_0.SyncEnrolment, l_Analytics_0, v49, v48, v52, v7._GetLayer(v49));
                    end;
                    return v51, v52;
                end;
            end;
        end;
    end;
end;
v7._Import();
if v5 then
    return v7;
else
    v7.Analytics = require(l_ServerScriptService_0:WaitForChild("Server"):WaitForChild("Analytics"));
    local l_ServerRemoteUtil_0 = require(l_ReplicatedFirst_0:WaitForChild("ServerRemoteUtil"));
    local v57 = l_TypeGuard_0.Params(l_TypeGuard_0.Instance("Player"), l_TypeGuard_0.String());
    l_RecordExperiment_0.OnServerEvent:Connect(l_ServerRemoteUtil_0.AntiFlood(30, 10, function(v58, v59) --[[ Line: 219 ]]
        -- upvalues: v57 (copy), v7 (copy)
        v57(v58, v59);
        v7.GetVariationForFeature(v59, v58);
    end));
    return v7;
end;