local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ChatWindowConfiguration_0 = game:GetService("TextChatService").ChatWindowConfiguration;
local l_Titles_0 = l_ReplicatedStorage_0:WaitForChild("Titles");
local l_List_0 = require(l_Titles_0:WaitForChild("List"));
local l_Gradients_0 = l_Titles_0:WaitForChild("Gradients");
local l_GetNameValue_0 = require(script:WaitForChild("GetNameValue"));
local v6 = workspace:WaitForChild("States", 240);
local function v14(v7) --[[ Line: 15 ]] --[[ Name: _RetrieveTitleInfo ]]
    -- upvalues: v6 (copy), l_List_0 (copy), l_Gradients_0 (copy)
    local l_v6_FirstChild_0 = v6:FindFirstChild(v7.Name);
    if not l_v6_FirstChild_0 then
        return;
    else
        local l_PlayerData_0 = l_v6_FirstChild_0:FindFirstChild("PlayerData");
        if not l_PlayerData_0 then
            return;
        else
            local l_Title_0 = l_PlayerData_0:FindFirstChild("Title");
            if not l_Title_0 then
                return;
            else
                local v11 = l_List_0[l_Title_0.Value];
                if not v11 then
                    return;
                else
                    local l_l_Gradients_0_FirstChild_0 = l_Gradients_0:FindFirstChild(v11.Quality);
                    if not l_l_Gradients_0_FirstChild_0 then
                        return;
                    elseif v11.Quality == 0 then
                        return;
                    else
                        local v13 = l_l_Gradients_0_FirstChild_0:Clone();
                        v13.Name = "TitleGradient";
                        v13.Enabled = true;
                        return v11.DisplayTitle or l_Title_0.Value, v13;
                    end;
                end;
            end;
        end;
    end;
end;
return {
    PrepPrefixText = function(v15, v16, v17) --[[ Line: 40 ]] --[[ Name: PrepPrefixText ]]
        -- upvalues: l_GetNameValue_0 (copy)
        v17.Text = ("<font color=\"#%*\">%*:</font> %*"):format(l_GetNameValue_0(v15.Name):ToHex(), v15.DisplayName, v16.Text);
        v17.PrefixText = "";
    end, 
    ApplyTitleToChatMessage = function(v18, v19, v20) --[[ Line: 48 ]] --[[ Name: ApplyTitleToChatMessage ]]
        -- upvalues: v14 (copy), l_GetNameValue_0 (copy), l_ChatWindowConfiguration_0 (copy)
        local v21, v22 = v14(v18);
        if not v21 or not v22 then
            return false;
        else
            v20.Text = ("<font color=\"#%*\">%*:</font> %*"):format(l_GetNameValue_0(v18.Name):ToHex(), v18.DisplayName, v19.Text);
            v20.PrefixText = "";
            v20.PrefixTextProperties = l_ChatWindowConfiguration_0:DeriveNewMessageProperties();
            v20.PrefixText = ("<b>[%*]</b>"):format(v21);
            v22.Parent = v20.PrefixTextProperties;
            return true;
        end;
    end
};