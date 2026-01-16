return function(v0, v1) --[[ Line: 1 ]]
    for _, v3 in v0:GetDescendants() do
        if v3:IsA("ParticleEmitter") then
            v3.Enabled = v1;
        end;
    end;
end;