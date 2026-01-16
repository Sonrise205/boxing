local l_TweenService_0 = game:GetService("TweenService");
return {
    CreateBubble = function(v1, v2, v3, v4, v5) --[[ Line: 9 ]] --[[ Name: CreateBubble ]]
        -- upvalues: l_TweenService_0 (copy)
        local v6 = game.ReplicatedStorage.BubbleModule.Mesh:Clone();
        v6.CFrame = v1;
        v6.Anchored = true;
        v6.CanCollide = false;
        v6.Massless = true;
        v6.Parent = workspace:FindFirstChild("Effects") or workspace;
        v6.Material = Enum.Material.Glass;
        v6.Size = v2;
        v6.Transparency = v3;
        v6.CastShadow = false;
        v6.Color = Color3.fromRGB(255, 255, 255);
        local l_Highlight_0 = Instance.new("Highlight");
        l_Highlight_0.Enabled = true;
        l_Highlight_0.OutlineTransparency = 1;
        l_Highlight_0.FillTransparency = 1;
        l_Highlight_0.Parent = v6;
        task.delay(v5, function() --[[ Line: 28 ]]
            -- upvalues: v6 (copy)
            if v6 then
                v6:Destroy();
            end;
        end);
        local v8 = TweenInfo.new(v5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
        local v9 = {
            Transparency = 1, 
            Size = v4
        };
        l_TweenService_0:Create(v6, v8, v9):Play();
    end
};