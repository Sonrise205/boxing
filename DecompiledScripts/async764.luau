--!native
if not script then
    script = game:GetService("ReplicatedFirst").Async;
end;
local l_TypeGuard_0 = require(script.Parent:WaitForChild("TypeGuard"));
local v1 = {
    DefaultTimeout = 120
};
local v2 = {
    __mode = "vs"
};
local v3 = {
    __mode = "ks"
};
local v4 = {};
setmetatable(v4, v3);
v1._ThreadMetadata = v4;
local function _(v5) --[[ Line: 40 ]] --[[ Name: _AssertGetThreadMetadata ]]
    -- upvalues: v4 (copy)
    local v6 = v4[v5];
    if v6 then
        return v6;
    else
        error("Thread is nil");
        return nil;
    end;
end;
local function v9(v8) --[[ Line: 51 ]]
    task.spawn(error, v8);
end;
local function _(v10, v11) --[[ Line: 55 ]] --[[ Name: _RegisterOnFinish ]]
    -- upvalues: v4 (copy)
    local v12 = v4[v10];
    local l_FinishCallbacks_0 = v12.FinishCallbacks;
    if l_FinishCallbacks_0 then
        table.insert(l_FinishCallbacks_0, v11);
        return;
    else
        v12.FinishCallbacks = {
            v11
        };
        return;
    end;
end;
local function _(v15, v16) --[[ Line: 67 ]] --[[ Name: _IsDescendantOf ]]
    -- upvalues: v4 (copy)
    local l_v15_0 = v15;
    while true do
        if l_v15_0 then
            if l_v15_0 == v16 then
                return true;
            else
                local v18 = v4[l_v15_0];
                if not v18 then
                    return false;
                else
                    l_v15_0 = v18.Parent.Value;
                end;
            end;
        else
            return false;
        end;
    end;
end;
local function v20(v21, v22, v23, v24) --[[ Line: 87 ]] --[[ Name: _Finish ]]
    -- upvalues: v4 (copy), v20 (copy)
    local v25 = v4[v21];
    if not v25 then
        return;
    else
        if v25.Success == nil then
            v25.Success = v23;
            v25.Result = v24;
            if coroutine.status(v21) == "suspended" then
                task.cancel(v21);
            end;
            local l_FinishCallbacks_1 = v25.FinishCallbacks;
            if l_FinishCallbacks_1 then
                for _, v28 in l_FinishCallbacks_1 do
                    task.spawn(v28, v23, v24);
                end;
            end;
        end;
        if v22 then
            local l_Children_0 = v25.Children;
            if l_Children_0 then
                for _, v31 in l_Children_0 do
                    v20(v31, true, v23, v24);
                end;
            end;
        end;
        return;
    end;
end;
local function _(v32, v33) --[[ Line: 123 ]] --[[ Name: _AddChildThread ]]
    -- upvalues: v2 (copy)
    local l_Children_1 = v32.Children;
    if l_Children_1 then
        table.insert(l_Children_1, v33);
        return;
    else
        v32.Children = setmetatable({
            v33
        }, v2);
        return;
    end;
end;
local function v46(v36, v37, ...) --[[ Line: 134 ]] --[[ Name: _CaptureThread ]]
    -- upvalues: v4 (copy), v2 (copy), v20 (copy), v9 (ref)
    local v38 = coroutine.running();
    v4[v38] = {
        Parent = {
            Value = v36
        }
    };
    local v39 = v4[v36];
    if not v39 then
        v39 = {
            Parent = {}
        };
        v4[v36] = v39;
    end;
    local l_v39_0 = v39;
    local l_Children_2 = l_v39_0.Children;
    if l_Children_2 then
        table.insert(l_Children_2, v38);
    else
        l_v39_0.Children = setmetatable({
            v38
        }, v2);
    end;
    l_v39_0 = nil;
    local v42, v43;
    l_Children_2, v42, v43 = xpcall(v37, function(v44) --[[ Line: 159 ]]
        -- upvalues: l_v39_0 (ref)
        l_v39_0 = v44 .. "\n" .. debug.traceback(nil, 2);
    end, ...);
    if l_Children_2 == false then
        v20(v38, true, false, l_v39_0);
        if v9 then
            v9(l_v39_0);
        end;
        return;
    else
        local v45 = type(v42);
        if v45 == "boolean" then
            if v42 then
                v20(v38, false, true, v43);
            else
                v20(v38, true, false, v43);
            end;
            return;
        elseif v45 == "nil" then
            v20(v38, false, true, v43);
            return;
        else
            if v9 then
                v9("Thread did not return a success signifier - must return: (Success: boolean, Result: any?)");
            end;
            v20(v38, true, false, "INVALID_RETURN");
            return;
        end;
    end;
