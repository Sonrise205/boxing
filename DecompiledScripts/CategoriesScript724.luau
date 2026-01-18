local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Catalog_0 = l_ReplicatedStorage_0:WaitForChild("Catalog");
local l_SearchHelper_0 = require(l_Catalog_0:WaitForChild("SearchHelper"));
local l_ByteNetPackets_0 = require(l_Catalog_0:WaitForChild("ByteNetPackets"));
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Settings_0 = l_Parent_1:WaitForChild("Settings");
local l_CurrentTab_0 = l_Settings_0:WaitForChild("CurrentTab");
local l_CurrentSubtab_0 = l_Settings_0:WaitForChild("CurrentSubtab");
local l_TopBarFrame_0 = l_Parent_0:WaitForChild("TopBarFrame");
local l_TopButtons_0 = l_TopBarFrame_0:WaitForChild("CanvasGroup"):WaitForChild("TopButtons");
local l_SearchBar_0 = l_TopBarFrame_0:WaitForChild("SearchBar");
local l_UtilitiesHolder_0 = l_Parent_0:WaitForChild("UtilitiesHolder");
local l_CategoryFrame_0 = l_Parent_0:WaitForChild("CategoryFrame");
local l_ScrollingFrame_0 = l_CategoryFrame_0:WaitForChild("ScrollingFrame");
local l_ItemFrame_0 = l_CategoryFrame_0:WaitForChild("ScrollingFrame"):WaitForChild("ItemFrame");
local l_ItemTemplate_0 = l_ItemFrame_0:WaitForChild("ItemTemplate");
local l_LoadingFrame_0 = l_Parent_0:WaitForChild("LoadingFrame");
local l_Centre_0 = l_LoadingFrame_0:WaitForChild("Centre");
local l_Bottom_0 = l_LoadingFrame_0:WaitForChild("Bottom");
local l_NoResultsFrame_0 = l_Parent_0:WaitForChild("NoResultsFrame");
local l_Main_0 = l_NoResultsFrame_0:WaitForChild("Main");
local l_BottomHolder_0 = l_Parent_0:WaitForChild("BottomHolder");
local l_BodyFrame_0 = l_Parent_0:WaitForChild("BodyFrame");
local v30 = false;
local v31 = {};
local v32 = false;
local v33 = {};
local v34 = false;
local v35 = {};
local v36 = nil;
local v37 = 0;
local v38 = false;
local v39 = nil;
local l_Modules_0 = l_ReplicatedStorage_0:FindFirstChild("Modules");
if l_Modules_0:FindFirstChild("SoundHelper") then
    v39 = require(l_Modules_0.SoundHelper);
end;
local l_Modules_1 = l_ReplicatedStorage_0:FindFirstChild("Modules");
local v42 = l_Modules_1 and l_Modules_0:FindFirstChild("UIHelper") and require(l_Modules_1:WaitForChild("UIHelper"));
local function _(v43, v44, v45) --[[ Line: 75 ]] --[[ Name: Lerp ]]
    return v43 + (v44 - v43) * v45;
