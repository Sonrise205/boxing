return function(v0) --[[ Line: 1 ]]
    local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
    l_ScrollingFrame_0.Name = "Menu";
    l_ScrollingFrame_0.BackgroundTransparency = 1;
    l_ScrollingFrame_0.Visible = true;
    l_ScrollingFrame_0.ZIndex = 1;
    l_ScrollingFrame_0.Size = UDim2.fromScale(1, 1);
    l_ScrollingFrame_0.ClipsDescendants = true;
    l_ScrollingFrame_0.TopImage = "";
    l_ScrollingFrame_0.BottomImage = "";
    l_ScrollingFrame_0.HorizontalScrollBarInset = Enum.ScrollBarInset.Always;
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 1, -1);
    l_ScrollingFrame_0.ScrollingEnabled = true;
    l_ScrollingFrame_0.ScrollingDirection = Enum.ScrollingDirection.X;
    l_ScrollingFrame_0.ZIndex = 20;
    l_ScrollingFrame_0.ScrollBarThickness = 3;
    l_ScrollingFrame_0.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255);
    l_ScrollingFrame_0.ScrollBarImageTransparency = 0.8;
    l_ScrollingFrame_0.BorderSizePixel = 0;
    l_ScrollingFrame_0.Selectable = false;
    local v2 = require(v0.iconModule);
    local v3 = v2.container.TopbarStandard:FindFirstChild("UIListLayout", true):Clone();
    v3.Name = "MenuUIListLayout";
    v3.VerticalAlignment = Enum.VerticalAlignment.Center;
    v3.Parent = l_ScrollingFrame_0;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "MenuGap";
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Visible = false;
    l_Frame_0.AnchorPoint = Vector2.new(0, 0.5);
    l_Frame_0.ZIndex = 5;
    l_Frame_0.Parent = l_ScrollingFrame_0;
    local v5 = false;
    local v6 = require(script.Parent.Parent.Features.Themes);
    local function v33() --[[ Line: 39 ]] --[[ Name: totalChildrenChanged ]]
        -- upvalues: v0 (copy), v5 (ref), l_ScrollingFrame_0 (copy), v6 (copy), v3 (copy)
        local l_menuJanitor_0 = v0.menuJanitor;
        local v8 = #v0.menuIcons;
        if v5 then
            if v8 <= 0 then
                l_menuJanitor_0:clean();
                v5 = false;
            end;
            return;
        else
            v5 = true;
            l_menuJanitor_0:add(v0.toggled:Connect(function() --[[ Line: 53 ]]
                -- upvalues: v0 (ref)
                if #v0.menuIcons > 0 then
                    v0.updateSize:Fire();
                end;
            end));
            local _, v10 = v0:modifyTheme({
                {
                    "Menu", 
                    "Active", 
                    true
                }
            });
            task.defer(function() --[[ Line: 63 ]]
                -- upvalues: l_menuJanitor_0 (copy), v0 (ref), v10 (copy)
                l_menuJanitor_0:add(function() --[[ Line: 64 ]]
                    -- upvalues: v0 (ref), v10 (ref)
                    v0:removeModification(v10);
                end);
            end);
            local l_X_0 = l_ScrollingFrame_0.AbsoluteCanvasSize.X;
            local function v14() --[[ Line: 73 ]] --[[ Name: rightAlignCanvas ]]
                -- upvalues: v0 (ref), l_ScrollingFrame_0 (ref), l_X_0 (ref)
                if v0.alignment == "Right" then
                    local l_X_1 = l_ScrollingFrame_0.AbsoluteCanvasSize.X;
                    local v13 = l_X_0 - l_X_1;
                    l_X_0 = l_X_1;
                    l_ScrollingFrame_0.CanvasPosition = Vector2.new(l_ScrollingFrame_0.CanvasPosition.X - v13, 0);
                end;
            end;
            l_menuJanitor_0:add(v0.selected:Connect(v14));
            l_menuJanitor_0:add(l_ScrollingFrame_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v14));
            local v15 = v0:getStateGroup();
            if v6.getThemeValue(v15, "IconImage", "Image", "Deselected") == v6.getThemeValue(v15, "IconImage", "Image", "Selected") then
                local v16 = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Light, Enum.FontStyle.Normal);
                v0:removeModificationWith("IconLabel", "Text", "Viewing");
                v0:removeModificationWith("IconLabel", "Image", "Viewing");
                v0:modifyTheme({
                    {
                        "IconLabel", 
                        "FontFace", 
                        v16, 
                        "Selected"
                    }, 
                    {
                        "IconLabel", 
                        "Text", 
                        "X", 
                        "Selected"
                    }, 
                    {
                        "IconLabel", 
                        "TextSize", 
                        20, 
                        "Selected"
                    }, 
                    {
                        "IconLabel", 
                        "TextStrokeTransparency", 
                        0.8, 
                        "Selected"
                    }, 
                    {
                        "IconImage", 
                        "Image", 
                        "", 
                        "Selected"
                    }
                });
            end;
            local v17 = v0:getInstance("IconSpot");
            local v18 = v0:getInstance("MenuGap");
            local function v19() --[[ Line: 105 ]] --[[ Name: updateAlignent ]]
                -- upvalues: v0 (ref), v17 (copy), v18 (copy)
                if v0.alignment == "Right" then
                    v17.LayoutOrder = 99999;
                    v18.LayoutOrder = 99998;
                    return;
                else
                    v17.LayoutOrder = -99999;
                    v18.LayoutOrder = -99998;
                    return;
                end;
            end;
            l_menuJanitor_0:add(v0.alignmentChanged:Connect(v19));
            if v0.alignment == "Right" then
                v17.LayoutOrder = 99999;
                v18.LayoutOrder = 99998;
            else
                v17.LayoutOrder = -99999;
                v18.LayoutOrder = -99998;
            end;
            l_ScrollingFrame_0:GetAttributeChangedSignal("MenuCanvasWidth"):Connect(function() --[[ Line: 120 ]]
                -- upvalues: l_ScrollingFrame_0 (ref)
                local l_l_ScrollingFrame_0_Attribute_0 = l_ScrollingFrame_0:GetAttribute("MenuCanvasWidth");
                local l_Y_0 = l_ScrollingFrame_0.CanvasSize.Y;
                l_ScrollingFrame_0.CanvasSize = UDim2.new(0, l_l_ScrollingFrame_0_Attribute_0, l_Y_0.Scale, l_Y_0.Offset);
            end);
            l_menuJanitor_0:add(v0.updateMenu:Connect(function() --[[ Line: 125 ]]
                -- upvalues: l_ScrollingFrame_0 (ref), v3 (ref)
                local l_l_ScrollingFrame_0_Attribute_1 = l_ScrollingFrame_0:GetAttribute("MaxIcons");
                if not l_l_ScrollingFrame_0_Attribute_1 then
                    return;
                else
                    local v23 = {};
                    for _, v25 in pairs(l_ScrollingFrame_0:GetChildren()) do
                        if v25:GetAttribute("WidgetUID") and v25.Visible then
                            table.insert(v23, {
                                v25, 
                                v25.AbsolutePosition.X
                            });
                        end;
                    end;
                    table.sort(v23, function(v26, v27) --[[ Line: 137 ]]
                        return v26[2] < v27[2];
                    end);
                    local v28 = 0;
                    for v29 = 1, l_l_ScrollingFrame_0_Attribute_1 do
                        local v30 = v23[v29];
                        if v30 then
                            v28 = v28 + (v30[1].AbsoluteSize.X + v3.Padding.Offset);
                        else
                            break;
                        end;
                    end;
                    l_ScrollingFrame_0:SetAttribute("MenuWidth", v28);
                    return;
                end;
            end));
            local function v31() --[[ Line: 152 ]] --[[ Name: startMenuUpdate ]]
                -- upvalues: v0 (ref)
                task.delay(0.1, function() --[[ Line: 153 ]]
                    -- upvalues: v0 (ref)
                    v0.startMenuUpdate:Fire();
                end);
            end;
            local _ = v0:getInstance("IconButton").AbsoluteSize.X;
            l_menuJanitor_0:add(l_ScrollingFrame_0.ChildAdded:Connect(v31));
            l_menuJanitor_0:add(l_ScrollingFrame_0.ChildRemoved:Connect(v31));
            l_menuJanitor_0:add(l_ScrollingFrame_0:GetAttributeChangedSignal("MaxIcons"):Connect(v31));
            l_menuJanitor_0:add(l_ScrollingFrame_0:GetAttributeChangedSignal("MaxWidth"):Connect(v31));
            task.delay(0.1, function() --[[ Line: 153 ]]
                -- upvalues: v0 (ref)
                v0.startMenuUpdate:Fire();
            end);
            return;
        end;
    end;
    v0.menuChildAdded:Connect(v33);
    v0.menuSet:Connect(function(v34) --[[ Line: 167 ]]
        -- upvalues: v0 (copy), v2 (copy)
        for _, v36 in pairs(v0.menuIcons) do
            v2.getIconByUID(v36):destroy();
        end;
        local _ = #v34;
        if type(v34) == "table" then
            for _, v39 in pairs(v34) do
                v39:joinMenu(v0);
            end;
        end;
    end);
    return l_ScrollingFrame_0;
end;