return function(v0) --[[ Line: 1 ]]
    local l_Folder_0 = v0.Folder;
    local v2 = v0.Number ~= nil and v0.Number or 0.025;
    local v3 = v0.DisableTween or false;
    local v4 = v0.tweeninfo or TweenInfo.new(v2, Enum.EasingStyle.Sine);
    local v5 = {};
    for _, v7 in pairs(l_Folder_0:GetChildren()) do
        v5[tonumber(v7.Name)] = v7;
    end;
    local v8 = Instance.new("BlurEffect", game.Lighting);
    v8.Size = v0.Blur or 0;
    local function v18() --[[ Line: 17 ]] --[[ Name: excuteframes ]]
        -- upvalues: v5 (copy), v3 (copy), v2 (copy), v8 (copy), v4 (copy)
        local v9 = script.ScreenGui:Clone();
        local l_CanvasGroup_0 = v9.CanvasGroup;
        v9.Parent = game.Players.LocalPlayer.PlayerGui;
        for _, v12 in ipairs(v5) do
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            l_CanvasGroup_0.GroupTransparency = 0;
            if v12:IsA("GuiObject") then
                local v14 = v12:Clone();
                v14.Parent = l_CanvasGroup_0;
                v14.Size = UDim2.fromScale(1, 1);
                v14.Position = UDim2.fromScale(0.5, 0.5);
                v14.AnchorPoint = Vector2.one * 0.5;
                if v3 then
                    task.wait(v2);
                    v14:Destroy();
                else
                    game.TweenService:Create(v8, v4, {
                        Size = 0
                    }):Play();
                    local v15 = game.TweenService:Create(l_CanvasGroup_0, v4, {
                        GroupTransparency = 1
                    });
                    v15:Play();
                    v15.Completed:Wait();
                    v14:Destroy();
                end;
            else
                local v16 = v12:Clone();
                v16.Parent = l_CurrentCamera_0;
                if v3 then
                    task.wait(v2);
                    v16:Destroy();
                else
                    game.TweenService:Create(v8, v4, {
                        Size = 0
                    }):Play();
                    local v17 = game.TweenService:Create(v16, v4, {
                        Brightness = 0, 
                        Contrast = 0, 
                        Saturation = 0, 
                        TintColor = Color3.new(1, 1, 1)
                    });
                    v17:Play();
                    v17.Completed:Wait();
                    v16:Destroy();
                end;
            end;
        end;
        v9:Destroy();
        v8:Destroy();
    end;
    if v0.yeild then
        v18();
        return;
    else
        task.spawn(v18);
        return;
    end;
end;