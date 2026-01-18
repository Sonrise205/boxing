local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
return {
    add = function(v1, v2) --[[ Line: 5 ]] --[[ Name: add ]]
        -- upvalues: l_ReplicatedStorage_0 (copy)
        if not l_ReplicatedStorage_0:FindFirstChild(v1.Name) then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = v1.Name;
            l_Folder_0.Parent = l_ReplicatedStorage_0;
        end;
        v2.Parent = l_ReplicatedStorage_0:FindFirstChild(v1.Name);
    end, 
    get = function(v4, v5) --[[ Line: 15 ]] --[[ Name: get ]]
        -- upvalues: l_ReplicatedStorage_0 (copy)
        if l_ReplicatedStorage_0:FindFirstChild(v4.Name) ~= nil then
            return (l_ReplicatedStorage_0[v4.Name]:FindFirstChild(v5));
        else
            return nil;
        end;
    end, 
    waitForInstance = function(v6, v7, v8) --[[ Line: 21 ]] --[[ Name: waitForInstance ]]
        -- upvalues: l_ReplicatedStorage_0 (copy)
        return l_ReplicatedStorage_0:WaitForChild(v6.Name):WaitForChild(v7, v8 or 1);
    end
};