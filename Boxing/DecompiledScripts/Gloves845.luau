local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_UnusualHelper_0 = require(l_Modules_0:WaitForChild("UnusualHelper"));
local l_States_0 = workspace:WaitForChild("States");
EquipGloves = function(v5, v6) --[[ Line: 9 ]] --[[ Name: EquipGloves ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_UnusualHelper_0 (copy)
    if v6 == "" then
        return;
    else
        if type(v5) == "string" then
            v5 = workspace.Live:WaitForChild(v5, 10);
        end;
        if not v5 then
            return;
        else
            local v7 = v5 and workspace.Welds:FindFirstChild(v5.Name);
            local v8 = v7 and v7:WaitForChild("WeldCharacter", 3);
            if v5.Parent ~= workspace.Live then
                v8 = v5;
            end;
            if not v8 then
                return;
            else
                local v9 = {};
                for _, v11 in string.split(v6, "|") do
                    local v12 = string.split(v11, "_");
                    table.insert(v9, {
                        Name = v12[1], 
                        Unusual = v12[2]
                    });
                end;
                for _, v14 in v8:GetChildren() do
                    if string.find(v14.Name, "GloveModel") then
                        v14:Destroy();
                    end;
                end;
                for _, v16 in v5:GetChildren() do
                    if v16:GetAttribute("GlovePart") then
                        v16:Destroy();
                    end;
                    if v16:IsA("BasePart") and string.find(v16.Name, "Arm") then
                        v16.Transparency = 0;
                    end;
                end;
                local v17 = true;
                for _, v19 in v9 do
                    local l_Name_0 = v19.Name;
                    local l_FirstChild_0 = l_ReplicatedStorage_0.Gloves:FindFirstChild(l_Name_0);
                    if not l_FirstChild_0 then
                        return;
                    else
                        local l_Metadata_0 = l_FirstChild_0:FindFirstChild("Metadata");
                        if not l_Metadata_0 then
                            return;
                        else
                            l_Metadata_0 = require(l_Metadata_0);
                            local v23 = v17 and v5:WaitForChild("LeftHand", 5) or v5:WaitForChild("RightHand", 5);
                            if v23 then
                                if l_Metadata_0.ShowHands then
                                    v23.Transparency = 0;
                                else
                                    v23.Transparency = 1;
                                end;
                            end;
                            l_FirstChild_0 = l_FirstChild_0:Clone();
                            l_UnusualHelper_0.ApplyEffect(l_FirstChild_0, v19.Unusual);
                            l_FirstChild_0.Parent = v8;
                            l_FirstChild_0.Name = "GloveModel" .. (v17 and "Left" or "Right");
                            for _, v25 in l_FirstChild_0:GetChildren() do
                                local v26 = v8 and v8:FindFirstChild(v25.Name);
                                if v26 then
                                    if v17 and string.find(v25.Name, "Right") then
                                        v25:Destroy();
                                    elseif not v17 and string.find(v25.Name, "Left") then
                                        v25:Destroy();
                                    else
                                        local l_v5_FirstChild_0 = v5:FindFirstChild(v25.Name);
                                        local v28 = v25:IsA("Model");
                                        local l_Weld_0 = Instance.new("Weld");
                                        l_Weld_0.Name = "Delete";
                                        if v28 then
                                            l_Weld_0.Parent = v25.Middle;
                                            l_Weld_0.Part0 = v25.Middle;
                                            l_Weld_0.Part1 = v26;
                                            v25.Middle.Transparency = 1;
                                        else
                                            v25:SetAttribute("GlovePart", true);
                                            v25.Parent = v5;
                                            l_Weld_0.Parent = v25;
                                            l_Weld_0.Part0 = v25;
                                            l_Weld_0.Part1 = l_v5_FirstChild_0;
                                            for _, v31 in v25:GetChildren() do
                                                if v31:IsA("Motor6D") then
                                                    l_Weld_0:Destroy();
                                                    break;
                                                end;
                                            end;
                                        end;
                                        if l_v5_FirstChild_0 and l_Metadata_0.HideTarget then
                                            l_v5_FirstChild_0.Transparency = 1;
                                        end;
                                    end;
                                end;
                            end;
                            v17 = false;
                            if l_Metadata_0.OnEquip then
                                l_Metadata_0.OnEquip(l_FirstChild_0);
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
end;
StateFolderAdded = function(v32) --[[ Line: 140 ]] --[[ Name: StateFolderAdded ]]
    -- upvalues: l_Players_0 (copy)
    local v33 = v32:WaitForChild("PlayerData", 30):WaitForChild("Gloves", 30);
    local l_Name_1 = v32.Name;
    EquipGloves(l_Name_1, v33.Value);
    v33.Changed:Connect(function(_) --[[ Line: 147 ]]
        -- upvalues: l_Name_1 (copy), v33 (copy)
        EquipGloves(l_Name_1, v33.Value);
    end);
    if not l_Players_0:FindFirstChild(v32.Name) then
        return;
    else
        return;
    end;
end;
l_States_0.ChildAdded:Connect(function(v36) --[[ Line: 155 ]]
    StateFolderAdded(v36);
end);
for _, v38 in l_States_0:GetChildren() do
    StateFolderAdded(v38);
end;
local function _(v39) --[[ Line: 163 ]] --[[ Name: HandleCharacter ]]
    local v40 = workspace.States:WaitForChild(v39.Name, 30):WaitForChild("PlayerData", 30):WaitForChild("Gloves", 30);
    EquipGloves(v39.Name, v40.Value);
end;
workspace.Live.ChildAdded:Connect(function(v42) --[[ Line: 171 ]]
    local v43 = workspace.States:WaitForChild(v42.Name, 30):WaitForChild("PlayerData", 30):WaitForChild("Gloves", 30);
    EquipGloves(v42.Name, v43.Value);
end);
for _, v45 in workspace.Live:GetChildren() do
    local v46 = workspace.States:WaitForChild(v45.Name, 30):WaitForChild("PlayerData", 30):WaitForChild("Gloves", 30);
    EquipGloves(v45.Name, v46.Value);
end;
l_ReplicatedStorage_0.Events.EquipGloves.Event:Connect(function(v47, v48) --[[ Line: 179 ]]
    EquipGloves(v47, v48);
end);