local v0 = false;
local l_Players_0 = game:GetService("Players");
local l_Workspace_0 = game:GetService("Workspace");
local _ = game:GetService("UserService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
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
local l_Leaderboards_0 = l_Workspace_0:WaitForChild("Leaderboards");
local _ = l_Leaderboards_0:WaitForChild("Knockdowns");
local _ = l_Leaderboards_0:WaitForChild("Wins");
local v13 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local v14 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local v17 = {};
for _, v19 in l_Leaderboards_0:GetChildren() do
    local l_Buttons_0 = v19:FindFirstChild("Buttons");
    if l_Buttons_0 then
        local l_SurfaceGui_0 = l_Buttons_0.SurfaceGui;
        l_CollectionService_0:AddTag(l_SurfaceGui_0, "WorkspaceGuis");
        local l_Parent_0 = l_SurfaceGui_0.Parent;
        l_SurfaceGui_0.Parent = l_PlayerGui_0;
        l_SurfaceGui_0.Adornee = l_Parent_0;
        local l_SurfaceGui_1 = v19.Screen.SurfaceGui;
        local v24 = "Seasonal";
        for v25 = 1, 4 do
            for _, v27 in l_SurfaceGui_1:GetDescendants() do
                if v27.Name == tostring(v25) then
                    v27.Visible = false;
                end;
            end;
        end;
        for _, v29 in l_SurfaceGui_0:GetChildren() do
            local l_l_SurfaceGui_1_FirstChild_0 = l_SurfaceGui_1:FindFirstChild(v29.Name);
            if l_l_SurfaceGui_1_FirstChild_0 then
                v29.Button.Activated:Connect(function() --[[ Line: 52 ]]
                    -- upvalues: v24 (ref), v29 (copy), l_SurfaceGui_1 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_l_SurfaceGui_1_FirstChild_0 (copy), l_TweenService_0 (copy), v14 (copy), l_SurfaceGui_0 (copy), v13 (copy)
                    if v24 == v29.Name then
                        return;
                    else
                        v24 = v29.Name;
                        for _, v32 in l_SurfaceGui_1:GetChildren() do
                            if v32.Name ~= "Self" then
                                v32.Visible = false;
                            end;
                        end;
                        l_SoundHelper_0:PlaySound({
                            Name = "Pop", 
                            Parent = l_Workspace_0
                        });
                        l_l_SurfaceGui_1_FirstChild_0.Visible = true;
                        l_l_SurfaceGui_1_FirstChild_0.Position = UDim2.new(l_l_SurfaceGui_1_FirstChild_0.Position.X.Scale, 0, l_l_SurfaceGui_1_FirstChild_0.Position.Y.Scale + 0.05, 0);
                        l_TweenService_0:Create(l_l_SurfaceGui_1_FirstChild_0, v14, {
                            Position = UDim2.new(0, 0, 0, 0)
                        }):Play();
                        l_l_SurfaceGui_1_FirstChild_0["0"].Visible = true;
                        for _, v34 in l_SurfaceGui_0:GetChildren() do
                            if v34 ~= v29 then
                                l_TweenService_0:Create(v34.UIStroke, v13, {
                                    Thickness = 1.3, 
                                    Color = Color3.fromRGB(255, 255, 255)
                                }):Play();
                            end;
                        end;
                        l_TweenService_0:Create(v29.UIStroke, v13, {
                            Thickness = 4.5, 
                            Color = Color3.fromRGB(255, 228, 25)
                        }):Play();
                        return;
                    end;
                end);
            end;
        end;
        local l_Self_0 = l_SurfaceGui_1:FindFirstChild("Self");
        if not l_Self_0 then
            --[[ close >= 27 ]]
        else
            table.insert(v17, l_Self_0.Timer);
            --[[ close >= 27 ]]
        end;
    end;
end;
local l_SeasonHelper_0 = require(l_ReplicatedFirst_0:WaitForChild("SeasonHelper"));
Format = function(v37) --[[ Line: 92 ]] --[[ Name: Format ]]
    return string.format("%02i", v37);
end;
convertToHMS = function(v38) --[[ Line: 96 ]] --[[ Name: convertToHMS ]]
    local v39 = (v38 - v38 % 60) / 60;
    v38 = v38 - v39 * 60;
    local v40 = (v39 - v39 % 60) / 60;
    v39 = v39 - v40 * 60;
    return Format(v40) .. ":" .. Format(v39) .. ":" .. Format(v38);
end;
task.defer(function() --[[ Line: 104 ]]
    -- upvalues: l_SeasonHelper_0 (copy), v17 (copy), l_Leaderboards_0 (copy)
    while task.wait(1) do
        local v41 = l_SeasonHelper_0.GetTimeUntilNextSeason();
        for _, v43 in v17 do
            v43.Text = "SEASON ENDS: " .. convertToHMS(v41);
        end;
        if v41 < 2 then
            for _, v45 in l_Leaderboards_0:GetDescendants() do
                if v45.Name == "Seasonal" then
                    for _, v47 in v45:GetChildren() do
                        if v47.Name == "Remove" then
                            v47:Destroy();
                        end;
                    end;
                end;
            end;
        end;
    end;
end);
local v48 = {
    AK = l_Leaderboards_0.Knockdowns.Screen.SurfaceGui.AllTime, 
    SK = l_Leaderboards_0.Knockdowns.Screen.SurfaceGui.Seasonal, 
    AW = l_Leaderboards_0.Wins.Screen.SurfaceGui.AllTime, 
    SW = l_Leaderboards_0.Wins.Screen.SurfaceGui.Seasonal, 
    AR = l_Leaderboards_0.Rating.Screen.SurfaceGui.AllTime
};
local v49 = {
    AK = " KD", 
    SK = " KD", 
    AW = " WINS", 
    SW = " WINS", 
    AR = " RT"
};
RankToPanel = function(v50) --[[ Line: 146 ]] --[[ Name: RankToPanel ]]
    if v50 <= 3 then
        return (tostring(v50));
    else
        return "4";
    end;
end;
FormatNumber = function(v51) --[[ Line: 154 ]] --[[ Name: FormatNumber ]]
    return tostring(v51):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "");
