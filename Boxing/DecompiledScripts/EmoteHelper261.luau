local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("CollectionService");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local l_UseDualEmote_0 = l_ReplicatedStorage_0:WaitForChild("UnreliableRemoteEvents"):WaitForChild("UseDualEmote");
local function _(v6, v7, v8) --[[ Line: 12 ]] --[[ Name: Lerp ]]
    return v6 + (v7 - v6) * v8;
end;
local v27 = {
    CreatePrompt = function(v10) --[[ Line: 16 ]] --[[ Name: CreatePrompt ]]
        -- upvalues: l_Players_0 (copy), l_Modules_0 (copy), l_UseDualEmote_0 (copy)
        local l_Character_0 = v10.Character;
        local l_DisplayName_0 = v10.DisplayName;
        local l_Emote_0 = v10.Emote;
        local l_Character_1 = l_Players_0.LocalPlayer.Character;
        if l_Character_0 == l_Character_1 then
            return;
        else
            local l_FirstChild_0 = workspace.States:FindFirstChild(l_Character_0.Name);
            local l_Value_0 = (l_FirstChild_0 and l_FirstChild_0:FindFirstChild("CharacterData")).Opponent.Value;
            if l_Value_0 and l_Value_0 ~= l_Character_1 then
                return;
            else
                if l_Value_0 then
                    local l_l_Character_0_Attribute_0 = l_Character_0:GetAttribute("CurrentEmote");
                    task.wait(0.5);
                    if l_Character_0:GetAttribute("CurrentEmote") ~= l_l_Character_0_Attribute_0 then
                        return;
                    end;
                end;
                local v18 = script.DualPrompt:Clone();
                v18.Parent = require(l_Modules_0:WaitForChild("EffectHelper")).GetWeldCharacter(l_Character_0).PrimaryPart;
                local l_MaxDistance_0 = v10.MaxDistance;
                if l_MaxDistance_0 then
                    v18.MaxActivationDistance = l_MaxDistance_0;
                end;
                v18.ObjectText = l_DisplayName_0;
                v18.Triggered:Connect(function(v20) --[[ Line: 52 ]]
                    -- upvalues: l_UseDualEmote_0 (ref), l_Emote_0 (copy), l_Character_0 (copy)
                    l_UseDualEmote_0:FireServer(l_Emote_0, l_Character_0, v20.Character);
                end);
                return;
            end;
        end;
    end, 
    ClearPrompts = function(v21) --[[ Line: 57 ]] --[[ Name: ClearPrompts ]]
        -- upvalues: l_Modules_0 (copy)
        if not v21 or not v21.PrimaryPart then
            return;
        else
            for _, v23 in v21.PrimaryPart:GetChildren() do
                if v23.Name == "DualPrompt" then
                    v23:Destroy();
                end;
            end;
            local v24 = require(l_Modules_0:WaitForChild("EffectHelper")).GetWeldCharacter(v21);
            if not v24 then
                return;
            else
                for _, v26 in v24.PrimaryPart:GetChildren() do
                    if v26.Name == "DualPrompt" then
                        v26:Destroy();
                    end;
                end;
                return;
            end;
        end;
    end
};
v27.CreateCharacterMuteZone = function(v28, v29) --[[ Line: 76 ]] --[[ Name: CreateCharacterMuteZone ]]
    -- upvalues: l_Players_0 (copy), v27 (copy)
    local v30 = v28:IsA("Player") and v28.Character or v28;
    if not v30 then
        return;
    else
        local l_PrimaryPart_0 = v30.PrimaryPart;
        if not l_PrimaryPart_0 then
            return;
        else
            local l_Character_2 = l_Players_0.LocalPlayer.Character;
            local v33 = l_Character_2 and workspace.States[l_Character_2.Name];
            if v33 then
                local _ = v33.CharacterData;
            end;
            local _ = workspace.Music.MuteZones;
            v27.DestroyCharacterMuteZone(v28);
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Anchored = false;
            l_Part_0.CanCollide = false;
            l_Part_0.CanTouch = false;
            l_Part_0.CanQuery = false;
            l_Part_0.Transparency = 1;
            l_Part_0.Size = Vector3.new();
            l_Part_0.CFrame = l_PrimaryPart_0.CFrame;
            l_Part_0.Name = v28.Name;
            local l_NumberValue_0 = Instance.new("NumberValue");
            l_NumberValue_0.Name = "Radius";
            l_NumberValue_0.Value = v29;
            l_NumberValue_0.Parent = l_Part_0;
            l_Part_0.Parent = workspace.Music.MuteZones;
            local l_Weld_0 = Instance.new("Weld");
            l_Weld_0.Parent = l_Part_0;
            l_Weld_0.Part0 = l_Part_0;
            l_Weld_0.Part1 = l_PrimaryPart_0;
            return;
        end;
    end;
