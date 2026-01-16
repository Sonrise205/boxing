local _ = (game.Players.LocalPlayer or game.Players:GetPropertyChangedSignal("LocalPlayer")):GetMouse();
local v1 = {};
return {
    MouseEnterLeaveEvent = function(v2) --[[ Line: 112 ]] --[[ Name: MouseEnterLeaveEvent ]]
        -- upvalues: v1 (copy)
        if v1[v2] then
            return v1[v2].EnteredEvent.Event, v1[v2].LeaveEvent.Event;
        else
            local v3 = {
                UIObj = v2
            };
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            local l_BindableEvent_1 = Instance.new("BindableEvent");
            v2.MouseEnter:Connect(function() --[[ Line: 124 ]]
                -- upvalues: v3 (copy)
                v3.EnteredEvent:Fire();
            end);
            v2.MouseLeave:Connect(function() --[[ Line: 128 ]]
                -- upvalues: v3 (copy)
                v3.LeaveEvent:Fire();
            end);
            v3.EnteredEvent = l_BindableEvent_0;
            v3.LeaveEvent = l_BindableEvent_1;
            v3.MouseWasIn = false;
            v1[v2] = v3;
            v2.AncestryChanged:Connect(function() --[[ Line: 137 ]]
                -- upvalues: v2 (copy), l_BindableEvent_0 (copy), l_BindableEvent_1 (copy), v1 (ref)
                if not v2.Parent then
                    l_BindableEvent_0:Destroy();
                    l_BindableEvent_1:Destroy();
                    v1[v2] = nil;
                end;
            end);
            return l_BindableEvent_0.Event, l_BindableEvent_1.Event;
        end;
    end
};