return function(v0) --[[ Line: 1 ]]
    local l_GuiService_0 = game:GetService("GuiService");
    local l_isOldTopbar_0 = v0.isOldTopbar;
    local v3 = {};
    local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
    local v5 = l_GuiService_0:IsTenFootInterface();
    local v6 = l_isOldTopbar_0 and 12 or l_l_GuiService_0_GuiInset_0.Y - 46;
    if v5 then
        v6 = 10;
    end;
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0:SetAttribute("StartInset", v6);
    l_ScreenGui_0.Name = "TopbarStandard";
    l_ScreenGui_0.Enabled = true;
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    l_ScreenGui_0.IgnoreGuiInset = true;
    l_ScreenGui_0.ResetOnSpawn = false;
    l_ScreenGui_0.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets;
    v3[l_ScreenGui_0.Name] = l_ScreenGui_0;
    l_ScreenGui_0.DisplayOrder = v0.baseDisplayOrder;
    v0.baseDisplayOrderChanged:Connect(function() --[[ Line: 22 ]]
        -- upvalues: l_ScreenGui_0 (copy), v0 (copy)
        l_ScreenGui_0.DisplayOrder = v0.baseDisplayOrder;
    end);
    local l_Frame_0 = Instance.new("Frame");
    local v9 = l_isOldTopbar_0 and 2 or 0;
    local v10 = -2;
    if v5 then
        v9 = v9 + 13;
        v10 = 50;
    end;
    l_Frame_0.Name = "Holders";
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Position = UDim2.new(0, 0, 0, v9);
    l_Frame_0.Size = UDim2.new(1, 0, 1, v10);
    l_Frame_0.Visible = true;
    l_Frame_0.ZIndex = 1;
    l_Frame_0.Parent = l_ScreenGui_0;
    local v11 = l_ScreenGui_0:Clone();
    local l_Holders_0 = v11.Holders;
    local l_GuiService_1 = game:GetService("GuiService");
    local function v14() --[[ Line: 44 ]] --[[ Name: updateCenteredHoldersHeight ]]
        -- upvalues: l_Holders_0 (copy), l_GuiService_1 (copy), v10 (ref)
        l_Holders_0.Size = UDim2.new(1, 0, 0, l_GuiService_1.TopbarInset.Height + v10);
    end;
    v11.Name = "TopbarCentered";
    v11.ScreenInsets = Enum.ScreenInsets.None;
    v0.baseDisplayOrderChanged:Connect(function() --[[ Line: 49 ]]
        -- upvalues: v11 (copy), v0 (copy)
        v11.DisplayOrder = v0.baseDisplayOrder;
    end);
    v3[v11.Name] = v11;
    l_GuiService_1:GetPropertyChangedSignal("TopbarInset"):Connect(v14);
    l_Holders_0.Size = UDim2.new(1, 0, 0, l_GuiService_1.TopbarInset.Height + v10);
    local v15 = l_ScreenGui_0:Clone();
    v15.Name = v15.Name .. "Clipped";
    v15.DisplayOrder = v15.DisplayOrder + 1;
    v0.baseDisplayOrderChanged:Connect(function() --[[ Line: 59 ]]
        -- upvalues: v15 (copy), v0 (copy)
        v15.DisplayOrder = v0.baseDisplayOrder + 1;
    end);
    v3[v15.Name] = v15;
    local v16 = v11:Clone();
    v16.Name = v16.Name .. "Clipped";
    v16.DisplayOrder = v16.DisplayOrder + 1;
    v0.baseDisplayOrderChanged:Connect(function() --[[ Line: 67 ]]
        -- upvalues: v16 (copy), v0 (copy)
        v16.DisplayOrder = v0.baseDisplayOrder + 1;
    end);
    v3[v16.Name] = v16;
    if l_isOldTopbar_0 then
        task.defer(function() --[[ Line: 73 ]]
            -- upvalues: l_GuiService_1 (copy), v0 (copy)
            local function v17() --[[ Line: 74 ]] --[[ Name: decideToHideTopbar ]]
                -- upvalues: l_GuiService_1 (ref), v0 (ref)
                if l_GuiService_1.MenuIsOpen then
                    v0.setTopbarEnabled(false, true);
                    return;
                else
                    v0.setTopbarEnabled();
                    return;
                end;
            end;
            l_GuiService_1:GetPropertyChangedSignal("MenuIsOpen"):Connect(v17);
            if l_GuiService_1.MenuIsOpen then
                v0.setTopbarEnabled(false, true);
                return;
            else
                v0.setTopbarEnabled();
                return;
            end;
        end);
    end;
    local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
    l_ScrollingFrame_0:SetAttribute("IsAHolder", true);
    l_ScrollingFrame_0.Name = "Left";
    l_ScrollingFrame_0.Position = UDim2.fromOffset(v6, 0);
    l_ScrollingFrame_0.Size = UDim2.new(1, -24, 1, 0);
    l_ScrollingFrame_0.BackgroundTransparency = 1;
    l_ScrollingFrame_0.Visible = true;
    l_ScrollingFrame_0.ZIndex = 1;
    l_ScrollingFrame_0.Active = false;
    l_ScrollingFrame_0.ClipsDescendants = true;
    l_ScrollingFrame_0.HorizontalScrollBarInset = Enum.ScrollBarInset.None;
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 1, -1);
    l_ScrollingFrame_0.AutomaticCanvasSize = Enum.AutomaticSize.X;
    l_ScrollingFrame_0.ScrollingDirection = Enum.ScrollingDirection.X;
    l_ScrollingFrame_0.ScrollBarThickness = 0;
    l_ScrollingFrame_0.BorderSizePixel = 0;
    l_ScrollingFrame_0.Selectable = false;
    l_ScrollingFrame_0.ScrollingEnabled = false;
    l_ScrollingFrame_0.ElasticBehavior = Enum.ElasticBehavior.Never;
    l_ScrollingFrame_0.Parent = l_Frame_0;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.Padding = UDim.new(0, v6);
    l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Bottom;
    l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Left;
    l_UIListLayout_0.Parent = l_ScrollingFrame_0;
    local v20 = l_ScrollingFrame_0:Clone();
    v20.ScrollingEnabled = false;
    v20.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    v20.Name = "Center";
    v20.Parent = l_Holders_0;
    local v21 = l_ScrollingFrame_0:Clone();
    v21.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right;
    v21.Name = "Right";
    v21.AnchorPoint = Vector2.new(1, 0);
    v21.Position = UDim2.new(1, -12, 0, 0);
    v21.Parent = l_Frame_0;
    return v3;
end;