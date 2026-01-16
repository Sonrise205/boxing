local function _(v0) --[[ Line: 1 ]] --[[ Name: HandleLimb ]]
    v0:GetPropertyChangedSignal("Transparency"):Connect(function() --[[ Line: 2 ]]
        -- upvalues: v0 (copy)
        if v0.Transparency ~= 1 then
            task.defer(function() --[[ Line: 4 ]]
                -- upvalues: v0 (ref)
                v0.Transparency = 1;
            end);
        end;
    end);
end;
for _, v3 in script.Parent:GetChildren() do
    if v3:IsA("BasePart") then
        v3:GetPropertyChangedSignal("Transparency"):Connect(function() --[[ Line: 2 ]]
            -- upvalues: v3 (copy)
            if v3.Transparency ~= 1 then
                task.defer(function() --[[ Line: 4 ]]
                    -- upvalues: v3 (ref)
                    v3.Transparency = 1;
                end);
            end;
        end);
    end;
end;
script.Parent.ChildAdded:Connect(function(v4) --[[ Line: 17 ]]
    if v4:IsA("BasePart") then
        v4:GetPropertyChangedSignal("Transparency"):Connect(function() --[[ Line: 2 ]]
            -- upvalues: v4 (copy)
            if v4.Transparency ~= 1 then
                task.defer(function() --[[ Line: 4 ]]
                    -- upvalues: v4 (ref)
                    v4.Transparency = 1;
                end);
            end;
        end);
    end;
end);