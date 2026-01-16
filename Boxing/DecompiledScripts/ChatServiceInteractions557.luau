local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ReplicatedFirst");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local _ = require(l_Modules_0:WaitForChild("UIHelper"));
local _ = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_LocalChatCommands_0 = require(script:WaitForChild("LocalChatCommands"));
local l_MessageAppearanceHelper_0 = require(script:WaitForChild("MessageAppearanceHelper"));
local l_ChatWindowConfiguration_0 = l_TextChatService_0.ChatWindowConfiguration;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
l_TextChatService_0.OnChatWindowAdded = function(v11) --[[ Line: 34 ]]
    -- upvalues: l_ChatWindowConfiguration_0 (copy), l_Players_0 (copy), l_MessageAppearanceHelper_0 (copy)
    local v12 = l_ChatWindowConfiguration_0:DeriveNewMessageProperties();
    local l_TextSource_0 = v11.TextSource;
    local v14 = if l_TextSource_0 then l_Players_0:GetPlayerByUserId(l_TextSource_0.UserId) else nil;
    if v14 and l_MessageAppearanceHelper_0.ApplyTitleToChatMessage(v14, v11, v12) then
        v11.ChatWindowMessageProperties = v12;
        return v12;
    else
        return nil;
    end;
end;
l_TextChatService_0.MessageReceived:Connect(function(v15) --[[ Line: 56 ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_LocalChatCommands_0 (copy)
    local l_TextSource_1 = v15.TextSource;
    if not l_TextSource_1 then
        return;
    else
        if l_TextSource_1.Name == l_LocalPlayer_0.Name then
            local _ = l_LocalChatCommands_0.InterpretLocalCommands(v15);
        end;
        return;
    end;
end);