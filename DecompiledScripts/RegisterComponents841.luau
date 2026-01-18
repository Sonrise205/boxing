local _ = game:GetService("Players");
local _ = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LoadComponents_0 = require(l_ReplicatedStorage_0:WaitForChild("LoadComponents"));
if not game:IsLoaded() then
    game.Loaded:Wait();
end;
local l_Workspace_0 = game:GetService("Workspace");
if workspace.StreamingEnabled then
    for _, v6 in {} do
        l_Workspace_0:WaitForChild(v6);
    end;
end;
l_LoadComponents_0(l_ReplicatedStorage_0:WaitForChild("Client"):WaitForChild("Components"));
l_LoadComponents_0(l_ReplicatedStorage_0:WaitForChild("Shared"):WaitForChild("Components"));