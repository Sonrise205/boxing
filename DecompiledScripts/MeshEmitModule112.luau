local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local function v17(v2, v3, v4, v5) --[[ Line: 11 ]] --[[ Name: getTweenData ]]
    local l_v2_Attribute_0 = v2:GetAttribute(v4 .. "_TweenParams");
    local v7 = {
        {
            "TweenStyle", 
            v5
        }, 
        {
            "TweenDirection", 
            Enum.EasingDirection.Out
        }
    };
    local v8 = {};
    if typeof(l_v2_Attribute_0) == "string" then
        local v9 = {
            l_v2_Attribute_0:match("(%a+),(%a+)")
        };
        for v10 = 1, 2 do
            local v11 = v9[v10];
            local v12 = v7[v10];
            local v13 = v12[1];
            local v14 = v12[2];
            if not v11 then
                v8[v13] = v14;
            elseif not pcall(function() --[[ Line: 37 ]]
                -- upvalues: v8 (copy), v13 (copy), v11 (copy)
                v8[v13] = Enum[v13][v11];
            end) then
                v8[v13] = v14;
            end;
        end;
    else
        for _, v16 in v7 do
            v8[v16[1]] = v16[2];
        end;
    end;
    return TweenInfo.new(v3, v8.TweenStyle, v8.TweenDirection);
end;
local function _(v18, v19) --[[ Line: 58 ]] --[[ Name: rotateMesh ]]
    -- upvalues: l_RunService_0 (copy)
    if not v18 then
        return;
    else
        task.spawn(function() --[[ Line: 61 ]]
            -- upvalues: v18 (copy), v19 (copy), l_RunService_0 (ref)
            while v18.Parent do
                v18.CFrame = v18.CFrame * CFrame.Angles(0, math.rad(v19), 0);
                l_RunService_0.RenderStepped:Wait();
            end;
        end);
        return;
    end;
end;
return function(v21, v22) --[[ Line: 69 ]]
    -- upvalues: l_TweenService_0 (copy), v17 (copy), l_RunService_0 (copy)
    local l_End_0 = v21.Parent:FindFirstChild("End");
    if not l_End_0 then
        warn("Goal is not defined.");
        return;
    else
        local v24 = v21:Clone();
        local v25 = tonumber(v21.Parent:GetAttribute("StartTransparency")) or 0;
        if v24:IsA("MeshPart") then
            v24.Transparency = v25;
        elseif v24:IsA("BasePart") and v24:FindFirstChildOfClass("Decal") then
            v24.Transparency = 1;
        end;
        v24.Parent = workspace.CurrentCamera;
        local v26 = tonumber(v21.Parent:GetAttribute("Duration")) or 0.1;
        if v24:FindFirstChildOfClass("Decal") then
            l_TweenService_0:Create(v24, v17(v21.Parent, v26, "Part", Enum.EasingStyle.Cubic), {
                Size = l_End_0.Size, 
                CFrame = l_End_0.CFrame
            }):Play();
        else
            l_TweenService_0:Create(v24, v17(v21.Parent, v26, "Part", Enum.EasingStyle.Cubic), {
                Size = l_End_0.Size, 
                CFrame = l_End_0.CFrame, 
                Transparency = 1
            }):Play();
        end;
        local l_SpecialMesh_0 = v24:FindFirstChildOfClass("SpecialMesh");
        local l_SpecialMesh_1 = l_End_0:FindFirstChildOfClass("SpecialMesh");
        if l_SpecialMesh_0 and l_SpecialMesh_1 then
            l_TweenService_0:Create(l_SpecialMesh_0, v17(v21.Parent, v26, "Mesh", Enum.EasingStyle.Sine), {
                Scale = l_SpecialMesh_1.Scale
            }):Play();
        end;
        local l_Decal_0 = v24:FindFirstChildOfClass("Decal");
        local l_Decal_1 = l_End_0:FindFirstChildOfClass("Decal");
        if l_Decal_0 and l_Decal_1 then
            l_Decal_0.Transparency = v25;
            l_TweenService_0:Create(l_Decal_0, v17(v21.Parent, v26, "Decal", Enum.EasingStyle.Cubic), {
                Transparency = l_Decal_1.Transparency, 
                Color3 = l_Decal_1.Color3
            }):Play();
        end;
        if v22 and v22.enabled then
            local v31 = v22.speed or 5;
            if v24 then
                task.spawn(function() --[[ Line: 61 ]]
                    -- upvalues: v24 (copy), v31 (copy), l_RunService_0 (ref)
                    while v24.Parent do
                        v24.CFrame = v24.CFrame * CFrame.Angles(0, math.rad(v31), 0);
                        l_RunService_0.RenderStepped:Wait();
                    end;
                end);
            end;
        end;
        task.delay(v26, v24.Destroy, v24);
        return;
    end;
end;