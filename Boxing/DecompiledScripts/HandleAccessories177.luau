--!native
local _ = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Workspace_0 = game:GetService("Workspace");
local _ = game:GetService("RunService");
local _ = game:GetService("GuiService");
local _ = game:GetService("TweenService");
local _ = game:GetService("ReplicatedFirst");
local _ = game:GetService("UserInputService");
local function _(v8, v9, v10) --[[ Line: 14 ]] --[[ Name: Lerp ]]
    return v8 + (v9 - v8) * v10;
end;
local l_Part_0 = Instance.new("Part");
local l_IsA_0 = l_Part_0.IsA;
local l_GetDescendants_0 = l_Part_0.GetDescendants;
local v15 = CFrame.new();
local l_toObjectSpace_0 = v15.toObjectSpace;
local l_GetComponents_0 = v15.GetComponents;
local l_PointToWorldSpace_0 = v15.PointToWorldSpace;
GetBoundingBox = function(v19, v20) --[[ Line: 30 ]] --[[ Name: GetBoundingBox ]]
    -- upvalues: l_GetDescendants_0 (copy), v15 (copy), l_IsA_0 (copy), l_toObjectSpace_0 (copy), l_GetComponents_0 (copy), l_PointToWorldSpace_0 (copy)
    v19 = type(v19) ~= "table" and l_GetDescendants_0(v19) or v19;
    v20 = v20 or v15;
    local v21 = 1e999;
    local v22 = 1e999;
    local v23 = 1e999;
    local v24 = -1e999;
    local v25 = -1e999;
    local v26 = -1e999;
    for _, v28 in next, v19 do
        if l_IsA_0(v28, "BasePart") then
            local v29 = l_toObjectSpace_0(v20, v28.CFrame);
            local l_Size_0 = v28.Size;
            local l_X_0 = l_Size_0.X;
            local l_Y_0 = l_Size_0.Y;
            local l_Z_0 = l_Size_0.Z;
            local v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45 = l_GetComponents_0(v29);
            local v46 = 0.5 * (math.abs(v37) * l_X_0 + math.abs(v38) * l_Y_0 + math.abs(v39) * l_Z_0);
            local v47 = 0.5 * (math.abs(v40) * l_X_0 + math.abs(v41) * l_Y_0 + math.abs(v42) * l_Z_0);
            local v48 = 0.5 * (math.abs(v43) * l_X_0 + math.abs(v44) * l_Y_0 + math.abs(v45) * l_Z_0);
            v21 = v34 - v46 < v21 and v34 - v46 or v21;
            v22 = v35 - v47 < v22 and v35 - v47 or v22;
            v23 = v36 - v48 < v23 and v36 - v48 or v23;
            v24 = v24 < v34 + v46 and v34 + v46 or v24;
            v25 = v25 < v35 + v47 and v35 + v47 or v25;
            v26 = v26 < v36 + v48 and v36 + v48 or v26;
        end;
    end;
    local v49 = Vector3.new(v21, v22, v23);
    local v50 = Vector3.new(v24, v25, v26);
    return v20 - v20.p + l_PointToWorldSpace_0(v20, (v50 + v49) * 0.5), v50 - v49;
