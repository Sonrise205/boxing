local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Vegetable", 
        MainId = 17587923220, 
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
local function _(v9, v10, v11) --[[ Line: 21 ]] --[[ Name: Lerp ]]
    return v9 + (v10 - v9) * v11;
end;
weldAttachments = function(v13, v14) --[[ Line: 23 ]] --[[ Name: weldAttachments ]]
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v13.Parent;
    l_Weld_0.Part1 = v14.Parent;
    l_Weld_0.C0 = v13.CFrame;
    l_Weld_0.C1 = v14.CFrame;
    l_Weld_0.Parent = v13.Parent;
    return l_Weld_0;
end;
local function _(v16, v17, v18, v19, v20, v21) --[[ Line: 33 ]] --[[ Name: buildWeld ]]
    local l_Weld_1 = Instance.new("Weld");
    l_Weld_1.Name = v16;
    l_Weld_1.Part0 = v18;
    l_Weld_1.Part1 = v19;
    l_Weld_1.C0 = v20;
    l_Weld_1.C1 = v21;
    l_Weld_1.Parent = v17;
    return l_Weld_1;
end;
local function v24(v25, v26) --[[ Line: 44 ]] --[[ Name: findFirstMatchingAttachment ]]
    -- upvalues: v24 (copy)
    for _, v28 in pairs(v25:GetChildren()) do
        if v28:IsA("Attachment") and v28.Name == v26 then
            return v28;
        elseif not v28:IsA("Accoutrement") and not v28:IsA("Tool") then
            local v29 = v24(v28, v26);
            if v29 then
                return v29;
            end;
        end;
    end;
end;
addAccoutrement = function(v30, v31) --[[ Line: 57 ]] --[[ Name: addAccoutrement ]]
    -- upvalues: v24 (copy)
    v31.Parent = v30;
    local l_Handle_0 = v31:FindFirstChild("Handle");
    if l_Handle_0 then
        local l_Attachment_0 = l_Handle_0:FindFirstChildOfClass("Attachment");
        if l_Attachment_0 then
            local v34 = v24(v30, l_Attachment_0.Name);
            if v34 then
                weldAttachments(v34, l_Attachment_0);
                return;
            end;
        else
            local l_Head_0 = v30:FindFirstChild("Head");
            if l_Head_0 then
                local v36 = CFrame.new(0, 0.5, 0);
                local l_AttachmentPoint_0 = v31.AttachmentPoint;
                local l_Weld_2 = Instance.new("Weld");
                l_Weld_2.Name = "HeadWeld";
                l_Weld_2.Part0 = l_Head_0;
                l_Weld_2.Part1 = l_Handle_0;
                l_Weld_2.C0 = v36;
                l_Weld_2.C1 = l_AttachmentPoint_0;
                l_Weld_2.Parent = l_Head_0;
            end;
        end;
    end;
