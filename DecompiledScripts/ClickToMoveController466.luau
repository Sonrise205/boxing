local l_status_0, l_result_0 = pcall(function() --[[ Line: 10 ]]
    return UserSettings():IsUserFeatureEnabled("UserExcludeNonCollidableForPathfinding");
end);
local v2 = l_status_0 and l_result_0;
local l_status_1, l_result_1 = pcall(function() --[[ Line: 14 ]]
    return UserSettings():IsUserFeatureEnabled("UserClickToMoveSupportAgentCanClimb2");
end);
local v5 = l_status_1 and l_result_1;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_PathfindingService_0 = game:GetService("PathfindingService");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Debris");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Workspace_0 = game:GetService("Workspace");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_GuiService_0 = game:GetService("GuiService");
local v14 = true;
local v15 = true;
local v16 = false;
local v17 = 1;
local v18 = 8;
local v19 = {
    [Enum.KeyCode.W] = true, 
    [Enum.KeyCode.A] = true, 
    [Enum.KeyCode.S] = true, 
    [Enum.KeyCode.D] = true, 
    [Enum.KeyCode.Up] = true, 
    [Enum.KeyCode.Down] = true
};
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_ClickToMoveDisplay_0 = require(script.Parent:WaitForChild("ClickToMoveDisplay"));
local v22 = {};
local function v23(v24) --[[ Line: 56 ]] --[[ Name: FindCharacterAncestor ]]
    -- upvalues: v23 (copy)
    if v24 then
        local l_Humanoid_0 = v24:FindFirstChildOfClass("Humanoid");
        if l_Humanoid_0 then
            return v24, l_Humanoid_0;
        else
            return v23(v24.Parent);
        end;
    else
        return;
    end;
end;
v22.FindCharacterAncestor = v23;
local l_v23_0 = v23 --[[ copy: 23 -> 47 ]];
local function v27(v28, v29, v30) --[[ Line: 68 ]] --[[ Name: Raycast ]]
    -- upvalues: l_Workspace_0 (copy), l_v23_0 (copy), v27 (copy)
    v30 = v30 or {};
    local l_l_Workspace_0_PartOnRayWithIgnoreList_0, v32, v33, v34 = l_Workspace_0:FindPartOnRayWithIgnoreList(v28, v30);
    if l_l_Workspace_0_PartOnRayWithIgnoreList_0 then
        if v29 and l_l_Workspace_0_PartOnRayWithIgnoreList_0.CanCollide == false then
            local v35;
            if l_l_Workspace_0_PartOnRayWithIgnoreList_0 then
                local l_Humanoid_1 = l_l_Workspace_0_PartOnRayWithIgnoreList_0:FindFirstChildOfClass("Humanoid");
                if l_Humanoid_1 then
                    local _ = l_l_Workspace_0_PartOnRayWithIgnoreList_0;
                    v35 = l_Humanoid_1;
                else
                    local v38, v39 = l_v23_0(l_l_Workspace_0_PartOnRayWithIgnoreList_0.Parent);
                    local _ = v38;
                    v35 = v39;
                end;
            else
                local _ = nil;
                v35 = nil;
            end;
            if v35 == nil then
                table.insert(v30, l_l_Workspace_0_PartOnRayWithIgnoreList_0);
                return v27(v28, v29, v30);
            end;
        end;
        return l_l_Workspace_0_PartOnRayWithIgnoreList_0, v32, v33, v34;
    else
        return nil, nil;
    end;
end;
v22.Raycast = v27;
v23 = {};
v27 = function(v42) --[[ Line: 89 ]] --[[ Name: findPlayerHumanoid ]]
    -- upvalues: v23 (copy)
    local v43 = v42 and v42.Character;
    if v43 then
        local v44 = v23[v42];
        if v44 and v44.Parent == v43 then
            return v44;
        else
            v23[v42] = nil;
            local l_Humanoid_2 = v43:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_2 then
                v23[v42] = l_Humanoid_2;
            end;
            return l_Humanoid_2;
        end;
    else
        return;
    end;
