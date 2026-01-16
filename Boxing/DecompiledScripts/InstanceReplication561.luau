local v0 = game:GetService("RunService"):IsClient();
local v1 = require(script.Parent.ReplicatedStore);
local v2 = require(script.Parent.StoreInterface);
local v3 = require(script.Parent.Parent.TypeGuard);
local v4 = require(script.Parent.Parent.Cleaner);
local v5 = {};
local v6 = v3.Params(v3.Instance():IsDescendantOf(game), v3.String(), v3.Boolean():Optional());
local function v15(v7, v8, v9) --[[ Line: 22 ]] --[[ Name: Client ]]
    -- upvalues: v6 (copy), v5 (copy), v4 (copy), v1 (copy), v2 (copy)
    v6(v7, v8, v9);
    local v10 = v7:WaitForChild(v8, 240);
    assert(v10, ("Wait for partition timed out: %s"):format(v8));
    assert(v7:IsDescendantOf(game), "Instance was already deparented");
    local v11 = v5[v10];
    if v11 then
        return unpack(v11);
    else
        local v12 = v4.new();
        local v13 = v1.new(v10, false);
        v13.InitClient();
        v12:Add(v13);
        v12:Add(v10.AncestryChanged:Connect(function() --[[ Line: 42 ]]
            -- upvalues: v9 (copy), v10 (copy), v5 (ref), v12 (copy)
            if v9 then
                task.wait();
            end;
            if not v10:IsDescendantOf(game) then
                v5[v10] = nil;
                v12:Clean();
            end;
        end));
        local v14 = v2.new(v13);
        v5[v10] = {
            v14, 
            v13
        };
        return v14, v13;
    end;
end;
local v16 = v3.Params(v3.Instance():IsDescendantOf(game), v3.String(), v3.Number():Or(v3.String("Defer")):Optional(), v3.Boolean():Optional());
local function v29(v17, v18, v19, v20) --[[ Line: 59 ]] --[[ Name: Server ]]
    -- upvalues: v16 (copy), v5 (copy), v4 (copy), v1 (copy), v2 (copy)
    v16(v17, v18, v19, v20);
    assert(typeof(v17) == "Instance", ("Instance expected, got %s"):format((typeof(v17))));
    assert(v17:IsDescendantOf(game), "Instance was already deparented");
    local l_v17_FirstChild_0 = v17:FindFirstChild(v18);
    if not l_v17_FirstChild_0 then
        l_v17_FirstChild_0 = Instance.new("RemoteEvent");
        l_v17_FirstChild_0.Name = v18;
        l_v17_FirstChild_0.Parent = v17;
    end;
    local v22 = v5[l_v17_FirstChild_0];
    if v22 then
        return unpack(v22);
    else
        local v23 = v4.new();
        local v24 = nil;
        if v19 then
            if v19 == "Defer" then
                v24 = function(v25) --[[ Line: 84 ]]
                    task.defer(v25);
                end;
            elseif v19 > 0 then
                v24 = function(v26) --[[ Line: 88 ]]
                    -- upvalues: v19 (copy)
                    task.delay(v19, v26);
                end;
            end;
        end;
        local v27 = v1.new(l_v17_FirstChild_0, true, v24);
        v27.InitServer();
        v23:Add(v27);
        v23:Add(l_v17_FirstChild_0.AncestryChanged:Connect(function() --[[ Line: 97 ]]
            -- upvalues: l_v17_FirstChild_0 (ref), v20 (copy), v5 (ref), v23 (copy)
            if not l_v17_FirstChild_0:IsDescendantOf(game) then
                if v20 then
                    task.wait();
                end;
                v5[l_v17_FirstChild_0] = nil;
                v23:Clean();
            end;
        end));
        local v28 = v2.new(v27);
        v5[l_v17_FirstChild_0] = {
            v28, 
            v27
        };
        return v28, v27;
    end;
end;
return v0 and v15 or v29;