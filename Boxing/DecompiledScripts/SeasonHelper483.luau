local v0 = {};
GetRawSeason = function() --[[ Line: 14 ]] --[[ Name: GetRawSeason ]]
    return (os.time() - 1690671600) / 1209600 + 1;
end;
v0.GetCurrentSeason = function() --[[ Line: 18 ]] --[[ Name: GetCurrentSeason ]]
    return (math.floor((GetRawSeason())));
end;
v0.GetTimeUntilNextSeason = function() --[[ Line: 22 ]] --[[ Name: GetTimeUntilNextSeason ]]
    -- upvalues: v0 (copy)
    return (v0.GetCurrentSeason() + 1 - GetRawSeason()) * 1209600;
end;
local v1 = {
    Top1 = {
        Title = "Death God", 
        Quality = 13, 
        Cash = 200000
    }, 
    Top2 = {
        Title = "Slayer", 
        Quality = 12, 
        Cash = 125000
    }, 
    Top3 = {
        Title = "Murderer", 
        Quality = 11, 
        Cash = 75000
    }, 
    Top5 = {
        Title = "Brutal", 
        Quality = 10, 
        Cash = 50000
    }, 
    Top10 = {
        Title = "Savage", 
        Quality = 9, 
        Cash = 35000
    }, 
    Top25 = {
        Title = "Knockdown Medalist", 
        Quality = 8, 
        Cash = 20000
    }, 
    Top50 = {
        Cash = 15000
    }
};
local v2 = {
    Top1 = {
        Title = "Conquerer", 
        Quality = 13, 
        Cash = 200000
    }, 
    Top2 = {
        Title = "Dominator", 
        Quality = 12, 
        Cash = 125000
    }, 
    Top3 = {
        Title = "Demigod", 
        Quality = 11, 
        Cash = 75000
    }, 
    Top5 = {
        Title = "Superior", 
        Quality = 10, 
        Cash = 50000
    }, 
    Top10 = {
        Title = "Winner", 
        Quality = 9, 
        Cash = 35000
    }, 
    Top25 = {
        Title = "Wins Medalist", 
        Quality = 8, 
        Cash = 20000
    }, 
    Top50 = {
        Cash = 15000
    }
};
v0.KnockdownRewards = v1;
v0.WinRewards = v2;
return v0;