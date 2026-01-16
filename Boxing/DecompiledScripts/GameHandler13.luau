local l_UserInputService_0 = game:GetService("UserInputService");
local l_TweenService_0 = game:GetService("TweenService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
local v6 = Random.new();
local l_Parent_0 = script.Parent;
local l_Main_0 = l_Parent_0.Main;
local v9 = not l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.TouchEnabled;
local v10 = l_UserInputService_0.GamepadEnabled or l_GuiService_0:IsTenFootInterface();
local v11 = v9 and l_Main_0.Mobile or l_Main_0.Main;
for _, v13 in v11:GetChildren() do
    v13.Parent = l_Main_0;
    v13.Visible = true;
end;
l_Main_0.Main:Destroy();
l_Main_0.Mobile:Destroy();
if v10 then
    v11 = {
        Up = Enum.KeyCode.ButtonY, 
        Left = Enum.KeyCode.ButtonX, 
        Down = Enum.KeyCode.ButtonA, 
        Right = Enum.KeyCode.ButtonB
    };
    for _, v15 in l_Main_0:GetDescendants() do
        if v15.Name == "Console" then
            local l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetImageForKeyCode(v11[v15.Parent.Name]);
            v15.Visible = true;
            v15.Image = l_l_UserInputService_0_ImageForKeyCode_0;
        end;
    end;
end;
v11 = l_Main_0.Progress;
local l_Info_0 = v11.Info;
local l_Runway_0 = l_Main_0.Runway;
local l_ActionText_0 = l_Main_0.ActionText;
local l_Templates_0 = l_ActionText_0.Templates;
local l_Notes_0 = l_Main_0.Minigame.Notes;
local _ = l_Notes_0.Up;
local _ = l_Notes_0.Down;
local _ = l_Notes_0.Left;
local _ = l_Notes_0.Right;
local v26 = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
local v27 = TweenInfo.new(1.3333333333333333, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
local v28 = TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v29 = TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local v30 = TweenInfo.new(4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local v31 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local v32 = TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local v33 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local v34 = TweenInfo.new(0.66, Enum.EasingStyle.Cubic, Enum.EasingDirection.In);
local v35 = require(script.ColorTool);
local v36 = Color3.fromRGB(255, 107, 102);
local v37 = Color3.fromRGB(196, 255, 156);
local v38 = {
    [Enum.KeyCode.W] = "Up", 
    [Enum.KeyCode.A] = "Left", 
    [Enum.KeyCode.S] = "Down", 
    [Enum.KeyCode.D] = "Right", 
    [Enum.KeyCode.Up] = "Up", 
    [Enum.KeyCode.Left] = "Left", 
    [Enum.KeyCode.Down] = "Down", 
    [Enum.KeyCode.Right] = "Right", 
    [Enum.KeyCode.ButtonY] = "Up", 
    [Enum.KeyCode.ButtonX] = "Left", 
    [Enum.KeyCode.ButtonA] = "Down", 
    [Enum.KeyCode.ButtonB] = "Right"
};
local v39 = {
    Sick = 350, 
    Good = 200, 
    Bad = 100, 
    Miss = -10
};
local v40 = {
    Sick = 1, 
    Good = 0.9, 
    Bad = 0.8, 
    Miss = 0
};
local v41 = {
    [1] = "Left", 
    [2] = "Down", 
    [3] = "Up", 
    [4] = "Right"
};
local v42 = {};
local v43 = nil;
local l_Settings_0 = l_Parent_0.Settings;
local l_Value_0 = l_Settings_0.SongName.Value;
local l_Value_1 = l_Settings_0.Difficulty.Value;
local l_Value_2 = l_Settings_0.StartDelay.Value;
local l_Value_3 = l_Settings_0.Autoplay.Value;
local function _(v49, v50, v51) --[[ Line: 138 ]] --[[ Name: Lerp ]]
    return v49 + (v50 - v49) * v51;
end;
GetNoteType = function(v53) --[[ Line: 140 ]] --[[ Name: GetNoteType ]]
    if v53 < 0.033 then
        return "Sick";
    elseif v53 < 0.135 then
        return "Good";
    elseif v53 < 0.203 then
        return "Bad";
    else
        return "Miss";
    end;
end;
RegisterNote = function(v54) --[[ Line: 152 ]] --[[ Name: RegisterNote ]]
    -- upvalues: v43 (ref), v39 (copy), v40 (copy), l_Templates_0 (copy), l_ActionText_0 (copy), l_TweenService_0 (copy), v33 (copy), v6 (copy), v34 (copy)
    if not v43 then
        return;
    elseif v43.FinalTime - (tick() - v43.StartTime) < -0.5 then
        return;
    else
        local v55 = v39[v54];
        local v56 = nil;
        if v54 == "Miss" then
            local l_v43_0 = v43;
            l_v43_0.MissStreak = l_v43_0.MissStreak + 1;
            l_v43_0 = v43;
            l_v43_0.Misses = l_v43_0.Misses + 1;
            v43.Combo = 0;
            v55 = v55 * v43.MissStreak;
        else
            v43.MissStreak = 0;
            local l_v43_1 = v43;
            l_v43_1.Combo = l_v43_1.Combo + 1;
            v55 = v55 * (1 + v43.Combo / #v43.Notes);
            v56 = script.Hit:Clone();
            v56.Parent = script;
            v56.SoundId = v56.StoredId.Value;
            v56:Play();
        end;
        local l_v43_2 = v43;
        l_v43_2.NotesSoFar = l_v43_2.NotesSoFar + 1;
        l_v43_2 = v43;
        l_v43_2.Score = l_v43_2.Score + v55;
        l_v43_2 = v43;
        l_v43_2.AccuracyScore = l_v43_2.AccuracyScore + v40[v54];
        l_v43_2 = l_Templates_0:FindFirstChild(v54);
        if not l_v43_2 then
            return;
        else
            l_v43_2 = l_v43_2:Clone();
            l_v43_2.Visible = true;
            l_v43_2.Parent = l_ActionText_0;
            l_v43_2.ZIndex = #l_ActionText_0:GetChildren();
            l_v43_2.Position = UDim2.new(l_v43_2.Position.X.Scale, 0, l_v43_2.Position.Y.Scale, 0);
            task.spawn(function() --[[ Line: 192 ]]
                -- upvalues: l_TweenService_0 (ref), l_v43_2 (ref), v33 (ref), v6 (ref), v34 (ref), v56 (ref)
                l_TweenService_0:Create(l_v43_2, v33, {
                    Position = UDim2.new(l_v43_2.Position.X.Scale, 0, l_v43_2.Position.Y.Scale - v6:NextNumber(0.4, 0.6), 0)
                }):Play();
                task.wait(0.4);
                l_TweenService_0:Create(l_v43_2, v34, {
                    Position = UDim2.new(l_v43_2.Position.X.Scale, 0, l_v43_2.Position.Y.Scale + 1.5, 0), 
                    ImageTransparency = 1
                }):Play();
                task.wait(5);
                l_v43_2:Destroy();
                if v56 then
                    v56:Destroy();
                end;
            end);
            return;
        end;
    end;
end;
ButtonDown = function(v60) --[[ Line: 208 ]] --[[ Name: ButtonDown ]]
    -- upvalues: v42 (copy), l_Notes_0 (copy), l_Runway_0 (copy), v43 (ref), v6 (copy), l_TweenService_0 (copy), v27 (copy), v26 (copy), v28 (copy)
    v42[v60] = true;
    local l_l_Notes_0_FirstChild_0 = l_Notes_0:FindFirstChild(v60);
    if not l_l_Notes_0_FirstChild_0 then
        return;
    else
        local l_l_Runway_0_FirstChild_0 = l_Runway_0:FindFirstChild(v60);
        local v63 = tick() - (v43 and v43.StartTime or 0);
        local v64 = nil;
        for _, v66 in l_l_Runway_0_FirstChild_0:GetChildren() do
            if v66.Name ~= "Miss" then
                local v67 = tonumber(v66.Name);
                if v63 - v67 <= 0.8 and v67 - v63 <= 0.8 then
                    if not v64 then
                        v64 = v66;
                    else
                        local v68 = tonumber(v64.Name);
                        if math.abs(v63 - v67) < math.abs(v63 - v68) then
                            v64 = v66;
                        end;
                    end;
                end;
            end;
        end;
        local v69 = v6:NextNumber(-5, 5);
        local v70 = 100;
        local v71 = false;
        if v64 then
            v70 = math.abs(v63 - tonumber(v64.Name));
        end;
        local v72 = GetNoteType(v70);
        if v72 ~= "Miss" then
            v71 = true;
            v69 = v6:NextNumber(-7, 7);
        end;
        RegisterNote(v72);
        if v71 then
            if v64 then
                v64.Visible = false;
                v64:Destroy();
            end;
            l_l_Notes_0_FirstChild_0.Glow.ImageTransparency = 0;
            l_l_Notes_0_FirstChild_0.BackGlow.ImageTransparency = 0;
            l_TweenService_0:Create(l_l_Notes_0_FirstChild_0.Glow, v72 == "Sick" and v27 or v26, {
                ImageTransparency = 1
            }):Play();
            l_TweenService_0:Create(l_l_Notes_0_FirstChild_0.BackGlow, v72 == "Sick" and v27 or v26, {
                ImageTransparency = 1
            }):Play();
        end;
        if v72 == "Sick" then
            task.defer(function() --[[ Line: 272 ]]
                -- upvalues: l_Notes_0 (ref), v60 (copy)
                local v73 = l_Notes_0.Splashes[v60];
                for v74 = 1, #v73:GetChildren() do
                    local v75 = v73[tostring(v74)];
                    v75.Visible = true;
                    task.wait(0.03333333333333333);
                    v75.Visible = false;
                end;
            end);
        end;
        task.delay(0, function() --[[ Line: 284 ]]
            -- upvalues: v42 (ref), v60 (copy), l_TweenService_0 (ref), l_l_Notes_0_FirstChild_0 (copy), v69 (ref)
            if not v42[v60] then
                return;
            else
                l_TweenService_0:Create(l_l_Notes_0_FirstChild_0, TweenInfo.new(0.22, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0.225, 0, 0.9, 0), 
                    Rotation = v69
                }):Play();
                return;
            end;
        end);
        l_TweenService_0:Create(l_l_Notes_0_FirstChild_0.Pressed, v28, {
            ImageTransparency = 0
        }):Play();
        return;
    end;
end;
ButtonUp = function(v76) --[[ Line: 295 ]] --[[ Name: ButtonUp ]]
    -- upvalues: v42 (copy), l_Notes_0 (copy), l_TweenService_0 (copy), v28 (copy)
    v42[v76] = nil;
    local l_l_Notes_0_FirstChild_1 = l_Notes_0:FindFirstChild(v76);
    if not l_l_Notes_0_FirstChild_1 then
        return;
    else
        l_TweenService_0:Create(l_l_Notes_0_FirstChild_1, v28, {
            Size = UDim2.new(0.25, 0, 1, 0), 
            Rotation = 0
        }):Play();
        local l_Pressed_0 = l_l_Notes_0_FirstChild_1.Pressed;
        l_TweenService_0:Create(l_Pressed_0, v28, {
            ImageTransparency = 1
        }):Play();
        return;
    end;
end;
l_UserInputService_0.InputBegan:Connect(function(v79, _) --[[ Line: 307 ]]
    -- upvalues: l_Value_3 (copy), v38 (copy)
    if l_Value_3 then
        return;
    else
        local v81 = v38[v79.KeyCode];
        if not v81 then
            return;
        else
            ButtonDown(v81);
            return;
        end;
    end;
end);
l_UserInputService_0.InputEnded:Connect(function(v82, _) --[[ Line: 316 ]]
    -- upvalues: l_Value_3 (copy), v38 (copy)
    if l_Value_3 then
        return;
    else
        local v84 = v38[v82.KeyCode];
        if not v84 then
            return;
        else
            ButtonUp(v84);
            return;
        end;
    end;
end);
for _, v86 in l_Notes_0:GetChildren() do
    if not l_Value_3 then
        local l_Button_0 = v86:FindFirstChild("Button");
        if l_Button_0 then
            l_Button_0.MouseButton1Down:Connect(function() --[[ Line: 331 ]]
                -- upvalues: v86 (copy)
                ButtonDown(v86.Name);
            end);
            l_Button_0.MouseButton1Up:Connect(function() --[[ Line: 335 ]]
                -- upvalues: v86 (copy)
                ButtonUp(v86.Name);
            end);
            l_Button_0.MouseLeave:Connect(function() --[[ Line: 339 ]]
                -- upvalues: v86 (copy)
                ButtonUp(v86.Name);
            end);
        end;
    else
        break;
    end;
end;
local v88 = require(script.SongCompiler);
local l_FirstChild_0 = script.Songs:FindFirstChild(l_Value_0);
if not l_FirstChild_0 then
    return;
else
    local l_Audio_0 = l_FirstChild_0.Audio;
    local l_Volume_0 = l_Audio_0.Volume;
    l_Audio_0.PlaybackSpeed = 1;
    l_Audio_0.Volume = 0;
    l_Audio_0.SoundId = l_Audio_0.StoredId.Value;
    l_Audio_0:Play();
    v43 = v88:Read(require(l_FirstChild_0.Chart), require(l_FirstChild_0.Metadata), l_FirstChild_0, l_Value_1);
    v43.Score = 0;
    v43.Combo = 0;
    v43.Misses = 0;
    v43.Accuracy = 0;
    v43.NotesSoFar = 0;
    v43.MissStreak = 0;
    v43.AccuracyScore = 0;
    v43.ScoreProgress = 0;
    v43.StartTime = tick() + l_Value_2;
    task.delay(l_Value_2 + (v43.SongDelay or 0), function() --[[ Line: 369 ]]
        -- upvalues: l_Audio_0 (copy), l_Volume_0 (copy), v43 (ref), l_RunService_0 (copy)
        l_Audio_0.Volume = l_Volume_0;
        l_Audio_0.TimePosition = 0;
        l_Audio_0.SoundId = l_Audio_0.StoredId.Value;
        l_Audio_0:Play();
        task.wait(v43.FinalTime + 1.5);
        l_RunService_0:UnbindFromRenderStep("AlignNotes");
    end);
    local v92 = 0;
    local v93 = v43.Speed or 5;
    local l_TimePosition_0 = v43.Notes[1].TimePosition;
    v43.FinalTime = l_TimePosition_0;
    local v95 = {};
    for v96 = 1, 4 do
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v41[v96];
        l_Folder_0.Parent = l_Runway_0;
        v95[tostring(v96)] = l_Folder_0;
    end;
    for v98, v99 in v43.Notes do
        local v100 = tostring(v99.Type);
        local v101 = l_Runway_0.Notes[v100]:Clone();
        if v9 then
            v101.Position = UDim2.new(v101.Position.X.Scale, 0, 0.5 - v99.TimePosition * v93, 0);
        else
            v101.Position = UDim2.new(v101.Position.X.Scale, 0, 0.5 + v99.TimePosition * v93, 0);
        end;
        local v102 = v99.TimePosition / 1;
        if v43.FinalTime < v102 then
            v43.FinalTime = v102;
        end;
        v92 = v92 + v39.Sick * (1 + v98 / #v43.Notes);
        v101.Name = v102;
        v101.Parent = v95[v100];
    end;
    v92 = v92 * 0.88;
    local l_Scale_0 = l_Runway_0.Position.Y.Scale;
    local v104 = 60 / v43.BPM / 1;
    local v105 = v104 * math.floor(l_TimePosition_0 / v104);
    local v106 = 0;
    local v107 = l_Value_3 and 1 or 4;
    l_RunService_0:BindToRenderStep("AlignNotes", 1, function(v108) --[[ Line: 439 ]]
        -- upvalues: v43 (ref), v105 (ref), v104 (copy), l_TweenService_0 (copy), l_Main_0 (copy), v29 (copy), v6 (copy), v30 (copy), l_CurrentCamera_0 (copy), v31 (copy), l_FieldOfView_0 (copy), v32 (copy), v92 (ref), l_Value_3 (copy), l_Settings_0 (copy), v106 (ref), v107 (copy), v95 (copy), v9 (copy), l_Runway_0 (copy), l_Scale_0 (copy), v93 (copy), v11 (copy), v35 (copy), v36 (copy), v37 (copy), l_Info_0 (copy)
        local v109 = tick() - v43.StartTime;
        if v105 < v109 and v109 < v43.FinalTime then
            v105 = v105 + v104;
            task.spawn(function() --[[ Line: 445 ]]
                -- upvalues: l_TweenService_0 (ref), l_Main_0 (ref), v29 (ref), v6 (ref), v30 (ref)
                l_TweenService_0:Create(l_Main_0, v29, {
                    Size = UDim2.new(1.05, 0, 1.05, 0), 
                    Rotation = v6:NextNumber(-1, 1) * 0.75
                }):Play();
                task.wait(0.1);
                l_TweenService_0:Create(l_Main_0, v30, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Rotation = 0
                }):Play();
            end);
            task.spawn(function() --[[ Line: 451 ]]
                -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_0 (ref), v31 (ref), l_FieldOfView_0 (ref), v32 (ref)
                l_TweenService_0:Create(l_CurrentCamera_0, v31, {
                    FieldOfView = l_FieldOfView_0 - 10
                }):Play();
                task.wait(0.25);
                l_TweenService_0:Create(l_CurrentCamera_0, v32, {
                    FieldOfView = l_FieldOfView_0
                }):Play();
            end);
        end;
        local l_Combo_0 = v43.Combo;
        local v111 = math.clamp(v43.Score / v92, 0, 1);
        if l_Value_3 then
            l_Combo_0 = l_Settings_0.Combo.Value;
            v111 = l_Settings_0.ScoreProgress.Value;
        else
            l_Settings_0.Combo.Value = v43.Combo;
            l_Settings_0.ScoreProgress.Value = v43.ScoreProgress;
        end;
        v106 = v106 + 1;
        if v106 % v107 == 0 then
            v106 = 0;
            for _, v113 in v95 do
                for _, v115 in v113:GetChildren() do
                    if v115.Name ~= "Miss" then
                        local v116 = tonumber(v115.Name);
                        if v109 >= v116 then
                            local v117 = math.abs(v109 - v116);
                            local v118 = GetNoteType(v117);
                            if l_Value_3 and v118 == "Sick" then
                                ButtonDown(v113.Name);
                                ButtonUp(v113.Name);
                                v115.Name = "Miss";
                            end;
                            if v118 == "Miss" then
                                v115.Name = "Miss";
                                RegisterNote(v118);
                            end;
                        end;
                    end;
                end;
            end;
        end;
        if v9 then
            l_Runway_0.Position = UDim2.new(0.5, 0, l_Scale_0 + v109 * (l_Runway_0.Size.Y.Scale * v93) * 1, 0);
        else
            l_Runway_0.Position = UDim2.new(0.5, 0, l_Scale_0 - v109 * (l_Runway_0.Size.Y.Scale * v93) * 1, 0);
        end;
        local l_v43_3 = v43;
        local l_ScoreProgress_0 = v43.ScoreProgress;
        local l_v111_0 = v111;
        local v122 = math.clamp(v108 * (l_Value_3 and 2 or 5), 0, 1);
        l_v43_3.ScoreProgress = l_ScoreProgress_0 + (l_v111_0 - l_ScoreProgress_0) * v122;
        v11.Bar.Progress.Size = UDim2.new(v43.ScoreProgress, 0, 1, 0);
        v11.Bar.Progress.BackgroundColor3 = v35:LerpColor(v36, v37, v43.ScoreProgress);
        l_Info_0.Text = "Combo: " .. l_Combo_0 .. " | Accuracy: " .. math.floor(v43.AccuracyScore / math.max(v43.NotesSoFar, 1) * 100 + 0.5) .. "%";
    end);
    return;
end;