end;
local v47 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v48 = TweenInfo.new(0.65, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v49 = TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v50 = TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v51 = {};
local v52 = nil;
PlayPressSound = function() --[[ Line: 86 ]] --[[ Name: PlayPressSound ]]
    -- upvalues: v39 (ref)
    if v39 then
        v39:PlaySound({
            Name = "CatalogPress", 
            Parent = workspace.Debris, 
            Speed = math.random(140, 150) / 100
        });
    end;
end;
PlayPopSound = function() --[[ Line: 96 ]] --[[ Name: PlayPopSound ]]
    -- upvalues: v39 (ref)
    if v39 then
        v39:PlaySound({
            Name = "CatalogPop", 
            Parent = workspace.Debris
        });
    end;
end;
PlayInteractSound = function() --[[ Line: 105 ]] --[[ Name: PlayInteractSound ]]
    -- upvalues: v39 (ref)
    if v39 then
        v39:PlaySound({
            Name = "CatalogInteract", 
            Parent = workspace.Debris, 
            Speed = math.random(140, 150) / 100
        });
    end;
end;
PlayErrorSound = function() --[[ Line: 115 ]] --[[ Name: PlayErrorSound ]]
    -- upvalues: v39 (ref)
    if v39 then
        v39:PlaySound({
            Name = "CatalogError", 
            Parent = workspace.Debris
        });
    end;
end;
ResetFrame = function(_) --[[ Line: 124 ]] --[[ Name: ResetFrame ]]
    -- upvalues: l_NoResultsFrame_0 (copy), l_Centre_0 (copy), l_Bottom_0 (copy), v51 (ref), v52 (ref), l_ItemFrame_0 (copy), l_ScrollingFrame_0 (copy)
    l_NoResultsFrame_0.Visible = false;
    l_Centre_0.Visible = true;
    l_Bottom_0.Visible = false;
    for _, v55 in v51 do
        v55:Disconnect();
    end;
    v51 = {};
    v52 = nil;
    for _, v57 in l_ItemFrame_0:GetChildren() do
        if v57:IsA("Frame") and v57.Name ~= "ItemTemplate" then
            v57:Destroy();
        end;
    end;
    l_ScrollingFrame_0.CanvasPosition = Vector2.new();
end;
local v58 = nil;
local function _(v59) --[[ Line: 151 ]] --[[ Name: trim ]]
    return string.gsub(v59, "^%s*(.-)%s*$", "%1");
end;
Search = function(v61) --[[ Line: 155 ]] --[[ Name: Search ]]
    -- upvalues: l_Parent_0 (copy), l_SearchHelper_0 (copy), l_CurrentTab_0 (copy), v38 (ref), l_LoadingFrame_0 (copy), v37 (ref), l_NoResultsFrame_0 (copy), l_SearchBar_0 (copy), l_ByteNetPackets_0 (copy), l_CurrentSubtab_0 (copy), v36 (ref)
    if l_Parent_0.Parent:GetAttribute("Closing") then
        return;
    elseif not l_SearchHelper_0.TabToCategory[l_CurrentTab_0.Value] then
        return;
    elseif l_SearchHelper_0.IgnoreSearchTabs[l_CurrentTab_0.Value] then
        return;
    elseif v38 then
        return;
    else
        v38 = true;
        task.delay(0.4, function() --[[ Line: 168 ]]
            -- upvalues: v38 (ref)
            v38 = false;
        end);
        local v62 = tick();
        if v61 then
            l_LoadingFrame_0.Bottom.Visible = true;
        end;
        v37 = v62;
        l_NoResultsFrame_0.Visible = false;
        if not v61 then
            ResetFrame();
        end;
        if l_CurrentTab_0.Value == "Outfits" then
            SearchOutfits();
            return;
        elseif l_CurrentTab_0.Value == "Favorites" then
            SearchFavorites();
            return;
        elseif l_CurrentTab_0.Value == "Recent" then
            SearchRecent();
            return;
        elseif l_CurrentTab_0.Value == "Inventory" then
            SearchInventory();
            return;
        else
            local l_Text_0 = l_SearchBar_0.SearchBox.Text;
            local v64 = string.gsub(l_Text_0, "^%s*(.-)%s*$", "%1");
            if v37 ~= v62 then
                return;
            else
                l_ByteNetPackets_0.SearchQuery.send({
                    tab = l_SearchHelper_0.TabToNumber[l_CurrentTab_0.Value] or -100, 
                    subtab = l_SearchHelper_0.SubtabToNumber[l_CurrentSubtab_0.Value] or -100, 
                    searchText = v64, 
                    nextPageCursors = v61 and v36 and v36.nextPageCursors
                });
                return;
            end;
        end;
    end;
end;
DirectSearch = function() --[[ Line: 258 ]] --[[ Name: DirectSearch ]]
    -- upvalues: l_BottomHolder_0 (copy), v37 (ref), l_ByteNetPackets_0 (copy)
    PlayPopSound();
    local l_Text_1 = l_BottomHolder_0.DirectSearch.SearchBox.Text;
    local v66 = string.gsub(l_Text_1, "^%s*(.-)%s*$", "%1");
    v37 = tick();
    ResetFrame();
    l_ByteNetPackets_0.DirectSearch.send({
        id = string.match(l_BottomHolder_0.DirectSearch.SearchBox.Text, "(%d+)") or "", 
        isBundle = string.find(v66, "roblox.com/bundles")
    });
end;
local l_PreviewFrame_0 = l_Parent_0.Parent:WaitForChild("PreviewFrame");
local _ = l_PreviewFrame_0:WaitForChild("ViewportButton"):WaitForChild("ViewportFrame"):WaitForChild("WorldModel");
HandleItemFrame = function(v69) --[[ Line: 277 ]] --[[ Name: HandleItemFrame ]]
    -- upvalues: l_CurrentTab_0 (copy), l_LocalPlayer_0 (copy), l_SearchHelper_0 (copy), v31 (copy), v52 (ref), l_TweenService_0 (copy), v49 (copy), l_Parent_1 (copy), v47 (copy), v51 (ref), v50 (copy), l_MarketplaceService_0 (copy), l_ByteNetPackets_0 (copy), l_ReplicatedStorage_0 (copy), l_ItemFrame_0 (copy), v33 (copy), v35 (copy), v42 (ref)
    local l_Main_1 = v69.Main;
    local l_Button_0 = l_Main_1.Button;
    local l_Selected_0 = l_Main_1.Selected;
    if l_CurrentTab_0.Value == "Outfits" then
        l_Selected_0.Delete.Visible = true;
    end;
    local v73 = {
        Buy = true, 
        Try = true, 
        Delete = true
    };
    local v74 = {};
    for _, v76 in l_Selected_0:GetChildren() do
        if v73[v76.Name] then
            v74[v76.Name] = v76.Position;
        end;
    end;
    l_Selected_0.Visible = true;
    l_Selected_0.Gradient.BackgroundTransparency = 1;
    local v77 = {
        Buy = UDim2.new(-2, 0, l_Selected_0.Buy.Position.Y.Scale, 0), 
        Try = UDim2.new(2, 0, l_Selected_0.Try.Position.Y.Scale, 0), 
        Delete = UDim2.new(l_Selected_0.Delete.Position.X.Scale, 0, -0.5, 0)
    };
    local v78 = {
        Buy = UDim2.new(2, 0, l_Selected_0.Buy.Position.Y.Scale, 0), 
        Try = UDim2.new(-2, 0, l_Selected_0.Try.Position.Y.Scale, 0), 
        Delete = UDim2.new(l_Selected_0.Delete.Position.X.Scale, 0, -0.5, 0)
    };
    for _, v80 in l_Selected_0:GetChildren() do
        if v73[v80.Name] then
            v80.Position = v77[v80.Name];
        end;
    end;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v82 = l_Character_0 and l_Character_0:FindFirstChild("Humanoid");
    local v83 = v82 and v82:FindFirstChild("HumanoidDescription");
    if v83 then
        for _, v85 in l_SearchHelper_0.HumanoidDescriptionProperties do
            local v86 = v83[v85];
            if string.find(tostring(v86), v69.Name) then
                v69:SetAttribute("IsEquipped", true);
            end;
        end;
    end;
    local l_v69_Attribute_0 = v69:GetAttribute("IsBlob");
    if l_v69_Attribute_0 then
        l_Main_1.Equipped.Visible = false;
    end;
    local function _() --[[ Line: 339 ]] --[[ Name: IsEquipped ]]
        -- upvalues: v69 (copy)
        return v69:GetAttribute("IsEquipped");
    end;
    local l_Main_2 = l_Main_1.Favorite.Main;
    local l_Position_0 = l_Main_2.Position;
    local v91 = UDim2.new(0.5, 0, l_Main_2.Position.Y.Scale, 0);
    l_Main_2.Position = v91;
    local l_ImageColor3_0 = l_Main_2.Unfavorited.ImageColor3;
    local l_ImageColor3_1 = l_Main_2.Favorited.ImageColor3;
    local v94 = false;
    for _, v96 in v31 do
        if tostring(v96.id) == v69.Name then
            v94 = true;
            break;
        end;
    end;
    l_Main_2.Favorited.ImageTransparency = v94 and 0 or 1;
    l_Main_2.Unfavorited.ImageColor3 = v94 and l_ImageColor3_1 or l_ImageColor3_0;
    l_Main_2.Position = v94 and l_Position_0 or v91;
    local function v100() --[[ Line: 365 ]] --[[ Name: HideSelected ]]
        -- upvalues: v52 (ref), l_TweenService_0 (ref), v49 (ref), v73 (copy), v78 (copy), l_Main_1 (copy), l_Parent_1 (ref), v94 (ref), v47 (ref), v91 (copy)
        if v52 then
            local l_Selected_1 = v52.Main.Selected;
            l_TweenService_0:Create(l_Selected_1.Gradient, v49, {
                BackgroundTransparency = 1
            }):Play();
            for _, v99 in l_Selected_1:GetChildren() do
                if v73[v99.Name] then
                    l_TweenService_0:Create(v99, v49, {
                        Position = v78[v99.Name]
                    }):Play();
                end;
            end;
            if l_Main_1.Limited.Visible then
                l_TweenService_0:Create(l_Main_1.Limited.Main, v49, {
                    Position = UDim2.new(0, 0, 0, 0)
                }):Play();
            end;
            if l_Parent_1:GetAttribute("IsMobile") and not v94 then
                l_TweenService_0:Create(v52.Main.Favorite.Main, v47, {
                    Position = v91
                }):Play();
            end;
        end;
    end;
    v51[#v51 + 1] = l_Button_0.Activated:Connect(function() --[[ Line: 387 ]]
        -- upvalues: v100 (copy), v52 (ref), v69 (copy), l_Selected_0 (copy), v73 (copy), v77 (copy), l_TweenService_0 (ref), v49 (ref), v74 (copy), v50 (ref), l_v69_Attribute_0 (copy), l_Main_1 (copy), l_Main_2 (copy), l_Position_0 (copy)
        v100();
        PlayInteractSound();
        if v52 == v69 then
            v52 = nil;
            return;
        else
            v52 = v69;
            for _, v102 in l_Selected_0:GetChildren() do
                if v73[v102.Name] then
                    v102.Position = v77[v102.Name];
                    l_TweenService_0:Create(v102, v49, {
                        Position = v74[v102.Name]
                    }):Play();
                end;
            end;
            l_Selected_0.Gradient.BackgroundTransparency = 1;
            l_TweenService_0:Create(l_Selected_0.Gradient, v50, {
                BackgroundTransparency = 0
            }):Play();
            l_Selected_0.Buy.TextLabel.FontFace = Font.fromEnum(Enum.Font.MontserratBlack);
            l_Selected_0.Try.TextLabel.FontFace = Font.fromEnum(Enum.Font.MontserratBlack);
            l_Selected_0.Try.TextLabel.Text = v69:GetAttribute("IsEquipped") and "TAKE OFF" or "TRY";
            if l_v69_Attribute_0 then
                l_Selected_0.Try.TextLabel.Text = "WEAR";
            end;
            if l_Main_1.Limited.Visible then
                l_TweenService_0:Create(l_Main_1.Limited.Main, v49, {
                    Position = UDim2.new(0, 0, 0.2, 0)
                }):Play();
            end;
            l_TweenService_0:Create(l_Main_2, v49, {
                Position = l_Position_0
            }):Play();
            return;
        end;
    end);
    local l_v69_Attribute_1 = v69:GetAttribute("IsBundle");
    local l_v69_Attribute_2 = v69:GetAttribute("IsLimited");
    v51[#v51 + 1] = l_Selected_0.Buy.Activated:Connect(function() --[[ Line: 427 ]]
        -- upvalues: v69 (copy), l_v69_Attribute_1 (copy), l_MarketplaceService_0 (ref), l_LocalPlayer_0 (ref), l_v69_Attribute_0 (copy), l_ByteNetPackets_0 (ref), v83 (ref)
        PlayInteractSound();
        local l_v69_Attribute_3 = v69:GetAttribute("BundleId");
        if l_v69_Attribute_1 or l_v69_Attribute_3 then
            l_MarketplaceService_0:PromptBundlePurchase(l_LocalPlayer_0, l_v69_Attribute_3 or tonumber(v69.Name));
            return;
        elseif l_v69_Attribute_0 then
            l_ByteNetPackets_0.PromptOutfitPurchase.send(v69:GetAttribute("Blob"));
            return;
        elseif tostring(v83.Head) == v69.Name then
            l_ByteNetPackets_0.PromptPotentialBundlePurchase.send(v69.Name);
            return;
        else
            l_MarketplaceService_0:PromptPurchase(l_LocalPlayer_0, (tonumber(v69.Name)));
            return;
        end;
    end);
    v51[#v51 + 1] = l_Selected_0.Buy.MouseEnter:Connect(function() --[[ Line: 445 ]]
        PlayPopSound();
    end);
    local v106 = {
        name = v69.Main.ItemName.Text, 
        id = v69.Name, 
        price = v69:GetAttribute("Price"), 
        assetType = v69:GetAttribute("AssetType"), 
        isBundle = l_v69_Attribute_1, 
        isLimited = l_v69_Attribute_2, 
        blob = v69:GetAttribute("Blob")
    };
    local function _() --[[ Line: 462 ]] --[[ Name: GetEquippedPosition ]]
        -- upvalues: v69 (copy)
        return v69:GetAttribute("IsEquipped") and UDim2.new(0, 0, 0, 0) or UDim2.new(-0.5, 0, 0, 0, 0);
    end;
    l_Main_1.Equipped.Main.Position = v69:GetAttribute("IsEquipped") and UDim2.new(0, 0, 0, 0) or UDim2.new(-0.5, 0, 0, 0, 0);
    v51[#v51 + 1] = l_Selected_0.Try.Activated:Connect(function() --[[ Line: 469 ]]
        -- upvalues: v100 (copy), v52 (ref), l_Character_0 (ref), l_LocalPlayer_0 (ref), v82 (ref), v83 (ref), v69 (copy), l_SearchHelper_0 (ref), v106 (copy), l_ReplicatedStorage_0 (ref), l_v69_Attribute_1 (copy), l_ItemFrame_0 (ref), l_TweenService_0 (ref), l_Main_1 (copy), v49 (ref), v47 (ref), l_v69_Attribute_0 (copy), l_ByteNetPackets_0 (ref), v33 (ref)
        PlayInteractSound();
        v100();
        v52 = nil;
        l_Character_0 = l_LocalPlayer_0.Character;
        v82 = l_Character_0 and l_Character_0:FindFirstChild("Humanoid");
        v83 = v82 and v82:FindFirstChild("HumanoidDescription");
        if not v69:GetAttribute("IsEquipped") and v83 and l_SearchHelper_0.HasTooManyAccessories(v106.assetType, v83) then
            PlayErrorSound();
            local l_Events_0 = l_ReplicatedStorage_0:FindFirstChild("Events");
            local v109 = l_Events_0 and l_Events_0:FindFirstChild("BasicMessage");
            if v109 then
                v109:Fire("You have too many equipped accessories (max " .. tostring(l_SearchHelper_0.MAX_ACCESSORIES) .. ")!");
            end;
            return;
        else
            local l_v69_Attribute_4 = v69:GetAttribute("IsEquipped");
            if l_v69_Attribute_1 then
                for _, v112 in l_ItemFrame_0:GetChildren() do
                    if v112.Name ~= v69.Name and v112:GetAttribute("IsBundle") then
                        v112:SetAttribute("IsEquipped", false);
                    end;
                end;
            end;
            v69:SetAttribute("IsEquipped", not v69:GetAttribute("IsEquipped"));
            l_TweenService_0:Create(l_Main_1.Equipped.Main, l_v69_Attribute_4 and v49 or v47, {
                Position = v69:GetAttribute("IsEquipped") and UDim2.new(0, 0, 0, 0) or UDim2.new(-0.5, 0, 0, 0, 0)
            }):Play();
            if l_v69_Attribute_0 then
                l_ByteNetPackets_0.LoadSavedOutfit.send(v69.Name);
            else
                l_ByteNetPackets_0.TryItem.send(v106);
            end;
            if not l_v69_Attribute_4 then
                return;
            else
                for v113, v114 in v33 do
                    if tostring(v114.id) == v69.Name then
                        table.remove(v33, v113);
                    end;
                end;
                table.insert(v33, 1, v106);
                return;
            end;
        end;
    end);
    v51[#v51 + 1] = l_Selected_0.Try.MouseEnter:Connect(function() --[[ Line: 530 ]]
        PlayPopSound();
    end);
    v51[#v51 + 1] = l_Main_2.Button.Activated:Connect(function() --[[ Line: 534 ]]
        -- upvalues: l_ByteNetPackets_0 (ref), v106 (copy), v31 (ref), v69 (copy), l_TweenService_0 (ref), l_Main_2 (copy), v49 (ref), l_ImageColor3_0 (copy), l_ImageColor3_1 (copy), v94 (ref)
        PlayInteractSound();
        l_ByteNetPackets_0.FavoriteItem.send(v106);
        local v115 = false;
        for v116, v117 in v31 do
            if tostring(v117.id) == v69.Name then
                table.remove(v31, v116);
                v115 = true;
            end;
        end;
        if v115 then
            l_TweenService_0:Create(l_Main_2.Unfavorited, v49, {
                ImageColor3 = l_ImageColor3_0
            }):Play();
            l_TweenService_0:Create(l_Main_2.Favorited, v49, {
                ImageTransparency = 1
            }):Play();
        else
            l_TweenService_0:Create(l_Main_2.Unfavorited, v49, {
                ImageColor3 = l_ImageColor3_1
            }):Play();
            l_TweenService_0:Create(l_Main_2.Favorited, v49, {
                ImageTransparency = 0
            }):Play();
            table.insert(v31, 1, v106);
        end;
        v94 = not v94;
    end);
    local l_BackgroundColor3_0 = l_Main_1.Background.BackgroundColor3;
    local v119 = Color3.fromRGB(56, 56, 56);
    v51[#v51 + 1] = l_Button_0.MouseEnter:Connect(function() --[[ Line: 564 ]]
        -- upvalues: l_Parent_1 (ref), l_TweenService_0 (ref), l_Main_1 (copy), v47 (ref), v119 (copy), l_Main_2 (copy), v49 (ref), l_Position_0 (copy)
        if l_Parent_1:GetAttribute("IsMobile") then
            return;
        else
            l_TweenService_0:Create(l_Main_1.Background, v47, {
                BackgroundColor3 = v119
            }):Play();
            l_TweenService_0:Create(l_Main_2, v49, {
                Position = l_Position_0
            }):Play();
            return;
        end;
    end);
    v51[#v51 + 1] = l_Button_0.MouseLeave:Connect(function() --[[ Line: 571 ]]
        -- upvalues: l_Parent_1 (ref), l_TweenService_0 (ref), l_Main_1 (copy), v47 (ref), l_BackgroundColor3_0 (copy), v94 (ref), l_Main_2 (copy), v91 (copy)
        if l_Parent_1:GetAttribute("IsMobile") then
            return;
        else
            l_TweenService_0:Create(l_Main_1.Background, v47, {
                BackgroundColor3 = l_BackgroundColor3_0
            }):Play();
            if not v94 then
                l_TweenService_0:Create(l_Main_2, v47, {
                    Position = v91
                }):Play();
            end;
            return;
        end;
    end);
    v51[#v51 + 1] = v69:GetAttributeChangedSignal("IsEquipped"):Connect(function() --[[ Line: 581 ]]
        -- upvalues: l_TweenService_0 (ref), l_Main_1 (copy), v69 (copy), v49 (ref), v47 (ref)
        l_TweenService_0:Create(l_Main_1.Equipped.Main, v69:GetAttribute("IsEquipped") and v49 or v47, {
            Position = v69:GetAttribute("IsEquipped") and UDim2.new(0, 0, 0, 0) or UDim2.new(-0.5, 0, 0, 0, 0)
        }):Play();
    end);
    if l_CurrentTab_0.Value ~= "Outfits" then
        return;
    else
        v51[#v51 + 1] = l_Selected_0.Delete.Activated:Connect(function() --[[ Line: 586 ]]
            -- upvalues: l_ByteNetPackets_0 (ref), v69 (copy), v35 (ref), v33 (ref), v31 (ref), v42 (ref)
            local function v124() --[[ Line: 587 ]] --[[ Name: Remove ]]
                -- upvalues: l_ByteNetPackets_0 (ref), v69 (ref), v35 (ref), v33 (ref), v31 (ref)
                l_ByteNetPackets_0.DeleteOutfit.send(v69.Name);
                for _, v121 in {
                    v35, 
                    v33, 
                    v31
                } do
                    for v122, v123 in v121 do
                        if v123.id == v69.Name then
                            table.remove(v121, v122);
                            break;
                        end;
                    end;
                end;
                SearchOutfits();
            end;
            if v42 then
                v42.CreateYesNoPrompt("DELETE OUTFIT?").Execute.Event:Connect(function() --[[ Line: 605 ]]
                    -- upvalues: v124 (copy)
                    v124();
                end);
                return;
            else
                v124();
                return;
            end;
        end);
        v51[#v51 + 1] = l_Selected_0.Delete.MouseEnter:Connect(function() --[[ Line: 613 ]]
            PlayPopSound();
        end);
        return;
    end;
end;
local v125 = false;
local v126 = false;
local v127 = nil;
local v128 = nil;
local v129 = false;
ReturnResults = function(v130) --[[ Line: 625 ]] --[[ Name: ReturnResults ]]
    -- upvalues: v36 (ref), v128 (ref), v37 (ref), l_Centre_0 (copy), l_Bottom_0 (copy), l_CurrentTab_0 (copy), v125 (ref), l_ItemFrame_0 (copy), l_NoResultsFrame_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy), v48 (copy), v129 (ref), l_ItemTemplate_0 (copy), l_SearchHelper_0 (copy), v47 (copy), l_ScrollingFrame_0 (copy)
    v36 = v130;
    local v131 = tick();
    v128 = v131;
    local l_v37_0 = v37;
    if not v130 or #v130.items <= 0 then
        l_Centre_0.Visible = true;
        l_Bottom_0.Visible = true;
        if l_CurrentTab_0.Value == "Inventory" and not v125 then
            return;
        elseif v36 ~= v130 then
            return;
        elseif l_v37_0 ~= v37 then
            return;
        elseif v128 ~= v131 then
            return;
        else
            l_Centre_0.Visible = false;
            l_Bottom_0.Visible = false;
            local v133 = false;
            for _, v135 in l_ItemFrame_0:GetChildren() do
                if v135:IsA("Frame") and v135.Name ~= "ItemTemplate" then
                    v133 = true;
                    break;
                end;
            end;
            if v133 then
                return;
            else
                l_NoResultsFrame_0.Visible = true;
                l_Main_0.Size = UDim2.new(1.1, 0, 1.1, 0);
                l_TweenService_0:Create(l_Main_0, v48, {
                    Size = UDim2.new(1, 0, 1, 0)
                }):Play();
                return;
            end;
        end;
    else
        l_NoResultsFrame_0.Visible = false;
        l_Centre_0.Visible = false;
        l_Bottom_0.Visible = false;
        v129 = true;
        for v136, v137 in v130.items do
            if l_v37_0 ~= v37 then
                return;
            elseif v137.name ~= "" then
                local v138 = l_ItemTemplate_0:Clone();
                local v139 = v138:WaitForChild("Main", 3);
                if not v139 then
                    v138:Destroy();
                elseif l_v37_0 ~= v37 then
                    return;
                else
                    v139.ItemName.Text = v137.name;
                    local l_ViewportFrame_0 = v139:FindFirstChild("ViewportFrame");
                    if l_CurrentTab_0.Value == "Inventory" then
                        v139.ItemPrice.Visible = false;
                    end;
                    if v137.blob then
                        v138:SetAttribute("Blob", v137.blob);
                        v138:SetAttribute("IsBlob", true);
                        v139.Preview.Visible = false;
                        v139.ItemPrice.Visible = false;
                        local l_Rig_0 = l_ViewportFrame_0.WorldModel:FindFirstChild("Rig");
                        local v142 = l_Rig_0 and l_Rig_0:FindFirstChild("Humanoid");
                        local v143 = v142 and v142:FindFirstChild("HumanoidDescription");
                        if v143 then
                            l_SearchHelper_0.WriteBlobToDescription(v143, v137.blob);
                            l_ViewportFrame_0.Visible = true;
                            task.spawn(function() --[[ Line: 711 ]]
                                -- upvalues: v142 (copy), v136 (copy), v143 (copy)
                                if not v142:IsDescendantOf(game) then
                                    v142.AncestryChanged:Wait();
                                end;
                                task.wait(v136 * 0.1);
                                v142:ApplyDescriptionReset(v143);
                                task.wait();
                                if v143.Head == 0 then
                                    v143.Head = 616387160;
                                end;
                                v142:ApplyDescription(v143);
                            end);
                        else
                            continue;
                        end;
                    else
                        if l_ViewportFrame_0 then
                            l_ViewportFrame_0:Destroy();
                        end;
                        if v137.isBundle then
                            v138:SetAttribute("IsBundle", true);
                            v139.Preview.Image = "rbxthumb://type=BundleThumbnail&id=" .. v137.id .. "&w=150&h=150";
                        else
                            v139.Preview.Image = "rbxthumb://type=Asset&id=" .. v137.id .. "&w=150&h=150";
                        end;
                        if v137.isLimited then
                            v138:SetAttribute("IsLimited", true);
                            v139.Limited.Visible = true;
                        end;
                        if v137.price then
                            v138:SetAttribute("Price", v137.price);
                            v139.ItemPrice.RobuxIcon.Visible = true;
                            v139.ItemPrice.Amount.Text = v137.price;
                            if tonumber(v137.price) >= 17920 then
                                v139.ItemPrice.Amount.Text = "very high lol";
                            end;
                        else
                            v139.ItemPrice.FreeIcon.Visible = true;
                            v139.ItemPrice.Amount.Text = "Free";
                        end;
                        v138:SetAttribute("AssetType", v137.assetType);
                    end;
                    if v137.bundleId then
                        v138:SetAttribute("BundleId", v137.bundleId);
                    end;
                    v138.Name = v137.id;
                    v138.Parent = l_ItemFrame_0;
                    v138.Visible = true;
                    v139.Size = UDim2.new(0, 0, 0, 0);
                    l_TweenService_0:Create(v139, v47, {
                        Size = UDim2.new(1, 0, 1, 0)
                    }):Play();
                    HandleItemFrame(v138);
                    task.wait(0.08333333333333333);
                end;
            end;
        end;
        v129 = false;
        local l_l_ScrollingFrame_0_0 = l_ScrollingFrame_0;
        l_l_ScrollingFrame_0_0.CanvasPosition = l_l_ScrollingFrame_0_0.CanvasPosition + Vector2.new(0, 0.1);
        return;
    end;