end;
local function _(v47) --[[ Line: 201 ]] --[[ Name: _AssertFinalizeRules ]]
    -- upvalues: v4 (copy)
    local v48 = coroutine.running();
    if v47 == v48 then
        error("Cannot cancel a thread within itself");
    end;
    local v49 = true;
    if v4[v48] ~= nil then
        local l_v47_0 = v47;
        while true do
            if l_v47_0 then
                if l_v47_0 == v48 then
                    v49 = true;
                    break;
                else
                    local v51 = v4[l_v47_0];
                    if not v51 then
                        v49 = false;
                        break;
                    else
                        l_v47_0 = v51.Parent.Value;
                    end;
                end;
            else
                v49 = false;
                break;
            end;
        end;
    end;
    assert(v49, "Cannot cancel an ancestor thread from a descendant thread");
end;
local function v55(v53, v54, ...) --[[ Line: 211 ]] --[[ Name: _InternalDelay ]]
    task.wait(v53);
    v54(...);
end;
local function v57(v56, ...) --[[ Line: 216 ]] --[[ Name: _InternalDefer ]]
    task.defer(task.spawn, coroutine.running());
    coroutine.yield();
    v56(...);
end;
local function v60(v58, v59) --[[ Line: 222 ]] --[[ Name: _InlinedSpawn ]]
    -- upvalues: v46 (copy)
    return task.spawn(v46, coroutine.running(), v58, v59);
end;
local function v73(v61, v62, v63) --[[ Line: 226 ]] --[[ Name: _Timer ]]
    -- upvalues: v46 (copy)
    if v63 then
        v63 = v63 .. "(" .. math.floor(v61 * 100) / 100 .. ")";
    end;
    local v64 = os.clock();
    local v65 = true;
    local function v66() --[[ Line: 234 ]] --[[ Name: StopFunction ]]
        -- upvalues: v65 (ref)
        v65 = false;
    end;
    if v63 then
        local function v68() --[[ Line: 240 ]]
            -- upvalues: v65 (ref), v63 (ref), v62 (copy), v64 (ref), v61 (copy)
            while true do
                if v65 then
                    debug.profilebegin(v63);
                    local v67 = os.clock();
                    if v62(v67 - v64) then
                        debug.profileend();
                        return;
                    else
                        debug.profileend();
                        task.wait(v61);
                        v64 = v67;
                    end;
                else
                    return;
                end;
            end;
        end;
        local _ = task.spawn(v46, coroutine.running(), v68, nil);
    else
        local function v71() --[[ Line: 256 ]]
            -- upvalues: v65 (ref), v62 (copy), v64 (ref), v61 (copy)
            while true do
                if v65 then
                    local v70 = os.clock();
                    if v62(v70 - v64) then
                        return;
                    else
                        task.wait(v61);
                        v64 = v70;
                    end;
                else
                    return;
                end;
            end;
        end;
        local _ = task.spawn(v46, coroutine.running(), v71, nil);
    end;
    return v66;
