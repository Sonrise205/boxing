local _ = require(game.ReplicatedStorage.PrivateServerPlusModules.SettingTypes);
local l_TeleportService_0 = game:GetService("TeleportService");
return {
    ID = "RefreshServer", 
    DisplayName = "Refresh Server", 
    Category = "Server", 
    Type = "Button", 
    ServerFunction = function(_) --[[ Line: 11 ]] --[[ Name: ServerFunction ]]
        -- upvalues: l_TeleportService_0 (copy)
        local l_PlaceId_0 = game.PlaceId;
        local v4 = l_TeleportService_0:ReserveServer(l_PlaceId_0);
        local l_Players_0 = game.Players:GetPlayers();
        local l_TeleportOptions_0 = Instance.new("TeleportOptions");
        l_TeleportOptions_0.ReservedServerAccessCode = v4;
        l_TeleportService_0:TeleportAsync(l_PlaceId_0, l_Players_0, l_TeleportOptions_0);
    end
};