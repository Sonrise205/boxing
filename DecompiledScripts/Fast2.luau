local l_RunService_0 = game:GetService("RunService");
local l_PlayerGui_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
local l_LocalPlayerTeleportData_0 = game:GetService("TeleportService"):GetLocalPlayerTeleportData();
local v5 = l_LocalPlayerTeleportData_0 and l_LocalPlayerTeleportData_0.IsStart;
local v6 = not (game.PlaceId == l_Places_0.Main) or l_RunService_0:IsStudio() or v5;
local l_PlayVideos_0 = require(l_ReplicatedFirst_0:WaitForChild("PlayVideos"));
if v6 then
    l_PlayVideos_0.IntroPlayed();
    return;
elseif l_LocalPlayerTeleportData_0 and l_LocalPlayerTeleportData_0.RankedOpponentId then
    l_PlayVideos_0.PlayRankedVideo(true);
    return;
else
    local l_Intro_0 = script.Intro;
    l_Intro_0.Parent = l_PlayerGui_0;
    for _, v10 in l_Intro_0:GetDescendants() do
        if v10:IsA("BaseScript") then
            v10.Enabled = true;
        end;
    end;
    return;
end;