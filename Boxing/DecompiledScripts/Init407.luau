local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local l_EffectHelper_0 = l_Modules_0:WaitForChild("EffectHelper");
getDescendants = function(v6) --[[ Line: 13 ]] --[[ Name: getDescendants ]]
    local v7 = {};
    local function v8(v9) --[[ Line: 16 ]] --[[ Name: loop ]]
        -- upvalues: v8 (copy), v7 (copy)
        for v10, v11 in pairs(v9) do
            if type(v11) == "table" then
                v8(v11);
            elseif string.find(v10, "AnimId") then
                table.insert(v7, v11);
            end;
        end;
    end;
    v8(v6);
    return v7;
end;
LazyPreloadAnimations = function(v12) --[[ Line: 32 ]] --[[ Name: LazyPreloadAnimations ]]
    -- upvalues: l_EffectHelper_0 (copy), l_AnimHelper_0 (copy)
    local v13 = l_EffectHelper_0.Dummy:Clone();
    v13:PivotTo(CFrame.new(0, -1000, 0));
    v13.PrimaryPart.Anchored = true;
    v13.Parent = workspace.Debris;
    local l_Humanoid_0 = v13:FindFirstChild("Humanoid");
    local v15 = l_Humanoid_0:FindFirstChild("Animator") or l_Humanoid_0;
    if not v15 then
        if v13 then
            v13:Destroy();
        end;
        return;
    else
        for _, v17 in v12 do
            local v18 = {
                Animator = v15, 
                AnimId = v17, 
                Priority = Enum.AnimationPriority.Core, 
                FadeIn = 0
            };
            for _ = 1, 3 do
                l_AnimHelper_0:CreateAnim(v18);
                task.wait(0.1);
            end;
        end;
        task.delay(2, function() --[[ Line: 60 ]]
            -- upvalues: v13 (copy)
            if v13 then
                v13:Destroy();
            end;
        end);
        return;
    end;
end;
local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
workspace.States:WaitForChild(l_LocalPlayer_0.Name, 30);
repeat
    task.wait(1);
until l_LocalPlayer_0:GetAttribute("Loaded");
local v21 = l_CommonUtilities_0.GetCharacterData(l_LocalPlayer_0);
local v22 = l_CommonUtilities_0.GetPlayerData(l_LocalPlayer_0);
local v23 = v22:WaitForChild("Style", 30);
LazyPreloadAnimations(getDescendants(l_Styles_0[v23.Value]));
v22.Style.Changed:Connect(function() --[[ Line: 76 ]]
    -- upvalues: l_Styles_0 (copy), v23 (copy)
    LazyPreloadAnimations(getDescendants(l_Styles_0[v23.Value]));
end);
local l_Opponent_0 = v21.Opponent;
l_Opponent_0.Changed:Connect(function() --[[ Line: 81 ]]
    -- upvalues: l_CommonUtilities_0 (copy), l_Opponent_0 (copy), l_Styles_0 (copy)
    local v25 = l_CommonUtilities_0.GetPlayerData(l_Opponent_0.Value);
    if not v25 then
        return;
    else
        LazyPreloadAnimations(getDescendants(l_Styles_0[v25.Style.Value]));
        return;
    end;
end);
local v26 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common", 30);
local v27 = v26 and v26:FindFirstChild("ScreenGui");
if v27 then
    v27:Destroy();
end;