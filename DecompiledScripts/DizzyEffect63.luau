local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Lighting_0 = game:GetService("Lighting");
local l_LocalPlayer_0 = game.Players.LocalPlayer;
local l_Parent_0 = script.Parent;
local v5 = Random.new();
local l_Common_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local l_ReplicatedStorage_1 = game:GetService("ReplicatedStorage");
local l_Character_0 = game.Players.LocalPlayer.Character;
local v10 = require(l_ReplicatedStorage_1.CameraShaker);
local _ = workspace.CurrentCamera;
local v12 = workspace.States:WaitForChild(l_LocalPlayer_0.Name, 10);
local v13 = v12:WaitForChild("CharacterData", 10);
local _ = v12:WaitForChild("PlayerData", 10);
local _ = v13:WaitForChild("Opponent", 10);
local function _(v16, v17, v18) --[[ Line: 24 ]] --[[ Name: Lerp ]]
    return v16 + (v17 - v16) * v18;
end;
local v20 = 0;
local v21 = 0;
local v22 = nil;
UpdateShake = function(v23) --[[ Line: 31 ]] --[[ Name: UpdateShake ]]
    -- upvalues: v22 (ref), v13 (copy), l_Character_0 (copy), v20 (ref), v21 (ref)
    workspace.DizzyOffset.Value = v23;
    if not v22 then
        return;
    else
        local _, v25 = game:GetService("RunService").Stepped:Wait();
        v25 = math.min(v25, 1);
        local v26 = 1 - v13.Health.Value / v13.MaxHealth.Value;
        local v27 = math.clamp(l_Character_0.PrimaryPart.AssemblyLinearVelocity.Magnitude / 10, 0, 1) * 0.6;
        local l_v20_0 = v20;
        local v29 = 0 + 0.8 * v26 + v27;
        local v30 = v25 * 1.2;
        v20 = l_v20_0 + (v29 - l_v20_0) * v30;
        local v31 = (v20 + 1.4) * v21;
        v29 = v21;
        v30 = l_Character_0:GetAttribute("Dizzy") or 0;
        local v32 = v25 * 3;
        v21 = v29 + (v30 - v29) * v32;
        if v22 then
            v22:SetScaleMagnitude(v31);
        end;
        return;
    end;
end;
local v33 = v10.new(Enum.RenderPriority.Camera.Value + 9, UpdateShake);
v33:Start();
local l_DizzyBlur_0 = l_Lighting_0:FindFirstChild("DizzyBlur");
if not l_DizzyBlur_0 then
    l_DizzyBlur_0 = Instance.new("BlurEffect");
    l_DizzyBlur_0.Name = "DizzyBlur";
    l_DizzyBlur_0.Enabled = true;
    l_DizzyBlur_0.Size = 0;
    l_DizzyBlur_0.Parent = l_Lighting_0;
end;
local l_DizzyCorrection_0 = l_Lighting_0:FindFirstChild("DizzyCorrection");
if not l_DizzyCorrection_0 then
    l_DizzyCorrection_0 = Instance.new("ColorCorrectionEffect");
    l_DizzyCorrection_0.Name = "DizzyCorrection";
    l_DizzyCorrection_0.Saturation = 0;
    l_DizzyCorrection_0.Contrast = 0;
    l_DizzyCorrection_0.Enabled = true;
    l_DizzyCorrection_0.Parent = l_Lighting_0;
end;
local v36 = nil;
local v37 = nil;
local function _() --[[ Line: 79 ]] --[[ Name: EndShake ]]
    -- upvalues: v22 (ref)
    if v22 then
        v22:StartFadeOut(0.5);
    end;
    v22 = nil;
end;
local function _() --[[ Line: 84 ]] --[[ Name: StartShake ]]
    -- upvalues: v22 (ref), v33 (copy), v10 (copy)
    if v22 then
        v22:StartFadeOut(0.5);
    end;
    v22 = nil;
    v22 = v33:ShakeSustain(v10.Presets.Dizzy);
