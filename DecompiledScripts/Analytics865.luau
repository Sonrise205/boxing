if not script then
    script = game:GetService("ReplicatedFirst").Analytics;
end;
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent;
local l_Merge1D_0 = require(l_Parent_0:WaitForChild("TableUtil")).Map.Merge1D;
local l_Cleaner_0 = require(l_Parent_0:WaitForChild("Cleaner"));
local l_XSignal_0 = require(l_Parent_0:WaitForChild("XSignal"));
local l_Async_0 = require(l_Parent_0:WaitForChild("Async"));
local l_TypeGuard_0 = require(l_Parent_0:WaitForChild("TypeGuard"));
local _ = require(script:WaitForChild("_Types"));
local v10 = l_TypeGuard_0.String():Or(l_TypeGuard_0.Number()):Or(l_TypeGuard_0.Boolean());
local v11 = l_TypeGuard_0.Object():OfKeyType(l_TypeGuard_0.String()):OfValueType(v10);
local v12 = Random.new();
local v13 = {};
v13.__index = v13;
v13.new = function(v14) --[[ Line: 110 ]] --[[ Name: new ]]
    -- upvalues: l_Cleaner_0 (copy), l_XSignal_0 (copy), v13 (copy), l_Async_0 (copy)
    local v15 = setmetatable({
        _Config = v14, 
        _RecordedServerExperiments = {}, 
        _UserToSession = {}, 
        _UserEventLog = {}, 
        _EventLog = {}, 
        _Cleaner = l_Cleaner_0.new(), 
        Events = {
            OnUserEventBatch = l_XSignal_0.new(), 
            OnEventBatch = l_XSignal_0.new(), 
            OnUserJoined = l_XSignal_0.new(), 
            OnUserLeft = l_XSignal_0.new()
        }
    }, v13);
    v15._Cleaner:Add(l_Async_0.Timer(v14.BatchDuration, function() --[[ Line: 129 ]]
        -- upvalues: v15 (copy)
        v15:_SendBatch();
    end));
    for v16, v17 in v15._Config.ServerExperiments do
        if v17.EnrolAll then
            v15:GetVariationForServer(v16);
        end;
    end;
    return v15;
end;
v13._SendBatch = function(v18) --[[ Line: 146 ]] --[[ Name: _SendBatch ]]
    local l__EventLog_0 = v18._EventLog;
    if next(l__EventLog_0) == nil then
        return;
    else
        v18._EventLog = {};
        v18.Events.OnEventBatch:Fire(l__EventLog_0);
        return;
    end;
end;
v13._GetUserExperiment = function(v20, v21) --[[ Line: 157 ]] --[[ Name: _GetUserExperiment ]]
    return assert(v20._Config.UserExperiments[v21], (("User experiment %* not found"):format(v21)));
end;
v13._GetServerExperiment = function(v22, v23) --[[ Line: 161 ]] --[[ Name: _GetServerExperiment ]]
    return assert(v22._Config.ServerExperiments[v23], (("Server experiment %* not found"):format(v23)));
end;
local v24 = l_TypeGuard_0.Params(l_TypeGuard_0.Number():Integer());
v13.HasUserJoined = function(v25, v26) --[[ Line: 167 ]] --[[ Name: HasUserJoined ]]
    -- upvalues: v24 (copy)
    v24(v26);
    return v25._UserToSession[v26] ~= nil;
end;
local v27 = l_TypeGuard_0.Params(l_TypeGuard_0.Number():Integer(), v11:Optional(), l_TypeGuard_0.Boolean():Optional());
v13.UserJoined = function(v28, v29, v30, v31) --[[ Line: 174 ]] --[[ Name: UserJoined ]]
    -- upvalues: v27 (copy), l_HttpService_0 (copy)
    v27(v29, v30, v31);
    v28._UserToSession[v29] = {
        SessionUID = l_HttpService_0:GenerateGUID(false):gsub("%-", ""), 
        StartTime = os.clock()
    };
    v28._UserEventLog[v29] = {};
    v28.Events.OnUserJoined:Fire(v29);
    if not v31 then
        v28:LogUserEvent(v29, "PlayerJoined", v30);
    end;
    for v32, v33 in v28._Config.UserExperiments do
        if v33.EnrolAll then
            v28:GetVariationForUser(v29, v32);
        end;
    end;
