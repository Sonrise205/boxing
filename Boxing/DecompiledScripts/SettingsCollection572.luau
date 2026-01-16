local l_PrivateServerPlusModules_0 = game.ReplicatedStorage.PrivateServerPlusModules;
local v1 = require(l_PrivateServerPlusModules_0.SortOrder);
local _ = require(l_PrivateServerPlusModules_0.SettingTypes);
local v3 = l_PrivateServerPlusModules_0:WaitForChild("Categories", 10);
return ((function() --[[ Line: 18 ]] --[[ Name: collectSettings ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v4 = {
        Categories = {}, 
        Settings = {}
    };
    for _, v6 in ipairs(v1.Categories) do
        local l_v3_FirstChild_0 = v3:FindFirstChild(v6);
        if l_v3_FirstChild_0 and l_v3_FirstChild_0:IsA("Folder") then
            local v8 = {
                Name = v6, 
                Settings = {}
            };
            for _, v10 in v1.Settings[v6] do
                local v11 = l_v3_FirstChild_0:WaitForChild(v10, 5);
                if v11 and v11:IsA("ModuleScript") then
                    local v12 = nil;
                    pcall(function() --[[ Line: 41 ]]
                        -- upvalues: v12 (ref), v11 (copy)
                        v12 = require(v11);
                    end);
                    if not v12 then
                        --[[ close >= 15 ]]
                    else
                        table.insert(v8.Settings, v12.ID);
                        v4.Settings[v12.ID] = v12;
                        --[[ close >= 15 ]]
                    end;
                else
                    warn((("Could not find module for %*"):format(v10)));
                end;
            end;
            table.insert(v4.Categories, v8);
        end;
    end;
    return v4;
end)());