end;
v0.Use = function(v39) --[[ Line: 78 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), v1 (copy)
    local v40 = v39:IsA("Player") and v39.Character or v39;
    local v41 = v40 and v40:FindFirstChild("Humanoid");
    local v42 = v41 and (v41:FindFirstChild("Animator") or v41);
    if not v42 then
        return;
    else
        local v43 = workspace.States[v40.Name];
        local l_CharacterData_0 = v43.CharacterData;
        local l_Occupied_0 = v43.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v40, 
            Emote = v0
        }) then
            return;
        else
            local v46 = {};
            local v47 = false;
            local v48 = {
                Name = "Emote", 
                FadeIn = 0.25, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v42
            };
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v40_Attribute_0 = v40:GetAttribute("Owner");
            local v51 = true;
            if v40 ~= l_Character_0 then
                v51 = l_v40_Attribute_0 and l_v40_Attribute_0 == l_Character_0.Name;
            end;
            if not v51 then
                v48.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v48);
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v48.FadeIn, v48.Weight, v48.Speed);
            task.delay(0.16666666666666666, function() --[[ Line: 121 ]]
                -- upvalues: l_EmoteHelper_0 (ref), v40 (copy), v47 (ref)
                l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v40, 
                    Name = "Rustle3", 
                    Parent = v40.PrimaryPart, 
                    Speed = 0.9
                });
                task.wait(1.4166666666666667);
                if v47 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v40, 
                        Name = "Rustle5", 
                        Parent = v40.PrimaryPart, 
                        Speed = 0.8
                    });
                    return;
                end;
            end);
            local v53 = nil;
            task.delay(0.16666666666666666, function() --[[ Line: 141 ]]
                -- upvalues: v47 (ref), v53 (ref), l_EmoteHelper_0 (ref), v40 (copy), v48 (copy)
                if v47 then
                    return;
                else
                    v53 = l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v40, 
                        Looped = v48.Looped, 
                        Parent = v40.PrimaryPart, 
                        DirectCopy = script.Song, 
                        Name = "Emote", 
                        ShouldWeld = true
                    });
                    return;
                end;
            end);
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Parent = v40;
            l_Folder_0.Name = "OldOutfit";
            local v55 = {};
            local v56 = {};
            local l_Outfit_0 = script.Outfit;
            for _, v59 in v40:GetChildren() do
                if v59:IsA("Accessory") then
                    for _, v61 in v59:GetDescendants() do
                        if v61:IsA("BasePart") then
                            v61.LocalTransparencyModifier = 1;
                            if v61.Transparency == 0 then
                                v61.Transparency = 1;
                            end;
                        end;
                    end;
                elseif v59:IsA("Shirt") or v59:IsA("Pants") or v59:IsA("BodyColors") then
                    v59.Parent = l_Folder_0;
                end;
                if v59:IsA("BasePart") then
                    local v62 = script.Effects.Smoke:Clone();
                    v62.Parent = v59;
                    v62:Emit(2);
                    table.insert(v55, v62);
                    local v63 = script.Effects.Smoke2:Clone();
                    v63.Parent = v59;
                    v63:Emit(1);
                    table.insert(v55, v63);
                end;
                if v59:IsA("Model") then
                    for _, v65 in v59:GetDescendants() do
                        if v65:IsA("Pants") then
                            v56[v65] = v65.PantsTemplate;
                            v65.PantsTemplate = l_Outfit_0.Pants.PantsTemplate;
                        elseif v65:IsA("Shirt") then
                            v56[v65] = v65.ShirtTemplate;
                            v65.ShirtTemplate = l_Outfit_0.Shirt.ShirtTemplate;
                        end;
                    end;
                end;
            end;
            v40.Head.LocalTransparencyModifier = 1;
            for _, v67 in v40.Head:GetChildren() do
                if v67:IsA("Decal") then
                    v67.LocalTransparencyModifier = 1;
                end;
            end;
            local v68 = {};
            for _, v70 in l_Outfit_0:GetChildren() do
                local v71 = v70:Clone();
                v71.Parent = v40;
                if v71:IsA("Accessory") then
                    addAccoutrement(v40, v71);
                end;
                table.insert(v68, v71);
            end;
            local v72 = script.Microphone:Clone();
            v72.Parent = v40;
            local l_Weld_3 = Instance.new("Weld");
            l_Weld_3.Parent = v72;
            l_Weld_3.Part0 = v72;
            l_Weld_3.Part1 = v40.LeftHand;
            l_Weld_3.C0 = CFrame.new(0, 0, 0.35) * CFrame.Angles(1.5707963267948966, 0, 0);
            local function v93() --[[ Line: 232 ]] --[[ Name: Cleanup ]]
                -- upvalues: v47 (ref), v46 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v39 (copy), v51 (copy), l_Occupied_0 (copy), v40 (copy), v0 (ref), v68 (copy), l_Folder_0 (copy), l_Weld_3 (copy), v72 (copy), v55 (copy), v56 (copy), l_TweenService_0 (ref), v53 (ref), v1 (ref)
                if v47 then
                    return;
                else
                    v47 = true;
                    for _, v75 in v46 do
                        v75:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v39);
                    if v51 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v40:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v40:SetAttribute("CurrentEmote", nil);
                    end;
                    for _, v77 in v68 do
                        v77:Destroy();
                    end;
                    for _, v79 in l_Folder_0:GetChildren() do
                        v79.Parent = v40;
                    end;
                    v40.Head.LocalTransparencyModifier = 0;
                    for _, v81 in v40.Head:GetChildren() do
                        if v81:IsA("Decal") then
                            v81.LocalTransparencyModifier = 0;
                        end;
                    end;
                    if l_Weld_3 then
                        l_Weld_3:Destroy();
                    end;
                    v72.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 3, math.random(10, 30) * 2.5, math.random(-10, 10) * 3);
                    v72.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                    task.delay(3, function() --[[ Line: 273 ]]
                        -- upvalues: v72 (ref)
                        if v72 then
                            v72:Destroy();
                        end;
                    end);
                    local _ = l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v40, 
                        Parent = v40.PrimaryPart, 
                        Name = "Fling", 
                        Speed = math.random(0.9, 1.1)
                    });
                    for _, v84 in v40:GetChildren() do
                        if v84:IsA("BasePart") then
                            local v85 = script.Effects.Smoke:Clone();
                            v85.Parent = v84;
                            v85:Emit(2);
                            table.insert(v55, v85);
                            local v86 = script.Effects.Smoke2:Clone();
                            v86.Parent = v84;
                            v86:Emit(1);
                            table.insert(v55, v86);
                        end;
                        if v84:IsA("Model") then
                            for _, v88 in v84:GetDescendants() do
                                if v88:IsA("Pants") or v88:IsA("Shirt") then
                                    v88.PantsTemplate = v56[v88];
                                end;
                            end;
                        end;
                        if v84:IsA("Accessory") then
                            for _, v90 in v84:GetDescendants() do
                                if v90:IsA("BasePart") then
                                    v90.LocalTransparencyModifier = 0;
                                    if v90.Transparency == 1 then
                                        v90.Transparency = 0;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if l_Folder_0 then
                        l_Folder_0:Destroy();
                    end;
                    l_TweenService_0:Create(v53, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(3, function() --[[ Line: 322 ]]
                        -- upvalues: v55 (ref)
                        for _, v92 in v55 do
                            v92:Destroy();
                        end;
                    end);
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v39, 30);
            v40:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 1;
            l_Occupied_0.LerpMult.Value = 1;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v40, 
                Animator = v42
            }).Event:Connect(function() --[[ Line: 341 ]]
                -- upvalues: v93 (copy)
                v93();
            end);
            task.wait(9.25);
            if v47 then
                return;
            else
                v93();
                return;
            end;
        end;
    end;
end;
return v0;