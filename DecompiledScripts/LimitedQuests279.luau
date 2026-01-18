local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local v2 = {
    Walmart = {
        EndTime = 1765526400
    }, 
    Halloween2024 = {
        EndTime = 1731214800
    }, 
    Anniversary = {
        EndTime = 1720238400
    }, 
    Jolly = {
        EndTime = 1705856340
    }, 
    Beowulf = {
        EndTime = 1708837200
    }, 
    Influx = {
        EndTime = 1716696000
    }, 
    Balrog = {
        EndTime = 1718424000
    }, 
    TheGames = {
        EndTime = 1723402800
    }, 
    ShotgunRework = {
        EndTime = 1726372800
    }, 
    JoeRelease = {
        EndTime = 1746892800
    }, 
    Anniversary2 = {
        EndTime = 1751688000
    }, 
    Medal = {
        EndTime = 1755018000
    }
};
local v3 = {
    ["WALMART DISCOVERED PERKS"] = {
        Type = "Knockdowns", 
        Amount = l_Places_0.IsTesting() and 0 or 5, 
        Description = "Get 5 knockdowns!", 
        Guaranteed = true, 
        Reward = {
            Type = "Gloves", 
            Name = "Discovered", 
            SellPrice = 5000, 
            DisplayName = "Discovered Gloves", 
            Amount = 1
        }, 
        Order = 0, 
        Class = "Walmart"
    }, 
    ["MEDAL 1"] = {
        Type = "ConnectMedal", 
        Amount = 1, 
        Description = "Connect your Roblox account to Medal!", 
        Guaranteed = true, 
        Reward = {
            Type = "LuckySpins", 
            Amount = "5"
        }, 
        Order = 0, 
        Class = "Medal"
    }, 
    ["MEDAL 2"] = {
        Type = "Knockdowns", 
        Amount = game:GetService("RunService"):IsStudio() and 0 or 3, 
        Description = "Get 3 knockdowns!", 
        Guaranteed = true, 
        Reward = {
            Type = "Cash", 
            Amount = "24999"
        }, 
        Order = 1, 
        Class = "Medal"
    }, 
    ["MEDAL 3"] = {
        Type = "ClipMedal", 
        Amount = 1, 
        Description = "Clip a Knockdown!", 
        Guaranteed = true, 
        Reward = {
            Type = "SpecialEmote", 
            Name = "MedalSelfie", 
            DisplayName = "Exclusive Emote"
        }, 
        Order = 2, 
        Class = "Medal"
    }, 
    ["EVENT GOAL REACHED"] = {
        Type = "Bluowulf", 
        Amount = 24, 
        Description = "???", 
        Guaranteed = true, 
        Reward = {
            Type = "Gloves", 
            Name = "Bluowulf", 
            SellPrice = 50000, 
            DisplayName = "Bluowulf", 
            Amount = 1
        }, 
        Order = 0, 
        Class = "Anniversary2"
    }, 
    ["UBG LIVES ON"] = {
        Type = "Knockdowns", 
        Amount = 33, 
        Description = "Get 33 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Map", 
            Name = "KamogawaGym", 
            DisplayName = "Kamogawa Gym Map"
        }, 
        Order = 1, 
        Class = "Anniversary2"
    }, 
    ["UNTITLED I"] = {
        Type = "Knockdowns", 
        Amount = 10, 
        Description = "Get 10 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Cash", 
            Amount = 7500
        }, 
        Order = 2, 
        Class = "Anniversary2"
    }, 
    ["UNTITLED II"] = {
        Type = "Knockdowns", 
        Amount = 20, 
        Description = "Get 20 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Spins", 
            Amount = 10
        }, 
        Order = 3, 
        Class = "Anniversary2"
    }, 
    ["UNTITLED III"] = {
        Type = "Knockdowns", 
        Amount = 45, 
        Description = "Get 45 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "EmoteSlot", 
            Amount = 1
        }, 
        Order = 4, 
        Class = "Anniversary2"
    }, 
    ["UNTITLED IV"] = {
        Type = "Knockdowns", 
        Amount = 75, 
        Description = "Get 75 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Cash", 
            Amount = 12500
        }, 
        Order = 5, 
        Class = "Anniversary2"
    }, 
    ["UNTETOED V"] = {
        Type = "Knockdowns", 
        Amount = 100, 
        Description = "Get 100 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "StyleSlot", 
            Amount = 1
        }, 
        Order = 6, 
        Class = "Anniversary2"
    }, 
    ["UNTITLED VI"] = {
        Type = "Knockdowns", 
        Amount = 135, 
        Description = "Get 150 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "MaxPity", 
            Amount = 1
        }, 
        Order = 7, 
        Class = "Anniversary2"
    }, 
    ["UNTITLED VII"] = {
        Type = "Knockdowns", 
        Amount = 165, 
        Description = "Get 165 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Spins", 
            Amount = 15
        }, 
        Order = 8, 
        Class = "Anniversary2"
    }, 
    ["UNTITLED VIII"] = {
        Type = "Knockdowns", 
        Amount = 200, 
        Description = "Get 200 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "LuckySpins", 
            Amount = 5
        }, 
        Order = 9, 
        Class = "Anniversary2"
    }, 
    ["UNTITLED IX"] = {
        Type = "Knockdowns", 
        Amount = 250, 
        Description = "Get 250 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "PickAStyle", 
            DisplayName = "Pick a Style (Ranked V2 Reward)", 
            Amount = 1
        }, 
        Order = 10, 
        Class = "Anniversary2"
    }, 
    ["UNTETOED BONUS"] = {
        Type = "Knockdowns", 
        Amount = 300, 
        Description = "Get 300 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "StyleSlot", 
            Amount = 1
        }, 
        Order = 11, 
        Class = "Anniversary2"
    }, 
    ["JOE I"] = {
        Type = "Knockdowns", 
        Amount = 10, 
        Description = "Get 10 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Spins", 
            Amount = 20
        }, 
        Order = 1, 
        Class = "JoeRelease"
    }, 
    ["JOE II"] = {
        Type = "Knockdowns", 
        Amount = 20, 
        Description = "Get 20 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Spins", 
            Amount = 30
        }, 
        Order = 2, 
        Class = "JoeRelease"
    }, 
    ["JOE III"] = {
        Type = "Knockdowns", 
        Amount = 45, 
        Description = "Get 45 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "LuckySpins", 
            Amount = 4
        }, 
        Order = 3, 
        Class = "JoeRelease"
    }, 
    ["JOE IV"] = {
        Type = "Knockdowns", 
        Amount = 75, 
        Description = "Get 75 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Cash", 
            Amount = 20000
        }, 
        Order = 4, 
        Class = "JoeRelease"
    }, 
    ["JOE V"] = {
        Type = "Knockdowns", 
        Amount = 100, 
        Description = "Get 100 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "MaxPity", 
            Amount = 1
        }, 
        Order = 5, 
        Class = "JoeRelease"
    }, 
    ["JOE VI"] = {
        Type = "Knockdowns", 
        Amount = 135, 
        Description = "Get 135 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "EmoteSlot", 
            Amount = 1
        }, 
        Order = 6, 
        Class = "JoeRelease"
    }, 
    ["JOE VII"] = {
        Type = "Knockdowns", 
        Amount = 165, 
        Description = "Get 165 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Spins", 
            Amount = 50
        }, 
        Order = 7, 
        Class = "JoeRelease"
    }, 
    ["JOE VIII"] = {
        Type = "Knockdowns", 
        Amount = 200, 
        Description = "Get 200 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "MaxPity", 
            Amount = 1
        }, 
        Order = 8, 
        Class = "JoeRelease"
    }, 
    ["JOE IX"] = {
        Type = "Knockdowns", 
        Amount = 250, 
        Description = "Get 250 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "LuckySpins", 
            Amount = 6
        }, 
        Order = 9, 
        Class = "JoeRelease"
    }, 
    ["JOE BONUS"] = {
        Type = "Knockdowns", 
        Amount = 300, 
        Description = "Get 300 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "StyleSlot", 
            Amount = 1
        }, 
        Order = 10, 
        Class = "JoeRelease"
    }, 
    ["HALLOWEEN I"] = {
        Type = "Knockdowns", 
        Amount = 5, 
        Description = "Get 5 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "EmoteSlot", 
            Amount = 1
        }, 
        Order = 1, 
        Class = "Halloween2024"
    }, 
    ["HALLOWEEN II"] = {
        Type = "Knockdowns", 
        Amount = 10, 
        Description = "Get 10 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Spins", 
            Amount = 10
        }, 
        Order = 2, 
        Class = "Halloween2024"
    }, 
    ["HALLOWEEN III"] = {
        Type = "Knockdowns", 
        Amount = 25, 
        Description = "Get 25 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Map", 
            Name = "HalloweenArena", 
            DisplayName = "Halloween Arena (DS)"
        }, 
        Order = 3, 
        Class = "Halloween2024"
    }, 
    ["HALLOWEEN IV"] = {
        Type = "Knockdowns", 
        Amount = 50, 
        Description = "Get 50 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Cash", 
            Amount = 12500
        }, 
        Order = 4, 
        Class = "Halloween2024"
    }, 
    ["HALLOWEEN V"] = {
        Type = "Knockdowns", 
        Amount = 75, 
        Description = "Get 75 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "EmoteSlot", 
            Amount = 1
        }, 
        Order = 5, 
        Class = "Halloween2024"
    }, 
    ["HALLOWEEN VI"] = {
        Type = "Knockdowns", 
        Amount = 100, 
        Description = "Get 100 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Map", 
            Name = "Ghoul", 
            DisplayName = "Limited-Time Ghoul Map"
        }, 
        Order = 6, 
        Class = "Halloween2024"
    }, 
    ["HALLOWEEN VII"] = {
        Type = "Knockdowns", 
        Amount = 150, 
        Description = "Get 150 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Cash", 
            Amount = 25000
        }, 
        Order = 7, 
        Class = "Halloween2024"
    }, 
    ["UBG VIII"] = {
        Type = "Knockdowns", 
        Amount = 200, 
        Description = "Get 200 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "EmoteSlot", 
            Amount = 1
        }, 
        Order = 8, 
        Class = "Halloween2024"
    }, 
    ["HALLOWEEN IX"] = {
        Type = "Knockdowns", 
        Amount = 250, 
        Description = "Get 250 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "MaxPity", 
            Amount = 1
        }, 
        Order = 9, 
        Class = "Halloween2024"
    }, 
    ["REWORK I"] = {
        Type = "Knockdowns", 
        Amount = 10, 
        Description = "Get 10 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Spins", 
            Amount = 15
        }, 
        Order = 1, 
        Class = "ShotgunRework"
    }, 
    ["REWORK II"] = {
        Type = "Knockdowns", 
        Amount = 25, 
        Description = "Get 25 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "EmoteSlot", 
            Amount = 1
        }, 
        Order = 2, 
        Class = "ShotgunRework"
    }, 
    ["REWORK III"] = {
        Type = "Knockdowns", 
        Amount = 50, 
        Description = "Get 50 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "MaxPity", 
            Amount = 1
        }, 
        Order = 3, 
        Class = "ShotgunRework"
    }, 
    ["REWORK IV"] = {
        Type = "Knockdowns", 
        Amount = 100, 
        Description = "Get 100 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Cash", 
            Amount = 15000
        }, 
        Order = 4, 
        Class = "ShotgunRework"
    }, 
    ["REWORK V"] = {
        Type = "Knockdowns", 
        Amount = 150, 
        Description = "Get 150 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "EmoteSlot", 
            Amount = 1
        }, 
        Order = 5, 
        Class = "ShotgunRework"
    }, 
    ["REWORK VI"] = {
        Type = "Knockdowns", 
        Amount = 250, 
        Description = "Get 250 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "MaxPity", 
            Amount = 1
        }, 
        Order = 6, 
        Class = "ShotgunRework"
    }, 
    ["TOURNAMENT I"] = {
        Type = "TheGames", 
        Amount = 1, 
        Description = "Defeat the boss.", 
        Guaranteed = true, 
        Reward = {
            Type = "Silver", 
            Amount = 1
        }, 
        Order = 1, 
        Class = "TheGames"
    }, 
    ["TOURNAMENT II"] = {
        Type = "TheGames", 
        Amount = 1, 
        Description = "Talk to Bringus and defeat the performer.", 
        Guaranteed = true, 
        Reward = {
            Type = "Silver", 
            Amount = 1
        }, 
        Order = 2, 
        Class = "TheGames"
    }, 
    ["TOURNAMENT III"] = {
        Type = "TheGames", 
        Amount = 1, 
        Description = "Knock down the strongest once.", 
        Guaranteed = true, 
        Reward = {
            Type = "Silver", 
            Amount = 1
        }, 
        Order = 3, 
        Class = "TheGames"
    }, 
    ["TOURNAMENT III FINALE"] = {
        Type = "TheGames", 
        Amount = 1, 
        Description = "Defeat the strongest.", 
        Guaranteed = true, 
        Reward = {
            Type = "???", 
            Amount = 1
        }, 
        Order = 4, 
        Class = "TheGames"
    }, 
    ["SHINY I"] = {
        Type = "TheGames", 
        Amount = 1, 
        Description = "The end of the line.", 
        Guaranteed = true, 
        Reward = {
            Type = "Shiny", 
            Amount = 1
        }, 
        Order = 5, 
        Class = "TheGames"
    }, 
    ["SHINY II"] = {
        Type = "TheGames", 
        Amount = 1, 
        Description = "Behind the best.", 
        Guaranteed = true, 
        Reward = {
            Type = "Shiny", 
            Amount = 1
        }, 
        Order = 6, 
        Class = "TheGames"
    }, 
    ["SHINY III"] = {
        Type = "TheGames", 
        Amount = 1, 
        Description = "Boing!", 
        Guaranteed = true, 
        Reward = {
            Type = "Shiny", 
            Amount = 1
        }, 
        Order = 7, 
        Class = "TheGames"
    }, 
    ["SHINY IV"] = {
        Type = "TheGames", 
        Amount = 1, 
        Description = "Play a PvP match.", 
        Guaranteed = true, 
        Reward = {
            Type = "Shiny", 
            Amount = 1
        }, 
        Order = 8, 
        Class = "TheGames"
    }, 
    ["SHINY V"] = {
        Type = "TheGames", 
        Amount = 1, 
        Description = "Maybe there's a better server for this?", 
        Guaranteed = true, 
        Reward = {
            Type = "Shiny", 
            Amount = 1
        }, 
        Order = 9, 
        Class = "TheGames"
    }, 
    ["UBG FOREVER"] = {
        Type = "Knockdowns", 
        Amount = 33, 
        Description = "Get 33 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Map", 
            Name = "KamogawaGym", 
            DisplayName = "Kamogawa Gym Map"
        }, 
        Order = 1, 
        Class = "Anniversary"
    }, 
    ["UBG I"] = {
        Type = "Knockdowns", 
        Amount = 10, 
        Description = "Get 10 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Cash", 
            Amount = 7500
        }, 
        Order = 2, 
        Class = "Anniversary"
    }, 
    ["UBG II"] = {
        Type = "Knockdowns", 
        Amount = 20, 
        Description = "Get 20 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Spins", 
            Amount = 10
        }, 
        Order = 3, 
        Class = "Anniversary"
    }, 
    ["UBG III"] = {
        Type = "Knockdowns", 
        Amount = 45, 
        Description = "Get 45 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "EmoteSlot", 
            Amount = 1
        }, 
        Order = 4, 
        Class = "Anniversary"
    }, 
    ["UBG IV"] = {
        Type = "Knockdowns", 
        Amount = 75, 
        Description = "Get 75 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Cash", 
            Amount = 12500
        }, 
        Order = 5, 
        Class = "Anniversary"
    }, 
    ["UBG V"] = {
        Type = "Knockdowns", 
        Amount = 100, 
        Description = "Get 100 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "StyleSlot", 
            Amount = 1
        }, 
        Order = 6, 
        Class = "Anniversary"
    }, 
    ["UBG VI"] = {
        Type = "Knockdowns", 
        Amount = 135, 
        Description = "Get 150 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "EmoteSlot", 
            Amount = 1
        }, 
        Order = 7, 
        Class = "Anniversary"
    }, 
    ["UBG VII"] = {
        Type = "Knockdowns", 
        Amount = 165, 
        Description = "Get 165 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "Spins", 
            Amount = 15
        }, 
        Order = 8, 
        Class = "Anniversary"
    }, 
    ["UBG VIII LOL"] = {
        Type = "Knockdowns", 
        Amount = 200, 
        Description = "Get 200 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "MaxPity", 
            Amount = 1
        }, 
        Order = 9, 
        Class = "Anniversary"
    }, 
    ["UBG IX"] = {
        Type = "Knockdowns", 
        Amount = 250, 
        Description = "Get 250 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "EmoteSlot", 
            Amount = 1
        }, 
        Order = 10, 
        Class = "Anniversary"
    }, 
    ["UBG BONUS"] = {
        Type = "Knockdowns", 
        Amount = 300, 
        Description = "Get 300 Knockdowns.", 
        Guaranteed = true, 
        Reward = {
            Type = "StyleSlot", 
            Amount = 1
        }, 
        Order = 11, 
        Class = "Anniversary"
    }
};
return {
    Classes = v2, 
    Quests = v3
};