if not script then
    script = game:GetService("ReplicatedFirst").Rosyn;
end;
local l_TableUtil_0 = require(script.Parent:WaitForChild("TableUtil"));
local v1 = l_TableUtil_0.Map.Lockdown or l_TableUtil_0.Map.MutableLockdown1D;
local l_new_0 = require(script.Parent:WaitForChild("XSignal")).new;
local l_Async_0 = require(script.Parent:WaitForChild("Async"));
local l_GetMetadata_0 = l_Async_0.GetMetadata;
local l_OnFinish_0 = l_Async_0.OnFinish;
local v6 = l_Async_0.Results or l_Async_0.GetMetadata;
local l_Cancel_0 = l_Async_0.Cancel;
local l_Await_0 = l_Async_0.Await;
local l_Spawn_0 = l_Async_0.Spawn;
local l_TypeGuard_0 = require(script.Parent:WaitForChild("TypeGuard"));
local v11 = l_TypeGuard_0.Object({
    DistributeLoadSeconds = l_TypeGuard_0.Number():Optional(), 
    InitialTimeoutWarn = l_TypeGuard_0.Number():Optional(), 
    InitialTimeout = l_TypeGuard_0.Number():Optional(), 
    WrapDestroy = l_TypeGuard_0.Boolean():Optional(), 
    WrapInitial = l_TypeGuard_0.Boolean():Optional()
}):Strict();
local v12 = l_TypeGuard_0.Object({
    ValidateStructure = l_TypeGuard_0.Function():Optional(), 
    Options = v11:Optional(), 
    Type = l_TypeGuard_0.String():Optional(), 
    Name = l_TypeGuard_0.String():Optional(), 
    Initial = l_TypeGuard_0.Function():Optional(), 
    Destroy = l_TypeGuard_0.Function():Optional(), 
    new = l_TypeGuard_0.Function()
}):CheckMetatable(l_TypeGuard_0.Nil()):Cached();
local v13 = {
    InitialTimeoutWarn = 15, 
    InitialTimeout = 120, 
    WrapDestroy = true, 
    WrapInitial = true
};
local v14 = {};
local v15 = {};
local v16 = {};
local v17 = {};
local v18 = {};
local v19 = l_new_0();
local v20 = {};
local v21 = {};
local v22 = false;
local v23 = false;
local v24 = false;
local l_Setup_0 = script:WaitForChild("Setup");
local v26 = Random.new();
local v27 = {
    ComponentClassInitializationFailed = v19, 
    Setup = {
        Descendants = require(l_Setup_0:WaitForChild("Descendants")), 
        Children = require(l_Setup_0:WaitForChild("Children")), 
        Tags = require(l_Setup_0:WaitForChild("Tags"))
    }, 
    _ComponentClassToComponents = v14, 
    _ComponentClassToInstances = v15, 
    _ComponentsToInitialThread = v16, 
    _InstanceToComponents = v17, 
    _ComponentClassRemovingEvents = v20, 
    _ComponentClassAddedEvents = v21
};
local function _(v28, v29) --[[ Line: 127 ]] --[[ Name: _GetOption ]]
    -- upvalues: v13 (copy)
    local l_Options_0 = v28.Options;
    if l_Options_0 then
        local v31 = l_Options_0[v29];
        if v31 then
            return v31;
        end;
    end;
    return v13[v29];
end;
local function v34(v33) --[[ Line: 142 ]] --[[ Name: _GetComponentClassName ]]
    return v33.Type or v33.Name or tostring(v33);
end;
local function _(v35, v36) --[[ Line: 146 ]] --[[ Name: _GetComponent ]]
    -- upvalues: v17 (copy)
    local v37 = v17[v35];
    return v37 and v37[v36] or nil;
end;
local v39 = l_TypeGuard_0.Params(l_TypeGuard_0.Instance(), v12);
v27.GetComponent = function(v40, v41) --[[ Line: 153 ]] --[[ Name: GetComponent ]]
    -- upvalues: v39 (copy), v17 (copy)
    v39(v40, v41);
    local v42 = v17[v40];
    return v42 and v42[v41] or nil;
end;
local function _(v43) --[[ Line: 158 ]] --[[ Name: _GetAddedSignal ]]
    -- upvalues: v21 (copy), l_new_0 (copy)
    local v44 = v21[v43];
    if v44 then
        return v44;
    else
        v44 = l_new_0();
        v21[v43] = v44;
        return v44;
    end;
