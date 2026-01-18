local l_PrivateServerPlusModules_0 = game.ReplicatedStorage.PrivateServerPlusModules;
local _ = require(l_PrivateServerPlusModules_0.SettingTypes);
local v2 = require(l_PrivateServerPlusModules_0:WaitForChild("Modules").SharedHelpers);
local l_ShowTimer_0 = game.ReplicatedStorage:WaitForChild("UIEvents"):WaitForChild("ShowTimer");
local l_TimeDisplayPart_0 = script.TimeDisplayPart;
GetCharacterData = function(v5) --[[ Line: 10 ]] --[[ Name: GetCharacterData ]]
    if not v5 then
        return nil;
    else
        local l_FirstChild_0 = workspace.States:FindFirstChild(v5.Name);
        if not l_FirstChild_0 then
            return;
        else
            return l_FirstChild_0:FindFirstChild("CharacterData");
        end;
    end;
end;
local function _(v7) --[[ Line: 18 ]] --[[ Name: SecondsToDigital ]]
    v7 = math.min(v7, 5999);
    local v8 = v7 // 60;
    return string.format("%02d:%02d", v8, v7 % 60);
end;
local function v15(v10) --[[ Line: 26 ]] --[[ Name: CollectCharactersInRing ]]
    local v11 = {};
    for _, v13 in workspace.Live:GetChildren() do
        local v14 = GetCharacterData(v13);
        if v14 and v14.Centre.Value == v10.Keypoints.Centre then
            table.insert(v11, v13);
        end;
    end;
    return v11;
end;
local function v21(v16) --[[ Line: 40 ]] --[[ Name: CollectCharacterStates ]]
    local v17 = {};
    for _, v19 in v16 do
        local v20 = GetCharacterData(v19);
        if v20 then
            v17[v19.Name] = v20;
        end;
    end;
    return v17;
end;
local _ = function(v22) --[[ Line: 51 ]] --[[ Name: CheckIfInCutscene ]]
    for _, v24 in v22 do
        if v24.Cutscene.Value then
            return true;
        end;
    end;
    return false;
end;
local function v31(v26, v27) --[[ Line: 61 ]] --[[ Name: SpawnTimerUIs ]]
    -- upvalues: l_ShowTimer_0 (copy)
    for _, v29 in v26 do
        local l_PlayerFromCharacter_0 = game.Players:GetPlayerFromCharacter(v29);
        if l_PlayerFromCharacter_0 then
            l_ShowTimer_0:FireClient(l_PlayerFromCharacter_0, v27);
        end;
    end;
end;
local function v45(v32, v33) --[[ Line: 70 ]] --[[ Name: GetWinner ]]
    local l_Stats_0 = v32:FindFirstChild("Stats");
    if not l_Stats_0 then
        warn("No stats folder found in ring");
        return nil;
    else
        local l_Value_0 = l_Stats_0.Player1.Knockdowns.Value;
        local l_Value_1 = l_Stats_0.Player2.Knockdowns.Value;
        local v37 = nil;
        local v38 = nil;
        for v39, v40 in v33 do
            if v40.CurrentRingStats.Value == l_Stats_0.Player1 then
                v37 = workspace.Live:FindFirstChild(v39);
            elseif v40.CurrentRingStats.Value == l_Stats_0.Player2 then
                v38 = workspace.Live:FindFirstChild(v39);
            end;
        end;
        if l_Value_1 < l_Value_0 then
            return v37 and v37.Name;
        elseif l_Value_0 < l_Value_1 then
            return v38 and v38.Name;
        else
            if v37 and v38 then
                local v41 = v33[v37.Name];
                local v42 = v33[v38.Name];
                if v41 and v42 then
                    local v43 = v41.Health.Value / v41.MaxHealth.Value;
                    local v44 = v42.Health.Value / v42.MaxHealth.Value;
                    if v44 < v43 then
                        return v37.Name;
                    elseif v43 < v44 then
                        return v38.Name;
                    end;
                end;
            end;
            return nil;
        end;
    end;
