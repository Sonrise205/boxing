local v0 = {};
v0.__index = v0;
local l_Rock_0 = script:WaitForChild("Rock");
local l_Debris_0 = game:GetService("Debris");
local l_TweenService_0 = game:GetService("TweenService");
local function _(v4, v5, v6) --[[ Line: 9 ]] --[[ Name: Lerp ]]
    return v4 + (v5 - v4) * v6;
end;
GetRandomRotation = function() --[[ Line: 11 ]] --[[ Name: GetRandomRotation ]]
    local l_random_0 = math.random;
    return (Vector3.new(l_random_0(-360, 360), l_random_0(0, 360), l_random_0(-360, 360)));
end;
local v9 = {
    Color = l_Rock_0.Color, 
    Lifetime = 3, 
    Size = l_Rock_0.Size, 
    Material = l_Rock_0.Material, 
    TweenTime = 0.3
};
v0.New = function(v10) --[[ Line: 24 ]] --[[ Name: New ]]
    -- upvalues: v9 (copy), v0 (copy)
    local v11 = {};
    for v12, v13 in pairs(v9) do
        v11[v12] = v10[v12] or v13;
    end;
    v11.TextureList = v10.TextureList or nil;
    return (setmetatable(v11, v0));
end;
v0.MakeRock = function(v14, v15, v16) --[[ Line: 36 ]] --[[ Name: MakeRock ]]
    -- upvalues: l_Rock_0 (copy), l_TweenService_0 (copy), l_Debris_0 (copy)
    local v17 = l_Rock_0:Clone();
    v17.Parent = workspace.Debris;
    v17.Size = v14.Size;
    v17.Color = v14.Color;
    v17.Position = v15;
    v17.Orientation = GetRandomRotation();
    v17.Material = v14.Material;
    if v14.TextureList and #v14.TextureList > 0 then
        local v18 = nil;
        local v19 = {};
        do
            local l_v18_0 = v18;
            setmetatable(v19, {
                __index = function() --[[ Line: 51 ]] --[[ Name: __index ]]
                    -- upvalues: l_v18_0 (ref)
                    return l_v18_0;
                end
            });
            local v21 = {
                Enum.NormalId.Top, 
                Enum.NormalId.Back, 
                Enum.NormalId.Right, 
                Enum.NormalId.Left, 
                Enum.NormalId.Front, 
                Enum.NormalId.Bottom
            };
            for _, v23 in pairs(v14.TextureList) do
                if v23:IsA("Texture") then
                    if not l_v18_0 then
                        l_v18_0 = v23;
                    end;
                    v19[v23.Face] = v23;
                end;
            end;
            for _, v25 in pairs(v21) do
                local v26 = v19[v25]:Clone();
                v26.Parent = v17;
                v26.Face = v25;
            end;
        end;
    end;
    l_TweenService_0:Create(v17, TweenInfo.new(v14.TweenTime or 0.5), {
        Position = v16
    }):Play();
    task.delay(v14.Lifetime, function() --[[ Line: 87 ]]
        -- upvalues: l_TweenService_0 (ref), v17 (copy), v16 (copy), l_Debris_0 (ref)
        l_TweenService_0:Create(v17, TweenInfo.new(0.35), {
            Position = v16 - Vector3.new(0, v17.Size.Y / 2, 0)
        }):Play();
        l_Debris_0:AddItem(v17, 0.35);
    end);
end;
v0.Line = function(v27, v28, v29, v30, v31, v32, ...) --[[ Line: 93 ]] --[[ Name: Line ]]
    local function _(v33) --[[ Line: 94 ]] --[[ Name: RoundToWhole ]]
        return math.floor(v33) + 0.5;
    end;
    local l_LookVector_0 = v28.LookVector;
    local l_RightVector_0 = v28.RightVector;
    for v37 = 0, math.floor(v29 / 2) + 0.5 do
        local l_Position_0 = (v28 + l_LookVector_0 * (v37 * v30)).Position;
        v27:MakeRock(l_Position_0, l_Position_0 + l_RightVector_0 * v31);
        v27:MakeRock(l_Position_0, l_Position_0 + -l_RightVector_0 * v31);
        task.wait(v32 or 0.07);
    end;
end;
v0.CurvedLine = function(v39, v40, v41, v42, v43, v44, v45) --[[ Line: 110 ]] --[[ Name: CurvedLine ]]
    local function _(v46) --[[ Line: 111 ]] --[[ Name: RoundToWhole ]]
        return math.floor(v46) + 0.5;
    end;
    local l_LookVector_1 = v40.LookVector;
    local l_RightVector_1 = v40.RightVector;
    local v50 = math.floor(v41 / 2) + 0.5;
    for v51 = 0, v50 do
        local v52 = v51 / v50;
        local v53 = v43 + (v44 - v43) * v52;
        v52 = (v40 + l_LookVector_1 * (v51 * v42)).Position;
        v39:MakeRock(v52, v52 + l_RightVector_1 * v53);
        v39:MakeRock(v52, v52 + -l_RightVector_1 * v53);
        task.wait(v45 or 0.07);
    end;
end;
return v0;