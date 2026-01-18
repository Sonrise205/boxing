local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local _ = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_Parent_0 = script.Parent;
local l_HumanoidRootPart_0 = l_Parent_0:WaitForChild("HumanoidRootPart");
local l_Humanoid_0 = l_Parent_0:WaitForChild("Humanoid");
local l_Animator_0 = l_Humanoid_0:WaitForChild("Animator");
local l_Animations_0 = l_ReplicatedFirst_0:WaitForChild("Animations");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local v12 = l_Workspace_0:WaitForChild("States"):WaitForChild(l_LocalPlayer_0.Name);
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
local v27 = {
    State = false, 
    Visual = false
};
local v28 = false;
local function v62(v29) --[[ Line: 52 ]] --[[ Name: UpdateMovement ]]
    -- upvalues: l_HumanoidRootPart_0 (copy), v19 (ref), l_Occupied_0 (copy), l_Style_0 (copy), v18 (copy), l_Humanoid_0 (copy), v20 (copy), v28 (ref), l_Animator_0 (copy), l_Styles_0 (copy), l_Parent_0 (copy), l_CharacterData_0 (copy), v26 (ref), l_Workspace_0 (copy), v21 (ref), v22 (ref), v27 (copy)
    local l_Magnitude_0 = v29.Magnitude;
    if l_HumanoidRootPart_0.Anchored then
        l_Magnitude_0 = 0;
    end;
    local l_v19_0 = v19;
    v19 = l_Occupied_0.Equipped.Value and string.gsub(l_Style_0.Value, "%d+", "") or "Generic";
    if v19 == "Generic" then
        return;
    else
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
            v28 = true;
            return;
        else
            if v28 and not v32 then
                for _, v36 in (l_Animator_0:GetPlayingAnimationTracks()) do
                    if v36.Name == "Swim" then
                        v36:Stop(0.1);
                    end;
                end;
                v28 = false;
            end;
            local v37 = l_Humanoid_0:GetState() == Enum.HumanoidStateType.Freefall;
            local l_Falling_0 = v20[v19].Actions.Falling;
            if not v37 and l_Falling_0 and l_Falling_0.IsPlaying then
                l_Falling_0:Stop();
            end;
            local v39 = l_Occupied_0.Equipped.Value and l_Style_0.Value == "SwitchHit";
            local v40 = 7;
            if v39 then
                v40 = 3;
            end;
            if string.find(l_Style_0.Value, "Shiny") then
                v40 = 2;
            end;
            local v41 = (l_Styles_0[l_Style_0.Value] and l_Styles_0[l_Style_0.Value].CoreInfo).HasDizzyIdle and l_Parent_0:GetAttribute("Dizzy");
            local v42 = "Idle";
            if v41 then
                v42 = "IdleDizzy";
            end;
            local l_l_Parent_0_Attribute_0 = l_Parent_0:GetAttribute("ResetIdle");
            if l_Magnitude_0 > 0.3 and (not l_Occupied_0.Dashing.Value or l_l_Parent_0_Attribute_0) and not l_CharacterData_0.Stunned.Value and not l_Occupied_0.Stunned.Value then
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
                    if v26 % v40 == 0 then
                        v26 = 1;
                        for v46, v47 in v20[v19].Movement do
                            local v48 = string.match(v46, "^Walk_(.+)");
                            local v49 = false;
                            if v39 and string.find(v48, "_Southpaw") then
                                v48 = v48:gsub("_Southpaw", "");
                                v49 = true;
                            end;
                            v47.Looped = true;
                            if v48 and not v37 then
                                local v50 = false;
                                if v39 then
                                    local v51 = l_Workspace_0.StyleMode.Value == "Southpaw";
                                    if not v49 and v51 or v49 and not v51 then
                                        v50 = true;
                                    end;
                                end;
                                if string.find(v48, "Idle") then
                                    if v47.IsPlaying then
                                        v47:Stop(0.4);
                                    end;
                                elseif not v47.IsPlaying then
                                    v47:Play();
                                end;
                                local v52 = -1;
                                if v48 == "Forward" then
                                    v52 = math.abs((math.clamp(l_Unit_0.Z, -1, -0.1))) ^ 2;
                                elseif v48 == "Backward" then
                                    v52 = math.abs((math.clamp(l_Unit_0.Z, 0.1, 1))) ^ 2;
                                elseif v48 == "Right" then
                                    v52 = math.abs((math.clamp(l_Unit_0.X, 0.1, 1))) ^ 2;
                                elseif v48 == "Left" then
                                    v52 = math.abs((math.clamp(l_Unit_0.X, -1, -0.1))) ^ 2;
                                end;
                                if v50 then
                                    if v47.IsPlaying then
                                        v47:Stop();
                                    end;
                                else
                                    if v52 >= 0 then
                                        v47:AdjustWeight(v52);
                                    end;
                                    local l_v21_0 = v21;
                                    if l_CharacterData_0.Blocking.Value then
                                        l_v21_0 = v22;
                                    end;
                                    if v46 ~= "Idle" then
                                        local l_Value_0 = l_Workspace_0.AnimSpeed.Value;
                                        if l_l_Parent_0_Attribute_0 and l_Occupied_0.Dashing.Value then
                                            l_Value_0 = l_Value_0 * 1.1;
                                        end;
                                        v47:AdjustSpeed((math.max(l_Magnitude_0 / l_v21_0 * l_Value_0, 0.1)));
                                    end;
                                end;
                            elseif v47.IsPlaying then
                                v47:Stop();
                            end;
                        end;
                        return;
                    end;
                end;
            else
                for v55, v56 in v20[v19].Movement do
                    local v57 = string.match(v55, "^Walk_(.+)");
                    local v58 = false;
                    if v39 and string.find(v57, "_Southpaw") then
                        v57 = v57:gsub("_Southpaw", "");
                        v58 = true;
                    end;
                    if v57 then
                        local v59 = false;
                        if v39 then
                            local v60 = l_Workspace_0.StyleMode.Value == "Southpaw";
                            if not v58 and v60 or v58 and not v60 then
                                v59 = true;
                            end;
                        end;
                        if l_l_Parent_0_Attribute_0 then
                            local v61 = l_Occupied_0.Stunned.Value or l_CharacterData_0.Stunned.Value or l_Occupied_0.Dashing.Value or l_CharacterData_0.Cutscene.Value or l_Occupied_0.LerpMult.Value > 0 or l_Occupied_0.SpeedMult.Value > 0 or l_Occupied_0.Blocking.Value or l_CharacterData_0.Blocking.Value;
                            if v27.State ~= v61 then
                                v27.State = v61;
                                if v27.State == true then
                                    v27.Visual = true;
                                else
                                    task.delay(0.3, function() --[[ Line: 266 ]]
                                        -- upvalues: v27 (ref)
                                        if v27.State == true then
                                            return;
                                        else
                                            v27.Visual = false;
                                            return;
                                        end;
                                    end);
                                end;
                            end;
                            if l_l_Parent_0_Attribute_0 and v57 == v42 and v27.Visual then
                                if not v56.IsPlaying then
                                    v56:Play();
                                end;
                                if v56.Speed >= 0 then
                                    v56:AdjustSpeed(0);
                                    v56.TimePosition = 0;
                                    continue;
                                else
                                    continue;
                                end;
                            end;
                        end;
                        if v57 == v42 and not v39 or v57 == v42 and v39 and not v59 then
                            if not v56.IsPlaying then
                                v56:Play();
                            end;
                            if v56.Speed <= 0 then
                                v56:AdjustSpeed(1);
                            end;
                        elseif v56.IsPlaying then
                            v56:Stop(0.15);
                        end;
                    elseif v56.IsPlaying then
                        v56:Stop();
                    end;
                    if v55 == "ExtraIdle" and not v56.IsPlaying then
                        v56:Play();
                    end;
                end;
            end;
            return;
        end;
    end;