end;
SpecialShared = function(v145, v146) --[[ Line: 784 ]] --[[ Name: SpecialShared ]]
    -- upvalues: l_CurrentTab_0 (copy), v125 (ref), v37 (ref), l_TopBarFrame_0 (copy)
    if l_CurrentTab_0.Value ~= "Inventory" or v125 then
        v37 = tick();
        ResetFrame();
    end;
    if v145 < #v146 then
        for v147 = #v146, v145 + 1, -1 do
            table.remove(v146, v147);
        end;
    end;
    local l_Text_2 = l_TopBarFrame_0.SearchBar.SearchBox.Text;
    local v149 = string.gsub(l_Text_2, "^%s*(.-)%s*$", "%1");
    l_Text_2 = {};
    if v149 ~= "" then
        for _, v151 in v146 do
            local l_name_0 = v151.name;
            if string.find(string.lower(l_name_0), string.lower(v149)) then
                table.insert(l_Text_2, v151);
            end;
        end;
    else
        l_Text_2 = v146;
    end;
    ReturnResults({
        nextPageCursors = {}, 
        items = l_Text_2
    });
end;
SearchOutfits = function() --[[ Line: 821 ]] --[[ Name: SearchOutfits ]]
    -- upvalues: v34 (ref), l_ByteNetPackets_0 (copy), l_SearchHelper_0 (copy), v35 (copy)
    if not v34 then
        v34 = true;
        l_ByteNetPackets_0.GetOutfits.send({
            items = {
                {
                    blob = "", 
                    name = ""
                }
            }
        });
    end;
    SpecialShared(l_SearchHelper_0.MAX_OUTFITS, v35);
