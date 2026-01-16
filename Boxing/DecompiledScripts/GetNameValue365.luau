local v0 = {
    Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157), 
    Color3.new(0.00392156862745098, 0.6352941176470588, 1), 
    Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353), 
    BrickColor.new("Alder").Color, 
    BrickColor.new("Bright orange").Color, 
    BrickColor.new("Bright yellow").Color, 
    BrickColor.new("Light reddish violet").Color, 
    BrickColor.new("Brick yellow").Color
};
local v1 = {};
local function v8(v2) --[[ Line: 16 ]] --[[ Name: GetNameColor ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v3 = 0;
    for v4 = 1, #v2 do
        local v5 = string.byte((string.sub(v2, v4, v4)));
        local v6 = #v2 - v4 + 1;
        if #v2 % 2 == 1 then
            v6 = v6 - 1;
        end;
        if v6 % 4 >= 2 then
            v5 = -v5;
        end;
        v3 = v3 + v5;
    end;
    local v7 = v0[v3 % #v0 + 1];
    v1[v2] = v7;
    return v7;
end;
GetColorFromPlyName = function(v9) --[[ Line: 34 ]] --[[ Name: GetColorFromPlyName ]]
    -- upvalues: v1 (copy), v8 (copy)
    return v1[v9] or v8(v9);
end;
return GetColorFromPlyName;