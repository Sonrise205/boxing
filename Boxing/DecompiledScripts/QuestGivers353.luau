local v0 = false;
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("ReplicatedFirst");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
local v10 = l_ReplicatedStorage_0:WaitForChild("Modules", 20);
local v11 = require(v10:WaitForChild("AnimHelper", 20));
local v12 = require(v10:WaitForChild("SoundHelper", 20));
local v13 = require(v10:WaitForChild("Emotes", 20));
local v14;
if game:GetService("RunService"):IsClient() then
    v14 = shared.BridgeNet2;
    if not v14 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v14 = shared.BridgeNet2;
        v0 = v14;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v14 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v15 = v14.ReferenceBridge("SyncEventProgress");
local l_TheGames_0 = require(v10:WaitForChild("EffectHelper"):WaitForChild("TheGames"));
local l_EffectHelper_0 = require(v10:WaitForChild("EffectHelper"));
local l_Events_0 = require(v10:WaitForChild("Events"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local function _(v21, v22, v23) --[[ Line: 29 ]] --[[ Name: Lerp ]]
    return v21 + (v22 - v21) * v23;
end;
local v25 = require(l_ReplicatedStorage_0:WaitForChild("BasedText", 20));
local v26 = require(l_ReplicatedStorage_0:WaitForChild("MouseOver", 20));
local v27 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common", 20);
local v28 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main", 20);
local v29 = l_Workspace_0:WaitForChild("QuestGivers", 20);
local v30 = v27:WaitForChild("QuestNPC", 20);
local v31 = v30:WaitForChild("Base", 20);
local v32 = v30:WaitForChild("Option", 20);
local v33 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v34 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local v35 = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local v36 = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local l_MainFrame_0 = v28:WaitForChild("MainFrame");
local l_LeftFrame_0 = v28:WaitForChild("LeftFrame");
local l_HotbarFrame_0 = v28:WaitForChild("HotbarFrame");
local v40 = {
    Frame = "BackgroundTransparency", 
    ImageLabel = "ImageTransparency", 
    TextLabel = "TextTransparency", 
    UIStroke = "Transparency"
};
local v41 = false;
local v42 = false;
local v43 = {};
v30:WaitForChild("Click", 20).MouseButton1Up:Connect(function() --[[ Line: 65 ]]
    -- upvalues: v42 (ref), v41 (ref)
    if not v42 then
        return;
    else
        v41 = true;
        return;
    end;
end);
if not l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.TouchEnabled then
    v31.Size = UDim2.new(1, 0, v31.Size.Y.Scale * 1.25, 0);
    v32.Size = UDim2.new(v32.Size.X.Scale * 1.25, 0, v32.Size.Y.Scale * 1.25, 0);
    v32.Position = UDim2.new(v32.Position.X.Scale, 0, 1 - v31.Size.Y.Scale - v32.Size.Y.Scale / 2 - 0.01);
end;
local function v66(v44) --[[ Line: 80 ]] --[[ Name: CreateOption ]]
    -- upvalues: l_Workspace_0 (copy), v30 (copy), l_TweenService_0 (copy), v33 (copy), v40 (copy), v26 (copy), v36 (copy), v34 (copy)
    if l_Workspace_0.CurrentMenu.Value ~= "QuestDialog" then
        return;
    else
        local v45 = #v30.ActiveOptions:GetChildren();
        local v46 = v30.Option:Clone();
        v46.Parent = v30.ActiveOptions;
        v46.Name = tostring(v45 + 1);
        v46.TextLabel.Text = v44.Text;
        local l_FirstChild_0 = v30.Icons:FindFirstChild(v44.Icon);
        if l_FirstChild_0 then
            l_FirstChild_0 = l_FirstChild_0:Clone();
            l_FirstChild_0.Visible = true;
            l_FirstChild_0.Parent = v46;
        end;
        local v48 = v46.Size.Y.Scale * 1.2;
        local l_Position_0 = v46.Position;
        v46.Position = UDim2.new(l_Position_0.X.Scale, 0, l_Position_0.Y.Scale - v48 * v45, 0);
        l_Position_0 = v46.Position;
        v46.Position = UDim2.new(l_Position_0.X.Scale + 0.3, 0, l_Position_0.Y.Scale, 0);
        l_TweenService_0:Create(v46, v33, {
            Position = l_Position_0
        }):Play();
        local l_v46_Descendants_0 = v46:GetDescendants();
        v46.Visible = true;
        for _, v52 in l_v46_Descendants_0 do
            local v53 = v40[v52.ClassName];
            if v53 then
                local v54 = v52[v53];
                v52[v53] = 1;
                local v55 = {
                    [v53] = v54
                };
                l_TweenService_0:Create(v52, v33, v55):Play();
            end;
        end;
        local v56 = {
            BackgroundTransparency = 0.2, 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        };
        local v57 = {
            BackgroundTransparency = 0.7, 
            BackgroundColor3 = Color3.fromRGB(113, 113, 113)
        };
        local l_Size_0 = v46.Size;
        local v59 = UDim2.new(l_Size_0.X.Scale * 0.98, 0, l_Size_0.Y.Scale * 0.98, 0);
        local v60, v61 = v26.MouseEnterLeaveEvent(v46.Button);
        local v62 = true;
        for v63, v64 in v57 do
            v46.Hover[v63] = v64;
        end;
        v60:Connect(function() --[[ Line: 144 ]]
            -- upvalues: l_Workspace_0 (ref), v46 (copy), v62 (ref), l_TweenService_0 (ref), v36 (ref), v56 (copy)
            if l_Workspace_0.CurrentMenu.Value ~= "QuestDialog" then
                return;
            elseif v46.Name == "Removing" then
                return;
            else
                v62 = true;
                l_TweenService_0:Create(v46.Hover, v36, v56):Play();
                return;
            end;
        end);
        v61:Connect(function() --[[ Line: 152 ]]
            -- upvalues: l_Workspace_0 (ref), v46 (copy), v62 (ref), l_TweenService_0 (ref), v36 (ref), v57 (copy)
            if l_Workspace_0.CurrentMenu.Value ~= "QuestDialog" then
                return;
            elseif v46.Name == "Removing" then
                return;
            else
                v62 = false;
                l_TweenService_0:Create(v46.Hover, v36, v57):Play();
                return;
            end;
        end);
        v46.Button.MouseButton1Down:Connect(function() --[[ Line: 160 ]]
            -- upvalues: l_Workspace_0 (ref), v46 (copy), l_TweenService_0 (ref), v34 (ref), v59 (copy)
            if l_Workspace_0.CurrentMenu.Value ~= "QuestDialog" then
                return;
            elseif v46.Name == "Removing" then
                return;
            else
                l_TweenService_0:Create(v46, v34, {
                    Size = v59
                }):Play();
                return;
            end;
        end);
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        l_BindableEvent_0.Parent = v46;
        v46.Button.MouseButton1Up:Connect(function() --[[ Line: 170 ]]
            -- upvalues: l_Workspace_0 (ref), v46 (copy), l_TweenService_0 (ref), v34 (ref), l_Size_0 (copy), l_BindableEvent_0 (copy)
            if l_Workspace_0.CurrentMenu.Value ~= "QuestDialog" then
                return;
            elseif v46.Name == "Removing" then
                return;
            else
                l_TweenService_0:Create(v46, v34, {
                    Size = l_Size_0
                }):Play();
                l_BindableEvent_0:Fire();
                return;
            end;
        end);
        return l_BindableEvent_0;
    end;
end;
local function _(v67) --[[ Line: 181 ]] --[[ Name: FormatTime ]]
    local v68 = math.floor(v67 / 3600);
    v67 = v67 - v68 * 3600;
    local v69 = math.floor(v67 / 60);
    return ("%02d:%02d:%02d"):format(v68, v69, v67 - v69 * 60);
end;
local v71 = nil;
Triggered = function(v72, _, v74) --[[ Line: 193 ]] --[[ Name: Triggered ]]
    -- upvalues: l_Workspace_0 (copy), v71 (ref), l_Events_0 (copy), v43 (copy), l_LocalPlayer_0 (copy), v41 (ref), v42 (ref), l_TweenService_0 (copy), l_LeftFrame_0 (copy), v35 (copy), l_MainFrame_0 (copy), l_HotbarFrame_0 (copy), v36 (copy), l_ProximityPromptService_0 (copy), v31 (copy), v33 (copy), v40 (copy), l_CurrentCamera_0 (copy), l_RunService_0 (copy), l_EffectHelper_0 (copy), v30 (copy), v34 (copy), l_TheGames_0 (copy), v25 (copy), v12 (copy), l_ReplicatedStorage_0 (copy), v13 (copy), v66 (copy), v28 (copy)
    if l_Workspace_0.CurrentMenu.Value ~= "" then
        return;
    else
        if not v74 then

        end;
        local v75 = tick();
        v71 = v75;
        local v76 = v72:GetAttribute("QuestName") or v72.Name;
        local l_FightOrder_0 = l_Events_0[v76].FightOrder;
        local v78 = 1;
        local v79 = v43[v76];
        if not v79 then
            error((("[QuestGivers] There is no ProgressData stored for event '%*'"):format(v76)));
        end;
        for v80, v81 in l_FightOrder_0 do
            if not v79[v81].Beat then
                v78 = v80;
                break;
            end;
        end;
        v78 = l_FightOrder_0[v78];
        if v79.Completed then
            v78 = "Completed";
        end;
        local l_DailyTimeRemaining_0 = v79.DailyTimeRemaining;
        if v79.IsDailyFighting then
            v78 = v79.CanDailyFight and "Daily" or "DailyCooldown";
        end;
        if l_LocalPlayer_0.Name == "drowningsome" then

        end;
        if l_LocalPlayer_0.Name == "wowo789aa" then

        end;
        v41 = false;
        v42 = true;
        local v83 = require(v72.DialogModule);
        l_TweenService_0:Create(l_LeftFrame_0, v35, {
            Position = UDim2.new(-1, 0, 0, 0)
        }):Play();
        l_TweenService_0:Create(l_MainFrame_0, v35, {
            Position = UDim2.new(0, 0, -1, 0)
        }):Play();
        l_TweenService_0:Create(l_HotbarFrame_0, v35, {
            Position = UDim2.new(0, 0, 1, 0)
        }):Play();
        local l_Event_0 = v72.Head:FindFirstChild("Event");
        if l_Event_0 then
            l_TweenService_0:Create(l_Event_0.Main, v36, {
                Size = UDim2.new(0, 0, 0, 0)
            }):Play();
        end;
        l_ProximityPromptService_0.Enabled = false;
        l_Workspace_0.HideRightFrame.Value = true;
        l_Workspace_0.CurrentMenu.Value = "QuestDialog";
        task.wait(0.1);
        workspace:SetAttribute("OptionsShown", 0);
        local v85 = v31:Clone();
        v85.Name = "CurrentDialog";
        local l_Position_1 = v85.Position;
        v85.Position = UDim2.new(l_Position_1.X.Scale, 0, l_Position_1.Y.Scale + 0.2, 0);
        l_TweenService_0:Create(v85, v33, {
            Position = l_Position_1
        }):Play();
        local l_v85_Descendants_0 = v85:GetDescendants();
        table.insert(l_v85_Descendants_0, v85);
        v85.Parent = v31.Parent;
        v85.Visible = true;
        for _, v89 in l_v85_Descendants_0 do
            local v90 = v40[v89.ClassName];
            if v90 then
                local v91 = v89[v90];
                v89[v90] = 1;
                local v92 = {
                    [v90] = v91
                };
                l_TweenService_0:Create(v89, v33, v92):Play();
            end;
        end;
        v85.Title.Text = v83.Title;
        v85.Subtitle.Text = v83.Subtitle;
        local l_PrimaryPart_0 = l_LocalPlayer_0.Character.PrimaryPart;
        local l_PrimaryPart_1 = v72.PrimaryPart;
        local l_Position_2 = v72.Head.Position;
        local v96 = CFrame.new();
        local l_Character_0 = l_LocalPlayer_0.Character;
        local l_CharacterData_0 = l_Workspace_0.States[l_Character_0.Name].CharacterData;
        local l_CameraMode_0 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
        task.spawn(function() --[[ Line: 303 ]]
            -- upvalues: l_Character_0 (copy), v72 (copy)
            l_Character_0:PivotTo(v72:GetPivot() * CFrame.new(0, 0, -5));
        end);
        l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
        l_CharacterData_0.Cutscene.Value = true;
        l_CharacterData_0.CanWalk.Value = false;
        l_CameraMode_0.Value = "Cutscene";
        local v100 = {};
        local v101 = CFrame.new(l_PrimaryPart_1.Position, (Vector3.new(l_PrimaryPart_0.Position.X, l_PrimaryPart_1.Position.Y, l_PrimaryPart_0.Position.Z))) * CFrame.new(-4, 3, -7) * CFrame.fromOrientation(-0.3490658503988659, 3.7524578917878086, 0);
        local v102 = 3;
        local function _() --[[ Line: 317 ]] --[[ Name: CreateCutsceneCamera ]]
            -- upvalues: l_RunService_0 (ref), v72 (copy), l_PrimaryPart_0 (copy), l_PrimaryPart_1 (copy), v101 (ref), v102 (ref), v96 (ref), l_Position_2 (copy), l_CharacterData_0 (copy), l_CameraMode_0 (copy), l_CurrentCamera_0 (ref)
            l_RunService_0:BindToRenderStep("QuestGiverCamera", Enum.RenderPriority.Camera.Value + 2, function(v103) --[[ Line: 318 ]]
                -- upvalues: v72 (ref), l_PrimaryPart_0 (ref), l_PrimaryPart_1 (ref), v101 (ref), v102 (ref), v96 (ref), l_Position_2 (ref), l_CharacterData_0 (ref), l_CameraMode_0 (ref), l_CurrentCamera_0 (ref)
                if v72.Name == "AndreBerto" then
                    local l_Position_3 = l_PrimaryPart_0.Position;
                    if v72:GetAttribute("Twist") == 0 then
                        l_Position_3 = (l_PrimaryPart_1.CFrame * CFrame.new(0, 0, -5)).Position;
                    end;
                    v101 = CFrame.new(l_PrimaryPart_1.Position, (Vector3.new(l_Position_3.X, l_PrimaryPart_1.Position.Y, l_Position_3.Z))) * CFrame.new(v72:GetAttribute("XOffset"), v72:GetAttribute("YOffset"), v72:GetAttribute("ZOffset")) * CFrame.fromOrientation(math.rad((v72:GetAttribute("O_XOffset"))), math.rad((v72:GetAttribute("O_YOffset"))), v72:GetAttribute("O_ZOffset"));
                    v102 = 12;
                    v96 = v96:Lerp(CFrame.new(v72.Head.Position - l_Position_2), v103 * 1.5);
                    l_CharacterData_0.Cutscene.Value = true;
                    l_CameraMode_0.Value = "Cutscene";
                    local l_l_CurrentCamera_0_0 = l_CurrentCamera_0;
                    local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
                    local l_v72_Attribute_0 = v72:GetAttribute("FOV");
                    local v108 = v103 * 3;
                    l_l_CurrentCamera_0_0.FieldOfView = l_FieldOfView_0 + (l_v72_Attribute_0 - l_FieldOfView_0) * v108;
                    l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame:Lerp(v101 * v96, v103 * v102);
                    return;
                else
                    v96 = v96:Lerp(CFrame.new(v72.Head.Position - l_Position_2), v103 * 0.5);
                    local l_l_CurrentCamera_0_1 = l_CurrentCamera_0;
                    local l_FieldOfView_1 = l_CurrentCamera_0.FieldOfView;
                    l_l_CurrentCamera_0_1.FieldOfView = l_FieldOfView_1 + (50 - l_FieldOfView_1) * v103;
                    l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame:Lerp(v101 * v96, v103 * v102);
                    return;
                end;
            end);
        end;
        l_RunService_0:BindToRenderStep("QuestGiverCamera", Enum.RenderPriority.Camera.Value + 2, function(v112) --[[ Line: 318 ]]
            -- upvalues: v72 (copy), l_PrimaryPart_0 (copy), l_PrimaryPart_1 (copy), v101 (ref), v102 (ref), v96 (ref), l_Position_2 (copy), l_CharacterData_0 (copy), l_CameraMode_0 (copy), l_CurrentCamera_0 (ref)
            if v72.Name == "AndreBerto" then
                local l_Position_4 = l_PrimaryPart_0.Position;
                if v72:GetAttribute("Twist") == 0 then
                    l_Position_4 = (l_PrimaryPart_1.CFrame * CFrame.new(0, 0, -5)).Position;
                end;
                v101 = CFrame.new(l_PrimaryPart_1.Position, (Vector3.new(l_Position_4.X, l_PrimaryPart_1.Position.Y, l_Position_4.Z))) * CFrame.new(v72:GetAttribute("XOffset"), v72:GetAttribute("YOffset"), v72:GetAttribute("ZOffset")) * CFrame.fromOrientation(math.rad((v72:GetAttribute("O_XOffset"))), math.rad((v72:GetAttribute("O_YOffset"))), v72:GetAttribute("O_ZOffset"));
                v102 = 12;
                v96 = v96:Lerp(CFrame.new(v72.Head.Position - l_Position_2), v112 * 1.5);
                l_CharacterData_0.Cutscene.Value = true;
                l_CameraMode_0.Value = "Cutscene";
                local l_l_CurrentCamera_0_2 = l_CurrentCamera_0;
                local l_FieldOfView_2 = l_CurrentCamera_0.FieldOfView;
                local l_v72_Attribute_1 = v72:GetAttribute("FOV");
                local v117 = v112 * 3;
                l_l_CurrentCamera_0_2.FieldOfView = l_FieldOfView_2 + (l_v72_Attribute_1 - l_FieldOfView_2) * v117;
                l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame:Lerp(v101 * v96, v112 * v102);
                return;
            else
                v96 = v96:Lerp(CFrame.new(v72.Head.Position - l_Position_2), v112 * 0.5);
                local l_l_CurrentCamera_0_3 = l_CurrentCamera_0;
                local l_FieldOfView_3 = l_CurrentCamera_0.FieldOfView;
                l_l_CurrentCamera_0_3.FieldOfView = l_FieldOfView_3 + (50 - l_FieldOfView_3) * v112;
                l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame:Lerp(v101 * v96, v112 * v102);
                return;
            end;
        end);
        task.wait(0.1);
        local function v123(v120) --[[ Line: 354 ]] --[[ Name: SetPlayersVisible ]]
            -- upvalues: l_EffectHelper_0 (ref)
            for _, v122 in workspace.Live:GetChildren() do
                l_EffectHelper_0.SetTransparency(v122, v120 and 0 or 1);
            end;
            workspace.Settings.HideNametags.Value = not v120;
        end;
        v123(false);
        local l_InteractMusic_0 = v72:FindFirstChild("InteractMusic");
        local v125 = l_InteractMusic_0 and l_InteractMusic_0:FindFirstChild("TargetVolume") and l_InteractMusic_0.TargetVolume.Value or 0.1;
        if l_InteractMusic_0 then
            l_InteractMusic_0.TimePosition = 0;
            l_InteractMusic_0.Looped = true;
            l_InteractMusic_0:Play();
            l_InteractMusic_0.Volume = 0;
            l_TweenService_0:Create(l_InteractMusic_0, v35, {
                Volume = v125
            }):Play();
        end;
        local _ = function() --[[ Line: 383 ]] --[[ Name: RemoveAllButGoodbyeOptions ]]
            -- upvalues: v30 (ref), l_TweenService_0 (ref), v34 (ref), v40 (ref)
            task.spawn(function() --[[ Line: 384 ]]
                -- upvalues: v30 (ref), l_TweenService_0 (ref), v34 (ref), v40 (ref)
                local l_Children_0 = v30.ActiveOptions:GetChildren();
                if #l_Children_0 <= 0 then
                    return;
                else
                    for v127 = #l_Children_0, 1, -1 do
                        local l_FirstChild_1 = v30.ActiveOptions:FindFirstChild((tostring(v127)));
                        if l_FirstChild_1 then
                            l_FirstChild_1.Name = "Removing";
                            l_FirstChild_1.Parent = v30;
                            local l_Position_5 = l_FirstChild_1.Position;
                            l_TweenService_0:Create(l_FirstChild_1, v34, {
                                Position = UDim2.new(l_Position_5.X.Scale + 0.1, 0, l_Position_5.Y.Scale, 0)
                            }):Play();
                            for _, v131 in l_FirstChild_1:GetDescendants() do
                                local v132 = v40[v131.ClassName];
                                if v132 then
                                    local v133 = {
                                        [v132] = 1
                                    };
                                    l_TweenService_0:Create(v131, v34, v133):Play();
                                end;
                            end;
                            task.wait(0.1);
                            task.delay(1, function() --[[ Line: 409 ]]
                                -- upvalues: l_FirstChild_1 (copy)
                                l_FirstChild_1:Destroy();
                            end);
                        end;
                    end;
                    return;
                end;
            end);
        end;
        local v135 = nil;
        local v136 = false;
        v30.Click.Visible = true;
        local l_BertoRewards_0 = l_LocalPlayer_0.PlayerGui:FindFirstChild("BertoRewards");
        if l_BertoRewards_0 then
            l_BertoRewards_0.DisplayOrder = 9999;
        end;
        local function v153() --[[ Line: 435 ]] --[[ Name: Goodbye ]]
            -- upvalues: l_BertoRewards_0 (copy), v30 (ref), v123 (copy), l_CharacterData_0 (copy), v83 (copy), l_Event_0 (copy), l_TweenService_0 (ref), v35 (ref), l_ProximityPromptService_0 (ref), v135 (ref), l_TheGames_0 (ref), l_Workspace_0 (ref), l_InteractMusic_0 (copy), l_CameraMode_0 (copy), l_CurrentCamera_0 (ref), l_RunService_0 (ref), v85 (copy), v33 (ref), l_Position_1 (copy), l_LeftFrame_0 (ref), v36 (ref), l_MainFrame_0 (ref), l_HotbarFrame_0 (ref), v41 (ref), v42 (ref), v40 (ref), l_v85_Descendants_0 (copy), v100 (copy)
            if l_BertoRewards_0 then
                l_BertoRewards_0.DisplayOrder = 0;
            end;
            v30.Click.Visible = false;
            task.spawn(v123, true);
            l_CharacterData_0.CanWalk.Value = true;
            if v83.GoodbyeCallback then
                task.spawn(v83.GoodbyeCallback);
            end;
            if l_Event_0 then
                l_TweenService_0:Create(l_Event_0.Main, v35, {
                    Size = UDim2.new(1, 0, 2, 0)
                }):Play();
            end;
            for _, v139 in workspace.Debris:GetChildren() do
                if v139.Name == "SceneMusic" then
                    l_TweenService_0:Create(v139, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Volume = 0
                    }):Play();
                    task.delay(3, function() --[[ Line: 465 ]]
                        -- upvalues: v139 (copy)
                        if v139 then
                            v139:Destroy();
                        end;
                    end);
                end;
            end;
            task.delay(4.5, function() --[[ Line: 471 ]]
                -- upvalues: l_ProximityPromptService_0 (ref)
                l_ProximityPromptService_0.Enabled = true;
            end);
            if v135 then
                v135 = nil;
                l_TheGames_0.ResetScenes();
            end;
            l_Workspace_0.CurrentMenu.Value = "";
            l_Workspace_0.CurrentCamera.FieldOfView = 70;
            if l_InteractMusic_0 then
                l_TweenService_0:Create(l_InteractMusic_0, v35, {
                    Volume = 0
                }):Play();
            end;
            if not l_CharacterData_0.Opponent.Value then
                l_CameraMode_0.Value = "";
                l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
                l_CharacterData_0.Cutscene.Value = false;
                l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
                l_RunService_0:UnbindFromRenderStep("QuestGiverCamera");
                l_TweenService_0:Create(v85, v33, {
                    Position = UDim2.new(l_Position_1.X.Scale, 0, l_Position_1.Y.Scale + 0.2, 0)
                }):Play();
                l_TweenService_0:Create(l_LeftFrame_0, v36, {
                    Position = UDim2.new(0, 0, 0, 0)
                }):Play();
                l_TweenService_0:Create(l_MainFrame_0, v36, {
                    Position = UDim2.new(0, 0, 0, 0)
                }):Play();
                l_TweenService_0:Create(l_HotbarFrame_0, v36, {
                    Position = UDim2.new(0, 0, 0, 0)
                }):Play();
            end;
            l_Workspace_0.HideRightFrame.Value = false;
            v41 = false;
            v42 = false;
            for v140 = 1, #v30.ActiveOptions:GetChildren() do
                local l_FirstChild_2 = v30.ActiveOptions:FindFirstChild((tostring(v140)));
                if l_FirstChild_2 then
                    l_FirstChild_2.Parent = v30;
                    task.delay((v140 - 1) * 0.1, function() --[[ Line: 514 ]]
                        -- upvalues: l_FirstChild_2 (copy), l_TweenService_0 (ref), v36 (ref), v40 (ref)
                        local l_Position_6 = l_FirstChild_2.Position;
                        l_TweenService_0:Create(l_FirstChild_2, v36, {
                            Position = UDim2.new(l_Position_6.X.Scale + 0.1, 0, l_Position_6.Y.Scale, 0)
                        }):Play();
                        for _, v144 in l_FirstChild_2:GetDescendants() do
                            local v145 = v40[v144.ClassName];
                            if v145 then
                                local v146 = {
                                    [v145] = 1
                                };
                                l_TweenService_0:Create(v144, v36, v146):Play();
                            end;
                        end;
                        task.wait(1);
                        workspace:SetAttribute("OptionsShown", (workspace:GetAttribute("OptionsShown") or 0) - 1);
                        l_FirstChild_2:Destroy();
                    end);
                end;
            end;
            for _, v148 in l_v85_Descendants_0 do
                local v149 = v40[v148.ClassName];
                if v149 then
                    local v150 = {
                        [v149] = 1
                    };
                    l_TweenService_0:Create(v148, v33, v150):Play();
                end;
            end;
            for _, v152 in v100 do
                v152:Disconnect();
            end;
            task.delay(2, function() --[[ Line: 546 ]]
                -- upvalues: v85 (ref)
                v85:Destroy();
            end);
        end;
        local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
        v100[#v100 + 1] = l_Humanoid_0.Died:Connect(function() --[[ Line: 552 ]]
            -- upvalues: v153 (copy)
            v153();
        end);
        local v155 = v25.new(v85.Dialog, {
            DisableWrapping = true, 
            TextHeight = UDim.new(0.25, 0), 
            Colors = {}
        });
        local v156 = "Start" .. v78;
        local v157 = v79[v78];
        local v158 = nil;
        if v157 and v78 ~= "Completed" then
            v158 = v157.Attempts;
        end;
        if v74 then
            local v159 = ("%*_%*"):format(v78, v74);
            v156 = if v83.Dialog[v159] then v159 else v74;
        end;
        if v158 and v158 >= 1 then
            v156 = v156 .. "_" .. v158;
            if not v83.Dialog[v156] then
                v156 = "Start" .. v78 .. "_Final";
            end;
        end;
        if v79.CurrentDay and v79.IsDailyFighting then
            local l_v156_0 = v156;
            for v161 = 0, v79.CurrentDay do
                if v83.Dialog[("%*#%*"):format(v156, v161)] then
                    l_v156_0 = ("%*#%*"):format(v156, v161);
                end;
            end;
            v156 = l_v156_0;
        end;
        if v78 == "Completed" and not v74 then
            v156 = "Completed";
        end;
        local function v162(v163) --[[ Line: 607 ]] --[[ Name: ShowDialogue ]]
            -- upvalues: v75 (copy), v71 (ref), v30 (ref), l_TweenService_0 (ref), v34 (ref), v40 (ref), v135 (ref), l_InteractMusic_0 (copy), v35 (ref), v72 (copy), l_TheGames_0 (ref), l_CurrentCamera_0 (ref), v101 (ref), l_RunService_0 (ref), l_PrimaryPart_0 (copy), l_PrimaryPart_1 (copy), v102 (ref), v96 (ref), l_Position_2 (copy), l_CharacterData_0 (copy), l_CameraMode_0 (copy), v12 (ref), l_DailyTimeRemaining_0 (copy), v125 (copy), v42 (ref), v83 (copy), l_ReplicatedStorage_0 (ref), l_Workspace_0 (ref), v155 (copy), v41 (ref), v158 (ref), v13 (ref), v136 (ref), v76 (copy), v153 (copy), v66 (ref), v162 (copy), v28 (ref)
            if v75 ~= v71 then
                return;
            else
                local l_Text_0 = v163.Text;
                local l_Emote_0 = v163.Emote;
                local l_Sound_0 = v163.Sound;
                local l_EndConvo_0 = v163.EndConvo;
                local l_Callbacks_0 = v163.Callbacks;
                local l_AfterEmote_0 = v163.AfterEmote;
                local l_StartFight_0 = v163.StartFight;
                local l_CreateScene_0 = v163.CreateScene;
                local l_AppendDailyCooldown_0 = v163.AppendDailyCooldown;
                if typeof(l_Text_0) == "table" then
                    l_Text_0 = l_Text_0[math.random(#l_Text_0)];
                end;
                local v173 = false;
                task.spawn(function() --[[ Line: 384 ]]
                    -- upvalues: v30 (ref), l_TweenService_0 (ref), v34 (ref), v40 (ref)
                    local l_Children_1 = v30.ActiveOptions:GetChildren();
                    if #l_Children_1 <= 0 then
                        return;
                    else
                        for v175 = #l_Children_1, 1, -1 do
                            local l_FirstChild_3 = v30.ActiveOptions:FindFirstChild((tostring(v175)));
                            if l_FirstChild_3 then
                                l_FirstChild_3.Name = "Removing";
                                l_FirstChild_3.Parent = v30;
                                local l_Position_7 = l_FirstChild_3.Position;
                                l_TweenService_0:Create(l_FirstChild_3, v34, {
                                    Position = UDim2.new(l_Position_7.X.Scale + 0.1, 0, l_Position_7.Y.Scale, 0)
                                }):Play();
                                for _, v179 in l_FirstChild_3:GetDescendants() do
                                    local v180 = v40[v179.ClassName];
                                    if v180 then
                                        local v181 = {
                                            [v180] = 1
                                        };
                                        l_TweenService_0:Create(v179, v34, v181):Play();
                                    end;
                                end;
                                task.wait(0.1);
                                task.delay(1, function() --[[ Line: 409 ]]
                                    -- upvalues: l_FirstChild_3 (copy)
                                    l_FirstChild_3:Destroy();
                                end);
                            end;
                        end;
                        return;
                    end;
                end);
                if l_CreateScene_0 and l_CreateScene_0 ~= v135 then
                    if l_InteractMusic_0 then
                        l_TweenService_0:Create(l_InteractMusic_0, v35, {
                            Volume = 0
                        }):Play();
                    end;
                    v72:SetAttribute("CurrentEmote", nil);
                    v135 = l_CreateScene_0;
                    l_TheGames_0.CreateScene(l_CreateScene_0);
                elseif not l_CreateScene_0 and v135 then
                    v135 = nil;
                    l_TheGames_0.ResetScenes();
                    if l_InteractMusic_0 then

                    end;
                    l_CurrentCamera_0.CFrame = v101;
                    l_RunService_0:BindToRenderStep("QuestGiverCamera", Enum.RenderPriority.Camera.Value + 2, function(v182) --[[ Line: 318 ]]
                        -- upvalues: v72 (ref), l_PrimaryPart_0 (ref), l_PrimaryPart_1 (ref), v101 (ref), v102 (ref), v96 (ref), l_Position_2 (ref), l_CharacterData_0 (ref), l_CameraMode_0 (ref), l_CurrentCamera_0 (ref)
                        if v72.Name == "AndreBerto" then
                            local l_Position_8 = l_PrimaryPart_0.Position;
                            if v72:GetAttribute("Twist") == 0 then
                                l_Position_8 = (l_PrimaryPart_1.CFrame * CFrame.new(0, 0, -5)).Position;
                            end;
                            v101 = CFrame.new(l_PrimaryPart_1.Position, (Vector3.new(l_Position_8.X, l_PrimaryPart_1.Position.Y, l_Position_8.Z))) * CFrame.new(v72:GetAttribute("XOffset"), v72:GetAttribute("YOffset"), v72:GetAttribute("ZOffset")) * CFrame.fromOrientation(math.rad((v72:GetAttribute("O_XOffset"))), math.rad((v72:GetAttribute("O_YOffset"))), v72:GetAttribute("O_ZOffset"));
                            v102 = 12;
                            v96 = v96:Lerp(CFrame.new(v72.Head.Position - l_Position_2), v182 * 1.5);
                            l_CharacterData_0.Cutscene.Value = true;
                            l_CameraMode_0.Value = "Cutscene";
                            local l_l_CurrentCamera_0_4 = l_CurrentCamera_0;
                            local l_FieldOfView_4 = l_CurrentCamera_0.FieldOfView;
                            local l_v72_Attribute_2 = v72:GetAttribute("FOV");
                            local v187 = v182 * 3;
                            l_l_CurrentCamera_0_4.FieldOfView = l_FieldOfView_4 + (l_v72_Attribute_2 - l_FieldOfView_4) * v187;
                            l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame:Lerp(v101 * v96, v182 * v102);
                            return;
                        else
                            v96 = v96:Lerp(CFrame.new(v72.Head.Position - l_Position_2), v182 * 0.5);
                            local l_l_CurrentCamera_0_5 = l_CurrentCamera_0;
                            local l_FieldOfView_5 = l_CurrentCamera_0.FieldOfView;
                            l_l_CurrentCamera_0_5.FieldOfView = l_FieldOfView_5 + (50 - l_FieldOfView_5) * v182;
                            l_CurrentCamera_0.CFrame = l_CurrentCamera_0.CFrame:Lerp(v101 * v96, v182 * v102);
                            return;
                        end;
                    end);
                end;
                if l_Sound_0 then
                    v12:PlaySound({
                        SoundId = l_Sound_0, 
                        MinDist = 10, 
                        Volume = 1.5, 
                        Looped = false, 
                        Parent = v72.PrimaryPart, 
                        Name = "Dialogue"
                    });
                end;
                local v190 = 0;
                if l_AppendDailyCooldown_0 and l_DailyTimeRemaining_0 then
                    local l_l_Text_0_0 = l_Text_0;
                    local v192 = l_DailyTimeRemaining_0 - workspace:GetServerTimeNow();
                    local v193 = math.floor(v192 / 3600);
                    v192 = v192 - v193 * 3600;
                    local v194 = math.floor(v192 / 60);
                    l_Text_0 = l_l_Text_0_0 .. ("%02d:%02d:%02d"):format(v193, v194, v192 - v194 * 60) .. ".";
                end;
                local v200 = {
                    Finished = function() --[[ Line: 669 ]]
                        -- upvalues: v173 (ref)
                        v173 = true;
                    end, 
                    StopMusic = function() --[[ Line: 673 ]]
                        -- upvalues: l_TweenService_0 (ref), l_InteractMusic_0 (ref), v35 (ref)
                        for _, v196 in workspace.Debris:GetChildren() do
                            if v196.Name == "SceneMusic" then
                                l_TweenService_0:Create(v196, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    Volume = 0
                                }):Play();
                                task.delay(3, function() --[[ Line: 678 ]]
                                    -- upvalues: v196 (copy)
                                    if v196 then
                                        v196:Destroy();
                                    end;
                                end);
                            end;
                        end;
                        if not l_InteractMusic_0 then
                            return;
                        else
                            l_TweenService_0:Create(l_InteractMusic_0, v35, {
                                Volume = 0
                            }):Play();
                            return;
                        end;
                    end, 
                    StartMusic = function() --[[ Line: 688 ]]
                        -- upvalues: l_InteractMusic_0 (ref), l_TweenService_0 (ref), v35 (ref), v125 (ref)
                        if not l_InteractMusic_0 then
                            return;
                        else
                            l_TweenService_0:Create(l_InteractMusic_0, v35, {
                                Volume = v125
                            }):Play();
                            return;
                        end;
                    end, 
                    OnCharacter = function(v197) --[[ Line: 693 ]]
                        -- upvalues: v42 (ref), v83 (ref), l_ReplicatedStorage_0 (ref), v190 (ref), l_Workspace_0 (ref)
                        if not v42 then
                            return;
                        else
                            local l_TalkSound_0 = v83.TalkSound;
                            if not l_TalkSound_0 then
                                return;
                            else
                                local l_FirstChild_4 = l_ReplicatedStorage_0.TalkSounds:FindFirstChild(l_TalkSound_0);
                                if not l_FirstChild_4 then
                                    return;
                                else
                                    v190 = v190 + 1;
                                    if not v197 and v190 % 3 ~= 0 then
                                        return;
                                    else
                                        l_FirstChild_4 = l_FirstChild_4:Clone();
                                        l_FirstChild_4.Parent = l_Workspace_0;
                                        l_FirstChild_4.PlayOnRemove = true;
                                        l_FirstChild_4:Destroy();
                                        return;
                                    end;
                                end;
                            end;
                        end;
                    end
                };
                if l_Callbacks_0 then
                    for v201, v202 in l_Callbacks_0 do
                        if v200[v201] then
                            warn((("'%*' is a reserved callback, please use another ID"):format(v201)));
                        else
                            v200[v201] = v202;
                        end;
                    end;
                end;
                v155:Render(("%* <bounce speed=\"0.04\" offset=\"0.2\">\240\159\148\187</bounce><cb id=\"Finished\" />"):format(l_Text_0), {
                    Callbacks = v200
                });
                local v203 = false;
                local v204 = task.spawn(function() --[[ Line: 734 ]]
                    -- upvalues: v41 (ref), l_RunService_0 (ref), v158 (ref), l_StartFight_0 (copy), l_CreateScene_0 (copy), v203 (ref), v155 (ref)
                    task.wait(0.15);
                    repeat
                        task.wait();
                    until v41;
                    v41 = false;
                    if not l_RunService_0:IsStudio() and (not v158 or v158 <= 0) and (l_StartFight_0 or l_CreateScene_0) then
                        return;
                    else
                        v203 = true;
                        v155:SkipAhead();
                        return;
                    end;
                end);
                if l_Emote_0 then
                    task.spawn(function() --[[ Line: 748 ]]
                        -- upvalues: v13 (ref), l_Emote_0 (copy), v72 (ref)
                        v13[l_Emote_0].Use(v72);
                    end);
                end;
                if l_StartFight_0 then
                    repeat
                        task.wait();
                    until v173;
                end;
                if l_StartFight_0 then
                    v136 = true;
                    task.delay(0.25, function() --[[ Line: 761 ]]
                        -- upvalues: l_TheGames_0 (ref), v72 (ref), v76 (ref), l_StartFight_0 (copy)
                        l_TheGames_0.EventStartFight({
                            NPC = v72, 
                            Fight = ("%*_%*"):format(v76, l_StartFight_0)
                        });
                    end);
                    task.delay(1, function() --[[ Line: 768 ]]
                        -- upvalues: v153 (ref)
                        v153();
                    end);
                end;
                repeat
                    task.wait();
                until v173;
                if l_EndConvo_0 then
                    v153();
                end;
                coroutine.close(v204);
                v41 = false;
                if l_AfterEmote_0 then
                    task.spawn(function() --[[ Line: 783 ]]
                        -- upvalues: v13 (ref), l_AfterEmote_0 (copy), v72 (ref)
                        v13[l_AfterEmote_0].Use(v72);
                    end);
                end;
                if v203 then

                end;
                local l_Options_0 = v163.Options;
                local v206 = true;
                local v207 = false;
                local v208 = false;
                task.delay(1, function() --[[ Line: 797 ]]
                    -- upvalues: v208 (ref)
                    v208 = true;
                end);
                task.spawn(function() --[[ Line: 801 ]]
                    -- upvalues: v66 (ref), v208 (ref), v136 (ref), v207 (ref), v206 (ref), v153 (ref), l_Options_0 (copy), v75 (ref), v71 (ref), v162 (ref), v83 (ref)
                    local v209 = v66({
                        Icon = "Goodbye", 
                        Text = "Goodbye."
                    });
                    if v209 then
                        local v210 = nil;
                        v210 = v209.Event:Connect(function() --[[ Line: 808 ]]
                            -- upvalues: v208 (ref), v136 (ref), v207 (ref), v206 (ref), v153 (ref)
                            if not v208 or v136 or v207 or not v206 then
                                return;
                            else
                                v207 = true;
                                v153();
                                return;
                            end;
                        end);
                        task.wait(0.35);
                    end;
                    if l_Options_0 then
                        v206 = false;
                        workspace:SetAttribute("OptionsShown", #l_Options_0);
                        for _, v212 in l_Options_0 do
                            if v75 ~= v71 then
                                return;
                            else
                                local v213 = v66(v212);
                                if not v213 then
                                    return;
                                else
                                    local v214 = nil;
                                    do
                                        local l_v214_0 = v214;
                                        l_v214_0 = v213.Event:Connect(function() --[[ Line: 829 ]]
                                            -- upvalues: v206 (ref), v207 (ref), l_v214_0 (ref), v212 (copy), v162 (ref), v83 (ref), v153 (ref)
                                            if not v206 or v207 then
                                                return;
                                            else
                                                v207 = true;
                                                l_v214_0:Disconnect();
                                                if v212.Type == "ExtraDialog" then
                                                    v162(v83.Dialog[v212.GoTo]);
                                                    return;
                                                elseif v212.Type == "Gamepass" then
                                                    game:GetService("MarketplaceService"):PromptGamePassPurchase(game.Players.LocalPlayer, 1602385613);
                                                    v153();
                                                    return;
                                                else
                                                    if v212.Type == "Fight" then

                                                    end;
                                                    return;
                                                end;
                                            end;
                                        end);
                                        task.wait(0.35);
                                    end;
                                end;
                            end;
                        end;
                        v206 = true;
                    end;
                end);
                repeat
                    task.wait();
                until v41 and v206;
                v41 = false;
                local l_GoTo_0 = v163.GoTo;
                if l_GoTo_0 then
                    if l_GoTo_0 == "Goodbye" then
                        v153();
                        return;
                    else
                        v162(v83.Dialog[l_GoTo_0]);
                    end;
                end;
                if v163.OpenQuests then
                    local l_Execute_0 = v28.LeftFrame.Container.Quests:FindFirstChild("Execute");
                    if not l_Execute_0 then
                        return;
                    else
                        l_Execute_0:Fire();
                        v153();
                    end;
                end;
                return;
            end;
        end;
        v162(v83.Dialog[v156]);
        return;
    end;
end;
CacheJoints = function(v218) --[[ Line: 881 ]] --[[ Name: CacheJoints ]]
    local v219 = v218:FindFirstChild("BaseJointFolder") or Instance.new("Folder", v218);
    v219.Name = "BaseJointFolder";
    v219:ClearAllChildren();
    local v220 = v218:WaitForChild("UpperTorso"):WaitForChild("Waist"):Clone();
    v220.Part0 = nil;
    v220.Parent = v219;
    local v221 = v218:WaitForChild("Head"):WaitForChild("Neck"):Clone();
    v221.Part0 = nil;
    v221.Parent = v219;
    local v222 = v218:WaitForChild("RightUpperArm"):WaitForChild("RightShoulder"):Clone();
    v222.Part0 = nil;
    v222.Parent = v219;
    local v223 = v218:WaitForChild("LeftUpperArm"):WaitForChild("LeftShoulder"):Clone();
    v223.Part0 = nil;
    v223.Parent = v219;
    local v224 = v218:FindFirstChild("LookVector") or Instance.new("Vector3Value", v218);
    v224.Name = "LookVector";
    v224.Value = v218.HumanoidRootPart.CFrame.LookVector;
end;
v15:Connect(function(v225) --[[ Line: 911 ]]
    -- upvalues: v43 (copy)
    v43[v225.EventName] = v225.EventData;
end);
local function v240(v226) --[[ Line: 940 ]] --[[ Name: SetupNPC ]]
    -- upvalues: v43 (copy), v15 (copy), l_Workspace_0 (copy), v11 (copy)
    CacheJoints(v226);
    local l_ProximityPrompt_0 = v226.PrimaryPart:FindFirstChild("ProximityPrompt");
    l_ProximityPrompt_0.Enabled = true;
    local v228 = false;
    l_ProximityPrompt_0.Triggered:Connect(function(v229) --[[ Line: 948 ]]
        -- upvalues: v228 (ref), v226 (copy), v43 (ref), v15 (ref), l_Workspace_0 (ref)
        if v228 then
            return;
        else
            local v230 = v226:GetAttribute("QuestName") or v226.Name;
            local function v232() --[[ Line: 955 ]] --[[ Name: Sync ]]
                -- upvalues: v43 (ref), v230 (copy), v228 (ref), v15 (ref)
                v43[v230] = nil;
                v228 = true;
                v15:Fire(v230);
                local v231 = 0;
                while not v43[v230] and v231 < 3 do
                    v231 = v231 + task.wait(0.1);
                end;
                v228 = false;
            end;
            if not v43[v230] then
                v232();
            else
                local v233 = v43[v230];
                if v233.DailyTimeRemaining and v233.DailyTimeRemaining - l_Workspace_0:GetServerTimeNow() < 0 then
                    v232();
                end;
            end;
            local l_status_0, l_result_0 = pcall(Triggered, v226, v229);
            if not l_status_0 then
                task.spawn(error, debug.traceback(l_result_0));
            end;
            return;
        end;
    end);
    local l_Humanoid_1 = v226:FindFirstChild("Humanoid");
    local v237 = l_Humanoid_1 and (l_Humanoid_1:FindFirstChild("Animator") or l_Humanoid_1);
    local l_IdleAnimId_0 = v226:FindFirstChild("IdleAnimId");
    if not l_IdleAnimId_0 then
        return;
    else
        local v239 = {
            Priority = Enum.AnimationPriority.Core, 
            Animator = v237, 
            AnimId = l_IdleAnimId_0.Value, 
            Looped = true
        };
        v11:CreateAnim(v239);
        return;
    end;
end;
for _, v242 in v29:GetChildren() do
    v240(v242);
end;
v14.ReferenceBridge("ForceQuestGiverInteract"):Connect(function(v243) --[[ Line: 1007 ]]
    -- upvalues: v29 (copy), l_Players_0 (copy)
    local l_v29_FirstChild_0 = v29:FindFirstChild(v243.NPC);
    if l_v29_FirstChild_0 then
        Triggered(l_v29_FirstChild_0, l_Players_0.LocalPlayer, v243.ForceDialogue);
    end;
end);
v29.ChildAdded:Connect(v240);
l_RunService_0.Heartbeat:Connect(function(v245) --[[ Line: 1016 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v29 (copy), v42 (ref)
    local v246 = l_LocalPlayer_0 and l_LocalPlayer_0.Character;
    local v247 = v246 and v246.PrimaryPart;
    if not v247 then
        return;
    else
        for _, v249 in v29:GetChildren() do
            local v250 = nil;
            v250 = if typeof(v247) == "Vector3" then v247 else v247.Position;
            local l_PrimaryPart_2 = v249.PrimaryPart;
            local v252 = -(l_PrimaryPart_2.Position - v250).Unit;
            local v253 = math.min(v245 * 5, 1);
            local v254 = math.min(v245 * 20, 1);
            local l_BaseJointFolder_0 = v249.BaseJointFolder;
            local v256 = l_PrimaryPart_2.CFrame.LookVector:Dot(v252) < 0 and 0 or 1;
            local v257 = (math.asin(v252.Y) - math.asin(l_PrimaryPart_2.CFrame.LookVector.Y) * 0.5) * v256;
            local l_Waist_0 = v249.UpperTorso.Waist;
            local l_Neck_0 = v249.Head.Neck;
            local l_RightShoulder_0 = v249.RightUpperArm.RightShoulder;
            local l_LeftShoulder_0 = v249.LeftUpperArm.LeftShoulder;
            local l_UpperTorso_0 = v249.UpperTorso;
            local l_LookVector_0 = l_UpperTorso_0.CFrame.LookVector;
            local v264 = math.atan2(l_UpperTorso_0.CFrame.RightVector:Dot(v252), (l_LookVector_0:Dot(v252))) * v256;
            if v249.Name == "AndreBerto" then
                v249:SetAttribute("Twist", v264);
            end;
            if not v42 or not v249:GetAttribute("CurrentEmote") then
                l_Neck_0.C0 = l_Neck_0.C0:Lerp(l_BaseJointFolder_0.Neck.C0 * CFrame.Angles(v257 * 0.6, -v264 * 0.75, 0), v253);
            end;
            l_Waist_0.C1 = l_Waist_0.C1:Lerp(l_BaseJointFolder_0.Waist.C1 * CFrame.Angles(0, v264 * 0.5, 0), v253);
            l_Waist_0.C0 = l_Waist_0.C0:Lerp(l_BaseJointFolder_0.Waist.C0 * CFrame.Angles(v257 * 0.3, 0, 0), v253);
            l_RightShoulder_0.C0 = l_RightShoulder_0.C0:Lerp(l_BaseJointFolder_0.RightShoulder.C0 * CFrame.Angles(0, 0, 0), v254);
            l_LeftShoulder_0.C0 = l_LeftShoulder_0.C0:Lerp(l_BaseJointFolder_0.LeftShoulder.C0 * CFrame.Angles(0, 0, 0), v254);
        end;
        return;
    end;
end);