local l_Settings_0 = require("./SettingsCollection").Settings;
local v1 = {};
local l_PrivateServerSettings_0 = workspace:WaitForChild("PrivateServerSettings");
l_PrivateServerSettings_0.ChildAdded:Connect(function(v3) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    v1[v3.Name] = v3;
end);
for _, v5 in l_PrivateServerSettings_0:GetChildren() do
    v1[v5.Name] = v5;
end;
return {
    GetValue = function(v6) --[[ Line: 22 ]] --[[ Name: GetValue ]]
        -- upvalues: l_Settings_0 (copy), v1 (copy)
        local v7 = l_Settings_0[v6];
        if not v7 then
            warn((("[PSHELPER] Setting %* does not exist!"):format(v6)));
            return;
        elseif v7.Type == "Button" then
            warn((("[PSHELPER] Setting %* is a button type; these do not have a value!"):format(v6)));
            return;
        else
            local v8 = v1[v6];
            if not v8 then
                if v7.Type == "Number" then
                    return v7.IncrementType.Default;
                elseif v7.Type == "Boolean" then
                    return v7.Default;
                end;
            end;
            return v8.Value;
        end;
    end
};