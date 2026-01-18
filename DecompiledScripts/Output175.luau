local l_RunService_0 = game:GetService("RunService");
local v3 = {
    silent = function(v1) --[[ Line: 10 ]] --[[ Name: silent ]]
        -- upvalues: l_RunService_0 (copy)
        if l_RunService_0:IsStudio() then
            print((("[BridgeNet2] %*"):format(v1)));
        end;
    end, 
    log = function(v2) --[[ Line: 16 ]] --[[ Name: log ]]
        print((("[BridgeNet2] %*"):format(v2)));
    end
};
v3.logAssert = function(v4, v5) --[[ Line: 20 ]] --[[ Name: logAssert ]]
    -- upvalues: v3 (copy)
    if not v4 then
        v3.log(v5);
    end;
end;
v3.warn = function(v6) --[[ Line: 26 ]] --[[ Name: warn ]]
    warn((("[BridgeNet2] %*"):format(v6)));
end;
v3.warnAssert = function(v7, v8) --[[ Line: 30 ]] --[[ Name: warnAssert ]]
    -- upvalues: v3 (copy)
    if not v7 then
        v3.warn(v8);
    end;
end;
v3.typecheck = function(v9, v10, v11, v12) --[[ Line: 43 ]] --[[ Name: typecheck ]]
    local v13 = typeof(v12);
    if v13 ~= v9 then
        error(("[BridgeNet2] %* parameter %* takes %*, got %*"):format(v10, v11, v9, v13), 0);
    end;
end;
v3.fatal = function(v14) --[[ Line: 51 ]] --[[ Name: fatal ]]
    error(("[BridgeNet2] %*"):format(v14), 0);
end;
v3.fatalAssert = function(v15, v16) --[[ Line: 55 ]] --[[ Name: fatalAssert ]]
    if not v15 then
        error(("[BridgeNet2] %*"):format(v16), 0);
    end;
end;
return v3;