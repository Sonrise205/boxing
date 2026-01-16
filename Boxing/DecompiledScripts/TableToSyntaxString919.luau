local l_Parent_0 = script.Parent.Parent;
local l_Modules_0 = l_Parent_0.Modules;
local l_Components_0 = l_Parent_0.Components;
local v3 = require(l_Modules_0.Packages);
local v4 = require(v3.Directory.PacketSizeCounter);
local v5 = require(l_Components_0.StudioSettings);
local v6 = {
    ["\a"] = "\\a", 
    ["\b"] = "\\b", 
    ["\f"] = "\\f", 
    ["\n"] = "\\n", 
    ["\r"] = "\\r", 
    ["\t"] = "\\t", 
    ["\v"] = "\\v", 
    ["\000"] = "\\0"
};
local v7 = {
    ["and"] = true, 
    ["break"] = true, 
    ["do"] = true, 
    ["else"] = true, 
    ["elseif"] = true, 
    ["end"] = true, 
    ["false"] = true, 
    ["for"] = true, 
    ["function"] = true, 
    ["if"] = true, 
    ["in"] = true, 
    ["local"] = true, 
    ["nil"] = true, 
    ["not"] = true, 
    ["or"] = true, 
    ["repeat"] = true, 
    ["return"] = true, 
    ["then"] = true, 
    ["true"] = true, 
    ["until"] = true, 
    ["while"] = true, 
    continue = true
};
local v8 = {
    ["&"] = "&amp;", 
    ["<"] = "&lt;", 
    [">"] = "&gt;", 
    ["\""] = "&quot;", 
    ["'"] = "&apos;"
};
local function _(v9) --[[ Line: 18 ]] --[[ Name: GetByteSize ]]
    -- upvalues: v4 (copy)
    local v10 = v4.GetDataByteSize(v9);
    if v10 < 1000 then
        return (("%* bytes"):format(v10));
    else
        return string.format("%.3f kilobytes", v10 / 1000);
    end;
end;
local v12 = {
    string = "ScriptString", 
    number = "ScriptNumber", 
    operator = "ScriptOperator", 
    keyword = "ScriptKeyword", 
    boolean = "ScriptKeyword", 
    builtin = "ScriptBuiltInFunction", 
    funcname = "ScriptFunctionName", 
    text = "ScriptText", 
    ["nil"] = "ScriptKeyword", 
    bytesize = "ScriptComment", 
    bracket = "ScriptBracket"
};
local v13 = {};
local function v17() --[[ Line: 42 ]] --[[ Name: UpdateStyleGuideColors ]]
    -- upvalues: v5 (copy), v12 (copy), v13 (copy)
    local l_Theme_0 = v5.Theme;
    for v15, v16 in v12 do
        v13[v15] = ("#%*"):format((l_Theme_0:GetColor(v16):ToHex()));
    end;
end;
v17();
v5.ThemeChanged:Connect(v17);
local function v20(v18, v19) --[[ Line: 52 ]] --[[ Name: Syntax ]]
    -- upvalues: v13 (copy)
    return string.format("<font color=\"%s\">%s</font>", v13[v19] or v13.text, v18);
end;
local v21 = {
    ["."] = string.format("<font color=\"%s\">%s</font>", v13.operator or v13.text, "."), 
    [","] = string.format("<font color=\"%s\">%s</font>", v13.text or v13.text, ","), 
    ["="] = string.format("<font color=\"%s\">%s</font>", v13.operator or v13.text, "="), 
    ["("] = string.format("<font color=\"%s\">%s</font>", v13.bracket or v13.text, "("), 
    [")"] = string.format("<font color=\"%s\">%s</font>", v13.bracket or v13.text, ")"), 
    ["{"] = string.format("<font color=\"%s\">%s</font>", v13.bracket or v13.text, "{"), 
    ["}"] = string.format("<font color=\"%s\">%s</font>", v13.bracket or v13.text, "}"), 
    ["["] = string.format("<font color=\"%s\">%s</font>", v13.bracket or v13.text, "["), 
    ["]"] = string.format("<font color=\"%s\">%s</font>", v13.bracket or v13.text, "]")
};
local function _(v22) --[[ Line: 68 ]] --[[ Name: CleanupString ]]
    -- upvalues: v6 (copy), v8 (copy)
    local v23 = string.gsub(v22, "[%c%z]", v6);
    return (string.gsub(v23, "[%&%<%>%\"%']", v8));
end;
local function v34(v25) --[[ Line: 74 ]] --[[ Name: GetHierarchy ]]
    -- upvalues: v6 (copy), v8 (copy), v7 (copy), v21 (copy), v13 (copy)
    local v26 = "";
    local v27 = true;
    while v27 do
        local l_Parent_1 = v25.Parent;
        v27 = l_Parent_1 and l_Parent_1.Parent and l_Parent_1 ~= game;
        local l_Name_0 = v25.Name;
        local v30 = string.gsub(l_Name_0, "[%c%z]", v6);
        local v31 = string.gsub(v30, "[%&%<%>%\"%']", v8);
        if v7[v31] or not string.match(v31, "^[_%a][_%w]*$") then
            l_Name_0 = "%*%*%*";
            local v32 = v21["["];
            local v33 = ("&quot;%*&quot;"):format(v31);
            v31 = l_Name_0:format(v32, string.format("<font color=\"%s\">%s</font>", v13.string or v13.text, v33), v21["]"]);
        else
            v31 = ("%*%*"):format(v27 and v21["."] or "", (string.format("<font color=\"%s\">%s</font>", v13.text or v13.text, v31)));
        end;
        v26 = v31 .. v26;
        v25 = l_Parent_1;
    end;
    return v26;