end;
l_ByteNetPackets_0.GetOutfits.listen(function(v153) --[[ Line: 832 ]]
    -- upvalues: v35 (copy), l_SearchHelper_0 (copy)
    for _, v155 in v153.items do
        local v156 = false;
        for _, v158 in v35 do
            if tostring(v155.id) == tostring(v158.id) then
                v156 = true;
                break;
            end;
        end;
        if not v156 then
            table.insert(v35, v155);
        end;
    end;
    SpecialShared(l_SearchHelper_0.MAX_OUTFITS, v35);
end);
SearchRecent = function() --[[ Line: 853 ]] --[[ Name: SearchRecent ]]
    -- upvalues: v32 (ref), l_ByteNetPackets_0 (copy), l_SearchHelper_0 (copy), v33 (copy)
    if not v32 then
        v32 = true;
        l_ByteNetPackets_0.GetRecentItems.send({
            items = {
                {
                    name = ""
                }
            }
        });
    end;
    SpecialShared(l_SearchHelper_0.MAX_RECENT_ITEMS, v33);
end;
l_ByteNetPackets_0.GetRecentItems.listen(function(v159) --[[ Line: 864 ]]
    -- upvalues: v33 (copy), l_SearchHelper_0 (copy)
    for _, v161 in v159.items do
        local v162 = false;
        for _, v164 in v33 do
            if tostring(v161.id) == tostring(v164.id) then
                v162 = true;
                break;
            end;
        end;
        if not v162 then
            table.insert(v33, v161);
        end;
    end;
    SpecialShared(l_SearchHelper_0.MAX_RECENT_ITEMS, v33);
end);
SearchFavorites = function() --[[ Line: 885 ]] --[[ Name: SearchFavorites ]]
    -- upvalues: l_SearchHelper_0 (copy), v31 (copy)
    SpecialShared(l_SearchHelper_0.MAX_FAVORITE_ITEMS, v31);
