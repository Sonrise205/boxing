local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script.Parent;
local l_Song_0 = script:WaitForChild("Song");
local l_StoredId_0 = l_Song_0:FindFirstChild("StoredId");
if l_StoredId_0 then
    l_Song_0.SoundId = l_StoredId_0.Value;
end;
l_Song_0.TimePosition = 3.433;
l_Song_0:Play();
local function v8(v4, v5, v6) --[[ Line: 22 ]] --[[ Name: fadeText ]]
    -- upvalues: l_TweenService_0 (copy)
    local v7 = l_TweenService_0:Create(v4, TweenInfo.new(v6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = v5, 
        TextStrokeTransparency = 1
    });
    v7:Play();
    return v7;
end;
local function v12(v9) --[[ Line: 32 ]] --[[ Name: popEffect ]]
    -- upvalues: l_TweenService_0 (copy)
    local v10 = v9:Clone();
    v10.Name = "PopGlow";
    v10.Parent = v9.Parent;
    v10.ZIndex = v9.ZIndex - 1;
    v10.TextTransparency = 0.7;
    v10.Size = UDim2.new(v9.Size.X.Scale * 1.3, 0, v9.Size.Y.Scale * 1.3, 0);
    local v11 = l_TweenService_0:Create(v10, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 1, 
        Size = v9.Size
    });
    v11.Completed:Connect(function() --[[ Line: 51 ]]
        -- upvalues: v10 (copy)
        v10:Destroy();
    end);
    v11:Play();
end;
for _, v14 in ipairs(l_Parent_0:GetChildren()) do
    if v14:IsA("Frame") then
        local v15 = tonumber(v14.Name);
        if v15 then
            for _, v17 in ipairs(v14:GetChildren()) do
                if v17:IsA("TextLabel") then
                    local v18 = tonumber(v17.Name);
                    if v18 then
                        local v19 = v18 - 3.433 + 0.2;
                        task.delay(v19, function() --[[ Line: 72 ]]
                            -- upvalues: v17 (copy), v12 (copy), v8 (copy), v15 (copy), v18 (copy)
                            if not v17 or not v17.Parent then
                                return;
                            else
                                local l_TextTransparency_0 = v17.TextTransparency;
                                v17.Visible = true;
                                v17.TextTransparency = 1;
                                v17.TextStrokeTransparency = 1;
                                v12(v17);
                                v8(v17, l_TextTransparency_0, 0.1);
                                task.delay(v15 - v18 - 0.3, function() --[[ Line: 88 ]]
                                    -- upvalues: v17 (ref), v8 (ref)
                                    if v17 and v17.Parent then
                                        v8(v17, 1, 1).Completed:Connect(function() --[[ Line: 91 ]]
                                            -- upvalues: v17 (ref)
                                            if v17 and v17.Parent then
                                                v17.Visible = false;
                                            end;
                                        end);
                                    end;
                                end);
                                return;
                            end;
                        end);
                    end;
                end;
            end;
            local v21 = (tonumber(v14.Name) or 0) - 3.433 + 0.2 + 1.55 + 2;
            task.delay(v21, function() --[[ Line: 103 ]]
                -- upvalues: v14 (copy)
                if v14 and v14.Parent then
                    v14:Destroy();
                end;
            end);
        end;
    end;
end;