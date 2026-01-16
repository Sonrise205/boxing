local v0 = {};
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local _ = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Debris_0 = game:GetService("Debris");
local l_Debris_1 = workspace:FindFirstChild("Debris");
local _ = workspace:FindFirstChild("Map");
local _ = workspace:FindFirstChild("Other");
local v9 = RaycastParams.new();
v9.FilterType = Enum.RaycastFilterType.Exclude;
v9.FilterDescendantsInstances = {
    workspace.Debris, 
    workspace.Live
};
local v10 = {
    Beam = true, 
    Trail = true, 
    ParticleEmitter = true, 
    Decal = true
};
local v11 = {
    Emit = {
        Fast = {
            [1] = 0.1, 
            [2] = 0.15, 
            [3] = 0.225, 
            [4] = 0.275, 
            [5] = 0.3, 
            [6] = 0.325, 
            [7] = 0.35, 
            [8] = 0.45, 
            [9] = 0.6, 
            [10] = 0.7
        }, 
        Default = {
            [1] = 0.2, 
            [2] = 0.3, 
            [3] = 0.45, 
            [4] = 0.55, 
            [5] = 0.65, 
            [6] = 0.75, 
            [7] = 0.85, 
            [8] = 1, 
            [9] = 1, 
            [10] = 1
        }
    }
};
local function v17(v12, v13) --[[ Line: 55 ]] --[[ Name: ValidateInstance ]]
    -- upvalues: v10 (copy)
    if typeof(v13) == "table" then
        local v14 = v13.Instances or {};
        local v15 = v13.Classes or {};
        local _ = v13.Callback;
        if v14[v12] then
            return false;
        elseif v15[v12.ClassName] then
            return false;
        end;
    elseif typeof(v13) == "function" then
        return v13(v12);
    end;
    return v10[v12.ClassName] ~= nil;
end;
local function v23(v18, v19) --[[ Line: 73 ]]
    -- upvalues: v17 (copy)
    if v18 == nil then
        return {
            Group = nil, 
            Items = {}
        };
    else
        local v20 = {};
        for _, v22 in v18:GetDescendants() do
            if v17(v22, v19) then
                table.insert(v20, v22);
            end;
        end;
        return {
            Group = v18, 
            Items = v20
        };
    end;
end;
local function _(v24, v25) --[[ Line: 93 ]] --[[ Name: GetEmitCount ]]
    -- upvalues: v11 (copy)
    local l_v24_Attribute_0 = v24:GetAttribute("EmitCount");
    assert(l_v24_Attribute_0, (("%* does not have a EmitCount attribute!"):format(v24.Name)));
    return (math.ceil(l_v24_Attribute_0 * v11.Emit.Default[v25]));
end;
local function v34(v28, v29) --[[ Line: 101 ]] --[[ Name: EmitItem ]]
    -- upvalues: v11 (copy)
    local l_v28_Attribute_0 = v28:GetAttribute("EmitDuration");
    local l_v28_Attribute_1 = v28:GetAttribute("EmitDelay");
    local l_v28_Attribute_2 = v28:GetAttribute("EmitCount");
    if l_v28_Attribute_1 then
        task.wait(l_v28_Attribute_1);
    end;
    if l_v28_Attribute_0 then
        v28.Enabled = true;
        task.delay(l_v28_Attribute_0, function() --[[ Line: 112 ]]
            -- upvalues: v28 (copy)
            v28.Enabled = false;
        end);
    end;
    if l_v28_Attribute_2 then
        local l_v28_Attribute_3 = v28:GetAttribute("EmitCount");
        assert(l_v28_Attribute_3, (("%* does not have a EmitCount attribute!"):format(v28.Name)));
        v28:Emit((math.ceil(l_v28_Attribute_3 * v11.Emit.Default[v29])));
    end;
