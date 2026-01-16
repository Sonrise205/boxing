local l_TypeGuard_0 = require(script.Parent.Parent.Parent:WaitForChild("TypeGuard"));
local v1 = l_TypeGuard_0.Params(l_TypeGuard_0.Instance(), l_TypeGuard_0.Object());
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    v1(v2, v3);
    return function(v4, v5) --[[ Line: 8 ]]
        -- upvalues: v3 (copy), v2 (copy)
        local function v8(v6) --[[ Line: 9 ]] --[[ Name: CreateProxy ]]
            -- upvalues: v4 (copy), v3 (ref), v5 (copy)
            task.spawn(v4, v6, v3);
            local v7 = nil;
            v7 = v6.AncestryChanged:Connect(function() --[[ Line: 12 ]]
                -- upvalues: v6 (copy), v7 (ref), v5 (ref), v3 (ref)
                if v6:IsDescendantOf(game) then
                    return;
                else
                    v7:Disconnect();
                    v5(v6, v3);
                    return;
                end;
            end);
        end;
        for _, v10 in v2:GetChildren() do
            task.spawn(v4, v10, v3);
            local v11 = nil;
            do
                local l_v11_0 = v11;
                l_v11_0 = v10.AncestryChanged:Connect(function() --[[ Line: 12 ]]
                    -- upvalues: v10 (copy), l_v11_0 (ref), v5 (copy), v3 (ref)
                    if v10:IsDescendantOf(game) then
                        return;
                    else
                        l_v11_0:Disconnect();
                        v5(v10, v3);
                        return;
                    end;
                end);
            end;
        end;
        v2.ChildAdded:Connect(v8);
    end;
end;