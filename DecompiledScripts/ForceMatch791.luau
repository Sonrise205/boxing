local l_PrivateServerPlusModules_0 = game.ReplicatedStorage.PrivateServerPlusModules;
local _ = require(l_PrivateServerPlusModules_0.SettingTypes);
local v2 = require(l_PrivateServerPlusModules_0:WaitForChild("Modules").SharedHelpers);
return {
    ID = "ForceMatch", 
    DisplayName = "Force Match", 
    Category = "Match", 
    Type = "Button", 
    ClientCallbackName = "TwoPlayersNotInMatch", 
    ServerFunction = function(v3, v4) --[[ Line: 6 ]] --[[ Name: ServerFunc ]]
        -- upvalues: v2 (copy)
        if not v4 then
            return;
        else
            local v5 = v2.FindClosestRing(v3, false);
            game.ServerScriptService.Events.ForceFight:Fire({
                Players = v4, 
                Ring = v5
            });
            return;
        end;
    end
};