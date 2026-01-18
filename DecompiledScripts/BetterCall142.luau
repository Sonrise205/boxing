local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Better Call", 
        MainId = 15582398415, 
        LoopId = 15582401530, 
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
local function _(v9, v10, v11) --[[ Line: 22 ]] --[[ Name: Lerp ]]
    return v9 + (v10 - v9) * v11;
end;
weldAttachments = function(v13, v14) --[[ Line: 24 ]] --[[ Name: weldAttachments ]]
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v13.Parent;
    l_Weld_0.Part1 = v14.Parent;
    l_Weld_0.C0 = v13.CFrame;
    l_Weld_0.C1 = v14.CFrame;
    l_Weld_0.Parent = v13.Parent;
    return l_Weld_0;
end;
local function _(v16, v17, v18, v19, v20, v21) --[[ Line: 34 ]] --[[ Name: buildWeld ]]
    local l_Weld_1 = Instance.new("Weld");
    l_Weld_1.Name = v16;
    l_Weld_1.Part0 = v18;
    l_Weld_1.Part1 = v19;
    l_Weld_1.C0 = v20;
    l_Weld_1.C1 = v21;
    l_Weld_1.Parent = v17;
    return l_Weld_1;
end;
local function v24(v25, v26) --[[ Line: 45 ]] --[[ Name: findFirstMatchingAttachment ]]
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
addAccoutrement = function(v30, v31) --[[ Line: 58 ]] --[[ Name: addAccoutrement ]]
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
v0.Use = function(v39) --[[ Line: 79 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), v1 (copy)
    local v40 = v39:IsA("Player") and v39.Character or v39;
    local v41 = v40 and v40:FindFirstChild("Humanoid");
    local v42 = v41 and (v41:FindFirstChild("Animator") or v41);
    if not v42 then
        return;
    else
        local v43 = true;
        if v40.Name ~= "Father Bringus" then
            v43 = v40:GetAttribute("QuestName");
        end;
        local v44 = workspace.States[v40.Name];
        local l_CharacterData_0 = v44.CharacterData;
        local l_Occupied_0 = v44.Occupied;
        if not l_EmoteHelper_0.CanContinue({
            CharacterData = l_CharacterData_0, 
            Character = v40, 
            Emote = v0
        }) then
            return;
        else
            local v47 = {};
            local v48 = false;
            local v49 = {
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
            local v52 = true;
            if v40 ~= l_Character_0 then
                v52 = l_v40_Attribute_0 and l_v40_Attribute_0 == l_Character_0.Name;
            end;
            if not v52 then
                v49.Priority = Enum.AnimationPriority.Action;
            end;
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v49);
            v49.AnimId = v0.Metadata.LoopId;
            v49.Looped = true;
            local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v49);
            l_l_AnimHelper_0_Anim_1:Stop(0.01);
            if not v43 then
                l_l_AnimHelper_0_Anim_1:Play(v49.FadeIn, 0.1, v49.Speed);
            end;
            l_l_AnimHelper_0_Anim_0:Stop(0.01);
            l_l_AnimHelper_0_Anim_0:Play(v49.FadeIn, v49.Weight, v49.Speed);
            task.delay(0.16666666666666666, function() --[[ Line: 135 ]]
                -- upvalues: l_EmoteHelper_0 (ref), v40 (copy), v48 (ref), v43 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v49 (copy)
                l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v40, 
                    Name = "Rustle3", 
                    Parent = v40.PrimaryPart, 
                    Speed = 0.9
                });
                task.wait(1.4166666666666667);
                if v48 then
                    return;
                else
                    l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v40, 
                        Name = "Rustle5", 
                        Parent = v40.PrimaryPart, 
                        Speed = 0.8
                    });
                    if v43 then
                        l_l_AnimHelper_0_Anim_0:Stop(1);
                    end;
                    task.wait(0.8333333333333334);
                    if v48 then
                        return;
                    else
                        l_l_AnimHelper_0_Anim_1:AdjustWeight(v49.Weight);
                        return;
                    end;
                end;
            end);
            local v55 = nil;
            if not v43 then
                v55 = l_EmoteHelper_0:PlaySound({
                    SourceCharacter = v40, 
                    Looped = v49.Looped, 
                    Parent = v40.PrimaryPart, 
                    DirectCopy = script.Song, 
                    Name = "Emote", 
                    ShouldWeld = true
                });
            end;
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Parent = v40;
            l_Folder_0.Name = "OldOutfit";
            local v57 = {};
            local v58 = {};
            local v59 = {};
            local l_Outfit_0 = script.Outfit;
            if not v43 then
                for _, v62 in v40:GetChildren() do
                    if v62:IsA("Accessory") then
                        for _, v64 in v62:GetDescendants() do
                            if v64:IsA("ParticleEmitter") then
                                v64.Enabled = false;
                            end;
                            if v64:IsA("BasePart") then
                                v64.LocalTransparencyModifier = 1;
                                if v64.Transparency == 0 then
                                    v64.Transparency = 1;
                                end;
                            end;
                        end;
                    elseif v62:IsA("Shirt") or v62:IsA("Pants") then
                        v62.Parent = l_Folder_0;
                    end;
                    if v62:IsA("BasePart") then
                        local v65 = script.Effects.Smoke:Clone();
                        v65.Parent = v62;
                        v65:Emit(2);
                        table.insert(v58, v65);
                        local v66 = script.Effects.Smoke2:Clone();
                        v66.Parent = v62;
                        v66:Emit(1);
                        table.insert(v58, v66);
                    end;
                    if v62:IsA("Model") then
                        for _, v68 in v62:GetDescendants() do
                            if v68:IsA("Pants") then
                                v59[v68] = v68.PantsTemplate;
                                v68.PantsTemplate = l_Outfit_0.Pants.PantsTemplate;
                            elseif v68:IsA("Shirt") then
                                v59[v68] = v68.ShirtTemplate;
                                v68.ShirtTemplate = l_Outfit_0.Pants.ShirtTemplate;
                            end;
                        end;
                    end;
                end;
                for _, v70 in l_Outfit_0:GetChildren() do
                    local v71 = v70:Clone();
                    v71.Parent = v40;
                    if v71:IsA("Accessory") then
                        addAccoutrement(v40, v71);
                    end;
                    table.insert(v57, v71);
                end;
            end;
            local function v88() --[[ Line: 241 ]] --[[ Name: Cleanup ]]
                -- upvalues: v48 (ref), v47 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_EmoteHelper_0 (ref), v39 (copy), v52 (copy), l_Occupied_0 (copy), v40 (copy), v0 (ref), v57 (copy), l_Folder_0 (copy), v58 (copy), v59 (copy), v55 (ref), l_TweenService_0 (ref), v1 (ref)
                if v48 then
                    return;
                else
                    v48 = true;
                    for _, v73 in v47 do
                        v73:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_1.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_l_AnimHelper_0_Anim_1:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v39);
                    if v52 then
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v40:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v40:SetAttribute("CurrentEmote", nil);
                    end;
                    for _, v75 in v57 do
                        v75:Destroy();
                    end;
                    for _, v77 in l_Folder_0:GetChildren() do
                        v77.Parent = v40;
                    end;
                    for _, v79 in v40:GetChildren() do
                        if v79:IsA("BasePart") then
                            local v80 = script.Effects.Smoke:Clone();
                            v80.Parent = v79;
                            v80:Emit(2);
                            table.insert(v58, v80);
                            local v81 = script.Effects.Smoke2:Clone();
                            v81.Parent = v79;
                            v81:Emit(1);
                            table.insert(v58, v81);
                        end;
                        if v79:IsA("Model") then
                            for _, v83 in v79:GetDescendants() do
                                if v83:IsA("Pants") or v83:IsA("Shirt") then
                                    v83.PantsTemplate = v59[v83];
                                end;
                            end;
                        end;
                        if v79:IsA("Accessory") then
                            for _, v85 in v79:GetDescendants() do
                                if v85:IsA("BasePart") then
                                    v85.LocalTransparencyModifier = 0;
                                    if v85.Transparency == 1 then
                                        v85.Transparency = 0;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if l_Folder_0 then
                        l_Folder_0:Destroy();
                    end;
                    if v55 then
                        l_TweenService_0:Create(v55, v1, {
                            Volume = 0
                        }):Play();
                    end;
                    task.delay(4, function() --[[ Line: 311 ]]
                        -- upvalues: v55 (ref), v58 (ref)
                        if v55 then
                            v55.Parent:Destroy();
                        end;
                        for _, v87 in v58 do
                            v87:Destroy();
                        end;
                    end);
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v39, 30);
            v40:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 0.97;
            l_Occupied_0.LerpMult.Value = 0.99;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v40, 
                Animator = v42
            }).Event:Connect(function() --[[ Line: 332 ]]
                -- upvalues: v88 (copy)
                v88();
            end);
            task.wait(180);
            v88();
            return;
        end;
    end;
end;
return v0;