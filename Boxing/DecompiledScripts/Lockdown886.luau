return function(v0) --[[ Line: 2 ]] --[[ Name: Lockdown ]]
    for v1 in v0 do
        v0[v1] = nil;
    end;
    setmetatable(v0, {
        __index = function(_, v3) --[[ Line: 8 ]] --[[ Name: __index ]]
            error(("Attempted to read key from a locked down table: %*"):format(v3), 2);
        end
    });
    table.freeze(v0);
end;