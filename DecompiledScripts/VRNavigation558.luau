local l_VRService_0 = game:GetService("VRService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_PathfindingService_0 = game:GetService("PathfindingService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_StarterGui_0 = game:GetService("StarterGui");
local v7 = nil;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local function _(v9) --[[ Line: 33 ]] --[[ Name: IsFinite ]]
    local v10 = false;
    if v9 == v9 then
        v10 = false;
        if v9 ~= 1e999 then
            v10 = v9 ~= -1e999;
        end;
    end;
    return v10;
end;
local function _(v12) --[[ Line: 37 ]] --[[ Name: IsFiniteVector3 ]]
    local l_x_0 = v12.x;
    local v14 = false;
    if l_x_0 == l_x_0 then
        v14 = false;
        if l_x_0 ~= 1e999 then
            v14 = l_x_0 ~= -1e999;
        end;
    end;
    if v14 then
        l_x_0 = v12.y;
        v14 = false;
        if l_x_0 == l_x_0 then
            v14 = false;
            if l_x_0 ~= 1e999 then
                v14 = l_x_0 ~= -1e999;
            end;
        end;
        if v14 then
            l_x_0 = v12.z;
            v14 = false;
            if l_x_0 == l_x_0 then
                v14 = false;
                if l_x_0 ~= 1e999 then
                    v14 = l_x_0 ~= -1e999;
                end;
            end;
        end;
    end;
    return v14;
end;
local l_BindableEvent_0 = Instance.new("BindableEvent");
l_BindableEvent_0.Name = "MovementUpdate";
l_BindableEvent_0.Parent = script;
coroutine.wrap(function() --[[ Line: 45 ]]
    -- upvalues: v7 (ref)
    local l_PathDisplay_0 = script.Parent:WaitForChild("PathDisplay");
    if l_PathDisplay_0 then
        v7 = require(l_PathDisplay_0);
    end;
end)();
local l_BaseCharacterController_0 = require(script.Parent:WaitForChild("BaseCharacterController"));
local v19 = setmetatable({}, l_BaseCharacterController_0);
v19.__index = v19;
v19.new = function(v20) --[[ Line: 58 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCharacterController_0 (copy), v19 (copy)
    local v21 = setmetatable(l_BaseCharacterController_0.new(), v19);
    v21.CONTROL_ACTION_PRIORITY = v20;
    v21.navigationRequestedConn = nil;
    v21.heartbeatConn = nil;
    v21.currentDestination = nil;
    v21.currentPath = nil;
    v21.currentPoints = nil;
    v21.currentPointIdx = 0;
    v21.expectedTimeToNextPoint = 0;
    v21.timeReachedLastPoint = tick();
    v21.moving = false;
    v21.isJumpBound = false;
    v21.moveLatch = false;
    v21.userCFrameEnabledConn = nil;
    return v21;
end;
v19.SetLaserPointerMode = function(_, v23) --[[ Line: 83 ]] --[[ Name: SetLaserPointerMode ]]
    -- upvalues: l_StarterGui_0 (copy)
    pcall(function() --[[ Line: 84 ]]
        -- upvalues: l_StarterGui_0 (ref), v23 (copy)
        l_StarterGui_0:SetCore("VRLaserPointerMode", v23);
    end);
end;
v19.GetLocalHumanoid = function(_) --[[ Line: 89 ]] --[[ Name: GetLocalHumanoid ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        return;
    else
        for _, v27 in pairs(l_Character_0:GetChildren()) do
            if v27:IsA("Humanoid") then
                return v27;
            end;
        end;
        return nil;
    end;
end;
v19.HasBothHandControllers = function(_) --[[ Line: 103 ]] --[[ Name: HasBothHandControllers ]]
    -- upvalues: l_VRService_0 (copy)
    return l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand);
end;
v19.HasAnyHandControllers = function(_) --[[ Line: 107 ]] --[[ Name: HasAnyHandControllers ]]
    -- upvalues: l_VRService_0 (copy)
    return l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand);
end;
v19.IsMobileVR = function(_) --[[ Line: 111 ]] --[[ Name: IsMobileVR ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0.TouchEnabled;
end;
v19.HasGamepad = function(_) --[[ Line: 115 ]] --[[ Name: HasGamepad ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0.GamepadEnabled;
end;
v19.ShouldUseNavigationLaser = function(v32) --[[ Line: 119 ]] --[[ Name: ShouldUseNavigationLaser ]]
    if v32:IsMobileVR() then
        return true;
    elseif v32:HasBothHandControllers() then
        return false;
    elseif not v32:HasAnyHandControllers() then
        return not v32:HasGamepad();
    else
        return true;
    end;
end;
v19.StartFollowingPath = function(v33, v34) --[[ Line: 141 ]] --[[ Name: StartFollowingPath ]]
    -- upvalues: l_BindableEvent_0 (copy)
    currentPath = v34;
    currentPoints = currentPath:GetPointCoordinates();
    currentPointIdx = 1;
    moving = true;
    timeReachedLastPoint = tick();
    local l_v33_LocalHumanoid_0 = v33:GetLocalHumanoid();
    if l_v33_LocalHumanoid_0 and l_v33_LocalHumanoid_0.Torso and #currentPoints >= 1 then
        expectedTimeToNextPoint = (currentPoints[1] - l_v33_LocalHumanoid_0.Torso.Position).magnitude / l_v33_LocalHumanoid_0.WalkSpeed;
    end;
    l_BindableEvent_0:Fire("targetPoint", v33.currentDestination);
end;
v19.GoToPoint = function(v36, v37) --[[ Line: 158 ]] --[[ Name: GoToPoint ]]
    -- upvalues: l_BindableEvent_0 (copy)
    currentPath = true;
    currentPoints = {
        v37
    };
    currentPointIdx = 1;
    moving = true;
    local l_v36_LocalHumanoid_0 = v36:GetLocalHumanoid();
    local v39 = (l_v36_LocalHumanoid_0.Torso.Position - v37).magnitude / l_v36_LocalHumanoid_0.WalkSpeed;
    timeReachedLastPoint = tick();
    expectedTimeToNextPoint = v39;
    l_BindableEvent_0:Fire("targetPoint", v37);
end;
v19.StopFollowingPath = function(v40) --[[ Line: 174 ]] --[[ Name: StopFollowingPath ]]
    currentPath = nil;
    currentPoints = nil;
    currentPointIdx = 0;
    moving = false;
    v40.moveVector = Vector3.new(0, 0, 0, 0);
end;
v19.TryComputePath = function(_, v42, v43) --[[ Line: 182 ]] --[[ Name: TryComputePath ]]
    -- upvalues: l_PathfindingService_0 (copy)
    local v44 = 0;
    local v45 = nil;
    while true do
        if not v45 and v44 < 5 then
            v45 = l_PathfindingService_0:ComputeSmoothPathAsync(v42, v43, 200);
            v44 = v44 + 1;
            if v45.Status == Enum.PathStatus.ClosestNoPath or v45.Status == Enum.PathStatus.ClosestOutOfRange then
                return nil;
            else
                if v45 and v45.Status == Enum.PathStatus.FailStartNotEmpty then
                    v42 = v42 + (v43 - v42).Unit;
                    v45 = nil;
                end;
                if v45 and v45.Status == Enum.PathStatus.FailFinishNotEmpty then
                    v43 = v43 + Vector3.new(0, 1, 0, 0);
                    v45 = nil;
                end;
            end;
        else
            return v45;
        end;
    end;
end;
v19.OnNavigationRequest = function(v46, v47, _) --[[ Line: 209 ]] --[[ Name: OnNavigationRequest ]]
    -- upvalues: v7 (ref)
    local l_Position_0 = v47.Position;
    local l_currentDestination_0 = v46.currentDestination;
    local l_x_1 = l_Position_0.x;
    local v52 = false;
    if l_x_1 == l_x_1 then
        v52 = false;
        if l_x_1 ~= 1e999 then
            v52 = l_x_1 ~= -1e999;
        end;
    end;
    if v52 then
        l_x_1 = l_Position_0.y;
        v52 = false;
        if l_x_1 == l_x_1 then
            v52 = false;
            if l_x_1 ~= 1e999 then
                v52 = l_x_1 ~= -1e999;
            end;
        end;
        if v52 then
            l_x_1 = l_Position_0.z;
            v52 = false;
            if l_x_1 == l_x_1 then
                v52 = false;
                if l_x_1 ~= 1e999 then
                    v52 = l_x_1 ~= -1e999;
                end;
            end;
        end;
    end;
    if not v52 then
        return;
    else
        v46.currentDestination = l_Position_0;
        v52 = v46:GetLocalHumanoid();
        if not v52 or not v52.Torso then
            return;
        else
            l_x_1 = v52.Torso.Position;
            if (v46.currentDestination - l_x_1).magnitude < 12 then
                v46:GoToPoint(v46.currentDestination);
                return;
            else
                if not l_currentDestination_0 or (v46.currentDestination - l_currentDestination_0).magnitude > 4 then
                    local v53 = v46:TryComputePath(l_x_1, v46.currentDestination);
                    if v53 then
                        v46:StartFollowingPath(v53);
                        if v7 then
                            v7.setCurrentPoints(v46.currentPoints);
                            v7.renderPath();
                            return;
                        end;
                    else
                        v46:StopFollowingPath();
                        if v7 then
                            v7.clearRenderedPath();
                            return;
                        end;
                    end;
                elseif moving then
                    v46.currentPoints[#currentPoints] = v46.currentDestination;
                    return;
                else
                    v46:GoToPoint(v46.currentDestination);
                end;
                return;
            end;
        end;
    end;
end;
v19.OnJumpAction = function(v54, _, v56, _) --[[ Line: 255 ]] --[[ Name: OnJumpAction ]]
    if v56 == Enum.UserInputState.Begin then
        v54.isJumping = true;
    end;
    return Enum.ContextActionResult.Sink;
end;
v19.BindJumpAction = function(v58, v59) --[[ Line: 261 ]] --[[ Name: BindJumpAction ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v59 then
        if not v58.isJumpBound then
            v58.isJumpBound = true;
            l_ContextActionService_0:BindActionAtPriority("VRJumpAction", function() --[[ Line: 265 ]]
                -- upvalues: v58 (copy)
                return v58:OnJumpAction();
            end, false, v58.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA);
            return;
        end;
    elseif v58.isJumpBound then
        v58.isJumpBound = false;
        l_ContextActionService_0:UnbindAction("VRJumpAction");
    end;
end;
v19.ControlCharacterGamepad = function(v60, _, v62, v63) --[[ Line: 276 ]] --[[ Name: ControlCharacterGamepad ]]
    -- upvalues: v7 (ref), l_BindableEvent_0 (copy)
    if v63.KeyCode ~= Enum.KeyCode.Thumbstick1 then
        return;
    elseif v62 == Enum.UserInputState.Cancel then
        v60.moveVector = Vector3.new(0, 0, 0, 0);
        return;
    else
        if v62 ~= Enum.UserInputState.End then
            v60:StopFollowingPath();
            if v7 then
                v7.clearRenderedPath();
            end;
            if v60:ShouldUseNavigationLaser() then
                v60:BindJumpAction(true);
                v60:SetLaserPointerMode("Hidden");
            end;
            if v63.Position.magnitude > 0.22 then
                v60.moveVector = Vector3.new(v63.Position.X, 0, -v63.Position.Y);
                if v60.moveVector.magnitude > 0 then
                    v60.moveVector = v60.moveVector.unit * math.min(1, v63.Position.magnitude);
                end;
                v60.moveLatch = true;
            end;
        else
            v60.moveVector = Vector3.new(0, 0, 0, 0);
            if v60:ShouldUseNavigationLaser() then
                v60:BindJumpAction(false);
                v60:SetLaserPointerMode("Navigation");
            end;
            if v60.moveLatch then
                v60.moveLatch = false;
                l_BindableEvent_0:Fire("offtrack");
            end;
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
v19.OnHeartbeat = function(v64, v65) --[[ Line: 319 ]] --[[ Name: OnHeartbeat ]]
    -- upvalues: v7 (ref), l_BindableEvent_0 (copy)
    local l_moveVector_0 = v64.moveVector;
    local l_v64_LocalHumanoid_0 = v64:GetLocalHumanoid();
    if not l_v64_LocalHumanoid_0 or not l_v64_LocalHumanoid_0.Torso then
        return;
    else
        if v64.moving and v64.currentPoints then
            local l_Position_1 = l_v64_LocalHumanoid_0.Torso.Position;
            local v69 = (currentPoints[1] - l_Position_1) * Vector3.new(1, 0, 1, 0);
            local l_magnitude_0 = v69.magnitude;
            local v71 = v69 / l_magnitude_0;
            if l_magnitude_0 < 1 then
                local v72 = 0;
                local v73 = currentPoints[1];
                for v74, v75 in pairs(currentPoints) do
                    if v74 ~= 1 then
                        local l_magnitude_1 = (v75 - v73).magnitude;
                        v73 = v75;
                        v72 = v72 + l_magnitude_1 / l_v64_LocalHumanoid_0.WalkSpeed;
                    end;
                end;
                table.remove(currentPoints, 1);
                currentPointIdx = currentPointIdx + 1;
                if #currentPoints == 0 then
                    v64:StopFollowingPath();
                    if v7 then
                        v7.clearRenderedPath();
                    end;
                    return;
                else
                    if v7 then
                        v7.setCurrentPoints(currentPoints);
                        v7.renderPath();
                    end;
                    expectedTimeToNextPoint = (currentPoints[1] - l_Position_1).magnitude / l_v64_LocalHumanoid_0.WalkSpeed;
                    timeReachedLastPoint = tick();
                end;
            else
                local v77 = {
                    game.Players.LocalPlayer.Character, 
                    workspace.CurrentCamera
                };
                local v78 = Ray.new(l_Position_1 - Vector3.new(0, 1, 0, 0), v71 * 3);
                local l_workspace_PartOnRayWithIgnoreList_0, v80, _ = workspace:FindPartOnRayWithIgnoreList(v78, v77);
                if l_workspace_PartOnRayWithIgnoreList_0 then
                    local v82 = Ray.new(v80 + v71 * 0.5 + Vector3.new(0, 100, 0, 0), (Vector3.new(-0, -100, -0, -0)));
                    local _, v84, _ = workspace:FindPartOnRayWithIgnoreList(v82, v77);
                    local v86 = v84.Y - l_Position_1.Y;
                    if v86 < 6 and v86 > -2 then
                        l_v64_LocalHumanoid_0.Jump = true;
                    end;
                end;
                if tick() - timeReachedLastPoint > expectedTimeToNextPoint + 2 then
                    v64:StopFollowingPath();
                    if v7 then
                        v7.clearRenderedPath();
                    end;
                    l_BindableEvent_0:Fire("offtrack");
                end;
                l_moveVector_0 = v64.moveVector:Lerp(v71, v65 * 10);
            end;
        end;
        local l_l_moveVector_0_0 = l_moveVector_0;
        local l_x_2 = l_l_moveVector_0_0.x;
        local v89 = false;
        if l_x_2 == l_x_2 then
            v89 = false;
            if l_x_2 ~= 1e999 then
                v89 = l_x_2 ~= -1e999;
            end;
        end;
        if v89 then
            l_x_2 = l_l_moveVector_0_0.y;
            v89 = false;
            if l_x_2 == l_x_2 then
                v89 = false;
                if l_x_2 ~= 1e999 then
                    v89 = l_x_2 ~= -1e999;
                end;
            end;
            if v89 then
                l_x_2 = l_l_moveVector_0_0.z;
                v89 = false;
                if l_x_2 == l_x_2 then
                    v89 = false;
                    if l_x_2 ~= 1e999 then
                        v89 = l_x_2 ~= -1e999;
                    end;
                end;
            end;
        end;
        if v89 then
            v64.moveVector = l_moveVector_0;
        end;
        return;
    end;
end;
v19.OnUserCFrameEnabled = function(v90) --[[ Line: 403 ]] --[[ Name: OnUserCFrameEnabled ]]
    if v90:ShouldUseNavigationLaser() then
        v90:BindJumpAction(false);
        v90:SetLaserPointerMode("Navigation");
        return;
    else
        v90:BindJumpAction(true);
        v90:SetLaserPointerMode("Hidden");
        return;
    end;
end;
v19.Enable = function(v91, v92) --[[ Line: 413 ]] --[[ Name: Enable ]]
    -- upvalues: l_VRService_0 (copy), l_RunService_0 (copy), l_ContextActionService_0 (copy)
    v91.moveVector = Vector3.new(0, 0, 0, 0);
    v91.isJumping = false;
    if v92 then
        v91.navigationRequestedConn = l_VRService_0.NavigationRequested:Connect(function(v93, v94) --[[ Line: 419 ]]
            -- upvalues: v91 (copy)
            v91:OnNavigationRequest(v93, v94);
        end);
        v91.heartbeatConn = l_RunService_0.Heartbeat:Connect(function(v95) --[[ Line: 420 ]]
            -- upvalues: v91 (copy)
            v91:OnHeartbeat(v95);
        end);
        l_ContextActionService_0:BindAction("MoveThumbstick", function(v96, v97, v98) --[[ Line: 422 ]]
            -- upvalues: v91 (copy)
            return v91:ControlCharacterGamepad(v96, v97, v98);
        end, false, v91.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1);
        l_ContextActionService_0:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
        v91.userCFrameEnabledConn = l_VRService_0.UserCFrameEnabled:Connect(function() --[[ Line: 426 ]]
            -- upvalues: v91 (copy)
            v91:OnUserCFrameEnabled();
        end);
        v91:OnUserCFrameEnabled();
        l_VRService_0:SetTouchpadMode(Enum.VRTouchpad.Left, Enum.VRTouchpadMode.VirtualThumbstick);
        l_VRService_0:SetTouchpadMode(Enum.VRTouchpad.Right, Enum.VRTouchpadMode.ABXY);
        v91.enabled = true;
        return;
    else
        v91:StopFollowingPath();
        l_ContextActionService_0:UnbindAction("MoveThumbstick");
        l_ContextActionService_0:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2);
        v91:BindJumpAction(false);
        v91:SetLaserPointerMode("Disabled");
        if v91.navigationRequestedConn then
            v91.navigationRequestedConn:Disconnect();
            v91.navigationRequestedConn = nil;
        end;
        if v91.heartbeatConn then
            v91.heartbeatConn:Disconnect();
            v91.heartbeatConn = nil;
        end;
        if v91.userCFrameEnabledConn then
            v91.userCFrameEnabledConn:Disconnect();
            v91.userCFrameEnabledConn = nil;
        end;
        v91.enabled = false;
        return;
    end;
end;
return v19;