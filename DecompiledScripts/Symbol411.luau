return function(v0) --[[ Line: 2 ]] --[[ Name: Symbol ]]
    local v1 = newproxy(true);
    getmetatable(v1).__tostring = function() --[[ Line: 5 ]] --[[ Name: __tostring ]]
        -- upvalues: v0 (copy)
        return v0;
    end;
    return v1;
end;