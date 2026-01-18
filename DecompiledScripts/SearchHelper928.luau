local v0 = {
    BLACKLISTED_ASSET_TYPES = {
        19, 
        61, 
        56, 
        55, 
        54, 
        53, 
        52, 
        51, 
        50, 
        49, 
        48, 
        64, 
        65, 
        66, 
        67, 
        68, 
        69, 
        70, 
        71, 
        72
    }, 
    BLACKLISTED_BUNDLE_TYPES = {
        1, 
        2, 
        3
    }, 
    MAX_OUTFITS = 15, 
    MAX_ACCESSORIES = 15, 
    MAX_FAVORITE_ITEMS = 48, 
    MAX_RECENT_ITEMS = 48, 
    AvatarRules = require(script:WaitForChild("AvatarRules"))
};
local v1 = {
    "LeftLowerArm", 
    "LeftUpperArm", 
    "RightLowerArm", 
    "RightUpperArm", 
    "LeftLowerLeg", 
    "LeftUpperLeg", 
    "LeftFoot", 
    "RightLowerLeg", 
    "RightUpperLeg", 
    "RightFoot"
};
local l_Players_0 = game:GetService("Players");
GetHumanoidDescription = function(v3) --[[ Line: 31 ]] --[[ Name: GetHumanoidDescription ]]
    local v4 = v3 and v3:FindFirstChild("Humanoid");
    return v4 and v4:FindFirstChild("HumanoidDescription");
end;
v0.ConvertToBlob = function(v5) --[[ Line: 38 ]] --[[ Name: ConvertToBlob ]]
    -- upvalues: v0 (copy)
    if not v5 then
        return;
    else
        local v6 = "";
        for _, v8 in v0.HumanoidDescriptionProperties do
            v6 = v6 .. v5[v8] .. "|";
        end;
        for _, v10 in v0.ColorProperties do
            local v11 = v5[v10];
            v6 = v6 .. (math.floor(v11.R * 255) .. "," .. math.floor(v11.G * 255) .. "," .. math.floor(v11.B * 255)) .. "|";
        end;
        for _, v13 in v0.NumericalDescriptionProperties do
            v6 = v6 .. tostring(v5[v13]) .. "|";
        end;
        return v6;
    end;
