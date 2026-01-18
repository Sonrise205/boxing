local v0 = false;
local l_ReplicatedStorage_0 = game.ReplicatedStorage;
local l_TweenService_0 = game:GetService("TweenService");
local l_PrivateServerPlusModules_0 = l_ReplicatedStorage_0.PrivateServerPlusModules;
local v4 = require(l_PrivateServerPlusModules_0.SettingsCollection);
local _ = require(l_PrivateServerPlusModules_0.SettingTypes);
local v6 = require(l_PrivateServerPlusModules_0.SettingsValidator);
local v7 = require("@self/Search");
local _ = game:GetService("ReplicatedFirst");
local v9;
if game:GetService("RunService"):IsClient() then
    v9 = shared.BridgeNet2;
    if not v9 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v9 = shared.BridgeNet2;
        v0 = v9;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v9 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local l_Parent_0 = script.Parent;
local l_Top_0 = l_Parent_0.Main.Top;
local l_ScrollingFrame_0 = l_Top_0.ScrollHolder.ScrollingFrame;
local l_SearchBox_0 = l_Top_0.SearchBar.SearchBox;
local l_BaseAssets_0 = l_Parent_0.BaseAssets;
local l_SettingUIWrappers_0 = l_PrivateServerPlusModules_0.SettingUIWrappers;
local v16 = workspace:WaitForChild("PrivateServerSettings", 30);
assert(v16, "Private server could not init");
local v17 = {};
local v18 = v9.ReferenceBridge("UpdatePSSettings");
local l_Size_0 = l_Parent_0.Size;
local v20 = 1;
local v21 = {
    Boolean = require(l_SettingUIWrappers_0.Boolean), 
    Number = require(l_SettingUIWrappers_0.Number), 
    Button = require(l_SettingUIWrappers_0.Button)
};
local function _(v22) --[[ Line: 47 ]] --[[ Name: AddToScrollFrame ]]
    -- upvalues: v20 (ref), l_ScrollingFrame_0 (copy)
    v22.LayoutOrder = v20;
    v22.Visible = true;
    v22.Parent = l_ScrollingFrame_0;
    v20 = v20 + 1;
end;
local function v29(_, v25) --[[ Line: 54 ]] --[[ Name: BuildSetting ]]
    -- upvalues: l_BaseAssets_0 (copy), v21 (copy), v18 (copy), v17 (copy), v7 (copy), v20 (ref), l_ScrollingFrame_0 (copy)
    local v26 = l_BaseAssets_0.TemplateSetting:Clone();
    v26.Name = v25.ID;
    v26.SettingName.Text = v25.DisplayName;
    local v27 = v21[v25.Type](v26, v25);
    v27.OnChange.Event:Connect(function(v28) --[[ Line: 62 ]]
        -- upvalues: v27 (copy), v18 (ref), v25 (copy)
        v27.CurrentValue = v28;
        v27:UpdateVisual();
        v18:Fire({
            v25.ID, 
            v28
        });
    end);
    v17[v25.ID] = v27;
    v7.RegisterSetting(v25.DisplayName, v25.ID);
    v26.LayoutOrder = v20;
    v26.Visible = true;
    v26.Parent = l_ScrollingFrame_0;
    v20 = v20 + 1;
end;
local function v35(v30) --[[ Line: 80 ]] --[[ Name: BuildCategory ]]
    -- upvalues: l_BaseAssets_0 (copy), v20 (ref), l_ScrollingFrame_0 (copy), v29 (copy), v4 (copy)
    local v31 = l_BaseAssets_0.CategorySeparator:Clone();
    v31.Name = v30.Name;
    v31.Separator.CategoryName.Text = v30.Name:upper();
    v31.LayoutOrder = v20;
    v31.Visible = true;
    v31.Parent = l_ScrollingFrame_0;
    v20 = v20 + 1;
    for _, v33 in v30.Settings do
        v29(v30.Name, v4.Settings[v33]);
    end;
    local v34 = l_BaseAssets_0.InvisiblePadding:Clone();
    v34.Name = ("%*_Padding"):format(v30.Name);
    v34.LayoutOrder = v20;
    v34.Visible = true;
    v34.Parent = l_ScrollingFrame_0;
    v20 = v20 + 1;
end;
local function v38(v36) --[[ Line: 98 ]] --[[ Name: TrackServerChanges ]]
    -- upvalues: v17 (copy)
    local v37 = v17[v36.Name];
    print(v37);
    print(v36);
    v37.CurrentValue = v36.Value;
    v37:UpdateVisual();
    v36.Changed:Connect(function() --[[ Line: 106 ]]
        -- upvalues: v37 (copy), v36 (copy)
        v37.CurrentValue = v36.Value;
        v37:UpdateVisual();
    end);
end;
local function v43(v39) --[[ Line: 112 ]] --[[ Name: SetGuiVisible ]]
    -- upvalues: l_Size_0 (copy), l_TweenService_0 (copy), l_Top_0 (copy), l_Parent_0 (copy)
    local v40 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v41 = if v39 then l_Size_0 else UDim2.fromScale(l_Size_0.X.Scale * 0.6, 0);
    local v42 = l_TweenService_0:Create(l_Top_0, v40, {
        Size = v41
    });
    v42:Play();
    if v39 then
        l_Parent_0.Visible = true;
        return;
    else
        v42.Completed:Once(function() --[[ Line: 122 ]]
            -- upvalues: l_Parent_0 (ref)
            l_Parent_0.Visible = false;
        end);
        return;
    end;
end;
if not v6.validateOnStartup() then
    error("[PSPLUS] Could not start because of improper command structure, read above warnings");
end;
for _, v45 in v4.Categories do
    v35(v45);
end;
v7.Initialize({
    ScrollFrame = l_ScrollingFrame_0, 
    SearchBarInput = l_SearchBox_0, 
    SettingStates = v17, 
    Categories = v4.Categories
});
l_Top_0.Size = UDim2.fromScale(l_Size_0.X.Scale * 0.6, 0);
l_Parent_0.Visible = false;
for _, v47 in v16:GetChildren() do
    v38(v47);
end;
v16.ChildAdded:Connect(v38);
l_Parent_0:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 158 ]]
    -- upvalues: l_Parent_0 (copy), v43 (copy)
    if l_Parent_0.Visible then
        v43(true);
    end;
end);
l_Top_0.Close.Button.Activated:Connect(function() --[[ Line: 164 ]]
    -- upvalues: v43 (copy)
    v43(false);
end);