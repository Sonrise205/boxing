local v0 = {};
local function _(v1, v2, v3) --[[ Line: 22 ]] --[[ Name: SaveTerrainProperty ]]
    local v4 = Instance.new(v2);
    v4.Name = v1;
    v4.Value = workspace.Terrain[v1];
    v4.Parent = v3;
end;
local function _(v6, v7) --[[ Line: 29 ]] --[[ Name: LoadTerrainProperty ]]
    local l_v6_FirstChild_0 = v6:FindFirstChild(v7);
    if l_v6_FirstChild_0 then
        workspace.Terrain[v7] = l_v6_FirstChild_0.Value;
    end;
end;
local function _(v10) --[[ Line: 36 ]] --[[ Name: AttemptGetMaterialColor ]]
    return pcall(function() --[[ Line: 37 ]]
        -- upvalues: v10 (copy)
        return workspace.Terrain:GetMaterialColor(v10);
    end);
end;
local function _(v12, v13) --[[ Line: 42 ]] --[[ Name: AttemptSetMaterialColor ]]
    return pcall(function() --[[ Line: 43 ]]
        -- upvalues: v12 (copy), v13 (copy)
        workspace.Terrain:SetMaterialColor(v12, v13);
    end);
end;
v0.Save = function() --[[ Line: 48 ]] --[[ Name: Save ]]
    local v15 = workspace.Terrain:CopyRegion(workspace.Terrain.MaxExtents);
    v15.Name = "SavedTerrain";
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "WaterProperties";
    local l_Color3Value_0 = Instance.new("Color3Value");
    l_Color3Value_0.Name = "WaterColor";
    l_Color3Value_0.Value = workspace.Terrain.WaterColor;
    l_Color3Value_0.Parent = l_Folder_0;
    l_Color3Value_0 = Instance.new("NumberValue");
    l_Color3Value_0.Name = "WaterReflectance";
    l_Color3Value_0.Value = workspace.Terrain.WaterReflectance;
    l_Color3Value_0.Parent = l_Folder_0;
    l_Color3Value_0 = Instance.new("NumberValue");
    l_Color3Value_0.Name = "WaterTransparency";
    l_Color3Value_0.Value = workspace.Terrain.WaterTransparency;
    l_Color3Value_0.Parent = l_Folder_0;
    l_Color3Value_0 = Instance.new("NumberValue");
    l_Color3Value_0.Name = "WaterWaveSize";
    l_Color3Value_0.Value = workspace.Terrain.WaterWaveSize;
    l_Color3Value_0.Parent = l_Folder_0;
    l_Color3Value_0 = Instance.new("NumberValue");
    l_Color3Value_0.Name = "WaterWaveSpeed";
    l_Color3Value_0.Value = workspace.Terrain.WaterWaveSpeed;
    l_Color3Value_0.Parent = l_Folder_0;
    l_Folder_0.Parent = v15;
    l_Color3Value_0 = Instance.new("Folder");
    l_Color3Value_0.Name = "MaterialColors";
    for _, v19 in Enum.Material:GetEnumItems() do
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 37 ]]
            -- upvalues: v19 (copy)
            return workspace.Terrain:GetMaterialColor(v19);
        end);
        local l_l_status_0_0 = l_status_0;
        local l_l_result_0_0 = l_result_0;
        if l_l_status_0_0 then
            l_status_0 = Instance.new("Color3Value");
            l_status_0.Name = v19.Name;
            l_status_0.Value = l_l_result_0_0;
            l_status_0.Parent = l_Color3Value_0;
        end;
    end;
    l_Color3Value_0.Parent = v15;
    return v15;
end;
v0.Load = function(v24) --[[ Line: 78 ]] --[[ Name: Load ]]
    if typeof(v24) ~= "Instance" or not v24:IsA("TerrainRegion") then
        error("Expected TerrainRegion object as argument to Load", 2);
    end;
    local v25 = Vector3int16.new(-math.floor(v24.SizeInCells.X / 2), -math.floor(v24.SizeInCells.Y / 2), -math.floor(v24.SizeInCells.Z / 2));
    workspace.Terrain:PasteRegion(v24, v25, true);
    if v24:FindFirstChild("WaterProperties") then
        local l_WaterColor_0 = v24:FindFirstChild("WaterColor");
        if l_WaterColor_0 then
            workspace.Terrain.WaterColor = l_WaterColor_0.Value;
        end;
        l_WaterColor_0 = v24:FindFirstChild("WaterReflectance");
        if l_WaterColor_0 then
            workspace.Terrain.WaterReflectance = l_WaterColor_0.Value;
        end;
        l_WaterColor_0 = v24:FindFirstChild("WaterTransparency");
        if l_WaterColor_0 then
            workspace.Terrain.WaterTransparency = l_WaterColor_0.Value;
        end;
        l_WaterColor_0 = v24:FindFirstChild("WaterWaveSize");
        if l_WaterColor_0 then
            workspace.Terrain.WaterWaveSize = l_WaterColor_0.Value;
        end;
        l_WaterColor_0 = v24:FindFirstChild("WaterWaveSpeed");
        if l_WaterColor_0 then
            workspace.Terrain.WaterWaveSpeed = l_WaterColor_0.Value;
        end;
    end;
    local l_MaterialColors_0 = v24:FindFirstChild("MaterialColors");
    if l_MaterialColors_0 then
        for _, v29 in Enum.Material:GetEnumItems() do
            local l_l_MaterialColors_0_FirstChild_0 = l_MaterialColors_0:FindFirstChild(v29.Name);
            if l_l_MaterialColors_0_FirstChild_0 then
                local l_Value_0 = l_l_MaterialColors_0_FirstChild_0.Value;
                local _ = pcall(function() --[[ Line: 43 ]]
                    -- upvalues: v29 (copy), l_Value_0 (copy)
                    workspace.Terrain:SetMaterialColor(v29, l_Value_0);
                end);
            end;
        end;
    end;
end;
return v0;