end;
local v46 = nil;
local v47 = nil;
local v48 = nil;
local v49 = nil;
local function _() --[[ Line: 113 ]] --[[ Name: GetCharacter ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    return l_LocalPlayer_0 and l_LocalPlayer_0.Character;
end;
local function v58(v51) --[[ Line: 117 ]] --[[ Name: UpdateIgnoreTag ]]
    -- upvalues: v47 (ref), v48 (ref), v49 (ref), v46 (ref), l_LocalPlayer_0 (copy), l_CollectionService_0 (copy)
    if v51 == v47 then
        return;
    else
        if v48 then
            v48:Disconnect();
            v48 = nil;
        end;
        if v49 then
            v49:Disconnect();
            v49 = nil;
        end;
        v47 = v51;
        v46 = {
            l_LocalPlayer_0 and l_LocalPlayer_0.Character
        };
        if v47 ~= nil then
            local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged(v47);
            for _, v54 in ipairs(l_l_CollectionService_0_Tagged_0) do
                table.insert(v46, v54);
            end;
            v48 = l_CollectionService_0:GetInstanceAddedSignal(v47):Connect(function(v55) --[[ Line: 137 ]]
                -- upvalues: v46 (ref)
                table.insert(v46, v55);
            end);
            v49 = l_CollectionService_0:GetInstanceRemovedSignal(v47):Connect(function(v56) --[[ Line: 141 ]]
                -- upvalues: v46 (ref)
                for v57 = 1, #v46 do
                    if v46[v57] == v56 then
                        v46[v57] = v46[#v46];
                        table.remove(v46);
                        return;
                    end;
                end;
            end);
        end;
        return;
    end;
end;
local function _() --[[ Line: 153 ]] --[[ Name: getIgnoreList ]]
    -- upvalues: v46 (ref), l_LocalPlayer_0 (copy)
    if v46 ~= nil then
        return v46;
    else
        v46 = {};
        table.insert(v46, l_LocalPlayer_0 and l_LocalPlayer_0.Character);
        return v46;
    end;
end;
local function _(v60, v61) --[[ Line: 162 ]] --[[ Name: minV ]]
    return (Vector3.new(math.min(v60.X, v61.X), math.min(v60.Y, v61.Y), (math.min(v60.Z, v61.Z))));
end;
local function _(v63, v64) --[[ Line: 165 ]] --[[ Name: maxV ]]
    return (Vector3.new(math.max(v63.X, v64.X), math.max(v63.Y, v64.Y), (math.max(v63.Z, v64.Z))));
end;
local function v80(v66) --[[ Line: 168 ]] --[[ Name: getCollidableExtentsSize ]]
    if v66 == nil or v66.PrimaryPart == nil then
        return;
    else
        assert(v66, "");
        assert(v66.PrimaryPart, "");
        local v67 = v66.PrimaryPart.CFrame:Inverse();
        local v68 = Vector3.new(1e999, 1e999, 1e999, 0);
        local v69 = Vector3.new(-1e999, -1e999, -1e999, 0);
        for _, v71 in pairs(v66:GetDescendants()) do
            if v71:IsA("BasePart") and v71.CanCollide then
                local v72 = v67 * v71.CFrame;
                local v73 = Vector3.new(v71.Size.X / 2, v71.Size.Y / 2, v71.Size.Z / 2);
                local v74 = {
                    Vector3.new(v73.X, v73.Y, v73.Z), 
                    Vector3.new(v73.X, v73.Y, -v73.Z), 
                    Vector3.new(v73.X, -v73.Y, v73.Z), 
                    Vector3.new(v73.X, -v73.Y, -v73.Z), 
                    Vector3.new(-v73.X, v73.Y, v73.Z), 
                    Vector3.new(-v73.X, v73.Y, -v73.Z), 
                    Vector3.new(-v73.X, -v73.Y, v73.Z), 
                    (Vector3.new(-v73.X, -v73.Y, -v73.Z))
                };
                for _, v76 in ipairs(v74) do
                    local v77 = v72 * v76;
                    local l_v68_0 = v68;
                    v68 = Vector3.new(math.min(l_v68_0.X, v77.X), math.min(l_v68_0.Y, v77.Y), (math.min(l_v68_0.Z, v77.Z)));
                    l_v68_0 = v69;
                    v69 = Vector3.new(math.max(l_v68_0.X, v77.X), math.max(l_v68_0.Y, v77.Y), (math.max(l_v68_0.Z, v77.Z)));
                end;
            end;
        end;
        local v79 = v69 - v68;
        if v79.X < 0 or v79.Y < 0 or v79.Z < 0 then
            return nil;
        else
            return v79;
        end;
    end;
end;
local function v143(v81, v82, v83) --[[ Line: 203 ]] --[[ Name: Pather ]]
    -- upvalues: v16 (ref), l_LocalPlayer_0 (copy), v23 (copy), v17 (ref), v2 (copy), v80 (copy), v5 (copy), l_PathfindingService_0 (copy), v14 (ref), l_ClickToMoveDisplay_0 (copy), v18 (ref), l_Workspace_0 (copy), v46 (ref)
    local v84 = {};
    local v85 = nil;
    local v86 = nil;
    if v83 ~= nil then
        v85 = v83;
        v86 = v83;
    else
        v85 = v16;
        v86 = true;
    end;
    v84.Cancelled = false;
    v84.Started = false;
    v84.Finished = Instance.new("BindableEvent");
    v84.PathFailed = Instance.new("BindableEvent");
    v84.PathComputing = false;
    v84.PathComputed = false;
    v84.OriginalTargetPoint = v81;
    v84.TargetPoint = v81;
    v84.TargetSurfaceNormal = v82;
    v84.DiedConn = nil;
    v84.SeatedConn = nil;
    v84.BlockedConn = nil;
    v84.TeleportedConn = nil;
    v84.CurrentPoint = 0;
    v84.HumanoidOffsetFromPath = Vector3.new(0, 0, 0, 0);
    v84.CurrentWaypointPosition = nil;
    v84.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0, 0);
    v84.CurrentWaypointPlaneDistance = 0;
    v84.CurrentWaypointNeedsJump = false;
    v84.CurrentHumanoidPosition = Vector3.new(0, 0, 0, 0);
    v84.CurrentHumanoidVelocity = 0;
    v84.NextActionMoveDirection = Vector3.new(0, 0, 0, 0);
    v84.NextActionJump = false;
    v84.Timeout = 0;
    local l_l_LocalPlayer_0_0 = l_LocalPlayer_0;
    local v88 = l_l_LocalPlayer_0_0 and l_l_LocalPlayer_0_0.Character;
    local v89;
    if v88 then
        local v90 = v23[l_l_LocalPlayer_0_0];
        if v90 and v90.Parent == v88 then
            v89 = v90;
        else
            v23[l_l_LocalPlayer_0_0] = nil;
            local l_Humanoid_3 = v88:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_3 then
                v23[l_l_LocalPlayer_0_0] = l_Humanoid_3;
            end;
            v89 = l_Humanoid_3;
        end;
    else
        v89 = nil;
    end;
    v84.Humanoid = v89;
    v84.OriginPoint = nil;
    v84.AgentCanFollowPath = false;
    v84.DirectPath = false;
    v84.DirectPathRiseFirst = false;
    v84.stopTraverseFunc = nil;
    v84.setPointFunc = nil;
    v84.pointList = nil;
    v89 = v84.Humanoid and v84.Humanoid.RootPart;
    if v89 then
        v84.OriginPoint = v89.CFrame.Position;
        l_l_LocalPlayer_0_0 = 2;
        v88 = 5;
        local v92 = true;
        local l_SeatPart_0 = v84.Humanoid.SeatPart;
        if l_SeatPart_0 and l_SeatPart_0:IsA("VehicleSeat") then
            local l_l_SeatPart_0_FirstAncestorOfClass_0 = l_SeatPart_0:FindFirstAncestorOfClass("Model");
            if l_l_SeatPart_0_FirstAncestorOfClass_0 then
                local l_PrimaryPart_0 = l_l_SeatPart_0_FirstAncestorOfClass_0.PrimaryPart;
                l_l_SeatPart_0_FirstAncestorOfClass_0.PrimaryPart = l_SeatPart_0;
                if v86 then
                    local l_l_l_SeatPart_0_FirstAncestorOfClass_0_ExtentsSize_0 = l_l_SeatPart_0_FirstAncestorOfClass_0:GetExtentsSize();
                    l_l_LocalPlayer_0_0 = v17 * 0.5 * math.sqrt(l_l_l_SeatPart_0_FirstAncestorOfClass_0_ExtentsSize_0.X * l_l_l_SeatPart_0_FirstAncestorOfClass_0_ExtentsSize_0.X + l_l_l_SeatPart_0_FirstAncestorOfClass_0_ExtentsSize_0.Z * l_l_l_SeatPart_0_FirstAncestorOfClass_0_ExtentsSize_0.Z);
                    v88 = v17 * l_l_l_SeatPart_0_FirstAncestorOfClass_0_ExtentsSize_0.Y;
                    v92 = false;
                    v84.AgentCanFollowPath = true;
                    v84.DirectPath = v86;
                end;
                l_l_SeatPart_0_FirstAncestorOfClass_0.PrimaryPart = l_PrimaryPart_0;
            end;
        else
            local v97 = nil;
            if v2 then
                local v98 = l_LocalPlayer_0 and l_LocalPlayer_0.Character;
                if v98 ~= nil then
                    v97 = v80(v98);
                end;
            end;
            if v97 == nil then
                v97 = (l_LocalPlayer_0 and l_LocalPlayer_0.Character):GetExtentsSize();
            end;
            assert(v97, "");
            l_l_LocalPlayer_0_0 = v17 * 0.5 * math.sqrt(v97.X * v97.X + v97.Z * v97.Z);
            v88 = v17 * v97.Y;
            v92 = v84.Humanoid.JumpPower > 0;
            v84.AgentCanFollowPath = true;
            v84.DirectPath = v85;
            v84.DirectPathRiseFirst = v84.Humanoid.Sit;
        end;
        if v5 then
            v84.pathResult = l_PathfindingService_0:CreatePath({
                AgentRadius = l_l_LocalPlayer_0_0, 
                AgentHeight = v88, 
                AgentCanJump = v92, 
                AgentCanClimb = true
            });
        else
            v84.pathResult = l_PathfindingService_0:CreatePath({
                AgentRadius = l_l_LocalPlayer_0_0, 
                AgentHeight = v88, 
                AgentCanJump = v92
            });
        end;
    end;
    v84.Cleanup = function(_) --[[ Line: 321 ]] --[[ Name: Cleanup ]]
        -- upvalues: v84 (copy)
        if v84.stopTraverseFunc then
            v84.stopTraverseFunc();
            v84.stopTraverseFunc = nil;
        end;
        if v84.BlockedConn then
            v84.BlockedConn:Disconnect();
            v84.BlockedConn = nil;
        end;
        if v84.DiedConn then
            v84.DiedConn:Disconnect();
            v84.DiedConn = nil;
        end;
        if v84.SeatedConn then
            v84.SeatedConn:Disconnect();
            v84.SeatedConn = nil;
        end;
        if v84.TeleportedConn then
            v84.TeleportedConn:Disconnect();
            v84.TeleportedConn = nil;
        end;
        v84.Started = false;
    end;
    v84.Cancel = function(_) --[[ Line: 350 ]] --[[ Name: Cancel ]]
        -- upvalues: v84 (copy)
        v84.Cancelled = true;
        v84:Cleanup();
    end;
    v84.IsActive = function(_) --[[ Line: 355 ]] --[[ Name: IsActive ]]
        -- upvalues: v84 (copy)
        return v84.AgentCanFollowPath and v84.Started and not v84.Cancelled;
    end;
    v84.OnPathInterrupted = function(_) --[[ Line: 359 ]] --[[ Name: OnPathInterrupted ]]
        -- upvalues: v84 (copy)
        v84.Cancelled = true;
        v84:OnPointReached(false);
    end;
    v84.ComputePath = function(_) --[[ Line: 365 ]] --[[ Name: ComputePath ]]
        -- upvalues: v84 (copy)
        if v84.OriginPoint then
            if v84.PathComputed or v84.PathComputing then
                return;
            else
                v84.PathComputing = true;
                if v84.AgentCanFollowPath then
                    if v84.DirectPath then
                        v84.pointList = {
                            PathWaypoint.new(v84.OriginPoint, Enum.PathWaypointAction.Walk), 
                            PathWaypoint.new(v84.TargetPoint, v84.DirectPathRiseFirst and Enum.PathWaypointAction.Jump or Enum.PathWaypointAction.Walk)
                        };
                        v84.PathComputed = true;
                    else
                        v84.pathResult:ComputeAsync(v84.OriginPoint, v84.TargetPoint);
                        v84.pointList = v84.pathResult:GetWaypoints();
                        v84.BlockedConn = v84.pathResult.Blocked:Connect(function(v104) --[[ Line: 379 ]]
                            -- upvalues: v84 (ref)
                            v84:OnPathBlocked(v104);
                        end);
                        v84.PathComputed = v84.pathResult.Status == Enum.PathStatus.Success;
                    end;
                end;
                v84.PathComputing = false;
            end;
        end;
    end;
    v84.IsValidPath = function(_) --[[ Line: 387 ]] --[[ Name: IsValidPath ]]
        -- upvalues: v84 (copy)
        v84:ComputePath();
        return v84.PathComputed and v84.AgentCanFollowPath;
    end;
    v84.Recomputing = false;
    v84.OnPathBlocked = function(_, v107) --[[ Line: 393 ]] --[[ Name: OnPathBlocked ]]
        -- upvalues: v84 (copy), v14 (ref), l_ClickToMoveDisplay_0 (ref)
        if v84.CurrentPoint > v107 or v84.Recomputing then
            return;
        else
            v84.Recomputing = true;
            if v84.stopTraverseFunc then
                v84.stopTraverseFunc();
                v84.stopTraverseFunc = nil;
            end;
            v84.OriginPoint = v84.Humanoid.RootPart.CFrame.p;
            v84.pathResult:ComputeAsync(v84.OriginPoint, v84.TargetPoint);
            v84.pointList = v84.pathResult:GetWaypoints();
            if #v84.pointList > 0 then
                v84.HumanoidOffsetFromPath = v84.pointList[1].Position - v84.OriginPoint;
            end;
            v84.PathComputed = v84.pathResult.Status == Enum.PathStatus.Success;
            if v14 then
                local l_v84_0 = v84;
                local l_v84_1 = v84;
                local v110, v111 = l_ClickToMoveDisplay_0.CreatePathDisplay(v84.pointList);
                l_v84_0.stopTraverseFunc = v110;
                l_v84_1.setPointFunc = v111;
            end;
            if v84.PathComputed then
                v84.CurrentPoint = 1;
                v84:OnPointReached(true);
            else
                v84.PathFailed:Fire();
                v84:Cleanup();
            end;
            v84.Recomputing = false;
            return;
        end;
    end;
    v84.OnRenderStepped = function(_, v113) --[[ Line: 429 ]] --[[ Name: OnRenderStepped ]]
        -- upvalues: v84 (copy), v18 (ref)
        if v84.Started and not v84.Cancelled then
            v84.Timeout = v84.Timeout + v113;
            if v84.Timeout > v18 then
                v84:OnPointReached(false);
                return;
            else
                v84.CurrentHumanoidPosition = v84.Humanoid.RootPart.Position + v84.HumanoidOffsetFromPath;
                v84.CurrentHumanoidVelocity = v84.Humanoid.RootPart.Velocity;
                while v84.Started and v84:IsCurrentWaypointReached() do
                    v84:OnPointReached(true);
                end;
                if v84.Started then
                    v84.NextActionMoveDirection = v84.CurrentWaypointPosition - v84.CurrentHumanoidPosition;
                    if v84.NextActionMoveDirection.Magnitude > 1.0E-6 then
                        v84.NextActionMoveDirection = v84.NextActionMoveDirection.Unit;
                    else
                        v84.NextActionMoveDirection = Vector3.new(0, 0, 0, 0);
                    end;
                    if v84.CurrentWaypointNeedsJump then
                        v84.NextActionJump = true;
                        v84.CurrentWaypointNeedsJump = false;
                        return;
                    else
                        v84.NextActionJump = false;
                    end;
                end;
            end;
        end;
    end;
    v84.IsCurrentWaypointReached = function(_) --[[ Line: 467 ]] --[[ Name: IsCurrentWaypointReached ]]
        -- upvalues: v84 (copy)
        local v115 = false;
        v115 = v84.CurrentWaypointPlaneNormal == Vector3.new(0, 0, 0, 0) or v84.CurrentWaypointPlaneNormal:Dot(v84.CurrentHumanoidPosition) - v84.CurrentWaypointPlaneDistance < math.max(1, 0.0625 * -v84.CurrentWaypointPlaneNormal:Dot(v84.CurrentHumanoidVelocity));
        if v115 then
            v84.CurrentWaypointPosition = nil;
            v84.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0, 0);
            v84.CurrentWaypointPlaneDistance = 0;
        end;
        return v115;
    end;
    v84.OnPointReached = function(_, v117) --[[ Line: 493 ]] --[[ Name: OnPointReached ]]
        -- upvalues: v84 (copy)
        if v117 and not v84.Cancelled then
            if v84.setPointFunc then
                v84.setPointFunc(v84.CurrentPoint);
            end;
            local v118 = v84.CurrentPoint + 1;
            if #v84.pointList < v118 then
                if v84.stopTraverseFunc then
                    v84.stopTraverseFunc();
                end;
                v84.Finished:Fire();
                v84:Cleanup();
                return;
            else
                local v119 = v84.pointList[v84.CurrentPoint];
                local v120 = v84.pointList[v118];
                local l_State_0 = v84.Humanoid:GetState();
                local v122 = true;
                if l_State_0 ~= Enum.HumanoidStateType.FallingDown then
                    v122 = true;
                    if l_State_0 ~= Enum.HumanoidStateType.Freefall then
                        v122 = l_State_0 == Enum.HumanoidStateType.Jumping;
                    end;
                end;
                if v122 then
                    local v123 = v120.Action == Enum.PathWaypointAction.Jump;
                    if not v123 and v84.CurrentPoint > 1 then
                        local v124 = v84.pointList[v84.CurrentPoint - 1];
                        local v125 = v119.Position - v124.Position;
                        local v126 = v120.Position - v119.Position;
                        v123 = Vector2.new(v125.x, v125.z).Unit:Dot(Vector2.new(v126.x, v126.z).Unit) < 0.996;
                    end;
                    if v123 then
                        v84.Humanoid.FreeFalling:Wait();
                        wait(0.1);
                    end;
                end;
                v84:MoveToNextWayPoint(v119, v120, v118);
                return;
            end;
        else
            v84.PathFailed:Fire();
            v84:Cleanup();
            return;
        end;
    end;
    v84.MoveToNextWayPoint = function(_, v128, v129, v130) --[[ Line: 556 ]] --[[ Name: MoveToNextWayPoint ]]
        -- upvalues: v84 (copy), v5 (ref)
        v84.CurrentWaypointPlaneNormal = v128.Position - v129.Position;
        if not v5 or v129.Label ~= "Climb" then
            v84.CurrentWaypointPlaneNormal = Vector3.new(v84.CurrentWaypointPlaneNormal.X, 0, v84.CurrentWaypointPlaneNormal.Z);
        end;
        if v84.CurrentWaypointPlaneNormal.Magnitude > 1.0E-6 then
            v84.CurrentWaypointPlaneNormal = v84.CurrentWaypointPlaneNormal.Unit;
            v84.CurrentWaypointPlaneDistance = v84.CurrentWaypointPlaneNormal:Dot(v129.Position);
        else
            v84.CurrentWaypointPlaneNormal = Vector3.new(0, 0, 0, 0);
            v84.CurrentWaypointPlaneDistance = 0;
        end;
        v84.CurrentWaypointNeedsJump = v129.Action == Enum.PathWaypointAction.Jump;
        v84.CurrentWaypointPosition = v129.Position;
        v84.CurrentPoint = v130;
        v84.Timeout = 0;
    end;
    v84.Start = function(_, v132) --[[ Line: 588 ]] --[[ Name: Start ]]
        -- upvalues: v84 (copy), l_ClickToMoveDisplay_0 (ref), v14 (ref)
        if not v84.AgentCanFollowPath then
            v84.PathFailed:Fire();
            return;
        elseif v84.Started then
            return;
        else
            v84.Started = true;
            l_ClickToMoveDisplay_0.CancelFailureAnimation();
            if v14 and (v132 == nil or v132) then
                local l_v84_2 = v84;
                local l_v84_3 = v84;
                local v135, v136 = l_ClickToMoveDisplay_0.CreatePathDisplay(v84.pointList, v84.OriginalTargetPoint);
                l_v84_2.stopTraverseFunc = v135;
                l_v84_3.setPointFunc = v136;
            end;
            if #v84.pointList > 0 then
                v84.HumanoidOffsetFromPath = Vector3.new(0, v84.pointList[1].Position.Y - v84.OriginPoint.Y, 0);
                v84.CurrentHumanoidPosition = v84.Humanoid.RootPart.Position + v84.HumanoidOffsetFromPath;
                v84.CurrentHumanoidVelocity = v84.Humanoid.RootPart.Velocity;
                v84.SeatedConn = v84.Humanoid.Seated:Connect(function(_, _) --[[ Line: 615 ]]
                    -- upvalues: v84 (ref)
                    v84:OnPathInterrupted();
                end);
                v84.DiedConn = v84.Humanoid.Died:Connect(function() --[[ Line: 616 ]]
                    -- upvalues: v84 (ref)
                    v84:OnPathInterrupted();
                end);
                v84.TeleportedConn = v84.Humanoid.RootPart:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 617 ]]
                    -- upvalues: v84 (ref)
                    v84:OnPathInterrupted();
                end);
                v84.CurrentPoint = 1;
                v84:OnPointReached(true);
                return;
            else
                v84.PathFailed:Fire();
                if v84.stopTraverseFunc then
                    v84.stopTraverseFunc();
                end;
                return;
            end;
        end;
    end;
    l_l_LocalPlayer_0_0 = v84.TargetPoint + v84.TargetSurfaceNormal * 1.5;
    v88 = Ray.new(l_l_LocalPlayer_0_0, (Vector3.new(0, -50, 0, 0)));
    local l_l_Workspace_0_0 = l_Workspace_0;
    local l_v88_0 = v88;
    local v141;
    if v46 ~= nil then
        v141 = v46;
    else
        v46 = {};
        table.insert(v46, l_LocalPlayer_0 and l_LocalPlayer_0.Character);
        v141 = v46;
    end;
    local v142;
    l_l_Workspace_0_0, v142 = l_l_Workspace_0_0:FindPartOnRayWithIgnoreList(l_v88_0, v141);
    if l_l_Workspace_0_0 then
        v84.TargetPoint = v142;
    end;
    v84:ComputePath();
    return v84;
