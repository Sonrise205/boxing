local _ = game:GetService("GuiService");
local function _() --[[ Line: 3 ]] --[[ Name: IsXbox ]]
    return game:GetService("Players").LocalPlayer:GetAttribute("Interface") == "Controller";
end;
deepcopy = function(v2) --[[ Line: 7 ]] --[[ Name: deepcopy ]]
    local v3 = type(v2);
    local v4 = nil;
    if v3 == "table" then
        v4 = {};
        for v5, v6 in next, v2 do
            v4[deepcopy(v5)] = deepcopy(v6);
        end;
        setmetatable(v4, deepcopy((getmetatable(v2))));
        return v4;
    else
        return v2;
    end;
end;
local v7 = {
    Dash = Enum.KeyCode.Space, 
    Block = Enum.KeyCode.F, 
    Ultimate = Enum.KeyCode.Q, 
    Special = Enum.KeyCode.R, 
    LightAttack = Enum.KeyCode.K, 
    HeavyAttack = Enum.KeyCode.L
};
local v8 = {
    Dash = Enum.KeyCode.ButtonA, 
    Block = Enum.KeyCode.ButtonB, 
    Ultimate = Enum.KeyCode.ButtonR1, 
    Special = Enum.KeyCode.ButtonR2, 
    LightAttack = Enum.KeyCode.ButtonX, 
    HeavyAttack = Enum.KeyCode.ButtonY
};
local v9 = deepcopy(v7);
local v10 = deepcopy(v8);
return {
    GetDefaultKeybinds = function() --[[ Line: 47 ]] --[[ Name: GetDefaultKeybinds ]]
        -- upvalues: v9 (copy)
        return v9;
    end, 
    GetDefaultGamepadBinds = function() --[[ Line: 51 ]] --[[ Name: GetDefaultGamepadBinds ]]
        -- upvalues: v10 (copy)
        return v10;
    end, 
    SetKeybind = function(v11, v12) --[[ Line: 55 ]] --[[ Name: SetKeybind ]]
        -- upvalues: v7 (copy)
        v7[v11] = Enum.KeyCode[v12];
    end, 
    GetKeybind = function(v13) --[[ Line: 59 ]] --[[ Name: GetKeybind ]]
        -- upvalues: v7 (copy)
        return v7[v13];
    end, 
    SetGamepadBind = function(v14, v15) --[[ Line: 63 ]] --[[ Name: SetGamepadBind ]]
        -- upvalues: v8 (copy)
        v8[v14] = Enum.KeyCode[v15];
    end, 
    GetGamepadBind = function(v16) --[[ Line: 67 ]] --[[ Name: GetGamepadBind ]]
        -- upvalues: v8 (copy)
        return v8[v16];
    end
};