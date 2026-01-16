local l_Debris_0 = game:GetService("Debris");
local l_Modules_0 = game:GetService("ReplicatedStorage").Modules;
local v2 = require(l_Modules_0.MeshEmit);
local v12 = {
    toggleAllEmitters = function(v3, v4) --[[ Line: 11 ]] --[[ Name: toggleAllEmitters ]]
        for _, v6 in v3:GetDescendants() do
            if v6:IsA("ParticleEmitter") then
                v6.Enabled = v4 or false;
            end;
        end;
    end, 
    toggleAllTrails = function(v7, v8) --[[ Line: 19 ]] --[[ Name: toggleAllTrails ]]
        for _, v10 in v7:GetDescendants() do
            if v10:IsA("Trail") then
                v10.Enabled = v8 or false;
            end;
        end;
    end, 
    emitOne = function(v11) --[[ Line: 27 ]] --[[ Name: emitOne ]]
        if not v11:IsA("ParticleEmitter") then
            return;
        elseif v11:GetAttribute("EmitDelay") then
            task.spawn(function() --[[ Line: 33 ]]
                -- upvalues: v11 (copy)
                task.wait(v11:GetAttribute("EmitDelay"));
                v11:Emit(v11:GetAttribute("EmitCount") or 0);
            end);
            return;
        else
            v11:Emit(v11:GetAttribute("EmitCount") or 0);
            return;
        end;
    end
};
v12.doEmitCount = function(v13) --[[ Line: 42 ]] --[[ Name: doEmitCount ]]
    -- upvalues: v12 (copy)
    for _, v15 in v13:GetDescendants() do
        if v15:IsA("ParticleEmitter") then
            v12.emitOne(v15);
        end;
    end;
end;
v12.MeshHandler = function(v16, v17) --[[ Line: 52 ]] --[[ Name: MeshHandler ]]
    -- upvalues: l_Debris_0 (copy), v2 (copy)
    for _, v19 in v17 do
        local v20 = v19.mesh:Clone();
        v20.Parent = workspace.VFX;
        v20:PivotTo(v16 * v19.offset);
        l_Debris_0:AddItem(v20, 1);
        v2(v20.Start);
    end;
end;
v12.weld = function(v21, v22, v23) --[[ Line: 63 ]] --[[ Name: weld ]]
    local l_WeldConstraint_0 = Instance.new("WeldConstraint");
    l_WeldConstraint_0.Part0 = v21;
    l_WeldConstraint_0.Part1 = v22;
    l_WeldConstraint_0.Parent = v23 or v22;
    return l_WeldConstraint_0;
end;
return v12;