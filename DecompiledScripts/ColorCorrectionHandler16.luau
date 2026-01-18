local l_TweenService_0 = game:GetService("TweenService");
return {
    Init = function(v1) --[[ Line: 4 ]] --[[ Name: Init ]]
        -- upvalues: l_TweenService_0 (copy)
        local v2 = false;
        local v3 = {
            Brightness = 0, 
            Contrast = 0, 
            Saturation = 0, 
            TintColor = Color3.new(0, 0, 0)
        };
        local v4 = Color3.new(1, 1, 1);
        local function _(v5) --[[ Line: 14 ]] --[[ Name: getTint ]]
            -- upvalues: v4 (ref)
            local l_FirstChild_0 = script["5"].TintColor:FindFirstChild((tostring(v5)));
            if l_FirstChild_0 and l_FirstChild_0:FindFirstChild("Values") and l_FirstChild_0.Values:FindFirstChild("0") then
                v4 = l_FirstChild_0.Values["0"].Value;
            end;
            return v4;
        end;
        local function v11(v8, v9) --[[ Line: 22 ]] --[[ Name: safeValue ]]
            -- upvalues: v3 (copy)
            if v8:FindFirstChild(v9) and v8[v9]:FindFirstChild("Values") and v8[v9].Values:FindFirstChild("0") then
                local l_Value_0 = v8[v9].Values["0"].Value;
                v3[v9] = l_Value_0;
                return l_Value_0;
            elseif v9 == "TintColor" then
                return v3[v9] or Color3.new(0, 0, 0);
            else
                return v3[v9] or 0;
            end;
        end;
        local v12 = {
            {
                0, 
                0, 
                0, 
                0, 
                0
            }, 
            {
                2.65, 
                34, 
                61, 
                159, 
                159
            }, 
            {
                0.3333333333333333, 
                72, 
                98, 
                179, 
                179
            }, 
            {
                0.1, 
                185, 
                185, 
                185, 
                185
            }, 
            {
                0.13333333333333333, 
                193, 
                0, 
                v1.Saturation, 
                193
            }, 
            {
                0.15, 
                202, 
                0, 
                0, 
                202
            }, 
            {
                0.6666666666666666, 
                242, 
                242, 
                242, 
                242
            }, 
            {
                0.03333333333333333, 
                244, 
                0, 
                0, 
                244
            }, 
            {
                0.18333333333333332, 
                255, 
                0, 
                0, 
                255
            }, 
            {
                0.25, 
                270, 
                0, 
                270, 
                270
            }, 
            {
                0.03333333333333333, 
                272, 
                0, 
                272, 
                272
            }, 
            {
                0.18333333333333332, 
                283, 
                0, 
                0, 
                283
            }, 
            {
                0.06666666666666667, 
                287, 
                0, 
                287, 
                287
            }, 
            {
                0.03333333333333333, 
                289, 
                0, 
                289, 
                289
            }, 
            {
                0.18333333333333332, 
                300, 
                0, 
                300, 
                300
            }, 
            {
                1.6166666666666667, 
                401, 
                0, 
                401, 
                401
            }, 
            {
                0.03333333333333333, 
                403, 
                0, 
                403, 
                403
            }, 
            {
                0.18333333333333332, 
                414, 
                0, 
                414, 
                414
            }, 
            {
                0.26666666666666666, 
                430, 
                0, 
                430, 
                430
            }, 
            {
                0.03333333333333333, 
                432, 
                0, 
                432, 
                432
            }, 
            {
                0.18333333333333332, 
                443, 
                0, 
                443, 
                443
            }, 
            {
                0.13333333333333333, 
                451, 
                0, 
                451, 
                451
            }, 
            {
                0.03333333333333333, 
                453, 
                0, 
                453, 
                453
            }, 
            {
                0.18333333333333332, 
                464, 
                0, 
                464, 
                464
            }, 
            {
                2.0166666666666666, 
                589, 
                0, 
                589, 
                589
            }, 
            {
                0.3, 
                609, 
                0, 
                608, 
                609
            }, 
            {
                0.16666666666666666, 
                619, 
                0, 
                619, 
                619
            }, 
            {
                0.7833333333333333, 
                666, 
                0, 
                666, 
                666
            }, 
            {
                0.06666666666666667, 
                670, 
                0, 
                670, 
                "getTint(670)"
            }, 
            {
                0.03333333333333333, 
                678, 
                0, 
                678, 
                678
            }, 
            {
                0.18333333333333332, 
                689, 
                0, 
                689, 
                689
            }, 
            {
                0.31666666666666665, 
                719, 
                0, 
                719, 
                719
            }, 
            {
                0.21666666666666667, 
                729, 
                0, 
                729, 
                729
            }, 
            {
                0.25, 
                738, 
                0, 
                738, 
                738
            }, 
            {
                0.08333333333333333, 
                744, 
                0, 
                744, 
                744
            }, 
            {
                0.2833333333333333, 
                757, 
                0, 
                757, 
                757
            }, 
            {
                0.03333333333333333, 
                759, 
                0, 
                759, 
                759
            }, 
            {
                0.2833333333333333, 
                770, 
                0, 
                770, 
                770
            }, 
            {
                0.06666666666666667, 
                774, 
                0, 
                774, 
                774
            }, 
            {
                0.13333333333333333, 
                782, 
                0, 
                782, 
                782
            }, 
            {
                0.3333333333333333, 
                812, 
                0, 
                812, 
                812
            }, 
            {
                0.13333333333333333, 
                822, 
                0, 
                822, 
                822
            }, 
            {
                0.16666666666666666, 
                831, 
                0, 
                831, 
                831
            }, 
            {
                0.08333333333333333, 
                837, 
                0, 
                837, 
                837
            }, 
            {
                0.23333333333333334, 
                850, 
                0, 
                850, 
                850
            }, 
            {
                0.03333333333333333, 
                852, 
                0, 
                852, 
                852
            }, 
            {
                0.18333333333333332, 
                863, 
                0, 
                863, 
                863
            }, 
            {
                0.06666666666666667, 
                867, 
                0, 
                867, 
                867
            }, 
            {
                0.13333333333333333, 
                875, 
                0, 
                875, 
                875
            }, 
            {
                1.4666666666666666, 
                905, 
                0, 
                905, 
                905
            }
        };
        local v13 = {};
        for v14, v15 in ipairs(v12) do
            local v16, v17, v18, v19, v20 = table.unpack(v15);
            local v21 = {
                Time = v16, 
                Brightness = v11(script["5"].Brightness, (tostring(v17))), 
                Contrast = v11(script["5"].Contrast, (tostring(v18))), 
                Saturation = v11(script["5"].Saturation, (tostring(v19)))
            };
            local v22;
            if v20 == "getTint(670)" then
                local l_FirstChild_1 = script["5"].TintColor:FindFirstChild((tostring(670)));
                if l_FirstChild_1 and l_FirstChild_1:FindFirstChild("Values") and l_FirstChild_1.Values:FindFirstChild("0") then
                    v4 = l_FirstChild_1.Values["0"].Value;
                end;
                v22 = v4;
                v2 = v22;
            end;
            if not v2 then
                v22 = v11(script["5"].TintColor, (tostring(v20)));
            end;
            v2 = false;
            v21.TintColor = v22;
            v13[v14] = v21;
        end;
        local function _() --[[ Line: 104 ]] --[[ Name: playTweensSequentially ]]
            -- upvalues: v13 (copy), l_TweenService_0 (ref), v1 (copy)
            local v24 = 1;
            local v25 = Color3.new(1, 1, 1);
            local function v26() --[[ Line: 108 ]] --[[ Name: tweenNext ]]
                -- upvalues: v24 (ref), v13 (ref), v25 (ref), l_TweenService_0 (ref), v1 (ref), v26 (copy)
                if v24 > #v13 then
                    return;
                else
                    local v27 = v13[v24];
                    local v28 = typeof(v27.TintColor) == "Color3" and v27.TintColor or v25;
                    v25 = v28;
                    local v29 = {
                        Brightness = tonumber(v27.Brightness) or 0, 
                        Contrast = tonumber(v27.Contrast) or 0, 
                        Saturation = tonumber(v27.Saturation) or 0, 
                        TintColor = v28
                    };
                    local v30 = l_TweenService_0:Create(v1, TweenInfo.new(v27.Time, Enum.EasingStyle.Linear, Enum.EasingDirection.In), v29);
                    v24 = v24 + 1;
                    v30.Completed:Connect(v26);
                    v30:Play();
                    return;
                end;
            end;
            v26();
        end;
        local v32 = 1;
        local v33 = Color3.new(1, 1, 1);
        if true then
            local l_v32_0, l_v33_0 = v32, v33;
            local function v36() --[[ Line: 108 ]] --[[ Name: tweenNext ]]
                -- upvalues: l_v32_0 (ref), v13 (copy), l_v33_0 (ref), l_TweenService_0 (ref), v1 (copy), v36 (copy)
                if l_v32_0 > #v13 then
                    return;
                else
                    local v37 = v13[l_v32_0];
                    local v38 = typeof(v37.TintColor) == "Color3" and v37.TintColor or l_v33_0;
                    l_v33_0 = v38;
                    local v39 = {
                        Brightness = tonumber(v37.Brightness) or 0, 
                        Contrast = tonumber(v37.Contrast) or 0, 
                        Saturation = tonumber(v37.Saturation) or 0, 
                        TintColor = v38
                    };
                    local v40 = l_TweenService_0:Create(v1, TweenInfo.new(v37.Time, Enum.EasingStyle.Linear, Enum.EasingDirection.In), v39);
                    l_v32_0 = l_v32_0 + 1;
                    v40.Completed:Connect(v36);
                    v40:Play();
                    return;
                end;
            end;
            v36();
        end;
    end
};