local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Dragon", 
        MainId = 17567988716, 
        Rarity = "Legendary"
    }
};
local _ = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local l_Titles_0 = l_ReplicatedStorage_0:WaitForChild("Titles");
local l_List_0 = require(l_Titles_0:WaitForChild("List"));
local v11 = require(l_Modules_0.Misc.Demojify);
local function _(v12, v13, v14) --[[ Line: 26 ]] --[[ Name: Lerp ]]
    return v12 + (v13 - v12) * v14;
end;
local v16 = {
    drowningsome = "UBG Family Founder", 
    c4rpye = "UBG Family Lieutenant", 
    ProbablyLava = "UBG Family Commander"
};
local v17 = {};
game.Players.PlayerRemoving:Connect(function(v18) --[[ Line: 36 ]]
    -- upvalues: v17 (copy)
    v17[v18.Name] = nil;
end);
UpdateOpponent = function(v19) --[[ Line: 40 ]] --[[ Name: UpdateOpponent ]]
    -- upvalues: v17 (copy)
    if not v19:IsA("Folder") then
        return;
    else
        local v20 = v19:WaitForChild("CharacterData", 10);
        if not v20 then
            return;
        else
            local v21 = v20:WaitForChild("Opponent", 10);
            if not v21 then
                return;
            else
                v21.Changed:Connect(function() --[[ Line: 49 ]]
                    -- upvalues: v17 (ref), v19 (copy)
                    v17[v19.Name] = nil;
                end);
                return;
            end;
        end;
    end;
end;
for _, v23 in game.Workspace.States:GetChildren() do
    UpdateOpponent(v23);