end;
l_ByteNetPackets_0.GetFavorites.listen(function(v165) --[[ Line: 889 ]]
    -- upvalues: v30 (ref), v31 (copy)
    if v30 then
        return;
    else
        v30 = true;
        for _, v167 in v165.items do
            table.insert(v31, v167);
        end;
        return;
    end;
end);
local _ = {};
SearchInventory = function() --[[ Line: 901 ]] --[[ Name: SearchInventory ]]
    -- upvalues: v126 (ref), l_AvatarEditorService_0 (copy), l_CurrentTab_0 (copy), v37 (ref), l_SearchBar_0 (copy), l_CurrentSubtab_0 (copy), v127 (ref), l_SearchHelper_0 (copy), v125 (ref)
    if not v126 then
        l_AvatarEditorService_0:PromptAllowInventoryReadAccess();
        if l_AvatarEditorService_0.PromptAllowInventoryReadAccessCompleted:Wait() ~= Enum.AvatarPromptResult.Success then
            l_CurrentTab_0.Value = "Featured";
            return;
        else
            v126 = true;
        end;
    end;
    local l_v37_1 = v37;
    local function v176(v170) --[[ Line: 916 ]] --[[ Name: HandleSearch ]]
        -- upvalues: l_v37_1 (copy), v37 (ref), l_SearchBar_0 (ref), l_CurrentSubtab_0 (ref)
        if l_v37_1 ~= v37 then
            return;
        else
            local l_Text_3 = l_SearchBar_0.SearchBox.Text;
            local v172 = string.gsub(l_Text_3, "^%s*(.-)%s*$", "%1");
            l_Text_3 = {
                nextPageCursors = {
                    0
                }, 
                items = {}
            };
            for _, v174 in v170 do
                local l_name_1 = v174.name;
                if (v172 == "" or string.find(string.lower(l_name_1), string.lower(v172))) and (l_CurrentSubtab_0.Value == "All" or v174.subtab == l_CurrentSubtab_0.Value) then
                    table.insert(l_Text_3.items, v174);
                end;
            end;
            ReturnResults(l_Text_3);
            return;
        end;
    end;
    local v177 = {
        Enum.AvatarAssetType.HairAccessory, 
        Enum.AvatarAssetType.BackAccessory, 
        Enum.AvatarAssetType.FaceAccessory, 
        Enum.AvatarAssetType.NeckAccessory, 
        Enum.AvatarAssetType.FrontAccessory, 
        Enum.AvatarAssetType.WaistAccessory, 
        Enum.AvatarAssetType.ShoulderAccessory, 
        Enum.AvatarAssetType.Hat
    };
    local v178 = {
        Enum.AvatarAssetType.TShirt, 
        Enum.AvatarAssetType.Shirt, 
        Enum.AvatarAssetType.Pants
    };
    local v179 = {
        Enum.AvatarAssetType.Head, 
        Enum.AvatarAssetType.DynamicHead
    };
    local v180 = table.clone(v179);
    for _, v182 in v177 do
        table.insert(v180, v182);
    end;
    for _, v184 in v178 do
        table.insert(v180, v184);
    end;
    if not v127 then
        v127 = {};
        local l_l_AvatarEditorService_0_Inventory_0 = l_AvatarEditorService_0:GetInventory(v180);
        while not l_l_AvatarEditorService_0_Inventory_0.IsFinished do
            local v186 = {};
            for _, v188 in l_l_AvatarEditorService_0_Inventory_0:GetCurrentPage() do
                local l_Name_0 = v188.Name;
                local v190 = "All";
                if table.find(v177, Enum.AvatarAssetType[v188.AssetType]) then
                    v190 = "Accessories";
                elseif table.find(v178, Enum.AvatarAssetType[v188.AssetType]) then
                    v190 = "Clothing";
                end;
                local v191 = l_SearchHelper_0.GetActualName[v188.AssetType] or v188.AssetType;
                v191 = Enum.AssetType[v191].Value;
                local v192 = {
                    name = l_Name_0, 
                    id = v188.AssetId, 
                    subtab = v190, 
                    assetType = v191
                };
                table.insert(v186, v192);
                table.insert(v127, v192);
            end;
            v176(v186);
            l_l_AvatarEditorService_0_Inventory_0:AdvanceToNextPageAsync();
        end;
        v125 = true;
        return;
    else
        v176(v127);
        return;
    end;
