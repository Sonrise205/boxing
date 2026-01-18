local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local l_TweenHelper_0 = require(l_Modules_0:WaitForChild("TweenHelper"));
local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
local v8 = {
    Metadata = {
        DisplayName = "Carried", 
        Rarity = "Mythic", 
        Price = 25000, 
        Description = "Get carried on the shoulders of one of your friends.", 
        Time = 5.833333333333334
    }, 
    Animations = {
        Character = 14390983065, 
        Friend = 14390957315, 
        Camera = 14390986206
    }
};
Shuffle = function(v9) --[[ Line: 34 ]] --[[ Name: Shuffle ]]
    for v10 = #v9, 2, -1 do
        local v11 = math.random(v10);
        local v12 = v9[v11];
        local v13 = v9[v10];
        v9[v10] = v12;
        v9[v11] = v13;
    end;
    return v9;
end;
v8.Preload = function(v14) --[[ Line: 42 ]] --[[ Name: Preload ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Parent = l_Workspace_0;
    l_Folder_0.Name = v14.Character.Name .. "Friends";
    local l_HumanoidDescriptionFromUserId_0 = game.Players:GetHumanoidDescriptionFromUserId(4604388331);
    for _ = 1, 1 do
        local v18 = script.Rig:Clone();
        for _, v20 in v18:GetDescendants() do
            if v20:IsA("BaseScript") then
                v20:Destroy();
            end;
        end;
        v18.PrimaryPart.CFrame = CFrame.new(0, 1000, 0);
        v18.Parent = l_Folder_0;
        v18.LeftHand.Transparency = 0;
        v18.RightHand.Transparency = 0;
        l_HumanoidDescriptionFromUserId_0.Head = 0;
        l_HumanoidDescriptionFromUserId_0.LeftArm = 0;
        l_HumanoidDescriptionFromUserId_0.LeftLeg = 0;
        l_HumanoidDescriptionFromUserId_0.RightArm = 0;
        l_HumanoidDescriptionFromUserId_0.RightLeg = 0;
        l_HumanoidDescriptionFromUserId_0.Torso = 0;
        l_HumanoidDescriptionFromUserId_0.BodyTypeScale = 0.3;
        l_HumanoidDescriptionFromUserId_0.DepthScale = 1;
        l_HumanoidDescriptionFromUserId_0.HeadScale = 1;
        l_HumanoidDescriptionFromUserId_0.HeightScale = 1;
        l_HumanoidDescriptionFromUserId_0.ProportionScale = 1;
        l_HumanoidDescriptionFromUserId_0.WidthScale = 1;
        v18.Humanoid:ApplyDescription(l_HumanoidDescriptionFromUserId_0);
    end;
    local v21 = nil;
    pcall(function() --[[ Line: 80 ]]
        -- upvalues: v21 (ref), v14 (copy)
        v21 = game.Players:GetFriendsAsync(v14.UserId):GetCurrentPage();
        v21 = Shuffle(v14.Friends);
    end);
    if not v21 then
        return;
    else
        local l_l_Folder_0_Children_0 = l_Folder_0:GetChildren();
        for v23 = 1, 1 do
            local v24 = false;
            if v23 <= #v21 then
                v24 = v21[v23].Id;
            end;
            if v24 then
                local l_HumanoidDescriptionFromUserId_1 = game.Players:GetHumanoidDescriptionFromUserId(v24);
                local v26 = l_l_Folder_0_Children_0[v23];
                v26.PrimaryPart.CFrame = CFrame.new(0, 1000, 0);
                v26.Parent = l_Folder_0;
                v26.LeftHand.Transparency = 0;
                v26.RightHand.Transparency = 0;
                l_HumanoidDescriptionFromUserId_1.Head = 0;
                l_HumanoidDescriptionFromUserId_1.LeftArm = 0;
                l_HumanoidDescriptionFromUserId_1.LeftLeg = 0;
                l_HumanoidDescriptionFromUserId_1.RightArm = 0;
                l_HumanoidDescriptionFromUserId_1.RightLeg = 0;
                l_HumanoidDescriptionFromUserId_1.Torso = 0;
                l_HumanoidDescriptionFromUserId_1.BodyTypeScale = 0.3;
                l_HumanoidDescriptionFromUserId_1.DepthScale = 1;
                l_HumanoidDescriptionFromUserId_1.HeadScale = 1;
                l_HumanoidDescriptionFromUserId_1.HeightScale = 1;
                l_HumanoidDescriptionFromUserId_1.ProportionScale = 1;
                l_HumanoidDescriptionFromUserId_1.WidthScale = 1;
                v26.Humanoid:ApplyDescription(l_HumanoidDescriptionFromUserId_1);
            end;
        end;
        return;
    end;
end;
v8.Use = function(v27) --[[ Line: 121 ]] --[[ Name: Use ]]
    -- upvalues: l_Workspace_0 (copy), v8 (copy), l_TweenService_0 (copy), l_TweenHelper_0 (copy), l_AnimHelper_0 (copy), l_Assets_0 (copy), l_RunService_0 (copy)
    if l_Workspace_0:GetAttribute("MatchStarted") then
        return;
    else
        local l_Character_0 = v27.Character;
        if not l_Character_0 then
            return;
        else
            local l_Target_0 = v27.Target;
            if not l_Target_0 then
                return;
            else
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                local v31 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                for _, v33 in (v31:GetPlayingAnimationTracks()) do
                    if v33.Priority ~= Enum.AnimationPriority.Idle then
                        v33:Stop(0);
                    end;
                end;
                local v34 = {
                    Animator = v31, 
                    AnimId = v8.Animations.Character, 
                    Priority = Enum.AnimationPriority.Action4, 
                    FadeIn = 0
                };
                local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
                l_CameraMode_0.Value = "Freecam";
                l_Character_0.PrimaryPart.Anchored = true;
                l_Character_0:SetPrimaryPartCFrame(l_Target_0.CFrame * CFrame.new(0, 1, 4));
                local l_FirstChild_0 = game.Workspace:FindFirstChild(v27.Character.Name .. "Friends");
                local v38 = l_FirstChild_0 and l_FirstChild_0:GetChildren();
                if not v38 then
                    return;
                else
                    local v39 = {
                        AnimId = v8.Animations.Friend, 
                        Priority = Enum.AnimationPriority.Action4, 
                        FadeIn = 0
                    };
                    for _, v41 in v38 do
                        v41.PrimaryPart.CFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 0.2, 0.2);
                    end;
                    v38[1].PrimaryPart.CFrame = l_Character_0.PrimaryPart.CFrame;
                    v39.Animator = v38[1].Humanoid.Animator;
                    for _, v43 in v38 do
                        l_TweenService_0:Create(v43.PrimaryPart, TweenInfo.new(9, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                            CFrame = v43.PrimaryPart.CFrame * CFrame.new(0, 0, -24)
                        }):Play();
                    end;
                    local v44 = l_TweenService_0:Create(l_Character_0.PrimaryPart, TweenInfo.new(9, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                        CFrame = l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 0, -24)
                    });
                    l_TweenHelper_0.AddSelfTween(v44);
                    v44:Play();
                    local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v34);
                    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v39);
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(1.2);
                    l_l_AnimHelper_0_Anim_1:AdjustSpeed(1.2);
                    l_l_AnimHelper_0_Anim_0.TimePosition = 0;
                    l_l_AnimHelper_0_Anim_1.TimePosition = 0;
                    game.Lighting.DepthOfField.Enabled = true;
                    game.Lighting.DepthOfField.InFocusRadius = 7;
                    l_CurrentCamera_0.FieldOfView = 45;
                    local v47 = l_Assets_0.MoonCamera:Clone();
                    v47.Parent = l_Workspace_0.Debris;
                    v47:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.new(0, -0.5, 0));
                    local v48 = {
                        Animator = v47.AnimationController.Animator, 
                        AnimId = v8.Animations.Camera
                    };
                    local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v48);
                    local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                    l_l_AnimHelper_0_Anim_2:AdjustSpeed(1.2);
                    l_RunService_0:BindToRenderStep("CutsceneCamera", Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 214 ]]
                        -- upvalues: l_CurrentCamera_1 (copy), v47 (copy)
                        l_CurrentCamera_1.CFrame = v47.Bone.CFrame;
                    end);
                    task.wait(v8.Metadata.Time);
                    l_l_AnimHelper_0_Anim_0:Stop(0);
                    l_l_AnimHelper_0_Anim_2:Stop(0);
                    l_CurrentCamera_1.FieldOfView = 70;
                    l_CameraMode_0.Value = "Cutscene";
                    l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                    v47:Destroy();
                    if l_FirstChild_0 then
                        l_FirstChild_0:Destroy();
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
return v8;