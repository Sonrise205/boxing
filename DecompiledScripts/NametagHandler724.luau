local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_TweenService_0 = game:GetService("TweenService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
if game.PlaceId == l_Places_0.Ranked then
    return;
else
    local l_Titles_0 = l_ReplicatedStorage_0:WaitForChild("Titles");
    local l_List_0 = require(l_Titles_0:WaitForChild("List"));
    local l_Gradients_0 = l_Titles_0:WaitForChild("Gradients");
    local l_Nametag_0 = l_ReplicatedStorage_0:WaitForChild("Assets"):WaitForChild("Nametag");
    local l_RankHelper_0 = require(l_ReplicatedStorage_0:WaitForChild("RankHelper"));
    local l_MaxDistance_0 = l_Nametag_0.MaxDistance;
    local l_Size_0 = l_Nametag_0.Container.Size;
    SetGradientProgress = function(v13, v14) --[[ Line: 25 ]] --[[ Name: SetGradientProgress ]]
        local v15 = v13 and v13:FindFirstChild("UIGradient");
        if not v15 then
            return;
        else
            v14 = math.clamp(v14, 0, 1);
            if v14 > 0.998 then
                v14 = v14 - 0.003;
            end;
            v15.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1), 
                NumberSequenceKeypoint.new(v14 + 0.001, 1), 
                NumberSequenceKeypoint.new(v14 + 0.002, 0), 
                NumberSequenceKeypoint.new(1, 0)
            });
            return;
        end;
    end;
    local v16 = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
    local l_Rosyn_0 = require(l_ReplicatedFirst_0:WaitForChild("Rosyn"));
    local _ = require(l_ReplicatedFirst_0:WaitForChild("Cleaner"));
    local l_SurfaceBillboard_0 = require(l_ReplicatedStorage_0:WaitForChild("Client"):WaitForChild("Components"):WaitForChild("SurfaceBillboard"));
    local l_CollectionService_0 = game:GetService("CollectionService");
    local _ = {};
    local l_LockedOn_0 = l_Workspace_0:WaitForChild("States"):WaitForChild(l_Players_0.LocalPlayer.Name):WaitForChild("Occupied"):WaitForChild("LockedOn");
    local l_Settings_0 = workspace.Settings;
    local l_HiddenStorage_0 = game:GetService("ServerStorage"):WaitForChild("HiddenStorage");
    Changed = function() --[[ Line: 66 ]] --[[ Name: Changed ]]
        -- upvalues: l_Players_0 (copy), l_LockedOn_0 (copy), l_Workspace_0 (copy), l_Settings_0 (copy), l_CollectionService_0 (copy), l_HiddenStorage_0 (copy)
        if not l_Players_0.LocalPlayer.Character then
            return;
        else
            local v25 = l_LockedOn_0.Value or l_Workspace_0.CurrentMenu.Value == "Emotes" or l_Settings_0.HideNametags.Value;
            for _, v27 in l_CollectionService_0:GetTagged("Nametag") do
                if v27.Name ~= "Remove" then
                    if l_HiddenStorage_0:FindFirstChild(v27.Name) then
                        v27.SurfaceGui.Container.Visible = false;
                    elseif v25 then
                        v27.SurfaceGui.Container.Visible = false;
                    else
                        v27.SurfaceGui.Container.Visible = true;
                    end;
                end;
            end;
            return;
        end;
    end;
    local v28 = {};
    AddNametag = function(v29) --[[ Line: 91 ]] --[[ Name: AddNametag ]]
        -- upvalues: l_Players_0 (copy), l_Nametag_0 (copy), l_SurfaceBillboard_0 (copy), l_CollectionService_0 (copy), l_Workspace_0 (copy), l_Rosyn_0 (copy), v28 (copy), l_List_0 (copy), l_Gradients_0 (copy), l_RankHelper_0 (copy), l_TweenService_0 (copy), v16 (copy), l_Size_0 (copy), l_MaxDistance_0 (copy)
        local v30 = v29 == l_Players_0.LocalPlayer.Character;
        if v29:GetAttribute("ActiveNPC") and not v29:GetAttribute("ServerOwnedNPC") then
            return;
        else
            local v31 = l_Nametag_0:Clone();
            local v32 = v29 and workspace.Welds:FindFirstChild(v29.Name);
            local v33 = v32 and v32:WaitForChild("WeldCharacter", 10) or v29;
            local l_l_SurfaceBillboard_0_FromBillboard_0 = l_SurfaceBillboard_0:CreateFromBillboard(v31, 2);
            if not l_l_SurfaceBillboard_0_FromBillboard_0 then
                return;
            else
                local l_Root_0 = l_l_SurfaceBillboard_0_FromBillboard_0.Root;
                l_Root_0.Name = v29.Name;
                l_CollectionService_0:AddTag(l_Root_0, "Nametag");
                local l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0 = l_l_SurfaceBillboard_0_FromBillboard_0:GetUIRoot();
                local v37 = l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0:WaitForChild("Container", 30);
                local v38 = v37:WaitForChild("Main", 30);
                local v39 = v38:WaitForChild("Title", 30);
                local v40 = v38:WaitForChild("Username", 30);
                local v41 = v37:WaitForChild("Info", 30);
                local v42 = v41:WaitForChild("Health", 30);
                local v43 = v37:WaitForChild("Rating", 30);
                local l_ExtentsOffsetWorldSpace_0 = l_Nametag_0.ExtentsOffsetWorldSpace;
                if v30 then
                    l_ExtentsOffsetWorldSpace_0 = Vector3.new(0, 3, 0, 0);
                    v41.Visible = false;
                end;
                l_ExtentsOffsetWorldSpace_0 = l_ExtentsOffsetWorldSpace_0 - Vector3.new(0, 1.600000023841858, 0, 0);
                l_Root_0:SetAttribute("DistanceScale", 1);
                l_Root_0:SetAttribute("MinimumScale", 1);
                l_Root_0:SetAttribute("MaximumScale", 1);
                l_Root_0:SetAttribute("MaxDistance", 50);
                l_Root_0:SetAttribute("OffsetPos", l_ExtentsOffsetWorldSpace_0);
                local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v29);
                v40.Text = l_l_Players_0_PlayerFromCharacter_0 and l_l_Players_0_PlayerFromCharacter_0.DisplayName or v29.Name;
                local l_FirstChild_0 = l_Workspace_0:WaitForChild("States", 240):FindFirstChild(v29.Name);
                local v47 = l_FirstChild_0 and l_FirstChild_0:WaitForChild("PlayerData", 240);
                local v48 = l_FirstChild_0 and l_FirstChild_0:WaitForChild("CharacterData", 240);
                local function _() --[[ Line: 141 ]] --[[ Name: SetWeldHead ]]
                    -- upvalues: v33 (copy), l_Rosyn_0 (ref), l_Root_0 (copy), l_SurfaceBillboard_0 (ref)
                    local v49 = v33:WaitForChild("Head", 10);
                    l_Rosyn_0.AwaitComponentInit(l_Root_0, l_SurfaceBillboard_0):SetAdornee(v49);
                end;
                local v51 = v33:WaitForChild("Head", 10);
                l_Rosyn_0.AwaitComponentInit(l_Root_0, l_SurfaceBillboard_0):SetAdornee(v51);
                v28[v29] = {};
                if not v30 then
                    v51 = v48 and v48:FindFirstChild("MaxHealth");
                    local v52 = v48 and v48:FindFirstChild("Health");
                    if v51 and v52 then
                        local v53 = 1 - v52.Value / v51.Value;
                        SetGradientProgress(v42, v53);
                        local l_v51_0 = v51 --[[ copy: 21 -> 28 ]];
                        v28[v29][#v28 + 1] = v52.Changed:Connect(function(v55) --[[ Line: 159 ]]
                            -- upvalues: l_v51_0 (copy), v42 (copy)
                            local v56 = 1 - v55 / l_v51_0.Value;
                            SetGradientProgress(v42, v56);
                        end);
                    end;
                end;
                v51 = v48:WaitForChild("PvPOff", 30);
                v28[v29][#v28 + 1] = v51.Changed:Connect(function(v57) --[[ Line: 167 ]]
                    -- upvalues: v37 (copy)
                    v37.PvP.Visible = v57;
                end);
                local v58 = v47:WaitForChild("Title", 30);
                local function v65(v59) --[[ Line: 172 ]] --[[ Name: SetTitle ]]
                    -- upvalues: l_List_0 (ref), l_Gradients_0 (ref), v39 (copy), l_CollectionService_0 (ref)
                    local v60 = l_List_0[v59];
                    if not v60 then
                        return;
                    else
                        local l_l_Gradients_0_FirstChild_0 = l_Gradients_0:FindFirstChild(v60.Quality or 0);
                        if not l_l_Gradients_0_FirstChild_0 then
                            return;
                        else
                            for _, v63 in v39:GetChildren() do
                                if v63:IsA("UIGradient") then
                                    v63:Destroy();
                                end;
                            end;
                            l_l_Gradients_0_FirstChild_0 = l_l_Gradients_0_FirstChild_0:Clone();
                            l_l_Gradients_0_FirstChild_0.Parent = v39;
                            l_l_Gradients_0_FirstChild_0.Name = "TitleGradient";
                            l_l_Gradients_0_FirstChild_0.Enabled = true;
                            local l_DisplayTitle_0 = v60.DisplayTitle;
                            if l_DisplayTitle_0 then
                                v59 = l_DisplayTitle_0;
                            end;
                            v39.Text = "[" .. v59 .. "]";
                            if v60.Quality == 666 then
                                l_l_Gradients_0_FirstChild_0.Name = "UIGradient";
                                v39.TextColor3 = Color3.fromRGB(184, 43, 255);
                                l_CollectionService_0:AddTag(v39, "RainbowUI");
                                return;
                            elseif v60.Quality == 999 then
                                l_l_Gradients_0_FirstChild_0.Name = "UIGradient";
                                v39.TextColor3 = Color3.fromRGB(255, 255, 255);
                                l_CollectionService_0:AddTag(v39, "RainbowUI");
                                return;
                            else
                                v39.TextColor3 = Color3.fromRGB(255, 255, 255);
                                l_CollectionService_0:RemoveTag(v39, "RainbowUI");
                                return;
                            end;
                        end;
                    end;
                end;
                v65(v58.Value);
                v28[v29][#v28 + 1] = v58.Changed:Connect(function(v66) --[[ Line: 211 ]]
                    -- upvalues: v65 (copy)
                    v65(v66);
                end);
                local v67 = v47:WaitForChild("Rating", 30);
                local function _(v68) --[[ Line: 217 ]] --[[ Name: SetRating ]]
                    -- upvalues: v43 (copy), l_RankHelper_0 (ref)
                    if v68 <= 0 then
                        v43.Visible = false;
                        return;
                    else
                        local v69 = l_RankHelper_0.GetRankInfoFromRating(v68);
                        v43.Icon.Image = "rbxassetid://" .. v69.ImageId;
                        v43.Rating.Text = tostring(v68);
                        v43.Visible = true;
                        return;
                    end;
                end;
                local l_Value_0 = v67.Value;
                if l_Value_0 <= 0 then
                    v43.Visible = false;
                else
                    local v72 = l_RankHelper_0.GetRankInfoFromRating(l_Value_0);
                    v43.Icon.Image = "rbxassetid://" .. v72.ImageId;
                    v43.Rating.Text = tostring(l_Value_0);
                    v43.Visible = true;
                end;
                v28[v29][#v28 + 1] = v67.Changed:Connect(function(v73) --[[ Line: 229 ]]
                    -- upvalues: v43 (copy), l_RankHelper_0 (ref)
                    if v73 <= 0 then
                        v43.Visible = false;
                        return;
                    else
                        local v74 = l_RankHelper_0.GetRankInfoFromRating(v73);
                        v43.Icon.Image = "rbxassetid://" .. v74.ImageId;
                        v43.Rating.Text = tostring(v73);
                        v43.Visible = true;
                        return;
                    end;
                end);
                v28[v29][#v28 + 1] = v29.AncestryChanged:Connect(function() --[[ Line: 241 ]]
                    Changed();
                end);
                Changed();
                if not v30 then
                    return;
                else
                    l_Value_0 = v48 and v48:FindFirstChild("Equipped");
                    v28[v29][#v28 + 1] = l_Value_0.Changed:Connect(function(v75) --[[ Line: 250 ]]
                        -- upvalues: v37 (copy), l_TweenService_0 (ref), v16 (ref), l_Size_0 (ref), l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0 (copy), l_MaxDistance_0 (ref)
                        if not v75 then
                            v37.Size = UDim2.new(0, 0, 0, 0);
                        end;
                        l_TweenService_0:Create(v37, v16, {
                            Size = v75 and UDim2.new(0, 0, 0, 0) or l_Size_0
                        }):Play();
                        task.delay(0.2, function() --[[ Line: 256 ]]
                            -- upvalues: l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0 (ref), l_MaxDistance_0 (ref), v37 (ref)
                            if l_l_l_SurfaceBillboard_0_FromBillboard_0_UIRoot_0.MaxDistance == l_MaxDistance_0 - 1 then
                                v37.Visible = false;
                            end;
                        end);
                    end);
                    return;
                end;
            end;
        end;
    end;
    CharacterAdded = function(v76) --[[ Line: 264 ]] --[[ Name: CharacterAdded ]]
        task.defer(function() --[[ Line: 265 ]]
            -- upvalues: v76 (copy)
            AddNametag(v76);
        end);
    end;
    for _, v78 in l_Workspace_0:WaitForChild("Live"):GetChildren() do
        CharacterAdded(v78);
    end;
    l_Workspace_0:WaitForChild("Live").ChildAdded:Connect(function(v79) --[[ Line: 288 ]]
        CharacterAdded(v79);
    end);
    l_LockedOn_0.Changed:Connect(function() --[[ Line: 292 ]]
        Changed();
    end);
    l_Workspace_0.CurrentMenu.Changed:Connect(function() --[[ Line: 296 ]]
        Changed();
    end);
    l_Settings_0.HideNametags.Changed:Connect(function() --[[ Line: 300 ]]
        Changed();
    end);
    l_Workspace_0.Live.ChildRemoved:Connect(function(v80) --[[ Line: 304 ]]
        -- upvalues: l_HiddenStorage_0 (copy), v28 (copy)
        if v80:IsDescendantOf(l_HiddenStorage_0) then
            return;
        elseif not v28[v80] then
            return;
        else
            for _, v82 in v28[v80] do
                v82:Disconnect();
            end;
            v28[v80] = nil;
            return;
        end;
    end);
    Changed();
    return;
end;