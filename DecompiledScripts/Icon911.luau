local _ = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("RunService");
local _ = game:GetService("TextService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_script_0 = script;
local v8 = require(l_script_0.Reference);
local v9 = v8.getObject();
local v10 = v9 and v9.Value;
if v10 and v10 ~= l_script_0 then
    return require(v10);
else
    if not v9 then
        v8.addToReplicatedStorage();
    end;
    local v11 = require(l_script_0.Packages.GoodSignal);
    local v12 = require(l_script_0.Packages.Janitor);
    local v13 = require(l_script_0.Utility);
    local _ = require(l_script_0.Attribute);
    local v15 = require(l_script_0.Features.Themes);
    local v16 = require(l_script_0.Features.Gamepad);
    local v17 = require(l_script_0.Features.Overflow);
    local v18 = {};
    v18.__index = v18;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_Themes_0 = l_script_0.Features.Themes;
    local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
    local v22 = {};
    local v23 = v11.new();
    local l_Elements_0 = l_script_0.Elements;
    local v25 = 0;
    if l_GuiService_0.TopbarInset.Height == 0 then
        l_GuiService_0:GetPropertyChangedSignal("TopbarInset"):Wait();
    end;
    v18.baseDisplayOrderChanged = v11.new();
    v18.baseDisplayOrder = 10;
    v18.baseTheme = require(l_Themes_0.Default);
    v18.isOldTopbar = l_GuiService_0.TopbarInset.Height == 36;
    v18.iconsDictionary = v22;
    v18.container = require(l_Elements_0.Container)(v18);
    v18.topbarEnabled = true;
    v18.iconAdded = v11.new();
    v18.iconRemoved = v11.new();
    v18.iconChanged = v11.new();
    v18.getIcons = function() --[[ Line: 112 ]] --[[ Name: getIcons ]]
        -- upvalues: v18 (copy)
        return v18.iconsDictionary;
    end;
    v18.getIconByUID = function(v26) --[[ Line: 116 ]] --[[ Name: getIconByUID ]]
        -- upvalues: v18 (copy)
        local v27 = v18.iconsDictionary[v26];
        if v27 then
            return v27;
        else
            return;
        end;
    end;
    v18.getIcon = function(v28) --[[ Line: 123 ]] --[[ Name: getIcon ]]
        -- upvalues: v18 (copy), v22 (copy)
        local v29 = v18.getIconByUID(v28);
        if v29 then
            return v29;
        else
            for _, v31 in pairs(v22) do
                if v31.name == v28 then
                    return v31;
                end;
            end;
            return;
        end;
    end;
    v18.setTopbarEnabled = function(v32, v33) --[[ Line: 135 ]] --[[ Name: setTopbarEnabled ]]
        -- upvalues: v18 (copy)
        if typeof(v32) ~= "boolean" then
            v32 = v18.topbarEnabled;
        end;
        if not v33 then
            v18.topbarEnabled = v32;
        end;
        for _, v35 in pairs(v18.container) do
            v35.Enabled = v32;
        end;
    end;
    v18.modifyBaseTheme = function(v36) --[[ Line: 147 ]] --[[ Name: modifyBaseTheme ]]
        -- upvalues: v15 (copy), v18 (copy), v22 (copy)
        v36 = v15.getModifications(v36);
        for _, v38 in pairs(v36) do
            for _, v40 in pairs(v18.baseTheme) do
                v15.merge(v40, v38);
            end;
        end;
        for _, v42 in pairs(v22) do
            v42:setTheme(v18.baseTheme);
        end;
    end;
    v18.setDisplayOrder = function(v43) --[[ Line: 159 ]] --[[ Name: setDisplayOrder ]]
        -- upvalues: v18 (copy)
        v18.baseDisplayOrder = v43;
        v18.baseDisplayOrderChanged:Fire(v43);
    end;
    task.defer(v16.start, v18);
    task.defer(v17.start, v18);
    for _, v45 in pairs(v18.container) do
        v45.Parent = l_PlayerGui_0;
    end;
    if v18.isOldTopbar then
        v18.modifyBaseTheme(require(l_Themes_0.Classic));
    end;
    v18.new = function() --[[ Line: 179 ]] --[[ Name: new ]]
        -- upvalues: v18 (copy), v12 (copy), v13 (copy), v22 (copy), v11 (copy), l_script_0 (copy), l_Elements_0 (copy), v25 (ref), l_UserInputService_0 (copy), v23 (copy), l_StarterGui_0 (copy)
        local v46 = {};
        setmetatable(v46, v18);
        local v47 = v12.new();
        v46.janitor = v47;
        v46.themesJanitor = v47:add(v12.new());
        v46.singleClickJanitor = v47:add(v12.new());
        v46.captionJanitor = v47:add(v12.new());
        v46.joinJanitor = v47:add(v12.new());
        v46.menuJanitor = v47:add(v12.new());
        v46.dropdownJanitor = v47:add(v12.new());
        local v48 = v13.generateUID();
        v22[v48] = v46;
        v47:add(function() --[[ Line: 196 ]]
            -- upvalues: v22 (ref), v48 (copy)
            v22[v48] = nil;
        end);
        v46.selected = v47:add(v11.new());
        v46.deselected = v47:add(v11.new());
        v46.toggled = v47:add(v11.new());
        v46.viewingStarted = v47:add(v11.new());
        v46.viewingEnded = v47:add(v11.new());
        v46.stateChanged = v47:add(v11.new());
        v46.notified = v47:add(v11.new());
        v46.noticeStarted = v47:add(v11.new());
        v46.noticeChanged = v47:add(v11.new());
        v46.endNotices = v47:add(v11.new());
        v46.toggleKeyAdded = v47:add(v11.new());
        v46.fakeToggleKeyChanged = v47:add(v11.new());
        v46.alignmentChanged = v47:add(v11.new());
        v46.updateSize = v47:add(v11.new());
        v46.resizingComplete = v47:add(v11.new());
        v46.joinedParent = v47:add(v11.new());
        v46.menuSet = v47:add(v11.new());
        v46.dropdownSet = v47:add(v11.new());
        v46.updateMenu = v47:add(v11.new());
        v46.startMenuUpdate = v47:add(v11.new());
        v46.childThemeModified = v47:add(v11.new());
        v46.indicatorSet = v47:add(v11.new());
        v46.dropdownChildAdded = v47:add(v11.new());
        v46.menuChildAdded = v47:add(v11.new());
        v46.iconModule = l_script_0;
        v46.UID = v48;
        v46.isEnabled = true;
        v46.isSelected = false;
        v46.isViewing = false;
        v46.joinedFrame = false;
        v46.parentIconUID = false;
        v46.deselectWhenOtherIconSelected = true;
        v46.totalNotices = 0;
        v46.activeState = "Deselected";
        v46.alignment = "";
        v46.originalAlignment = "";
        v46.appliedTheme = {};
        v46.appearance = {};
        v46.cachedInstances = {};
        v46.cachedNamesToInstances = {};
        v46.cachedCollectives = {};
        v46.bindedToggleKeys = {};
        v46.customBehaviours = {};
        v46.toggleItems = {};
        v46.bindedEvents = {};
        v46.notices = {};
        v46.menuIcons = {};
        v46.dropdownIcons = {};
        v46.childIconsDict = {};
        v46.isOldTopbar = v18.isOldTopbar;
        v46.creationTime = os.clock();
        v46.widget = v47:add(require(l_Elements_0.Widget)(v46, v18));
        v46:setAlignment();
        v25 = v25 + 1;
        v46:setOrder(v25);
        v46:setTheme(v18.baseTheme);
        local v49 = v46:getInstance("ClickRegion");
        local function _() --[[ Line: 271 ]] --[[ Name: handleToggle ]]
            -- upvalues: v46 (copy)
            if v46.locked then
                return;
            elseif v46.isSelected then
                v46:deselect("User", v46);
                return;
            else
                v46:select("User", v46);
                return;
            end;
        end;
        local v51 = false;
        local v52 = false;
        v49.MouseButton1Click:Connect(function() --[[ Line: 283 ]]
            -- upvalues: v51 (ref), v52 (ref), v46 (copy)
            if v51 then
                return;
            else
                v52 = true;
                task.delay(0.01, function() --[[ Line: 288 ]]
                    -- upvalues: v52 (ref)
                    v52 = false;
                end);
                if v46.locked then
                    return;
                elseif v46.isSelected then
                    v46:deselect("User", v46);
                    return;
                else
                    v46:select("User", v46);
                    return;
                end;
            end;
        end);
        v49.TouchTap:Connect(function() --[[ Line: 293 ]]
            -- upvalues: v52 (ref), v51 (ref), v46 (copy)
            if v52 then
                return;
            else
                v51 = true;
                task.delay(0.01, function() --[[ Line: 300 ]]
                    -- upvalues: v51 (ref)
                    v51 = false;
                end);
                if v46.locked then
                    return;
                elseif v46.isSelected then
                    v46:deselect("User", v46);
                    return;
                else
                    v46:select("User", v46);
                    return;
                end;
            end;
        end);
        v47:add(l_UserInputService_0.InputBegan:Connect(function(v53, v54) --[[ Line: 307 ]]
            -- upvalues: v46 (copy)
            if v46.locked then
                return;
            else
                if v46.bindedToggleKeys[v53.KeyCode] and not v54 then
                    if v46.locked then
                        return;
                    elseif v46.isSelected then
                        v46:deselect("User", v46);
                        return;
                    else
                        v46:select("User", v46);
                    end;
                end;
                return;
            end;
        end));
        local function v56(v55) --[[ Line: 319 ]] --[[ Name: viewingStarted ]]
            -- upvalues: v46 (copy)
            if v46.locked then
                return;
            else
                v46.isViewing = true;
                v46.viewingStarted:Fire(true);
                if not v55 then
                    v46:setState("Viewing", "User", v46);
                end;
                return;
            end;
        end;
        local function v57() --[[ Line: 329 ]] --[[ Name: viewingEnded ]]
            -- upvalues: v46 (copy)
            if v46.locked then
                return;
            else
                v46.isViewing = false;
                v46.viewingEnded:Fire(true);
                v46:setState(nil, "User", v46);
                return;
            end;
        end;
        v46.joinedParent:Connect(function() --[[ Line: 337 ]]
            -- upvalues: v46 (copy)
            if v46.isViewing then
                if v46.locked then
                    return;
                else
                    v46.isViewing = false;
                    v46.viewingEnded:Fire(true);
                    v46:setState(nil, "User", v46);
                end;
            end;
        end);
        v49.MouseEnter:Connect(function() --[[ Line: 342 ]]
            -- upvalues: l_UserInputService_0 (ref), v46 (copy)
            local v58 = not l_UserInputService_0.KeyboardEnabled;
            if v46.locked then
                return;
            else
                v46.isViewing = true;
                v46.viewingStarted:Fire(true);
                if not v58 then
                    v46:setState("Viewing", "User", v46);
                end;
                return;
            end;
        end);
        local v59 = 0;
        v47:add(l_UserInputService_0.TouchEnded:Connect(v57));
        v49.MouseLeave:Connect(v57);
        v49.SelectionGained:Connect(v56);
        v49.SelectionLost:Connect(v57);
        v49.MouseButton1Down:Connect(function() --[[ Line: 351 ]]
            -- upvalues: v46 (copy), l_UserInputService_0 (ref), v59 (ref)
            if not v46.locked and l_UserInputService_0.TouchEnabled then
                v59 = v59 + 1;
                local l_v59_0 = v59;
                task.delay(0.2, function() --[[ Line: 355 ]]
                    -- upvalues: l_v59_0 (copy), v59 (ref), v46 (ref)
                    if l_v59_0 == v59 then
                        if v46.locked then
                            return;
                        else
                            v46.isViewing = true;
                            v46.viewingStarted:Fire(true);
                            v46:setState("Viewing", "User", v46);
                        end;
                    end;
                end);
            end;
        end);
        v49.MouseButton1Up:Connect(function() --[[ Line: 362 ]]
            -- upvalues: v59 (ref)
            v59 = v59 + 1;
        end);
        local v61 = v46:getInstance("IconOverlay");
        v46.viewingStarted:Connect(function() --[[ Line: 368 ]]
            -- upvalues: v61 (copy), v46 (copy)
            v61.Visible = not v46.overlayDisabled;
        end);
        v46.viewingEnded:Connect(function() --[[ Line: 371 ]]
            -- upvalues: v61 (copy)
            v61.Visible = false;
        end);
        v47:add(v23:Connect(function(v62) --[[ Line: 376 ]]
            -- upvalues: v46 (copy)
            if v62 ~= v46 and v46.deselectWhenOtherIconSelected and v62.deselectWhenOtherIconSelected then
                v46:deselect("AutoDeselect", v62);
            end;
        end));
        local v63 = debug.info(2, "s");
        local v64 = string.split(v63, ".");
        local l_game_0 = game;
        local v66 = nil;
        for _, v68 in pairs(v64) do
            l_game_0 = l_game_0:FindFirstChild(v68);
            if l_game_0 then
                if l_game_0:IsA("ScreenGui") then
                    v66 = l_game_0;
                end;
            else
                break;
            end;
        end;
        if l_game_0 and v66 and v66.ResetOnSpawn == true then
            v13.localPlayerRespawned(function() --[[ Line: 401 ]]
                -- upvalues: v46 (copy)
                v46:destroy();
            end);
        end;
        local _ = v46:getInstance("NoticeLabel");
        v46.toggled:Connect(function(v70) --[[ Line: 408 ]]
            -- upvalues: v46 (copy), v18 (ref)
            v46.noticeChanged:Fire(v46.totalNotices);
            for v71, _ in pairs(v46.childIconsDict) do
                local v73 = v18.getIconByUID(v71);
                v73.noticeChanged:Fire(v73.totalNotices);
                if not v70 and v73.isSelected then
                    for _, _ in pairs(v73.childIconsDict) do
                        v73:deselect("HideParentFeature", v46);
                    end;
                end;
            end;
        end);
        v46.selected:Connect(function() --[[ Line: 431 ]]
            -- upvalues: v46 (copy), l_StarterGui_0 (ref)
            if #v46.dropdownIcons > 0 then
                if l_StarterGui_0:GetCore("ChatActive") and v46.alignment ~= "Right" then
                    v46.chatWasPreviouslyActive = true;
                    l_StarterGui_0:SetCore("ChatActive", false);
                end;
                if l_StarterGui_0:GetCoreGuiEnabled("PlayerList") and v46.alignment ~= "Left" then
                    v46.playerlistWasPreviouslyActive = true;
                    l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
                end;
            end;
        end);
        v46.deselected:Connect(function() --[[ Line: 444 ]]
            -- upvalues: v46 (copy), l_StarterGui_0 (ref)
            if v46.chatWasPreviouslyActive then
                v46.chatWasPreviouslyActive = nil;
                l_StarterGui_0:SetCore("ChatActive", true);
            end;
            if v46.playerlistWasPreviouslyActive then
                v46.playerlistWasPreviouslyActive = nil;
                l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
            end;
        end);
        task.delay(0.1, function() --[[ Line: 459 ]]
            -- upvalues: v46 (copy)
            if v46.activeState == "Deselected" then
                v46.stateChanged:Fire("Deselected");
                v46:refresh();
            end;
        end);
        v18.iconAdded:Fire(v46);
        return v46;
    end;
    v18.setName = function(v76, v77) --[[ Line: 475 ]] --[[ Name: setName ]]
        v76.widget.Name = v77;
        v76.name = v77;
        return v76;
    end;
    v18.setState = function(v78, v79, v80, v81) --[[ Line: 481 ]] --[[ Name: setState ]]
        -- upvalues: v13 (copy), v23 (copy)
        if not v79 then
            v79 = v78.isSelected and "Selected" or "Deselected";
        end;
        local v82 = v13.formatStateName(v79);
        if v78.activeState == v82 then
            return;
        else
            local l_isSelected_0 = v78.isSelected;
            v78.activeState = v82;
            if v82 == "Deselected" then
                v78.isSelected = false;
                if l_isSelected_0 then
                    v78.toggled:Fire(false, v80, v81);
                    v78.deselected:Fire(v80, v81);
                end;
                v78:_setToggleItemsVisible(false, v80, v81);
            elseif v82 == "Selected" then
                v78.isSelected = true;
                if not l_isSelected_0 then
                    v78.toggled:Fire(true, v80, v81);
                    v78.selected:Fire(v80, v81);
                    v23:Fire(v78, v80, v81);
                end;
                v78:_setToggleItemsVisible(true, v80, v81);
            end;
            v78.stateChanged:Fire(v82, v80, v81);
            return;
        end;
    end;
    v18.getInstance = function(v84, v85) --[[ Line: 514 ]] --[[ Name: getInstance ]]
        -- upvalues: v15 (copy)
        local v86 = v84.cachedNamesToInstances[v85];
        if v86 then
            return v86;
        else
            local function v91(v87, v88) --[[ Line: 522 ]] --[[ Name: cacheInstance ]]
                -- upvalues: v84 (copy)
                if not v84.cachedInstances[v88] then
                    local l_v88_Attribute_0 = v88:GetAttribute("Collective");
                    local v90 = l_v88_Attribute_0 and v84.cachedCollectives[l_v88_Attribute_0];
                    if v90 then
                        table.insert(v90, v88);
                    end;
                    v84.cachedNamesToInstances[v87] = v88;
                    v84.cachedInstances[v88] = true;
                    v88.Destroying:Once(function() --[[ Line: 532 ]]
                        -- upvalues: v84 (ref), v87 (copy), v88 (copy)
                        v84.cachedNamesToInstances[v87] = nil;
                        v84.cachedInstances[v88] = nil;
                    end);
                end;
            end;
            local l_widget_0 = v84.widget;
            v91("Widget", l_widget_0);
            if v85 == "Widget" then
                return l_widget_0;
            else
                local v93 = nil;
                local function v94(v95) --[[ Line: 545 ]] --[[ Name: scanChildren ]]
                    -- upvalues: v84 (copy), v15 (ref), v94 (copy), v91 (copy), v85 (copy), v93 (ref)
                    for _, v97 in pairs(v95:GetChildren()) do
                        local l_v97_Attribute_0 = v97:GetAttribute("WidgetUID");
                        if not l_v97_Attribute_0 or l_v97_Attribute_0 == v84.UID then
                            local _ = v97;
                            local v100 = v15.getRealInstance(v97);
                            if v100 then
                                v97 = v100;
                            end;
                            v94(v97);
                            if v97:IsA("GuiBase") or v97:IsA("UIBase") or v97:IsA("ValueBase") then
                                local l_Name_0 = v97.Name;
                                v91(l_Name_0, v97);
                                if l_Name_0 == v85 then
                                    v93 = v97;
                                end;
                            end;
                        end;
                    end;
                end;
                v94(l_widget_0);
                return v93;
            end;
        end;
    end;
    v18.getCollective = function(v102, v103) --[[ Line: 575 ]] --[[ Name: getCollective ]]
        local v104 = v102.cachedCollectives[v103];
        if v104 then
            return v104;
        else
            v104 = {};
            for v105, _ in pairs(v102.cachedInstances) do
                if v105:GetAttribute("Collective") == v103 then
                    table.insert(v104, v105);
                end;
            end;
            v102.cachedCollectives[v103] = v104;
            return v104;
        end;
    end;
    v18.getInstanceOrCollective = function(v107, v108) --[[ Line: 596 ]] --[[ Name: getInstanceOrCollective ]]
        local v109 = {};
        local v110 = v107:getInstance(v108);
        if v110 then
            table.insert(v109, v110);
        end;
        if #v109 == 0 then
            v109 = v107:getCollective(v108);
        end;
        return v109;
    end;
    v18.getStateGroup = function(v111, v112) --[[ Line: 610 ]] --[[ Name: getStateGroup ]]
        local v113 = v112 or v111.activeState;
        local v114 = v111.appearance[v113];
        if not v114 then
            v114 = {};
            v111.appearance[v113] = v114;
        end;
        return v114;
    end;
    v18.refreshAppearance = function(v115, v116, v117) --[[ Line: 620 ]] --[[ Name: refreshAppearance ]]
        -- upvalues: v15 (copy)
        v15.refresh(v115, v116, v117);
        return v115;
    end;
    v18.refresh = function(v118) --[[ Line: 625 ]] --[[ Name: refresh ]]
        v118:refreshAppearance(v118.widget);
        v118.updateSize:Fire();
        return v118;
    end;
    v18.updateParent = function(v119) --[[ Line: 631 ]] --[[ Name: updateParent ]]
        -- upvalues: v18 (copy)
        local v120 = v18.getIconByUID(v119.parentIconUID);
        if v120 then
            v120.updateSize:Fire();
        end;
    end;
    v18.setBehaviour = function(v121, v122, v123, v124, v125) --[[ Line: 638 ]] --[[ Name: setBehaviour ]]
        local v126 = v122 .. "-" .. v123;
        v121.customBehaviours[v126] = v124;
        if v125 then
            local v127 = v121:getInstanceOrCollective(v122);
            for _, v129 in pairs(v127) do
                v121:refreshAppearance(v129, v123);
            end;
        end;
    end;
    v18.modifyTheme = function(v130, v131, v132) --[[ Line: 651 ]] --[[ Name: modifyTheme ]]
        -- upvalues: v15 (copy)
        return v130, (v15.modify(v130, v131, v132));
    end;
    v18.modifyChildTheme = function(v133, v134, v135) --[[ Line: 656 ]] --[[ Name: modifyChildTheme ]]
        -- upvalues: v18 (copy)
        v133.childModifications = v134;
        v133.childModificationsUID = v135;
        for v136, _ in pairs(v133.childIconsDict) do
            v18.getIconByUID(v136):modifyTheme(v134, v135);
        end;
        v133.childThemeModified:Fire();
        return v133;
    end;
    v18.removeModification = function(v138, v139) --[[ Line: 669 ]] --[[ Name: removeModification ]]
        -- upvalues: v15 (copy)
        v15.remove(v138, v139);
        return v138;
    end;
    v18.removeModificationWith = function(v140, v141, v142, v143) --[[ Line: 674 ]] --[[ Name: removeModificationWith ]]
        -- upvalues: v15 (copy)
        v15.removeWith(v140, v141, v142, v143);
        return v140;
    end;
    v18.setTheme = function(v144, v145) --[[ Line: 679 ]] --[[ Name: setTheme ]]
        -- upvalues: v15 (copy)
        v15.set(v144, v145);
        return v144;
    end;
    v18.setEnabled = function(v146, v147) --[[ Line: 684 ]] --[[ Name: setEnabled ]]
        v146.isEnabled = v147;
        v146.widget.Visible = v147;
        v146:updateParent();
        return v146;
    end;
    v18.select = function(v148, v149, v150) --[[ Line: 691 ]] --[[ Name: select ]]
        v148:setState("Selected", v149, v150);
        return v148;
    end;
    v18.deselect = function(v151, v152, v153) --[[ Line: 696 ]] --[[ Name: deselect ]]
        v151:setState("Deselected", v152, v153);
        return v151;
    end;
    v18.notify = function(v154, v155, v156) --[[ Line: 701 ]] --[[ Name: notify ]]
        -- upvalues: l_Elements_0 (copy), v18 (copy)
        if not v154.notice then
            v154.notice = require(l_Elements_0.Notice)(v154, v18);
        end;
        v154.noticeStarted:Fire(v155, v156);
        return v154;
    end;
    v18.clearNotices = function(v157) --[[ Line: 715 ]] --[[ Name: clearNotices ]]
        v157.endNotices:Fire();
        return v157;
    end;
    v18.disableOverlay = function(v158, v159) --[[ Line: 720 ]] --[[ Name: disableOverlay ]]
        v158.overlayDisabled = v159;
        return v158;
    end;
    v18.disableStateOverlay = v18.disableOverlay;
    v18.setImage = function(v160, v161, v162) --[[ Line: 726 ]] --[[ Name: setImage ]]
        v160:modifyTheme({
            "IconImage", 
            "Image", 
            v161, 
            v162
        });
        return v160;
    end;
    v18.setTextColor = function(v163, v164, v165) --[[ Line: 731 ]] --[[ Name: setTextColor ]]
        v163:modifyTheme({
            "IconLabel", 
            "TextColor3", 
            v164, 
            v165
        });
        return v163;
    end;
    v18.setLabel = function(v166, v167, v168) --[[ Line: 736 ]] --[[ Name: setLabel ]]
        v166:modifyTheme({
            "IconLabel", 
            "Text", 
            v167, 
            v168
        });
        return v166;
    end;
    v18.setOrder = function(v169, v170, v171) --[[ Line: 741 ]] --[[ Name: setOrder ]]
        v169:modifyTheme({
            "Widget", 
            "LayoutOrder", 
            v170, 
            v171
        });
        return v169;
    end;
    v18.setCornerRadius = function(v172, v173, v174) --[[ Line: 746 ]] --[[ Name: setCornerRadius ]]
        v172:modifyTheme({
            "IconCorners", 
            "CornerRadius", 
            v173, 
            v174
        });
        return v172;
    end;
    v18.align = function(v175, v176, v177) --[[ Line: 751 ]] --[[ Name: align ]]
        -- upvalues: v18 (copy)
        local v178 = tostring(v176):lower();
        if v178 == "mid" or v178 == "centre" then
            v178 = "center";
        end;
        if v178 ~= "left" and v178 ~= "center" and v178 ~= "right" then
            v178 = "left";
        end;
        local v179 = v178 == "center" and v18.container.TopbarCentered or v18.container.TopbarStandard;
        local l_Holders_0 = v179.Holders;
        local v181 = string.upper((string.sub(v178, 1, 1))) .. string.sub(v178, 2);
        if not v177 then
            v175.originalAlignment = v181;
        end;
        local l_joinedFrame_0 = v175.joinedFrame;
        local v183 = l_Holders_0[v181];
        v175.screenGui = v179;
        v175.alignmentHolder = v183;
        if not v175.isDestroyed then
            v175.widget.Parent = l_joinedFrame_0 or v183;
        end;
        v175.alignment = v181;
        v175.alignmentChanged:Fire(v181);
        v18.iconChanged:Fire(v175);
        return v175;
    end;
    v18.setAlignment = v18.align;
    v18.setLeft = function(v184) --[[ Line: 780 ]] --[[ Name: setLeft ]]
        v184:setAlignment("Left");
        return v184;
    end;
    v18.setMid = function(v185) --[[ Line: 785 ]] --[[ Name: setMid ]]
        v185:setAlignment("Center");
        return v185;
    end;
    v18.setRight = function(v186) --[[ Line: 790 ]] --[[ Name: setRight ]]
        v186:setAlignment("Right");
        return v186;
    end;
    v18.setWidth = function(v187, v188, v189) --[[ Line: 795 ]] --[[ Name: setWidth ]]
        v187:modifyTheme({
            "Widget", 
            "Size", 
            UDim2.fromOffset(v188, v187.widget.Size.Y.Offset), 
            v189
        });
        v187:modifyTheme({
            "Widget", 
            "DesiredWidth", 
            v188, 
            v189
        });
        return v187;
    end;
    v18.setImageScale = function(v190, v191, v192) --[[ Line: 805 ]] --[[ Name: setImageScale ]]
        v190:modifyTheme({
            "IconImageScale", 
            "Value", 
            v191, 
            v192
        });
        return v190;
    end;
    v18.setImageRatio = function(v193, v194, v195) --[[ Line: 810 ]] --[[ Name: setImageRatio ]]
        v193:modifyTheme({
            "IconImageRatio", 
            "AspectRatio", 
            v194, 
            v195
        });
        return v193;
    end;
    v18.setTextSize = function(v196, v197, v198) --[[ Line: 815 ]] --[[ Name: setTextSize ]]
        v196:modifyTheme({
            "IconLabel", 
            "TextSize", 
            v197, 
            v198
        });
        return v196;
    end;
    v18.setTextFont = function(v199, v200, v201, v202, v203) --[[ Line: 820 ]] --[[ Name: setTextFont ]]
        v201 = v201 or Enum.FontWeight.Regular;
        v202 = v202 or Enum.FontStyle.Normal;
        local v204 = nil;
        local v205 = typeof(v200);
        if v205 == "number" then
            v204 = Font.fromId(v200, v201, v202);
        elseif v205 == "EnumItem" then
            v204 = Font.fromEnum(v200);
        elseif v205 == "string" and not v200:match("rbxasset") then
            v204 = Font.fromName(v200, v201, v202);
        end;
        if not v204 then
            v204 = Font.new(v200, v201, v202);
        end;
        v199:modifyTheme({
            "IconLabel", 
            "FontFace", 
            v204, 
            v203
        });
        return v199;
    end;
    v18.bindToggleItem = function(v206, v207) --[[ Line: 841 ]] --[[ Name: bindToggleItem ]]
        if not v207:IsA("GuiObject") and not v207:IsA("LayerCollector") then
            error("Toggle item must be a GuiObject or LayerCollector!");
        end;
        v206.toggleItems[v207] = true;
        v206:_updateSelectionInstances();
        return v206;
    end;
    v18.unbindToggleItem = function(v208, v209) --[[ Line: 850 ]] --[[ Name: unbindToggleItem ]]
        v208.toggleItems[v209] = nil;
        v208:_updateSelectionInstances();
        return v208;
    end;
    v18._updateSelectionInstances = function(v210) --[[ Line: 856 ]] --[[ Name: _updateSelectionInstances ]]
        for v211, _ in pairs(v210.toggleItems) do
            local v213 = {};
            for _, v215 in pairs(v211:GetDescendants()) do
                if (v215:IsA("TextButton") or v215:IsA("ImageButton")) and v215.Active then
                    table.insert(v213, v215);
                end;
            end;
            v210.toggleItems[v211] = v213;
        end;
    end;
    v18._setToggleItemsVisible = function(v216, v217, _, v219) --[[ Line: 870 ]] --[[ Name: _setToggleItemsVisible ]]
        for v220, _ in pairs(v216.toggleItems) do
            if not v219 or v219 == v216 or v219.toggleItems[v220] == nil then
                local v222 = "Visible";
                if v220:IsA("LayerCollector") then
                    v222 = "Enabled";
                end;
                v220[v222] = v217;
            end;
        end;
    end;
    v18.bindEvent = function(v223, v224, v225) --[[ Line: 882 ]] --[[ Name: bindEvent ]]
        local v226 = v223[v224];
        assert(v226 and typeof(v226) == "table" and v226.Connect, "argument[1] must be a valid topbarplus icon event name!");
        assert(typeof(v225) == "function", "argument[2] must be a function!");
        v223.bindedEvents[v224] = v226:Connect(function(...) --[[ Line: 886 ]]
            -- upvalues: v225 (copy), v223 (copy)
            v225(v223, ...);
        end);
        return v223;
    end;
    v18.unbindEvent = function(v227, v228) --[[ Line: 892 ]] --[[ Name: unbindEvent ]]
        local v229 = v227.bindedEvents[v228];
        if v229 then
            v229:Disconnect();
            v227.bindedEvents[v228] = nil;
        end;
        return v227;
    end;
    v18.bindToggleKey = function(v230, v231) --[[ Line: 901 ]] --[[ Name: bindToggleKey ]]
        assert(typeof(v231) == "EnumItem", "argument[1] must be a KeyCode EnumItem!");
        v230.bindedToggleKeys[v231] = true;
        v230.toggleKeyAdded:Fire(v231);
        v230:setCaption("_hotkey_");
        return v230;
    end;
    v18.unbindToggleKey = function(v232, v233) --[[ Line: 909 ]] --[[ Name: unbindToggleKey ]]
        assert(typeof(v233) == "EnumItem", "argument[1] must be a KeyCode EnumItem!");
        v232.bindedToggleKeys[v233] = nil;
        return v232;
    end;
    v18.call = function(v234, v235, ...) --[[ Line: 915 ]] --[[ Name: call ]]
        local v236 = table.pack(...);
        task.spawn(function() --[[ Line: 917 ]]
            -- upvalues: v235 (copy), v234 (copy), v236 (copy)
            v235(v234, table.unpack(v236));
        end);
        return v234;
    end;
    v18.addToJanitor = function(v237, v238) --[[ Line: 923 ]] --[[ Name: addToJanitor ]]
        v237.janitor:add(v238);
        return v237;
    end;
    v18.lock = function(v239) --[[ Line: 928 ]] --[[ Name: lock ]]
        v239:getInstance("ClickRegion").Visible = false;
        v239.locked = true;
        return v239;
    end;
    v18.unlock = function(v240) --[[ Line: 936 ]] --[[ Name: unlock ]]
        v240:getInstance("ClickRegion").Visible = true;
        v240.locked = false;
        return v240;
    end;
    v18.debounce = function(v241, v242) --[[ Line: 943 ]] --[[ Name: debounce ]]
        v241:lock();
        task.wait(v242);
        v241:unlock();
        return v241;
    end;
    v18.autoDeselect = function(v243, v244) --[[ Line: 950 ]] --[[ Name: autoDeselect ]]
        if v244 == nil then
            v244 = true;
        end;
        v243.deselectWhenOtherIconSelected = v244;
        return v243;
    end;
    v18.oneClick = function(v245, v246) --[[ Line: 960 ]] --[[ Name: oneClick ]]
        local l_singleClickJanitor_0 = v245.singleClickJanitor;
        l_singleClickJanitor_0:clean();
        if v246 or v246 == nil then
            l_singleClickJanitor_0:add(v245.selected:Connect(function() --[[ Line: 966 ]]
                -- upvalues: v245 (copy)
                v245:deselect("OneClick", v245);
            end));
        end;
        v245.oneClickEnabled = true;
        return v245;
    end;
    v18.setCaption = function(v248, v249) --[[ Line: 974 ]] --[[ Name: setCaption ]]
        -- upvalues: l_Elements_0 (copy)
        if v249 == "_hotkey_" and v248.captionText then
            return v248;
        else
            local l_captionJanitor_0 = v248.captionJanitor;
            v248.captionJanitor:clean();
            if not v249 or v249 == "" then
                v248.caption = nil;
                v248.captionText = nil;
                return v248;
            else
                local v251 = l_captionJanitor_0:add(require(l_Elements_0.Caption)(v248));
                v251:SetAttribute("CaptionText", v249);
                v248.caption = v251;
                v248.captionText = v249;
                return v248;
            end;
        end;
    end;
    v18.setCaptionHint = function(v252, v253) --[[ Line: 992 ]] --[[ Name: setCaptionHint ]]
        assert(typeof(v253) == "EnumItem", "argument[1] must be a KeyCode EnumItem!");
        v252.fakeToggleKey = v253;
        v252.fakeToggleKeyChanged:Fire(v253);
        v252:setCaption("_hotkey_");
        return v252;
    end;
    v18.leave = function(v254) --[[ Line: 1000 ]] --[[ Name: leave ]]
        v254.joinJanitor:clean();
        return v254;
    end;
    v18.joinMenu = function(v255, v256) --[[ Line: 1006 ]] --[[ Name: joinMenu ]]
        -- upvalues: v13 (copy)
        v13.joinFeature(v255, v256, v256.menuIcons, v256:getInstance("Menu"));
        v256.menuChildAdded:Fire(v255);
        return v255;
    end;
    v18.setMenu = function(v257, v258) --[[ Line: 1012 ]] --[[ Name: setMenu ]]
        v257.menuSet:Fire(v258);
        return v257;
    end;
    v18.setFrozenMenu = function(v259, v260) --[[ Line: 1017 ]] --[[ Name: setFrozenMenu ]]
        v259:freezeMenu(v260);
        v259:setMenu(v260);
    end;
    v18.freezeMenu = function(v261) --[[ Line: 1022 ]] --[[ Name: freezeMenu ]]
        v261:select("FrozenMenu", v261);
        v261:bindEvent("deselected", function(v262) --[[ Line: 1026 ]]
            -- upvalues: v261 (copy)
            v262:select("FrozenMenu", v261);
        end);
        v261:modifyTheme({
            "IconSpot", 
            "Visible", 
            false
        });
    end;
    v18.joinDropdown = function(v263, v264) --[[ Line: 1032 ]] --[[ Name: joinDropdown ]]
        -- upvalues: v13 (copy)
        v264:getDropdown();
        v13.joinFeature(v263, v264, v264.dropdownIcons, v264:getInstance("DropdownScroller"));
        v264.dropdownChildAdded:Fire(v263);
        return v263;
    end;
    v18.getDropdown = function(v265) --[[ Line: 1039 ]] --[[ Name: getDropdown ]]
        -- upvalues: l_Elements_0 (copy)
        local l_dropdown_0 = v265.dropdown;
        if not l_dropdown_0 then
            l_dropdown_0 = require(l_Elements_0.Dropdown)(v265);
            v265.dropdown = l_dropdown_0;
            v265:clipOutside(l_dropdown_0);
        end;
        return l_dropdown_0;
    end;
    v18.setDropdown = function(v267, v268) --[[ Line: 1049 ]] --[[ Name: setDropdown ]]
        v267:getDropdown();
        v267.dropdownSet:Fire(v268);
        return v267;
    end;
    v18.clipOutside = function(v269, v270) --[[ Line: 1055 ]] --[[ Name: clipOutside ]]
        -- upvalues: v13 (copy)
        local v271 = v13.clipOutside(v269, v270);
        v269:refreshAppearance(v270);
        return v269, v271;
    end;
    v18.setIndicator = function(v272, v273) --[[ Line: 1066 ]] --[[ Name: setIndicator ]]
        -- upvalues: l_Elements_0 (copy), v18 (copy)
        if not v272.indicator then
            v272.indicator = v272.janitor:add(require(l_Elements_0.Indicator)(v272, v18));
        end;
        v272.indicatorSet:Fire(v273);
    end;
    v18.destroy = function(v274) --[[ Line: 1081 ]] --[[ Name: destroy ]]
        -- upvalues: v18 (copy)
        if v274.isDestroyed then
            return;
        else
            v274:clearNotices();
            if v274.parentIconUID then
                v274:leave();
            end;
            v274.isDestroyed = true;
            v274.janitor:clean();
            v18.iconRemoved:Fire(v274);
            return;
        end;
    end;
    v18.Destroy = v18.destroy;
    return v18;
end;