end;
local function _() --[[ Line: 644 ]] --[[ Name: CheckAlive ]]
    -- upvalues: l_LocalPlayer_0 (copy), v23 (copy)
    local l_l_LocalPlayer_0_1 = l_LocalPlayer_0;
    local v145 = l_l_LocalPlayer_0_1 and l_l_LocalPlayer_0_1.Character;
    local v146;
    if v145 then
        local v147 = v23[l_l_LocalPlayer_0_1];
        if v147 and v147.Parent == v145 then
            v146 = v147;
        else
            v23[l_l_LocalPlayer_0_1] = nil;
            local l_Humanoid_4 = v145:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_4 then
                v23[l_l_LocalPlayer_0_1] = l_Humanoid_4;
            end;
            v146 = l_Humanoid_4;
        end;
    else
        v146 = nil;
    end;
    l_l_LocalPlayer_0_1 = false;
    if v146 ~= nil then
        l_l_LocalPlayer_0_1 = v146.Health > 0;
    end;
    return l_l_LocalPlayer_0_1;
end;
local function v153(v150) --[[ Line: 649 ]] --[[ Name: GetEquippedTool ]]
    if v150 ~= nil then
        for _, v152 in pairs(v150:GetChildren()) do
            if v152:IsA("Tool") then
                return v152;
            end;
        end;
    end;
