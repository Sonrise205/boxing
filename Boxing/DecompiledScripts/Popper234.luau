local l_Players_0 = game:GetService("Players");
local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
local l_min_0 = math.min;
local l_tan_0 = math.tan;
local l_rad_0 = math.rad;
local l_new_0 = Ray.new;
local function _(v6) --[[ Line: 17 ]] --[[ Name: getTotalTransparency ]]
    return 1 - (1 - v6.Transparency) * (1 - v6.LocalTransparencyModifier);
end;
local function _(v8, v9) --[[ Line: 21 ]] --[[ Name: eraseFromEnd ]]
    for v10 = #v8, v9 + 1, -1 do
        v8[v10] = nil;
    end;
end;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local function v18() --[[ Line: 28 ]] --[[ Name: updateProjection ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_rad_0 (copy), v14 (ref), l_tan_0 (copy), v13 (ref)
    local v15 = l_rad_0(l_CurrentCamera_0.FieldOfView);
    local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
    local v17 = l_ViewportSize_0.X / l_ViewportSize_0.Y;
    v14 = l_tan_0(v15 / 2) * 2;
    v13 = v17 * v14;
end;
l_CurrentCamera_0:GetPropertyChangedSignal("FieldOfView"):Connect(v18);
l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(v18);
local v19 = l_rad_0(l_CurrentCamera_0.FieldOfView);
local l_ViewportSize_1 = l_CurrentCamera_0.ViewportSize;
local v21 = l_ViewportSize_1.X / l_ViewportSize_1.Y;
v14 = l_tan_0(v19 / 2) * 2;
v13 = v21 * v14;
v12 = l_CurrentCamera_0.NearPlaneZ;
l_CurrentCamera_0:GetPropertyChangedSignal("NearPlaneZ"):Connect(function() --[[ Line: 43 ]]
    -- upvalues: v12 (ref), l_CurrentCamera_0 (copy)
    v12 = l_CurrentCamera_0.NearPlaneZ;
end);
v18 = {};
v19 = {};
local l_v19_0 = v19 --[[ copy: 12 -> 22 ]];
l_ViewportSize_1 = function() --[[ Line: 51 ]] --[[ Name: refreshIgnoreList ]]
    -- upvalues: v18 (ref), l_v19_0 (copy)
    local v23 = 1;
    v18 = {};
    for _, v25 in pairs(l_v19_0) do
        v18[v23] = v25;
        v23 = v23 + 1;
    end;
end;
v21 = function(v26) --[[ Line: 60 ]] --[[ Name: playerAdded ]]
    -- upvalues: l_v19_0 (copy), v18 (ref)
    local function v31(v27) --[[ Line: 61 ]] --[[ Name: characterAdded ]]
        -- upvalues: l_v19_0 (ref), v26 (copy), v18 (ref)
        l_v19_0[v26] = v27;
        local v28 = 1;
        v18 = {};
        for _, v30 in pairs(l_v19_0) do
            v18[v28] = v30;
            v28 = v28 + 1;
        end;
    end;
    local function v35() --[[ Line: 65 ]] --[[ Name: characterRemoving ]]
        -- upvalues: l_v19_0 (ref), v26 (copy), v18 (ref)
        l_v19_0[v26] = nil;
        local v32 = 1;
        v18 = {};
        for _, v34 in pairs(l_v19_0) do
            v18[v32] = v34;
            v32 = v32 + 1;
        end;
    end;
    v26.CharacterAdded:Connect(v31);
    v26.CharacterRemoving:Connect(v35);
    if v26.Character then
        l_v19_0[v26] = v26.Character;
        local v36 = 1;
        v18 = {};
        for _, v38 in pairs(l_v19_0) do
            v18[v36] = v38;
            v36 = v36 + 1;
        end;
    end;
end;
local function v43(v39) --[[ Line: 77 ]] --[[ Name: playerRemoving ]]
    -- upvalues: l_v19_0 (copy), v18 (ref)
    l_v19_0[v39] = nil;
    local v40 = 1;
    v18 = {};
    for _, v42 in pairs(l_v19_0) do
        v18[v40] = v42;
        v40 = v40 + 1;
    end;
end;
l_Players_0.PlayerAdded:Connect(v21);
l_Players_0.PlayerRemoving:Connect(v43);
for _, v45 in ipairs(l_Players_0:GetPlayers()) do
    v21(v45);
end;
local v46 = 1;
v18 = {};
for _, v48 in pairs(v19) do
    v18[v46] = v48;
    v46 = v46 + 1;
end;
v19 = nil;
l_CurrentCamera_0:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 111 ]]
    -- upvalues: l_CurrentCamera_0 (copy), v19 (ref)
    local l_CameraSubject_0 = l_CurrentCamera_0.CameraSubject;
    if l_CameraSubject_0:IsA("Humanoid") then
        v19 = l_CameraSubject_0.RootPart;
        return;
    elseif l_CameraSubject_0:IsA("BasePart") then
        v19 = l_CameraSubject_0;
        return;
    else
        v19 = nil;
        return;
    end;
