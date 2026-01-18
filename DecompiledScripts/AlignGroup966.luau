local v0 = RaycastParams.new();
v0.FilterType = Enum.RaycastFilterType.Include;
v0.FilterDescendantsInstances = {
    workspace:FindFirstChild("Rings"), 
    workspace:FindFirstChild("Base")
};
return function(v1, v2, v3) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    if v2 then
        v1:PivotTo(v2);
    end;
    local v4 = {};
    for _, v6 in v1:GetDescendants() do
        if v6:IsA("BasePart") and v6:GetAttribute("Ground") then
            local v7 = workspace:Raycast(v6.Position + Vector3.new(0, 2, 0, 0), Vector3.new(-0, -10, -0, -0), v0);
            if not v7 and v3 then
                v6:Destroy();
            elseif v7 then
                v6.CFrame = v6.CFrame - v6.Position + v7.Position;
            else
                v4[v6] = v7 ~= nil;
            end;
        end;
    end;
    return v1, v4;
end;