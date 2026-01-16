local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local l_GameplaySettings_0 = l_Styles_0.GameplaySettings;
if not l_Places_0:IsTesting() then
    return;
else
    local l_DebugMode_0 = l_GameplaySettings_0.DebugMode;
    if not l_DebugMode_0 then
        return;
    else
        local l_CommonUtilities_0 = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
        print("DebugModeActive");
        local function v24(v8) --[[ Line: 19 ]] --[[ Name: DebugCharacter ]]
            -- upvalues: l_CommonUtilities_0 (copy), l_DebugMode_0 (copy)
            local v9 = l_CommonUtilities_0.GetCharacterData(v8);
            local v10 = l_CommonUtilities_0.GetPlayerData(v8);
            local v11 = l_CommonUtilities_0.GetOccupied(v8);
            if not v9 or not v10 or not v11 then
                return;
            elseif not v8.PrimaryPart then
                return;
            elseif v8.PrimaryPart:FindFirstChild("DebugRender") then
                return;
            else
                local v12 = Instance.new("BillboardGui", v8.PrimaryPart);
                v12.Name = "DebugRender";
                v12.AlwaysOnTop = true;
                v12.Size = UDim2.fromScale(10, 10);
                local v13 = Instance.new("Frame", v12);
                v13.Size = UDim2.fromScale(1, 1);
                v13.BackgroundTransparency = 1;
                local v14 = Instance.new("UIListLayout", v13);
                v14.FillDirection = Enum.FillDirection.Vertical;
                v14.VerticalAlignment = Enum.VerticalAlignment.Center;
                v14.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                local function v18(v15, v16) --[[ Line: 42 ]] --[[ Name: DebugRender ]]
                    -- upvalues: l_DebugMode_0 (ref), v13 (copy)
                    if not l_DebugMode_0 then
                        return;
                    else
                        local l_v13_FirstChild_0 = v13:FindFirstChild(v15);
                        if not l_v13_FirstChild_0 then
                            l_v13_FirstChild_0 = Instance.new("TextLabel", v13);
                            l_v13_FirstChild_0.Name = v15;
                            l_v13_FirstChild_0.Size = UDim2.fromScale(1, 0.03);
                            l_v13_FirstChild_0.TextColor3 = Color3.new(1, 1, 1);
                            l_v13_FirstChild_0.TextStrokeColor3 = Color3.new(0, 0, 0);
                            l_v13_FirstChild_0.TextStrokeTransparency = 0.5;
                            l_v13_FirstChild_0.BackgroundTransparency = 1;
                            l_v13_FirstChild_0.TextXAlignment = Enum.TextXAlignment.Center;
                            l_v13_FirstChild_0.TextYAlignment = Enum.TextYAlignment.Center;
                        end;
                        l_v13_FirstChild_0.Text = ("%* : %*"):format(v15, (tostring(v16 or "NIL")));
                        return;
                    end;
                end;
                v9.PerfectDodgeMeter.Changed:Connect(function(v19) --[[ Line: 62 ]]
                    -- upvalues: v18 (copy)
                    v18("Perfect Dodge Meter", (math.ceil(v19)));
                end);
                v9.Adrenaline.Changed:Connect(function(v20) --[[ Line: 66 ]]
                    -- upvalues: v18 (copy)
                    v18("Adrenaline", v20);
                end);
                v8:GetAttributeChangedSignal("DoubleDashing"):Connect(function(_) --[[ Line: 70 ]]
                    -- upvalues: v18 (copy), v8 (copy)
                    v18("Double Dashing", v8:GetAttribute("DoubleDashing") and "true" or "false");
                end);
                task.spawn(function() --[[ Line: 74 ]]
                    -- upvalues: v11 (copy), v8 (copy), v18 (copy)
                    while task.wait(0.016666666666666666) do
                        local l_Value_0 = v11.LockedOn.Value;
                        local v23 = 0;
                        if l_Value_0 and l_Value_0.PrimaryPart then
                            v23 = (v8.PrimaryPart.Position - l_Value_0.PrimaryPart.Position).Magnitude;
                        end;
                        v18("Distance to Opponent", math.round(v23 * 100) / 100);
                    end;
                end);
                return;
            end;
        end;
        workspace.Live.ChildAdded:Connect(function(v25) --[[ Line: 88 ]]
            -- upvalues: v24 (copy)
            v24(v25);
        end);
        for _, v27 in workspace.Live:GetChildren() do
            v24(v27);
        end;
        return;
    end;
end;