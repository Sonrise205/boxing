local v0 = false;
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
if game.PlaceId ~= l_Places_0.Trading then
    return;
else
    local v7;
    if game:GetService("RunService"):IsClient() then
        v7 = shared.BridgeNet2;
        if not v7 then
            repeat
                task.wait();
            until shared.BridgeNet2;
            v7 = shared.BridgeNet2;
            v0 = v7;
        else
            v0 = true;
        end;
    end;
    if not v0 then
        if not v0 then
            v7 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
        end;
    end;
    v0 = false;
    local v8 = v7.ReferenceBridge("ClaimBooth");
    local v9 = v7.ReferenceBridge("EditBooth");
    local v10 = v7.ReferenceBridge("SendOffer2");
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_Booths_0 = workspace:WaitForChild("Booths");
    local l_Prompt_0 = script.Prompt;
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local l_UIHelper_0 = require(l_Modules_0:WaitForChild("UIHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local v17 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v18 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Common").Trade;
    for _, v21 in l_Booths_0:GetChildren() do
        local l_circle_0 = v21.LightRing.circle;
        local l_Bottom_0 = v21.Bottom;
        local l_TopGlow_0 = v21.TopGlow;
        local l_Top_0 = v21.Top;
        local l_Owner_0 = v21:FindFirstChild("Owner");
        local v27 = l_Prompt_0:Clone();
        v27.Parent = l_Bottom_0;
        local function _() --[[ Line: 43 ]] --[[ Name: Shown ]]
            -- upvalues: v27 (copy), l_Owner_0 (copy), l_LocalPlayer_0 (copy)
            v27.ActionText = "Claim Booth";
            v27.ObjectText = "";
            if l_Owner_0.Value ~= "" then
                if l_Owner_0.Value == l_LocalPlayer_0.Name then
                    v27.ActionText = "Edit Text";
                    return;
                else
                    v27.ActionText = "Send Offer";
                    v27.ObjectText = "Trade " .. l_Owner_0.Value;
                end;
            end;
        end;
        local function v29() --[[ Line: 58 ]] --[[ Name: OwnerLeft ]]
            -- upvalues: l_Bottom_0 (copy), l_Top_0 (copy), l_TweenService_0 (copy), l_circle_0 (copy), v17 (copy), l_TopGlow_0 (copy)
            l_Bottom_0.SurfaceGui.Frame.TextLabel.Text = "Unclaimed";
            l_Top_0.SurfaceGui.Frame.TextLabel.Text = "claim me";
            l_TweenService_0:Create(l_circle_0, v17, {
                Transparency = 0.4
            }):Play();
            l_TweenService_0:Create(l_TopGlow_0, v17, {
                Transparency = 1
            }):Play();
        end;
        local function v30() --[[ Line: 66 ]] --[[ Name: OwnerAdded ]]
            -- upvalues: l_Bottom_0 (copy), l_Owner_0 (copy), l_Top_0 (copy), l_TweenService_0 (copy), l_circle_0 (copy), v18 (copy), l_TopGlow_0 (copy), l_LocalPlayer_0 (copy)
            l_Bottom_0.SurfaceGui.Frame.TextLabel.Text = l_Owner_0.Value;
            l_Top_0.SurfaceGui.Frame.TextLabel.Text = "";
            l_TweenService_0:Create(l_circle_0, v18, {
                Transparency = 0
            }):Play();
            l_TweenService_0:Create(l_TopGlow_0, v18, {
                Transparency = 0
            }):Play();
            if l_Owner_0.Value == l_LocalPlayer_0.Name then
                script.Owned:Clone().Parent = l_Top_0;
            end;
        end;
        local function _() --[[ Line: 78 ]] --[[ Name: HandleAppearance ]]
            -- upvalues: l_Owner_0 (copy), v30 (copy), v29 (copy), v27 (copy), l_LocalPlayer_0 (copy)
            if l_Owner_0.Value ~= "" then
                v30();
            else
                v29();
            end;
            v27.ActionText = "Claim Booth";
            v27.ObjectText = "";
            if l_Owner_0.Value ~= "" then
                if l_Owner_0.Value == l_LocalPlayer_0.Name then
                    v27.ActionText = "Edit Text";
                    return;
                else
                    v27.ActionText = "Send Offer";
                    v27.ObjectText = "Trade " .. l_Owner_0.Value;
                end;
            end;
        end;
        if l_Owner_0.Value ~= "" then
            v30();
        else
            v29();
        end;
        v27.ActionText = "Claim Booth";
        v27.ObjectText = "";
        if l_Owner_0.Value ~= "" then
            if l_Owner_0.Value == l_LocalPlayer_0.Name then
                v27.ActionText = "Edit Text";
            else
                v27.ActionText = "Send Offer";
                v27.ObjectText = "Trade " .. l_Owner_0.Value;
            end;
        end;
        l_Owner_0.Changed:Connect(function(_) --[[ Line: 89 ]]
            -- upvalues: l_Owner_0 (copy), v30 (copy), v29 (copy), v27 (copy), l_LocalPlayer_0 (copy)
            if l_Owner_0.Value ~= "" then
                v30();
            else
                v29();
            end;
            v27.ActionText = "Claim Booth";
            v27.ObjectText = "";
            if l_Owner_0.Value ~= "" then
                if l_Owner_0.Value == l_LocalPlayer_0.Name then
                    v27.ActionText = "Edit Text";
                    return;
                else
                    v27.ActionText = "Send Offer";
                    v27.ObjectText = "Trade " .. l_Owner_0.Value;
                end;
            end;
        end);
        v27.PromptShown:Connect(function() --[[ Line: 93 ]]
            -- upvalues: v27 (copy), l_Owner_0 (copy), l_LocalPlayer_0 (copy)
            v27.ActionText = "Claim Booth";
            v27.ObjectText = "";
            if l_Owner_0.Value ~= "" then
                if l_Owner_0.Value == l_LocalPlayer_0.Name then
                    v27.ActionText = "Edit Text";
                    return;
                else
                    v27.ActionText = "Send Offer";
                    v27.ObjectText = "Trade " .. l_Owner_0.Value;
                end;
            end;
        end);
        v27.Triggered:Connect(function() --[[ Line: 97 ]]
            -- upvalues: l_Owner_0 (copy), l_LocalPlayer_0 (copy), l_SoundHelper_0 (copy), l_UIHelper_0 (copy), v9 (copy), v21 (copy), v10 (copy), l_Booths_0 (copy), v8 (copy)
            if l_Owner_0.Value ~= "" then
                if l_Owner_0.Value == l_LocalPlayer_0.Name then
                    l_SoundHelper_0:PlaySound({
                        Name = "Pop", 
                        Parent = workspace
                    });
                    l_UIHelper_0.CreateTextPrompt("EDIT BOOTH TEXT").Execute.Event:Connect(function(v33) --[[ Line: 107 ]]
                        -- upvalues: v9 (ref), v21 (ref), l_SoundHelper_0 (ref)
                        v9:Fire({
                            v21, 
                            v33
                        });
                        l_SoundHelper_0:PlaySound({
                            Name = "Bell", 
                            Parent = workspace
                        });
                    end);
                    return;
                else
                    l_SoundHelper_0:PlaySound({
                        Name = "Bonus", 
                        Parent = workspace
                    });
                    v10:Fire(l_Owner_0.Value);
                    return;
                end;
            else
                for _, v35 in l_Booths_0:GetChildren() do
                    local l_Owner_1 = v35:FindFirstChild("Owner");
                    if l_Owner_1 and l_Owner_1.Value == l_LocalPlayer_0.Name then
                        return;
                    end;
                end;
                v8:Fire(v21);
                l_SoundHelper_0:PlaySound({
                    Name = "Claim", 
                    Parent = workspace
                });
                l_UIHelper_0.CreateTextPrompt("SET BOOTH TEXT").Execute.Event:Connect(function(v37) --[[ Line: 142 ]]
                    -- upvalues: v9 (ref), v21 (ref), l_SoundHelper_0 (ref)
                    v9:Fire({
                        v21, 
                        v37
                    });
                    l_SoundHelper_0:PlaySound({
                        Name = "Bell", 
                        Parent = workspace
                    });
                end);
                return;
            end;
        end);
    end;
    return;
end;