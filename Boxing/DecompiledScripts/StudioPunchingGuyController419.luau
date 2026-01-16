if not game:GetService("RunService"):IsStudio() then
    return;
else
    local l_RemoteEvent_0 = script.RemoteEvent;
    game:GetService("UserInputService").InputBegan:Connect(function(v1, v2) --[[ Line: 7 ]]
        -- upvalues: l_RemoteEvent_0 (copy)
        if v2 then
            return;
        else
            if v1.KeyCode == Enum.KeyCode.B then
                l_RemoteEvent_0:FireServer();
            end;
            return;
        end;
    end);
    return;
end;