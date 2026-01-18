local l_Players_0 = game:GetService("Players");
local _ = game:GetService("HttpService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = l_Players_0.LocalPlayer;
local v6 = TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local v7 = TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
local l_Catalog_0 = l_ReplicatedStorage_0:WaitForChild("Catalog");
local l_SearchHelper_0 = require(l_Catalog_0:WaitForChild("SearchHelper"));
local l_ByteNetPackets_0 = require(l_Catalog_0:WaitForChild("ByteNetPackets"));
local l_Parent_0 = script.Parent;
local l_SelectFrame_0 = l_Parent_0:WaitForChild("SelectFrame");
local l_All_0 = l_SelectFrame_0:WaitForChild("All");
local l_ColorButton_0 = l_Parent_0:WaitForChild("ColorFrame"):WaitForChild("ColorButton");
local l_l_All_0_0 = l_All_0;
local v16 = nil;
local l_Modules_0 = l_ReplicatedStorage_0:FindFirstChild("Modules");
if l_Modules_0:FindFirstChild("SoundHelper") then
    v16 = require(l_Modules_0.SoundHelper);
end;
PlayPressSound = function() --[[ Line: 34 ]] --[[ Name: PlayPressSound ]]
    -- upvalues: v16 (ref)
    if v16 then
        v16:PlaySound({
            Name = "CatalogPress", 
            Parent = workspace.Debris, 
            Speed = math.random(140, 150) / 100
        });
    end;
end;
PlayPopSound = function() --[[ Line: 44 ]] --[[ Name: PlayPopSound ]]
    -- upvalues: v16 (ref)
    if v16 then
        v16:PlaySound({
            Name = "CatalogPop", 
            Parent = workspace.Debris
        });
    end;
end;
PlayInteractSound = function() --[[ Line: 53 ]] --[[ Name: PlayInteractSound ]]
    -- upvalues: v16 (ref)
    if v16 then
        v16:PlaySound({
            Name = "CatalogInteract", 
            Parent = workspace.Debris, 
            Speed = math.random(140, 150) / 100
        });
    end;
end;
for _, v19 in {
    "Head", 
    "Torso", 
    "Left Arm", 
    "Right Arm", 
    "Left Leg", 
    "Right Leg"
} do
    local v20 = l_All_0:Clone();
    v20.Name = l_SearchHelper_0.BodyPartOptionsToNumber[string.gsub(v19, " ", "") .. "Color"];
    v20.TextLabel.Text = v19;
    v20.Parent = l_All_0.Parent;
end;
l_All_0.Name = "1";
for _, v22 in l_SelectFrame_0:GetChildren() do
    if v22:IsA("TextButton") then
        if v22 == l_l_All_0_0 then
            v22.Circle.Main.ImageTransparency = 0;
        end;
        v22.MouseButton1Down:Connect(function() --[[ Line: 80 ]]
            -- upvalues: v22 (copy), l_l_All_0_0 (ref), l_TweenService_0 (copy), v6 (copy)
            if v22 == l_l_All_0_0 then
                return;
            else
                PlayPressSound();
                if l_l_All_0_0 then
                    l_TweenService_0:Create(l_l_All_0_0.Circle.Main, v6, {
                        ImageTransparency = 1
                    }):Play();
                end;
                l_TweenService_0:Create(v22.Circle.Main, v6, {
                    ImageTransparency = 0
                }):Play();
                l_l_All_0_0 = v22;
                return;
            end;
        end);
    end;
end;
for _, v24 in game:GetService("HttpService"):JSONDecode(l_SearchHelper_0.AvatarRules).bodyColorsPalette do
    local v25 = l_ColorButton_0:Clone();
    local l_brickColorId_0 = v24.brickColorId;
    v25.Name = l_brickColorId_0;
    local l_Color_0 = BrickColor.new(l_brickColorId_0).Color;
    v25.ImageColor3 = l_Color_0;
    v25.Parent = l_ColorButton_0.Parent;
    local v28 = l_Color_0:Lerp(Color3.fromRGB(255, 255, 255), 0.1);
    v25.MouseButton1Down:Connect(function() --[[ Line: 110 ]]
        -- upvalues: l_l_All_0_0 (ref), l_ByteNetPackets_0 (copy), l_brickColorId_0 (copy)
        PlayPressSound();
        local v29 = tonumber(l_l_All_0_0.Name);
        if not v29 then
            return;
        else
            l_ByteNetPackets_0.UpdateBodyColor.send({
                target = v29, 
                colorId = l_brickColorId_0
            });
            return;
        end;
    end);
    v25.MouseEnter:Connect(function() --[[ Line: 122 ]]
        -- upvalues: l_TweenService_0 (copy), v25 (copy), v7 (copy), v28 (copy)
        PlayPopSound();
        l_TweenService_0:Create(v25, v7, {
            ImageColor3 = v28
        }):Play();
    end);
    v25.MouseLeave:Connect(function() --[[ Line: 127 ]]
        -- upvalues: l_TweenService_0 (copy), v25 (copy), v7 (copy), l_Color_0 (copy)
        l_TweenService_0:Create(v25, v7, {
            ImageColor3 = l_Color_0
        }):Play();
    end);
end;
l_ColorButton_0:Destroy();