end;
local v193 = {
    Unselected = Color3.fromRGB(121, 121, 121), 
    Selected = Color3.fromRGB(240, 240, 240), 
    Hover = Color3.fromRGB(165, 165, 165)
};
local v194 = {};
InitializeSubtabConnections = function() --[[ Line: 1026 ]] --[[ Name: InitializeSubtabConnections ]]
    -- upvalues: v194 (copy), l_UtilitiesHolder_0 (copy), v38 (ref), l_CurrentSubtab_0 (copy), l_TweenService_0 (copy), v47 (copy), v193 (copy)
    for _, v196 in v194 do
        v196:Disconnect();
    end;
    for _, v198 in l_UtilitiesHolder_0.Main:GetChildren() do
        if v198:IsA("TextButton") then
            v194[#v194 + 1] = v198.Activated:Connect(function() --[[ Line: 1034 ]]
                -- upvalues: v38 (ref), l_CurrentSubtab_0 (ref), v198 (copy)
                if v38 then
                    return;
                else
                    l_CurrentSubtab_0.Value = v198.Name;
                    PlayPressSound();
                    return;
                end;
            end);
            v194[#v194 + 1] = v198.MouseEnter:Connect(function() --[[ Line: 1041 ]]
                -- upvalues: l_CurrentSubtab_0 (ref), v198 (copy), l_TweenService_0 (ref), v47 (ref), v193 (ref)
                if l_CurrentSubtab_0.Value == v198.Name then
                    return;
                else
                    l_TweenService_0:Create(v198, v47, {
                        TextColor3 = v193.Hover
                    }):Play();
                    PlayPopSound();
                    return;
                end;
            end);
            v194[#v194 + 1] = v198.MouseLeave:Connect(function() --[[ Line: 1048 ]]
                -- upvalues: l_CurrentSubtab_0 (ref), v198 (copy), l_TweenService_0 (ref), v47 (ref), v193 (ref)
                if l_CurrentSubtab_0.Value == v198.Name then
                    return;
                else
                    l_TweenService_0:Create(v198, v47, {
                        TextColor3 = v193.Unselected
                    }):Play();
                    return;
                end;
            end);
        end;
    end;
