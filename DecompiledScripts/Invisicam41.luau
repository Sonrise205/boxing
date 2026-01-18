local l_Players_0 = game:GetService("Players");
local v1 = {
    LIMBS = 2, 
    MOVEMENT = 3, 
    CORNERS = 4, 
    CIRCLE1 = 5, 
    CIRCLE2 = 6, 
    LIMBMOVE = 7, 
    SMART_CIRCLE = 8, 
    CHAR_OUTLINE = 9
};
local v2 = {
    Head = true, 
    ["Left Arm"] = true, 
    ["Right Arm"] = true, 
    ["Left Leg"] = true, 
    ["Right Leg"] = true, 
    LeftLowerArm = true, 
    RightLowerArm = true, 
    LeftUpperLeg = true, 
    RightUpperLeg = true
};
local v3 = {
    Vector3.new(1, 1, -1, 0), 
    Vector3.new(1, -1, -1, 0), 
    Vector3.new(-1, -1, -1, 0), 
    (Vector3.new(-1, 1, -1, 0))
};
local function v10(v4, ...) --[[ Line: 59 ]] --[[ Name: AssertTypes ]]
    local v5 = {};
    local v6 = "";
    for _, v8 in pairs({
        ...
    }) do
        v5[v8] = true;
        v6 = v6 .. (v6 == "" and "" or " or ") .. v8;
    end;
    local v9 = type(v4);
    assert(v5[v9], v6 .. " type expected, got: " .. v9);
end;
local function _(v11, v12, v13, v14, v15, v16, v17, v18, v19) --[[ Line: 71 ]] --[[ Name: Det3x3 ]]
    return v11 * (v15 * v19 - v16 * v18) - v12 * (v14 * v19 - v16 * v17) + v13 * (v14 * v18 - v15 * v17);
end;
local function v39(v21, v22, v23, v24) --[[ Line: 79 ]] --[[ Name: RayIntersection ]]
    local v25 = v22:Cross(v24);
    local v26 = v23.X - v21.X;
    local v27 = v23.Y - v21.Y;
    local v28 = v23.Z - v21.Z;
    local l_X_0 = v22.X;
    local v30 = -v24.X;
    local l_X_1 = v25.X;
    local l_Y_0 = v22.Y;
    local v33 = -v24.Y;
    local l_Y_1 = v25.Y;
    local l_Z_0 = v22.Z;
    local v36 = -v24.Z;
    local l_Z_1 = v25.Z;
    local v38 = l_X_0 * (v33 * l_Z_1 - l_Y_1 * v36) - v30 * (l_Y_0 * l_Z_1 - l_Y_1 * l_Z_0) + l_X_1 * (l_Y_0 * v36 - v33 * l_Z_0);
    if v38 == 0 then
        return (Vector3.new(0, 0, 0, 0));
    else
        l_X_1 = -v24.X;
        l_Y_0 = v25.X;
        v33 = -v24.Y;
        l_Y_1 = v25.Y;
        l_Z_0 = -v24.Z;
        v36 = v25.Z;
        l_X_0 = (v26 * (v33 * v36 - l_Y_1 * l_Z_0) - l_X_1 * (v27 * v36 - l_Y_1 * v28) + l_Y_0 * (v27 * l_Z_0 - v33 * v28)) / v38;
        l_Y_0 = v22.X;
        v33 = v25.X;
        l_Y_1 = v22.Y;
        l_Z_0 = v25.Y;
        v36 = v22.Z;
        l_Z_1 = v25.Z;
        v30 = (l_Y_0 * (v27 * l_Z_1 - l_Z_0 * v28) - v26 * (l_Y_1 * l_Z_1 - l_Z_0 * v36) + v33 * (l_Y_1 * v28 - v27 * v36)) / v38;
        l_X_1 = v21 + l_X_0 * v22;
        l_Y_0 = v23 + v30 * v24;
        v33 = l_X_1 + 0.5 * (l_Y_0 - l_X_1);
        if (l_Y_0 - l_X_1).Magnitude < 0.25 then
            return v33;
        else
            return (Vector3.new(0, 0, 0, 0));
        end;
    end;