end;
GetImage = function(v52) --[[ Line: 159 ]] --[[ Name: GetImage ]]
    local l_HeadShot_0 = Enum.ThumbnailType.HeadShot;
    local l_Size48x48_0 = Enum.ThumbnailSize.Size48x48;
    local l_UserThumbnailAsync_0, v56 = game.Players:GetUserThumbnailAsync(v52, l_HeadShot_0, l_Size48x48_0);
    return v56 and l_UserThumbnailAsync_0 or "";
end;
local v57 = {};
v9.ReferenceBridge("UpdateLeaderboard"):Connect(function(v58) --[[ Line: 171 ]]
    -- upvalues: v48 (copy), v57 (copy), v49 (copy), l_Players_0 (copy)
    local v59 = string.sub(v58[1], 1, 2);
    local v60 = v58[2];
    local v61 = v48[v59];
    if not v61 then
        return;
    else
        local v62 = tick();
        v57[v59] = v62;
        for _, v64 in v61:GetChildren() do
            if v64.Name == "Remove" then
                v64:Destroy();
            end;
        end;
        for v65, v66 in v60 do
            if v57[v59] ~= v62 then
                return;
            else
                local l_v61_FirstChild_0 = v61:FindFirstChild(RankToPanel(v66[1]));
                if not l_v61_FirstChild_0 then
                    --[[ close >= 10 ]]
                else
                    l_v61_FirstChild_0 = l_v61_FirstChild_0:Clone();
                    l_v61_FirstChild_0.Name = "Remove";
                    l_v61_FirstChild_0.LayoutOrder = v66[1];
                    l_v61_FirstChild_0.Rank.Text = "#" .. v66[1];
                    l_v61_FirstChild_0.Score.Text = FormatNumber(v66[2]) .. (v49[v59] or "");
                    l_v61_FirstChild_0.Username.Text = "@" .. l_Players_0:GetNameFromUserIdAsync(v65);
                    l_v61_FirstChild_0.Parent = v61;
                    l_v61_FirstChild_0.Visible = true;
                    do
                        local l_l_v61_FirstChild_0_0 = l_v61_FirstChild_0;
                        task.defer(function() --[[ Line: 205 ]]
                            -- upvalues: l_l_v61_FirstChild_0_0 (ref), v65 (copy)
                            task.wait(math.random(0, 5));
                            l_l_v61_FirstChild_0_0.Image.Image = GetImage(v65);
                        end);
                        task.wait(0.5);
                    end;
                end;
            end;
        end;
        return;
    end;
end);