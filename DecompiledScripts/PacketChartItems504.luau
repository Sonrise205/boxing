local l_Parent_0 = script.Parent.Parent;
local l_Components_0 = l_Parent_0.Components;
local l_Modules_0 = l_Parent_0.Modules;
local v3 = require(l_Modules_0.Packages);
local v4 = require(v3.Directory.Roact);
local v5 = require(l_Components_0.StudioTheme);
local function v7(v6) --[[ Line: 10 ]] --[[ Name: GetSizeUnit ]]
    if v6 < 1000 then
        return v6, "bytes";
    elseif v6 < 1000000 then
        return v6 / 1000, "kilobytes";
    else
        return v6 / 1000000, "megabytes";
    end;
end;
local v8 = v4.Component:extend("DataChartItem");
v8.init = function(v9) --[[ Line: 22 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    local v10, v11 = v4.createBinding(false);
    v9.RemoteData = v10;
    v9.ShowRemoteData = v11;
    v10, v11 = v4.createBinding(Vector2.zero);
    v9.Size = v10;
    v9.SetSize = v11;
end;
v8.render = function(v12) --[[ Line: 27 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v4 (copy), v7 (copy)
    local l_Arc_0 = v12.props.Arc;
    local v14 = {};
    for v15, v16 in v12.props.RemoteData do
        v14[v15] = v5(function(v17) --[[ Line: 31 ]]
            -- upvalues: v15 (copy), v4 (ref), v16 (copy), v12 (copy)
            local v18 = v15 * 2;
            local v19 = v15 * 2 + 1;
            local v20 = v4.createElement("TextButton", {
                AutoLocalize = false, 
                LayoutOrder = v18, 
                Font = Enum.Font.SourceSans, 
                Text = v16.Name, 
                RichText = true, 
                TextColor3 = v17:GetColor("BrightText"), 
                TextSize = 14, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 20), 
                Visible = v12.RemoteData, 
                Selectable = false
            }, {
                Padding = v4.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 4)
                })
            });
            local v23 = v4.createElement("ScrollingFrame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                AutomaticCanvasSize = Enum.AutomaticSize.X, 
                LayoutOrder = v19, 
                BackgroundColor3 = v17:GetColor("ScrollBarBackground"), 
                Position = UDim2.fromOffset(0, 20), 
                Size = UDim2.new(1, -12, 0, 0), 
                ClipsDescendants = true, 
                BorderSizePixel = 0, 
                ScrollBarImageColor3 = v17:GetColor("ScrollBar"), 
                ScrollBarThickness = 4, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                Visible = v12.RemoteData, 
                [v4.Ref] = function(v21) --[[ Line: 66 ]]
                    if v21 ~= nil then
                        task.delay(0.1, function() --[[ Line: 71 ]]
                            -- upvalues: v21 (copy)
                            local l_UICorner_0 = Instance.new("UICorner");
                            l_UICorner_0.CornerRadius = UDim.new(0, 4);
                            l_UICorner_0.Parent = v21;
                        end);
                    end;
                end
            }, {
                UIStroke = v4.createElement("UIStroke", {
                    Color = v17:GetColor("DropShadow"), 
                    LineJoinMode = Enum.LineJoinMode.Round, 
                    Transparency = 0.5
                }), 
                Text = v4.createElement("TextLabel", {
                    AutoLocalize = false, 
                    Font = Enum.Font.Code, 
                    RichText = true, 
                    Text = v16.Packet, 
                    TextColor3 = v17:GetColor("BrightText"), 
                    TextSize = 12, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    ClipsDescendants = true
                }, {
                    Padding = v4.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 8), 
                        PaddingRight = UDim.new(0, 8), 
                        PaddingLeft = UDim.new(0, 4), 
                        PaddingTop = UDim.new(0, 4)
                    })
                })
            });
            return v4.createFragment({
                v20, 
                v23
            });
        end);
    end;
    return v5(function(v24) --[[ Line: 111 ]]
        -- upvalues: v4 (ref), l_Arc_0 (copy), v7 (ref), v12 (copy), v14 (copy)
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 22), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Information = v4.createElement("TextButton", {
                AutoLocalize = false, 
                Font = Enum.Font.SourceSans, 
                Text = string.format("<font color=\"#%s\"><b>%s</b></font>: %.1f%%, %d %s", l_Arc_0.Color:ToHex(), l_Arc_0.Name, l_Arc_0.Percent, v7(l_Arc_0.DataSize)), 
                RichText = true, 
                TextColor3 = v24:GetColor("BrightText"), 
                TextSize = 14, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -18, 0, 20), 
                Position = UDim2.fromOffset(18, 0), 
                ZIndex = 3, 
                [v4.Event.Activated] = function() --[[ Line: 129 ]]
                    -- upvalues: v12 (ref)
                    v12.ShowRemoteData(not v12.RemoteData:getValue());
                end
            }, {
                Padding = v4.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 4)
                })
            }), 
            Chevron = v4.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v12.RemoteData:map(function(v25) --[[ Line: 139 ]]
                    if v25 then
                        return "rbxassetid://18699144520";
                    else
                        return "rbxassetid://18699113012";
                    end;
                end), 
                ImageColor3 = v24:GetColor("BrightText"), 
                Size = UDim2.fromOffset(16, 16), 
                Position = UDim2.fromOffset(0, 2)
            }), 
            Container = v4.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = v12.props.ScrollBarChanged:map(function(v26) --[[ Line: 148 ]]
                    return UDim2.new(1, v26.Visible and -12 or 0, 0, 0);
                end), 
                Position = UDim2.fromOffset(8, 24), 
                Transparency = 1, 
                [v4.Change.AbsoluteSize] = function(v27) --[[ Line: 153 ]]
                    -- upvalues: v12 (ref)
                    v12.SetSize(v27.AbsoluteSize);
                end
            }, {
                RemoteData = v4.createFragment(v14), 
                UIListLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 0)
                })
            }), 
            Divider = v4.createElement("Frame", {
                BackgroundColor3 = v24:GetColor("DropShadow"), 
                Transparency = 0.5, 
                BorderSizePixel = 0, 
                Size = v12.Size:map(function(v28) --[[ Line: 170 ]]
                    return UDim2.new(0, 1, 0, v28.Y);
                end), 
                Position = UDim2.fromOffset(0, 26), 
                ZIndex = 2
            })
        });
    end);
end;
return function(v29) --[[ Line: 180 ]] --[[ Name: DataChartItems ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v30 = {};
    local v31 = 0;
    for _, v33 in v29.Arcs do
        v31 = v31 - v33.Percent;
        v30[v31] = v4.createElement(v8, {
            Arc = v33, 
            RemoteData = v33.RemoteData, 
            ScrollBarChanged = v29.ScrollBarChanged
        });
    end;
    return v4.createFragment(v30);
end;