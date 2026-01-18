local v0 = {};
local v1 = require(game.ReplicatedStorage.Modules.FuzzySearch);
local v2 = {};
local v3 = {};
local v4 = {};
local v5 = nil;
local v6 = nil;
local v7 = {};
v0.Initialize = function(v8) --[[ Line: 18 ]] --[[ Name: Initialize ]]
    -- upvalues: v5 (ref), v6 (ref), v4 (ref), v7 (ref), v0 (copy)
    v5 = v8.ScrollFrame;
    v6 = v8.SearchBarInput;
    v4 = v8.SettingStates;
    v7 = v8.Categories;
    v6:GetPropertyChangedSignal("Text"):Connect(v0.UpdateSearch);
end;
v0.RegisterSetting = function(v9, v10) --[[ Line: 29 ]] --[[ Name: RegisterSetting ]]
    -- upvalues: v3 (copy), v2 (copy)
    v3[v9] = v10;
    table.insert(v2, v9);
end;
v0.FailSearch = function() --[[ Line: 35 ]] --[[ Name: FailSearch ]]
    -- upvalues: v6 (ref), v5 (ref)
    v6.TextColor3 = Color3.fromRGB(255, 0, 0);
    for _, v12 in v5:GetChildren() do
        if v12:IsA("GuiObject") then
            v12.Visible = true;
        end;
    end;
end;
v0.UpdateSearch = function() --[[ Line: 46 ]] --[[ Name: UpdateSearch ]]
    -- upvalues: v6 (ref), v1 (copy), v2 (copy), v0 (copy), v4 (ref), v3 (copy), v7 (ref), v5 (ref)
    local l_Text_0 = v6.Text;
    local v14, v15 = v1.filter(l_Text_0, v2, false);
    if l_Text_0 == "" or not v14[1] then
        v0.FailSearch();
        return;
    else
        v6.TextColor3 = Color3.fromRGB(255, 255, 255);
        for _, v17 in v2 do
            v4[v3[v17]].GuiInstance.Parent.Visible = false;
        end;
        local v18 = {};
        for _, v20 in v14 do
            local v21, _, v23 = table.unpack(v20);
            local v24 = v15 * 0.25 < v23;
            local v25 = v3[v2[v21]];
            if v24 then
                v18[v4[v25].OriginalInfo.Category] = true;
            end;
            v4[v25].GuiInstance.Parent.Visible = v24;
        end;
        for _, v27 in v7 do
            local l_Name_0 = v27.Name;
            local v29 = v18[l_Name_0] or false;
            if v5:FindFirstChild(l_Name_0) then
                v5[l_Name_0].Visible = v29;
                if v5:FindFirstChild((("%*_Padding"):format(l_Name_0))) then
                    v5[("%*_Padding"):format(l_Name_0)].Visible = v29;
                end;
            end;
        end;
        return;
    end;
end;
return v0;