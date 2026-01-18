return function(v0, v1, v2, v3) --[[ Line: 1 ]]
    v2 = v2 or TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    if v0:IsA("ImageLabel") then

    end;
    local function _(v4) --[[ Line: 7 ]] --[[ Name: updateTexture ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v5 = nil;
        v5 = if not v0:IsA("ImageLabel") then v0:FindFirstChildOfClass("Decal") else v0;
        if v5 then
            local v6 = v1[v4];
            if v6 then
                if not v0:IsA("ImageLabel") then
                    v5.Texture = v6;
                    return;
                else
                    v5.Image = v6;
                end;
            end;
        end;
    end;
    local v8 = 1;
    local v9 = #v1;
    local l_NumberValue_0 = Instance.new("NumberValue");
    l_NumberValue_0.Value = v8;
    local v11 = game.TweenService:Create(l_NumberValue_0, v2, {
        Value = v9
    });
    v11:Play();
    local v16 = l_NumberValue_0.Changed:Connect(function(v12) --[[ Line: 32 ]]
        -- upvalues: v0 (copy), v1 (copy)
        local v13 = math.floor(v12);
        local v14 = nil;
        v14 = if not v0:IsA("ImageLabel") then v0:FindFirstChildOfClass("Decal") else v0;
        if v14 then
            local v15 = v1[v13];
            if v15 then
                if not v0:IsA("ImageLabel") then
                    v14.Texture = v15;
                    return;
                else
                    v14.Image = v15;
                end;
            end;
        end;
    end);
    local v17 = nil;
    v17 = v11.Completed:Connect(function() --[[ Line: 35 ]]
        -- upvalues: l_NumberValue_0 (copy), v3 (copy), v16 (copy), v17 (ref)
        l_NumberValue_0:Destroy();
        if v3 then
            task.spawn(v3);
        end;
        v16:Disconnect();
        v17:Disconnect();
    end);
    v0:SetAttribute("Pause", false);
    local v18 = nil;
    v18 = v0:GetAttributeChangedSignal("Cancel"):Connect(function() --[[ Line: 44 ]]
        -- upvalues: v11 (copy)
        v11:Cancel();
    end);
    local v19 = nil;
    v19 = v0:GetAttributeChangedSignal("Pause"):Connect(function() --[[ Line: 48 ]]
        -- upvalues: v0 (copy), v11 (copy)
        if v0:GetAttribute("Pause") then
            v11:Pause();
            return;
        else
            v11:Play();
            return;
        end;
    end);
    return v11;
end;