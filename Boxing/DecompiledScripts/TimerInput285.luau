local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("Players");
local _ = require("../SettingTypes");
local v3 = require("../Modules/ClientHelpers");
local v4 = require("@self/ButtonEffects");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_TimerInput_0 = script.TimerInput;
local l_PrivateServerGUI_0 = l_LocalPlayer_0.PlayerGui.Common.PrivateServerGUI;
local function _(v8) --[[ Line: 16 ]] --[[ Name: ConvertNumberArrayToSeconds ]]
    local v9 = v8[1];
    local v10 = v8[2];
    local v11 = v8[3];
    local v12 = v8[4];
    return v9 * 60 * 10 + v10 * 60 + v11 * 10 + v12;
end;
local function v23(v14, v15, v16, v17) --[[ Line: 31 ]] --[[ Name: SetupInputRoller ]]
    local l_UpArrow_0 = v14.UpArrow;
    local l_DownArrow_0 = v14.DownArrow;
    local l_Value_0 = v14.Value;
    local function _(v21) --[[ Line: 37 ]] --[[ Name: RolloverValue ]]
        -- upvalues: v16 (copy), v15 (copy), v17 (copy), l_Value_0 (copy)
        v16[v15] = (v16[v15] + v21) % (v17 + 1);
        l_Value_0.Text = v16[v15];
    end;
    l_UpArrow_0.Activated:Connect(function() --[[ Line: 42 ]]
        -- upvalues: v16 (copy), v15 (copy), v17 (copy), l_Value_0 (copy)
        v16[v15] = (v16[v15] + 1) % (v17 + 1);
        l_Value_0.Text = v16[v15];
    end);
    l_DownArrow_0.Activated:Connect(function() --[[ Line: 46 ]]
        -- upvalues: v16 (copy), v15 (copy), v17 (copy), l_Value_0 (copy)
        v16[v15] = (v16[v15] + -1) % (v17 + 1);
        l_Value_0.Text = v16[v15];
    end);
end;
return function(v24) --[[ Line: 51 ]] --[[ Name: OnInvoke ]]
    -- upvalues: l_TimerInput_0 (copy), v3 (copy), l_TweenService_0 (copy), l_PrivateServerGUI_0 (copy), v23 (copy), v4 (copy)
    local v25 = l_TimerInput_0:Clone();
    local l_UIScale_0 = v25.UIScale;
    local function v29(v27) --[[ Line: 57 ]] --[[ Name: closeDropdown ]]
        -- upvalues: v24 (copy), v3 (ref), l_TweenService_0 (ref), l_UIScale_0 (copy), v25 (copy)
        v24.OnChange:Fire(v27);
        v3.TweenDarken(false);
        local v28 = l_TweenService_0:Create(l_UIScale_0, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Scale = 0
        });
        v28.Completed:Connect(function() --[[ Line: 64 ]]
            -- upvalues: v25 (ref)
            v25:Destroy();
        end);
        v28:Play();
    end;
    v25.Parent = l_PrivateServerGUI_0;
    v3.TweenDarken(true);
    l_UIScale_0.Scale = 0;
    l_TweenService_0:Create(l_UIScale_0, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Scale = 1
    }):Play();
    local v30 = {
        0, 
        0, 
        0, 
        0
    };
    for v31 = 1, 4 do
        local l_FirstChild_0 = v25.NumberHolder:FindFirstChild((tostring(v31)));
        v23(l_FirstChild_0, v31, v30, v31 == 3 and 5 or 9);
    end;
    v4(v25.CancelButton);
    v25.CancelButton.Button.Activated:Connect(function() --[[ Line: 86 ]]
        -- upvalues: v29 (copy)
        v29(nil);
    end);
    v4(v25.UseButton);
    v25.UseButton.Button.Activated:Connect(function() --[[ Line: 91 ]]
        -- upvalues: v29 (copy), v30 (copy)
        local l_v29_0 = v29;
        local l_v30_0 = v30;
        local v35 = l_v30_0[1];
        local v36 = l_v30_0[2];
        local v37 = l_v30_0[3];
        local v38 = l_v30_0[4];
        l_v29_0(v35 * 60 * 10 + v36 * 60 + v37 * 10 + v38);
    end);
end;