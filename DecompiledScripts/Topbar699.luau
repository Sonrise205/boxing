local v0 = false;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("GuiService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local v8;
if game:GetService("RunService"):IsClient() then
    v8 = shared.BridgeNet2;
    if not v8 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v8 = shared.BridgeNet2;
        v0 = v8;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v8 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v9 = v8.ReferenceBridge("UpdateSettings");
local v10 = v8.ReferenceBridge("UpdateRoundOutfit");
local v11 = require(l_ReplicatedFirst_0.TableUtil);
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local v13 = require(l_ReplicatedStorage_0.Icon);
local v14 = workspace:WaitForChild("Settings", 30);
local v15 = {
    "DisableHUD", 
    "HideNametags"
};
local v16 = nil;
SaveSettings = function() --[[ Line: 47 ]] --[[ Name: SaveSettings ]]
    -- upvalues: v16 (ref), v14 (copy), v15 (copy), v9 (copy)
    local v17 = tick();
    v16 = v17;
    task.delay(3, function() --[[ Line: 51 ]]
        -- upvalues: v16 (ref), v17 (copy), v14 (ref), v15 (ref), v9 (ref)
        if v16 ~= v17 then
            return;
        else
            local v18 = {};
            for _, v20 in v14:GetChildren() do
                if not table.find(v15, v20.Name) then
                    v18[v20.Name] = v20.Value;
                    if v20:IsA("Vector3Value") then
                        v18[v20.Name] = {
                            v20.Value.X, 
                            v20.Value.Y, 
                            v20.Value.Z
                        };
                    end;
                end;
            end;
            v9:Fire(v18);
            return;
        end;
    end);
end;
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local function _() --[[ Line: 71 ]] --[[ Name: IsXbox ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    return l_LocalPlayer_0:GetAttribute("Interface") == "Controller";
end;
GetPlayerData = function(v23) --[[ Line: 75 ]] --[[ Name: GetPlayerData ]]
    if not v23 then
        return;
    else
        local v24 = workspace:WaitForChild("States", 30):WaitForChild(v23.Name, 30);
        if not v24 then
            return;
        else
            return v24:WaitForChild("PlayerData", 30);
        end;
    end;
end;
local v25 = false;
v9:Connect(function(v26) --[[ Line: 84 ]]
    -- upvalues: v25 (ref), l_LocalPlayer_0 (copy), v14 (copy), l_UserInputService_0 (copy), l_SoundHelper_0 (copy), l_Places_0 (copy), v13 (copy), l_ReplicatedStorage_0 (copy), v11 (copy), l_MarketplaceService_0 (copy), v10 (copy)
    if v25 then
        return;
    else
        v25 = true;
        local v27 = GetPlayerData(l_LocalPlayer_0);
        for _, v29 in v14:GetChildren() do
            local v30 = v26[v29.Name];
            if v29:IsA("Vector3Value") then
                v30 = Vector3.new(v30[1], v30[2], v30[3]);
            end;
            v29.Value = v30;
        end;
        local v31 = not l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.TouchEnabled;
        local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
        local v33 = l_PlayerGui_0:WaitForChild("Common", 30);
        if v31 then
            v33.ColorPicker.Size = UDim2.new(1, 0, 1, 0);
            v33.ColorPicker.Position = UDim2.new(0, 14, 0, 0);
        end;
        local function v43(v34) --[[ Line: 110 ]] --[[ Name: ApplyToggleable ]]
            -- upvalues: v14 (ref), l_SoundHelper_0 (ref)
            local l_icon_0 = v34.icon;
            local l_label_0 = v34.label;
            local l_setting_0 = v34.setting;
            local l_extrafunction_0 = v34.extrafunction;
            local l_v14_FirstChild_0 = v14:FindFirstChild(l_setting_0);
            if not l_v14_FirstChild_0 then
                return;
            else
                local l_Value_0 = l_v14_FirstChild_0.Value;
                local function _() --[[ Line: 121 ]] --[[ Name: SetEnabled ]]
                    -- upvalues: l_Value_0 (ref), l_icon_0 (copy), l_v14_FirstChild_0 (copy)
                    if l_Value_0 then
                        l_icon_0:setImage(16350014733);
                    else
                        l_icon_0:setImage(16350015302);
                    end;
                    l_v14_FirstChild_0.Value = l_Value_0;
                end;
                if l_Value_0 then
                    l_icon_0:setImage(16350014733);
                else
                    l_icon_0:setImage(16350015302);
                end;
                l_v14_FirstChild_0.Value = l_Value_0;
                if l_extrafunction_0 then
                    l_extrafunction_0(l_Value_0);
                end;
                l_icon_0:setLabel(l_label_0);
                l_icon_0:bindEvent("selected", function(v42) --[[ Line: 134 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Value_0 (ref), l_icon_0 (copy), l_v14_FirstChild_0 (copy), l_extrafunction_0 (copy)
                    v42:deselect();
                    l_SoundHelper_0:PlaySound({
                        Name = "Pop2", 
                        Parent = workspace
                    });
                    l_Value_0 = not l_Value_0;
                    if l_Value_0 then
                        l_icon_0:setImage(16350014733);
                    else
                        l_icon_0:setImage(16350015302);
                    end;
                    l_v14_FirstChild_0.Value = l_Value_0;
                    if l_extrafunction_0 then
                        l_extrafunction_0(l_Value_0);
                    end;
                    SaveSettings();
                    v42:debounce(0.25);
                end);
                return;
            end;
        end;
        local v44 = {};
        local v45 = {};
        local v46 = tick();
        local function v64(v47) --[[ Line: 162 ]] --[[ Name: SetFastMode ]]
            -- upvalues: v46 (ref), l_LocalPlayer_0 (ref), v44 (ref), v45 (copy), v31 (copy)
            local v48 = tick();
            v46 = v48;
            local l_FirstChild_0 = workspace.Welds:FindFirstChild(l_LocalPlayer_0.Name);
            if v47 then
                for _, v51 in workspace:GetChildren() do
                    if v51 ~= workspace.Live then
                        for _, v53 in v51:GetDescendants() do
                            if v48 ~= v46 then
                                return;
                            else
                                if v53:IsA("BasePart") and v53.CastShadow then
                                    table.insert(v44, v53);
                                    v53.CastShadow = false;
                                end;
                                if v53:IsA("ParticleEmitter") then
                                    table.insert(v44, v53);
                                    v53.Rate = v53.Rate / 3;
                                end;
                            end;
                        end;
                    end;
                end;
                for _, v55 in workspace.Live:GetDescendants() do
                    if v48 ~= v46 then
                        return;
                    else
                        if v55:IsA("BasePart") then
                            v55.CastShadow = false;
                        end;
                        if v55:IsA("ParticleEmitter") then
                            v55.Rate = v55.Rate / 3;
                        end;
                    end;
                end;
                if v48 ~= v46 then
                    return;
                else
                    v45[1] = workspace.Live.DescendantAdded:Connect(function(v56) --[[ Line: 205 ]]
                        if v56:IsA("BasePart") then
                            v56.CastShadow = false;
                        end;
                        if v56:IsA("ParticleEmitter") then
                            v56.Rate = v56.Rate / 3;
                        end;
                    end);
                    v45[2] = l_FirstChild_0.DescendantAdded:Connect(function(v57) --[[ Line: 215 ]]
                        if v57:IsA("BasePart") then
                            v57.CastShadow = false;
                        end;
                        if v57:IsA("ParticleEmitter") then
                            v57.Rate = v57.Rate / 3;
                        end;
                    end);
                    game.Lighting.GlobalShadows = false;
                    return;
                end;
            else
                if v31 then

                end;
                if #v44 <= 0 then
                    return;
                else
                    for _, v59 in v45 do
                        v59:Disconnect();
                    end;
                    for _, v61 in v44 do
                        if v48 ~= v46 then
                            return;
                        elseif v61:IsA("BasePart") then
                            v61.CastShadow = true;
                        elseif v61:IsA("ParticleEmitter") then
                            v61.Rate = v61.Rate * 3;
                        end;
                    end;
                    v44 = {};
                    for _, v63 in workspace.Live:GetDescendants() do
                        if v48 ~= v46 then
                            return;
                        else
                            if v63:IsA("BasePart") then
                                v63.CastShadow = true;
                            end;
                            if v63:IsA("ParticleEmitter") then
                                v63.Rate = v63.Rate * 3;
                            end;
                        end;
                    end;
                    if v48 ~= v46 then
                        return;
                    else
                        game.Lighting.GlobalShadows = true;
                        return;
                    end;
                end;
            end;
        end;
        local function v66(v65) --[[ Line: 303 ]] --[[ Name: SetDisableHUD ]]
            -- upvalues: l_PlayerGui_0 (copy), v33 (copy)
            if v65 then
                l_PlayerGui_0.Main.Enabled = false;
                v33.Enabled = false;
                return;
            else
                l_PlayerGui_0.Main.Enabled = true;
                v33.Enabled = true;
                return;
            end;
        end;
        local v67 = {};
        local l_Color_0 = require(game.ReplicatedStorage:WaitForChild("Color"));
        local v69 = nil;
        local v70 = nil;
        if l_Places_0:IsTesting() then
            local v71 = v13.new();
            v71:setImage(131358823168682);
            v71:setLabel("Private Server +");
            v71:setTextColor(Color3.fromRGB(255, 217, 64));
            local l_v71_0 = v71 --[[ copy: 15 -> 61 ]];
            v71:bindEvent("selected", function(_) --[[ Line: 327 ]]
                -- upvalues: v14 (ref), v70 (ref), v33 (copy), l_ReplicatedStorage_0 (ref), l_v71_0 (copy)
                if v14.DisableHUD.Value then
                    v70:select();
                end;
                if not v33:FindFirstChild("PrivateServerGUI") then
                    local v74 = l_ReplicatedStorage_0.PrivateServerPlusModules.PrivateServerGUI:Clone();
                    v74.PSHandler_CLIENT.Enabled = true;
                    v74.Parent = v33;
                    task.wait();
                end;
                v33.PrivateServerGUI.Visible = true;
                l_v71_0:debounce(0.25);
                l_v71_0:deselect();
            end);
            table.insert(v67, v71);
        end;
        local v75 = v13.new();
        v75:setImage(4458829019);
        v75:setLabel("Highlight Colors");
        v75:bindEvent("selected", function(v76) --[[ Line: 352 ]]
            -- upvalues: v14 (ref), v70 (ref), l_SoundHelper_0 (ref), v69 (ref), l_Color_0 (copy), v33 (copy)
            if v14.DisableHUD.Value then
                v70:select();
            end;
            v76:deselect();
            l_SoundHelper_0:PlaySound({
                Name = "Pop2", 
                Parent = workspace
            });
            local l_Mouse_0 = game.Players.LocalPlayer:GetMouse();
            if v69 then
                v69:Destroy();
            end;
            v69 = l_Color_0.New(v33.ColorPicker, l_Mouse_0);
            local l_HighlightColor_0 = v14.HighlightColor;
            local v79 = Color3.fromRGB(l_HighlightColor_0.Value.X, l_HighlightColor_0.Value.Y, l_HighlightColor_0.Value.Z);
            v69:SetColor(v79);
            v69.Finished:Connect(function(v80) --[[ Line: 374 ]]
                -- upvalues: l_HighlightColor_0 (copy)
                l_HighlightColor_0.Value = Vector3.new(v80.R * 255, v80.G * 255, v80.B * 255);
                SaveSettings();
            end);
            v76:debounce(0.5);
        end);
        table.insert(v67, v75);
        local l_TweenService_0 = game:GetService("TweenService");
        local v82 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local l_Keybinds_0 = v33.Keybinds;
        local l_Main_0 = l_Keybinds_0.Main;
        local l_SizeFrame_0 = l_Keybinds_0.SizeFrame;
        local l_Close_0 = l_Main_0.Close;
        local l_Prompt_0 = l_Main_0.Prompt;
        local function v90() --[[ Line: 397 ]] --[[ Name: CloseKeybinds ]]
            -- upvalues: l_Main_0 (copy), l_SoundHelper_0 (ref), l_TweenService_0 (copy), v82 (copy), l_SizeFrame_0 (copy)
            if not l_Main_0.Visible then
                return;
            else
                l_SoundHelper_0:PlaySound({
                    Name = "Close", 
                    Parent = workspace
                });
                l_TweenService_0:Create(l_Main_0, v82, {
                    Size = UDim2.new(l_SizeFrame_0.Size.X.Scale, 0, 0, 0)
                }):Play();
                task.wait(0.1);
                l_TweenService_0:Create(l_Main_0, v82, {
                    Size = UDim2.new(0, 0, 0, 0)
                }):Play();
                task.wait(0.225);
                l_Main_0.Visible = false;
                return;
            end;
        end;
        if not v31 then
            local function _() --[[ Line: 414 ]] --[[ Name: GetInterface ]]
                -- upvalues: l_LocalPlayer_0 (ref)
                return l_LocalPlayer_0:GetAttribute("Interface");
            end;
            local l_Keybinds_1 = require(l_ReplicatedStorage_0:WaitForChild("Keybinds"));
            local v93 = v13.new();
            v93:setImage(4458829019);
            v93:setLabel("Set Keybinds");
            local l_l_Keybinds_1_0 = l_Keybinds_1 --[[ copy: 27 -> 60 ]];
            v93:bindEvent("selected", function(v95) --[[ Line: 421 ]]
                -- upvalues: l_SoundHelper_0 (ref), l_LocalPlayer_0 (ref), v33 (copy), l_Prompt_0 (copy), l_Close_0 (copy), v90 (copy), l_Main_0 (copy), v14 (ref), v70 (ref), l_l_Keybinds_1_0 (copy), l_TweenService_0 (copy), v82 (copy), l_SizeFrame_0 (copy)
                v95:deselect();
                l_SoundHelper_0:PlaySound({
                    Name = "Pop2", 
                    Parent = workspace
                });
                if l_LocalPlayer_0:GetAttribute("Interface") == "Controller" then
                    v33.Keybinds.Main.Subtitle.Text = "CONTROLLER";
                else
                    v33.Keybinds.Main.Subtitle.Text = "KEYBOARD";
                end;
                l_Prompt_0.Button.MouseButton1Down:Connect(function() --[[ Line: 432 ]]
                    SaveSettings();
                end);
                l_Close_0.Button.MouseButton1Down:Connect(function() --[[ Line: 436 ]]
                    -- upvalues: v90 (ref)
                    v90();
                end);
                if l_Main_0.Visible then
                    v90();
                else
                    if v14.DisableHUD.Value then
                        v70:select();
                    end;
                    for _, v97 in l_Main_0.Scroll.Controls.Keybinds:GetChildren() do
                        local l_Press_0 = v97:FindFirstChild("Press");
                        if l_Press_0 then
                            if l_LocalPlayer_0:GetAttribute("Interface") == "Controller" then
                                l_Press_0.Key.Text = l_l_Keybinds_1_0.GetGamepadBind(v97.Name).Name;
                            else
                                l_Press_0.Key.Text = l_l_Keybinds_1_0.GetKeybind(v97.Name).Name;
                            end;
                            l_Press_0.Key.Text = string.gsub(l_Press_0.Key.Text, "Button", "");
                        end;
                    end;
                    l_Main_0.Size = UDim2.new(0, 0, 0, 0);
                    l_Main_0.Visible = true;
                    l_TweenService_0:Create(l_Main_0, v82, {
                        Size = UDim2.new(l_SizeFrame_0.Size.X.Scale * 1, 0, l_SizeFrame_0.Size.Y.Scale * 0.1, 0)
                    }):Play();
                    task.wait(0.1);
                    l_TweenService_0:Create(l_Main_0, v82, {
                        Size = l_SizeFrame_0.Size
                    }):Play();
                end;
                v95:debounce(0.5);
            end);
            table.insert(v67, v93);
        end;
        local v99 = v13.new();
        v43({
            icon = v99, 
            label = "Performance Mode", 
            setting = "PerformanceMode", 
            extrafunction = v64
        });
        local v100 = v13.new();
        v43({
            icon = v100, 
            label = "Hide Others In Match", 
            setting = "HideOthers"
        });
        local v101 = v13.new();
        v43({
            icon = v101, 
            label = "Reduce Camera Shake", 
            setting = "ReduceCameraShake"
        });
        local v102 = v13.new();
        v43({
            icon = v102, 
            label = "Advanced Server Info", 
            setting = "ServerInfo"
        });
        local v103 = v13.new();
        v43({
            icon = v103, 
            label = "Ultimate Music", 
            setting = "UltimateMusic"
        });
        local v104 = v13.new();
        v43({
            icon = v104, 
            label = "Match Commentary", 
            setting = "CommentaryEnabled"
        });
        local v105 = v13.new();
        v43({
            icon = v105, 
            label = "System Messages", 
            setting = "SystemMessagesEnabled"
        });
        local v106 = v13.new();
        v43({
            icon = v106, 
            label = "Reverse Knockdowns", 
            setting = "PlayKnockdownOnSelf"
        });
        local v107 = v13.new();
        v43({
            icon = v107, 
            label = "Show Scores", 
            setting = "ShowScores"
        });
        local v108 = v13.new();
        v43({
            icon = v108, 
            label = "Hide Nametags", 
            setting = "HideNametags"
        });
        v70 = v13.new();
        v43({
            icon = v70, 
            label = "Disable HUD", 
            enabled = false, 
            setting = "DisableHUD", 
            extrafunction = v66
        });
        local v109 = v13.new();
        v43({
            icon = v109, 
            label = "Enable Shiny Outfits", 
            setting = "ShinyOutfits"
        });
        local v110 = v13.new();
        v43({
            icon = v110, 
            label = "Override Shiny Startups", 
            setting = "ShinyStartups"
        });
        table.insert(v67, v99);
        table.insert(v67, v100);
        table.insert(v67, v101);
        table.insert(v67, v102);
        table.insert(v67, v106);
        table.insert(v67, v103);
        table.insert(v67, v104);
        table.insert(v67, v105);
        table.insert(v67, v107);
        table.insert(v67, v108);
        table.insert(v67, v70);
        table.insert(v67, v109);
        table.insert(v67, v110);
        local function v124(v111) --[[ Line: 586 ]] --[[ Name: ApplyMulti ]]
            -- upvalues: v14 (ref), l_SoundHelper_0 (ref)
            local l_icon_1 = v111.icon;
            local l_label_1 = v111.label;
            local l_filter_0 = v111.filter;
            local l_setting_1 = v111.setting;
            local l_options_0 = v111.options;
            local v117 = v111.displayNames or l_options_0;
            local l_extrafunction_1 = v111.extrafunction;
            local l_v14_FirstChild_1 = v14:FindFirstChild(l_setting_1);
            if not l_v14_FirstChild_1 then
                return;
            else
                local l_Value_1 = l_v14_FirstChild_1.Value;
                local function _() --[[ Line: 601 ]] --[[ Name: SetLabel ]]
                    -- upvalues: l_icon_1 (copy), l_label_1 (copy), v117 (copy), l_options_0 (copy), l_Value_1 (ref), l_v14_FirstChild_1 (copy)
                    l_icon_1:setLabel(l_label_1 .. ": " .. v117[table.find(l_options_0, l_Value_1)]);
                    l_v14_FirstChild_1.Value = l_Value_1;
                end;
                l_icon_1:setLabel(l_label_1 .. ": " .. v117[table.find(l_options_0, l_Value_1)]);
                l_v14_FirstChild_1.Value = l_Value_1;
                if l_extrafunction_1 then
                    l_extrafunction_1(l_Value_1);
                end;
                l_v14_FirstChild_1.Changed:Connect(function() --[[ Line: 611 ]]
                    -- upvalues: l_Value_1 (ref), l_v14_FirstChild_1 (copy), l_icon_1 (copy), l_label_1 (copy), v117 (copy), l_options_0 (copy), l_extrafunction_1 (copy)
                    if l_Value_1 ~= l_v14_FirstChild_1.Value then
                        l_Value_1 = l_v14_FirstChild_1.Value;
                        l_icon_1:setLabel(l_label_1 .. ": " .. v117[table.find(l_options_0, l_Value_1)]);
                        l_v14_FirstChild_1.Value = l_Value_1;
                        if l_extrafunction_1 then
                            l_extrafunction_1();
                        end;
                    end;
                end);
                l_icon_1:bindEvent("selected", function(v122) --[[ Line: 624 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_options_0 (copy), l_filter_0 (copy), l_Value_1 (ref), l_icon_1 (copy), l_label_1 (copy), v117 (copy), l_v14_FirstChild_1 (copy), l_extrafunction_1 (copy)
                    v122:deselect();
                    l_SoundHelper_0:PlaySound({
                        Name = "Pop2", 
                        Parent = workspace
                    });
                    local l_l_options_0_0 = l_options_0;
                    if l_filter_0 then
                        l_l_options_0_0 = l_filter_0(l_options_0);
                    end;
                    l_Value_1 = l_l_options_0_0[(table.find(l_l_options_0_0, l_Value_1) or 0) + 1];
                    if not l_Value_1 then
                        l_Value_1 = "None";
                    end;
                    l_icon_1:setLabel(l_label_1 .. ": " .. v117[table.find(l_options_0, l_Value_1)]);
                    l_v14_FirstChild_1.Value = l_Value_1;
                    if l_extrafunction_1 then
                        l_extrafunction_1(l_Value_1);
                    end;
                    v122:debounce(0.1);
                    SaveSettings();
                end);
                return;
            end;
        end;
        local v125 = v13.new();
        v124({
            icon = v125, 
            label = "Commentator", 
            setting = "MatchCommentator", 
            options = {
                "None", 
                "AndreBerto"
            }, 
            displayNames = {
                "None", 
                "Andre Berto"
            }, 
            filter = function(v126) --[[ Line: 663 ]] --[[ Name: filter ]]
                -- upvalues: v11 (ref), l_Places_0 (ref), l_MarketplaceService_0 (ref), l_LocalPlayer_0 (ref)
                return v11.Array.Filter1D(v126, function(v127) --[[ Line: 664 ]]
                    -- upvalues: l_Places_0 (ref), l_MarketplaceService_0 (ref), l_LocalPlayer_0 (ref)
                    if v127 == "AndreBerto" then
                        if l_Places_0.IsTesting() then
                            return true;
                        else
                            local l_status_0, l_result_0 = pcall(function() --[[ Line: 670 ]]
                                -- upvalues: l_MarketplaceService_0 (ref), l_LocalPlayer_0 (ref)
                                return l_MarketplaceService_0:UserOwnsGamePassAsync(l_LocalPlayer_0.UserId, 1602385613);
                            end);
                            return l_status_0 and l_result_0;
                        end;
                    else
                        return true;
                    end;
                end);
            end
        });
        table.insert(v67, v125);
        local function v137(v130) --[[ Line: 685 ]] --[[ Name: RoundKnockdowns ]]
            -- upvalues: l_SoundHelper_0 (ref), l_LocalPlayer_0 (ref), v10 (ref), l_MarketplaceService_0 (ref), l_ReplicatedStorage_0 (ref)
            local l_icon_2 = v130.icon;
            local l_label_2 = v130.label;
            local l_setting_2 = v130.setting;
            l_icon_2:setImage(11768914234);
            if l_setting_2 == 4 then
                l_icon_2:setImage(6723921202);
            elseif l_setting_2 > 4 then
                l_icon_2:setImage(13456121117);
            end;
            l_icon_2:setLabel(l_label_2);
            l_icon_2:setTextColor(Color3.fromRGB(255, 217, 64));
            l_icon_2:bindEvent("selected", function(v134) --[[ Line: 700 ]]
                -- upvalues: l_SoundHelper_0 (ref), l_LocalPlayer_0 (ref), v10 (ref), l_setting_2 (copy), l_MarketplaceService_0 (ref), l_ReplicatedStorage_0 (ref)
                l_SoundHelper_0:PlaySound({
                    Name = "Pop2", 
                    Parent = workspace
                });
                v134:deselect();
                if l_LocalPlayer_0:GetAttribute("RoundOutfits") then
                    v10:Fire(l_setting_2);
                    local l_Events_0 = l_ReplicatedStorage_0:FindFirstChild("Events");
                    local v136 = l_Events_0 and l_Events_0:FindFirstChild("BasicMessage");
                    if v136 and l_setting_2 <= 4 then
                        v136:Fire({
                            Message = l_setting_2 == 4 and "Reset all outfits!" or "Saved Round " .. l_setting_2 .. " Outfit + Knockdown + Gloves", 
                            Color = Color3.fromRGB(255, 215, 70), 
                            Sound = "CatalogPress", 
                            IsRainbow = false, 
                            HoldTime = 2
                        });
                    end;
                    v134:debounce(2.5);
                    return;
                else
                    l_MarketplaceService_0:PromptGamePassPurchase(l_LocalPlayer_0, 966828525);
                    return;
                end;
            end);
        end;
        local v138 = v13.new();
        v137({
            icon = v138, 
            label = "Save Round 1 Outfit", 
            setting = 1
        });
        local v139 = v13.new();
        v137({
            icon = v139, 
            label = "Save Round 2 Outfit", 
            setting = 2
        });
        local v140 = v13.new();
        v137({
            icon = v140, 
            label = "Save Round 3 Outfit", 
            setting = 3
        });
        local v141 = v13.new();
        v137({
            icon = v141, 
            label = "Reset Outfits", 
            setting = 4
        });
        table.insert(v67, v138);
        table.insert(v67, v139);
        table.insert(v67, v140);
        table.insert(v67, v141);
        local v142 = v13.new():setImage(484211948):setLabel("");
        local function v147() --[[ Line: 772 ]] --[[ Name: InitializeSettings ]]
            -- upvalues: v142 (copy), v69 (ref), v90 (copy), v67 (copy)
            local v143 = nil;
            v142:bindEvent("selected", function(_) --[[ Line: 774 ]]
                -- upvalues: v143 (ref)
                v143 = game:GetService("StarterGui"):GetCore("ChatActive");
                game:GetService("StarterGui"):SetCore("ChatActive", false);
            end):bindEvent("deselected", function(_) --[[ Line: 778 ]]
                -- upvalues: v143 (ref)
                if v143 then
                    game:GetService("StarterGui"):SetCore("ChatActive", v143);
                end;
            end);
            local v146 = nil;
            v142.selected:Connect(function() --[[ Line: 785 ]]
                -- upvalues: v146 (ref), v142 (ref)
                v146 = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 786 ]]
                    -- upvalues: v142 (ref)
                    if game:GetService("StarterGui"):GetCore("ChatActive") then
                        v142:deselect();
                    end;
                end);
            end);
            v142.deselected:Connect(function() --[[ Line: 793 ]]
                -- upvalues: v146 (ref), v69 (ref), v90 (ref)
                if v146 then
                    v146:Disconnect();
                end;
                if v69 then
                    v69:Destroy();
                end;
                v90();
            end);
            v142:setDropdown(v67);
        end;
        local v148 = v13.new();
        v137({
            icon = v148, 
            label = "Load Round 1 Outfit", 
            setting = 5
        });
        local v149 = v13.new();
        v137({
            icon = v149, 
            label = "Load Round 2 Outfit", 
            setting = 6
        });
        local v150 = v13.new();
        v137({
            icon = v150, 
            label = "Load Round 3 Outfit", 
            setting = 7
        });
        table.insert(v67, v148);
        table.insert(v67, v149);
        table.insert(v67, v150);
        local function v160(v151) --[[ Line: 830 ]] --[[ Name: ApplySound ]]
            -- upvalues: v14 (ref), l_SoundHelper_0 (ref)
            local l_icon_3 = v151.icon;
            local l_label_3 = v151.label;
            local l_setting_3 = v151.setting;
            local l_extrafunction_2 = v151.extrafunction;
            local l_v14_FirstChild_2 = v14:FindFirstChild(l_setting_3);
            if not l_v14_FirstChild_2 then
                return;
            else
                local l_Value_2 = l_v14_FirstChild_2.Value;
                local function _() --[[ Line: 841 ]] --[[ Name: SetLabel ]]
                    -- upvalues: l_icon_3 (copy), l_label_3 (copy), l_Value_2 (ref), l_v14_FirstChild_2 (copy)
                    l_icon_3:setLabel(l_label_3 .. ": " .. string.format("%.1f", l_Value_2) .. "x");
                    l_v14_FirstChild_2.Value = l_Value_2;
                end;
                l_icon_3:setLabel(l_label_3 .. ": " .. string.format("%.1f", l_Value_2) .. "x");
                l_v14_FirstChild_2.Value = l_Value_2;
                if l_extrafunction_2 then
                    l_extrafunction_2(l_Value_2);
                end;
                l_icon_3:setImage(6824924955);
                l_icon_3:bindEvent("selected", function(v159) --[[ Line: 852 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Value_2 (ref), l_icon_3 (copy), l_label_3 (copy), l_v14_FirstChild_2 (copy), l_extrafunction_2 (copy)
                    v159:deselect();
                    l_SoundHelper_0:PlaySound({
                        Name = "Pop2", 
                        Parent = workspace
                    });
                    l_Value_2 = l_Value_2 + 0.1;
                    if l_Value_2 > 1 then
                        l_Value_2 = 0;
                    end;
                    l_icon_3:setLabel(l_label_3 .. ": " .. string.format("%.1f", l_Value_2) .. "x");
                    l_v14_FirstChild_2.Value = l_Value_2;
                    if l_extrafunction_2 then
                        l_extrafunction_2(l_Value_2);
                    end;
                    v159:debounce(0.1);
                    SaveSettings();
                end);
                return;
            end;
        end;
        local v161 = v13.new();
        v160({
            icon = v161, 
            label = "Master Volume", 
            setting = "MasterVolume", 
            extrafunction = function(v162) --[[ Line: 883 ]] --[[ Name: extrafunction ]]
                for _, v164 in workspace.Debris:GetDescendants() do
                    if v164:IsA("Sound") then
                        local v165 = v164.RollOffMinDistance - 10;
                        if v165 <= 1 then
                            v164.Volume = v165 * v162;
                        end;
                    end;
                end;
            end
        });
        local v166 = v13.new();
        v160({
            icon = v166, 
            label = "Music Volume", 
            setting = "MusicVolume"
        });
        local v167 = v13.new();
        v160({
            icon = v167, 
            label = "Emote Volume", 
            setting = "EmoteVolume", 
            extrafunction = function(v168) --[[ Line: 911 ]] --[[ Name: extrafunction ]]
                for _, v170 in workspace.Debris:GetDescendants() do
                    if v170:IsA("Sound") and v170.Name == "Emote" then
                        local v171 = v170.RollOffMinDistance - 10;
                        if v171 <= 1 then
                            v170.Volume = v171 * v168;
                        end;
                    end;
                end;
            end
        });
        local v172 = v13.new();
        v160({
            icon = v172, 
            label = "Commentary Volume", 
            setting = "CommentaryVolume", 
            extrafunction = function(v173) --[[ Line: 930 ]] --[[ Name: extrafunction ]]
                for _, v175 in workspace.Debris:GetDescendants() do
                    if v175:IsA("Sound") and v175.Name == "Commentary" then
                        local v176 = v175.RollOffMinDistance - 10;
                        if v176 <= 1 then
                            v175.Volume = v176 * v173;
                        end;
                    end;
                end;
            end
        });
        table.insert(v67, v161);
        table.insert(v67, v166);
        table.insert(v67, v167);
        table.insert(v67, v172);
        local function v188(v177) --[[ Line: 949 ]] --[[ Name: ApplySoundGamepass ]]
            -- upvalues: l_SoundHelper_0 (ref), l_LocalPlayer_0 (ref), l_MarketplaceService_0 (ref), v33 (copy), v27 (copy)
            local l_icon_4 = v177.icon;
            local l_label_4 = v177.label;
            local l_setting_4 = v177.setting;
            l_icon_4:setImage(10844111750);
            l_icon_4:setTextColor(Color3.fromRGB(255, 217, 64));
            l_icon_4:setLabel(l_label_4);
            l_icon_4:bindEvent("selected", function(v181) --[[ Line: 957 ]]
                -- upvalues: l_SoundHelper_0 (ref), l_LocalPlayer_0 (ref), l_MarketplaceService_0 (ref), l_setting_4 (copy), v33 (ref), v27 (ref)
                v181:deselect();
                l_SoundHelper_0:PlaySound({
                    Name = "Pop2", 
                    Parent = workspace
                });
                if not l_LocalPlayer_0:GetAttribute("CustomSounds") then
                    l_MarketplaceService_0:PromptGamePassPurchase(l_LocalPlayer_0, 4730278139);
                    return;
                else
                    if workspace.CurrentMenu.Value == l_setting_4 then
                        workspace.CurrentMenu.Value = "";
                    else
                        workspace.CurrentMenu.Value = l_setting_4;
                        local l_Attribute_0 = v33.CounterSounds:GetAttribute("LastApplied");
                        local v183 = nil;
                        do
                            local l_v183_0 = v183;
                            l_v183_0 = workspace.CurrentMenu.Changed:Connect(function() --[[ Line: 978 ]]
                                -- upvalues: l_v183_0 (ref), v33 (ref), l_Attribute_0 (copy), v27 (ref)
                                if l_v183_0 then
                                    l_v183_0:Disconnect();
                                end;
                                if v33.CounterSounds:GetAttribute("LastApplied") == l_Attribute_0 then
                                    return;
                                else
                                    for _, v186 in v27:GetChildren() do
                                        local l_FirstChild_1 = workspace.Settings:FindFirstChild(v186.Name);
                                        if l_FirstChild_1 then
                                            v186.Value = l_FirstChild_1.Value;
                                        end;
                                    end;
                                    SaveSettings();
                                    return;
                                end;
                            end);
                        end;
                    end;
                    v181:debounce(1);
                    return;
                end;
            end);
        end;
        local v189 = v13.new();
        v43({
            icon = v189, 
            label = "Disable Images", 
            setting = "DisableImages"
        });
        local v190 = v13.new();
        v188({
            icon = v190, 
            label = "Counter Sounds", 
            setting = "CounterSounds"
        });
        local v191 = v13.new();
        v188({
            icon = v191, 
            label = "Ultimate Sounds", 
            setting = "UltimateSounds"
        });
        local v192 = v13.new();
        v188({
            icon = v192, 
            label = "Perfect Dodge Sounds", 
            setting = "PerfectSounds"
        });
        table.insert(v67, v189);
        table.insert(v67, v190);
        table.insert(v67, v191);
        table.insert(v67, v192);
        v147();
        return;
    end;
end);
v8.ReferenceBridge("GetSettings"):Fire(false);
l_MarketplaceService_0.PromptGamePassPurchaseFinished:Connect(function(v193, v194, v195) --[[ Line: 1041 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v14 (copy)
    if v193 == l_LocalPlayer_0 and v194 == 1602385613 and v195 then
        v14.MatchCommentator.Value = "AndreBerto";
        SaveSettings();
    end;
end);