end;
local l_Value_0 = l_CurrentSubtab_0.Value;
l_CurrentSubtab_0.Changed:Connect(function(v200) --[[ Line: 1056 ]]
    -- upvalues: l_Value_0 (ref), l_UtilitiesHolder_0 (copy), l_TweenService_0 (copy), v47 (copy), v193 (copy), l_CurrentSubtab_0 (copy)
    if l_Value_0 == v200 then
        return;
    else
        local l_FirstChild_0 = l_UtilitiesHolder_0.Main:FindFirstChild(l_Value_0);
        if l_FirstChild_0 then
            l_TweenService_0:Create(l_FirstChild_0, v47, {
                TextColor3 = v193.Unselected
            }):Play();
        end;
        local l_FirstChild_1 = l_UtilitiesHolder_0.Main:FindFirstChild(l_CurrentSubtab_0.Value);
        if l_FirstChild_1 then
            l_TweenService_0:Create(l_FirstChild_1, v47, {
                TextColor3 = v193.Selected
            }):Play();
        end;
        l_Value_0 = v200;
        Search();
        return;
    end;
end);
InitializeSubtabs = function() --[[ Line: 1074 ]] --[[ Name: InitializeSubtabs ]]
    -- upvalues: l_UtilitiesHolder_0 (copy), l_SearchHelper_0 (copy), l_CurrentTab_0 (copy), v193 (copy), l_CurrentSubtab_0 (copy)
    local l_All_0 = l_UtilitiesHolder_0.Main.All;
    for _, v205 in l_UtilitiesHolder_0.Main:GetChildren() do
        if v205:IsA("TextButton") and v205.Name ~= "All" then
            v205:Destroy();
        end;
    end;
    local v206 = l_SearchHelper_0.Subcategories[l_CurrentTab_0.Value] or {};
    for _, v208 in v206 do
        local v209 = l_All_0:Clone();
        v209.Parent = l_All_0.Parent;
        v209.Text = v208;
        v209.Name = v208;
        v209.TextColor3 = v193.Unselected;
    end;
    l_CurrentSubtab_0.Value = "All";
    InitializeSubtabConnections();
end;
local v210 = {};
local v211 = {
    Default = Color3.fromRGB(41, 43, 48)
};
for _, v213 in l_TopButtons_0:GetChildren() do
    if v213:IsA("TextButton") then
        v211[v213.Name] = v213.BackgroundColor3;
        v213.BackgroundColor3 = v211.Default;
        if l_CurrentTab_0.Value == v213.Name then
            v213.BackgroundColor3 = v211[l_CurrentTab_0.Value];
        end;
        v210[#v210 + 1] = v213.Activated:Connect(function() --[[ Line: 1117 ]]
            -- upvalues: v38 (ref), l_SearchHelper_0 (copy), v213 (copy), l_SearchBar_0 (copy), l_CurrentTab_0 (copy), l_TweenService_0 (copy), v47 (copy), v211 (copy), l_TopButtons_0 (copy), l_Parent_0 (copy), v49 (copy)
            if v38 then
                return;
            else
                if l_SearchHelper_0.TabToCategory[v213.Name] and l_SearchHelper_0.TabToCategory[v213.Name] == -1 and v213.Name ~= "Body" then
                    l_SearchBar_0.SearchBox.Text = "";
                end;
                l_CurrentTab_0.Value = v213.Name;
                InitializeSubtabs();
                l_TweenService_0:Create(v213, v47, {
                    BackgroundColor3 = v211[v213.Name]
                }):Play();
                PlayPressSound();
                local v214 = (l_TopButtons_0.AbsolutePosition.X + l_Parent_0.Parent.Close.AbsolutePosition.X) / 2;
                l_TweenService_0:Create(l_TopButtons_0, v49, {
                    CanvasPosition = Vector2.new(l_TopButtons_0.CanvasPosition.X + (v213.AbsolutePosition.X - v214), 0)
                }):Play();
                return;
            end;
        end);
        v210[#v210 + 1] = v213.MouseEnter:Connect(function() --[[ Line: 1134 ]]
            -- upvalues: l_CurrentTab_0 (copy), v213 (copy), v211 (copy), l_TweenService_0 (copy), v47 (copy)
            if l_CurrentTab_0.Value == v213.Name then
                return;
            else
                local v215 = v211.Default:Lerp(v211[v213.Name], 0.15);
                l_TweenService_0:Create(v213, v47, {
                    BackgroundColor3 = v215
                }):Play();
                PlayPopSound();
                return;
            end;
        end);
        v210[#v210 + 1] = v213.MouseLeave:Connect(function() --[[ Line: 1143 ]]
            -- upvalues: l_CurrentTab_0 (copy), v213 (copy), l_TweenService_0 (copy), v49 (copy), v211 (copy)
            if l_CurrentTab_0.Value == v213.Name then
                return;
            else
                l_TweenService_0:Create(v213, v49, {
                    BackgroundColor3 = v211.Default
                }):Play();
                return;
            end;
        end);
    end;
end;
local l_Value_1 = l_CurrentTab_0.Value;
l_CurrentTab_0.Changed:Connect(function(v217) --[[ Line: 1150 ]]
    -- upvalues: l_Value_1 (ref), l_TopButtons_0 (copy), l_TweenService_0 (copy), v47 (copy), v211 (copy), l_CurrentTab_0 (copy), l_BodyFrame_0 (copy), l_UtilitiesHolder_0 (copy), v37 (ref), v48 (copy), l_Centre_0 (copy), l_NoResultsFrame_0 (copy), l_CurrentSubtab_0 (copy)
    if l_Value_1 == v217 then
        return;
    else
        local l_l_TopButtons_0_FirstChild_0 = l_TopButtons_0:FindFirstChild(l_Value_1);
        if l_l_TopButtons_0_FirstChild_0 then
            l_TweenService_0:Create(l_l_TopButtons_0_FirstChild_0, v47, {
                BackgroundColor3 = v211.Default
            }):Play();
        end;
        local l_l_TopButtons_0_FirstChild_1 = l_TopButtons_0:FindFirstChild(l_CurrentTab_0.Value);
        if l_l_TopButtons_0_FirstChild_1 then
            l_TweenService_0:Create(l_l_TopButtons_0_FirstChild_1, v47, {
                BackgroundColor3 = v211[v217]
            }):Play();
        end;
        l_BodyFrame_0.Visible = false;
        l_UtilitiesHolder_0.Main.All.Visible = true;
        if v217 == "Body" then
            v37 = tick();
            ResetFrame();
            l_BodyFrame_0.Visible = true;
            l_BodyFrame_0.Size = UDim2.new(1.1, 0, 1.1, 0);
            l_TweenService_0:Create(l_BodyFrame_0, v48, {
                Size = UDim2.new(1, 0, 1, 0)
            }):Play();
            l_UtilitiesHolder_0.Main.All.Visible = false;
            l_Centre_0.Visible = false;
            l_NoResultsFrame_0.Visible = false;
            l_CurrentSubtab_0.Value = "Skin Tone";
        end;
        l_Value_1 = v217;
        Search();
        return;
    end;
end);
l_SearchBar_0.SearchBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 1191 ]]
    -- upvalues: l_SearchBar_0 (copy)
    l_SearchBar_0.SearchBox.Placeholder.Visible = l_SearchBar_0.SearchBox.Text == "";
