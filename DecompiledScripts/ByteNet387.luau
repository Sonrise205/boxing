local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.process.client);
local v2 = require(script.dataTypes.array);
local v3 = require(script.dataTypes.bool);
local v4 = require(script.dataTypes.buff);
local v5 = require(script.dataTypes.cframe);
local v6 = require(script.dataTypes.float32);
local v7 = require(script.dataTypes.float64);
local v8 = require(script.dataTypes.inst);
local v9 = require(script.dataTypes.int16);
local v10 = require(script.dataTypes.int32);
local v11 = require(script.dataTypes.int8);
local v12 = require(script.dataTypes.map);
local v13 = require(script.dataTypes.nothing);
local v14 = require(script.dataTypes.optional);
local v15 = require(script.dataTypes.string);
local v16 = require(script.dataTypes.struct);
local v17 = require(script.dataTypes.uint16);
local v18 = require(script.dataTypes.uint32);
local v19 = require(script.dataTypes.uint8);
local v20 = require(script.dataTypes.unknown);
local v21 = require(script.dataTypes.vec2);
local v22 = require(script.dataTypes.vec3);
local v23 = require(script.namespaces.namespace);
local v24 = require(script.packets.definePacket);
local v25 = require(script.process.server);
local v26 = require(script.replicated.values);
local _ = require(script.types);
v26.start();
if l_RunService_0:IsServer() then
    v25.start();
else
    v1.start();
end;
return (table.freeze({
    definePacket = v24, 
    defineNamespace = v23, 
    array = v2, 
    bool = v3(), 
    optional = v14, 
    uint8 = v19(), 
    uint16 = v17(), 
    uint32 = v18(), 
    int8 = v11(), 
    int16 = v9(), 
    int32 = v10(), 
    float32 = v6(), 
    float64 = v7(), 
    cframe = v5(), 
    string = v15(), 
    vec2 = v21(), 
    vec3 = v22(), 
    buff = v4(), 
    struct = v16, 
    map = v12, 
    inst = v8(), 
    unknown = v20(), 
    nothing = v13()
}));