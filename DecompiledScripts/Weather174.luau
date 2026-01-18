local l_Lighting_0 = game:GetService("Lighting");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
if game.PlaceId ~= l_Places_0.Trading then
    return;
else
    require(game.ReplicatedStorage.WindShake):Init({
        MatchWorkspaceWind = true
    });
    local v5 = require(script.Rain);
    v5:SetDirection((Vector3.new(-0.30000001192092896, -1, -0.4000000059604645, 0)));
    v5:SetTransparency(0.65);
    v5:SetSpeedRatio(1);
    v5:SetIntensityRatio(1);
    v5:SetLightInfluence(0);
    v5:SetLightEmission(0.2);
    v5:SetCollisionMode(v5.CollisionMode.Function, function(v6) --[[ Line: 22 ]]
        local v7 = false;
        if v6.Transparency <= 0.97 then
            v7 = v6.CanCollide;
        end;
        return v7;
    end);
    v5:SetCollisionMode(v5.CollisionMode.Function, function(v8) --[[ Line: 29 ]]
        return v8.Transparency <= 0.97;
    end);
    local l_Clouds_0 = workspace.Terrain:WaitForChild("Clouds");
    local l_Color_0 = l_Clouds_0.Color;
    local l_Cover_0 = l_Clouds_0.Cover;
    local l_Density_0 = l_Clouds_0.Density;
    local v13 = TweenInfo.new(30, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local _ = require(game.ReplicatedStorage:WaitForChild("Bezier"));
    local _ = workspace:WaitForChild("AirshipPoints");
    local l_Airship_0 = workspace:WaitForChild("Airship");
    if l_Airship_0 then
        l_Airship_0:Destroy();
    end;
    local v17 = {};
    for _, v19 in workspace:GetDescendants() do
        if v19.Name == "Fire" and v19:IsA("ParticleEmitter") then
            table.insert(v17, v19);
        end;
    end;
    local function v20() --[[ Line: 80 ]] --[[ Name: StartRain ]]
        -- upvalues: v5 (copy), v13 (copy), l_TweenService_0 (copy), l_Clouds_0 (copy), v17 (copy), l_Cover_0 (copy), l_Density_0 (copy), l_Color_0 (copy), v20 (copy)
        v5:Enable(v13);
        l_TweenService_0:Create(l_Clouds_0, v13, {
            Cover = 0.85, 
            Density = 0.85, 
            Color = Color3.fromRGB(46, 76, 131)
        }):Play();
        for _, v22 in v17 do
            v22.Enabled = false;
        end;
        task.wait(120);
        v5:Disable(v13);
        l_TweenService_0:Create(l_Clouds_0, v13, {
            Cover = l_Cover_0, 
            Density = l_Density_0, 
            Color = l_Color_0
        }):Play();
        task.wait(1800);
        v20();
        for _, v24 in v17 do
            v24.Enabled = true;
        end;
    end;
    local l_DefaultAtmosphere_0 = l_Lighting_0:WaitForChild("DefaultAtmosphere");
    local l_Color_1 = l_DefaultAtmosphere_0.Color;
    local v27 = Color3.fromRGB(97, 97, 97);
    workspace:WaitForChild("CurrentMenu").Changed:Connect(function(v28) --[[ Line: 142 ]]
        -- upvalues: l_DefaultAtmosphere_0 (copy), v27 (copy), l_Color_1 (copy)
        if v28 == "StyleShop" then
            l_DefaultAtmosphere_0.Color = v27;
            return;
        else
            l_DefaultAtmosphere_0.Color = l_Color_1;
            return;
        end;
    end);
    script.Ambience:Play();
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    task.wait(l_workspace_ServerTimeNow_0 % 1920 - 120);
    v20();
    return;
end;