end;
local v34 = l_TypeGuard_0.Params(l_TypeGuard_0.Number():Integer(), v11:Optional(), l_TypeGuard_0.Boolean():Optional());
v13.UserLeft = function(v35, v36, v37, v38) --[[ Line: 198 ]] --[[ Name: UserLeft ]]
    -- upvalues: v34 (copy)
    v34(v36, v37, v38);
    if not v38 then
        v35:LogUserEvent(v36, "PlayerLeft", v37);
    end;
    local l_Events_0 = v35.Events;
    local l__UserEventLog_0 = v35._UserEventLog;
    local l__UserToSession_0 = v35._UserToSession;
    assert(l__UserToSession_0[v36], (("User %* not found in session data - ensure UserJoined is always called"):format(v36)));
    l_Events_0.OnUserLeft:Fire(v36);
    l_Events_0.OnUserEventBatch:Fire(v36, l__UserEventLog_0[v36] or {});
    l__UserToSession_0[v36] = nil;
    l__UserEventLog_0[v36] = nil;
end;
local v42 = l_TypeGuard_0.Params(l_TypeGuard_0.String():Pattern("%w+"), v11:Optional());
v13.LogEvent = function(v43, v44, v45, v46) --[[ Line: 221 ]] --[[ Name: LogEvent ]]
    -- upvalues: v42 (copy), v11 (copy), l_Merge1D_0 (copy)
    v42(v44, v45);
    local v47 = nil;
    task.spawn(function() --[[ Line: 227 ]]
        -- upvalues: v47 (ref), v43 (copy)
        v47 = v43._Config.GetBaseFields();
    end);
    v11:Assert(v47);
    local v48 = l_Merge1D_0(l_Merge1D_0(v46 and {} or v47, {
        TimeStamp = os.time(), 
        Event = v44
    }), v45 or {});
    local l_UserID_0 = v48.UserID;
    if v43._Config.DeferUserEvents and l_UserID_0 then
        local v50 = v43._UserEventLog[l_UserID_0];
        assert(v50, (("User %* not found in UserEventLog"):format(l_UserID_0)));
        table.insert(v50, v48);
        return;
    else
        table.insert(v43._EventLog, v48);
        return;
    end;
end;
local v51 = l_TypeGuard_0.Params(l_TypeGuard_0.Number(0, 1), l_TypeGuard_0.String():Pattern("%w+"), v11:Optional());
v13.LogEventWithProbability = function(v52, v53, v54, v55) --[[ Line: 259 ]] --[[ Name: LogEventWithProbability ]]
    -- upvalues: v51 (copy), v12 (copy)
    v51(v53, v54, v55);
    if v53 < v12:NextNumber() then
        return;
    else
        v52:LogEvent(v54, v55);
        return;
    end;
end;
local v56 = l_TypeGuard_0.Params(l_TypeGuard_0.Number():Integer(), l_TypeGuard_0.String():Pattern("Player%w+"):FailMessage("Player events must be prefixed with 'Player' and have an alphanumeric suffix"), v11:Optional());
v13.LogUserEvent = function(v57, v58, v59, v60) --[[ Line: 275 ]] --[[ Name: LogUserEvent ]]
    -- upvalues: v56 (copy), v11 (copy), l_Merge1D_0 (copy)
    v56(v58, v59, v60);
    task.spawn(function() --[[ Line: 278 ]]
        -- upvalues: v57 (copy), v58 (copy), v59 (copy), v11 (ref), l_Merge1D_0 (ref), v60 (copy)
        v57:AwaitUserPresent(v58);
        local v61 = v57._UserToSession[v58];
        if not v61 then
            v57:LogEvent("LogFailed", {
                Name = v59
            });
            return;
        else
            local v62 = v57._Config.GetBaseUserFields(v58);
            v11:Assert(v62);
            local v63 = l_Merge1D_0(v62, l_Merge1D_0({
                UserID = v58, 
                SessionUID = v61.SessionUID, 
                AtSessionTime = v57:GetSessionDuration(v58)
            }, v60 or {}));
            v57:LogEvent(v59, v63);
            return;
        end;
    end);
