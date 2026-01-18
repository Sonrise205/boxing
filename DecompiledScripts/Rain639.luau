local v0 = Color3.new(1, 1, 1);
local v1 = NumberSequence.new(10);
local v2 = NumberRange.new(0.8);
local v3 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 5.33, 2.75), 
    NumberSequenceKeypoint.new(1, 5.33, 2.75)
});
local v4 = NumberRange.new(0.8);
local v5 = NumberRange.new(0, 360);
local v6 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0), 
    NumberSequenceKeypoint.new(0.4, 3), 
    NumberSequenceKeypoint.new(1, 0)
});
local v7 = NumberRange.new(0.1, 0.15);
local v8 = NumberRange.new(0, 360);
local v9 = Vector2.new(10, 10);
local v10 = {
    Vector3.new(0.1414213627576828, 0, 0.1414213627576828, 0), 
    Vector3.new(-0.1414213627576828, 0, 0.1414213627576828, 0), 
    Vector3.new(-0.1414213627576828, 0, -0.1414213627576828, 0), 
    Vector3.new(0.1414213627576828, 0, -0.1414213627576828, 0), 
    Vector3.new(0.4000000059604645, 0, 0, 0), 
    Vector3.new(0.2828427255153656, 0, 0.2828427255153656, 0), 
    Vector3.new(2.4492937051703357E-17, 0, 0.4000000059604645, 0), 
    Vector3.new(-0.2828427255153656, 0, 0.2828427255153656, 0), 
    Vector3.new(-0.4000000059604645, 0, 4.8985874103406714E-17, 0), 
    Vector3.new(-0.2828427255153656, 0, -0.2828427255153656, 0), 
    Vector3.new(-7.347880453766517E-17, 0, -0.4000000059604645, 0), 
    Vector3.new(0.2828427255153656, 0, -0.2828427255153656, 0), 
    Vector3.new(0.6000000238418579, 0, 0, 0), 
    Vector3.new(0.485410213470459, 0, 0.35267114639282227, 0), 
    Vector3.new(0.18541020154953003, 0, 0.5706339478492737, 0), 
    Vector3.new(-0.18541020154953003, 0, 0.5706339478492737, 0), 
    Vector3.new(-0.485410213470459, 0, 0.35267114639282227, 0), 
    Vector3.new(-0.6000000238418579, 0, 7.347881115511007E-17, 0), 
    Vector3.new(-0.485410213470459, 0, -0.35267114639282227, 0), 
    Vector3.new(-0.18541020154953003, 0, -0.5706339478492737, 0), 
    Vector3.new(0.18541020154953003, 0, -0.5706339478492737, 0), 
    Vector3.new(0.485410213470459, 0, -0.35267114639282227, 0), 
    Vector3.new(0.7727406620979309, 0, 0.2070552408695221, 0), 
    Vector3.new(0.5656854510307312, 0, 0.5656854510307312, 0), 
    Vector3.new(0.2070552408695221, 0, 0.7727406620979309, 0), 
    Vector3.new(-0.2070552408695221, 0, 0.7727406620979309, 0), 
    Vector3.new(-0.5656854510307312, 0, 0.5656854510307312, 0), 
    Vector3.new(-0.7727406620979309, 0, 0.2070552408695221, 0), 
    Vector3.new(-0.7727406620979309, 0, -0.2070552408695221, 0), 
    Vector3.new(-0.5656854510307312, 0, -0.5656854510307312, 0), 
    Vector3.new(-0.2070552408695221, 0, -0.7727406620979309, 0), 
    Vector3.new(0.2070552408695221, 0, -0.7727406620979309, 0), 
    Vector3.new(0.5656854510307312, 0, -0.5656854510307312, 0), 
    (Vector3.new(0.7727406620979309, 0, -0.2070552408695221, 0))
};
local v11 = {
    None = 0, 
    Whitelist = 1, 
    Blacklist = 2, 
    Function = 3
};
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_NumberValue_0 = Instance.new("NumberValue");
l_NumberValue_0.Value = 1;
local v16 = {};
local v17 = true;
local v18 = Vector3.new(0, -1, 0, 0);
local v19 = nil;
local l_None_0 = v11.None;
local v21 = nil;
local v22 = nil;
local v23 = 1;
local v24 = 1;
local v25 = 0;
local v26 = 0;
local v27 = 0;
local l_new_0 = Vector3.new;
local v29 = NumberSequenceKeypoint.new(0, 1, 0);
local v30 = NumberSequenceKeypoint.new(1, 1, 0);
local v31 = {};
for _, v33 in pairs(v10) do
    table.insert(v31, v33 * 35);
