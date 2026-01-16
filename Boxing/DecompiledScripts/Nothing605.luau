local v0 = {
    Metadata = {
        DisplayName = "Nothing", 
        Rarity = "Uncommon", 
        Price = 99999999999, 
        Description = "Nothing ever happens", 
        Time = 0, 
        IgnoreShop = true
    }, 
    Animations = {
        Character = 0, 
        Camera = 0
    }
};
if game:GetService("RunService"):IsServer() then
    return v0;
else
    v0.Use = function(_) --[[ Line: 26 ]] --[[ Name: Use ]]

    end;
    return v0;
end;