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
        local l_Parent_0 = script.Parent;
        local l_Cameras_0 = l_Parent_0.Cameras;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_CFrame_0 = l_Cameras_0["1"].CFrame;
        l_CurrentCamera_0.FieldOfView = 50;
        local _ = CFrame.new();
        local l_Mouse_0 = l_Players_0.LocalPlayer:GetMouse();
        l_TweenService_0:Create(l_Lighting_0.DepthOfField, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            FarIntensity = 0.5, 
            FocusDistance = 0, 
            InFocusRadius = 10, 
            NearIntensity = 0.5
        }):Play();
        local v21 = 0.05;
        l_Parent_0.TV.Part.SurfaceGui.VideoFrame:Play();
        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(10, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
            EnvironmentSpecularScale = 0.32
        }):Play();
        task.delay(2, function() --[[ Line: 47 ]]
            -- upvalues: v21 (ref), l_TweenService_0 (ref)
            for v22 = 1, 200 do
                v21 = 0.05 + 1.95 * l_TweenService_0:GetValue(v22 / 200, Enum.EasingStyle.Exponential, Enum.EasingDirection.In);
                task.wait(0.016666666666666666);
            end;
        end);
        l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value - 1, function(v23) --[[ Line: 54 ]]
            -- upvalues: l_CurrentCamera_0 (copy), l_Mouse_0 (copy), l_CFrame_0 (ref), l_Cameras_0 (copy), v21 (ref)
            local l_l_CurrentCamera_0_0 = l_CurrentCamera_0;
            local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
            local v26 = v23 * 0.35;
            l_l_CurrentCamera_0_0.FieldOfView = l_FieldOfView_0 + (40 - l_FieldOfView_0) * v26;
            l_l_CurrentCamera_0_0 = math.clamp((l_Mouse_0.X / l_Mouse_0.ViewSizeX - 0.5) * 2 * 0.15, -0.15, 0.15);
            local v27 = math.clamp((l_Mouse_0.Y / l_Mouse_0.ViewSizeY - 0.5) * 2 * 0.15, -0.15, 0.15);
            l_FieldOfView_0 = CFrame.new(l_l_CurrentCamera_0_0, -v27, 0) * CFrame.Angles(-v27 / 33, -l_l_CurrentCamera_0_0 / 33, 0);
            l_CurrentCamera_0.CFrame = l_CFrame_0;
            l_CFrame_0 = l_CFrame_0:Lerp(l_Cameras_0["2"].CFrame * CFrame.new(0, 0, 0) * l_FieldOfView_0, v23 * v21);
        end);
    end
};