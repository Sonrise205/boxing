local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local _ = game:GetService("Workspace");
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
        -- upvalues: l_Players_0 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), l_RunService_0 (copy)
        local l_Cameras_0 = script.Parent.Cameras;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_CFrame_0 = l_Cameras_0["1"].CFrame;
        l_CurrentCamera_0.FieldOfView = 75;
        local _ = CFrame.new();
        local l_Mouse_0 = l_Players_0.LocalPlayer:GetMouse();
        l_TweenService_0:Create(l_Lighting_0.DepthOfField, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            FarIntensity = 0.5, 
            FocusDistance = 0, 
            InFocusRadius = 10, 
            NearIntensity = 0.5
        }):Play();
        local v20 = 0.005;
        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(10, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            EnvironmentDiffuseScale = 0
        }):Play();
        task.delay(2, function() --[[ Line: 45 ]]
            -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v20 (ref)
            l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(10, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                ExposureCompensation = -0.5
            }):Play();
            for v21 = 1, 160 do
                v20 = 0.01 + 2.39 * l_TweenService_0:GetValue(v21 / 160, Enum.EasingStyle.Exponential, Enum.EasingDirection.In);
                task.wait(0.016666666666666666);
            end;
        end);
        l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value - 1, function(v22) --[[ Line: 56 ]]
            -- upvalues: l_CurrentCamera_0 (copy), l_Mouse_0 (copy), l_CFrame_0 (ref), l_Cameras_0 (copy), v20 (ref)
            local l_l_CurrentCamera_0_0 = l_CurrentCamera_0;
            local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
            local v25 = v22 * 0.25;
            l_l_CurrentCamera_0_0.FieldOfView = l_FieldOfView_0 + (18 - l_FieldOfView_0) * v25;
            l_l_CurrentCamera_0_0 = math.clamp((l_Mouse_0.X / l_Mouse_0.ViewSizeX - 0.5) * 2 * 0.05, -0.05, 0.05);
            local v26 = math.clamp((l_Mouse_0.Y / l_Mouse_0.ViewSizeY - 0.5) * 2 * 0.05, -0.05, 0.05);
            l_FieldOfView_0 = CFrame.new(l_l_CurrentCamera_0_0, -v26, 0) * CFrame.Angles(-v26 / 33, -l_l_CurrentCamera_0_0 / 33, 0);
            l_CurrentCamera_0.CFrame = l_CFrame_0;
            l_CFrame_0 = l_CFrame_0:Lerp(l_Cameras_0["2"].CFrame * CFrame.new(0, 0, 0) * l_FieldOfView_0, v22 * v20);
        end);
    end
};