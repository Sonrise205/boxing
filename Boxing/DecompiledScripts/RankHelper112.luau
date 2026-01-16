local v0 = {
    RankInfo = {
        Journeyman = {
            Rating = 1000, 
            Quality = 3, 
            Tier = "Bronze", 
            Subtier = "1", 
            ImageId = 14257236784, 
            Reward = {
                Type = "Cash", 
                Amount = 500
            }
        }, 
        Underdog = {
            Rating = 2000, 
            Quality = 4, 
            Tier = "Bronze", 
            Subtier = "2", 
            ImageId = 14257245023, 
            Reward = {
                Type = "Spins", 
                Amount = 3
            }
        }, 
        Gatekeeper = {
            Rating = 4000, 
            Quality = 5, 
            Tier = "Bronze", 
            Subtier = "3", 
            ImageId = 14257247028, 
            Reward = {
                Type = "Gloves", 
                GloveName = "BronzeRanked", 
                GloveDisplayName = "BRONZE GLOVES"
            }
        }, 
        Prospect = {
            Rating = 6000, 
            Quality = 6, 
            Tier = "Silver", 
            Subtier = "1", 
            ImageId = 14257247997, 
            Reward = {
                Type = "Cash", 
                Amount = 2500
            }
        }, 
        Challenger = {
            Rating = 8000, 
            Quality = 6, 
            Tier = "Silver", 
            Subtier = "2", 
            ImageId = 14257250577, 
            Reward = {
                Type = "Spins", 
                Amount = 5
            }
        }, 
        Contender = {
            Rating = 9500, 
            Quality = 7, 
            Tier = "Silver", 
            Subtier = "3", 
            ImageId = 14257251305, 
            Reward = {
                Type = "Gloves", 
                GloveName = "SilverRanked", 
                GloveDisplayName = "SILVER GLOVES"
            }
        }, 
        Prodigy = {
            Rating = 11000, 
            Quality = 7, 
            Tier = "Gold", 
            Subtier = "1", 
            ImageId = 14257256465, 
            Reward = {
                Type = "Cash", 
                Amount = 7500
            }
        }, 
        National = {
            Rating = 12500, 
            Quality = 8, 
            Tier = "Gold", 
            Subtier = "2", 
            ImageId = 14257262053, 
            Reward = {
                Type = "Spins", 
                Amount = 10
            }
        }, 
        Continental = {
            Rating = 14000, 
            Quality = 8, 
            Tier = "Gold", 
            Subtier = "3", 
            ImageId = 14257264734, 
            Reward = {
                Type = "Gloves", 
                GloveName = "GoldRanked", 
                GloveDisplayName = "GOLD GLOVES"
            }
        }, 
        ["World Ranked"] = {
            Rating = 16500, 
            Quality = 9, 
            Tier = "Diamond", 
            Subtier = "1", 
            ImageId = 14257267120, 
            Reward = {
                Type = "Cash", 
                Amount = 15000
            }
        }, 
        ["Mandatory Challenger"] = {
            Rating = 18000, 
            Quality = 9, 
            Tier = "Diamond", 
            Subtier = "2", 
            ImageId = 14257267843, 
            Reward = {
                Type = "Spins", 
                Amount = 15
            }
        }, 
        ["Interim Champion"] = {
            Rating = 20000, 
            Quality = 10, 
            Tier = "Diamond", 
            Subtier = "3", 
            ImageId = 14257268405, 
            Reward = {
                Type = "Gloves", 
                GloveName = "DiamondRanked", 
                GloveDisplayName = "DIAMOND GLOVES"
            }
        }, 
        ["World Champion"] = {
            Rating = 21500, 
            Quality = 10, 
            Tier = "Champion", 
            Subtier = "1", 
            ImageId = 14257269017, 
            Reward = {
                Type = "Cash", 
                Amount = 35000
            }
        }, 
        ["Unified Champion"] = {
            Rating = 23000, 
            Quality = 12, 
            Tier = "Champion", 
            Subtier = "2", 
            ImageId = 14292791435, 
            Reward = {
                Type = "Spins", 
                Amount = 50
            }
        }, 
        ["Undisputed Champion"] = {
            Rating = 24250, 
            Quality = 13, 
            Tier = "Champion", 
            Subtier = "3", 
            ImageId = 14257270241, 
            Reward = {
                Type = "Gloves", 
                GloveName = "ChampionRanked", 
                GloveDisplayName = "CHAMPION GLOVES"
            }
        }
    }
};
v0.GetRankInfoFromRating = function(v1) --[[ Line: 235 ]] --[[ Name: GetRankInfoFromRating ]]
    -- upvalues: v0 (copy)
    local v2 = -1;
    local v3 = nil;
    for v4, v5 in v0.RankInfo do
        if v5.Rating < v1 and v2 < v5.Rating then
            v2 = v5.Rating;
            v3 = v5;
            v3.Title = v4;
        end;
    end;
    return v3;
end;
v0.GetNextRankInfoFromRating = function(v6) --[[ Line: 251 ]] --[[ Name: GetNextRankInfoFromRating ]]
    -- upvalues: v0 (copy)
    local v7 = 100000;
    local v8 = nil;
    for v9, v10 in v0.RankInfo do
        if v6 < v10.Rating and v10.Rating < v7 then
            v7 = v10.Rating;
            v8 = v10;
            v8.Title = v9;
        end;
    end;
    return v8;
end;
return v0;