end;
local l_BaseOcclusion_0 = require(script.Parent:WaitForChild("BaseOcclusion"));
local v41 = setmetatable({}, l_BaseOcclusion_0);
v41.__index = v41;
v41.new = function() --[[ Line: 112 ]] --[[ Name: new ]]
    -- upvalues: l_BaseOcclusion_0 (copy), v41 (copy), v1 (copy)
    local v42 = setmetatable(l_BaseOcclusion_0.new(), v41);
    v42.char = nil;
    v42.humanoidRootPart = nil;
    v42.torsoPart = nil;
    v42.headPart = nil;
    v42.childAddedConn = nil;
    v42.childRemovedConn = nil;
    v42.behaviors = {};
    v42.behaviors[v1.LIMBS] = v42.LimbBehavior;
    v42.behaviors[v1.MOVEMENT] = v42.MoveBehavior;
    v42.behaviors[v1.CORNERS] = v42.CornerBehavior;
    v42.behaviors[v1.CIRCLE1] = v42.CircleBehavior;
    v42.behaviors[v1.CIRCLE2] = v42.CircleBehavior;
    v42.behaviors[v1.LIMBMOVE] = v42.LimbMoveBehavior;
    v42.behaviors[v1.SMART_CIRCLE] = v42.SmartCircleBehavior;
    v42.behaviors[v1.CHAR_OUTLINE] = v42.CharacterOutlineBehavior;
    v42.mode = v1.SMART_CIRCLE;
    v42.behaviorFunction = v42.SmartCircleBehavior;
    v42.savedHits = {};
    v42.trackedLimbs = {};
    v42.camera = game.Workspace.CurrentCamera;
    v42.enabled = false;
    return v42;
end;
v41.Enable = function(v43, v44) --[[ Line: 145 ]] --[[ Name: Enable ]]
    v43.enabled = v44;
    if not v44 then
        v43:Cleanup();
    end;
end;
v41.GetOcclusionMode = function(_) --[[ Line: 153 ]] --[[ Name: GetOcclusionMode ]]
    return Enum.DevCameraOcclusionMode.Invisicam;
