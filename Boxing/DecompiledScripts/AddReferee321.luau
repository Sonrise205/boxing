local l_PrivateServerPlusModules_0 = game.ReplicatedStorage.PrivateServerPlusModules;
local _ = require(l_PrivateServerPlusModules_0.SettingTypes);
local v2 = require(l_PrivateServerPlusModules_0.Modules.SharedHelpers);
return {
    ID = "AddReferee", 
    DisplayName = "Add Referee", 
    Category = "Match", 
    Type = "Button", 
    ServerFunction = function(v3, v4) --[[ Line: 6 ]] --[[ Name: ServerFunction ]]
        -- upvalues: v2 (copy)
        if not v4 or not v4.Character or not v4.Character:FindFirstChild("Humanoid") then
            return;
        else
            print(v4);
            local v5 = v2.FindClosestRing(v3, true);
            if not v5 then
                return;
            else
                v4.Character:PivotTo(v5.Keypoints.Centre.CFrame);
                local l_Humanoid_0 = v4.Character:FindFirstChild("Humanoid");
                local l_l_Humanoid_0_AppliedDescription_0 = l_Humanoid_0:GetAppliedDescription();
                l_l_Humanoid_0_AppliedDescription_0.Shirt = 6055891536;
                l_l_Humanoid_0_AppliedDescription_0.Pants = 17325666339;
                l_Humanoid_0:ApplyDescription(l_l_Humanoid_0_AppliedDescription_0);
                return;
            end;
        end;
    end, 
    ClientCallbackName = "SinglePlayer"
};