local l_Util_0 = require(script:WaitForChild("Util"));
local l_CreateStandardInitial_0 = l_Util_0.CreateStandardInitial;
local l_AssertIsTypeBase_0 = l_Util_0.AssertIsTypeBase;
local l_ExpectType_0 = l_Util_0.ExpectType;
local l_Expect_0 = l_Util_0.Expect;
local l_TypeCheckers_0 = script:WaitForChild("TypeCheckers");
local l__Template_0 = require(l_TypeCheckers_0:WaitForChild("_Template"));
local v11 = {
    CreateTemplate = l__Template_0.Create, 
    Template = l__Template_0, 
    FromTypeSample = function(v7, _) --[[ Line: 21 ]] --[[ Name: FromTypeSample ]]
        -- upvalues: l_ExpectType_0 (copy), l_Expect_0 (copy), l__Template_0 (copy), l_CreateStandardInitial_0 (copy)
        l_ExpectType_0(v7, l_Expect_0.STRING, 1);
        local v9, v10 = l__Template_0.Create(v7);
        v10._Initial = l_CreateStandardInitial_0(v7);
        v10.InitialConstraint = v10.Equals;
        return v9;
    end, 
    Number = require(l_TypeCheckers_0:WaitForChild("Number"))
};
v11.number = v11.Number;
v11.String = require(l_TypeCheckers_0:WaitForChild("String"));
v11.string = v11.String;
v11.Array = require(l_TypeCheckers_0:WaitForChild("Array"));
v11.array = v11.Array;
v11.Object = require(l_TypeCheckers_0:WaitForChild("Object"));
v11.object = v11.Object;
v11.Instance = require(l_TypeCheckers_0:WaitForChild("Instance"));
v11.instance = v11.Instance;
v11.Enum = require(l_TypeCheckers_0:WaitForChild("Enum"));
v11.enum = v11.Enum;
v11.Thread = require(l_TypeCheckers_0:WaitForChild("Thread"));
v11.thread = v11.Thread;
v11.Any = require(l_TypeCheckers_0:WaitForChild("Any"));
v11.any = v11.Any;
local v12 = {};
local l_FromTypeSample_0 = v11.FromTypeSample;
v11.Axes = l_FromTypeSample_0("Axes", Axes.new());
v11.BrickColor = l_FromTypeSample_0("BrickColor", BrickColor.Black());
v11.CatalogSearchParams = l_FromTypeSample_0("CatalogSearchParams", CatalogSearchParams.new());
v11.CFrame = l_FromTypeSample_0("CFrame", CFrame.new());
v11.Color3 = l_FromTypeSample_0("Color3", Color3.new());
v11.ColorSequence = l_FromTypeSample_0("ColorSequence", ColorSequence.new(Color3.new()));
v11.ColorSequenceKeypoint = l_FromTypeSample_0("ColorSequenceKeypoint", ColorSequenceKeypoint.new(0, Color3.new()));
v11.DateTime = l_FromTypeSample_0("DateTime", DateTime.now());
v11.DockWidgetPluginGuiInfo = l_FromTypeSample_0("DockWidgetPluginGuiInfo", DockWidgetPluginGuiInfo.new());
v11.Enums = l_FromTypeSample_0("Enums", Enum);
v11.Faces = l_FromTypeSample_0("Faces", Faces.new());
v11.FloatCurveKey = l_FromTypeSample_0("FloatCurveKey", v12);
v11.NumberRange = l_FromTypeSample_0("NumberRange", NumberRange.new(0, 0));
v11.NumberSequence = l_FromTypeSample_0("NumberSequence", NumberSequence.new(1));
v11.NumberSequenceKeypoint = l_FromTypeSample_0("NumberSequenceKeypoint", NumberSequenceKeypoint.new(1, 1));
v11.OverlapParams = l_FromTypeSample_0("OverlapParams", OverlapParams.new());
v11.PathWaypoint = l_FromTypeSample_0("PathWaypoint", PathWaypoint.new(Vector3.new(), Enum.PathWaypointAction.Jump));
v11.PhysicalProperties = l_FromTypeSample_0("PhysicalProperties", PhysicalProperties.new(Enum.Material.Air));
v11.Random = l_FromTypeSample_0("Random", Random.new());
v11.Ray = l_FromTypeSample_0("Ray", Ray.new(Vector3.new(), (Vector3.new())));
v11.RaycastParams = l_FromTypeSample_0("RaycastParams", RaycastParams.new());
v11.RaycastResult = l_FromTypeSample_0("RaycastResult", v12);
v11.RBXScriptConnection = l_FromTypeSample_0("RBXScriptConnection", Instance.new("BindableEvent").Event:Connect(function() --[[ Line: 86 ]]

end));
v11.RBXScriptSignal = l_FromTypeSample_0("RBXScriptSignal", Instance.new("BindableEvent").Event);
v11.Rect = l_FromTypeSample_0("Rect", Rect.new(Vector2.new(), Vector2.new()));
v11.Region3 = l_FromTypeSample_0("Region3", Region3.new(Vector3.new(), (Vector3.new())));
v11.Region3int16 = l_FromTypeSample_0("Region3int16", Region3int16.new(Vector3int16.new(), Vector3int16.new()));
v11.TweenInfo = l_FromTypeSample_0("TweenInfo", TweenInfo.new());
v11.UDim = l_FromTypeSample_0("UDim", UDim.new());
v11.UDim2 = l_FromTypeSample_0("UDim2", UDim2.new());
v11.Vector2 = l_FromTypeSample_0("Vector2", Vector2.new());
v11.Vector2int16 = l_FromTypeSample_0("Vector2int16", Vector2int16.new(0, 0));
v11.Vector3 = l_FromTypeSample_0("Vector3", (Vector3.new()));
v11.Vector3int16 = l_FromTypeSample_0("Vector3int16", Vector3int16.new());
v11.Function = v11.FromTypeSample("function", function() --[[ Line: 100 ]]

end);
v11.lfunction = v11.Function;
v11.Userdata = v11.FromTypeSample("userdata", newproxy(true));
v11.luserdata = v11.Userdata;
v11.Nil = v11.FromTypeSample("nil", nil);
v11.lnil = v11.Nil;
v11.Table = v11.FromTypeSample("table", {});
v11.table = v11.Table;
v11.Boolean = v11.FromTypeSample("boolean", true);
v11.boolean = v11.Boolean;
v12 = v11.Object({
    _Check = v11.Function()
});
v11.Params = function(...) --[[ Line: 123 ]] --[[ Name: Params ]]
    -- upvalues: v12 (copy)
    local v14 = {
        ...
    };
    local v15 = #v14;
    for _, v17 in v14 do
        v12:Assert(v17);
    end;
    return function(...) --[[ Line: 131 ]]
        -- upvalues: v15 (copy), v14 (copy)
        local v18 = select("#", ...);
        if v15 < v18 then
            error((("Expected %* argument%*, got %*."):format(v15, v15 == 1 and "" or "s", v18)));
        end;
        for v19, v20 in v14 do
            local v21, v22 = v20:_Check((select(v19, ...)));
            if not v21 then
                error((("Invalid argument #%* (%*)."):format(v19, v22)));
            end;
        end;
    end;
