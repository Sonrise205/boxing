local _ = require(game.ReplicatedStorage.PrivateServerPlusModules.SettingTypes);
return {
    ID = "ClearNPCs", 
    DisplayName = "Clear All NPCs", 
    Category = "NPCs", 
    Type = "Button", 
    ServerFunction = function(_) --[[ Line: 4 ]] --[[ Name: ServerFunction ]]
        for _, v3 in workspace.Live:GetChildren() do
            if not game.Players:GetPlayerFromCharacter(v3) then
                local l_FirstChild_0 = workspace.States:FindFirstChild(v3.Name);
                v3:Destroy();
                l_FirstChild_0:Destroy();
            end;
        end;
    end
};