local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ReplicatedFirst");
local _ = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local v10 = {
    IntroPlayed = function() --[[ Line: 10 ]] --[[ Name: IntroPlayed ]]
        -- upvalues: l_Modules_0 (copy)
        local _ = require(l_Modules_0:WaitForChild("EffectHelper"));
        local l_StringValue_0 = Instance.new("StringValue");
        l_StringValue_0.Name = "IntroPlayed";
        l_StringValue_0.Parent = workspace;
        task.delay(30, function() --[[ Line: 17 ]]
            -- upvalues: l_StringValue_0 (copy)
            if l_StringValue_0 then
                l_StringValue_0:Destroy();
            end;
        end);
    end, 
    PlayVideo = function(v7) --[[ Line: 22 ]] --[[ Name: PlayVideo ]]
        game:GetService("ContentProvider"):PreloadAsync({
            v7.Video
        });
        v7.Playing = true;
        v7.TimePosition = 0;
        local v8 = v7:Clone();
        local l_Parent_0 = v7.Parent;
        v7:Destroy();
        v8.Parent = l_Parent_0;
        v8.Playing = true;
        v8.TimePosition = 0;
        return v8;
    end
};
v10.PlayRankedVideo = function(v11) --[[ Line: 42 ]] --[[ Name: PlayRankedVideo ]]
    -- upvalues: l_Modules_0 (copy), l_Players_0 (copy), v10 (copy)
    workspace.CurrentMenu.Value = "";
    if not v11 then
        local l_Transitions_0 = require(l_Modules_0:WaitForChild("Transitions"));
        local v13 = {
            FadeTime = 0.65, 
            HoldTime = 0.65, 
            IgnoreSound = true
        };
        local l_v13_0 = v13 --[[ copy: 2 -> 7 ]];
        task.spawn(function() --[[ Line: 55 ]]
            -- upvalues: l_Transitions_0 (copy), l_v13_0 (copy)
            l_Transitions_0.FadeTransition(l_v13_0);
        end);
        task.wait(v13.FadeTime);
    end;
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v16 = script.RankedVideo:Clone();
    v16.Name = "TransitionRemove";
    v16.Parent = l_LocalPlayer_0:WaitForChild("PlayerGui");
    local _ = v16:WaitForChild("Black");
    local v18 = v11 and v16:WaitForChild("Short") or v16:WaitForChild("Long");
    local v19 = v18:GetChildren()[math.random(1, #v18:GetChildren())];
    v10.PlayVideo(v19);
    task.wait(v11 and 15 or 15);
    v10.IntroPlayed();
end;
return v10;