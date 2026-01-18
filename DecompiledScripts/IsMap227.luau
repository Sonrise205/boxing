return function(v0) --[[ Line: 2 ]] --[[ Name: IsMap ]]
    local v1 = #v0;
    if v1 == 0 then
        return next(v0) ~= nil;
    else
        local v2 = next(v0, v1);
        if v2 == nil or typeof(v2) == "number" and v2 == 1 then
            return false;
        else
            return true;
        end;
    end;
end;