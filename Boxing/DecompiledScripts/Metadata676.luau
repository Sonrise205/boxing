return {
    DisplayName = "Gilgamesh", 
    Rarity = "Legendary", 
    NotPurchasable = true, 
    SellPrice = 50000, 
    OnEquip = function(v0) --[[ Line: 7 ]] --[[ Name: OnEquip ]]
        local l_CollectionService_0 = game:GetService("CollectionService");
        local _ = game:GetService("TweenService");
        local v3 = {};
        for _, v5 in v0:GetDescendants() do
            if v5:IsA("BasePart") and l_CollectionService_0:HasTag(v5, "GilgameshNeon") then
                table.insert(v3, v5);
            end;
        end;
        task.spawn(function() --[[ Line: 20 ]]
            -- upvalues: v3 (copy), v0 (copy)
            while true do
                if task.wait(0.016666666666666666) then
                    for _, v7 in v3 do
                        if v0.Parent == nil then
                            return;
                        else
                            v7.Color = Color3.fromHSV(math.sin(tick() / 10) * 0.5 + 0.5, 0.47, 0.75);
                        end;
                    end;
                else
                    return;
                end;
            end;
        end);
    end
};