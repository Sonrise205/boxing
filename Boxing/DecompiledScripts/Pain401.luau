local v0 = {
    Order = 10, 
    DisplayName = "PAIN", 
    Price = 3000, 
    ImageId = 14733531068, 
    GlowColor = Color3.fromRGB(188, 79, 255), 
    BackgroundColor = Color3.fromRGB(154, 76, 232), 
    FrameColor = Color3.fromRGB(34, 12, 36), 
    Unusuals = {
        "Crows", 
        "Toxic", 
        "Poison", 
        "Flames", 
        "Blood"
    }, 
    Drops = {
        "Stitch", 
        "Camo", 
        "Classic", 
        "Sleek", 
        "Convict", 
        "Turbulence", 
        "Bloody", 
        "Skull", 
        "Spikes", 
        "Bandages"
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