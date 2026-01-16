local v0 = {};
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require("./Settings");
v0.GetProperty = function(v3) --[[ Line: 5 ]] --[[ Name: GetProperty ]]
    -- upvalues: v2 (copy)
    if not v2.Mesh_Properities[v3.ClassName] then
        return;
    else
        local v4 = {};
        for _, v6 in v2.Mesh_Properities[v3.ClassName] do
            v4[v6] = v3[v6];
        end;
        return v4;
    end;
end;
v0.GetProperties = function(v7) --[[ Line: 17 ]] --[[ Name: GetProperties ]]
    -- upvalues: v0 (copy)
    local v8 = {
        Children = {}, 
        Main = v0.GetProperty(v7)
    };
    for _, v10 in pairs(v7:GetChildren()) do
        v8.Children[v10.Name] = v0.GetProperty(v10);
    end;
    return v8;
end;
v0.ApplyProperties = function(v11, v12, v13) --[[ Line: 31 ]] --[[ Name: ApplyProperties ]]
    -- upvalues: l_TweenService_0 (copy)
    if v13.Main then
        l_TweenService_0:Create(v11, v12, v13.Main):Play();
    end;
    for v14, v15 in v13.Children do
        local v16 = v11:FindFirstChild(v14) or v11:FindFirstChildOfClass(v14);
        if v16 then
            l_TweenService_0:Create(v16, v12, v15):Play();
        end;
    end;
end;
return v0;