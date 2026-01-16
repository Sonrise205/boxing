local v0 = require(script.Parent.Parent.Parent.wallyInstanceManager);
local _ = require(script.Parent.Parent.Types);
local v2 = require(script.Parent.Parent.Utilities.Output);
local v3 = nil;
local v4 = {};
local v5 = {};
local v6 = {};
local v7 = {};
v7.start = function() --[[ Line: 13 ]] --[[ Name: start ]]
    -- upvalues: v3 (ref), v0 (copy), v4 (copy), v5 (copy), v7 (copy)
    v3 = v0.waitForInstance(script.Parent.Parent.Parent, "identifierStorage", 1);
    for v8, v9 in v3:GetAttributes() do
        v4[v8] = v9;
        v5[v9] = v8;
        v7.loadIdentifier(v8, v9);
    end;
    v3.AttributeChanged:Connect(function(v10) --[[ Line: 25 ]]
        -- upvalues: v3 (ref), v4 (ref), v5 (ref), v7 (ref)
        local l_v3_Attribute_0 = v3:GetAttribute(v10);
        if l_v3_Attribute_0 then
            v4[v10] = l_v3_Attribute_0;
            v5[l_v3_Attribute_0] = v10;
            v7.loadIdentifier(v10, l_v3_Attribute_0);
            return;
        else
            local v12 = v4[v10];
            v4[v10] = nil;
            v5[v12] = nil;
            return;
        end;
    end);
    v7.ref("NIL_VALUE", 3, false);
    v7.ref("REQUEST", 3, false);
end;
v7.loadIdentifier = function(v13, v14) --[[ Line: 47 ]] --[[ Name: loadIdentifier ]]
    -- upvalues: v6 (copy)
    if not v6[v13] then
        return;
    else
        local v15 = {};
        for v16, v17 in v6[v13] do
            task.spawn(v17, v14);
            table.insert(v15, v16);
        end;
        for _, v19 in v15 do
            table.remove(v6[v13], v19);
        end;
        return;
    end;
end;
v7.waitForIdentifier = function(v20, v21, v22) --[[ Line: 70 ]] --[[ Name: waitForIdentifier ]]
    -- upvalues: v4 (copy), v6 (copy), v2 (copy)
    v21 = v21 or 1;
    local v23 = v4[v20];
    if v23 then
        return v23;
    else
        if not v6[v20] then
            v6[v20] = {};
        end;
        local v24 = coroutine.running();
        table.insert(v6[v20], v24);
        task.delay(v21, function() --[[ Line: 86 ]]
            -- upvalues: v6 (ref), v20 (copy), v24 (copy), v2 (ref), v22 (copy)
            if table.find(v6[v20], v24) then
                v2.fatal((("reached max wait time for %* %*, broke yield. Did you forget to implement it on the server?"):format(v22 and "bridge" or "identifier", v20)));
            end;
        end);
        return coroutine.yield();
    end;
end;
v7.ref = function(v25, v26, v27) --[[ Line: 98 ]] --[[ Name: ref ]]
    -- upvalues: v2 (copy), v4 (copy), v7 (copy)
    v2.typecheck("string", "ReferenceIdentifier", "identifierName", v25);
    if v26 ~= nil then
        v2.typecheck("number", "ReferenceIdentifier", "maxWaitTime", v26);
    end;
    local v28 = v26 or 1;
    local v29 = v4[v25];
    if v29 then
        return v29;
    else
        return v7.waitForIdentifier(v25, v28, v27);
    end;
end;
v7.deser = function(v30) --[[ Line: 114 ]] --[[ Name: deser ]]
    -- upvalues: v2 (copy), v5 (copy)
    v2.fatalAssert(typeof(v30) == "string", string.format("Deserialize takes string, got %*", (typeof(v30))));
    return v5[v30];
end;
v7.ser = function(v31) --[[ Line: 122 ]] --[[ Name: ser ]]
    -- upvalues: v2 (copy), v4 (copy)
    v2.fatalAssert(typeof(v31) == "string", string.format("Serialize takes string, got %*", (typeof(v31))));
    return v4[v31];
end;
return v7;