end;
local v46 = l_TypeGuard_0.Params(v12);
v27.GetAddedSignal = function(v47) --[[ Line: 172 ]] --[[ Name: GetAddedSignal ]]
    -- upvalues: v46 (copy), v21 (copy), l_new_0 (copy)
    v46(v47);
    local v48 = v21[v47];
    if v48 then
        return v48;
    else
        v48 = l_new_0();
        v21[v47] = v48;
        return v48;
    end;
end;
local function _(v49) --[[ Line: 177 ]] --[[ Name: _GetRemovingSignal ]]
    -- upvalues: v20 (copy), l_new_0 (copy)
    local v50 = v20[v49];
    if v50 then
        return v50;
    else
        v50 = l_new_0();
        v20[v49] = v50;
        return v50;
    end;
end;
local v52 = l_TypeGuard_0.Params(v12);
v27.GetRemovingSignal = function(v53) --[[ Line: 191 ]] --[[ Name: GetRemovingSignal ]]
    -- upvalues: v52 (copy), v20 (copy), l_new_0 (copy)
    v52(v53);
    local v54 = v20[v53];
    if v54 then
        return v54;
    else
        v54 = l_new_0();
        v20[v53] = v54;
        return v54;
    end;
end;
local function v58(v55, v56, v57) --[[ Line: 196 ]] --[[ Name: _InitialWarning ]]
    warn((("Component '%*' on '%*' is taking a long time to initialize (%*s)"):format(v56, v55:GetFullName(), v57)));
end;
local v59 = l_TypeGuard_0.Params(l_TypeGuard_0.Instance(), v12);
_AddComponent = function(v60, v61) --[[ Line: 202 ]] --[[ Name: _AddComponent ]]
    -- upvalues: v59 (copy), v17 (copy), v22 (ref), v15 (copy), v14 (copy), v13 (copy), v58 (copy), v24 (ref), l_Spawn_0 (copy), l_OnFinish_0 (copy), v19 (copy), v26 (copy), v16 (copy), v6 (copy), l_Cancel_0 (copy), v21 (copy), l_new_0 (copy)
    v59(v60, v61);
    local v62 = v61.Type or v61.Name or tostring(v61);
    local v63 = v17[v60];
    if v63 and v63[v61] or nil then
        error((("Component %* already present on %*"):format(v62, (v60:GetFullName()))));
    end;
    v63 = v61.ValidateStructure;
    if v63 then
        v63(v60);
    end;
    if v22 then
        debug.profilebegin(v62 .. ".new()");
    end;
    local v64 = nil;
    task.spawn(function() --[[ Line: 222 ]]
        -- upvalues: v64 (ref), v61 (copy), v60 (copy)
        v64 = v61.new(v60);
    end);
    if v22 then
        debug.profileend();
    end;
    if not v64 then
        error((("Component constructor %* yielded or threw an error on %*"):format(v62, (v60:GetFullName()))));
    end;
    local v65 = v17[v60];
    if v65 then
        v65[v61] = v64;
    else
        v17[v60] = {
            [v61] = v64
        };
    end;
    local v66 = v15[v61];
    if v66 then
        v66[v60] = true;
    else
        v15[v61] = {
            [v60] = true
        };
    end;
    local v67 = v14[v61];
    if v67 then
        v67[v64] = true;
    else
        v14[v61] = {
            [v64] = true
        };
    end;
    local l_Initial_0 = v64.Initial;
    if l_Initial_0 then
        local l_Options_1 = v61.Options;
        local v70 = l_Options_1 and l_Options_1.InitialTimeoutWarn or v13.InitialTimeoutWarn;
        local l_Options_2 = v61.Options;
        l_Options_1 = l_Options_2 and l_Options_2.InitialTimeout or v13.InitialTimeout;
        l_Options_2 = task.delay(v70, v58, v60, v62, v70);
        if v24 then
            debug.profilebegin(v62 .. ":Initial()");
        end;
        local l_l_Options_1_0 = l_Options_1 --[[ copy: 11 -> 14 ]];
        local v77 = l_Spawn_0(function() --[[ Line: 274 ]]
            -- upvalues: l_OnFinish_0 (ref), l_Options_2 (copy), v19 (ref), v62 (copy), v60 (copy), l_l_Options_1_0 (copy), v61 (copy), v13 (ref), v26 (ref), l_Initial_0 (copy), v64 (ref)
            l_OnFinish_0(function(v73, v74) --[[ Line: 275 ]]
                -- upvalues: l_Options_2 (ref), v19 (ref), v62 (ref), v60 (ref), l_l_Options_1_0 (ref)
                task.cancel(l_Options_2);
                if v73 then
                    return;
                else
                    v19:Fire(v62, v60, v74, "");
                    if v74 == "TIMEOUT" then
                        task.spawn(error, (("Component %* failed to initialize on %* within %* seconds"):format(v62, v60:GetFullName(), l_l_Options_1_0)));
                        return;
                    else
                        task.spawn(error, (("Component %* failed to initialize on %*"):format(v62, (v60:GetFullName()))));
                        return;
                    end;
                end;
            end);
            local l_Options_3 = v61.Options;
            local v76 = l_Options_3 and l_Options_3.DistributeLoadSeconds or v13.DistributeLoadSeconds;
            if v76 then
                task.wait(v26:NextNumber(0, v76));
            end;
            l_Initial_0(v64);
        end);
        if v24 then
            debug.profileend();
        end;
        v16[v64] = v77;
        task.delay(l_Options_1, function() --[[ Line: 308 ]]
            -- upvalues: v6 (ref), v77 (copy), l_Cancel_0 (ref)
            if not v6(v77) then
                l_Cancel_0(v77, "TIMEOUT");
            end;
        end);
    end;
    local v78 = v21[v61];
    local v79;
    if v78 then
        v79 = v78;
    else
        v78 = l_new_0();
        v21[v61] = v78;
        v79 = v78;
    end;
    v79:Fire(v60);
