local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Client);
local _ = require(script.PublicTypes);
local v3 = require(script.Server);
local v4 = require(script.Studio.MockBridge);
local v5 = require(script.Utilities.NetworkUtils);
local v6 = require(script.Utilities.Output);
local v7 = require(script.Utilities.isEditMode);
local v8 = require(script.version);
local v9 = l_RunService_0:IsServer();
task.spawn(function() --[[ Line: 15 ]]
    -- upvalues: v7 (copy), v9 (copy), v3 (copy), v1 (copy)
    if not v7 then
        if v9 then
            v3.start();
            return;
        else
            v1.start();
        end;
    end;
end);
local v11 = {
    ToHex = v5.ToHex, 
    ToReadableHex = v5.ToReadableHex, 
    FromHex = v5.FromHex, 
    CreateUUID = v5.CreateUUID, 
    ReferenceIdentifier = if v9 then v3.makeIdentifier else v1.makeIdentifier, 
    Deserialize = if v9 then v3.deser else v1.deser, 
    Serialize = if v9 then v3.ser else v1.ser, 
    AllPlayers = v3.playerContainers().All, 
    PlayersExcept = v3.playerContainers().Except, 
    Players = v3.playerContainers().Players, 
    ReferenceBridge = if v9 then v3.makeBridge else v1.makeBridge, 
    ServerBridge = if v9 then v3.makeBridge else nil, 
    ClientBridge = if not v9 then v1.makeBridge else nil, 
    Types = script.ExportedTypes, 
    HandleInvalidPlayer = function(v10) --[[ Line: 117 ]] --[[ Name: HandleInvalidPlayer ]]
        -- upvalues: v6 (copy), v9 (copy), v3 (copy)
        v6.fatalAssert(v9, "Cannot call from client");
        v3.invalidPlayerhandler(v10);
    end, 
    version = v8
};
if v7 then
    v6.log("running BridgeNet2 in mock mode");
    v11.ClientBridge = v4;
    v11.ServerBridge = nil;
    v11.ReferenceBridge = v4;
    v11.ReferenceIdentifier = function(v12) --[[ Line: 133 ]] --[[ Name: ReferenceIdentifier ]]
        return v12;
    end;
    v11.Serialize = function(v13) --[[ Line: 137 ]] --[[ Name: Serialize ]]
        return v13;
    end;
    v11.Deserialize = function(v14) --[[ Line: 141 ]] --[[ Name: Deserialize ]]
        return v14;
    end;
end;
return v11;