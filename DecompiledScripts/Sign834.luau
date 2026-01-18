local v0 = {
    Metadata = {
        Name = script.Name, 
        DisplayName = "Sign", 
        MainId = 17184027278, 
        Rarity = "Mythic"
    }
};
local v1 = TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_EmoteHelper_0 = require(l_Modules_0:WaitForChild("EmoteHelper"));
local function _(v10, v11, v12) --[[ Line: 22 ]] --[[ Name: Lerp ]]
    return v10 + (v11 - v10) * v12;
end;
local v14 = {
    "\217\169(\239\188\190\226\151\161\239\188\190)\219\182", 
    "(\226\149\172\226\137\150_\226\137\150)", 
    "(\227\129\165 \226\151\149\226\128\191\226\151\149 )\227\129\165", 
    "\226\148\144(\239\191\163\227\131\152\239\191\163)\226\148\140", 
    "\203\154\226\128\167\194\186\194\183(\203\131\204\163\204\163\204\165\226\136\169\203\130\204\163\204\163\204\165)\226\128\167\194\186\194\183\203\154", 
    "\239\188\136\194\180\226\136\128`\239\188\137\239\189\130", 
    "\226\149\174(\226\149\175_\226\149\176)\226\149\173", 
    "\227\131\190(\239\188\190-\239\188\190)\227\131\142", 
    "( \226\128\162\204\129 \226\136\167 \226\128\162\204\128 )\224\165\173", 
    "\224\173\167( \203\181 \194\176 ~ \194\176 \203\181 )\224\173\168", 
    "(\225\135\130_\225\135\130 |||)", 
    "\226\149\173( \224\185\144 _\224\185\144)\226\149\174", 
    "(\227\129\164\226\137\167\226\150\189\226\137\166)\227\129\164", 
    "(\226\148\155\226\151\137\208\148\226\151\137)\226\148\155", 
    "\202\149\226\151\137\225\180\165\226\151\137\202\148", 
    "\226\148\172\226\148\180\226\148\172\226\148\180\226\148\164\207\137\227\131\187)", 
    "( \226\149\165\207\137\226\149\165 )", 
    "(\227\129\164\226\150\128\194\175\226\150\128 )\227\129\164", 
    "(\239\188\143\226\137\167\207\137\239\188\188)", 
    "\226\184\168\226\151\186_\226\151\191\226\184\169", 
    "(\224\184\135 \226\128\162\204\128_\226\128\162\204\129)\224\184\135", 
    "(\239\190\137\194\180\227\131\174`)\239\190\137*: \239\189\165\239\190\159", 
    "(\226\140\146_\226\140\146;)", 
    "(\239\191\162_\239\191\162;)", 
    "(\235\136\136_\235\136\136)", 
    "(\239\191\163\239\184\191\239\191\163)", 
    "(\239\190\146` \239\190\155 \194\180)", 
    "(\226\149\175_\226\149\176)", 
    "~(>_<~)", 
    "\226\150\147\226\150\146\226\150\145(\194\176\226\151\161\194\176)\226\150\145\226\150\146\226\150\147", 
    "\239\188\188(\194\186 \226\150\161 \194\186 l|l)/", 
    "\226\148\144(\239\184\182\226\150\189\239\184\182)\226\148\140", 
    "(\239\191\163_\239\191\163)\227\131\187\227\131\187\227\131\187", 
    "(\194\172_\194\172 )", 
    "(\239\191\163\226\150\189\239\191\163)\227\131\142", 
    "(\226\149\175\194\176\231\155\138\194\176)\226\149\175"
};
v0.Use = function(v15) --[[ Line: 69 ]] --[[ Name: Use ]]
    -- upvalues: l_EmoteHelper_0 (copy), v0 (copy), l_Players_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), v1 (copy), v14 (copy)
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
            local v22 = {};
            local v23 = false;
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            local l_v16_Attribute_0 = v16:GetAttribute("Owner");
            local v26 = true;
            if v16 ~= l_Character_0 then
                v26 = l_v16_Attribute_0 and l_v16_Attribute_0 == l_Character_0.Name;
            end;
            local v27 = {
                Name = "Emote", 
                FadeIn = 0.25, 
                Weight = 1, 
                Speed = 1, 
                AnimId = v0.Metadata.MainId, 
                Priority = Enum.AnimationPriority.Action, 
                Animator = v18, 
                Looped = true
            };
            local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v27);
            l_EmoteHelper_0:PlaySound({
                Name = "Rustle2", 
                Parent = v16.PrimaryPart
            });
            local v29 = nil;
            local v30 = 0;
            local v31 = nil;
            local v32 = false;
            for _, v34 in workspace.Live:GetChildren() do
                if v34 ~= v16 and v34.PrimaryPart and (v16.PrimaryPart.Position - v34.PrimaryPart.Position).Magnitude <= 30 and v34:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                    v32 = true;
                    local v35 = v34 and v34:FindFirstChild("Humanoid");
                    local v36 = v35 and (v35:FindFirstChild("Animator") or v35);
                    if v36 then
                        local l_v36_PlayingAnimationTracks_0 = v36:GetPlayingAnimationTracks();
                        local v38 = false;
                        for _, v40 in l_v36_PlayingAnimationTracks_0 do
                            if v40.Name == "Emote" then
                                l_l_AnimHelper_0_Anim_0.TimePosition = v40.TimePosition;
                                v40.TimePosition = l_l_AnimHelper_0_Anim_0.TimePosition;
                                for _, v42 in game.Workspace.Debris:GetChildren() do
                                    if v42.Name == script.Name then
                                        v31 = v42:FindFirstChildWhichIsA("Sound");
                                        if v31 then
                                            v30 = v31.TimePosition;
                                        end;
                                    end;
                                end;
                                v38 = true;
                                break;
                            end;
                        end;
                        if v38 then
                            break;
                        end;
                    end;
                end;
            end;
            if v26 then
                for _, v44 in game.Workspace.Debris:GetChildren() do
                    if v44.Name == script.Name then
                        v31 = v44:FindFirstChildWhichIsA("Sound");
                        if v31 then
                            v31.Volume = 0;
                        end;
                    end;
                end;
            end;
            v29 = l_EmoteHelper_0:PlaySound({
                SourceCharacter = v16, 
                Looped = v27.Looped, 
                Parent = v16.PrimaryPart, 
                DirectCopy = script.Song, 
                Name = "Emote", 
                ShouldWeld = true, 
                PartName = v0.Metadata.Name
            });
            v29.Volume = 0;
            local v45 = true;
            if l_Character_0:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                v45 = false;
            end;
            task.delay(0.25, function() --[[ Line: 191 ]]
                -- upvalues: v45 (ref), v31 (ref), v29 (ref), v30 (ref), l_TweenService_0 (ref), v1 (ref)
                if not v45 then
                    return;
                elseif v31 then
                    v29.Volume = script.Song.Volume;
                    return;
                else
                    v29.TimePosition = v30;
                    l_TweenService_0:Create(v29, v1, {
                        Volume = script.Song.Volume
                    }):Play();
                    return;
                end;
            end);
            local v46 = script.Sign:Clone();
            v46.Parent = workspace.Debris;
            local v47 = CFrame.new(0, 0, -0.8) * CFrame.Angles(-1.5707963267948966, 0, -1.5707963267948966);
            v46.CFrame = v16.UpperTorso.CFrame * v47;
            local v48 = v14[math.random(1, #v14)];
            v46.SurfaceGui.Frame.TextLabel.Text = v48;
            v46.SurfaceGui.Frame.TextLabel.TextStrokeColor3 = Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255));
            local l_WeldConstraint_0 = Instance.new("WeldConstraint");
            l_WeldConstraint_0.Parent = v46;
            l_WeldConstraint_0.Part0 = v46;
            l_WeldConstraint_0.Part1 = v16.UpperTorso;
            v46.CFrame = v16.UpperTorso.CFrame * v47;
            local function v55() --[[ Line: 219 ]] --[[ Name: Cleanup ]]
                -- upvalues: v23 (ref), v22 (copy), l_l_AnimHelper_0_Anim_0 (copy), l_EmoteHelper_0 (ref), v15 (copy), v26 (copy), l_CharacterData_0 (copy), l_Occupied_0 (copy), v16 (copy), v0 (ref), v31 (ref), l_TweenService_0 (ref), v29 (ref), v1 (ref), v46 (copy), l_WeldConstraint_0 (copy)
                if v23 then
                    return;
                else
                    v23 = true;
                    for _, v51 in v22 do
                        v51:Disconnect();
                    end;
                    l_l_AnimHelper_0_Anim_0.Looped = false;
                    l_l_AnimHelper_0_Anim_0:Stop(0.01);
                    l_EmoteHelper_0.DestroyCharacterMuteZone(v15);
                    if v26 then
                        l_CharacterData_0.Toxic.Value = false;
                        l_Occupied_0.SpeedMult.Value = 0;
                        l_Occupied_0.LerpMult.Value = 0;
                    end;
                    if v16:GetAttribute("CurrentEmote") == v0.Metadata.Name then
                        v16:SetAttribute("CurrentEmote", nil);
                    end;
                    if v26 then
                        for _, v53 in game.Workspace.Debris:GetChildren() do
                            if v53.Name == script.Name then
                                v31 = v53:FindFirstChildWhichIsA("Sound");
                                if v31 then
                                    v31.Volume = script.Song.Volume;
                                end;
                            end;
                        end;
                    end;
                    l_TweenService_0:Create(v29, v1, {
                        Volume = 0
                    }):Play();
                    task.delay(3, function() --[[ Line: 255 ]]
                        -- upvalues: v29 (ref), v46 (ref)
                        v29.Parent:Destroy();
                        if v46 then
                            v46:Destroy();
                        end;
                    end);
                    l_WeldConstraint_0:Destroy();
                    v46.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10) * 3, math.random(10, 30) * 2.5, math.random(-10, 10) * 3);
                    v46.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                    local _ = l_EmoteHelper_0:PlaySound({
                        SourceCharacter = v16, 
                        Parent = v16.PrimaryPart, 
                        Name = "Fling", 
                        Speed = math.random(0.9, 1.1)
                    });
                    return;
                end;
            end;
            l_EmoteHelper_0.CreateCharacterMuteZone(v15, 30);
            v16:SetAttribute("CurrentEmote", v0.Metadata.Name);
            l_Occupied_0.SpeedMult.Value = 0.85;
            l_Occupied_0.LerpMult.Value = 0.7;
            l_EmoteHelper_0.AddConnections({
                CharacterData = l_CharacterData_0, 
                Character = v16, 
                Animator = v18
            }).Event:Connect(function() --[[ Line: 285 ]]
                -- upvalues: v55 (copy)
                v55();
            end);
            task.wait(180);
            v55();
            return;
        end;
    end;
end;
return v0;