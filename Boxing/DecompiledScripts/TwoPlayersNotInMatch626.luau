local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local _ = require("../SettingTypes");
local v3 = require("../Modules/ClientHelpers");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_DoublePlayerDropdown_0 = script.DoublePlayerDropdown;
local l_Template_0 = l_DoublePlayerDropdown_0.Template;
local l_PrivateServerGUI_0 = l_LocalPlayer_0.PlayerGui.Common.PrivateServerGUI;
local function _() --[[ Line: 15 ]] --[[ Name: GetAvailablePlayers ]]
    -- upvalues: l_Players_0 (copy)
    return l_Players_0:GetPlayers();
end;
local v9 = {
    Color = Color3.fromRGB(255, 255, 255), 
    Transparency = 0.4
};
local v10 = {
    Color = Color3.fromRGB(0, 255, 8), 
    Transparency = 0
};
local function _(v11, v12) --[[ Line: 29 ]] --[[ Name: SetButtonState ]]
    -- upvalues: v10 (copy), v9 (copy)
    local v13 = if v12 then v10 else v9;
    for v14, v15 in v13 do
        v11.UIStroke[v14] = v15;
    end;
end;
local function _(v17) --[[ Line: 38 ]] --[[ Name: NewButton ]]
    -- upvalues: l_Template_0 (copy)
    local v18 = l_Template_0:Clone();
    v18.Name = v17.UserId;
    v18.PlayerName.Text = v17.DisplayName;
    v18.Visible = true;
    return v18;
