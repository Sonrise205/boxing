return function(v0, v1, v2) --[[ Line: 1 ]]
    local v3 = v2.TweenInfo or TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local v4 = v2.StartSize or v0:GetScale();
    local l_v1_0 = v1;
    local l_NumberValue_0 = Instance.new("NumberValue");
    l_NumberValue_0.Value = v4;
    local v8 = l_NumberValue_0.Changed:Connect(function(v7) --[[ Line: 10 ]]
        -- upvalues: v0 (copy)
        v0:ScaleTo(v7);
    end);
    local v9 = game:GetService("TweenService"):Create(l_NumberValue_0, v3, {
        Value = l_v1_0
    });
    v9:Play();
    local v10 = nil;
    v10 = v9.Completed:Connect(function() --[[ Line: 17 ]]
        -- upvalues: l_NumberValue_0 (copy), v10 (ref), v8 (copy), v2 (copy)
        l_NumberValue_0:Destroy();
        v10:Disconnect();
        v8:Disconnect();
        if v2.CallBack then
            v2.CallBack();
        end;
    end);
    return v9;
end;