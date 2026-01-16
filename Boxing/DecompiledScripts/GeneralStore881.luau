--!native
if not script then
    script = game:GetService("ReplicatedFirst").Vapor.GeneralStore;
end;
local v0 = require(script.Parent.Parent.XSignal);
local v1 = {
    REMOVE_NODE = true
};
local v2 = {};
local function v3(v4, v5, v6) --[[ Line: 44 ]] --[[ Name: PathTraverse ]]
    -- upvalues: v3 (copy)
    for v7, v8 in v4 do
        local v9 = v5 .. tostring(v7) .. "^";
        if type(v8) == "table" then
            v3(v8, v9, v6);
        end;
        v6(v9, v8, v7, v5);
    end;
end;
local function v14(v10) --[[ Line: 56 ]] --[[ Name: GetPathString ]]
    local v11 = "";
    for _, v13 in v10 do
        v11 = v11 .. tostring(v13) .. "^";
    end;
    return v11;
end;
local function v15(v16, v17) --[[ Line: 64 ]] --[[ Name: InternalMerge ]]
    -- upvalues: v1 (copy), v15 (copy)
    for v18, v19 in v17 do
        if v19 == v1 then
            v16[v18] = v1;
        elseif type(v19) == "table" then
            local v20 = v16[v18];
            if v20 == v1 then
                v20 = table.clone(v1);
                v16[v18] = v20;
            elseif v20 == nil then
                v20 = {};
                v16[v18] = v20;
            end;
            v15(v20, v19);
        else
            v16[v18] = v19;
        end;
    end;
end;
local function v29(v21, v22) --[[ Line: 90 ]] --[[ Name: BuildFromPath ]]
    assert(v21, "[GeneralStore] No path given!");
    assert(v22 ~= nil, "[GeneralStore] No value given!");
    local v23 = #v21;
    assert(v23 > 0, "[GeneralStore] No items in path (no ascendants derivable)");
    local v24 = {};
    local l_v24_0 = v24;
    for v26 = 1, v23 - 1 do
        local v27 = v21[v26];
        local v28 = {};
        l_v24_0[v27] = v28;
        l_v24_0 = v28;
    end;
    l_v24_0[v21[v23]] = v22;
    return v24;