end;
return function(v20) --[[ Line: 47 ]] --[[ Name: OnInvoke ]]
    -- upvalues: l_DoublePlayerDropdown_0 (copy), v3 (copy), l_TweenService_0 (copy), v9 (copy), v10 (copy), l_PrivateServerGUI_0 (copy), l_Players_0 (copy), l_Template_0 (copy)
    local v21 = l_DoublePlayerDropdown_0:Clone();
    local l_ScrollingFrame_0 = v21.ScrollFrames.PlayerScroll1.ScrollingFrame;
    local l_ScrollingFrame_1 = v21.ScrollFrames.PlayerScroll2.ScrollingFrame;
    local l_UIScale_0 = v21.UIScale;
    local v25 = nil;
    local v26 = nil;
    local v27 = {};
    local function v30(v28) --[[ Line: 60 ]] --[[ Name: closeDropdown ]]
        -- upvalues: v20 (copy), v3 (ref), l_TweenService_0 (ref), l_UIScale_0 (copy), v21 (copy)
        v20.OnChange:Fire(v28);
        v3.TweenDarken(false);
        local v29 = l_TweenService_0:Create(l_UIScale_0, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Scale = 0
        });
        v29.Completed:Connect(function() --[[ Line: 67 ]]
            -- upvalues: v21 (ref)
            v21:Destroy();
        end);
        v29:Play();
    end;
    local function _() --[[ Line: 74 ]] --[[ Name: checkAndClose ]]
        -- upvalues: v25 (ref), v26 (ref), v30 (copy)
        if v25 and v26 then
            v30({
                v25, 
                v26
            });
        end;
    end;
    local function _(v32, v33) --[[ Line: 81 ]] --[[ Name: selectPlayer ]]
        -- upvalues: v25 (ref), v27 (copy), v9 (ref), v26 (ref), v10 (ref), v30 (copy)
        if v33 == 1 then
            if v25 and v27[v25].Frame1 then
                local l_Frame1_0 = v27[v25].Frame1;
                for v35, v36 in v9 do
                    l_Frame1_0.UIStroke[v35] = v36;
                end;
            end;
            if v26 == v32 then
                v26 = nil;
                if v27[v32].Frame2 then
                    local l_Frame2_0 = v27[v32].Frame2;
                    for v38, v39 in v9 do
                        l_Frame2_0.UIStroke[v38] = v39;
                    end;
                end;
            end;
            v25 = v32;
            if v27[v32].Frame1 then
                local l_Frame1_1 = v27[v32].Frame1;
                for v41, v42 in v10 do
                    l_Frame1_1.UIStroke[v41] = v42;
                end;
            end;
        else
            if v26 and v27[v26].Frame2 then
                local l_Frame2_1 = v27[v26].Frame2;
                for v44, v45 in v9 do
                    l_Frame2_1.UIStroke[v44] = v45;
                end;
            end;
            if v25 == v32 then
                v25 = nil;
                if v27[v32].Frame1 then
                    local l_Frame1_2 = v27[v32].Frame1;
                    for v47, v48 in v9 do
                        l_Frame1_2.UIStroke[v47] = v48;
                    end;
                end;
            end;
            v26 = v32;
            if v27[v32].Frame2 then
                local l_Frame2_2 = v27[v32].Frame2;
                for v50, v51 in v10 do
                    l_Frame2_2.UIStroke[v50] = v51;
                end;
            end;
        end;
        if v25 and v26 then
            v30({
                v25, 
                v26
            });
        end;
    end;
    v21.Parent = l_PrivateServerGUI_0;
    v3.TweenDarken(true);
    l_UIScale_0.Scale = 0;
    l_TweenService_0:Create(l_UIScale_0, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Scale = 1
    }):Play();
    v21.Close.Button.Activated:Connect(function() --[[ Line: 131 ]]
        -- upvalues: v30 (copy)
        v30(nil);
    end);
    for _, v54 in (l_Players_0:GetPlayers()) do
        v27[v54] = {
            Frame1 = nil, 
            Frame2 = nil
        };
        local v55 = l_Template_0:Clone();
        v55.Name = v54.UserId;
        v55.PlayerName.Text = v54.DisplayName;
        v55.Visible = true;
        local l_v55_0 = v55;
        l_v55_0.Parent = l_ScrollingFrame_0;
        v27[v54].Frame1 = l_v55_0;
        l_v55_0.Button.Activated:Connect(function() --[[ Line: 146 ]]
            -- upvalues: v54 (copy), v25 (ref), v27 (copy), v9 (ref), v26 (ref), v10 (ref), v30 (copy)
            local l_v54_0 = v54;
            if v25 and v27[v25].Frame1 then
                local l_Frame1_3 = v27[v25].Frame1;
                for v59, v60 in v9 do
                    l_Frame1_3.UIStroke[v59] = v60;
                end;
            end;
            if v26 == l_v54_0 then
                v26 = nil;
                if v27[l_v54_0].Frame2 then
                    local l_Frame2_3 = v27[l_v54_0].Frame2;
                    for v62, v63 in v9 do
                        l_Frame2_3.UIStroke[v62] = v63;
                    end;
                end;
            end;
            v25 = l_v54_0;
            if v27[l_v54_0].Frame1 then
                local l_Frame1_4 = v27[l_v54_0].Frame1;
                for v65, v66 in v10 do
                    l_Frame1_4.UIStroke[v65] = v66;
                end;
            end;
            if v25 and v26 then
                v30({
                    v25, 
                    v26
                });
            end;
        end);
        local v67 = l_Template_0:Clone();
        v67.Name = v54.UserId;
        v67.PlayerName.Text = v54.DisplayName;
        v67.Visible = true;
        v55 = v67;
        v55.Parent = l_ScrollingFrame_1;
        v27[v54].Frame2 = v55;
        v55.Button.Activated:Connect(function() --[[ Line: 155 ]]
            -- upvalues: v54 (copy), v26 (ref), v27 (copy), v9 (ref), v25 (ref), v10 (ref), v30 (copy)
            local l_v54_1 = v54;
            if v26 and v27[v26].Frame2 then
                local l_Frame2_4 = v27[v26].Frame2;
                for v70, v71 in v9 do
                    l_Frame2_4.UIStroke[v70] = v71;
                end;
            end;
            if v25 == l_v54_1 then
                v25 = nil;
                if v27[l_v54_1].Frame1 then
                    local l_Frame1_5 = v27[l_v54_1].Frame1;
                    for v73, v74 in v9 do
                        l_Frame1_5.UIStroke[v73] = v74;
                    end;
                end;
            end;
            v26 = l_v54_1;
            if v27[l_v54_1].Frame2 then
                local l_Frame2_5 = v27[l_v54_1].Frame2;
                for v76, v77 in v10 do
                    l_Frame2_5.UIStroke[v76] = v77;
                end;
            end;
            if v25 and v26 then
                v30({
                    v25, 
                    v26
                });
            end;
        end);
    end;
end;