end;
v11.params = v11.Params;
l_FromTypeSample_0 = v11.Params(v12);
v11.Variadic = function(v23) --[[ Line: 152 ]] --[[ Name: Variadic ]]
    -- upvalues: l_FromTypeSample_0 (copy)
    l_FromTypeSample_0(v23);
    return function(...) --[[ Line: 155 ]]
        -- upvalues: v23 (copy)
        for v24 = 1, select("#", ...) do
            local v25 = select(v24, ...);
            local v26, v27 = v23:_Check(v25);
            if not v26 then
                error((("Invalid argument #%* (%*)."):format(v24, v27)));
            end;
        end;
    end;
end;
v11.variadic = v11.Variadic;
local v28 = v11.Variadic(v12);
v11.ParamsWithContext = function(...) --[[ Line: 172 ]] --[[ Name: ParamsWithContext ]]
    -- upvalues: v28 (copy), l_AssertIsTypeBase_0 (copy)
    v28(...);
    local v29 = {
        ...
    };
    local v30 = #v29;
    for v31, v32 in v29 do
        l_AssertIsTypeBase_0(v32, v31);
    end;
    return function(v33, ...) --[[ Line: 182 ]]
        -- upvalues: v30 (copy), v29 (copy)
        local v34 = select("#", ...);
        if v30 < v34 then
            error((("Expected %* argument%*, got %*."):format(v30, v30 == 1 and "" or "s", v34)));
        end;
        for v35, v36 in v29 do
            local v37 = select(v35, ...);
            local v38, v39 = v36:WithContext(v33):Check(v37);
            if not v38 then
                error((("Invalid argument #%* (%*)."):format(v35, v39)));
            end;
        end;
    end;
