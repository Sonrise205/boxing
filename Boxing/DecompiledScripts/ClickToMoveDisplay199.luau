local v0 = {};
local v1 = "rbxasset://textures/ui/traildot.png";
local v2 = "rbxasset://textures/ui/waypoint.png";
local v3 = false;
local v4 = UDim2.new(0, 42, 0, 50);
local v5 = Vector2.new(0, 0.5);
local v6 = Vector2.new(0, 1);
local v7 = Vector2.new(0, 0.5);
local v8 = Vector2.new(0.1, 0.5);
local v9 = Vector2.new(-0.1, 0.5);
local v10 = Vector2.new(1.5, 1.5);
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local function v27() --[[ Line: 44 ]] --[[ Name: CreateWaypointTemplates ]]
    -- upvalues: v10 (ref), v3 (ref), v1 (ref), v4 (copy), v5 (copy), v2 (ref), v7 (copy)
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Size = Vector3.new(1, 1, 1, 0);
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Name = "TrailDot";
    l_Part_0.Transparency = 1;
    local l_ImageHandleAdornment_0 = Instance.new("ImageHandleAdornment");
    l_ImageHandleAdornment_0.Name = "TrailDotImage";
    l_ImageHandleAdornment_0.Size = v10;
    l_ImageHandleAdornment_0.SizeRelativeOffset = Vector3.new(0, 0, -0.10000000149011612, 0);
    l_ImageHandleAdornment_0.AlwaysOnTop = v3;
    l_ImageHandleAdornment_0.Image = v1;
    l_ImageHandleAdornment_0.Adornee = l_Part_0;
    l_ImageHandleAdornment_0.Parent = l_Part_0;
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Size = Vector3.new(2, 2, 2, 0);
    l_Part_1.Anchored = true;
    l_Part_1.CanCollide = false;
    l_Part_1.Name = "EndWaypoint";
    l_Part_1.Transparency = 1;
    local l_ImageHandleAdornment_1 = Instance.new("ImageHandleAdornment");
    l_ImageHandleAdornment_1.Name = "TrailDotImage";
    l_ImageHandleAdornment_1.Size = v10;
    l_ImageHandleAdornment_1.SizeRelativeOffset = Vector3.new(0, 0, -0.10000000149011612, 0);
    l_ImageHandleAdornment_1.AlwaysOnTop = v3;
    l_ImageHandleAdornment_1.Image = v1;
    l_ImageHandleAdornment_1.Adornee = l_Part_1;
    l_ImageHandleAdornment_1.Parent = l_Part_1;
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Name = "EndWaypointBillboard";
    l_BillboardGui_0.Size = v4;
    l_BillboardGui_0.LightInfluence = 0;
    l_BillboardGui_0.SizeOffset = v5;
    l_BillboardGui_0.AlwaysOnTop = true;
    l_BillboardGui_0.Adornee = l_Part_1;
    l_BillboardGui_0.Parent = l_Part_1;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Image = v2;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.Parent = l_BillboardGui_0;
    local l_Part_2 = Instance.new("Part");
    l_Part_2.Size = Vector3.new(2, 2, 2, 0);
    l_Part_2.Anchored = true;
    l_Part_2.CanCollide = false;
    l_Part_2.Name = "FailureWaypoint";
    l_Part_2.Transparency = 1;
    local l_ImageHandleAdornment_2 = Instance.new("ImageHandleAdornment");
    l_ImageHandleAdornment_2.Name = "TrailDotImage";
    l_ImageHandleAdornment_2.Size = v10;
    l_ImageHandleAdornment_2.SizeRelativeOffset = Vector3.new(0, 0, -0.10000000149011612, 0);
    l_ImageHandleAdornment_2.AlwaysOnTop = v3;
    l_ImageHandleAdornment_2.Image = v1;
    l_ImageHandleAdornment_2.Adornee = l_Part_2;
    l_ImageHandleAdornment_2.Parent = l_Part_2;
    local l_BillboardGui_1 = Instance.new("BillboardGui");
    l_BillboardGui_1.Name = "FailureWaypointBillboard";
    l_BillboardGui_1.Size = v4;
    l_BillboardGui_1.LightInfluence = 0;
    l_BillboardGui_1.SizeOffset = v7;
    l_BillboardGui_1.AlwaysOnTop = true;
    l_BillboardGui_1.Adornee = l_Part_2;
    l_BillboardGui_1.Parent = l_Part_2;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Size = UDim2.new(0, 0, 0, 0);
    l_Frame_0.Position = UDim2.new(0.5, 0, 1, 0);
    l_Frame_0.Parent = l_BillboardGui_1;
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Image = v2;
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Position = UDim2.new(0, -v4.X.Offset / 2, 0, -v4.Y.Offset);
    l_ImageLabel_1.Size = v4;
    l_ImageLabel_1.Parent = l_Frame_0;
    return l_Part_0, l_Part_1, l_Part_2;