end;
v41.LimbBehavior = function(v46, v47) --[[ Line: 158 ]] --[[ Name: LimbBehavior ]]
    for v48, _ in pairs(v46.trackedLimbs) do
        v47[#v47 + 1] = v48.Position;
    end;
end;
v41.MoveBehavior = function(v50, v51) --[[ Line: 164 ]] --[[ Name: MoveBehavior ]]
    for v52 = 1, 3 do
        local l_Position_0 = v50.humanoidRootPart.Position;
        local l_Velocity_0 = v50.humanoidRootPart.Velocity;
        local v55 = Vector3.new(l_Velocity_0.X, 0, l_Velocity_0.Z).Magnitude / 2;
        local v56 = (v52 - 1) * v50.humanoidRootPart.CFrame.lookVector * v55;
        v51[#v51 + 1] = l_Position_0 + v56;
    end;
end;
v41.CornerBehavior = function(v57, v58) --[[ Line: 173 ]] --[[ Name: CornerBehavior ]]
    -- upvalues: v3 (copy)
    local l_CFrame_0 = v57.humanoidRootPart.CFrame;
    local l_Position_1 = l_CFrame_0.Position;
    local v61 = l_CFrame_0 - l_Position_1;
    local v62 = v57.char:GetExtentsSize() / 2;
    v58[#v58 + 1] = l_Position_1;
    for v63 = 1, #v3 do
        v58[#v58 + 1] = l_Position_1 + v61 * (v62 * v3[v63]);
    end;
end;
v41.CircleBehavior = function(v64, v65) --[[ Line: 184 ]] --[[ Name: CircleBehavior ]]
    -- upvalues: v1 (copy)
    local v66 = nil;
    if v64.mode == v1.CIRCLE1 then
        v66 = v64.humanoidRootPart.CFrame;
    else
        local l_CoordinateFrame_0 = v64.camera.CoordinateFrame;
        v66 = l_CoordinateFrame_0 - l_CoordinateFrame_0.Position + v64.humanoidRootPart.Position;
    end;
    v65[#v65 + 1] = v66.Position;
    for v68 = 0, 9 do
        local v69 = 0.6283185307179586 * v68;
        local v70 = 3 * Vector3.new(math.cos(v69), math.sin(v69), 0);
        v65[#v65 + 1] = v66 * v70;
    end;
end;
v41.LimbMoveBehavior = function(v71, v72) --[[ Line: 200 ]] --[[ Name: LimbMoveBehavior ]]
    v71:LimbBehavior(v72);
    v71:MoveBehavior(v72);
end;
v41.CharacterOutlineBehavior = function(v73, v74) --[[ Line: 205 ]] --[[ Name: CharacterOutlineBehavior ]]
    local l_unit_0 = v73.torsoPart.CFrame.upVector.unit;
    local l_unit_1 = v73.torsoPart.CFrame.rightVector.unit;
    v74[#v74 + 1] = v73.torsoPart.CFrame.p;
    v74[#v74 + 1] = v73.torsoPart.CFrame.p + l_unit_0;
    v74[#v74 + 1] = v73.torsoPart.CFrame.p - l_unit_0;
    v74[#v74 + 1] = v73.torsoPart.CFrame.p + l_unit_1;
    v74[#v74 + 1] = v73.torsoPart.CFrame.p - l_unit_1;
    if v73.headPart then
        v74[#v74 + 1] = v73.headPart.CFrame.p;
    end;
    local v77 = CFrame.new(Vector3.new(0, 0, 0, 0), (Vector3.new(v73.camera.CoordinateFrame.lookVector.X, 0, v73.camera.CoordinateFrame.lookVector.Z)));
    local v78 = v73.torsoPart and v73.torsoPart.Position or v73.humanoidRootPart.Position;
    local v79 = {
        v73.torsoPart
    };
    if v73.headPart then
        v79[#v79 + 1] = v73.headPart;
    end;
    for v80 = 1, 24 do
        local v81 = 6.283185307179586 * v80 / 24;
        local v82 = v77 * (3 * Vector3.new(math.cos(v81), math.sin(v81), 0));
        v82 = Vector3.new(v82.X, math.max(v82.Y, -2.25), v82.Z);
        local v83 = Ray.new(v78 + v82, -3 * v82);
        local l_PartOnRayWithWhitelist_0, v85 = game.Workspace:FindPartOnRayWithWhitelist(v83, v79, false);
        if l_PartOnRayWithWhitelist_0 then
            v74[#v74 + 1] = v85 + 0.2 * (v78 - v85).unit;
        end;
    end;
end;
v41.SmartCircleBehavior = function(v86, v87) --[[ Line: 244 ]] --[[ Name: SmartCircleBehavior ]]
    -- upvalues: v39 (copy)
    local l_unit_2 = v86.torsoPart.CFrame.upVector.unit;
    local l_unit_3 = v86.torsoPart.CFrame.rightVector.unit;
    v87[#v87 + 1] = v86.torsoPart.CFrame.p;
    v87[#v87 + 1] = v86.torsoPart.CFrame.p + l_unit_2;
    v87[#v87 + 1] = v86.torsoPart.CFrame.p - l_unit_2;
    v87[#v87 + 1] = v86.torsoPart.CFrame.p + l_unit_3;
    v87[#v87 + 1] = v86.torsoPart.CFrame.p - l_unit_3;
    if v86.headPart then
        v87[#v87 + 1] = v86.headPart.CFrame.p;
    end;
    local v90 = v86.camera.CFrame - v86.camera.CFrame.p;
    local v91 = Vector3.new(0, 0.5, 0, 0) + (v86.torsoPart and v86.torsoPart.Position or v86.humanoidRootPart.Position);
    for v92 = 1, 24 do
        local v93 = 0.2617993877991494 * v92 - 1.5707963267948966;
        local v94 = v91 + v90 * (2.5 * Vector3.new(math.cos(v93), math.sin(v93), 0));
        local v95 = v94 - v86.camera.CFrame.p;
        local v96 = Ray.new(v91, v94 - v91);
        local l_PartOnRayWithIgnoreList_0, v98, v99 = game.Workspace:FindPartOnRayWithIgnoreList(v96, {
            v86.char
        }, false, false);
        local l_v94_0 = v94;
        if l_PartOnRayWithIgnoreList_0 then
            local v101 = v98 + 0.1 * v99.unit;
            local v102 = v101 - v91;
            local l_unit_4 = v102:Cross(v95).unit:Cross(v99).unit;
            local l_unit_5 = (v101 - v86.camera.CFrame.p).unit;
            if v102.unit:Dot(-l_unit_4) < v102.unit:Dot(l_unit_5) then
                l_v94_0 = v39(v101, l_unit_4, v94, v95);
                if l_v94_0.Magnitude > 0 then
                    local v105 = Ray.new(v101, l_v94_0 - v101);
                    local l_PartOnRayWithIgnoreList_1, v107, v108 = game.Workspace:FindPartOnRayWithIgnoreList(v105, {
                        v86.char
                    }, false, false);
                    if l_PartOnRayWithIgnoreList_1 then
                        l_v94_0 = v107 + 0.1 * v108.unit;
                    end;
                else
                    l_v94_0 = v101;
                end;
            else
                l_v94_0 = v101;
            end;
            local v109 = Ray.new(v91, l_v94_0 - v91);
            local l_PartOnRayWithIgnoreList_2, v111, _ = game.Workspace:FindPartOnRayWithIgnoreList(v109, {
                v86.char
            }, false, false);
            if l_PartOnRayWithIgnoreList_2 then
                l_v94_0 = v111 - 0.1 * (l_v94_0 - v91).unit;
            end;
        end;
        v87[#v87 + 1] = l_v94_0;
    end;
end;
v41.CheckTorsoReference = function(v113) --[[ Line: 329 ]] --[[ Name: CheckTorsoReference ]]
    if v113.char then
        v113.torsoPart = v113.char:FindFirstChild("Torso");
        if not v113.torsoPart then
            v113.torsoPart = v113.char:FindFirstChild("UpperTorso");
            if not v113.torsoPart then
                v113.torsoPart = v113.char:FindFirstChild("HumanoidRootPart");
            end;
        end;
        v113.headPart = v113.char:FindFirstChild("Head");
    end;
end;
v41.CharacterAdded = function(v114, v115, v116) --[[ Line: 343 ]] --[[ Name: CharacterAdded ]]
    -- upvalues: l_Players_0 (copy), v2 (copy)
    if v116 ~= l_Players_0.LocalPlayer then
        return;
    else
        if v114.childAddedConn then
            v114.childAddedConn:Disconnect();
            v114.childAddedConn = nil;
        end;
        if v114.childRemovedConn then
            v114.childRemovedConn:Disconnect();
            v114.childRemovedConn = nil;
        end;
        v114.char = v115;
        v114.trackedLimbs = {};
        local function v118(v117) --[[ Line: 359 ]] --[[ Name: childAdded ]]
            -- upvalues: v2 (ref), v114 (copy)
            if v117:IsA("BasePart") then
                if v2[v117.Name] then
                    v114.trackedLimbs[v117] = true;
                end;
                if v117.Name == "Torso" or v117.Name == "UpperTorso" then
                    v114.torsoPart = v117;
                end;
                if v117.Name == "Head" then
                    v114.headPart = v117;
                end;
            end;
        end;
        local function v120(v119) --[[ Line: 375 ]] --[[ Name: childRemoved ]]
            -- upvalues: v114 (copy)
            v114.trackedLimbs[v119] = nil;
            v114:CheckTorsoReference();
        end;
        v114.childAddedConn = v115.ChildAdded:Connect(v118);
        v114.childRemovedConn = v115.ChildRemoved:Connect(v120);
        for _, v122 in pairs(v114.char:GetChildren()) do
            if v122:IsA("BasePart") then
                if v2[v122.Name] then
                    v114.trackedLimbs[v122] = true;
                end;
                if v122.Name == "Torso" or v122.Name == "UpperTorso" then
                    v114.torsoPart = v122;
                end;
                if v122.Name == "Head" then
                    v114.headPart = v122;
                end;
            end;
        end;
        return;
    end;
end;
v41.SetMode = function(v123, v124) --[[ Line: 389 ]] --[[ Name: SetMode ]]
    -- upvalues: v10 (copy), v1 (copy)
    v10(v124, "number");
    for _, v126 in pairs(v1) do
        if v126 == v124 then
            v123.mode = v124;
            v123.behaviorFunction = v123.behaviors[v123.mode];
            return;
        end;
    end;
    error("Invalid mode number");
end;
v41.GetObscuredParts = function(v127) --[[ Line: 401 ]] --[[ Name: GetObscuredParts ]]
    return v127.savedHits;
end;
v41.Cleanup = function(v128) --[[ Line: 406 ]] --[[ Name: Cleanup ]]
    for v129, v130 in pairs(v128.savedHits) do
        v129.LocalTransparencyModifier = v130;
    end;
end;
v41.Update = function(v131, _, v133, v134) --[[ Line: 412 ]] --[[ Name: Update ]]
    if not v131.enabled or not v131.char then
        return v133, v134;
    else
        v131.camera = game.Workspace.CurrentCamera;
        if not v131.humanoidRootPart then
            local l_Humanoid_0 = v131.char:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_0 and l_Humanoid_0.RootPart then
                v131.humanoidRootPart = l_Humanoid_0.RootPart;
            else
                v131.humanoidRootPart = v131.char:FindFirstChild("HumanoidRootPart");
                if not v131.humanoidRootPart then
                    return v133, v134;
                end;
            end;
            local v136 = nil;
            do
                local l_v136_0 = v136;
                l_v136_0 = v131.humanoidRootPart.AncestryChanged:Connect(function(v138, v139) --[[ Line: 437 ]]
                    -- upvalues: v131 (copy), l_v136_0 (ref)
                    if v138 == v131.humanoidRootPart and not v139 then
                        v131.humanoidRootPart = nil;
                        if l_v136_0 and l_v136_0.Connected then
                            l_v136_0:Disconnect();
                            l_v136_0 = nil;
                        end;
                    end;
                end);
            end;
        end;
        if not v131.torsoPart then
            v131:CheckTorsoReference();
            if not v131.torsoPart then
                return v133, v134;
            end;
        end;
        local v140 = {};
        v131:behaviorFunction(v140);
        local v141 = {};
        local v142 = {
            v131.char
        };
        local function _(v143) --[[ Line: 463 ]] --[[ Name: add ]]
            -- upvalues: v141 (copy), v131 (copy)
            v141[v143] = true;
            if not v131.savedHits[v143] then
                v131.savedHits[v143] = v143.LocalTransparencyModifier;
            end;
        end;
        local v145 = nil;
        local v146 = 0;
        local v147 = {};
        local v148 = 0.75;
        local v149 = 0.75;
        local v150 = v131.headPart and v131.headPart.CFrame.p or v140[1];
        local v151 = v131.torsoPart and v131.torsoPart.CFrame.p or v140[2];
        v145 = v131.camera:GetPartsObscuringTarget({
            v150, 
            v151
        }, v142);
        for v152 = 1, #v145 do
            local v153 = v145[v152];
            v146 = v146 + 1;
            v147[v153] = true;
            for _, v155 in pairs(v153:GetChildren()) do
                if v155:IsA("Decal") or v155:IsA("Texture") then
                    v146 = v146 + 1;
                    break;
                end;
            end;
        end;
        if v146 > 0 then
            v148 = math.pow(0.375 / v146 + 0.375, 1 / v146);
            v149 = math.pow(0.25 / v146 + 0.25, 1 / v146);
        end;
        v145 = v131.camera:GetPartsObscuringTarget(v140, v142);
        v150 = {};
        for v156 = 1, #v145 do
            local v157 = v145[v156];
            v150[v157] = v147[v157] and v148 or v149;
            if v157.Transparency < v150[v157] then
                v141[v157] = true;
                if not v131.savedHits[v157] then
                    v131.savedHits[v157] = v157.LocalTransparencyModifier;
                end;
            end;
            for _, v159 in pairs(v157:GetChildren()) do
                if (v159:IsA("Decal") or v159:IsA("Texture")) and v159.Transparency < v150[v157] then
                    v150[v159] = v150[v157];
                    v141[v159] = true;
                    if not v131.savedHits[v159] then
                        v131.savedHits[v159] = v159.LocalTransparencyModifier;
                    end;
                end;
            end;
        end;
        for v160, v161 in pairs(v131.savedHits) do
            if v141[v160] then
                v160.LocalTransparencyModifier = v160.Transparency < 1 and (v150[v160] - v160.Transparency) / (1 - v160.Transparency) or 0;
            else
                v160.LocalTransparencyModifier = v161;
                v131.savedHits[v160] = nil;
            end;
        end;
        return v133, v134;
    end;
end;
return v41;