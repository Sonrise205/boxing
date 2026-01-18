return function(v0) --[[ Line: 2 ]]
    local l_Chararacter_0 = v0.Chararacter;
    local v2 = v0.Anchored or true;
    local v3 = (v0.Change or {}).RemoveAll or false;
    local function v12(v4) --[[ Line: 13 ]] --[[ Name: RemoveAll_Function ]]
        -- upvalues: v3 (copy), v0 (copy)
        if v3 then
            local v5 = v0.Change.Color or Color3.fromRGB(0, 0, 0);
            local v6 = v0.Change.Material or "Neon";
            local v7 = v0.Change.Transparency or 0;
            for _, v9 in v4:GetDescendants() do
                if v9:IsA("MeshPart") then
                    v9.TextureID = "";
                end;
                if v9:IsA("SpecialMesh") then
                    v9.TextureId = "";
                end;
                if v9:IsA("SurfaceAppearance") or v9:IsA("Decal") then
                    v9:Destroy();
                end;
                if v9:IsA("BodyColors") then
                    for _, v11 in ipairs(Enum.BodyPart:GetEnumItems()) do
                        v9[v11.Name .. "Color3"] = v5;
                    end;
                end;
                if v9:IsA("BasePart") then
                    if string.match(v9.Name, "HumanoidRootPart") or v9:GetAttribute("TransparencyLock") then
                        return;
                    else
                        v9.CanCollide = false;
                        v9.Color = v5;
                        v9.Material = v6;
                        v9.Transparency = v7;
                    end;
                end;
            end;
        end;
    end;
    local function v16(v13) --[[ Line: 52 ]] --[[ Name: Anchored_Function ]]
        -- upvalues: v2 (copy)
        if v2 == true then
            for _, v15 in pairs(v13:GetDescendants()) do
                if v15:IsA("BasePart") then
                    v15.CanCollide = false;
                    v15.CollisionGroup = "Visuals";
                    v15.Anchored = true;
                end;
            end;
        end;
    end;
    l_Chararacter_0.Archivable = true;
    local v17 = l_Chararacter_0:Clone();
    v17.Parent = workspace.Effects;
    v17.Name = l_Chararacter_0.Name .. "Clone";
    if v17:FindFirstChildOfClass("Humanoid") then
        v17:FindFirstChildOfClass("Humanoid").DisplayDistanceType = "None";
    end;
    if v0.ReturnDummy then
        return v17;
    else
        if v17:FindFirstChildOfClass("Humanoid") then
            v17:FindFirstChildOfClass("Humanoid"):Destroy();
        end;
        local l_AnimationController_0 = Instance.new("AnimationController");
        l_AnimationController_0.Parent = v17;
        Instance.new("Animator", l_AnimationController_0);
        if v2 then
            v16(v17);
        end;
        if v3 then
            v12(v17);
        end;
        return v17;
    end;
end;