local v0 = {};
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("ContentProvider");
local l_TweenService_0 = game:GetService("TweenService");
local l_Lighting_0 = game:GetService("Lighting");
local v6 = require(script.SurfaceGui);
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v8 = false;
local v9 = false;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = {};
local v20 = {
    [Enum.KeyCode.ButtonX] = "X", 
    [Enum.KeyCode.ButtonY] = "Y", 
    [Enum.KeyCode.ButtonB] = "B"
};
local v21 = {
    [Enum.KeyCode.A] = "A", 
    [Enum.KeyCode.S] = "S", 
    [Enum.KeyCode.D] = "D", 
    [Enum.KeyCode.Q] = "Q", 
    [Enum.KeyCode.W] = "W", 
    [Enum.KeyCode.E] = "E"
};
local v22 = {
    "rbxassetid://90208148910046", 
    "rbxassetid://134557340436161", 
    "rbxassetid://77692757667342", 
    "rbxassetid://97291108654787", 
    "rbxassetid://120991165647109"
};
local v23 = {
    "rbxassetid://95447209047361", 
    "rbxassetid://71923226040088", 
    "rbxassetid://130248317115584", 
    "rbxassetid://133670612837836", 
    "rbxassetid://73548255836868", 
    "rbxassetid://88880025519823"
};
local v24 = {
    "rbxassetid://133440952070506", 
    "rbxassetid://78948947694053", 
    "rbxassetid://105851824149619", 
    "rbxassetid://104582670846048", 
    "rbxassetid://85238171294988", 
    "rbxassetid://92148522547250", 
    "rbxassetid://113183588479052"
};
v0.allTextures = {
    v22, 
    v23, 
    v24
};
local _ = function(_, _, v27) --[[ Line: 88 ]] --[[ Name: preloadTextures ]]
    if v27 then
        v27();
    end;
end;
local v29 = Random.new();
local v30 = Vector2.new(0.25, 0.75);
local v31 = Vector2.new(0.55, 1.05);
local v32 = UDim2.new(1.6, 0, 0.75, 0);
local function _() --[[ Line: 119 ]] --[[ Name: GetInterface ]]
    return game.Players.LocalPlayer:GetAttribute("Interface");
end;
local function v35(v34) --[[ Line: 124 ]] --[[ Name: initialize ]]
    -- upvalues: v15 (ref), v12 (ref), v13 (ref), v16 (ref), v14 (ref), v18 (ref), v17 (ref), v32 (copy), v29 (copy), v30 (copy), v31 (copy)
    v15 = v34:WaitForChild("MainFrame");
    v12 = v15:WaitForChild("Key");
    v13 = v15:WaitForChild("Key2");
    v16 = v15:WaitForChild("Start");
    v14 = v15:WaitForChild("Button");
    v18 = v15:WaitForChild("TouchButton");
    v17 = v15:WaitForChild("DefaultButton");
    if game.Players.LocalPlayer:GetAttribute("Interface") == "Touch" then
        v15.Size = v32;
        v15.Position = UDim2.new(v29:NextNumber(v30.X, v30.Y), 0, v29:NextNumber(v31.X, v31.Y), 0);
    end;
