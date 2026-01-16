local v0 = {};
local _ = require(script.Types);
local l_HttpService_0 = game.HttpService;
v0.Read = function(_, v4, v5, v6, v7) --[[ Line: 6 ]] --[[ Name: Read ]]
    -- upvalues: l_HttpService_0 (copy), v0 (copy)
    if typeof(v4) == "Instance" and v4:IsA("ModuleScript") and v4.Parent.Name == "Modes" then
        v4 = require(v4);
    end;
    if typeof(v4) == "Instance" and v4:IsA("StringValue") and v4.Parent.Name == "Modes" then
        v4 = v4.Value;
    end;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 13 ]]
        -- upvalues: l_HttpService_0 (ref), v4 (ref)
        return l_HttpService_0:JSONDecode(v4);
    end);
    if l_status_0 then
        return v0:Simplify(l_result_0, v5, v6, v7);
    else
        return false;
    end;
end;
v0.Simplify = function(_, v11, v12, _, v14) --[[ Line: 24 ]] --[[ Name: Simplify ]]
    local v15 = {
        Notes = {}
    };
    local v16 = {};
    for _, v18 in pairs(v11.notes[v14]) do
        local v19 = {
            TimePosition = v18.t / 1000, 
            Type = 0, 
            Side = "Unknown", 
            Original = v18
        };
        if type(v18.d) == "number" then
            if v18.d <= 3 then
                if v18.d < 0 then
                    v19.Type = v18.d;
                else
                    v19.Type = v18.d + 1;
                end;
            else
                continue;
            end;
        end;
        v19.Length = v18.l / 1000;
        v19.Hit = false;
        v19.Sustaining = false;
        v19.ID = tostring(v19.Type) .. "-" .. v19.TimePosition .. "-" .. v19.Side;
        if not v16[v19.ID] then
            v16[v19.ID] = true;
            table.insert(v15.Notes, v19);
            v19.Index = #v15.Notes;
        end;
    end;
    for v20, v21 in v12 do
        v15[v20] = v21;
    end;
    return v15;
end;
return v0;