local _ = game.Players;
local l_ReplicatedStorage_0 = game.ReplicatedStorage;
local l_ServerStorage_0 = game.ServerStorage;
local l_ServerScriptService_0 = game.ServerScriptService;
local _ = game:GetService("TweenService");
local _ = game:GetService("RunService");
local l_PrivateServerPlusModules_0 = l_ReplicatedStorage_0.PrivateServerPlusModules;
local _ = require(l_PrivateServerPlusModules_0.SettingTypes);
local _ = require(l_ReplicatedStorage_0.Modules.FuzzySearch);
local l_HttpService_0 = game:GetService("HttpService");
local l_SearchHelper_0 = require(l_ReplicatedStorage_0.Catalog:WaitForChild("SearchHelper"));
local l_require_0 = require;
local l_StartingScript_0 = l_ServerScriptService_0:WaitForChild("Data"):WaitForChild("StartingScript");
local l_CharacterData_0 = l_StartingScript_0:WaitForChild("CharacterData");
local l_Occupied_0 = l_StartingScript_0:WaitForChild("Occupied");
local l_NPCs_0 = l_ServerStorage_0.PSPlus_Assets.NPCs;
local function _(v16) --[[ Line: 35 ]] --[[ Name: CreateStates ]]
    -- upvalues: l_Occupied_0 (copy), l_CharacterData_0 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Occupied_0:Clone().Parent = l_Folder_0;
    l_CharacterData_0:Clone().Parent = l_Folder_0;
    v16.PlayerData:Clone().Parent = l_Folder_0;
    return l_Folder_0;
end;
local function v25(v19) --[[ Line: 51 ]] --[[ Name: CreateHitbox ]]
    -- upvalues: l_StartingScript_0 (copy)
    if not workspace.Welds:FindFirstChild(v19.Name) then
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = v19.Name;
        l_Folder_1.Parent = workspace.Welds;
    end;
    local v21 = workspace.Welds[v19.Name];
    local v22 = l_StartingScript_0.Hitbox:Clone();
    local l_PrimaryPart_0 = v19.PrimaryPart;
    v22.CFrame = l_PrimaryPart_0.CFrame;
    v22.CollisionGroup = "Hitbox";
    v22.CanCollide = false;
    v22.CanQuery = true;
    v22.Parent = v21;
    v22.Transparency = 1;
    v22.Size = Vector3.new(3, 12, 2.25, 0);
    local l_WeldConstraint_0 = Instance.new("WeldConstraint");
    l_WeldConstraint_0.Part0 = v22;
    l_WeldConstraint_0.Part1 = l_PrimaryPart_0;
    l_WeldConstraint_0.Parent = v22;
    return v22;
end;
SpawnNPC = function(v26) --[[ Line: 83 ]] --[[ Name: SpawnNPC ]]
    -- upvalues: l_NPCs_0 (copy), l_HttpService_0 (copy), l_Occupied_0 (copy), l_CharacterData_0 (copy), l_SearchHelper_0 (copy), v25 (copy), l_require_0 (copy)
    local l_l_NPCs_0_FirstChild_0 = l_NPCs_0:FindFirstChild(v26);
    if not l_l_NPCs_0_FirstChild_0 then
        return;
    else
        local v28 = ("%* %*"):format(v26, (l_HttpService_0:GenerateGUID(false)));
        local v29 = l_l_NPCs_0_FirstChild_0.Model:Clone();
        v29.Name = v28;
        local l_Folder_2 = Instance.new("Folder");
        l_Occupied_0:Clone().Parent = l_Folder_2;
        l_CharacterData_0:Clone().Parent = l_Folder_2;
        l_l_NPCs_0_FirstChild_0.PlayerData:Clone().Parent = l_Folder_2;
        local l_l_Folder_2_0 = l_Folder_2;
        l_l_Folder_2_0.Name = v28;
        l_l_Folder_2_0.Parent = workspace.States;
        l_SearchHelper_0.CreateWeldCharacter(v29);
        l_Folder_2 = v25(v29);
        for _, v33 in v29:GetChildren() do
            if v33:IsA("Accessory") then
                for _, v35 in v33:GetDescendants() do
                    if v35:IsA("BasePart") then
                        v35.Anchored = false;
                        v35.Massless = true;
                        v35.CanCollide = false;
                        v35.CastShadow = false;
                        v35.CanQuery = false;
                        v35.CanTouch = false;
                    end;
                end;
            end;
            if v33:IsA("BasePart") and v33.Name ~= "HumanoidRootPart" then
                v33.CollisionGroup = "None";
            end;
        end;
        v29:SetAttribute("ActiveNPC", v26);
        v29:SetAttribute("ServerOwnedNPC", true);
        v29.Parent = workspace.Live;
        local v36 = nil;
        local l_Controller_0 = v29:FindFirstChild("Controller");
        if l_Controller_0 then
            v36 = task.spawn(function() --[[ Line: 128 ]]
                -- upvalues: l_require_0 (ref), l_Controller_0 (copy), v29 (copy)
                l_require_0(l_Controller_0).Init(v29);
            end);
        end;
        return v29, l_l_Folder_2_0;
    end;
end;
return SpawnNPC;