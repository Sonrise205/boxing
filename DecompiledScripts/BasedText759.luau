local l_TweenService_0 = game:GetService("TweenService");
local l_TextService_0 = game:GetService("TextService");
local v2 = {
    ".", 
    "!", 
    "?", 
    ";", 
    ":"
};
local function _(v3, v4, v5) --[[ Line: 126 ]] --[[ Name: Lerp ]]
    return v3 + (v4 - v3) * v5;
end;
local function _(v7, v8) --[[ Line: 130 ]] --[[ Name: TryGet ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 131 ]]
        -- upvalues: v7 (copy), v8 (copy)
        return v7[v8];
    end);
    if not l_status_0 then
        return nil;
    else
        return l_result_0;
    end;
end;
local function v23(v12, v13) --[[ Line: 142 ]] --[[ Name: ParseColor ]]
    if string.sub(v12, 1, 3) == "rgb" then
        local v14, v15, v16 = string.match(v12, "rgb%((%d+), ?(%d+), ?(%d+)%)");
        v14 = tonumber(v14);
        v15 = tonumber(v15);
        v16 = tonumber(v16);
        return Color3.fromRGB(v14, v15, v16);
    elseif string.sub(v12, 1, 3) == "hsv" then
        local v17, v18, v19 = string.match(v12, "hsv%((%d+), ?(%d+), ?(%d+)%)");
        v17 = tonumber(v17);
        v18 = tonumber(v18);
        v19 = tonumber(v19);
        return Color3.fromHSV(v17, v18, v19);
    elseif string.sub(v12, 1, 1) == "#" then
        local v20 = string.sub(v12, 2);
        return Color3.fromHex(v20);
    else
        if v13 then
            for v21, v22 in v13 do
                if string.lower(v21) == string.lower(v12) then
                    return v22;
                end;
            end;
        end;
        return nil;
    end;
end;
local v24 = {};
local v25 = {};
v25.__index = v25;
v25.DefineTag = function(v26) --[[ Line: 172 ]] --[[ Name: DefineTag ]]
    -- upvalues: v24 (copy)
    v24[v26.Name] = v26;
end;
v25.new = function(v27, v28) --[[ Line: 176 ]] --[[ Name: new ]]
    -- upvalues: v25 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Size = UDim2.fromScale(1, 1);
    l_Frame_0.BackgroundTransparency = 1;
    local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_0.Name = "AspectRatio";
    l_UIAspectRatioConstraint_0.AspectRatio = 1;
    l_UIAspectRatioConstraint_0.Parent = l_Frame_0;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.AutoLocalize = false;
    l_TextLabel_0.Name = "Grapheme";
    l_TextLabel_0.Text = "";
    l_TextLabel_0.Size = UDim2.fromScale(1, 1);
    l_TextLabel_0.TextScaled = true;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Parent = l_Frame_0;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Size = UDim2.new(1, 0, v28.TextHeight.Scale, v28.TextHeight.Offset);
    l_Frame_1.BackgroundTransparency = 1;
    return (setmetatable({
        _EffectThreads = {}, 
        _EffectCache = {}, 
        _Options = v28, 
        _TextLabel = v27, 
        _LinePrefab = l_Frame_1, 
        _GraphemePrefab = l_Frame_0
    }, v25));
