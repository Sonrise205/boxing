local _ = require(game.ReplicatedStorage.PrivateServerPlusModules.SettingTypes);
return {
    ID = "TrueBulletStyle", 
    DisplayName = "True Bullet Style", 
    Category = "Miscellaneous", 
    Type = "Button", 
    ServerFunction = function(v1) --[[ Line: 4 ]] --[[ Name: ServerFunction ]]
        print("What the hell is going on here");
        game.InsertService:LoadAsset(97885508):GetChildren()[1].Parent = v1.Character;
    end
};