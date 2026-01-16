local l_LocalizationService_0 = game:GetService("LocalizationService");
local _ = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v3 = l_RunService_0:IsClient();
local l_DataStoreService_0 = game:GetService("DataStoreService");
local v5 = (not not l_RunService_0:IsStudio() or v3 or _VERSION == "Lune") and {
    GetAsync = function() --[[ Line: 7 ]] --[[ Name: GetAsync ]]
        return nil;
    end
} or l_DataStoreService_0:GetDataStore("JoinedTimes");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_Analytics_0 = l_ReplicatedFirst_0:WaitForChild("Analytics");
local l_GetExperiments_0 = require(l_Analytics_0:WaitForChild("GetExperiments"));
local v9 = require(l_Analytics_0);
local v10 = require(l_ReplicatedFirst_0.XSignal);
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local l_Async_0 = require(l_ReplicatedFirst_0:WaitForChild("Async"));
local l_TypeGuard_0 = require(l_ReplicatedFirst_0:WaitForChild("TypeGuard"));
local l_HttpService_0 = game:GetService("HttpService");
local v15 = _VERSION == "Lune" and "LUNE-SANDBOX-ENV" or l_HttpService_0:GenerateGUID(false);
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local v18 = v10.new();
local v19 = game.GameId == 0 and "UBG_Live" or "UBG_Unknown";
local v20 = "Unknown";
for v21, v22 in l_Places_0 do
    if v22 == game.PlaceId then
        v20 = v21;
    end;
end;
local v23 = {};
local function v29(v24, v25, _) --[[ Line: 34 ]] --[[ Name: ShouldRecordUserExperiment ]]
    -- upvalues: l_Players_0 (copy), v3 (copy)
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v24);
    if not l_l_Players_0_PlayerByUserId_0 then
        return false;
    elseif v3 then
        if l_l_Players_0_PlayerByUserId_0 ~= l_Players_0.LocalPlayer then
            return false;
        else
            script:WaitForChild("EnrolUser"):FireServer(v25);
            return false;
        end;
    else
        local v28 = require(game:GetService("ServerScriptService"):WaitForChild("Data"):WaitForChild("DataManager")).AwaitProfile(l_l_Players_0_PlayerByUserId_0);
        if not v28 then
            return;
        elseif v28.Data.Analytics.Enrolment[v25] then
            return;
        else
            v28.Data.Analytics.Enrolment[v25] = true;
            return true;
        end;
    end;
end;
local function v32(_, _) --[[ Line: 67 ]] --[[ Name: ShouldRecordServerExperiment ]]
    -- upvalues: v3 (copy)
    return not v3;
end;
local _ = function(_) --[[ Line: 71 ]] --[[ Name: IsPlaceDisallowedForExperiment ]]
    -- upvalues: l_Places_0 (copy)
    if game.PlaceId == l_Places_0.Ranked then
        return true;
    else
        return false;
    end;
end;
local function v36(_) --[[ Line: 77 ]] --[[ Name: UserExperimentResortControl ]]
    -- upvalues: l_Places_0 (copy)
    if game.PlaceId == l_Places_0.Ranked then
        return true;
    else
        return false;
    end;
end;
local function v38(_) --[[ Line: 81 ]] --[[ Name: ServerExperimentResortControl ]]
    -- upvalues: l_Places_0 (copy)
    if game.PlaceId == l_Places_0.Ranked then
        return true;
    else
        return false;
    end;
end;
local function v39() --[[ Line: 85 ]] --[[ Name: GetBaseFields ]]
    -- upvalues: v15 (copy), v19 (copy), v20 (ref)
    return {
        ServerUID = (game.JobId == "" and v15 or game.JobId):gsub("%-", ""), 
        Version = tostring(game.PlaceVersion), 
        UniverseID = game.GameId, 
        Universe = v19, 
        PlaceID = game.PlaceId, 
        Place = v20
    };
end;
local function v41(v40) --[[ Line: 97 ]] --[[ Name: GetBaseUserFields ]]
    -- upvalues: v23 (copy)
    return assert(v23[v40], (("PlayerFields[%*] is nil"):format(v40)));
