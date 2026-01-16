local l_PrivateServerPlusModules_0 = game.ReplicatedStorage.PrivateServerPlusModules;
local _ = require(l_PrivateServerPlusModules_0.SettingTypes);
local v2 = require(l_PrivateServerPlusModules_0:WaitForChild("Modules", 10):WaitForChild("SharedHelpers", 10));
return {
    ID = "SpawnBlockingDummy", 
    DisplayName = "Spawn Blocking Dummy", 
    Category = "NPCs", 
    Type = "Button", 
    ServerFunction = function(v3) --[[ Line: 6 ]] --[[ Name: ServerFunction ]]
        -- upvalues: v2 (copy)
        if not v3.Character then
            return;
        else
            local v4, v5 = v2.SpawnNPC("BlockingGuy");
            if not v4 or not v5 then
                warn("Blocking npc missing or something");
                return;
            else
                v4:PivotTo(v3.Character:GetPivot() * CFrame.new(0, 0, -5) * CFrame.Angles(0, 3.141592653589793, 0));
                return;
            end;
        end;
    end
};