end;
v25.Render = function(v33, v34, v35) --[[ Line: 211 ]] --[[ Name: Render ]]
    -- upvalues: v24 (copy), l_TextService_0 (copy), v2 (copy)
    local l__TextLabel_0 = v33._TextLabel;
    local l__Options_0 = v33._Options;
    if v35 then
        l__Options_0 = table.clone(l__Options_0);
        for v38, v39 in v35 do
            l__Options_0[v38] = v39;
        end;
    end;
    local l__GraphemePrefab_0 = v33._GraphemePrefab;
    local l__LinePrefab_0 = v33._LinePrefab;
    local v42 = v33:Parse(v34);
    if not l__Options_0.DisableWrapping then
        v33:WrapText(v42);
    end;
    local l_FontFace_0 = l__TextLabel_0.FontFace;
    local l_TextYAlignment_0 = l__TextLabel_0.TextYAlignment;
    local l_TextXAlignment_0 = l__TextLabel_0.TextXAlignment;
    v33._SkipAhead = false;
    v33._LastText = v34;
    v33:CleanEffects();
    if not l__Options_0.IncrementalRender then
        l__TextLabel_0:ClearAllChildren();
    end;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.Padding = UDim.new(0, 0);
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.FillDirection = Enum.FillDirection.Vertical;
    l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment[l_TextYAlignment_0.Name];
    l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment[l_TextXAlignment_0.Name];
    l_UIListLayout_0.Parent = l__TextLabel_0;
    local v47 = {};
    local v48 = {};
    local l_v33_LineWidth_0 = v33:GetLineWidth();
    local v50 = l__Options_0.TextHeight.Offset + l__TextLabel_0.AbsoluteSize.Y * l__Options_0.TextHeight.Scale;
    table.insert(v33._EffectThreads, task.spawn(function() --[[ Line: 260 ]]
        -- upvalues: v42 (copy), l__Options_0 (ref), l__TextLabel_0 (copy), v47 (copy), l__LinePrefab_0 (copy), l_TextYAlignment_0 (copy), l_TextXAlignment_0 (copy), l__GraphemePrefab_0 (copy), l_FontFace_0 (copy), v48 (copy), v24 (ref), v33 (copy), v50 (copy), l_v33_LineWidth_0 (copy), l_TextService_0 (ref), v2 (ref)
        local v51 = 1;
        for _, v53 in v42 do
            if v53.Grapheme == "\n" then
                v51 = v51 + 1;
            end;
        end;
        if v51 > 1 and l__Options_0.MultiLineHeightAddition then
            local v54 = v51 - 1;
            l__TextLabel_0.Size = UDim2.new(l__TextLabel_0.Size.X, l__TextLabel_0.Size.Y + UDim.new(l__Options_0.MultiLineHeightAddition.Scale * v54, l__Options_0.MultiLineHeightAddition.Offset * v54));
        end;
        for v55, v56 in v42 do
            if v56.Grapheme == "\n" or #v47 == 0 then
                local l_l__TextLabel_0_FirstChild_0 = l__TextLabel_0:FindFirstChild((tostring(#v47 + 1)));
                if l__Options_0.IncrementalRender and l_l__TextLabel_0_FirstChild_0 then
                    table.insert(v47, l_l__TextLabel_0_FirstChild_0);
                    if v56.Grapheme == "\n" then
                        continue;
                    end;
                else
                    local v58 = l__LinePrefab_0:Clone();
                    v58.Name = tostring(#v47 + 1);
                    v58.LayoutOrder = #v47 + 1;
                    if l__Options_0.TextScaled then
                        v58.Size = UDim2.fromScale(1, l__Options_0.TextHeight.Scale / v51);
                    end;
                    local l_UIListLayout_1 = Instance.new("UIListLayout");
                    l_UIListLayout_1.Name = "LineList";
                    l_UIListLayout_1.Padding = UDim.new(0, l__Options_0.UseDropShadow and -2 or 0);
                    l_UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder;
                    l_UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal;
                    l_UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment[l_TextYAlignment_0.Name];
                    l_UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment[l_TextXAlignment_0.Name];
                    l_UIListLayout_1.Parent = v58;
                    v58.Parent = l__TextLabel_0;
                    table.insert(v47, v58);
                    if v56.Grapheme == "\n" then
                        continue;
                    end;
                end;
            end;
            local v60 = v47[#v47];
            local v61 = l__GraphemePrefab_0:Clone();
            v61.Name = tostring(v55);
            v61.ZIndex = v55;
            if l__Options_0.IncrementalRender then
                local l_v60_FirstChild_0 = v60:FindFirstChild((tostring(v55)));
                if l_v60_FirstChild_0 then
                    l_v60_FirstChild_0:Destroy();
                end;
            end;
            local l_Grapheme_0 = v61.Grapheme;
            l_Grapheme_0.Text = v56.Grapheme;
            l_Grapheme_0.FontFace = l_FontFace_0;
            l_Grapheme_0.TextColor3 = l__TextLabel_0.TextColor3;
            l_Grapheme_0.TextStrokeColor3 = l__TextLabel_0.TextStrokeColor3;
            l_Grapheme_0.TextStrokeTransparency = l__TextLabel_0.TextStrokeTransparency;
            l_Grapheme_0.LayoutOrder = v55;
            local v64 = nil;
            if l__Options_0.UseDropShadow then
                v64 = l_Grapheme_0:Clone();
                v64.TextColor3 = Color3.new(0, 0, 0);
                v64.Position = UDim2.new(0, 2, 0, 2);
                v64.ZIndex = 0;
                v64.Parent = v61;
            end;
            v61.Parent = v60;
            local v65 = {};
            for v66 in v48 do
                for _, v68 in v56.Tags do
                    if v68.Name == v66 then
                        v65[v66] = true;
                        break;
                    end;
                end;
            end;
            for v69 in v48 do
                if not v65[v69] then
                    v48[v69] = nil;
                end;
            end;
            local v70 = false;
            local v71 = false;
            local v72 = false;
            local v73 = {
                Width = 0
            };
            for v74, v75 in v56.Tags do
                if not v48[v75.Name] then
                    v48[v75.Name] = 0;
                end;
                local l_v48_0 = v48;
                local l_Name_0 = v75.Name;
                l_v48_0[l_Name_0] = l_v48_0[l_Name_0] + 1;
                l_v48_0 = v24[v75.Name];
                if not l_v48_0 then
                    warn((("[BasedText] Tag '%*' not defined"):format(v75.Name)));
                else
                    if l_v48_0.SkipWait then
                        v70 = true;
                    end;
                    if l_v48_0.InheritsFromRichText then

                    end;
                    if l_v48_0.SkipResizing then
                        v72 = true;
                    end;
                    if l_v48_0.VisualEffect then
                        v71 = true;
                    end;
                    l_Name_0 = l_v48_0.Handler({
                        TextLabel = l_Grapheme_0, 
                        Shadow = v64, 
                        Options = l__Options_0, 
                        Index = v74, 
                        Attributes = v75.Attributes, 
                        GraphemesSinceTag = v48[v75.Name], 
                        GraphemeOptions = v73, 
                        EffectCache = v33._EffectCache, 
                        EffectThreads = v33._EffectThreads
                    });
                    if l_Name_0 then
                        table.insert(v33._EffectThreads, l_Name_0);
                    end;
                end;
            end;
            if not v72 then
                local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
                l_GetTextBoundsParams_0.Text = v56.Grapheme;
                l_GetTextBoundsParams_0.Size = v50;
                l_GetTextBoundsParams_0.Font = l_Grapheme_0.FontFace;
                l_GetTextBoundsParams_0.Width = l_v33_LineWidth_0;
                local l_l_GetTextBoundsParams_0_0 = l_GetTextBoundsParams_0 --[[ copy: 15 -> 22 ]];
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 432 ]]
                    -- upvalues: l_TextService_0 (ref), l_l_GetTextBoundsParams_0_0 (copy)
                    return l_TextService_0:GetTextBoundsAsync(l_l_GetTextBoundsParams_0_0);
                end);
                if not l_status_1 then
                    l_Grapheme_0.AutomaticSize = Enum.AutomaticSize.X;
                    if v64 then
                        v64.AutomaticSize = Enum.AutomaticSize.X;
                    end;
                else
                    v61.Size = UDim2.fromScale(1, 1);
                    v61.AspectRatio.AspectRatio = math.clamp((l_result_1.X + v73.Width) / v50, 0.1, 1);
                    l_Grapheme_0.Size = UDim2.fromScale(1, 1);
                    if v64 then
                        v64.Size = l_Grapheme_0.Size;
                    end;
                end;
            else
                l_Grapheme_0.AutomaticSize = Enum.AutomaticSize.X;
            end;
            if not v71 then
                v24.basic.Handler({
                    TextLabel = l_Grapheme_0, 
                    Shadow = v64, 
                    Options = l__Options_0, 
                    Index = v55, 
                    Attributes = {}, 
                    GraphemesSinceTag = v55, 
                    EffectCache = v33._EffectCache, 
                    EffectThreads = v33._EffectThreads
                });
            end;
            if not v70 and not v33._SkipAhead then
                local v82 = table.find(v2, v56.Grapheme);
                local v83 = l__Options_0.Callbacks and l__Options_0.Callbacks.OnCharacter or nil;
                if v83 then
                    task.spawn(v83, v82);
                end;
                if v82 then
                    task.wait(0.05);
                else
                    task.wait(0.016666666666666666);
                end;
            end;
        end;
    end));
end;
v25.Parse = function(v84, v85) --[[ Line: 487 ]] --[[ Name: Parse ]]
    local l__TextLabel_1 = v84._TextLabel;
    local v87 = {};
    local v88 = "Append";
    local v89 = "None";
    local v90 = "Append";
    local v91 = {
        Name = "", 
        IsClosingTag = false, 
        IsSelfClosingTag = false, 
        ActiveAttributeID = "", 
        ActiveAttributeValue = "", 
        Attributes = {}
    };
    local v92 = {};
    local l_TextColor3_0 = l__TextLabel_1.TextColor3;
    local v94 = {};
    for v95, v96 in utf8.graphemes(v85) do
        table.insert(v94, (string.sub(v85, v95, v96)));
    end;
    for v97, v98 in v94 do
        local v99 = v94[v97 + 1];
        if v98 == "\\" then
            v90 = v88;
            v88 = "ControlCharacter";
        else
            if v88 == "ControlCharacter" then
                if v98 == "n" then
                    v98 = "\n";
                elseif v98 == "t" then
                    v98 = "\t";
                end;
                v88 = v90;
            end;
            if v88 == "TagName" then
                if v91.Name == "" and v98 == "/" then
                    v91.IsClosingTag = true;
                elseif v98 == ">" then
                    v88 = "Append";
                    if v91.IsClosingTag then
                        local v100 = 0;
                        for v101, v102 in v92 do
                            if v102.Name == v91.Name then
                                v100 = v101;
                            end;
                        end;
                        if v100 ~= 0 then
                            table.remove(v92, v100);
                        end;
                    elseif v91.IsSelfClosingTag then
                        local v103 = table.clone(v92);
                        table.insert(v103, {
                            Name = v91.Name, 
                            Attributes = v91.Attributes
                        });
                        table.insert(v87, {
                            Grapheme = "", 
                            Color = l_TextColor3_0, 
                            Tags = v103
                        });
                    else
                        table.insert(v92, {
                            Name = v91.Name, 
                            Attributes = v91.Attributes
                        });
                    end;
                elseif v98 == " " then
                    v88 = "TagAttributeID";
                else
                    v91.Name = v91.Name .. v98;
                end;
            elseif v88 == "TagAttributeID" then
                if v98 ~= "=" then
                    if v98 == " " then
                        v91.Attributes[v91.ActiveAttributeID] = "";
                        v91.ActiveAttributeID = "";
                    elseif v98 == "\"" or v98 == "'" then
                        v88 = "TagAttributeValue";
                        v91.Attributes[v91.ActiveAttributeID] = "";
                        if v98 == "\"" then
                            v89 = "Double";
                        else
                            v89 = "Single";
                        end;
                    else
                        v91.ActiveAttributeID = v91.ActiveAttributeID .. v98;
                        if v99 == ">" then
                            if v98 == "/" then
                                v91.IsSelfClosingTag = true;
                                v91.ActiveAttributeID = "";
                                v88 = "TagName";
                            else
                                v91.Attributes[v91.ActiveAttributeID] = "";
                                v91.ActiveAttributeID = "";
                                v88 = "TagName";
                            end;
                        end;
                    end;
                end;
            elseif v88 == "TagAttributeValue" then
                if v89 == "Double" and v98 == "\"" or v89 == "Single" and v98 == "'" then
                    v91.ActiveAttributeID = "";
                    v89 = "None";
                    v88 = "TagName";
                else
                    local l_Attributes_0 = v91.Attributes;
                    local l_ActiveAttributeID_0 = v91.ActiveAttributeID;
                    l_Attributes_0[l_ActiveAttributeID_0] = l_Attributes_0[l_ActiveAttributeID_0] .. v98;
                end;
            elseif v88 == "Append" then
                if v98 == "<" then
                    v88 = "TagName";
                    v91 = {
                        Name = "", 
                        IsClosingTag = false, 
                        IsSelfClosingTag = false, 
                        ActiveAttributeID = "", 
                        ActiveAttributeValue = "", 
                        Attributes = {}
                    };
                else
                    table.insert(v87, {
                        Grapheme = v98, 
                        Color = l_TextColor3_0, 
                        Tags = table.clone(v92)
                    });
                end;
            end;
        end;
    end;
    return v87;
end;
v25.WrapText = function(v106, v107) --[[ Line: 654 ]] --[[ Name: WrapText ]]
    -- upvalues: l_TextService_0 (copy)
    local l__TextLabel_2 = v106._TextLabel;
    local l__Options_1 = v106._Options;
    local v110 = v106:GetLineWidth() * 0.9;
    local v111 = l__Options_1.TextHeight.Offset + l__TextLabel_2.AbsoluteSize.Y * l__Options_1.TextHeight.Scale * 0.75;
    local l_GetTextBoundsParams_1 = Instance.new("GetTextBoundsParams");
    l_GetTextBoundsParams_1.Text = "";
    l_GetTextBoundsParams_1.Size = v111;
    l_GetTextBoundsParams_1.Font = l__TextLabel_2.FontFace;
    l_GetTextBoundsParams_1.Width = v110;
    l_GetTextBoundsParams_1.RichText = true;
    local v113 = table.clone(v107);
    local v114 = table.create(#v107);
    local v115 = "";
    local v116 = nil;
    local v117 = 0;
    local v118 = "";
    while #v113 > 0 do
        local v119 = table.remove(v113, 1);
        v117 = v117 + 1;
        if string.match(v119.Grapheme, "%s") then
            table.insert(v114, v118);
            table.insert(v114, v119.Grapheme);
            v118 = "";
        else
            v118 = v118 .. v119.Grapheme;
        end;
    end;
    v117 = 0;
    while #v114 > 0 do
        local v120 = table.remove(v114, 1);
        v117 = v117 + #v120;
        if v120 == "\n" then
            v115 = "";
        else
            l_GetTextBoundsParams_1.Text = v115 .. v120;
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 710 ]]
                -- upvalues: l_TextService_0 (ref), l_GetTextBoundsParams_1 (copy)
                return l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_1);
            end);
            if not l_status_2 then
                warn((("[BasedText] Failed to get text bounds for '%*'"):format(v120)));
            else
                if not v116 then
                    v116 = l_result_2.Y;
                end;
                if v116 < l_result_2.Y then
                    table.insert(v107, v117 + 1, {
                        Grapheme = "\n", 
                        Tags = {}
                    });
                    v117 = v117 + 1;
                    v115 = v120;
                else
                    v115 = v115 .. v120;
                end;
            end;
        end;
    end;
