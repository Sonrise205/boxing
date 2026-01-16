local v0 = false;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ReplicatedFirst");
local _ = game:GetService("TextChatService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_UIHelper_0 = require(l_Modules_0:WaitForChild("UIHelper"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v9 = {
    uncommon = "Uncommon", 
    rare = "Rare", 
    mythic = "Mythic", 
    legendary = "Legendary"
};
local v10;
if game:GetService("RunService"):IsClient() then
    v10 = shared.BridgeNet2;
    if not v10 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v10 = shared.BridgeNet2;
        v0 = v10;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v10 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local v11 = v10.ReferenceBridge("BulkSellGloves");
local v12 = v10.ReferenceBridge("TryVoidSamurai");
return {
    InterpretLocalCommands = function(v13) --[[ Line: 27 ]] --[[ Name: InterpretLocalCommands ]]
        -- upvalues: v9 (copy), l_UIHelper_0 (copy), l_LocalPlayer_0 (copy), v11 (copy), l_SoundHelper_0 (copy), v12 (copy)
        local l_Text_0 = v13.Text;
        local v15 = {};
        for v16 in string.gmatch(string.lower(l_Text_0), "[^%s]+") do
            table.insert(v15, v16);
        end;
        if v15[1] == "bulksell" and v15[2] then
            local v17 = v9[v15[2]];
            if not v17 then
                return false;
            else
                l_UIHelper_0.CreateYesNoPrompt((("SELL ALL %* GLOVES?"):format((string.upper(v17))))).Execute.Event:Connect(function() --[[ Line: 41 ]]
                    -- upvalues: l_LocalPlayer_0 (ref), v11 (ref), v17 (copy), l_SoundHelper_0 (ref)
                    local l_Cash_0 = workspace.States[l_LocalPlayer_0.Name].PlayerData.Cash;
                    local l_Value_0 = l_Cash_0.Value;
                    v11:Fire(v17);
                    task.wait(0.5);
                    if l_Value_0 < l_Cash_0.Value then
                        l_SoundHelper_0:PlaySound({
                            Name = "GetMoney", 
                            Parent = workspace
                        });
                    end;
                end);
                return true;
            end;
        else
            if v15[1] == "consume" then
                v12:Fire(true);
            elseif v15[1] == "expel" then
                v12:Fire(false);
            end;
            return false;
        end;
    end
};