end;
UpdateDizzy = function(v40) --[[ Line: 89 ]] --[[ Name: UpdateDizzy ]]
    -- upvalues: v22 (ref), v36 (ref), l_Character_0 (copy), v33 (copy), v10 (copy), v37 (ref), l_Common_0 (copy), v5 (copy), l_TweenService_0 (copy), l_DizzyBlur_0 (ref), l_DizzyCorrection_0 (ref)
    if v40 and v22 then
        return;
    else
        local v41 = tick();
        v36 = v41;
        local l_l_Character_0_Attribute_0 = l_Character_0:GetAttribute("Dizzy");
        if v40 then
            if v22 then
                v22:StartFadeOut(0.5);
            end;
            v22 = nil;
            v22 = v33:ShakeSustain(v10.Presets.Dizzy);
            v37 = script.Vignette:Clone();
            v37.Name = "Dizzy";
            v37.Parent = l_Common_0;
            while v36 == v41 and l_l_Character_0_Attribute_0 do
                local v43 = v5:NextNumber(2.5, 4);
                local v44 = tick() - l_Character_0:GetAttribute("LastDizzyUpdate") < 0.1;
                local v45 = TweenInfo.new(v43, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut);
                local v46 = 0;
                local v47 = v5:NextNumber(10, 17) * l_l_Character_0_Attribute_0;
                if v44 then
                    v45 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                    v46 = 0.1;
                    v47 = v47 * 1.25;
                end;
                l_TweenService_0:Create(l_DizzyBlur_0, v45, {
                    Size = v47
                }):Play();
                l_TweenService_0:Create(v37, v45, {
                    ImageTransparency = math.max(1 - v47 / 20, v46)
                }):Play();
                l_TweenService_0:Create(l_DizzyCorrection_0, v45, {
                    Contrast = 0.2, 
                    Saturation = -0.1
                }):Play();
                task.wait(v43);
                if v36 ~= v41 then
                    return;
                else
                    local v48 = v5:NextNumber(1.5, 3.5);
                    local v49 = TweenInfo.new(v5:NextNumber(2, 4), Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                    l_TweenService_0:Create(l_DizzyBlur_0, v49, {
                        Size = 7 * l_l_Character_0_Attribute_0
                    }):Play();
                    l_TweenService_0:Create(v37, v49, {
                        ImageTransparency = 0.95 + -0.09999999999999998 * math.clamp(l_l_Character_0_Attribute_0, 0, 1)
                    }):Play();
                    l_TweenService_0:Create(l_DizzyCorrection_0, v49, {
                        Contrast = 0.05, 
                        Saturation = 0
                    }):Play();
                    task.wait(v48 + 4);
                end;
            end;
        else
            if v22 then
                v22:StartFadeOut(0.5);
            end;
            v22 = nil;
            local v50 = TweenInfo.new(4.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            l_TweenService_0:Create(l_DizzyBlur_0, v50, {
                Size = 0
            }):Play();
            l_TweenService_0:Create(l_DizzyCorrection_0, v50, {
                Contrast = 0, 
                Saturation = 0
            }):Play();
            if v37 then
                l_TweenService_0:Create(v37, v50, {
                    ImageTransparency = 1
                }):Play();
            end;
            task.wait(5);
            if v37 and not l_Character_0:GetAttribute("Dizzy") then
                v37:Destroy();
                v37 = nil;
            end;
        end;
        return;
    end;
end;
l_Parent_0:GetAttributeChangedSignal("Dizzy"):Connect(function() --[[ Line: 155 ]]
    -- upvalues: l_Parent_0 (copy)
    UpdateDizzy(l_Parent_0:GetAttribute("Dizzy"));
end);
UpdateDizzyItems = function(v51) --[[ Line: 159 ]] --[[ Name: UpdateDizzyItems ]]
    -- upvalues: v22 (ref), v33 (copy), v10 (copy)
    if v51 then
        if not v22 then
            if v22 then
                v22:StartFadeOut(0.5);
            end;
            v22 = nil;
            v22 = v33:ShakeSustain(v10.Presets.Dizzy);
            return;
        end;
    else
        if v22 then
            v22:StartFadeOut(0.5);
        end;
        v22 = nil;
    end;
end;
v13.Cutscene.Changed:Connect(function(v52) --[[ Line: 169 ]]
    UpdateDizzy(not v52);
end);
v13.Equipped.Changed:Connect(function(_) --[[ Line: 173 ]]
    -- upvalues: l_Parent_0 (copy)
    l_Parent_0:SetAttribute("Dizzy", nil);
end);
v13.Opponent.Changed:Connect(function(_) --[[ Line: 178 ]]
    -- upvalues: l_Parent_0 (copy)
    l_Parent_0:SetAttribute("Dizzy", nil);
end);