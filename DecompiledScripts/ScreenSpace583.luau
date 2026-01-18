local l_game_0 = game;
local l_Workspace_0 = game.Workspace;
local l_Mouse_0 = l_game_0:GetService("Players").LocalPlayer:GetMouse();
local v7 = {
    ViewSizeX = function() --[[ Line: 10 ]] --[[ Name: ViewSizeX ]]
        -- upvalues: l_Mouse_0 (copy)
        local l_ViewSizeX_0 = l_Mouse_0.ViewSizeX;
        local l_ViewSizeY_0 = l_Mouse_0.ViewSizeY;
        if l_ViewSizeX_0 == 0 then
            return 1024;
        elseif l_ViewSizeY_0 < l_ViewSizeX_0 then
            return l_ViewSizeX_0;
        else
            return l_ViewSizeY_0;
        end;
    end, 
    ViewSizeY = function() --[[ Line: 24 ]] --[[ Name: ViewSizeY ]]
        -- upvalues: l_Mouse_0 (copy)
        local l_ViewSizeX_1 = l_Mouse_0.ViewSizeX;
        local l_ViewSizeY_1 = l_Mouse_0.ViewSizeY;
        if l_ViewSizeY_1 == 0 then
            return 768;
        elseif l_ViewSizeY_1 < l_ViewSizeX_1 then
            return l_ViewSizeY_1;
        else
            return l_ViewSizeX_1;
        end;
    end
};
v7.AspectRatio = function() --[[ Line: 40 ]] --[[ Name: AspectRatio ]]
    -- upvalues: v7 (copy)
    return v7.ViewSizeX() / v7.ViewSizeY();
end;
v7.WorldToScreen = function(v8) --[[ Line: 46 ]] --[[ Name: WorldToScreen ]]
    -- upvalues: l_Workspace_0 (copy), v7 (copy)
    local v9 = l_Workspace_0.CurrentCamera.CoordinateFrame:pointToObjectSpace(v8);
    local v10 = v7.AspectRatio();
    local v11 = math.tan(math.rad(l_Workspace_0.CurrentCamera.FieldOfView) / 2);
    local v12 = v10 * v11;
    local v13 = v9.x / v9.z / -v12;
    local v14 = v9.y / v9.z / v11;
    return Vector2.new(v7.ViewSizeX() * (0.5 + 0.5 * v13), v7.ViewSizeY() * (0.5 + 0.5 * v14));
end;
v7.ScreenToWorld = function(v15, v16, v17) --[[ Line: 60 ]] --[[ Name: ScreenToWorld ]]
    -- upvalues: v7 (copy), l_Workspace_0 (copy)
    local v18 = v7.AspectRatio();
    local v19 = math.tan(math.rad(l_Workspace_0.CurrentCamera.FieldOfView) / 2);
    local v20 = v18 * v19;
    local v21 = v15 / v7.ViewSizeX() * 2 - 1;
    local v22 = v16 / v7.ViewSizeY() * 2 - 1;
    return (Vector3.new(v21 * -v20 * v17, v22 * v19 * v17, v17));
end;
v7.ScreenWidthToWorldWidth = function(v23, v24) --[[ Line: 73 ]] --[[ Name: ScreenWidthToWorldWidth ]]
    -- upvalues: v7 (copy), l_Workspace_0 (copy)
    local v25 = v7.AspectRatio() * math.tan(math.rad(l_Workspace_0.CurrentCamera.FieldOfView) / 2);
    return -(v23 / v7.ViewSizeX()) * 2 * v25 * v24;
end;
v7.ScreenHeightToWorldHeight = function(v26, v27) --[[ Line: 81 ]] --[[ Name: ScreenHeightToWorldHeight ]]
    -- upvalues: l_Workspace_0 (copy), v7 (copy)
    local v28 = math.tan(math.rad(l_Workspace_0.CurrentCamera.FieldOfView) / 2);
    return -(v26 / v7.ViewSizeY()) * 2 * v28 * v27;
end;
v7.WorldWidthToScreenWidth = function(v29, v30) --[[ Line: 89 ]] --[[ Name: WorldWidthToScreenWidth ]]
    -- upvalues: v7 (copy), l_Workspace_0 (copy)
    local v31 = v7.AspectRatio() * math.tan(math.rad(l_Workspace_0.CurrentCamera.FieldOfView) / 2);
    return -(v29 * v7.ViewSizeX()) / (2 * v31 * v30);
