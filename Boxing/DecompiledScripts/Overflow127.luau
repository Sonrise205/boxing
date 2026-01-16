local v0 = {};
local v1 = {};
local v2 = {};
local v3 = nil;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v5 = {};
local v6 = {};
local v7 = require(script.Parent.Parent.Utility);
local v8 = nil;
v0.start = function(v9) --[[ Line: 23 ]] --[[ Name: start ]]
    -- upvalues: v8 (ref), v3 (ref), v1 (copy), v7 (copy), v0 (copy), l_CurrentCamera_0 (copy)
    v8 = v9;
    v3 = v8.iconsDictionary;
    local v10 = nil;
    for _, v12 in pairs(v8.container) do
        if v10 == nil and v12.ScreenInsets == Enum.ScreenInsets.TopbarSafeInsets then
            v10 = v12;
        end;
        for _, v14 in pairs(v12.Holders:GetChildren()) do
            if v14:GetAttribute("IsAHolder") then
                v1[v14.Name] = v14;
            end;
        end;
    end;
    local v15 = false;
    local v17 = v7.createStagger(0.1, function(v16) --[[ Line: 41 ]]
        -- upvalues: v15 (ref), v0 (ref)
        if not v15 then
            return;
        else
            if not v16 then
                v0.updateAvailableIcons("Center");
            end;
            v0.updateBoundary("Left");
            v0.updateBoundary("Right");
            return;
        end;
    end);
    task.delay(1, function() --[[ Line: 51 ]]
        -- upvalues: v15 (ref), v17 (copy)
        v15 = true;
        v17();
    end);
    v8.iconAdded:Connect(v17);
    v8.iconRemoved:Connect(v17);
    v8.iconChanged:Connect(v17);
    l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 61 ]]
        -- upvalues: v17 (copy)
        v17(true);
    end);
    v10:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 64 ]]
        -- upvalues: v17 (copy)
        v17(true);
    end);
end;
v0.getWidth = function(v18, _) --[[ Line: 69 ]] --[[ Name: getWidth ]]
    local l_widget_0 = v18.widget;
    return l_widget_0:GetAttribute("TargetWidth") or l_widget_0.AbsoluteSize.X;
end;
v0.getAvailableIcons = function(v21) --[[ Line: 74 ]] --[[ Name: getAvailableIcons ]]
    -- upvalues: v2 (copy), v0 (copy)
    return v2[v21] or v0.updateAvailableIcons(v21);
end;
v0.updateAvailableIcons = function(v22) --[[ Line: 82 ]] --[[ Name: updateAvailableIcons ]]
    -- upvalues: v1 (copy), v3 (ref), v6 (copy), v2 (copy)
    local v23 = 0;
    local _ = v1[v22].UIListLayout;
    local v25 = {};
    for _, v27 in pairs(v3) do
        local l_parentIconUID_0 = v27.parentIconUID;
        local v29 = not l_parentIconUID_0 or v6[l_parentIconUID_0];
        local v30 = v6[v27.UID];
        if v29 and v27.alignment == v22 and not v30 then
            table.insert(v25, v27);
            v23 = v23 + 1;
        end;
    end;
    if v23 <= 0 then
        return {};
    else
        table.sort(v25, function(v31, v32) --[[ Line: 106 ]]
            local l_LayoutOrder_0 = v31.widget.LayoutOrder;
            local l_LayoutOrder_1 = v32.widget.LayoutOrder;
            local l_parentIconUID_1 = v31.parentIconUID;
            local l_parentIconUID_2 = v32.parentIconUID;
            if l_parentIconUID_1 == l_parentIconUID_2 then
                if l_LayoutOrder_0 < l_LayoutOrder_1 then
                    return true;
                elseif l_LayoutOrder_1 < l_LayoutOrder_0 then
                    return false;
                else
                    return v31.widget.AbsolutePosition.X < v32.widget.AbsolutePosition.X;
                end;
            elseif l_parentIconUID_2 then
                return false;
            elseif l_parentIconUID_1 then
                return true;
            else
                return;
            end;
        end);
        v2[v22] = v25;
        return v25;
    end;
end;
v0.getRealXPositions = function(v37, v38) --[[ Line: 132 ]] --[[ Name: getRealXPositions ]]
    -- upvalues: v1 (copy), v7 (copy), v0 (copy)
    local v39 = v37 == "Left";
    local v40 = v1[v37];
    local l_X_0 = v40.AbsolutePosition.X;
    local l_X_1 = v40.AbsoluteSize.X;
    local l_Offset_0 = v40.UIListLayout.Padding.Offset;
    local v44 = v39 and l_X_0 or l_X_0 + l_X_1;
    local v45 = {};
    if v39 then
        v7.reverseTable(v38);
    end;
    for v46 = #v38, 1, -1 do
        local v47 = v38[v46];
        local v48 = v0.getWidth(v47);
        if not v39 then
            v44 = v44 - v48;
        end;
        v45[v47.UID] = v44;
        if v39 then
            v44 = v44 + v48;
        end;
        v44 = v44 + (v39 and l_Offset_0 or -l_Offset_0);
    end;
    return v45;
