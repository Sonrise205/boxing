local v0 = false;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ReplicatedFirst");
local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_UIHelper_0 = require(l_Modules_0:WaitForChild("UIHelper"));
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local l_Blur_0 = script.Parent:WaitForChild("Blur");
local l_Flash_0 = script.Parent:WaitForChild("Flash");
local l_Container_0 = script.Parent:WaitForChild("Container");
local l_ScrollingFrame_0 = l_Container_0:WaitForChild("ScrollingFrame");
local l_Template_0 = l_ScrollingFrame_0:WaitForChild("Template");
local v15;
if game:GetService("RunService"):IsClient() then
    v15 = shared.BridgeNet2;
    if not v15 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v15 = shared.BridgeNet2;
        v0 = v15;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v15 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v16 = v15.ReferenceBridge("PickAStyle");
local v17 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v18 = TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out);
local v19 = {
    Legendary = 10, 
    Mythic = 100, 
    Rare = 1000, 
    Uncommon = 10000
};
local l_Main_0 = l_Players_0.LocalPlayer.PlayerGui:WaitForChild("Main");
local l_Rarities_0 = l_Main_0:WaitForChild("StyleShop"):WaitForChild("Rarities");
task.spawn(function() --[[ Line: 36 ]]
    -- upvalues: l_EffectHelper_0 (copy)
    l_EffectHelper_0.CameraShake({
        Preset = "SuperHardHit", 
        WaitTime = 1, 
        Fade = 1
    });
end);
local l_CurrentCamera_0 = workspace.CurrentCamera;
l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.85, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    FieldOfView = 25
}):Play();
l_SoundHelper_0:PlaySound({
    Name = "DeepImpact", 
    Parent = workspace.Debris
});
l_SoundHelper_0:PlaySound({
    Name = "IntenseWoosh", 
    Parent = workspace.Debris, 
    Volume = 0.6, 
    Speed = 0.8
}).TimePosition = 0.9;
workspace:SetAttribute("VolumeOverride", 0);
l_Flash_0.Visible = true;
l_TweenService_0:Create(l_Flash_0, TweenInfo.new(0.85, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    BackgroundTransparency = 0
}):Play();
task.wait(1.3);
local l_BlurEffect_0 = Instance.new("BlurEffect");
l_BlurEffect_0.Name = "ShinyBlur";
l_BlurEffect_0.Parent = game.Lighting;
l_BlurEffect_0.Enabled = true;
l_BlurEffect_0.Size = 1000;
local v24 = l_SoundHelper_0:PlaySound({
    Name = "Song", 
    Parent = workspace.Debris, 
    DirectCopy = script.Song, 
    Looped = true
});
l_TweenService_0:Create(l_Flash_0, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
    BackgroundTransparency = 1
}):Play();
local l_Size_0 = l_Container_0.Size;
local v26 = false;
local function v30(v27) --[[ Line: 87 ]] --[[ Name: Cleanup ]]
    -- upvalues: v26 (ref), l_EffectHelper_0 (copy), l_TweenService_0 (copy), l_Container_0 (copy), l_Size_0 (copy), l_Flash_0 (copy), l_CurrentCamera_0 (copy), l_SoundHelper_0 (copy), l_Blur_0 (copy), l_BlurEffect_0 (copy), v24 (copy), l_Main_0 (copy)
    v26 = true;
    task.spawn(function() --[[ Line: 90 ]]
        -- upvalues: l_EffectHelper_0 (ref)
        l_EffectHelper_0.CameraShake({
            Preset = "SuperHardHit", 
            WaitTime = 1, 
            Fade = 1
        });
    end);
    l_TweenService_0:Create(l_Container_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
        Size = UDim2.new(l_Size_0.X.Scale * 0.75, 0, l_Size_0.Y.Scale * 0.75, 0)
    }):Play();
    l_TweenService_0:Create(v27, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
        Size = UDim2.new(v27.Size.X.Scale * 1.6, 0, v27.Size.Y.Scale * 1.6, 0)
    }):Play();
    l_TweenService_0:Create(l_Flash_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        BackgroundTransparency = 0
    }):Play();
    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.85, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        FieldOfView = 25
    }):Play();
    l_SoundHelper_0:PlaySound({
        Name = "Selected", 
        Parent = workspace.Debris, 
        DirectCopy = script.Selected
    });
    task.wait(1.1);
    workspace.CurrentCamera.FieldOfView = 90;
    workspace.FoVMult.Value = 2;
    l_Blur_0:Destroy();
    l_Container_0:Destroy();
    l_TweenService_0:Create(l_Flash_0, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 1
    }):Play();
    if l_BlurEffect_0 then
        l_BlurEffect_0:Destroy();
    end;
    if v24 then
        v24:Destroy();
    end;
    workspace:SetAttribute("VolumeOverride", nil);
    for _, v29 in l_Main_0:GetChildren() do
        if v29:IsA("Frame") then
            v29.Position = UDim2.new(0, 0, 0, 0);
        end;
    end;
    task.wait(5);
    script.Parent.Parent:Destroy();
