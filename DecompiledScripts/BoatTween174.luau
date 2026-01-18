local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.TweenFunctions);
local v2 = require(script.Lerps);
local l_Heartbeat_0 = l_RunService_0.Heartbeat;
local v4 = {};
local v5 = {
    Heartbeat = true, 
    Stepped = true, 
    RenderStepped = true
};
if not l_RunService_0:IsClient() then
    v5.RenderStepped = nil;
end;
local v6 = {
    FabricAccelerate = {
        In = v1.InFabricAccelerate, 
        Out = v1.OutFabricAccelerate, 
        InOut = v1.InOutFabricAccelerate, 
        OutIn = v1.OutInFabricAccelerate
    }, 
    UWPAccelerate = {
        In = v1.InUWPAccelerate, 
        Out = v1.OutUWPAccelerate, 
        InOut = v1.InOutUWPAccelerate, 
        OutIn = v1.OutInUWPAccelerate
    }, 
    Circ = {
        In = v1.InCirc, 
        Out = v1.OutCirc, 
        InOut = v1.InOutCirc, 
        OutIn = v1.OutInCirc
    }, 
    RevBack = {
        In = v1.InRevBack, 
        Out = v1.OutRevBack, 
        InOut = v1.InOutRevBack, 
        OutIn = v1.OutInRevBack
    }, 
    Spring = {
        In = v1.InSpring, 
        Out = v1.OutSpring, 
        InOut = v1.InOutSpring, 
        OutIn = v1.OutInSpring
    }, 
    Standard = {
        In = v1.InStandard, 
        Out = v1.OutStandard, 
        InOut = v1.InOutStandard, 
        OutIn = v1.OutInStandard
    }, 
    StandardExpressive = {
        In = v1.InStandardExpressive, 
        Out = v1.OutStandardExpressive, 
        InOut = v1.InOutStandardExpressive, 
        OutIn = v1.OutInStandardExpressive
    }, 
    Linear = {
        In = v1.InLinear, 
        Out = v1.OutLinear, 
        InOut = v1.InOutLinear, 
        OutIn = v1.OutInLinear
    }, 
    ExitProductive = {
        In = v1.InExitProductive, 
        Out = v1.OutExitProductive, 
        InOut = v1.InOutExitProductive, 
        OutIn = v1.OutInExitProductive
    }, 
    Deceleration = {
        In = v1.InDeceleration, 
        Out = v1.OutDeceleration, 
        InOut = v1.InOutDeceleration, 
        OutIn = v1.OutInDeceleration
    }, 
    Smoother = {
        In = v1.InSmoother, 
        Out = v1.OutSmoother, 
        InOut = v1.InOutSmoother, 
        OutIn = v1.OutInSmoother
    }, 
    FabricStandard = {
        In = v1.InFabricStandard, 
        Out = v1.OutFabricStandard, 
        InOut = v1.InOutFabricStandard, 
        OutIn = v1.OutInFabricStandard
    }, 
    RidiculousWiggle = {
        In = v1.InRidiculousWiggle, 
        Out = v1.OutRidiculousWiggle, 
        InOut = v1.InOutRidiculousWiggle, 
        OutIn = v1.OutInRidiculousWiggle
    }, 
    MozillaCurve = {
        In = v1.InMozillaCurve, 
        Out = v1.OutMozillaCurve, 
        InOut = v1.InOutMozillaCurve, 
        OutIn = v1.OutInMozillaCurve
    }, 
    Expo = {
        In = v1.InExpo, 
        Out = v1.OutExpo, 
        InOut = v1.InOutExpo, 
        OutIn = v1.OutInExpo
    }, 
    Sine = {
        In = v1.InSine, 
        Out = v1.OutSine, 
        InOut = v1.InOutSine, 
        OutIn = v1.OutInSine
    }, 
    Cubic = {
        In = v1.InCubic, 
        Out = v1.OutCubic, 
        InOut = v1.InOutCubic, 
        OutIn = v1.OutInCubic
    }, 
    EntranceExpressive = {
        In = v1.InEntranceExpressive, 
        Out = v1.OutEntranceExpressive, 
        InOut = v1.InOutEntranceExpressive, 
        OutIn = v1.OutInEntranceExpressive
    }, 
    Elastic = {
        In = v1.InElastic, 
        Out = v1.OutElastic, 
        InOut = v1.InOutElastic, 
        OutIn = v1.OutInElastic
    }, 
    Quint = {
        In = v1.InQuint, 
        Out = v1.OutQuint, 
        InOut = v1.InOutQuint, 
        OutIn = v1.OutInQuint
    }, 
    EntranceProductive = {
        In = v1.InEntranceProductive, 
        Out = v1.OutEntranceProductive, 
        InOut = v1.InOutEntranceProductive, 
        OutIn = v1.OutInEntranceProductive
    }, 
    Bounce = {
        In = v1.InBounce, 
        Out = v1.OutBounce, 
        InOut = v1.InOutBounce, 
        OutIn = v1.OutInBounce
    }, 
    Smooth = {
        In = v1.InSmooth, 
        Out = v1.OutSmooth, 
        InOut = v1.InOutSmooth, 
        OutIn = v1.OutInSmooth
    }, 
    Back = {
        In = v1.InBack, 
        Out = v1.OutBack, 
        InOut = v1.InOutBack, 
        OutIn = v1.OutInBack
    }, 
    Quart = {
        In = v1.InQuart, 
        Out = v1.OutQuart, 
        InOut = v1.InOutQuart, 
        OutIn = v1.OutInQuart
    }, 
    StandardProductive = {
        In = v1.InStandardProductive, 
        Out = v1.OutStandardProductive, 
        InOut = v1.InOutStandardProductive, 
        OutIn = v1.OutInStandardProductive
    }, 
    Quad = {
        In = v1.InQuad, 
        Out = v1.OutQuad, 
        InOut = v1.InOutQuad, 
        OutIn = v1.OutInQuad
    }, 
    FabricDecelerate = {
        In = v1.InFabricDecelerate, 
        Out = v1.OutFabricDecelerate, 
        InOut = v1.InOutFabricDecelerate, 
        OutIn = v1.OutInFabricDecelerate
    }, 
    Acceleration = {
        In = v1.InAcceleration, 
        Out = v1.OutAcceleration, 
        InOut = v1.InOutAcceleration, 
        OutIn = v1.OutInAcceleration
    }, 
    SoftSpring = {
        In = v1.InSoftSpring, 
        Out = v1.OutSoftSpring, 
        InOut = v1.InOutSoftSpring, 
        OutIn = v1.OutInSoftSpring
    }, 
    ExitExpressive = {
        In = v1.InExitExpressive, 
        Out = v1.OutExitExpressive, 
        InOut = v1.InOutExitExpressive, 
        OutIn = v1.OutInExitExpressive
    }, 
    Sharp = {
        In = v1.InSharp, 
        Out = v1.OutSharp, 
        InOut = v1.InOutSharp, 
        OutIn = v1.OutInSharp
    }
};
local function v9(v7) --[[ Line: 316 ]] --[[ Name: Wait ]]
    -- upvalues: l_Heartbeat_0 (copy)
    v7 = math.max(v7 or 0.03, 0);
    local l_v7_0 = v7;
    while l_v7_0 > 0 do
        l_v7_0 = l_v7_0 - l_Heartbeat_0:Wait();
    end;
    return v7 - l_v7_0;
