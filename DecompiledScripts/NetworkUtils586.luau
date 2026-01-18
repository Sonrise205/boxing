local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Output);
return {
    CreateUUID = function() --[[ Line: 8 ]] --[[ Name: CreateUUID ]]
        -- upvalues: l_HttpService_0 (copy)
        return (string.gsub(l_HttpService_0:GenerateGUID(false), "-", ""));
    end, 
    FromHex = function(v2) --[[ Line: 13 ]] --[[ Name: FromHex ]]
        return (string.gsub(v2, "..", function(v3) --[[ Line: 15 ]]
            return (string.char((tonumber(v3, 16))));
        end));
    end, 
    ToHex = function(v4) --[[ Line: 20 ]] --[[ Name: ToHex ]]
        -- upvalues: v1 (copy)
        v1.fatalAssert(typeof(v4) == "string", (("ToHex takes string, got %*"):format(v4)));
        return (string.gsub(v4, ".", function(v5) --[[ Line: 23 ]]
            return string.format("%02X", string.byte(v5));
        end));
    end, 
    ToReadableHex = function(v6) --[[ Line: 28 ]] --[[ Name: ToReadableHex ]]
        -- upvalues: v1 (copy)
        v1.fatalAssert(typeof(v6) == "string", (("ToReadableHex takes string, got %*"):format(v6)));
        return string.format(string.rep("%02X ", #v6), string.byte(v6, 1, -1));
    end
};