end;
local function v89(v74, v75) --[[ Line: 273 ]] --[[ Name: _Await ]]
    -- upvalues: v4 (copy)
    v75 = v75 or 120;
    local v76 = v4[v74];
    local v77;
    if v76 then
        v77 = v76;
    else
        error("Thread is nil");
        v77 = nil;
    end;
    v76 = v77.Success;
    if v76 ~= nil then
        return v76, v77.Result;
    else
        local v78 = coroutine.running();
        local v79 = nil;
        local v80 = nil;
        local v81 = false;
        local v82 = false;
        local v83 = false;
        local function v86(v84, v85) --[[ Line: 295 ]]
            -- upvalues: v80 (ref), v79 (ref), v81 (ref), v83 (ref), v78 (copy)
            v80 = v84;
            v79 = v85;
            if not v81 or v83 then
                return;
            else
                task.spawn(v78);
                return;
            end;
        end;
        local v87 = v4[v74];
        local l_FinishCallbacks_2 = v87.FinishCallbacks;
        if l_FinishCallbacks_2 then
            table.insert(l_FinishCallbacks_2, v86);
        else
            v87.FinishCallbacks = {
                v86
            };
        end;
        if v80 ~= nil then
            return v80, v79;
        else
            if v75 ~= 1e999 then
                task.delay(v75, function() --[[ Line: 311 ]]
                    -- upvalues: v82 (ref), v83 (ref), v80 (ref), v79 (ref), v78 (copy)
                    if v82 then
                        return;
                    else
                        v83 = true;
                        v80 = false;
                        v79 = "TIMEOUT";
                        task.spawn(v78);
                        return;
                    end;
                end);
            end;
            v81 = true;
            coroutine.yield();
            v82 = true;
            return v80, v79;
        end;
    end;
end;
local function v90(v91, v92) --[[ Line: 331 ]] --[[ Name: _GetDescendants ]]
    -- upvalues: v4 (copy), v90 (copy)
    table.insert(v92, v91);
    local v93 = v4[v91];
    if v93 then
        local l_Children_3 = v93.Children;
        if l_Children_3 then
            for _, v96 in l_Children_3 do
                v90(v96, v92);
            end;
        end;
    end;
    return v92;
end;
local v97 = l_TypeGuard_0.Params(l_TypeGuard_0.Function());
v1.Spawn = function(v98, ...) --[[ Line: 354 ]] --[[ Name: Spawn ]]
    -- upvalues: v97 (copy), v46 (copy)
    v97(v98);
    return task.spawn(v46, coroutine.running(), v98, ...);
end;
local v99 = l_TypeGuard_0.Params(l_TypeGuard_0.Function(), l_TypeGuard_0.Number());
v1.SpawnTimed = function(v100, v101, ...) --[[ Line: 363 ]] --[[ Name: SpawnTimed ]]
    -- upvalues: v99 (copy), v46 (copy), v20 (copy)
    v101 = v101 or 120;
    v99(v100, v101);
    local v102 = task.spawn(v46, coroutine.running(), v100, ...);
    task.delay(v101, v20, v102, true, false, "TIMEOUT");
    return v102;
end;
local v103 = l_TypeGuard_0.Params(l_TypeGuard_0.Number():Optional(), l_TypeGuard_0.Function());
v1.Delay = function(v104, v105, ...) --[[ Line: 375 ]] --[[ Name: Delay ]]
    -- upvalues: v103 (copy), v46 (copy), v55 (copy)
    v103(v104, v105);
    return task.spawn(v46, coroutine.running(), v55, v104, v105, ...);
end;
local v106 = l_TypeGuard_0.Params(l_TypeGuard_0.Function());
v1.Defer = function(v107, ...) --[[ Line: 383 ]] --[[ Name: Defer ]]
    -- upvalues: v106 (copy), v46 (copy), v57 (copy)
    v106(v107);
    return task.spawn(v46, coroutine.running(), v57, v107, ...);
