local _ = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_Debris_0 = game:GetService("Debris");
local _ = workspace;
local v7 = {};
PropertyConvert = function(v8, v9, v10) --[[ Line: 13 ]] --[[ Name: PropertyConvert ]]
    local v11 = nil;
    if v9 == "CFrame" then
        return v8.CFrame * CFrame.new(unpack(string.split(v10, ", ")));
    elseif v9 == "boolean" then
        return v10 == "true";
    elseif v9 == "Color3" then
        return (Color3.new(unpack(string.split(v10, ", "))));
    elseif v9 == "Vector3" then
        return (Vector3.new(unpack(string.split(v10, ", "))));
    else
        if v9 == "number" then
            v11 = tonumber(v10);
        end;
        return v11;
    end;
end;
v7.StartMeshEmitter = function(v12, v13, v14, v15, v16) --[[ Line: 31 ]] --[[ Name: StartMeshEmitter ]]
    -- upvalues: l_Debris_0 (copy), l_RunService_0 (copy), l_HttpService_0 (copy), l_TweenService_0 (copy), l_Players_0 (copy)
    v16 = v16 or {};
    local v17 = v16 and v16.SizeMulti and v16.SizeMulti or 1;
    if not v12 or not v12:IsA("BasePart") then
        return warn(">> Invalid Root for MeshEmitter. must be a BasePart.");
    else
        v14 = v14 or CFrame.new(0, 0, 0);
        v15 = v15 or 10;
        local v18 = os.clock() + v15;
        task.spawn(function() --[[ Line: 44 ]]
            -- upvalues: v18 (copy), v12 (copy), l_Debris_0 (ref), v13 (copy), v14 (ref), l_RunService_0 (ref)
            while os.clock() < v18 and v12:IsDescendantOf(game) do
                v13:PivotTo(v12.CFrame * v14);
                l_RunService_0.RenderStepped:Wait();
            end;
            l_Debris_0:AddItem(v13, 0);
        end);
        local l_PrimaryPart_0 = v13.PrimaryPart;
        for _, v21 in pairs(v13:GetDescendants()) do
            local l_v21_Attribute_0 = v21:GetAttribute("MeshEmitter");
            if l_v21_Attribute_0 then
                local v23 = l_HttpService_0:JSONDecode(l_v21_Attribute_0);
                for _, v25 in pairs(v23) do
                    for v26, v27 in pairs(v25) do
                        local l_Direction_0 = v27.Direction;
                        local l_Style_0 = v27.Style;
                        local l_Property_0 = v27.Property;
                        local l_Time_0 = v27.Time;
                        local l_Value_0 = v27.Value;
                        local v33 = v25[v26 + 1];
                        if v33 ~= nil then
                            local _ = v33.Direction;
                            local _ = v33.Style;
                            local _ = v33.Property;
                            local l_Time_1 = v33.Time;
                            local l_Value_1 = v33.Value;
                            local function _(v39) --[[ Line: 84 ]] --[[ Name: Getval ]]
                                -- upvalues: v21 (copy), l_Property_0 (copy), l_PrimaryPart_0 (copy), v17 (copy)
                                local v40 = typeof(v21[l_Property_0]);
                                local v41 = PropertyConvert(l_PrimaryPart_0, v40, v39);
                                if (l_Property_0 == "Size" or l_Property_0 == "Scale") and v40 == "Vector3" then
                                    v41 = Vector3.new(v41.X * v17, v41.Y * v17, v41.Z * v17);
                                end;
                                return v41;
                            end;
                            if l_Style_0 == "Circ" then
                                l_Style_0 = "Circular";
                            elseif l_Style_0 == "Expo" or l_Style_0 == "Sextic" then
                                l_Style_0 = "Exponential";
                            end;
                            if l_Style_0 == "Constant" then
                                if l_Time_0 > 0 then
                                    task.delay(l_Time_0, function() --[[ Line: 105 ]]
                                        -- upvalues: v21 (copy), l_Property_0 (copy), l_Value_0 (copy), l_PrimaryPart_0 (copy), v17 (copy)
                                        local l_v21_0 = v21;
                                        local l_l_Property_0_0 = l_Property_0;
                                        local l_l_Value_0_0 = l_Value_0;
                                        local v46 = typeof(v21[l_Property_0]);
                                        local v47 = PropertyConvert(l_PrimaryPart_0, v46, l_l_Value_0_0);
                                        if (l_Property_0 == "Size" or l_Property_0 == "Scale") and v46 == "Vector3" then
                                            v47 = Vector3.new(v47.X * v17, v47.Y * v17, v47.Z * v17);
                                        end;
                                        l_v21_0[l_l_Property_0_0] = v47;
                                    end);
                                else
                                    local v48 = typeof(v21[l_Property_0]);
                                    local v49 = PropertyConvert(l_PrimaryPart_0, v48, l_Value_0);
                                    if (l_Property_0 == "Size" or l_Property_0 == "Scale") and v48 == "Vector3" then
                                        v49 = Vector3.new(v49.X * v17, v49.Y * v17, v49.Z * v17);
                                    end;
                                    v21[l_Property_0] = v49;
                                end;
                                task.delay(l_Time_1, function() --[[ Line: 111 ]]
                                    -- upvalues: v21 (copy), l_Property_0 (copy), l_Value_1 (copy), l_PrimaryPart_0 (copy), v17 (copy)
                                    local l_v21_1 = v21;
                                    local l_l_Property_0_1 = l_Property_0;
                                    local l_l_Value_1_0 = l_Value_1;
                                    local v53 = typeof(v21[l_Property_0]);
                                    local v54 = PropertyConvert(l_PrimaryPart_0, v53, l_l_Value_1_0);
                                    if (l_Property_0 == "Size" or l_Property_0 == "Scale") and v53 == "Vector3" then
                                        v54 = Vector3.new(v54.X * v17, v54.Y * v17, v54.Z * v17);
                                    end;
                                    l_v21_1[l_l_Property_0_1] = v54;
                                end);
                            else
                                local v55 = Enum.EasingStyle:FromName(l_Style_0);
                                if v55 == nil then
                                    v55 = Enum.EasingStyle.Linear;
                                    warn("MeshEmitter does not support", l_Style_0, "yet. has been redirected to Linear");
                                end;
                                local v56 = TweenInfo.new(l_Time_1 - l_Time_0, v55, Enum.EasingDirection[l_Direction_0]);
                                if l_Time_0 > 0 then
                                    task.delay(l_Time_0, function() --[[ Line: 124 ]]
                                        -- upvalues: v21 (copy), l_Property_0 (copy), l_Value_0 (copy), l_PrimaryPart_0 (copy), v17 (copy), l_TweenService_0 (ref), v56 (copy), l_Value_1 (copy)
                                        local l_v21_2 = v21;
                                        local l_l_Property_0_2 = l_Property_0;
                                        local l_l_Value_0_1 = l_Value_0;
                                        local v60 = typeof(v21[l_Property_0]);
                                        local v61 = PropertyConvert(l_PrimaryPart_0, v60, l_l_Value_0_1);
                                        if (l_Property_0 == "Size" or l_Property_0 == "Scale") and v60 == "Vector3" then
                                            v61 = Vector3.new(v61.X * v17, v61.Y * v17, v61.Z * v17);
                                        end;
                                        l_v21_2[l_l_Property_0_2] = v61;
                                        l_v21_2 = l_TweenService_0;
                                        local l_v21_3 = v21;
                                        l_l_Value_0_1 = v56;
                                        v60 = {};
                                        v61 = l_Property_0;
                                        local l_l_Value_1_1 = l_Value_1;
                                        local v64 = typeof(v21[l_Property_0]);
                                        local v65 = PropertyConvert(l_PrimaryPart_0, v64, l_l_Value_1_1);
                                        if (l_Property_0 == "Size" or l_Property_0 == "Scale") and v64 == "Vector3" then
                                            v65 = Vector3.new(v65.X * v17, v65.Y * v17, v65.Z * v17);
                                        end;
                                        v60[v61] = v65;
                                        l_v21_2:Create(l_v21_3, l_l_Value_0_1, v60):Play();
                                    end);
                                else
                                    local v66 = typeof(v21[l_Property_0]);
                                    local v67 = PropertyConvert(l_PrimaryPart_0, v66, l_Value_0);
                                    if (l_Property_0 == "Size" or l_Property_0 == "Scale") and v66 == "Vector3" then
                                        v67 = Vector3.new(v67.X * v17, v67.Y * v17, v67.Z * v17);
                                    end;
                                    v21[l_Property_0] = v67;
                                    local l_l_TweenService_0_0 = l_TweenService_0;
                                    v67 = v21;
                                    local l_v56_0 = v56;
                                    local v70 = {};
                                    local v71 = typeof(v21[l_Property_0]);
                                    local v72 = PropertyConvert(l_PrimaryPart_0, v71, l_Value_1);
                                    if (l_Property_0 == "Size" or l_Property_0 == "Scale") and v71 == "Vector3" then
                                        v72 = Vector3.new(v72.X * v17, v72.Y * v17, v72.Z * v17);
                                    end;
                                    v70[l_Property_0] = v72;
                                    l_l_TweenService_0_0:Create(v67, l_v56_0, v70):Play();
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        for _, v74 in pairs(v13:GetChildren()) do
            local l_v74_Attribute_0 = v74:GetAttribute("GroupType");
            if l_v74_Attribute_0 == "CameraEffect" then
                v74.Parent = workspace.CurrentCamera;
                v13.AncestryChanged:Once(function() --[[ Line: 146 ]]
                    -- upvalues: l_Debris_0 (ref), v74 (copy)
                    l_Debris_0:AddItem(v74, 0);
                end);
            elseif l_v74_Attribute_0 == "Vignette" and l_Players_0.LocalPlayer then
                v74.Parent = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer:FindFirstChild("PlayerGui") and l_Players_0.LocalPlayer.PlayerGui or game:GetService("StarterGui");
                v13.AncestryChanged:Once(function() --[[ Line: 152 ]]
                    -- upvalues: l_Debris_0 (ref), v74 (copy)
                    l_Debris_0:AddItem(v74, 0);
                end);
            end;
        end;
        return v13;
    end;
end;
return v7;