local v0 = false;
local v1;
if game:GetService("RunService"):IsClient() then
    v1 = shared.BridgeNet2;
    if not v1 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v1 = shared.BridgeNet2;
        v0 = v1;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v1 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
v1.ReferenceBridge("SystemChatMessage"):Connect(function(v2) --[[ Line: 4 ]]
    if not workspace.Settings.SystemMessagesEnabled.Value then
        return;
    else
        game:GetService("TextChatService"):WaitForChild("TextChannels"):WaitForChild("RBXSystem"):DisplaySystemMessage((("<font color=\"#FFFFFF\">%*</font>"):format(v2)));
        return;
    end;
end);