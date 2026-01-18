local v0 = {
    Special = true, 
    IsGloveCrate = true, 
    Order = 1, 
    Limited = true, 
    DisplayName = "HALLOWEEN", 
    Price = 2500, 
    TruePrice = 2500, 
    ImageId = 15031043852, 
    GlowColor = Color3.fromRGB(255, 160, 92), 
    BackgroundColor = Color3.fromRGB(232, 166, 51), 
    FrameColor = Color3.fromRGB(36, 29, 11), 
    Unusuals = {
        "Possessed", 
        "Ecto", 
        "Magic", 
        "Dusk", 
        "Lantern"
    }, 
    Drops = {
        "Infected", 
        "Dread", 
        "GoodAndEvil", 
        "Molten", 
        "RatKing", 
        "Arachnophobia", 
        "Brains", 
        "Purge", 
        "PirateHooks", 
        "Mercenary"
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
        Uncommon = 40, 
        Rare = 30, 
        Mythic = 20, 
        Legendary = 10, 
        Unusual = 100
    };
end;
return v0;