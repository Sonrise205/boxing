--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("CollectionService");
local _ = game:GetService("UserInputService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0:WaitForChild("AlignHelper"));
local l_SettingValueHelper_0 = require(l_ReplicatedStorage_0.PrivateServerPlusModules:WaitForChild("SettingValueHelper"));
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local _ = l_ReplicatedStorage_0:WaitForChild("RemoteEvents"):WaitForChild("SimulateKnockbackBE");
local _ = Random.new();
local function _(v14, v15, v16) --[[ Line: 24 ]] --[[ Name: Lerp ]]
    return v14 + (v15 - v14) * v16;
end;
local v18 = {};
v18.__index = v18;
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local v20 = game.PlaceId == l_Places_0.Trading;
local v21 = v20 and 14 or 12;
local _ = l_ReplicatedStorage_0.Events;
local v23 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
local v24 = TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_TrySwitchEquip_0 = l_ReplicatedStorage_0:WaitForChild("MobileEvents"):WaitForChild("TrySwitchEquip");
local _ = workspace.Gravity;
local _ = {};
v18.Init = function(v28, v29) --[[ Line: 54 ]] --[[ Name: Init ]]
    -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy)
    v28.Character = v29.Character;
    v28.RootPart = v28.Character.PrimaryPart;
    v28.Humanoid = v28.Character:WaitForChild("Humanoid", 20);
    v28.Animator = v28.Humanoid:FindFirstChild("Animator") or v28.Humanoid;
    local v30 = l_Workspace_0:WaitForChild("States", 20):WaitForChild(v28.Character.Name, 20);
    v28.CharacterData = v30:WaitForChild("CharacterData", 20);
    v28.PlayerData = v30:WaitForChild("PlayerData", 20);
    v28.Occupied = v30:WaitForChild("Occupied", 20);
    v28.Style = v28.PlayerData:WaitForChild("Style", 20);
    v28.Camera = l_Workspace_0.CurrentCamera;
    v28.IsClient = l_Players_0:GetPlayerFromCharacter(v28.Character);
    if v28.IsClient then
        v28.Controls = require(l_Players_0:GetPlayerFromCharacter(v28.Character):WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls();
    else
        v28.AnimSpeed = v28.Character:FindFirstChild("AnimSpeed");
        v28.PositionBuffer = {};
    end;
    v28.Rotation = CFrame.new();
    v28.Lerp = 1;
end;
v18.New = function(v31) --[[ Line: 87 ]] --[[ Name: New ]]
    -- upvalues: v18 (copy), l_Styles_0 (copy)
    local v32 = setmetatable({}, v18);
    v32:Init(v31);
    local v33 = l_Styles_0[v32.Style.Value];
    v32.CoreInfo = v33.CoreInfo;
    v32.Style.Changed:Connect(function() --[[ Line: 95 ]]
        -- upvalues: v33 (ref), l_Styles_0 (ref), v32 (copy)
        v33 = l_Styles_0[v32.Style.Value];
        v32.CoreInfo = v33.CoreInfo;
    end);
    v32.LastLerpMult = nil;
    v32.Input = Vector3.new(0, 0, 0, 0);
    v32.CachedInput = v32.Input;
    return v32;
end;
local _ = require(l_ReplicatedStorage_0:WaitForChild("InfoToString"));
v18.GetCameraMode = function(v35) --[[ Line: 110 ]] --[[ Name: GetCameraMode ]]
    local v36 = v35.Occupied.Equipped.Value and "Fight" or "Default";
    if v35.Occupied.LerpMult.Value > 0 and not v35.Occupied.LockedOn.Value then
        v36 = "Default";
    end;
    return v36;
end;
v18.SetInput = function(v37, v38) --[[ Line: 120 ]] --[[ Name: SetInput ]]
    v37.Input = v38;
end;
local l_MaxWearoutMovementMult_0 = l_Styles_0.JoeBurn.WearoutInfo.MaxWearoutMovementMult;
v18.Update = function(v40, v41) --[[ Line: 128 ]] --[[ Name: Update ]]
    -- upvalues: l_Workspace_0 (copy), l_Places_0 (copy), v20 (copy), l_TrySwitchEquip_0 (copy), v21 (copy), l_MaxWearoutMovementMult_0 (copy), l_SettingValueHelper_0 (copy), l_TweenService_0 (copy), v23 (copy), v24 (copy)
    local l_Value_0 = v40.Occupied.LockedOn.Value;
    v40.Humanoid.AutoRotate = false;
    if v40.IsClient then
        local v43 = l_Value_0 and l_Workspace_0.States:FindFirstChild(l_Value_0.Name);
        local v44 = v43 and v43:FindFirstChild("CharacterData");
        if v44 and v44.FastFace.Value > 0 then
            local l_Unit_0 = CFrame.lookAt(l_Value_0.PrimaryPart.Position, v40.RootPart.Position).LookVector.Unit;
            local l_Unit_1 = l_Value_0.PrimaryPart.CFrame.LookVector.Unit;
            local v47 = math.acos((l_Unit_1:Dot(l_Unit_0))) * math.sign(l_Unit_1:Cross(l_Unit_0).Y);
            local v48 = 0.75;
            if v40.Character:GetAttribute("LocalSlowMo") then
                v48 = 0.05;
            end;
            v40.LastFastFaceMult = math.clamp(v40.LastFastFaceMult + v41 * 5.5, 0, v48);
            local l_Root_0 = l_Value_0.LowerTorso:FindFirstChild("Root");
            if l_Root_0 then
                v40.TargetRootMotor = l_Root_0;
                local l_Angles_0 = CFrame.Angles;
                local v51 = 0;
                local v52 = v47 * -1;
                local l_LastFastFaceMult_0 = v40.LastFastFaceMult;
                l_Root_0.C1 = l_Angles_0(v51, 0 + (v52 - 0) * l_LastFastFaceMult_0, 0);
            end;
            if v40.Occupied.Dashing.Value then
                v44.FastFace.Value = 0;
            end;
        else
            v40.LastFastFaceMult = 0;
            if v40.TargetRootMotor then
                local l_TargetRootMotor_0 = v40.TargetRootMotor;
                v40.TargetRootMotor = nil;
                local l_l_TargetRootMotor_0_0 = l_TargetRootMotor_0 --[[ copy: 5 -> 17 ]];
                task.spawn(function() --[[ Line: 173 ]]
                    -- upvalues: l_l_TargetRootMotor_0_0 (copy)
                    for v56 = 1, 30 do
                        l_l_TargetRootMotor_0_0.C1 = l_l_TargetRootMotor_0_0.C1:Lerp(CFrame.new(l_l_TargetRootMotor_0_0.C1.Position) * CFrame.Angles(0, 0, 0), v56 / 30);
                        task.wait(0.016666666666666666);
                    end;
                end);
            end;
        end;
        local v57 = l_Value_0 and l_Value_0:FindFirstChild("LowerTorso") and l_Value_0.LowerTorso:FindFirstChild("Root");
        if v57 then
            v57.C1 = v57.C1 * CFrame.new(0, -0.25 - v57.C1.Position.Y, 0);
        end;
        if v40.Camera.CameraType == Enum.CameraType.Fixed then
            v40.Camera.CameraType = Enum.CameraType.Custom;
        end;
        if v40.RootPart and v40.RootPart.Velocity.Magnitude > 175 then
            warn("DEBUG Magnitude be crazy: ", v40.RootPart.Velocity.Magnitude);
            v40.RootPart.Anchored = true;
            v40.RootPart.Velocity = Vector3.new(0, 0, 0, 0);
            v40.RootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0, 0);
            v40.RootPart.Anchored = false;
        end;
    end;
    if v40.PlayerData.Disable.Value then
        if game.PlaceId == l_Places_0.Ranked then
            v40.RootPart.Anchored = true;
        end;
        v40.Humanoid.WalkSpeed = 0;
        return;
    else
        v40.Occupied.LerpMult.Value = math.clamp(v40.Occupied.LerpMult.Value, 0, 1);
        v40.Occupied.SpeedMult.Value = math.clamp(v40.Occupied.SpeedMult.Value, 0, 1);
        if v40.IsClient then
            l_Workspace_0.AnimSpeed.Value = 1;
            v40.Humanoid.AutoJumpEnabled = false;
            if v20 and v40.Humanoid:GetState() == Enum.HumanoidStateType.Swimming then
                v40.Humanoid.WalkSpeed = 16;
                v40.Humanoid.JumpPower = 50;
                if v40.Occupied.Equipped.Value then
                    l_TrySwitchEquip_0:Fire();
                end;
                return;
            elseif l_Workspace_0.CameraSettings.CameraMode.Value == "Freecam" then
                return;
            end;
        else
            v40.AnimSpeed.Value = 1.45;
        end;
        if v40.Occupied.Equipped.Value then
            if v40.CharacterData.Blocking.Value then
                v40.Humanoid.WalkSpeed = v40.CoreInfo.BlockingWalkSpeed or v21;
            else
                v40.Humanoid.WalkSpeed = v40.CoreInfo.WalkSpeed + 1 or v21;
            end;
            v40.Humanoid.JumpPower = 0;
        else
            v40.Humanoid.WalkSpeed = v21;
            v40.Humanoid.JumpPower = 50;
        end;
        if v40.CharacterData.CanWalk.Value == false then
            v40.Humanoid.WalkSpeed = 0;
        end;
        if v40.Occupied.Spectating.Value then
            v40.Humanoid.JumpPower = 0;
        end;
        if v40.Occupied.SpeedMult.Value > 0 then
            local l_Humanoid_0 = v40.Humanoid;
            l_Humanoid_0.WalkSpeed = l_Humanoid_0.WalkSpeed * (1 + -1 * v40.Occupied.SpeedMult.Value);
            v40.Humanoid.JumpPower = 0;
            if not v40.Occupied.Equipped.Value then
                v40.Humanoid.JumpPower = 0.1;
            end;
        end;
        local l_Humanoid_1 = v40.Humanoid;
        l_Humanoid_1.WalkSpeed = l_Humanoid_1.WalkSpeed * (1 + -0.44999999999999996 * v40.CharacterData.SlowDown.Value);
        if v40.Input and v40.Input.Z > -0.5 then
            l_Humanoid_1 = v40.Humanoid;
            local l_WalkSpeed_0 = l_Humanoid_1.WalkSpeed;
            local l_l_MaxWearoutMovementMult_0_0 = l_MaxWearoutMovementMult_0;
            local l_Value_1 = v40.CharacterData.Wearout.Value;
            l_Humanoid_1.WalkSpeed = l_WalkSpeed_0 * (1 + (l_l_MaxWearoutMovementMult_0_0 - 1) * l_Value_1);
        end;
        l_Humanoid_1 = v40.Humanoid;
        l_Humanoid_1.WalkSpeed = l_Humanoid_1.WalkSpeed * (l_SettingValueHelper_0.GetValue("WalkspeedMultiplier") or 1);
        if v40.IsClient then
            if v40.Occupied.LerpMult.Value > 0 and not v40.CharacterData.Cutscene.Value or v40.Occupied.FollowHead.Value then
                l_Humanoid_1 = v40.RootPart.CFrame * CFrame.new(0, l_Workspace_0.CameraOffset.Value.Y, 0);
                local v63 = 1.1;
                if v40.Occupied.LockedOn.Value then
                    v63 = 0.8;
                end;
                local l_Position_0 = v40.Character.Head.CFrame:ToObjectSpace(l_Humanoid_1).Position;
                local v65 = Vector3.new(-l_Position_0.X * 1.3, -l_Position_0.Y * 0.9, -l_Position_0.Z * 1.1);
                l_TweenService_0:Create(v40.Humanoid, v23, {
                    CameraOffset = v65 - Vector3.new(0, v63, 0) + l_Workspace_0.CameraOffset.Value
                }):Play();
            elseif v40.LastLerpMult and v40.LastLerpMult > 0 then
                l_TweenService_0:Create(v40.Humanoid, v24, {
                    CameraOffset = l_Workspace_0.CameraOffset.Value
                }):Play();
            else
                v40.Humanoid.CameraOffset = l_Workspace_0.CameraOffset.Value;
            end;
            v40.LastLerpMult = v40.Occupied.LerpMult.Value;
            if v40.Occupied.FollowHead.Value then
                v40.LastLerpMult = 1;
            end;
        end;
        l_Humanoid_1 = v40.Occupied.Target.Value;
        if l_Humanoid_1 ~= Vector3.new() then
            v40.Humanoid:Move(Vector3.new(0, 0, 0, 0), true);
            v40.Rotation = CFrame.lookAt(Vector3.new(), Vector3.new() + l_Humanoid_1);
            if v40.IsClient then
                v40.RootPart.CFrame = CFrame.new(v40.RootPart.Position) * v40.Rotation;
            else
                v40.Character:PivotTo(CFrame.new(v40.RootPart.Position) * v40.Rotation);
            end;
            v40.Lerp = 0.5;
            return;
        else
            if v40.Occupied.FaceAnyways.Value then
                v40.Rotation = CFrame.lookAt(Vector3.new(), Vector3.new() + v40.Character.PrimaryPart.CFrame.LookVector);
            end;
            if v40.CharacterData.Stunned.Value or v40.Occupied.Stunned.Value or v40.CharacterData.Cutscene.Value then
                v40.Humanoid:Move(Vector3.new(0, 0, 0, 0), true);
                v40.Lerp = 0;
                if v40.CharacterData.Cutscene.Value then
                    v40.Humanoid.JumpPower = 0;
                    return;
                elseif not v40.Occupied.FaceAnyways.Value and not v40.Occupied.Dashing.Value then
                    return;
                end;
            end;
            local v66 = "Fight";
            if v40.IsClient then
                v66 = v40:GetCameraMode();
            end;
            local v67 = if l_Value_0 and l_Value_0.PrimaryPart and v40.RootPart then CFrame.lookAt(v40.RootPart.Position, l_Value_0.PrimaryPart.Position) else v40.RootPart.CFrame;
            if not v40.IsClient and l_Value_0 and l_Value_0.PrimaryPart then
                table.insert(v40.PositionBuffer, l_Value_0.PrimaryPart.Position);
                if #v40.PositionBuffer > 14 then
                    v67 = CFrame.lookAt(v40.RootPart.Position, v40.PositionBuffer[1]);
                    table.remove(v40.PositionBuffer, 1);
                end;
            end;
            if l_Value_0 then
                local _ = v40.Occupied.Dashing.Value;
            end;
            if v40.Character and v40.Humanoid.Health > 0 then
                local v69 = l_Value_0 and 7 or 3;
                if not v40.IsClient then
                    v69 = v69 / 2;
                end;
                if v40.Occupied.LerpMult.Value > 0 then
                    v69 = 10 + -10 * v40.Occupied.LerpMult.Value;
                end;
                v40.Lerp = math.min(v40.Lerp + v41 * v69, 1);
                local v70 = if l_Value_0 then v67.LookVector else v40.IsClient and v40.Camera.CFrame.LookVector;
                if v40.IsClient then
                    v40.Input = v40.Controls:GetMoveVector();
                    if workspace.FightCameraMode.Value == "ProCamera" then
                        v40.Input = Vector3.new(v40.Input.Z, v40.Input.Y, -v40.Input.X);
                    end;
                end;
                v40.AbsoluteInput = v67:vectorToWorldSpace(v40.Input);
                if v40.Occupied.ReverseInputs.Value then
                    v40.Input = v40.Input * Vector3.new(-1, -1, -1, 0);
                end;
                local v71 = not l_Value_0 and v40.Occupied.Dashing.Value;
                if v40.Occupied.FaceAnyways.Value then
                    v40.Humanoid:Move(Vector3.new(0, 0, 0, 0), true);
                    v40.Lerp = 1;
                elseif v71 then
                    v40.RootPart.CFrame = CFrame.new(v40.RootPart.Position) * v40.Rotation;
                    v40.Lerp = 0;
                    v40.Humanoid:Move(Vector3.new(0, 0, 0, 0), true);
                    return;
                elseif v40.Occupied.StopRotate.Value then
                    v40.Lerp = 0.5;
                end;
                local v72 = v40.Occupied.Punching.Value or v40.Occupied.Dashing.Value;
                if v66 == "Fight" and not v40.Occupied.ForceMove.Value then
                    local v73 = v40.IsClient and 1 or 0.8;
                    if v72 then
                        v73 = 100;
                    end;
                    if v70 then
                        v40.Rotation = v40.Rotation:Lerp(CFrame.new(Vector3.new(), (Vector3.new(v70.X, 0, v70.Z))), (math.clamp(v40.Lerp * v73, 0, 1)));
                    end;
                end;
                if v40.Input.Magnitude > 0 then
                    v40.CachedInput = v40.Input;
                    if v40:GetCameraMode() == "Default" or v40.Occupied.ForceMove.Value then
                        if v40.Occupied.LerpMult.Value <= 0 then
                            v69 = 10;
                        end;
                        local v74 = math.min(v41 * v69, 1);
                        local _, v76, _ = v40.Camera.CFrame:ToEulerAnglesYXZ();
                        local v78 = CFrame.Angles(0, v76, 0);
                        v40.Rotation = v40.Rotation:Lerp(CFrame.new(Vector3.new(), (Vector3.new(v40.CachedInput.X, 0, v40.CachedInput.Z))) * v78, v74);
                    end;
                    local l_Unit_2 = v40.Input.Unit;
                    if v40.Occupied.Equipped.Value and l_Unit_2.Z > 0 and v40.Occupied.LerpMult.Value <= 0 then
                        local v80 = 1.35;
                        if l_Value_0 and l_Value_0.PrimaryPart then
                            v80 = 0.9 + 0.45000000000000007 * math.clamp(((l_Value_0.PrimaryPart.Position - v40.RootPart.Position).Magnitude - 7) / 9, 0, 1);
                        end;
                        local v81 = 1;
                        if v40.Humanoid.WalkSpeed > 0 then
                            v81 = 5.4 / v40.Humanoid.WalkSpeed * v80;
                        end;
                        local l_v81_0 = v81;
                        local l_Z_0 = l_Unit_2.Z;
                        local v84 = math.clamp((1 + (l_v81_0 - 1) * l_Z_0) * (1 - v40.Occupied.BackwardsMult.Value), 0, 1);
                        l_v81_0 = 1 / v84 * 0.92;
                        if v40.IsClient then
                            l_Workspace_0.AnimSpeed.Value = l_v81_0;
                        elseif v40.AnimSpeed then
                            v40.AnimSpeed.Value = l_v81_0;
                        end;
                        l_Z_0 = v40.Humanoid;
                        l_Z_0.WalkSpeed = l_Z_0.WalkSpeed * v84;
                    end;
                    if v40.PlayerData.Style.Value == "Supernova" and v40.RootPart.Velocity.Magnitude > 0.5 and workspace.StyleMode.Value ~= "Re-Entry" then
                        if not v40.LastSupernovaCheck then
                            v40.LastSupernovaCheck = tick();
                        end;
                        if tick() - v40.LastSupernovaCheck > 0.1 then
                            local v85 = v40.Character:GetAttribute("LastDamage") or 0;
                            if workspace:GetServerTimeNow() - v85 > 0.4 then
                                l_Workspace_0.StyleMode.Value = "Comet";
                            end;
                        end;
                    end;
                end;
                if v40.IsClient then
                    l_Workspace_0.Rotation.Value = v40.Rotation;
                end;
                local v86 = nil;
                if l_Value_0 and l_Value_0.PrimaryPart and v40.RootPart then
                    if v40.IsClient then
                        v86 = v40.Camera.CFrame;
                        v40.Camera.CFrame = v67;
                    end;
                    if (l_Value_0.PrimaryPart.Position - v40.RootPart.Position).Magnitude < 3.5 and v40.Input.Z < -0.5 then
                        if v40.IsClient then
                            v40.Input = Vector3.new(v40.Input.X, 0, 0);
                        end;
                        v40.AbsoluteInput = v67:vectorToWorldSpace((Vector3.new(v40.Input.X, 0, 0)));
                    end;
                end;
                v40.RootPart.CFrame = CFrame.new(v40.RootPart.Position) * v40.Rotation;
                if v40.Occupied.Dashing.Value or v40.Occupied.Punching.Value or v40.Occupied.StopRotate.Value or v40.Occupied.FaceAnyways.Value or v40.CharacterData.Stunned.Value or v40.Occupied.Stunned.Value then
                    v40.Humanoid:Move(Vector3.new(), true);
                elseif v40.IsClient then
                    v40.Humanoid:Move(v40.Input, true);
                    if v40.PlayerData.Style.Value == "SwitchHit" then
                        local v87 = tick() - (v40.Character:GetAttribute("LastLocalPunchTime") or 0);
                        if math.abs(v40.Input.X) > 0.1 and v87 > 0.7 then
                            local v88 = v40.Input.X < 0 and "Left" or "Right";
                            if v40.StrafeDirection ~= v88 then
                                v40.StrafeTime = tick();
                            end;
                            v40.StrafeDirection = v88;
                            if tick() - (v40.StrafeTime or tick()) >= 0.05 then
                                l_Workspace_0.StyleMode.Value = v40.Input.X < 0 and "" or "Southpaw";
                            end;
                        end;
                    end;
                else
                    v40.Humanoid:Move(v40.AbsoluteInput, false);
                end;
                if v40.IsClient and v86 then
                    v40.Camera.CFrame = v86;
                end;
            end;
            return;
        end;
    end;
end;
return v18;