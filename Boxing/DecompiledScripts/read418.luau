--!native
local v0 = require(script.Parent.Parent.namespaces.packetIDs);
local v1 = require(script.Parent.readRefs);
local v2 = v0.ref();
local v3 = nil;
local function v6(v4, ...) --[[ Line: 8 ]] --[[ Name: functionPasser ]]
    -- upvalues: v3 (ref)
    local l_v3_0 = v3;
    v3 = nil;
    v4(...);
    v3 = l_v3_0;
end;
local function v7() --[[ Line: 15 ]] --[[ Name: yielder ]]
    -- upvalues: v6 (copy)
    while true do
        v6(coroutine.yield());
    end;
end;
local function v9(v8, ...) --[[ Line: 21 ]] --[[ Name: runListener ]]
    -- upvalues: v3 (ref), v7 (copy)
    if v3 == nil then
        v3 = coroutine.create(v7);
        coroutine.resume(v3);
    end;
    task.spawn(v3, v8, ...);
end;
return function(v10, v11, v12) --[[ Line: 30 ]]
    -- upvalues: v1 (copy), v2 (copy), v9 (copy)
    local v13 = buffer.len(v10);
    local v14 = 0;
    v1.set(v11);
    while v14 < v13 do
        local v15 = v2[buffer.readu8(v10, v14)];
        v14 = v14 + 1;
        local v16, v17 = v15.reader(v10, v14);
        v14 = v14 + v17;
        for _, v19 in v15.getListeners() do
            v9(v19, v16, v12);
        end;
    end;
end;