local l_TweenService_0 = game:GetService("TweenService");
local function v16(v1, v2, v3, v4) --[[ Line: 10 ]] --[[ Name: getTweenData ]]
    local l_v1_Attribute_0 = v1:GetAttribute(v3 .. "_TweenParams");
    local v6 = {
        {
            "TweenStyle", 
            v4
        }, 
        {
            "TweenDirection", 
            Enum.EasingDirection.Out
        }
    };
    local v7 = {};
    if typeof(l_v1_Attribute_0) == "string" then
        local v8 = {
            l_v1_Attribute_0:match("(%a+),(%a+)")
        };
        for v9 = 1, 2 do
            local v10 = v8[v9];
            local v11 = v6[v9];
            local v12 = v11[1];
            local v13 = v11[2];
            if not v10 then
                v7[v12] = v13;
            elseif not pcall(function() --[[ Line: 36 ]]
                -- upvalues: v7 (copy), v12 (copy), v10 (copy)
                v7[v12] = Enum[v12][v10];
            end) then
                v7[v12] = v13;
            end;
        end;
    else
        for _, v15 in v6 do
            v7[v15[1]] = v15[2];
        end;
    end;
    return TweenInfo.new(v2, v7.TweenStyle, v7.TweenDirection);
end;
return function(v17) --[[ Line: 57 ]]
    -- upvalues: l_TweenService_0 (copy), v16 (copy)
    local l_End_0 = v17.Parent:FindFirstChild("End");
    if not l_End_0 then
        warn("Goal is not defined.");
        return;
    else
        local v19 = v17:Clone();
        local v20 = tonumber(v17.Parent:GetAttribute("StartTransparency")) or 0;
        if v19:IsA("MeshPart") then
            v19.Transparency = v20;
        elseif v19:IsA("BasePart") and v19:FindFirstChildOfClass("Decal") then
            v19.Transparency = 1;
        end;
        v19.Parent = workspace.CurrentCamera;
        local v21 = tonumber(v17.Parent:GetAttribute("Duration")) or 0.1;
        if v19:FindFirstChildOfClass("Decal") then
            l_TweenService_0:Create(v19, v16(v17.Parent, v21, "Part", Enum.EasingStyle.Cubic), {
                Size = l_End_0.Size, 
                CFrame = l_End_0.CFrame
            }):Play();
        else
            l_TweenService_0:Create(v19, v16(v17.Parent, v21, "Part", Enum.EasingStyle.Cubic), {
                Size = l_End_0.Size, 
                CFrame = l_End_0.CFrame, 
                Transparency = 1
            }):Play();
        end;
        local l_SpecialMesh_0 = v19:FindFirstChildOfClass("SpecialMesh");
        local l_SpecialMesh_1 = l_End_0:FindFirstChildOfClass("SpecialMesh");
        if l_SpecialMesh_0 and l_SpecialMesh_1 then
            l_TweenService_0:Create(l_SpecialMesh_0, v16(v17.Parent, v21, "Mesh", Enum.EasingStyle.Sine), {
                Scale = l_SpecialMesh_1.Scale
            }):Play();
        end;
        local l_Decal_0 = v19:FindFirstChildOfClass("Decal");
        local l_Decal_1 = l_End_0:FindFirstChildOfClass("Decal");
        if l_Decal_0 and l_Decal_1 then
            l_Decal_0.Transparency = v20;
            l_TweenService_0:Create(l_Decal_0, v16(v17.Parent, v21, "Decal", Enum.EasingStyle.Cubic), {
                Transparency = l_Decal_1.Transparency, 
                Color3 = l_Decal_1.Color3
            }):Play();
        end;
        task.delay(v21, v19.Destroy, v19);
        return;
    end;
end;