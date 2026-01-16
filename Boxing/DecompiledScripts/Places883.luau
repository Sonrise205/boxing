local v0 = {};
Prod = {
    Main = 13621938427, 
    Ranked = 14397772816, 
    Trading = 14975874252, 
    NA = 14397680739, 
    SA = 14397682137, 
    EU = 14397683205, 
    AS = 14397684147
};
Testing = {
    Main = 137645521237684, 
    Ranked = 14303967410, 
    Trading = 14975874252222, 
    NA = 14289414182, 
    SA = 14397648520, 
    EU = 14397651717, 
    AS = 14397650402
};
for _, v2 in Prod do
    if game.PlaceId == v2 then
        v0 = Prod;
        break;
    end;
end;
for _, v4 in Testing do
    if game.PlaceId == v4 then
        v0 = Testing;
        break;
    end;
end;
v0.IsTesting = function() --[[ Line: 41 ]]
    return game.PlaceId == Testing.Main;
end;
return v0;