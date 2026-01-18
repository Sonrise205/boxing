return function(v0) --[[ Line: 1 ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "Dropdown";
    l_Frame_0.AutomaticSize = Enum.AutomaticSize.XY;
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0);
    l_Frame_0.Position = UDim2.new(0.5, 0, 1, 10);
    l_Frame_0.ZIndex = -2;
    l_Frame_0.ClipsDescendants = true;
    l_Frame_0.Parent = v0.widget;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.Name = "DropdownCorner";
    l_UICorner_0.CornerRadius = UDim.new(0, 10);
    l_UICorner_0.Parent = l_Frame_0;
    local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
    l_ScrollingFrame_0.Name = "DropdownScroller";
    l_ScrollingFrame_0.AutomaticSize = Enum.AutomaticSize.X;
    l_ScrollingFrame_0.BackgroundTransparency = 1;
    l_ScrollingFrame_0.BorderSizePixel = 0;
    l_ScrollingFrame_0.AnchorPoint = Vector2.new(0, 0);
    l_ScrollingFrame_0.Position = UDim2.new(0, 0, 0, 0);
    l_ScrollingFrame_0.ZIndex = -1;
    l_ScrollingFrame_0.ClipsDescendants = true;
    l_ScrollingFrame_0.Visible = true;
    l_ScrollingFrame_0.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar;
    l_ScrollingFrame_0.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right;
    l_ScrollingFrame_0.Active = false;
    l_ScrollingFrame_0.ScrollingEnabled = true;
    l_ScrollingFrame_0.AutomaticCanvasSize = Enum.AutomaticSize.Y;
    l_ScrollingFrame_0.ScrollBarThickness = 5;
    l_ScrollingFrame_0.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255);
    l_ScrollingFrame_0.ScrollBarImageTransparency = 0.8;
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
    l_ScrollingFrame_0.Selectable = false;
    l_ScrollingFrame_0.Active = true;
    l_ScrollingFrame_0.Parent = l_Frame_0;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.Name = "DropdownPadding";
    l_UIPadding_0.PaddingTop = UDim.new(0, 8);
    l_UIPadding_0.PaddingBottom = UDim.new(0, 8);
    l_UIPadding_0.Parent = l_ScrollingFrame_0;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.Name = "DropdownList";
    l_UIListLayout_0.FillDirection = Enum.FillDirection.Vertical;
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    l_UIListLayout_0.HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly;
    l_UIListLayout_0.Parent = l_ScrollingFrame_0;
    local l_dropdownJanitor_0 = v0.dropdownJanitor;
    local v7 = require(v0.iconModule);
    v0.dropdownChildAdded:Connect(function(v8) --[[ Line: 58 ]]
        local _, v10 = v8:modifyTheme({
            {
                "Widget", 
                "BorderSize", 
                0
            }, 
            {
                "IconCorners", 
                "CornerRadius", 
                UDim.new(0, 4)
            }, 
            {
                "Widget", 
                "MinimumWidth", 
                190
            }, 
            {
                "Widget", 
                "MinimumHeight", 
                56
            }, 
            {
                "IconLabel", 
                "TextSize", 
                19
            }, 
            {
                "PaddingLeft", 
                "Size", 
                UDim2.fromOffset(25, 0)
            }, 
            {
                "Notice", 
                "Position", 
                UDim2.new(1, -24, 0, 5)
            }, 
            {
                "ContentsList", 
                "HorizontalAlignment", 
                Enum.HorizontalAlignment.Left
            }, 
            {
                "Selection", 
                "Size", 
                UDim2.new(1, -8, 1, -8)
            }, 
            {
                "Selection", 
                "Position", 
                UDim2.new(0, 4, 0, 4)
            }
        });
        task.defer(function() --[[ Line: 72 ]]
            -- upvalues: v8 (copy), v10 (copy)
            v8.joinJanitor:add(function() --[[ Line: 73 ]]
                -- upvalues: v8 (ref), v10 (ref)
                v8:removeModification(v10);
            end);
        end);
    end);
    v0.dropdownSet:Connect(function(v11) --[[ Line: 78 ]]
        -- upvalues: v0 (copy), v7 (copy)
        for _, v13 in pairs(v0.dropdownIcons) do
            v7.getIconByUID(v13):destroy();
        end;
        local _ = #v11;
        if type(v11) == "table" then
            for _, v16 in pairs(v11) do
                v16:joinDropdown(v0);
            end;
        end;
    end);
    local v17 = require(script.Parent.Parent.Utility);
    l_dropdownJanitor_0:add(v0.toggled:Connect(function() --[[ Line: 95 ]] --[[ Name: updateVisibility ]]
        -- upvalues: v17 (copy), l_Frame_0 (copy), v0 (copy)
        v17.setVisible(l_Frame_0, v0.isSelected, "InternalDropdown");
    end));
    v17.setVisible(l_Frame_0, v0.isSelected, "InternalDropdown");
    local v18 = 0;
    local v19 = false;
    local function v20() --[[ Line: 107 ]] --[[ Name: updateMaxIcons ]]
        -- upvalues: v18 (ref), v19 (ref), v20 (copy), l_Frame_0 (copy), l_ScrollingFrame_0 (copy), v7 (copy), v0 (copy), l_UIPadding_0 (copy)
        v18 = v18 + 1;
        if v19 then
            return;
        else
            local l_v18_0 = v18;
            v19 = true;
            task.defer(function() --[[ Line: 116 ]]
                -- upvalues: v19 (ref), v18 (ref), l_v18_0 (copy), v20 (ref)
                v19 = false;
                if v18 ~= l_v18_0 then
                    v20();
                end;
            end);
            local l_l_Frame_0_Attribute_0 = l_Frame_0:GetAttribute("MaxIcons");
            if not l_l_Frame_0_Attribute_0 then
                return;
            else
                local v23 = {};
                for _, v25 in pairs(l_ScrollingFrame_0:GetChildren()) do
                    if v25:IsA("GuiObject") then
                        table.insert(v23, {
                            v25, 
                            v25.AbsolutePosition.Y
                        });
                    end;
                end;
                table.sort(v23, function(v26, v27) --[[ Line: 133 ]]
                    return v26[2] < v27[2];
                end);
                local v28 = 0;
                local v29 = false;
                for v30 = 1, l_l_Frame_0_Attribute_0 do
                    local v31 = v23[v30];
                    if v31 then
                        local v32 = v31[1];
                        v28 = v28 + v32.AbsoluteSize.Y;
                        local l_v32_Attribute_0 = v32:GetAttribute("WidgetUID");
                        local v34 = l_v32_Attribute_0 and v7.getIconByUID(l_v32_Attribute_0);
                        if v34 then
                            local v35 = nil;
                            if not v29 then
                                v29 = true;
                                v35 = v0:getInstance("ClickRegion");
                            end;
                            v34:getInstance("ClickRegion").NextSelectionUp = v35;
                        end;
                    else
                        break;
                    end;
                end;
                v28 = v28 + l_UIPadding_0.PaddingTop.Offset + l_UIPadding_0.PaddingBottom.Offset;
                l_ScrollingFrame_0.Size = UDim2.fromOffset(0, v28);
                return;
            end;
        end;
    end;
    l_dropdownJanitor_0:add(l_ScrollingFrame_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v20));
    l_dropdownJanitor_0:add(l_ScrollingFrame_0.ChildAdded:Connect(v20));
    l_dropdownJanitor_0:add(l_ScrollingFrame_0.ChildRemoved:Connect(v20));
    l_dropdownJanitor_0:add(l_Frame_0:GetAttributeChangedSignal("MaxIcons"):Connect(v20));
    l_dropdownJanitor_0:add(v0.childThemeModified:Connect(v20));
    v20();
    return l_Frame_0;
end;