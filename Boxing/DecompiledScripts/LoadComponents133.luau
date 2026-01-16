local l_RunService_0 = game:GetService("RunService");
local v1 = l_RunService_0:IsServer();
local v2 = l_RunService_0:IsStudio();
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local l_Rosyn_0 = require(l_ReplicatedFirst_0:WaitForChild("Rosyn"));
local _ = require(l_ReplicatedFirst_0:WaitForChild("Async"));
local _ = game:GetService("ReplicatedStorage");
l_Rosyn_0.SetInitialTagsEnabled(true);
l_Rosyn_0.SetConstructorTagsEnabled(true);
local _ = Random.new();
local v9 = {};
local function v29(v10) --[[ Line: 19 ]] --[[ Name: Load ]]
    -- upvalues: l_Places_0 (copy), v1 (copy), v2 (copy), v9 (copy), l_Rosyn_0 (copy)
    local v11 = nil;
    for v12, v13 in l_Places_0 do
        if game.PlaceId == v13 then
            v11 = v12;
            break;
        end;
    end;
    for _, v15 in v10:GetDescendants() do
        if v15:IsA("ModuleScript") then
            if not v1 and not v2 then
                task.wait();
                task.wait();
            end;
            task.spawn(function() --[[ Line: 39 ]]
                -- upvalues: v15 (copy), v9 (ref), v11 (ref), l_Rosyn_0 (ref)
                local l_Name_0 = v15.Name;
                if l_Name_0:sub(1, 1) == "_" then
                    return;
                else
                    local v17 = task.delay(60, error, (("Component script '%*' took too long to be required!"):format(l_Name_0)));
                    local _ = os.clock();
                    local l_status_0, l_result_0 = pcall(require, v15);
                    task.cancel(v17);
                    if not l_status_0 then
                        task.spawn(error, (("Failed to load component module for %*:\n%*"):format(l_Name_0, l_result_0)));
                        return;
                    elseif v9[l_result_0] then
                        return;
                    else
                        v9[l_result_0] = true;
                        if type(l_result_0) == "table" and l_result_0.Initial then
                            if not l_result_0.Type then
                                l_result_0.Type = l_Name_0;
                                print((("![LoadComponents] Component script %* missing Type field! Assigning to script name by default.!"):format(l_Name_0)));
                            end;
                            task.spawn(function() --[[ Line: 70 ]]
                                -- upvalues: l_Name_0 (copy), l_result_0 (copy), v11 (ref), l_Rosyn_0 (ref)
                                debug.setmemorycategory((("RegisterComponent-%*"):format(l_Name_0)));
                                local l_Init_0 = l_result_0.Init;
                                if l_Init_0 then
                                    l_Init_0();
                                end;
                                local v22 = l_result_0["Init" .. v11];
                                if v22 then
                                    v22();
                                end;
                                l_Init_0 = l_result_0.Register;
                                local v23 = true;
                                if l_Init_0 ~= nil then
                                    v23 = typeof(l_Init_0) == "table";
                                end;
                                assert(v23, (("Register field must be a table for component script '%*'."):format(l_Name_0)));
                                if l_Init_0 then
                                    v22 = l_Init_0.ExcludePlaces;
                                    v23 = l_Init_0.IncludePlaces;
                                    if v22 then
                                        for _, v25 in v22 do
                                            if v11 == v25 then
                                                return;
                                            end;
                                        end;
                                    end;
                                    if v23 then
                                        local v26 = false;
                                        for _, v28 in v23 do
                                            if v11 == v28 then
                                                v26 = true;
                                                break;
                                            end;
                                        end;
                                        if not v26 then
                                            return;
                                        end;
                                    end;
                                    l_Rosyn_0.Register({
                                        Components = assert(l_Init_0.Components, (("Components list not specified for component script '%*'"):format(l_Name_0))), 
                                        Filter = l_Init_0.Filter
                                    });
                                end;
                            end);
                        end;
                        return;
                    end;
                end;
            end);
        end;
    end;
end;
task.delay(10, function() --[[ Line: 130 ]]
    -- upvalues: l_Rosyn_0 (copy)
    local v30 = {};
    for v31, v32 in l_Rosyn_0._ComponentClassToComponents do
        local v33 = 0;
        for _ in v32 do
            v33 = v33 + 1;
        end;
        table.insert(v30, {
            v31, 
            v33
        });
    end;
    table.sort(v30, function(v35, v36) --[[ Line: 143 ]]
        return v35[2] > v36[2];
    end);
    print("[LoadComponents] Component Count:");
    for _, v38 in v30 do
        print((("\t%*: %*"):format(l_Rosyn_0.GetComponentClassName(v38[1]), v38[2])));
    end;
end);
return v29;