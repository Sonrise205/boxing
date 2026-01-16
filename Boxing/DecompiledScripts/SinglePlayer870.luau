local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local _ = require("../SettingTypes");
local v3 = require("../Modules/ClientHelpers");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_SinglePlayerDropdown_0 = script.SinglePlayerDropdown;
local l_PrivateServerGUI_0 = l_LocalPlayer_0.PlayerGui.Common.PrivateServerGUI;
return function(v7) --[[ Line: 12 ]] --[[ Name: OnInvoke ]]
    -- upvalues: l_SinglePlayerDropdown_0 (copy), v3 (copy), l_TweenService_0 (copy), l_PrivateServerGUI_0 (copy), l_Players_0 (copy)
    local v8 = l_SinglePlayerDropdown_0:Clone();
    local l_ScrollingFrame_0 = v8.ScrollContainer.ScrollingFrame;
    local l_Template_0 = l_ScrollingFrame_0.Template;
    local l_UIScale_0 = v8.UIScale;
    local function v14(v12) --[[ Line: 20 ]] --[[ Name: closeDropdown ]]
        -- upvalues: v7 (copy), v3 (ref), l_TweenService_0 (ref), l_UIScale_0 (copy), v8 (copy)
        v7.OnChange:Fire(v12);
        v3.TweenDarken(false);
        local v13 = l_TweenService_0:Create(l_UIScale_0, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Scale = 0
        });
        v13.Completed:Connect(function() --[[ Line: 27 ]]
            -- upvalues: v8 (ref)
            v8:Destroy();
        end);
        v13:Play();
    end;
    v8.Parent = l_PrivateServerGUI_0;
    v3.TweenDarken(true);
    l_UIScale_0.Scale = 0;
    l_TweenService_0:Create(l_UIScale_0, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Scale = 1
    }):Play();
    v8.Close.Button.MouseButton1Click:Connect(function() --[[ Line: 42 ]]
        -- upvalues: v14 (copy)
        v14(nil);
    end);
    for _, v16 in ipairs(l_Players_0:GetPlayers()) do
        local v17 = l_Template_0:Clone();
        v17.Name = v16.UserId;
        v17.PlayerName.Text = v16.DisplayName;
        v17.Visible = true;
        v17.Parent = l_ScrollingFrame_0;
        v17.Button.MouseButton1Click:Connect(function() --[[ Line: 55 ]]
            -- upvalues: v14 (copy), v16 (copy)
            v14(v16);
        end);
    end;
end;