end;
v0.WriteBlobToDescription = function(v14, v15) --[[ Line: 63 ]] --[[ Name: WriteBlobToDescription ]]
    -- upvalues: v0 (copy)
    if not v14 then
        return;
    else
        local v16 = {};
        local v17 = 1;
        for v18, _ in v15:gmatch("(.-)|") do
            table.insert(v16, v18);
        end;
        for _, v21 in v0.HumanoidDescriptionProperties do
            v14[v21] = v16[v17];
            v17 = v17 + 1;
        end;
        for _, v23 in v0.ColorProperties do
            local v24 = {};
            for v25, _ in (v16[v17] .. ","):gmatch("(.-),") do
                v24[#v24 + 1] = v25;
            end;
            v14[v23] = Color3.fromRGB(v24[1], v24[2], v24[3]);
            v17 = v17 + 1;
        end;
        for _, v28 in v0.NumericalDescriptionProperties do
            local v29 = v16[v17];
            if v29 then
                v14[v28] = tonumber(v29);
                v17 = v17 + 1;
            end;
        end;
        return;
    end;
end;
v0.UpdateDescriptionFromBlob = function(v30, v31) --[[ Line: 99 ]] --[[ Name: UpdateDescriptionFromBlob ]]
    -- upvalues: v0 (copy)
    local l_Character_0 = v30.Character;
    local v33 = l_Character_0 and l_Character_0:FindFirstChild("Humanoid");
    local v34 = v33 and v33:FindFirstChild("HumanoidDescription");
    if not v33 or not v34 then
        return;
    else
        v0.WriteBlobToDescription(v34, v31);
        return;
    end;
end;
GetCharacterData = function(v35) --[[ Line: 108 ]] --[[ Name: GetCharacterData ]]
    if not v35 then
        return;
    else
        local l_FirstChild_0 = workspace:WaitForChild("States"):FindFirstChild(v35.Name);
        if not l_FirstChild_0 then
            return;
        else
            return l_FirstChild_0:FindFirstChild("CharacterData");
        end;
    end;
end;
local l_Welds_0 = workspace:WaitForChild("Welds");
v0.CreateWeldCharacter = function(v38) --[[ Line: 117 ]] --[[ Name: CreateWeldCharacter ]]
    -- upvalues: l_Welds_0 (copy)
    local l_l_Welds_0_FirstChild_0 = l_Welds_0:FindFirstChild(v38.Name);
    if not l_l_Welds_0_FirstChild_0 then
        return;
    else
        local l_WeldCharacter_0 = l_l_Welds_0_FirstChild_0:FindFirstChild("WeldCharacter");
        if not l_WeldCharacter_0 then
            l_WeldCharacter_0 = Instance.new("Model");
            l_WeldCharacter_0.Name = "WeldCharacter";
            l_WeldCharacter_0.Parent = l_l_Welds_0_FirstChild_0;
        end;
        for _, v42 in v38:GetChildren() do
            if v42:IsA("BasePart") then
                local l_l_WeldCharacter_0_FirstChild_0 = l_WeldCharacter_0:FindFirstChild(v42.Name);
                if l_l_WeldCharacter_0_FirstChild_0 then
                    local l_Weld_0 = Instance.new("Weld");
                    l_Weld_0.Part0 = l_l_WeldCharacter_0_FirstChild_0;
                    l_Weld_0.Part1 = v42;
                    l_Weld_0.Parent = l_l_WeldCharacter_0_FirstChild_0;
                    for _, v46 in l_l_WeldCharacter_0_FirstChild_0:GetChildren() do
                        if v46.Name == "Weld" and v46 ~= l_Weld_0 then
                            v46:Destroy();
                        end;
                    end;
                else
                    local l_Part_0 = Instance.new("Part");
                    l_Part_0.Anchored = false;
                    l_Part_0.Massless = true;
                    l_Part_0.CanCollide = false;
                    l_Part_0.CastShadow = false;
                    l_Part_0.CanQuery = false;
                    l_Part_0.CanTouch = false;
                    l_Part_0.Name = v42.Name;
                    l_Part_0.Size = v42.Size;
                    l_Part_0.CFrame = v42.CFrame;
                    l_Part_0.Transparency = 1;
                    l_Part_0.Parent = l_WeldCharacter_0;
                    local l_Weld_1 = Instance.new("Weld");
                    l_Weld_1.Part0 = l_Part_0;
                    l_Weld_1.Part1 = v42;
                    l_Weld_1.Parent = l_Part_0;
                end;
            end;
        end;
        l_WeldCharacter_0.PrimaryPart = l_WeldCharacter_0:WaitForChild("HumanoidRootPart", 5);
        return;
    end;
end;
local _ = require(game:GetService("ReplicatedFirst"):WaitForChild("Places"));
v0.UpdateModelAppearance = function(v50) --[[ Line: 172 ]] --[[ Name: UpdateModelAppearance ]]
    -- upvalues: l_Players_0 (copy), v0 (copy), v1 (copy)
    local v51 = v50 and v50:FindFirstChild("Humanoid");
    local v52 = v51 and v51:FindFirstChild("HumanoidDescription");
    if not v51 or not v52 then
        return;
    else
        local l_RequiresNeck_0 = v51.RequiresNeck;
        v51.RequiresNeck = false;
        local v54 = v52:Clone();
        local v55 = false;
        local function v63(v56) --[[ Line: 198 ]] --[[ Name: CheckSOHD ]]
            -- upvalues: v52 (copy), v55 (ref)
            if not v56 then
                return;
            else
                for v57, v58 in v56:GetAttributes() do
                    if v58 then
                        local v59 = string.split(v57, "_");
                        if v59[1] == "SOHD" then
                            local v60 = v59[2];
                            local v61 = v59[3];
                            local _ = v59[4];
                            if v60 == "Replace" then
                                v52[v61] = v58;
                            elseif v60 == "Add" then
                                v52[v61] = v52[v61] .. v58;
                            end;
                            v55 = true;
                        end;
                    end;
                end;
                return;
            end;
        end;
        local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v50);
        v63(v50);
        v63(l_l_Players_0_PlayerFromCharacter_0);
        local l_l_Players_0_HumanoidModelFromDescription_0 = l_Players_0:CreateHumanoidModelFromDescription(v52, Enum.HumanoidRigType.R15);
        (function(v66) --[[ Line: 233 ]] --[[ Name: CheckBald ]]
            -- upvalues: l_l_Players_0_HumanoidModelFromDescription_0 (copy)
            if not v66 then
                return;
            elseif not v66:GetAttribute("Bald") then
                return;
            else
                for _, v68 in l_l_Players_0_HumanoidModelFromDescription_0:GetChildren() do
                    if v68:IsA("Accessory") and v68.AccessoryType == Enum.AccessoryType.Hair or string.find(string.lower(v68.Name), "hair") then
                        v68:Destroy();
                    end;
                end;
                return;
            end;
        end)(v50);
        v63(l_l_Players_0_PlayerFromCharacter_0);
        if v55 then
            for _, v70 in v0.HumanoidDescriptionProperties do
                v52[v70] = v54[v70];
            end;
        end;
        if v54 then
            v54:Destroy();
        end;
        v51:ReplaceBodyPartR15("Head", l_l_Players_0_HumanoidModelFromDescription_0.Head:Clone());
        local v71 = {
            "BodyColors", 
            "Accessory", 
            "Shirt", 
            "Pants", 
            "ShirtGraphic"
        };
        for _, v73 in v50:GetChildren() do
            if table.find(v71, v73.ClassName) then
                v73:Destroy();
            end;
        end;
        for _, v75 in l_l_Players_0_HumanoidModelFromDescription_0:GetChildren() do
            if table.find(v71, v75.ClassName) then
                for _, v77 in v75:GetDescendants() do
                    if v77:IsA("BasePart") then
                        v77.CollisionGroup = "None";
                    end;
                end;
                v75.Parent = v50;
            end;
        end;
        l_l_Players_0_HumanoidModelFromDescription_0:Destroy();
        if v51 then
            v51.RequiresNeck = l_RequiresNeck_0;
        end;
        local v78 = tick();
        if v50 then
            v50:SetAttribute("LastAppearanceChange", v78);
        end;
        task.delay(0.2, function() --[[ Line: 299 ]]
            -- upvalues: v50 (copy), v78 (copy), v0 (ref), v51 (copy), l_l_Players_0_PlayerFromCharacter_0 (copy), v1 (ref)
            if v50:GetAttribute("LastAppearanceChange") ~= v78 then
                return;
            elseif not v50:IsDescendantOf(workspace) then
                return;
            else
                v0.CreateWeldCharacter(v50);
                v51:BuildRigFromAttachments();
                local v79 = v50:GetAttribute("R6") and v50.Parent == workspace.Live;
                if v79 then
                    local l_States_0 = workspace:FindFirstChild("States");
                    local v81 = l_States_0 and l_States_0:FindFirstChild(l_l_Players_0_PlayerFromCharacter_0 and l_l_Players_0_PlayerFromCharacter_0.Name or v50.Name);
                    local v82 = v81 and v81:FindFirstChild("PlayerData");
                    local v83 = v82 and v82.Style.Value;
                    for _, v85 in v50:GetChildren() do
                        if v85.Name == "R6" then
                            v85:Destroy();
                        end;
                    end;
                    if v79 ~= v83 then
                        v79 = false;
                        v50:SetAttribute("R6", nil);
                        for _, v87 in v1 do
                            local l_v50_FirstChild_0 = v50:FindFirstChild(v87);
                            if l_v50_FirstChild_0 then
                                l_v50_FirstChild_0.Transparency = 0;
                            end;
                        end;
                        return;
                    else
                        for _, v90 in v1 do
                            local l_v50_FirstChild_1 = v50:FindFirstChild(v90);
                            if l_v50_FirstChild_1 then
                                l_v50_FirstChild_1.Transparency = 1;
                            end;
                        end;
                        local v92 = script.R6:Clone();
                        v92.Parent = v50;
                        for v93, v94 in {
                            ["Left Arm"] = "LeftLowerArm", 
                            ["Right Arm"] = "RightLowerArm", 
                            ["Left Leg"] = "LeftLowerLeg", 
                            ["Right Leg"] = "RightLowerLeg"
                        } do
                            local l_v92_FirstChild_0 = v92:FindFirstChild(v93);
                            local l_v50_FirstChild_2 = v50:FindFirstChild(v94);
                            if l_v92_FirstChild_0 and l_v50_FirstChild_2 then
                                l_v92_FirstChild_0.Weld.Part1 = l_v50_FirstChild_2;
                                l_v92_FirstChild_0.Color = l_v50_FirstChild_2.Color;
                                l_v92_FirstChild_0.Transparency = 0;
                            end;
                        end;
                        local v97 = {
                            "Pants", 
                            "Shirt", 
                            "Body Colors"
                        };
                        for _, v99 in v50:GetChildren() do
                            if table.find(v97, v99.ClassName) then
                                v99:Clone().Parent = v92;
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end);
        return;
    end;
