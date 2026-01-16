local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_TweenService_0 = game:GetService("TweenService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local l_BlockGui_0 = l_ReplicatedStorage_0:WaitForChild("Assets"):WaitForChild("BlockGui");
local l_Live_0 = l_Workspace_0:WaitForChild("Live");
local l_States_0 = l_Workspace_0:WaitForChild("States");
local v13 = Vector2.new(1, 1);
local v14 = TweenInfo.new(0, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
local v15 = TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
SetBlockGui = function(v16) --[[ Line: 26 ]] --[[ Name: SetBlockGui ]]
    -- upvalues: v13 (copy), l_TweenService_0 (copy), v14 (copy), v15 (copy)
    local l_Enabled_0 = v16.Enabled;
    local l_BlockGui_1 = v16.BlockGui;
    local _ = v16.Blocking;
    local l_IgnoreTween_0 = v16.IgnoreTween;
    local l_BlockEnergy_0 = v16.BlockEnergy;
    local v22 = l_BlockGui_1 and l_BlockGui_1:FindFirstChild("Main");
    if not v22 then
        return;
    elseif l_Enabled_0 and l_BlockEnergy_0.Value > 0 then
        v22.Size = UDim2.new(v13.X / 2, 0, 0, 0);
        if not l_IgnoreTween_0 then
            l_TweenService_0:Create(v22, v14, {
                Size = UDim2.new(v13.X, 0, v13.Y, 0)
            }):Play();
            return;
        else
            v22.Size = UDim2.new(v13.X, 0, v13.Y, 0);
            return;
        end;
    elseif not l_IgnoreTween_0 then
        l_TweenService_0:Create(v22, v15, {
            Size = UDim2.new(v13.X / 2, 0, 0, 0)
        }):Play();
        return;
    else
        v22.Size = UDim2.new(v13.X / 2, 0, 0, 0);
        return;
    end;
end;
UpdateBlockGui = function(v23) --[[ Line: 58 ]] --[[ Name: UpdateBlockGui ]]
    local l_MaxBlockEnergy_0 = v23.MaxBlockEnergy;
    local l_NewEnergy_0 = v23.NewEnergy;
    local l_BlockGui_2 = v23.BlockGui;
    local v27 = 1 - math.min(l_NewEnergy_0 / l_MaxBlockEnergy_0, 1);
    local l_Main_0 = l_BlockGui_2:FindFirstChild("Main");
    if not l_Main_0 then
        return;
    else
        l_Main_0.Frame.Size = UDim2.new(1, 0, v27, 0);
        l_Main_0.Frame.ImageLabel.Size = UDim2.new(1, 0, 1 / v27, 0);
        return;
    end;
end;
local _ = {};
local _ = require(l_ReplicatedFirst_0:WaitForChild("Rosyn"));
local _ = require(l_ReplicatedFirst_0:WaitForChild("Cleaner"));
local l_SurfaceBillboard_0 = require(l_ReplicatedStorage_0:WaitForChild("Client"):WaitForChild("Components"):WaitForChild("SurfaceBillboard"));
local l_CollectionService_0 = game:GetService("CollectionService");
local v34 = l_Workspace_0:WaitForChild("States"):WaitForChild(l_Players_0.LocalPlayer.Name);
local l_CharacterData_0 = v34:WaitForChild("CharacterData");
local l_Occupied_0 = v34:WaitForChild("Occupied");
local l_Opponent_0 = l_CharacterData_0:WaitForChild("Opponent");
local _ = l_Occupied_0:WaitForChild("LockedOn");
local _ = workspace.Settings;
local l_HiddenStorage_0 = game:GetService("ServerStorage"):WaitForChild("HiddenStorage");
Changed = function() --[[ Line: 93 ]] --[[ Name: Changed ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Opponent_0 (copy), l_CollectionService_0 (copy), l_HiddenStorage_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    local l_Value_0 = l_Opponent_0.Value;
    for _, v44 in l_CollectionService_0:GetTagged("BlockGUIs") do
        if v44.Name ~= "Remove" and v44.Name ~= l_Character_0.Name and (not l_Opponent_0.Value or v44.Name ~= l_Opponent_0.Value.Name) then
            if l_HiddenStorage_0:FindFirstChild(v44.Name) then
                v44.SurfaceGui.Main.Visible = false;
            else
                v44.SurfaceGui.Main.Visible = not l_Value_0;
            end;
        end;
    end;
end;
local v45 = {};
HandleCharacter = function(v46) --[[ Line: 114 ]] --[[ Name: HandleCharacter ]]
    -- upvalues: l_Players_0 (copy), l_States_0 (copy), l_SurfaceBillboard_0 (copy), l_BlockGui_0 (copy), l_CollectionService_0 (copy), l_Styles_0 (copy), l_LocalPlayer_0 (copy), l_CurrentCamera_0 (copy), l_AnimHelper_0 (copy), v45 (copy), l_Workspace_0 (copy)
    local v47 = v46 and v46.PrimaryPart or v46:WaitForChild("HumanoidRootPart", 5);
    if not v47 then
        return;
    else
        local v48 = v46 and workspace.Welds:FindFirstChild(v46.Name);
        local v49 = v48 and v48:FindFirstChild("WeldCharacter") or v46;
        if l_Players_0:GetPlayerFromCharacter(v46) then
            v49 = v48 and v48:WaitForChild("WeldCharacter", 10) or v46;
        end;
        local v50 = l_States_0:WaitForChild(v46.Name, 10);
        if not v50 then
            return;
        else
            local l_l_SurfaceBillboard_0_FromBillboard_0 = l_SurfaceBillboard_0:CreateFromBillboard(l_BlockGui_0:Clone(), 2);
            if not l_l_SurfaceBillboard_0_FromBillboard_0 then
                return;
            else
                local l_Root_0 = l_l_SurfaceBillboard_0_FromBillboard_0.Root;
                l_Root_0.Name = v46.Name;
                l_CollectionService_0:AddTag(l_Root_0, "BlockGUIs");
                l_l_SurfaceBillboard_0_FromBillboard_0:SetAdornee(v49.PrimaryPart);
                v46.AncestryChanged:Connect(function() --[[ Line: 137 ]]
                    Changed();
                end);
                local l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0 = l_l_SurfaceBillboard_0_FromBillboard_0:GetUIRoot();
                local _ = v50:FindFirstChild("Occupied");
                local l_PlayerData_0 = v50:FindFirstChild("PlayerData");
                local l_CharacterData_1 = v50:FindFirstChild("CharacterData");
                local v57 = l_PlayerData_0:WaitForChild("Style", 30);
                local l_Humanoid_0 = v46:FindFirstChild("Humanoid");
                local v59 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
                local l_BlockAnimations_0 = l_Styles_0[v57.Value].BlockAnimations;
                local v61 = {
                    Name = "Remove", 
                    FadeIn = v46 == l_LocalPlayer_0.Character and 0 or 0.08333333333333333, 
                    Weight = 2, 
                    Looped = true, 
                    AnimId = l_BlockAnimations_0.Idle, 
                    Priority = l_BlockAnimations_0.IdlePriority or Enum.AnimationPriority.Action2, 
                    Animator = v59
                };
                local v62 = l_CharacterData_1 and l_CharacterData_1:FindFirstChild("Blocking");
                local v63 = l_CharacterData_1 and l_CharacterData_1:FindFirstChild("BlockEnergy");
                local v64 = l_CharacterData_1 and l_CharacterData_1:FindFirstChild("MaxBlockEnergy");
                local function v68(v65) --[[ Line: 167 ]] --[[ Name: StopBlockAnim ]]
                    -- upvalues: v59 (copy)
                    if not v59 then
                        return;
                    else
                        for _, v67 in (v59:GetPlayingAnimationTracks()) do
                            if v67.Name == "Remove" then
                                v67:Stop(v65);
                            end;
                        end;
                        return;
                    end;
                end;
                local l_Character_1 = l_LocalPlayer_0.Character;
                local v70 = v46 == l_Character_1;
                local function v75() --[[ Line: 181 ]] --[[ Name: Update ]]
                    -- upvalues: l_BlockAnimations_0 (ref), l_Styles_0 (ref), v57 (copy), v62 (ref), l_CharacterData_1 (copy), v63 (ref), v64 (ref), v61 (ref), v46 (copy), l_LocalPlayer_0 (ref), v59 (copy), l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0 (copy), v47 (copy), l_CurrentCamera_0 (ref), v70 (copy), l_AnimHelper_0 (ref), v68 (copy)
                    l_BlockAnimations_0 = l_Styles_0[v57.Value].BlockAnimations;
                    v62 = l_CharacterData_1 and l_CharacterData_1:FindFirstChild("Blocking");
                    v63 = l_CharacterData_1 and l_CharacterData_1:FindFirstChild("BlockEnergy");
                    v64 = l_CharacterData_1 and l_CharacterData_1:FindFirstChild("MaxBlockEnergy");
                    v61 = {
                        Name = "Remove", 
                        FadeIn = v46 == l_LocalPlayer_0.Character and 0 or 0.08333333333333333, 
                        Weight = 2, 
                        Looped = true, 
                        AnimId = l_BlockAnimations_0.Idle, 
                        Priority = l_BlockAnimations_0.IdlePriority or Enum.AnimationPriority.Action2, 
                        Animator = v59
                    };
                    UpdateBlockGui({
                        NewEnergy = v63.Value, 
                        BlockGui = l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0, 
                        MaxBlockEnergy = v64.Value
                    });
                    local l_Main_1 = l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0:FindFirstChild("Main");
                    local v72 = l_Main_1 and l_Main_1:FindFirstChild("Frame") and l_Main_1.Frame:FindFirstChild("ImageLabel");
                    if l_Main_1 then
                        l_Main_1.Image = l_Styles_0[v57.Value].CoreInfo.CustomBlockImage or "http://www.roblox.com/asset/?id=13407983870";
                    end;
                    if v72 then
                        v72.Image = l_Main_1.Image;
                    end;
                    local l_Magnitude_0 = (v47.Position - l_CurrentCamera_0.CFrame.Position).Magnitude;
                    local v74 = {
                        Enabled = v62.Value, 
                        Blocking = v62, 
                        BlockEnergy = v63, 
                        BlockGui = l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0, 
                        IgnoreTween = l_Magnitude_0 > 50
                    };
                    SetBlockGui(v74);
                    if v70 then
                        return;
                    elseif v62.Value then
                        l_AnimHelper_0:CreateAnim(v61);
                        return;
                    else
                        v68(0.25);
                        return;
                    end;
                end;
                v75();
                game:GetService("ReplicatedStorage"):WaitForChild("Events", 30):WaitForChild("RemoteConfigLoaded", 30).Event:Connect(function() --[[ Line: 237 ]]
                    -- upvalues: v75 (copy)
                    task.wait(1);
                    v75();
                end);
                v45[v46] = {};
                v45[v46][#v45 + 1] = v57.Changed:Connect(function() --[[ Line: 245 ]]
                    -- upvalues: v75 (copy)
                    v75();
                end);
                v45[v46][#v45 + 1] = v64.Changed:Connect(function() --[[ Line: 249 ]]
                    -- upvalues: v75 (copy)
                    v75();
                end);
                if not v62 then
                    return;
                else
                    local l_LockedOn_1 = l_States_0[l_Character_1.Name].Occupied.LockedOn;
                    SetBlockGui({
                        Enabled = v62.Value, 
                        Blocking = v62, 
                        BlockEnergy = v63, 
                        BlockGui = l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0, 
                        IgnoreTween = true
                    });
                    v45[v46][#v45 + 1] = v62.Changed:Connect(function(_) --[[ Line: 267 ]]
                        -- upvalues: v75 (copy)
                        v75();
                    end);
                    local v78 = nil;
                    local l_Value_1 = v63.Value;
                    v45[v46][#v45 + 1] = v63.Changed:Connect(function(v80) --[[ Line: 276 ]]
                        -- upvalues: v78 (ref), l_Value_1 (ref), v70 (copy), l_LockedOn_1 (copy), v46 (copy), l_Character_1 (copy), l_Workspace_0 (ref), l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0 (copy), v63 (ref), v64 (ref)
                        local v81 = tick();
                        v78 = v81;
                        if v80 < l_Value_1 and (v70 or l_LockedOn_1.Value and l_LockedOn_1.Value == v46) then
                            local v82 = 10000;
                            if l_LockedOn_1.Value == v46 then
                                v82 = l_Character_1:GetAttribute("LandTime");
                            elseif v70 then
                                v82 = l_LockedOn_1.Value and l_LockedOn_1.Value:GetAttribute("LandTime");
                            end;
                            local l_l_Workspace_0_ServerTimeNow_0 = l_Workspace_0:GetServerTimeNow();
                            local v84 = v82 and l_l_Workspace_0_ServerTimeNow_0 - v82 or 10000;
                            if v84 > 0 and v84 < 0.5 then
                                task.wait(v84 + 0.06666666666666667);
                                if v78 ~= v81 then
                                    return;
                                end;
                            end;
                        end;
                        local v85 = {
                            BlockGui = l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0, 
                            NewEnergy = v63.Value, 
                            MaxBlockEnergy = v64.Value
                        };
                        l_Value_1 = v63.Value;
                        UpdateBlockGui(v85);
                    end);
                    UpdateBlockGui({
                        NewEnergy = v63.Value, 
                        BlockGui = l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0, 
                        MaxBlockEnergy = v64.Value
                    });
                    Changed();
                    return;
                end;
            end;
        end;
    end;
end;
repeat
    task.wait();
until l_LocalPlayer_0:GetAttribute("Loaded");
l_Live_0.ChildAdded:Connect(function(v86) --[[ Line: 325 ]]
    HandleCharacter(v86);
end);
for _, v88 in l_Live_0:GetChildren() do
    task.defer(function() --[[ Line: 330 ]]
        -- upvalues: v88 (copy)
        HandleCharacter(v88);
    end);
end;
l_Workspace_0.CurrentMenu.Changed:Connect(function() --[[ Line: 335 ]]
    Changed();
end);
l_Opponent_0.Changed:Connect(function() --[[ Line: 339 ]]
    Changed();
end);
l_Workspace_0.Live.ChildRemoved:Connect(function(v89) --[[ Line: 343 ]]
    -- upvalues: l_HiddenStorage_0 (copy), v45 (copy)
    if v89:IsDescendantOf(l_HiddenStorage_0) then
        return;
    elseif not v45[v89] then
        return;
    else
        for _, v91 in v45[v89] do
            v91:Disconnect();
        end;
        v45[v89] = nil;
        return;
    end;
end);
Changed();