end);
l_ViewportSize_1 = function(v50) --[[ Line: 122 ]] --[[ Name: canOcclude ]]
    local v51 = false;
    if 1 - (1 - v50.Transparency) * (1 - v50.LocalTransparencyModifier) < 0.25 then
        v51 = v50.CanCollide and (v50:GetRootPart() or v50) ~= nil and not v50:IsA("TrussPart");
    end;
    return v51;
end;
v21 = {
    Vector2.new(0.4, 0), 
    Vector2.new(-0.4, 0), 
    Vector2.new(0, -0.4), 
    Vector2.new(0, 0.4), 
    Vector2.new(0, 0.2)
};
v43 = function(v52, v53) --[[ Line: 150 ]] --[[ Name: getCollisionPoint ]]
    -- upvalues: v18 (ref), l_new_0 (copy)
    local v54 = #v18;
    while true do
        local l_workspace_PartOnRayWithIgnoreList_0, v56 = workspace:FindPartOnRayWithIgnoreList(l_new_0(v52, v53), v18, false, true);
        if l_workspace_PartOnRayWithIgnoreList_0 then
            if l_workspace_PartOnRayWithIgnoreList_0.CanCollide then
                local l_v18_0 = v18;
                for v58 = #l_v18_0, v54 + 1, -1 do
                    l_v18_0[v58] = nil;
                end;
                return v56, true;
            else
                v18[#v18 + 1] = l_workspace_PartOnRayWithIgnoreList_0;
            end;
        end;
        if not l_workspace_PartOnRayWithIgnoreList_0 then
            l_workspace_PartOnRayWithIgnoreList_0 = v18;
            for v59 = #l_workspace_PartOnRayWithIgnoreList_0, v54 + 1, -1 do
                l_workspace_PartOnRayWithIgnoreList_0[v59] = nil;
            end;
            return v52 + v53, false;
        end;
    end;
end;
v46 = function(v60, v61, v62, v63) --[[ Line: 172 ]] --[[ Name: queryPoint ]]
    -- upvalues: v18 (ref), v12 (ref), l_new_0 (copy)
    debug.profilebegin("queryPoint");
    local v64 = #v18;
    v62 = v62 + v12;
    local v65 = v60 + v61 * v62;
    local v66 = 1e999;
    local v67 = 1e999;
    local l_v60_0 = v60;
    local v69 = 0;
    repeat
        local l_workspace_PartOnRayWithIgnoreList_1, v71 = workspace:FindPartOnRayWithIgnoreList(l_new_0(l_v60_0, v65 - l_v60_0), v18, false, true);
        v69 = v69 + 1;
        if l_workspace_PartOnRayWithIgnoreList_1 then
            local v72 = v69 >= 64;
            local v73 = false;
            if 1 - (1 - l_workspace_PartOnRayWithIgnoreList_1.Transparency) * (1 - l_workspace_PartOnRayWithIgnoreList_1.LocalTransparencyModifier) < 0.25 then
                v73 = l_workspace_PartOnRayWithIgnoreList_1.CanCollide and (l_workspace_PartOnRayWithIgnoreList_1:GetRootPart() or l_workspace_PartOnRayWithIgnoreList_1) ~= nil and not l_workspace_PartOnRayWithIgnoreList_1:IsA("TrussPart");
            end;
            if v73 or v72 then
                v73 = {
                    l_workspace_PartOnRayWithIgnoreList_1
                };
                local l_workspace_PartOnRayWithWhitelist_0 = workspace:FindPartOnRayWithWhitelist(l_new_0(v65, v71 - v65), v73, true);
                local l_Magnitude_0 = (v71 - v60).Magnitude;
                if l_workspace_PartOnRayWithWhitelist_0 and not v72 then
                    local v76 = false;
                    if v63 then
                        v76 = workspace:FindPartOnRayWithWhitelist(l_new_0(v63, v65 - v63), v73, true) or workspace:FindPartOnRayWithWhitelist(l_new_0(v65, v63 - v65), v73, true);
                    end;
                    if v76 then
                        v67 = l_Magnitude_0;
                    elseif v62 < v66 then
                        v66 = l_Magnitude_0;
                    end;
                else
                    v67 = l_Magnitude_0;
                end;
            end;
            v18[#v18 + 1] = l_workspace_PartOnRayWithIgnoreList_1;
            l_v60_0 = v71 - v61 * 0.001;
        end;
    until v67 < 1e999 or not l_workspace_PartOnRayWithIgnoreList_1;
    local l_v18_1 = v18;
    for v78 = #l_v18_1, v64 + 1, -1 do
        l_v18_1[v78] = nil;
    end;
    debug.profileend();
    return v66 - v12, v67 - v12;
end;
local function _(v79, v80) --[[ Line: 232 ]] --[[ Name: queryViewport ]]
    -- upvalues: l_CurrentCamera_0 (copy), v13 (ref), v14 (ref), v12 (ref), v46 (copy)
    debug.profilebegin("queryViewport");
    local l_p_0 = v79.p;
    local l_rightVector_0 = v79.rightVector;
    local l_upVector_0 = v79.upVector;
    local v84 = -v79.lookVector;
    local l_ViewportSize_2 = l_CurrentCamera_0.ViewportSize;
    local v86 = 1e999;
    local v87 = 1e999;
    for v88 = 0, 1 do
        local v89 = l_rightVector_0 * ((v88 - 0.5) * v13);
        for v90 = 0, 1 do
            local v91 = l_upVector_0 * ((v90 - 0.5) * v14);
            local v92 = l_p_0 + v12 * (v89 + v91);
            local l_Origin_0 = l_CurrentCamera_0:ViewportPointToRay(l_ViewportSize_2.x * v88, l_ViewportSize_2.y * v90).Origin;
            local v94, v95 = v46(v92, v84, v80, l_Origin_0);
            if v95 < v86 then
                v86 = v95;
            end;
            if v94 < v87 then
                v87 = v94;
            end;
        end;
    end;
    debug.profileend();
    return v87, v86;
end;
local _ = function(v97, v98, v99) --[[ Line: 273 ]] --[[ Name: testPromotion ]]
    -- upvalues: v43 (copy), l_min_0 (copy), v46 (copy), v21 (copy)
    debug.profilebegin("testPromotion");
    local l_p_1 = v97.p;
    local l_rightVector_1 = v97.rightVector;
    local l_upVector_1 = v97.upVector;
    local v103 = -v97.lookVector;
    debug.profilebegin("extrapolate");
    local l_Magnitude_1 = (v43(l_p_1, v99.posVelocity * 1.25) - l_p_1).Magnitude;
    local l_magnitude_0 = v99.posVelocity.magnitude;
    for v106 = 0, l_min_0(1.25, v99.rotVelocity.magnitude + l_Magnitude_1 / l_magnitude_0), 0.0625 do
        local v107 = v99.extrapolate(v106);
        if v98 <= v46(v107.p, -v107.lookVector, v98) then
            return false;
        end;
    end;
    debug.profileend();
    debug.profilebegin("testOffsets");
    for _, v109 in ipairs(v21) do
        local v110 = v43(l_p_1, l_rightVector_1 * v109.x + l_upVector_1 * v109.y);
        if v46(v110, (l_p_1 + v103 * v98 - v110).Unit, v98) == 1e999 then
            return false;
        end;
    end;
    debug.profileend();
    debug.profileend();
    return true;
end;
return function(_, v113, _) --[[ Line: 322 ]] --[[ Name: Popper ]]
    debug.profilebegin("popper");
    debug.profileend();
    return v113;
end;