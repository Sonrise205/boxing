local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
local v7 = {
    Metadata = {
        DisplayName = "Basic", 
        Rarity = "Rare", 
        Price = 2000, 
        Description = "You're not here to play around.", 
        Time = 6.666666666666667
    }, 
    Animations = {
        Character = 14351477412, 
        Camera = 14351486304
    }
};
v7.Use = function(v8) --[[ Line: 29 ]] --[[ Name: Use ]]
    -- upvalues: l_Workspace_0 (copy), v7 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
    if l_Workspace_0:GetAttribute("MatchStarted") then
        return;
    else
        local l_Character_0 = v8.Character;
        if not l_Character_0 then
            return;
        else
            local l_Target_0 = v8.Target;
            if not l_Target_0 then
                return;
            else
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                local v12 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                for _, v14 in (v12:GetPlayingAnimationTracks()) do
                    if v14.Priority ~= Enum.AnimationPriority.Idle then
                        v14:Stop(0);
                    end;
                end;
                local v15 = {
                    Animator = v12, 
                    AnimId = v7.Animations.Character, 
                    Priority = Enum.AnimationPriority.Action4, 
                    FadeIn = 0
                };
                local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                l_CameraMode_0.Value = "Freecam";
                l_Character_0.PrimaryPart.Anchored = true;
                l_Character_0:SetPrimaryPartCFrame(l_Target_0.CFrame * CFrame.new(0, -1.3, 0));
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v15);
                local v19 = script.ColorCorrection:Clone();
                v19.Parent = game.Lighting;
                game.Lighting.DepthOfField.Enabled = true;
                game.Lighting.DepthOfField.InFocusRadius = 5;
                for _, v21 in {
                    200, 
                    260, 
                    310, 
                    360
                } do
                    task.delay(v21 / 60 / 1.2, function() --[[ Line: 73 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knuckle", 
                            Parent = l_Workspace_0, 
                            Volume = 0.5, 
                            Speed = math.random(0.6, 1.1)
                        });
                    end);
                end;
                l_CurrentCamera_0.FieldOfView = 45;
                local v22 = l_Assets_0.MoonCamera:Clone();
                v22.Parent = l_Workspace_0.Debris;
                v22:PivotTo(l_Target_0.CFrame * CFrame.new(0, 1, 0));
                local v23 = {
                    Animator = v22.AnimationController.Animator, 
                    AnimId = v7.Animations.Camera
                };
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v23);
                l_l_AnimHelper_0_Anim_0.TimePosition = 1.5;
                l_l_AnimHelper_0_Anim_1.TimePosition = 1.5;
                l_l_AnimHelper_0_Anim_1:AdjustSpeed(0.9);
                l_l_AnimHelper_0_Anim_0:AdjustSpeed(1.2);
                local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 109 ]]
                    -- upvalues: l_CurrentCamera_1 (copy), v22 (copy)
                    l_CurrentCamera_1.CFrame = v22.Bone.CFrame;
                end);
                task.wait(v7.Metadata.Time);
                l_l_AnimHelper_0_Anim_0:Stop(0);
                l_l_AnimHelper_0_Anim_1:Stop(0);
                l_CurrentCamera_1.FieldOfView = 70;
                v19:Destroy();
                l_CameraMode_0.Value = "Cutscene";
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                v22:Destroy();
                return;
            end;
        end;
    end;
end;
return v7;