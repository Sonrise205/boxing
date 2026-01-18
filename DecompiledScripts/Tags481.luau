local l_CollectionService_0 = game:GetService("CollectionService");
local l_TypeGuard_0 = require(script.Parent.Parent.Parent:WaitForChild("TypeGuard"));
local v2 = l_TypeGuard_0.Variadic(l_TypeGuard_0.Object():OfKeyType(l_TypeGuard_0.String()):OfValueType(l_TypeGuard_0.Table()));
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_CollectionService_0 (copy)
    v2(v3);
    return function(v4, v5) --[[ Line: 10 ]]
        -- upvalues: v3 (copy), l_CollectionService_0 (ref)
        for v6, v7 in v3 do
            local v8 = v7[1] and v7 or {
                v7
            };
            for _, v10 in v8 do
                for _, v12 in l_CollectionService_0:GetTagged(v6) do
                    v4(v12, v10);
                end;
                l_CollectionService_0:GetInstanceAddedSignal(v6):Connect(function(v13) --[[ Line: 20 ]]
                    -- upvalues: v4 (copy), v10 (copy)
                    v4(v13, v10);
                end);
                l_CollectionService_0:GetInstanceRemovedSignal(v6):Connect(function(v14) --[[ Line: 24 ]]
                    -- upvalues: v5 (copy), v10 (copy)
                    v5(v14, v10);
                end);
            end;
        end;
    end;
end;