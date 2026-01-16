local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v1 = setmetatable({}, v0);
    v1.enabled = false;
    v1.moveVector = Vector3.new(0, 0, 0, 0);
    v1.moveVectorIsCameraRelative = true;
    v1.isJumping = false;
    return v1;
end;
v0.OnRenderStepped = function(_, _) --[[ Line: 23 ]] --[[ Name: OnRenderStepped ]]

end;
v0.GetMoveVector = function(v4) --[[ Line: 27 ]] --[[ Name: GetMoveVector ]]
    return v4.moveVector;
end;
v0.IsMoveVectorCameraRelative = function(v5) --[[ Line: 31 ]] --[[ Name: IsMoveVectorCameraRelative ]]
    return v5.moveVectorIsCameraRelative;
end;
v0.GetIsJumping = function(v6) --[[ Line: 35 ]] --[[ Name: GetIsJumping ]]
    return v6.isJumping;
end;
v0.Enable = function(_, _) --[[ Line: 41 ]] --[[ Name: Enable ]]
    error("BaseCharacterController:Enable must be overridden in derived classes and should not be called.");
    return false;
end;
return v0;