end;
table.sort(v31, function(v34, v35) --[[ Line: 269 ]]
    return v34.magnitude < v35.magnitude;
end);
local l_SoundGroup_0 = Instance.new("SoundGroup");
l_SoundGroup_0.Name = "__RainSoundGroup";
l_SoundGroup_0.Volume = 0.2;
l_SoundGroup_0.Archivable = false;
local l_Sound_0 = Instance.new("Sound");
l_Sound_0.Name = "RainSound";
l_Sound_0.Volume = v27;
l_Sound_0.SoundId = "rbxassetid://1516791621";
l_Sound_0.Looped = true;
l_Sound_0.SoundGroup = l_SoundGroup_0;
l_Sound_0.Parent = l_SoundGroup_0;
l_Sound_0.Archivable = false;
local v38 = nil;
v38 = Instance.new("Part");
v38.Transparency = 1;
v38.Anchored = true;
v38.CanCollide = false;
v38.Locked = false;
v38.Archivable = false;
v38.TopSurface = Enum.SurfaceType.Smooth;
v38.BottomSurface = Enum.SurfaceType.Smooth;
v38.Name = "__RainEmitter";
v38.Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
v38.Archivable = false;
local l_ParticleEmitter_0 = Instance.new("ParticleEmitter");
l_ParticleEmitter_0.Name = "RainStraight";
l_ParticleEmitter_0.LightEmission = 0.05;
l_ParticleEmitter_0.LightInfluence = 0.9;
l_ParticleEmitter_0.Size = v1;
l_ParticleEmitter_0.Texture = "rbxassetid://1822883048";
l_ParticleEmitter_0.LockedToPart = true;
l_ParticleEmitter_0.Enabled = false;
l_ParticleEmitter_0.Lifetime = v2;
l_ParticleEmitter_0.Rate = 600;
l_ParticleEmitter_0.Speed = NumberRange.new(60);
l_ParticleEmitter_0.EmissionDirection = Enum.NormalId.Bottom;
l_ParticleEmitter_0.Parent = v38;
l_ParticleEmitter_0.Orientation = Enum.ParticleOrientation.FacingCameraWorldUp;
local l_ParticleEmitter_1 = Instance.new("ParticleEmitter");
l_ParticleEmitter_1.Name = "RainTopDown";
l_ParticleEmitter_1.LightEmission = 0.05;
l_ParticleEmitter_1.LightInfluence = 0.9;
l_ParticleEmitter_1.Size = v3;
l_ParticleEmitter_1.Texture = "rbxassetid://1822856633";
l_ParticleEmitter_1.LockedToPart = true;
l_ParticleEmitter_1.Enabled = false;
l_ParticleEmitter_1.Rotation = v5;
l_ParticleEmitter_1.Lifetime = v4;
l_ParticleEmitter_1.Rate = 600;
l_ParticleEmitter_1.Speed = NumberRange.new(60);
l_ParticleEmitter_1.EmissionDirection = Enum.NormalId.Bottom;
l_ParticleEmitter_1.Parent = v38;
l_ParticleEmitter_0 = nil;
l_ParticleEmitter_1 = nil;
l_ParticleEmitter_0 = {};
l_ParticleEmitter_1 = {};
for _ = 1, 20 do
    local l_Attachment_0 = Instance.new("Attachment");
    l_Attachment_0.Name = "__RainSplashAttachment";
    local l_ParticleEmitter_2 = Instance.new("ParticleEmitter");
    l_ParticleEmitter_2.LightEmission = 0.05;
    l_ParticleEmitter_2.LightInfluence = 0.9;
    l_ParticleEmitter_2.Size = v6;
    l_ParticleEmitter_2.Texture = "rbxassetid://1822856633";
    l_ParticleEmitter_2.Rotation = v8;
    l_ParticleEmitter_2.Lifetime = v7;
    l_ParticleEmitter_2.Transparency = NumberSequence.new({
        v29, 
        NumberSequenceKeypoint.new(0.25, 0.6, 0), 
        NumberSequenceKeypoint.new(0.75, 0.6, 0), 
        v30
    });
    l_ParticleEmitter_2.Enabled = false;
    l_ParticleEmitter_2.Rate = 0;
    l_ParticleEmitter_2.Speed = NumberRange.new(0);
    l_ParticleEmitter_2.Name = "RainSplash";
    l_ParticleEmitter_2.Parent = l_Attachment_0;
    l_Attachment_0.Archivable = false;
    table.insert(l_ParticleEmitter_0, l_Attachment_0);
    local l_Attachment_1 = Instance.new("Attachment");
    l_Attachment_1.Name = "__RainOccludedAttachment";
    local v45 = v38.RainStraight:Clone();
    v45.Speed = NumberRange.new(70, 100);
    v45.SpreadAngle = v9;
    v45.LockedToPart = false;
    v45.Enabled = false;
    v45.Parent = l_Attachment_1;
    local v46 = v38.RainTopDown:Clone();
    v46.Speed = NumberRange.new(70, 100);
    v46.SpreadAngle = v9;
    v46.LockedToPart = false;
    v46.Enabled = false;
    v46.Parent = l_Attachment_1;
    l_Attachment_1.Archivable = false;
    table.insert(l_ParticleEmitter_1, l_Attachment_1);