end;
local v108 = l_TypeGuard_0.Params(l_TypeGuard_0.Thread());
v1.Cancel = function(v109, v110) --[[ Line: 391 ]] --[[ Name: Cancel ]]
    -- upvalues: v108 (copy), v4 (copy), v20 (copy)
    v108(v109);
    local v111 = coroutine.running();
    if v109 == v111 then
        error("Cannot cancel a thread within itself");
    end;
    local v112 = true;
    if v4[v111] ~= nil then
        local l_v109_0 = v109;
        while true do
            if l_v109_0 then
                if l_v109_0 == v111 then
                    v112 = true;
                    break;
                else
                    local v114 = v4[l_v109_0];
                    if not v114 then
                        v112 = false;
                        break;
                    else
                        l_v109_0 = v114.Parent.Value;
                    end;
                end;
            else
                v112 = false;
                break;
            end;
        end;
    end;
    assert(v112, "Cannot cancel an ancestor thread from a descendant thread");
    if not v4[v109] then
        error("Thread is nil");
    end;
    v20(v109, true, false, v110);
end;
v1.CancelRoot = function(v115, v116) --[[ Line: 400 ]] --[[ Name: CancelRoot ]]
    -- upvalues: v108 (copy), v4 (copy), v20 (copy)
    v108(v115);
    local v117 = coroutine.running();
    if v115 == v117 then
        error("Cannot cancel a thread within itself");
    end;
    local v118 = true;
    if v4[v117] ~= nil then
        local l_v115_0 = v115;
        while true do
            if l_v115_0 then
                if l_v115_0 == v117 then
                    v118 = true;
                    break;
                else
                    local v120 = v4[l_v115_0];
                    if not v120 then
                        v118 = false;
                        break;
                    else
                        l_v115_0 = v120.Parent.Value;
                    end;
                end;
            else
                v118 = false;
                break;
            end;
        end;
    end;
    assert(v118, "Cannot cancel an ancestor thread from a descendant thread");
    if not v4[v115] then
        error("Thread is nil");
    end;
    v20(v115, false, false, v116);
end;
local v121 = l_TypeGuard_0.Params(l_TypeGuard_0.Thread());
v1.Resolve = function(v122, v123) --[[ Line: 410 ]] --[[ Name: Resolve ]]
    -- upvalues: v121 (copy), v4 (copy), v20 (copy)
    v121(v122);
    local v124 = coroutine.running();
    if v122 == v124 then
        error("Cannot cancel a thread within itself");
    end;
    local v125 = true;
    if v4[v124] ~= nil then
        local l_v122_0 = v122;
        while true do
            if l_v122_0 then
                if l_v122_0 == v124 then
                    v125 = true;
                    break;
                else
                    local v127 = v4[l_v122_0];
                    if not v127 then
                        v125 = false;
                        break;
                    else
                        l_v122_0 = v127.Parent.Value;
                    end;
                end;
            else
                v125 = false;
                break;
            end;
        end;
    end;
    assert(v125, "Cannot cancel an ancestor thread from a descendant thread");
    if not v4[v122] then
        error("Thread is nil");
    end;
    v20(v122, true, true, v123);
end;
v1.ResolveRoot = function(v128, v129) --[[ Line: 419 ]] --[[ Name: ResolveRoot ]]
    -- upvalues: v121 (copy), v4 (copy), v20 (copy)
    v121(v128);
    local v130 = coroutine.running();
    if v128 == v130 then
        error("Cannot cancel a thread within itself");
    end;
    local v131 = true;
    if v4[v130] ~= nil then
        local l_v128_0 = v128;
        while true do
            if l_v128_0 then
                if l_v128_0 == v130 then
                    v131 = true;
                    break;
                else
                    local v133 = v4[l_v128_0];
                    if not v133 then
                        v131 = false;
                        break;
                    else
                        l_v128_0 = v133.Parent.Value;
                    end;
                end;
            else
                v131 = false;
                break;
            end;
        end;
    end;
    assert(v131, "Cannot cancel an ancestor thread from a descendant thread");
    if not v4[v128] then
        error("Thread is nil");
    end;
    v20(v128, false, true, v129);
