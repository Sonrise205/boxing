local l_Players_0 = game:GetService("Players");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local _ = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Async_0 = require(l_ReplicatedFirst_0:WaitForChild("Async"));
local l_Rosyn_0 = require(l_ReplicatedFirst_0:WaitForChild("Rosyn"));
local l_Cleaner_0 = require(l_ReplicatedFirst_0:WaitForChild("Cleaner"));
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local v9 = {
    Scale = true, 
    Offset = true, 
    OffsetPos = true, 
    StudsOffset = true, 
    DriftEffect = true, 
    MaxDistance = true, 
    MinDistance = true, 
    MaximumScale = true, 
    MinimumScale = true, 
    DistanceScale = true, 
    DistanceOffset = true, 
    RotationOffset = true, 
    DistanceMultiplier = true
};
local v10 = CFrame.new(0, workspace.FallenPartsDestroyHeight + 30, 0);
local l_Part_0 = Instance.new("Part");
l_Part_0.Name = "SurfaceBillboard";
l_Part_0.Anchored = true;
l_Part_0.Position = v10.Position;
l_Part_0.Size = Vector3.new(1, 1, 1, 0);
l_Part_0.CanCollide = false;
l_Part_0.CanTouch = false;
l_Part_0.CanQuery = false;
l_Part_0.Transparency = 1;
l_Part_0.Parent = l_Workspace_0;
local v12 = {};
v12.__index = v12;
v12.new = function(v13) --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: l_Cleaner_0 (copy), v12 (copy)
    return (setmetatable({
        Root = v13, 
        Cleaner = l_Cleaner_0.new(), 
        Adornee = v13.Parent, 
        OriginalSize = v13.Size, 
        Scale = nil, 
        Offset = nil, 
        OffsetPos = nil, 
        DriftEffect = nil, 
        MaxDistance = nil, 
        MinDistance = nil, 
        MaximumScale = nil, 
        MinimumScale = nil, 
        DistanceScale = nil, 
        DistanceOffset = nil, 
        RotationOffset = nil, 
        DistanceMultiplier = nil, 
        Enabled = true
    }, v12));
end;
v12.RefreshAttributes = function(v14) --[[ Line: 75 ]] --[[ Name: RefreshAttributes ]]
    local l_Attributes_0 = v14.Root:GetAttributes();
    v14.Scale = l_Attributes_0.Scale or 1;
    v14.Offset = l_Attributes_0.Offset or CFrame.new(0, 0, 0);
    v14.OffsetPos = l_Attributes_0.OffsetPos or l_Attributes_0.StudsOffset or Vector3.new(0, 0, 0, 0);
    v14.DriftEffect = l_Attributes_0.DriftEffect;
    v14.MaxDistance = l_Attributes_0.MaxDistance or 750;
    v14.MinDistance = l_Attributes_0.MinDistance or 4;
    v14.MaximumScale = l_Attributes_0.MaximumScale or 15;
    v14.MinimumScale = l_Attributes_0.MinimumScale or 1;
    v14.DistanceScale = l_Attributes_0.DistanceScale;
    v14.PartOffsetPos = l_Attributes_0.DisablePartHeight;
    v14.DistanceOffset = l_Attributes_0.DistanceOffset or 0;
    v14.RotationOffset = l_Attributes_0.RotationOffset or CFrame.new();
    v14.DistanceMultiplier = l_Attributes_0.DistanceMultiplier or 0.5;
end;
v12.Initial = function(v16) --[[ Line: 92 ]] --[[ Name: Initial ]]
    -- upvalues: v9 (copy)
    local l_Root_0 = v16.Root;
    local l_Parent_0 = l_Root_0.Parent;
    if l_Parent_0:IsA("BasePart") or l_Parent_0:IsA("Attachment") or l_Parent_0:IsA("Bone") then
        v16:SetAdornee(l_Parent_0);
    end;
    local v19 = assert(l_Root_0:WaitForChild("SurfaceGui", 30));
    v19.Active = false;
    v16.GUI = v19;
    l_Root_0.CanCollide = false;
    l_Root_0.CanTouch = false;
    l_Root_0.CanQuery = false;
    for v20 in v9 do
        v16.Cleaner:Add(l_Root_0:GetAttributeChangedSignal(v20):Connect(function() --[[ Line: 109 ]]
            -- upvalues: v16 (copy)
            v16:RefreshAttributes();
        end));
    end;
    v16:RefreshAttributes();
