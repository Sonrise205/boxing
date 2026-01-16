local v0 = false;
local _ = game:GetService("ReplicatedFirst");
local v2;
if game:GetService("RunService"):IsClient() then
    v2 = shared.BridgeNet2;
    if not v2 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v2 = shared.BridgeNet2;
        v0 = v2;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v2 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
v2.ReferenceBridge("UsedFeature"):Fire("Baseline");