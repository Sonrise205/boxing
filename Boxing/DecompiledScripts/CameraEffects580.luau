local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("Debris");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local _ = workspace.CurrentCamera;
local l_Parent_0 = script.Parent;
local v8 = require(l_Parent_0.Utilities);
local _ = require(l_ReplicatedStorage_0.CameraShaker);
local v10 = {
    CAMERA_RIG = script.CamRigWithLetterBox
};
local v16 = {
    setupCamera = function(v11) --[[ Line: 26 ]] --[[ Name: setupCamera ]]
        -- upvalues: v8 (copy), v10 (copy)
        return (v8.SpawnGroup(v10.CAMERA_RIG, v11.CFrame, 20));
    end, 
    setupCameraShake = function(v12, v13, v14) --[[ Line: 32 ]] --[[ Name: setupCameraShake ]]
        -- upvalues: l_ReplicatedStorage_0 (copy)
        v12 = v12 or Enum.RenderPriority.Camera.Value;
        v13 = v13 or 2;
        v14 = v14 or 20;
        local l_camShake_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
        l_camShake_0:Start(v13, v14);
        return l_camShake_0;
    end
};
local v17 = require(l_ReplicatedStorage_0:WaitForChild("Modules", 10):WaitForChild("Transitions", 10));
return {
    cinematicCamera = function(v18) --[[ Line: 73 ]] --[[ Name: cinematicCamera ]]
        -- upvalues: l_PlayerGui_0 (copy), l_TweenService_0 (copy)
        local v19 = TweenInfo.new(0.3, Enum.EasingStyle.Cubic);
        local v20 = script.Interface:Clone();
        v20.Parent = l_PlayerGui_0;
        l_TweenService_0:Create(v20.Top, v19, {
            Size = UDim2.new(2, 0, 0, 50)
        }):Play();
        l_TweenService_0:Create(v20.Bottom, v19, {
            Size = UDim2.new(2, 0, 0, -50)
        }):Play();
        task.delay(v18.DurationInSeconds, function() --[[ Line: 83 ]]
            -- upvalues: l_TweenService_0 (ref), v20 (copy), v19 (copy)
            l_TweenService_0:Create(v20.Top, v19, {
                Size = UDim2.new(2, 0, 0, 0)
            }):Play();
            l_TweenService_0:Create(v20.Bottom, v19, {
                Size = UDim2.new(2, 0, 0, 0)
            }):Play();
        end);
    end, 
    createBlindness = function(v21, v22) --[[ Line: 46 ]] --[[ Name: createBlindness ]]
        -- upvalues: v17 (copy)
        local v23 = {
            FadeTime = v21, 
            HoldTime = v22, 
            IgnoreSound = true
        };
        task.spawn(function() --[[ Line: 67 ]]
            -- upvalues: v17 (ref), v23 (copy)
            v17.FadeTransition(v23);
        end);
    end, 
    setupCameraShake = v16.setupCameraShake, 
    setupCamera = v16.setupCamera
};