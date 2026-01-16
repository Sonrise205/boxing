local l_TweenService_0 = game:GetService("TweenService");
return function(v1, v2, v3) --[[ Line: 2 ]]
    -- upvalues: l_TweenService_0 (copy)
    for _, v5 in pairs(v1:GetDescendants()) do
        if v5:IsA("ParticleEmitter") then
            local l_v5_Attributes_0 = v5:GetAttributes();
            local l_EmitDelay_0 = l_v5_Attributes_0.EmitDelay;
            local v8 = l_v5_Attributes_0.EmitDuration or 0;
            local l_l_v5_Attributes_0_0 = l_v5_Attributes_0 --[[ copy: 8 -> 12 ]];
            local l_v8_0 = v8 --[[ copy: 10 -> 13 ]];
            task.delay(l_EmitDelay_0, function() --[[ Line: 10 ]]
                -- upvalues: v5 (copy), l_l_v5_Attributes_0_0 (copy), l_v8_0 (copy)
                if v5:GetAttribute("EmitCount") then
                    v5:Emit(l_l_v5_Attributes_0_0.EmitCount);
                end;
                if l_v8_0 > 0 then
                    task.defer(function() --[[ Line: 16 ]]
                        -- upvalues: v5 (ref), l_v8_0 (ref)
                        v5.Enabled = true;
                        task.wait(l_v8_0);
                        v5.Enabled = false;
                    end);
                end;
            end);
        end;
        if v5:IsA("Beam") then
            local l_v5_Attributes_1 = v5:GetAttributes();
            local l_Duration_0 = l_v5_Attributes_1.Duration;
            local v13 = 0.5;
            if v3 and v3.TweenTime then
                v13 = v3.TweenTime;
            end;
            do
                local l_v13_0 = v13;
                local function v15() --[[ Line: 37 ]] --[[ Name: Shut_OFF ]]
                    -- upvalues: l_TweenService_0 (ref), v5 (copy), l_v13_0 (ref)
                    l_TweenService_0:Create(v5, TweenInfo.new(l_v13_0, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        Width1 = 0, 
                        Width0 = 0
                    }):Play();
                end;
                (function() --[[ Line: 40 ]] --[[ Name: Turn_ON ]]
                    -- upvalues: l_TweenService_0 (ref), v5 (copy), l_v13_0 (ref), l_v5_Attributes_1 (copy)
                    l_TweenService_0:Create(v5, TweenInfo.new(l_v13_0, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                        Width1 = l_v5_Attributes_1.Width1, 
                        Width0 = l_v5_Attributes_1.Width0
                    }):Play();
                end)();
                if l_Duration_0 then
                    task.delay(l_Duration_0, function() --[[ Line: 47 ]]
                        -- upvalues: v15 (copy)
                        v15();
                    end);
                end;
            end;
        end;
    end;
    if v2 then
        game.Debris:AddItem(v1, v2);
    end;
end;