end;
v0.GetUserSetting = function(v35) --[[ Line: 122 ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    if v35 == "Quality" then
        local v36 = tonumber(l_UserGameSettings_0.SavedQualityLevel.Value);
        if v36 == 0 then
            return 10;
        else
            return v36;
        end;
    else
        return;
    end;
end;
local _ = function(v37) --[[ Line: 130 ]] --[[ Name: FindStretchModels ]]
    local v38 = {};
    for _, v40 in v37:GetDescendants() do
        if v40:IsA("Model") then
            local l_Start_0 = v40:FindFirstChild("Start");
            local l_End_0 = v40:FindFirstChild("End");
            if l_Start_0 and l_End_0 and l_Start_0:IsA("MeshPart") and l_End_0:IsA("MeshPart") then
                table.insert(v38, v40);
            end;
        end;
    end;
    return v38;
end;
local function _(v44) --[[ Line: 154 ]] --[[ Name: TweenStretchModel ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_Start_1 = v44:FindFirstChild("Start");
    local l_End_1 = v44:FindFirstChild("End");
    if not l_Start_1 or not l_End_1 then
        return;
    else
        local l_CFrame_0 = l_End_1.CFrame;
        local l_Size_0 = l_End_1.Size;
        local v49 = v44:GetAttribute("StretchDuration") or 0.35;
        local v50 = v44:GetAttribute("StretchDelay") or 0;
        l_End_1.CFrame = l_Start_1.CFrame;
        l_End_1.Size = l_Start_1.Size;
        l_End_1.Transparency = 0;
        l_End_1.Anchored = true;
        l_End_1.CanCollide = false;
        local v51 = TweenInfo.new(v49, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, v50);
        l_TweenService_0:Create(l_End_1, v51, {
            CFrame = l_CFrame_0, 
            Size = l_Size_0
        }):Play();
        l_TweenService_0:Create(l_End_1, v51, {
            Transparency = 1
        }):Play();
        return;
    end;
end;
v0.Emit = function(...) --[[ Line: 191 ]]
    -- upvalues: v23 (copy), v0 (copy), v34 (copy)
    local v53 = {
        ...
    };
    task.spawn(function() --[[ Line: 193 ]]
        -- upvalues: v23 (ref), v53 (copy), v0 (ref), v34 (ref)
        local v54 = v23(table.unpack(v53));
        if v54.Group:GetAttribute("_Hidden") then
            return;
        else
            local l_Items_0 = v54.Items;
            local v56 = v0.GetUserSetting("Quality");
            assert(v56, debug.traceback("Could not fetch quality level!"));
            for _, v58 in l_Items_0 do
                if v58:IsA("ParticleEmitter") then
                    task.spawn(v34, v58, v56);
                end;
            end;
            return;
        end;
    end);
end;
v0.GetRaySurface = function(v59) --[[ Line: 209 ]]
    return CFrame.new(v59.Position, v59.Position + v59.Normal) * CFrame.Angles(-1.5707963267948966, 0, 0);
end;
v0.SpawnGroup = function(v60, v61, v62) --[[ Line: 213 ]]
    -- upvalues: l_Debris_1 (copy), l_Debris_0 (copy)
    local v63 = v60:Clone();
    if v61 then
        v63:PivotTo(v61);
    end;
    v63.Parent = l_Debris_1;
    if v62 then
        l_Debris_0:AddItem(v63, v62);
    end;
    return v63;
end;
v0.Lerp = function(v64, v65, v66) --[[ Line: 227 ]]
    return v64 + (v65 - v64) * v66;
end;
v0.TweenNumberSequence = function(v67, v68, v69, v70, v71, v72, v73, v74) --[[ Line: 231 ]]
    -- upvalues: v0 (copy)
    assert(v67 and typeof(v67) == "NumberSequence", "Invalid numberSequence");
    assert(v68 and typeof(v68) == "NumberSequence", "Invalid targetSequence");
    assert(v69 and type(v69) == "number" and v69 > 0, "Invalid smoothness");
    assert(v70 and type(v70) == "number" and v70 > 0, "Invalid timeTaken");
    assert(type(v71[v72]) == "userdata", "Invalid objectToUpdate");
    assert(v72 and type(v72) == "string", "Invalid propertyName");
    local l_Keypoints_0 = v67.Keypoints;
    local l_Keypoints_1 = v68.Keypoints;
    local v77 = {};
    local v78 = {};
    local v79 = {};
    for _, v81 in ipairs(l_Keypoints_0) do
        table.insert(v77, v81.Time);
        table.insert(v78, v81.Value);
        table.insert(v79, v81.Envelope);
    end;
    local function v95(v82) --[[ Line: 251 ]] --[[ Name: updateNumberSequence ]]
        -- upvalues: v77 (copy), l_Keypoints_1 (copy), v0 (ref), v78 (copy), v79 (copy)
        local v83 = {};
        for v84, v85 in ipairs(v77) do
            local v86 = 1;
            local v87 = math.abs(v85 - l_Keypoints_1[1].Time);
            for v88, v89 in ipairs(l_Keypoints_1) do
                local v90 = math.abs(v85 - v89.Time);
                if v90 < v87 then
                    v87 = v90;
                    v86 = v88;
                end;
            end;
            local l_Value_0 = l_Keypoints_1[v86].Value;
            local l_Envelope_0 = l_Keypoints_1[v86].Envelope;
            local v93 = v0.Lerp(v78[v84], l_Value_0, v82);
            local v94 = v0.Lerp(v79[v84], l_Envelope_0, v82);
            table.insert(v83, NumberSequenceKeypoint.new(v85, v93, v94));
        end;
        return NumberSequence.new(v83);
    end;
    for v96 = 0, 1, 1 / (v69 * v70) do
        v71[v72] = v95((game.TweenService:GetValue(v96, v73, v74)));
        task.wait(1 / v69);
    end;
    local v97 = {};
    for _, v99 in ipairs(v77) do
        local v100 = 1;
        local v101 = math.abs(v99 - l_Keypoints_1[1].Time);
        for v102, v103 in ipairs(l_Keypoints_1) do
            local v104 = math.abs(v99 - v103.Time);
            if v104 < v101 then
                v101 = v104;
                v100 = v102;
            end;
        end;
        local l_Value_1 = l_Keypoints_1[v100].Value;
        local _ = l_Keypoints_1[v100].Envelope;
        table.insert(v97, NumberSequenceKeypoint.new(v99, l_Value_1, l_Value_1));
    end;
    v71[v72] = NumberSequence.new(v97);
end;
local function v110(v107, v108) --[[ Line: 301 ]] --[[ Name: FetchGround ]]
    -- upvalues: v9 (copy)
    local v109 = workspace:Raycast(v107, Vector3.new(0, 1, 0, 0) * -(v108 or 8), v9);
    if not v109 then
        return;
    else
        return {
            Position = v109.Position, 
            Normal = v109.Normal, 
            Color = v109.Instance.Color, 
            Material = v109.Instance.Material, 
            Raw = v109
        };
    end;
end;
v0.createHighlight = function(v111, v112, v113, v114, v115) --[[ Line: 314 ]]
    -- upvalues: l_Debris_0 (copy)
    local l_Highlight_0 = Instance.new("Highlight");
    l_Highlight_0.Parent = v111;
    l_Highlight_0.FillTransparency = v113 or 0;
    l_Highlight_0.OutlineTransparency = v114 or 1;
    l_Highlight_0.FillColor = v112 or Color3.new(1, 1, 1);
    l_Debris_0:AddItem(l_Highlight_0, v115 or 5);
    return l_Highlight_0;
end;
v0.Explode = function(v117, v118) --[[ Line: 326 ]]
    -- upvalues: v110 (copy), v0 (copy), l_Debris_1 (copy), l_Debris_0 (copy), l_TweenService_0 (copy)
    v118 = v118 or {};
    local v119 = typeof(v117) == "CFrame" and v117.Position or v117;
    local v120 = v110(v119 + Vector3.new(0, 2, 0, 0), 10);
    if not v120 then
        return;
    else
        v117 = typeof(v117) == "CFrame" and v117 - v117.Position + v120.Position or CFrame.new(v120.Position, v120.Position + v120.Normal);
        local v121 = v118.Rocks or 10;
        local v122 = v118.SizeMagnitude or 0.8;
        local v123 = v118.MaxDistance or 3;
        local _ = v118.HorizontalVelocity or 13;
        local _ = v118.VerticalVelocity or 10;
        local v126 = v118.Lifespan or 3;
        local v127 = v121 + math.random(-3, 3);
        v0.Ran = Random.new();
        v0.GetRandomOrientation = function() --[[ Line: 346 ]]
            return (Vector3.new(360 * math.random(), 360 * math.random(), 360 * math.random()));
        end;
        local function v141() --[[ Line: 350 ]] --[[ Name: CreateRock ]]
            -- upvalues: v122 (copy), v0 (ref), v123 (copy), v120 (copy), v118 (ref), l_Debris_1 (ref), l_Debris_0 (ref), v126 (copy), l_TweenService_0 (ref)
            local v128 = {};
            for _ = 1, 3 do
                table.insert(v128, v122 * v0.Ran:NextNumber(0.8, 1.2));
            end;
            local v130 = Vector3.new(table.unpack(v128));
            local v131 = Vector3.new(v0.Ran:NextNumber(-v123, v123), v130.Y + 0.3, v0.Ran:NextNumber(-v123, v123));
            local v132 = v120.Position + v131;
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Anchored = false;
            l_Part_0.CanCollide = true;
            if v118.RaycastProperties then
                local l_Color_0 = v120.Color;
                local l_Material_0 = v120.Material;
                l_Part_0.Color = l_Color_0;
                l_Part_0.Material = l_Material_0;
            else
                local l_CustomColor_0 = v118.CustomColor;
                local l_CustomMaterial_0 = v118.CustomMaterial;
                l_Part_0.Color = l_CustomColor_0;
                l_Part_0.Material = l_CustomMaterial_0;
            end;
            l_Part_0.Position = v132;
            l_Part_0.Size = v130;
            l_Part_0.Orientation = v0.GetRandomOrientation();
            l_Part_0.CustomPhysicalProperties = PhysicalProperties.new(0.3, 0, 0, 0, 1);
            l_Part_0.CollisionGroup = "MapObject";
            local v138 = v0.Ran:NextNumber(v118.VerticalVelocity / 5, v118.VerticalVelocity);
            local v139 = v0.Ran:NextNumber(-v118.HorizontalVelocity, v118.HorizontalVelocity);
            l_Part_0.AssemblyLinearVelocity = Vector3.new(v139, v138, v139);
            l_Part_0.Parent = l_Debris_1;
            if v118.NoCollide then
                l_Debris_0:AddItem(l_Part_0, v118.Lifespan or 20);
                return;
            else
                task.wait(v126 * v0.Ran:NextNumber(0.8, 1.2));
                local v140 = v0.Ran:NextNumber(0.7, 1.3);
                l_TweenService_0:Create(l_Part_0, TweenInfo.new(v140, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    Size = Vector3.new(0, 0, 0, 0)
                }):Play();
                l_Debris_0:AddItem(l_Part_0, v140);
                return;
            end;
        end;
        for _ = 1, v127 do
            task.spawn(v141);
        end;
        return;
    end;
end;
v0.PlayFlipbook = function(v143, v144, v145) --[[ Line: 409 ]]
    -- upvalues: l_RunService_0 (copy)
    local v146 = require(v144);
    v145 = v145 or 1;
    task.spawn(function() --[[ Line: 413 ]]
        -- upvalues: v143 (copy), v145 (ref), v146 (copy), l_RunService_0 (ref)
        local v147 = tick();
        while true do
            local l_Decal_0 = v143:FindFirstChild("Decal");
            if not l_Decal_0 then
                print("where da hell is the decal");
                return;
            else
                local v149 = math.ceil((tick() - v147) * v145 * 60);
                if #v146 < v149 then
                    l_Decal_0.Texture = v146[#v146];
                    return;
                else
                    l_Decal_0.Texture = v146[v149];
                    l_RunService_0.Heartbeat:Wait();
                end;
            end;
        end;
    end);
end;
return v0;