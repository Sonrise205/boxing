local l_Players_0 = game:GetService("Players");
local _ = game:GetService("RunService");
local _ = game:GetService("HttpService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local _ = game:GetService("AvatarEditorService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local _ = TweenInfo.new(0.65, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v10 = TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v11 = TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_Catalog_0 = l_ReplicatedStorage_0:WaitForChild("Catalog");
local l_SearchHelper_0 = require(l_Catalog_0:WaitForChild("SearchHelper"));
local l_ByteNetPackets_0 = require(l_Catalog_0:WaitForChild("ByteNetPackets"));
local l_Parent_0 = script.Parent;
local l_EquippedItems_0 = l_Parent_0:WaitForChild("EquippedItems");
local l_CategoryFrame_0 = l_Parent_0.Parent:WaitForChild("FrameContainer"):WaitForChild("CategoryFrame");
local _ = l_CategoryFrame_0:WaitForChild("ScrollingFrame");
local l_ItemFrame_0 = l_CategoryFrame_0:WaitForChild("ScrollingFrame"):WaitForChild("ItemFrame");
local function v20() --[[ Line: 29 ]] --[[ Name: PreviewContentSizeChanged ]]
    -- upvalues: l_EquippedItems_0 (copy)
    l_EquippedItems_0.ListFrame.CanvasSize = UDim2.new(0, l_EquippedItems_0.ListFrame.UIListLayout.AbsoluteContentSize.X, 0, 0);
end;
l_EquippedItems_0.ListFrame.CanvasSize = UDim2.new(0, l_EquippedItems_0.ListFrame.UIListLayout.AbsoluteContentSize.X, 0, 0);
l_EquippedItems_0.ListFrame.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(v20);
local v21 = {};
local v22 = nil;
local v23 = {};
GetHumanoidDescription = function() --[[ Line: 41 ]] --[[ Name: GetHumanoidDescription ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v25 = l_Character_0 and l_Character_0:FindFirstChild("Humanoid");
    return v25 and v25:FindFirstChild("HumanoidDescription");
end;
local l_ListFrame_0 = l_EquippedItems_0:WaitForChild("ListFrame");
local l_ItemTemplate_0 = l_ListFrame_0:WaitForChild("ItemTemplate");
local v28 = nil;
local l_Modules_0 = l_ReplicatedStorage_0:FindFirstChild("Modules");
if l_Modules_0:FindFirstChild("SoundHelper") then
    v28 = require(l_Modules_0.SoundHelper);
end;
PlayPressSound = function() --[[ Line: 59 ]] --[[ Name: PlayPressSound ]]
    -- upvalues: v28 (ref)
    if v28 then
        v28:PlaySound({
            Name = "CatalogPress", 
            Parent = workspace.Debris, 
            Speed = math.random(140, 150) / 100
        });
    end;
end;
PlayPopSound = function() --[[ Line: 69 ]] --[[ Name: PlayPopSound ]]
    -- upvalues: v28 (ref)
    if v28 then
        v28:PlaySound({
            Name = "CatalogPop", 
            Parent = workspace.Debris
        });
    end;
end;
PlayInteractSound = function() --[[ Line: 78 ]] --[[ Name: PlayInteractSound ]]
    -- upvalues: v28 (ref)
    if v28 then
        v28:PlaySound({
            Name = "CatalogInteract", 
            Parent = workspace.Debris, 
            Speed = math.random(140, 150) / 100
        });
    end;
end;
HandleButton = function(v30) --[[ Line: 88 ]] --[[ Name: HandleButton ]]
    -- upvalues: v22 (ref), l_TweenService_0 (copy), v10 (copy), v23 (ref), l_EquippedItems_0 (copy), l_ListFrame_0 (copy), v11 (copy), l_ByteNetPackets_0 (copy), l_MarketplaceService_0 (copy), l_LocalPlayer_0 (copy)
    local l_Main_0 = v30.Main;
    local l_Button_0 = l_Main_0.Button;
    local l_Selected_0 = l_Main_0.Selected;
    local v34 = {
        Buy = true, 
        Try = true
    };
    l_Selected_0.Visible = true;
    l_Selected_0.Gradient.BackgroundTransparency = 1;
    local v35 = {
        Buy = UDim2.new(0.5, 0, l_Selected_0.Buy.Position.Y.Scale, 0), 
        Try = UDim2.new(0.5, 0, l_Selected_0.Try.Position.Y.Scale, 0)
    };
    local v36 = {
        Buy = UDim2.new(-2, 0, l_Selected_0.Buy.Position.Y.Scale, 0), 
        Try = UDim2.new(2, 0, l_Selected_0.Try.Position.Y.Scale, 0)
    };
    local v37 = {
        Buy = UDim2.new(2, 0, l_Selected_0.Buy.Position.Y.Scale, 0), 
        Try = UDim2.new(-2, 0, l_Selected_0.Try.Position.Y.Scale, 0)
    };
    for _, v39 in l_Selected_0:GetChildren() do
        if v34[v39.Name] then
            v39.Position = v36[v39.Name];
        end;
    end;
    local function v43() --[[ Line: 123 ]] --[[ Name: HideSelected ]]
        -- upvalues: v22 (ref), l_TweenService_0 (ref), v10 (ref), v34 (copy), v37 (copy)
        if v22 then
            local l_Selected_1 = v22.Main.Selected;
            l_TweenService_0:Create(l_Selected_1.Gradient, v10, {
                BackgroundTransparency = 1
            }):Play();
            for _, v42 in l_Selected_1:GetChildren() do
                if v34[v42.Name] then
                    l_TweenService_0:Create(v42, v10, {
                        Position = v37[v42.Name]
                    }):Play();
                end;
            end;
        end;
    end;
    v23[#v23 + 1] = l_Button_0.Activated:Connect(function() --[[ Line: 135 ]]
        -- upvalues: v43 (copy), v22 (ref), v30 (copy), l_EquippedItems_0 (ref), l_TweenService_0 (ref), l_ListFrame_0 (ref), v10 (ref), l_Button_0 (copy), l_Selected_0 (copy), v34 (copy), v36 (copy), v35 (copy), v11 (ref)
        v43();
        PlayInteractSound();
        if v22 == v30 then
            v22 = nil;
            return;
        else
            v22 = v30;
            local v44 = l_EquippedItems_0.AbsolutePosition.X + l_EquippedItems_0.AbsoluteSize.X / 2;
            l_TweenService_0:Create(l_ListFrame_0, v10, {
                CanvasPosition = Vector2.new(l_ListFrame_0.CanvasPosition.X + (l_Button_0.AbsolutePosition.X - v44), 0)
            }):Play();
            for _, v46 in l_Selected_0:GetChildren() do
                if v34[v46.Name] then
                    v46.Position = v36[v46.Name];
                    l_TweenService_0:Create(v46, v10, {
                        Position = v35[v46.Name]
                    }):Play();
                end;
            end;
            l_Selected_0.Gradient.BackgroundTransparency = 1;
            l_TweenService_0:Create(l_Selected_0.Gradient, v11, {
                BackgroundTransparency = 0.5
            }):Play();
            l_Selected_0.Buy.TextLabel.FontFace = Font.fromEnum(Enum.Font.MontserratBlack);
            l_Selected_0.Try.TextLabel.FontFace = Font.fromEnum(Enum.Font.MontserratBlack);
            return;
        end;
    end);
    local v47 = {
        name = "", 
        id = tonumber(v30.Name)
    };
    v23[#v23 + 1] = l_Selected_0.Buy.Activated:Connect(function() --[[ Line: 170 ]]
        -- upvalues: v30 (copy), l_ByteNetPackets_0 (ref), l_MarketplaceService_0 (ref), l_LocalPlayer_0 (ref)
        PlayInteractSound();
        local v48 = GetHumanoidDescription();
        if not v48 then
            return;
        elseif tostring(v48.Head) == v30.Name then
            l_ByteNetPackets_0.PromptPotentialBundlePurchase.send(v30.Name);
            return;
        else
            l_MarketplaceService_0:PromptPurchase(l_LocalPlayer_0, (tonumber(v30.Name)));
            return;
        end;
    end);
    v23[#v23 + 1] = l_Selected_0.Buy.MouseEnter:Connect(function() --[[ Line: 183 ]]
        PlayPopSound();
    end);
    v23[#v23 + 1] = l_Selected_0.Try.Activated:Connect(function() --[[ Line: 188 ]]
        -- upvalues: v43 (copy), v22 (ref), l_ByteNetPackets_0 (ref), v47 (copy)
        PlayInteractSound();
        v43();
        v22 = nil;
        l_ByteNetPackets_0.TryItem.send(v47);
    end);
    v23[#v23 + 1] = l_Selected_0.Try.MouseEnter:Connect(function() --[[ Line: 197 ]]
        PlayPopSound();
    end);
end;
local l_WorldModel_0 = l_Parent_0:WaitForChild("ViewportButton"):WaitForChild("ViewportFrame"):WaitForChild("WorldModel");
local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
local function v54(v51) --[[ Line: 207 ]] --[[ Name: ClearAppearance ]]
    -- upvalues: l_HumanoidDescription_0 (copy)
    v51.Humanoid:ApplyDescription(l_HumanoidDescription_0);
    for _, v53 in (v51:GetChildren()) do
        if v53:IsA("Shirt") or v53:IsA("Pants") or v53:IsA("Accessory") then
            v53:Destroy();
        end;
    end;
end;
local v55 = "Start!";
Update = function(v56) --[[ Line: 219 ]] --[[ Name: Update ]]
    -- upvalues: l_SearchHelper_0 (copy), v55 (ref), l_ItemFrame_0 (copy), l_ListFrame_0 (copy), l_ItemTemplate_0 (copy), v23 (ref), l_WorldModel_0 (copy)
    local v57 = GetHumanoidDescription();
    if not v57 then
        return;
    else
        local v58 = "";
        for _, v60 in l_SearchHelper_0.HumanoidDescriptionProperties do
            if v57[v60] or v57[v60] == "" then
                v58 = v58 .. v57[v60] .. ",";
            end;
        end;
        local v61 = v55 == v58;
        v55 = v58;
        if v61 and not v56 then
            return;
        else
            for _, v63 in l_ItemFrame_0:GetChildren() do
                if v63:IsA("Frame") and v63:GetAttribute("AssetType") then
                    if string.find(v58, v63.Name) then
                        v63:SetAttribute("IsEquipped", true);
                    else
                        v63:SetAttribute("IsEquipped", nil);
                    end;
                end;
            end;
            for _, v65 in l_ListFrame_0:GetChildren() do
                if v65:IsA("Frame") and v65.Name ~= "ItemTemplate" and not string.find(v58, v65.Name) then
                    v65:Destroy();
                end;
            end;
            for v66 in v58:gmatch("(.-),") do
                if not l_ListFrame_0:FindFirstChild(v66) and v66 ~= "" and v66 ~= nil and v66 ~= "0" then
                    local v67 = l_ItemTemplate_0:Clone();
                    v67.Main.Preview.Image = "rbxthumb://type=Asset&id=" .. v66 .. "&w=150&h=150";
                    v67.Name = v66;
                    v67.Parent = l_ItemTemplate_0.Parent;
                    v67.Visible = true;
                end;
            end;
            for _, v69 in v23 do
                v69:Disconnect();
            end;
            v23 = {};
            for _, v71 in l_ListFrame_0:GetChildren() do
                if v71:IsA("Frame") and v71.Name ~= "ItemTemplate" then
                    HandleButton(v71);
                end;
            end;
            local l_Rig_0 = l_WorldModel_0:FindFirstChild("Rig");
            local v73 = l_Rig_0 and l_Rig_0:FindFirstChild("Humanoid");
            if not v73 then
                return;
            else
                if v56 then
                    for _, v75 in l_Rig_0:GetChildren() do
                        if string.find(v75.Name, "Eyebrow_Accessory") then
                            v75:Destroy();
                        end;
                    end;
                end;
                v73:ApplyDescription(v57);
                return;
            end;
        end;
    end;
end;
HandleCharacter = function() --[[ Line: 305 ]] --[[ Name: HandleCharacter ]]
    -- upvalues: v21 (ref), l_SearchHelper_0 (copy), l_WorldModel_0 (copy), l_LocalPlayer_0 (copy), l_Players_0 (copy), l_ReplicatedStorage_0 (copy), v54 (copy)
    for _, v77 in v21 do
        v77:Disconnect();
    end;
    v21 = {};
    local v78 = GetHumanoidDescription();
    if not v78 then
        return;
    else
        local v79 = table.clone(l_SearchHelper_0.ColorProperties);
        for _, v81 in l_SearchHelper_0.HumanoidDescriptionProperties do
            table.insert(v79, v81);
        end;
        for _, v83 in v79 do
            local v84 = string.find(v83, "Head") or string.find(v83, "Color");
            v78:GetPropertyChangedSignal(v83):Connect(function() --[[ Line: 324 ]]
                -- upvalues: v84 (copy)
                Update(v84);
            end);
        end;
        v21[#v21 + 1] = v78.AncestryChanged:Connect(function() --[[ Line: 330 ]]
            HandleCharacter();
        end);
        for _, v86 in l_WorldModel_0:GetChildren() do
            if v86.Name == "Rig" then
                Update();
                return;
            end;
        end;
        local l_Character_1 = l_LocalPlayer_0.Character;
        l_Character_1.Archivable = true;
        local v88 = l_Character_1:Clone();
        l_Character_1.Archivable = false;
        for _, v90 in v88:GetChildren() do
            if v90:GetAttribute("GlovePart") then
                v90:Destroy();
            elseif v90:IsA("BasePart") and v90.Name ~= "HumanoidRootPart" then
                v90.Transparency = 0;
            end;
        end;
        v88.Name = "Rig";
        v88:WaitForChild("HumanoidRootPart").Anchored = true;
        v88:PivotTo(l_WorldModel_0.Pivot.CFrame * CFrame.Angles(0, 3.141592653589793, 0));
        for _, v92 in v88:GetDescendants() do
            if v92.Name ~= "Animate" and (v92:IsA("BaseScript") or v92:IsA("ParticleEmitter") or v92:IsA("ForceField") or v92:IsA("BillboardGui")) then
                v92:Destroy();
            end;
        end;
        v88.Parent = l_WorldModel_0;
        local v93 = workspace.States:WaitForChild(l_Players_0.LocalPlayer.Name, 10):WaitForChild("PlayerData", 10);
        l_ReplicatedStorage_0.Events.EquipGloves:Fire(v88, v93.Gloves.Value);
        v54(v88);
        Update();
        return;
    end;
end;
l_LocalPlayer_0.CharacterAdded:Connect(function(_) --[[ Line: 383 ]]
    HandleCharacter();
end);
HandleCharacter();