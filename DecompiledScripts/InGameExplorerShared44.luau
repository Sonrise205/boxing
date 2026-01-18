local v0 = {
    PropertyChanges = {}
};
local l_RunService_0 = game:GetService("RunService");
local v2 = l_RunService_0:IsServer();
local v3 = require(script.Signal);
local v4 = require(script.Maid);
local v5, _ = unpack(require(script.DataConverter));
local v7 = {
    "PrivateServerOwnerId", 
    "PrivateServerId", 
    "VIPServerId", 
    "VIPServerOwnerId"
};
local function v8(v9, ...) --[[ Line: 19 ]] --[[ Name: DeepAssign ]]
    -- upvalues: v8 (copy)
    for _, v11 in pairs({
        ...
    }) do
        if type(v11) == "table" then
            for v12, v13 in pairs(v11) do
                if type(v13) == "table" then
                    if type(v9[v12]) ~= "table" then
                        v9[v12] = {};
                    end;
                    v8(v9[v12], v13);
                else
                    v9[v12] = v13;
                end;
            end;
        end;
    end;
    return v9;
end;
local function _(v14) --[[ Line: 38 ]] --[[ Name: Clone ]]
    -- upvalues: v8 (copy)
    return v8({}, v14);
end;
v0.FindFromPath = function(_, v17, v18) --[[ Line: 43 ]] --[[ Name: FindFromPath ]]
    local v19 = 1;
    local v20 = v17[v19];
    local v21 = nil;
    while v18.Children do
        local v22 = nil;
        for _, v24 in v18.Children do
            if v24.Name == v20 then
                v18 = v24;
                v22 = true;
                if v19 == #v17 then
                    v21 = v24;
                    break;
                else
                    v19 = v19 + 1;
                    v20 = v17[v19];
                    break;
                end;
            end;
        end;
        if not v22 then
            break;
        end;
    end;
    return v21;
