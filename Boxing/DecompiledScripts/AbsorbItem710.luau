local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local v4 = require(l_ReplicatedFirst_0.Async);
local _ = require(l_ReplicatedFirst_0.XSignal);
local v6 = require(l_ReplicatedStorage_0.Modules.Curve);
local v7 = require(l_ReplicatedStorage_0.Modules.Cutscene.Utilities);
local v8 = require(l_ReplicatedStorage_0.Modules.SoundHelper);
local l_CreateWisp_0 = l_ReplicatedStorage_0:WaitForChild("Events"):WaitForChild("CreateWisp");
local v38 = {
    Create = function(v10) --[[ Line: 53 ]] --[[ Name: Create ]]
        -- upvalues: l_RunService_0 (copy), l_Workspace_0 (copy), v8 (copy), l_ReplicatedStorage_0 (copy), v4 (copy), v6 (copy), v7 (copy)
        if l_RunService_0:IsServer() then
            CreateWisp:FireClient(v10.Player, v10);
            return;
        else
            local v11 = Random.new();
            local v12 = script.Wisps:FindFirstChild(v10.Effect or "Generic"):Clone();
            v12.Position = v10.From;
            for _, v14 in v12:GetDescendants() do
                if v14:IsA("ParticleEmitter") then
                    v14.Color = ColorSequence.new(v10.Color or Color3.new(1, 1, 1));
                end;
            end;
            local v15 = {};
            for _, v17 in v12:GetChildren() do
                if v17:IsA("Trail") then
                    table.insert(v15, v17);
                end;
            end;
            for _, v19 in v15 do
                v19.Color = ColorSequence.new(v10.Color or Color3.new(1, 1, 1));
            end;
            v12.Parent = l_Workspace_0.Debris;
            v8:PlaySound({
                Name = "StarAppear", 
                DirectCopy = l_ReplicatedStorage_0.Sounds.StarAppear, 
                Parent = workspace.Debris
            });
            local l_From_0 = v10.From;
            local l_From_1 = v10.From;
            local v22 = nil;
            if typeof(v10.To) == "Instance" and v10.To:IsA("BasePart") then
                v22 = v10.To;
                l_From_1 = v22.Position;
            elseif typeof(v10.To) == "Vector3" then
                l_From_1 = v10.To;
            end;
            local v23 = {
                l_From_0, 
                v10.MiddlePosition or (CFrame.lookAt(l_From_0, l_From_1) * CFrame.new(v11:NextNumber(4, 8) * (v11:NextInteger(0, 1) == 0 and 1 or -1), v11:NextNumber(-5, 5) * (v11:NextInteger(0, 1) == 0 and 1 or -1), -(l_From_0 - l_From_1).Magnitude / 2)).Position, 
                l_From_1
            };
            local v24 = v10.Time + (v10.TimePerDistance or 0) * (l_From_0 - l_From_1).Magnitude / 10;
            local v25 = 0;
            local v28 = v4.TimerAsync(0, function(v26) --[[ Line: 121 ]]
                -- upvalues: v22 (ref), l_From_1 (ref), v23 (copy), v25 (ref), v24 (copy), v6 (ref), v12 (copy)
                if v22 then
                    l_From_1 = v22.Position;
                    v23[3] = l_From_1;
                end;
                local v27 = math.clamp(v25 / v24, 0, 1);
                if v27 < 1 then
                    v12.Position = v6.InterpolateBezier(v23, v27);
                end;
                v25 = v25 + v26;
            end);
            task.wait(v24);
            v28();
            for _, v30 in v12:GetDescendants() do
                if v30:IsA("ParticleEmitter") then
                    v30:Destroy();
                end;
                if v30:IsA("Trail") then
                    v30.Enabled = false;
                end;
            end;
            task.delay(1, function() --[[ Line: 153 ]]
                -- upvalues: v12 (copy)
                v12:Destroy();
            end);
            if v10.SkipReceiveEffect then
                return;
            else
                local v31 = v10.ReceiveEffect or "Generic";
                local v32 = script.Received:FindFirstChild(v31):Clone();
                v32.Position = v12.Position;
                if v22 then
                    v32.Anchored = false;
                    v32.Massless = true;
                    v32.CanCollide = false;
                    local l_Weld_0 = Instance.new("Weld");
                    l_Weld_0.Part0 = v32;
                    l_Weld_0.Part1 = v22;
                    l_Weld_0.Parent = v32;
                end;
                v32.Parent = l_Workspace_0.Debris;
                for _, v35 in v32.Open.Particles:GetDescendants() do
                    if v35:IsA("ParticleEmitter") then
                        v35.Color = ColorSequence.new(v10.ReceiveColor or v10.Color or Color3.new(1, 1, 1));
                    end;
                end;
                for _, v37 in v32:GetDescendants() do
                    if v37:IsA("ParticleEmitter") then
                        game:GetService("TweenService"):Create(v37, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            TimeScale = 0.2
                        }):Play();
                    end;
                end;
                v7.Emit(v32);
                task.delay(5, function() --[[ Line: 195 ]]
                    -- upvalues: v32 (copy)
                    if v32 then
                        v32:Destroy();
                    end;
                end);
                return;
            end;
        end;
    end
};
l_CreateWisp_0.Event:Connect(function(v39) --[[ Line: 207 ]]
    -- upvalues: v38 (copy)
    v38.Create(v39);
end);
return v38;