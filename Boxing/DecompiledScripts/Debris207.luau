local v0 = {
    Removing = {}
};
v0.AddItem = function(_, v2, v3) --[[ Line: 4 ]] --[[ Name: AddItem ]]
    -- upvalues: v0 (copy)
    v0.Removing[v2] = true;
    task.delay(v3, function() --[[ Line: 7 ]]
        -- upvalues: v2 (copy), v0 (ref)
        if not v2:IsDescendantOf(game) then
            return;
        elseif not v0.Removing[v2] then
            return;
        else
            v0.Removing[v2] = nil;
            v2:Destroy();
            return;
        end;
    end);
end;
v0.RemoveItem = function(_, v5) --[[ Line: 16 ]] --[[ Name: RemoveItem ]]
    -- upvalues: v0 (copy)
    if not v0.Removing[v5] then
        return;
    else
        v0.Removing[v5] = nil;
        return;
    end;
end;
return v0;