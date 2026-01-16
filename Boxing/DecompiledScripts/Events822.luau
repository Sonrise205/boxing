local v0 = require(game.ReplicatedFirst.Places);
return {
    AndreBerto = {
        FightOrder = {}, 
        SpecialWinCondition = {}, 
        DailyFight = "Fight1", 
        DailyFightMaps = {
            [1] = "Expo"
        }, 
        DailyFightStyles = {
            [1] = "Basic", 
            [2] = "Sendo", 
            [3] = "LongGuard", 
            [4] = "Freedom", 
            [5] = "Miyata", 
            [6] = "Kimura", 
            [7] = "Date", 
            [8] = "Charge", 
            [9] = "Hammer", 
            [10] = "Ippo", 
            [11] = "Hitman", 
            [12] = "Saeki", 
            [13] = "Bullet", 
            [14] = "Ghost", 
            [15] = "IronFist"
        }, 
        PostFightDialogue = {
            Fight1 = {
                Won = "WonFight1", 
                Lost = "LostFight1"
            }
        }, 
        Sequential = true, 
        NoGoingBack = true, 
        ResetProgressOnJoin = v0.IsTesting()
    }
};