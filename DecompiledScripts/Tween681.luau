--!native
local l_TweenService_0 = game:GetService("TweenService");
local _ = require(script.Parent.Parent.Types);
return function(v2, v3, v4, v5, v6) --[[ Line: 9 ]] --[[ Name: CreateTween ]]
    -- upvalues: l_TweenService_0 (copy)
    v5 = v5 or Enum.EasingStyle.Linear;
    v6 = v6 or Enum.EasingDirection.InOut;
    return function(v7) --[[ Line: 13 ]]
        -- upvalues: v2 (copy), v3 (copy), l_TweenService_0 (ref), v4 (copy), v5 (ref), v6 (ref)
        return v2 + (v3 - v2) * l_TweenService_0:GetValue(v7.Completion / v4, v5, v6);
    end;
end;