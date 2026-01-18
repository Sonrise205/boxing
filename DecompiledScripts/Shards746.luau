local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local _ = game:GetService("TweenService");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local _ = require(l_ReplicatedFirst_0.AbsorbItem);
local v5 = Random.new();
local l_StyleShop_0 = workspace:WaitForChild("StyleShop");
local l_Events_0 = l_ReplicatedStorage_0:FindFirstChild("Events");
local v8 = l_Events_0 and l_Events_0:FindFirstChild("BasicMessage");
Animate = function(v9, v10, _) --[[ Line: 16 ]] --[[ Name: Animate ]]
    -- upvalues: l_StyleShop_0 (copy), l_LocalPlayer_0 (copy), v5 (copy), v8 (copy)
    local v12 = workspace.CurrentMenu.Value == "StyleShop" and l_StyleShop_0:FindFirstChild("SpinDummy") or l_LocalPlayer_0.Character;
    if not v12 then
        return;
    else
        local v13 = v12.PrimaryPart.Position - Vector3.new(0.009999999776482582, 4, 0.009999999776482582, 0);
        local l_Position_0 = v12.PrimaryPart.CFrame.Position;
        local v15 = {
            Uncommon = "#2be05b", 
            Rare = "#1fbcff", 
            Mythic = "#eb54ff", 
            Legendary = "#ffee70"
        };
        game.ReplicatedStorage.Events.CreateWisp:Fire({
            Effect = v12.Name == "SpinDummy" and "StyleShop" or "Generic", 
            From = v13, 
            To = v12.Name == "SpinDummy" and v12.PrimaryPart or l_Position_0, 
            MiddlePosition = (v12.PrimaryPart.CFrame * CFrame.new(v5:NextNumber(6, 12) * (v5:NextInteger(0, 1) == 0 and 1 or -1), v5:NextNumber(1, 4) * (v5:NextInteger(0, 1) == 0 and 1 or -1), -v5:NextNumber(2, 6))).Position, 
            TimePerDistance = 0, 
            Color = Color3.fromHex(v15[v9]), 
            ReceiveColor = Color3.fromHex(v15[v9]), 
            ReceiveEffect = v9 .. "Shards", 
            Time = 1.7
        });
        task.wait(1.6);
        if v12.Name ~= "SpinDummy" then
            return;
        else
            v8:Fire({
                Message = ("Found <flow><font color=\"%*\">%* %* shards!</font></flow>"):format(v15[v9], v10, (v9:lower())), 
                Color = Color3.fromRGB(255, 255, 255), 
                Sound = "TargetDailyReward", 
                IsRainbow = false, 
                HoldTime = 3, 
                Target = "SpinsMessage"
            });
            return;
        end;
    end;
end;
local l_LocalPlayer_1 = game.Players.LocalPlayer;
local v17 = {
    "UncommonShards", 
    "RareShards", 
    "LegendaryShards", 
    "MythicShards"
};
local v18 = {};
for _, v20 in v17 do
    v18[v20] = l_LocalPlayer_1:GetAttribute(v20);
end;
for _, v22 in v17 do
    l_LocalPlayer_1:GetAttributeChangedSignal(v22):Connect(function() --[[ Line: 77 ]]
        -- upvalues: l_LocalPlayer_1 (copy), v22 (copy), v18 (copy)
        local l_l_LocalPlayer_1_Attribute_0 = l_LocalPlayer_1:GetAttribute(v22);
        if not v18[v22] then
            v18[v22] = l_l_LocalPlayer_1_Attribute_0;
            return;
        else
            local v24 = v18[v22];
            v18[v22] = l_l_LocalPlayer_1_Attribute_0;
            if v24 < l_l_LocalPlayer_1_Attribute_0 then
                local v25 = l_l_LocalPlayer_1_Attribute_0 - v24;
                local v26 = string.gsub(v22, "Shards$", "");
                Animate(v26, v25, v24);
            end;
            return;
        end;
    end);
end;