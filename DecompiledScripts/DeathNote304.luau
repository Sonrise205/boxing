local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Death Note", 
        Toxicity = 1, 
        MainId = 15839006721, 
        BookId = 15839205398, 
        Rarity = "Mythic"
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
local function _(v9, v10, v11) --[[ Line: 25 ]] --[[ Name: Lerp ]]
    return v9 + (v10 - v9) * v11;
end;
v0.Use = function(v13) --[[ Line: 27 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), v1 (copy)
    local v14 = v13:IsA("Player") and v13.Character or v13;
    local v15 = v14 and v14:FindFirstChild("Humanoid");
    local v16 = v15 and (v15:FindFirstChild("Animator") or v15);
    if not v16 then
        return;
    else
        local v17 = workspace.States[v14.Name];
        local l_CharacterData_0 = v17.CharacterData;
        local l_Occupied_0 = v17.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v14, 
            Emote = v0
        }) then
            return;
        else
            local v20 = {};
            local v21 = false;
            local v22 = {
                Name = "Emote", 
                FadeIn = 0.2, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v16
            };
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v14_Attribute_0 = v14:GetAttribute("Owner");
            local v25 = true;
            if v14 ~= l_Character_0 then
                v25 = l_v14_Attribute_0 and l_v14_Attribute_0 == l_Character_0.Name;
            end;
            if not v25 then
                v22.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v22);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v22.FadeIn, v22.Weight, v22.Speed);
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Position = Vector3.new(-0.7699999809265137, 2.25, -0.7200000286102295, 0);
            l_Part_0.Orientation = Vector3.new(-49, 160, -17, 0);
            local v28 = script.Book:Clone();
            v28.Parent = workspace.Debris;
            v28.RootPart.CFrame = v14.PrimaryPart.CFrame;
            for _, v30 in v28:GetChildren() do
                if v30:IsA("BasePart") then
                    v30.LocalTransparencyModifier = 1;
                end;
            end;
            local l_Weld_0 = Instance.new("Weld");
            l_Weld_0.Parent = v28;
            l_Weld_0.Part0 = v28.RootPart;
            l_Weld_0.Part1 = v14.RightHand;
            l_Weld_0.C0 = l_Part_0.CFrame;
            local v32 = {
                Name = "Emote", 
                FadeIn = 0.2, 
                Weight = 1, 
                Speed = v22.Speed, 
                AnimId = v0.Metadata.BookId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v28.AnimationController.Animator
            };
            local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v32);
            local v34 = script.Pencil:Clone();
            v34.Parent = game.Workspace.Debris;
            l_Part_0.Position = Vector3.new(-0.550000011920929, -0.12999999523162842, 0.05000000074505806, 0);
            l_Part_0.Orientation = Vector3.new(-70, 180, 180, 0);
            local l_Weld_1 = Instance.new("Weld");
            l_Weld_1.Parent = v34;
            l_Weld_1.Part0 = v34;
            l_Weld_1.Part1 = v14.LeftHand;
            l_Weld_1.C0 = l_Part_0.CFrame;
            l_Part_0:Destroy();
            task.delay(2.5, function() --[[ Line: 116 ]]
                -- upvalues: v21 (ref), v28 (copy), v34 (copy)
                if v21 then
                    return;
                else
                    if v28 then
                        v28:Destroy();
                    end;
                    if v34 then
                        v34:Destroy();
                    end;
                    return;
                end;
            end);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v14, 
                Name = "Rustle1", 
                Parent = v14.PrimaryPart, 
                Volume = 0.4
            });
            local v36 = nil;
            task.delay(0.13333333333333333, function() --[[ Line: 131 ]]
                -- upvalues: l_EmoteHelper_0 (ref), v14 (copy), v28 (copy), v21 (ref), v36 (ref)
                l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v14, 
                    Parent = v14.PrimaryPart, 
                    DirectCopy = script.Page, 
                    Name = "Emote", 
                    ShouldWeld = true
                });
                for _, v38 in v28:GetChildren() do
                    if v38:IsA("BasePart") then
                        v38.LocalTransparencyModifier = 0;
                    end;
                end;
                task.wait(0.3);
                if v21 then
                    return;
                else
                    v36 = l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v14, 
                        Parent = v14.PrimaryPart, 
                        DirectCopy = script.Scribble, 
                        Name = "Emote", 
                        ShouldWeld = true
                    });
                    task.wait(1.4);
                    if v21 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v14, 
                            Parent = v14.PrimaryPart, 
                            DirectCopy = script.Close, 
                            Name = "Emote", 
                            ShouldWeld = true
                        });
                        local v39 = script.Effects.Close:Clone();
                        v39.Parent = v14.RightLowerArm;
                        for _, v41 in v39:GetChildren() do
                            v41:Emit(3);
                        end;
                        task.delay(2, function() --[[ Line: 174 ]]
                            -- upvalues: v39 (copy)
                            v39:Destroy();
                        end);
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v14, 
                            Parent = v14.PrimaryPart, 
                            DirectCopy = script.Spooky, 
                            Name = "Emote", 
                            ShouldWeld = true
                        });
                        task.wait(0.4666666666666667);
                        if v21 then
                            return;
                        else
                            l_EmoteHelper_0:PlaySound({
                                SourceCharacter = v14, 
                                Name = "Rustle4", 
                                Parent = v14.PrimaryPart, 
                                Volume = 0.45
                            });
                            return;
                        end;
                    end;
                end;
            end);
            local function v45() --[[ Line: 197 ]] --[[ Name: Cleanup ]]
                -- upvalues: v21 (ref), v20 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_EmoteHelper_0 (ref), v13 (copy), v25 (copy), l_Occupied_0 (copy), v14 (copy), v0 (ref), v28 (copy), l_Weld_0 (copy), v36 (ref), l_TweenService_0 (ref), v1 (ref), v34 (copy), l_Weld_1 (copy)
                if v21 then
                    return;
                else
                    v21 = true;
                    for _, v43 in v20 do
                        v43:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_l_AnimHelper_0_Anim_1.Looped = false;
                    l_l_AnimHelper_0_Anim_1:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v13);
                    if v25 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v14:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v14:SetAttribute("CurrentEmote", nil);
                    end;
                    if v28 and v28.PrimaryPart then
                        if l_Weld_0 then
                            l_Weld_0:Destroy();
                        end;
                        v28.PrimaryPart.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 3, math.random(10, 30) * 2.5, math.random(-10, 10) * 3);
                        v28.PrimaryPart.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                        local _ = l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v14, 
                            Parent = v14.PrimaryPart, 
                            Name = "Fling", 
                            Speed = math.random(0.9, 1.1)
                        });
                    end;
                    if v36 then
                        l_TweenService_0:Create(v36, v1, {
                            Volume = 0
                        }):Play();
                        task.delay(1, function() --[[ Line: 237 ]]
                            -- upvalues: v36 (ref)
                            if v36 and v36.Parent then
                                v36.Parent:Destroy();
                            end;
                        end);
                    end;
                    if v34 then
                        if l_Weld_1 then
                            l_Weld_1:Destroy();
                        end;
                        v34.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 3, math.random(10, 30) * 2.5, math.random(-10, 10) * 3);
                        v34.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                    end;
                    return;
                end;
            end;
            v14:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v14, 
                Animator = v16
            }).Event:Connect(function() --[[ Line: 260 ]]
                -- upvalues: v45 (copy)
                v45();
            end);
            task.wait(2.5833333333333335);
            if v21 then
                return;
            else
                l_l_AnimHelper_0_Anim_0:Stop(0.5);
                task.wait(0.5);
                v45();
                return;
            end;
        end;
    end;
end;
return v0;