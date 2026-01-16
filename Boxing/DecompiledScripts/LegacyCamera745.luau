local _ = Vector2.new();
local _ = require(script.Parent:WaitForChild("CameraUtils"));
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_Players_0 = game:GetService("Players");
local l_BaseCamera_0 = require(script.Parent:WaitForChild("BaseCamera"));
local v5 = setmetatable({}, l_BaseCamera_0);
v5.__index = v5;
v5.new = function() --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: l_BaseCamera_0 (copy), v5 (copy)
    local v6 = setmetatable(l_BaseCamera_0.new(), v5);
    v6.cameraType = Enum.CameraType.Custom;
    v6.lastUpdate = tick();
    v6.lastDistanceToSubject = nil;
    return v6;
end;
v5.GetModuleName = function(_) --[[ Line: 31 ]] --[[ Name: GetModuleName ]]
    return "LegacyCamera";
end;
v5.SetCameraToSubjectDistance = function(v8, v9) --[[ Line: 36 ]] --[[ Name: SetCameraToSubjectDistance ]]
    -- upvalues: l_BaseCamera_0 (copy)
    return l_BaseCamera_0.SetCameraToSubjectDistance(v8, v9);
end;
v5.Update = function(v10, _) --[[ Line: 40 ]] --[[ Name: Update ]]
    -- upvalues: l_Players_0 (copy), l_CameraInput_0 (copy)
    if not v10.cameraType then
        return nil, nil;
    else
        local v12 = tick();
        local v13 = v12 - v10.lastUpdate;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        local l_Focus_0 = l_CurrentCamera_0.Focus;
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if v10.lastUpdate == nil or v13 > 1 then
            v10.lastDistanceToSubject = nil;
        end;
        local l_v10_SubjectPosition_0 = v10:GetSubjectPosition();
        if v10.cameraType == Enum.CameraType.Fixed then
            if l_v10_SubjectPosition_0 and l_LocalPlayer_0 and l_CurrentCamera_0 then
                local l_v10_CameraToSubjectDistance_0 = v10:GetCameraToSubjectDistance();
                local v20 = v10:CalculateNewLookVectorFromArg(nil, l_CameraInput_0.getRotation());
                l_Focus_0 = l_CurrentCamera_0.Focus;
                l_CFrame_0 = CFrame.new(l_CurrentCamera_0.CFrame.p, l_CurrentCamera_0.CFrame.p + l_v10_CameraToSubjectDistance_0 * v20);
            end;
        elseif v10.cameraType == Enum.CameraType.Attach then
            local l_v10_SubjectCFrame_0 = v10:GetSubjectCFrame();
            local v22 = l_CurrentCamera_0.CFrame:ToEulerAnglesYXZ();
            local _, v24 = l_v10_SubjectCFrame_0:ToEulerAnglesYXZ();
            v22 = math.clamp(v22 - l_CameraInput_0.getRotation().Y, -1.3962634015954636, 1.3962634015954636);
            l_Focus_0 = CFrame.new(l_v10_SubjectCFrame_0.p) * CFrame.fromEulerAnglesYXZ(v22, v24, 0);
            l_CFrame_0 = l_Focus_0 * CFrame.new(0, 0, v10:StepZoom());
        elseif v10.cameraType == Enum.CameraType.Watch then
            if l_v10_SubjectPosition_0 and l_LocalPlayer_0 and l_CurrentCamera_0 then
                local v25 = nil;
                if l_v10_SubjectPosition_0 == l_CurrentCamera_0.CFrame.p then
                    warn("Camera cannot watch subject in same position as itself");
                    return l_CurrentCamera_0.CFrame, l_CurrentCamera_0.Focus;
                else
                    local l_v10_Humanoid_0 = v10:GetHumanoid();
                    if l_v10_Humanoid_0 and l_v10_Humanoid_0.RootPart then
                        local v27 = l_v10_SubjectPosition_0 - l_CurrentCamera_0.CFrame.p;
                        v25 = v27.unit;
                        if v10.lastDistanceToSubject and v10.lastDistanceToSubject == v10:GetCameraToSubjectDistance() then
                            v10:SetCameraToSubjectDistance(v27.magnitude);
                        end;
                    end;
                    local l_v10_CameraToSubjectDistance_1 = v10:GetCameraToSubjectDistance();
                    local v29 = v10:CalculateNewLookVectorFromArg(v25, l_CameraInput_0.getRotation());
                    l_Focus_0 = CFrame.new(l_v10_SubjectPosition_0);
                    l_CFrame_0 = CFrame.new(l_v10_SubjectPosition_0 - l_v10_CameraToSubjectDistance_1 * v29, l_v10_SubjectPosition_0);
                    v10.lastDistanceToSubject = l_v10_CameraToSubjectDistance_1;
                end;
            end;
        else
            return l_CurrentCamera_0.CFrame, l_CurrentCamera_0.Focus;
        end;
        v10.lastUpdate = v12;
        return l_CFrame_0, l_Focus_0;
    end;
end;
return v5;