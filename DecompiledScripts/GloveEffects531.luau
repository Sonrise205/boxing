local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("CollectionService");
local v3 = {};
local _ = l_Workspace_0:WaitForChild("Live", 30);
l_Workspace_0:WaitForChild("Welds", 30).DescendantAdded:Connect(function(v5) --[[ Line: 10 ]]
    -- upvalues: v3 (copy)
    if v5:IsA("BasePart") and v5.Name == "Balrog" then
        task.wait(0.5);
        if not v5 or not v5:IsDescendantOf(game) then
            return;
        else
            v3[v5] = true;
        end;
    end;
end);
local v6 = tick();
l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 22 ]]
    -- upvalues: v3 (copy), v6 (copy)
    for v8, _ in v3 do
        if not v8 or not v8:IsDescendantOf(game) then
            v3[v8] = nil;
        else
            v8.Transparency = (math.sin((tick() - v6) * 4) + 1) / 2 * 0.2 + 0.01;
        end;
    end;
end);