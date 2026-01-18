local l_TypeGuard_0 = require(game:GetService("ReplicatedFirst"):WaitForChild("TypeGuard"));
local function v22(v1, v2) --[[ Line: 3 ]] --[[ Name: GenerateTests ]]
    local v3 = v2.Object({
        Age = v2.Number(), 
        Name = v2.String(), 
        Pets = v2.Object():OfKeyType(v2.String()):OfValueType(v2.String()), 
        Friends = v2.Array(v2.String()), 
        Instances = v2.Array(v2.Instance("Workspace"):OfStructure({
            Camera = v2.Instance("Camera"), 
            Terrain = v2.Instance("Terrain")
        }))
    }):Strict();
    local v4 = v2.Params(v3);
    local v5 = v3:Cached();
    local v6 = v2.Params(v5);
    local v7 = v2.Params(v5, v5, v5, v5, v5);
    local v8 = v2.Params(v5, v5, v5, v5, v5, v5, v5, v5, v5, v5);
    local v9 = {
        Age = 10, 
        Name = "Bob", 
        Pets = {
            Dog = "Spot", 
            Cat = "Fluffy"
        }, 
        Friends = {
            "Alice", 
            "Charlie"
        }, 
        Instances = {
            workspace, 
            workspace, 
            workspace, 
            workspace, 
            workspace
        }
    };
    local v10 = v2.Params(v2.Number());
    local v11 = v2.Params(v2.Number(), v2.Number(), v2.Number(), v2.Number(), v2.Number());
    local v12 = v2.Params(v2.Number(), v2.Number(), v2.Number(), v2.Number(), v2.Number(), v2.Number(), v2.Number(), v2.Number(), v2.Number(), v2.Number());
    local v13 = v2.Number();
    return {
        [v1 .. "SC"] = function() --[[ Line: 42 ]]
            -- upvalues: v13 (copy)
            for v14 = 1, 10000 do
                v13:Check(v14);
            end;
        end, 
        [v1 .. "S1A"] = function() --[[ Line: 48 ]]
            -- upvalues: v10 (copy)
            for v15 = 1, 10000 do
                v10(v15);
            end;
        end, 
        [v1 .. "S5A"] = function() --[[ Line: 54 ]]
            -- upvalues: v11 (copy)
            for v16 = 1, 10000 do
                v11(v16, v16, v16, v16, v16);
            end;
        end, 
        [v1 .. "S10A"] = function() --[[ Line: 60 ]]
            -- upvalues: v12 (copy)
            for v17 = 1, 10000 do
                v12(v17, v17, v17, v17, v17, v17, v17, v17, v17, v17);
            end;
        end, 
        [v1 .. "C1A"] = function() --[[ Line: 66 ]]
            -- upvalues: v4 (copy), v9 (copy)
            for _ = 1, 100 do
                v4(v9);
            end;
        end, 
        [v1 .. "CC1A"] = function() --[[ Line: 72 ]]
            -- upvalues: v6 (copy), v9 (copy)
            for _ = 1, 100 do
                v6(v9);
            end;
        end, 
        [v1 .. "CC5A"] = function() --[[ Line: 78 ]]
            -- upvalues: v7 (copy), v9 (copy)
            for _ = 1, 100 do
                v7(v9, v9, v9, v9, v9);
            end;
        end, 
        [v1 .. "CC10A"] = function() --[[ Line: 84 ]]
            -- upvalues: v8 (copy), v9 (copy)
            for _ = 1, 100 do
                v8(v9, v9, v9, v9, v9, v9, v9, v9, v9, v9);
            end;
        end
    };
end;
local v23 = {};
local l_Old_0 = game:GetService("ReplicatedFirst"):WaitForChild("TypeGuard"):FindFirstChild("Old");
if l_Old_0 then
    for v25, v26 in v22("Old", require(l_Old_0)) do
        v23[v25] = v26;
    end;
end;
for v27, v28 in v22(">New", l_TypeGuard_0) do
    v23[v27] = v28;
end;
return {
    ParameterGenerator = function() --[[ Line: 106 ]] --[[ Name: ParameterGenerator ]]

    end, 
    Functions = v23
};