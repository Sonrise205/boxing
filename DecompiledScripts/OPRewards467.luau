return {
    Special = true, 
    IsGameRewardFormat = true, 
    Drops = {
        Uncommon = {
            distribution = {
                Cash = 0.4, 
                Spins = 0.4, 
                UncommonShards = 0.2
            }, 
            Cash = {
                min = 10000, 
                max = 50000, 
                step = 1000
            }, 
            Spins = {
                min = 15, 
                max = 30, 
                step = 1
            }, 
            UncommonShards = {
                min = 20, 
                max = 40, 
                step = 1
            }
        }, 
        Rare = {
            distribution = {
                Cash = 0.12, 
                Spins = 0.12, 
                LuckyCrates = 0.23, 
                LuckySpins = 0.23, 
                RareShards = 0.2
            }, 
            Cash = {
                min = 25000, 
                max = 50000, 
                step = 1
            }, 
            Spins = {
                min = 25, 
                max = 50, 
                step = 1
            }, 
            LuckyCrates = {
                min = 5, 
                max = 10, 
                step = 1
            }, 
            LuckySpins = {
                min = 10, 
                max = 20, 
                step = 1
            }, 
            RareShards = {
                min = 20, 
                max = 40, 
                step = 1
            }
        }, 
        Mythic = {
            distribution = {
                LuckyCrates = 0.4, 
                LuckySpins = 0.4, 
                MythicShards = 0.2
            }, 
            LuckyCrates = {
                min = 5, 
                max = 15, 
                step = 1
            }, 
            LuckySpins = {
                min = 10, 
                max = 20, 
                step = 1
            }, 
            MythicShards = {
                min = 20, 
                max = 40, 
                step = 1
            }
        }, 
        Legendary = {
            distribution = {
                LuckySpins = 0.15, 
                LuckyCrates = 0.15, 
                Slot = 0.7
            }, 
            LuckySpins = {
                min = 15, 
                max = 25, 
                step = 1
            }, 
            LuckyCrates = {
                min = 10, 
                max = 20, 
                step = 1
            }
        }
    }, 
    Rates = {
        Uncommon = 45, 
        Rare = 35, 
        Mythic = 15, 
        Legendary = 5, 
        Unusual = 0
    }
};