end;
local v47 = {
    v38
};
local v59 = {
    [v11.None] = function(v48, v49) --[[ Line: 394 ]]
        -- upvalues: v38 (ref), l_Players_0 (copy), v47 (copy)
        return workspace:FindPartOnRayWithIgnoreList(v48, v49 and {
            v38, 
            l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.Character
        } or v47);
    end, 
    [v11.Blacklist] = function(v50) --[[ Line: 397 ]]
        -- upvalues: v21 (ref)
        return workspace:FindPartOnRayWithIgnoreList(v50, v21);
    end, 
    [v11.Whitelist] = function(v51) --[[ Line: 400 ]]
        -- upvalues: v21 (ref)
        return workspace:FindPartOnRayWithWhitelist(v51, v21);
    end, 
    [v11.Function] = function(v52) --[[ Line: 403 ]]
        -- upvalues: v47 (copy), v22 (ref)
        local v53 = v52.Origin + v52.Direction;
        while true do
            if v52.Direction.magnitude > 0.001 then
                local l_workspace_PartOnRayWithIgnoreList_0, v55, v56, v57 = workspace:FindPartOnRayWithIgnoreList(v52, v47);
                if not l_workspace_PartOnRayWithIgnoreList_0 or v22(l_workspace_PartOnRayWithIgnoreList_0) then
                    return l_workspace_PartOnRayWithIgnoreList_0, v55, v56, v57;
                else
                    local v58 = v55 + v52.Direction.Unit * 0.001;
                    v52 = Ray.new(v58, v53 - v58);
                end;
            else
                return;
            end;
        end;
    end
};
local v60 = v59[l_None_0];
local function v97() --[[ Line: 418 ]] --[[ Name: connectLoop ]]
    -- upvalues: v16 (ref), l_RunService_0 (copy), v60 (ref), v18 (ref), v19 (ref), v27 (ref), v17 (ref), l_TweenService_0 (copy), l_Sound_0 (copy), v38 (ref), l_new_0 (copy), v29 (copy), v23 (ref), v30 (copy), v24 (ref), l_ParticleEmitter_1 (ref), v31 (copy), v26 (ref), l_ParticleEmitter_0 (ref), v25 (ref)
    local v61 = Random.new();
    local v62 = true;
    local v63 = 6;
    table.insert(v16, l_RunService_0.RenderStepped:connect(function() --[[ Line: 426 ]]
        -- upvalues: v60 (ref), v18 (ref), v19 (ref), v27 (ref), v17 (ref), l_TweenService_0 (ref), l_Sound_0 (ref), v63 (ref), v38 (ref), l_new_0 (ref), v62 (ref)
        local v64, _ = v60(Ray.new(workspace.CurrentCamera.CFrame.p, -v18 * 1000), true);
        if (not v19 or workspace.CurrentCamera.CFrame.p.y <= v19) and not v64 then
            if v27 < 1 and not v17 then
                v27 = 1;
                l_TweenService_0:Create(l_Sound_0, TweenInfo.new(0.5), {
                    Volume = 1
                }):Play();
            end;
            v63 = 6;
            local v66 = math.abs((workspace.CurrentCamera.CFrame.lookVector:Dot(v18)));
            local l_p_0 = workspace.CurrentCamera.CFrame.p;
            local v68 = workspace.CurrentCamera.CFrame.lookVector:Cross(-v18);
            v68 = v68.magnitude > 0.001 and v68.unit or -v18;
            local l_unit_0 = v18:Cross(v68).unit;
            v38.Size = l_new_0(40, 40, (1 - v66) * 60 + 40);
            v38.CFrame = CFrame.new(l_p_0.x, l_p_0.y, l_p_0.z, v68.x, -v18.x, l_unit_0.x, v68.y, -v18.y, l_unit_0.y, v68.z, -v18.z, l_unit_0.z) + (1 - v66) * workspace.CurrentCamera.CFrame.lookVector * v38.Size.Z / 3 - v66 * v18 * 20;
            v38.RainStraight.Enabled = true;
            v38.RainTopDown.Enabled = true;
            v62 = false;
            return;
        else
            v38.RainStraight.Enabled = false;
            v38.RainTopDown.Enabled = false;
            v62 = true;
            return;
        end;
    end));
    local v70 = l_RunService_0:IsRunning() and l_RunService_0.Stepped or l_RunService_0.RenderStepped;
    table.insert(v16, v70:connect(function() --[[ Line: 485 ]]
        -- upvalues: v63 (ref), v18 (ref), v29 (ref), v23 (ref), v30 (ref), v24 (ref), v62 (ref), l_ParticleEmitter_1 (ref), v17 (ref), v19 (ref), v31 (ref), v60 (ref), v27 (ref), l_TweenService_0 (ref), l_Sound_0 (ref), v38 (ref), v26 (ref), l_ParticleEmitter_0 (ref), v61 (copy), l_new_0 (ref), v25 (ref)
        v63 = v63 + 1;
        if v63 >= 6 then
            local v71 = math.abs((workspace.CurrentCamera.CFrame.lookVector:Dot(v18)));
            local v72 = NumberSequence.new({
                v29, 
                NumberSequenceKeypoint.new(0.25, (1 - v71) * v23 + v71, 0), 
                NumberSequenceKeypoint.new(0.75, (1 - v71) * v23 + v71, 0), 
                v30
            });
            local v73 = NumberSequence.new({
                v29, 
                NumberSequenceKeypoint.new(0.25, v71 * v24 + (1 - v71), 0), 
                NumberSequenceKeypoint.new(0.75, v71 * v24 + (1 - v71), 0), 
                v30
            });
            local v74 = workspace.Camera.CFrame:inverse() * (workspace.Camera.CFrame.p - v18);
            local v75 = NumberRange.new((math.deg((math.atan2(-v74.x, v74.y)))));
            if v62 then
                for _, v77 in pairs(l_ParticleEmitter_1) do
                    v77.RainStraight.Transparency = v72;
                    v77.RainStraight.Rotation = v75;
                    v77.RainTopDown.Transparency = v73;
                end;
                if not v17 then
                    local v78 = 0;
                    if not v19 or workspace.CurrentCamera.CFrame.p.y <= v19 then
                        local v79 = 35;
                        local v80 = -v18 * 1000;
                        for v81 = 1, #v31 do
                            if not v60(Ray.new(workspace.CurrentCamera.CFrame * v31[v81], v80), true) then
                                v79 = v31[v81].magnitude;
                                break;
                            end;
                        end;
                        v78 = 1 - v79 / 35;
                    end;
                    if math.abs(v78 - v27) > 0.01 then
                        v27 = v78;
                        l_TweenService_0:Create(l_Sound_0, TweenInfo.new(1), {
                            Volume = v27
                        }):Play();
                    end;
                end;
            else
                v38.RainStraight.Transparency = v72;
                v38.RainStraight.Rotation = v75;
                v38.RainTopDown.Transparency = v73;
            end;
            v63 = 0;
        end;
        local l_p_1 = workspace.CurrentCamera.CFrame.p;
        local v83 = workspace.CurrentCamera.CFrame.lookVector:Cross(-v18);
        v83 = v83.magnitude > 0.001 and v83.unit or -v18;
        local l_unit_1 = v18:Cross(v83).unit;
        local v85 = CFrame.new(l_p_1.x, l_p_1.y, l_p_1.z, v83.x, -v18.x, l_unit_1.x, v83.y, -v18.y, l_unit_1.y, v83.z, -v18.z, l_unit_1.z);
        local v86 = v18 * 550;
        for v87 = 1, v26 do
            local v88 = l_ParticleEmitter_0[v87];
            local v89 = l_ParticleEmitter_1[v87];
            local v90 = v61:NextNumber(-100, 100);
            local v91 = v61:NextNumber(-100, 100);
            local v92, v93, v94 = v60(Ray.new(v85 * l_new_0(v90, 500, v91), v86));
            if v92 then
                v88.Position = v93 + v94 * 0.5;
                v88.RainSplash:Emit(1);
                if v62 then
                    local v95 = v93 - v18 * 50;
                    if v19 and v95.Y > v19 and v18.Y < 0 then
                        v95 = v95 + v18 * (v19 - v95.Y) / v18.Y;
                    end;
                    v89.CFrame = v85 - v85.p + v95;
                    v89.RainStraight:Emit(v25);
                    v89.RainTopDown:Emit(v25);
                end;
            elseif v62 then
                local v96 = v85 * l_new_0(v90, v61:NextNumber(20, 100), v91);
                if v19 and v96.Y > v19 and v18.Y < 0 then
                    v96 = v96 + v18 * (v19 - v96.Y) / v18.Y;
                end;
                v89.CFrame = v85 - v85.p + v96;
                v89.RainStraight:Emit(v25);
                v89.RainTopDown:Emit(v25);
            end;
        end;
    end));
