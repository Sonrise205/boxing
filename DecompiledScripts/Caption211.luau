return function(v0) --[[ Line: 1 ]]
    local v1 = v0:getInstance("ClickRegion");
    local l_CanvasGroup_0 = Instance.new("CanvasGroup");
    l_CanvasGroup_0.Name = "Caption";
    l_CanvasGroup_0.AnchorPoint = Vector2.new(0.5, 0);
    l_CanvasGroup_0.BackgroundTransparency = 1;
    l_CanvasGroup_0.BorderSizePixel = 0;
    l_CanvasGroup_0.GroupTransparency = 1;
    l_CanvasGroup_0.Position = UDim2.fromOffset(0, 0);
    l_CanvasGroup_0.Visible = true;
    l_CanvasGroup_0.ZIndex = 30;
    l_CanvasGroup_0.Parent = v1;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "Box";
    l_Frame_0.AutomaticSize = Enum.AutomaticSize.XY;
    l_Frame_0.BackgroundColor3 = Color3.fromRGB(101, 102, 104);
    l_Frame_0.Position = UDim2.fromOffset(4, 7);
    l_Frame_0.ZIndex = 12;
    l_Frame_0.Parent = l_CanvasGroup_0;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "Header";
    l_TextLabel_0.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
    l_TextLabel_0.Text = "Caption";
    l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_0.TextSize = 14;
    l_TextLabel_0.TextTruncate = Enum.TextTruncate.None;
    l_TextLabel_0.TextWrapped = false;
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.X;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.LayoutOrder = 1;
    l_TextLabel_0.Size = UDim2.fromOffset(0, 16);
    l_TextLabel_0.ZIndex = 18;
    l_TextLabel_0.Parent = l_Frame_0;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.Name = "Layout";
    l_UIListLayout_0.Padding = UDim.new(0, 8);
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.Parent = l_Frame_0;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.Name = "CaptionCorner";
    l_UICorner_0.Parent = l_Frame_0;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.Name = "Padding";
    l_UIPadding_0.PaddingBottom = UDim.new(0, 12);
    l_UIPadding_0.PaddingLeft = UDim.new(0, 12);
    l_UIPadding_0.PaddingRight = UDim.new(0, 12);
    l_UIPadding_0.PaddingTop = UDim.new(0, 12);
    l_UIPadding_0.Parent = l_Frame_0;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "Hotkeys";
    l_Frame_1.AutomaticSize = Enum.AutomaticSize.Y;
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.LayoutOrder = 3;
    l_Frame_1.Size = UDim2.fromScale(1, 0);
    l_Frame_1.Visible = false;
    l_Frame_1.Parent = l_Frame_0;
    local l_UIListLayout_1 = Instance.new("UIListLayout");
    l_UIListLayout_1.Name = "Layout1";
    l_UIListLayout_1.Padding = UDim.new(0, 6);
    l_UIListLayout_1.FillDirection = Enum.FillDirection.Vertical;
    l_UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    l_UIListLayout_1.HorizontalFlex = Enum.UIFlexAlignment.None;
    l_UIListLayout_1.ItemLineAlignment = Enum.ItemLineAlignment.Automatic;
    l_UIListLayout_1.VerticalFlex = Enum.UIFlexAlignment.None;
    l_UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_1.Parent = l_Frame_1;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "Key1";
    l_ImageLabel_0.Image = "rbxasset://textures/ui/Controls/key_single.png";
    l_ImageLabel_0.ImageTransparency = 0.7;
    l_ImageLabel_0.ScaleType = Enum.ScaleType.Slice;
    l_ImageLabel_0.SliceCenter = Rect.new(5, 5, 23, 24);
    l_ImageLabel_0.AutomaticSize = Enum.AutomaticSize.X;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.LayoutOrder = 1;
    l_ImageLabel_0.Size = UDim2.fromOffset(0, 30);
    l_ImageLabel_0.ZIndex = 15;
    l_ImageLabel_0.Parent = l_Frame_1;
    local l_UIPadding_1 = Instance.new("UIPadding");
    l_UIPadding_1.Name = "Inset";
    l_UIPadding_1.PaddingLeft = UDim.new(0, 8);
    l_UIPadding_1.PaddingRight = UDim.new(0, 8);
    l_UIPadding_1.Parent = l_ImageLabel_0;
    local l_TextLabel_1 = Instance.new("TextLabel");
    l_TextLabel_1.AutoLocalize = false;
    l_TextLabel_1.Name = "LabelContent";
    l_TextLabel_1.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
    l_TextLabel_1.Text = "";
    l_TextLabel_1.TextColor3 = Color3.fromRGB(189, 190, 190);
    l_TextLabel_1.TextSize = 14;
    l_TextLabel_1.AutomaticSize = Enum.AutomaticSize.X;
    l_TextLabel_1.BackgroundTransparency = 1;
    l_TextLabel_1.Position = UDim2.fromOffset(0, -1);
    l_TextLabel_1.Size = UDim2.fromScale(1, 1);
    l_TextLabel_1.ZIndex = 16;
    l_TextLabel_1.Parent = l_ImageLabel_0;
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Name = "Caret";
    l_ImageLabel_1.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/AppImageAtlas/img_set_1x_1.png";
    l_ImageLabel_1.ImageColor3 = Color3.fromRGB(101, 102, 104);
    l_ImageLabel_1.ImageRectOffset = Vector2.new(260, 440);
    l_ImageLabel_1.ImageRectSize = Vector2.new(16, 8);
    l_ImageLabel_1.AnchorPoint = Vector2.new(0, 0.5);
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Position = UDim2.new(0, 0, 0, 4);
    l_ImageLabel_1.Rotation = 180;
    l_ImageLabel_1.Size = UDim2.fromOffset(16, 8);
    l_ImageLabel_1.ZIndex = 12;
    l_ImageLabel_1.Parent = l_CanvasGroup_0;
    local l_ImageLabel_2 = Instance.new("ImageLabel");
    l_ImageLabel_2.Name = "DropShadow";
    l_ImageLabel_2.Image = "rbxasset://LuaPackages/Packages/_Index/UIBlox/UIBlox/AppImageAtlas/img_set_1x_1.png";
    l_ImageLabel_2.ImageColor3 = Color3.fromRGB(0, 0, 0);
    l_ImageLabel_2.ImageRectOffset = Vector2.new(217, 486);
    l_ImageLabel_2.ImageRectSize = Vector2.new(25, 25);
    l_ImageLabel_2.ImageTransparency = 0.45;
    l_ImageLabel_2.ScaleType = Enum.ScaleType.Slice;
    l_ImageLabel_2.SliceCenter = Rect.new(12, 12, 13, 13);
    l_ImageLabel_2.BackgroundTransparency = 1;
    l_ImageLabel_2.Position = UDim2.fromOffset(0, 5);
    l_ImageLabel_2.Size = UDim2.new(1, 0, 0, 48);
    l_ImageLabel_2.Parent = l_CanvasGroup_0;
    l_Frame_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 147 ]]
        -- upvalues: l_ImageLabel_2 (copy), l_Frame_0 (copy)
        l_ImageLabel_2.Size = UDim2.new(1, 0, 0, l_Frame_0.AbsoluteSize.Y + 8);
    end);
    local l_captionJanitor_0 = v0.captionJanitor;
    local _, v17 = v0:clipOutside(l_CanvasGroup_0);
    v17.AutomaticSize = Enum.AutomaticSize.None;
    l_captionJanitor_0:add(l_CanvasGroup_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 157 ]] --[[ Name: matchSize ]]
        -- upvalues: l_CanvasGroup_0 (copy), v17 (copy)
        local l_AbsoluteSize_0 = l_CanvasGroup_0.AbsoluteSize;
        v17.Size = UDim2.fromOffset(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y);
    end));
    local l_AbsoluteSize_1 = l_CanvasGroup_0.AbsoluteSize;
    v17.Size = UDim2.fromOffset(l_AbsoluteSize_1.X, l_AbsoluteSize_1.Y);
    l_AbsoluteSize_1 = false;
    local l_Header_0 = l_CanvasGroup_0.Box.Header;
    local l_UserInputService_0 = game:GetService("UserInputService");
    local function v26(v22) --[[ Line: 170 ]] --[[ Name: updateHotkey ]]
        -- upvalues: l_UserInputService_0 (copy), l_CanvasGroup_0 (copy), v0 (copy), l_Header_0 (copy), l_TextLabel_1 (copy), l_Frame_1 (copy)
        local l_KeyboardEnabled_0 = l_UserInputService_0.KeyboardEnabled;
        local v24 = l_CanvasGroup_0:GetAttribute("CaptionText") or "";
        local v25 = v24 == "_hotkey_";
        if not l_KeyboardEnabled_0 and v25 then
            v0:setCaption();
            return;
        else
            l_Header_0.Text = v24;
            l_Header_0.Visible = not v25;
            if v22 then
                l_TextLabel_1.Text = v22.Name;
                l_Frame_1.Visible = true;
            end;
            if not l_KeyboardEnabled_0 then
                l_Frame_1.Visible = false;
            end;
            return;
        end;
    end;
    l_CanvasGroup_0:GetAttributeChangedSignal("CaptionText"):Connect(v26);
    local l_Quad_0 = Enum.EasingStyle.Quad;
    local v28 = TweenInfo.new(0.2, l_Quad_0, Enum.EasingDirection.In);
    local v29 = TweenInfo.new(0.2, l_Quad_0, Enum.EasingDirection.Out);
    local l_TweenService_0 = game:GetService("TweenService");
    local l_RunService_0 = game:GetService("RunService");
    local function _(v32) --[[ Line: 196 ]] --[[ Name: getCaptionPosition ]]
        -- upvalues: l_AbsoluteSize_1 (ref)
        local v33 = (if v32 ~= nil then v32 else l_AbsoluteSize_1) and 10 or 2;
        return UDim2.new(0.5, 0, 1, v33);
    end;
    local function v49(v35) --[[ Line: 203 ]] --[[ Name: updatePosition ]]
        -- upvalues: l_AbsoluteSize_1 (ref), l_ImageLabel_1 (copy), l_CanvasGroup_0 (copy), v1 (copy), v17 (copy), v28 (copy), v29 (copy), l_TweenService_0 (copy), l_RunService_0 (copy)
        if not l_AbsoluteSize_1 then
            return;
        else
            local v36 = if v35 ~= nil then v35 else l_AbsoluteSize_1;
            local v37 = not v36;
            local v38 = (if v37 ~= nil then v37 else l_AbsoluteSize_1) and 10 or 2;
            local v39 = UDim2.new(0.5, 0, 1, v38);
            v38 = (if v36 ~= nil then v36 else l_AbsoluteSize_1) and 10 or 2;
            v37 = UDim2.new(0.5, 0, 1, v38);
            if v36 then
                local l_Offset_0 = l_ImageLabel_1.Position.Y.Offset;
                l_ImageLabel_1.Position = UDim2.fromOffset(0, l_Offset_0);
                l_CanvasGroup_0.AutomaticSize = Enum.AutomaticSize.XY;
                l_CanvasGroup_0.Size = UDim2.fromOffset(32, 53);
            else
                local l_AbsoluteSize_2 = l_CanvasGroup_0.AbsoluteSize;
                l_CanvasGroup_0.AutomaticSize = Enum.AutomaticSize.Y;
                l_CanvasGroup_0.Size = UDim2.fromOffset(l_AbsoluteSize_2.X, l_AbsoluteSize_2.Y);
            end;
            local v42 = nil;
            v38 = function() --[[ Line: 232 ]] --[[ Name: updateCaret ]]
                -- upvalues: v1 (ref), l_CanvasGroup_0 (ref), l_ImageLabel_1 (ref), v42 (ref)
                local v43 = v1.AbsolutePosition.X - l_CanvasGroup_0.AbsolutePosition.X + v1.AbsoluteSize.X / 2 - l_ImageLabel_1.AbsoluteSize.X / 2;
                local l_Offset_1 = l_ImageLabel_1.Position.Y.Offset;
                local v45 = UDim2.fromOffset(v43, l_Offset_1);
                if v42 ~= v43 then
                    v42 = v43;
                    l_ImageLabel_1.Position = UDim2.fromOffset(0, l_Offset_1);
                    task.wait();
                end;
                l_ImageLabel_1.Position = v45;
            end;
            v17.Position = v39;
            v38();
            local v46 = v36 and v28 or v29;
            local v47 = l_TweenService_0:Create(v17, v46, {
                Position = v37
            });
            local v48 = l_RunService_0.Heartbeat:Connect(v38);
            v47:Play();
            v47.Completed:Once(function() --[[ Line: 255 ]]
                -- upvalues: v48 (copy)
                v48:Disconnect();
            end);
            return;
        end;
    end;
    l_captionJanitor_0:add(v1:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 260 ]]
        -- upvalues: v49 (copy)
        v49();
    end));
    v49(false);
    l_captionJanitor_0:add(v0.toggleKeyAdded:Connect(v26));
    for v50, _ in pairs(v0.bindedToggleKeys) do
        local l_KeyboardEnabled_1 = l_UserInputService_0.KeyboardEnabled;
        local v53 = l_CanvasGroup_0:GetAttribute("CaptionText") or "";
        local v54 = v53 == "_hotkey_";
        if not l_KeyboardEnabled_1 and v54 then
            v0:setCaption();
            break;
        else
            l_Header_0.Text = v53;
            l_Header_0.Visible = not v54;
            if v50 then
                l_TextLabel_1.Text = v50.Name;
                l_Frame_1.Visible = true;
            end;
            if not l_KeyboardEnabled_1 then
                l_Frame_1.Visible = false;
                break;
            else
                break;
            end;
        end;
    end;
    l_captionJanitor_0:add(v0.fakeToggleKeyChanged:Connect(v26));
    local l_fakeToggleKey_0 = v0.fakeToggleKey;
    if l_fakeToggleKey_0 then
        local l_KeyboardEnabled_2 = l_UserInputService_0.KeyboardEnabled;
        local v57 = l_CanvasGroup_0:GetAttribute("CaptionText") or "";
        local v58 = v57 == "_hotkey_";
        if not l_KeyboardEnabled_2 and v58 then
            v0:setCaption();
        else
            l_Header_0.Text = v57;
            l_Header_0.Visible = not v58;
            if l_fakeToggleKey_0 then
                l_TextLabel_1.Text = l_fakeToggleKey_0.Name;
                l_Frame_1.Visible = true;
            end;
            if not l_KeyboardEnabled_2 then
                l_Frame_1.Visible = false;
            end;
        end;
    end;
    local function v66(v59) --[[ Line: 276 ]] --[[ Name: setCaptionEnabled ]]
        -- upvalues: l_AbsoluteSize_1 (ref), v0 (copy), v28 (copy), v29 (copy), l_TweenService_0 (copy), l_CanvasGroup_0 (copy), v49 (copy), l_UserInputService_0 (copy), l_Header_0 (copy), l_Frame_1 (copy)
        if l_AbsoluteSize_1 == v59 then
            return;
        else
            local l_joinedFrame_0 = v0.joinedFrame;
            if l_joinedFrame_0 and string.match(l_joinedFrame_0.Name, "Dropdown") then
                v59 = false;
            end;
            l_AbsoluteSize_1 = v59;
            local v61 = v59 and 0 or 1;
            local v62 = v59 and v28 or v29;
            l_TweenService_0:Create(l_CanvasGroup_0, v62, {
                GroupTransparency = v61
            }):Play();
            v49();
            local l_KeyboardEnabled_3 = l_UserInputService_0.KeyboardEnabled;
            local v64 = l_CanvasGroup_0:GetAttribute("CaptionText") or "";
            local v65 = v64 == "_hotkey_";
            if not l_KeyboardEnabled_3 and v65 then
                v0:setCaption();
                return;
            else
                l_Header_0.Text = v64;
                l_Header_0.Visible = not v65;
                if not l_KeyboardEnabled_3 then
                    l_Frame_1.Visible = false;
                end;
                return;
            end;
        end;
    end;
    local v67 = require(v0.iconModule);
    l_captionJanitor_0:add(v0.stateChanged:Connect(function(v68) --[[ Line: 298 ]]
        -- upvalues: v67 (copy), v0 (copy), v66 (copy)
        if v68 == "Viewing" then
            local l_captionLastClosedClock_0 = v67.captionLastClosedClock;
            local v70 = (l_captionLastClosedClock_0 and os.clock() - l_captionLastClosedClock_0 or 999) < 0.3 and 0 or 0.5;
            task.delay(v70, function() --[[ Line: 303 ]]
                -- upvalues: v0 (ref), v66 (ref)
                if v0.activeState == "Viewing" then
                    v66(true);
                end;
            end);
            return;
        else
            v67.captionLastClosedClock = os.clock();
            v66(false);
            return;
        end;
    end));
    return l_CanvasGroup_0;
end;