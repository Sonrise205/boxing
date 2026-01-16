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
        HasVariation = true, 
        Rarity = "Uncommon", 
        Price = 0, 
        Description = "The standard ring walk.", 
        Time = 4, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 14329267744, 
        CharacterVariation = 14339807328, 
        Camera = 14331219047
    }
};
v7.Use = function(v8) --[[ Line: 34 ]] --[[ Name: Use ]]
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
                    AnimId = v8.UseVariation and v7.Metadata.HasVariation and v7.Animations.CharacterVariation or v7.Animations.Character, 
                    Priority = Enum.AnimationPriority.Action4, 
                    FadeIn = 0
                };
                local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                l_CameraMode_0.Value = "Freecam";
                l_Character_0.PrimaryPart.Anchored = true;
                l_Character_0:SetPrimaryPartCFrame(l_Target_0.CFrame * CFrame.new(0, -1.1, 0));
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v15);
                game.Lighting.DepthOfField.Enabled = true;
                game.Lighting.DepthOfField.InFocusRadius = 5;
                for _, v20 in {
                    34, 
                    52, 
                    67, 
                    84
                } do
                    task.delay(v20 / 60, function() --[[ Line: 76 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Swing", 
                            Parent = l_Workspace_0, 
                            Speed = math.random(0.9, 1.1)
                        });
                    end);
                end;
                l_CurrentCamera_0.FieldOfView = 45;
                local v21 = l_Assets_0.Camera:Clone();
                v21.Name = l_Character_0.Name .. "Camera";
                v21.Parent = l_Workspace_0.Debris;
                local v22 = 0;
                local function v23() --[[ Line: 95 ]] --[[ Name: UpdateCameraCFrame ]]
                    -- upvalues: v22 (ref), v21 (copy), l_Character_0 (copy)
                    if os.time() - v22 < 0.5 then
                        return;
                    else
                        v22 = os.time();
                        v21:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.new(0, -2.4, 0));
                        return;
                    end;
                end;
                v23();
                local v24 = {
                    Animator = v21.AnimationController.Animator, 
                    AnimId = v7.Animations.Camera
                };
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v24);
                local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 114 ]]
                    -- upvalues: l_CurrentCamera_1 (copy), v21 (copy), v23 (copy)
                    l_CurrentCamera_1.CFrame = v21.Head.CFrame;
                    v23();
                end);
                task.wait(v7.Metadata.Time);
                l_l_AnimHelper_0_Anim_0:Stop(0);
                l_l_AnimHelper_0_Anim_1:Stop(0);
                l_CurrentCamera_1.FieldOfView = 70;
                l_CameraMode_0.Value = "Cutscene";
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                v21:Destroy();
                return;
            end;
        end;
    end;
end;
return v7;