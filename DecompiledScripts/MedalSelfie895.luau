local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Medal Selfie", 
        Unrollable = true, 
        MainId = 110727623571672, 
        StartId = 125102393766125, 
        Rarity = "Legendary"
    }
};
local _ = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v2 = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v12, v13, v14) --[[ Line: 28 ]] --[[ Name: Lerp ]]
    return v12 + (v13 - v12) * v14;
end;
v0.Use = function(v16) --[[ Line: 30 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), v2 (copy), l_UserInputService_0 (copy)
    local v17 = v16:IsA("Player") and v16.Character or v16;
    local v18 = v17 and v17:FindFirstChild("Humanoid");
    local v19 = v18 and (v18:FindFirstChild("Animator") or v18);
    if not v19 then
        return;
    else
        local v20 = workspace.States[v17.Name];
        local l_CharacterData_0 = v20.CharacterData;
        local l_Occupied_0 = v20.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v17, 
            Emote = v0
        }) then
            return;
        else
            local v23 = {};
            local v24 = false;
            local v25 = {
                Name = "Emote", 
                FadeIn = 0.15, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.StartId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v19
            };
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v17_Attribute_0 = v17:GetAttribute("Owner");
            local v28 = true;
            if v17 ~= l_Character_0 then
                v28 = l_v17_Attribute_0 and l_v17_Attribute_0 == l_Character_0.Name;
            end;
            if not v28 then
                v25.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v25);
            v25.AnimId = v0.Metadata.MainId;
            v25.Looped = true;
            local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v25);
            l_l_AnimHelper_0_Anim_1:Stop(0.01);
            l_l_AnimHelper_0_Anim_1:Play(v25.FadeIn, 0.1, v25.Speed);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v25.FadeIn, v25.Weight, v25.Speed);
            local v31 = nil;
            local v32 = nil;
            local v33 = nil;
            local l_UpperTorso_0 = v17:WaitForChild("UpperTorso");
            local l_Head_0 = v17:WaitForChild("Head");
            local l_RightShoulder_0 = v17:WaitForChild("RightUpperArm"):WaitForChild("RightShoulder");
            local l_Waist_0 = l_UpperTorso_0:WaitForChild("Waist");
            local l_Neck_0 = l_Head_0:WaitForChild("Neck");
            local l_C0_0 = l_RightShoulder_0.C0;
            local l_C0_1 = l_Waist_0.C0;
            local l_C0_2 = l_Neck_0.C0;
            local v42 = tick();
            local v43 = nil;
            local v44 = nil;
            local v45 = false;
            local v46 = nil;
            local v47 = nil;
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v17, 
                Name = "Rustle1", 
                Parent = v17.PrimaryPart, 
                Volume = 0.7
            });
            local v48 = tick();
            local v49 = {};
            local v50 = false;
            local function v60() --[[ Line: 122 ]] --[[ Name: CleanCamera ]]
                -- upvalues: v50 (ref), v28 (copy), l_RunService_0 (ref), v42 (copy), v43 (ref), v44 (ref), v16 (copy), l_TweenService_0 (ref), v2 (ref), v49 (copy), v32 (ref), v46 (ref), v48 (copy)
                if v50 then
                    return;
                else
                    v50 = true;
                    if not v28 then
                        return;
                    else
                        l_RunService_0:UnbindFromRenderStep("Selfie" .. v42);
                        workspace.FoVMult.Value = 8;
                        if v43 then
                            v43.Main:Destroy();
                            task.delay(5, function() --[[ Line: 134 ]]
                                -- upvalues: v43 (ref)
                                if v43 then
                                    v43:Destroy();
                                end;
                            end);
                        end;
                        if v44 then
                            v44:Destroy();
                        end;
                        local l_Main_0 = v16.PlayerGui:FindFirstChild("Main");
                        local l_Common_0 = v16.PlayerGui:FindFirstChild("Common");
                        for _, v54 in l_Main_0:GetChildren() do
                            l_TweenService_0:Create(v54, v2, {
                                Position = UDim2.new(0, 0, 0, 0)
                            }):Play();
                        end;
                        for _, v56 in l_Common_0:GetChildren() do
                            l_TweenService_0:Create(v56, v2, {
                                Position = UDim2.new(0, 0, 0, 0)
                            }):Play();
                        end;
                        for _, v58 in v49 do
                            v58:Disconnect();
                        end;
                        if v32 then
                            v32.CanCollide = false;
                            local l_v32_0 = v32;
                            l_v32_0.Size = l_v32_0.Size / 5;
                        end;
                        if v46 then
                            v46:Cancel();
                        end;
                        if tick() - v48 < 2 then
                            workspace.CurrentCamera.FieldOfView = 70;
                        end;
                        return;
                    end;
                end;
            end;
            local function v71() --[[ Line: 170 ]] --[[ Name: Cleanup ]]
                -- upvalues: v24 (ref), v23 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_EmoteHelper_0 (ref), v16 (copy), v28 (copy), l_Occupied_0 (copy), v17 (copy), v0 (ref), v32 (ref), v45 (ref), v48 (copy), v43 (ref), l_TweenService_0 (ref), l_RightShoulder_0 (copy), l_C0_0 (copy), l_Waist_0 (copy), l_C0_1 (copy), l_Neck_0 (copy), l_C0_2 (copy), l_CharacterData_0 (copy), v49 (copy), v60 (copy), v44 (ref), l_UserInputService_0 (ref), v31 (ref), v47 (ref)
                if v24 then
                    return;
                else
                    v24 = true;
                    for _, v62 in v23 do
                        v62:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_1.Looped = false;
                    warn("FINDME RESET TRACK");
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_l_AnimHelper_0_Anim_1:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v16);
                    if v28 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v17:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v17:SetAttribute("CurrentEmote", nil);
                    end;
                    local _ = l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v17, 
                        Parent = v17.PrimaryPart, 
                        Name = "Fling", 
                        Speed = math.random(0.9, 1.1)
                    });
                    local function v66() --[[ Line: 203 ]] --[[ Name: Fling ]]
                        -- upvalues: v32 (ref), v45 (ref), v28 (ref)
                        if not v32 then
                            return;
                        elseif not v45 then
                            return;
                        else
                            local l_Weld_0 = v32:FindFirstChild("Weld");
                            if l_Weld_0 then
                                l_Weld_0:Destroy();
                            end;
                            v32.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 1.5, math.random(10, 30) * 3.2, math.random(-10, 10) * 1.5);
                            v32.AssemblyAngularVelocity = Vector3.new(math.random(-15, 15) / 3, math.random(-15, 15) / 3, math.random(-15, 15) / 3);
                            if v28 then
                                v32.CanCollide = true;
                                v32.CollisionGroup = "Default";
                            end;
                            if v28 then
                                local l_v32_1 = v32;
                                l_v32_1.Size = l_v32_1.Size * 5;
                            end;
                            return;
                        end;
                    end;
                    local v67 = false;
                    local function v70() --[[ Line: 224 ]] --[[ Name: Clipped ]]
                        -- upvalues: v67 (ref), v48 (ref), v43 (ref), l_TweenService_0 (ref), l_EmoteHelper_0 (ref), v17 (ref)
                        if v67 then
                            return;
                        else
                            v67 = true;
                            if tick() - v48 > 2 then
                                local v68 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                                local v69 = UDim2.new(-0.4, 0, v43.Medal.Position.Y.Scale, 0);
                                v43.Medal.Visible = true;
                                v43.Medal.Position = v69;
                                l_TweenService_0:Create(v43.Medal, v68, {
                                    Position = UDim2.new(0, 0, v43.Medal.Position.Y.Scale, 0)
                                }):Play();
                                task.delay(3, function() --[[ Line: 236 ]]
                                    -- upvalues: v43 (ref), l_TweenService_0 (ref), v68 (copy), v69 (copy)
                                    if not v43 then
                                        return;
                                    else
                                        l_TweenService_0:Create(v43.Medal, v68, {
                                            Position = v69
                                        }):Play();
                                        return;
                                    end;
                                end);
                                l_EmoteHelper_0:PlaySound({
                                    SourceCharacter = v17, 
                                    Parent = v17.PrimaryPart, 
                                    DirectCopy = script.Clipped, 
                                    Name = "Emote"
                                });
                            end;
                            return;
                        end;
                    end;
                    if v28 then
                        workspace:SetAttribute("FreeMouse", nil);
                        l_RightShoulder_0.C0 = l_C0_0;
                        l_Waist_0.C0 = l_C0_1;
                        l_Neck_0.C0 = l_C0_2;
                        if l_CharacterData_0.Stunned.Value and tick() - v48 > 1 then
                            v49[#v49 + 1] = l_CharacterData_0.Cutscene.Changed:Connect(function() --[[ Line: 258 ]]
                                -- upvalues: v60 (ref)
                                v60();
                            end);
                            v49[#v49 + 1] = l_Occupied_0.Dashing.Changed:Connect(function() --[[ Line: 262 ]]
                                -- upvalues: v60 (ref)
                                v60();
                            end);
                            v49[#v49 + 1] = l_Occupied_0.Punching.Changed:Connect(function() --[[ Line: 266 ]]
                                -- upvalues: v60 (ref)
                                v60();
                            end);
                            v49[#v49 + 1] = l_Occupied_0.Blocking.Changed:Connect(function() --[[ Line: 270 ]]
                                -- upvalues: v60 (ref)
                                v60();
                            end);
                            v49[#v49 + 1] = v17:GetAttributeChangedSignal("MedalSelfie"):Connect(function() --[[ Line: 274 ]]
                                -- upvalues: v60 (ref)
                                v60();
                            end);
                            v66();
                            l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v17, 
                                Parent = v17.PrimaryPart, 
                                DirectCopy = script.Break, 
                                Name = "Emote"
                            });
                            v44 = script.Glass:Clone();
                            v44.Parent = workspace.Debris;
                            task.delay(2.7, function() --[[ Line: 290 ]]
                                -- upvalues: v70 (copy)
                                v70();
                            end);
                            task.wait(10);
                        else
                            v66();
                        end;
                        v70();
                        v60();
                    end;
                    if l_Occupied_0.LockedOn.Value and workspace.CurrentMenu.Value == "" then
                        l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.LockCenter;
                    end;
                    if v32 then
                        v32.Transparency = 0;
                    end;
                    task.delay(3, function() --[[ Line: 312 ]]
                        -- upvalues: v31 (ref), v47 (ref)
                        if v31 then
                            v31:Destroy();
                        end;
                        if v47 then
                            v47:Disconnect();
                        end;
                    end);
                    return;
                end;
            end;
            v17:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v17, 
                Animator = v19
            }).Event:Connect(function() --[[ Line: 329 ]]
                -- upvalues: v71 (copy)
                v71();
            end);
            task.delay(0.2833333333333333, function() --[[ Line: 333 ]]
                -- upvalues: v24 (ref), v45 (ref), v31 (ref), v33 (ref), v17 (copy), v32 (ref), l_EmoteHelper_0 (ref), v28 (copy), v46 (ref), l_TweenService_0 (ref), l_UserInputService_0 (ref), v43 (ref), v16 (copy), v47 (ref), v60 (copy), v71 (copy), v42 (copy), l_RunService_0 (ref), v44 (ref), l_RightShoulder_0 (copy), l_C0_0 (copy), l_Waist_0 (copy), l_C0_1 (copy), l_Neck_0 (copy), l_C0_2 (copy), v2 (ref), l_l_AnimHelper_0_Anim_1 (copy), v25 (copy)
                if v24 then
                    return;
                else
                    v45 = true;
                    v31 = script.RightHand:Clone();
                    v31.Parent = workspace.Debris;
                    v33 = Instance.new("Weld");
                    v33.Parent = v31;
                    v33.Part0 = v31;
                    v33.Part1 = v17.RightHand;
                    local l_Children_0 = v31.Phones:GetChildren();
                    v32 = l_Children_0[math.random(1, #l_Children_0)];
                    v32.Transparency = 0;
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v17, 
                        Name = "Rustle5", 
                        Parent = v17.PrimaryPart, 
                        Volume = 1.5
                    });
                    if v28 then
                        local l_CurrentCamera_0 = workspace.CurrentCamera;
                        workspace.FoVMult.Value = 0;
                        l_CurrentCamera_0.FieldOfView = 40;
                        v46 = l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            FieldOfView = 56
                        });
                        v46:Play();
                        if l_UserInputService_0.TouchEnabled then
                            local _ = not l_UserInputService_0.KeyboardEnabled;
                        end;
                        local l_zero_0 = Vector2.zero;
                        local l_zero_1 = Vector2.zero;
                        local l_zero_2 = Vector2.zero;
                        local function _() --[[ Line: 385 ]] --[[ Name: getInputVector ]]
                            -- upvalues: l_CurrentCamera_0 (copy), l_UserInputService_0 (ref)
                            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
                            local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
                            local v80 = (l_l_UserInputService_0_MouseLocation_0.X - l_ViewportSize_0.X / 2) / (l_ViewportSize_0.X / 2);
                            local v81 = (l_l_UserInputService_0_MouseLocation_0.Y - l_ViewportSize_0.Y / 2) / (l_ViewportSize_0.Y / 2);
                            return Vector2.new(v80, v81);
                        end;
                        if v24 then
                            return;
                        else
                            local v83 = 0;
                            local function _(v84, v85) --[[ Line: 397 ]] --[[ Name: ScaleFrame ]]
                                v84.Size = UDim2.new(v84.Size.X.Scale * v85, 0, v84.Size.Y.Scale * v85, 0);
                            end;
                            workspace:SetAttribute("FreeMouse", true);
                            v43 = script.Recording:Clone();
                            v43.Parent = v16.PlayerGui;
                            if l_UserInputService_0.TouchEnabled and not (l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled) then
                                local l_RightFrame_0 = v43.Main.RightFrame;
                                l_RightFrame_0.Size = UDim2.new(l_RightFrame_0.Size.X.Scale * 1.7, 0, l_RightFrame_0.Size.Y.Scale * 1.7, 0);
                                l_RightFrame_0 = v43.Main.TopFrame;
                                l_RightFrame_0.Size = UDim2.new(l_RightFrame_0.Size.X.Scale * 1.7, 0, l_RightFrame_0.Size.Y.Scale * 1.7, 0);
                            end;
                            v47 = v43.Main.RightFrame.RecordButton.ImageButton.Activated:Connect(function() --[[ Line: 412 ]]
                                -- upvalues: v60 (ref), v71 (ref)
                                local v88 = false;
                                local _ = game:GetService("ReplicatedFirst");
                                local v90;
                                if game:GetService("RunService"):IsClient() then
                                    v90 = shared.BridgeNet2;
                                    if not v90 then
                                        repeat
                                            task.wait();
                                        until shared.BridgeNet2;
                                        v90 = shared.BridgeNet2;
                                        v88 = v90;
                                    else
                                        v88 = true;
                                    end;
                                end;
                                if not v88 then
                                    if not v88 then
                                        v90 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
                                    end;
                                end;
                                v88 = false;
                                v90.ReferenceBridge("ResetEmote"):Fire(":3");
                                v60();
                                v71();
                            end);
                            local function _(v91) --[[ Line: 423 ]] --[[ Name: formatTime ]]
                                local v92 = math.floor(v91 / 3600);
                                local v93 = math.floor(v91 % 3600 / 60);
                                local v94 = v91 % 60;
                                return string.format("%02d:%02d:%02d", v92, v93, v94);
                            end;
                            v17:SetAttribute("MedalSelfie", v42);
                            do
                                local l_l_zero_0_0, l_l_zero_1_0, l_l_zero_2_0, l_v83_0 = l_zero_0, l_zero_1, l_zero_2, v83;
                                l_RunService_0:BindToRenderStep("Selfie" .. v42, Enum.RenderPriority.Camera.Value + 2, function(v100) --[[ Line: 432 ]]
                                    -- upvalues: l_v83_0 (ref), v43 (ref), v24 (ref), l_CurrentCamera_0 (copy), v32 (ref), v44 (ref), l_UserInputService_0 (ref), l_l_zero_0_0 (ref), l_l_zero_1_0 (ref), l_l_zero_2_0 (ref), l_RightShoulder_0 (ref), l_C0_0 (ref), l_Waist_0 (ref), l_C0_1 (ref), l_Neck_0 (ref), l_C0_2 (ref), v31 (ref)
                                    l_v83_0 = l_v83_0 + v100;
                                    if v43 then
                                        local l_TextLabel_0 = v43.Main.TopFrame.TextLabel;
                                        local l_l_v83_0_0 = l_v83_0;
                                        local v103 = math.floor(l_l_v83_0_0 / 3600);
                                        local v104 = math.floor(l_l_v83_0_0 % 3600 / 60);
                                        local v105 = l_l_v83_0_0 % 60;
                                        l_TextLabel_0.Text = string.format("%02d:%02d:%02d", v103, v104, v105);
                                    end;
                                    if v24 then
                                        l_CurrentCamera_0.FieldOfView = 56;
                                        l_CurrentCamera_0.CFrame = v32.CFrame;
                                        if v44 then
                                            v44:SetPrimaryPartCFrame(l_CurrentCamera_0.CFrame * CFrame.new(0, 0, -5) * CFrame.Angles(1.5707963267948966, 0, 0));
                                        end;
                                        return;
                                    else
                                        l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.Default;
                                        local l_ViewportSize_1 = l_CurrentCamera_0.ViewportSize;
                                        local l_l_UserInputService_0_MouseLocation_1 = l_UserInputService_0:GetMouseLocation();
                                        local v108 = (l_l_UserInputService_0_MouseLocation_1.X - l_ViewportSize_1.X / 2) / (l_ViewportSize_1.X / 2);
                                        local v109 = (l_l_UserInputService_0_MouseLocation_1.Y - l_ViewportSize_1.Y / 2) / (l_ViewportSize_1.Y / 2);
                                        l_l_zero_0_0 = Vector2.new(v108, v109);
                                        l_l_zero_0_0 = Vector2.new(math.clamp(l_l_zero_0_0.X, -1, 1), (math.clamp(l_l_zero_0_0.Y, -1, 1)));
                                        l_l_zero_1_0 = l_l_zero_1_0:Lerp(l_l_zero_0_0, 3 * v100);
                                        l_l_zero_2_0 = l_l_zero_2_0:Lerp(l_l_zero_0_0, 1.5 * v100);
                                        local v110 = CFrame.new();
                                        l_ViewportSize_1 = CFrame.new();
                                        if l_l_zero_1_0.Magnitude > 0.01 then
                                            l_l_UserInputService_0_MouseLocation_1 = l_l_zero_1_0.X * 0.3490658503988659;
                                            v108 = -l_l_zero_1_0.Y * 0.17453292519943295;
                                            v110 = CFrame.Angles(v108, l_l_UserInputService_0_MouseLocation_1, 0);
                                        end;
                                        if l_l_zero_2_0.Magnitude > 0.01 then
                                            l_l_UserInputService_0_MouseLocation_1 = l_l_zero_2_0.X * 0.12217304763960307;
                                            l_ViewportSize_1 = CFrame.Angles(0, l_l_UserInputService_0_MouseLocation_1, 0);
                                        end;
                                        l_RightShoulder_0.C0 = l_C0_0 * v110;
                                        l_Waist_0.C0 = l_C0_1 * l_ViewportSize_1;
                                        l_l_UserInputService_0_MouseLocation_1 = l_l_zero_2_0.X * 0.29670597283903605;
                                        v108 = -l_l_zero_2_0.Y * 0.2617993877991494;
                                        if math.abs(l_l_UserInputService_0_MouseLocation_1) > 0.01 or math.abs(v108) > 0.01 then
                                            l_Neck_0.C0 = l_C0_2 * CFrame.Angles(v108, l_l_UserInputService_0_MouseLocation_1, 0);
                                        else
                                            l_Neck_0.C0 = l_C0_2;
                                        end;
                                        l_CurrentCamera_0.CFrame = v31.Camera.CFrame;
                                        return;
                                    end;
                                end);
                                v32.Transparency = 1;
                                local l_Main_1 = v16.PlayerGui:FindFirstChild("Main");
                                local l_Common_1 = v16.PlayerGui:FindFirstChild("Common");
                                l_TweenService_0:Create(l_Main_1.Controls, v2, {
                                    Position = UDim2.new(0, 0, 1, 0)
                                }):Play();
                                l_TweenService_0:Create(l_Main_1.MainFrame, v2, {
                                    Position = UDim2.new(0, 0, -1, 0)
                                }):Play();
                                l_TweenService_0:Create(l_Main_1.LeftFrame, v2, {
                                    Position = UDim2.new(-1, 0, 0, 0)
                                }):Play();
                                l_TweenService_0:Create(l_Main_1.RightFrame, v2, {
                                    Position = UDim2.new(1, 0, 0, 0)
                                }):Play();
                                l_TweenService_0:Create(l_Main_1.HotbarFrame, v2, {
                                    Position = UDim2.new(0, 0, 1, 0)
                                }):Play();
                                l_TweenService_0:Create(l_Main_1.UltimateFrame, v2, {
                                    Position = UDim2.new(0, 0, 1, 0)
                                }):Play();
                                if l_Main_1:FindFirstChild("SpecialFrame") then
                                    l_TweenService_0:Create(l_Main_1.SpecialFrame, v2, {
                                        Position = UDim2.new(0, 0, 1, 0)
                                    }):Play();
                                end;
                                l_TweenService_0:Create(l_Common_1.ServerInfo, v2, {
                                    Position = UDim2.new(0, 0, 1, 0)
                                }):Play();
                            end;
                        end;
                    end;
                    task.wait(0.7166666666666667);
                    if v24 then
                        return;
                    else
                        l_l_AnimHelper_0_Anim_1:AdjustWeight(v25.Weight, 0.016666666666666666);
                        return;
                    end;
                end;
            end);
            return;
        end;
    end;
end;
return v0;