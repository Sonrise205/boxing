local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
l_Parent_0.Visible = false;
local v9 = nil;
v9 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 16 ]]
    -- upvalues: l_Parent_0 (copy), l_LocalPlayer_0 (copy), v9 (ref)
    if not l_Parent_0:IsAncestorOf(l_LocalPlayer_0.PlayerGui) then
        if v9 then
            v9:Disconnect();
        end;
        return;
    else
        l_Parent_0.Position = UDim2.new(0.5 + math.random(-100, 100) / 300000, 0, 0.5 + math.random(-100, 100) / 200000, 0);
        return;
    end;
end);
SpritesheetPlayer = function(v10) --[[ Line: 25 ]] --[[ Name: SpritesheetPlayer ]]
    local l_Image_0 = v10.Image;
    local l_Frames_0 = v10.Frames;
    local l_Framerate_0 = v10.Framerate;
    local l_RectSize_0 = v10.RectSize;
    local l_MaxFrames_0 = v10.MaxFrames;
    local v16 = 0;
    local v17 = 0;
    l_Image_0.Visible = true;
    l_Image_0.ImageRectSize = l_RectSize_0;
    local function v19() --[[ Line: 38 ]] --[[ Name: Perform ]]
        -- upvalues: l_Frames_0 (copy), l_MaxFrames_0 (copy), l_Image_0 (copy), l_RectSize_0 (copy), v16 (ref), v17 (ref), l_Framerate_0 (copy)
        for v18 = 1, l_Frames_0.X * l_Frames_0.Y do
            if not l_MaxFrames_0 or l_MaxFrames_0 > v18 then
                l_Image_0.ImageRectOffset = Vector2.new(l_RectSize_0.X * v16, l_RectSize_0.Y * v17);
                v16 = v16 + 1;
                if v16 > l_Frames_0.X - 1 then
                    v16 = 0;
                    v17 = v17 + 1;
                end;
                task.wait(l_Framerate_0);
            else
                break;
            end;
        end;
    end;
    if not v10.Looped then
        v19();
        l_Image_0.Visible = false;
    else
        task.defer(function() --[[ Line: 60 ]]
            -- upvalues: v19 (copy), v16 (ref), v17 (ref), l_Image_0 (copy), l_RectSize_0 (copy)
            while true do
                v19();
                v16 = 0;
                v17 = 0;
                l_Image_0.ImageRectOffset = Vector2.new(l_RectSize_0.X * v16, l_RectSize_0.Y * v17);
            end;
        end);
    end;
end;
local v20 = {
    Image = l_Parent_0.Fire, 
    Framerate = 0.041666666666666664, 
    Frames = Vector2.new(4, 6), 
    RectSize = Vector2.new(256, 150)
};
if l_LocalPlayer_0:GetAttribute("Interface") == "Touch" then
    for _, v22 in l_Parent_0:GetDescendants() do
        if v22:IsA("UIStroke") then
            v22.Thickness = v22.Thickness * 0.7;
        end;
    end;
end;
l_Parent_0.Visible = true;
l_Parent_0.Size = UDim2.new(10, 0, 5, 0);
local l_ImageTransparency_0 = l_Parent_0.Glow.ImageTransparency;
l_Parent_0.Glow.ImageTransparency = 1;
l_Parent_0.GroupTransparency = 0;
l_TweenService_0:Create(l_Parent_0, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
    GroupTransparency = 0
}):Play();
l_TweenService_0:Create(l_Parent_0, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
    Size = UDim2.new(2, 0, 1, 0)
}):Play();
l_TweenService_0:Create(l_Parent_0.Glow, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
    ImageTransparency = l_ImageTransparency_0
}):Play();
l_SoundHelper_0:PlaySound({
    Name = "WearoutBackdash", 
    Parent = workspace.Debris
});
task.wait(0.075);
task.defer(function() --[[ Line: 104 ]]
    -- upvalues: l_EffectHelper_0 (copy)
    l_EffectHelper_0.CameraShake({
        Preset = "MedHit", 
        WaitTime = 0.15, 
        Fade = 0.8
    });
end);
SpritesheetPlayer(v20);
l_TweenService_0:Create(l_Parent_0.BottomText, TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
    TextColor3 = Color3.fromRGB(255, 255, 255)
}):Play();
task.wait(1.8);
l_TweenService_0:Create(l_Parent_0, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
    GroupTransparency = 1
}):Play();