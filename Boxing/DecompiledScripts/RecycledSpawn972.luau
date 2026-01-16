local v0 = nil;
local function v3(v1, ...) --[[ Line: 3 ]] --[[ Name: passer ]]
    -- upvalues: v0 (ref)
    local l_v0_0 = v0;
    v0 = nil;
    v1(...);
    v0 = l_v0_0;
end;
local function v4() --[[ Line: 10 ]] --[[ Name: yielder ]]
    -- upvalues: v3 (copy)
    while true do
        v3(coroutine.yield());
    end;
end;
return function(v5, ...) --[[ Line: 16 ]]
    -- upvalues: v0 (ref), v4 (copy)
    if v0 == nil then
        v0 = coroutine.create(v4);
        task.spawn(v0);
    end;
    task.spawn(v0, v5, ...);
end;