end;
local function v100() --[[ Line: 630 ]] --[[ Name: disconnectLoop ]]
    -- upvalues: v16 (ref)
    if #v16 > 0 then
        for _, v99 in pairs(v16) do
            v99:disconnect();
        end;
        v16 = {};
    end;
end;
local function v104(v101) --[[ Line: 640 ]] --[[ Name: disableSound ]]
    -- upvalues: v27 (ref), l_TweenService_0 (copy), l_Sound_0 (copy)
    v27 = 0;
    local v102 = l_TweenService_0:Create(l_Sound_0, v101, {
        Volume = 0
    });
    v102.Completed:connect(function(v103) --[[ Line: 645 ]]
        -- upvalues: l_Sound_0 (ref), v102 (copy)
        if v103 == Enum.PlaybackState.Completed then
            l_Sound_0:Stop();
        end;
        v102:Destroy();
    end);
    v102:Play();
end;
local function _() --[[ Line: 655 ]] --[[ Name: disable ]]
    -- upvalues: v100 (copy), v38 (ref), v17 (ref), v104 (copy)
    v100();
    v38.RainStraight.Enabled = false;
    v38.RainTopDown.Enabled = false;
    v38.Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
    if not v17 then
        v104(TweenInfo.new(1));
    end;
end;
local function _(v106, v107, v108) --[[ Line: 672 ]] --[[ Name: makeProperty ]]
    local v109 = Instance.new(v106);
    if v107 then
        v109.Value = v107;
    end;
    v109.Changed:connect(v108);
    v108(v109.Value);
    return v109;
end;
local function v117(v111) --[[ Line: 682 ]]
    -- upvalues: v38 (ref), l_ParticleEmitter_0 (ref), l_ParticleEmitter_1 (ref)
    local v112 = ColorSequence.new(v111);
    v38.RainStraight.Color = v112;
    v38.RainTopDown.Color = v112;
    for _, v114 in pairs(l_ParticleEmitter_0) do
        v114.RainSplash.Color = v112;
    end;
    for _, v116 in pairs(l_ParticleEmitter_1) do
        v116.RainStraight.Color = v112;
        v116.RainTopDown.Color = v112;
    end;
end;
local l_Color3Value_0 = Instance.new("Color3Value");
if v0 then
    l_Color3Value_0.Value = v0;
