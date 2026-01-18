local v0 = require(script.Parent.Parent.Parent.TableKit);
return function(v1) --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    if typeof(v1) == "table" then
        if v0.IsArray(v1) then
            return v0.ToArrayString(v1);
        else
            return v0.ToString(v1);
        end;
    else
        local v2 = "";
        local v3 = "";
        if typeof(v1) == "CFrame" then
            v2 = "CFrame(";
            v3 = ")";
        elseif typeof(v1) == "Vector3" then
            v2 = "Vector3(";
            v3 = ")";
        end;
        return (("%*%*%*"):format(v2, tostring(v1), v3));
    end;
end;