local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_TypeGuard_0 = require(l_ReplicatedFirst_0:WaitForChild("TypeGuard"));
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v4 = {};
local v5 = {};
local v6 = {};
local v7 = {};
local v8 = l_TypeGuard_0.Params(l_TypeGuard_0.Number(), l_TypeGuard_0.Function(), l_TypeGuard_0.String():Optional(), l_TypeGuard_0.Boolean():Optional());
v7.RateLimit = function(v9, v10, v11) --[[ Line: 17 ]] --[[ Name: RateLimit ]]
    -- upvalues: v8 (copy), l_HttpService_0 (copy), v4 (copy)
    v8(v9, v10, v11);
    local v12 = v11 or l_HttpService_0:GenerateGUID(false);
    return function(v13, ...) --[[ Line: 22 ]]
        -- upvalues: v4 (ref), v12 (copy), v9 (copy), v10 (copy)
        local l_UserId_0 = v13.UserId;
        local v15 = v4[l_UserId_0];
        if v15[v12] then
            return;
        else
            v15[v12] = true;
            task.delay(v9, function() --[[ Line: 34 ]]
                -- upvalues: v15 (ref), v4 (ref), l_UserId_0 (copy), v12 (ref)
                v15 = v4[l_UserId_0];
                if v15 then
                    v15[v12] = nil;
                end;
            end);
            local v16 = {
                xpcall(v10, debug.traceback, v13, ...)
            };
            if not v16[1] then
                task.spawn(error, v16[2]);
                return;
            else
                table.remove(v16, 1);
                return table.unpack(v16);
            end;
        end;
    end;
end;
local v17 = l_TypeGuard_0.Params(l_TypeGuard_0.Function(), l_TypeGuard_0.String():Optional(), l_TypeGuard_0.Boolean():Optional());
v7.OnlyOne = function(v18, v19, _) --[[ Line: 56 ]] --[[ Name: OnlyOne ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy), v5 (copy)
    v17(v18, v19);
    local v21 = v19 or l_HttpService_0:GenerateGUID(false);
    return function(v22, ...) --[[ Line: 61 ]]
        -- upvalues: v5 (ref), v21 (copy), v18 (copy)
        local v23 = v5[v22.UserId];
        if v23[v21] then
            return;
        else
            v23[v21] = true;
            local v24 = {
                xpcall(v18, debug.traceback, v22, ...)
            };
            v23[v21] = nil;
            if not v24[1] then
                task.spawn(error, v24[2]);
                return;
            else
                table.remove(v24, 1);
                return table.unpack(v24);
            end;
        end;
    end;
end;
local v25 = l_TypeGuard_0.Params(l_TypeGuard_0.Number(), l_TypeGuard_0.Number(), l_TypeGuard_0.Function(), l_TypeGuard_0.String():Optional(), l_TypeGuard_0.Boolean():Optional());
v7.AntiFlood = function(v26, v27, v28, v29) --[[ Line: 87 ]] --[[ Name: AntiFlood ]]
    -- upvalues: v25 (copy), l_HttpService_0 (copy), v6 (copy)
    v25(v26, v27, v28, v29);
    local v30 = v29 or l_HttpService_0:GenerateGUID(false);
    return function(v31, ...) --[[ Line: 92 ]]
        -- upvalues: v6 (ref), v30 (copy), v26 (copy), v27 (copy), v28 (copy)
        debug.profilebegin("AntiFlood");
        local l_UserId_1 = v31.UserId;
        local v33 = v6[l_UserId_1] or {};
        local v34 = v33[v30];
        if v34 and v26 <= v34 then
            return;
        else
            v33[v30] = (v34 or 0) + 1;
            debug.profileend();
            task.delay(v27, function() --[[ Line: 108 ]]
                -- upvalues: v33 (ref), v6 (ref), l_UserId_1 (copy), v34 (ref), v30 (ref)
                v33 = v6[l_UserId_1];
                if v33 then
                    v34 = v33[v30];
                    if v34 then
                        v33[v30] = v34 - 1;
                    end;
                end;
            end);
            local v35 = {
                xpcall(v28, debug.traceback, v31, ...)
            };
            if not v35[1] then
                task.spawn(error, v35[2]);
                return;
            else
                table.remove(v35, 1);
                return table.unpack(v35);
            end;
        end;
    end;
end;
if _VERSION ~= "Lune" then
    l_Players_0.PlayerAdded:Connect(function(v36) --[[ Line: 133 ]]
        -- upvalues: v4 (copy), v5 (copy), v6 (copy)
        local l_UserId_2 = v36.UserId;
        v4[l_UserId_2] = {};
        v5[l_UserId_2] = {};
        v6[l_UserId_2] = {};
    end);
    l_Players_0.PlayerRemoving:Connect(function(v38) --[[ Line: 140 ]]
        -- upvalues: v4 (copy), v5 (copy), v6 (copy)
        local l_UserId_3 = v38.UserId;
        v4[l_UserId_3] = nil;
        v5[l_UserId_3] = nil;
        v6[l_UserId_3] = nil;
    end);
end;
return v7;