end;
v0.UpdateAppearance = function(v100, v101) --[[ Line: 375 ]] --[[ Name: UpdateAppearance ]]
    -- upvalues: v0 (copy)
    local v102 = GetCharacterData(v100);
    if not v101 and v102 and v102.Opponent.Value then
        return;
    elseif game:GetService("RunService"):IsClient() then
        return;
    else
        local v103 = v100:IsA("Model") and v100 or v100.Character;
        v0.UpdateModelAppearance(v103);
        return;
    end;
end;
v0.TabToCategory = {
    Community = -1, 
    Outfits = -1, 
    Featured = 1, 
    Clothing = 3, 
    Accessories = 11, 
    Hair = 4, 
    Faces = 4, 
    Heads = 4, 
    Body = -1, 
    Recent = -1, 
    Favorites = -1, 
    Inventory = -10
};
v0.SubtabToSubcategory = {
    Hat = 54, 
    Face = 21, 
    Neck = 22, 
    Shoulder = 23, 
    Front = 24, 
    Back = 25, 
    Waist = 26, 
    Shirts = 56, 
    Pants = 57, 
    Classic = 15, 
    Dynamic = 66
};
v0.TabToSubcategory = {
    Hair = 20, 
    Faces = 10
};
v0.SubtabToExtraTerms = {
    Popular = "&SortAggregation=4", 
    Trending = "&SortAggregation=3&SortType=2", 
    New = "&SortAggregation=1&SortType=3"
};
v0.Subcategories = {
    Community = {
        "Popular", 
        "Trending", 
        "New"
    }, 
    Featured = {
        "Popular", 
        "Trending", 
        "New"
    }, 
    Accessories = {
        "Hat", 
        "Face", 
        "Neck", 
        "Shoulder", 
        "Front", 
        "Back", 
        "Waist"
    }, 
    Clothing = {
        "Shirts", 
        "Pants"
    }, 
    Heads = {
        "Classic", 
        "Dynamic"
    }, 
    Inventory = {
        "Accessories", 
        "Clothing"
    }, 
    Body = {
        "Skin Tone"
    }
};
v0.IgnoreSearchTabs = {
    Body = true
};
v0.TabToNumber = {
    Community = -1
};
v0.SubtabToNumber = {
    All = 1
};
ConvertToNameToNumber = function(v104, v105) --[[ Line: 471 ]] --[[ Name: ConvertToNameToNumber ]]
    local v106 = {};
    for v107, _ in v104 do
        table.insert(v106, v107);
    end;
    table.sort(v106);
    for v109, v110 in v106 do
        if not v105[v110] then
            v105[v110] = v109 + 1;
        end;
    end;
