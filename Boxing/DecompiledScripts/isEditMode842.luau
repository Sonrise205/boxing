local l_RunService_0 = game:GetService("RunService");
local v1 = false;
if l_RunService_0:IsRunning() == false then
    v1 = l_RunService_0:IsStudio() == true;
end;
return v1;