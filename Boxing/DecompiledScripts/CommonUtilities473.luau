local l_Workspace_0 = game:GetService("Workspace");
local _ = game:GetService("ServerScriptService");
local v8 = {
    GetPlayerData = function(v2) --[[ Line: 6 ]] --[[ Name: GetPlayerData ]]
        -- upvalues: l_Workspace_0 (copy)
        if not v2 then
            return;
        else
            local l_FirstChild_0 = l_Workspace_0.States:FindFirstChild(v2.Name);
            if not l_FirstChild_0 then
                return;
            else
                return l_FirstChild_0:FindFirstChild("PlayerData");
            end;
        end;
    end, 
    GetCharacterData = function(v4) --[[ Line: 14 ]] --[[ Name: GetCharacterData ]]
        -- upvalues: l_Workspace_0 (copy)
        if not v4 then
            return;
        else
            local l_FirstChild_1 = l_Workspace_0.States:FindFirstChild(v4.Name);
            if not l_FirstChild_1 then
                return;
            else
                return l_FirstChild_1:FindFirstChild("CharacterData");
            end;
        end;
    end, 
    GetOccupied = function(v6) --[[ Line: 22 ]] --[[ Name: GetOccupied ]]
        -- upvalues: l_Workspace_0 (copy)
        if not v6 then
            return;
        else
            local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(v6.Name);
            if not l_FirstChild_2 then
                return;
            else
                return l_FirstChild_2:FindFirstChild("Occupied");
            end;
        end;
    end
};
deepcopy = function(v9, v10) --[[ Line: 30 ]] --[[ Name: deepcopy ]]
    v10 = v10 or {};
    local v11 = type(v9);
    local v12 = nil;
    if v11 == "table" then
        if v10[v9] then
            return v10[v9];
        else
            v12 = {};
            v10[v9] = v12;
            for v13, v14 in next, v9 do
                v12[deepcopy(v13, v10)] = deepcopy(v14, v10);
            end;
            setmetatable(v12, deepcopy(getmetatable(v9), v10));
            return v12;
        end;
    else
        return v9;
    end;
end;
v8.DeepCopy = function(v15, v16) --[[ Line: 51 ]] --[[ Name: DeepCopy ]]
    return deepcopy(v15, v16);
end;
deepMergeMissing = function(v17, v18) --[[ Line: 55 ]] --[[ Name: deepMergeMissing ]]
    for v19, v20 in pairs(v18) do
        if type(v20) == "table" then
            if type(v17[v19]) ~= "table" then
                v17[v19] = v20;
            else
                deepMergeMissing(v17[v19], v20);
            end;
        elseif v17[v19] == nil then
            v17[v19] = v20;
        end;
    end;
end;
v8.DeepMergeMissing = function(v21, v22) --[[ Line: 71 ]] --[[ Name: DeepMergeMissing ]]
    return deepMergeMissing(v21, v22);
end;
return v8;