end;
v7.WorldHeightToScreenHeight = function(v32, v33) --[[ Line: 97 ]] --[[ Name: WorldHeightToScreenHeight ]]
    -- upvalues: l_Workspace_0 (copy), v7 (copy)
    local v34 = math.tan(math.rad(l_Workspace_0.CurrentCamera.FieldOfView) / 2);
    return -(v32 * v7.ViewSizeY()) / (v34 * 2 * v33);
end;
v7.GetDepthForWidth = function(v35, v36) --[[ Line: 105 ]] --[[ Name: GetDepthForWidth ]]
    -- upvalues: v7 (copy), l_Workspace_0 (copy)
    local v37 = v7.AspectRatio() * math.tan(math.rad(l_Workspace_0.CurrentCamera.FieldOfView) / 2);
    local v38 = v7.ViewSizeX();
    local _ = v7.ViewSizeY();
    return -(v38 * v36) / (v35 * 2 * v37);
end;
v7.GetDepthForHeight = function(v40, v41) --[[ Line: 113 ]] --[[ Name: GetDepthForHeight ]]
    -- upvalues: l_Workspace_0 (copy), v7 (copy)
    local v42 = math.tan(math.rad(l_Workspace_0.CurrentCamera.FieldOfView) / 2);
    return -(v7.ViewSizeY() * v41) / (v40 * 2 * v42);
end;
v7.ScreenToWorldByHeightDepth = function(v43, v44, v45, v46) --[[ Line: 123 ]] --[[ Name: ScreenToWorldByHeightDepth ]]
    -- upvalues: v7 (copy), l_Workspace_0 (copy)
    local v47 = v7.AspectRatio();
    local v48 = math.tan(math.rad(l_Workspace_0.CurrentCamera.FieldOfView) / 2);
    local v49 = v47 * v48;
    local v50 = v7.ViewSizeX();
    local v51 = v7.ViewSizeY();
    local v52 = -(v45 / v51) * 2 * v48 * v46;
    local v53 = v43 / v50 * 2 - 1;
    local v54 = v44 / v51 * 2 - 1;
    return Vector3.new(v53 * -v49 * v46, v54 * v48 * v46, v46), v52;
end;
v7.ScreenToWorldByWidthDepth = function(v55, v56, v57, v58) --[[ Line: 141 ]] --[[ Name: ScreenToWorldByWidthDepth ]]
    -- upvalues: v7 (copy), l_Workspace_0 (copy)
    local v59 = v7.AspectRatio();
    local v60 = math.tan(math.rad(l_Workspace_0.CurrentCamera.FieldOfView) / 2);
    local v61 = v59 * v60;
    local v62 = v7.ViewSizeX();
    local v63 = v7.ViewSizeY();
    local v64 = v57 / v62 * 2 * -v61 * v58;
    local v65 = v55 / v62 * 2 - 1;
    local v66 = v56 / v63 * 2 - 1;
    return Vector3.new(v65 * -v61 * v58, v66 * v60 * v58, v58), v64;
end;
v7.ScreenToWorldByHeight = function(v67, v68, v69, v70) --[[ Line: 159 ]] --[[ Name: ScreenToWorldByHeight ]]
    -- upvalues: v7 (copy), l_Workspace_0 (copy)
    local v71 = v7.AspectRatio();
    local v72 = math.tan(math.rad(l_Workspace_0.CurrentCamera.FieldOfView) / 2);
    local v73 = v71 * v72;
    local v74 = v7.ViewSizeX();
    local v75 = v7.ViewSizeY();
    local v76 = -(v75 * v70) / (v69 * 2 * v72);
    local v77 = v67 / v74 * 2 - 1;
    local v78 = v68 / v75 * 2 - 1;
    return (Vector3.new(v77 * -v73 * v76, v78 * v72 * v76, v76));
end;
v7.ScreenToWorldByWidth = function(v79, v80, v81, v82) --[[ Line: 177 ]] --[[ Name: ScreenToWorldByWidth ]]
    -- upvalues: v7 (copy), l_Workspace_0 (copy)
    local v83 = v7.AspectRatio();
    local v84 = math.tan(math.rad(l_Workspace_0.CurrentCamera.FieldOfView) / 2);
    local v85 = v83 * v84;
    local v86 = v7.ViewSizeX();
    local v87 = v7.ViewSizeY();
    local v88 = -(v86 * v82) / (v81 * 2 * v85);
    local v89 = v79 / v86 * 2 - 1;
    local v90 = v80 / v87 * 2 - 1;
    return (Vector3.new(v89 * -v85 * v88, v90 * v84 * v88, v88));
end;
return v7;