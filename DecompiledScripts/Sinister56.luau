local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Sinister", 
        MainId = 140614441999559, 
        Rarity = "Rare"
    }
};
local v1 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local v9 = nil;
local v10 = nil;
local function _(v11, v12, v13) --[[ Line: 23 ]] --[[ Name: Lerp ]]
    return v11 + (v12 - v11) * v13;
end;
v0.Use = function(v15) --[[ Line: 25 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), v9 (ref), l_Modules_0 (copy), v10 (ref), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), v1 (copy)
    local v16 = v15:IsA("Player") and v15.Character or v15;
    local v17 = v16 and v16:FindFirstChild("Humanoid");
    local v18 = v17 and (v17:FindFirstChild("Animator") or v17);
    if not v18 then
        return;
    else
        local v19 = workspace.States[v16.Name];
        local l_CharacterData_0 = v19.CharacterData;
        local l_Occupied_0 = v19.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v16, 
            Emote = v0
        }) then
            return;
        else
            if not v9 then
                v9 = require(l_Modules_0.Cutscene:WaitForChild("Utilities"));
            end;
            if not v10 then
                v10 = require(l_Modules_0:WaitForChild("EffectHelper"));
            end;
            local v22 = v10.GetWeldCharacter(v16);
            local v23 = {};
            local v24 = false;
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v16_Attribute_0 = v16:GetAttribute("Owner");
            local v27 = true;
            if v16 ~= l_Character_0 then
                v27 = l_v16_Attribute_0 and l_v16_Attribute_0 == l_Character_0.Name;
            end;
            local v28 = {
                Name = "Emote", 
                FadeIn = 0.25, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.StartId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v18
            };
            if not v27 then
                v28.Priority = Enum.AnimationPriority.Action;
            end;
            v28.AnimId = v0.Metadata.MainId;
            v28.Looped = true;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v28);
            l_l_AnimHelper_0_Anim_0:Play(v28.FadeIn, v28.Weight, v28.Speed);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v16, 
                Name = "Rustle2", 
                Parent = v16.PrimaryPart
            });
            local v30 = nil;
            local v31 = 0;
            local v32 = nil;
            local v33 = false;
            for _, v35 in workspace.Live:GetChildren() do
                if v35 ~= v16 and v35.PrimaryPart and (v16.PrimaryPart.Position - v35.PrimaryPart.Position).Magnitude <= 30 and v35:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                    v33 = true;
                    local v36 = v35 and v35:FindFirstChild("Humanoid");
                    local v37 = v36 and (v36:FindFirstChild("Animator") or v36);
                    if v37 then
                        local l_v37_PlayingAnimationTracks_0 = v37:GetPlayingAnimationTracks();
                        local v39 = false;
                        for _, v41 in l_v37_PlayingAnimationTracks_0 do
                            if v41.Name == "Emote" then
                                l_l_AnimHelper_0_Anim_0.TimePosition = v41.TimePosition;
                                v41.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
                                for _, v43 in game.Workspace.Debris:GetChildren() do
                                    if v43.Name == script.Name then
                                        v32 = v43:FindFirstChildWhichIsA("Sound");
                                        if v32 then
                                            v31 = v32.TimePosition;
                                        end;
                                    end;
                                end;
                                v39 = true;
                                break;
                            end;
                        end;
                        if v39 then
                            break;
                        end;
                    end;
                end;
            end;
            if v27 then
                for _, v45 in game.Workspace.Debris:GetChildren() do
                    if v45.Name == script.Name then
                        v32 = v45:FindFirstChildWhichIsA("Sound");
                        if v32 then
                            v32.Volume = 0;
                        end;
                    end;
                end;
            end;
            v30 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v16, 
                Looped = v28.Looped, 
                Parent = v16.PrimaryPart, 
                DirectCopy = script.Song, 
                Name = "Emote", 
                ShouldWeld = true
            });
            v30.TimePosition = 8;
            local v46 = true;
            if l_Character_0:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                v46 = false;
            end;
            local v47 = script.Tongue:Clone();
            v47.Parent = v22;
            local v48 = script.HeadTongue:Clone();
            v48.Parent = v22;
            v48.Part0 = v47;
            v48.Part1 = v16.Head;
            if v16.Head.MeshId == "https://assetdelivery.roblox.com/v1/asset/?id=16673245747" then
                v48.C1 = CFrame.new(0, 0.2, -0.584) * CFrame.Angles(0, -1.5707963267948966, 0);
            end;
            local v49 = {};
            for _, v51 in (script.Aura:GetChildren()) do
                local v52 = v51:Clone();
                v52.Parent = v22:FindFirstChild("HumanoidRootPart") or v16.HumanoidRootPart;
                table.insert(v49, v52);
            end;
            local v53 = script.PowerUp:Clone();
            v53.Parent = workspace.Debris;
            v53.Position = v16.HumanoidRootPart.Position + Vector3.new(0, -2.200000047683716, 0, 0);
            table.insert(v49, v53);
            task.spawn(function() --[[ Line: 194 ]]
                -- upvalues: v24 (ref), v16 (copy), v9 (ref), l_TweenService_0 (ref)
                while not v24 do
                    local v54 = script.WindMesh:Clone();
                    v54.Parent = workspace.Debris;
                    v54.Position = v16.HumanoidRootPart.Position;
                    v54.CFrame = v54.CFrame * CFrame.Angles(math.rad((math.random(-20, 20))), math.rad((math.random(-360, 360))), 0) + Vector3.new(0, -2.700000047683716, 0, 0);
                    v9.PlayFlipbook(v54, script.ModuleScript, 0.5);
                    l_TweenService_0:Create(v54.Mesh, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Scale = Vector3.new(-30, -2, -30, 0)
                    }):Play();
                    l_TweenService_0:Create(v54.Decal, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Color3 = Color3.new(0, 0, 0)
                    }):Play();
                    game.Debris:AddItem(v54, 1);
                    task.wait(0.15);
                end;
            end);
            task.delay(0.25, function() --[[ Line: 219 ]]
                -- upvalues: v24 (ref), v46 (ref), v32 (ref), v30 (ref), v31 (ref), l_EmoteHelper_0 (ref), v15 (copy)
                if v24 then
                    return;
                elseif not v46 then
                    return;
                elseif v32 then
                    v30.Volume = script.Song.Volume;
                    return;
                else
                    v30.TimePosition = v31;
                    l_EmoteHelper_0.CreateCharacterMuteZone(v15, 30);
                    return;
                end;
            end);
            local function v61() --[[ Line: 232 ]] --[[ Name: Cleanup ]]
                -- upvalues: v24 (ref), v23 (copy), v49 (copy), v47 (copy), v48 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v15 (copy), v27 (copy), l_CharacterData_0 (copy), l_Occupied_0 (copy), v16 (copy), v0 (ref), v32 (ref), l_TweenService_0 (ref), v30 (ref), v1 (ref)
                if v24 then
                    return;
                else
                    v24 = true;
                    for _, v56 in v23 do
                        v56:Disconnect();
                    end;
                    for _, v58 in v49 do
                        v58:Destroy();
                    end;
                    if v47 then
                        v47:Destroy();
                    end;
                    if v48 then
                        v48:Destroy();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v15);
                    if v27 then
                        l_CharacterData_0.Toxic.Value = false;
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v16:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v16:SetAttribute("CurrentEmote", nil);
                    end;
                    if v27 then
                        for _, v60 in game.Workspace.Debris:GetChildren() do
                            if v60.Name == script.Name then
                                v32 = v60:FindFirstChildWhichIsA("Sound");
                                if v32 then
                                    v32.Volume = script.Song.Volume;
                                end;
                            end;
                        end;
                    end;
                    l_TweenService_0:Create(v30, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(3, function() --[[ Line: 280 ]]
                        -- upvalues: v30 (ref)
                        v30.Parent:Destroy();
                    end);
                    return;
                end;
            end;
            v16:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v16, 
                Animator = v18
            }).Event:Connect(function() --[[ Line: 296 ]]
                -- upvalues: v61 (copy)
                v61();
            end);
            task.wait(180);
            v61();
            return;
        end;
    end;
end;
return v0;