end;
v0.updateBoundary = function(v49) --[[ Line: 162 ]] --[[ Name: updateBoundary ]]
    -- upvalues: v1 (copy), v0 (copy), v5 (copy), v8 (ref), v6 (copy), v7 (copy)
    local v50 = v1[v49];
    local l_UIListLayout_1 = v50.UIListLayout;
    local l_X_2 = v50.AbsolutePosition.X;
    local l_X_3 = v50.AbsoluteSize.X;
    local l_Offset_1 = l_UIListLayout_1.Padding.Offset;
    local l_Offset_2 = l_UIListLayout_1.Padding.Offset;
    local v56 = v0.updateAvailableIcons(v49);
    local v57 = 0;
    local v58 = 0;
    for _, v60 in pairs(v56) do
        v57 = v57 + (v0.getWidth(v60) + l_Offset_2);
        v58 = v58 + 1;
    end;
    if v58 <= 0 then
        return;
    else
        local v61 = v49 == "Central";
        local v62 = v49 == "Left";
        local v63 = not v62;
        local v64 = v5[v49];
        if not v64 and not v61 and #v56 > 0 then
            local v65 = v62 and -9999999 or 9999999;
            v64 = v8.new();
            v64:setImage(6069276526, "Deselected");
            v64:setName("Overflow" .. v49);
            v64:setOrder(v65);
            v64:setAlignment(v49);
            v64:autoDeselect(false);
            v64.isAnOverflow = true;
            v64:select("OverflowStart", v64);
            v64:setEnabled(false);
            v5[v49] = v64;
            v6[v64.UID] = true;
        end;
        local v66 = v49 == "Left" and "Right" or "Left";
        local v67 = v0.updateAvailableIcons(v66);
        local v68 = v62 and v67[1] or v63 and v67[#v67];
        local v69 = v5[v66];
        local v70 = v62 and l_X_2 + l_X_3 or l_X_2;
        if v68 then
            local _ = v68.widget;
            local v72 = v0.getRealXPositions(v66, v67)[v68.UID];
            local v73 = v0.getWidth(v68);
            v70 = v62 and v72 - l_Offset_1 or v72 + v73 + l_Offset_1;
        end;
        local v74 = v0.getAvailableIcons("Center");
        local v75 = v74[v62 and 1 or #v74];
        if v75 and not v75.hasRelocatedInOverflow then
            local v76 = v62 and v56[#v56] or v63 and v56[1];
            local l_X_4 = v75.widget.AbsolutePosition.X;
            local l_X_5 = v76.widget.AbsolutePosition.X;
            local v79 = v0.getWidth(v76);
            local v80 = v62 and l_X_4 - l_Offset_1 or l_X_4 + v0.getWidth(v75) + l_Offset_1;
            local v81 = v62 and l_X_5 + v79 or l_X_5;
            if v62 then
                if v80 < v81 then
                    v75:align("Left");
                    v75.hasRelocatedInOverflow = true;
                end;
            elseif v63 and v81 < v80 then
                v75:align("Right");
                v75.hasRelocatedInOverflow = true;
            end;
        end;
        if v64 then
            local l_v70_0 = v70;
            local v83 = v64:getInstance("Menu");
            local v84 = l_X_2 + l_X_3;
            local l_l_X_3_0 = l_X_3;
            if v83 and v69 then
                local l_X_6 = v69.widget.AbsolutePosition.X;
                local v87 = v0.getWidth(v69);
                local v88 = v62 and l_X_6 - l_Offset_1 or l_X_6 + v87 + l_Offset_1;
                local v89 = v69:getInstance("Menu");
                local v90 = v83.AbsoluteCanvasSize.X >= v89.AbsoluteCanvasSize.X;
                local v91 = l_X_2 + l_X_3 / 2;
                l_v70_0 = v62 and v91 - l_Offset_1 / 2 or v91 + l_Offset_1 / 2;
                if v90 then
                    l_v70_0 = v88;
                end;
                l_l_X_3_0 = v62 and l_v70_0 - l_X_2 or v84 - l_v70_0;
            end;
            local v92 = v83 and v83:GetAttribute("MaxWidth");
            l_l_X_3_0 = v7.round(l_l_X_3_0);
            if v83 and v92 ~= l_l_X_3_0 then
                v83:SetAttribute("MaxWidth", l_l_X_3_0);
            end;
        end;
        local v93 = false;
        local v94 = v0.getRealXPositions(v49, v56);
        for v95 = #v56, 1, -1 do
            local v96 = v56[v95];
            local v97 = v0.getWidth(v96);
            local v98 = v94[v96.UID];
            if v62 and v70 <= v98 + v97 or v63 and v98 <= v70 then
                v93 = true;
            end;
        end;
        for v99 = #v56, 1, -1 do
            local v100 = v56[v99];
            if not v6[v100.UID] then
                if v93 and not v100.parentIconUID then
                    v100:joinMenu(v64);
                elseif not v93 and v100.parentIconUID then
                    v100:leave();
                end;
            end;
        end;
        if v64.isEnabled ~= v93 then
            v64:setEnabled(v93);
        end;
        if v64.isEnabled and not v64.overflowAlreadyOpened then
            v64.overflowAlreadyOpened = true;
            v64:select();
        end;
        return;
    end;
end;
return v0;