end;
local v80 = l_TypeGuard_0.Params(l_TypeGuard_0.Instance(), v12);
_RemoveComponent = function(v81, v82) --[[ Line: 323 ]] --[[ Name: _RemoveComponent ]]
    -- upvalues: v80 (copy), v17 (copy), v20 (copy), l_new_0 (copy), v15 (copy), v14 (copy), v16 (copy), l_Await_0 (copy), v23 (ref), l_Cancel_0 (copy)
    v80(v81, v82);
    local v83 = v82.Type or v82.Name or tostring(v82);
    local v84 = v17[v81];
    local v85 = v84 and v84[v82] or nil;
    if not v85 then
        error((("Component %* not present on %*"):format(v83, (v81:GetFullName()))));
    end;
    local v86 = v20[v82];
    if v86 then
        v84 = v86;
    else
        v86 = l_new_0();
        v20[v82] = v86;
        v84 = v86;
    end;
    v84:Fire(v81);
    v86 = v17[v81];
    v86[v82] = nil;
    if next(v86) == nil then
        v17[v81] = nil;
    end;
    v15[v82][v81] = nil;
    v14[v82][v85] = nil;
    local v87 = v16[v85];
    if v87 then
        l_Await_0(v87);
        if v23 then
            debug.profilebegin(v83 .. ":Destroy()");
        end;
        v16[v85] = nil;
        local l_Destroy_0 = v85.Destroy;
        if l_Destroy_0 and coroutine.status(task.spawn(l_Destroy_0, v85)) ~= "dead" then
            error((("Component destructor %* yielded or threw an error on %*"):format(v83, (v81:GetFullName()))));
        end;
        l_Cancel_0(v87, "ROSYN_DESTROY");
        if v23 then
            debug.profileend();
        end;
    end;