end;
v12.SetAdornee = function(v21, v22) --[[ Line: 117 ]] --[[ Name: SetAdornee ]]
    -- upvalues: v10 (copy)
    local v23 = true;
    if v22 ~= nil then
        v23 = v22:IsA("BasePart") or v22:IsA("Attachment") or v22:IsA("Bone");
    end;
    assert(v23, "Adornee must be a BasePart, Attachment or Bone");
    v21.Adornee = v22;
    if v21._DeparentConnection then
        v21._DeparentConnection:Disconnect();
    end;
    v21:RefreshAttributes();
    if not v22 or not v22.Parent then
        v21._GetPosition = function() --[[ Line: 132 ]]
            -- upvalues: v10 (ref)
            return v10;
        end;
        return;
    else
        v21._GetPosition = v22:IsA("BasePart") and function() --[[ Line: 140 ]]
            -- upvalues: v22 (copy)
            return v22.CFrame;
        end or v22:IsA("Bone") and function() --[[ Line: 143 ]]
            -- upvalues: v22 (copy)
            return v22.TransformedWorldCFrame;
        end or v22:IsA("Attachment") and function() --[[ Line: 146 ]]
            -- upvalues: v22 (copy)
            return v22.WorldCFrame;
        end;
        v21._DeparentConnection = v22.Parent.AncestryChanged:Connect(function(_, v25) --[[ Line: 151 ]]
            -- upvalues: v21 (copy)
            if v25 == nil then
                v21._DeparentConnection:Disconnect();
                v21.Root:Destroy();
            end;
        end);
        return;
    end;
end;
v12.GetUIRoot = function(v26) --[[ Line: 159 ]] --[[ Name: GetUIRoot ]]
    return v26.GUI;
end;
v12.CreateFromBillboard = function(_, v28, v29) --[[ Line: 163 ]] --[[ Name: CreateFromBillboard ]]
    -- upvalues: l_Part_0 (copy), l_Rosyn_0 (copy), v12 (copy)
    v29 = v29 or 1;
    local l_Scale_0 = v28.Size.X.Scale;
    local l_Scale_1 = v28.Size.Y.Scale;
    local v32 = false;
    if l_Scale_0 > 0 then
        v32 = l_Scale_1 > 0;
    end;
    assert(v32, (("BillboardGui must have a scaled Size: %*"):format((v28:GetFullName()))));
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Size = Vector3.new(l_Scale_0, l_Scale_1, 0.02);
    l_Part_1.Transparency = 1;
    l_Part_1.CanCollide = false;
    l_Part_1.CanTouch = false;
    l_Part_1.CanQuery = false;
    l_Part_1.Anchored = true;
    v32 = {
        v28.StudsOffset, 
        v28.StudsOffsetWorldSpace, 
        v28.ExtentsOffset, 
        v28.ExtentsOffsetWorldSpace
    };
    table.sort(v32, function(v34, v35) --[[ Line: 180 ]]
        return v34.Magnitude > v35.Magnitude;
    end);
    l_Part_1:SetAttribute("DisablePartHeight", true);
    l_Part_1:SetAttribute("StudsOffset", v32[1]);
    l_Part_1:SetAttribute("MaxDistance", v28.MaxDistance);
    local v36 = l_Scale_0 * 30 * v29;
    local v37 = l_Scale_1 * 30 * v29;
    if v36 > 500 then
        local v38 = v36 / 500;
        v36 = v36 / v38;
        v37 = v37 / v38;
    elseif v37 > 500 then
        local v39 = v37 / 500;
        v36 = v36 / v39;
        v37 = v37 / v39;
    end;
    local l_SurfaceGui_0 = Instance.new("SurfaceGui");
    l_SurfaceGui_0.CanvasSize = Vector2.new(v36, v37);
    l_SurfaceGui_0.AlwaysOnTop = v28.AlwaysOnTop;
    for _, v42 in v28:GetChildren() do
        v42.Parent = l_SurfaceGui_0;
    end;
    l_SurfaceGui_0.Parent = l_Part_1;
    l_Part_1.Name = "SurfaceGui";
    l_Part_1.Parent = v28.Adornee or v28.Parent or l_Part_0;
    l_Part_1:AddTag("SurfaceBillboard");
    v28:Destroy();
    return l_Rosyn_0.AwaitComponentInit(l_Part_1, v12);
end;
v12.UsePlayerGui = function(v43, v44) --[[ Line: 219 ]] --[[ Name: UsePlayerGui ]]
    -- upvalues: l_Players_0 (copy)
    if v44 then
        v43.GUI.Parent = l_Players_0.LocalPlayer.PlayerGui;
        return;
    else
        v43.GUI.Parent = v43.Adornee;
        return;
    end;
