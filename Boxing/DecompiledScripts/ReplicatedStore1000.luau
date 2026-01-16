--!native
local _ = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v2 = require(script.Parent.GeneralStore);
local v3 = require(script.Parent.Parent.TableUtil);
local v4 = v3.Map.Map or v3.Map.Map1D;
local v5 = require(script.Parent.Parent.XSignal);
local _ = game:GetService("ReplicatedFirst");
local l__FlatPathDelimiter_0 = v2._FlatPathDelimiter;
local l__BuildFromPath_0 = v2._BuildFromPath;
local l__RemoveNode_0 = v2._RemoveNode;
local v10 = {};
local l_MaxPlayers_0 = l_Players_0.MaxPlayers;
local l__InternalMerge_0 = v2._InternalMerge;
local function v13(v14) --[[ Line: 42 ]] --[[ Name: ConvertIncomingData ]]
    -- upvalues: v13 (copy)
    local v15 = table.clone(v14);
    local v16 = nil;
    for v17, v18 in v14 do
        if type(v18) == "table" then
            v18 = v13(v18);
        end;
        local v19 = tonumber(v17);
        if v19 and v19 ~= v17 then
            v16 = v16 or {};
            table.insert(v16, v17);
            v17 = v19;
        end;
        v15[v17] = v18;
    end;
    if v16 then
        for _, v21 in v16 do
            v15[v21] = nil;
        end;
    end;
    return v15;
end;
local v22 = setmetatable({}, {
    __mode = "k"
});
local function v27(v23) --[[ Line: 73 ]] --[[ Name: ConvertPathToNumeric ]]
    -- upvalues: v22 (copy)
    if v22[v23] then
        return;
    else
        for v24, v25 in v23 do
            local v26 = tonumber(v25);
            v23[v24] = v26 or v25;
            if v26 ~= v25 and v26 then
                warn("Key was converted to number: " .. tostring(v25));
            end;
        end;
        v22[v23] = true;
        return;
    end;
end;
local function v28(v29, v30, v31, v32) --[[ Line: 90 ]] --[[ Name: DeepCopyWithPathExceptions ]]
    -- upvalues: l__FlatPathDelimiter_0 (copy), v28 (copy)
    local v33 = v31[v32];
    if v33 and not v33[v29] then
        return nil;
    else
        local v34 = table.clone(v30);
        local v35 = nil;
        for v36, v37 in v30 do
            local v38 = tostring(v36);
            local v39 = v32 .. v38 .. l__FlatPathDelimiter_0;
            if type(v37) == "table" then
                v37 = v28(v29, v37, v31, v39);
            end;
            if type(v36) == "number" then
                v35 = v35 or {};
                table.insert(v35, v36);
            end;
            v34[v38] = v37;
        end;
        if v35 then
            for _, v41 in v35 do
                v34[v41] = nil;
            end;
        end;
        return v34;
    end;