end;
ConvertToNameToNumber(v0.TabToCategory, v0.TabToNumber);
local v111 = {};
for _, v113 in v0.Subcategories do
    for _, v115 in v113 do
        v111[v115] = true;
    end;
end;
ConvertToNameToNumber(v111, v0.SubtabToNumber);
v0.NumberToTab = {};
for v116, v117 in v0.TabToNumber do
    v0.NumberToTab[v117] = v116;
end;
v0.NumberToSubtab = {};
for v118, v119 in v0.SubtabToNumber do
    v0.NumberToSubtab[v119] = v118;
end;
v0.HumanoidDescriptionProperties = {
    "BackAccessory", 
    "FaceAccessory", 
    "FrontAccessory", 
    "HairAccessory", 
    "HatAccessory", 
    "NeckAccessory", 
    "ShouldersAccessory", 
    "WaistAccessory", 
    "GraphicTShirt", 
    "Pants", 
    "Shirt", 
    "Face", 
    "Head"
};
v0.ColorProperties = {
    "HeadColor", 
    "LeftArmColor", 
    "LeftLegColor", 
    "RightArmColor", 
    "RightLegColor", 
    "TorsoColor"
};
v0.NumericalDescriptionProperties = {
    "GraphicTShirt", 
    "Pants", 
    "Shirt", 
    "Face", 
    "Head"
};
v0.GetStupidName = {
    Hat = "HatAccessory", 
    ShoulderAccessory = "ShouldersAccessory", 
    TShirt = "GraphicTShirt"
};
v0.GetActualName = {};
for v120, v121 in v0.GetStupidName do
    v0.GetActualName[v121] = v120;