end;
local function v39(v35) --[[ Line: 95 ]] --[[ Name: ReadBuffer ]]
    local v36 = buffer.len(v35);
    local v37 = table.create(v36);
    for v38 = 0, v36 - 1 do
        table.insert(v37, (buffer.readu8(v35, v38)));
    end;
    return table.concat(v37, " ");
end;
local function v58(v40, v41) --[[ Line: 105 ]] --[[ Name: SerializeType ]]
    -- upvalues: v20 (copy), v6 (copy), v8 (copy), v34 (copy), v13 (copy), v21 (copy), v39 (copy)
    if v41 == "string" then
        local l_v20_0 = v20;
        local l_format_0 = string.format;
        local v44 = "&quot;%s&quot;";
        local v45 = string.gsub(v40, "[%c%z]", v6);
        return l_v20_0(l_format_0(v44, (string.gsub(v45, "[%&%<%>%\"%']", v8))), "string");
    elseif v41 == "Instance" then
        return (v34(v40));
    elseif v41 == "buffer" then
        local v46 = "%*%*%*%*%*%*";
        local v47 = string.format("<font color=\"%s\">%s</font>", v13.builtin or v13.text, "buffer");
        local v48 = v21["."];
        local v49 = string.format("<font color=\"%s\">%s</font>", v13.builtin or v13.text, "new");
        local v50 = v21["("];
        local v51 = v39(v40);
        return (v46:format(v47, v48, v49, v50, string.format("<font color=\"%s\">%s</font>", v13.number or v13.text, v51), v21[")"]));
    elseif type(v40) ~= v41 then
        local v52 = "%*%*%*%*%*%*";
        local v53 = string.format("<font color=\"%s\">%s</font>", v13.builtin or v13.text, v41);
        local v54 = v21["."];
        local v55 = string.format("<font color=\"%s\">%s</font>", v13.builtin or v13.text, "new");
        local v56 = v21["("];
        local v57 = tostring(v40);
        return (v52:format(v53, v54, v55, v56, string.format("<font color=\"%s\">%s</font>", v13.number or v13.text, v57), v21[")"]));
    else
        return v20(tostring(v40), v41);
    end;
end;
local function v59(v60, v61, v62, v63) --[[ Line: 119 ]] --[[ Name: TableToSyntaxString ]]
    -- upvalues: v20 (copy), v21 (copy), v4 (copy), v13 (copy), v6 (copy), v8 (copy), v7 (copy), v59 (copy), v58 (copy)
    v62 = v62 or {};
    if v62[v60] then
        return v20("&quot;[Cyclic reference]&quot;", "string");
    else
        v62[v60] = true;
        local v64 = not v61;
        local v65 = (v63 or 0) + 1;
        local v66 = string.rep("    ", v65 - 1);
        local v67 = string.rep("    ", v65 - 2);
        local v68 = {
            v65 ~= 1 and v21["{"] or ""
        };
        local v69 = next(v60) == nil;
        local v70 = true;
        local v71 = 1;
        for v72, v73 in v60 do
            if v71 ~= v72 then
                v70 = false;
            end;
            local v74 = typeof(v72);
            local v75 = typeof(v73);
            local v76;
            if v74 ~= "table" and v64 then
                local v77 = ": %* ";
                local v78 = v4.GetDataByteSize(v72);
                local v79 = if v78 < 1000 then ("%* bytes"):format(v78) else string.format("%.3f kilobytes", v78 / 1000);
                v76 = v77:format((string.format("<font color=\"%s\">%s</font>", v13.bytesize or v13.text, v79)));
            else
                v76 = "";
            end;
            local v80;
            if v75 ~= "table" and v64 then
                local v81 = ": %*";
                local v82 = v4.GetDataByteSize(v73);
                local v83 = if v82 < 1000 then ("%* bytes"):format(v82) else string.format("%.3f kilobytes", v82 / 1000);
                v80 = v81:format((string.format("<font color=\"%s\">%s</font>", v13.bytesize or v13.text, v83)));
            else
                v80 = "";
            end;
            if v74 == "string" then
                local v84 = string.gsub(v72, "[%c%z]", v6);
                v72 = string.gsub(v84, "[%&%<%>%\"%']", v8);
                if v7[v72] or not string.match(v72, "^[_%a][_%w]*$") then
                    v72 = string.format(("%*%*%*"):format(v21["["], string.format("<font color=\"%s\">%s</font>", v13.string or v13.text, "&quot;%s&quot;"), v21["]"]), v72);
                end;
            else
                local v85 = nil;
                v85 = if v74 == "table" then v59(v72, v61, v62, 1) else v58(v72, v74);
                v72 = ("%*%*%*"):format(v21["["], v85, v21["]"]);
            end;
            v73 = if v75 == "table" then v59(v73, v61, v62, v65) else v58(v73, v75);
            v68[v71] = ("%*%*%*%*"):format(v71 == 1 and v66 or ("\n%*"):format(v66), v70 and v73 or ("%*%* %* %*"):format(v72, v76, v21["="], v73), v80, v21[","]);
            v71 = v71 + 1;
        end;
        if v65 == 1 then
            if v69 then
                return "";
            else
                return (table.concat(v68, ""));
            end;
        elseif v69 then
            return (("%*%*"):format(v21["{"], v21["}"]));
        else
            return (("%*\n%*\n%*%*"):format(v21["{"], table.concat(v68, ""), v67, v21["}"]));
        end;
    end;
end;
return v59;