end;
local function v68(v46, v47) --[[ Line: 123 ]] --[[ Name: SpawnTimerForRing ]]
    -- upvalues: l_TimeDisplayPart_0 (copy), v15 (copy), v21 (copy), v31 (copy), v45 (copy)
    local l_v47_0 = v47;
    local v49 = l_TimeDisplayPart_0:Clone();
    local l_Time_0 = v49.BillboardGui.Frame.Time;
    local function _(v51) --[[ Line: 130 ]] --[[ Name: SetTime ]]
        -- upvalues: l_Time_0 (copy), v46 (copy)
        local l_l_Time_0_0 = l_Time_0;
        local v53 = math.min(v51, 5999);
        local v54 = v53 // 60;
        l_l_Time_0_0.Text = string.format("%02d:%02d", v54, v53 % 60);
        v46:SetAttribute("TimerSeconds", v51);
    end;
    local function _() --[[ Line: 135 ]] --[[ Name: CleanupTimer ]]
        -- upvalues: v49 (copy), v46 (copy)
        v49:Destroy();
        v46:SetAttribute("TimerSeconds", nil);
    end;
    v49.CFrame = v46.Keypoints.Centre.CFrame + Vector3.new(0, 12, 0, 0);
    v49.Parent = v46;
    local l_l_v47_0_0 = l_v47_0;
    local v58 = math.min(l_l_v47_0_0, 5999);
    local v59 = v58 // 60;
    l_Time_0.Text = string.format("%02d:%02d", v59, v58 % 60);
    v46:SetAttribute("TimerSeconds", l_l_v47_0_0);
    l_l_v47_0_0 = v15(v46);
    local v60 = v21(l_l_v47_0_0);
    v31(l_l_v47_0_0, v46);
    v58, v59 = pcall(function() --[[ Line: 154 ]]
        -- upvalues: v46 (copy), v60 (copy), l_v47_0 (ref), l_Time_0 (copy), v45 (ref)
        local v61 = false;
        while true do
            if v46:GetAttribute("IsActive") then
                task.wait(1);
                local v62;
                for _, v64 in v60 do
                    if v64.Cutscene.Value then
                        v62 = true;
                        v61 = true;
                    end;
                    if v61 then
                        break;
                    end;
                end;
                if not v61 then
                    v62 = false;
                end;
                v61 = false;
                if not v62 then
                    if l_v47_0 > 0 then
                        l_v47_0 = l_v47_0 - 1;
                        v62 = l_v47_0;
                        local l_l_Time_0_1 = l_Time_0;
                        local v66 = math.min(v62, 5999);
                        local v67 = v66 // 60;
                        l_l_Time_0_1.Text = string.format("%02d:%02d", v67, v66 % 60);
                        v46:SetAttribute("TimerSeconds", v62);
                    else
                        v62 = v45(v46, v60);
                        if v62 then
                            game.ServerScriptService.Events.TimerEnded:Fire(v46, v62);
                            return;
                        else
                            v46:SetAttribute("TimerSeconds", -1);
                            l_Time_0.Text = "SUDDEN DEATH";
                            l_Time_0.Text.TextColor3 = Color3.new(1, 0, 0);
                        end;
                    end;
                end;
            else
                return;
            end;
        end;
    end);
    if not v58 then
        warn((("[ROUND_TIMER] %*"):format(v59)));
    end;
    v49:Destroy();
    v46:SetAttribute("TimerSeconds", nil);
end;
return {
    ID = "CreateRoundTimer", 
    DisplayName = "Create Round Timer", 
    Category = "Match", 
    Type = "Button", 
    ClientCallbackName = "TimerInput", 
    ServerFunction = function(v69, v70) --[[ Line: 190 ]] --[[ Name: ServerFunc ]]
        -- upvalues: v2 (copy), v68 (copy)
        if not v70 then
            return;
        else
            local v71 = v2.FindClosestRing(v69, true);
            if v71 == nil then
                v2.SendMessage(v69, "Something has gone terribly wrong. Could not find a single ring");
                warn("where are the rings");
                return;
            elseif not v71:GetAttribute("IsActive") then
                v2.SendMessage(v69, "The nearest ring isn't in use. This can only be used with rings that are active!");
                return;
            elseif v71:GetAttribute("TimerSeconds") then
                v2.SendMessage(v69, "The nearest ring already has a timer on it!");
                return;
            else
                v68(v71, v70);
                return;
            end;
        end;
    end
};