end;
local v28, v29, v30 = v27();
local function _() --[[ Line: 130 ]] --[[ Name: getTrailDotParent ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    local l_ClickToMoveDisplay_0 = l_CurrentCamera_0:FindFirstChild("ClickToMoveDisplay");
    if not l_ClickToMoveDisplay_0 then
        l_ClickToMoveDisplay_0 = Instance.new("Model");
        l_ClickToMoveDisplay_0.Name = "ClickToMoveDisplay";
        l_ClickToMoveDisplay_0.Parent = l_CurrentCamera_0;
    end;
    return l_ClickToMoveDisplay_0;
end;
local function v42(v34, v35) --[[ Line: 141 ]] --[[ Name: placePathWaypoint ]]
    -- upvalues: l_Workspace_0 (copy), l_LocalPlayer_0 (copy)
    local v36 = Ray.new(v35 + Vector3.new(0, 2.5, 0, 0), (Vector3.new(0, -10, 0, 0)));
    local l_l_Workspace_0_PartOnRayWithIgnoreList_0, v38, v39 = l_Workspace_0:FindPartOnRayWithIgnoreList(v36, {
        l_Workspace_0.CurrentCamera, 
        l_LocalPlayer_0.Character
    });
    if l_l_Workspace_0_PartOnRayWithIgnoreList_0 then
        v34.CFrame = CFrame.new(v38, v38 + v39);
        local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
        local l_ClickToMoveDisplay_1 = l_CurrentCamera_1:FindFirstChild("ClickToMoveDisplay");
        if not l_ClickToMoveDisplay_1 then
            l_ClickToMoveDisplay_1 = Instance.new("Model");
            l_ClickToMoveDisplay_1.Name = "ClickToMoveDisplay";
            l_ClickToMoveDisplay_1.Parent = l_CurrentCamera_1;
        end;
        v34.Parent = l_ClickToMoveDisplay_1;
    end;
end;
local v43 = {};
v43.__index = v43;
v43.Destroy = function(v44) --[[ Line: 156 ]] --[[ Name: Destroy ]]
    v44.DisplayModel:Destroy();
end;
v43.NewDisplayModel = function(_, v46) --[[ Line: 160 ]] --[[ Name: NewDisplayModel ]]
    -- upvalues: v28 (ref), v42 (copy)
    local v47 = v28:Clone();
    v42(v47, v46);
    return v47;
end;
v43.new = function(v48, v49) --[[ Line: 166 ]] --[[ Name: new ]]
    -- upvalues: v43 (copy)
    local v50 = setmetatable({}, v43);
    v50.DisplayModel = v50:NewDisplayModel(v48);
    v50.ClosestWayPoint = v49;
    return v50;
end;
local v51 = {};
v51.__index = v51;
v51.Destroy = function(v52) --[[ Line: 178 ]] --[[ Name: Destroy ]]
    v52.Destroyed = true;
    v52.Tween:Cancel();
    v52.DisplayModel:Destroy();
end;
v51.NewDisplayModel = function(_, v54) --[[ Line: 184 ]] --[[ Name: NewDisplayModel ]]
    -- upvalues: v29 (ref), v42 (copy)
    local v55 = v29:Clone();
    v42(v55, v54);
    return v55;
end;
v51.CreateTween = function(v56) --[[ Line: 190 ]] --[[ Name: CreateTween ]]
    -- upvalues: l_TweenService_0 (copy), v6 (copy)
    local v57 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true);
    local v58 = l_TweenService_0:Create(v56.DisplayModel.EndWaypointBillboard, v57, {
        SizeOffset = v6
    });
    v58:Play();
    return v58;
end;
v51.TweenInFrom = function(v59, v60) --[[ Line: 201 ]] --[[ Name: TweenInFrom ]]
    -- upvalues: l_TweenService_0 (copy)
    local v61 = v60 - v59.DisplayModel.Position;
    v59.DisplayModel.EndWaypointBillboard.StudsOffset = Vector3.new(0, v61.Y, 0);
    local v62 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
    local v63 = l_TweenService_0:Create(v59.DisplayModel.EndWaypointBillboard, v62, {
        StudsOffset = Vector3.new(0, 0, 0, 0)
    });
    v63:Play();
    return v63;
end;
v51.new = function(v64, v65, v66) --[[ Line: 215 ]] --[[ Name: new ]]
    -- upvalues: v51 (copy)
    local v67 = setmetatable({}, v51);
    v67.DisplayModel = v67:NewDisplayModel(v64);
    v67.Destroyed = false;
    if v66 and (v66 - v64).Magnitude > 5 then
        v67.Tween = v67:TweenInFrom(v66);
        coroutine.wrap(function() --[[ Line: 222 ]]
            -- upvalues: v67 (copy)
            v67.Tween.Completed:Wait();
            if not v67.Destroyed then
                v67.Tween = v67:CreateTween();
            end;
        end)();
    else
        v67.Tween = v67:CreateTween();
    end;
    v67.ClosestWayPoint = v65;
    return v67;
end;
local v68 = {};
v68.__index = v68;
v68.Hide = function(v69) --[[ Line: 239 ]] --[[ Name: Hide ]]
    v69.DisplayModel.Parent = nil;
end;
v68.Destroy = function(v70) --[[ Line: 243 ]] --[[ Name: Destroy ]]
    v70.DisplayModel:Destroy();
end;
v68.NewDisplayModel = function(_, v72) --[[ Line: 247 ]] --[[ Name: NewDisplayModel ]]
    -- upvalues: v30 (ref), v42 (copy), l_Workspace_0 (copy), l_LocalPlayer_0 (copy)
    local v73 = v30:Clone();
    v42(v73, v72);
    local v74 = Ray.new(v72 + Vector3.new(0, 2.5, 0, 0), (Vector3.new(0, -10, 0, 0)));
    local l_l_Workspace_0_PartOnRayWithIgnoreList_1, v76, v77 = l_Workspace_0:FindPartOnRayWithIgnoreList(v74, {
        l_Workspace_0.CurrentCamera, 
        l_LocalPlayer_0.Character
    });
    if l_l_Workspace_0_PartOnRayWithIgnoreList_1 then
        v73.CFrame = CFrame.new(v76, v76 + v77);
        local l_CurrentCamera_2 = l_Workspace_0.CurrentCamera;
        local l_ClickToMoveDisplay_2 = l_CurrentCamera_2:FindFirstChild("ClickToMoveDisplay");
        if not l_ClickToMoveDisplay_2 then
            l_ClickToMoveDisplay_2 = Instance.new("Model");
            l_ClickToMoveDisplay_2.Name = "ClickToMoveDisplay";
            l_ClickToMoveDisplay_2.Parent = l_CurrentCamera_2;
        end;
        v73.Parent = l_ClickToMoveDisplay_2;
    end;
    return v73;
end;
v68.RunFailureTween = function(v80) --[[ Line: 261 ]] --[[ Name: RunFailureTween ]]
    -- upvalues: l_TweenService_0 (copy), v8 (copy), v9 (copy), v7 (copy)
    wait(0.125);
    local v81 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
    local v82 = l_TweenService_0:Create(v80.DisplayModel.FailureWaypointBillboard, v81, {
        SizeOffset = v8
    });
    v82:Play();
    l_TweenService_0:Create(v80.DisplayModel.FailureWaypointBillboard.Frame, v81, {
        Rotation = 10
    }):Play();
    v82.Completed:wait();
    v81 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true);
    local v83 = l_TweenService_0:Create(v80.DisplayModel.FailureWaypointBillboard, v81, {
        SizeOffset = v9
    });
    v83:Play();
    v81 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true);
    l_TweenService_0:Create(v80.DisplayModel.FailureWaypointBillboard.Frame.ImageLabel, v81, {
        ImageColor3 = Color3.new(0.75, 0.75, 0.75)
    }):Play();
    l_TweenService_0:Create(v80.DisplayModel.FailureWaypointBillboard.Frame, v81, {
        Rotation = -10
    }):Play();
    v83.Completed:wait();
    v81 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
    local v84 = l_TweenService_0:Create(v80.DisplayModel.FailureWaypointBillboard, v81, {
        SizeOffset = v7
    });
    v84:Play();
    l_TweenService_0:Create(v80.DisplayModel.FailureWaypointBillboard.Frame, v81, {
        Rotation = 0
    }):Play();
    v84.Completed:wait();
    wait(0.125);