end;
local v122 = {};
for _, v124 in Enum.AssetType:GetEnumItems() do
    v122[v124.Value] = v124.Name;
end;
v0.HasTooManyAccessories = function(v125, v126) --[[ Line: 560 ]] --[[ Name: HasTooManyAccessories ]]
    -- upvalues: v122 (copy), v0 (copy)
    local v127 = v122[v125];
    if not v127 then
        return;
    else
        if v127 == "ShoulderAccessory" then
            v127 = "ShouldersAccessory";
        end;
        if v127 == "Hat" then
            v127 = "HatAccessory";
        end;
        if not string.find(v127, "Accessory") then
            return;
        else
            local v128 = "";
            for _, v130 in v0.HumanoidDescriptionProperties do
                if string.find(v130, "Accessory") then
                    v128 = v128 .. v126[v130] .. ",";
                end;
            end;
            local v131 = 0;
            for v132 in v128:gmatch("(.-),") do
                if v132 ~= "" and v132 ~= nil and v132 ~= "0" then
                    v131 = v131 + 1;
                end;
            end;
            if v0.MAX_ACCESSORIES <= v131 then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
v0.BodyPartOptionsToNumber = {
    All = 1, 
    HeadColor = 2, 
    TorsoColor = 3, 
    LeftArmColor = 4, 
    RightArmColor = 5, 
    LeftLegColor = 6, 
    RightLegColor = 7
};
v0.NumberToBodyPartOption = {};
for v133, v134 in v0.BodyPartOptionsToNumber do
    v0.NumberToBodyPartOption[v134] = v133;
end;
return v0;