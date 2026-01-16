local l_Effects_0 = script:WaitForChild("Effects");
return {
    ApplyEffect = function(v1, v2) --[[ Line: 5 ]] --[[ Name: ApplyEffect ]]
        -- upvalues: l_Effects_0 (copy)
        if not v2 then
            return;
        else
            local l_l_Effects_0_FirstChild_0 = l_Effects_0:FindFirstChild(v2);
            if not l_l_Effects_0_FirstChild_0 then
                return;
            else
                local l_Effect_0 = v1:FindFirstChild("Effect");
                if l_Effect_0 then
                    l_Effect_0.Value = v2;
                else
                    l_Effect_0 = Instance.new("StringValue");
                    l_Effect_0.Name = "Effect";
                    l_Effect_0.Parent = v1;
                    l_Effect_0.Value = v2;
                end;
                for _, v6 in v1:GetDescendants() do
                    if v6.Name == "UnusualParticle" then
                        v6:Destroy();
                    end;
                end;
                local function v12(v7) --[[ Line: 28 ]] --[[ Name: GetLargestPart ]]
                    local v8 = 0;
                    local v9 = nil;
                    for _, v11 in v7:GetDescendants() do
                        if v11:IsA("BasePart") then
                            if v8 < v11.Size.Magnitude then
                                v8 = v11.Size.Magnitude;
                                v9 = v11;
                            end;
                            if v11.Name == "Target" then
                                return v11;
                            end;
                        end;
                    end;
                    return v9;
                end;
                local v13 = v12(v1.LeftLowerArm);
                local v14 = v12(v1.RightLowerArm);
                for _, v16 in l_l_Effects_0_FirstChild_0:GetChildren() do
                    v16:Clone().Parent = v13;
                    v16:Clone().Parent = v14;
                end;
                for _, v18 in v1:GetDescendants() do
                    if v18:IsA("ParticleEmitter") then
                        v18.Name = "UnusualParticle";
                    end;
                end;
                return;
            end;
        end;
    end
};