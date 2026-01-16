local v0 = {};
return function(v1) --[[ Line: 2 ]]
    -- upvalues: v0 (copy)
    for _, v3 in script:GetChildren() do
        if not v0[v3.Name] then
            v0[v3.Name] = v3:IsA("ModuleScript") and require(v3) or nil;
        end;
    end;
    return v0[v1] or v0;
end;