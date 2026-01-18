local l_Players_0 = game:GetService("Players");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
Shuffle = function(v6) --[[ Line: 8 ]] --[[ Name: Shuffle ]]
    for v7 = #v6, 2, -1 do
        local v8 = math.random(v7);
        local v9 = v6[v8];
        local v10 = v6[v7];
        v6[v7] = v9;
        v6[v8] = v10;
    end;
    return v6;
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Places_0 = require(game.ReplicatedFirst:WaitForChild("Places"));
local v13 = game.PlaceId == l_Places_0.Trading;
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local v16 = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local v17 = TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local v18 = TweenInfo.new(4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local v19 = TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local v20 = TweenInfo.new(15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local l_Places_1 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local l_Music_0 = l_Workspace_0:WaitForChild("Music");
if game.PlaceId == l_Places_1.Ranked then
    l_Music_0:Destroy();
    l_Music_0 = script.Ranked;
    l_Music_0.Parent = l_Workspace_0;
    l_Music_0.Name = "Music";
end;
local l_MuteZones_0 = l_Music_0:WaitForChild("MuteZones");
local v25 = tick();
local v26 = {};
for _, v28 in l_Music_0:GetChildren() do
    local v29 = {};
    local v30 = {};
    for _, v32 in v28:GetChildren() do
        if v32:GetAttribute("Priority") then
            table.insert(v29, v32);
        else
            table.insert(v30, v32);
        end;
    end;
    v29 = Shuffle(v29);
    for _, v34 in (Shuffle(v30)) do
        table.insert(v29, v34);
    end;
    v26[v28.Name] = {
        Playlist = v29, 
        CurrentIndex = 1, 
        CurrentSong = nil
    };
end;
v26.Custom = {};
v26.MuteZones = nil;
local v35 = {};
for _, v37 in v26 do
    local l_Playlist_0 = v37.Playlist;
    if l_Playlist_0 then
        for _, v40 in l_Playlist_0 do
            v35[v40] = v40.Volume;
        end;
    end;
end;
local v41 = "Lobby";
local v42 = false;
TryAddEffect = function(v43) --[[ Line: 91 ]] --[[ Name: TryAddEffect ]]
    -- upvalues: v26 (copy), v41 (ref)
    local v44 = v26[v41];
    local _ = v44.CurrentIndex;
    local _ = v44.Playlist;
    local l_CurrentSong_0 = v44.CurrentSong;
    if not l_CurrentSong_0 then
        return;
    else
        for _, v49 in l_CurrentSong_0:GetChildren() do
            if v49.Name == "Effect" then
                v49:Destroy();
            end;
        end;
        if not v43 then
            return;
        else
            local l_script_FirstChild_0 = script:FindFirstChild(v43);
            if not l_script_FirstChild_0 then
                return;
            else
                local v51 = l_script_FirstChild_0:Clone();
                v51.Name = "Effect";
                v51.Enabled = true;
                v51.Parent = l_CurrentSong_0;
                return;
            end;
        end;
    end;
end;
local l_CurrentMenu_0 = l_Workspace_0:WaitForChild("CurrentMenu");
l_CurrentMenu_0.Changed:Connect(function(v53) --[[ Line: 126 ]]
    TryAddEffect(v53);
end);
local l_CharacterData_0 = l_Workspace_0:WaitForChild("States"):WaitForChild(l_Players_0.LocalPlayer.Name):FindFirstChild("CharacterData");
local _ = l_ReplicatedStorage_0.NPCs;
local v56 = false;
local v57 = nil;
ResolvePlaylist = function() --[[ Line: 143 ]] --[[ Name: ResolvePlaylist ]]
    -- upvalues: l_Workspace_0 (copy), v26 (copy), l_CharacterData_0 (copy), v41 (ref)
    local v58 = l_Workspace_0:GetAttribute("DefaultPlaylist") or "Lobby";
    local l_Value_0 = l_Workspace_0.CurrentMenu.Value;
    if v26[l_Value_0] then
        v58 = l_Value_0;
    end;
    if l_CharacterData_0.Opponent.Value then
        v58 = "Combat";
    end;
    if v41 == "Custom" then
        v58 = "Custom";
    end;
    return v58;
end;
l_CharacterData_0:WaitForChild("Opponent").Changed:Connect(function(v60) --[[ Line: 167 ]]
    -- upvalues: v41 (ref), v25 (ref), v26 (copy), l_TweenService_0 (copy), v17 (copy), v57 (ref), v56 (ref), l_Workspace_0 (copy), l_Music_0 (ref)
    if v41 == "Custom" and v60 == nil then
        return;
    else
        v25 = tick();
        local v61 = v26[v41];
        local _ = v61.CurrentIndex;
        local _ = v61.Playlist;
        local l_CurrentSong_1 = v61.CurrentSong;
        if l_CurrentSong_1 then
            l_TweenService_0:Create(l_CurrentSong_1, v17, {
                Volume = 0
            }):Play();
        end;
        if v57 then
            v57:Disconnect();
            v57 = nil;
        end;
        v56 = true;
        task.wait(1);
        local l_MapMusic_0 = l_Workspace_0:FindFirstChild("MapMusic");
        if v60 and l_MapMusic_0 then
            for _, v67 in l_MapMusic_0:GetChildren() do
                if v67:IsA("Sound") then
                    v67:SetAttribute("TargetVolume", v67.Volume);
                end;
            end;
            local function v72() --[[ Line: 200 ]] --[[ Name: UpdatePlaylist ]]
                -- upvalues: v41 (ref), l_Music_0 (ref), l_MapMusic_0 (copy), v26 (ref)
                v41 = ResolvePlaylist();
                if v41 == "CustomNPC" then
                    local l_CombatNPC_0 = l_Music_0:FindFirstChild("CombatNPC");
                    if l_CombatNPC_0 then
                        for _, v70 in l_CombatNPC_0:GetChildren() do
                            if v70:IsA("Sound") then
                                v70.PlayOnRemove = false;
                                v70:Stop();
                            end;
                        end;
                        l_CombatNPC_0:Destroy();
                    end;
                    l_MapMusic_0.Name = "CombatNPC";
                    l_MapMusic_0.Parent = l_Music_0;
                    local v71 = v26[v41];
                    v71.CurrentIndex = 1;
                    v71.CurrentSong = nil;
                    v71.Playlist = l_MapMusic_0:GetChildren();
                end;
            end;
            StopSong();
            v72();
            task.delay(5, function() --[[ Line: 230 ]]
                -- upvalues: l_Music_0 (ref)
                l_Music_0.Custom:ClearAllChildren();
            end);
        end;
        v56 = false;
        v41 = ResolvePlaylist();
        PlaySong();
        return;
    end;
end);
MenuChanged = function(v73) --[[ Line: 293 ]] --[[ Name: MenuChanged ]]
    -- upvalues: v41 (ref), v26 (copy), v25 (ref), v17 (copy), v20 (copy), l_TweenService_0 (copy), v56 (ref)
    if v41 == "Custom" then
        return;
    else
        if v73 == "" then
            v73 = workspace:GetAttribute("DefaultPlaylist") or "Lobby";
        end;
        if not v26[v73] then
            return;
        elseif v41 == v73 then
            return;
        else
            v25 = tick();
            local v74 = v26[v41];
            local _ = v74.CurrentIndex;
            local _ = v74.Playlist;
            local l_CurrentSong_2 = v74.CurrentSong;
            if l_CurrentSong_2 then
                local l_v17_0 = v17;
                if v73 == "Secret" then
                    l_v17_0 = v20;
                end;
                l_TweenService_0:Create(l_CurrentSong_2, l_v17_0, {
                    Volume = 0
                }):Play();
            end;
            v56 = true;
            if v73 == "StyleShop" then
                task.wait(0.8);
            else
                task.wait(0.2);
            end;
            v56 = false;
            v41 = ResolvePlaylist();
            PlaySong();
            return;
        end;
    end;
end;
l_Workspace_0.CurrentMenu.Changed:Connect(function(v79) --[[ Line: 332 ]]
    MenuChanged(v79);
end);
l_Workspace_0:GetAttributeChangedSignal("DefaultPlaylist"):Connect(function(_) --[[ Line: 336 ]]
    MenuChanged(workspace:GetAttribute("DefaultPlaylist"));
end);
l_ReplicatedStorage_0.Events.AddCustomSong.Event:Connect(function(v81, v82) --[[ Line: 366 ]]
    -- upvalues: v25 (ref), v26 (copy), v41 (ref), l_TweenService_0 (copy), v17 (copy), v56 (ref), l_Music_0 (ref)
    v25 = tick();
    local v83 = v26[v41];
    local _ = v83.CurrentIndex;
    local _ = v83.Playlist;
    local l_CurrentSong_3 = v83.CurrentSong;
    if l_CurrentSong_3 then
        l_TweenService_0:Create(l_CurrentSong_3, v17, {
            Volume = 0
        }):Play();
    end;
    v56 = true;
    if v82 then
        task.wait(v82);
    end;
    v81 = v81:Clone();
    v81.Parent = l_Music_0.Custom;
    v81:SetAttribute("TargetVolume", v81.Volume);
    v41 = "Custom";
    local v87 = v26[v41];
    v87.Playlist = l_Music_0.Custom:GetChildren();
    v87.CurrentIndex = 1;
    v56 = false;
    PlaySong();
end);
local v88 = 1;
local l_Settings_0 = workspace.Settings;
SetVolume = function(v90) --[[ Line: 401 ]] --[[ Name: SetVolume ]]
    -- upvalues: v56 (ref), v26 (copy), v41 (ref), v35 (copy), l_CharacterData_0 (copy), v88 (ref), l_Settings_0 (copy), v18 (copy), v17 (copy), l_TweenService_0 (copy)
    if v56 then
        return;
    else
        local v91 = v26[v41];
        local _ = v91.CurrentIndex;
        local _ = v91.Playlist;
        local l_CurrentSong_4 = v91.CurrentSong;
        if not l_CurrentSong_4 then
            return;
        else
            local l_l_CurrentSong_4_Attribute_0 = l_CurrentSong_4:GetAttribute("TargetVolume");
            if not v35[l_CurrentSong_4] then
                v35[l_CurrentSong_4] = l_l_CurrentSong_4_Attribute_0;
                print(v35);
            end;
            if v35[l_CurrentSong_4] then
                local v96 = workspace:GetAttribute("VolumeOverride") or 1;
                l_l_CurrentSong_4_Attribute_0 = v35[l_CurrentSong_4] * (l_CharacterData_0.Cutscene.Value and 0 or 1) * v88 * (v96 * (l_Settings_0.MasterVolume.Value * l_Settings_0.MusicVolume.Value));
            end;
            if not v90 then
                v90 = if v41 == "CombatNPC" then v18 else v17;
            end;
            l_TweenService_0:Create(l_CurrentSong_4, v90, {
                Volume = l_l_CurrentSong_4_Attribute_0
            }):Play();
            return;
        end;
    end;
end;
l_Settings_0.MasterVolume.Changed:Connect(function() --[[ Line: 439 ]]
    -- upvalues: v26 (copy), v41 (ref), v16 (copy)
    local v97 = v26[v41];
    repeat
        task.wait(0.03333333333333333);
    until v97 and v97.CurrentSong;
    SetVolume(v16);
end);
l_Settings_0.MusicVolume.Changed:Connect(function() --[[ Line: 446 ]]
    -- upvalues: v26 (copy), v41 (ref), v16 (copy)
    local v98 = v26[v41];
    repeat
        task.wait(0.03333333333333333);
    until v98 and v98.CurrentSong;
    SetVolume(v16);
end);
l_CharacterData_0.Cutscene.Changed:Connect(function() --[[ Line: 453 ]]
    SetVolume();
end);
workspace:GetAttributeChangedSignal("VolumeOverride"):Connect(function() --[[ Line: 457 ]]
    SetVolume();
end);
local v99 = 0;
local v100 = nil;
v100 = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 465 ]]
    -- upvalues: v99 (ref), l_MuteZones_0 (copy), l_CurrentCamera_0 (copy), v88 (ref), v19 (copy), v13 (copy), v26 (copy), v41 (ref)
    v99 = v99 + 1;
    if v99 % 4 ~= 0 then
        return;
    else
        v99 = 0;
        for _, v103 in l_MuteZones_0:GetChildren() do
            local l_Radius_0 = v103:FindFirstChild("Radius");
            if l_Radius_0 and l_Radius_0.Value >= (v103.Position - l_CurrentCamera_0.CFrame.Position).Magnitude then
                if v88 == 1 then
                    v88 = 0;
                    SetVolume(v19);
                end;
                return;
            end;
        end;
        if v88 == 0 then
            v88 = 1;
            SetVolume();
        end;
        if v13 then
            local v105 = v26[v41];
            local _ = v105.CurrentIndex;
            local _ = v105.Playlist;
            local l_CurrentSong_5 = v105.CurrentSong;
            local l_Position_0 = l_CurrentCamera_0.CFrame.Position;
            local v110 = Vector3.new(l_Position_0.X + 0.01, l_Position_0.Y + 0.01, l_Position_0.Z + 0.01);
            local v111 = Vector3.new(l_Position_0.X - 0.01, l_Position_0.Y - 0.01, l_Position_0.Z - 0.01);
            local v112 = Region3.new(v111, v110):ExpandToGrid(4);
            if v112 and l_CurrentSong_5 then
                if game.Workspace.Terrain:ReadVoxels(v112, 4)[1][1][1] == Enum.Material.Water then
                    if l_CurrentSong_5:FindFirstChild("Water") then
                        l_CurrentSong_5.Water.Enabled = true;
                        return;
                    else
                        script.Water:Clone().Parent = l_CurrentSong_5;
                        return;
                    end;
                elseif l_CurrentSong_5:FindFirstChild("Water") then
                    l_CurrentSong_5.Water.Enabled = false;
                end;
            end;
        end;
        return;
    end;
