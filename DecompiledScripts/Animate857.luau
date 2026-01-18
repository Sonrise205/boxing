local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local _ = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local _ = game:GetService("Players");
local l_Parent_0 = script.Parent;
local l_HumanoidRootPart_0 = l_Parent_0:WaitForChild("HumanoidRootPart");
local l_Humanoid_0 = l_Parent_0:WaitForChild("Humanoid");
local l_Animator_0 = l_Humanoid_0:WaitForChild("Animator");
local l_Animations_0 = l_ReplicatedFirst_0:WaitForChild("Animations");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local v12 = l_Workspace_0:WaitForChild("States"):WaitForChild(l_Parent_0.Name);
local l_CharacterData_0 = v12:WaitForChild("CharacterData");
local l_PlayerData_0 = v12:WaitForChild("PlayerData");
local l_Occupied_0 = v12:WaitForChild("Occupied");
local l_Style_0 = l_PlayerData_0:WaitForChild("Style");
local l_Places_0 = require(game.ReplicatedFirst:WaitForChild("Places"));
local v18 = game.PlaceId == l_Places_0.Trading;
local v19 = nil;
local v20 = {};
local v21 = 16;
local v22 = 16;
Lerp = function(v23, v24, v25) --[[ Line: 39 ]] --[[ Name: Lerp ]]
    return v23 + (v24 - v23) * v25;
end;
local v26 = 1;
local v27 = false;
local v28 = l_Parent_0:WaitForChild("AnimSpeed", 20);
local function v51(v29) --[[ Line: 49 ]] --[[ Name: UpdateMovement ]]
    -- upvalues: l_HumanoidRootPart_0 (copy), v19 (ref), l_Occupied_0 (copy), l_Style_0 (copy), v18 (copy), l_Humanoid_0 (copy), v20 (copy), v27 (ref), l_Animator_0 (copy), l_CharacterData_0 (copy), v26 (ref), v21 (ref), v22 (ref), v28 (copy)
    local l_Magnitude_0 = v29.Magnitude;
    if l_HumanoidRootPart_0.Anchored then
        l_Magnitude_0 = 0;
    end;
    local l_v19_0 = v19;
    v19 = l_Occupied_0.Equipped.Value and string.gsub(l_Style_0.Value, "%d+", "") or "Generic";
    local v32 = false;
    if v18 then
        v32 = l_Humanoid_0:GetState() == Enum.HumanoidStateType.Swimming;
    end;
    if v19 ~= l_v19_0 and l_v19_0 or v32 then
        for _, v34 in v20[l_v19_0].Movement do
            if v34.IsPlaying then
                v34:Stop(0.1);
            end;
        end;
    end;
    if v32 then
        v27 = true;
        return;
    else
        if v27 and not v32 then
            for _, v36 in (l_Animator_0:GetPlayingAnimationTracks()) do
                if v36.Name == "Swim" then
                    v36:Stop(0.1);
                end;
            end;
            v27 = false;
        end;
        local v37 = l_Humanoid_0:GetState() == Enum.HumanoidStateType.Freefall;
        local l_Falling_0 = v20[v19].Actions.Falling;
        if not v37 and l_Falling_0 and l_Falling_0.IsPlaying then
            l_Falling_0:Stop();
        end;
        if l_Magnitude_0 > 0.3 and not l_Occupied_0.Dashing.Value and not l_CharacterData_0.Stunned.Value and not l_Occupied_0.Stunned.Value then
            local l_Unit_0 = v29.Unit;
            if v19 == "Generic" then
                local l_Walk_Forward_0 = v20[v19].Movement.Walk_Forward;
                if not l_Walk_Forward_0.IsPlaying then
                    l_Walk_Forward_0:Play();
                    l_Walk_Forward_0:AdjustWeight(10);
                end;
                v26 = v26 + 1;
                if v26 % 120 == 0 then
                    v26 = 1;
                    l_Walk_Forward_0:AdjustSpeed((math.max(l_Magnitude_0 / 16, 0.1)));
                end;
                return;
            else
                v26 = v26 + 1;
                if v26 % 7 == 0 then
                    v26 = 1;
                    for v41, v42 in v20[v19].Movement do
                        local v43 = string.match(v41, "^Walk_(.+)");
                        v42.Looped = true;
                        if v43 and not v37 then
                            if v43 == "Idle" then
                                if v42.IsPlaying then
                                    v42:Stop(0.4);
                                end;
                            elseif not v42.IsPlaying then
                                v42:Play();
                            end;
                            local v44 = -1;
                            if v43 == "Forward" then
                                v44 = math.abs((math.clamp(l_Unit_0.Z, -1, -0.1))) ^ 2;
                            elseif v43 == "Backward" then
                                v44 = math.abs((math.clamp(l_Unit_0.Z, 0.1, 1))) ^ 2;
                            elseif v43 == "Right" then
                                v44 = math.abs((math.clamp(l_Unit_0.X, 0.1, 1))) ^ 2;
                            elseif v43 == "Left" then
                                v44 = math.abs((math.clamp(l_Unit_0.X, -1, -0.1))) ^ 2;
                            end;
                            if v44 >= 0 then
                                v42:AdjustWeight(v44);
                            end;
                            local l_v21_0 = v21;
                            if l_CharacterData_0.Blocking.Value then
                                l_v21_0 = v22;
                            end;
                            local v46 = v28.Value * 0.75;
                            v42:AdjustSpeed((math.max(l_Magnitude_0 / l_v21_0 * v46, 0.1)));
                        elseif v42.IsPlaying then
                            v42:Stop();
                        end;
                    end;
                    return;
                end;
            end;
        else
            local l_v19_1 = v19;
            if l_Style_0 == "Charge" then
                l_v19_1 = "Aoki";
            end;
            for v48, v49 in v20[l_v19_1].Movement do
                local v50 = string.match(v48, "^Walk_(.+)");
                if v50 then
                    if v50 == "Idle" then
                        if not v49.IsPlaying then
                            v49:Play();
                        end;
                    elseif v49.IsPlaying then
                        v49:Stop(0.15);
                    end;
                elseif v49.IsPlaying then
                    v49:Stop();
                end;
            end;
        end;
        return;
    end;