end;
for _, v64 in l_Animations_0:GetChildren() do
    v20[v64.Name] = {};
    v20[v64.Name].Movement = {};
    v20[v64.Name].Actions = {};
    v20[v64.Name].Emotes = {};
    v64:WaitForChild("Movement").ChildAdded:Connect(function(v65) --[[ Line: 323 ]]
        -- upvalues: v20 (copy), v64 (copy), l_Humanoid_0 (copy)
        v20[v64.Name].Movement[v65.Name] = l_Humanoid_0.Animator:LoadAnimation(v65);
        local l_Movement_0 = Enum.AnimationPriority.Movement;
        if string.find(v65.Name, "Idle") then
            l_Movement_0 = Enum.AnimationPriority.Idle;
        end;
        v20[v64.Name].Movement[v65.Name].Priority = l_Movement_0;
    end);
    v64:WaitForChild("Actions").ChildAdded:Connect(function(v67) --[[ Line: 334 ]]
        -- upvalues: v20 (copy), v64 (copy), l_Humanoid_0 (copy)
        v20[v64.Name].Actions[v67.Name] = l_Humanoid_0.Animator:LoadAnimation(v67);
    end);
    v64:WaitForChild("Emotes").ChildAdded:Connect(function(v68) --[[ Line: 338 ]]
        -- upvalues: v20 (copy), v64 (copy), l_Humanoid_0 (copy)
        v20[v64.Name].Emotes[v68.Name] = l_Humanoid_0.Animator:LoadAnimation(v68);
    end);
    for _, v70 in v64.Movement:GetChildren() do
        v20[v64.Name].Movement[v70.Name] = l_Humanoid_0.Animator:LoadAnimation(v70);
        local l_Movement_1 = Enum.AnimationPriority.Movement;
        if string.find(v70.Name, "Idle") then
            l_Movement_1 = Enum.AnimationPriority.Idle;
        end;
        v20[v64.Name].Movement[v70.Name].Priority = l_Movement_1;
    end;
    for _, v73 in v64.Actions:GetChildren() do
        v20[v64.Name].Actions[v73.Name] = l_Humanoid_0.Animator:LoadAnimation(v73);
    end;
    for _, v75 in v64.Emotes:GetChildren() do
        v20[v64.Name].Emotes[v75.Name] = l_Humanoid_0.Animator:LoadAnimation(v75);
    end;