end;
local v89 = l_TypeGuard_0.Params(l_TypeGuard_0.Object({
    DistributeOverSeconds = l_TypeGuard_0.Number():Optional(), 
    Components = l_TypeGuard_0.Function(), 
    Filter = l_TypeGuard_0.Function():Optional()
}));
v27.Register = function(v90) --[[ Line: 389 ]] --[[ Name: Register ]]
    -- upvalues: v89 (copy), v17 (copy), v13 (copy), v1 (copy), v18 (copy)
    v89(v90);
    local l_Filter_0 = v90.Filter;
    local function v102(v92, v93) --[[ Line: 394 ]] --[[ Name: HandleCreation ]]
        -- upvalues: l_Filter_0 (copy), v17 (ref), v13 (ref), v1 (ref), v18 (ref)
        if l_Filter_0 and not l_Filter_0(v92, v93) then
            return;
        else
            local v94 = v17[v92];
            if v94 and v94[v93] or nil then
                return;
            else
                local l_Destroy_1 = v93.Destroy;
                if not l_Destroy_1 then
                    v94 = v93.Type or v93.Name or tostring(v93);
                    warn((("Component %* has no destructor on %*"):format(v94, (v92:GetFullName()))));
                end;
                local l_Options_4 = v93.Options;
                if (l_Options_4 and l_Options_4.WrapDestroy or v13.WrapDestroy) and not v93._DESTROY_WRAPPED then
                    v93.Destroy = function(v97) --[[ Line: 415 ]]
                        -- upvalues: l_Destroy_1 (copy), v1 (ref)
                        l_Destroy_1(v97);
                        v1(v97);
                    end;
                    v93._DESTROY_WRAPPED = true;
                end;
                local l_Options_5 = v93.Options;
                if (l_Options_5 and l_Options_5.WrapInitial or v13.WrapInitial) and not v18[v93] then
                    l_Options_5 = v93.Type or v93.Name or tostring(v93);
                    local l_Initial_1 = v93.Initial;
                    local v100 = l_Options_5 .. ":Initial()";
                    v93.Initial = function(v101) --[[ Line: 431 ]]
                        -- upvalues: v100 (copy), l_Initial_1 (copy)
                        debug.setmemorycategory(v100);
                        l_Initial_1(v101);
                        debug.resetmemorycategory();
                    end;
                    v18[v93] = true;
                end;
                _AddComponent(v92, v93);
                return;
            end;
        end;
    end;
    local function v106(v103, v104) --[[ Line: 443 ]] --[[ Name: HandleDestruction ]]
        -- upvalues: v17 (ref)
        local v105 = v17[v103];
        if not (v105 and v105[v104] or nil) then
            return;
        else
            _RemoveComponent(v103, v104);
            return;
        end;
    end;
    v90.Components(v102, v106);
end;
local function _(v107, v108) --[[ Line: 456 ]] --[[ Name: _ExpectComponent ]]
    -- upvalues: v17 (copy)
    local v109 = v17[v107];
    local v110 = v109 and v109[v108] or nil;
    if v110 == nil then
        error((("Expected component '%*' to exist on Instance '%*'"):format(v108.Type or v108.Name or tostring(v108), (v107:GetFullName()))));
    end;
    return v110;
end;
local v112 = l_TypeGuard_0.Params(l_TypeGuard_0.Instance(), v12);
v27.ExpectComponent = function(v113, v114) --[[ Line: 468 ]] --[[ Name: ExpectComponent ]]
    -- upvalues: v112 (copy), v17 (copy)
    v112(v113, v114);
    local v115 = v17[v113];
    local v116 = v115 and v115[v114] or nil;
    if v116 == nil then
        error((("Expected component '%*' to exist on Instance '%*'"):format(v114.Type or v114.Name or tostring(v114), (v113:GetFullName()))));
    end;
    return v116;
end;
local v117 = l_TypeGuard_0.Params(l_TypeGuard_0.Instance(), v12);
v27.ExpectComponentInit = function(v118, v119) --[[ Line: 475 ]] --[[ Name: ExpectComponentInit ]]
    -- upvalues: v117 (copy), v17 (copy), l_GetMetadata_0 (copy), v16 (copy)
    v117(v118, v119);
    local v120 = v17[v118];
    local v121 = v120 and v120[v119] or nil;
    if v121 == nil then
        error((("Expected component '%*' to exist on Instance '%*'"):format(v119.Type or v119.Name or tostring(v119), (v118:GetFullName()))));
    end;
    local l_v121_0 = v121;
    v121 = l_GetMetadata_0(v16[l_v121_0]);
    if v121 == nil or v121.Success == nil then
        error((("Expected component '%*' to be initialized on Instance '%*'"):format(v119.Type or v119.Name or tostring(v119), (v118:GetFullName()))));
    end;
    return l_v121_0;