end;
local v154 = nil;
local v155 = nil;
local v156 = nil;
local function _() --[[ Line: 664 ]] --[[ Name: CleanupPath ]]
    -- upvalues: v154 (ref), v155 (ref), v156 (ref)
    if v154 then
        v154:Cancel();
        v154 = nil;
    end;
    if v155 then
        v155:Disconnect();
        v155 = nil;
    end;
    if v156 then
        v156:Disconnect();
        v156 = nil;
    end;
end;
local function v164(v158, v159, v160, v161, v162) --[[ Line: 682 ]] --[[ Name: HandleMoveTo ]]
    -- upvalues: v154 (ref), v155 (ref), v156 (ref), v153 (copy), v15 (ref), l_ClickToMoveDisplay_0 (copy)
    if v154 then
        if v154 then
            v154:Cancel();
            v154 = nil;
        end;
        if v155 then
            v155:Disconnect();
            v155 = nil;
        end;
        if v156 then
            v156:Disconnect();
            v156 = nil;
        end;
    end;
    v154 = v158;
    v158:Start(v162);
    v155 = v158.Finished.Event:Connect(function() --[[ Line: 689 ]]
        -- upvalues: v154 (ref), v155 (ref), v156 (ref), v160 (copy), v153 (ref), v161 (copy)
        if v154 then
            v154:Cancel();
            v154 = nil;
        end;
        if v155 then
            v155:Disconnect();
            v155 = nil;
        end;
        if v156 then
            v156:Disconnect();
            v156 = nil;
        end;
        if v160 then
            local v163 = v153(v161);
            if v163 then
                v163:Activate();
            end;
        end;
    end);
    v156 = v158.PathFailed.Event:Connect(function() --[[ Line: 698 ]]
        -- upvalues: v154 (ref), v155 (ref), v156 (ref), v162 (copy), v15 (ref), l_ClickToMoveDisplay_0 (ref), v159 (copy)
        if v154 then
            v154:Cancel();
            v154 = nil;
        end;
        if v155 then
            v155:Disconnect();
            v155 = nil;
        end;
        if v156 then
            v156:Disconnect();
            v156 = nil;
        end;
        if v162 == nil or v162 then
            if v15 and not (v154 and v154:IsActive()) then
                l_ClickToMoveDisplay_0.PlayFailureAnimation();
            end;
            l_ClickToMoveDisplay_0.DisplayFailureWaypoint(v159);
        end;
    end);