end;
v11.paramsWithContext = v11.ParamsWithContext;
local v40 = v11.Params(v12);
v11.VariadicWithContext = function(v41) --[[ Line: 203 ]] --[[ Name: VariadicWithContext ]]
    -- upvalues: v40 (copy)
    v40(v41);
    return function(v42, ...) --[[ Line: 206 ]]
        -- upvalues: v41 (copy)
        for v43 = 1, select("#", ...) do
            local v44 = select(v43, ...);
            local v45, v46 = v41:WithContext(v42):Check(v44);
            if not v45 then
                error((("Invalid argument #%* (%*)."):format(v43, v46)));
            end;
        end;
    end;
end;
v11.variadicWithContext = v11.VariadicWithContext;
local v47 = v11.Params(v11.Function());
local v48 = v11.Variadic(v12);
v11.WrapFunctionParams = function(v49, ...) --[[ Line: 224 ]] --[[ Name: WrapFunctionParams ]]
    -- upvalues: v47 (copy), v48 (copy), l_AssertIsTypeBase_0 (copy), v11 (copy)
    v47(v49);
    v48(...);
    for v50 = 1, select("#", ...) do
        l_AssertIsTypeBase_0(select(v50, ...), v50);
    end;
    local v51 = v11.Params(...);
    return function(...) --[[ Line: 234 ]]
        -- upvalues: v51 (copy), v49 (copy)
        v51(...);
        return v49(...);
    end;
end;
v11.wrapFunctionParams = v11.WrapFunctionParams;
local v52 = v11.Params(v11.Function(), v12);
v11.WrapFunctionVariadic = function(v53, v54) --[[ Line: 243 ]] --[[ Name: WrapFunctionVariadic ]]
    -- upvalues: v52 (copy), v11 (copy)
    v52(v53, v54);
    local v55 = v11.Variadic(v54);
    return function(...) --[[ Line: 248 ]]
        -- upvalues: v55 (copy), v53 (copy)
        v55(...);
        return v53(...);
    end;
end;
v11.wrapFunctionVariadic = v11.WrapFunctionVariadic;
local v56 = {
    ["nil"] = "Nil", 
    string = "String", 
    number = "Number", 
    thread = "Thread", 
    boolean = "Boolean", 
    ["function"] = "Function", 
    userdata = "Userdata"
};
local function v57(v58, v59) --[[ Line: 265 ]] --[[ Name: _FromTemplate ]]
    -- upvalues: v56 (copy), v57 (copy), v11 (copy)
    local v60 = typeof(v58);
    v60 = v56[v60] or v60;
    if v60 == "table" then
        if v58[1] then
            local v61 = nil;
            local v62 = "";
            for _, v64 in v58 do
                local v65 = v57(v64, v59);
                if v65.Type ~= v62 then
                    if v61 then
                        v61 = v65:Or(v61);
                    else
                        v61 = v65;
                    end;
                    v62 = v65.Type;
                end;
            end;
            return v11.Array(v59 and v61:Strict() or v61);
        else
            local v66 = {};
            for v67, v68 in v58 do
                v66[v67] = v57(v68, v59);
            end;
            local v69 = v11.Object(v66);
            return v59 and v69:Strict() or v69;
        end;
    elseif v60 == "Instance" then
        local v70 = {};
        for _, v72 in v58:GetChildren() do
            v70[v72.Name] = v57(v72, v59);
        end;
        local v73 = v11.Instance(v58.ClassName);
        v73 = v59 and v73:Strict() or v73;
        if next(v70) then
            return (v73:OfStructure(v70));
        else
            return v73;
        end;
    elseif v60 == "EnumItem" then
        return v11.Enum(v58);
    else
        local v74 = v11[v60];
        if not v74 then
            error("Unknown type: " .. v60);
        end;
        return v74();
    end;
end;
local v75 = v11.Params(v11.Boolean():Optional());
v11.FromTemplate = function(v76, v77) --[[ Line: 325 ]] --[[ Name: FromTemplate ]]
    -- upvalues: v75 (copy), v57 (copy)
    v75(v77);
    return v57(v76, v77);
end;
return v11;