end;
local function v44() --[[ Line: 101 ]] --[[ Name: AwaitServerExperimentSeed ]]
    -- upvalues: v3 (copy), l_Workspace_0 (copy)
    if not v3 then
        local v42 = os.time();
        l_Workspace_0:SetAttribute("ServerExperimentSeed", v42);
        return v42;
    else
        local l_l_Workspace_0_Attribute_0 = l_Workspace_0:GetAttribute("ServerExperimentSeed");
        if l_l_Workspace_0_Attribute_0 then
            return l_l_Workspace_0_Attribute_0;
        else
            l_Workspace_0:GetAttributeChangedSignal("ServerExperimentSeed"):Wait();
            return l_Workspace_0:GetAttribute("ServerExperimentSeed");
        end;
    end;
end;
local v45 = l_GetExperiments_0(script.Experiments);
local v46 = v9.new({
    ServerExperimentSeed = v44(), 
    DeferUserEvents = false, 
    BatchDuration = l_RunService_0:IsStudio() and 5 or 75, 
    GetBaseFields = v39, 
    GetBaseUserFields = v41, 
    ShouldRecordUserExperiment = v29, 
    ShouldRecordServerExperiment = v32, 
    UserExperimentResortControl = v36, 
    ServerExperimentResortControl = v38, 
    UserExperiments = v45, 
    ServerExperiments = l_GetExperiments_0(script.ServerExperiments)
});
local v47 = l_TypeGuard_0.Params(l_TypeGuard_0.Instance("Player"), l_TypeGuard_0.String(), l_TypeGuard_0.String():Or(l_TypeGuard_0.Number()):Or(l_TypeGuard_0.Boolean()));
v46.AddField = function(_, v49, v50, v51) --[[ Line: 136 ]] --[[ Name: AddField ]]
    -- upvalues: v47 (copy), v23 (copy)
    v47(v49, v50, v51);
    v23[v49.UserId][v50] = v51;
end;
if _VERSION == "Lune" then
    return v46;
elseif v3 then
    v23[l_Players_0.LocalPlayer.UserId] = {};
    v46:PlayerJoined(l_Players_0.LocalPlayer);
    return v46;