end;
l_Color3Value_0.Changed:connect(v117);
v117(l_Color3Value_0.Value);
local l_l_Color3Value_0_0 = l_Color3Value_0;
v117 = function(v120) --[[ Line: 699 ]] --[[ Name: updateTransparency ]]
    -- upvalues: l_NumberValue_0 (copy), v23 (ref), v24 (ref), v29 (copy), v30 (copy), l_ParticleEmitter_0 (ref)
    local v121 = (1 - v120) * (1 - l_NumberValue_0.Value);
    local v122 = 1 - v121;
    v23 = 0.7 * v121 + v122;
    v24 = 0.85 * v121 + v122;
    local v123 = NumberSequence.new({
        v29, 
        NumberSequenceKeypoint.new(0.25, v121 * 0.6 + v122, 0), 
        NumberSequenceKeypoint.new(0.75, v121 * 0.6 + v122, 0), 
        v30
    });
    for _, v125 in pairs(l_ParticleEmitter_0) do
        v125.RainSplash.Transparency = v123;
    end;
end;
local l_NumberValue_1 = Instance.new("NumberValue");
l_NumberValue_1.Value = 0;
l_NumberValue_1.Changed:connect(v117);
v117(l_NumberValue_1.Value);
l_Color3Value_0 = l_NumberValue_1;
l_NumberValue_0.Changed:connect(v117);
local function v128(v127) --[[ Line: 722 ]]
    -- upvalues: v38 (ref)
    v38.RainStraight.Speed = NumberRange.new(v127 * 60);
    v38.RainTopDown.Speed = NumberRange.new(v127 * 60);
end;
local l_NumberValue_2 = Instance.new("NumberValue");
l_NumberValue_2.Value = 1;
l_NumberValue_2.Changed:connect(v128);
v128(l_NumberValue_2.Value);
l_NumberValue_1 = l_NumberValue_2;
l_NumberValue_2 = function(v130) --[[ Line: 729 ]]
    -- upvalues: v38 (ref), v25 (ref), v26 (ref)
    v38.RainStraight.Rate = 600 * v130;
    v38.RainTopDown.Rate = 600 * v130;
    v25 = math.ceil(2 * v130);
    v26 = 20 * v130;
end;
local l_NumberValue_3 = Instance.new("NumberValue");
l_NumberValue_3.Value = 1;
l_NumberValue_3.Changed:connect(l_NumberValue_2);
l_NumberValue_2(l_NumberValue_3.Value);
v128 = l_NumberValue_3;
l_NumberValue_3 = function(v132) --[[ Line: 739 ]]
    -- upvalues: v38 (ref), l_ParticleEmitter_1 (ref), l_ParticleEmitter_0 (ref)
    v38.RainStraight.LightEmission = v132;
    v38.RainTopDown.LightEmission = v132;
    for _, v134 in pairs(l_ParticleEmitter_1) do
        v134.RainStraight.LightEmission = v132;
        v134.RainTopDown.LightEmission = v132;
    end;
    for _, v136 in pairs(l_ParticleEmitter_0) do
        v136.RainSplash.LightEmission = v132;
    end;
end;
local l_NumberValue_4 = Instance.new("NumberValue");
l_NumberValue_4.Value = 0.05;
l_NumberValue_4.Changed:connect(l_NumberValue_3);
l_NumberValue_3(l_NumberValue_4.Value);
l_NumberValue_2 = l_NumberValue_4;
l_NumberValue_4 = function(v138) --[[ Line: 754 ]]
    -- upvalues: v38 (ref), l_ParticleEmitter_1 (ref), l_ParticleEmitter_0 (ref)
    v38.RainStraight.LightInfluence = v138;
    v38.RainTopDown.LightInfluence = v138;
    for _, v140 in pairs(l_ParticleEmitter_1) do
        v140.RainStraight.LightInfluence = v138;
        v140.RainTopDown.LightInfluence = v138;
    end;
    for _, v142 in pairs(l_ParticleEmitter_0) do
        v142.RainSplash.LightInfluence = v138;
    end;
end;
local l_NumberValue_5 = Instance.new("NumberValue");
l_NumberValue_5.Value = 0.9;
l_NumberValue_5.Changed:connect(l_NumberValue_4);
l_NumberValue_4(l_NumberValue_5.Value);
l_NumberValue_3 = l_NumberValue_5;
l_NumberValue_5 = function(v144) --[[ Line: 769 ]]
    -- upvalues: v18 (ref)
    if v144.magnitude > 0.001 then
        v18 = v144.unit;
    end;
