local l_Parent_0 = script.Parent;
l_Parent_0.ResetOnSpawn = false;
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local v3 = {
    "this cutscene is temporary", 
    "this cutscene sucks", 
    "how did you get this", 
    "how", 
    "WHAT", 
    "HOW DID YOU", 
    "no wayyy", 
    "no way, what?", 
    "i didnt really expect anyone to get it", 
    "im increasing the rates later lol", 
    "thats crazy tho", 
    "im glad you get to enjoy it", 
    "this is kind of bonkers", 
    "enjoy the style i guess"
};
if script:FindFirstChild("Under") then
    script.Under.SoundId = script.Under.StoredId.Value;
    script.Under:Play();
end;
if script:FindFirstChild("Glitch") then
    script.Glitch.SoundId = script.Glitch.StoredId.Value;
    script.Glitch:Play();
end;
if script:FindFirstChild("Song") then
    script.Song.SoundId = script.Song.StoredId.Value;
    script.Song:Play();
    task.delay(15, function() --[[ Line: 31 ]]
        -- upvalues: l_TweenService_0 (copy)
        l_TweenService_0:Create(script.Song, TweenInfo.new(15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Volume = 0
        }):Play();
    end);
end;
local l_Frame_0 = Instance.new("Frame");
l_Frame_0.BackgroundColor3 = Color3.new(0, 0, 0);
l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
l_Frame_0.ZIndex = 0;
l_Frame_0.Parent = l_Parent_0;
local l_Frame_1 = Instance.new("Frame");
l_Frame_1.BackgroundColor3 = Color3.new(0, 0, 0);
l_Frame_1.Size = UDim2.new(1, 0, 0, 0);
l_Frame_1.Position = UDim2.new(0, 0, -0.2, 0);
l_Frame_1.ZIndex = 150;
l_Frame_1.Parent = l_Parent_0;
local l_Frame_2 = Instance.new("Frame");
l_Frame_2.BackgroundColor3 = Color3.new(0, 0, 0);
l_Frame_2.Size = UDim2.new(1, 0, 0, 0);
l_Frame_2.Position = UDim2.new(0, 0, 1.2, 0);
l_Frame_2.ZIndex = 150;
l_Frame_2.Parent = l_Parent_0;
task.wait(3);
task.delay(3, function() --[[ Line: 61 ]]
    -- upvalues: l_TweenService_0 (copy), l_Frame_1 (copy), l_Frame_2 (copy)
    l_TweenService_0:Create(l_Frame_1, TweenInfo.new(6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(1, 0, 0.1, 0), 
        Position = UDim2.new(0, 0, 0, 0)
    }):Play();
    l_TweenService_0:Create(l_Frame_2, TweenInfo.new(6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(1, 0, 0.1, 0), 
        Position = UDim2.new(0, 0, 0.9, 0)
    }):Play();
end);
local l_Frame_3 = Instance.new("Frame");
l_Frame_3.BackgroundColor3 = Color3.new(0, 0, 0);
l_Frame_3.Size = UDim2.new(1, 0, 1, 0);
l_Frame_3.BackgroundTransparency = 0;
l_Frame_3.ZIndex = 250;
l_Frame_3.Parent = l_Parent_0;
local l_Frame_4 = Instance.new("Frame");
l_Frame_4.BackgroundColor3 = Color3.new(1, 1, 1);
l_Frame_4.Size = UDim2.new(1, 0, 1, 0);
l_Frame_4.BackgroundTransparency = 1;
l_Frame_4.ZIndex = 300;
l_Frame_4.Parent = l_Parent_0;
local v9 = {};
local v10 = 0;
local function v12() --[[ Line: 96 ]] --[[ Name: spawnStar ]]
    -- upvalues: v3 (copy), l_Parent_0 (copy)
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Text = v3[math.random(1, #v3)];
    l_TextLabel_0.Font = Enum.Font.SourceSansBold;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextStrokeColor3 = Color3.new(0, 0, 0);
    l_TextLabel_0.TextStrokeTransparency = 0.8;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextScaled = false;
    l_TextLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_TextLabel_0.Parent = l_Parent_0;
    return {
        instance = l_TextLabel_0, 
        x = math.random(), 
        y = math.random(), 
        z = math.random() * 0.9 + 0.1, 
        alphaIn = 0, 
        rotationOffset = math.random() * 10 - 5
    };
end;
for _ = 1, 10 do
    table.insert(v9, (v12()));
end;
local function v19() --[[ Line: 124 ]] --[[ Name: fadeToWhiteAndBack ]]
    -- upvalues: l_TweenService_0 (copy), l_Frame_4 (copy), v9 (ref), l_Frame_1 (copy), l_Frame_2 (copy), l_Frame_3 (copy), l_Frame_0 (copy), l_Parent_0 (copy)
    local v14 = l_TweenService_0:Create(l_Frame_4, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0
    });
    v14:Play();
    for _, v16 in ipairs(v9) do
        l_TweenService_0:Create(v16.instance, TweenInfo.new(2), {
            TextTransparency = 1, 
            TextStrokeTransparency = 1
        }):Play();
    end;
    v14.Completed:Wait();
    task.delay(2, function() --[[ Line: 141 ]]
        -- upvalues: v9 (ref), l_Frame_1 (ref), l_Frame_2 (ref), l_TweenService_0 (ref), l_Frame_4 (ref), l_Frame_3 (ref), l_Frame_0 (ref), l_Parent_0 (ref)
        for _, v18 in ipairs(v9) do
            if v18.instance then
                v18.instance:Destroy();
            end;
        end;
        v9 = {};
        if l_Frame_1 then
            l_Frame_1:Destroy();
        end;
        if l_Frame_2 then
            l_Frame_2:Destroy();
        end;
        l_TweenService_0:Create(l_Frame_4, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1
        }):Play();
        l_Frame_3.Visible = false;
        l_Frame_0.Visible = false;
        task.wait(2.1);
        l_Parent_0:Destroy();
    end);
