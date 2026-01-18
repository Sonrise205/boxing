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
    Duration = 3600, 
    ActivationMessages = {
        "<flow speed='0.05'><rainbow>Cool test wow wow</rainbow></flow>"
    }, 
    ExtendMessages = {
        function(v7) --[[ Line: 25 ]]
            return (("<rainbow>Test</rainbow> has been extended by 1 hour%*"):format(v7 and (" by <gold>%*!</gold>"):format(v7) or ""));
        end
    }, 
    OnExtend = function(_, _) --[[ Line: 31 ]] --[[ Name: OnExtend ]]

    end, 
    OnActivate = function(v10, _) --[[ Line: 36 ]] --[[ Name: OnActivate ]]
        -- upvalues: l_Workspace_0 (copy)
        l_Workspace_0:SetAttribute("EventTest", true);
        v10:OnExtend();
        return true, function() --[[ Line: 42 ]]
            -- upvalues: l_Workspace_0 (ref)
            l_Workspace_0:SetAttribute("EventTest", false);
        end;
    end
};