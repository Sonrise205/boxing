local v0 = {};
local function _(v1, v2, v3) --[[ Line: 3 ]] --[[ Name: Lerp ]]
    return v1 + (v2 - v1) * v3;
end;
v0.Tween = function(v5, v6, v7, v8) --[[ Line: 7 ]] --[[ Name: Tween ]]
    local v9 = {};
    for v10, v11 in v5.Transparency.Keypoints do
        v9[v10] = v11.Value;
    end;
    if not v7 then
        v7 = 1;
    end;
    task.defer(function() --[[ Line: 18 ]]
        -- upvalues: v6 (copy), v5 (copy), v8 (copy), v9 (copy), v7 (ref)
        for v12 = 1, v6 do
            local v13 = {};
            for v14, v15 in v5.Transparency.Keypoints do
                local v16 = v8 and v8[v14] or 1;
                local v17 = v9[v14];
                local l_v16_0 = v16;
                local l_v7_0 = v7;
                v16 = v17 + (l_v16_0 - v17) * l_v7_0;
                l_v16_0 = v13;
                l_v7_0 = NumberSequenceKeypoint.new;
                local l_Time_0 = v15.Time;
                local v21 = v9[v14];
                local l_v16_1 = v16;
                local v23 = v12 / v6;
                table.insert(l_v16_0, l_v7_0(l_Time_0, v21 + (l_v16_1 - v21) * v23));
            end;
            v5.Transparency = NumberSequence.new(v13);
            if v6 ~= 1 then
                task.wait();
            end;
        end;
    end);
    return v9;
end;
return v0;