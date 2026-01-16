local l_PrivateServerPlusModules_0 = game.ReplicatedStorage.PrivateServerPlusModules;
local _ = require(l_PrivateServerPlusModules_0.SettingTypes);
local v2 = require(l_PrivateServerPlusModules_0.SortOrder);
local l_Categories_0 = l_PrivateServerPlusModules_0.Categories;
local function v22() --[[ Line: 10 ]] --[[ Name: validateSettings ]]
    -- upvalues: v2 (copy), l_Categories_0 (copy), l_PrivateServerPlusModules_0 (copy)
    local v4 = {};
    for _, v6 in v2.Categories do
        local l_l_Categories_0_FirstChild_0 = l_Categories_0:FindFirstChild(v6);
        if not l_l_Categories_0_FirstChild_0 or not l_l_Categories_0_FirstChild_0:IsA("Folder") then
            table.insert(v4, (("Category '%*' defined in SortOrder but folder not found"):format(v6)));
        else
            local v8 = v2.Settings[v6];
            local v9 = {};
            for _, v11 in v8 do
                local l_l_l_Categories_0_FirstChild_0_FirstChild_0 = l_l_Categories_0_FirstChild_0:FindFirstChild(v11);
                if not l_l_l_Categories_0_FirstChild_0_FirstChild_0 or not l_l_l_Categories_0_FirstChild_0_FirstChild_0:IsA("ModuleScript") then
                    table.insert(v4, (("Setting '%*' defined in SortOrder for category '%*', but ModuleScript not found"):format(v11, v6)));
                else
                    local v13 = require(l_l_l_Categories_0_FirstChild_0_FirstChild_0);
                    if v13.Type == "Button" then
                        local l_ClientCallbackName_0 = v13.ClientCallbackName;
                        if l_ClientCallbackName_0 and not l_PrivateServerPlusModules_0.ButtonGuiCallbacks:FindFirstChild(l_ClientCallbackName_0) then
                            table.insert(v4, (("Client callback \"%*\" defined for setting %*, but no matching module exists"):format(l_ClientCallbackName_0, v11)));
                        end;
                    end;
                    v9[v11] = true;
                end;
            end;
            for _, v16 in l_l_Categories_0_FirstChild_0:GetChildren() do
                if v16:IsA("ModuleScript") and not v9[v16.Name] then
                    table.insert(v4, (("ModuleScript '%*' exists in category '%*', but is not defined in SortOrder"):format(v16.Name, v6)));
                end;
            end;
        end;
    end;
    for _, v18 in l_Categories_0:GetChildren() do
        if v18:IsA("Folder") then
            local v19 = false;
            for _, v21 in v2.Categories do
                if v18.Name == v21 then
                    v19 = true;
                    break;
                end;
            end;
            if not v19 then
                table.insert(v4, (("Category folder '%*' exists but is not defined in SortOrder.Categories"):format(v18.Name)));
            end;
        end;
    end;
    return v4;
end;
return {
    validate = v22, 
    validateOnStartup = function() --[[ Line: 72 ]] --[[ Name: validateOnStartup ]]
        -- upvalues: v22 (copy)
        local v23 = v22();
        if #v23 > 0 then
            warn("[PSPLUS] SETTINGS STRUCTURE VALIDATION ERRORS:");
            for v24, v25 in v23 do
                warn((("  [%*] %*"):format(v24, v25)));
            end;
            return false;
        else
            return true;
        end;
    end
};