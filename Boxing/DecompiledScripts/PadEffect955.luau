local _ = game:GetService("Players");
local l_Workspace_0 = game:GetService("Workspace");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("ReplicatedFirst");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("ReplicatedStorage");
local l_Places_0 = require(game.ReplicatedFirst:WaitForChild("Places"));
local v8 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
if game.PlaceId ~= l_Places_0.Main then
    task.wait(5);
end;
local v9 = l_Workspace_0:WaitForChild("Rings", 30);
if not v9 then
    return;
else
    local function _(v10, v11, v12) --[[ Line: 22 ]] --[[ Name: Lerp ]]
        return v10 + (v11 - v10) * v12;
    end;
    local v14 = not l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.TouchEnabled;
    local v15 = v14 and Color3.fromRGB(161, 233, 255) or Color3.fromRGB(137, 194, 255);
    local v16 = Color3.fromRGB(96, 255, 52);
    PadChanged = function(v17, v18) --[[ Line: 30 ]] --[[ Name: PadChanged ]]
        -- upvalues: v16 (copy), v15 (copy), v14 (copy), l_TweenService_0 (copy), v8 (copy)
        local l_Effect_0 = v17.Base:FindFirstChild("Effect");
        if not l_Effect_0 then
            return;
        else
            local l_Value_0 = v18.Value;
            local v21 = l_Value_0 and v16 or v15;
            for _, v23 in l_Effect_0:GetDescendants() do
                if v23:IsA("Beam") or v23:IsA("ParticleEmitter") then
                    local l_Value_1 = v23.Color.Keypoints[1].Value;
                    local l_Brightness_0 = v23.Brightness;
                    local l_FirstChild_0 = script.Beams:FindFirstChild(v23.Name);
                    local l_Brightness_1 = l_FirstChild_0.Brightness;
                    local v28 = v23:IsA("Beam") and v23.TextureSpeed;
                    local v29 = v28 and l_FirstChild_0.TextureSpeed;
                    if l_Value_0 then
                        l_Brightness_1 = l_Brightness_1 * (v14 and 0.75 or 0.9);
                        if v29 then
                            v29 = v29 * 1.3;
                        end;
                    else
                        l_Brightness_1 = l_Brightness_1 * (v14 and 0.5 or 0.55);
                        if v29 then
                            v29 = v29 * 0.32;
                        end;
                    end;
                    do
                        local l_l_Brightness_1_0, l_v29_0 = l_Brightness_1, v29;
                        task.defer(function() --[[ Line: 66 ]]
                            -- upvalues: l_Value_0 (copy), v18 (copy), l_TweenService_0 (ref), v23 (copy), l_Value_1 (copy), v21 (copy), l_Brightness_0 (copy), l_l_Brightness_1_0 (ref), v28 (copy), l_v29_0 (ref)
                            for v32 = 1, 100 do
                                if l_Value_0 == v18.Value then
                                    local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v32 / 100, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                                    v23.Color = ColorSequence.new(l_Value_1:Lerp(v21, l_l_TweenService_0_Value_0));
                                    local l_v23_0 = v23;
                                    local l_l_Brightness_0_0 = l_Brightness_0;
                                    l_v23_0.Brightness = l_l_Brightness_0_0 + (l_l_Brightness_1_0 - l_l_Brightness_0_0) * l_l_TweenService_0_Value_0;
                                    if v28 then
                                        l_v23_0 = v23;
                                        l_l_Brightness_0_0 = v28;
                                        l_v23_0.TextureSpeed = l_l_Brightness_0_0 + (l_v29_0 - l_l_Brightness_0_0) * l_l_TweenService_0_Value_0;
                                    end;
                                    task.wait();
                                else
                                    break;
                                end;
                            end;
                        end);
                    end;
                elseif v23:IsA("ImageLabel") then
                    l_TweenService_0:Create(v23, v8, {
                        ImageColor3 = v21
                    }):Play();
                end;
            end;
            return;
        end;
    end;
    for _, v37 in v9:GetChildren() do
        local l_Pad1_0 = v37.Pad1;
        local l_Pad2_0 = v37.Pad2;
        PadChanged(l_Pad1_0, l_Pad1_0.IsActive);
        PadChanged(l_Pad2_0, l_Pad2_0.IsActive);
        l_Pad1_0.IsActive.Changed:Connect(function(_) --[[ Line: 98 ]]
            -- upvalues: l_Pad1_0 (copy)
            PadChanged(l_Pad1_0, l_Pad1_0.IsActive);
        end);
        l_Pad2_0.IsActive.Changed:Connect(function(_) --[[ Line: 102 ]]
            -- upvalues: l_Pad2_0 (copy)
            PadChanged(l_Pad2_0, l_Pad2_0.IsActive);
        end);
    end;
    return;
end;