else
    local l_RemoteEvent_0 = Instance.new("RemoteEvent");
    l_RemoteEvent_0.Name = "EnrolUser";
    l_RemoteEvent_0.Parent = script;
    local v53 = l_TypeGuard_0.String():IsAKeyIn(v45):AsAssertion();
    l_RemoteEvent_0.OnServerEvent:Connect(function(v54, v55) --[[ Line: 158 ]]
        -- upvalues: v53 (copy), v46 (copy)
        v53(v55);
        v46:GetVariationForPlayer(v54, v55);
    end);
    v46.ActiveSessions = 0;
    local function v84(v56) --[[ Line: 165 ]] --[[ Name: OnPlayer ]]
        -- upvalues: l_Async_0 (copy), v46 (copy), v23 (copy), v5 (copy), l_LocalizationService_0 (copy), l_Places_0 (copy), v10 (copy), v18 (copy)
        l_Async_0.Spawn(function() --[[ Line: 166 ]]
            -- upvalues: l_Async_0 (ref), v46 (ref), v56 (copy), v23 (ref), v5 (ref), l_LocalizationService_0 (ref), l_Places_0 (ref), v10 (ref), v18 (ref)
            l_Async_0.OnFinish(function(v57, v58) --[[ Line: 167 ]]
                -- upvalues: v46 (ref), v56 (ref)
                if v57 then
                    v46:PlayerLeft(v56, {
                        Error = "-"
                    }, v58 == "CONTINUE_SESSION");
                else
                    v58 = v58:gsub(v56.Name, "<Player>");
                    v46:PlayerJoined(v56);
                    v46:PlayerLeft(v56, {
                        Error = #v58 > 253 and v58:sub(1, 253) .. "..." or v58
                    });
                end;
                local l_v46_0 = v46;
                l_v46_0.ActiveSessions = l_v46_0.ActiveSessions - 1;
            end);
            local v60 = os.clock();
            local _ = {};
            local v62 = {};
            v23[v56.UserId] = v62;
            local l_v46_1 = v46;
            l_v46_1.ActiveSessions = l_v46_1.ActiveSessions + 1;
            local v64 = require(game:GetService("ServerScriptService"):WaitForChild("Data"):WaitForChild("DataManager")).AwaitProfile(v56);
            if not v64 then
                error("Profile not obtained in time");
            end;
            local l_Analytics_1 = v64.Data.Analytics;
            local l_CarrySessionData_0 = l_Analytics_1.CarrySessionData;
            local l_TotalTimePlayed_0 = l_Analytics_1.TotalTimePlayed;
            local l_FirstTimePlayed_0 = l_Analytics_1.FirstTimePlayed;
            local l_JoinCount_0 = l_Analytics_1.JoinCount;
            local v70 = tonumber(l_FirstTimePlayed_0);
            if not v70 then
                local v71 = DateTime.fromUnixTimestamp(os.time()):ToUniversalTime();
                l_Analytics_1.FirstTimePlayed = v71.Year .. "-" .. ("%.2d"):format(v71.Month) .. "-" .. ("%.2d"):format(v71.Day);
            else
                local v72 = DateTime.fromUnixTimestamp(v70):ToUniversalTime();
                l_Analytics_1.FirstTimePlayed = v72.Year .. "-" .. ("%.2d"):format(v72.Month) .. "-" .. ("%.2d"):format(v72.Day);
            end;
            v62.FirstTimePlayed = l_FirstTimePlayed_0;
            local v73 = l_Async_0.Timer(1, function() --[[ Line: 219 ]]
                -- upvalues: l_Analytics_1 (copy), l_TotalTimePlayed_0 (copy), v60 (copy), v62 (copy), l_TotalTimePlayed_0 (copy)
                l_Analytics_1.TotalTimePlayed = l_TotalTimePlayed_0 + (os.clock() - v60);
                v62.TotalTimePlayed = math.floor(l_TotalTimePlayed_0);
                v62.SubSessionTime = math.floor(os.clock() - v60);
            end);
            if not l_CarrySessionData_0 then
                l_Analytics_1.JoinCount = (l_JoinCount_0 or v5:GetAsync(v56.UserId) or 0) + 1;
            end;
            v62.PlatformType = "Unknown";
            v62.JoinCount = l_JoinCount_0;
            v62.Country = l_LocalizationService_0:GetCountryRegionForPlayerAsync(v56);
            v46:PlayerJoined(v56, nil, l_CarrySessionData_0 ~= nil);
            if l_CarrySessionData_0 then
                v46:GetUserFields(v56.UserId).SessionUID = l_CarrySessionData_0.SessionUID;
                v46:IncrementSessionDuration(v56.UserId, l_CarrySessionData_0.Duration);
                l_Analytics_1.CarrySessionData = nil;
            end;
            local l_v56_Attribute_0 = v56:GetAttribute("TeleportingTo");
            if l_CarrySessionData_0 and l_v56_Attribute_0 then
                local v75 = nil;
                for v76, v77 in l_Places_0 do
                    if v77 == l_v56_Attribute_0 then
                        v75 = v76;
                        break;
                    end;
                end;
                if v75 then
                    v46:LogPlayerEvent(v56, "PlayerHop", {
                        ToPlace = v75
                    });
                end;
            end;
            if v56:IsDescendantOf(game) then
                local v78 = v10.new();
                local v81 = v18:Connect(function(v79, v80) --[[ Line: 272 ]]
                    -- upvalues: v56 (ref), v78 (copy)
                    if v79 ~= v56 then
                        return;
                    else
                        v78:Fire(v80);
                        return;
                    end;
                end);
                local v82 = v78:WaitIndefinite();
                v81:Disconnect();
                if v82 then
                    l_Analytics_1.CarrySessionData = {
                        SessionUID = v46:GetUserFields(v56.UserId).SessionUID, 
                        Duration = v46:GetSessionDuration(v56.UserId)
                    };
                end;
                v73();
                local v83 = true;
                if v82 then
                    return v83, "CONTINUE_SESSION";
                else
                    return v83, "DISCONTINUE_SESSION";
                end;
            else
                v73();
                return false, "IMMEDIATE_LEAVE";
            end;
        end);
    end;
    l_Players_0.PlayerAdded:Connect(v84);
    for _, v86 in l_Players_0:GetChildren() do
        task.spawn(v84, v86);
    end;
    game:BindToClose(function() --[[ Line: 307 ]]
        -- upvalues: v46 (copy)
        task.wait();
        v46:Destroy();
        task.wait();
    end);
    l_Players_0.PlayerRemoving:Connect(function(v87) --[[ Line: 313 ]]
        -- upvalues: v18 (copy)
        v18:Fire(v87, false);
    end);
    v46.OnPlayerLeft = v18;
    return v46;
end;