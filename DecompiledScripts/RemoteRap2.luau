return {
    Fire = function(v0, ...) --[[ Line: 3 ]] --[[ Name: Fire ]]
        if not v0 then
            return;
        else
            v0:FireServer(...);
            return;
        end;
    end
};