end;
v25.SkipAhead = function(v123) --[[ Line: 737 ]] --[[ Name: SkipAhead ]]
    v123._SkipAhead = true;
end;
v25.GetLineWidth = function(v124) --[[ Line: 741 ]] --[[ Name: GetLineWidth ]]
    local l__TextLabel_3 = v124._TextLabel;
    local l_X_0 = l__TextLabel_3.AbsoluteSize.X;
    if l_X_0 == 0 then
        local l_l__TextLabel_3_FirstAncestorWhichIsA_0 = l__TextLabel_3:FindFirstAncestorWhichIsA("GuiObject");
        while l_l__TextLabel_3_FirstAncestorWhichIsA_0 do
            if l_l__TextLabel_3_FirstAncestorWhichIsA_0:IsA("GuiObject") and l_l__TextLabel_3_FirstAncestorWhichIsA_0.AbsoluteSize.X > 0 then
                return l_l__TextLabel_3_FirstAncestorWhichIsA_0.AbsoluteSize.X;
            else
                l_l__TextLabel_3_FirstAncestorWhichIsA_0 = l_l__TextLabel_3_FirstAncestorWhichIsA_0:FindFirstAncestorWhichIsA("GuiObject");
            end;
        end;
    end;
    return l_X_0;
end;
v25.CleanEffects = function(v128) --[[ Line: 761 ]] --[[ Name: CleanEffects ]]
    for _, v130 in v128._EffectThreads do
        if typeof(v130) == "thread" and coroutine.status(v130) == "suspended" then
            coroutine.close(v130);
        elseif typeof(v130) == "RBXScriptConnection" then
            v130:Disconnect();
        end;
    end;
    table.clear(v128._EffectCache);
    table.clear(v128._EffectThreads);
