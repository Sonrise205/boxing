local l_Catalog_0 = game:GetService("ReplicatedStorage"):WaitForChild("Catalog");
local l_SearchHelper_0 = require(l_Catalog_0:WaitForChild("SearchHelper"));
local l_Character_0 = game.Players.LocalPlayer.Character;
local v3 = l_Character_0 and l_Character_0:WaitForChild("Humanoid", 20);
local v4 = v3 and v3:FindFirstChild("HumanoidDescription", 20);
local v5 = l_SearchHelper_0.ConvertToBlob(v4);
script.Parent.MouseButton1Down:Connect(function() --[[ Line: 11 ]]
    -- upvalues: l_Character_0 (copy), v5 (copy), l_SearchHelper_0 (copy)
    local v6 = l_Character_0 and l_Character_0:WaitForChild("Humanoid", 20);
    local v7 = v6 and v6:FindFirstChild("HumanoidDescription", 20);
    if v5 == l_SearchHelper_0.ConvertToBlob(v7) then
        return;
    else
        local l_Catalog_1 = game:GetService("ReplicatedStorage"):WaitForChild("Catalog");
        require(l_Catalog_1:WaitForChild("ByteNetPackets")).UpdateAppearance.send(true);
        return;
    end;
end);