end;
local function v52(v36, v37, v38) --[[ Line: 141 ]] --[[ Name: sizeTween ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_Size_0 = v36.Size;
    local v40 = UDim2.new(l_Size_0.X.Scale * v37, 0, l_Size_0.Y.Scale * v37, 0);
    local v41 = TweenInfo.new(v38, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0);
    local v42 = {
        Size = v40
    };
    local v43 = l_TweenService_0:Create(v36, v41, v42);
    v43:Play();
    task.defer(function() --[[ Line: 149 ]]
        -- upvalues: v38 (copy), v36 (copy), l_TweenService_0 (ref)
        if v38 ~= 0.05 and v38 ~= 1.1 then
            if v36:IsA("TextLabel") or v36:IsA("TextButton") then
                local v44 = TweenInfo.new(v38, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                local v45 = {
                    TextTransparency = 1
                };
                l_TweenService_0:Create(v36, v44, v45):Play();
                for _, v47 in v36:GetChildren() do
                    if v47:IsA("UIStroke") then
                        local v48 = TweenInfo.new(v38, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                        local v49 = {
                            Transparency = 1
                        };
                        l_TweenService_0:Create(v47, v48, v49):Play();
                    end;
                end;
            end;
            if v36:IsA("ImageLabel") or v36:IsA("ImageButton") then
                local v50 = TweenInfo.new(v38, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0);
                local v51 = {
                    ImageTransparency = 1
                };
                l_TweenService_0:Create(v36, v50, v51):Play();
            end;
        end;
    end);
    return v43;
end;
local function _(v53) --[[ Line: 179 ]] --[[ Name: getKeyDisplayName ]]
    -- upvalues: v20 (copy), v21 (copy)
    if v20[v53] then
        return v20[v53];
    elseif v21[v53] then
        return v21[v53];
    else
        return v53.Name;
    end;
end;
local function v57(_) --[[ Line: 189 ]] --[[ Name: updateUIForInputType ]]
    -- upvalues: v17 (ref), v14 (ref), v12 (ref), v13 (ref)
    local v56 = game.Players.LocalPlayer:GetAttribute("Interface") == "Touch";
    v17.Visible = not v56;
    v17.Active = false;
    v14.Visible = v56;
    v14.Active = v56;
    v12.Visible = not v56;
    v13.Visible = not v56;
end;
local function v65(v58, v59, v60) --[[ Line: 202 ]] --[[ Name: failedInput ]]
    -- upvalues: v8 (ref), v52 (copy), v12 (ref), v13 (ref), v14 (ref), v17 (ref), v15 (ref), v19 (copy), v11 (ref)
    v8 = false;
    v58 = false;
    v59 = true;
    local v61 = v52(v12, 1, 0.5);
    local v62 = v52(v13, 1, 0.5);
    local _ = v52(v14, 1, 0.5);
    v52(v17, 1, 0.5);
    for v64 = 1, 6 do
        v52(v15[v64], 1, 0.5);
    end;
    v19[#v19 + 1] = v62.Completed:Connect(function() --[[ Line: 217 ]]
        -- upvalues: v61 (copy), v60 (copy), v11 (ref), v58 (ref)
        if v61.Completed then
            if v60.Appear.IsPlaying then
                while v60.Appear.IsPlaying do
                    task.wait(0.01);
                end;
            end;
            v60:Destroy();
            if v11.Connected and not v58 then
                v11:Disconnect();
            end;
        end;
    end);
end;
local function v72(v66, v67, v68, _) --[[ Line: 229 ]] --[[ Name: cleanup ]]
    -- upvalues: v19 (copy), v11 (ref)
    if v66 then
        v66:Destroy();
    end;
    if v67 and v67.Connected then
        v67:Disconnect();
    end;
    if v68 and v68.Connected then
        v68:Disconnect();
    end;
    for _, v71 in v19 do
        v71:Disconnect();
    end;
    if v11 then
        v11:Disconnect();
    end;
end;
v0.start = function(_, v74, v75) --[[ Line: 257 ]] --[[ Name: start ]]
    -- upvalues: v8 (ref), v72 (copy), v10 (ref), v15 (ref), v9 (ref), l_Lighting_0 (copy), l_TweenService_0 (copy), v52 (copy), v23 (copy), v13 (ref), v12 (ref), v11 (ref), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v6 (copy), v35 (copy), v16 (ref), v19 (copy), v22 (copy), l_UserInputService_0 (copy), v57 (copy), v20 (copy), v21 (copy), v17 (ref), v14 (ref), v18 (ref), v65 (copy), v24 (copy)
    if v8 then
        return false;
    else
        local v76 = nil;
        local v77 = nil;
        local v78 = nil;
        local v79 = nil;
        local function _(v80, v81, v82, v83) --[[ Line: 273 ]] --[[ Name: TweenFlipbook ]]
            -- upvalues: v75 (copy), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v77 (ref), v10 (ref), v15 (ref), v9 (ref)
            local v84 = #v81;
            local v85 = {};
            task.spawn(function() --[[ Line: 277 ]]
                -- upvalues: v84 (copy), v75 (ref), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v77 (ref), v10 (ref), v85 (copy), v80 (copy), v15 (ref), v9 (ref), v81 (copy), v83 (copy), v82 (copy)
                for v86 = 1, v84 do
                    if v75 then
                        v72(v76, v79, v78, v77);
                        return;
                    elseif v10 and v85[v80.Image] and v80.Parent == v15 and not v9 then
                        if v80.Name == "Main" then
                            return;
                        else
                            v85[v80.Image] = true;
                            v80.Image = "rbxassetid://131167313189669";
                            break;
                        end;
                    else
                        v80.Image = v81[v86];
                        task.wait(v83 or 0.016666666666666666);
                    end;
                end;
                if not v83 then
                    v80.Image = "";
                end;
                if v82 and not v10 then
                    v82();
                end;
            end);
        end;
        local function v110(v88, v89, v90) --[[ Line: 302 ]] --[[ Name: successInput ]]
            -- upvalues: v10 (ref), v8 (ref), v9 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), v52 (ref), v23 (ref), v75 (copy), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v77 (ref), v15 (ref), v13 (ref), v12 (ref), v11 (ref)
            v10 = true;
            v8 = false;
            v90 = true;
            v9 = true;
            local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
            l_ColorCorrectionEffect_0.Parent = l_Lighting_0;
            l_ColorCorrectionEffect_0.Brightness = 0.7;
            task.delay(2, function() --[[ Line: 313 ]]
                -- upvalues: l_ColorCorrectionEffect_0 (copy)
                l_ColorCorrectionEffect_0:Destroy();
            end);
            v88.Brightness = 3;
            l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(0.5), {
                Brightness = 0
            }):Play();
            task.spawn(function() --[[ Line: 321 ]]
                -- upvalues: v89 (copy), v52 (ref), v23 (ref), v75 (ref), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v77 (ref), v10 (ref), v15 (ref), v9 (ref), l_TweenService_0 (ref)
                v89.End.Visible = true;
                v52(v89.End, 10, 0.1);
                local l_Main_0 = v89.Frame.Main;
                local l_v23_0 = v23;
                local v94 = #l_v23_0;
                local v95 = {};
                local l_spawn_0 = task.spawn;
                local v97 = nil;
                local v98 = nil;
                local l_v95_0 = v95 --[[ copy: 3 -> 8 ]];
                l_spawn_0(function() --[[ Line: 277 ]]
                    -- upvalues: v94 (copy), v75 (ref), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v77 (ref), v10 (ref), l_v95_0 (copy), l_Main_0 (copy), v15 (ref), v9 (ref), l_v23_0 (copy), v97 (copy), v98 (copy)
                    for v100 = 1, v94 do
                        if v75 then
                            v72(v76, v79, v78, v77);
                            return;
                        elseif v10 and l_v95_0[l_Main_0.Image] and l_Main_0.Parent == v15 and not v9 then
                            if l_Main_0.Name == "Main" then
                                return;
                            else
                                l_v95_0[l_Main_0.Image] = true;
                                l_Main_0.Image = "rbxassetid://131167313189669";
                                break;
                            end;
                        else
                            l_Main_0.Image = l_v23_0[v100];
                            task.wait(v97 or 0.016666666666666666);
                        end;
                    end;
                    if not v97 then
                        l_Main_0.Image = "";
                    end;
                    if v98 and not v10 then
                        v98();
                    end;
                end);
                for v101, _ in v89:GetChildren() do
                    local l_v89_FirstChild_0 = v89:FindFirstChild(v101);
                    if l_v89_FirstChild_0 then
                        l_TweenService_0:Create(l_v89_FirstChild_0, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            ImageTransparency = 1
                        }):Play();
                        task.wait(0.05);
                    end;
                end;
            end);
            task.wait(0.03333333333333333);
            for _, v105 in v88.Success:GetChildren() do
                v105.SoundId = v105.StoredId.Value;
                v105:Play();
            end;
            v13:Destroy();
            v12:Destroy();
            for _, v107 in v89:GetChildren() do
                if v107:IsA("TextLabel") or v107:IsA("ImageButton") then
                    v107.Visible = false;
                end;
            end;
            for _, v109 in ipairs(v88:WaitForChild("Success"):GetChildren()) do
                if v109:IsA("Sound") then
                    while v109.IsPlaying do
                        task.wait(0.01);
                    end;
                end;
            end;
            if v11.Connected then
                v11:Disconnect();
            end;
            v88:Destroy();
        end;
        local v111 = 0;
        local v112 = false;
        v10 = false;
        v8 = true;
        v9 = false;
        v76 = script.Partd:Clone();
        v76.Parent = workspace;
        v77 = v76.SurfaceGui;
        v77.Appear.SoundId = v77.Appear.StoredId.Value;
        v77.Appear:Play();
        v77.A.SoundId = v77.A.StoredId.Value;
        v77.A:Play();
        v11 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 387 ]]
            -- upvalues: l_CurrentCamera_0 (ref), v76 (ref), v6 (ref)
            local v113 = math.tan(math.rad(l_CurrentCamera_0.FieldOfView) / 2);
            local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
            v76.CFrame = l_CurrentCamera_0.CFrame * CFrame.new(0, 0, -1);
            v76.Size = Vector3.new(v6:getWidth(l_ViewportSize_0, v113, -0.5), v6:getHeight(l_ViewportSize_0, v113, -0.5), 1);
        end);
        v35(v77);
        v52(v15, 1.3, 0);
        v77.Brightness = 8;
        v52(v16, 10, 0.1);
        local l_v19_0 = v19;
        local v116 = #v19 + 1;
        local l_v22_0 = v22;
        local l_Main_1 = v15.Frame.Main;
        local function v127() --[[ Line: 410 ]]
            -- upvalues: v75 (copy), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v77 (ref), v15 (ref), v22 (ref), v10 (ref), v9 (ref)
            if v75 then
                v72(v76, v79, v78, v77);
                return;
            else
                local l_Main_2 = v15.Frame.Main;
                local l_v22_1 = v22;
                local v121 = #l_v22_1;
                local v122 = {};
                local l_spawn_1 = task.spawn;
                local v124 = nil;
                local v125 = nil;
                l_spawn_1(function() --[[ Line: 277 ]]
                    -- upvalues: v121 (copy), v75 (ref), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v77 (ref), v10 (ref), v122 (copy), l_Main_2 (copy), v15 (ref), v9 (ref), l_v22_1 (copy), v124 (copy), v125 (copy)
                    for v126 = 1, v121 do
                        if v75 then
                            v72(v76, v79, v78, v77);
                            return;
                        elseif v10 and v122[l_Main_2.Image] and l_Main_2.Parent == v15 and not v9 then
                            if l_Main_2.Name == "Main" then
                                return;
                            else
                                v122[l_Main_2.Image] = true;
                                l_Main_2.Image = "rbxassetid://131167313189669";
                                break;
                            end;
                        else
                            l_Main_2.Image = l_v22_1[v126];
                            task.wait(v124 or 0.016666666666666666);
                        end;
                    end;
                    if not v124 then
                        l_Main_2.Image = "";
                    end;
                    if v125 and not v10 then
                        v125();
                    end;
                end);
                return;
            end;
        end;
        if v127 then
            v127();
        end;
        l_v19_0[v116] = nil;
        l_TweenService_0:Create(v77, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Brightness = 1.25
        }):Play();
        v19[#v19 + 1] = l_UserInputService_0.LastInputTypeChanged:Connect(v57);
        if v75 then
            v72(v76, v79, v78, v77);
            return;
        else
            l_v19_0 = l_UserInputService_0.GamepadEnabled;
            v116 = nil;
            local v128 = {};
            if l_v19_0 then
                for v129, _ in v20 do
                    table.insert(v128, v129);
                end;
                v116 = v128[math.random(1, #v128)];
            else
                for v131, _ in v21 do
                    table.insert(v128, v131);
                end;
                v116 = v128[math.random(1, #v128)];
            end;
            l_v22_0 = v12;
            v127 = v116;
            l_v22_0.Text = if v20[v127] then v20[v127] else if v21[v127] then v21[v127] else v127.Name;
            l_v22_0 = v13;
            v127 = v116;
            l_v22_0.Text = if v20[v127] then v20[v127] else if v21[v127] then v21[v127] else v127.Name;
            for _, v134 in v15:GetDescendants() do
                if v134:IsA("ImageLabel") then
                    v134.Visible = true;
                end;
            end;
            v15.End.Visible = false;
            l_v22_0 = l_UserInputService_0:GetLastInputType();
            l_Main_1 = game.Players.LocalPlayer:GetAttribute("Interface") == "Touch";
            v17.Visible = not l_Main_1;
            v17.Active = false;
            v14.Visible = l_Main_1;
            v14.Active = l_Main_1;
            v12.Visible = not l_Main_1;
            v13.Visible = not l_Main_1;
            task.spawn(function() --[[ Line: 461 ]]
                -- upvalues: v52 (ref), v15 (ref)
                task.wait(0.01);
                v52(v15, 0.8, 1);
            end);
            v78 = if game.Players.LocalPlayer:GetAttribute("Interface") == "Touch" then v18.Activated:Connect(function() --[[ Line: 468 ]]
                -- upvalues: v75 (copy), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v77 (ref), v8 (ref), v110 (copy), v15 (ref), v112 (ref)
                if v75 then
                    v72(v76, v79, v78, v77);
                    return;
                elseif game.Players.LocalPlayer:GetAttribute("Interface") ~= "Touch" then
                    return;
                else
                    if v8 then
                        v110(v77, v15, v112);
                    end;
                    return;
                end;
            end) else l_UserInputService_0.InputBegan:Connect(function(v135, v136) --[[ Line: 483 ]]
                -- upvalues: v75 (copy), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v77 (ref), v8 (ref), v20 (ref), v21 (ref), l_v19_0 (copy), v116 (ref), v110 (copy), v15 (ref), v112 (ref), v128 (copy), v65 (ref), v10 (ref)
                if v75 then
                    v72(v76, v79, v78, v77);
                    return;
                elseif game.Players.LocalPlayer:GetAttribute("Interface") == "Touch" then
                    return;
                elseif v136 or not v8 then
                    return;
                else
                    local v137 = false;
                    for v138, _ in v20 do
                        if v135.KeyCode == v138 then
                            v137 = true;
                            break;
                        end;
                    end;
                    for v140, _ in v21 do
                        if v135.KeyCode == v140 then
                            v137 = true;
                            break;
                        end;
                    end;
                    if not v137 then
                        return;
                    else
                        if v75 then
                            v72();
                        end;
                        if not l_v19_0 and v135.UserInputType == Enum.UserInputType.Keyboard or l_v19_0 and v135.UserInputType == Enum.UserInputType.Gamepad1 then
                            if v135.KeyCode == v116 then
                                v110(v77, v15, v112);
                                return;
                            elseif table.find(v128, v135.KeyCode) then
                                v65(v10, v112, v77);
                            end;
                        end;
                        return;
                    end;
                end;
            end);
            v79 = l_RunService_0.Heartbeat:Connect(function(v142) --[[ Line: 528 ]]
                -- upvalues: v75 (copy), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v77 (ref), v111 (ref), v74 (copy), v10 (ref), v8 (ref), v112 (ref)
                if v75 then
                    v72(v76, v79, v78, v77);
                    return;
                else
                    v111 = v111 + v142;
                    if v111 >= v74.targetTime then
                        v79:Disconnect();
                        v10 = false;
                        v8 = false;
                        v112 = false;
                    end;
                    return;
                end;
            end);
            task.spawn(function() --[[ Line: 545 ]]
                -- upvalues: v10 (ref), v75 (copy), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v77 (ref), v15 (ref), v24 (ref), v74 (copy), v9 (ref)
                for v143 = 1, 6 do
                    if not v10 then
                        if v75 then
                            v72(v76, v79, v78, v77);
                            return;
                        else
                            task.spawn(function() --[[ Line: 549 ]]
                                -- upvalues: v10 (ref), v15 (ref), v143 (copy), v24 (ref), v74 (ref), v75 (ref), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v77 (ref), v9 (ref)
                                if not v10 then
                                    local v144 = v15[v143];
                                    local l_v24_0 = v24;
                                    local v146 = v74.targetTime / 6 / #v24;
                                    local v147 = #l_v24_0;
                                    local v148 = {};
                                    local l_spawn_2 = task.spawn;
                                    local v150 = nil;
                                    l_spawn_2(function() --[[ Line: 277 ]]
                                        -- upvalues: v147 (copy), v75 (ref), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v77 (ref), v10 (ref), v148 (copy), v144 (copy), v15 (ref), v9 (ref), l_v24_0 (copy), v146 (copy), v150 (copy)
                                        for v151 = 1, v147 do
                                            if v75 then
                                                v72(v76, v79, v78, v77);
                                                return;
                                            elseif v10 and v148[v144.Image] and v144.Parent == v15 and not v9 then
                                                if v144.Name == "Main" then
                                                    return;
                                                else
                                                    v148[v144.Image] = true;
                                                    v144.Image = "rbxassetid://131167313189669";
                                                    break;
                                                end;
                                            else
                                                v144.Image = l_v24_0[v151];
                                                task.wait(v146 or 0.016666666666666666);
                                            end;
                                        end;
                                        if not v146 then
                                            v144.Image = "";
                                        end;
                                        if v150 and not v10 then
                                            v150();
                                        end;
                                    end);
                                end;
                            end);
                            task.wait(v74.targetTime / 6);
                        end;
                    else
                        break;
                    end;
                end;
            end);
            while true do
                if v8 then
                    if v75 then
                        v72(v76, v79, v78, v77);
                        return;
                    else
                        l_v22_0 = l_UserInputService_0:GetLastInputType();
                        l_Main_1 = game.Players.LocalPlayer:GetAttribute("Interface") == "Touch";
                        v17.Visible = not l_Main_1;
                        v17.Active = false;
                        v14.Visible = l_Main_1;
                        v14.Active = l_Main_1;
                        v12.Visible = not l_Main_1;
                        v13.Visible = not l_Main_1;
                        task.wait(0.01);
                    end;
                else
                    if not v112 and not v10 then
                        l_v22_0 = v52(v12, 1, 0.5);
                        l_Main_1 = v52(v13, 1, 0.5);
                        v127 = v52(v14, 1, 0.5);
                        v52(v17, 1, 0.5);
                        for v152 = 1, 6 do
                            if v75 then
                                v72(v76, v79, v78, v77);
                                return;
                            else
                                v52(v15[v152], 1, 0.5);
                            end;
                        end;
                        v19[#v19 + 1] = l_Main_1.Completed:Connect(function() --[[ Line: 583 ]]
                            -- upvalues: l_v22_0 (copy), v77 (ref), v75 (copy), v72 (ref), v76 (ref), v79 (ref), v78 (ref), v11 (ref), v10 (ref)
                            if l_v22_0.Completed then
                                if v77.Appear.IsPlaying then
                                    while v77.Appear.IsPlaying do
                                        if v75 then
                                            v72(v76, v79, v78, v77);
                                            return;
                                        else
                                            task.wait(0.01);
                                        end;
                                    end;
                                end;
                                v77:Destroy();
                                if v11.Connected and not v10 then
                                    v11:Disconnect();
                                end;
                            end;
                        end);
                    end;
                    if v79.Connected then
                        v79:Disconnect();
                    end;
                    if v78.Connected then
                        v78:Disconnect();
                    end;
                    for _, v154 in v19 do
                        v154:Disconnect();
                    end;
                    task.delay(2, function() --[[ Line: 608 ]]
                        -- upvalues: v76 (ref)
                        v76:Destroy();
                    end);
                    if not v10 then
                        v77.Fail.SoundId = v77.Fail.StoredId.Value;
                        v77.Fail:Play();
                    end;
                    return v10;
                end;
            end;
        end;
    end;
end;
return v0;