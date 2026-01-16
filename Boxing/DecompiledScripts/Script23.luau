local v0 = game:GetService("ReplicatedStorage"):WaitForChild("Modules", 20);
local v1 = require(v0:WaitForChild("AnimHelper", 20));
local l_Parent_0 = script.Parent;
local l_Humanoid_0 = l_Parent_0:FindFirstChild("Humanoid");
local v4 = l_Humanoid_0 and (l_Humanoid_0:FindFirstChild("Animator") or l_Humanoid_0);
local l_IdleAnimId_0 = l_Parent_0:FindFirstChild("IdleAnimId");
if not l_IdleAnimId_0 then
    return;
else
    v1:CreateAnim({
        Priority = Enum.AnimationPriority.Core, 
        Animator = v4, 
        AnimId = l_IdleAnimId_0.Value, 
        Looped = true
    });
    return;
end;