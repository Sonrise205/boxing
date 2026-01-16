local v0 = {};
v0.__index = v0;
local v1 = require("@self/Settings");
local v2 = require("@self/MeshPropertyHandler");
local v3 = require("@self/MeshAttributeFuncs");
local v4 = require("@self/HelperFunctions");
v0.new = function(v5) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v0 (copy)
    return setmetatable({
        Mesh = v5, 
        Properties = v2.GetProperties(v5.End), 
        Settings = v5:GetAttributes(), 
        Connections = {}
    }, v0):Init();
end;
v0.Init = function(v6) --[[ Line: 18 ]] --[[ Name: Init ]]
    v6:LoadFlipbook();
    return v6;
end;
v0.LoadFlipbook = function(v7) --[[ Line: 23 ]] --[[ Name: LoadFlipbook ]]
    local l_Flipbook_0 = v7.Mesh:FindFirstChild("Flipbook");
    local v9 = l_Flipbook_0 and l_Flipbook_0:IsA("ObjectValue") and l_Flipbook_0.Value;
    if v9 and v9:IsA("ModuleScript") then
        v7:SetFlipbook(v9);
    end;
end;
v0.SetFlipbook = function(v10, v11) --[[ Line: 31 ]] --[[ Name: SetFlipbook ]]
    v10.Flipbook = require(v11);
end;
v0.SetActiveTexture = function(v12, v13) --[[ Line: 35 ]] --[[ Name: SetActiveTexture ]]
    if v12.ActiveMesh.ClassName == "Part" then
        v12.ActiveMesh:FindFirstChildOfClass("Decal").Texture = v13;
        return;
    else
        v12.ActiveMesh.Texture = v13;
        return;
    end;
end;
v0.Emit = function(v14, v15) --[[ Line: 44 ]] --[[ Name: Emit ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy)
    v14.ActiveMesh = v14.Mesh.Start:Clone();
    v14.ActiveMesh.Parent = v1.EffectsFolder;
    if v15 then
        v14.ActiveMesh.CFrame = typeof(v15) == "CFrame" and v15 or v15.CFrame;
    end;
    v4.PlayFlipbook(v14);
    local v16 = TweenInfo.new(v14.Settings.Duration, Enum.EasingStyle[v14.Settings.EasingStyle or "Linear"], Enum.EasingDirection[v14.Settings.EasingDirection or "Out"]);
    v2.ApplyProperties(v14.ActiveMesh, v16, v14.Properties);
    for v17, v18 in v14.Settings do
        if v3[v17] then
            v3[v17](v14, v18);
        end;
    end;
    task.delay(v14.Settings.Duration, v14.Destroy, v14);
end;
v0.Destroy = function(v19) --[[ Line: 68 ]] --[[ Name: Destroy ]]
    if not v19.ActiveMesh then
        return;
    else
        v19.ActiveMesh:Destroy();
        for _, v21 in v19.Connections do
            v21:Disconnect();
        end;
        return;
    end;
end;
return v0;