end;
local function _(v165) --[[ Line: 710 ]] --[[ Name: ShowPathFailedFeedback ]]
    -- upvalues: v154 (ref), v15 (ref), l_ClickToMoveDisplay_0 (copy)
    if v154 and v154:IsActive() then
        v154:Cancel();
    end;
    if v15 then
        l_ClickToMoveDisplay_0.PlayFailureAnimation();
    end;
    l_ClickToMoveDisplay_0.DisplayFailureWaypoint(v165);
end;
OnTap = function(v167, v168, v169) --[[ Line: 720 ]] --[[ Name: OnTap ]]
    -- upvalues: l_Workspace_0 (copy), l_LocalPlayer_0 (copy), v23 (copy), v22 (copy), v46 (ref), l_StarterGui_0 (copy), l_Players_0 (copy), v154 (ref), v155 (ref), v156 (ref), v143 (copy), v164 (copy), v15 (ref), l_ClickToMoveDisplay_0 (copy), v153 (copy)
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_l_LocalPlayer_0_2 = l_LocalPlayer_0;
    local v173 = l_l_LocalPlayer_0_2 and l_l_LocalPlayer_0_2.Character;
    local v174;
    if v173 then
        local v175 = v23[l_l_LocalPlayer_0_2];
        if v175 and v175.Parent == v173 then
            v174 = v175;
        else
            v23[l_l_LocalPlayer_0_2] = nil;
            local l_Humanoid_5 = v173:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_5 then
                v23[l_l_LocalPlayer_0_2] = l_Humanoid_5;
            end;
            v174 = l_Humanoid_5;
        end;
    else
        v174 = nil;
    end;
    local v177 = false;
    if v174 ~= nil then
        v177 = v174.Health > 0;
    end;
    if not v177 then
        return;
    else
        if #v167 == 1 or v168 then
            if l_CurrentCamera_0 then
                v177 = l_CurrentCamera_0:ScreenPointToRay(v167[1].X, v167[1].Y);
                v174 = Ray.new(v177.Origin, v177.Direction * 1000);
                v173 = l_LocalPlayer_0;
                local v178 = v173 and v173.Character;
                if v178 then
                    local v179 = v23[v173];
                    if v179 and v179.Parent == v178 then
                        l_l_LocalPlayer_0_2 = v179;
                    else
                        v23[v173] = nil;
                        local l_Humanoid_6 = v178:FindFirstChildOfClass("Humanoid");
                        if l_Humanoid_6 then
                            v23[v173] = l_Humanoid_6;
                        end;
                        l_l_LocalPlayer_0_2 = l_Humanoid_6;
                    end;
                else
                    l_l_LocalPlayer_0_2 = nil;
                end;
                v173 = v22.Raycast;
                v178 = v174;
                local v181 = true;
                local v182;
                if v46 ~= nil then
                    v182 = v46;
                else
                    v46 = {};
                    table.insert(v46, l_LocalPlayer_0 and l_LocalPlayer_0.Character);
                    v182 = v46;
                end;
                v173, v178, v181 = v173(v178, v181, v182);
                local v183;
                v182, v183 = v22.FindCharacterAncestor(v173);
                if v169 and v183 and l_StarterGui_0:GetCore("AvatarContextMenuEnabled") and l_Players_0:GetPlayerFromCharacter(v183.Parent) then
                    if v154 then
                        v154:Cancel();
                        v154 = nil;
                    end;
                    if v155 then
                        v155:Disconnect();
                        v155 = nil;
                    end;
                    if v156 then
                        v156:Disconnect();
                        v156 = nil;
                    end;
                    return;
                else
                    if v168 then
                        v178 = v168;
                        v182 = nil;
                    end;
                    if v178 and l_Character_0 then
                        if v154 then
                            v154:Cancel();
                            v154 = nil;
                        end;
                        if v155 then
                            v155:Disconnect();
                            v155 = nil;
                        end;
                        if v156 then
                            v156:Disconnect();
                            v156 = nil;
                        end;
                        local v184 = v143(v178, v181);
                        if v184:IsValidPath() then
                            v164(v184, v178, v182, l_Character_0);
                            return;
                        else
                            v184:Cleanup();
                            local l_v178_0 = v178;
                            if v154 and v154:IsActive() then
                                v154:Cancel();
                            end;
                            if v15 then
                                l_ClickToMoveDisplay_0.PlayFailureAnimation();
                            end;
                            l_ClickToMoveDisplay_0.DisplayFailureWaypoint(l_v178_0);
                            return;
                        end;
                    end;
                end;
            end;
        elseif #v167 >= 2 and l_CurrentCamera_0 then
            v177 = v153(l_Character_0);
            if v177 then
                v177:Activate();
            end;
        end;
        return;
    end;
