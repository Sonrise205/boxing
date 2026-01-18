local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("ServerStorage");
local _ = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("CollectionService");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0:WaitForChild("AnimHelper"));
local function _(v11, v12, v13) --[[ Line: 14 ]] --[[ Name: Lerp ]]
    return v11 + (v12 - v11) * v13;
end;
return {
    Use = function() --[[ Line: 18 ]] --[[ Name: Use ]]
        -- upvalues: l_Workspace_0 (copy), l_TweenService_0 (copy), l_Players_0 (copy), l_RunService_0 (copy)
        local l_Cameras_0 = script.Parent.Cameras;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_CFrame_0 = l_Cameras_0["1"].CFrame;
        l_CurrentCamera_0.FieldOfView = 50;
        local l_Song_0 = script:FindFirstChild("Song");
        if l_Song_0 then
            local l_Volume_0 = l_Song_0.Volume;
            l_Song_0 = l_Song_0:Clone();
            l_Song_0.Name = "SceneMusic";
            l_Song_0.Parent = l_Workspace_0.Debris;
            l_Song_0.Volume = 0;
            l_Song_0:Play();
            l_TweenService_0:Create(l_Song_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Volume = l_Volume_0
            }):Play();
        end;
        local _ = CFrame.new();
        local l_Mouse_0 = l_Players_0.LocalPlayer:GetMouse();
        l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value - 1, function(v22) --[[ Line: 43 ]]
            -- upvalues: l_CurrentCamera_0 (copy), l_Mouse_0 (copy), l_CFrame_0 (ref), l_Cameras_0 (copy)
            local l_l_CurrentCamera_0_0 = l_CurrentCamera_0;
            local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
            local v25 = v22 * 0.2;
            l_l_CurrentCamera_0_0.FieldOfView = l_FieldOfView_0 + (40 - l_FieldOfView_0) * v25;
            l_l_CurrentCamera_0_0 = math.clamp((l_Mouse_0.X / l_Mouse_0.ViewSizeX - 0.5) * 2 * 0.25, -0.25, 0.25);
            local v26 = math.clamp((l_Mouse_0.Y / l_Mouse_0.ViewSizeY - 0.5) * 2 * 0.25, -0.25, 0.25);
            l_FieldOfView_0 = CFrame.new(l_l_CurrentCamera_0_0, -v26, 0) * CFrame.Angles(-v26 / 33, -l_l_CurrentCamera_0_0 / 33, 0);
            l_CurrentCamera_0.CFrame = l_CFrame_0;
            l_CFrame_0 = l_CFrame_0:Lerp(l_Cameras_0["2"].CFrame * l_FieldOfView_0 * CFrame.new(-0.4, -1.3, 0), v22 * 0.06666666666666667);
        end);
    end
};