end;
return table.freeze({
    new = function(v42, v43, v44) --[[ Line: 128 ]] --[[ Name: ReplicatedStore ]]
        -- upvalues: v2 (copy), v5 (copy), v13 (copy), v10 (copy), v27 (copy), v28 (copy), l_Players_0 (copy), l__InternalMerge_0 (copy), l_MaxPlayers_0 (copy), l__BuildFromPath_0 (copy), l__RemoveNode_0 (copy), v4 (copy)
        assert(v42, "No remote event given");
        assert(v43 ~= nil, "Please indicate whether this is running on server or client");
        local v45 = {};
        local v47 = v44 or function(v46) --[[ Line: 138 ]]
            v46();
        end;
        local v48 = v2.new();
        local l_GetSubValueChangedSignal_0 = v48.GetSubValueChangedSignal;
        local l_GetValueChangedSignal_0 = v48.GetValueChangedSignal;
        local l_SetDebugLog_0 = v48.SetDebugLog;
        local l_Destroy_0 = v48.Destroy;
        local l_Await_0 = v48.Await;
        local l_Merge_0 = v48.Merge;
        local l_Get_0 = v48.Get;
        local l__GetPathString_0 = v2._GetPathString;
        local v57 = nil;
        local v58 = nil;
        local v59 = {};
        local v60 = {};
        local v61 = {};
        local v62 = false;
        local v63 = false;
        local v64 = false;
        local v65 = v5.new();
        local v66 = false;
        v45.InitClient = function() --[[ Line: 164 ]] --[[ Name: InitClient ]]
            -- upvalues: v62 (ref), v58 (ref), v42 (copy), v13 (ref), v66 (ref), l_Merge_0 (copy)
            assert(not v62, "Already initialized on client!");
            v58 = v42.OnClientEvent:Connect(function(v67) --[[ Line: 167 ]]
                -- upvalues: v13 (ref), v66 (ref), l_Merge_0 (ref)
                debug.profilebegin("ReplicatedStore.Incoming");
                local l_Data_0 = v67.Data;
                local l_InitialSync_0 = v67.InitialSync;
                l_Data_0 = v13(l_Data_0);
                if not l_InitialSync_0 and not v66 then
                    debug.profileend();
                    return;
                else
                    if l_InitialSync_0 then
                        v66 = true;
                    end;
                    l_Merge_0(l_Data_0);
                    debug.profileend();
                    return;
                end;
            end);
            v42:FireServer();
            v62 = true;
        end;
        v45.Get = function(v70, v71) --[[ Line: 201 ]] --[[ Name: Get ]]
            -- upvalues: v10 (ref), v27 (ref), l_Get_0 (copy)
            v70 = v70 or v10;
            v27(v70);
            return l_Get_0(v70, v71);
        end;
        local function v77(v72, v73) --[[ Line: 208 ]] --[[ Name: _FullSync ]]
            -- upvalues: v28 (ref), v10 (ref), v27 (ref), l_Get_0 (copy), v59 (copy), v42 (copy)
            local l_v28_0 = v28;
            local l_Name_0 = v72.Name;
            local v76 = nil or v10;
            v27(v76);
            l_v28_0 = l_v28_0(l_Name_0, l_Get_0(v76, nil), v59, "");
            if not l_v28_0 then
                return;
            else
                task.wait(0.2);
                v42:FireClient(v72, {
                    InitialSync = v73, 
                    Data = l_v28_0
                });
                v42:SetAttribute("FS" .. tostring(v72.UserId):gsub("%-", ""), true);
                return;
            end;
        end;
        v45.InitServer = function() --[[ Line: 223 ]] --[[ Name: InitServer ]]
            -- upvalues: v62 (ref), v58 (ref), v42 (copy), v77 (copy), v57 (ref), l_Players_0 (ref), v59 (copy)
            assert(not v62, "Already initialized on server!");
            v58 = v42.OnServerEvent:Connect(function(v78) --[[ Line: 227 ]]
                -- upvalues: v77 (ref)
                v77(v78, true);
            end);
            v57 = l_Players_0.PlayerRemoving:Connect(function(v79) --[[ Line: 232 ]]
                -- upvalues: v59 (ref)
                local l_Name_1 = v79.Name;
                local v81 = {};
                for v82, v83 in v59 do
                    if typeof(v83) == "table" then
                        v83[l_Name_1] = nil;
                        if next(v83) == nil then
                            table.insert(v81, v82);
                        end;
                    end;
                end;
                for _, v85 in v81 do
                    v59[v85] = nil;
                end;
            end);
            v62 = true;
        end;
        v45.Destroy = function() --[[ Line: 257 ]] --[[ Name: Destroy ]]
            -- upvalues: v64 (ref), v58 (ref), v57 (ref), l_Destroy_0 (copy)
            v64 = true;
            v58:Disconnect();
            if v57 then
                v57:Disconnect();
            end;
            l_Destroy_0();
        end;
        local function v97() --[[ Line: 267 ]] --[[ Name: _DeferProcess ]]
            -- upvalues: v61 (ref), l__InternalMerge_0 (ref), l_Players_0 (ref), v60 (copy), v28 (ref), v59 (copy), v42 (copy), v65 (copy)
            for v86, v87 in v61 do
                local v88 = {};
                for _, v90 in v87 do
                    l__InternalMerge_0(v88, v90, true);
                end;
                if next(v88) ~= nil then
                    if v86 == "*" then
                        for _, v92 in l_Players_0:GetChildren() do
                            local l_Name_2 = v92.Name;
                            if not v60[l_Name_2] then
                                local v94 = v28(l_Name_2, v88, v59, "");
                                if v94 then
                                    v42:FireClient(v92, {
                                        InitialSync = false, 
                                        Data = v94
                                    });
                                end;
                            end;
                        end;
                    else
                        local l_l_Players_0_FirstChild_0 = l_Players_0:FindFirstChild(v86);
                        if l_l_Players_0_FirstChild_0 and not v60[v86] then
                            local v96 = v28(v86, v88, v59, "");
                            if v96 then
                                v42:FireClient(l_l_Players_0_FirstChild_0, {
                                    InitialSync = false, 
                                    Data = v96
                                });
                            end;
                        end;
                    end;
                end;
            end;
            v61 = {};
            v65:Fire();
        end;
        local function v101(v98, v99) --[[ Line: 321 ]] --[[ Name: _DeferMerge ]]
            -- upvalues: v61 (ref), l_MaxPlayers_0 (ref), v63 (ref), v47 (copy), v64 (ref), v97 (copy)
            local v100 = v61[v98];
            if not v100 then
                v100 = table.create(l_MaxPlayers_0);
                v61[v98] = v100;
            end;
            table.insert(v100, v99);
            if not v63 then
                v63 = true;
                v47(function() --[[ Line: 334 ]]
                    -- upvalues: v64 (ref), v63 (ref), v97 (ref)
                    if v64 then
                        return;
                    else
                        v63 = false;
                        v97();
                        return;
                    end;
                end);
            end;
        end;
        local _ = function(v102, v103) --[[ Line: 345 ]] --[[ Name: _ServerMerge ]]
            -- upvalues: v101 (copy)
            if v103 then
                for _, v105 in v103 do
                    v101(v105.Name, v102);
                end;
                return;
            else
                v101("*", v102);
                return;
            end;
        end;
        v45.Merge = function(v107, v108) --[[ Line: 357 ]] --[[ Name: Merge ]]
            -- upvalues: l_Merge_0 (copy), v43 (copy), v101 (copy)
            l_Merge_0(v107);
            if v43 then
                if v108 then
                    for _, v110 in v108 do
                        v101(v110.Name, v107);
                    end;
                    return;
                else
                    v101("*", v107);
                end;
            end;
        end;
        v45.Set = function(v111, v112, v113) --[[ Line: 368 ]] --[[ Name: Set ]]
            -- upvalues: v10 (ref), v27 (ref), l_Get_0 (copy), l__BuildFromPath_0 (ref), l__RemoveNode_0 (ref), l_Merge_0 (copy), v43 (copy), v101 (copy)
            assert(v111, "No path given!");
            assert(#v111 > 0, "Attempt to set root table (path empty)");
            v111 = v111 or v10;
            v27(v111);
            if type(v112) == "table" then
                local v114 = v111 or v10;
                v27(v114);
                if l_Get_0(v114, nil) then
                    local v115 = l__BuildFromPath_0(v111, l__RemoveNode_0);
                    l_Merge_0(v115);
                    if v43 then
                        if v113 then
                            for _, v117 in v113 do
                                v101(v117.Name, v115);
                            end;
                        else
                            v101("*", v115);
                        end;
                    end;
                end;
            end;
            local v118 = l__BuildFromPath_0(v111, v112 == nil and l__RemoveNode_0 or v112);
            l_Merge_0(v118);
            if v43 then
                if v113 then
                    for _, v120 in v113 do
                        v101(v120.Name, v118);
                    end;
                    return;
                else
                    v101("*", v118);
                end;
            end;
        end;
        v45.GetValueChangedSignal = function(v121) --[[ Line: 384 ]] --[[ Name: GetValueChangedSignal ]]
            -- upvalues: v10 (ref), v27 (ref), l_GetValueChangedSignal_0 (copy)
            v121 = v121 or v10;
            v27(v121);
            return l_GetValueChangedSignal_0(v121);
        end;
        v45.GetSubValueChangedSignal = function(v122) --[[ Line: 391 ]] --[[ Name: GetSubValueChangedSignal ]]
            -- upvalues: v10 (ref), v27 (ref), l_GetSubValueChangedSignal_0 (copy)
            v122 = v122 or v10;
            v27(v122);
            return l_GetSubValueChangedSignal_0(v122);
        end;
        v45.Await = function(v123, v124) --[[ Line: 398 ]] --[[ Name: Await ]]
            -- upvalues: v10 (ref), v27 (ref), l_Await_0 (copy)
            v123 = v123 or v10;
            v27(v123);
            return l_Await_0(v123, v124);
        end;
        v45.SetDebugLog = function(v125) --[[ Line: 405 ]] --[[ Name: SetDebugLog ]]
            -- upvalues: l_SetDebugLog_0 (copy)
            l_SetDebugLog_0(v125);
        end;
        v45.ExclusiveSync = function(v126, v127) --[[ Line: 410 ]] --[[ Name: ExclusiveSync ]]
            -- upvalues: v27 (ref), v59 (copy), l__GetPathString_0 (copy), v4 (ref)
            assert(v126, "No path given");
            v27(v126);
            v59[l__GetPathString_0(v126)] = v127 and v4(v127, function(v128) --[[ Line: 413 ]]
                return true, v128.Name;
            end) or nil;
        end;
        return v45;
    end
});