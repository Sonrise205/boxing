return function(v0, v1, v2, v3) --[[ Line: 1 ]]
    v2 = v2 or TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
    if v0:IsA("ImageLabel") then

    end;
    local function _(v4) --[[ Line: 7 ]] --[[ Name: updateTexture ]]
        -- upvalues: v1 (copy), v0 (copy)
        local v5 = v1[v4];
        if v5 then
            pcall(function() --[[ Line: 10 ]]
                -- upvalues: v0 (ref), v5 (copy)
                if v0:IsA("ImageLabel") then
                    v0.Image = v5;
                    return;
                else
                    if v0:IsA("ParticleEmitter") or v0:IsA("Beam") or v0:IsA("Decal") or v0:IsA("Trail") then
                        v0.Texture = v5;
                    end;
                    return;
                end;
            end);
        end;
    end;
    local v7 = 1;
    local v8 = #v1;
    local l_NumberValue_0 = Instance.new("NumberValue");
    l_NumberValue_0.Value = v7;
    local v10 = game.TweenService:Create(l_NumberValue_0, v2, {
        Value = v8
    });
    v10:Play();
    local v13 = l_NumberValue_0.Changed:Connect(function(v11) --[[ Line: 26 ]]
        -- upvalues: v1 (copy), v0 (copy)
        local v12 = v1[math.floor(v11)];
        if v12 then
            pcall(function() --[[ Line: 10 ]]
                -- upvalues: v0 (ref), v12 (copy)
                if v0:IsA("ImageLabel") then
                    v0.Image = v12;
                    return;
                else
                    if v0:IsA("ParticleEmitter") or v0:IsA("Beam") or v0:IsA("Decal") or v0:IsA("Trail") then
                        v0.Texture = v12;
                    end;
                    return;
                end;
            end);
        end;
    end);
    local v14 = nil;
    v14 = v10.Completed:Connect(function() --[[ Line: 29 ]]
        -- upvalues: l_NumberValue_0 (copy), v3 (copy), v13 (copy), v14 (ref)
        l_NumberValue_0:Destroy();
        if v3 then
            task.spawn(v3);
        end;
        v13:Disconnect();
        v14:Disconnect();
    end);
    return v10;
end;