end;
local function _(v186) --[[ Line: 773 ]] --[[ Name: DisconnectEvent ]]
    if v186 then
        v186:Disconnect();
    end;
end;
local l_Keyboard_0 = require(script.Parent:WaitForChild("Keyboard"));
local v189 = setmetatable({}, l_Keyboard_0);
v189.__index = v189;
v189.new = function(v190) --[[ Line: 784 ]] --[[ Name: new ]]
    -- upvalues: l_Keyboard_0 (copy), v189 (copy)
    local v191 = setmetatable(l_Keyboard_0.new(v190), v189);
    v191.fingerTouches = {};
    v191.numUnsunkTouches = 0;
    v191.mouse1Down = tick();
    v191.mouse1DownPos = Vector2.new();
    v191.mouse2DownTime = tick();
    v191.mouse2DownPos = Vector2.new();
    v191.mouse2UpTime = tick();
    v191.keyboardMoveVector = Vector3.new(0, 0, 0, 0);
    v191.tapConn = nil;
    v191.inputBeganConn = nil;
    v191.inputChangedConn = nil;
    v191.inputEndedConn = nil;
    v191.humanoidDiedConn = nil;
    v191.characterChildAddedConn = nil;
    v191.onCharacterAddedConn = nil;
    v191.characterChildRemovedConn = nil;
    v191.renderSteppedConn = nil;
    v191.menuOpenedConnection = nil;
    v191.running = false;
    v191.wasdEnabled = false;
    return v191;
end;
v189.DisconnectEvents = function(v192) --[[ Line: 816 ]] --[[ Name: DisconnectEvents ]]
    local l_tapConn_0 = v192.tapConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v192.inputBeganConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v192.inputChangedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v192.inputEndedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v192.humanoidDiedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v192.characterChildAddedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v192.onCharacterAddedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v192.renderSteppedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v192.characterChildRemovedConn;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
    l_tapConn_0 = v192.menuOpenedConnection;
    if l_tapConn_0 then
        l_tapConn_0:Disconnect();
    end;
end;
v189.OnTouchBegan = function(v194, v195, v196) --[[ Line: 829 ]] --[[ Name: OnTouchBegan ]]
    if v194.fingerTouches[v195] == nil and not v196 then
        v194.numUnsunkTouches = v194.numUnsunkTouches + 1;
    end;
    v194.fingerTouches[v195] = v196;
end;
v189.OnTouchChanged = function(v197, v198, v199) --[[ Line: 836 ]] --[[ Name: OnTouchChanged ]]
    if v197.fingerTouches[v198] == nil then
        v197.fingerTouches[v198] = v199;
        if not v199 then
            v197.numUnsunkTouches = v197.numUnsunkTouches + 1;
        end;
    end;
end;
v189.OnTouchEnded = function(v200, v201, _) --[[ Line: 845 ]] --[[ Name: OnTouchEnded ]]
    if v200.fingerTouches[v201] ~= nil and v200.fingerTouches[v201] == false then
        v200.numUnsunkTouches = v200.numUnsunkTouches - 1;
    end;
    v200.fingerTouches[v201] = nil;