end;
game.Workspace.States.ChildAdded:Connect(function(v24) --[[ Line: 58 ]]
    UpdateOpponent(v24);
end);
workspace.Live.ChildRemoved:Connect(function(v25) --[[ Line: 62 ]]
    -- upvalues: v17 (copy)
    v17[v25.Name] = nil;
end);
TitleDrop = function(v26) --[[ Line: 66 ]] --[[ Name: TitleDrop ]]
    -- upvalues: l_Players_0 (copy), v17 (copy), v11 (copy), l_List_0 (copy), v16 (copy), l_Modules_0 (copy), l_TweenService_0 (copy)
    task.spawn(function() --[[ Line: 67 ]]
        -- upvalues: l_Players_0 (ref), v26 (copy), v17 (ref), v11 (ref), l_List_0 (ref), v16 (ref), l_Modules_0 (ref), l_TweenService_0 (ref)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        local v28 = v26:IsA("Player") and v26.Character or v26;
        local l_Common_0 = l_LocalPlayer_0.PlayerGui:FindFirstChild("Common");
        if not l_Common_0 then
            return;
        else
            local l_FirstChild_0 = game.Workspace.States:FindFirstChild(v26.Name);
            local v31 = l_FirstChild_0 and l_FirstChild_0:FindFirstChild("PlayerData");
            local v32 = l_FirstChild_0 and l_FirstChild_0:FindFirstChild("Occupied");
            if not v31 then
                return;
            else
                local l_FirstChild_1 = game.Workspace.States:FindFirstChild(l_LocalPlayer_0.Name);
                local v34 = l_FirstChild_1 and l_FirstChild_1:FindFirstChild("Occupied");
                local v35 = l_FirstChild_1 and l_FirstChild_1:FindFirstChild("CharacterData");
                if not v34 then
                    return;
                else
                    if v26.Name == l_LocalPlayer_0.Name then
                        if v32.LockedOn.Value == nil then
                            return;
                        end;
                    elseif v34.LockedOn.Value ~= v28 then
                        return;
                    end;
                    local l_v28_Attribute_0 = v28:GetAttribute("Yakuza");
                    if v35.Cutscene.Value and not l_v28_Attribute_0 then
                        return;
                    elseif l_Common_0:FindFirstChild("TitleDrop") then
                        return;
                    elseif v17[v26.Name] then
                        return;
                    else
                        v17[v26.Name] = true;
                        local v37 = script.Frame:Clone();
                        v37.Name = "TitleDrop";
                        v37.TitleCopy.Text = v28:GetAttribute("DragonTitle") or v26.Name;
                        v37.SubtitleCopy.Text = v11(l_List_0[v31.Title.Value].DisplayTitle or v31.Title.Value);
                        local v38 = v28:GetAttribute("DragonSpecialTitle") or v16[v26.Name];
                        if v38 then
                            v37.SubtitleCopy.Text = v38;
                            local l_FirstChild_2 = v37.Gradients:FindFirstChild(v26.Name);
                            if l_FirstChild_2 then
                                for _, v41 in v37:GetChildren() do
                                    if v41:IsA("TextLabel") then
                                        l_FirstChild_2:Clone().Parent = v41;
                                    end;
                                end;
                            end;
                        end;
                        local l_UserInputService_0 = game:GetService("UserInputService");
                        if not l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.TouchEnabled then
                            v37.Size = UDim2.new(1.15, 0, 1.15, 0);
                        end;
                        v37.Title.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v37.TitleCopy.Text .. "</stroke>";
                        v37.Subtitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v37.SubtitleCopy.Text .. "</stroke>";
                        v37.Vignette.ImageTransparency = 1;
                        v37.Parent = l_Common_0;
                        local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
                        task.delay(0.05, function() --[[ Line: 138 ]]
                            -- upvalues: l_EffectHelper_0 (copy), v37 (copy)
                            l_EffectHelper_0.TripleText({
                                Image = v37.SubtitleCopy, 
                                HoldTime = 0.16666666666666666, 
                                Amount = 2
                            });
                        end);
                        task.spawn(function() --[[ Line: 146 ]]
                            -- upvalues: l_EffectHelper_0 (copy), v37 (copy)
                            l_EffectHelper_0.TripleText({
                                Image = v37.TitleCopy, 
                                HoldTime = 0.6666666666666666, 
                                Amount = 2
                            });
                        end);
                        local v44 = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                        local v45 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                        local v46 = TweenInfo.new(1.3333333333333333, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                        local v47 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        local v48 = TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(v37.Vignette, v44, {
                            ImageTransparency = 0.4
                        }):Play();
                        local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
                        l_ColorCorrectionEffect_0.Brightness = 0;
                        l_ColorCorrectionEffect_0.Contrast = 0;
                        l_ColorCorrectionEffect_0.Saturation = 0;
                        l_ColorCorrectionEffect_0.Parent = game.Lighting;
                        if v38 then
                            workspace.FoVMult.Value = 0.1;
                            l_TweenService_0:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                FieldOfView = 80
                            }):Play();
                            l_TweenService_0:Create(l_ColorCorrectionEffect_0, v48, {
                                Brightness = 0.02, 
                                Contrast = 0.35, 
                                Saturation = 0.35
                            }):Play();
                        else
                            workspace.FoVMult.Value = 0.25;
                            l_TweenService_0:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                FieldOfView = 75
                            }):Play();
                            l_TweenService_0:Create(l_ColorCorrectionEffect_0, v47, {
                                Brightness = 0.02, 
                                Contrast = 0.4, 
                                Saturation = -0.2
                            }):Play();
                        end;
                        task.wait(2.75);
                        l_TweenService_0:Create(l_ColorCorrectionEffect_0, v47, {
                            Brightness = 0, 
                            Contrast = 0, 
                            Saturation = 0
                        }):Play();
                        v37.Title.Text = v37.TitleCopy.Text;
                        v37.Subtitle.Text = v37.SubtitleCopy.Text;
                        l_TweenService_0:Create(v37.Vignette, v44, {
                            ImageTransparency = 1
                        }):Play();
                        l_TweenService_0:Create(v37.Title, v45, {
                            TextTransparency = 1
                        }):Play();
                        l_TweenService_0:Create(v37.Subtitle, v45, {
                            TextTransparency = 1
                        }):Play();
                        l_TweenService_0:Create(v37, v46, {
                            Size = UDim2.new(3, 0, 3, 0)
                        }):Play();
                        task.wait(1);
                        v37.Name = "Remove";
                        task.wait(4);
                        v37:Destroy();
                        l_ColorCorrectionEffect_0:Destroy();
                        return;
                    end;
                end;
            end;
        end;
    end);