end;
local v134 = l_TypeGuard_0.Params(l_TypeGuard_0.Function());
v1.OnFinish = function(v135) --[[ Line: 429 ]] --[[ Name: OnFinish ]]
    -- upvalues: v134 (copy), v4 (copy)
    v134(v135);
    local v136 = coroutine.running();
    if not v4[v136] then
        error("Thread is nil");
    end;
    local v137 = v4[v136];
    local l_FinishCallbacks_3 = v137.FinishCallbacks;
    if l_FinishCallbacks_3 then
        table.insert(l_FinishCallbacks_3, v135);
        return;
    else
        v137.FinishCallbacks = {
            v135
        };
        return;
    end;
end;
local v139 = l_TypeGuard_0.Params(l_TypeGuard_0.Thread());
v1.Results = function(v140) --[[ Line: 440 ]] --[[ Name: Results ]]
    -- upvalues: v139 (copy), v4 (copy)
    v139(v140);
    local v141 = v4[v140];
    local v142;
    if v141 then
        v142 = v141;
    else
        error("Thread is nil");
        v142 = nil;
    end;
    return v142.Success, v142.Result;
end;
local v143 = l_TypeGuard_0.Params(l_TypeGuard_0.Thread(), l_TypeGuard_0.Number():Optional());
v1.Await = function(v144, v145) --[[ Line: 450 ]] --[[ Name: Await ]]
    -- upvalues: v143 (copy), v89 (copy)
    v143(v144, v145);
    local v146, v147 = v89(v144, v145);
    return v146, v147;
end;
local v148 = l_TypeGuard_0.Params(l_TypeGuard_0.Thread());
v1.GetDescendants = function(v149) --[[ Line: 459 ]] --[[ Name: GetDescendants ]]
    -- upvalues: v4 (copy), v148 (copy), v90 (copy)
    if not v4[v149] then
        error("Thread is nil");
    end;
    v148(v149);
    local v150 = {};
    table.insert(v150, v149);
    local v151 = v4[v149];
    if v151 then
        local l_Children_4 = v151.Children;
        if l_Children_4 then
            for _, v154 in l_Children_4 do
                v90(v154, v150);
            end;
        end;
    end;
    return v150;
end;
local v155 = l_TypeGuard_0.Params(l_TypeGuard_0.Array(l_TypeGuard_0.Thread()):MinLength(1), l_TypeGuard_0.Number():Optional());
v1.AwaitAll = function(v156, v157) --[[ Line: 468 ]] --[[ Name: AwaitAll ]]
    -- upvalues: v155 (copy), v4 (copy), v89 (copy), v46 (copy)
    v155(v156, v157);
    local v158 = #v156;
    local v159 = coroutine.running();
    local v160 = table.create(v158);
    local v161 = 0;
    local v162 = false;
    for v163, v164 in v156 do
        if not v4[v164] then
            error("Thread is nil");
        end;
        local function v167() --[[ Line: 480 ]]
            -- upvalues: v89 (ref), v164 (copy), v157 (copy), v160 (copy), v163 (copy), v161 (ref), v158 (copy), v162 (ref), v159 (copy)
            local v165, v166 = v89(v164, v157);
            v160[v163] = {
                v165, 
                v166
            };
            v161 = v161 + 1;
            if v161 == v158 and v162 then
                task.spawn(v159);
            end;
        end;
        local _ = task.spawn(v46, coroutine.running(), v167, nil);
    end;
    if v161 < v158 then
        v162 = true;
        coroutine.yield();
    end;
    return v160;