end;
local v123 = l_TypeGuard_0.Params(l_TypeGuard_0.Instance(), v12, l_TypeGuard_0.Number():Optional());
v27.AwaitComponentInit = function(v124, v125, v126) --[[ Line: 490 ]] --[[ Name: AwaitComponentInit ]]
    -- upvalues: v123 (copy), v13 (copy), v17 (copy), v16 (copy), l_GetMetadata_0 (copy), l_Await_0 (copy), l_new_0 (copy), v21 (copy)
    v123(v124, v125, v126);
    local l_v126_0 = v126;
    if not l_v126_0 then
        local l_Options_6 = v125.Options;
        l_v126_0 = l_Options_6 and l_Options_6.InitialTimeout or v13.InitialTimeout;
    end;
    local v129 = v125.Type or v125.Name or tostring(v125);
    local function v138(v130) --[[ Line: 496 ]] --[[ Name: AwaitComponentInitial ]]
        -- upvalues: l_v126_0 (copy), v124 (copy), v125 (copy), v17 (ref), v16 (ref), l_GetMetadata_0 (ref), l_Await_0 (ref), v129 (copy)
        local v131 = l_v126_0 - v130;
        local l_v124_0 = v124;
        local l_v125_0 = v125;
        local v134 = v17[l_v124_0];
        l_v124_0 = v16[v134 and v134[l_v125_0] or nil];
        l_v125_0 = l_GetMetadata_0(l_v124_0);
        l_Await_0(l_v124_0, (math.max(0, v131)));
        v134 = v124;
        local l_v125_1 = v125;
        local v136 = v17[v134];
        local v137 = v136 and v136[l_v125_1] or nil;
        if not v137 then
            error((("Component '%*' was removed while initializing"):format(v129)));
        end;
        if l_v125_0.Result == "TIMEOUT" then
            error((("Component '%*' timed out while initializing"):format(v129)));
        end;
        l_v125_1 = l_v125_0.Success;
        if l_v125_1 == nil then
            error((("Component '%*' wait call timed out (%*s)"):format(v129, v131)));
        end;
        if not l_v125_1 then
            error((("Component '%*' threw an error while initializing"):format(v129)));
        end;
        return v137;
    end;
    local v139 = v17[v124];
    if v139 and v139[v125] or nil then
        return (v138(0));
    else
        local v140 = l_new_0();
        local v141 = v21[v125];
        if v141 then
            v139 = v141;
        else
            v141 = l_new_0();
            v21[v125] = v141;
            v139 = v141;
        end;
        v141 = nil;
        v141 = v139:Connect(function(v142) --[[ Line: 545 ]]
            -- upvalues: v124 (copy), v141 (ref), v140 (copy)
            if v142 == v124 then
                v141:Disconnect();
                v140:Fire(true);
            end;
        end);
        local v143 = os.clock();
        if not v140:Wait(v126) then
            error((("A component type '%*' was not added to Instance '%*' on time (%*s)"):format(v129, v124:GetFullName(), l_v126_0)));
        end;
        return (v138(os.clock() - v143));
    end;
end;
local v144 = l_TypeGuard_0.Params(l_TypeGuard_0.Instance(), v12);
v27.GetComponentFromDescendant = function(v145, v146) --[[ Line: 565 ]] --[[ Name: GetComponentFromDescendant ]]
    -- upvalues: v144 (copy), v17 (copy)
    v144(v145, v146);
    while true do
        if v145 then
            local v147 = v17[v145];
            local v148 = v147 and v147[v146] or nil;
            if v148 then
                return v148;
            else
                v145 = v145.Parent;
            end;
        else
            return nil;
        end;
    end;
end;
local v149 = table.freeze({});
local v150 = l_TypeGuard_0.Params(v12);
v27.GetInstancesOfClass = function(v151) --[[ Line: 585 ]] --[[ Name: GetInstancesOfClass ]]
    -- upvalues: v150 (copy), v15 (copy), v149 (copy)
    v150(v151);
    return v15[v151] or v149;
end;
local v152 = l_TypeGuard_0.Params(v12);
v27.GetComponentsOfClass = function(v153) --[[ Line: 592 ]] --[[ Name: GetComponentsOfClass ]]
    -- upvalues: v152 (copy), v14 (copy), v149 (copy)
    v152(v153);
    return v14[v153] or v149;
end;
local v154 = l_TypeGuard_0.Params(l_TypeGuard_0.Instance());
v27.GetComponentsFromInstance = function(v155) --[[ Line: 599 ]] --[[ Name: GetComponentsFromInstance ]]
    -- upvalues: v154 (copy), v17 (copy), v149 (copy)
    v154(v155);
    return v17[v155] or v149;
end;
v27.SetInitialTagsEnabled = function(v156) --[[ Line: 605 ]] --[[ Name: SetInitialTagsEnabled ]]
    -- upvalues: v24 (ref)
    v24 = v156;
end;
v27.SetConstructorTagsEnabled = function(v157) --[[ Line: 610 ]] --[[ Name: SetConstructorTagsEnabled ]]
    -- upvalues: v22 (ref)
    v22 = v157;
end;
v27.SetDestructorTagsEnabled = function(v158) --[[ Line: 615 ]] --[[ Name: SetDestructorTagsEnabled ]]
    -- upvalues: v23 (ref)
    v23 = v158;
end;
v27.GetComponentClassName = v34;
return v27;