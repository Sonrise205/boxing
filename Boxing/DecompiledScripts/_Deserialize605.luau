local l_HttpService_0 = game:GetService("HttpService");
return function(v1) --[[ Line: 3 ]] --[[ Name: Deserialize ]]
    -- upvalues: l_HttpService_0 (copy)
    local v2 = v1:upper();
    if v2 == "TRUE" then
        return true;
    elseif v2 == "FALSE" then
        return false;
    elseif v2 == "NIL" then
        return nil;
    else
        local v3 = string.match(v2, "VECTOR3(%b())");
        if v3 then
            local v4 = string.split(string.gsub(string.sub(v3, 2, -2), "%s", ""), ",");
            return (Vector3.new(tonumber(v4[1]), tonumber(v4[2]), (tonumber(v4[3]))));
        else
            local v5, v6, v7 = v2:match("COLOR3%(%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*%)");
            if v5 and v6 and v7 then
                return Color3.fromRGB(tonumber(v5), tonumber(v6), (tonumber(v7)));
            else
                local v8 = v1:sub(1, 1);
                local v9 = v1:sub(1, #v1);
                if v8 == "{" and v9 == "}" or v8 == "[" or v9 == "]" then
                    return l_HttpService_0:JSONDecode(v1);
                else
                    local v10 = tonumber(v1);
                    if v10 then
                        return v10;
                    else
                        return v1;
                    end;
                end;
            end;
        end;
    end;
end;