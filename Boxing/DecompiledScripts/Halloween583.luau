local v0 = {
    Special = true, 
    IsGloveCrate = true, 
    Order = 1, 
    Limited = true, 
    DisplayName = "HALLOWEEN", 
    Price = 6000, 
    TruePrice = 2500, 
    ImageId = 15031043852, 
    GlowColor = Color3.fromRGB(255, 160, 92), 
    BackgroundColor = Color3.fromRGB(232, 166, 51), 
    FrameColor = Color3.fromRGB(36, 29, 11), 
    Unusuals = {
        "Possessed", 
        "Spectral", 
        "Pumpkins", 
        "Ghost", 
        "Bats"
    }, 
    Drops = {
        "Splatter", 
        "Caution", 
        "Poison", 
        "October", 
        "Moth", 
        "Haunted", 
        "Spider", 
        "Joker", 
        "Bats", 
        "Corruption"
    }, 
    Rates = {
        Uncommon = 65.5, 
        Rare = 27, 
        Mythic = 6, 
        Legendary = 1.5, 
        Unusual = 1
    }
};
if game:GetService("RunService"):IsStudio() then
    v0.Rates = {
        Uncommon = 0, 
        Rare = 0, 
        Mythic = 0, 
        Legendary = 0, 
        Unusual = 100
    };
end;
return v0;