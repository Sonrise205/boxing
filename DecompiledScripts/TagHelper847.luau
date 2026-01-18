local l_CollectionService_0 = game:GetService("CollectionService");
local _ = game:GetService("RunService");
local v2 = {};
local v3 = 0;
local v4 = {};
local v5 = 0;
local v6 = 1;
while v6 < 100 do
    for v7 = 0, 6 do
        local v8, v9, v10 = Color3.fromRGB(math.sin(0.5235987755982988 * v7 + v3) * 127 + 128, math.sin(0.5235987755982988 * v7 + 2.0943951023931953 + v3) * 127 + 128, math.sin(0.5235987755982988 * v7 + 4.1887902047863905 + v3) * 127 + 128):ToHSV();
        v9 = math.clamp(v9 - 0.3, 0, 1);
        local v11 = Color3.fromHSV(v8, v9, v10);
        table.insert(v4, v7 + 1, ColorSequenceKeypoint.new(v7 / 6, v11));
    end;
    local v12 = ColorSequence.new(v4);
    if #v2 > 0 and v12 == v2[1] then
        v4 = {};
        break;
    else
        table.insert(v2, v12);
        v4 = {};
        v3 = v3 + 0.07853981633974483;
        if v3 >= 6.283185307179586 then
            v3 = 0;
        end;
        v6 = v6 + 1;
    end;
end;
local _ = #v2;
local v14 = 1;
while task.wait(0.016666666666666666) do
    for _, v16 in l_CollectionService_0:GetTagged("RainbowUI") do
        local l_UIGradient_0 = v16.UIGradient;
        if math.fmod(v5, 2) == 0 then
            l_UIGradient_0.Color = v2[v14];
        end;
    end;
    if #v2 <= v14 then
        v14 = 0;
    end;
    v14 = v14 + 1;
    if v5 >= 1000 then
        v5 = 0;
    end;
    v5 = v5 + 1;
end;