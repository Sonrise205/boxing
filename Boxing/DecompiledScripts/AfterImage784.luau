local v0 = {};
local l_TweenService_0 = game:GetService("TweenService");
local v2 = require("@self/Settings");
v0.Create = function(v3, v4, v5, v6, _) --[[ Line: 6 ]] --[[ Name: Create ]]
    -- upvalues: v0 (copy), l_TweenService_0 (copy)
    local v8 = v0.GetClone(v3);
    v8.Parent = workspace;
    for v9, v10 in v4 do
        for _, v12 in v8:GetChildren() do
            if v12:IsA("BasePart") then
                v12.CFrame = v3[v12.Name].CFrame;
                v12[v9] = v10;
                l_TweenService_0:Create(v12, v6, v5):Play();
            end;
        end;
    end;
    task.delay(v6.Time + v6.DelayTime, v8.Destroy, v8);
    return v8;
end;
v0.GetClone = function(v13) --[[ Line: 26 ]] --[[ Name: GetClone ]]
    -- upvalues: v2 (copy)
    return v2.SavesParent:FindFirstChild(v13.Name):Clone();
end;
v0.CreateClone = function(v14, v15) --[[ Line: 30 ]] --[[ Name: CreateClone ]]
    -- upvalues: v2 (copy)
    v14.Archivable = true;
    local v16 = v14:Clone();
    v14.Archivable = false;
    for _, v18 in v16:GetDescendants() do
        if not table.find(v2.FilteredItems, v18.ClassName) then
            if v18:IsA("BasePart") then
                v18.Anchored = true;
                v18.CanCollide = false;
                v18.CanQuery = false;
                v18.CanTouch = false;
                v18.CastShadow = false;
                v18.CollisionGroup = "AfterImage";
            end;
            if v15 and table.find(v2.Accessories, v18.ClassName) then
                v18:Destroy();
            end;
        else
            v18:Destroy();
        end;
    end;
    v16.Parent = v2.SavesParent;
    return v16;
end;
return v0;