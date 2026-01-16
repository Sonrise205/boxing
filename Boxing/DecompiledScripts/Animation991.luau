local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("AnimationClipProvider");
local l_Maid_0 = require(script:FindFirstChild("Maid"));
local v5 = {
    PreloadedCharacters = {}
};
v5.PreloadAnimation = function(_, v7) --[[ Line: 14 ]] --[[ Name: PreloadAnimation ]]
    -- upvalues: v5 (copy), l_Maid_0 (copy), l_ReplicatedStorage_0 (copy)
    local l_Animator_0 = v7:FindFirstChild("Humanoid"):FindFirstChild("Animator");
    if v5.PreloadedCharacters[v7] then
        return;
    else
        v5.PreloadedCharacters[v7] = {
            _animations = {}, 
            _maid = l_Maid_0.new(), 
            _threads = {}
        };
        for _, v10 in next, l_ReplicatedStorage_0.Assets:GetDescendants() do
            if v10:IsA("Animation") then
                v5.PreloadedCharacters[v7]._animations[v10] = l_Animator_0:LoadAnimation(v10);
            end;
        end;
        return;
    end;
end;
v5.PlayAnimation = function(_, v12, v13, v14) --[[ Line: 32 ]] --[[ Name: PlayAnimation ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy), l_RunService_0 (copy)
    local l_Animator_1 = v12:FindFirstChild("Humanoid"):FindFirstChild("Animator");
    local v16 = nil;
    local v17 = v5.PreloadedCharacters[v12];
    if not v17 then
        v5:PreloadAnimation(v12);
        v17 = v5.PreloadedCharacters[v12];
    end;
    local v18 = v17._animations[v13];
    if not v18 then
        v5.PreloadedCharacters[v12][v13] = l_Animator_1:LoadAnimation(v13);
        v18 = v5.PreloadedCharacters[v12][v13];
    end;
    local v19 = l_HttpService_0:GenerateGUID(false);
    v12:SetAttribute("CurrentAnimation", v19);
    if not l_RunService_0:IsRunning() then
        local v20 = os.clock();
        local v21 = nil;
        v21 = coroutine.create(function() --[[ Line: 55 ]]
            -- upvalues: v18 (ref), v20 (copy), v12 (copy), v19 (copy), v16 (ref), l_RunService_0 (ref), l_Animator_1 (copy), v5 (ref), v14 (copy)
            v18:Play();
            while os.clock() - v20 < v18.Length and v12:GetAttribute("CurrentAnimation") == v19 do
                v16 = l_RunService_0.RenderStepped:Wait();
                if v12:GetAttribute("CurrentAnimationSpeed") then
                    v16 = v16 * v12:GetAttribute("CurrentAnimationSpeed");
                end;
                l_Animator_1:StepAnimations(v16);
            end;
            l_Animator_1:StepAnimations(0);
            v18:Stop();
            v5.PreloadedCharacters[v12]._maid:Destroy();
            v12:SetAttribute("CurrentAnimationSpeed", nil);
            if v14 then
                v14(v12);
            end;
            for _, v23 in next, v12:GetDescendants() do
                if v23:IsA("Motor6D") then
                    task.spawn(function() --[[ Line: 81 ]]
                        -- upvalues: v23 (copy)
                        for _ = 1, 5 do
                            game:GetService("TweenService"):Create(v23, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                                CurrentAngle = 0, 
                                Transform = CFrame.new()
                            }):Play();
                            task.wait();
                        end;
                    end);
                end;
            end;
        end);
        coroutine.resume(v21);
    else
        v12:SetAttribute("CurrentAnimation", (l_HttpService_0:GenerateGUID(false)));
        v18:Play();
        v18.Stopped:Connect(function() --[[ Line: 95 ]]
            -- upvalues: v14 (copy), v12 (copy)
            if v14 then
                v14(v12);
            end;
        end);
    end;
end;
v5.DeformMeshRig = function(_, v26, v27, v28) --[[ Line: 104 ]] --[[ Name: DeformMeshRig ]]
    -- upvalues: l_RunService_0 (copy)
    local l_Animator_2 = v26:FindFirstChild("AnimationController"):FindFirstChild("Animator");
    local v30 = l_Animator_2:LoadAnimation(v27);
    local v31 = os.clock();
    local v32 = nil;
    v32 = coroutine.create(function() --[[ Line: 111 ]]
        -- upvalues: v30 (copy), v31 (copy), l_Animator_2 (copy), l_RunService_0 (ref), v28 (copy), v26 (copy)
        v30:Play();
        while os.clock() - v31 < v30.Length do
            l_Animator_2:StepAnimations(l_RunService_0.RenderStepped:Wait());
        end;
        l_Animator_2:StepAnimations(0);
        v30:Stop();
        if v28 then
            v28(v26);
        end;
    end);
    coroutine.resume(v32);
end;
v5.StopAnimation = function(_, v34, _) --[[ Line: 127 ]] --[[ Name: StopAnimation ]]
    v34:SetAttribute("CurrentAnimation", "ForceStop");
end;
v5.AdjustSpeed = function(_, v37, v38) --[[ Line: 131 ]] --[[ Name: AdjustSpeed ]]
    v37:SetAttribute("CurrentAnimationSpeed", v38);
end;
return v5;