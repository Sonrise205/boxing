return {
    Special = true, 
    IsGameRewardFormat = true, 
    Drops = {
        Uncommon = {
            distribution = {
                Cash = 0.92, 
                UncommonShards = 0.08
            }, 
            Cash = {
                min = 300, 
                max = 600, 
                step = 50
            }, 
            UncommonShards = {
                min = 2, 
                max = 5, 
                step = 1
            }
        }, 
        Rare = {
            distribution = {
                Cash = 0.35, 
                Spins = 0.57, 
                RareShards = 0.08
            }, 
            Cash = {
                min = 1000, 
                max = 1750, 
                step = 250
            }, 
            Spins = {
                min = 2, 
                max = 5, 
                step = 1
            }, 
            RareShards = {
                min = 2, 
                max = 5, 
                step = 1
            }
        }, 
        Mythic = {
            distribution = {
                Cash = 0.25, 
                Spins = 0.28, 
                LuckySpins = 0.12, 
                LuckyCrates = 0.12, 
                Emote = 0.15, 
                MythicShards = 0.08
            }, 
            Cash = {
                min = 7500, 
                max = 15000, 
                step = 2500
            }, 
            Spins = {
                min = 10, 
                max = 10, 
                step = 0
            }, 
            LuckySpins = {
                min = 1, 
                max = 3, 
                step = 1
            }, 
            LuckyCrates = {
                min = 1, 
                max = 3, 
                step = 1
            }, 
            MythicShards = {
                min = 2, 
                max = 5, 
                step = 1
            }
        }, 
        Legendary = {
            distribution = {
                LuckySpins = 0.42, 
                LuckyCrates = 0.4, 
                Slot = 0.18
            }, 
            LuckySpins = {
                min = 3, 
                max = 5, 
                step = 1
            }, 
            LuckyCrates = {
                min = 3, 
                max = 5, 
                step = 1
            }
        }
    }, 
    Rates = {
        Uncommon = 63.5, 
        Rare = 26, 
        Mythic = 7, 
        Legendary = 1.5, 
        Unusual = 0
    }
};