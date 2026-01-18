local l_TypeGuard_0 = require(script.Parent.Parent:WaitForChild("TypeGuard"));
local l__Types_0 = require(script.Parent:WaitForChild("_Types"));
local function v5(v2) --[[ Line: 6 ]] --[[ Name: HashName ]]
    local v3 = 0;
    for v4 in v2:gmatch(".") do
        v3 = bit32.lshift(v3, 5) - v3 + v4:byte();
    end;
    return v3;
end;
local v6 = l_TypeGuard_0.Params(l_TypeGuard_0.Instance("Folder", {
    Active = l_TypeGuard_0.Instance("Folder"), 
    Concluded = l_TypeGuard_0.Instance("Folder")
}):Strict());
return function(v7) --[[ Line: 24 ]] --[[ Name: GetExperiments ]]
    -- upvalues: v6 (copy), v5 (copy), l__Types_0 (copy)
    v6(v7);
    local v8 = {};
    for _, v10 in v7.Active:GetChildren() do
        local v11 = require(v10);
        v11.Concluded = false;
        v11.Layers = v11.Layers == "*" and NumberRange.new(0, 1) or v11.Layers;
        v11.NumericID = v5(v10.Name);
        l__Types_0.Experiment:Assert(v11);
        v8[v10.Name] = v11;
    end;
    for _, v13 in v7.Concluded:GetChildren() do
        local v14 = require(v13);
        assert(v14.Conclusion, (("Conclusion value not set for %*"):format(v13.Name)));
        v14.Concluded = true;
        v14.Layers = v14.Layers == "*" and NumberRange.new(0, 1) or v14.Layers;
        v14.NumericID = v5(v13.Name);
        l__Types_0.Experiment:Assert(v14);
        v8[v13.Name] = v14;
    end;
    return v8;
end;