end;
v189.OnCharacterAdded = function(v203, v204) --[[ Line: 853 ]] --[[ Name: OnCharacterAdded ]]
    -- upvalues: l_UserInputService_0 (copy), v19 (copy), v154 (ref), v155 (ref), v156 (ref), l_ClickToMoveDisplay_0 (copy), l_GuiService_0 (copy)
    v203:DisconnectEvents();
    v203.inputBeganConn = l_UserInputService_0.InputBegan:Connect(function(v205, v206) --[[ Line: 856 ]]
        -- upvalues: v203 (copy), v19 (ref), v154 (ref), v155 (ref), v156 (ref), l_ClickToMoveDisplay_0 (ref)
        if v205.UserInputType == Enum.UserInputType.Touch then
            v203:OnTouchBegan(v205, v206);
        end;
        if v203.wasdEnabled and v206 == false and v205.UserInputType == Enum.UserInputType.Keyboard and v19[v205.KeyCode] then
            if v154 then
                v154:Cancel();
                v154 = nil;
            end;
            if v155 then
                v155:Disconnect();
                v155 = nil;
            end;
            if v156 then
                v156:Disconnect();
                v156 = nil;
            end;
            l_ClickToMoveDisplay_0.CancelFailureAnimation();
        end;
        if v205.UserInputType == Enum.UserInputType.MouseButton1 then
            v203.mouse1DownTime = tick();
            v203.mouse1DownPos = v205.Position;
        end;
        if v205.UserInputType == Enum.UserInputType.MouseButton2 then
            v203.mouse2DownTime = tick();
            v203.mouse2DownPos = v205.Position;
        end;
    end);
    v203.inputChangedConn = l_UserInputService_0.InputChanged:Connect(function(v207, v208) --[[ Line: 877 ]]
        -- upvalues: v203 (copy)
        if v207.UserInputType == Enum.UserInputType.Touch then
            v203:OnTouchChanged(v207, v208);
        end;
    end);
    v203.inputEndedConn = l_UserInputService_0.InputEnded:Connect(function(v209, v210) --[[ Line: 883 ]]
        -- upvalues: v203 (copy), v154 (ref)
        if v209.UserInputType == Enum.UserInputType.Touch then
            v203:OnTouchEnded(v209, v210);
        end;
        if v209.UserInputType == Enum.UserInputType.MouseButton2 then
            v203.mouse2UpTime = tick();
            local l_Position_0 = v209.Position;
            local v212 = v154 or v203.keyboardMoveVector.Magnitude <= 0;
            if v203.mouse2UpTime - v203.mouse2DownTime < 0.25 and (l_Position_0 - v203.mouse2DownPos).magnitude < 5 and v212 then
                OnTap({
                    l_Position_0
                });
            end;
        end;
    end);
    v203.tapConn = l_UserInputService_0.TouchTap:Connect(function(v213, v214) --[[ Line: 900 ]]
        if not v214 then
            OnTap(v213, nil, true);
        end;
    end);
    v203.menuOpenedConnection = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 906 ]]
        -- upvalues: v154 (ref), v155 (ref), v156 (ref)
        if v154 then
            v154:Cancel();
            v154 = nil;
        end;
        if v155 then
            v155:Disconnect();
            v155 = nil;
        end;
        if v156 then
            v156:Disconnect();
            v156 = nil;
        end;
    end);
    local function v217(v215) --[[ Line: 910 ]] --[[ Name: OnCharacterChildAdded ]]
        -- upvalues: l_UserInputService_0 (ref), v203 (copy)
        if l_UserInputService_0.TouchEnabled and v215:IsA("Tool") then
            v215.ManualActivationOnly = true;
        end;
        if v215:IsA("Humanoid") then
            local l_humanoidDiedConn_0 = v203.humanoidDiedConn;
            if l_humanoidDiedConn_0 then
                l_humanoidDiedConn_0:Disconnect();
            end;
            v203.humanoidDiedConn = v215.Died:Connect(function() --[[ Line: 918 ]]

            end);
        end;
    end;
    v203.characterChildAddedConn = v204.ChildAdded:Connect(function(v218) --[[ Line: 926 ]]
        -- upvalues: v217 (copy)
        v217(v218);
    end);
    v203.characterChildRemovedConn = v204.ChildRemoved:Connect(function(v219) --[[ Line: 929 ]]
        -- upvalues: l_UserInputService_0 (ref)
        if l_UserInputService_0.TouchEnabled and v219:IsA("Tool") then
            v219.ManualActivationOnly = false;
        end;
    end);
    for _, v221 in pairs(v204:GetChildren()) do
        v217(v221);
    end;
end;
v189.Start = function(v222) --[[ Line: 941 ]] --[[ Name: Start ]]
    v222:Enable(true);
end;
v189.Stop = function(v223) --[[ Line: 945 ]] --[[ Name: Stop ]]
    v223:Enable(false);
end;
v189.CleanupPath = function(_) --[[ Line: 949 ]] --[[ Name: CleanupPath ]]
    -- upvalues: v154 (ref), v155 (ref), v156 (ref)
    if v154 then
        v154:Cancel();
        v154 = nil;
    end;
    if v155 then
        v155:Disconnect();
        v155 = nil;
    end;
    if v156 then
        v156:Disconnect();
        v156 = nil;
    end;
end;
v189.Enable = function(v225, v226, v227, v228) --[[ Line: 953 ]] --[[ Name: Enable ]]
    -- upvalues: l_LocalPlayer_0 (copy), v154 (ref), v155 (ref), v156 (ref), l_UserInputService_0 (copy)
    if v226 then
        if not v225.running then
            if l_LocalPlayer_0.Character then
                v225:OnCharacterAdded(l_LocalPlayer_0.Character);
            end;
            v225.onCharacterAddedConn = l_LocalPlayer_0.CharacterAdded:Connect(function(v229) --[[ Line: 959 ]]
                -- upvalues: v225 (copy)
                v225:OnCharacterAdded(v229);
            end);
            v225.running = true;
        end;
        v225.touchJumpController = v228;
        if v225.touchJumpController then
            v225.touchJumpController:Enable(v225.jumpEnabled);
        end;
    else
        if v225.running then
            v225:DisconnectEvents();
            if v154 then
                v154:Cancel();
                v154 = nil;
            end;
            if v155 then
                v155:Disconnect();
                v155 = nil;
            end;
            if v156 then
                v156:Disconnect();
                v156 = nil;
            end;
            if l_UserInputService_0.TouchEnabled then
                local l_Character_1 = l_LocalPlayer_0.Character;
                if l_Character_1 then
                    for _, v232 in pairs(l_Character_1:GetChildren()) do
                        if v232:IsA("Tool") then
                            v232.ManualActivationOnly = false;
                        end;
                    end;
                end;
            end;
            v225.running = false;
        end;
        if v225.touchJumpController and not v225.jumpEnabled then
            v225.touchJumpController:Enable(true);
        end;
        v225.touchJumpController = nil;
    end;
    if l_UserInputService_0.KeyboardEnabled and v226 ~= v225.enabled then
        v225.forwardValue = 0;
        v225.backwardValue = 0;
        v225.leftValue = 0;
        v225.rightValue = 0;
        v225.moveVector = Vector3.new(0, 0, 0, 0);
        if v226 then
            v225:BindContextActions();
            v225:ConnectFocusEventListeners();
        else
            v225:UnbindContextActions();
            v225:DisconnectFocusEventListeners();
        end;
    end;
    v225.wasdEnabled = v226 and v227 or false;
    v225.enabled = v226;