end;
Equip = function(v50) --[[ Line: 215 ]] --[[ Name: Equip ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_ReplicatedStorage_0 (copy), l_TweenService_0 (copy)
    local v51 = v50:IsA("Player") and v50.Character or v50;
    local v52 = v51 and v51:FindFirstChild("Humanoid");
    local v53 = v52 and (v52:FindFirstChild("Animator") or v52);
    if not v53 then
        return;
    else
        local v54 = workspace.States[v51.Name];
        local l_CharacterData_0 = v54.CharacterData;
        local l_Occupied_0 = v54.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v51, 
            Emote = v0
        }) then
            return;
        else
            local v57 = {};
            local v58 = false;
            local v59 = {
                Name = "Emote", 
                FadeIn = 0.1, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v53
            };
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v51_Attribute_0 = v51:GetAttribute("Owner");
            local v62 = true;
            if v51 ~= l_Character_0 then
                v62 = l_v51_Attribute_0 and l_v51_Attribute_0 == l_Character_0.Name;
            end;
            if not v62 then
                v59.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v59);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v59.FadeIn, v59.Weight, v59.Speed);
            task.delay(0.25, function() --[[ Line: 258 ]]
                -- upvalues: v58 (ref), l_EmoteHelper_0 (ref), v51 (copy)
                if v58 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v51, 
                        Name = "Rustle3", 
                        Parent = v51.PrimaryPart, 
                        Volume = 0.6
                    });
                    task.wait(0.16666666666666666);
                    if v58 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v51, 
                            Name = "Rustle4", 
                            Parent = v51.PrimaryPart, 
                            Volume = 0.6
                        });
                        return;
                    end;
                end;
            end);
            local l_v51_Attribute_1 = v51:GetAttribute("Yakuza");
            if l_v51_Attribute_1 then
                local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
                local l_FirstChild_3 = game.Workspace.States:FindFirstChild(l_LocalPlayer_1.Name);
                if l_FirstChild_3 then
                    local _ = l_FirstChild_3:FindFirstChild("Occupied");
                end;
                local v68 = l_FirstChild_3 and l_FirstChild_3:FindFirstChild("CharacterData");
                local l_CameraSettings_0 = workspace:FindFirstChild("CameraSettings");
                local l_CameraTarget_0 = l_CameraSettings_0.CameraTarget;
                local l_CameraMode_0 = l_CameraSettings_0.CameraMode;
                local l_Variant_0 = l_CameraSettings_0.Variant;
                v68.Cutscene.Value = true;
                local v73 = false;
                do
                    local l_v73_0 = v73;
                    task.spawn(function() --[[ Line: 295 ]]
                        -- upvalues: l_v73_0 (ref), v68 (copy), l_Variant_0 (copy), l_CameraMode_0 (copy), l_CameraTarget_0 (copy), v51 (copy)
                        while not l_v73_0 do
                            v68.Cutscene.Value = true;
                            l_Variant_0.Value = "Yeonsu";
                            l_CameraMode_0.Value = "Knockdown";
                            l_CameraTarget_0.Value = v51;
                            task.wait(0.03333333333333333);
                        end;
                    end);
                    task.delay(2, function() --[[ Line: 307 ]]
                        -- upvalues: l_v73_0 (ref), v68 (copy), l_Variant_0 (copy), l_CameraMode_0 (copy), l_CameraTarget_0 (copy)
                        l_v73_0 = true;
                        v68.Cutscene.Value = false;
                        l_Variant_0.Value = "";
                        l_CameraMode_0.Value = "";
                        l_CameraTarget_0.Value = nil;
                    end);
                end;
            end;
            task.delay(0.45, function() --[[ Line: 317 ]]
                -- upvalues: v58 (ref), v51 (copy), l_v51_Attribute_1 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v62 (copy), l_ReplicatedStorage_0 (ref), l_TweenService_0 (ref), v50 (copy)
                if v58 then
                    return;
                else
                    v51:SetAttribute("DragonEquipped", true);
                    if l_v51_Attribute_1 then
                        l_l_AnimHelper_0_Anim_0.TimePosition = 0.35;
                        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.03333333333333333);
                        task.wait(0.2);
                        l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.9);
                    end;
                    local v75 = script.Shirt:Clone();
                    for _, v77 in workspace:GetChildren() do
                        if string.find(v77.Name, "m_") then
                            for _, v79 in v75:GetChildren() do
                                if v79:IsA("BasePart") then
                                    v79.CollisionGroup = "MapObject";
                                end;
                            end;
                            break;
                        end;
                    end;
                    local l_v51_FirstChild_0 = v51:FindFirstChild("Body Colors");
                    if l_v51_FirstChild_0 then
                        l_v51_FirstChild_0:Clone().Parent = v75;
                    end;
                    local l_Shirt_0 = v51:FindFirstChildWhichIsA("Shirt");
                    if l_Shirt_0 then
                        l_Shirt_0:Clone().Parent = v75;
                        task.delay(0.08333333333333333, function() --[[ Line: 350 ]]
                            -- upvalues: l_Shirt_0 (copy), v51 (ref)
                            l_Shirt_0.Parent = v51.PrimaryPart;
                        end);
                    end;
                    local l_Pants_0 = v51:FindFirstChildWhichIsA("Pants");
                    for _, v84 in v51:GetChildren() do
                        if v84:IsA("Accessory") and v84.AccessoryType == Enum.AccessoryType.Hair then
                            l_Pants_0 = nil;
                            break;
                        end;
                    end;
                    local v85 = nil;
                    local l_Humanoid_0 = v51:FindFirstChild("Humanoid");
                    if l_Pants_0 and l_Humanoid_0 then
                        v85 = script.Pants:Clone();
                        v85.Parent = v51;
                        v85.Name = script.Name .. v51.Name;
                        v85:SetPrimaryPartCFrame(v51.PrimaryPart.CFrame);
                        l_Pants_0:Clone().Parent = v85;
                        l_Pants_0:Clone().Parent = v51.PrimaryPart;
                        v85.Humanoid:Destroy();
                        local v87 = l_Humanoid_0:Clone();
                        v87.RequiresNeck = false;
                        v87.BreakJointsOnDeath = false;
                        v87.EvaluateStateMachine = false;
                        v87.Parent = v85;
                        for _, v89 in l_Humanoid_0:GetChildren() do
                            local v90 = v89 and v89:Clone();
                            if v90 then
                                v90.Parent = v85.Humanoid;
                            end;
                        end;
                        for _, v92 in v85:GetChildren() do
                            if v92:IsA("BasePart") and v92.Name ~= "HumanoidRootPart" then
                                local l_v51_FirstChild_1 = v51:FindFirstChild(v92.Name);
                                v92.CanCollide = false;
                                v92.CanQuery = false;
                                v92.CanTouch = false;
                                v92.Anchored = false;
                                v92.CollisionGroup = "None";
                                v92.Transparency = 0.99;
                                v92.Color = l_v51_FirstChild_1.Color;
                                local l_Weld_0 = Instance.new("Weld");
                                l_Weld_0.Parent = v92;
                                l_Weld_0.Part1 = v92;
                                task.delay(0.016666666666666666, function() --[[ Line: 411 ]]
                                    -- upvalues: l_Weld_0 (copy), l_v51_FirstChild_1 (copy)
                                    l_Weld_0.Part0 = l_v51_FirstChild_1;
                                end);
                            end;
                        end;
                        if l_v51_FirstChild_0 then
                            l_v51_FirstChild_0:Clone().Parent = v85;
                        end;
                    end;
                    task.wait(0.08333333333333333);
                    local v95 = script.Effects.Smoke:Clone();
                    v95.Parent = v51.PrimaryPart;
                    v95.Texture:Emit(1);
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v51, 
                        Parent = v51.PrimaryPart, 
                        DirectCopy = script.SFX, 
                        Name = "Emote", 
                        ShouldWeld = true
                    });
                    if v62 then
                        local v96 = require(l_ReplicatedStorage_0.Modules.EffectHelper);
                        local v97 = {
                            Preset = "LightHit", 
                            FoV = 67, 
                            WaitTime = 0.3, 
                            FadeIn = 0.5
                        };
                        local l_v96_0 = v96 --[[ copy: 7 -> 16 ]];
                        local l_v97_0 = v97 --[[ copy: 8 -> 17 ]];
                        task.defer(function() --[[ Line: 443 ]]
                            -- upvalues: l_v96_0 (copy), l_v97_0 (copy)
                            l_v96_0.CameraShake(l_v97_0);
                        end);
                    end;
                    for _, v101 in v75:GetChildren() do
                        if v101:IsA("BasePart") then
                            v101.CanCollide = true;
                            v101.CollisionGroup = "None";
                        end;
                    end;
                    v75.PrimaryPart.CanCollide = false;
                    v75.Parent = game.Workspace.Debris;
                    v75:SetPrimaryPartCFrame(v51.RightHand.CFrame * CFrame.new(0, -1.5, 0));
                    if l_v51_Attribute_1 then
                        v75.UpperTorso.AssemblyLinearVelocity = CFrame.lookAt(v75.PrimaryPart.Position, (v75.PrimaryPart.CFrame * CFrame.new(0, 6, -3.5)).Position).LookVector * 100 + Vector3.new(0, 36, 0, 0);
                        v75.UpperTorso.AssemblyAngularVelocity = Vector3.new(math.random(20, 35), 0, math.random(-45, -20));
                    else
                        v75.UpperTorso.AssemblyLinearVelocity = CFrame.lookAt(v75.PrimaryPart.Position, (v75.PrimaryPart.CFrame * CFrame.new(5, 6, 1.5)).Position).LookVector * 80 + Vector3.new(0, 12, 0, 0);
                        v75.UpperTorso.AssemblyAngularVelocity = Vector3.new(math.random(20, 35), 0, math.random(-45, -20));
                    end;
                    local l_Children_0 = script.Shirts:GetChildren();
                    local v103 = l_Children_0[math.random(#l_Children_0)];
                    if v51:GetAttribute("Yakuza") then
                        v103 = script.Shirts.Yakuza;
                    end;
                    v103 = v103:Clone();
                    v103.Name = "RandomShirt";
                    local l_v51_Attribute_2 = v51:GetAttribute("DragonShirtTemplate");
                    if l_v51_Attribute_2 then
                        v103.ShirtTemplate = l_v51_Attribute_2;
                    end;
                    v103.Parent = v51;
                    if v51:GetAttribute("EventRemoveShirt") then
                        local v105 = nil;
                        do
                            local l_v105_0 = v105;
                            l_v105_0 = v51.ChildAdded:Connect(function() --[[ Line: 487 ]]
                                -- upvalues: l_v105_0 (ref), v51 (ref)
                                l_v105_0:Disconnect();
                                for _, v108 in v51:GetChildren() do
                                    if v108.Name == "RandomShirt" then
                                        v108:Destroy();
                                    end;
                                end;
                            end);
                        end;
                    end;
                    if v85 then
                        for _, v110 in v85:GetChildren() do
                            if v110:IsA("BasePart") and v110.Name ~= "HumanoidRootPart" then
                                local l_v51_FirstChild_2 = v51:FindFirstChild(v110.Name);
                                v110.Transparency = 0;
                                l_v51_FirstChild_2.Transparency = 1;
                            end;
                        end;
                        l_Pants_0:Destroy();
                    end;
                    for _, v113 in v75:GetChildren() do
                        if v113:IsA("BasePart") and v113 ~= v75.PrimaryPart then
                            l_TweenService_0:Create(v113, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                Size = Vector3.new(v113.Size.X, v113.Size.Y, 0.3)
                            }):Play();
                        end;
                    end;
                    if not v51:GetAttribute("Yakuza") then
                        TitleDrop(v50);
                    end;
                    task.wait(4);
                    for _, v115 in v75:GetChildren() do
                        if v115:IsA("BasePart") then
                            l_TweenService_0:Create(v115, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                Transparency = 1
                            }):Play();
                        end;
                    end;
                    task.wait(4);
                    v75:Destroy();
                    v95:Destroy();
                    return;
                end;
            end);
            local v116 = nil;
            v116 = v51.AncestryChanged:Connect(function() --[[ Line: 534 ]]
                -- upvalues: v116 (ref), v51 (copy)
                if v116 then
                    v116:Disconnect();
                end;
                for _, v118 in v51:GetChildren() do
                    if v118:IsA("BasePart") and v118.Name ~= "HumanoidRootPart" and v118.Name ~= "LeftHand" and v118.Name ~= "RightHand" then
                        v118.Transparency = 0;
                    end;
                end;
                for _, v120 in workspace.Debris:GetChildren() do
                    if v120.Name == script.Name .. v51.Name then
                        v120:Destroy();
                    end;
                end;
                for _, v122 in v51:GetChildren() do
                    if v122.Name == script.Name .. v51.Name then
                        v122:Destroy();
                    end;
                end;
            end);
            local function v126(_) --[[ Line: 554 ]] --[[ Name: Cleanup ]]
                -- upvalues: v58 (ref), v57 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v50 (copy), v62 (copy), l_Occupied_0 (copy), v51 (copy), v0 (ref)
                if v58 then
                    return;
                else
                    v58 = true;
                    for _, v125 in v57 do
                        if v125 then
                            v125:Disconnect();
                        end;
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v50);
                    if v62 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v51:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v51:SetAttribute("CurrentEmote", nil);
                    end;
                    return;
                end;
            end;
            v51:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v51, 
                Animator = v53
            }).Event:Connect(function() --[[ Line: 587 ]]
                -- upvalues: v126 (copy)
                v126();
            end);
            if l_v51_Attribute_1 then
                task.wait(0.6666666666666666);
            end;
            task.wait(1);
            if v58 then
                return;
            else
                l_l_AnimHelper_0_Anim_0:Stop(0.6666666666666666);
                task.wait(0.3333333333333333);
                v126();
                return;
            end;
        end;
    end;
