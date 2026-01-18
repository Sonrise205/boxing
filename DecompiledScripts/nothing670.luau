local _ = require(script.Parent.Parent.types);
local v1 = {
    write = function() --[[ Line: 4 ]] --[[ Name: write ]]

    end, 
    read = function() --[[ Line: 6 ]] --[[ Name: read ]]
        return nil, 0;
    end
};
return function() --[[ Line: 11 ]]
    -- upvalues: v1 (copy)
    return v1;
end;