end;
v68.new = function(v85) --[[ Line: 310 ]] --[[ Name: new ]]
    -- upvalues: v68 (copy)
    local v86 = setmetatable({}, v68);
    v86.DisplayModel = v86:NewDisplayModel(v85);
    return v86;
end;
local l_Animation_0 = Instance.new("Animation");
l_Animation_0.AnimationId = "rbxassetid://2874840706";
local v88 = nil;
local function _(v89) --[[ Line: 324 ]] --[[ Name: getFailureAnimationTrack ]]
    -- upvalues: v88 (ref), l_Animation_0 (copy)
    if v89 == nil then
        return v88;
    else
        v88 = v89:LoadAnimation(l_Animation_0);
        assert(v88, "");
        v88.Priority = Enum.AnimationPriority.Action;
        v88.Looped = false;
        return v88;
    end;
end;
local function _() --[[ Line: 335 ]] --[[ Name: findPlayerHumanoid ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if l_Character_0 then
        return l_Character_0:FindFirstChildOfClass("Humanoid");
    else
        return;
    end;
end;
local function v102(v93, v94) --[[ Line: 342 ]] --[[ Name: createTrailDots ]]
    -- upvalues: v43 (copy), v51 (copy)
    local v95 = {};
    local v96 = 1;
    for v97 = 1, #v93 - 1 do
        local v98 = (v93[v97].Position - v93[#v93].Position).Magnitude < 3;
        local v99 = false;
        if v97 % 2 == 0 then
            v99 = not v98;
        end;
        if v99 then
            v95[v96] = v43.new(v93[v97].Position, v97);
            v96 = v96 + 1;
        end;
    end;
    table.insert(v95, (v51.new(v93[#v93].Position, #v93, v94)));
    local v100 = {};
    v96 = 1;
    for v101 = #v95, 1, -1 do
        v100[v96] = v95[v101];
        v96 = v96 + 1;
    end;
    return v100;
end;
local function _(v103, v104) --[[ Line: 367 ]] --[[ Name: getTrailDotScale ]]
    return v104 * (math.clamp(v103 - 10, 0, 90) / 90 * 1.5 + 1);
end;
local v106 = 0;
v0.CreatePathDisplay = function(v107, v108) --[[ Line: 376 ]] --[[ Name: CreatePathDisplay ]]
    -- upvalues: v106 (ref), v102 (copy), l_RunService_0 (copy), l_Workspace_0 (copy), v10 (ref)
    v106 = v106 + 1;
    local v109 = v102(v107, v108);
    local function v113(v110) --[[ Line: 380 ]] --[[ Name: removePathBeforePoint ]]
        -- upvalues: v109 (copy)
        for v111 = #v109, 1, -1 do
            local v112 = v109[v111];
            if v112.ClosestWayPoint <= v110 then
                v112:Destroy();
                v109[v111] = nil;
            else
                break;
            end;
        end;
    end;
    local v114 = "ClickToMoveResizeTrail" .. v106;
    local function v119() --[[ Line: 394 ]] --[[ Name: resizeTrailDots ]]
        -- upvalues: v109 (copy), l_RunService_0 (ref), v114 (copy), l_Workspace_0 (ref), v10 (ref)
        if #v109 == 0 then
            l_RunService_0:UnbindFromRenderStep(v114);
            return;
        else
            local l_p_0 = l_Workspace_0.CurrentCamera.CFrame.p;
            for v116 = 1, #v109 do
                local l_TrailDotImage_0 = v109[v116].DisplayModel:FindFirstChild("TrailDotImage");
                if l_TrailDotImage_0 then
                    local l_Magnitude_0 = (v109[v116].DisplayModel.Position - l_p_0).Magnitude;
                    l_TrailDotImage_0.Size = v10 * (math.clamp(l_Magnitude_0 - 10, 0, 90) / 90 * 1.5 + 1);
                end;
            end;
            return;
        end;
    end;
    l_RunService_0:BindToRenderStep(v114, Enum.RenderPriority.Camera.Value - 1, v119);
    return function() --[[ Line: 410 ]] --[[ Name: removePath ]]
        -- upvalues: v113 (copy), v107 (copy)
        v113(#v107);
    end, v113;
end;
local v120 = nil;
v0.DisplayFailureWaypoint = function(v121) --[[ Line: 418 ]] --[[ Name: DisplayFailureWaypoint ]]
    -- upvalues: v120 (ref), v68 (copy)
    if v120 then
        v120:Hide();
    end;
    local v122 = v68.new(v121);
    v120 = v122;
    coroutine.wrap(function() --[[ Line: 424 ]]
        -- upvalues: v122 (ref)
        v122:RunFailureTween();
        v122:Destroy();
        v122 = nil;
    end)();
end;
v0.CreateEndWaypoint = function(v123) --[[ Line: 431 ]] --[[ Name: CreateEndWaypoint ]]
    -- upvalues: v51 (copy)
    return v51.new(v123);
end;
v0.PlayFailureAnimation = function() --[[ Line: 435 ]] --[[ Name: PlayFailureAnimation ]]
    -- upvalues: l_LocalPlayer_0 (copy), v88 (ref), l_Animation_0 (copy)
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v125 = if l_Character_1 then l_Character_1:FindFirstChildOfClass("Humanoid") else nil;
    if v125 then
        if v125 == nil then
            l_Character_1 = v88;
        else
            v88 = v125:LoadAnimation(l_Animation_0);
            assert(v88, "");
            v88.Priority = Enum.AnimationPriority.Action;
            v88.Looped = false;
            l_Character_1 = v88;
        end;
        l_Character_1:Play();
    end;
end;
v0.CancelFailureAnimation = function() --[[ Line: 443 ]] --[[ Name: CancelFailureAnimation ]]
    -- upvalues: v88 (ref)
    if v88 ~= nil and v88.IsPlaying then
        v88:Stop();
    end;
end;
v0.SetWaypointTexture = function(v126) --[[ Line: 449 ]] --[[ Name: SetWaypointTexture ]]
    -- upvalues: v1 (ref), v28 (ref), v29 (ref), v30 (ref), v27 (copy)
    v1 = v126;
    local v127, v128, v129 = v27();
    v28 = v127;
    v29 = v128;
    v30 = v129;
end;
v0.GetWaypointTexture = function() --[[ Line: 454 ]] --[[ Name: GetWaypointTexture ]]
    -- upvalues: v1 (ref)
    return v1;
end;
v0.SetWaypointRadius = function(v130) --[[ Line: 458 ]] --[[ Name: SetWaypointRadius ]]
    -- upvalues: v10 (ref), v28 (ref), v29 (ref), v30 (ref), v27 (copy)
    v10 = Vector2.new(v130, v130);
    local v131, v132, v133 = v27();
    v28 = v131;
    v29 = v132;
    v30 = v133;
end;
v0.GetWaypointRadius = function() --[[ Line: 463 ]] --[[ Name: GetWaypointRadius ]]
    -- upvalues: v10 (ref)
    return v10.X;
end;
v0.SetEndWaypointTexture = function(v134) --[[ Line: 467 ]] --[[ Name: SetEndWaypointTexture ]]
    -- upvalues: v2 (ref), v28 (ref), v29 (ref), v30 (ref), v27 (copy)
    v2 = v134;
    local v135, v136, v137 = v27();
    v28 = v135;
    v29 = v136;
    v30 = v137;
end;
v0.GetEndWaypointTexture = function() --[[ Line: 472 ]] --[[ Name: GetEndWaypointTexture ]]
    -- upvalues: v2 (ref)
    return v2;
end;
v0.SetWaypointsAlwaysOnTop = function(v138) --[[ Line: 476 ]] --[[ Name: SetWaypointsAlwaysOnTop ]]
    -- upvalues: v3 (ref), v28 (ref), v29 (ref), v30 (ref), v27 (copy)
    v3 = v138;
    local v139, v140, v141 = v27();
    v28 = v139;
    v29 = v140;
    v30 = v141;
end;
v0.GetWaypointsAlwaysOnTop = function() --[[ Line: 481 ]] --[[ Name: GetWaypointsAlwaysOnTop ]]
    -- upvalues: v3 (ref)
    return v3;
end;
return v0;