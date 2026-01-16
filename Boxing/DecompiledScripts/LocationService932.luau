local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
if l_RunService_0:IsClient() then
    return {};
else
    local l_ServerScriptService_0 = game:GetService("ServerScriptService");
    local l_LocationCallback_0 = l_ServerScriptService_0:WaitForChild("Events"):WaitForChild("LocationCallback");
    local v4 = require(l_ServerScriptService_0.CountryCodes);
    local v5 = nil;
    local v6 = nil;
    task.defer(function() --[[ Line: 17 ]]
        -- upvalues: l_HttpService_0 (copy), v4 (copy), v5 (ref), v6 (ref), l_LocationCallback_0 (copy)
        local l_Places_0 = require(game.ReplicatedFirst:WaitForChild("Places"));
        if game.PlaceId ~= l_Places_0.Ranked and game.PlaceId ~= l_Places_0.Main then
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 21 ]]
                -- upvalues: l_HttpService_0 (ref)
                local v8 = l_HttpService_0:RequestAsync({
                    Url = "https://api.nya.lu/ip", 
                    Method = "GET"
                });
                return l_HttpService_0:JSONDecode(v8.Body);
            end);
            if l_status_0 and l_result_0 then
                local v11 = {
                    country_code = l_result_0.cc, 
                    country_name = v4.CodeToCountry[l_result_0.cc], 
                    region = l_result_0.region
                };
                v5 = v11.country_name;
                v6 = v11;
                l_LocationCallback_0:Fire(v11);
                return;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 45 ]]
                    -- upvalues: l_HttpService_0 (ref)
                    local v12 = l_HttpService_0:RequestAsync({
                        Url = "http://ip-api.com/json/?fields=16394", 
                        Method = "GET"
                    });
                    return l_HttpService_0:JSONDecode(v12.Body);
                end);
                if l_status_1 and l_result_1 then
                    local v15 = {
                        country_code = l_result_1.countryCode, 
                        country_name = v4.CodeToCountry[l_result_1.countryCode], 
                        region = l_result_1.regionName
                    };
                    v5 = v15.country_name;
                    v6 = v15;
                    l_LocationCallback_0:Fire(v15);
                    return;
                else
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 69 ]]
                        -- upvalues: l_HttpService_0 (ref)
                        return l_HttpService_0:RequestAsync({
                            Url = "https://ipconfig.io/country", 
                            Method = "GET"
                        }).Body;
                    end);
                    if l_status_2 and l_result_2 then
                        l_result_2 = l_result_2:gsub("%W", "");
                        local v18 = {
                            country_code = l_result_2, 
                            country_name = v4.CountryToCode(l_result_2), 
                            region = "Unknown"
                        };
                        v5 = v18.country_name;
                        v6 = v18;
                        l_LocationCallback_0:Fire(v18);
                        return;
                    else
                        return;
                    end;
                end;
            end;
        end;
    end);
    return {
        GetServerLocation = function() --[[ Line: 97 ]] --[[ Name: GetServerLocation ]]
            -- upvalues: v5 (ref)
            return v5;
        end, 
        GetFullLocation = function() --[[ Line: 101 ]] --[[ Name: GetFullLocation ]]
            -- upvalues: v6 (ref)
            return v6;
        end
    };
end;