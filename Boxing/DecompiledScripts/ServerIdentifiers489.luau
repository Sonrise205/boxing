local v0 = require(script.Parent.Parent.Constants);
local v1 = require(script.Parent.Parent.Parent.wallyInstanceManager);
local _ = require(script.Parent.Parent.Types);
local v3 = require(script.Parent.Parent.Utilities.Output);
local v4 = {};
local v5 = 0;
local v6 = {};
local v7 = {};
local v8 = nil;
v4.start = function() --[[ Line: 14 ]] --[[ Name: start ]]
    -- upvalues: v1 (copy), v8 (ref), v4 (copy)
    local v9 = v1.get(script.Parent.Parent.Parent, "identifierStorage");
    if v9 then
        v8 = v9;
    else
        v8 = Instance.new("Folder");
        v8.Name = "identifierStorage";
        v1.add(script.Parent.Parent.Parent, v8);
    end;
    v4.ref("NIL_VALUE");
    v4.ref("REQUEST");
end;
v4.ref = function(v10) --[[ Line: 28 ]] --[[ Name: ref ]]
    -- upvalues: v6 (copy), v3 (copy), v5 (ref), v0 (copy), v8 (ref), v7 (copy)
    if v6[v10] ~= nil then
        return v6[v10];
    else
        v3.fatalAssert(v5 <= v0.IDENTIFIER_CAP, (("cannot create any more identifiers - over %* cap."):format(v0.IDENTIFIER_CAP_STRING)));
        local v11 = if v5 <= 255 then string.pack("B", v5) else string.pack("H", v5);
        v5 = v5 + 1;
        v8:SetAttribute(v10, v11);
        v6[v10] = v11;
        v7[v11] = v10;
        return v11;
    end;
end;
v4.deser = function(v12) --[[ Line: 52 ]] --[[ Name: deser ]]
    -- upvalues: v3 (copy), v7 (copy)
    v3.fatalAssert(typeof(v12) == "string", string.format("Deserialize takes string, got %*", (typeof(v12))));
    return v7[v12];
end;
v4.ser = function(v13) --[[ Line: 60 ]] --[[ Name: ser ]]
    -- upvalues: v3 (copy), v6 (copy)
    v3.fatalAssert(typeof(v13) == "string", string.format("Serialize takes string, got %*", (typeof(v13))));
    return v6[v13];
end;
return v4;