end;
local v64 = l_TypeGuard_0.Params(l_TypeGuard_0.Number():Integer());
v13.GetSessionDuration = function(v65, v66) --[[ Line: 308 ]] --[[ Name: GetSessionDuration ]]
    -- upvalues: v64 (copy)
    v64(v66);
    local v67 = assert(v65._UserToSession[v66], "User not present in game");
    return (math.floor(os.clock() - v67.StartTime));
end;
local v68 = l_TypeGuard_0.Params(l_TypeGuard_0.Number():Integer());
v13.IncrementSessionDuration = function(v69, v70, v71) --[[ Line: 317 ]] --[[ Name: IncrementSessionDuration ]]
    -- upvalues: v68 (copy)
    v68(v70);
    local v72 = assert(v69._UserToSession[v70], "User not present in game");
    v72.StartTime = v72.StartTime - v71;
end;
local v73 = l_TypeGuard_0.Params(l_TypeGuard_0.Number():Integer());
v13.AwaitUserPresent = function(v74, v75) --[[ Line: 326 ]] --[[ Name: AwaitUserPresent ]]
    -- upvalues: v73 (copy), l_XSignal_0 (copy)
    v73(v75);
    if not v74:HasUserJoined(v75) then
        local v76 = l_XSignal_0.new();
        local v77 = nil;
        v77 = v74.Events.OnUserJoined:Connect(function(v78) --[[ Line: 332 ]]
            -- upvalues: v75 (copy), v77 (ref), v76 (copy)
            if v78 ~= v75 then
                return;
            else
                v77:Disconnect();
                v76:Fire(true);
                return;
            end;
        end);
        return v76:Wait(120) ~= nil;
    else
        return true;
    end;
end;
local v79 = l_TypeGuard_0.Params(l_TypeGuard_0.Number():Integer());
v13.GetUserFields = function(v80, v81) --[[ Line: 349 ]] --[[ Name: GetUserFields ]]
    -- upvalues: v79 (copy)
    v79(v81);
    local l__UserToSession_1 = v80._UserToSession;
    assert(l__UserToSession_1[v81], "User not present in game");
    return l__UserToSession_1[v81];
end;
local v83 = l_TypeGuard_0.Params(l_TypeGuard_0.Number():Integer(), l_TypeGuard_0.Number(0, 1), l_TypeGuard_0.String():Pattern("Player%w+"):FailMessage("Player events must be prefixed with 'Player' and have an alphanumeric suffix"), v11:Optional());
v13.LogUserEventWithProbability = function(v84, v85, v86, v87, v88) --[[ Line: 363 ]] --[[ Name: LogUserEventWithProbability ]]
    -- upvalues: v83 (copy)
    v83(v85, v86, v87, v88);
    if v86 < Random.new(v85):NextNumber() then
        return;
    else
        v84:LogUserEvent(v85, v87, v88);
        return;
    end;
