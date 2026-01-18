local l__MergeDeep_0 = require(script.Parent:WaitForChild("_MergeDeep"));
local l__ParseCSVRowAttribute_0 = require(script.Parent:WaitForChild("_ParseCSVRowAttribute"));
local l_Styles_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Styles");
return function(v3) --[[ Line: 6 ]]
    -- upvalues: l__ParseCSVRowAttribute_0 (copy), l_Styles_0 (copy), l__MergeDeep_0 (copy)
    for v4, v5 in l__ParseCSVRowAttribute_0(v3) do
        local v6 = nil;
        for _, v8 in l_Styles_0:GetDescendants() do
            if v8.Name == v4 then
                v6 = v8;
                break;
            end;
        end;
        if not v6 then
            warn((("No style found with ID %*"):format(v4)));
        else
            local l_status_0, l_result_0 = pcall(require, v6);
            if not l_status_0 then
                warn((("Unable to require remote %* because: %*"):format(v4, l_result_0)));
            else
                if v4 == "Supernova" then
                    print(v5.HeavyAttacks.DefaultPunchInfo.MeterCharge, game:GetService("RunService"):IsClient());
                end;
                task.spawn(l__MergeDeep_0, l_result_0, v5);
            end;
        end;
    end;
end;