end;
v25.Destroy = function(v131) --[[ Line: 776 ]] --[[ Name: Destroy ]]
    v131:CleanEffects();
end;
v25.DefineTag({
    Name = "basic", 
    Handler = function(v132) --[[ Line: 783 ]] --[[ Name: Handler ]]
        -- upvalues: l_TweenService_0 (copy)
        local l_TextLabel_1 = v132.TextLabel;
        l_TextLabel_1.TextTransparency = 1;
        l_TextLabel_1.Position = UDim2.fromScale(0, 0.1);
        l_TweenService_0:Create(l_TextLabel_1, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            TextTransparency = 0, 
            Position = UDim2.fromScale(0, 0)
        }):Play();
    end
});
v25.DefineTag({
    Name = "cb", 
    SkipResizing = true, 
    Handler = function(v134) --[[ Line: 800 ]] --[[ Name: Handler ]]
        local l_Options_0 = v134.Options;
        local l_Attributes_1 = v134.Attributes;
        local v137 = l_Attributes_1.id or "";
        if l_Options_0.Callbacks and l_Options_0.Callbacks[v137] then
            local v138 = l_Options_0.Callbacks[v137];
            task.spawn(v138, l_Attributes_1);
            return;
        else
            warn((("[BasedText] Callback '%*' not defined"):format(v137)));
            return;
        end;
    end
});
v25.DefineTag({
    Name = "b", 
    InheritsFromRichText = true, 
    Handler = function(v139) --[[ Line: 819 ]] --[[ Name: Handler ]]
        local l_TextLabel_2 = v139.TextLabel;
        l_TextLabel_2.FontFace = Font.new(l_TextLabel_2.FontFace.Family, Enum.FontWeight.Bold, l_TextLabel_2.FontFace.Style);
        if v139.Shadow then
            v139.Shadow.FontFace = Font.new(v139.Shadow.FontFace.Family, Enum.FontWeight.Bold, v139.Shadow.FontFace.Style);
        end;
    end
});
v25.DefineTag({
    Name = "bb", 
    InheritsFromRichText = true, 
    Handler = function(v141) --[[ Line: 833 ]] --[[ Name: Handler ]]
        local l_TextLabel_3 = v141.TextLabel;
        l_TextLabel_3.FontFace = Font.new(l_TextLabel_3.FontFace.Family, Enum.FontWeight.ExtraBold, l_TextLabel_3.FontFace.Style);
        if v141.Shadow then
            v141.Shadow.FontFace = Font.new(v141.Shadow.FontFace.Family, Enum.FontWeight.ExtraBold, v141.Shadow.FontFace.Style);
        end;
    end
});
v25.DefineTag({
    Name = "i", 
    InheritsFromRichText = true, 
    Handler = function(v143) --[[ Line: 847 ]] --[[ Name: Handler ]]
        local l_TextLabel_4 = v143.TextLabel;
        l_TextLabel_4.FontFace = Font.new(l_TextLabel_4.FontFace.Family, l_TextLabel_4.FontFace.Weight, Enum.FontStyle.Italic);
        if v143.Shadow then
            v143.Shadow.FontFace = Font.new(v143.Shadow.FontFace.Family, v143.Shadow.FontFace.Weight, Enum.FontStyle.Italic);
        end;
    end
});
v25.DefineTag({
    Name = "rainbow", 
    VisualEffect = true, 
    Handler = function(v145) --[[ Line: 861 ]] --[[ Name: Handler ]]
        local l_TextLabel_5 = v145.TextLabel;
        local l_EffectCache_0 = v145.EffectCache;
        if l_EffectCache_0.Rainbow then
            table.insert(l_EffectCache_0.Rainbow, l_TextLabel_5);
            return;
        else
            local v148 = {};
            l_EffectCache_0.Rainbow = v148;
            table.insert(v148, l_TextLabel_5);
            return task.spawn(function() --[[ Line: 875 ]]
                -- upvalues: v148 (copy)
                while task.wait() do
                    for v149, v150 in v148 do
                        local v151 = (tick() % 3 / 3 + v149 * 2 / 255) % 255 % 1;
                        v150.TextColor3 = Color3.fromHSV(v151, 1, 1);
                    end;
                end;
            end);
        end;
    end
});
v25.DefineTag({
    Name = "gold", 
    VisualEffect = true, 
    Handler = function(v152) --[[ Line: 890 ]] --[[ Name: Handler ]]
        local l_TextLabel_6 = v152.TextLabel;
        local l_EffectCache_1 = v152.EffectCache;
        if l_EffectCache_1.Gold then
            table.insert(l_EffectCache_1.Gold, l_TextLabel_6);
            return;
        else
            local v155 = {};
            l_EffectCache_1.Gold = v155;
            table.insert(v155, l_TextLabel_6);
            local v156 = Color3.fromRGB(209, 196, 134);
            local v157 = Color3.fromRGB(183, 151, 48);
            return task.spawn(function() --[[ Line: 907 ]]
                -- upvalues: v155 (copy), v157 (copy), v156 (copy)
                while task.wait() do
                    for v158, v159 in v155 do
                        local v160 = math.sin((os.clock() * 3.5 + v158 * 0.3) % 6.283185307179586) * 0.5 + 0.5;
                        local v161 = v157.R + (v156.R - v157.R) * v160;
                        local v162 = v157.G + (v156.G - v157.G) * v160;
                        local v163 = v157.B + (v156.B - v157.B) * v160;
                        v159.TextColor3 = Color3.new(v161, v162, v163);
                    end;
                end;
            end);
        end;
    end
});
v25.DefineTag({
    Name = "fade", 
    VisualEffect = true, 
    Handler = function(v164) --[[ Line: 925 ]] --[[ Name: Handler ]]
        -- upvalues: l_TweenService_0 (copy)
        local l_TextLabel_7 = v164.TextLabel;
        local l_Attributes_2 = v164.Attributes;
        local v167 = l_Attributes_2["in"] ~= nil;
        local v168 = tonumber(l_Attributes_2.time) or 0.1;
        local v169 = tonumber(l_Attributes_2.delay) or 0;
        local v170 = v167 and Enum.EasingDirection.In or Enum.EasingDirection.Out;
        local v171 = Enum.EasingStyle[l_Attributes_2.easing or "Linear"];
        return task.spawn(function() --[[ Line: 936 ]]
            -- upvalues: l_TextLabel_7 (copy), v167 (copy), v169 (copy), l_TweenService_0 (ref), v168 (copy), v171 (copy), v170 (copy), v164 (copy)
            l_TextLabel_7.TextTransparency = v167 and 1 or 0;
            if v169 > 0 then
                task.wait(v169);
            end;
            l_TweenService_0:Create(l_TextLabel_7, TweenInfo.new(v168, v171, v170), {
                TextTransparency = v167 and 0 or 1
            }):Play();
            if v164.Shadow then
                l_TweenService_0:Create(v164.Shadow, TweenInfo.new(v168, v171, v170), {
                    TextTransparency = v167 and 0 or 1
                }):Play();
            end;
        end);
    end
});
v25.DefineTag({
    Name = "bounce", 
    VisualEffect = true, 
    Handler = function(v172) --[[ Line: 960 ]] --[[ Name: Handler ]]
        local l_TextLabel_8 = v172.TextLabel;
        local l_Attributes_3 = v172.Attributes;
        local l_EffectCache_2 = v172.EffectCache;
        local v176 = tonumber(l_Attributes_3.speed) or 0.2;
        local v177 = tonumber(l_Attributes_3.offset) or 0.1;
        if l_EffectCache_2.Bounce then
            table.insert(l_EffectCache_2.Bounce, {
                TextLabel = l_TextLabel_8, 
                Shadow = v172.Shadow, 
                Offset = v177, 
                Speed = v176
            });
            return;
        else
            local v178 = {};
            l_EffectCache_2.Bounce = v178;
            table.insert(v178, {
                TextLabel = l_TextLabel_8, 
                Shadow = v172.Shadow, 
                Offset = v177, 
                Speed = v176
            });
            return task.spawn(function() --[[ Line: 989 ]]
                -- upvalues: v178 (copy)
                while task.wait() do
                    for _, v180 in v178 do
                        local l_Offset_0 = v180.Offset;
                        local l_Speed_0 = v180.Speed;
                        local l_TextLabel_9 = v180.TextLabel;
                        local v184 = math.abs(os.clock() * (l_Speed_0 * 60) % 2 - 1);
                        local l_fromScale_0 = UDim2.fromScale;
                        local v186 = 0;
                        local v187 = -l_Offset_0;
                        l_TextLabel_9.Position = l_fromScale_0(v186, v187 + (l_Offset_0 - v187) * v184);
                        if v180.Shadow then
                            v180.Shadow.Position = l_TextLabel_9.Position + UDim2.fromOffset(2, 2);
                        end;
                    end;
                end;
            end);
        end;
    end
});
v25.DefineTag({
    Name = "flow", 
    VisualEffect = true, 
    Handler = function(v188) --[[ Line: 1012 ]] --[[ Name: Handler ]]
        local l_TextLabel_10 = v188.TextLabel;
        local l_Attributes_4 = v188.Attributes;
        local l_EffectCache_3 = v188.EffectCache;
        local v192 = tonumber(l_Attributes_4.speed) or 0.2;
        local v193 = tonumber(l_Attributes_4.offset) or 0.1;
        if l_EffectCache_3.Flow then
            table.insert(l_EffectCache_3.Flow, {
                TextLabel = l_TextLabel_10, 
                Started = os.clock(), 
                Shadow = v188.Shadow, 
                Offset = v193, 
                Speed = v192
            });
            return;
        else
            local v194 = {};
            l_EffectCache_3.Flow = v194;
            table.insert(v194, {
                TextLabel = l_TextLabel_10, 
                Started = os.clock(), 
                Shadow = v188.Shadow, 
                Offset = v193, 
                Speed = v192
            });
            return task.spawn(function() --[[ Line: 1043 ]]
                -- upvalues: v194 (copy)
                while task.wait() do
                    for _, v196 in v194 do
                        local l_Started_0 = v196.Started;
                        local l_Offset_1 = v196.Offset;
                        local l_Speed_1 = v196.Speed;
                        local l_TextLabel_11 = v196.TextLabel;
                        local v201 = math.abs((os.clock() - l_Started_0) * (l_Speed_1 * 60) % 2 - 1);
                        local l_fromScale_1 = UDim2.fromScale;
                        local v203 = 0;
                        local v204 = -l_Offset_1;
                        l_TextLabel_11.Position = l_fromScale_1(v203, v204 + (l_Offset_1 - v204) * v201);
                        if v196.Shadow then
                            v196.Shadow.Position = l_TextLabel_11.Position + UDim2.fromOffset(2, 2);
                        end;
                    end;
                end;
            end);
        end;
    end
});
v25.DefineTag({
    Name = "instant", 
    SkipWait = true, 
    VisualEffect = true, 
    Handler = function() --[[ Line: 1068 ]] --[[ Name: Handler ]]

    end
});
v25.DefineTag({
    Name = "wait", 
    SkipResizing = true, 
    Handler = function(v205) --[[ Line: 1075 ]] --[[ Name: Handler ]]
        local v206 = tonumber(v205.Attributes.time) or 0.1;
        task.wait(v206);
    end
});
v25.DefineTag({
    Name = "img", 
    SkipResizing = true, 
    Handler = function(v207) --[[ Line: 1086 ]] --[[ Name: Handler ]]
        -- upvalues: v23 (copy)
        local l_Options_1 = v207.Options;
        local l_TextLabel_12 = v207.TextLabel;
        local l_Attributes_5 = v207.Attributes;
        local v211 = tonumber(l_Attributes_5.scale or "1");
        local v212 = v23(l_Attributes_5.color or "", l_Options_1.Colors) or Color3.new(1, 1, 1);
        local v213 = l_Attributes_5.src or "";
        local v214 = l_Attributes_5.scaleType or "Fit";
        local v215 = tonumber(l_Attributes_5.aspect or "1");
        local v216 = l_Attributes_5.backdrop ~= nil;
        local l_Parent_0 = l_TextLabel_12.Parent;
        l_Parent_0.Size = UDim2.fromScale(1, 1);
        local l_UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint");
        l_UIAspectRatioConstraint_1.AspectRatio = v215;
        l_UIAspectRatioConstraint_1.Parent = l_Parent_0;
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        l_ImageLabel_0.Image = v213;
        l_ImageLabel_0.ScaleType = Enum.ScaleType[v214];
        l_ImageLabel_0.Size = UDim2.fromScale(v211, v211);
        l_ImageLabel_0.Position = UDim2.fromScale(0.5, 0.5);
        l_ImageLabel_0.ImageColor3 = v212;
        l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
        l_ImageLabel_0.BackgroundTransparency = 1;
        l_ImageLabel_0.Parent = l_TextLabel_12;
        if v216 then
            for _, v221 in {
                UDim2.new(0.5, -2, 0.5, -2), 
                UDim2.new(0.5, 2, 0.5, 2), 
                UDim2.new(0.5, 2, 0.5, -2), 
                UDim2.new(0.5, -2, 0.5, 2)
            } do
                local l_ImageLabel_1 = Instance.new("ImageLabel");
                l_ImageLabel_1.Image = v213;
                l_ImageLabel_1.ZIndex = -1;
                l_ImageLabel_1.ScaleType = Enum.ScaleType[v214];
                l_ImageLabel_1.Size = UDim2.fromScale(v211, v211);
                l_ImageLabel_1.Position = v221;
                l_ImageLabel_1.ImageColor3 = Color3.new(0, 0, 0);
                l_ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5);
                l_ImageLabel_1.BackgroundTransparency = 1;
                l_ImageLabel_1.Parent = l_TextLabel_12;
            end;
        end;
        l_TextLabel_12.Size = UDim2.fromScale(1, 1);
        l_TextLabel_12.Text = "";
    end
});
v25.DefineTag({
    Name = "font", 
    InheritsFromRichText = true, 
    Handler = function(v223) --[[ Line: 1146 ]] --[[ Name: Handler ]]
        -- upvalues: v23 (copy)
        local l_Options_2 = v223.Options;
        local l_TextLabel_13 = v223.TextLabel;
        local l_Attributes_6 = v223.Attributes;
        local l_transparency_0 = l_Attributes_6.transparency;
        local l_family_0 = l_Attributes_6.family;
        local l_weight_0 = l_Attributes_6.weight;
        local l_color_0 = l_Attributes_6.color;
        local l_face_0 = l_Attributes_6.face;
        local l_FontFace_1 = l_TextLabel_13.FontFace;
        local l_Family_0 = l_FontFace_1.Family;
        local l_Weight_0 = l_FontFace_1.Weight;
        if l_family_0 and l_face_0 then
            warn("[BasedText]: 'face' attribute is ignored when 'family' is specified");
        end;
        if l_family_0 then
            l_Family_0 = l_family_0;
        elseif l_face_0 then
            local l_Font_0 = Enum.Font;
            local l_l_Font_0_0 = l_Font_0 --[[ copy: 13 -> 19 ]];
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 131 ]]
                -- upvalues: l_l_Font_0_0 (copy), l_face_0 (copy)
                return l_l_Font_0_0[l_face_0];
            end);
            local v239 = if not l_status_3 then nil else l_result_3;
            if v239 then
                l_Family_0 = Font.fromEnum(v239).Family;
            end;
        end;
        if l_weight_0 then
            local l_EnumItems_0 = Enum.FontWeight:GetEnumItems();
            local v241 = tonumber(l_weight_0);
            if v241 then
                l_Weight_0 = l_EnumItems_0[math.round(v241 / 100)] or l_Weight_0;
            else
                for _, v243 in l_EnumItems_0 do
                    if string.lower(v243.Name) == string.lower(l_weight_0) then
                        l_Weight_0 = v243;
                        break;
                    end;
                end;
            end;
        end;
        l_TextLabel_13.FontFace = Font.new(l_Family_0, l_Weight_0, l_FontFace_1.Style);
        if l_color_0 then
            l_TextLabel_13.TextColor3 = v23(l_color_0, l_Options_2.Colors) or l_TextLabel_13.TextColor3;
        end;
        if l_transparency_0 then
            local v244 = tonumber(l_transparency_0);
            if v244 then
                l_TextLabel_13.TextTransparency = v244;
            end;
        end;
    end
});
v25.DefineTag({
    Name = "pop", 
    Handler = function(v245) --[[ Line: 1219 ]] --[[ Name: Handler ]]
        -- upvalues: l_TweenService_0 (copy)
        local l_TextLabel_14 = v245.TextLabel;
        local l_Attributes_7 = v245.Attributes;
        local v248 = tonumber(l_Attributes_7.speed) or 0.3;
        local v249 = tonumber(l_Attributes_7.duration) or 0.3;
        local v250 = tonumber(l_Attributes_7.scale) or 1.2;
        local v251 = tonumber(l_Attributes_7.startScale) or 0;
        local v252 = tonumber(l_Attributes_7.endScale) or 1;
        local l_UIScale_0 = Instance.new("UIScale");
        l_UIScale_0.Name = "PopScale";
        l_UIScale_0.Scale = v251;
        l_UIScale_0.Parent = l_TextLabel_14.Parent;
        return task.spawn(function() --[[ Line: 1234 ]]
            -- upvalues: l_TweenService_0 (ref), l_UIScale_0 (copy), v248 (copy), v250 (copy), v249 (copy), v252 (copy), l_TextLabel_14 (copy)
            local v254 = l_TweenService_0:Create(l_UIScale_0, TweenInfo.new(v248, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Scale = v250
            });
            v254:Play();
            v254.Completed:Wait();
            task.wait(v249);
            local v255 = l_TweenService_0:Create(l_UIScale_0, TweenInfo.new(v248, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Scale = v252
            });
            v255:Play();
            v255.Completed:Wait();
            if v252 == 1 then
                l_UIScale_0:Destroy();
                return;
            else
                if v252 == 0 then
                    l_TextLabel_14.Visible = false;
                end;
                return;
            end;
        end);
    end
});
v25.DefineTag({
    Name = "3d", 
    Handler = function(v256) --[[ Line: 1263 ]] --[[ Name: Handler ]]
        -- upvalues: l_TweenService_0 (copy)
        local l_TextLabel_15 = v256.TextLabel;
        local l_Attributes_8 = v256.Attributes;
        local v259 = tonumber(l_Attributes_8.goal) or 0;
        local v260 = tonumber(l_Attributes_8.start) or 0;
        local v261 = tonumber(l_Attributes_8.duration) or 0.6;
        local l_UIScale_1 = Instance.new("UIScale");
        l_UIScale_1.Name = "3DScale";
        l_UIScale_1.Scale = v260;
        l_UIScale_1.Parent = l_TextLabel_15.Parent;
        return task.spawn(function() --[[ Line: 1276 ]]
            -- upvalues: l_TweenService_0 (ref), l_UIScale_1 (copy), v261 (copy), v259 (copy), l_TextLabel_15 (copy)
            local v263 = l_TweenService_0:Create(l_UIScale_1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Scale = 1
            });
            v263:Play();
            v263.Completed:Wait();
            task.wait(v261);
            local v264 = l_TweenService_0:Create(l_UIScale_1, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Scale = v259
            });
            v264:Play();
            v264.Completed:Wait();
            l_TextLabel_15.Visible = v259 > 0;
        end);
    end
});
v25.DefineTag({
    Name = "stroke", 
    InheritsFromRichText = true, 
    Handler = function(v265) --[[ Line: 1302 ]] --[[ Name: Handler ]]
        -- upvalues: v23 (copy)
        local l_Options_3 = v265.Options;
        local l_TextLabel_16 = v265.TextLabel;
        local l_Attributes_9 = v265.Attributes;
        local v269 = v23(l_Attributes_9.color or "", l_Options_3.Colors) or Color3.new(0, 0, 0);
        local v270 = l_Attributes_9.joins or "Miter";
        local v271 = tonumber(l_Attributes_9.thickness or "") or 1;
        local v272 = tonumber(l_Attributes_9.transparency or "") or 0;
        local l_UIStroke_0 = Instance.new("UIStroke");
        l_UIStroke_0.Color = v269;
        l_UIStroke_0.Thickness = v271;
        l_UIStroke_0.LineJoinMode = Enum.LineJoinMode[v270];
        l_UIStroke_0.Transparency = v272;
        v265.GraphemeOptions.Width = v271;
        l_UIStroke_0.Parent = l_TextLabel_16;
    end
});
v25.DefineTag({
    Name = "scb", 
    Handler = function(_) --[[ Line: 1327 ]] --[[ Name: Handler ]]

    end
});
return v25;