end;
local l_Vector3Value_0 = Instance.new("Vector3Value");
l_Vector3Value_0.Value = Vector3.new(0, -1, 0, 0);
l_Vector3Value_0.Changed:connect(l_NumberValue_5);
l_NumberValue_5(l_Vector3Value_0.Value);
l_NumberValue_4 = l_Vector3Value_0;
l_NumberValue_5 = {
    CollisionMode = v11, 
    Enable = function(_, v147) --[[ Line: 782 ]] --[[ Name: Enable ]]
        -- upvalues: v100 (copy), v38 (ref), l_ParticleEmitter_0 (ref), l_ParticleEmitter_1 (ref), l_RunService_0 (copy), l_SoundGroup_0 (copy), v97 (copy), l_TweenService_0 (copy), l_NumberValue_0 (copy), l_Sound_0 (copy), v17 (ref)
        if v147 ~= nil and typeof(v147) ~= "TweenInfo" then
            error("bad argument #1 to 'Enable' (TweenInfo expected, got " .. typeof(v147) .. ")", 2);
        end;
        v100();
        v38.RainStraight.Enabled = true;
        v38.RainTopDown.Enabled = true;
        v38.Parent = workspace.CurrentCamera;
        for v148 = 1, 20 do
            l_ParticleEmitter_0[v148].Parent = workspace.Terrain;
            l_ParticleEmitter_1[v148].Parent = workspace.Terrain;
        end;
        if l_RunService_0:IsRunning() then
            l_SoundGroup_0.Parent = game:GetService("SoundService");
        end;
        v97();
        if v147 then
            l_TweenService_0:Create(l_NumberValue_0, v147, {
                Value = 0
            }):Play();
        else
            l_NumberValue_0.Value = 0;
        end;
        if not l_Sound_0.Playing then
            l_Sound_0:Play();
            l_Sound_0.TimePosition = math.random() * l_Sound_0.TimeLength;
        end;
        v17 = false;
    end, 
    Disable = function(_, v150) --[[ Line: 820 ]] --[[ Name: Disable ]]
        -- upvalues: l_TweenService_0 (copy), l_NumberValue_0 (copy), v100 (copy), v38 (ref), v17 (ref), v104 (copy)
        if v150 ~= nil and typeof(v150) ~= "TweenInfo" then
            error("bad argument #1 to 'Disable' (TweenInfo expected, got " .. typeof(v150) .. ")", 2);
        end;
        if v150 then
            local v151 = l_TweenService_0:Create(l_NumberValue_0, v150, {
                Value = 1
            });
            v151.Completed:connect(function(v152) --[[ Line: 828 ]]
                -- upvalues: v100 (ref), v38 (ref), v17 (ref), v104 (ref), v151 (copy)
                if v152 == Enum.PlaybackState.Completed then
                    v100();
                    v38.RainStraight.Enabled = false;
                    v38.RainTopDown.Enabled = false;
                    v38.Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
                    if not v17 then
                        v104(TweenInfo.new(1));
                    end;
                end;
                v151:Destroy();
            end);
            v151:Play();
            v104(v150);
        else
            l_NumberValue_0.Value = 1;
            v100();
            v38.RainStraight.Enabled = false;
            v38.RainTopDown.Enabled = false;
            v38.Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
            if not v17 then
                v104(TweenInfo.new(1));
            end;
        end;
        v17 = true;
    end, 
    SetColor = function(_, v154, v155) --[[ Line: 847 ]] --[[ Name: SetColor ]]
        -- upvalues: l_TweenService_0 (copy), l_l_Color3Value_0_0 (copy)
        if typeof(v154) ~= "Color3" then
            error("bad argument #1 to 'SetColor' (Color3 expected, got " .. typeof(v154) .. ")", 2);
        elseif v155 ~= nil and typeof(v155) ~= "TweenInfo" then
            error("bad argument #2 to 'SetColor' (TweenInfo expected, got " .. typeof(v155) .. ")", 2);
        end;
        if v155 then
            l_TweenService_0:Create(l_l_Color3Value_0_0, v155, {
                Value = v154
            }):Play();
            return;
        else
            l_l_Color3Value_0_0.Value = v154;
            return;
        end;
    end
};
l_Vector3Value_0 = function(v156, v157) --[[ Line: 863 ]] --[[ Name: makeRatioSetter ]]
    -- upvalues: l_TweenService_0 (copy)
    return function(_, v159, v160) --[[ Line: 865 ]]
        -- upvalues: v156 (copy), l_TweenService_0 (ref), v157 (copy)
        if typeof(v159) ~= "number" then
            error("bad argument #1 to '" .. v156 .. "' (number expected, got " .. typeof(v159) .. ")", 2);
        elseif v160 ~= nil and typeof(v160) ~= "TweenInfo" then
            error("bad argument #2 to '" .. v156 .. "' (TweenInfo expected, got " .. typeof(v160) .. ")", 2);
        end;
        v159 = math.clamp(v159, 0, 1);
        if v160 then
            l_TweenService_0:Create(v157, v160, {
                Value = v159
            }):Play();
            return;
        else
            v157.Value = v159;
            return;
        end;
    end;
end;
local v161 = "SetTransparency";
local l_v161_0 = v161 --[[ copy: 56 -> 57 ]];
l_NumberValue_5.SetTransparency = function(_, v164, v165) --[[ Line: 865 ]]
    -- upvalues: l_v161_0 (copy), l_TweenService_0 (copy), l_Color3Value_0 (copy)
    if typeof(v164) ~= "number" then
        error("bad argument #1 to '" .. l_v161_0 .. "' (number expected, got " .. typeof(v164) .. ")", 2);
    elseif v165 ~= nil and typeof(v165) ~= "TweenInfo" then
        error("bad argument #2 to '" .. l_v161_0 .. "' (TweenInfo expected, got " .. typeof(v165) .. ")", 2);
    end;
    v164 = math.clamp(v164, 0, 1);
    if v165 then
        l_TweenService_0:Create(l_Color3Value_0, v165, {
            Value = v164
        }):Play();
        return;
    else
        l_Color3Value_0.Value = v164;
        return;
    end;
