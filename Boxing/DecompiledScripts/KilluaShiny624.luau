local l_CommonUtilities_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("CommonUtilities"));
local l_Chronos_0 = require(script.Parent:WaitForChild("Chronos"));
local v2 = l_CommonUtilities_0.DeepCopy(l_Chronos_0);
Init = function() --[[ Line: 7 ]] --[[ Name: Init ]]
    -- upvalues: l_Chronos_0 (ref), v2 (ref), l_CommonUtilities_0 (copy)
    l_Chronos_0 = require(script.Parent:WaitForChild("Chronos"));
    v2 = l_CommonUtilities_0.DeepCopy(l_Chronos_0);
    v2.Init = Init;
    v2.Rarity = nil;
    v2.Shiny = true;
    v2.HiddenRarity = "Legendary";
    v2.ShortName = "GODSPEED [LOCKED]";
    v2.DisplayName = "Godspeed Style [5x]";
    v2.Description = "WARNING: You spun this during a pre-release, where the rates to earn it are higher. The full shiny will become available to you soon!";
    v2.BaseStyleName = "Chronos";
    v2.Titles = {
        [1] = {
            Name = "Godspeed1", 
            DisplayTitle = "Solitude \240\159\144\186", 
            Quality = 12, 
            Type = "Knockdowns", 
            Amount = 100
        }, 
        [2] = {
            Name = "Godspeed2", 
            DisplayTitle = "Cero \240\159\140\128", 
            Quality = 16, 
            Type = "Knockdowns", 
            Amount = 350
        }, 
        [3] = {
            Name = "Godspeed3", 
            DisplayTitle = "Primera Espada \240\159\151\161\239\184\143", 
            Quality = 7, 
            Type = "Knockdowns", 
            Amount = 750
        }
    };
    return v2;
end;
v2.Init = Init;
Init();
if not require(game.ReplicatedFirst:WaitForChild("Places")):IsTesting() and script:FindFirstChild("Testing") then
    task.spawn(function() --[[ Line: 978 ]]
        local l_FirstChild_0 = game:GetService("ReplicatedFirst"):WaitForChild("Animations", 10):FindFirstChild(script.Name);
        if l_FirstChild_0 then
            l_FirstChild_0:Destroy();
        end;
    end);
    return v2;
else
    Init();
    game:GetService("ReplicatedStorage"):WaitForChild("Events", 30):WaitForChild("RemoteConfigLoaded", 30).Event:Connect(function() --[[ Line: 993 ]]
        Init();
    end);
    return v2;
end;