end;
for _, v53 in l_Animations_0:GetChildren() do
    v20[v53.Name] = {};
    v20[v53.Name].Movement = {};
    v20[v53.Name].Actions = {};
    v20[v53.Name].Emotes = {};
    v53:WaitForChild("Movement").ChildAdded:Connect(function(v54) --[[ Line: 203 ]]
        -- upvalues: v20 (copy), v53 (copy), l_Humanoid_0 (copy)
        v20[v53.Name].Movement[v54.Name] = l_Humanoid_0.Animator:LoadAnimation(v54);
    end);
    v53:WaitForChild("Actions").ChildAdded:Connect(function(v55) --[[ Line: 207 ]]
        -- upvalues: v20 (copy), v53 (copy), l_Humanoid_0 (copy)
        v20[v53.Name].Actions[v55.Name] = l_Humanoid_0.Animator:LoadAnimation(v55);
    end);
    v53:WaitForChild("Emotes").ChildAdded:Connect(function(v56) --[[ Line: 211 ]]
        -- upvalues: v20 (copy), v53 (copy), l_Humanoid_0 (copy)
        v20[v53.Name].Emotes[v56.Name] = l_Humanoid_0.Animator:LoadAnimation(v56);
    end);
    for _, v58 in v53.Movement:GetChildren() do
        v20[v53.Name].Movement[v58.Name] = l_Humanoid_0.Animator:LoadAnimation(v58);
    end;
    for _, v60 in v53.Actions:GetChildren() do
        v20[v53.Name].Actions[v60.Name] = l_Humanoid_0.Animator:LoadAnimation(v60);
    end;
    for _, v62 in v53.Emotes:GetChildren() do
        v20[v53.Name].Emotes[v62.Name] = l_Humanoid_0.Animator:LoadAnimation(v62);
    end;
end;
local v63 = 0;
local v64 = nil;
local l_Jump_0 = v20.Generic.Actions.Jump;
local l_Fall_0 = v20.Generic.Actions.Fall;
l_Jump_0.Priority = Enum.AnimationPriority.Movement;
l_Fall_0.Priority = Enum.AnimationPriority.Movement;
task.spawn(function() --[[ Line: 238 ]]
    -- upvalues: l_HumanoidRootPart_0 (copy), v51 (copy), v63 (ref), v64 (ref)
    while true do
        local v67 = task.wait(0.016666666666666666);
        local v68 = Vector3.new(l_HumanoidRootPart_0.Velocity.X, 0, l_HumanoidRootPart_0.Velocity.Z);
        local v69 = l_HumanoidRootPart_0.CFrame:vectorToObjectSpace(v68);
        v51(v69);
        if v63 > 0 then
            v63 = v63 - v67;
        end;
        if v64 == "FreeFall" and v63 > 0 then

        end;
    end;
end);
l_Humanoid_0.StateChanged:Connect(function(v70, v71) --[[ Line: 257 ]]
    -- upvalues: l_Jump_0 (copy), v64 (ref), v63 (ref), l_Fall_0 (copy)
    if v71 == Enum.HumanoidStateType.Jumping then
        l_Jump_0:Stop(0);
        l_Jump_0:Play(0.1);
        v64 = "Jumping";
        return;
    else
        if v71 == Enum.HumanoidStateType.Freefall then
            if v63 <= 0 then
                l_Fall_0:Play(0.3);
                v64 = "FreeFall";
                return;
            end;
        elseif v71 == Enum.HumanoidStateType.Landed or v70 == Enum.HumanoidStateType.Landed or v70 == Enum.HumanoidStateType.Freefall and v71 ~= Enum.HumanoidStateType.Landed then
            l_Jump_0:Stop(0.15);
            l_Fall_0:Stop(0.15);
            v64 = "Landed";
        end;
        return;
    end;
end);
l_CharacterData_0:WaitForChild("Equipped").Changed:Connect(function(_) --[[ Line: 275 ]]
    -- upvalues: l_Styles_0 (copy), l_Style_0 (copy), v21 (ref), v22 (ref)
    local v73 = l_Styles_0[l_Style_0.Value] and l_Styles_0[l_Style_0.Value].CoreInfo;
    v21 = v73.WalkSpeed;
    v22 = (v73.BlockingWalkSpeed + v21) / 2;
end);