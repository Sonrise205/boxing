local l_Players_0 = game.Players;
local l_ReplicatedStorage_0 = game.ReplicatedStorage;
local l_TweenService_0 = game:GetService("TweenService");
local l_PrivateServerPlusModules_0 = l_ReplicatedStorage_0.PrivateServerPlusModules;
local _ = require(l_PrivateServerPlusModules_0.SettingsCollection);
local _ = require(l_PrivateServerPlusModules_0.SettingTypes);
local _ = require(l_PrivateServerPlusModules_0.SettingsValidator);
local _ = require(l_ReplicatedStorage_0.Modules.FuzzySearch);
local l_PrivateServerGUI_0 = l_Players_0.LocalPlayer.PlayerGui:WaitForChild("Common"):WaitForChild("PrivateServerGUI");
local l_Top_0 = l_PrivateServerGUI_0.Main.Top;
local _ = l_Top_0.ScrollHolder.ScrollingFrame;
local _ = l_Top_0.SearchBar.SearchBox;
return {
    TweenDarken = function(v12) --[[ Line: 23 ]] --[[ Name: TweenDarken ]]
        -- upvalues: l_TweenService_0 (copy), l_PrivateServerGUI_0 (copy)
        l_TweenService_0:Create(l_PrivateServerGUI_0.Darken, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundTransparency = v12 and 0 or 1
        }):Play();
    end
};