--!native
local _ = require(script.Parent.Parent.Types);
local function _(v1, v2, v3) --[[ Line: 9 ]] --[[ Name: Lerp ]]
    if typeof(v1) == "Color3" then
        return (v1:Lerp(v2, v3));
    else
        return v1 + (v2 - v1) * v3;
    end;
end;
local function v18(v5, v6) --[[ Line: 18 ]] --[[ Name: GetPairOnSequence ]]
    local v7 = #v5;
    if v7 == 1 then
        return v5[1].Value;
    else
        v6 = math.clamp(v6, 0, 1);
        if v7 == 2 then
            local l_Value_0 = v5[1].Value;
            local l_Value_1 = v5[2].Value;
            local l_v6_0 = v6;
            if typeof(l_Value_0) == "Color3" then
                return (l_Value_0:Lerp(l_Value_1, l_v6_0));
            else
                return l_Value_0 + (l_Value_1 - l_Value_0) * l_v6_0;
            end;
        else
            for v11, v12 in v5 do
                if v12.Time >= v6 then
                    local v13 = v5[v11 - 1] or v5[1];
                    local l_Time_0 = v13.Time;
                    local l_Value_2 = v13.Value;
                    local l_Value_3 = v12.Value;
                    local v17 = (v6 - l_Time_0) / (v12.Time - l_Time_0);
                    if typeof(l_Value_2) == "Color3" then
                        return (l_Value_2:Lerp(l_Value_3, v17));
                    else
                        return l_Value_2 + (l_Value_3 - l_Value_2) * v17;
                    end;
                end;
            end;
            error("Unreachable");
            return;
        end;
    end;
end;
return function(v19) --[[ Line: 44 ]] --[[ Name: CreateSequence ]]
    -- upvalues: v18 (copy)
    local v20 = nil;
    local v21 = typeof(v19);
    if v21 == "ColorSequence" or v21 == "NumberSequence" then
        v20 = {};
        for v22, v23 in v19.Keypoints do
            v20[v22] = {
                Time = v23.Time, 
                Value = v23.Value
            };
        end;
    else
        v20 = v19;
    end;
    return function(v24) --[[ Line: 63 ]]
        -- upvalues: v18 (ref), v20 (ref)
        return v18(v20, v24.Completion);
    end;
end;