local v0 = {};
local l_TweenService_0 = game:GetService("TweenService");
local function v2(v3, v4, v5) --[[ Line: 4 ]] --[[ Name: setHighlightTracker ]]
    -- upvalues: v0 (copy), l_TweenService_0 (copy), v2 (copy)
    if not v4 then
        return;
    else
        local v6 = v0[v3];
        if not v5 then
            if v6 then
                v6.active = false;
            end;
            v6 = {
                ord = 1, 
                active = true
            };
            v0[v3] = v6;
        end;
        if not v6 or not v6.active then
            return;
        else
            local v7 = nil;
            if v4.Repeat then
                v7 = v4.Repeat[v6.ord];
                if not v7 then
                    return;
                elseif v7.Repeat then
                    return;
                end;
            else
                v7 = v4;
            end;
            for v8, v9 in v7 do
                if v8 ~= "Tween" and v8 ~= "Repeat" then
                    v3[v8] = v9;
                end;
            end;
            local l_Tween_0 = v7.Tween;
            if not l_Tween_0 then
                return;
            else
                local v11 = l_TweenService_0:Create(v3, l_Tween_0.Info, l_Tween_0.Goal);
                v11:Play();
                if v4.Repeat then
                    local l_v6_0 = v6;
                    v11.Completed:Once(function() --[[ Line: 66 ]]
                        -- upvalues: l_v6_0 (copy), v0 (ref), v3 (copy), v4 (copy), v2 (ref)
                        if not l_v6_0.active then
                            return;
                        elseif v0[v3] ~= l_v6_0 then
                            return;
                        else
                            local l_l_v6_0_0 = l_v6_0;
                            l_l_v6_0_0.ord = l_l_v6_0_0.ord + 1;
                            if l_v6_0.ord > #v4.Repeat then
                                l_v6_0.ord = 1;
                            end;
                            v2(v3, v4, true);
                            return;
                        end;
                    end);
                end;
                return;
            end;
        end;
    end;
end;
return v2;