end;
v4.Create = function(v10, v11) --[[ Line: 327 ]] --[[ Name: Create ]]
    -- upvalues: v5 (copy), l_RunService_0 (copy), v6 (copy), v2 (copy), v9 (copy)
    if not v10 or typeof(v10) ~= "Instance" then
        return warn("Invalid object to tween:", v10);
    else
        v11 = type(v11) == "table" and v11 or {};
        local v12 = v5[v11.StepType] and l_RunService_0[v11.StepType] or l_RunService_0.Stepped;
        local v13 = v6[v11.EasingStyle or "Quad"][v11.EasingDirection or "In"];
        local v14 = math.max(type(v11.Time) == "number" and v11.Time or 1, 0.001);
        local v15 = type(v11.Goal) == "table" and v11.Goal or {};
        local v16 = false;
        if type(v11.DelayTime) == "number" then
            v16 = false;
            if v11.DelayTime > 0.027 then
                v16 = v11.DelayTime;
            end;
        end;
        local v17 = (type(v11.RepeatCount) == "number" and math.max(v11.RepeatCount, -1) or 0) + 1;
        local v18 = {};
        for v19, v20 in pairs(v15) do
            v18[v19] = v2[typeof(v20)](v10[v19], v20);
        end;
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        local l_BindableEvent_1 = Instance.new("BindableEvent");
        local l_BindableEvent_2 = Instance.new("BindableEvent");
        local v24 = nil;
        local v25 = os.clock();
        local v26 = 0;
        local v27 = {
            Instance = v10, 
            PlaybackState = Enum.PlaybackState.Begin, 
            Completed = l_BindableEvent_0.Event, 
            Resumed = l_BindableEvent_2.Event, 
            Stopped = l_BindableEvent_1.Event
        };
        v27.Destroy = function() --[[ Line: 365 ]] --[[ Name: Destroy ]]
            -- upvalues: v24 (ref), l_BindableEvent_0 (copy), l_BindableEvent_1 (copy), l_BindableEvent_2 (copy), v27 (ref)
            if v24 then
                v24:Disconnect();
                v24 = nil;
            end;
            l_BindableEvent_0:Destroy();
            l_BindableEvent_1:Destroy();
            l_BindableEvent_2:Destroy();
            v27 = nil;
        end;
        local v28 = false;
        local v29 = 0;
        local function v30(v31, v32) --[[ Line: 380 ]] --[[ Name: Play ]]
            -- upvalues: v24 (ref), v17 (copy), v27 (ref), l_BindableEvent_0 (copy), v28 (ref), v29 (ref), v16 (copy), v9 (ref), v25 (ref), v26 (ref), v12 (copy), v14 (copy), v18 (copy), v10 (copy), v30 (copy), v11 (ref), v13 (copy)
            if v24 then
                v24:Disconnect();
                v24 = nil;
            end;
            v31 = v31 or 1;
            if v17 ~= 0 and v17 < v31 then
                v27.PlaybackState = Enum.PlaybackState.Completed;
                l_BindableEvent_0:Fire();
                v28 = false;
                v29 = 1;
                return;
            else
                v29 = v31;
                if v32 then
                    v28 = true;
                end;
                if v16 then
                    v27.PlaybackState = Enum.PlaybackState.Delayed;
                    (v16 < 2 and v9 or wait)(v16);
                end;
                v25 = os.clock() - v26;
                v24 = v12:Connect(function() --[[ Line: 409 ]]
                    -- upvalues: v26 (ref), v25 (ref), v14 (ref), v32 (copy), v18 (ref), v10 (ref), v24 (ref), v30 (ref), v31 (ref), v11 (ref), v13 (ref)
                    v26 = os.clock() - v25;
                    if v14 <= v26 then
                        if v32 then
                            for v33, v34 in pairs(v18) do
                                v10[v33] = v34(0);
                            end;
                        else
                            for v35, v36 in pairs(v18) do
                                v10[v35] = v36(1);
                            end;
                        end;
                        v24:Disconnect();
                        v24 = nil;
                        if v32 then
                            v26 = 0;
                            v30(v31 + 1, false);
                            return;
                        elseif v11.Reverses then
                            v26 = 0;
                            v30(v31, true);
                            return;
                        else
                            v26 = 0;
                            v30(v31 + 1, false);
                            return;
                        end;
                    else
                        local v37 = v32 and 1 - v26 / v14 or v26 / v14;
                        local v38 = math.clamp(v13(v37), 0, 1);
                        for v39, v40 in pairs(v18) do
                            v10[v39] = v40(v38);
                        end;
                        return;
                    end;
                end);
                v27.PlaybackState = Enum.PlaybackState.Playing;
                return;
            end;
        end;
        v27.Play = function() --[[ Line: 449 ]] --[[ Name: Play ]]
            -- upvalues: v26 (ref), v30 (copy)
            v26 = 0;
            v30(1, false);
        end;
        v27.Stop = function() --[[ Line: 454 ]] --[[ Name: Stop ]]
            -- upvalues: v24 (ref), v27 (ref), l_BindableEvent_1 (copy)
            if v24 then
                v24:Disconnect();
                v24 = nil;
                v27.PlaybackState = Enum.PlaybackState.Cancelled;
                l_BindableEvent_1:Fire();
            end;
        end;
        v27.Resume = function() --[[ Line: 463 ]] --[[ Name: Resume ]]
            -- upvalues: v30 (copy), v29 (ref), v28 (ref), l_BindableEvent_2 (copy)
            v30(v29, v28);
            l_BindableEvent_2:Fire();
        end;
        return v27;
    end;
end;
return v4;