end;
v161 = "SetSpeedRatio";
local l_v161_1 = v161 --[[ copy: 56 -> 58 ]];
l_NumberValue_5.SetSpeedRatio = function(_, v168, v169) --[[ Line: 865 ]]
    -- upvalues: l_v161_1 (copy), l_TweenService_0 (copy), l_NumberValue_1 (copy)
    if typeof(v168) ~= "number" then
        error("bad argument #1 to '" .. l_v161_1 .. "' (number expected, got " .. typeof(v168) .. ")", 2);
    elseif v169 ~= nil and typeof(v169) ~= "TweenInfo" then
        error("bad argument #2 to '" .. l_v161_1 .. "' (TweenInfo expected, got " .. typeof(v169) .. ")", 2);
    end;
    v168 = math.clamp(v168, 0, 1);
    if v169 then
        l_TweenService_0:Create(l_NumberValue_1, v169, {
            Value = v168
        }):Play();
        return;
    else
        l_NumberValue_1.Value = v168;
        return;
    end;
end;
v161 = "SetIntensityRatio";
local l_v161_2 = v161 --[[ copy: 56 -> 59 ]];
l_NumberValue_5.SetIntensityRatio = function(_, v172, v173) --[[ Line: 865 ]]
    -- upvalues: l_v161_2 (copy), l_TweenService_0 (copy), v128 (copy)
    if typeof(v172) ~= "number" then
        error("bad argument #1 to '" .. l_v161_2 .. "' (number expected, got " .. typeof(v172) .. ")", 2);
    elseif v173 ~= nil and typeof(v173) ~= "TweenInfo" then
        error("bad argument #2 to '" .. l_v161_2 .. "' (TweenInfo expected, got " .. typeof(v173) .. ")", 2);
    end;
    v172 = math.clamp(v172, 0, 1);
    if v173 then
        l_TweenService_0:Create(v128, v173, {
            Value = v172
        }):Play();
        return;
    else
        v128.Value = v172;
        return;
    end;
end;
v161 = "SetLightEmission";
local l_v161_3 = v161 --[[ copy: 56 -> 60 ]];
l_NumberValue_5.SetLightEmission = function(_, v176, v177) --[[ Line: 865 ]]
    -- upvalues: l_v161_3 (copy), l_TweenService_0 (copy), l_NumberValue_2 (copy)
    if typeof(v176) ~= "number" then
        error("bad argument #1 to '" .. l_v161_3 .. "' (number expected, got " .. typeof(v176) .. ")", 2);
    elseif v177 ~= nil and typeof(v177) ~= "TweenInfo" then
        error("bad argument #2 to '" .. l_v161_3 .. "' (TweenInfo expected, got " .. typeof(v177) .. ")", 2);
    end;
    v176 = math.clamp(v176, 0, 1);
    if v177 then
        l_TweenService_0:Create(l_NumberValue_2, v177, {
            Value = v176
        }):Play();
        return;
    else
        l_NumberValue_2.Value = v176;
        return;
    end;
end;
v161 = "SetLightInfluence";
l_NumberValue_5.SetLightInfluence = function(_, v179, v180) --[[ Line: 865 ]]
    -- upvalues: v161 (copy), l_TweenService_0 (copy), l_NumberValue_3 (copy)
    if typeof(v179) ~= "number" then
        error("bad argument #1 to '" .. v161 .. "' (number expected, got " .. typeof(v179) .. ")", 2);
    elseif v180 ~= nil and typeof(v180) ~= "TweenInfo" then
        error("bad argument #2 to '" .. v161 .. "' (TweenInfo expected, got " .. typeof(v180) .. ")", 2);
    end;
    v179 = math.clamp(v179, 0, 1);
    if v180 then
        l_TweenService_0:Create(l_NumberValue_3, v180, {
            Value = v179
        }):Play();
        return;
    else
        l_NumberValue_3.Value = v179;
        return;
    end;
end;
l_NumberValue_5.SetVolume = function(_, v182, v183) --[[ Line: 890 ]] --[[ Name: SetVolume ]]
    -- upvalues: l_TweenService_0 (copy), l_SoundGroup_0 (copy)
    if typeof(v182) ~= "number" then
        error("bad argument #1 to 'SetVolume' (number expected, got " .. typeof(v182) .. ")", 2);
    elseif v183 ~= nil and typeof(v183) ~= "TweenInfo" then
        error("bad argument #2 to 'SetVolume' (TweenInfo expected, got " .. typeof(v183) .. ")", 2);
    end;
    if v183 then
        l_TweenService_0:Create(l_SoundGroup_0, v183, {
            Volume = v182
        }):Play();
        return;
    else
        l_SoundGroup_0.Volume = v182;
        return;
    end;
end;
l_NumberValue_5.SetDirection = function(_, v185, v186) --[[ Line: 906 ]] --[[ Name: SetDirection ]]
    -- upvalues: l_TweenService_0 (copy), l_NumberValue_4 (copy)
    if typeof(v185) ~= "Vector3" then
        error("bad argument #1 to 'SetDirection' (Vector3 expected, got " .. typeof(v185) .. ")", 2);
    elseif v186 ~= nil and typeof(v186) ~= "TweenInfo" then
        error("bad argument #2 to 'SetDirection' (TweenInfo expected, got " .. typeof(v186) .. ")", 2);
    end;
    if v185.unit.magnitude <= 0 then
        warn("Attempt to set rain direction to a zero-length vector, falling back on default direction = (" .. tostring((Vector3.new(0, -1, 0, 0))) .. ")");
        v185 = Vector3.new(0, -1, 0, 0);
    end;
    if v186 then
        l_TweenService_0:Create(l_NumberValue_4, v186, {
            Value = v185
        }):Play();
        return;
    else
        l_NumberValue_4.Value = v185;
        return;
    end;
