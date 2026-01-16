return function(v0, _) --[[ Line: 1 ]]
    local l_info_0 = v0:FindFirstChild("info");
    local l_goal_0 = v0:FindFirstChild("goal");
    local v4 = {};
    if not l_info_0 then
        warn("no info");
        return;
    elseif not l_goal_0 then
        warn("no goal");
        return;
    else
        local function v7(v5) --[[ Line: 16 ]] --[[ Name: createinfo ]]
            -- upvalues: l_info_0 (copy)
            local v6 = v5:FindFirstChild("info") and v5:FindFirstChild("info"):GetAttributes() or l_info_0:GetAttributes();
            return TweenInfo.new(v6.time, Enum.EasingStyle[v6.style], Enum.EasingDirection[v6.direction], tonumber(v6.Repeat), v6.reverse, (tonumber(v6.delay)));
        end;
        for _, v9 in l_goal_0:GetChildren() do
            if not v9:IsA("Folder") then
                return;
            else
                local v10 = v7(v9);
                local v11 = (not (v9.Name ~= "Part") or v9.Name == "MeshPart") and v9:GetAttributes();
                if v11 and v9:GetAttribute("CFrame") then
                    v11.CFrame = v0.CFrame * v11.CFrame;
                end;
                local v12 = game.TweenService:Create(v0:FindFirstChildOfClass(v9.Name) or v0, v10, not v0:FindFirstChildOfClass(v9.Name) and v11 or v9:GetAttributes());
                v4[v9.Name .. "Tween"] = {
                    Tween = v12, 
                    Instance = v0
                };
            end;
        end;
        return {
            tweens = v4, 
            play = function() --[[ Line: 41 ]] --[[ Name: play ]]
                -- upvalues: v4 (copy)
                for _, v14 in v4 do
                    local l_Tween_0 = v14.Tween;
                    local l_Instance_0 = v14.Instance;
                    l_Tween_0:Play();
                    l_Instance_0:SetAttribute("Pause", false);
                    l_Instance_0:GetAttributeChangedSignal("Cancel"):Connect(function() --[[ Line: 50 ]]
                        -- upvalues: l_Tween_0 (copy)
                        l_Tween_0:Cancel();
                    end);
                    l_Instance_0:GetAttributeChangedSignal("Pause"):Connect(function() --[[ Line: 54 ]]
                        -- upvalues: l_Instance_0 (copy), l_Tween_0 (copy)
                        if l_Instance_0:GetAttribute("Pause") then
                            l_Tween_0:Pause();
                            return;
                        else
                            l_Tween_0:Play();
                            return;
                        end;
                    end);
                end;
            end
        };
    end;
end;