end;
v27.DestroyCharacterMuteZone = function(v39) --[[ Line: 113 ]] --[[ Name: DestroyCharacterMuteZone ]]
    local l_FirstChild_1 = workspace.Music.MuteZones:FindFirstChild(v39.Name);
    if l_FirstChild_1 then
        l_FirstChild_1:Destroy();
    end;
end;
v27.LerpMult = function(_) --[[ Line: 121 ]] --[[ Name: LerpMult ]]

end;
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
CanPlaySound = function(v43) --[[ Line: 146 ]] --[[ Name: CanPlaySound ]]
    -- upvalues: l_Players_0 (copy)
    local l_Character_3 = l_Players_0.LocalPlayer.Character;
    local v45 = l_Character_3 and workspace.States[l_Character_3.Name];
    local v46 = v45 and v45.CharacterData;
    if v43 == l_Players_0.LocalPlayer.Character then
        return true;
    elseif v46.Opponent.Value == nil then
        return true;
    elseif v46.Opponent.Value == v43 then
        return true;
    else
        return false;
    end;
end;
v27.PlaySound = function(_, v48) --[[ Line: 167 ]] --[[ Name: PlaySound ]]
    -- upvalues: l_SoundHelper_0 (copy)
    local l_SourceCharacter_0 = v48.SourceCharacter;
    if not l_SourceCharacter_0 then
        return;
    else
        local v50 = l_SoundHelper_0:PlaySound(v48);
        if not CanPlaySound(l_SourceCharacter_0) then
            v50.RollOffMinDistance = 0;
            v50.RollOffMaxDistance = 0;
            v50.Volume = 0;
        end;
        return v50;
    end;
end;
local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
v27.StopAnimsHelper = function(v52, v53, v54) --[[ Line: 182 ]] --[[ Name: StopAnimsHelper ]]
    -- upvalues: l_Players_0 (copy), l_CommonUtilities_0 (copy), l_AnimHelper_0 (copy)
    local l_Character_4 = l_Players_0.LocalPlayer.Character;
    local v56 = l_CommonUtilities_0.GetCharacterData(l_Character_4);
    if v56 and v56.Opponent.Value then
        return;
    else
        local v57 = v52 == l_Players_0.LocalPlayer.Character;
        if not v54 and v57 then
            return;
        else
            local v58 = v52 and v52:FindFirstChild("Humanoid");
            local v59 = v58 and (v58:FindFirstChild("Animator") or v58);
            if not v59 then
                return;
            else
                local v60 = {
                    Priority = Enum.AnimationPriority.Core, 
                    Animator = v59, 
                    AnimId = 13633646038, 
                    NameFade = 0.1, 
                    FadeIn = 0.1, 
                    Weight = 1000, 
                    Name = v53
                };
                for _, v62 in (v59:GetPlayingAnimationTracks()) do
                    if v62.Priority ~= Enum.AnimationPriority.Core and v62.Priority ~= Enum.AnimationPriority.Idle and v62.Priority ~= Enum.AnimationPriority.Movement and v62.Name ~= "Emote" and v62.Name ~= "Entrance" then
                        v62.Name = "Remove";
                        v62.Looped = false;
                    end;
                end;
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v60);
                if l_l_AnimHelper_0_Anim_0 then
                    l_l_AnimHelper_0_Anim_0:Stop(0.1);
                end;
                return;
            end;
        end;
    end;
end;
v27.StopAnimsHack = function(v64) --[[ Line: 238 ]] --[[ Name: StopAnimsHack ]]
    -- upvalues: v27 (copy)
    v27.StopAnimsHelper(v64, "Server", true);