end;
l_NumberValue_5.SetCeiling = function(_, v188) --[[ Line: 927 ]] --[[ Name: SetCeiling ]]
    -- upvalues: v19 (ref)
    if v188 ~= nil and typeof(v188) ~= "number" then
        error("bad argument #1 to 'SetCeiling' (number expected, got " .. typeof(v188) .. ")", 2);
    end;
    v19 = v188;
end;
l_NumberValue_5.SetStraightTexture = function(_, v190) --[[ Line: 937 ]] --[[ Name: SetStraightTexture ]]
    -- upvalues: v38 (ref), l_ParticleEmitter_1 (ref)
    if typeof(v190) ~= "string" then
        error("bad argument #1 to 'SetStraightTexture' (string expected, got " .. typeof(v190) .. ")", 2);
    end;
    v38.RainStraight.Texture = v190;
    for _, v192 in pairs(l_ParticleEmitter_1) do
        v192.RainStraight.Texture = v190;
    end;
end;
l_NumberValue_5.SetTopDownTexture = function(_, v194) --[[ Line: 951 ]] --[[ Name: SetTopDownTexture ]]
    -- upvalues: v38 (ref), l_ParticleEmitter_1 (ref)
    if typeof(v194) ~= "string" then
        error("bad argument #1 to 'SetStraightTexture' (string expected, got " .. typeof(v194) .. ")", 2);
    end;
    v38.RainTopDown.Texture = v194;
    for _, v196 in pairs(l_ParticleEmitter_1) do
        v196.RainTopDown.Texture = v194;
    end;
end;
l_NumberValue_5.SetSplashTexture = function(_, v198) --[[ Line: 965 ]] --[[ Name: SetSplashTexture ]]
    -- upvalues: l_ParticleEmitter_0 (ref)
    if typeof(v198) ~= "string" then
        error("bad argument #1 to 'SetStraightTexture' (string expected, got " .. typeof(v198) .. ")", 2);
    end;
    for _, v200 in pairs(l_ParticleEmitter_0) do
        v200.RainSplash.Texture = v198;
    end;
end;
l_NumberValue_5.SetSoundId = function(_, v202) --[[ Line: 977 ]] --[[ Name: SetSoundId ]]
    -- upvalues: l_Sound_0 (copy)
    if typeof(v202) ~= "string" then
        error("bad argument #1 to 'SetSoundId' (string expected, got " .. typeof(v202) .. ")", 2);
    end;
    l_Sound_0.SoundId = v202;
end;
l_NumberValue_5.SetCollisionMode = function(_, v204, v205) --[[ Line: 987 ]] --[[ Name: SetCollisionMode ]]
    -- upvalues: v11 (copy), v21 (ref), v22 (ref), v38 (ref), l_None_0 (ref), v60 (ref), v59 (copy)
    if v204 == v11.None then
        v21 = nil;
        v22 = nil;
    elseif v204 == v11.Blacklist then
        if typeof(v205) == "Instance" then
            v21 = {
                v205, 
                v38
            };
        elseif typeof(v205) == "table" then
            for v206 = 1, #v205 do
                if typeof(v205[v206]) ~= "Instance" then
                    error("bad argument #2 to 'SetCollisionMode' (blacklist contained a " .. typeof(v205[v206]) .. " on index " .. tostring(v206) .. " which is not an Instance)", 2);
                end;
            end;
            v21 = {
                v38
            };
            for v207 = 1, #v205 do
                table.insert(v21, v205[v207]);
            end;
        else
            error("bad argument #2 to 'SetCollisionMode (Instance or array of Instance expected, got " .. typeof(v205) .. ")'", 2);
        end;
        v22 = nil;
    elseif v204 == v11.Whitelist then
        if typeof(v205) == "Instance" then
            v21 = {
                v205
            };
        elseif typeof(v205) == "table" then
            for v208 = 1, #v205 do
                if typeof(v205[v208]) ~= "Instance" then
                    error("bad argument #2 to 'SetCollisionMode' (whitelist contained a " .. typeof(v205[v208]) .. " on index " .. tostring(v208) .. " which is not an Instance)", 2);
                end;
            end;
            v21 = {};
            for v209 = 1, #v205 do
                table.insert(v21, v205[v209]);
            end;
        else
            error("bad argument #2 to 'SetCollisionMode (Instance or array of Instance expected, got " .. typeof(v205) .. ")'", 2);
        end;
        v22 = nil;
    elseif v204 == v11.Function then
        if typeof(v205) ~= "function" then
            error("bad argument #2 to 'SetCollisionMode' (function expected, got " .. typeof(v205) .. ")", 2);
        end;
        v21 = nil;
        v22 = v205;
    else
        error("bad argument #1 to 'SetCollisionMode (Rain.CollisionMode expected, got " .. typeof(v205) .. ")'", 2);
    end;
    l_None_0 = v204;
    v60 = v59[v204];
end;
return l_NumberValue_5;