local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.Name = "ViewportUI";
l_ScreenGui_0.Parent = l_PlayerGui_0;
local l_ViewportFrame_0 = Instance.new("ViewportFrame");
l_ViewportFrame_0.Name = "TemplateViewportFrame";
l_ViewportFrame_0.Size = UDim2.new(1, 0, 1.1, 0);
l_ViewportFrame_0.AnchorPoint = Vector2.new(0, 0.5);
l_ViewportFrame_0.Position = UDim2.new(0, 0, 0.45, 0);
l_ViewportFrame_0.BackgroundTransparency = 1;
l_ViewportFrame_0.Visible = false;
l_ViewportFrame_0.CurrentCamera = workspace.CurrentCamera;
l_ViewportFrame_0.Parent = l_ScreenGui_0;
local function v11(v5) --[[ Line: 28 ]] --[[ Name: cloneInstance ]]
    -- upvalues: l_ViewportFrame_0 (copy), l_ScreenGui_0 (copy)
    local v6 = false;
    if not v5.Archivable then
        v5.Archivable = true;
        v6 = true;
    end;
    local v7 = v5:Clone();
    if v6 then
        v5.Archivable = false;
    end;
    for _, v9 in v7:GetDescendants() do
        if v9:IsA("BaseScript") or v9:IsA("ParticleEmitter") or v9:IsA("ForceField") or v9:IsA("BillboardGui") or v9:IsA("AlignPosition") then
            v9:Destroy();
        end;
        if v9:GetAttribute("GlovePart") then
            v9:Destroy();
        end;
    end;
    local v10 = l_ViewportFrame_0:Clone();
    v10.CurrentCamera = workspace.CurrentCamera;
    v10.Name = "AfterImageFrame";
    v10.ImageTransparency = 1;
    v10.Ambient = Color3.fromRGB(255, 255, 255);
    v10.Visible = true;
    v10.Parent = l_ScreenGui_0;
    v7.Parent = v10;
    return v10;
end;
return function(v12) --[[ Line: 77 ]]
    -- upvalues: v11 (copy), l_TweenService_0 (copy)
    local l_Instance_0 = v12.Instance;
    local l_ActiveTime_0 = v12.ActiveTime;
    local l_TimeBetweenImages_0 = v12.TimeBetweenImages;
    local l_Transparency_0 = v12.Transparency;
    local l_FadeInTime_0 = v12.FadeInTime;
    local l_TimeBeforeFadeOut_0 = v12.TimeBeforeFadeOut;
    local l_FadeOutTime_0 = v12.FadeOutTime;
    local l_ImageColor_0 = v12.ImageColor;
    local v21 = true;
    task.spawn(function() --[[ Line: 89 ]]
        -- upvalues: v21 (ref), v11 (ref), l_Instance_0 (copy), l_ImageColor_0 (copy), l_TweenService_0 (ref), l_FadeInTime_0 (copy), l_Transparency_0 (copy), l_TimeBeforeFadeOut_0 (copy), l_FadeOutTime_0 (copy), l_TimeBetweenImages_0 (copy)
        while v21 do
            local v22 = v11(l_Instance_0);
            if typeof(l_ImageColor_0) == "Color3" then
                v22.ImageColor3 = l_ImageColor_0;
                v22.LightColor = l_ImageColor_0;
            end;
            task.spawn(function() --[[ Line: 98 ]]
                -- upvalues: l_TweenService_0 (ref), v22 (copy), l_FadeInTime_0 (ref), l_Transparency_0 (ref), l_TimeBeforeFadeOut_0 (ref), l_FadeOutTime_0 (ref)
                l_TweenService_0:Create(v22, TweenInfo.new(l_FadeInTime_0, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    ImageTransparency = l_Transparency_0
                }):Play();
                task.wait(l_FadeInTime_0 + l_TimeBeforeFadeOut_0);
                l_TweenService_0:Create(v22, TweenInfo.new(l_FadeOutTime_0, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    ImageTransparency = 1
                }):Play();
                task.wait(l_FadeOutTime_0);
                v22:Destroy();
            end);
            task.wait(l_TimeBetweenImages_0);
        end;
    end);
    task.wait(l_ActiveTime_0);
    v21 = false;
end;