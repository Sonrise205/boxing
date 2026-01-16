local v0 = Random.new(tick());
local v13 = {
    GetRandomVector = function(v1, v2, v3) --[[ Line: 7 ]] --[[ Name: GetRandomVector ]]
        -- upvalues: v0 (copy)
        if v3 then
            return (Vector3.new(v0:NextNumber(v1[1], v2[1]), v0:NextNumber(v1[2], v2[2]), v0:NextNumber(v1[3], v2[3])));
        else
            return (Vector3.new(v0:NextInteger(v1[1], v2[1]), v0:NextInteger(v1[2], v2[2]), v0:NextInteger(v1[3], v2[3])));
        end;
    end, 
    GetRandomCFrame = function(v4, v5, v6) --[[ Line: 23 ]] --[[ Name: GetRandomCFrame ]]
        -- upvalues: v0 (copy)
        if v6 then
            return CFrame.new(v0:NextNumber(v4[1], v5[1]), v0:NextNumber(v4[2], v5[2]), v0:NextNumber(v4[3], v5[3]));
        else
            return CFrame.new(v0:NextInteger(v4[1], v5[1]), v0:NextInteger(v4[2], v5[2]), v0:NextInteger(v4[3], v5[3]));
        end;
    end, 
    GetRandomAngles = function(v7, v8, v9) --[[ Line: 39 ]] --[[ Name: GetRandomAngles ]]
        -- upvalues: v0 (copy)
        if v9 then
            return CFrame.Angles(v0:NextNumber(v7[1], v8[1]), v0:NextNumber(v7[2], v8[2]), v0:NextNumber(v7[3], v8[3]));
        else
            return CFrame.Angles(v0:NextInteger(v7[1], v8[1]), v0:NextInteger(v7[2], v8[2]), v0:NextInteger(v7[3], v8[3]));
        end;
    end, 
    GetRandomNumber = function(v10, v11, v12) --[[ Line: 55 ]] --[[ Name: GetRandomNumber ]]
        -- upvalues: v0 (copy)
        if v12 then
            return v0:NextNumber(v10, v11);
        else
            return v0:NextInteger(v10, v11);
        end;
    end
};
v13.GetRandomSign = function() --[[ Line: 63 ]] --[[ Name: GetRandomSign ]]
    -- upvalues: v13 (copy)
    local v14 = v13.GetRandomNumber(-1, 1);
    if v14 == 0 then
        v14 = 1;
    end;
    return v14;
end;
return v13;