local v0 = {};
return {
    AddSelfTween = function(v1) --[[ Line: 5 ]] --[[ Name: AddSelfTween ]]
        -- upvalues: v0 (ref)
        table.insert(v0, v1);
    end, 
    StopSelfTweens = function() --[[ Line: 9 ]] --[[ Name: StopSelfTweens ]]
        -- upvalues: v0 (ref)
        for _, v3 in v0 do
            v3:Pause();
        end;
        v0 = {};
    end
};