end);
StopSong = function() --[[ Line: 527 ]] --[[ Name: StopSong ]]
    -- upvalues: v26 (copy)
    for _, v114 in v26 do
        local l_Playlist_7 = v114.Playlist;
        if l_Playlist_7 then
            for _, v117 in l_Playlist_7 do
                v117:Stop();
            end;
        end;
    end;
end;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local v119 = l_PlayerGui_0:WaitForChild("Common", 30);
local v120 = l_PlayerGui_0:WaitForChild("Main", 30);
local l_ServerInfo_0 = v119:WaitForChild("ServerInfo");
local l_TrackInfo_0 = v119:WaitForChild("TrackInfo");
local l_Advanced_0 = l_ServerInfo_0:WaitForChild("Advanced");
local l_Main_0 = l_TrackInfo_0:WaitForChild("Main");
local l_Position_1 = l_Advanced_0.Position;
local l_Position_2 = l_Main_0.Position;
local v127 = UDim2.new(l_Position_1.X.Scale, 0, l_Position_1.Y.Scale + 0.5, 0);
local v128 = UDim2.new(l_Position_2.X.Scale, 0, l_Position_2.Y.Scale + 0.5, 0);
l_Main_0.Position = v128;
l_Main_0.Visible = true;
PlaySong = function() --[[ Line: 557 ]] --[[ Name: PlaySong ]]
    -- upvalues: v26 (copy), l_Workspace_0 (copy), v25 (ref), v41 (ref), v35 (copy), v42 (ref), l_TweenService_0 (copy), v20 (copy), l_CurrentMenu_0 (copy), l_Main_0 (copy), v128 (copy), l_Advanced_0 (copy), l_Position_1 (copy), v120 (copy), v127 (copy), l_Position_2 (copy), l_Music_0 (ref)
    for _, v130 in v26 do
        local l_Playlist_8 = v130.Playlist;
        if l_Playlist_8 then
            for _, v133 in l_Playlist_8 do
                if not l_Workspace_0:GetAttribute("DefaultPlaylist") then
                    v133:Pause();
                end;
            end;
        end;
    end;
    local l_v25_0 = v25;
    local v135 = v26[v41];
    local l_CurrentIndex_6 = v135.CurrentIndex;
    local l_Playlist_9 = v135.Playlist;
    v135.CurrentSong = l_Playlist_9[l_CurrentIndex_6];
    local l_CurrentSong_6 = v135.CurrentSong;
    if not l_CurrentSong_6 then
        return;
    else
        local v139 = nil;
        if v41 == "CombatNPC" then
            v139 = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        elseif v41 == "JoeLastStock" then
            v139 = TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        elseif v41 == "Secret" then
            v139 = TweenInfo.new(10, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        end;
        print(v35);
        l_CurrentSong_6.Volume = 0;
        SetVolume(v139);
        if not v42 then
            l_CurrentSong_6.Volume = 0;
            l_TweenService_0:Create(l_CurrentSong_6, v20, {
                Volume = v35[l_CurrentSong_6]
            }):Play();
        end;
        TryAddEffect(l_CurrentMenu_0.Value);
        local l_StoredId_0 = l_CurrentSong_6:FindFirstChild("StoredId");
        if l_StoredId_0 then
            l_CurrentSong_6.SoundId = l_StoredId_0.Value;
        end;
        if string.find(v41, "Combat") then
            if l_CurrentSong_6.Name == "Tiebreaker" then
                l_CurrentSong_6.TimePosition = 25;
            end;
            l_CurrentSong_6:Play();
        else
            l_CurrentSong_6:Resume();
        end;
        v42 = true;
        l_TweenService_0:Create(l_Main_0, TweenInfo.new(v41 == "StyleShop" and 0.1 or 0.75, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
            Position = v128
        }):Play();
        l_TweenService_0:Create(l_Advanced_0, TweenInfo.new(0.75, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
            Position = l_Position_1
        }):Play();
        local l_Metadata_0 = l_CurrentSong_6:FindFirstChild("Metadata");
        if l_Metadata_0 then
            l_Metadata_0 = require(l_Metadata_0);
            local function _() --[[ Line: 632 ]] --[[ Name: SetTrackFrame ]]
                -- upvalues: l_Main_0 (ref), l_Metadata_0 (ref)
                l_Main_0.Author.Text = "By " .. (l_Metadata_0.Author or "unknown");
                l_Main_0.Track.Text = "Now Playing: \"" .. (l_Metadata_0.TrackName or "Untitled") .. "\"";
            end;
            local v143 = true;
            do
                local l_v143_0 = v143;
                if v41 == l_Workspace_0.CurrentMenu.Value then
                    task.spawn(function() --[[ Line: 642 ]]
                        -- upvalues: v120 (ref), l_Workspace_0 (ref), l_v143_0 (ref), l_Main_0 (ref), l_Metadata_0 (ref), l_TweenService_0 (ref)
                        local l_v120_FirstChild_0 = v120:FindFirstChild(l_Workspace_0.CurrentMenu.Value);
                        if not l_v120_FirstChild_0 then
                            return;
                        else
                            local v146 = nil;
                            for _, v148 in l_v120_FirstChild_0:GetDescendants() do
                                if v148.Name == "TrackTarget" then
                                    v146 = v148;
                                    break;
                                end;
                            end;
                            if not v146 then
                                return;
                            else
                                l_v143_0 = false;
                                for _, v150 in v146.Parent:GetChildren() do
                                    if v150.Name == "TrackTargetRemove" then
                                        v150:Destroy();
                                    end;
                                end;
                                local l_Position_3 = v146.Position;
                                local v152 = UDim2.new(l_Position_3.X.Scale + 4, 0, l_Position_3.Y.Scale, 0);
                                l_Main_0.Author.Text = "By " .. (l_Metadata_0.Author or "unknown");
                                l_Main_0.Track.Text = "Now Playing: \"" .. (l_Metadata_0.TrackName or "Untitled") .. "\"";
                                local v153 = l_Main_0:Clone();
                                v153.Name = "TrackTargetRemove";
                                v153.AnchorPoint = v146.AnchorPoint;
                                v153.Position = v152;
                                v153.Size = v146.Size;
                                v153.Parent = v146.Parent;
                                v153.Visible = true;
                                l_TweenService_0:Create(v153, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                    Position = l_Position_3
                                }):Play();
                                task.wait(5);
                                if not v153 then
                                    return;
                                else
                                    l_TweenService_0:Create(v153, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                        Position = v152
                                    }):Play();
                                    task.wait(1);
                                    if v153 then
                                        v153:Destroy();
                                    end;
                                    return;
                                end;
                            end;
                        end;
                    end);
                end;
                if l_v143_0 then
                    l_TweenService_0:Create(l_Advanced_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                        Position = v127
                    }):Play();
                    task.delay(0.5, function() --[[ Line: 689 ]]
                        -- upvalues: v25 (ref), l_v25_0 (copy), l_Main_0 (ref), l_Metadata_0 (ref), l_TweenService_0 (ref), l_Position_2 (ref), v128 (ref), l_Advanced_0 (ref), l_Position_1 (ref)
                        if v25 ~= l_v25_0 then
                            return;
                        else
                            l_Main_0.Author.Text = "By " .. (l_Metadata_0.Author or "unknown");
                            l_Main_0.Track.Text = "Now Playing: \"" .. (l_Metadata_0.TrackName or "Untitled") .. "\"";
                            l_TweenService_0:Create(l_Main_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                Position = l_Position_2
                            }):Play();
                            task.wait(5);
                            if v25 ~= l_v25_0 then
                                return;
                            else
                                l_TweenService_0:Create(l_Main_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                                    Position = v128
                                }):Play();
                                task.wait(0.5);
                                if v25 ~= l_v25_0 then
                                    return;
                                else
                                    l_TweenService_0:Create(l_Advanced_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                        Position = l_Position_1
                                    }):Play();
                                    return;
                                end;
                            end;
                        end;
                    end);
                end;
            end;
        end;
        l_CurrentSong_6.Looped = false;
        l_CurrentSong_6.Ended:Wait();
        if v25 ~= l_v25_0 then
            return;
        else
            if v41 == "Custom" then
                l_CurrentSong_6:Destroy();
                if #l_Music_0.Custom:GetChildren() == 0 then
                    v41 = l_Workspace_0:GetAttribute("DefaultPlaylist") or "Lobby";
                end;
            end;
            v135.CurrentIndex = v135.CurrentIndex + 1;
            if v135.CurrentIndex > #l_Playlist_9 then
                v135.CurrentIndex = 1;
            end;
            PlaySong();
            return;
        end;
    end;
end;
l_SoundHelper_0:PlaySound({
    Name = "StartGame", 
    Parent = l_Workspace_0
});
task.wait(5);
PlaySong();
while task.wait() do
    local v154 = ResolvePlaylist();
    if v154 ~= v41 then
        v41 = v154;
        PlaySong();
    end;
end;