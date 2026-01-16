local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local _ = game:GetService("TeleportService"):GetLocalPlayerTeleportData();
local l_ScreenGui_0 = script.ScreenGui;
if game.PlaceId == l_Places_0.Main then
    game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen();
    local l_Children_0 = l_ScreenGui_0.Frame.Backgrounds:GetChildren();
    local v6 = l_Children_0[math.random(1, #l_Children_0)];
    v6.Parent = l_ScreenGui_0.Frame;
    v6.Visible = true;
    l_ScreenGui_0.Frame.Backgrounds:Destroy();
    local l_UserInputService_0 = game:GetService("UserInputService");
    if not l_UserInputService_0.KeyboardEnabled and l_UserInputService_0.TouchEnabled then
        l_ScreenGui_0.Frame.TextFrame.Size = UDim2.new(0.8, 0, 0.8, 0);
        v6.ImageTransparency = v6.ImageTransparency * 0.8;
    end;
    pcall(function() --[[ Line: 28 ]]
        -- upvalues: l_ScreenGui_0 (copy)
        game:GetService("TeleportService"):SetTeleportGui(l_ScreenGui_0);
    end);
end;
local l_SetTeleportGuiText_0 = l_ReplicatedStorage_0:WaitForChild("Events"):WaitForChild("SetTeleportGuiText");
local l_Text_0 = l_ScreenGui_0.Frame.TextFrame:WaitForChild("Main").Text;
l_SetTeleportGuiText_0.Event:Connect(function(v10) --[[ Line: 38 ]]
    -- upvalues: l_Text_0 (copy), l_ScreenGui_0 (copy)
    if not v10 then
        v10 = l_Text_0;
    end;
    for _, v12 in l_ScreenGui_0.Frame.TextFrame:GetChildren() do
        v12.Text = v10;
    end;
end);