end;
for _, v32 in l_Main_0:GetChildren() do
    if v32:IsA("Frame") then
        v32.Position = UDim2.new(0, 0, 10, 0);
    end;
end;
workspace.CurrentCamera.FieldOfView = 0;
task.delay(0.1, function() --[[ Line: 142 ]]
    -- upvalues: l_TweenService_0 (copy), l_CurrentCamera_0 (copy), l_EffectHelper_0 (copy)
    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        FieldOfView = 65
    }):Play();
    task.spawn(function() --[[ Line: 144 ]]
        -- upvalues: l_EffectHelper_0 (ref)
        l_EffectHelper_0.CameraShake({
            Preset = "Vibration", 
            WaitTime = 0.5, 
            Fade = 3
        });
    end);
end);
local l_BackgroundTransparency_0 = l_Blur_0.BackgroundTransparency;
l_Blur_0.BackgroundTransparency = 1;
l_Blur_0.Visible = true;
l_TweenService_0:Create(l_Blur_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
    BackgroundTransparency = l_BackgroundTransparency_0
}):Play();
local l_RunService_0 = game:GetService("RunService");
local l_Position_0 = l_Container_0.Position;
local v36 = 0;
local v37 = nil;
v37 = l_RunService_0.RenderStepped:Connect(function(v38) --[[ Line: 167 ]]
    -- upvalues: v36 (ref), l_Container_0 (copy), l_Position_0 (copy)
    v36 = v36 + v38 * 1.2;
    local v39 = math.cos(v36) * 0.005;
    local v40 = math.sin(v36) * 0.005;
    local v41 = math.sin(v36) * 1;
    l_Container_0.Position = l_Position_0 + UDim2.new(v39, 0, v40 * 1.3, 0);
    l_Container_0.Rotation = v41;
end);
l_Container_0.Size = UDim2.new(l_Size_0.X.Scale * 2, 0, l_Size_0.Y.Scale * 2, 0);
l_TweenService_0:Create(l_Container_0, TweenInfo.new(2.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
    Size = l_Size_0
}):Play();
l_SoundHelper_0:PlaySound({
    Name = "JoeBurnEnd", 
    Parent = workspace.Debris
});
for _, v43 in l_Styles_0 do
    if v43.Rarity and not v43.HiddenRarity and not v43.Unobtainable then
        local v44 = l_Template_0:Clone();
        v44.Name = v43.ShortName;
        local l_Glow_0 = v44.Glow;
        local l_Main_1 = v44.Main;
        local l_ImageButton_0 = v44.ImageButton;
        l_Main_1.StyleName.Text = v43.ShortName;
        l_Main_1.Description.Text = string.sub(v43.Description, 1, 45) .. "...";
        local v48 = v43.Rarity or "Uncommon";
        v44.LayoutOrder = v19[v48];
        local l_ImageColor3_0 = l_Rarities_0[v48 .. "Bar"].ImageLabel.ImageColor3;
        l_Main_1.StyleName.TextColor3 = l_ImageColor3_0;
        l_Glow_0.ImageColor3 = l_ImageColor3_0;
        v44.Visible = true;
        v44.Parent = l_ScrollingFrame_0;
        local l_Size_1 = v44.Size;
        v44.Size = UDim2.new(l_Size_1.X.Scale, 0, 0, 0);
        l_TweenService_0:Create(v44, v18, {
            Size = l_Size_1
        }):Play();
        local l_ImageTransparency_0 = l_Glow_0.ImageTransparency;
        l_Glow_0.ImageTransparency = 1;
        local v52 = false;
        if true then
            local l_v52_0 = v52;
            v44.MouseEnter:Connect(function() --[[ Line: 222 ]]
                -- upvalues: v26 (ref), l_v52_0 (ref), l_TweenService_0 (copy), v44 (copy), v17 (copy), l_Size_1 (copy), l_Glow_0 (copy), l_ImageTransparency_0 (copy), l_SoundHelper_0 (copy)
                if v26 then
                    return;
                else
                    l_v52_0 = true;
                    l_TweenService_0:Create(v44, v17, {
                        Size = UDim2.new(l_Size_1.X.Scale * 1.1, 0, l_Size_1.Y.Scale * 1.1, 0)
                    }):Play();
                    l_TweenService_0:Create(l_Glow_0, v17, {
                        ImageTransparency = l_ImageTransparency_0
                    }):Play();
                    l_SoundHelper_0:PlaySound({
                        Name = "CatalogPop", 
                        Parent = workspace.Debris
                    });
                    return;
                end;
            end);
            v44.MouseLeave:Connect(function() --[[ Line: 235 ]]
                -- upvalues: v26 (ref), l_v52_0 (ref), l_TweenService_0 (copy), v44 (copy), v17 (copy), l_Size_1 (copy), l_Glow_0 (copy)
                if v26 then
                    return;
                else
                    l_v52_0 = false;
                    l_TweenService_0:Create(v44, v17, {
                        Size = l_Size_1
                    }):Play();
                    l_TweenService_0:Create(l_Glow_0, v17, {
                        ImageTransparency = 1
                    }):Play();
                    return;
                end;
            end);
            l_ImageButton_0.MouseButton1Down:Connect(function() --[[ Line: 243 ]]
                -- upvalues: v26 (ref), l_TweenService_0 (copy), v44 (copy), l_Size_1 (copy), l_SoundHelper_0 (copy)
                if v26 then
                    return;
                else
                    l_TweenService_0:Create(v44, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Size = UDim2.new(l_Size_1.X.Scale * 1, 0, l_Size_1.Y.Scale * 1, 0)
                    }):Play();
                    l_SoundHelper_0:PlaySound({
                        Name = "Pop2", 
                        Parent = workspace.Debris
                    });
                    return;
                end;
            end);
            l_ImageButton_0.Activated:Connect(function() --[[ Line: 257 ]]
                -- upvalues: v26 (ref), l_TweenService_0 (copy), v44 (copy), v18 (copy), l_Size_1 (copy), l_v52_0 (ref), l_UIHelper_0 (copy), v43 (copy), v16 (copy), v30 (copy)
                if v26 then
                    return;
                else
                    l_TweenService_0:Create(v44, v18, {
                        Size = UDim2.new(l_Size_1.X.Scale * 1.1, 0, l_Size_1.Y.Scale * 1.1, 0)
                    }):Play();
                    if not l_v52_0 then
                        return;
                    else
                        l_UIHelper_0.CreateYesNoPrompt((("REPLACE CURRENT STYLE WITH '%*'?"):format((string.upper(v43.ShortName))))).Execute.Event:Connect(function() --[[ Line: 268 ]]
                            -- upvalues: v16 (ref), v43 (ref), v30 (ref), v44 (ref)
                            v16:Fire(v43.ShortName);
                            v30(v44);
                        end);
                        return;
                    end;
                end;
            end);
            l_SoundHelper_0:PlaySound({
                Name = "Pop", 
                Parent = workspace.Debris
            });
            task.wait(0.016666666666666666);
        end;
    end;
end;