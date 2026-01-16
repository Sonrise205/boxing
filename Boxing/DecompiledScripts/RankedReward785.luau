return {
    Special = true, 
    IsGameRewardFormat = true, 
    Drops = {
        Uncommon = {
            distribution = {
                Cash = 0.61, 
                Spins = 0.31, 
                UncommonShards = 0.08
            }, 
            Cash = {
                min = 500, 
                max = 1000, 
                step = 50
            }, 
            Spins = {
                min = 2, 
                max = 3, 
                step = 1
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
                min = 2000, 
                max = 3000, 
                step = 250
            }, 
            Spins = {
                min = 3, 
                max = 6, 
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
                min = 15000, 
                max = 25000, 
                step = 2500
            }, 
            Spins = {
                min = 10, 
                max = 20, 
                step = 1
            }, 
            LuckySpins = {
                min = 2, 
                max = 3, 
                step = 1
            }, 
            LuckyCrates = {
                min = 2, 
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
                LuckySpins = 0.425, 
                LuckyCrates = 0.425, 
                Slot = 0.15
            }, 
            LuckySpins = {
                min = 4, 
                max = 9, 
                step = 1
            }, 
            LuckyCrates = {
                min = 4, 
                max = 9, 
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