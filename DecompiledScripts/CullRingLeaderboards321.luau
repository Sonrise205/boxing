local l_Workspace_0 = game:GetService("Workspace");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v2 = workspace:WaitForChild("States", 10):WaitForChild(l_LocalPlayer_0.Name, 10);
local v3 = v2:WaitForChild("CharacterData", 10);
local _ = v2:WaitForChild("PlayerData", 10);
local v5 = v2:WaitForChild("Occupied", 10);
local v6 = {};
for _, v8 in l_Workspace_0.Rings:GetChildren() do
    if not string.find("NPCRing", v8.Name) then
        table.insert(v6, v8);
    end;
end;
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
local function _(v10) --[[ Line: 20 ]] --[[ Name: IsLookingAt ]]
    -- upvalues: l_CurrentCamera_0 (copy)
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    local l_Position_0 = v10.Position;
    return l_CFrame_0.LookVector:Dot((l_Position_0 - l_CFrame_0.Position).Unit) > 0.85;
end;
task.spawn(function() --[[ Line: 31 ]]
    -- upvalues: v3 (copy), v6 (copy), l_CurrentCamera_0 (copy), v5 (copy)
    while true do
        debug.profilebegin("CullLeaderboards");
        local l_Value_0 = v3.Centre.Value;
        for _, v16 in v6 do
            local l_Main_0 = v16.Screen.Main;
            local l_CFrame_1 = l_CurrentCamera_0.CFrame;
            local l_Position_1 = l_Main_0.Position;
            local v20 = l_CFrame_1.LookVector:Dot((l_Position_1 - l_CFrame_1.Position).Unit) > 0.85;
            v16.Screen.Main.SurfaceGui.MaxDistance = 150;
            v16.Screen.Main.SurfaceGui.Enabled = l_Value_0 == nil and (v20 and not v5.Spectating.Value or false);
            if v3.Cutscene.Value then
                v16.Screen.Main.SurfaceGui.Enabled = false;
            end;
        end;
        if l_Value_0 then
            local l_Parent_0 = l_Value_0.Parent.Parent;
            l_Parent_0.Screen.Main.SurfaceGui.Enabled = true;
            if l_Parent_0:FindFirstChild("HideScoreboard") then
                l_Parent_0.Screen.Main.SurfaceGui.Enabled = false;
            end;
            if v3.Cutscene.Value then
                l_Parent_0.Screen.Main.SurfaceGui.Enabled = false;
            end;
        end;
        debug.profileend();
        task.wait(0.1);
    end;
end);