end;
v13._GetVariationForUser = function(v89, v90, v91) --[[ Line: 373 ]] --[[ Name: _GetVariationForUser ]]
    -- upvalues: l_RunService_0 (copy)
    local v92 = v89:_GetUserExperiment(v91);
    local l_ForceUsers_0 = v92.ForceUsers;
    local l_Variations_0 = v92.Variations;
    local v95 = v92.Layers or NumberRange.new(0, 1);
    if v92.Concluded then
        local l_Conclusion_0 = v92.Conclusion;
        return assert(l_Variations_0[l_Conclusion_0], (("Invalid conclusion variant: %*"):format(l_Conclusion_0))).Data, l_Conclusion_0, false;
    else
        local v97 = l_RunService_0:IsStudio() and v92.ForceInStudio;
        if v97 then
            return assert(l_Variations_0[v97], (("No ForceInStudio variation '%*' on experiment '%*'"):format(v97, v91))).Data, v97, false;
        else
            if l_ForceUsers_0 then
                local v98 = l_ForceUsers_0[v90];
                if v98 then
                    return assert(l_Variations_0[v98], (("No ForceUsers variation '%*' on experiment '%*' for user ID %*"):format(v98, v91, v90))).Data, v98, false;
                end;
            end;
            if v89._Config.UserExperimentResortControl(v92) then
                return l_Variations_0.Control.Data, "Control", false;
            else
                local v99 = Random.new(v90):NextNumber();
                if v99 < v95.Min or v95.Max < v99 then
                    return l_Variations_0.Control.Data, "Control", false;
                else
                    local v100 = Random.new(v90 + v92.NumericID);
                    local v101 = v100:NextNumber();
                    local v102 = 0;
                    local v103 = {};
                    for v104, v105 in l_Variations_0 do
                        table.insert(v103, {
                            VariationName = v104, 
                            Variation = v105
                        });
                    end;
                    local v106 = #v103;
                    for v107 = 1, v106 do
                        local v108 = v100:NextInteger(1, v106);
                        local v109 = v103[v108];
                        local v110 = v103[v107];
                        v103[v107] = v109;
                        v103[v108] = v110;
                    end;
                    for _, v112 in v103 do
                        local l_VariationName_0 = v112.VariationName;
                        local l_Variation_0 = v112.Variation;
                        v102 = v102 + l_Variation_0.Probability;
                        if v101 <= v102 then
                            return l_Variation_0.Data, l_VariationName_0, true;
                        end;
                    end;
                    error((("Probabilities did not add up to 1 for experiment %*, got %*"):format(v91, v102)));
                    return;
                end;
            end;
        end;
    end;
end;
local function _(v115) --[[ Line: 446 ]] --[[ Name: TryGetLocale ]]
    -- upvalues: l_Players_0 (copy)
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v115);
    if not l_l_Players_0_PlayerByUserId_0 then
        return "Unknown";
    else
        return l_l_Players_0_PlayerByUserId_0.LocaleId;
    end;
end;
local v118 = l_TypeGuard_0.Params(l_TypeGuard_0.Number():Integer(), l_TypeGuard_0.String());
v13.GetVariationForUser = function(v119, v120, v121) --[[ Line: 459 ]] --[[ Name: GetVariationForUser ]]
    -- upvalues: v118 (copy), l_Players_0 (copy)
    v118(v120, v121);
    local v122, v123, v124 = v119:_GetVariationForUser(v120, v121);
    task.spawn(function() --[[ Line: 464 ]]
        -- upvalues: v124 (copy), v119 (copy), v120 (copy), v121 (copy), v123 (copy), l_Players_0 (ref)
        if v124 and v119._Config.ShouldRecordUserExperiment(v120, v121, v119:_GetUserExperiment(v121)) then
            v119:AwaitUserPresent(v120);
            local l_v119_0 = v119;
            local v126 = "ExperimentEnrolment";
            local v127 = {
                VariationName = v123, 
                ExperimentID = v121, 
                UserID = v120
            };
            local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v120);
            v127.Locale = not l_l_Players_0_PlayerByUserId_1 and "Unknown" or l_l_Players_0_PlayerByUserId_1.LocaleId;
            l_v119_0:LogEvent(v126, v127);
        end;
    end);
    return v122, v123;