end;
local v76 = 0;
local l_Jump_0 = v20.Generic.Actions.Jump;
local l_Fall_0 = v20.Generic.Actions.Fall;
l_Jump_0.Priority = Enum.AnimationPriority.Movement;
l_Fall_0.Priority = Enum.AnimationPriority.Movement;
task.spawn(function() --[[ Line: 372 ]]
    -- upvalues: l_HumanoidRootPart_0 (copy), v62 (copy), v76 (ref)
    while true do
        local v79 = task.wait(0.016666666666666666);
        local v80 = Vector3.new(l_HumanoidRootPart_0.Velocity.X, 0, l_HumanoidRootPart_0.Velocity.Z);
        local v81 = l_HumanoidRootPart_0.CFrame:vectorToObjectSpace(v80);
        v62(v81);
        if v76 > 0 then
            v76 = v76 - v79;
        end;
    end;
end);
StopAllAnimations = function() --[[ Line: 406 ]] --[[ Name: StopAllAnimations ]]
    -- upvalues: v20 (copy)
    for _, v83 in v20 do
        for _, v85 in v83 do
            for _, v87 in v85 do
                if v87.IsPlaying then
                    v87:Stop(0.1);
                end;
            end;
        end;
    end;
end;
local l_Animate_0 = l_Parent_0:WaitForChild("Animate");
local v89 = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules", 10):WaitForChild("EmoteHelper", 10));
l_CharacterData_0:WaitForChild("Equipped").Changed:Connect(function(v90) --[[ Line: 419 ]]
    -- upvalues: l_Styles_0 (copy), l_Style_0 (copy), v21 (ref), v22 (ref), l_Animate_0 (copy), v89 (copy), l_Parent_0 (copy)
    local v91 = l_Styles_0[l_Style_0.Value] and l_Styles_0[l_Style_0.Value].CoreInfo;
    v21 = v91.WalkSpeed;
    v22 = (v91.BlockingWalkSpeed + v21) / 2;
    l_Animate_0.Enabled = not v90;
    v89.StopAnimsHack(l_Parent_0);
end);
local l_RunAnim_0 = l_Animate_0:WaitForChild("run"):WaitForChild("RunAnim");
if l_RunAnim_0.AnimationId == "http://www.roblox.com/asset/?id=913376220" then
    l_RunAnim_0.AnimationId = "rbxassetid://124389648087757";
end;
if l_Animate_0:WaitForChild("walk"):WaitForChild("WalkAnim").AnimationId == "http://www.roblox.com/asset/?id=913402848" then
    l_RunAnim_0.AnimationId = "rbxassetid://124389648087757";
end;
local l_Animation1_0 = l_Animate_0:WaitForChild("idle"):WaitForChild("Animation1");
if l_Animation1_0.AnimationId == "http://www.roblox.com/asset/?id=507766388" then
    l_Animation1_0.AnimationId = "rbxassetid://139140449744451";
end;