end;
v12.Update = function(v45, v46, v47, v48) --[[ Line: 227 ]] --[[ Name: Update ]]
    -- upvalues: l_CurrentCamera_0 (copy)
    local l_GUI_0 = v45.GUI;
    if not l_GUI_0 then
        return;
    else
        local l_Root_1 = v45.Root;
        if not l_Root_1 then
            return;
        else
            local l_Enabled_0 = v45.Enabled;
            l_GUI_0.Enabled = l_Enabled_0;
            if not l_Enabled_0 then
                return;
            else
                local l_Offset_0 = v45.Offset;
                local l_MinDistance_0 = v45.MinDistance;
                local v54 = v45.OffsetPos + if v45.PartOffsetPos then Vector3.new(0, 0, 0, 0) else Vector3.new(0, l_Root_1.Size.Y / 2, 0);
                local v55 = (v45._GetPosition() * l_Offset_0).Position + v54;
                local l_CFrame_0 = l_CurrentCamera_0.CFrame;
                local l_Magnitude_0 = (v55 - l_CFrame_0.Position).Magnitude;
                local l_Position_0 = (l_CFrame_0 * CFrame.new(0, 0, 1000)).Position;
                if l_Magnitude_0 < l_MinDistance_0 then
                    l_GUI_0.Enabled = false;
                    return;
                else
                    local l_RotationOffset_0 = v45.RotationOffset;
                    local l_DistanceScale_0 = v45.DistanceScale;
                    if l_DistanceScale_0 and l_Enabled_0 then
                        local l_OriginalSize_0 = v45.OriginalSize;
                        local l_X_0 = l_OriginalSize_0.X;
                        local l_Y_0 = l_OriginalSize_0.Y;
                        local l_MinimumScale_0 = v45.MinimumScale;
                        local l_MaximumScale_0 = v45.MaximumScale;
                        local l_DistanceOffset_0 = v45.DistanceOffset;
                        local l_DistanceMultiplier_0 = v45.DistanceMultiplier;
                        local v68 = l_OriginalSize_0 * ((l_Magnitude_0 + l_DistanceOffset_0) * l_DistanceMultiplier_0) / l_DistanceScale_0;
                        l_Root_1.Size = Vector3.new(math.clamp(v68.X, l_MinimumScale_0 * l_X_0, l_MaximumScale_0 * l_X_0), math.clamp(v68.Y, l_MinimumScale_0 * l_Y_0, l_MaximumScale_0 * l_Y_0), l_OriginalSize_0.Z) * v45.Scale;
                    end;
                    local v69 = CFrame.lookAt(v55, l_Position_0) * l_RotationOffset_0;
                    local l_DriftEffect_0 = v45.DriftEffect;
                    if l_DriftEffect_0 then
                        local l_CFrame_1 = l_Root_1.CFrame;
                        local l_Position_1 = l_CFrame_1.Position;
                        local l_Position_2 = v69.Position;
                        local v74 = l_CFrame_1 - l_Position_1;
                        local v75 = v69 - l_Position_2;
                        v69 = CFrame.new(l_Position_2) * v74:Lerp(v75, (math.min(1, l_DriftEffect_0 * v46)));
                    end;
                    table.insert(v48, v69);
                    table.insert(v47, l_Root_1);
                    return;
                end;
            end;
        end;
    end;
end;
v12.Destroy = function(v76) --[[ Line: 298 ]] --[[ Name: Destroy ]]
    if v76._DeparentConnection then
        v76._DeparentConnection:Disconnect();
    end;
    v76.Cleaner:Clean();
end;
local v77 = {};
l_Async_0.Timer(0.25, function() --[[ Line: 309 ]]
    -- upvalues: l_CurrentCamera_0 (copy), v77 (copy), l_Rosyn_0 (copy), v12 (copy)
    local l_Position_3 = l_CurrentCamera_0.CFrame.Position;
    table.clear(v77);
    local v79 = 0;
    for v80 in l_Rosyn_0.GetComponentsOfClass(v12) do
        if not table.isfrozen(v80) then
            local l_GUI_1 = v80.GUI;
            if l_GUI_1 then
                if (v80._GetPosition().Position - l_Position_3).Magnitude > v80.MaxDistance then
                    l_GUI_1.Enabled = false;
                else
                    table.insert(v77, v80);
                    v79 = v79 + 1;
                    if v79 % 75 == 0 then
                        task.wait();
                    end;
                end;
            end;
        end;
    end;
end);
local v82 = false;
local function v85() --[[ Line: 342 ]] --[[ Name: UpdateDisabled ]]
    -- upvalues: v82 (ref), v77 (copy)
    v82 = workspace:GetAttribute("DisableBillboards");
    if v82 then
        for _, v84 in v77 do
            v84.GUI.Enabled = false;
        end;
    end;
end;
workspace:GetAttributeChangedSignal("DisableBillboards"):Connect(v85);
v82 = workspace:GetAttribute("DisableBillboards");
if v82 then
    for _, v87 in v77 do
        v87.GUI.Enabled = false;
    end;
end;
local v88 = {};
local v89 = {};
l_RunService_0.RenderStepped:Connect(function(v90) --[[ Line: 357 ]]
    -- upvalues: v82 (ref), v88 (copy), v89 (copy), v77 (copy)
    debug.profilebegin("UpdateSurfaceBillboards");
    if v82 then
        debug.profileend();
        return;
    else
        table.clear(v88);
        table.clear(v89);
        for _, v92 in v77 do
            if not table.isfrozen(v92) then
                v92:Update(v90, v89, v88);
            end;
        end;
        workspace:BulkMoveTo(v89, v88, Enum.BulkMoveMode.FireCFrameChanged);
        debug.profileend();
        return;
    end;
end);
v12.Register = {
    Components = l_Rosyn_0.Setup.Tags({
        SurfaceBillboard = v12
    }), 
    Filter = function(v93) --[[ Line: 385 ]] --[[ Name: Filter ]]
        -- upvalues: l_Workspace_0 (copy)
        local v94 = game:GetService("ServerStorage"):WaitForChild("HiddenStorage", 5);
        return v93:IsDescendantOf(l_Workspace_0) or v93 == l_Workspace_0 or v93:IsDescendantOf(v94);
    end
};
return v12;