end;
local v169 = l_TypeGuard_0.Params(l_TypeGuard_0.Array(l_TypeGuard_0.Thread()):MinLength(1), l_TypeGuard_0.Number():Optional());
v1.AwaitFirst = function(v170, v171) --[[ Line: 502 ]] --[[ Name: AwaitFirst ]]
    -- upvalues: v169 (copy), v4 (copy), v89 (copy), v46 (copy)
    v169(v170, v171);
    local v172 = false;
    local v173 = coroutine.running();
    local v174 = nil;
    local v175 = nil;
    for _, v177 in v170 do
        if not v4[v177] then
            error("Thread is nil");
        end;
        local function v180() --[[ Line: 513 ]]
            -- upvalues: v174 (ref), v89 (ref), v177 (copy), v171 (copy), v175 (ref), v172 (ref), v173 (copy)
            if v174 == nil then
                local v178, v179 = v89(v177, v171);
                if v174 ~= nil then
                    return;
                else
                    v174 = v178;
                    v175 = v179;
                    if v172 then
                        task.spawn(v173);
                    end;
                end;
            end;
        end;
        local _ = task.spawn(v46, coroutine.running(), v180, nil);
    end;
    if v174 == nil then
        v172 = true;
        coroutine.yield();
    end;
    return v174, v175;
end;
local v182 = l_TypeGuard_0.Params(l_TypeGuard_0.Number(), l_TypeGuard_0.Function(), l_TypeGuard_0.String():Optional());
v1.Timer = function(v183, v184, v185) --[[ Line: 542 ]] --[[ Name: Timer ]]
    -- upvalues: v182 (copy), v73 (copy)
    v182(v183, v184, v185);
    return (v73(v183, v184, v185));
end;
local v186 = l_TypeGuard_0.Params(l_TypeGuard_0.Number(), l_TypeGuard_0.Function(), l_TypeGuard_0.String():Optional(), l_TypeGuard_0.Boolean():Optional());
v1.TimerAsync = function(v187, v188, v189, v190) --[[ Line: 551 ]] --[[ Name: TimerAsync ]]
    -- upvalues: v186 (copy), v60 (copy), v73 (copy)
    v186(v187, v188, v189, v190);
    local v191 = false;
    local function v192() --[[ Line: 556 ]] --[[ Name: StopFunction ]]
        -- upvalues: v191 (ref)
        v191 = true;
    end;
    local v193 = v190 and v60 or task.spawn;
    v73(v187, function(v194) --[[ Line: 562 ]]
        -- upvalues: v191 (ref), v193 (copy), v188 (copy)
        if v191 then
            return true;
        else
            v193(v188, v194);
            return;
        end;
    end, v189);
    return v192;
end;
local v195 = l_TypeGuard_0.Params(l_TypeGuard_0.Thread():Optional());
v1.Parent = function(v196) --[[ Line: 576 ]] --[[ Name: Parent ]]
    -- upvalues: v195 (copy), v4 (copy)
    v195(v196);
    local v197 = v4[v196 or coroutine.running()];
    local v198;
    if v197 then
        v198 = v197;
    else
        error("Thread is nil");
        v198 = nil;
    end;
    return v198.Parent.Value;
end;
local v199 = l_TypeGuard_0.Params(l_TypeGuard_0.Thread():Optional());
v1.GetMetadata = function(v200) --[[ Line: 584 ]] --[[ Name: GetMetadata ]]
    -- upvalues: v199 (copy), v4 (copy)
    v199(v200);
    local v201 = v4[v200 or coroutine.running()];
    if v201 then
        return v201;
    else
        error("Thread is nil");
        return nil;
    end;
end;
v1.DeferWait = function() --[[ Line: 592 ]] --[[ Name: DeferWait ]]
    task.defer(task.spawn, coroutine.running());
    coroutine.yield();
end;
v1.Count = function() --[[ Line: 599 ]] --[[ Name: Count ]]
    -- upvalues: v4 (copy)
    local v202 = 0;
    for _ in v4 do
        v202 = v202 + 1;
    end;
    return v202;
end;
local v204 = l_TypeGuard_0.Params(l_TypeGuard_0.Function():Optional());
v1.SetErrorReporter = function(v205) --[[ Line: 614 ]] --[[ Name: SetErrorReporter ]]
    -- upvalues: v204 (copy), v9 (ref)
    v204(v205);
    v9 = v205;
end;
return v1;