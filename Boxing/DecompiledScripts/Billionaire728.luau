local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local _ = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
local v9 = {
    Metadata = {
        DisplayName = "Billionaire", 
        Rarity = "Mythic", 
        Price = 30000, 
        Description = "Strut like a billionaire and make it rain.", 
        Time = 6.3
    }, 
    Animations = {
        Character = 14350353310, 
        Camera = 14350660939
    }
};
v9.Use = function(v10) --[[ Line: 31 ]] --[[ Name: Use ]]
    -- upvalues: l_Workspace_0 (copy), v9 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy), l_Modules_0 (copy)
    if l_Workspace_0:GetAttribute("MatchStarted") then
        return;
    else
        local l_Character_0 = v10.Character;
        if not l_Character_0 then
            return;
        else
            local l_l_Character_0_Attribute_0 = l_Character_0:GetAttribute("ActiveNPC");
            if l_l_Character_0_Attribute_0 then
                l_Character_0 = l_Character_0:Clone();
                l_Character_0.Parent = l_Workspace_0.Debris;
            end;
            local l_Target_0 = v10.Target;
            if not l_Target_0 then
                return;
            else
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                local v15 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                for _, v17 in (v15:GetPlayingAnimationTracks()) do
                    if v17.Priority ~= Enum.AnimationPriority.Idle then
                        v17:Stop(0);
                    end;
                end;
                local v18 = {
                    Animator = v15, 
                    AnimId = v9.Animations.Character, 
                    Priority = Enum.AnimationPriority.Action4, 
                    FadeIn = 0
                };
                local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                l_CameraMode_0.Value = "Freecam";
                l_Character_0.PrimaryPart.Anchored = true;
                l_Character_0:SetPrimaryPartCFrame(l_Target_0.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, 0, 0));
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v18);
                game.Lighting.DepthOfField.Enabled = true;
                game.Lighting.DepthOfField.InFocusRadius = 5;
                l_CurrentCamera_0.FieldOfView = 50;
                task.delay(3, function() --[[ Line: 81 ]]
                    -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_0 (copy)
                    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        FieldOfView = 40
                    }):Play();
                end);
                local v22 = l_Assets_0.MoonCamera:Clone();
                v22.Parent = l_Workspace_0.Debris;
                v22:PivotTo(l_Target_0.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(4, 0.5, 0.5));
                local v23 = {
                    Animator = v22.AnimationController.Animator, 
                    AnimId = v9.Animations.Camera
                };
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v23);
                local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                local v26 = script.Money:Clone();
                v26.Parent = l_Workspace_0.Debris;
                task.delay(v9.Metadata.Time - 1.8, function() --[[ Line: 102 ]]
                    -- upvalues: l_Workspace_0 (ref), v22 (copy)
                    local v27 = script.SmallMoney:Clone();
                    v27.Parent = l_Workspace_0.Debris;
                    v27.Transparency = 0.5;
                    v27.Position = (v22.Bone.CFrame * CFrame.new(0, 0, -1.2)).Position + Vector3.new(0, 2, 0, 0);
                    v27.ParticleEmitter:Emit(1);
                    task.wait(2);
                    v27:Destroy();
                end);
                l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 113 ]]
                    -- upvalues: v26 (copy), l_Character_0 (ref), l_Target_0 (copy), l_CurrentCamera_1 (copy), v22 (copy)
                    v26.Position = l_Character_0.Head.Position + Vector3.new(0, 10, 0, 0) + (l_Target_0.CFrame.LookVector * Vector3.new(1, 0, 1, 0)).Unit * 6;
                    l_CurrentCamera_1.CFrame = v22.Bone.CFrame;
                end);
                task.wait(v9.Metadata.Time - 1);
                if l_l_Character_0_Attribute_0 then
                    local v29 = {
                        FadeTime = 0.8, 
                        HoldTime = 1.3, 
                        IgnoreSound = true
                    };
                    task.spawn(function() --[[ Line: 127 ]]
                        -- upvalues: l_Modules_0 (ref), v29 (copy)
                        require(l_Modules_0:WaitForChild("Transitions")).FadeTransition(v29);
                    end);
                    task.delay(v29.HoldTime, function() --[[ Line: 132 ]]
                        -- upvalues: l_Character_0 (ref)
                        if l_Character_0 then
                            l_Character_0:Destroy();
                        end;
                    end);
                end;
                task.wait(1);
                l_l_AnimHelper_0_Anim_0:Stop(0);
                l_l_AnimHelper_0_Anim_1:Stop(0);
                l_CurrentCamera_1.FieldOfView = 70;
                l_CameraMode_0.Value = "Cutscene";
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                v22:Destroy();
                v26:Destroy();
                return;
            end;
        end;
    end;
end;
return v9;