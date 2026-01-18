local v6 = {
    getAspectRatio = function(_, v1) --[[ Line: 3 ]] --[[ Name: getAspectRatio ]]
        return v1.X / v1.Y;
    end, 
    getHeight = function(_, _, v4, v5) --[[ Line: 7 ]] --[[ Name: getHeight ]]
        return -2 * v4 * v5;
    end
};
v6.getWidth = function(_, v8, v9, v10) --[[ Line: 11 ]] --[[ Name: getWidth ]]
    -- upvalues: v6 (copy)
    return -2 * (v6:getAspectRatio(v8) * v9) * v10;
end;
return v6;