end;
v189.OnRenderStepped = function(v233, v234) --[[ Line: 1014 ]] --[[ Name: OnRenderStepped ]]
    -- upvalues: v154 (ref)
    v233.isJumping = false;
    if v154 then
        v154:OnRenderStepped(v234);
        if v154 then
            v233.moveVector = v154.NextActionMoveDirection;
            v233.moveVectorIsCameraRelative = false;
            if v154.NextActionJump then
                v233.isJumping = true;
            end;
        else
            v233.moveVector = v233.keyboardMoveVector;
            v233.moveVectorIsCameraRelative = true;
        end;
    else
        v233.moveVector = v233.keyboardMoveVector;
        v233.moveVectorIsCameraRelative = true;
    end;
    if v233.jumpRequested then
        v233.isJumping = true;
    end;
end;
v189.UpdateMovement = function(v235, v236) --[[ Line: 1049 ]] --[[ Name: UpdateMovement ]]
    if v236 == Enum.UserInputState.Cancel then
        v235.keyboardMoveVector = Vector3.new(0, 0, 0, 0);
        return;
    else
        if v235.wasdEnabled then
            v235.keyboardMoveVector = Vector3.new(v235.leftValue + v235.rightValue, 0, v235.forwardValue + v235.backwardValue);
        end;
        return;
    end;
end;
v189.UpdateJump = function(_) --[[ Line: 1058 ]] --[[ Name: UpdateJump ]]

end;
v189.SetShowPath = function(_, v239) --[[ Line: 1063 ]] --[[ Name: SetShowPath ]]
    -- upvalues: v14 (ref)
    v14 = v239;
end;
v189.GetShowPath = function(_) --[[ Line: 1067 ]] --[[ Name: GetShowPath ]]
    -- upvalues: v14 (ref)
    return v14;
end;
v189.SetWaypointTexture = function(_, v242) --[[ Line: 1071 ]] --[[ Name: SetWaypointTexture ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    l_ClickToMoveDisplay_0.SetWaypointTexture(v242);
end;
v189.GetWaypointTexture = function(_) --[[ Line: 1075 ]] --[[ Name: GetWaypointTexture ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    return l_ClickToMoveDisplay_0.GetWaypointTexture();
end;
v189.SetWaypointRadius = function(_, v245) --[[ Line: 1079 ]] --[[ Name: SetWaypointRadius ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    l_ClickToMoveDisplay_0.SetWaypointRadius(v245);
end;
v189.GetWaypointRadius = function(_) --[[ Line: 1083 ]] --[[ Name: GetWaypointRadius ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    return l_ClickToMoveDisplay_0.GetWaypointRadius();
end;
v189.SetEndWaypointTexture = function(_, v248) --[[ Line: 1087 ]] --[[ Name: SetEndWaypointTexture ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    l_ClickToMoveDisplay_0.SetEndWaypointTexture(v248);
end;
v189.GetEndWaypointTexture = function(_) --[[ Line: 1091 ]] --[[ Name: GetEndWaypointTexture ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    return l_ClickToMoveDisplay_0.GetEndWaypointTexture();
end;
v189.SetWaypointsAlwaysOnTop = function(_, v251) --[[ Line: 1095 ]] --[[ Name: SetWaypointsAlwaysOnTop ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    l_ClickToMoveDisplay_0.SetWaypointsAlwaysOnTop(v251);
end;
v189.GetWaypointsAlwaysOnTop = function(_) --[[ Line: 1099 ]] --[[ Name: GetWaypointsAlwaysOnTop ]]
    -- upvalues: l_ClickToMoveDisplay_0 (copy)
    return l_ClickToMoveDisplay_0.GetWaypointsAlwaysOnTop();
end;
v189.SetFailureAnimationEnabled = function(_, v254) --[[ Line: 1103 ]] --[[ Name: SetFailureAnimationEnabled ]]
    -- upvalues: v15 (ref)
    v15 = v254;
end;
v189.GetFailureAnimationEnabled = function(_) --[[ Line: 1107 ]] --[[ Name: GetFailureAnimationEnabled ]]
    -- upvalues: v15 (ref)
    return v15;
end;
v189.SetIgnoredPartsTag = function(_, v257) --[[ Line: 1111 ]] --[[ Name: SetIgnoredPartsTag ]]
    -- upvalues: v58 (copy)
    v58(v257);
end;
v189.GetIgnoredPartsTag = function(_) --[[ Line: 1115 ]] --[[ Name: GetIgnoredPartsTag ]]
    -- upvalues: v47 (ref)
    return v47;
end;
v189.SetUseDirectPath = function(_, v260) --[[ Line: 1119 ]] --[[ Name: SetUseDirectPath ]]
    -- upvalues: v16 (ref)
    v16 = v260;
end;
v189.GetUseDirectPath = function(_) --[[ Line: 1123 ]] --[[ Name: GetUseDirectPath ]]
    -- upvalues: v16 (ref)
    return v16;
end;
v189.SetAgentSizeIncreaseFactor = function(_, v263) --[[ Line: 1127 ]] --[[ Name: SetAgentSizeIncreaseFactor ]]
    -- upvalues: v17 (ref)
    v17 = v263 / 100 + 1;
end;
v189.GetAgentSizeIncreaseFactor = function(_) --[[ Line: 1131 ]] --[[ Name: GetAgentSizeIncreaseFactor ]]
    -- upvalues: v17 (ref)
    return (v17 - 1) * 100;
end;
v189.SetUnreachableWaypointTimeout = function(_, v266) --[[ Line: 1135 ]] --[[ Name: SetUnreachableWaypointTimeout ]]
    -- upvalues: v18 (ref)
    v18 = v266;
end;
v189.GetUnreachableWaypointTimeout = function(_) --[[ Line: 1139 ]] --[[ Name: GetUnreachableWaypointTimeout ]]
    -- upvalues: v18 (ref)
    return v18;
end;
v189.SetUserJumpEnabled = function(v268, v269) --[[ Line: 1143 ]] --[[ Name: SetUserJumpEnabled ]]
    v268.jumpEnabled = v269;
    if v268.touchJumpController then
        v268.touchJumpController:Enable(v269);
    end;
end;
v189.GetUserJumpEnabled = function(v270) --[[ Line: 1150 ]] --[[ Name: GetUserJumpEnabled ]]
    return v270.jumpEnabled;
end;
v189.MoveTo = function(_, v272, v273, v274) --[[ Line: 1154 ]] --[[ Name: MoveTo ]]
    -- upvalues: l_LocalPlayer_0 (copy), v143 (copy), v164 (copy)
    local l_Character_2 = l_LocalPlayer_0.Character;
    if l_Character_2 == nil then
        return false;
    else
        local v276 = v143(v272, Vector3.new(0, 1, 0, 0), v274);
        if v276 and v276:IsValidPath() then
            v164(v276, v272, nil, l_Character_2, v273);
            return true;
        else
            return false;
        end;
    end;
end;
return v189;