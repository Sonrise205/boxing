--!native
if not script then
    script = game:GetService("ReplicatedFirst").UIParty.CreateParticleEmitter;
end;
local l_RunService_0 = game:GetService("RunService");
local v1 = Random.new();
local _ = require(script.Parent.Types);
local function v3() --[[ Line: 20 ]] --[[ Name: DefaultTransparency ]]
    return 0;
end;
local function v4() --[[ Line: 24 ]] --[[ Name: DefaultRotation ]]
    return 0;
end;
local function v5() --[[ Line: 28 ]] --[[ Name: DefaultColor ]]
    return Color3.new(1, 1, 1);
end;
return function(v6) --[[ Line: 48 ]] --[[ Name: CreateParticleEmitter ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), v1 (copy), l_RunService_0 (copy)
    local v7 = {};
    local l_ParticleDefinition_0 = v6.ParticleDefinition;
    local v9 = typeof(l_ParticleDefinition_0) == "function";
    local v10 = v6.EmitCount or 1e999;
    local v11 = {};
    local v12 = 0;
    local v13 = true;
    local v14 = v6.TimeScale or 1;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local function v47() --[[ Line: 63 ]] --[[ Name: Update ]]
        -- upvalues: l_BindableEvent_0 (copy), v11 (copy), v14 (copy), v3 (ref), v4 (ref), v5 (ref), v12 (ref)
        l_BindableEvent_0:Fire();
        local v16 = nil;
        local v17 = os.clock();
        for v18, v19 in v11 do
            local l_TimeScale_0 = v18.TimeScale;
            local l_ParticleDefinition_1 = v18.ParticleDefinition;
            if not l_TimeScale_0 then
                v18.TimeScale = v14;
                l_TimeScale_0 = v14;
            end;
            local l_StartTime_0 = v18.StartTime;
            local l_Lifetime_0 = v18.Lifetime;
            local v24 = (v17 - l_StartTime_0) * l_TimeScale_0;
            if l_Lifetime_0 <= v24 then
                v24 = l_Lifetime_0;
                v16 = v16 or {};
                table.insert(v16, {
                    v18, 
                    v19
                });
            else
                local l_PreStep_0 = l_ParticleDefinition_1.PreStep;
                if l_PreStep_0 then
                    l_PreStep_0(v18);
                end;
                v18.Completion = math.min(1, v24 / l_Lifetime_0);
                local v26 = (l_ParticleDefinition_1.Transparency or v3)(v18);
                local v27 = l_ParticleDefinition_1.Position(v18);
                local v28 = (l_ParticleDefinition_1.Rotation or v4)(v18);
                local v29 = (l_ParticleDefinition_1.Color or v5)(v18);
                local v30 = l_ParticleDefinition_1.Size(v18);
                if v18._LastTransparency ~= v26 then
                    v18._LastTransparency = v26;
                    v19.ImageTransparency = v26;
                end;
                if v18._LastColor ~= v29 then
                    v18._LastColor = v29;
                    v19.ImageColor3 = v29;
                end;
                if v18._LastRotation ~= v28 then
                    v18._LastRotation = v28;
                    v19.Rotation = v28;
                end;
                if v18._LastSize ~= v30 then
                    v18._LastSize = v30;
                    v19.Size = UDim2.fromScale(v30.X, v30.Y);
                end;
                if v18._LastPosition ~= v27 then
                    v18._LastPosition = v27;
                    v19.Position = UDim2.fromScale(v27.X, v27.Y);
                end;
                local l_SpriteSheet_0 = v18.SpriteSheet;
                if l_SpriteSheet_0 then
                    local v32 = math.min(v18.Completion, 0.99999999);
                    local v33 = l_SpriteSheet_0.Repetitions or 1;
                    local l_ImageSize_0 = l_SpriteSheet_0.ImageSize;
                    local l_CellSize_0 = l_SpriteSheet_0.CellSize;
                    local l_Sheets_0 = l_SpriteSheet_0.Sheets;
                    local v37 = #l_Sheets_0;
                    local v38 = l_ImageSize_0 / l_CellSize_0;
                    local v39 = v38.X * v38.Y * v37;
                    local v40 = math.floor(v32 * (v33 * v39 - (l_SpriteSheet_0.SkipLastFrames or 0))) % v39;
                    local v41 = math.min(math.floor(v40 / v39 * v37) + 1, v37);
                    local v42 = v40 % v38.X * l_CellSize_0.X;
                    local v43 = v40 // v38.Y % v38.Y * l_CellSize_0.Y;
                    v19.Image = l_Sheets_0[v41];
                    v19.ImageRectOffset = Vector2.new(v42, v43);
                end;
                local l_PostStep_0 = l_ParticleDefinition_1.PostStep;
                if l_PostStep_0 then
                    l_PostStep_0(v18);
                end;
            end;
        end;
        if not v16 then
            return;
        else
            for _, v46 in v16 do
                v46[2]:Destroy();
                v11[v46[1]] = nil;
                v12 = v12 - 1;
            end;
            return;
        end;
    end;
    local function v68(v48) --[[ Line: 172 ]] --[[ Name: CreateParticle ]]
        -- upvalues: v1 (ref), v6 (copy), v11 (copy), v12 (ref)
        if not v48 then
            return;
        else
            local v49 = os.clock();
            local l_Position_0 = v48.Position;
            local l_Lifetime_1 = v48.Lifetime;
            local v52 = v48.Texture or "rbxassetid://487481260";
            local v53 = type(v52) == "table" and v52 or nil;
            local l_ImageLabel_0 = Instance.new("ImageLabel");
            local v55 = {
                ParticleDefinition = v48, 
                SpriteSheetFrameOffset = if v53 then v53.RandomStart and v1:NextInteger(0, (v53.TotalFrames or v53.Cells.X * v53.Cells.Y) - 1) or 0 else nil, 
                SpriteSheet = v53, 
                Completion = 0, 
                TimeScale = nil, 
                StartTime = v49, 
                Instance = l_ImageLabel_0, 
                Position = l_Position_0, 
                Lifetime = l_Lifetime_1, 
                _LastTransparency = nil, 
                _LastRotation = nil, 
                _LastPosition = nil, 
                _LastColor = nil, 
                _LastSize = nil
            };
            l_ImageLabel_0.BackgroundTransparency = 1;
            l_ImageLabel_0.ImageTransparency = 1;
            l_ImageLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
            if not v53 then
                l_ImageLabel_0.Image = v52;
            end;
            local v56 = l_Position_0(v55);
            l_ImageLabel_0.Position = UDim2.fromScale(v56.X, v56.Y);
            local v57 = if v48.AspectRatio ~= nil then v48.AspectRatio else 1;
            if v57 then
                local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
                l_UIAspectRatioConstraint_0.AspectRatio = v57;
                l_UIAspectRatioConstraint_0.Parent = l_ImageLabel_0;
            end;
            local l_RootProperties_0 = v48.RootProperties;
            if l_RootProperties_0 then
                for v60, v61 in l_RootProperties_0 do
                    l_ImageLabel_0[v60] = v61;
                end;
            end;
            local l_RootChildren_0 = v48.RootChildren;
            if l_RootChildren_0 then
                for _, v64 in l_RootChildren_0 do
                    v64.Parent = l_ImageLabel_0;
                end;
            end;
            local l_RootChildrenCopy_0 = v48.RootChildrenCopy;
            if l_RootChildrenCopy_0 then
                for _, v67 in l_RootChildrenCopy_0 do
                    v67:Clone().Parent = l_ImageLabel_0;
                end;
            end;
            if v53 then
                l_ImageLabel_0.ImageRectSize = v53.CellSize;
            end;
            l_ImageLabel_0.Parent = v6.EmitFrom;
            v11[v55] = l_ImageLabel_0;
            v12 = v12 + 1;
            return;
        end;
    end;
    local v69 = l_RunService_0.PostSimulation:Connect(v47);
    local v70 = 1 / v6.Rate / (v6.TimeScale or 0);
    local l_v70_0 = v70;
    local v72 = os.clock();
    v7.SetEnabled = function(v73) --[[ Line: 263 ]] --[[ Name: SetEnabled ]]
        -- upvalues: v13 (ref), v72 (ref)
        v13 = v73;
        if v73 then
            v72 = os.clock();
        end;
    end;
    local function v76(v74) --[[ Line: 271 ]] --[[ Name: Emit ]]
        -- upvalues: v68 (copy), v9 (copy), l_ParticleDefinition_0 (copy), v6 (copy)
        for _ = 1, v74 or 1 do
            v68(if v9 then l_ParticleDefinition_0(v6) else l_ParticleDefinition_0);
        end;
    end;
    v7.Emit = v76;
    v7.GetParticleCount = function() --[[ Line: 278 ]] --[[ Name: GetParticleCount ]]
        -- upvalues: v12 (ref)
        return v12;
    end;
    local v81 = task.spawn(function() --[[ Line: 282 ]]
        -- upvalues: v6 (copy), l_BindableEvent_0 (copy), v76 (copy), v13 (ref), v70 (copy), v10 (ref), l_v70_0 (ref), v68 (copy), v9 (copy), l_ParticleDefinition_0 (copy), v72 (ref)
        local l_InitialEmit_0 = v6.InitialEmit;
        local l_Event_0 = l_BindableEvent_0.Event;
        if l_InitialEmit_0 then
            v76(l_InitialEmit_0);
        end;
        while true do
            if not v13 or v70 == 1e999 or v10 == 0 then
                l_Event_0:Wait();
            else
                while true do
                    local v79 = l_v70_0 - v70;
                    if v79 >= 0 then
                        if v10 == 0 then
                            v13 = false;
                            break;
                        else
                            v10 = v10 - 1;
                            l_v70_0 = v79;
                            v68(if v9 then l_ParticleDefinition_0(v6) else l_ParticleDefinition_0);
                        end;
                    else
                        break;
                    end;
                end;
                local v80 = os.clock();
                l_v70_0 = l_v70_0 + (v80 - v72);
                v72 = v80;
                l_Event_0:Wait();
            end;
        end;
    end);
    v7.Destroy = function() --[[ Line: 320 ]] --[[ Name: Destroy ]]
        -- upvalues: v69 (ref), v81 (copy), v11 (copy)
        if not v69 then
            error("Particle system already destroyed");
        end;
        task.cancel(v81);
        v69:Disconnect();
        v69 = nil;
        for _, v83 in v11 do
            v83:Destroy();
        end;
    end;
    v7.Create = v68;
    return v7;
end;