end;
v27.AddConnections = function(v65) --[[ Line: 242 ]] --[[ Name: AddConnections ]]
    -- upvalues: l_Players_0 (copy), v27 (copy)
    local l_CharacterData_1 = v65.CharacterData;
    local l_Character_5 = v65.Character;
    local l_Animator_0 = v65.Animator;
    local l_Character_6 = l_Players_0.LocalPlayer.Character;
    local v70 = l_Character_5 == l_Character_6;
    local v71 = {};
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v73 = false;
    local function v77() --[[ Line: 254 ]] --[[ Name: Cleanup ]]
        -- upvalues: v73 (ref), v71 (copy), l_BindableEvent_0 (copy), v27 (ref), l_Character_5 (copy), v70 (copy), l_Character_6 (copy)
        if v73 then
            return;
        else
            v73 = true;
            for _, v75 in v71 do
                v75:Disconnect();
            end;
            l_BindableEvent_0:Fire();
            l_BindableEvent_0:Destroy();
            v27.ClearPrompts(l_Character_5);
            if not v70 then
                local l_l_Character_6_Attribute_0 = l_Character_6:GetAttribute("InDualEmote");
                if l_l_Character_6_Attribute_0 and l_l_Character_6_Attribute_0 == l_Character_5:GetAttribute("InDualEmote") then
                    return;
                else
                    v27.StopAnimsHelper(l_Character_5, "Emote");
                end;
            end;
            return;
        end;
    end;
    v71[1] = l_Animator_0.AncestryChanged:Connect(function() --[[ Line: 275 ]]
        -- upvalues: v77 (copy)
        v77();
    end);
    task.delay(0.2, function() --[[ Line: 279 ]]
        -- upvalues: v73 (ref), l_Animator_0 (copy), v70 (copy), v77 (copy), v71 (copy)
        if v73 then
            return;
        else
            local v78 = nil;
            v78 = l_Animator_0.AnimationPlayed:Connect(function(v79) --[[ Line: 283 ]]
                -- upvalues: v70 (ref), v77 (ref)
                if v79.Priority == Enum.AnimationPriority.Core or v79.Priority == Enum.AnimationPriority.Idle or v79.Priority == Enum.AnimationPriority.Movement then
                    return;
                elseif not v70 and v79.Priority == Enum.AnimationPriority.Action then
                    return;
                else
                    v77();
                    return;
                end;
            end);
            table.insert(v71, v78);
            return;
        end;
    end);
    for _, v81 in {
        "CurrentEmote", 
        "LastDashTime", 
        "LastDamaged", 
        "Punching"
    } do
        local _ = nil;
        table.insert(v71, (l_Character_5:GetAttributeChangedSignal(v81):Connect(function() --[[ Line: 302 ]]
            -- upvalues: v77 (copy)
            v77();
        end)));
    end;
    for _, v84 in {
        "Opponent"
    } do
        local _ = nil;
        table.insert(v71, (l_CharacterData_1[v84].Changed:Connect(function() --[[ Line: 312 ]]
            -- upvalues: v77 (copy)
            v77();
        end)));
    end;
    local _ = nil;
    table.insert(v71, (l_Character_5.Humanoid:GetPropertyChangedSignal("Jump"):Connect(function() --[[ Line: 334 ]]
        -- upvalues: l_CharacterData_1 (copy), l_Character_5 (copy), v77 (copy)
        if l_CharacterData_1.Toxic.Value then
            return;
        else
            if l_Character_5.Humanoid.Jump then
                v77();
            end;
            return;
        end;
    end)));
    return l_BindableEvent_0;
end;
v27.CanContinue = function(v87) --[[ Line: 348 ]] --[[ Name: CanContinue ]]
    -- upvalues: l_Players_0 (copy)
    local l_CharacterData_2 = v87.CharacterData;
    local l_Character_7 = v87.Character;
    local l_Emote_1 = v87.Emote;
    if not l_Character_7:IsDescendantOf(workspace.Live) and not l_Character_7:IsDescendantOf(workspace.QuestGivers) then
        return false;
    elseif l_Character_7:GetAttribute("CurrentEmote") == l_Emote_1.Metadata.Name then
        return false;
    elseif not l_CharacterData_2.CanEmoteAnyways.Value and (l_CharacterData_2.Cutscene.Value or l_CharacterData_2.Stunned.Value) then
        return false;
    elseif l_Character_7:GetAttribute("Punching") then
        return false;
    else
        local _ = l_Character_7 == l_Players_0.LocalPlayer.Character;
        local v92 = l_Emote_1.Metadata.Toxicity or 0.25;
        local _ = l_Character_7:GetAttribute("LastDamaged");
        l_CharacterData_2.Toxic.Value = true;
        task.delay(v92, function() --[[ Line: 371 ]]
            -- upvalues: l_CharacterData_2 (copy)
            l_CharacterData_2.Toxic.Value = false;
        end);
        local l_l_Character_7_Attribute_1 = l_Character_7:GetAttribute("CurrentEmote");
        if l_l_Character_7_Attribute_1 then
            l_Character_7:SetAttribute("CurrentEmote", nil);
            l_Character_7:SetAttribute("CurrentEmote", l_l_Character_7_Attribute_1);
            task.wait(0.08333333333333333);
        end;
        return true;
    end;
end;
return v27;