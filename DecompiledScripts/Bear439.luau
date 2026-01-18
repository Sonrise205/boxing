local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
local v8 = {
    Metadata = {
        DisplayName = "Bear", 
        Rarity = "Mythic", 
        Price = 20000, 
        Description = "Show off the head of the bear you defeated.", 
        Time = 8.4
    }, 
    Animations = {
        Character = 14390803208, 
        Camera = 14390826673
    }
};
v8.Use = function(v9) --[[ Line: 30 ]] --[[ Name: Use ]]
    -- upvalues: l_Workspace_0 (copy), v8 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
    if l_Workspace_0:GetAttribute("MatchStarted") then
        return;
    else
        local l_Character_0 = v9.Character;
        if not l_Character_0 then
            return;
        else
            local l_Target_0 = v9.Target;
            if not l_Target_0 then
                return;
            else
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                local v13 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                for _, v15 in (v13:GetPlayingAnimationTracks()) do
                    if v15.Priority ~= Enum.AnimationPriority.Idle then
                        v15:Stop(0);
                    end;
                end;
                local v16 = {
                    Animator = v13, 
                    AnimId = v8.Animations.Character, 
                    Priority = Enum.AnimationPriority.Action4, 
                    FadeIn = 0
                };
                local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                l_CameraMode_0.Value = "Freecam";
                local v19 = script.HandlePart:Clone();
                v19.Name = "Handle";
                v19.Parent = l_Character_0;
                local v20 = script.Handle:Clone();
                v20.Parent = l_Character_0.Head;
                v20.Part0 = l_Character_0.Head;
                v20.Part1 = v19;
                l_Character_0.PrimaryPart.Anchored = true;
                l_Character_0:SetPrimaryPartCFrame(l_Target_0.CFrame * CFrame.new(0, -1.3, 0));
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v16);
                game.Lighting.DepthOfField.Enabled = true;
                game.Lighting.DepthOfField.InFocusRadius = 5;
                local l_ExposureCompensation_0 = game.Lighting.ExposureCompensation;
                game.Lighting.ExposureCompensation = -1;
                for _, v24 in l_Character_0:GetChildren() do
                    if v24:IsA("Accessory") then
                        for _, v26 in v24:GetChildren() do
                            if v26:IsA("BasePart") and v26.LocalTransparencyModifier < 1000 then
                                v26.LocalTransparencyModifier = 1;
                            end;
                        end;
                    end;
                end;
                task.delay(5, function() --[[ Line: 91 ]]
                    -- upvalues: l_TweenService_0 (ref), l_ExposureCompensation_0 (copy)
                    l_TweenService_0:Create(game.Lighting, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ExposureCompensation = l_ExposureCompensation_0
                    }):Play();
                end);
                l_CurrentCamera_0.FieldOfView = 45;
                local v27 = l_Assets_0.MoonCamera:Clone();
                v27.Parent = l_Workspace_0.Debris;
                v27:PivotTo(l_Target_0.CFrame * CFrame.new(0, 0.3, 0));
                local v28 = {
                    Animator = v27.AnimationController.Animator, 
                    AnimId = v8.Animations.Camera
                };
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v28);
                local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 115 ]]
                    -- upvalues: l_CurrentCamera_1 (copy), v27 (copy)
                    l_CurrentCamera_1.CFrame = v27.Bone.CFrame;
                end);
                task.wait(v8.Metadata.Time);
                l_l_AnimHelper_0_Anim_0:Stop(0);
                l_l_AnimHelper_0_Anim_1:Stop(0);
                l_CurrentCamera_1.FieldOfView = 70;
                v19:Destroy();
                v20:Destroy();
                for _, v33 in l_Character_0:GetChildren() do
                    if v33:IsA("Accessory") then
                        for _, v35 in v33:GetChildren() do
                            if v35:IsA("BasePart") and v35.LocalTransparencyModifier < 1000 then
                                v35.LocalTransparencyModifier = 0;
                            end;
                        end;
                    end;
                end;
                l_CameraMode_0.Value = "Cutscene";
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                v27:Destroy();
                return;
            end;
        end;
    end;
end;
return v8;