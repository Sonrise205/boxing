return function(v0, v1, v2) --[[ Line: 2 ]]
    local v3 = v1.TweenInfo or TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    local v4 = v1.StartFrame or 1;
    local v5 = #v0:GetChildren();
    local l_NumberValue_0 = Instance.new("NumberValue");
    l_NumberValue_0.Value = v4;
    local v7 = script.impactFrame:Clone();
    v7.Parent = game.StarterGui;
    (function(v8, v9) --[[ Line: 14 ]] --[[ Name: unGroup ]]
        for _, v11 in v8:GetChildren() do
            local v12 = v11:Clone();
            v12.Parent = v9;
            if v12:IsA("ImageLabel") then
                v12.Size = UDim2.fromScale(0.001, 0.001);
            end;
        end;
    end)(v0, v7);
    local v15 = l_NumberValue_0.Changed:Connect(function(v13) --[[ Line: 27 ]]
        -- upvalues: v7 (copy)
        local l_v7_FirstChild_0 = v7:FindFirstChild((tostring((math.floor(v13)))));
        if l_v7_FirstChild_0 then
            v7.Frame.ImageLabel.Image = l_v7_FirstChild_0:IsA("Decal") and l_v7_FirstChild_0.Texture or l_v7_FirstChild_0.Image;
        end;
    end);
    local v16 = game:GetService("TweenService"):Create(l_NumberValue_0, v3, {
        Value = v5
    });
    v16:Play();
    local v17 = nil;
    v17 = v16.Completed:Connect(function() --[[ Line: 40 ]]
        -- upvalues: l_NumberValue_0 (copy), v7 (copy), v17 (ref), v15 (copy), v2 (copy)
        l_NumberValue_0:Destroy();
        v7:Destroy();
        v17:Disconnect();
        v15:Disconnect();
        if v2 then
            v2();
            return;
        else
            return;
        end;
    end);
end;