end;
v13._GetVariationForServer = function(v129, v130) --[[ Line: 479 ]] --[[ Name: _GetVariationForServer ]]
    -- upvalues: l_RunService_0 (copy)
    local v131 = v129:_GetServerExperiment(v130);
    local l_Variations_1 = v131.Variations;
    local v133 = v131.Layers or NumberRange.new(0, 1);
    if v131.Concluded then
        local l_Conclusion_1 = v131.Conclusion;
        return assert(l_Variations_1[l_Conclusion_1], (("Invalid conclusion variant: %*"):format(l_Conclusion_1))).Data, l_Conclusion_1, false;
    else
        local v135 = l_RunService_0:IsStudio() and v131.ForceInStudio;
        if v135 then
            return assert(l_Variations_1[v135], (("No ForceInStudio variation '%*' on experiment '%*'"):format(v135, v130))).Data, v135, false;
        elseif v129._Config.ServerExperimentResortControl(v131) then
            return l_Variations_1.Control.Data, "Control", false;
        else
            local l_ServerExperimentSeed_0 = v129._Config.ServerExperimentSeed;
            local v137 = Random.new(l_ServerExperimentSeed_0):NextNumber();
            if v137 < v133.Min or v133.Max < v137 then
                return l_Variations_1.Control.Data, "Control", false;
            else
                local v138 = Random.new(l_ServerExperimentSeed_0 + v131.NumericID);
                local v139 = v138:NextNumber();
                local v140 = 0;
                local v141 = {};
                for v142, v143 in l_Variations_1 do
                    table.insert(v141, {
                        VariationName = v142, 
                        Variation = v143
                    });
                end;
                local v144 = #v141;
                for v145 = 1, v144 do
                    local v146 = v138:NextInteger(1, v144);
                    local v147 = v141[v146];
                    local v148 = v141[v145];
                    v141[v145] = v147;
                    v141[v146] = v148;
                end;
                for _, v150 in v141 do
                    local l_Variation_1 = v150.Variation;
                    v140 = v140 + l_Variation_1.Probability;
                    if v139 <= v140 then
                        return l_Variation_1.Data, v150.VariationName, true;
                    end;
                end;
                error((("Probability of all variations below 1 for experiment %*"):format(v130)));
                return;
            end;
        end;
    end;
end;
local v152 = l_TypeGuard_0.Params(l_TypeGuard_0.String());
v13.GetVariationForServer = function(v153, v154) --[[ Line: 542 ]] --[[ Name: GetVariationForServer ]]
    -- upvalues: v152 (copy)
    v152(v154);
    local v155, v156, v157 = v153:_GetVariationForServer(v154);
    local l__RecordedServerExperiments_0 = v153._RecordedServerExperiments;
    if l__RecordedServerExperiments_0[v154] then
        return v155, v156;
    else
        if v157 and v153._Config.ShouldRecordServerExperiment(v154, v153:_GetServerExperiment(v154)) then
            v153:LogEvent("ServerExperiment", {
                ExperimentID = v154, 
                Variant = v156
            });
        end;
        l__RecordedServerExperiments_0[v154] = true;
        return v155, v156;
    end;
end;
local v159 = l_TypeGuard_0.Params(l_TypeGuard_0.Instance("Player"));
v13.LogPlayerEvent = function(v160, v161, ...) --[[ Line: 566 ]] --[[ Name: LogPlayerEvent ]]
    -- upvalues: v159 (copy)
    v159(v161);
    v160:LogUserEvent(v161.UserId, ...);
end;
v13.LogPlayerEventWithProbability = function(v162, v163, ...) --[[ Line: 571 ]] --[[ Name: LogPlayerEventWithProbability ]]
    -- upvalues: v159 (copy)
    v159(v163);
    v162:LogUserEventWithProbability(v163.UserId, ...);
end;
v13.GetVariationForPlayer = function(v164, v165, ...) --[[ Line: 576 ]] --[[ Name: GetVariationForPlayer ]]
    -- upvalues: v159 (copy)
    v159(v165);
    return v164:GetVariationForUser(v165.UserId, ...);
end;
v13.PlayerJoined = function(v166, v167, ...) --[[ Line: 581 ]] --[[ Name: PlayerJoined ]]
    -- upvalues: v159 (copy)
    v159(v167);
    v166:UserJoined(v167.UserId, ...);
end;
v13.PlayerLeft = function(v168, v169, ...) --[[ Line: 586 ]] --[[ Name: PlayerLeft ]]
    -- upvalues: v159 (copy)
    v159(v169);
    v168:UserLeft(v169.UserId, ...);
end;
v13.Destroy = function(v170) --[[ Line: 592 ]] --[[ Name: Destroy ]]
    if v170._Config.DeferUserEvents then
        for v171, v172 in v170._UserEventLog do
            v170.Events.OnUserEventBatch:Fire(v171, v172);
        end;
    end;
    v170:_SendBatch();
    v170._Cleaner:Clean();
end;
return v13;