local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Modules_0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local l_Common_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local v10 = {};
local _ = Random.new();
v10.RemoveTransitionItems = function() --[[ Line: 19 ]] --[[ Name: RemoveTransitionItems ]]
    -- upvalues: l_Lighting_0 (copy), l_Common_0 (copy), l_LocalPlayer_0 (copy), l_TweenService_0 (copy)
    for _, v13 in {
        l_Lighting_0, 
        l_Common_0, 
        l_LocalPlayer_0.PlayerGui
    } do
        for _, v15 in v13:GetChildren() do
            if v15.Name == "TransitionRemove" then
                if v15:IsA("ScreenGui") then
                    v15.Enabled = false;
                    for _, v17 in v15:GetDescendants() do
                        if v17:IsA("VideoFrame") then
                            l_TweenService_0:Create(v17, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Volume = 0
                            }):Play();
                        end;
                    end;
                    task.delay(5, function() --[[ Line: 36 ]]
                        -- upvalues: v15 (copy)
                        v15:Destroy();
                    end);
                else
                    v15:Destroy();
                end;
            end;
        end;
    end;
end;
v10.SpritesheetPlayer = function(v18) --[[ Line: 48 ]] --[[ Name: SpritesheetPlayer ]]
    -- upvalues: l_RunService_0 (copy)
    local l_Image_0 = v18.Image;
    local l_Frames_0 = v18.Frames;
    local l_Framerate_0 = v18.Framerate;
    local l_RectSize_0 = v18.RectSize;
    local l_FrameCount_0 = v18.FrameCount;
    local v24 = l_Frames_0.X * l_Frames_0.Y;
    local v25 = 0;
    local v26 = 0;
    l_Image_0.ImageRectSize = l_RectSize_0;
    if v18.Reverse then
        v25 = l_Frames_0.X - (v24 - l_FrameCount_0);
        v26 = l_Frames_0.Y - 1;
        local v27 = l_FrameCount_0 or l_Frames_0.X * l_Frames_0.Y;
        for _ = v27, 1, -1 do
            l_Image_0.ImageRectOffset = Vector2.new(l_RectSize_0.X * v25, l_RectSize_0.Y * v26);
            v25 = v25 - 1;
            if v25 < 0 then
                v25 = l_Frames_0.X - 1;
                v26 = v26 - 1;
            end;
            if l_Framerate_0 then
                task.wait(l_Framerate_0);
            else
                l_RunService_0.RenderStepped:Wait();
            end;
        end;
        return;
    else
        local v29 = 1;
        local v30 = l_FrameCount_0 or l_Frames_0.X * l_Frames_0.Y;
        for _ = v29, v30 do
            l_Image_0.ImageRectOffset = Vector2.new(l_RectSize_0.X * v25, l_RectSize_0.Y * v26);
            v25 = v25 + 1;
            if l_Frames_0.X - 1 < v25 then
                v25 = 0;
                v26 = v26 + 1;
            end;
            if l_Framerate_0 then
                task.wait(l_Framerate_0);
            else
                l_RunService_0.RenderStepped:Wait();
            end;
        end;
        return;
    end;
end;
v10.MainTransition = function(v32) --[[ Line: 103 ]] --[[ Name: MainTransition ]]
    -- upvalues: l_Common_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), v10 (copy)
    local _ = v32.FadeTime;
    local l_HoldTime_0 = v32.HoldTime;
    local l_ZIndex_0 = v32.ZIndex;
    if not l_Common_0:FindFirstChild("Transition") then
        l_SoundHelper_0:PlaySound({
            Name = "FlameHit1", 
            Parent = l_Workspace_0, 
            Volume = 0.1
        });
    end;
    local v36 = l_Common_0.Main:Clone();
    v36.Name = "Transition";
    v36.Parent = l_Common_0;
    v36.Start.Visible = true;
    v36.Visible = true;
    if l_ZIndex_0 then
        v36.ZIndex = l_ZIndex_0;
    end;
    local v37 = {
        Image = v36.Start, 
        FrameCount = 30, 
        Frames = Vector2.new(8, 4), 
        RectSize = Vector2.new(128, 256)
    };
    v10.SpritesheetPlayer(v37);
    task.wait(l_HoldTime_0);
    v10.RemoveTransitionItems();
    v37.Framerate = nil;
    v37.Reverse = true;
    v37.Image = v36.End;
    v36.Start.Visible = false;
    v36.End.Visible = true;
    v10.SpritesheetPlayer(v37);
    v36:Destroy();
end;
v10.FadeTransition = function(v38) --[[ Line: 150 ]] --[[ Name: FadeTransition ]]
    -- upvalues: l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_Lighting_0 (copy), l_Common_0 (copy), l_TweenService_0 (copy), v10 (copy)
    local l_FadeTime_1 = v38.FadeTime;
    local l_HoldTime_1 = v38.HoldTime;
    local l_StartFade_0 = v38.StartFade;
    local l_ZIndex_1 = v38.ZIndex;
    if not v38.IgnoreSound then
        l_SoundHelper_0:PlaySound({
            Name = "FlameHit1", 
            Parent = l_Workspace_0, 
            Volume = 0.1
        });
    end;
    local l_FadeBlur_0 = l_Lighting_0.FadeBlur;
    local v44 = l_Common_0.Fade:Clone();
    v44.Parent = l_Common_0;
    v44.Visible = true;
    if l_ZIndex_1 then
        v44.ZIndex = l_ZIndex_1;
    end;
    if not l_StartFade_0 then
        l_StartFade_0 = l_FadeTime_1;
    end;
    local v45 = TweenInfo.new(l_StartFade_0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    l_TweenService_0:Create(v44, v45, {
        BackgroundTransparency = 0
    }):Play();
    l_FadeBlur_0.Enabled = true;
    l_TweenService_0:Create(l_FadeBlur_0, v45, {
        Size = 15
    }):Play();
    task.wait(l_HoldTime_1);
    v10.RemoveTransitionItems();
    l_TweenService_0:Create(v44, v45, {
        BackgroundTransparency = 1
    }):Play();
    l_TweenService_0:Create(l_FadeBlur_0, v45, {
        Size = 0
    }):Play();
    task.wait(l_FadeTime_1);
    l_FadeBlur_0.Enabled = false;
    v44:Destroy();
end;
return v10;