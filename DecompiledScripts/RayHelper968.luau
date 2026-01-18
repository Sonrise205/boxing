local l_Workspace_0 = game:GetService("Workspace");
local l_CollectionService_0 = game:GetService("CollectionService");
return {
    GetRayWithWhiteList = function(_, v3, v4, v5, v6) --[[ Line: 6 ]] --[[ Name: GetRayWithWhiteList ]]
        local v7 = Ray.new(v3, CFrame.new(v3, v4).LookVector * v5);
        local l_workspace_PartOnRayWithWhitelist_0, v9, v10 = workspace:FindPartOnRayWithWhitelist(v7, v6);
        return l_workspace_PartOnRayWithWhitelist_0, v9, v10;
    end, 
    GetCharactersExcept = function(_, v12) --[[ Line: 13 ]] --[[ Name: GetCharactersExcept ]]
        -- upvalues: l_Workspace_0 (copy)
        local v13 = {};
        for _, v15 in l_Workspace_0.Live:GetChildren() do
            if not v12 or not table.find(v12, v15) then
                table.insert(v13, v15);
            end;
        end;
        return v13;
    end, 
    GetEnvironmentWhitelist = function(_) --[[ Line: 24 ]] --[[ Name: GetEnvironmentWhitelist ]]
        -- upvalues: l_Workspace_0 (copy), l_CollectionService_0 (copy)
        local v17 = {
            l_Workspace_0:FindFirstChild("Misc"), 
            l_Workspace_0:FindFirstChild("Rings"), 
            l_Workspace_0:FindFirstChild("Base")
        };
        for _, v19 in (l_CollectionService_0:GetTagged("Map")) do
            table.insert(v17, v19);
        end;
        return v17;
    end
};