local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local v4 = {
    script.Parent.Parent, 
    l_ReplicatedFirst_0, 
    l_ReplicatedStorage_0, 
    l_ServerScriptService_0, 
    l_ServerStorage_0
};
local function v10(v5, v6, v7) --[[ Line: 9 ]] --[[ Name: FindFirstDescendantWithNameAndClassName ]]
    for _, v9 in ipairs(v5:GetDescendants()) do
        if v9:IsA(v7) and v9.Name == v6 then
            return v9;
        end;
    end;
    return nil;
end;
return function() --[[ Line: 19 ]] --[[ Name: GetPromiseLibrary ]]
    -- upvalues: v10 (copy), v4 (copy)
    local l_script_FirstAncestorOfClass_0 = script:FindFirstAncestorOfClass("Plugin");
    if l_script_FirstAncestorOfClass_0 then
        local v12 = v10(l_script_FirstAncestorOfClass_0, "Promise", "ModuleScript");
        if v12 then
            return true, require(v12);
        else
            return false;
        end;
    else
        local v13 = nil;
        for _, v15 in ipairs(v4) do
            v13 = v10(v15, "Promise", "ModuleScript");
            if v13 then
                break;
            end;
        end;
        if v13 then
            return true, require(v13);
        else
            return false;
        end;
    end;
end;