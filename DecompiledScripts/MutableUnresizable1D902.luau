local v2 = {
    __newindex = function(_, v1) --[[ Line: 2 ]] --[[ Name: __newindex ]]
        error((("Attempt to write to non-existent key: %*"):format(v1)));
    end
};
return function(v3) --[[ Line: 8 ]] --[[ Name: MutableUnresizable1D ]]
    -- upvalues: v2 (copy)
    setmetatable(v3, v2);
end;