local v0 = false;
local v1 = false;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_StarterGui_0 = l_ReplicatedStorage_0:WaitForChild("StarterGui");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
warn("LOKI - Waiting for game loaded");
repeat
    task.wait();
until l_LocalPlayer_0:IsDescendantOf(l_Players_0) and game:IsLoaded();
warn("LOKI - Game loaded");
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local _ = game:GetService("UserInputService");
local _ = game:GetService("GuiService");
local v9 = {
    Keyboard = {
        [Enum.UserInputType.MouseMovement] = true, 
        [Enum.UserInputType.MouseButton1] = true, 
        [Enum.UserInputType.MouseButton2] = true, 
        [Enum.UserInputType.MouseButton3] = true, 
        [Enum.UserInputType.MouseWheel] = true, 
        [Enum.UserInputType.Keyboard] = true, 
        [Enum.UserInputType.Focus] = true
    }, 
    Mobile = {
        [Enum.UserInputType.Touch] = true
    }, 
    Console = {
        [Enum.UserInputType.Gamepad1] = true, 
        [Enum.UserInputType.Gamepad2] = true, 
        [Enum.UserInputType.Gamepad3] = true, 
        [Enum.UserInputType.Gamepad4] = true, 
        [Enum.UserInputType.Gamepad5] = true, 
        [Enum.UserInputType.Gamepad6] = true, 
        [Enum.UserInputType.Gamepad7] = true, 
        [Enum.UserInputType.Gamepad8] = true
    }
};
local function _() --[[ Line: 51 ]] --[[ Name: GetInputType ]]
    -- upvalues: v9 (copy)
    local l_LastInputType_0 = game:GetService("UserInputService"):GetLastInputType();
    for v11, v12 in v9 do
        if v12[l_LastInputType_0] then
            return v11;
        end;
    end;
    return "Keyboard";
end;
local l_LastInputType_1 = game:GetService("UserInputService"):GetLastInputType();
local v15;
for v16, v17 in v9 do
    if v17[l_LastInputType_1] then
        v15 = v16;
        v0 = true;
    end;
    if v0 then
        break;
    end;
end;
if not v0 then
    v15 = "Keyboard";
end;
v0 = false;
l_StarterGui_0:WaitForChild("Common");
l_StarterGui_0:WaitForChild("MainPC");
l_StarterGui_0:WaitForChild("MainMobile");
l_LastInputType_1 = nil;
if v15 == "Mobile" then
    l_StarterGui_0.MainPC:Destroy();
    l_LastInputType_1 = l_StarterGui_0.MainMobile;
else
    l_StarterGui_0.MainMobile:Destroy();
    l_LastInputType_1 = l_StarterGui_0.MainPC;
end;
l_LastInputType_1.Name = "Main";
local _ = require(game:GetService("ReplicatedFirst"):WaitForChild("Places"));
warn("LOKI - Waiting for CharacterData");
local _ = workspace:WaitForChild("States"):WaitForChild(l_LocalPlayer_0.Name):WaitForChild("CharacterData");
warn("LOKI - Got CharacterData");
task.wait(1);
warn("LOKI - Adding menus");
local v20 = {};
for _, v22 in l_StarterGui_0:GetChildren() do
    for _, v24 in v22:GetDescendants() do
        if v24:IsA("BaseScript") then
            v24.Enabled = true;
        elseif v24.Name == "LoopedVideo" then
            table.insert(v20, v24);
        end;
    end;
    v22.Parent = l_PlayerGui_0;
    v22.Enabled = true;
end;
warn("LOKI - Added menus");
local _ = game:GetService("ReplicatedFirst");
local v26;
if game:GetService("RunService"):IsClient() then
    v26 = shared.BridgeNet2;
    if not v26 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v26 = shared.BridgeNet2;
        v1 = v26;
    else
        v1 = true;
    end;
end;
if not v1 then
    if not v1 then
        v26 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v1 = false;
v26.ReferenceBridge("StartLoaded"):Fire(v15);
for _, v28 in v20 do
    v28.Looped = true;
    v28.Playing = true;
    v28:Clone().Parent = v28.Parent;
    v28:Destroy();
end;