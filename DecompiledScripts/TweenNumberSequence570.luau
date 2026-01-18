local function _(v0, v1, v2) --[[ Line: 1 ]]
    return v0 + (v1 - v0) * v2;
end;
return function(v4, v5, v6, v7, v8, v9, v10, v11) --[[ Line: 5 ]]
    assert(v4 and typeof(v4) == "NumberSequence", "Invalid numberSequence");
    assert(v5 and typeof(v5) == "NumberSequence", "Invalid targetSequence");
    assert(v6 and type(v6) == "number" and v6 > 0, "Invalid smoothness");
    assert(v7 and type(v7) == "number" and v7 > 0, "Invalid timeTaken");
    assert(type(v8[v9]) == "userdata", "Invalid objectToUpdate");
    assert(v9 and type(v9) == "string", "Invalid propertyName");
    local l_Keypoints_0 = v4.Keypoints;
    local l_Keypoints_1 = v5.Keypoints;
    local v14 = {};
    local v15 = {};
    local v16 = {};
    for _, v18 in ipairs(l_Keypoints_0) do
        table.insert(v14, v18.Time);
        table.insert(v15, v18.Value);
        table.insert(v16, v18.Envelope);
    end;
    local function v33(v19) --[[ Line: 25 ]] --[[ Name: updateNumberSequence ]]
        -- upvalues: v14 (copy), l_Keypoints_1 (copy), v15 (copy), v16 (copy)
        local v20 = {};
        for v21, v22 in ipairs(v14) do
            local v23 = 1;
            local v24 = math.abs(v22 - l_Keypoints_1[1].Time);
            for v25, v26 in ipairs(l_Keypoints_1) do
                local v27 = math.abs(v22 - v26.Time);
                if v27 < v24 then
                    v24 = v27;
                    v23 = v25;
                end;
            end;
            local l_Value_0 = l_Keypoints_1[v23].Value;
            local l_Envelope_0 = l_Keypoints_1[v23].Envelope;
            local v30 = v15[v21];
            local v31 = v30 + (l_Value_0 - v30) * v19;
            local v32 = v16[v21];
            v30 = v32 + (l_Envelope_0 - v32) * v19;
            table.insert(v20, NumberSequenceKeypoint.new(v22, v31, v30));
        end;
        return NumberSequence.new(v20);
    end;
    for v34 = 0, 1, 1 / (v6 * v7) do
        v8[v9] = v33((game.TweenService:GetValue(v34, v10, v11)));
        task.wait(1 / v6);
    end;
    local v35 = {};
    for _, v37 in ipairs(v14) do
        local v38 = 1;
        local v39 = math.abs(v37 - l_Keypoints_1[1].Time);
        for v40, v41 in ipairs(l_Keypoints_1) do
            local v42 = math.abs(v37 - v41.Time);
            if v42 < v39 then
                v39 = v42;
                v38 = v40;
            end;
        end;
        local l_Value_1 = l_Keypoints_1[v38].Value;
        local _ = l_Keypoints_1[v38].Envelope;
        table.insert(v35, NumberSequenceKeypoint.new(v37, l_Value_1, l_Value_1));
    end;
    v8[v9] = NumberSequence.new(v35);
end;