local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Virtual Insanity", 
        MainId = 15569973306, 
        LoopId = 15569981501, 
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
v0.Use = function(v9) --[[ Line: 23 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), v1 (copy)
    local v10 = v9:IsA("Player") and v9.Character or v9;
    local v11 = v10 and v10:FindFirstChild("Humanoid");
    local v12 = v11 and (v11:FindFirstChild("Animator") or v11);
    if not v12 then
        return;
    else
        local v13 = workspace.States[v10.Name];
        local l_CharacterData_0 = v13.CharacterData;
        local l_Occupied_0 = v13.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v10, 
            Emote = v0
        }) then
            return;
        else
            local v16 = {};
            local v17 = false;
            local v18 = {};
            for _, v20 in v10:GetChildren() do
                if v20:IsA("Accessory") and (v20.AccessoryType == Enum.AccessoryType.Hat or v20.AccessoryType == Enum.AccessoryType.Hair) then
                    for _, v22 in v20:GetChildren() do
                        if v22:IsA("BasePart") then
                            v22.LocalTransparencyModifier = 1;
                            if v22.Transparency == 0 then
                                v22.Transparency = 1;
                            end;
                            table.insert(v18, v22);
                        end;
                    end;
                end;
            end;
            local v23 = script.Hat:Clone();
            v23.Parent = v10;
            local l_Weld_0 = Instance.new("Weld");
            l_Weld_0.Parent = v23;
            l_Weld_0.Part0 = v23;
            l_Weld_0.Part1 = v10.Head;
            l_Weld_0.C0 = CFrame.new(0, -1, 0);
            local v25 = {
                Name = "Emote", 
                FadeIn = 0.25, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v12
            };
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v10_Attribute_0 = v10:GetAttribute("Owner");
            local v28 = true;
            if v10 ~= l_Character_0 then
                v28 = l_v10_Attribute_0 and l_v10_Attribute_0 == l_Character_0.Name;
            end;
            if not v28 then
                v25.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v25);
            v25.AnimId = v0.Metadata.LoopId;
            v25.Looped = true;
            local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v25);
            l_l_AnimHelper_0_Anim_1:Stop(0.01);
            l_l_AnimHelper_0_Anim_1:Play(v25.FadeIn, 0.1, v25.Speed);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v25.FadeIn, v25.Weight, v25.Speed);
            task.delay(6.666666666666667, function() --[[ Line: 101 ]]
                -- upvalues: v17 (ref), l_l_AnimHelper_0_Anim_1 (copy), v25 (copy)
                if v17 then
                    return;
                else
                    l_l_AnimHelper_0_Anim_1:AdjustWeight(v25.Weight);
                    return;
                end;
            end);
            l_EmoteHelper_0:PlaySound({
                SourceCharacter = v10, 
                Name = "Rustle1", 
                Parent = v10.PrimaryPart
            });
            task.delay(1.25, function() --[[ Line: 112 ]]
                -- upvalues: v17 (ref), l_EmoteHelper_0 (ref), v10 (copy)
                if v17 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v10, 
                        Name = "Rustle3", 
                        Parent = v10.PrimaryPart
                    });
                    task.wait(3.8333333333333335);
                    if v17 then
                        return;
                    else
                        l_EmoteHelper_0:PlaySound({
                            SourceCharacter = v10, 
                            Name = "Rustle2", 
                            Volume = 0.15, 
                            Parent = v10.PrimaryPart
                        });
                        return;
                    end;
                end;
            end);
            local v31 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v10, 
                Looped = v25.Looped, 
                Parent = v10.PrimaryPart, 
                DirectCopy = script.Song, 
                Name = "Emote", 
                ShouldWeld = true
            });
            local function v37() --[[ Line: 140 ]] --[[ Name: Cleanup ]]
                -- upvalues: v17 (ref), v16 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_EmoteHelper_0 (ref), v9 (copy), v28 (copy), l_Occupied_0 (copy), v10 (copy), v0 (ref), v18 (copy), l_Weld_0 (copy), v23 (copy), l_TweenService_0 (ref), v31 (copy), v1 (ref)
                if v17 then
                    return;
                else
                    v17 = true;
                    for _, v33 in v16 do
                        v33:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_1.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_l_AnimHelper_0_Anim_1:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v9);
                    if v28 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v10:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v10:SetAttribute("CurrentEmote", nil);
                    end;
                    for _, v35 in v18 do
                        v35.LocalTransparencyModifier = 0;
                        if v35.Transparency == 1 then
                            v35.Transparency = 0;
                        end;
                    end;
                    l_Weld_0:Destroy();
                    v23.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 1.5, math.random(10, 30) * 1.5, math.random(-10, 10) * 1.5);
                    v23.AssemblyAngularVelocity = Vector3.new(math.random(-15, 15), math.random(-15, 15), math.random(-15, 15));
                    l_TweenService_0:Create(v31, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(2, function() --[[ Line: 177 ]]
                        -- upvalues: v31 (ref), v23 (ref)
                        v31.Parent:Destroy();
                        v23:Destroy();
                    end);
                    local _ = l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v10, 
                        Parent = v10.PrimaryPart, 
                        Name = "Fling", 
                        Speed = math.random(0.9, 1.1)
                    });
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v9, 30);
            v10:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 0.9;
            l_Occupied_0.LerpMult.Value = 0.8;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v10, 
                Animator = v12
            }).Event:Connect(function() --[[ Line: 202 ]]
                -- upvalues: v37 (copy)
                v37();
            end);
            task.wait(180);
            v37();
            return;
        end;
    end;
end;
return v0;