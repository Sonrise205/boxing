local l__Template_0 = require(script.Parent:WaitForChild("_Template"));
local l_Util_0 = require(script.Parent.Parent:WaitForChild("Util"));
local l_CreateStandardInitial_0 = l_Util_0.CreateStandardInitial;
local l_ExpectType_0 = l_Util_0.ExpectType;
local l_Expect_0 = l_Util_0.Expect;
local v5, v6 = l__Template_0.Create("Thread");
v6._Initial = l_CreateStandardInitial_0("thread");
v6.IsDead = function(v7) --[[ Line: 23 ]] --[[ Name: IsDead ]]
    return v7:HasStatus("dead");
end;
v6.IsSuspended = function(v8) --[[ Line: 28 ]] --[[ Name: IsSuspended ]]
    return v8:HasStatus("suspended");
end;
v6.IsRunning = function(v9) --[[ Line: 33 ]] --[[ Name: IsRunning ]]
    return v9:HasStatus("running");
end;
v6.IsNormal = function(v10) --[[ Line: 38 ]] --[[ Name: IsNormal ]]
    return v10:HasStatus("normal");
end;
v6.HasStatus = function(v11, v12) --[[ Line: 43 ]] --[[ Name: HasStatus ]]
    -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy)
    l_ExpectType_0(v12, l_Expect_0.STRING_OR_FUNCTION, 1);
    return v11:_AddConstraint(true, "HasStatus", function(_, v14, v15) --[[ Line: 46 ]]
        local v16 = coroutine.status(v14);
        if v16 == v15 then
            return true;
        else
            return false, (("Expected thread to have status '%*', got %*"):format(v15, v16));
        end;
    end, v12);
end;
v6.InitialConstraint = v6.HasStatus;
return v5;