end;
return table.freeze({
    _FlatPathDelimiter = "^", 
    _BuildFromPath = v29, 
    _GetPathString = v14, 
    _InternalMerge = v15, 
    _PathTraverse = v3, 
    _RemoveNode = v1, 
    new = function(v30, v31) --[[ Line: 113 ]] --[[ Name: Store ]]
        -- upvalues: v2 (copy), v3 (copy), v29 (copy), v1 (copy), v0 (copy)
        local v32 = {};
        local v33 = {};
        local v34 = {};
        local v35 = false;
        local v36 = false;
        local v37 = false;
        local v38 = {};
        v32.Destroy = function() --[[ Line: 125 ]] --[[ Name: Destroy ]]
            -- upvalues: v36 (ref), v38 (copy)
            v36 = true;
            for _, v40 in v38 do
                v40:Fire(nil);
                v40:Destroy();
            end;
            table.clear(v38);
        end;
        local function v54(v41, v42, v43, v44, v45) --[[ Line: 140 ]] --[[ Name: _DeferEventFlat ]]
            -- upvalues: v38 (copy), v33 (ref), v35 (ref), v30 (copy), v36 (ref)
            if not v38[v41] then
                return;
            else
                local l_v33_0 = v33;
                l_v33_0[v41] = {
                    v42, 
                    v43, 
                    v44, 
                    v45
                };
                if not v35 then
                    v35 = true;
                    v30(function() --[[ Line: 151 ]]
                        -- upvalues: v36 (ref), v33 (ref), v35 (ref), l_v33_0 (copy), v38 (ref)
                        if v36 then
                            return;
                        else
                            v33 = {};
                            v35 = false;
                            for v47, v48 in l_v33_0 do
                                local v49 = v38[v47];
                                if v49 then
                                    local v50 = v48[1];
                                    local v51 = v48[2];
                                    v49:Fire(v50, v51, v50 == v51);
                                end;
                                local v52 = v48[4];
                                if v52 then
                                    local v53 = v38[v52 .. "\255"];
                                    if v53 then
                                        v53:Fire(v48[3], v48[1], v48[2]);
                                    end;
                                end;
                            end;
                            return;
                        end;
                    end);
                end;
                return;
            end;
        end;
        local function v62(v55, v56, v57, v58, v59) --[[ Line: 179 ]] --[[ Name: _PathWasChanged ]]
            -- upvalues: v30 (copy), v54 (copy), v38 (copy), v37 (ref)
            if v30 then
                v54(v55, v56, v57, v58, v59);
            else
                local v60 = v38[v55];
                if v60 then
                    v60:Fire(v56, v57, v56 == v57);
                end;
                if v59 then
                    local v61 = v38[v59 .. "\255"];
                    if v61 then
                        v61:Fire(v58, v56, v57);
                    end;
                end;
            end;
            if v37 then
                v55 = v55 == "" and "ROOT" or v55;
                if v57 ~= nil and v56 ~= nil then
                    if v57 == v56 then
                        print(("[GeneralStore] Up-propagate %s"):format(v55));
                        return;
                    else
                        print(("[GeneralStore] Change %s (%s -> %s)"):format(v55, tostring(v57), (tostring(v56))));
                        return;
                    end;
                elseif v57 == nil and v56 ~= nil then
                    print(("[GeneralStore] Create %s = %s"):format(v55, (tostring(v56))));
                    return;
                elseif v57 ~= nil and v56 == nil then
                    print(("[GeneralStore] Destroy %s"):format(v55, (tostring(v56))));
                end;
            end;
        end;
        v32.Get = function(v63, v64) --[[ Line: 218 ]] --[[ Name: Get ]]
            -- upvalues: v2 (ref), v34 (copy)
            v63 = v63 or v2;
            local l_v34_0 = v34;
            for _, v67 in v63 do
                l_v34_0 = l_v34_0[v67];
                if l_v34_0 == nil then
                    return v64;
                end;
            end;
            return l_v34_0;
        end;
        local function v68(v69, v70, v71) --[[ Line: 232 ]] --[[ Name: _Merge ]]
            -- upvalues: v3 (ref), v62 (copy), v68 (copy), v30 (copy), v54 (copy), v38 (copy), v37 (ref)
            local v72 = next(v71);
            local v73 = false;
            local v74 = nil;
            if v72 then
                v74 = typeof(v72);
            end;
            for v75, v76 in v70 do
                if typeof(v75) == "Instance" then
                    warn(("[GeneralStore] Invalid key type: cannot use Instance \226\128\156%s\226\128\157 as a key"):format(v75:GetFullName()), 2);
                end;
                local v77 = v69 .. tostring(v75) .. "^";
                local v78 = v71[v75];
                local v79 = typeof(v75);
                local v80 = typeof(v78);
                if not v74 then
                    v74 = v79;
                end;
                if v79 ~= v74 then
                    error((("[GeneralStore] Attempted to insert using mixed keys! (%*: %* + %*)"):format(v77, v74, v79)));
                end;
                if v76 ~= v78 then
                    local v81 = type(v76) == "table";
                    if v81 and v76.REMOVE_NODE then
                        if v78 ~= nil then
                            local v82 = next(v76, (next(v76))) == nil;
                            local v83 = false;
                            v73 = true;
                            if v80 == "table" then
                                v71[v75] = nil;
                                v3(v78, v77, function(v84, v85, v86, v87) --[[ Line: 285 ]]
                                    -- upvalues: v62 (ref)
                                    v62(v84, nil, v85, v86, v87);
                                end);
                                v62(v77, nil, v78, v75, v69);
                                if not v82 then
                                    v78 = nil;
                                    v83 = true;
                                else
                                    continue;
                                end;
                            end;
                            if not v83 then
                                v71[v75] = nil;
                                v62(v77, nil, v78, v75, v69);
                                v78 = nil;
                                if v82 then
                                    continue;
                                end;
                            end;
                        else
                            continue;
                        end;
                    end;
                    if v81 then
                        if v76.REMOVE_NODE then
                            v76.REMOVE_NODE = nil;
                        end;
                        local v88 = v78 == nil;
                        if v88 then
                            v73 = true;
                            v78 = {};
                            v71[v75] = v78;
                        end;
                        local v89 = v68(v77, v76, v78);
                        v73 = v73 or v89;
                        if v88 then
                            local l_v77_0 = v77;
                            local l_v78_0 = v78;
                            if v30 then
                                v54(l_v77_0, l_v78_0, nil, v75, v69);
                            else
                                local v92 = v38[l_v77_0];
                                if v92 then
                                    v92:Fire(l_v78_0, nil, l_v78_0 == nil);
                                end;
                                if v69 then
                                    local v93 = v38[v69 .. "\255"];
                                    if v93 then
                                        v93:Fire(v75, l_v78_0, nil);
                                    end;
                                end;
                            end;
                            if v37 then
                                l_v77_0 = l_v77_0 == "" and "ROOT" or l_v77_0;
                                if l_v78_0 ~= nil then
                                    print(("[GeneralStore] Create %s = %s"):format(l_v77_0, (tostring(l_v78_0))));
                                end;
                            end;
                        elseif v73 then
                            v62(v77, v78, v78, v75, v69);
                        end;
                    else
                        if v80 == "table" then
                            v3(v78, v77, function(v94, v95, v96, v97) --[[ Line: 338 ]]
                                -- upvalues: v62 (ref)
                                v62(v94, nil, v95, v96, v97);
                            end);
                        end;
                        v71[v75] = v76;
                        v62(v77, v76, v78, v75, v69);
                        v73 = true;
                    end;
                end;
            end;
            return v73;
        end;
        v32.Merge = function(v98) --[[ Line: 354 ]] --[[ Name: Merge ]]
            -- upvalues: v68 (copy), v34 (copy), v62 (copy)
            assert(type(v98) == "table", "[GeneralStore] Cannot merge an atom into the store!");
            v68("", v98, v34);
            v62("", v34, v34, nil, nil);
        end;
        v32.Set = function(v99, v100) --[[ Line: 362 ]] --[[ Name: Set ]]
            -- upvalues: v2 (ref), v34 (copy), v29 (ref), v1 (ref), v68 (copy), v62 (copy)
            local v101 = false;
            assert(v99, "[GeneralStore] No path given!");
            assert(#v99 > 0, "[GeneralStore] Attempt to set root table (path empty)");
            if type(v100) == "table" then
                local v102 = v99 or v2;
                local l_v34_1 = v34;
                local v104;
                for _, v106 in v102 do
                    l_v34_1 = l_v34_1[v106];
                    if l_v34_1 == nil then
                        v104 = nil;
                        v101 = true;
                    end;
                    if v101 then
                        break;
                    end;
                end;
                if not v101 then
                    v104 = l_v34_1;
                end;
                v101 = false;
                if v104 then
                    v104 = v29(v99, v1);
                    assert(type(v104) == "table", "[GeneralStore] Cannot merge an atom into the store!");
                    v68("", v104, v34);
                    v62("", v34, v34, nil, nil);
                end;
            end;
            local v107 = v29(v99, v100 == nil and v1 or v100);
            assert(type(v107) == "table", "[GeneralStore] Cannot merge an atom into the store!");
            v68("", v107, v34);
            v62("", v34, v34, nil, nil);
        end;
        v32.SetMerge = function(v108, v109) --[[ Line: 377 ]] --[[ Name: SetMerge ]]
            -- upvalues: v29 (ref), v1 (ref), v68 (copy), v34 (copy), v62 (copy)
            assert(v108, "[GeneralStore] No path given!");
            assert(#v108 > 0, "[GeneralStore] Attempt to set root table (path empty)");
            local v110 = v29(v108, v109 == nil and v1 or v109);
            assert(type(v110) == "table", "[GeneralStore] Cannot merge an atom into the store!");
            v68("", v110, v34);
            v62("", v34, v34, nil, nil);
        end;
        v32.Clear = function() --[[ Line: 385 ]] --[[ Name: Clear ]]
            -- upvalues: v2 (ref), v34 (copy), v1 (ref), v68 (copy), v62 (copy)
            local v111 = false;
            local v112 = {} or v2;
            local l_v34_2 = v34;
            local v114;
            for _, v116 in v112 do
                l_v34_2 = l_v34_2[v116];
                if l_v34_2 == nil then
                    v114 = nil;
                    v111 = true;
                end;
                if v111 then
                    break;
                end;
            end;
            if not v111 then
                v114 = l_v34_2;
            end;
            v111 = false;
            for v117 in assert(v114) do
                local v118 = {
                    [v117] = v1
                };
                assert(type(v118) == "table", "[GeneralStore] Cannot merge an atom into the store!");
                v68("", v118, v34);
                v62("", v34, v34, nil, nil);
            end;
        end;
        local _ = {
            __index = function(_, _) --[[ Line: 393 ]] --[[ Name: __index ]]
                error("Signal was cleaned and locked as all connections were disconnected", 2);
            end
        };
        local _ = function(v122, _) --[[ Line: 399 ]] --[[ Name: _GetValueChangedSignalFlat ]]
            -- upvalues: v38 (copy), v0 (ref)
            assert(v122, "[GeneralStore] AwaitingPath not given!");
            assert(type(v122) == "string", "[GeneralStore] AwaitingPath not a string!");
            local v124 = v38[v122];
            if v124 then
                return v124;
            else
                local v125 = v0.new();
                v38[v122] = v125;
                return v125;
            end;
        end;
        v32.GetValueChangedSignal = function(v127) --[[ Line: 445 ]] --[[ Name: GetValueChangedSignal ]]
            -- upvalues: v38 (copy), v0 (ref)
            local v128 = "";
            for _, v130 in v127 do
                v128 = v128 .. tostring(v130) .. "^";
            end;
            local l_v128_0 = v128;
            assert(l_v128_0, "[GeneralStore] AwaitingPath not given!");
            assert(type(l_v128_0) == "string", "[GeneralStore] AwaitingPath not a string!");
            v128 = v38[l_v128_0];
            if v128 then
                return v128;
            else
                local v132 = v0.new();
                v38[l_v128_0] = v132;
                return v132;
            end;
        end;
        v32.GetSubValueChangedSignal = function(v133) --[[ Line: 451 ]] --[[ Name: GetSubValueChangedSignal ]]
            -- upvalues: v38 (copy), v0 (ref)
            local v134 = "";
            for _, v136 in v133 do
                v134 = v134 .. tostring(v136) .. "^";
            end;
            local v137 = v134 .. "\255";
            assert(v137, "[GeneralStore] AwaitingPath not given!");
            assert(type(v137) == "string", "[GeneralStore] AwaitingPath not a string!");
            local v138 = v38[v137];
            if v138 then
                return v138;
            else
                local v139 = v0.new();
                v38[v137] = v139;
                return v139;
            end;
        end;
        v32.Await = function(v140, v141) --[[ Line: 457 ]] --[[ Name: Await ]]
            -- upvalues: v2 (ref), v34 (copy), v38 (copy), v0 (ref)
            local v142 = false;
            local v143 = v141 or 240;
            local v144 = v140 or v2;
            local l_v34_3 = v34;
            local v146;
            for _, v148 in v144 do
                l_v34_3 = l_v34_3[v148];
                if l_v34_3 == nil then
                    v146 = nil;
                    v142 = true;
                end;
                if v142 then
                    break;
                end;
            end;
            if not v142 then
                v146 = l_v34_3;
            end;
            v142 = false;
            if v146 ~= nil then
                return v146;
            else
                v144 = debug.traceback();
                local v149 = v140 or v2;
                local v150 = "";
                for _, v152 in v149 do
                    v150 = v150 .. tostring(v152) .. "^";
                end;
                l_v34_3 = v150;
                assert(l_v34_3, "[GeneralStore] AwaitingPath not given!");
                assert(type(l_v34_3) == "string", "[GeneralStore] AwaitingPath not a string!");
                v150 = v38[l_v34_3];
                if v150 then
                    v149 = v150;
                else
                    local v153 = v0.new();
                    v38[l_v34_3] = v153;
                    v149 = v153;
                end;
                v150 = task.delay(5, function() --[[ Line: 472 ]]
                    -- upvalues: l_v34_3 (copy), v144 (copy)
                    warn(("[GeneralStore] Potentially infinite wait on '%s'.\n%s"):format(l_v34_3, v144));
                end);
                local v154 = v149:Wait(v143);
                task.cancel(v150);
                if v154 == nil then
                    error(("[GeneralStore] Store timeout reached! Path: %s (%ds)"):format(l_v34_3, v143));
                end;
                return v154;
            end;
        end;
        v32.SetDebugLog = function(v155) --[[ Line: 489 ]] --[[ Name: SetDebugLog ]]
            -- upvalues: v37 (ref)
            v37 = v155;
        end;
        if v31 then
            assert(type(v31) == "table", "[GeneralStore] Cannot merge an atom into the store!");
            v68("", v31, v34);
            v62("", v34, v34, nil, nil);
        end;
        return v32;
    end
});