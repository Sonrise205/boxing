local _ = require(game:GetService("ReplicatedFirst"):WaitForChild("Places"));
local v1 = {};
local function _(v2) --[[ Line: 5 ]] --[[ Name: RegisterStyle ]]
    -- upvalues: v1 (copy)
    local l_status_0, l_result_0 = pcall(require, v2);
    if not l_status_0 then
        warn((("[Styles] Unable to require %* because: %*"):format(v2:GetFullName(), l_result_0)));
        return;
    else
        v1[v2.Name] = l_result_0;
        return;
    end;
end;
for _, v7 in script:GetChildren() do
    if v7:IsA("ModuleScript") then
        local l_status_1, l_result_1 = pcall(require, v7);
        if not l_status_1 then
            warn((("[Styles] Unable to require %* because: %*"):format(v7:GetFullName(), l_result_1)));
        else
            v1[v7.Name] = l_result_1;
        end;
        for _, v11 in v7:GetChildren() do
            if v11:IsA("ModuleScript") then
                local l_status_2, l_result_2 = pcall(require, v11);
                if not l_status_2 then
                    warn((("[Styles] Unable to require %* because: %*"):format(v11:GetFullName(), l_result_2)));
                else
                    v1[v11.Name] = l_result_2;
                end;
            end;
        end;
    end;
end;
return v1;