end);
l_SearchBar_0.SearchBox.FocusLost:Connect(function(v220, _) --[[ Line: 1195 ]]
    if not v220 then
        return;
    else
        Search();
        return;
    end;
end);
l_BottomHolder_0.DirectSearch.SearchBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 1203 ]]
    -- upvalues: l_BottomHolder_0 (copy)
    l_BottomHolder_0.DirectSearch.SearchBox.Placeholder.Visible = l_BottomHolder_0.DirectSearch.SearchBox.Text == "";
end);
l_BottomHolder_0.DirectSearch.SearchBox.FocusLost:Connect(function(v222, _) --[[ Line: 1207 ]]
    if not v222 then
        return;
    else
        DirectSearch();
        return;
    end;
end);
local l_UIGridLayout_0 = l_ItemFrame_0.UIGridLayout;
l_ScrollingFrame_0:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 1215 ]]
    -- upvalues: l_ScrollingFrame_0 (copy), v129 (ref), v36 (ref)
    if l_ScrollingFrame_0.CanvasPosition.Y / (l_ScrollingFrame_0.AbsoluteCanvasSize.Y - l_ScrollingFrame_0.AbsoluteWindowSize.Y) < 0.98 then
        return;
    elseif v129 then
        return;
    elseif not v36 or not v36.nextPageCursors or #v36.nextPageCursors <= 0 then
        return;
    else
        Search(true);
        return;
    end;
end);
local function v225() --[[ Line: 1226 ]] --[[ Name: ContentSizeChanged ]]
    -- upvalues: l_ScrollingFrame_0 (copy), l_UIGridLayout_0 (copy)
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, l_UIGridLayout_0.AbsoluteContentSize.Y + l_UIGridLayout_0.AbsoluteCellSize.Y / 6);
end;
l_ItemFrame_0.ChildAdded:Connect(function() --[[ Line: 1230 ]]
    -- upvalues: l_Centre_0 (copy)
    l_Centre_0.Visible = false;
end);
l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, l_UIGridLayout_0.AbsoluteContentSize.Y + l_UIGridLayout_0.AbsoluteCellSize.Y / 6);
l_UIGridLayout_0:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(v225);
l_ByteNetPackets_0.ReturnResults.listen(function(v226) --[[ Line: 1237 ]]
    -- upvalues: v58 (ref)
    v58 = nil;
    ReturnResults(v226);
end);
task.delay(1, function() --[[ Line: 1245 ]]
    -- upvalues: l_ByteNetPackets_0 (copy)
    l_ByteNetPackets_0.GetFavorites.send({
        items = {
            {
                name = ""
            }
        }
    });
end);
local l_Main_3 = l_PreviewFrame_0:WaitForChild("PreviewButtons"):WaitForChild("Main");
local l_Save_0 = l_Main_3:WaitForChild("Save");
local l_Reset_0 = l_Main_3:WaitForChild("Reset");
local l_Roblox_0 = l_Main_3:WaitForChild("Roblox");
l_Save_0.MouseEnter:Connect(function() --[[ Line: 1257 ]]
    PlayPopSound();
end);
GetHumanoidDescription = function() --[[ Line: 1261 ]] --[[ Name: GetHumanoidDescription ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_1 = l_LocalPlayer_0.Character;
    local v232 = l_Character_1 and l_Character_1:FindFirstChild("Humanoid");
    return v232 and v232:FindFirstChild("HumanoidDescription");
end;
local l_HttpService_0 = game:GetService("HttpService");
local v234 = false;
l_Save_0.Activated:Connect(function() --[[ Line: 1272 ]]
    -- upvalues: v234 (ref), v35 (copy), l_SearchHelper_0 (copy), l_ReplicatedStorage_0 (copy), l_HttpService_0 (copy), v42 (ref), l_ByteNetPackets_0 (copy), l_CurrentTab_0 (copy)
    PlayInteractSound();
    if v234 then
        return;
    else
        v234 = true;
        task.delay(2, function() --[[ Line: 1277 ]]
            -- upvalues: v234 (ref)
            v234 = false;
        end);
        local v235 = GetHumanoidDescription();
        if not v235 then
            return;
        elseif #v35 >= l_SearchHelper_0.MAX_OUTFITS then
            local l_Events_1 = l_ReplicatedStorage_0:FindFirstChild("Events");
            local v237 = l_Events_1 and l_Events_1:FindFirstChild("BasicMessage");
            PlayErrorSound();
            if v237 then
                v237:Fire("You have too many saved outfits (max " .. tostring(l_SearchHelper_0.MAX_OUTFITS) .. ")!");
            end;
            return;
        else
            local v238 = string.sub(l_HttpService_0:GenerateGUID(false), 1, 10);
            local v239 = {
                blob = l_SearchHelper_0.ConvertToBlob(v235), 
                name = "Unnamed Item", 
                id = v238
            };
            if v42 then
                v42.CreateTextPrompt("NAME YOUR SAVED OUTFIT.").Execute.Event:Connect(function(v240) --[[ Line: 1309 ]]
                    -- upvalues: v239 (copy), l_ByteNetPackets_0 (ref), v35 (ref), l_CurrentTab_0 (ref)
                    PlayInteractSound();
                    v239.name = v240;
                    l_ByteNetPackets_0.SaveOutfit.send(v239);
                    table.insert(v35, 1, v239);
                    if l_CurrentTab_0.Value == "Outfits" then
                        SearchOutfits();
                    end;
                end);
                return;
            else
                warn("Missing UI_Helper");
                return;
            end;
        end;
    end;
end);
l_Reset_0.MouseEnter:Connect(function() --[[ Line: 1326 ]]
    PlayPopSound();
end);
local v241 = false;
l_Reset_0.Activated:Connect(function() --[[ Line: 1331 ]]
    -- upvalues: v241 (ref), l_ByteNetPackets_0 (copy)
    if v241 then
        return;
    else
        v241 = true;
        task.delay(2, function() --[[ Line: 1334 ]]
            -- upvalues: v241 (ref)
            v241 = false;
        end);
        PlayInteractSound();
        l_ByteNetPackets_0.ResetAppearance.send(true);
        return;
    end;
end);
l_Roblox_0.MouseEnter:Connect(function() --[[ Line: 1343 ]]
    PlayPopSound();
end);
l_Roblox_0.Activated:Connect(function() --[[ Line: 1347 ]]
    -- upvalues: l_AvatarEditorService_0 (copy)
    local v242 = GetHumanoidDescription();
    if not v242 then
        return;
    else
        l_AvatarEditorService_0:PromptSaveAvatar(v242, Enum.HumanoidRigType.R15);
        PlayInteractSound();
        return;
    end;
end);
l_Settings_0.CurrentTab.Value = "Featured";
InitializeSubtabs();