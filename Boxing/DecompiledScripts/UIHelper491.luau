local v0 = false;
local l_Players_0 = game:GetService("Players");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("ReplicatedFirst");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v8;
if game:GetService("RunService"):IsClient() then
    v8 = shared.BridgeNet2;
    if not v8 then
        repeat
            task.wait();
        until shared.BridgeNet2;
        v8 = shared.BridgeNet2;
        v0 = v8;
    else
        v0 = true;
    end;
end;
if not v0 then
    if not v0 then
        v8 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
    end;
end;
v0 = false;
local _ = v8.ReferenceBridge("TeleportToGoodServer");
local v10 = v8.ReferenceBridge("TeleportToSameServer");
local v11 = v8.ReferenceBridge("BuyLuckyCratesBridge");
local v12 = v8.ReferenceBridge("BuyCash");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_MouseOver_0 = require(l_ReplicatedStorage_0:WaitForChild("MouseOver"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local l_Common_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local function _(v19, v20, v21) --[[ Line: 24 ]] --[[ Name: Lerp ]]
    return v19 + (v20 - v19) * v21;
end;
return {
    CreateYesNoPrompt = function(v23) --[[ Line: 28 ]] --[[ Name: CreateYesNoPrompt ]]
        -- upvalues: l_Common_0 (copy), l_UserInputService_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_MouseOver_0 (copy), l_Players_0 (copy)
        for _, v25 in l_Common_0:GetChildren() do
            if v25.Name == "PromptRemove" then
                v25:Destroy();
            end;
        end;
        local v26 = l_Common_0.YesNoPrompt:Clone();
        v26.Name = "PromptRemove";
        v26.Parent = l_Common_0;
        v26.Visible = true;
        if l_UserInputService_0.TouchEnabled and not (l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled) then
            for _, v28 in v26:GetDescendants() do
                if v28:IsA("UIStroke") then
                    v28.Thickness = 1.4;
                end;
            end;
            v26.Prompt.Size = UDim2.new(0.75, 0, 0.18, 0);
        end;
        local l_Prompt_0 = v26.Prompt;
        l_Prompt_0.Results.Top.Message.Text = v23;
        local l_Blur_0 = v26.Blur;
        local l_BackgroundTransparency_0 = l_Blur_0.BackgroundTransparency;
        l_Blur_0.BackgroundTransparency = 1;
        l_TweenService_0:Create(l_Blur_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            BackgroundTransparency = l_BackgroundTransparency_0
        }):Play();
        local v32 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local v35 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local l_Size_0 = l_Prompt_0.Size;
        l_SoundHelper_0:PlaySound({
            Name = "ButtonUI", 
            Parent = l_Workspace_0
        });
        l_Prompt_0.Size = UDim2.new(0, 0, 0, 0);
        l_Prompt_0.Visible = true;
        l_TweenService_0:Create(l_Prompt_0, v32, {
            Size = UDim2.new(l_Size_0.X.Scale * 1, 0, l_Size_0.Y.Scale * 0.1, 0)
        }):Play();
        task.wait(0.1);
        l_TweenService_0:Create(l_Prompt_0, v32, {
            Size = l_Size_0
        }):Play();
        task.delay(0.2, function() --[[ Line: 80 ]]
            -- upvalues: v26 (copy)
            v26.ImageButton.ZIndex = 500;
        end);
        local v37 = false;
        local v38 = nil;
        local function v39() --[[ Line: 88 ]] --[[ Name: Close ]]
            -- upvalues: v37 (ref), v38 (ref), v26 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref), l_Blur_0 (copy), l_Prompt_0 (copy), v32 (copy), l_Size_0 (copy)
            if v37 then
                return;
            else
                v37 = true;
                if v38 then
                    v38:Disconnect();
                end;
                v26.ImageButton.Visible = false;
                l_SoundHelper_0:PlaySound({
                    Name = "Close", 
                    Parent = l_Workspace_0
                });
                l_TweenService_0:Create(l_Blur_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 1
                }):Play();
                l_TweenService_0:Create(l_Prompt_0, v32, {
                    Size = UDim2.new(l_Size_0.X.Scale, 0, 0, 0)
                }):Play();
                task.wait(0.1);
                l_TweenService_0:Create(l_Prompt_0, v32, {
                    Size = UDim2.new(0, 0, 0, 0)
                }):Play();
                task.wait(0.225);
                l_Prompt_0.Visible = false;
                task.wait(3);
                v26:Destroy();
                return;
            end;
        end;
        l_Prompt_0.Close.Button.MouseButton1Up:Connect(function() --[[ Line: 113 ]]
            -- upvalues: v39 (copy)
            v39();
        end);
        local function v45(v40) --[[ Line: 117 ]] --[[ Name: Button ]]
            -- upvalues: l_MouseOver_0 (ref), l_TweenService_0 (ref), v35 (copy), v26 (copy), v39 (copy)
            local l_Size_1 = v40.Size;
            local v42, v43 = l_MouseOver_0.MouseEnterLeaveEvent(v40);
            local v44 = true;
            v42:Connect(function() --[[ Line: 123 ]]
                -- upvalues: v44 (ref)
                v44 = true;
            end);
            v43:Connect(function() --[[ Line: 127 ]]
                -- upvalues: v44 (ref), l_TweenService_0 (ref), v40 (copy), v35 (ref), l_Size_1 (copy)
                v44 = false;
                l_TweenService_0:Create(v40, v35, {
                    Size = l_Size_1
                }):Play();
            end);
            v40.Button.MouseButton1Down:Connect(function() --[[ Line: 132 ]]
                -- upvalues: l_TweenService_0 (ref), v40 (copy), v35 (ref)
                l_TweenService_0:Create(v40, v35, {
                    Size = UDim2.new(v40.Size.X.Scale * 0.95, 0, v40.Size.Y.Scale * 0.9, 0)
                }):Play();
            end);
            v40.Button.MouseButton1Up:Connect(function() --[[ Line: 136 ]]
                -- upvalues: l_TweenService_0 (ref), v40 (copy), v35 (ref), l_Size_1 (copy), v44 (ref), v26 (ref), v39 (ref)
                l_TweenService_0:Create(v40, v35, {
                    Size = l_Size_1
                }):Play();
                if not v44 then
                    return;
                else
                    if v40.Parent.Name == "Yes" then
                        v26.Execute:Fire(true);
                    end;
                    v39();
                    return;
                end;
            end);
        end;
        v45(l_Prompt_0.No.Button);
        v45(l_Prompt_0.Yes.Button);
        v38 = l_Workspace_0:WaitForChild("States"):WaitForChild(l_Players_0.LocalPlayer.Name):WaitForChild("CharacterData"):WaitForChild("CurrentRingStats").Changed:Connect(function(v46) --[[ Line: 156 ]]
            -- upvalues: v39 (copy)
            if v46 then
                v39();
            end;
        end);
        return v26;
    end, 
    CreateBuyCashPrompt = function() --[[ Line: 165 ]] --[[ Name: CreateBuyCashPrompt ]]
        -- upvalues: l_Common_0 (copy), l_UserInputService_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_MouseOver_0 (copy), v12 (copy), l_Players_0 (copy)
        for _, v48 in l_Common_0:GetChildren() do
            if v48.Name == "PromptRemove" then
                v48:Destroy();
            end;
        end;
        local v49 = l_Common_0.BuyCash:Clone();
        v49.Name = "PromptRemove";
        v49.Parent = l_Common_0;
        v49.Visible = true;
        if l_UserInputService_0.TouchEnabled and not (l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled) then
            for _, v51 in v49:GetDescendants() do
                if v51:IsA("UIStroke") then
                    v51.Thickness = 1.4;
                end;
            end;
            v49.Main.Size = UDim2.new(v49.Main.Size.X.Scale * 1.25, 0, v49.Main.Size.Y.Scale * 1.25, 0);
        end;
        local l_Main_1 = v49.Main;
        local l_Blur_1 = v49.Blur;
        local l_BackgroundTransparency_1 = l_Blur_1.BackgroundTransparency;
        l_Blur_1.BackgroundTransparency = 1;
        l_TweenService_0:Create(l_Blur_1, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            BackgroundTransparency = l_BackgroundTransparency_1
        }):Play();
        local v55 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local v58 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local l_Size_2 = l_Main_1.Size;
        l_SoundHelper_0:PlaySound({
            Name = "ButtonUI", 
            Parent = l_Workspace_0
        });
        l_Main_1.Size = UDim2.new(0, 0, 0, 0);
        l_Main_1.Visible = true;
        l_TweenService_0:Create(l_Main_1, v55, {
            Size = UDim2.new(l_Size_2.X.Scale * 1, 0, l_Size_2.Y.Scale * 0.1, 0)
        }):Play();
        task.wait(0.1);
        l_TweenService_0:Create(l_Main_1, v55, {
            Size = l_Size_2
        }):Play();
        task.delay(0.2, function() --[[ Line: 216 ]]
            -- upvalues: v49 (copy)
            v49.ImageButton.ZIndex = 500;
        end);
        local v60 = false;
        local v61 = nil;
        local function v62() --[[ Line: 224 ]] --[[ Name: Close ]]
            -- upvalues: v60 (ref), v61 (ref), v49 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref), l_Blur_1 (copy), l_Main_1 (copy), v55 (copy), l_Size_2 (copy)
            if v60 then
                return;
            else
                v60 = true;
                if v61 then
                    v61:Disconnect();
                end;
                v49.ImageButton.Visible = false;
                l_SoundHelper_0:PlaySound({
                    Name = "Close", 
                    Parent = l_Workspace_0
                });
                l_TweenService_0:Create(l_Blur_1, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 1
                }):Play();
                l_TweenService_0:Create(l_Main_1, v55, {
                    Size = UDim2.new(l_Size_2.X.Scale, 0, 0, 0)
                }):Play();
                task.wait(0.1);
                l_TweenService_0:Create(l_Main_1, v55, {
                    Size = UDim2.new(0, 0, 0, 0)
                }):Play();
                task.wait(0.225);
                v49.Main:Destroy();
                task.wait(3);
                v49:Destroy();
                return;
            end;
        end;
        l_Main_1.Close.Button.MouseButton1Up:Connect(function() --[[ Line: 249 ]]
            -- upvalues: v62 (copy)
            v62();
        end);
        local function v68(v63) --[[ Line: 253 ]] --[[ Name: Button ]]
            -- upvalues: l_MouseOver_0 (ref), l_TweenService_0 (ref), v58 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), v12 (ref)
            local l_Size_3 = v63.Size;
            local v65, v66 = l_MouseOver_0.MouseEnterLeaveEvent(v63);
            local v67 = true;
            v65:Connect(function() --[[ Line: 259 ]]
                -- upvalues: v67 (ref)
                v67 = true;
            end);
            v66:Connect(function() --[[ Line: 263 ]]
                -- upvalues: v67 (ref), l_TweenService_0 (ref), v63 (copy), v58 (ref), l_Size_3 (copy)
                v67 = false;
                l_TweenService_0:Create(v63, v58, {
                    Size = l_Size_3
                }):Play();
            end);
            v63.Button.MouseButton1Down:Connect(function() --[[ Line: 268 ]]
                -- upvalues: l_TweenService_0 (ref), v63 (copy), v58 (ref)
                l_TweenService_0:Create(v63, v58, {
                    Size = UDim2.new(v63.Size.X.Scale * 0.93, 0, v63.Size.Y.Scale * 0.93, 0)
                }):Play();
            end);
            v63.Button.MouseButton1Up:Connect(function() --[[ Line: 272 ]]
                -- upvalues: l_TweenService_0 (ref), v63 (copy), v58 (ref), l_Size_3 (copy), v67 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), v12 (ref)
                l_TweenService_0:Create(v63, v58, {
                    Size = l_Size_3
                }):Play();
                if not v67 then
                    return;
                else
                    l_SoundHelper_0:PlaySound({
                        Name = "ButtonUI", 
                        Parent = l_Workspace_0
                    });
                    v12:Fire(v63.Name);
                    return;
                end;
            end);
        end;
        v68(l_Main_1.Five);
        v68(l_Main_1.Fifteen);
        v68(l_Main_1.Fifty);
        v61 = l_Workspace_0:WaitForChild("States"):WaitForChild(l_Players_0.LocalPlayer.Name):WaitForChild("CharacterData"):WaitForChild("CurrentRingStats").Changed:Connect(function(v69) --[[ Line: 293 ]]
            -- upvalues: v62 (copy)
            if v69 then
                v62();
            end;
        end);
        return v49;
    end, 
    CrateBuyLuckyCrates = function() --[[ Line: 302 ]] --[[ Name: CrateBuyLuckyCrates ]]
        -- upvalues: l_Common_0 (copy), v11 (copy), l_UserInputService_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_MouseOver_0 (copy), l_Players_0 (copy)
        for _, v71 in l_Common_0:GetChildren() do
            if v71.Name == "PromptRemove" then
                v71:Destroy();
            end;
        end;
        v11:Fire(false);
        local v72 = l_Common_0.BuyLuckyCrates:Clone();
        v72.Name = "PromptRemove";
        v72.Parent = l_Common_0;
        v72.Visible = true;
        if l_UserInputService_0.TouchEnabled and not (l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled) then
            for _, v74 in v72:GetDescendants() do
                if v74:IsA("UIStroke") then
                    v74.Thickness = 1.4;
                end;
            end;
            v72.Main.Size = UDim2.new(v72.Main.Size.X.Scale * 1.5, 0, v72.Main.Size.Y.Scale * 1.5, 0);
        end;
        local l_Main_2 = v72.Main;
        local l_Blur_2 = v72.Blur;
        local l_BackgroundTransparency_2 = l_Blur_2.BackgroundTransparency;
        l_Blur_2.BackgroundTransparency = 1;
        l_TweenService_0:Create(l_Blur_2, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            BackgroundTransparency = l_BackgroundTransparency_2
        }):Play();
        local v78 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local v81 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local l_Size_4 = l_Main_2.Size;
        l_SoundHelper_0:PlaySound({
            Name = "ButtonUI", 
            Parent = l_Workspace_0
        });
        l_Main_2.Size = UDim2.new(0, 0, 0, 0);
        l_Main_2.Visible = true;
        l_TweenService_0:Create(l_Main_2, v78, {
            Size = UDim2.new(l_Size_4.X.Scale * 1, 0, l_Size_4.Y.Scale * 0.1, 0)
        }):Play();
        task.wait(0.1);
        l_TweenService_0:Create(l_Main_2, v78, {
            Size = l_Size_4
        }):Play();
        task.delay(0.2, function() --[[ Line: 355 ]]
            -- upvalues: v72 (copy)
            v72.ImageButton.ZIndex = 500;
        end);
        local v83 = false;
        local v84 = nil;
        local function v85() --[[ Line: 363 ]] --[[ Name: Close ]]
            -- upvalues: v83 (ref), v84 (ref), v72 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref), l_Blur_2 (copy), l_Main_2 (copy), v78 (copy), l_Size_4 (copy)
            if v83 then
                return;
            else
                v83 = true;
                if v84 then
                    v84:Disconnect();
                end;
                v72.ImageButton.Visible = false;
                l_SoundHelper_0:PlaySound({
                    Name = "Close", 
                    Parent = l_Workspace_0
                });
                l_TweenService_0:Create(l_Blur_2, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 1
                }):Play();
                l_TweenService_0:Create(l_Main_2, v78, {
                    Size = UDim2.new(l_Size_4.X.Scale, 0, 0, 0)
                }):Play();
                task.wait(0.1);
                l_TweenService_0:Create(l_Main_2, v78, {
                    Size = UDim2.new(0, 0, 0, 0)
                }):Play();
                task.wait(0.225);
                v72.Main:Destroy();
                task.wait(3);
                v72:Destroy();
                return;
            end;
        end;
        l_Main_2.Close.Button.MouseButton1Up:Connect(function() --[[ Line: 388 ]]
            -- upvalues: v85 (copy)
            v85();
        end);
        (function(v86) --[[ Line: 392 ]] --[[ Name: Button ]]
            -- upvalues: l_MouseOver_0 (ref), l_TweenService_0 (ref), v81 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), v11 (ref)
            local l_Size_5 = v86.Size;
            local v88, v89 = l_MouseOver_0.MouseEnterLeaveEvent(v86);
            local v90 = true;
            v88:Connect(function() --[[ Line: 398 ]]
                -- upvalues: v90 (ref)
                v90 = true;
            end);
            v89:Connect(function() --[[ Line: 402 ]]
                -- upvalues: v90 (ref), l_TweenService_0 (ref), v86 (copy), v81 (ref), l_Size_5 (copy)
                v90 = false;
                l_TweenService_0:Create(v86, v81, {
                    Size = l_Size_5
                }):Play();
            end);
            v86.Button.MouseButton1Down:Connect(function() --[[ Line: 407 ]]
                -- upvalues: l_TweenService_0 (ref), v86 (copy), v81 (ref)
                l_TweenService_0:Create(v86, v81, {
                    Size = UDim2.new(v86.Size.X.Scale * 0.93, 0, v86.Size.Y.Scale * 0.93, 0)
                }):Play();
            end);
            v86.Button.MouseButton1Up:Connect(function() --[[ Line: 411 ]]
                -- upvalues: l_TweenService_0 (ref), v86 (copy), v81 (ref), l_Size_5 (copy), v90 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), v11 (ref)
                l_TweenService_0:Create(v86, v81, {
                    Size = l_Size_5
                }):Play();
                if not v90 then
                    return;
                else
                    l_SoundHelper_0:PlaySound({
                        Name = "ButtonUI", 
                        Parent = l_Workspace_0
                    });
                    v11:Fire(false);
                    return;
                end;
            end);
        end)(l_Main_2.Fifty);
        v84 = l_Workspace_0:WaitForChild("States"):WaitForChild(l_Players_0.LocalPlayer.Name):WaitForChild("CharacterData"):WaitForChild("CurrentRingStats").Changed:Connect(function(v91) --[[ Line: 430 ]]
            -- upvalues: v85 (copy)
            if v91 then
                v85();
            end;
        end);
        return v72;
    end, 
    CreateTextPrompt = function(v92) --[[ Line: 439 ]] --[[ Name: CreateTextPrompt ]]
        -- upvalues: l_Common_0 (copy), l_UserInputService_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Workspace_0 (copy), l_MouseOver_0 (copy), l_Players_0 (copy)
        for _, v94 in l_Common_0:GetChildren() do
            if v94.Name == "PromptRemove" then
                v94:Destroy();
            end;
        end;
        local v95 = l_Common_0.TextPrompt:Clone();
        v95.Name = "PromptRemove";
        v95.Parent = l_Common_0;
        v95.Visible = true;
        if l_UserInputService_0.TouchEnabled and not (l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled) then
            for _, v97 in v95:GetDescendants() do
                if v97:IsA("UIStroke") then
                    v97.Thickness = 1.4;
                end;
            end;
            v95.Prompt.Size = UDim2.new(0.975, 0, 0.18, 0);
        end;
        local l_Prompt_1 = v95.Prompt;
        l_Prompt_1.Results.Top.Message.Text = v92;
        local l_Blur_3 = v95.Blur;
        local l_BackgroundTransparency_3 = l_Blur_3.BackgroundTransparency;
        l_Blur_3.BackgroundTransparency = 1;
        l_TweenService_0:Create(l_Blur_3, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            BackgroundTransparency = l_BackgroundTransparency_3
        }):Play();
        local v101 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local v104 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local l_Size_6 = l_Prompt_1.Size;
        l_SoundHelper_0:PlaySound({
            Name = "ButtonUI", 
            Parent = l_Workspace_0
        });
        l_Prompt_1.Size = UDim2.new(0, 0, 0, 0);
        l_Prompt_1.Visible = true;
        l_TweenService_0:Create(l_Prompt_1, v101, {
            Size = UDim2.new(l_Size_6.X.Scale * 1, 0, l_Size_6.Y.Scale * 0.1, 0)
        }):Play();
        task.wait(0.1);
        l_TweenService_0:Create(l_Prompt_1, v101, {
            Size = l_Size_6
        }):Play();
        task.delay(0.2, function() --[[ Line: 491 ]]
            -- upvalues: v95 (copy)
            v95.ImageButton.ZIndex = 500;
        end);
        local v106 = false;
        local v107 = nil;
        local function v108() --[[ Line: 499 ]] --[[ Name: Close ]]
            -- upvalues: v106 (ref), v107 (ref), v95 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_TweenService_0 (ref), l_Blur_3 (copy), l_Prompt_1 (copy), v101 (copy), l_Size_6 (copy)
            if v106 then
                return;
            else
                v106 = true;
                if v107 then
                    v107:Disconnect();
                end;
                v95.ImageButton.Visible = false;
                l_SoundHelper_0:PlaySound({
                    Name = "Close", 
                    Parent = l_Workspace_0
                });
                l_TweenService_0:Create(l_Blur_3, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 1
                }):Play();
                l_TweenService_0:Create(l_Prompt_1, v101, {
                    Size = UDim2.new(l_Size_6.X.Scale, 0, 0, 0)
                }):Play();
                task.wait(0.1);
                l_TweenService_0:Create(l_Prompt_1, v101, {
                    Size = UDim2.new(0, 0, 0, 0)
                }):Play();
                task.wait(0.225);
                v95.Prompt:Destroy();
                task.wait(3);
                v95:Destroy();
                return;
            end;
        end;
        l_Prompt_1.Close.Button.MouseButton1Up:Connect(function() --[[ Line: 525 ]]
            -- upvalues: v108 (copy)
            v108();
        end);
        (function(v109) --[[ Line: 529 ]] --[[ Name: Button ]]
            -- upvalues: l_MouseOver_0 (ref), l_TweenService_0 (ref), v104 (copy), v95 (copy), l_Prompt_1 (copy), v108 (copy)
            local l_Size_7 = v109.Size;
            local v111, v112 = l_MouseOver_0.MouseEnterLeaveEvent(v109);
            local v113 = true;
            v111:Connect(function() --[[ Line: 535 ]]
                -- upvalues: v113 (ref)
                v113 = true;
            end);
            v112:Connect(function() --[[ Line: 539 ]]
                -- upvalues: v113 (ref), l_TweenService_0 (ref), v109 (copy), v104 (ref), l_Size_7 (copy)
                v113 = false;
                l_TweenService_0:Create(v109, v104, {
                    Size = l_Size_7
                }):Play();
            end);
            v109.Button.MouseButton1Down:Connect(function() --[[ Line: 544 ]]
                -- upvalues: l_TweenService_0 (ref), v109 (copy), v104 (ref)
                l_TweenService_0:Create(v109, v104, {
                    Size = UDim2.new(v109.Size.X.Scale * 0.95, 0, v109.Size.Y.Scale * 0.9, 0)
                }):Play();
            end);
            v109.Button.MouseButton1Up:Connect(function() --[[ Line: 548 ]]
                -- upvalues: l_TweenService_0 (ref), v109 (copy), v104 (ref), l_Size_7 (copy), v113 (ref), v95 (ref), l_Prompt_1 (ref), v108 (ref)
                l_TweenService_0:Create(v109, v104, {
                    Size = l_Size_7
                }):Play();
                if not v113 then
                    return;
                else
                    v95.Execute:Fire(l_Prompt_1.TextFrame.TextBox.Text);
                    v108();
                    return;
                end;
            end);
        end)(l_Prompt_1.Confirm.Button);
        v107 = l_Workspace_0:WaitForChild("States"):WaitForChild(l_Players_0.LocalPlayer.Name):WaitForChild("CharacterData"):WaitForChild("CurrentRingStats").Changed:Connect(function(v114) --[[ Line: 564 ]]
            -- upvalues: v108 (copy)
            if v114 then
                v108();
            end;
        end);
        return v95;
    end, 
    CreatePingTeleportPrompt = function() --[[ Line: 573 ]] --[[ Name: CreatePingTeleportPrompt ]]
        -- upvalues: l_Common_0 (copy), l_UserInputService_0 (copy), l_Workspace_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_MouseOver_0 (copy), l_ReplicatedStorage_0 (copy), l_Players_0 (copy), v10 (copy)
        local v115 = tick();
        local v116 = l_Common_0.PingPrompt:Clone();
        v116.Parent = l_Common_0;
        local l_Default_0 = v116.Default;
        if l_UserInputService_0.TouchEnabled and not (l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled) then
            for _, v119 in l_Default_0:GetDescendants() do
                if v119:IsA("UIStroke") then
                    v119.Thickness = 1.4;
                end;
            end;
            v116.Mobile.Visible = true;
            l_Default_0 = v116.Mobile;
        else
            l_Workspace_0.HideRightFrame.Value = true;
            task.wait(0.2);
            v116.Default.Visible = true;
        end;
        local function _() --[[ Line: 599 ]] --[[ Name: UpdateTopText ]]
            -- upvalues: l_Default_0 (ref), l_Workspace_0 (ref)
            l_Default_0.Results.Top.Top.Text = "THIS SERVER HAS HIGH PING: " .. tonumber(string.format("%.0f", l_Workspace_0.Ping.Value * 1000)) .. " MS";
        end;
        l_Default_0.Results.Top.Top.Text = "THIS SERVER HAS HIGH PING: " .. tonumber(string.format("%.0f", l_Workspace_0.Ping.Value * 1000)) .. " MS";
        local v121 = nil;
        v121 = l_Workspace_0.Ping.Changed:Connect(function() --[[ Line: 606 ]]
            -- upvalues: l_Default_0 (ref), l_Workspace_0 (ref)
            l_Default_0.Results.Top.Top.Text = "THIS SERVER HAS HIGH PING: " .. tonumber(string.format("%.0f", l_Workspace_0.Ping.Value * 1000)) .. " MS";
        end);
        local v122 = nil;
        v122 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 611 ]]
            -- upvalues: v115 (copy), l_Default_0 (ref)
            local v123 = math.clamp((tick() - v115) / 30, 0, 1);
            l_Default_0.Progress.Main.Size = UDim2.new(1 + -1 * v123, 0, 1, 0);
        end);
        local l_ImageTransparency_0 = l_Default_0.Glow.ImageTransparency;
        l_Default_0.Glow.ImageTransparency = 1;
        l_TweenService_0:Create(l_Default_0.Glow, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            ImageTransparency = l_ImageTransparency_0
        }):Play();
        local v125 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local v126 = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local v128 = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
        local l_Size_8 = l_Default_0.Size;
        task.delay(0.2, function() --[[ Line: 629 ]]
            -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
            l_SoundHelper_0:PlaySound({
                Name = "PingAlert", 
                Parent = l_Workspace_0
            });
        end);
        local l_Position_0 = l_Default_0.Position;
        local v131 = UDim2.new(l_Default_0.Position.X.Scale + 0.5, 0, l_Default_0.Position.Y.Scale, 0);
        l_Default_0.Position = v131;
        v116.Visible = true;
        l_TweenService_0:Create(l_Default_0, v128, {
            Position = l_Position_0
        }):Play();
        v131 = false;
        local function v132() --[[ Line: 645 ]] --[[ Name: Close ]]
            -- upvalues: v131 (ref), v121 (ref), v122 (ref), l_Workspace_0 (ref), l_SoundHelper_0 (ref), l_TweenService_0 (ref), l_Default_0 (ref), v125 (copy), l_Size_8 (copy), v116 (copy)
            if v131 then
                return;
            else
                v131 = true;
                if v121 then
                    v121:Disconnect();
                end;
                if v122 then
                    v122:Disconnect();
                end;
                l_Workspace_0.HideRightFrame.Value = false;
                l_SoundHelper_0:PlaySound({
                    Name = "Close", 
                    Parent = l_Workspace_0
                });
                l_TweenService_0:Create(l_Default_0.Glow, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(l_Default_0, v125, {
                    Size = UDim2.new(l_Size_8.X.Scale, 0, 0, 0)
                }):Play();
                task.wait(0.1);
                l_TweenService_0:Create(l_Default_0, v125, {
                    Size = UDim2.new(0, 0, 0, 0)
                }):Play();
                task.wait(0.225);
                l_Default_0:Destroy();
                task.wait(3);
                v116:Destroy();
                return;
            end;
        end;
        local function v138(v133) --[[ Line: 672 ]] --[[ Name: Button ]]
            -- upvalues: l_MouseOver_0 (ref), l_TweenService_0 (ref), v126 (copy), l_ReplicatedStorage_0 (ref), l_Players_0 (ref), v10 (ref), l_Workspace_0 (ref), v132 (copy)
            local l_Size_9 = v133.Size;
            local v135, v136 = l_MouseOver_0.MouseEnterLeaveEvent(v133);
            local v137 = true;
            v135:Connect(function() --[[ Line: 678 ]]
                -- upvalues: v137 (ref)
                v137 = true;
            end);
            v136:Connect(function() --[[ Line: 682 ]]
                -- upvalues: v137 (ref), l_TweenService_0 (ref), v133 (copy), v126 (ref), l_Size_9 (copy)
                v137 = false;
                l_TweenService_0:Create(v133, v126, {
                    Size = l_Size_9
                }):Play();
            end);
            v133.Button.MouseButton1Down:Connect(function() --[[ Line: 687 ]]
                -- upvalues: l_TweenService_0 (ref), v133 (copy), v126 (ref)
                l_TweenService_0:Create(v133, v126, {
                    Size = UDim2.new(v133.Size.X.Scale * 0.95, 0, v133.Size.Y.Scale * 0.9, 0)
                }):Play();
            end);
            v133.Button.MouseButton1Up:Connect(function() --[[ Line: 691 ]]
                -- upvalues: l_TweenService_0 (ref), v133 (copy), v126 (ref), l_Size_9 (copy), v137 (ref), l_ReplicatedStorage_0 (ref), l_Players_0 (ref), v10 (ref), l_Workspace_0 (ref), v132 (ref)
                l_TweenService_0:Create(v133, v126, {
                    Size = l_Size_9
                }):Play();
                if not v137 then
                    return;
                else
                    if v133.Parent.Name == "Yes" then
                        l_ReplicatedStorage_0.Events.UsedFeatureBind:Fire(l_Players_0.LocalPlayer, "UsedPingJoinSB");
                        v10:Fire(l_Workspace_0.Ping.Value * 1000);
                    end;
                    v132();
                    return;
                end;
            end);
        end;
        v138(l_Default_0.No.Button);
        v138(l_Default_0.Yes.Button);
        task.delay(30, function() --[[ Line: 708 ]]
            -- upvalues: v132 (copy)
            v132();
        end);
        return l_Default_0;
    end, 
    CreateSameTeleportPrompt = function() --[[ Line: 715 ]] --[[ Name: CreateSameTeleportPrompt ]]
        -- upvalues: l_Common_0 (copy), l_UserInputService_0 (copy), l_Workspace_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_MouseOver_0 (copy), l_ReplicatedStorage_0 (copy), l_Players_0 (copy), v10 (copy)
        local v139 = tick();
        local v140 = l_Common_0.PingPrompt:Clone();
        v140.Parent = l_Common_0;
        local l_Default_1 = v140.Default;
        if l_UserInputService_0.TouchEnabled and not (l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled) then
            for _, v143 in l_Default_1:GetDescendants() do
                if v143:IsA("UIStroke") then
                    v143.Thickness = 1.4;
                end;
            end;
            v140.Mobile.Visible = true;
            l_Default_1 = v140.Mobile;
        else
            l_Workspace_0.HideRightFrame.Value = true;
            task.wait(0.2);
            v140.Default.Visible = true;
        end;
        l_Default_1.Results.Top.Top.Text = "REJOINING IMPROVES FPS!";
        l_Default_1.Results.Top.Bottom.Text = "REJOIN SAME SERVER?";
        local v144 = nil;
        v144 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 745 ]]
            -- upvalues: v139 (copy), l_Default_1 (ref)
            local v145 = math.clamp((tick() - v139) / 15, 0, 1);
            l_Default_1.Progress.Main.Size = UDim2.new(1 + -1 * v145, 0, 1, 0);
        end);
        local l_ImageTransparency_1 = l_Default_1.Glow.ImageTransparency;
        l_Default_1.Glow.ImageTransparency = 1;
        l_TweenService_0:Create(l_Default_1.Glow, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            ImageTransparency = l_ImageTransparency_1
        }):Play();
        local v147 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local v148 = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local v150 = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
        local l_Size_10 = l_Default_1.Size;
        task.delay(0.2, function() --[[ Line: 763 ]]
            -- upvalues: l_SoundHelper_0 (ref), l_Workspace_0 (ref)
            l_SoundHelper_0:PlaySound({
                Name = "PingAlert", 
                Parent = l_Workspace_0
            });
        end);
        local l_Position_1 = l_Default_1.Position;
        local v153 = UDim2.new(l_Default_1.Position.X.Scale + 0.5, 0, l_Default_1.Position.Y.Scale, 0);
        l_Default_1.Position = v153;
        v140.Visible = true;
        l_TweenService_0:Create(l_Default_1, v150, {
            Position = l_Position_1
        }):Play();
        v153 = false;
        local v154 = nil;
        local function v155() --[[ Line: 780 ]] --[[ Name: Close ]]
            -- upvalues: v153 (ref), v154 (ref), v144 (ref), l_Workspace_0 (ref), l_SoundHelper_0 (ref), l_TweenService_0 (ref), l_Default_1 (ref), v147 (copy), l_Size_10 (copy), v140 (copy)
            if v153 then
                return;
            else
                v153 = true;
                if v154 then
                    v154:Disconnect();
                end;
                if v144 then
                    v144:Disconnect();
                end;
                l_Workspace_0.HideRightFrame.Value = false;
                l_SoundHelper_0:PlaySound({
                    Name = "Close", 
                    Parent = l_Workspace_0
                });
                l_TweenService_0:Create(l_Default_1.Glow, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ImageTransparency = 1
                }):Play();
                l_TweenService_0:Create(l_Default_1, v147, {
                    Size = UDim2.new(l_Size_10.X.Scale, 0, 0, 0)
                }):Play();
                task.wait(0.1);
                l_TweenService_0:Create(l_Default_1, v147, {
                    Size = UDim2.new(0, 0, 0, 0)
                }):Play();
                task.wait(0.225);
                l_Default_1:Destroy();
                task.wait(3);
                v140:Destroy();
                return;
            end;
        end;
        local function v161(v156) --[[ Line: 807 ]] --[[ Name: Button ]]
            -- upvalues: l_MouseOver_0 (ref), l_TweenService_0 (ref), v148 (copy), l_ReplicatedStorage_0 (ref), l_Players_0 (ref), v10 (ref), v155 (copy)
            local l_Size_11 = v156.Size;
            local v158, v159 = l_MouseOver_0.MouseEnterLeaveEvent(v156);
            local v160 = true;
            v158:Connect(function() --[[ Line: 813 ]]
                -- upvalues: v160 (ref)
                v160 = true;
            end);
            v159:Connect(function() --[[ Line: 817 ]]
                -- upvalues: v160 (ref), l_TweenService_0 (ref), v156 (copy), v148 (ref), l_Size_11 (copy)
                v160 = false;
                l_TweenService_0:Create(v156, v148, {
                    Size = l_Size_11
                }):Play();
            end);
            v156.Button.MouseButton1Down:Connect(function() --[[ Line: 822 ]]
                -- upvalues: l_TweenService_0 (ref), v156 (copy), v148 (ref)
                l_TweenService_0:Create(v156, v148, {
                    Size = UDim2.new(v156.Size.X.Scale * 0.95, 0, v156.Size.Y.Scale * 0.9, 0)
                }):Play();
            end);
            v156.Button.MouseButton1Up:Connect(function() --[[ Line: 826 ]]
                -- upvalues: l_TweenService_0 (ref), v156 (copy), v148 (ref), l_Size_11 (copy), v160 (ref), l_ReplicatedStorage_0 (ref), l_Players_0 (ref), v10 (ref), v155 (ref)
                l_TweenService_0:Create(v156, v148, {
                    Size = l_Size_11
                }):Play();
                if not v160 then
                    return;
                else
                    if v156.Parent.Name == "Yes" then
                        l_ReplicatedStorage_0.Events.UsedFeatureBind:Fire(l_Players_0.LocalPlayer, "UsedSameJoinSB");
                        v10:Fire(false);
                    end;
                    v155();
                    return;
                end;
            end);
        end;
        v161(l_Default_1.No.Button);
        v161(l_Default_1.Yes.Button);
        task.delay(15, function() --[[ Line: 843 ]]
            -- upvalues: v155 (copy)
            v155();
        end);
        v154 = l_Workspace_0:WaitForChild("States"):WaitForChild(l_Players_0.LocalPlayer.Name):WaitForChild("CharacterData"):WaitForChild("CurrentRingStats").Changed:Connect(function(v162) --[[ Line: 851 ]]
            -- upvalues: v155 (copy)
            if v162 then
                v155();
            end;
        end);
        return l_Default_1;
    end
};