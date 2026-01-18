local _ = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_Workspace_0 = game:GetService("Workspace");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedFirst_0.Rosyn);
local _ = require(script.Parent:WaitForChild("_Template"));
local _ = script.Name;
return {
    ID = script.Name, 
    DisplayName = "Test", 
    DisplayImage = "", 
    Duration = 300, 
    ActivationMessages = {
        function(v7, v8) --[[ Line: 21 ]]
            return (("<flow speed='0.05'><rainbow>Everyone's style has been set to %* by %*</rainbow></flow>"):format(v7, v8));
        end
    }, 
    ExtendMessages = {
        function(v9) --[[ Line: 27 ]]
            return (("<rainbow>Test</rainbow> has been extended by 5 minutes %*"):format(v9 and (" by <gold>%*!</gold>"):format(v9) or ""));
        end
    }, 
    OnExtend = function(_, _) --[[ Line: 33 ]] --[[ Name: OnExtend ]]

    end, 
    OnActivate = function(v12, _) --[[ Line: 38 ]] --[[ Name: OnActivate ]]
        -- upvalues: l_Workspace_0 (copy)
        l_Workspace_0:SetAttribute("EventTest", true);
        v12:OnExtend();
        return true, function() --[[ Line: 44 ]]
            -- upvalues: l_Workspace_0 (ref)
            l_Workspace_0:SetAttribute("EventTest", false);
        end;
    end
};