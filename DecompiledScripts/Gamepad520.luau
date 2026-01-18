local l_GamepadService_0 = game:GetService("GamepadService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = {};
local v4 = nil;
v3.start = function(v5) --[[ Line: 24 ]] --[[ Name: start ]]
    -- upvalues: v4 (ref), l_GuiService_0 (copy), l_UserInputService_0 (copy), v3 (copy), l_GamepadService_0 (copy)
    v4 = v5;
    v4.highlightKey = Enum.KeyCode.DPadUp;
    v4.highlightIcon = false;
    task.delay(1, function() --[[ Line: 33 ]]
        -- upvalues: v4 (ref), l_GuiService_0 (ref), l_UserInputService_0 (ref), v3 (ref), l_GamepadService_0 (ref)
        local l_iconsDictionary_0 = v4.iconsDictionary;
        local function _() --[[ Line: 36 ]] --[[ Name: getIconFromSelectedObject ]]
            -- upvalues: l_GuiService_0 (ref), l_iconsDictionary_0 (copy)
            local l_SelectedObject_0 = l_GuiService_0.SelectedObject;
            local v8 = l_SelectedObject_0 and l_SelectedObject_0:GetAttribute("CorrespondingIconUID");
            return v8 and l_iconsDictionary_0[v8];
        end;
        local v10 = nil;
        local v11 = false;
        local v12 = false;
        local _ = require(script.Parent.Parent.Utility);
        local v14 = require(script.Parent.Parent.Elements.Selection);
        local function v19() --[[ Line: 50 ]] --[[ Name: updateSelectedObject ]]
            -- upvalues: l_GuiService_0 (ref), l_iconsDictionary_0 (copy), l_UserInputService_0 (ref), v14 (copy), v4 (ref), v10 (ref), v12 (ref), v11 (ref), v3 (ref)
            local l_SelectedObject_1 = l_GuiService_0.SelectedObject;
            local v16 = l_SelectedObject_1 and l_SelectedObject_1:GetAttribute("CorrespondingIconUID");
            local v17 = v16 and l_iconsDictionary_0[v16];
            l_SelectedObject_1 = l_UserInputService_0.GamepadEnabled;
            if v17 then
                if l_SelectedObject_1 then
                    v16 = v17:getInstance("ClickRegion");
                    local l_selection_0 = v17.selection;
                    if not l_selection_0 then
                        l_selection_0 = v17.janitor:add(v14(v4));
                        l_selection_0:SetAttribute("IgnoreVisibilityUpdater", true);
                        l_selection_0.Parent = v17.widget;
                        v17.selection = l_selection_0;
                        v17:refreshAppearance(l_selection_0);
                    end;
                    v16.SelectionImageObject = l_selection_0.Selection;
                end;
                if v10 and v10 ~= v17 then
                    v10:setIndicator();
                end;
                v16 = if not l_SelectedObject_1 or v12 or v17.parentIconUID then nil else Enum.KeyCode.ButtonB;
                v10 = v17;
                v4.lastHighlightedIcon = v17;
                v17:setIndicator(v16);
                return;
            else
                v16 = if not l_SelectedObject_1 or v11 then nil else v4.highlightKey;
                if not v10 then
                    v10 = v3.getIconToHighlight();
                end;
                if v16 == v4.highlightKey then
                    v11 = true;
                end;
                if v10 then
                    v10:setIndicator(v16);
                end;
                return;
            end;
        end;
        l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(v19);
        local function v20() --[[ Line: 93 ]] --[[ Name: checkGamepadEnabled ]]
            -- upvalues: l_UserInputService_0 (ref), v11 (ref), v12 (ref), v19 (copy)
            if not l_UserInputService_0.GamepadEnabled then
                v11 = false;
                v12 = false;
            end;
            v19();
        end;
        l_UserInputService_0:GetPropertyChangedSignal("GamepadEnabled"):Connect(v20);
        if not l_UserInputService_0.GamepadEnabled then
            v11 = false;
            v12 = false;
        end;
        v19();
        l_UserInputService_0.InputBegan:Connect(function(v21, _) --[[ Line: 107 ]]
            -- upvalues: l_GuiService_0 (ref), l_iconsDictionary_0 (copy), v4 (ref), v3 (ref), l_GamepadService_0 (ref)
            if v21.UserInputType == Enum.UserInputType.MouseButton1 then
                local l_SelectedObject_2 = l_GuiService_0.SelectedObject;
                local v24 = l_SelectedObject_2 and l_SelectedObject_2:GetAttribute("CorrespondingIconUID");
                if v24 and l_iconsDictionary_0[v24] then
                    l_GuiService_0.SelectedObject = nil;
                end;
                return;
            elseif v21.KeyCode ~= v4.highlightKey then
                return;
            else
                local v25 = v3.getIconToHighlight();
                if v25 then
                    if l_GamepadService_0.GamepadCursorEnabled then
                        task.wait(0.2);
                        l_GamepadService_0:DisableGamepadCursor();
                    end;
                    l_GuiService_0.SelectedObject = v25:getInstance("ClickRegion");
                end;
                return;
            end;
        end);
    end);
end;
v3.getIconToHighlight = function() --[[ Line: 134 ]] --[[ Name: getIconToHighlight ]]
    -- upvalues: v4 (ref)
    local l_iconsDictionary_1 = v4.iconsDictionary;
    local v27 = v4.highlightIcon or v4.lastHighlightedIcon;
    if not v27 then
        local v28 = nil;
        for _, v30 in pairs(l_iconsDictionary_1) do
            if not v30.parentIconUID then
                local l_X_0 = v30.widget.AbsolutePosition.X;
                if not v28 or l_X_0 < v28 then
                    v27 = v30;
                    v28 = v27.widget.AbsolutePosition.X;
                end;
            end;
        end;
    end;
    return v27;
end;
v3.registerButton = function(v32) --[[ Line: 156 ]] --[[ Name: registerButton ]]
    -- upvalues: l_UserInputService_0 (copy), l_GamepadService_0 (copy), l_GuiService_0 (copy)
    local v33 = false;
    v32.InputBegan:Connect(function(_) --[[ Line: 162 ]]
        -- upvalues: v33 (ref)
        v33 = true;
        task.wait();
        task.wait();
        v33 = false;
    end);
    local v39 = l_UserInputService_0.InputBegan:Connect(function(v35) --[[ Line: 171 ]]
        -- upvalues: v33 (ref), l_GamepadService_0 (ref), l_GuiService_0 (ref), v32 (copy)
        task.wait();
        if v35.KeyCode == Enum.KeyCode.ButtonA and v33 then
            task.wait(0.2);
            l_GamepadService_0:DisableGamepadCursor();
            l_GuiService_0.SelectedObject = v32;
            return;
        else
            local v36 = l_GuiService_0.SelectedObject == v32;
            local v37 = {
                "ButtonB", 
                "ButtonSelect"
            };
            local l_Name_0 = v35.KeyCode.Name;
            if table.find(v37, l_Name_0) and v36 and (l_Name_0 ~= "ButtonSelect" or l_GamepadService_0.GamepadCursorEnabled) then
                l_GuiService_0.SelectedObject = nil;
            end;
            return;
        end;
    end);
    v32.Destroying:Once(function() --[[ Line: 192 ]]
        -- upvalues: v39 (copy)
        v39:Disconnect();
    end);
end;
return v3;