end;
local v51 = {
    [Enum.AccessoryType.Hair] = 70, 
    [Enum.AccessoryType.Hat] = 70, 
    [Enum.AccessoryType.Back] = 60
};
local v52 = {};
ShowObstructiveClothing = function(v53) --[[ Line: 83 ]] --[[ Name: ShowObstructiveClothing ]]
    for _, v55 in (v53:GetChildren()) do
        if v55:IsA("Accessory") then
            local l_Handle_0 = v55:FindFirstChild("Handle");
            if l_Handle_0 then
                local l_l_Handle_0_Attribute_0 = l_Handle_0:GetAttribute("DefaultTransparency");
                if l_l_Handle_0_Attribute_0 then
                    l_Handle_0.Transparency = l_l_Handle_0_Attribute_0;
                    for _, v59 in l_Handle_0:GetDescendants() do
                        if v59:IsA("ParticleEmitter") then
                            v59.Enabled = true;
                        elseif v59:IsA("Sound") then
                            v59.Volume = v59:GetAttribute("DefaultVolume");
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
HideObstructiveClothing = function(v60) --[[ Line: 105 ]] --[[ Name: HideObstructiveClothing ]]
    -- upvalues: v52 (copy), l_Players_0 (copy), l_Workspace_0 (copy), v51 (copy)
    if v52[v60] then
        return;
    else
        v52[v60] = true;
        task.delay(0.2, function() --[[ Line: 113 ]]
            -- upvalues: v52 (ref), v60 (copy)
            v52[v60] = nil;
        end);
        local v61 = v60 and v60:FindFirstChild("Humanoid");
        local v62 = v61 and v61:FindFirstChild("HumanoidDescription");
        if not v62 then
            return;
        else
            local l_l_Players_0_HumanoidModelFromDescription_0 = l_Players_0:CreateHumanoidModelFromDescription(v62, Enum.HumanoidRigType.R15);
            local l_PrimaryPart_0 = l_l_Players_0_HumanoidModelFromDescription_0.PrimaryPart;
            l_PrimaryPart_0.Anchored = true;
            l_PrimaryPart_0.Position = l_PrimaryPart_0.Position - Vector3.new(0, 500, 0, 0);
            for _, v66 in l_l_Players_0_HumanoidModelFromDescription_0:GetDescendants() do
                if v66:IsA("BasePart") then
                    v66.LocalTransparencyModifier = 10000;
                    v66.Transparency = 10000;
                    v66.CollisionGroup = "None";
                end;
            end;
            l_l_Players_0_HumanoidModelFromDescription_0.Parent = l_Workspace_0;
            task.wait(0.25);
            if not l_PrimaryPart_0 then
                l_l_Players_0_HumanoidModelFromDescription_0:Destroy();
                return;
            else
                local l_Folder_0 = Instance.new("Folder");
                for _, v69 in l_l_Players_0_HumanoidModelFromDescription_0:GetChildren() do
                    if v69:IsA("Accessory") then
                        local l_Handle_1 = v69:FindFirstChild("Handle");
                        if not l_Handle_1 then
                            v69:Destroy();
                        else
                            l_Handle_1.Name = v69.Name;
                            l_Handle_1.Parent = l_Folder_0;
                            l_Handle_1.Anchored = true;
                            v69:Destroy();
                        end;
                    elseif v69.Name == "HumanoidRootPart" then
                        v69:ClearAllChildren();
                    else
                        v69:Destroy();
                    end;
                end;
                for _, v72 in (v60:GetChildren()) do
                    if v72:IsA("Accessory") then
                        local l_Handle_2 = v72:FindFirstChild("Handle");
                        if l_Handle_2 then
                            if l_Handle_2:FindFirstChildOfClass("WrapLayer") then
                                v72:Destroy();
                            end;
                            local l_l_Folder_0_FirstChild_0 = l_Folder_0:FindFirstChild(v72.Name);
                            if l_l_Folder_0_FirstChild_0 then
                                l_l_Folder_0_FirstChild_0.Parent = l_l_Players_0_HumanoidModelFromDescription_0;
                                local _, v76 = GetBoundingBox(l_l_Players_0_HumanoidModelFromDescription_0, l_PrimaryPart_0.CFrame);
                                if v76.X * v76.Y * v76.Z > (v51[v72.AccessoryType] or 45) then
                                    l_Handle_2:SetAttribute("DefaultTransparency", l_Handle_2.Transparency);
                                    l_Handle_2.Transparency = 1;
                                    for _, v78 in l_Handle_2:GetDescendants() do
                                        if v78:IsA("ParticleEmitter") then
                                            v78.Enabled = false;
                                        elseif v78:IsA("Sound") then
                                            v78:SetAttribute("DefaultVolume", v78.Volume);
                                        end;
                                    end;
                                end;
                                l_l_Folder_0_FirstChild_0:Destroy();
                            end;
                        end;
                    end;
                end;
                l_Folder_0:Destroy();
                l_l_Players_0_HumanoidModelFromDescription_0:Destroy();
                return;
            end;
        end;
    end;
end;
CharacterAdded = function(v79) --[[ Line: 207 ]] --[[ Name: CharacterAdded ]]
    -- upvalues: l_Players_0 (copy), l_Workspace_0 (copy)
    if v79 == l_Players_0.LocalPlayer.Character then
        return;
    else
        local v80 = l_Workspace_0.States:WaitForChild(v79.Name, 10);
        local v81 = (v80 and v80:WaitForChild("CharacterData", 10)):WaitForChild("Opponent", 10);
        local v82 = {};
        v81.Changed:Connect(function(v83) --[[ Line: 216 ]]
            -- upvalues: v79 (copy), v82 (ref)
            if v83 then
                HideObstructiveClothing(v79);
                v82[#v82 + 1] = v79:GetAttributeChangedSignal("LastAppearanceChange"):Connect(function() --[[ Line: 220 ]]
                    -- upvalues: v79 (ref)
                    HideObstructiveClothing(v79);
                end);
                return;
            else
                local v84 = v79 and workspace.Welds:FindFirstChild(v79.Name);
                local v85 = v84 and v84:FindFirstChild("WeldCharacter") or v79;
                local l_StringValue_0 = Instance.new("StringValue");
                l_StringValue_0.Name = "ResetAppearance";
                l_StringValue_0.Parent = v85;
                task.wait(0.5);
                l_StringValue_0:Destroy();
                ShowObstructiveClothing(v79);
                for _, v88 in v82 do
                    v88:Disconnect();
                end;
                v82 = {};
                return;
            end;
        end);
        return;
    end;
end;
l_Workspace_0.Live.ChildAdded:Connect(function(v89) --[[ Line: 246 ]]
    CharacterAdded(v89);
end);
for _, v91 in l_Workspace_0.Live:GetChildren() do
    CharacterAdded(v91);
end;