end;
local v20 = nil;
v20 = l_RunService_0.RenderStepped:Connect(function(v21) --[[ Line: 167 ]]
    -- upvalues: v10 (ref), l_Frame_3 (copy), v9 (ref), v12 (copy), v3 (copy), l_Frame_4 (copy), v20 (ref), v19 (copy)
    v10 = v10 + v21;
    if v10 < 1 then
        l_Frame_3.BackgroundTransparency = v10 / 1;
    end;
    local v22 = math.floor(v10 / 14 * 170 + 10);
    while #v9 < v22 do
        table.insert(v9, (v12()));
    end;
    for v23 = #v9, 1, -1 do
        local v24 = v9[v23];
        local v25 = (v10 / 14 + 0.5) * 0.5;
        v24.z = v24.z - v25 * v21;
        if v24.z <= 0.1 then
            v24.z = 1;
            v24.x = math.random();
            v24.y = math.random();
            v24.instance.Text = v3[math.random(1, #v3)];
        end;
        local v26 = math.clamp((v10 / 14) ^ 2, 0, 1) * 0.05;
        v24.x = v24.x + (0.5 - v24.x) * v26;
        v24.y = v24.y + (0.5 - v24.y) * v26;
        local v27 = 1 / v24.z;
        local v28 = 0.5 + (v24.x - 0.5) * v27;
        local v29 = 0.5 + (v24.y - 0.5) * v27;
        v24.instance.Position = UDim2.new(v28, 0, v29, 0);
        local v30 = 10 + 60 * (1 - v24.z);
        v24.instance.TextSize = v30;
        v24.instance.Rotation = v24.rotationOffset + (1 - v24.z) * 5;
        local v31 = math.clamp(math.clamp(v10 / 14, 0, 1) - math.clamp((v10 - 9.799999999999999) / 4.2, 0, 1), 0, 1);
        v24.instance.TextTransparency = 1 - v31;
        v24.instance.TextStrokeTransparency = (1 - v31) * 0.8;
    end;
    if v10 > 9.24 and v10 < 14 then
        l_Frame_4.BackgroundTransparency = math.clamp((14 - v10) / 4.760000000000001, 0, 1);
    end;
    if v10 >= 14 then
        v20:Disconnect();
        task.delay(2.5, function() --[[ Line: 228 ]]
            if script:FindFirstChild("Spawn") then
                script.Spawn.SoundId = script.Spawn.StoredId.Value;
                script.Spawn:Play();
            end;
        end);
        v19();
    end;
end);