end;
Unequip = function(v127) --[[ Line: 603 ]] --[[ Name: Unequip ]]
    -- upvalues: l_Players_0 (copy), l_EmoteHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_ReplicatedStorage_0 (copy)
    local v128 = v127:IsA("Player") and v127.Character or v127;
    local v129 = v128 and v128:FindFirstChild("Humanoid");
    local v130 = v129 and (v129:FindFirstChild("Animator") or v129);
    if not v130 then
        return;
    else
        local l_Character_1 = l_Players_0.LocalPlayer.Character;
        local l_v128_Attribute_0 = v128:GetAttribute("Owner");
        local v133 = true;
        if v128 ~= l_Character_1 then
            v133 = l_v128_Attribute_0 and l_v128_Attribute_0 == l_Character_1.Name;
        end;
        local v134 = workspace.States[v128.Name];
        local l_CharacterData_1 = v134.CharacterData;
        local l_Occupied_2 = v134.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_1, 
            Character = v128, 
            Emote = v0
        }) then
            return;
        else
            local v137 = {};
            local v138 = false;
            local v139 = {
                Name = "Emote", 
                FadeIn = 0.3, 
                Weight = 0.87, 
                Speed = -1.4, 
                AnimId = v0.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v130
            };
            if not v133 then
                v139.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v139);
            l_l_AnimHelper_0_Anim_1:Stop(0.01);
            l_l_AnimHelper_0_Anim_1:Play(v139.FadeIn, v139.Weight, v139.Speed);
            l_l_AnimHelper_0_Anim_1.TimePosition = 1.5;
            task.delay(0.21666666666666667, function() --[[ Line: 649 ]]
                -- upvalues: v138 (ref), l_EmoteHelper_0 (ref), v128 (copy), v133 (copy), l_ReplicatedStorage_0 (ref)
                if v138 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v128, 
                        Name = "Rustle3", 
                        Parent = v128.PrimaryPart, 
                        Volume = 0.6
                    });
                    task.wait(0.11666666666666667);
                    if v138 then
                        return;
                    else
                        v128:SetAttribute("DragonEquipped", nil);
                        local l_Shirt_1 = v128.PrimaryPart:FindFirstChild("Shirt");
                        local v142 = nil;
                        local v143 = nil;
                        local v144 = nil;
                        if l_Shirt_1 then
                            v142 = script.Shirt:Clone();
                            l_Shirt_1:Clone().Parent = v142;
                            local l_v128_FirstChild_0 = v128:FindFirstChild("Body Colors");
                            if l_v128_FirstChild_0 then
                                l_v128_FirstChild_0:Clone().Parent = v142;
                            end;
                            v142.Parent = game.Workspace.Debris;
                            for _, v147 in v142:GetChildren() do
                                if v147:IsA("BasePart") then
                                    v147.CanCollide = false;
                                    v147.Anchored = false;
                                    v147.Massless = true;
                                    v147.CollisionGroup = "None";
                                end;
                            end;
                            v142:SetPrimaryPartCFrame(v128.RightHand.CFrame);
                            local l_AlignPosition_0 = v142.UpperTorso.AlignPosition;
                            local l_AlignOrientation_0 = v142.UpperTorso.AlignOrientation;
                            local l_Attachment_0 = Instance.new("Attachment");
                            l_Attachment_0.Parent = v142.UpperTorso;
                            v143 = Instance.new("Attachment");
                            v143.Parent = v128.RightHand;
                            l_AlignPosition_0.Attachment0 = l_Attachment_0;
                            l_AlignPosition_0.Attachment1 = v143;
                            v144 = Instance.new("Attachment");
                            v144.Parent = v128.RightHand;
                            l_AlignOrientation_0.Attachment0 = l_Attachment_0;
                            l_AlignOrientation_0.Attachment1 = v144;
                        end;
                        task.wait(0.3);
                        if v133 then
                            local v151 = require(l_ReplicatedStorage_0.Modules.EffectHelper);
                            local v152 = {
                                Preset = "LightHit", 
                                FoV = 68.5, 
                                WaitTime = 0.1, 
                                FadeIn = 0.7
                            };
                            local l_v151_0 = v151 --[[ copy: 4 -> 11 ]];
                            local l_v152_0 = v152 --[[ copy: 5 -> 12 ]];
                            task.defer(function() --[[ Line: 715 ]]
                                -- upvalues: l_v151_0 (copy), l_v152_0 (copy)
                                l_v151_0.CameraShake(l_v152_0);
                            end);
                        end;
                        if v142 then
                            v142:Destroy();
                            v143:Destroy();
                            v144:Destroy();
                        end;
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v128, 
                            Name = "Rustle4", 
                            Parent = v128.PrimaryPart, 
                            Volume = 0.6
                        });
                        local l_Shirt_2 = v128.PrimaryPart:FindFirstChild("Shirt");
                        if l_Shirt_2 then
                            l_Shirt_2.Parent = v128;
                        end;
                        local l_Pants_1 = v128.PrimaryPart:FindFirstChild("Pants");
                        if l_Pants_1 then
                            l_Pants_1.Parent = v128;
                        end;
                        for _, v158 in v128:GetChildren() do
                            if v158.Name == "RandomShirt" then
                                v158:Destroy();
                            end;
                            if v158:IsA("BasePart") and v158.Name ~= "HumanoidRootPart" and v158.Name ~= "LeftHand" and v158.Name ~= "RightHand" then
                                v158.Transparency = 0;
                            end;
                        end;
                        for _, v160 in workspace.Debris:GetChildren() do
                            if v160.Name == script.Name .. v128.Name then
                                v160:Destroy();
                            end;
                        end;
                        for _, v162 in v128:GetChildren() do
                            if v162.Name == script.Name .. v128.Name then
                                v162:Destroy();
                            end;
                        end;
                        local v163 = script.Effects.EndSmoke:Clone();
                        v163.Parent = v128.PrimaryPart;
                        v163.Texture:Emit(1);
                        task.delay(4, function() --[[ Line: 763 ]]
                            -- upvalues: v163 (copy)
                            v163:Destroy();
                        end);
                        return;
                    end;
                end;
            end);
            local function v167(_) --[[ Line: 768 ]] --[[ Name: Cleanup ]]
                -- upvalues: v138 (ref), v137 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_EmoteHelper_0 (ref), v127 (copy), v133 (copy), l_Occupied_2 (copy), v128 (copy), v0 (ref)
                if v138 then
                    return;
                else
                    v138 = true;
                    for _, v166 in v137 do
                        if v166 then
                            v166:Disconnect();
                        end;
                    end;
                    l_l_AnimHelper_0_Anim_1.Looped = false;
                    l_l_AnimHelper_0_Anim_1:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v127);
                    if v133 then
                        l_Occupied_2.SpeedMult.Value = 0;
                        l_Occupied_2.LerpMult.Value = 0;
                    end;
                    if v128:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v128:SetAttribute("CurrentEmote", nil);
                    end;
                    return;
                end;
            end;
            v128:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_2.SpeedMult.Value = 1;
            l_Occupied_2.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_1, 
                Character = v128, 
                Animator = v130
            }).Event:Connect(function() --[[ Line: 801 ]]
                -- upvalues: v167 (copy)
                v167();
            end);
            task.wait(0.6666666666666666);
            if v138 then
                return;
            else
                l_l_AnimHelper_0_Anim_1:AdjustSpeed(-0.4);
                task.wait(0.3333333333333333);
                if v138 then
                    return;
                else
                    l_l_AnimHelper_0_Anim_1:Stop(0.6666666666666666);
                    task.wait(0.3333333333333333);
                    v167();
                    return;
                end;
            end;
        end;
    end;
end;
v0.Use = function(v168) --[[ Line: 817 ]] --[[ Name: Use ]]
    local v169 = v168:IsA("Player") and v168.Character or v168;
    if v169 and v169:GetAttribute("DragonEquipped") then
        Unequip(v168);
        return;
    else
        Equip(v168);
        return;
    end;
end;
return v0;