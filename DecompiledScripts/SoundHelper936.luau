local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
if game:GetService("RunService"):IsClient() then
    workspace.ChildAdded:Connect(function(v1) --[[ Line: 5 ]]
        if not v1:IsA("Sound") then
            return;
        else
            task.delay(v1.TimeLength + 1, function() --[[ Line: 8 ]]
                -- upvalues: v1 (copy)
                if v1 then
                    v1:Destroy();
                end;
            end);
            return;
        end;
    end);
end;
local l_Sounds_0 = l_ReplicatedStorage_0:WaitForChild("Sounds");
return {
    PlaySound = function(_, v4) --[[ Line: 28 ]] --[[ Name: PlaySound ]]
        -- upvalues: l_Sounds_0 (copy)
        local l_Name_0 = v4.Name;
        local l_Parent_0 = v4.Parent;
        if not l_Name_0 or not l_Parent_0 then
            return;
        else
            local l_Settings_0 = workspace.Settings;
            local l_l_Sounds_0_FirstChild_0 = l_Sounds_0:FindFirstChild(l_Name_0);
            local l_DirectCopy_0 = v4.DirectCopy;
            local l_SoundId_0 = v4.SoundId;
            local v11 = true;
            if l_DirectCopy_0 then
                l_l_Sounds_0_FirstChild_0 = l_DirectCopy_0:Clone();
                v11 = false;
            elseif l_SoundId_0 then
                l_l_Sounds_0_FirstChild_0 = Instance.new("Sound");
                l_l_Sounds_0_FirstChild_0.SoundId = "rbxassetid://" .. l_SoundId_0;
                v11 = false;
            end;
            if not l_l_Sounds_0_FirstChild_0 then
                return;
            else
                if v11 then
                    l_l_Sounds_0_FirstChild_0 = l_l_Sounds_0_FirstChild_0:Clone();
                else
                    l_l_Sounds_0_FirstChild_0.Name = l_Name_0;
                end;
                if not l_l_Sounds_0_FirstChild_0.SoundId or l_l_Sounds_0_FirstChild_0.SoundId == "" then
                    local l_StoredId_0 = l_l_Sounds_0_FirstChild_0:FindFirstChild("StoredId");
                    if l_StoredId_0 then
                        l_l_Sounds_0_FirstChild_0.SoundId = l_StoredId_0.Value;
                    end;
                end;
                local v13 = v4.Volume or l_l_Sounds_0_FirstChild_0.Volume;
                local v14 = (v4.Speed or l_l_Sounds_0_FirstChild_0.PlaybackSpeed) * (v4.SpeedMult or 1);
                local v15 = nil;
                if l_Parent_0:IsA("BasePart") then
                    v15 = Instance.new("Part");
                    v15.Anchored = true;
                    v15.CanCollide = false;
                    v15.CanTouch = false;
                    v15.CanQuery = false;
                    v15.Transparency = 1;
                    v15.Size = Vector3.new();
                    v15.Name = "SoundPart";
                    v15.CFrame = l_Parent_0.CFrame;
                    v15.Parent = workspace.Debris;
                    if v4.ShouldWeld then
                        v15.Anchored = false;
                        local l_Weld_0 = Instance.new("Weld");
                        l_Weld_0.Parent = v15;
                        l_Weld_0.Part0 = v15;
                        l_Weld_0.Part1 = l_Parent_0;
                    end;
                    l_Parent_0 = v15;
                end;
                if l_Parent_0 == workspace then
                    l_Parent_0 = workspace.Debris;
                end;
                if l_Parent_0:IsA("Model") and l_Parent_0.PrimaryPart then
                    l_Parent_0 = l_Parent_0.PrimaryPart;
                end;
                l_l_Sounds_0_FirstChild_0.Parent = l_Parent_0;
                l_l_Sounds_0_FirstChild_0.Volume = v13;
                l_l_Sounds_0_FirstChild_0.PlaybackSpeed = v14;
                l_l_Sounds_0_FirstChild_0.Volume = l_l_Sounds_0_FirstChild_0.Volume * l_Settings_0.MasterVolume.Value;
                if v4.Looped then
                    l_l_Sounds_0_FirstChild_0.Looped = true;
                    v4.IgnoreDelete = true;
                end;
                local l_MaxDist_0 = v4.MaxDist;
                local l_MinDist_0 = v4.MinDist;
                if l_Name_0 == "Emote" then
                    l_MaxDist_0 = 30;
                    l_l_Sounds_0_FirstChild_0.RollOffMode = Enum.RollOffMode.InverseTapered;
                    l_l_Sounds_0_FirstChild_0.Volume = l_l_Sounds_0_FirstChild_0.Volume * l_Settings_0.EmoteVolume.Value;
                elseif l_Name_0 == "Commentary" then
                    l_l_Sounds_0_FirstChild_0.Volume = l_l_Sounds_0_FirstChild_0.Volume * l_Settings_0.CommentaryVolume.Value;
                end;
                local l_PartName_0 = v4.PartName;
                if v15 and l_PartName_0 then
                    v15.Name = l_PartName_0;
                end;
                if l_MinDist_0 then
                    l_l_Sounds_0_FirstChild_0.RollOffMinDistance = l_MinDist_0;
                end;
                if l_MaxDist_0 then
                    l_l_Sounds_0_FirstChild_0.RollOffMaxDistance = l_MaxDist_0;
                end;
                if l_l_Sounds_0_FirstChild_0.RollOffMinDistance == 10 then
                    l_l_Sounds_0_FirstChild_0.RollOffMinDistance = l_l_Sounds_0_FirstChild_0.RollOffMinDistance + v13;
                end;
                l_l_Sounds_0_FirstChild_0:Play();
                if not l_Settings_0.UltimateMusic.Value and string.find(l_Name_0, "UltSong") then
                    l_l_Sounds_0_FirstChild_0.SoundId = 0;
                end;
                if l_Name_0 == "Commentary" and not l_Settings_0.CommentaryEnabled.Value then
                    l_l_Sounds_0_FirstChild_0.SoundId = 0;
                end;
                local v20 = l_l_Sounds_0_FirstChild_0.TimeLength / v14;
                if not v20 or v20 < 0.05 then
                    v20 = 30;
                end;
                task.delay(v20, function() --[[ Line: 156 ]]
                    -- upvalues: v4 (copy), l_l_Sounds_0_FirstChild_0 (ref), v15 (ref)
                    if v4.IgnoreDelete then
                        return;
                    else
                        if l_l_Sounds_0_FirstChild_0 then
                            l_l_Sounds_0_FirstChild_0:Destroy();
                        end;
                        if v15 then
                            v15:Destroy();
                        end;
                        return;
                    end;
                end);
                return l_l_Sounds_0_FirstChild_0;
            end;
        end;
    end
};