end;
local v40 = {
    Vector2 = {
        {
            Name = "X", 
            ValueType = "float", 
            ValueFn = function(v25) --[[ Line: 78 ]] --[[ Name: ValueFn ]]
                return v25.Value.X;
            end, 
            SetValueFn = function(v26, v27) --[[ Line: 81 ]] --[[ Name: SetValueFn ]]
                if v27.SetValue then
                    v27.SetValue(Vector2.new(v26, v27.Value.Y));
                end;
            end
        }, 
        {
            Name = "Y", 
            ValueType = "float", 
            ValueFn = function(v28) --[[ Line: 88 ]] --[[ Name: ValueFn ]]
                return v28.Value.Y;
            end, 
            SetValueFn = function(v29, v30) --[[ Line: 91 ]] --[[ Name: SetValueFn ]]
                if v30.SetValue then
                    v30.SetValue(Vector2.new(v30.Value.X, v29));
                end;
            end
        }
    }, 
    Vector3 = {
        {
            Name = "X", 
            ValueType = "float", 
            ValueFn = function(v31) --[[ Line: 101 ]] --[[ Name: ValueFn ]]
                return v31.Value.X;
            end, 
            SetValueFn = function(v32, v33) --[[ Line: 104 ]] --[[ Name: SetValueFn ]]
                if v33.SetValue then
                    v33.SetValue((Vector3.new(v32, v33.Value.Y, v33.Value.Z)));
                end;
            end
        }, 
        {
            Name = "Y", 
            ValueType = "float", 
            ValueFn = function(v34) --[[ Line: 111 ]] --[[ Name: ValueFn ]]
                return v34.Value.Y;
            end, 
            SetValueFn = function(v35, v36) --[[ Line: 114 ]] --[[ Name: SetValueFn ]]
                if v36.SetValue then
                    v36.SetValue((Vector3.new(v36.Value.X, v35, v36.Value.Z)));
                end;
            end
        }, 
        {
            Name = "Z", 
            ValueType = "float", 
            ValueFn = function(v37) --[[ Line: 121 ]] --[[ Name: ValueFn ]]
                return v37.Value.Z;
            end, 
            SetValueFn = function(v38, v39) --[[ Line: 124 ]] --[[ Name: SetValueFn ]]
                if v39.SetValue then
                    v39.SetValue((Vector3.new(v39.Value.X, v39.Value.Y, v38)));
                end;
            end
        }
    }
};
v40.CFrame = {
    {
        Name = "Position", 
        ValueFn = function(v41) --[[ Line: 134 ]] --[[ Name: ValueFn ]]
            return v41.Value.Position;
        end, 
        SetValueFn = function(v42, v43) --[[ Line: 137 ]] --[[ Name: SetValueFn ]]
            local v44 = v43.Value - v43.Value.Position;
            local v45 = CFrame.new(v42) * v44;
            v43.SetValue(v45);
        end, 
        ValueType = "Vector3", 
        Children = v40.Vector3
    }, 
    {
        Name = "Orientation", 
        ValueType = "Vector3", 
        ValueFn = function(v46) --[[ Line: 146 ]] --[[ Name: ValueFn ]]
            local v47, v48, v49 = v46.Value:toEulerAnglesYXZ();
            return (Vector3.new(math.deg(v47), math.deg(v48), (math.deg(v49))));
        end, 
        SetValueFn = function(v50, v51) --[[ Line: 150 ]] --[[ Name: SetValueFn ]]
            local l_Position_0 = v51.Value.Position;
            local l_X_0 = v50.X;
            local l_Y_0 = v50.Y;
            local l_Z_0 = v50.Z;
            l_X_0 = math.rad(l_X_0);
            l_Y_0 = math.rad(l_Y_0);
            l_Z_0 = math.rad(l_Z_0);
            local v56 = CFrame.fromOrientation(l_X_0, l_Y_0, l_Z_0);
            local v57 = CFrame.new(l_Position_0) * v56;
            v51.SetValue(v57);
        end, 
        Children = v40.Vector3
    }
};
v0.Open = function(v58, v59, v60, v61, v62, v63) --[[ Line: 163 ]] --[[ Name: Open ]]
    -- upvalues: v2 (copy), v4 (copy), v8 (copy), v7 (copy), v40 (copy), v3 (copy), v5 (copy), v0 (copy), l_RunService_0 (copy)
    local v64 = not v2;
    local v65 = v4.new();
    if not v61 then
        warn("Error - No Class Info - ", v60);
        return;
    else
        v61 = v8({}, v61);
        local v66 = {};
        local v67 = {};
        local function v93(v68) --[[ Line: 178 ]] --[[ Name: resolve ]]
            -- upvalues: v60 (copy), v64 (copy), v63 (copy), v7 (ref), v40 (ref), v8 (ref), v3 (ref), v65 (copy), v66 (copy)
            local v69 = {};
            for _, v71 in v68 do
                local l_propertyName_0 = v71.propertyName;
                local v73 = nil;
                local v74 = nil;
                local l_tags_0 = v71.tags;
                if not v71.isAttribute then
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 194 ]]
                        -- upvalues: v60 (ref), l_propertyName_0 (copy)
                        return v60[l_propertyName_0];
                    end);
                    v73 = l_status_0;
                    v74 = l_result_0;
                    if not v73 or v64 and not v63 and table.find(v7, l_propertyName_0) or l_tags_0 and l_tags_0.Deprecated then
                        continue;
                    end;
                else
                    v74 = v71.currentValue;
                end;
                local l_valueType_0 = v71.valueType;
                local v79 = nil;
                local v80 = nil;
                if not v71.isAttribute then
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 221 ]]

                    end);
                    v79 = l_status_1;
                    v80 = l_result_1;
                    if v63 then
                        v80 = false;
                    end;
                end;
                local v83 = {
                    isAttribute = v71.isAttribute, 
                    Name = l_propertyName_0, 
                    ValueType = l_valueType_0
                };
                if v80 or l_tags_0 and (l_tags_0.NotScriptable or l_tags_0.Hidden) then
                    v83.ReadOnly = true;
                end;
                if l_tags_0 and l_tags_0.ReadOnly then
                    v83.ReadOnly = true;
                end;
                v83.Value = v74;
                local v84 = v40[l_valueType_0];
                if v84 then
                    v84 = v8({}, v84);
                    local function v85(v86) --[[ Line: 258 ]] --[[ Name: rec ]]
                        -- upvalues: v85 (copy)
                        if not v86.Children then
                            return;
                        else
                            for _, v88 in v86.Children do
                                v88.NotInstanceProp = true;
                                v85(v88);
                            end;
                            return;
                        end;
                    end;
                    for _, v90 in v84 do
                        v90.NotInstanceProp = true;
                        if v90.Children then
                            for _, v92 in v90.Children do
                                v92.NotInstanceProp = true;
                                v85(v92);
                            end;
                        end;
                    end;
                    v83.Children = v84;
                end;
                v83.ValueChanged = v3.new();
                v65:Add(function() --[[ Line: 275 ]]
                    -- upvalues: v83 (copy)
                    v83.ValueChanged:Destroy();
                end);
                table.insert(v69, v83);
                table.insert(v66, {
                    v60, 
                    v83, 
                    l_propertyName_0, 
                    v74, 
                    v83.ValueChanged
                });
            end;
            return v69;
        end;
        local v94 = nil;
        if typeof(v60) == "table" then
            v94 = v60.AttributesList;
            v60.GetAttribute = function(_, v96) --[[ Line: 289 ]] --[[ Name: GetAttribute ]]
                -- upvalues: v94 (ref)
                return v94[v96];
            end;
            v60.GetFullName = function(_) --[[ Line: 292 ]] --[[ Name: GetFullName ]]
                -- upvalues: v60 (copy)
                return v60.FullName;
            end;
        else
            v94 = v60:GetAttributes();
        end;
        local v98 = {
            name = "Attributes", 
            list = {}
        };
        for v99, v100 in v94 do
            local v101 = {
                propertyName = v99, 
                valueType = typeof(v100), 
                isAttribute = true, 
                currentValue = v100
            };
            table.insert(v98.list, v101);
        end;
        table.insert(v61.Categorized_Properties, v98);
        for _, v103 in v61.Categorized_Properties do
            local l_name_0 = v103.name;
            local l_list_0 = v103.list;
            table.sort(l_list_0, function(v106, v107) --[[ Line: 314 ]]
                return v106.propertyName < v107.propertyName;
            end);
            local v108 = {
                Name = l_name_0, 
                Children = v93(l_list_0), 
                IsRoot = true, 
                IsCollapsed = false
            };
            if v108.Children and #v108.Children > 0 then
                table.insert(v67, v108);
            end;
        end;
        local function v115(v109) --[[ Line: 327 ]] --[[ Name: getFullName ]]
            local v110 = {
                v109.Name
            };
            local l_v109_0 = v109;
            while true do
                local l_Parent_0 = l_v109_0.Parent;
                if (not l_v109_0 or l_v109_0.Name) and l_v109_0 then
                    l_v109_0 = l_Parent_0;
                    table.insert(v110, l_v109_0.Name);
                else
                    break;
                end;
            end;
            local v113 = {};
            for v114 = #v110, 1, -1 do
                table.insert(v113, v110[v114]);
            end;
            return v113;
        end;
        local function v116(v117) --[[ Line: 349 ]] --[[ Name: recurse ]]
            -- upvalues: v5 (ref), v60 (copy), v0 (ref), v63 (copy), v115 (copy), v62 (copy), v58 (copy), v3 (ref), v65 (copy), v116 (copy)
            v117.SetValue = function(v118, v119) --[[ Line: 351 ]]
                -- upvalues: v117 (copy), v5 (ref), v60 (ref), v0 (ref), v63 (ref), v115 (ref), v62 (ref), v58 (ref)
                if not v117.NotInstanceProp then
                    local v120 = v5(v118);
                    if v120 then
                        local l_v60_FullName_0 = v60:GetFullName();
                        local v122 = v0.PropertyChanges[l_v60_FullName_0];
                        if not v122 then
                            v122 = {
                                properties = {}, 
                                attributes = {}
                            };
                            v0.PropertyChanges[l_v60_FullName_0] = v122;
                        end;
                        local l_properties_0 = v122.properties;
                        if v117.isAttribute then
                            l_properties_0 = v122.attributes;
                        end;
                        l_properties_0[v117.Name] = v120;
                    end;
                end;
                local l_isAttribute_0 = v117.isAttribute;
                if v63 then
                    local v125 = v115(v117);
                    if l_isAttribute_0 then
                        v62:FireServer("RequestAttributeChange", v125, v118);
                        return;
                    else
                        v62:FireServer("RequestPropertyChange", v125, v118);
                        return;
                    end;
                else
                    if not v117.NotInstanceProp then
                        local l_status_2, l_result_2 = pcall(function() --[[ Line: 383 ]]
                            -- upvalues: l_isAttribute_0 (copy), v60 (ref), v117 (ref), v118 (copy)
                            if l_isAttribute_0 then
                                v60:SetAttribute(v117.Name, v118);
                            else
                                v60[v117.Name] = v118;
                            end;
                            v117.Value = v118;
                        end);
                        if not l_status_2 then
                            warn(l_result_2);
                        end;
                    elseif v117.SetValueFn then
                        v117.SetValueFn(v118, v117.Parent);
                    end;
                    if v119 then
                        v58:Open(v60);
                    end;
                    return;
                end;
            end;
            if v117.ValueFn and v117.Parent and v117.Parent.Value then
                v117.ValueChanged = v3.new();
                v65:Add(function() --[[ Line: 409 ]]
                    -- upvalues: v117 (copy)
                    v117.ValueChanged:Destroy();
                end);
                v117.Value = v117.ValueFn(v117.Parent);
            end;
            if not v117.Children then
                return;
            else
                for _, v129 in v117.Children do
                    if v117.ReadOnly == true then
                        v129.ReadOnly = true;
                    end;
                    v129.Parent = v117;
                    v116(v129);
                end;
                return;
            end;
        end;
        v65:Add(l_RunService_0.Heartbeat:Connect(function() --[[ Line: 428 ]]
            -- upvalues: v66 (copy), v58 (copy), v2 (ref), v62 (copy), v59 (copy), v115 (copy)
            for _, v131 in v66 do
                local v132, v133, v134, v135, v136 = unpack(v131);
                local l_isAttribute_1 = v133.isAttribute;
                local v138 = nil;
                v138 = if l_isAttribute_1 then v132:GetAttribute(v134) else v132[v134];
                if v138 ~= v135 then
                    v133.Value = v138;
                    v136:Fire(v138);
                    v58:updateChildren(v133);
                    if v2 then
                        v62:FireClient(v59, "TreeChangedValue", v115(v133), v138);
                    end;
                end;
                v131[4] = v138;
            end;
        end));
        local v139 = {
            IsCollapsed = false, 
            Children = v67
        };
        v116(v139);
        return v139, v65;
    end;
end;
v0.updateChildren = function(v140, v141) --[[ Line: 460 ]] --[[ Name: updateChildren ]]
    if not v141.Children then
        return;
    else
        for _, v143 in v141.Children do
            if v143.ValueFn then
                local v144 = v143.ValueFn(v141);
                v143.Value = v144;
                if v143.ValueChanged then
                    v143.ValueChanged:Fire(v144);
                end;
                v140:updateChildren(v143);
            end;
        end;
        return;
    end;
end;
return v0;