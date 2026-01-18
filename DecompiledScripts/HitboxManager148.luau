local _ = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local _ = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local _ = game:GetService("Players");
local v6 = {};
for _, v8 in l_Workspace_0.Live:GetDescendants() do
    if v8.Name == "Hitbox" then
        table.insert(v6, v8);
    end;
end;
for _, v10 in l_Workspace_0.Welds:GetDescendants() do
    if v10.Name == "Hitbox" then
        table.insert(v6, v10);
    end;
end;
l_Workspace_0.Welds.DescendantAdded:Connect(function(v11) --[[ Line: 21 ]]
    -- upvalues: v6 (copy)
    if v11.Name ~= "Hitbox" then
        return;
    else
        table.insert(v6, v11);
        return;
    end;
end);
l_Workspace_0.Welds.DescendantRemoving:Connect(function(v12) --[[ Line: 26 ]]
    -- upvalues: v6 (copy)
    if v12.Name ~= "Hitbox" then
        return;
    else
        local v13 = table.find(v6, v12);
        table.remove(v6, v13);
        return;
    end;
end);
local v14 = {};
GetCharacters = function(v15) --[[ Line: 34 ]] --[[ Name: GetCharacters ]]
    -- upvalues: l_Workspace_0 (copy)
    local v16 = {};
    for _, v18 in l_Workspace_0.Live:GetChildren() do
        if v18 ~= v15 then
            local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v18.Name);
            table.insert(v16, l_FirstChild_0 and l_FirstChild_0:FindFirstChild("Hitbox") or v18 and v18.PrimaryPart);
        end;
    end;
    return v16;
end;
v14.GetTouchingCharacters = function(_, v21) --[[ Line: 54 ]] --[[ Name: GetTouchingCharacters ]]
    -- upvalues: v6 (copy), l_Workspace_0 (copy)
    local v22 = v21.CollisionGroup or "Hitbox";
    local l_Character_0 = v21.Character;
    local l_Hitbox_0 = v21.Hitbox;
    local _ = {};
    local v26 = OverlapParams.new();
    v26.FilterType = Enum.RaycastFilterType.Include;
    v26.FilterDescendantsInstances = v6;
    v26.MaxParts = false;
    v26.BruteForceAllSlow = false;
    v26.RespectCanCollide = false;
    v26.CollisionGroup = v22;
    local l_l_Workspace_0_PartBoundsInBox_0 = l_Workspace_0:GetPartBoundsInBox(l_Hitbox_0 and l_Hitbox_0.CFrame or v21.CFrame, l_Hitbox_0 and l_Hitbox_0.Size or v21.Size, v26);
    local v28 = {};
    for _, v30 in l_l_Workspace_0_PartBoundsInBox_0 do
        local l_Name_0 = v30.Parent.Name;
        local l_FirstChild_1 = l_Workspace_0.Live:FindFirstChild(l_Name_0);
        if l_FirstChild_1 ~= l_Character_0 then
            table.insert(v28, l_FirstChild_1);
        end;
    end;
    return v28;
end;
v14.GetClosestCharacter = function(_, v34) --[[ Line: 85 ]] --[[ Name: GetClosestCharacter ]]
    -- upvalues: l_Workspace_0 (copy), v14 (copy)
    local l_Character_1 = v34.Character;
    local v36 = l_Workspace_0.States[l_Character_1.Name];
    if not v36 then
        return;
    else
        local _ = v36.PlayerData;
        local l_CharacterData_0 = v36.CharacterData;
        local l_v14_TouchingCharacters_0 = v14:GetTouchingCharacters(v34);
        local v40 = 1000;
        local v41 = nil;
        for _, v43 in l_v14_TouchingCharacters_0 do
            if l_Character_1 and l_Character_1.PrimaryPart then
                if v43 and v43.PrimaryPart and v43:FindFirstChild("Humanoid") and (not l_CharacterData_0.Opponent.Value or l_CharacterData_0.Opponent.Value == v43) then
                    local l_Health_0 = v43.Humanoid.Health;
                    local l_Magnitude_0 = (l_Character_1.PrimaryPart.Position - v43.PrimaryPart.Position).Magnitude;
                    if l_Magnitude_0 < v40 and l_Health_0 > 0 then
                        v40 = l_Magnitude_0;
                        v41 = v43;
                    end;
                end;
            else
                break;
            end;
        end;
        return v41;
    end;
end;
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0:WaitForChild("Styles")).GameplaySettings;
local _ = require(l_ReplicatedFirst_0:WaitForChild("Places"));
v14.CreateHitbox = function(_, v50) --[[ Line: 127 ]] --[[ Name: CreateHitbox ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "Hitbox";
    l_Part_0.Massless = true;
    l_Part_0.Anchored = false;
    l_Part_0.Color = Color3.fromRGB(255, 80, 83);
    l_Part_0.Transparency = v50.VisualizeTransparency or 1;
    l_Part_0.CanCollide = false;
    l_Part_0.Parent = l_Workspace_0.Debris;
    l_Part_0.Size = v50.Size or Vector3.new(3, 1, 2.9000000953674316, 0);
    local l_CollisionGroup_0 = v50.CollisionGroup;
    if l_CollisionGroup_0 then
        l_Part_0.CollisionGroup = l_CollisionGroup_0;
    end;
    if v50.CFrame then
        l_Part_0.Anchored = true;
        l_Part_0.CFrame = v50.CFrame;
    end;
    if v50.Target then
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Parent = l_Part_0;
        l_Weld_0.C0 = v50.C0 or CFrame.new(0, 0, l_Part_0.Size.Z / 2);
        l_Weld_0.Part0 = l_Part_0;
        l_Weld_0.Part1 = v50.Target;
    end;
    return l_Part_0;
end;
return v14;