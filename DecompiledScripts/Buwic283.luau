if string.sub(_VERSION, 1, 4) == "Lune" then

end;
local v0 = {};
v0.__index = v0;
local v1 = {
    [Enum.NormalId.Top.Value] = Vector3.FromNormalId(Enum.NormalId.Top), 
    [Enum.NormalId.Left.Value] = Vector3.FromNormalId(Enum.NormalId.Left), 
    [Enum.NormalId.Front.Value] = Vector3.FromNormalId(Enum.NormalId.Front), 
    [Enum.NormalId.Bottom.Value] = Vector3.FromNormalId(Enum.NormalId.Bottom), 
    [Enum.NormalId.Right.Value] = Vector3.FromNormalId(Enum.NormalId.Right), 
    [Enum.NormalId.Back.Value] = Vector3.FromNormalId(Enum.NormalId.Back)
};
local v2 = {};
local v3 = {};
if Enum ~= nil then
    for _, v5 in Enum.FontStyle:GetEnumItems() do
        v2[v5.Value] = v5;
    end;
    for _, v7 in Enum.FontWeight:GetEnumItems() do
        v3[v7.Value] = v7;
    end;
end;
local function _(v8, v9) --[[ Line: 58 ]] --[[ Name: approxEq ]]
    return math.abs(v8 - v9) <= math.max(math.max(math.abs(v8), (math.abs(v9))) * 1.0E-6, 1.0E-6);
end;
local function _(v11, v12) --[[ Line: 65 ]] --[[ Name: resizeIfNeeded ]]
    local v13 = buffer.len(v11._buffer);
    if v13 < v11._cursor + v12 then
        local v14 = buffer.create(v13 + v12);
        buffer.copy(v14, 0, v11._buffer);
        v11._buffer = v14;
    end;
end;
local function _(v16, v17) --[[ Line: 81 ]] --[[ Name: writeu24 ]]
    local v18 = buffer.len(v16._buffer);
    if v18 < v16._cursor + 3 then
        local v19 = buffer.create(v18 + 3);
        buffer.copy(v19, 0, v16._buffer);
        v16._buffer = v19;
    end;
    buffer.writeu8(v16._buffer, v16._cursor, (bit32.band(v17, 255)));
    buffer.writeu16(v16._buffer, v16._cursor + 1, (bit32.rshift(v17, 8)));
    v16._cursor = v16._cursor + 3;
end;
local function _(v21) --[[ Line: 91 ]] --[[ Name: readu24 ]]
    local v22 = buffer.readu16(v21._buffer, v21._cursor);
    v21._cursor = v21._cursor + 3;
    return bit32.lshift(buffer.readu8(v21._buffer, v21._cursor - 1), 16) + v22;
end;
v0.isA = function(v24) --[[ Line: 98 ]] --[[ Name: isA ]]
    -- upvalues: v0 (copy)
    return getmetatable(v24) == v0;
end;
v0.new = function(v25) --[[ Line: 104 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _buffer = buffer.create(v25 or 0), 
        _len = 0, 
        _cursor = 0
    }, v0));
end;
v0.fromString = function(v26) --[[ Line: 114 ]] --[[ Name: fromString ]]
    -- upvalues: v0 (copy)
    local v27 = v0.new(#v26);
    buffer.writestring(v27._buffer, 0, v26);
    return v27;
end;
v0.fromBuffer = function(v28) --[[ Line: 124 ]] --[[ Name: fromBuffer ]]
    -- upvalues: v0 (copy)
    local v29 = v0.new(buffer.len(v28));
    buffer.copy(v29._buffer, 0, v28);
    return v29;
end;
v0.toString = function(v30) --[[ Line: 133 ]] --[[ Name: toString ]]
    return buffer.readstring(v30._buffer, 0, buffer.len(v30._buffer));
end;
v0.toBuffer = function(v31) --[[ Line: 141 ]] --[[ Name: toBuffer ]]
    local v32 = buffer.create(buffer.len(v31._buffer));
    buffer.copy(v32, 0, v31._buffer);
    return v32;
end;
v0.getRawBuffer = function(v33) --[[ Line: 151 ]] --[[ Name: getRawBuffer ]]
    return v33._buffer;
end;
v0.capacity = function(v34) --[[ Line: 157 ]] --[[ Name: capacity ]]
    return buffer.len(v34._buffer);
end;
v0.getCursor = function(v35) --[[ Line: 163 ]] --[[ Name: getCursor ]]
    return v35._cursor;
end;
v0.setCursor = function(v36, v37) --[[ Line: 173 ]] --[[ Name: setCursor ]]
    v36._cursor = v37;
end;
v0.reserve = function(v38, v39) --[[ Line: 180 ]] --[[ Name: reserve ]]
    local v40 = buffer.len(v38._buffer);
    local v41 = buffer.create(v40 + v39);
    buffer.copy(v41, 0, v38._buffer);
    v38._buffer = v41;
end;
v0.shrink = function(v42, v43) --[[ Line: 194 ]] --[[ Name: shrink ]]
    local v44 = buffer.len(v42._buffer);
    local v45 = buffer.create((math.max(v44 - v43, 0)));
    buffer.copy(v45, 0, v42._buffer, 0, v44 - v43);
    if v42._cursor > buffer.len(v45) then
        v42._cursor = buffer.len(v45);
    end;
    v42._buffer = v45;
end;
v0.writeu8 = function(v46, v47) --[[ Line: 212 ]] --[[ Name: writeu8 ]]
    local v48 = buffer.len(v46._buffer);
    if v48 < v46._cursor + 1 then
        local v49 = buffer.create(v48 + 1);
        buffer.copy(v49, 0, v46._buffer);
        v46._buffer = v49;
    end;
    buffer.writeu8(v46._buffer, v46._cursor, v47);
    v46._cursor = v46._cursor + 1;
end;
v0.writei8 = function(v50, v51) --[[ Line: 223 ]] --[[ Name: writei8 ]]
    local v52 = buffer.len(v50._buffer);
    if v52 < v50._cursor + 1 then
        local v53 = buffer.create(v52 + 1);
        buffer.copy(v53, 0, v50._buffer);
        v50._buffer = v53;
    end;
    buffer.writei8(v50._buffer, v50._cursor, v51);
    v50._cursor = v50._cursor + 1;
end;
v0.writeu16 = function(v54, v55) --[[ Line: 234 ]] --[[ Name: writeu16 ]]
    local v56 = buffer.len(v54._buffer);
    if v56 < v54._cursor + 2 then
        local v57 = buffer.create(v56 + 2);
        buffer.copy(v57, 0, v54._buffer);
        v54._buffer = v57;
    end;
    buffer.writeu16(v54._buffer, v54._cursor, v55);
    v54._cursor = v54._cursor + 2;
end;
v0.writei16 = function(v58, v59) --[[ Line: 245 ]] --[[ Name: writei16 ]]
    local v60 = buffer.len(v58._buffer);
    if v60 < v58._cursor + 2 then
        local v61 = buffer.create(v60 + 2);
        buffer.copy(v61, 0, v58._buffer);
        v58._buffer = v61;
    end;
    buffer.writei16(v58._buffer, v58._cursor, v59);
    v58._cursor = v58._cursor + 2;
end;
v0.writeu24 = function(v62, v63) --[[ Line: 256 ]] --[[ Name: writeu24 ]]
    local v64 = buffer.len(v62._buffer);
    if v64 < v62._cursor + 3 then
        local v65 = buffer.create(v64 + 3);
        buffer.copy(v65, 0, v62._buffer);
        v62._buffer = v65;
    end;
    buffer.writeu8(v62._buffer, v62._cursor, (bit32.band(v63, 255)));
    buffer.writeu16(v62._buffer, v62._cursor + 1, (bit32.rshift(v63, 8)));
    v62._cursor = v62._cursor + 3;
end;
v0.writei24 = function(v66, v67) --[[ Line: 265 ]] --[[ Name: writei24 ]]
    local v68 = v67 % 16777216;
    local v69 = buffer.len(v66._buffer);
    if v69 < v66._cursor + 3 then
        local v70 = buffer.create(v69 + 3);
        buffer.copy(v70, 0, v66._buffer);
        v66._buffer = v70;
    end;
    buffer.writeu8(v66._buffer, v66._cursor, (bit32.band(v68, 255)));
    buffer.writeu16(v66._buffer, v66._cursor + 1, (bit32.rshift(v68, 8)));
    v66._cursor = v66._cursor + 3;
end;
v0.writeu32 = function(v71, v72) --[[ Line: 274 ]] --[[ Name: writeu32 ]]
    local v73 = buffer.len(v71._buffer);
    if v73 < v71._cursor + 4 then
        local v74 = buffer.create(v73 + 4);
        buffer.copy(v74, 0, v71._buffer);
        v71._buffer = v74;
    end;
    buffer.writeu32(v71._buffer, v71._cursor, v72);
    v71._cursor = v71._cursor + 4;
end;
v0.writei32 = function(v75, v76) --[[ Line: 285 ]] --[[ Name: writei32 ]]
    local v77 = buffer.len(v75._buffer);
    if v77 < v75._cursor + 4 then
        local v78 = buffer.create(v77 + 4);
        buffer.copy(v78, 0, v75._buffer);
        v75._buffer = v78;
    end;
    buffer.writei32(v75._buffer, v75._cursor, v76);
    v75._cursor = v75._cursor + 4;
end;
v0.writef32 = function(v79, v80) --[[ Line: 294 ]] --[[ Name: writef32 ]]
    local v81 = buffer.len(v79._buffer);
    if v81 < v79._cursor + 4 then
        local v82 = buffer.create(v81 + 4);
        buffer.copy(v82, 0, v79._buffer);
        v79._buffer = v82;
    end;
    buffer.writef32(v79._buffer, v79._cursor, v80);
    v79._cursor = v79._cursor + 4;
end;
v0.writef64 = function(v83, v84) --[[ Line: 303 ]] --[[ Name: writef64 ]]
    local v85 = buffer.len(v83._buffer);
    if v85 < v83._cursor + 8 then
        local v86 = buffer.create(v85 + 8);
        buffer.copy(v86, 0, v83._buffer);
        v83._buffer = v86;
    end;
    buffer.writef64(v83._buffer, v83._cursor, v84);
    v83._cursor = v83._cursor + 8;
end;
v0.writeRawString = function(v87, v88, v89) --[[ Line: 317 ]] --[[ Name: writeRawString ]]
    local v90 = v89 or #v88;
    local v91 = buffer.len(v87._buffer);
    if v91 < v87._cursor + v90 then
        local v92 = buffer.create(v91 + v90);
        buffer.copy(v92, 0, v87._buffer);
        v87._buffer = v92;
    end;
    buffer.writestring(v87._buffer, v87._cursor, v88, v89);
    v87._cursor = v87._cursor + (v89 or #v88);
end;
v0.writeString = function(v93, v94, v95) --[[ Line: 331 ]] --[[ Name: writeString ]]
    local v96 = (v95 or #v94) + 4;
    local v97 = buffer.len(v93._buffer);
    if v97 < v93._cursor + v96 then
        local v98 = buffer.create(v97 + v96);
        buffer.copy(v98, 0, v93._buffer);
        v93._buffer = v98;
    end;
    buffer.writeu32(v93._buffer, v93._cursor, v95 or #v94);
    buffer.writestring(v93._buffer, v93._cursor + 4, v94, v95);
    v93._cursor = v93._cursor + (#v94 + 4);
end;
v0.writeBuffer = function(v99, v100, v101) --[[ Line: 343 ]] --[[ Name: writeBuffer ]]
    local v102 = v101 or buffer.len(v100);
    local v103 = buffer.len(v99._buffer);
    if v103 < v99._cursor + v102 then
        local v104 = buffer.create(v103 + v102);
        buffer.copy(v104, 0, v99._buffer);
        v99._buffer = v104;
    end;
    buffer.copy(v99._buffer, v99._cursor, v100, 0, v101);
    v99._cursor = v99._cursor + (v101 or buffer.len(v100));
end;
v0.readu8 = function(v105) --[[ Line: 354 ]] --[[ Name: readu8 ]]
    local v106 = buffer.readu8(v105._buffer, v105._cursor);
    v105._cursor = v105._cursor + 1;
    return v106;
end;
v0.readi8 = function(v107) --[[ Line: 363 ]] --[[ Name: readi8 ]]
    local v108 = buffer.readi8(v107._buffer, v107._cursor);
    v107._cursor = v107._cursor + 1;
    return v108;
end;
v0.readu16 = function(v109) --[[ Line: 372 ]] --[[ Name: readu16 ]]
    local v110 = buffer.readu16(v109._buffer, v109._cursor);
    v109._cursor = v109._cursor + 2;
    return v110;
end;
v0.readi16 = function(v111) --[[ Line: 381 ]] --[[ Name: readi16 ]]
    local v112 = buffer.readi16(v111._buffer, v111._cursor);
    v111._cursor = v111._cursor + 2;
    return v112;
end;
v0.readu24 = function(v113) --[[ Line: 390 ]] --[[ Name: readu24 ]]
    local v114 = buffer.readu16(v113._buffer, v113._cursor);
    v113._cursor = v113._cursor + 3;
    return bit32.lshift(buffer.readu8(v113._buffer, v113._cursor - 1), 16) + v114;
end;
v0.readi24 = function(v115) --[[ Line: 397 ]] --[[ Name: readi24 ]]
    local v116 = buffer.readu16(v115._buffer, v115._cursor);
    v115._cursor = v115._cursor + 3;
    local v117 = bit32.lshift(buffer.readu8(v115._buffer, v115._cursor - 1), 16) + v116;
    if v117 >= 8388608 then
        return v117 - 16777216;
    else
        return v117;
    end;
end;
v0.readu32 = function(v118) --[[ Line: 405 ]] --[[ Name: readu32 ]]
    local v119 = buffer.readu32(v118._buffer, v118._cursor);
    v118._cursor = v118._cursor + 4;
    return v119;
end;
v0.readi32 = function(v120) --[[ Line: 414 ]] --[[ Name: readi32 ]]
    local v121 = buffer.readi32(v120._buffer, v120._cursor);
    v120._cursor = v120._cursor + 4;
    return v121;
end;
v0.readf32 = function(v122) --[[ Line: 423 ]] --[[ Name: readf32 ]]
    local v123 = buffer.readf32(v122._buffer, v122._cursor);
    v122._cursor = v122._cursor + 4;
    return v123;
end;
v0.readf64 = function(v124) --[[ Line: 432 ]] --[[ Name: readf64 ]]
    local v125 = buffer.readf64(v124._buffer, v124._cursor);
    v124._cursor = v124._cursor + 8;
    return v125;
end;
v0.readRawString = function(v126, v127) --[[ Line: 441 ]] --[[ Name: readRawString ]]
    local v128 = buffer.readstring(v126._buffer, v126._cursor, v127);
    v126._cursor = v126._cursor + v127;
    return v128;
end;
v0.readString = function(v129) --[[ Line: 450 ]] --[[ Name: readString ]]
    local v130 = buffer.readu32(v129._buffer, v129._cursor);
    local v131 = buffer.readstring(v129._buffer, v129._cursor + 4, v130);
    v129._cursor = v129._cursor + (v130 + 4);
    return v131;
end;
v0.readBuffer = function(v132, v133) --[[ Line: 460 ]] --[[ Name: readBuffer ]]
    local v134 = buffer.create(v133);
    buffer.copy(v134, 0, v132._buffer, v132._cursor, v133);
    v132._cursor = v132._cursor + v133;
    return v134;
end;
v0.writeAxes = function(v135, v136) --[[ Line: 474 ]] --[[ Name: writeAxes ]]
    local v137 = buffer.len(v135._buffer);
    if v137 < v135._cursor + 1 then
        local v138 = buffer.create(v137 + 1);
        buffer.copy(v138, 0, v135._buffer);
        v135._buffer = v138;
    end;
    buffer.writeu8(v135._buffer, v135._cursor, (v136.Z and 4 or 0) + (v136.Y and 2 or 0) + (v136.X and 1 or 0));
    v135._cursor = v135._cursor + 1;
end;
v0.writeBrickColor = function(v139, v140) --[[ Line: 487 ]] --[[ Name: writeBrickColor ]]
    local v141 = buffer.len(v139._buffer);
    if v141 < v139._cursor + 2 then
        local v142 = buffer.create(v141 + 2);
        buffer.copy(v142, 0, v139._buffer);
        v139._buffer = v142;
    end;
    buffer.writeu16(v139._buffer, v139._cursor, v140.Number);
    v139._cursor = v139._cursor + 2;
end;
v0.writeCFrame = function(v143, v144) --[[ Line: 498 ]] --[[ Name: writeCFrame ]]
    -- upvalues: v1 (copy)
    local l_Position_0 = v144.Position;
    local l_RightVector_0 = v144.RightVector;
    local l_UpVector_0 = v144.UpVector;
    local v148 = 6;
    local v149 = 6;
    for v150, v151 in v1 do
        local v152 = v151:Dot(l_RightVector_0);
        if math.abs(v152 - 1) <= math.max(math.max(math.abs(v152), 1) * 1.0E-6, 1.0E-6) then
            v148 = v150;
        end;
        v152 = v151:Dot(l_UpVector_0);
        if math.abs(v152 - 1) <= math.max(math.max(math.abs(v152), 1) * 1.0E-6, 1.0E-6) then
            v149 = v150;
        end;
    end;
    if v148 * v149 ~= 36 and v148 ~= v149 then
        local v153 = buffer.len(v143._buffer);
        if v153 < v143._cursor + 13 then
            local v154 = buffer.create(v153 + 13);
            buffer.copy(v154, 0, v143._buffer);
            v143._buffer = v154;
        end;
        v153 = v143._buffer;
        local l__cursor_0 = v143._cursor;
        buffer.writef32(v153, l__cursor_0, l_Position_0.X);
        buffer.writef32(v153, l__cursor_0 + 4, l_Position_0.Y);
        buffer.writef32(v153, l__cursor_0 + 8, l_Position_0.Z);
        buffer.writeu8(v153, l__cursor_0 + 9, bit32.lshift(v148, 3) + v149);
        v143._cursor = v143._cursor + 13;
        return;
    else
        local v156 = buffer.len(v143._buffer);
        if v156 < v143._cursor + 25 then
            local v157 = buffer.create(v156 + 25);
            buffer.copy(v157, 0, v143._buffer);
            v143._buffer = v157;
        end;
        local v158;
        v156, v158 = v144:ToAxisAngle();
        local l__buffer_0 = v143._buffer;
        local l__cursor_1 = v143._cursor;
        buffer.writef32(l__buffer_0, l__cursor_1, l_Position_0.X);
        buffer.writef32(l__buffer_0, l__cursor_1 + 4, l_Position_0.Y);
        buffer.writef32(l__buffer_0, l__cursor_1 + 8, l_Position_0.Z);
        buffer.writeu8(l__buffer_0, l__cursor_1 + 9, 64);
        v156 = v156 * v158;
        buffer.writef32(l__buffer_0, l__cursor_1 + 13, v156.X);
        buffer.writef32(l__buffer_0, l__cursor_1 + 17, v156.Y);
        buffer.writef32(l__buffer_0, l__cursor_1 + 21, v156.Z);
        v143._cursor = v143._cursor + 25;
        return;
    end;
end;
v0.writeColor3 = function(v161, v162) --[[ Line: 545 ]] --[[ Name: writeColor3 ]]
    local v163 = buffer.len(v161._buffer);
    if v163 < v161._cursor + 12 then
        local v164 = buffer.create(v163 + 12);
        buffer.copy(v164, 0, v161._buffer);
        v161._buffer = v164;
    end;
    v163 = v161._buffer;
    local l__cursor_2 = v161._cursor;
    buffer.writef32(v163, l__cursor_2, v162.R);
    buffer.writef32(v163, l__cursor_2 + 4, v162.G);
    buffer.writef32(v163, l__cursor_2 + 8, v162.B);
    v161._cursor = v161._cursor + 12;
end;
v0.writeColor3uint8 = function(v166, v167) --[[ Line: 559 ]] --[[ Name: writeColor3uint8 ]]
    local v168 = buffer.len(v166._buffer);
    if v168 < v166._cursor + 3 then
        local v169 = buffer.create(v168 + 3);
        buffer.copy(v169, 0, v166._buffer);
        v166._buffer = v169;
    end;
    v168 = v166._buffer;
    local l__cursor_3 = v166._cursor;
    buffer.writeu8(v168, l__cursor_3, (math.floor(v167.R * 255)));
    buffer.writeu8(v168, l__cursor_3 + 4, (math.floor(v167.G * 255)));
    buffer.writeu8(v168, l__cursor_3 + 8, (math.floor(v167.B * 255)));
    v166._cursor = v166._cursor + 3;
end;
v0.writeColorSequence = function(v171, v172) --[[ Line: 572 ]] --[[ Name: writeColorSequence ]]
    local l_Keypoints_0 = v172.Keypoints;
    local v174 = #l_Keypoints_0 * 16 + 4;
    local v175 = buffer.len(v171._buffer);
    if v175 < v171._cursor + v174 then
        local v176 = buffer.create(v175 + v174);
        buffer.copy(v176, 0, v171._buffer);
        v171._buffer = v176;
    end;
    v174 = v171._buffer;
    v175 = v171._cursor;
    buffer.writeu32(v174, v175, #l_Keypoints_0);
    for v177, v178 in l_Keypoints_0 do
        buffer.writef32(v174, v175 + 4 + 16 * (v177 - 1), v178.Time);
        buffer.writef32(v174, v175 + 8 + 16 * (v177 - 1), v178.Value.R);
        buffer.writef32(v174, v175 + 12 + 16 * (v177 - 1), v178.Value.G);
        buffer.writef32(v174, v175 + 16 + 16 * (v177 - 1), v178.Value.B);
    end;
    v171._cursor = v171._cursor + (#l_Keypoints_0 * 16 + 4);
end;
v0.writeDateTime = function(v179, v180) --[[ Line: 590 ]] --[[ Name: writeDateTime ]]
    local v181 = buffer.len(v179._buffer);
    if v181 < v179._cursor + 8 then
        local v182 = buffer.create(v181 + 8);
        buffer.copy(v182, 0, v179._buffer);
        v179._buffer = v182;
    end;
    buffer.writef64(v179._buffer, v179._cursor, v180.UnixTimestampMillis);
    v179._cursor = v179._cursor + 8;
end;
v0.writeEnum = function(v183, v184) --[[ Line: 601 ]] --[[ Name: writeEnum ]]
    local v185 = tostring(v184.EnumType);
    local v186 = #v185 + 6;
    local v187 = buffer.len(v183._buffer);
    if v187 < v183._cursor + v186 then
        local v188 = buffer.create(v187 + v186);
        buffer.copy(v188, 0, v183._buffer);
        v183._buffer = v188;
    end;
    v186 = v183._buffer;
    v187 = v183._cursor;
    buffer.writeu32(v186, v187, v184.Value);
    buffer.writeu16(v186, v187 + 4, #v185);
    buffer.writestring(v186, v187 + 6, v185);
end;
v0.writeFaces = function(v189, v190) --[[ Line: 615 ]] --[[ Name: writeFaces ]]
    local v191 = buffer.len(v189._buffer);
    if v191 < v189._cursor + 1 then
        local v192 = buffer.create(v191 + 1);
        buffer.copy(v192, 0, v189._buffer);
        v189._buffer = v192;
    end;
    buffer.writeu8(v189._buffer, v189._cursor, (v190.Top and 32 or 0) + (v190.Left and 16 or 0) + (v190.Front and 8 or 0) + (v190.Bottom and 4 or 0) + (v190.Right and 2 or 0) + (v190.Back and 1 or 0));
    v189._cursor = v189._cursor + 1;
end;
v0.writeFont = function(v193, v194) --[[ Line: 634 ]] --[[ Name: writeFont ]]
    local l_Family_0 = v194.Family;
    local v196 = #l_Family_0 + 6;
    local v197 = buffer.len(v193._buffer);
    if v197 < v193._cursor + v196 then
        local v198 = buffer.create(v197 + v196);
        buffer.copy(v198, 0, v193._buffer);
        v193._buffer = v198;
    end;
    v196 = v193._buffer;
    v197 = v193._cursor;
    buffer.writeu8(v196, v197, v194.Style.Value);
    buffer.writeu16(v196, v197 + 1, v194.Weight.Value);
    buffer.writeu16(v196, v197 + 3, #l_Family_0);
    buffer.writestring(v196, v197 + 5, l_Family_0);
    v193._cursor = v193._cursor + (#l_Family_0 + 6);
end;
v0.writeNumberRange = function(v199, v200) --[[ Line: 649 ]] --[[ Name: writeNumberRange ]]
    local v201 = buffer.len(v199._buffer);
    if v201 < v199._cursor + 8 then
        local v202 = buffer.create(v201 + 8);
        buffer.copy(v202, 0, v199._buffer);
        v199._buffer = v202;
    end;
    v201 = v199._buffer;
    local l__cursor_4 = v199._cursor;
    buffer.writef32(v201, l__cursor_4, v200.Min);
    buffer.writef32(v201, l__cursor_4 + 4, v200.Max);
    v199._cursor = v199._cursor + 8;
end;
v0.writeNumberSequence = function(v204, v205) --[[ Line: 660 ]] --[[ Name: writeNumberSequence ]]
    local l_Keypoints_1 = v205.Keypoints;
    local v207 = #l_Keypoints_1 * 12 + 4;
    local v208 = buffer.len(v204._buffer);
    if v208 < v204._cursor + v207 then
        local v209 = buffer.create(v208 + v207);
        buffer.copy(v209, 0, v204._buffer);
        v204._buffer = v209;
    end;
    v207 = v204._buffer;
    v208 = v204._cursor;
    buffer.writeu32(v207, v208, #l_Keypoints_1);
    for v210, v211 in l_Keypoints_1 do
        buffer.writef32(v207, v208 + 4 + 12 * (v210 - 1), v211.Time);
        buffer.writef32(v207, v208 + 8 + 12 * (v210 - 1), v211.Value);
        buffer.writef32(v207, v208 + 12 + 12 * (v210 - 1), v211.Envelope);
    end;
    v204._cursor = v204._cursor + (#l_Keypoints_1 * 12 + 4);
end;
v0.writePhysicalProperties = function(v212, v213) --[[ Line: 676 ]] --[[ Name: writePhysicalProperties ]]
    local v214 = buffer.len(v212._buffer);
    if v214 < v212._cursor + 20 then
        local v215 = buffer.create(v214 + 20);
        buffer.copy(v215, 0, v212._buffer);
        v212._buffer = v215;
    end;
    v214 = v212._buffer;
    local l__cursor_5 = v212._cursor;
    buffer.writef32(v214, l__cursor_5, v213.Density);
    buffer.writef32(v214, l__cursor_5 + 4, v213.Friction);
    buffer.writef32(v214, l__cursor_5 + 8, v213.Elasticity);
    buffer.writef32(v214, l__cursor_5 + 12, v213.FrictionWeight);
    buffer.writef32(v214, l__cursor_5 + 16, v213.ElasticityWeight);
    v212._cursor = v212._cursor + 20;
end;
v0.writeRay = function(v217, v218) --[[ Line: 690 ]] --[[ Name: writeRay ]]
    local v219 = buffer.len(v217._buffer);
    if v219 < v217._cursor + 24 then
        local v220 = buffer.create(v219 + 24);
        buffer.copy(v220, 0, v217._buffer);
        v217._buffer = v220;
    end;
    v219 = v217._buffer;
    local l__cursor_6 = v217._cursor;
    buffer.writef32(v219, l__cursor_6, v218.Origin.X);
    buffer.writef32(v219, l__cursor_6 + 4, v218.Origin.Y);
    buffer.writef32(v219, l__cursor_6 + 8, v218.Origin.Z);
    buffer.writef32(v219, l__cursor_6 + 12, v218.Direction.X);
    buffer.writef32(v219, l__cursor_6 + 16, v218.Direction.Y);
    buffer.writef32(v219, l__cursor_6 + 20, v218.Direction.Z);
    v217._cursor = v217._cursor + 24;
end;
v0.writeRect = function(v222, v223) --[[ Line: 705 ]] --[[ Name: writeRect ]]
    local v224 = buffer.len(v222._buffer);
    if v224 < v222._cursor + 16 then
        local v225 = buffer.create(v224 + 16);
        buffer.copy(v225, 0, v222._buffer);
        v222._buffer = v225;
    end;
    v224 = v222._buffer;
    local l__cursor_7 = v222._cursor;
    buffer.writef32(v224, l__cursor_7, v223.Min.X);
    buffer.writef32(v224, l__cursor_7 + 4, v223.Min.Y);
    buffer.writef32(v224, l__cursor_7 + 8, v223.Max.X);
    buffer.writef32(v224, l__cursor_7 + 12, v223.Max.Y);
    v222._cursor = v222._cursor + 16;
end;
v0.writeUDim = function(v227, v228) --[[ Line: 718 ]] --[[ Name: writeUDim ]]
    local v229 = buffer.len(v227._buffer);
    if v229 < v227._cursor + 8 then
        local v230 = buffer.create(v229 + 8);
        buffer.copy(v230, 0, v227._buffer);
        v227._buffer = v230;
    end;
    v229 = v227._buffer;
    local l__cursor_8 = v227._cursor;
    buffer.writef32(v229, l__cursor_8, v228.Scale);
    buffer.writei32(v229, l__cursor_8 + 4, v228.Offset);
    v227._cursor = v227._cursor + 8;
end;
v0.writeUDim2 = function(v232, v233) --[[ Line: 729 ]] --[[ Name: writeUDim2 ]]
    local v234 = buffer.len(v232._buffer);
    if v234 < v232._cursor + 16 then
        local v235 = buffer.create(v234 + 16);
        buffer.copy(v235, 0, v232._buffer);
        v232._buffer = v235;
    end;
    v234 = v232._buffer;
    local l__cursor_9 = v232._cursor;
    buffer.writef32(v234, l__cursor_9, v233.X.Scale);
    buffer.writei32(v234, l__cursor_9 + 4, v233.X.Offset);
    buffer.writef32(v234, l__cursor_9 + 8, v233.Y.Scale);
    buffer.writei32(v234, l__cursor_9 + 12, v233.Y.Offset);
    v232._cursor = v232._cursor + 16;
end;
v0.writeVector2 = function(v237, v238) --[[ Line: 742 ]] --[[ Name: writeVector2 ]]
    local v239 = buffer.len(v237._buffer);
    if v239 < v237._cursor + 8 then
        local v240 = buffer.create(v239 + 8);
        buffer.copy(v240, 0, v237._buffer);
        v237._buffer = v240;
    end;
    v239 = v237._buffer;
    local l__cursor_10 = v237._cursor;
    buffer.writef32(v239, l__cursor_10, v238.X);
    buffer.writef32(v239, l__cursor_10 + 4, v238.Y);
    v237._cursor = v237._cursor + 8;
end;
v0.writeVector2int16 = function(v242, v243) --[[ Line: 753 ]] --[[ Name: writeVector2int16 ]]
    local v244 = buffer.len(v242._buffer);
    if v244 < v242._cursor + 4 then
        local v245 = buffer.create(v244 + 4);
        buffer.copy(v245, 0, v242._buffer);
        v242._buffer = v245;
    end;
    v244 = v242._buffer;
    local l__cursor_11 = v242._cursor;
    buffer.writei16(v244, l__cursor_11, v243.X);
    buffer.writei16(v244, l__cursor_11 + 2, v243.Y);
    v242._cursor = v242._cursor + 4;
end;
v0.writeVector3 = function(v247, v248) --[[ Line: 764 ]] --[[ Name: writeVector3 ]]
    local v249 = buffer.len(v247._buffer);
    if v249 < v247._cursor + 12 then
        local v250 = buffer.create(v249 + 12);
        buffer.copy(v250, 0, v247._buffer);
        v247._buffer = v250;
    end;
    v249 = v247._buffer;
    local l__cursor_12 = v247._cursor;
    buffer.writef32(v249, l__cursor_12, v248.X);
    buffer.writef32(v249, l__cursor_12 + 4, v248.Y);
    buffer.writef32(v249, l__cursor_12 + 8, v248.Z);
    v247._cursor = v247._cursor + 12;
end;
v0.writeVector3int16 = function(v252, v253) --[[ Line: 776 ]] --[[ Name: writeVector3int16 ]]
    local v254 = buffer.len(v252._buffer);
    if v254 < v252._cursor + 6 then
        local v255 = buffer.create(v254 + 6);
        buffer.copy(v255, 0, v252._buffer);
        v252._buffer = v255;
    end;
    v254 = v252._buffer;
    local l__cursor_13 = v252._cursor;
    buffer.writei16(v254, l__cursor_13, v253.X);
    buffer.writei16(v254, l__cursor_13 + 2, v253.Y);
    buffer.writei16(v254, l__cursor_13 + 4, v253.Z);
    v252._cursor = v252._cursor + 6;
end;
v0.readAxes = function(v257) --[[ Line: 790 ]] --[[ Name: readAxes ]]
    local l__buffer_1 = v257._buffer;
    local l__cursor_14 = v257._cursor;
    assert(buffer.len(l__buffer_1) >= l__cursor_14 + 1, "attempt to read Axes out of bounds");
    local v260 = buffer.readu8(l__buffer_1, l__cursor_14);
    v257._cursor = v257._cursor + 1;
    local v261 = table.create(3);
    if bit32.btest(v260, 4) then
        table.insert(v261, Enum.Axis.Z);
    end;
    if bit32.btest(v260, 2) then
        table.insert(v261, Enum.Axis.Y);
    end;
    if bit32.btest(v260, 1) then
        table.insert(v261, Enum.Axis.X);
    end;
    return Axes.new(table.unpack(v261));
end;
v0.readBrickColor = function(v262) --[[ Line: 812 ]] --[[ Name: readBrickColor ]]
    local l__buffer_2 = v262._buffer;
    local l__cursor_15 = v262._cursor;
    assert(buffer.len(l__buffer_2) >= l__cursor_15 + 2, "attempt to read BrickColor out of bounds");
    local v265 = BrickColor.new((buffer.readu16(l__buffer_2, l__cursor_15)));
    v262._cursor = v262._cursor + 2;
    return v265;
end;
v0.readCFrame = function(v266) --[[ Line: 824 ]] --[[ Name: readCFrame ]]
    -- upvalues: v1 (copy)
    local l__buffer_3 = v266._buffer;
    local l__cursor_16 = v266._cursor;
    assert(buffer.len(l__buffer_3) >= l__cursor_16 + 13, "attempt to read CFrame out of bounds");
    local v269 = Vector3.new(buffer.readf32(l__buffer_3, l__cursor_16), buffer.readf32(l__buffer_3, l__cursor_16 + 4), (buffer.readf32(l__buffer_3, l__cursor_16 + 8)));
    local v270 = buffer.readu8(l__buffer_3, l__cursor_16 + 9);
    if v270 == 64 then
        assert(buffer.len(l__buffer_3) >= l__cursor_16 + 25, "attempt to read CFrame out of bounds");
        local v271 = Vector3.new(buffer.readf32(l__buffer_3, l__cursor_16 + 13), buffer.readf32(l__buffer_3, l__cursor_16 + 17), (buffer.readf32(l__buffer_3, l__cursor_16 + 21)));
        v266._cursor = v266._cursor + 25;
        return CFrame.fromAxisAngle(v271, v271.Magnitude) + v269;
    else
        local v272 = v1[bit32.rshift(v270, 3)];
        local v273 = v1[bit32.band(v270, 7)];
        local v274 = v272:Cross(v273);
        v266._cursor = v266._cursor + 13;
        return CFrame.fromMatrix(v269, v272, v273, v274);
    end;
end;
v0.readColor3 = function(v275) --[[ Line: 849 ]] --[[ Name: readColor3 ]]
    local l__buffer_4 = v275._buffer;
    local l__cursor_17 = v275._cursor;
    assert(buffer.len(l__buffer_4) >= l__cursor_17 + 12, "attempt to read Color3 out of bounds");
    local v278 = Color3.fromRGB(buffer.readf32(l__buffer_4, l__cursor_17), buffer.readf32(l__buffer_4, l__cursor_17 + 4), (buffer.readf32(l__buffer_4, l__cursor_17 + 8)));
    v275._cursor = v275._cursor + 12;
    return v278;
end;
v0.readColor3uint8 = function(v279) --[[ Line: 862 ]] --[[ Name: readColor3uint8 ]]
    local l__buffer_5 = v279._buffer;
    local l__cursor_18 = v279._cursor;
    assert(buffer.len(l__buffer_5) >= l__cursor_18 + 3, "attempt to read Color3uint8 out of bounds");
    local v282 = Color3.fromRGB(buffer.readu8(l__buffer_5, l__cursor_18), buffer.readu8(l__buffer_5, l__cursor_18 + 1), (buffer.readu8(l__buffer_5, l__cursor_18 + 2)));
    v279._cursor = v279._cursor + 3;
    return v282;
end;
v0.readColorSequence = function(v283) --[[ Line: 874 ]] --[[ Name: readColorSequence ]]
    local l__buffer_6 = v283._buffer;
    local l__cursor_19 = v283._cursor;
    assert(buffer.len(l__buffer_6) >= l__cursor_19 + 4, "attempt to read ColorSequence out of bounds");
    local v286 = buffer.readu32(l__buffer_6, l__cursor_19);
    l__cursor_19 = l__cursor_19 + 4;
    assert(buffer.len(l__buffer_6) >= l__cursor_19 + v286 * 16, "attempt to read ColorSequence out of bounds");
    local v287 = table.create(v286);
    for v288 = 0, v286 - 1 do
        v287[v288 + 1] = ColorSequenceKeypoint.new(buffer.readf32(l__buffer_6, l__cursor_19 + v288 * 16), Color3.new(buffer.readf32(l__buffer_6, l__cursor_19 + 4 + v288 * 16), buffer.readf32(l__buffer_6, l__cursor_19 + 8 + v288 * 16), (buffer.readf32(l__buffer_6, l__cursor_19 + 12 + v288 * 16))));
    end;
    v283._cursor = v283._cursor + v286 * 16;
    return ColorSequence.new(v287);
end;
v0.readDateTime = function(v289) --[[ Line: 902 ]] --[[ Name: readDateTime ]]
    local l__buffer_7 = v289._buffer;
    local l__cursor_20 = v289._cursor;
    assert(buffer.len(l__buffer_7) >= l__cursor_20 + 8, "attempt to read DateTime out of bounds");
    local v292 = DateTime.fromUnixTimestampMillis((buffer.readf64(l__buffer_7, l__cursor_20)));
    v289._cursor = v289._cursor + 8;
    return v292;
end;
v0.readEnum = function(v293) --[[ Line: 914 ]] --[[ Name: readEnum ]]
    local l__buffer_8 = v293._buffer;
    local l__cursor_21 = v293._cursor;
    assert(buffer.len(l__buffer_8) >= l__cursor_21 + 6, "attempt to read DateTime out of bounds");
    local v296 = buffer.readu32(l__buffer_8, l__cursor_21);
    local v297 = buffer.readu16(l__buffer_8, l__cursor_21 + 4);
    assert(buffer.len(l__buffer_8) >= l__cursor_21 + 6 + v297, "attempt to read DateTime out of bounds");
    local v298 = buffer.readstring(l__buffer_8, l__cursor_21 + 6, v297);
    v293._cursor = v293._cursor + (v297 + 6);
    for _, v300 in Enum[v298]:GetEnumItems() do
        if v300.Value == v296 then
            return v300;
        end;
    end;
    error(string.format("no EnumItem with Value %d found as a member of %s", v296, v298), 2);
end;
v0.readFaces = function(v301) --[[ Line: 935 ]] --[[ Name: readFaces ]]
    local l__buffer_9 = v301._buffer;
    local l__cursor_22 = v301._cursor;
    assert(buffer.len(l__buffer_9) >= l__cursor_22 + 1, "attempt to read Faces out of bounds");
    local v304 = buffer.readu8(l__buffer_9, l__cursor_22);
    v301._cursor = v301._cursor + 1;
    local v305 = table.create(6);
    if bit32.btest(v304, 32) then
        table.insert(v305, Enum.NormalId.Top);
    end;
    if bit32.btest(v304, 16) then
        table.insert(v305, Enum.NormalId.Left);
    end;
    if bit32.btest(v304, 8) then
        table.insert(v305, Enum.NormalId.Front);
    end;
    if bit32.btest(v304, 4) then
        table.insert(v305, Enum.NormalId.Bottom);
    end;
    if bit32.btest(v304, 2) then
        table.insert(v305, Enum.NormalId.Right);
    end;
    if bit32.btest(v304, 1) then
        table.insert(v305, Enum.NormalId.Back);
    end;
    return Faces.new(table.unpack(v305));
end;
v0.readFont = function(v306) --[[ Line: 966 ]] --[[ Name: readFont ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l__buffer_10 = v306._buffer;
    local l__cursor_23 = v306._cursor;
    local v309 = v2[buffer.readu8(l__buffer_10, l__cursor_23)];
    local v310 = v3[buffer.readu16(l__buffer_10, l__cursor_23 + 1)];
    local v311 = buffer.readu16(l__buffer_10, l__cursor_23 + 3);
    local v312 = buffer.readstring(l__buffer_10, l__cursor_23 + 5, v311);
    v306._cursor = v306._cursor + (v311 + 5);
    return Font.new(v312, v310, v309);
end;
v0.readNumberRange = function(v313) --[[ Line: 981 ]] --[[ Name: readNumberRange ]]
    local l__buffer_11 = v313._buffer;
    local l__cursor_24 = v313._cursor;
    assert(buffer.len(l__buffer_11) >= l__cursor_24 + 8, "attempt to read NumberRange out of bounds");
    local v316 = NumberRange.new(buffer.readf32(l__buffer_11, l__cursor_24), (buffer.readf32(l__buffer_11, l__cursor_24 + 4)));
    v313._cursor = v313._cursor + 8;
    return v316;
end;
v0.readNumberSequence = function(v317) --[[ Line: 993 ]] --[[ Name: readNumberSequence ]]
    local l__buffer_12 = v317._buffer;
    local l__cursor_25 = v317._cursor;
    assert(buffer.len(l__buffer_12) >= l__cursor_25 + 4, "attempt to read NumberSequence out of bounds");
    local v320 = buffer.readu32(l__buffer_12, l__cursor_25);
    l__cursor_25 = l__cursor_25 + 4;
    assert(buffer.len(l__buffer_12) >= l__cursor_25 + v320 * 12, "attempt to read NumberSequence out of bounds");
    local v321 = table.create(v320);
    for v322 = 0, v320 - 1 do
        v321[v322 + 1] = NumberSequenceKeypoint.new(buffer.readf32(l__buffer_12, l__cursor_25 + v322 * 16), buffer.readf32(l__buffer_12, l__cursor_25 + 4 + v322 * 16), (buffer.readf32(l__buffer_12, l__cursor_25 + 8 + v322 * 16)));
    end;
    v317._cursor = v317._cursor + v320 * 12;
    return NumberSequence.new(v321);
end;
v0.readPhysicalProperties = function(v323) --[[ Line: 1017 ]] --[[ Name: readPhysicalProperties ]]
    local l__buffer_13 = v323._buffer;
    local l__cursor_26 = v323._cursor;
    assert(buffer.len(l__buffer_13) >= l__cursor_26 + 20, "attempt to read PhysicalProperties out of bounds");
    local v326 = PhysicalProperties.new(buffer.readf32(l__buffer_13, l__cursor_26), buffer.readf32(l__buffer_13, l__cursor_26 + 4), buffer.readf32(l__buffer_13, l__cursor_26 + 8), buffer.readf32(l__buffer_13, l__cursor_26 + 12), (buffer.readf32(l__buffer_13, l__cursor_26 + 16)));
    v323._cursor = v323._cursor + 20;
    return v326;
end;
v0.readRay = function(v327) --[[ Line: 1035 ]] --[[ Name: readRay ]]
    local l__buffer_14 = v327._buffer;
    local l__cursor_27 = v327._cursor;
    assert(buffer.len(l__buffer_14) >= l__cursor_27 + 24, "attempt to read Ray out of bounds");
    local v330 = Ray.new(Vector3.new(buffer.readf32(l__buffer_14, l__cursor_27), buffer.readf32(l__buffer_14, l__cursor_27 + 4), (buffer.readf32(l__buffer_14, l__cursor_27 + 8))), (Vector3.new(buffer.readf32(l__buffer_14, l__cursor_27 + 12), buffer.readf32(l__buffer_14, l__cursor_27 + 16), (buffer.readf32(l__buffer_14, l__cursor_27 + 20)))));
    v327._cursor = v327._cursor + 24;
    return v330;
end;
v0.readRect = function(v331) --[[ Line: 1050 ]] --[[ Name: readRect ]]
    local l__buffer_15 = v331._buffer;
    local l__cursor_28 = v331._cursor;
    assert(buffer.len(l__buffer_15) >= l__cursor_28 + 16, "attempt to read Rect out of bounds");
    local v334 = Rect.new(buffer.readf32(l__buffer_15, l__cursor_28), buffer.readf32(l__buffer_15, l__cursor_28 + 4), buffer.readf32(l__buffer_15, l__cursor_28 + 8), (buffer.readf32(l__buffer_15, l__cursor_28 + 12)));
    v331._cursor = v331._cursor + 12;
    return v334;
end;
v0.readUDim = function(v335) --[[ Line: 1063 ]] --[[ Name: readUDim ]]
    local l__buffer_16 = v335._buffer;
    local l__cursor_29 = v335._cursor;
    assert(buffer.len(l__buffer_16) >= l__cursor_29 + 8, "attempt to read UDim out of bounds");
    local v338 = UDim.new(buffer.readf32(l__buffer_16, l__cursor_29), (buffer.readi32(l__buffer_16, l__cursor_29 + 4)));
    v335._cursor = v335._cursor + 8;
    return v338;
end;
v0.readUDim2 = function(v339) --[[ Line: 1075 ]] --[[ Name: readUDim2 ]]
    local l__buffer_17 = v339._buffer;
    local l__cursor_30 = v339._cursor;
    assert(buffer.len(l__buffer_17) >= l__cursor_30 + 16, "attempt to read UDim2 out of bounds");
    local v342 = UDim2.new(buffer.readf32(l__buffer_17, l__cursor_30), buffer.readi32(l__buffer_17, l__cursor_30 + 4), buffer.readf32(l__buffer_17, l__cursor_30 + 8), (buffer.readi32(l__buffer_17, l__cursor_30 + 12)));
    v339._cursor = v339._cursor + 16;
    return v342;
end;
v0.readVector2 = function(v343) --[[ Line: 1093 ]] --[[ Name: readVector2 ]]
    local l__buffer_18 = v343._buffer;
    local l__cursor_31 = v343._cursor;
    assert(buffer.len(l__buffer_18) >= l__cursor_31 + 8, "attempt to read Vector2 out of bounds");
    local v346 = Vector2.new(buffer.readf32(l__buffer_18, l__cursor_31), (buffer.readf32(l__buffer_18, l__cursor_31 + 4)));
    v343._cursor = v343._cursor + 8;
    return v346;
end;
v0.readVector2int16 = function(v347) --[[ Line: 1105 ]] --[[ Name: readVector2int16 ]]
    local l__buffer_19 = v347._buffer;
    local l__cursor_32 = v347._cursor;
    assert(buffer.len(l__buffer_19) >= l__cursor_32 + 4, "attempt to read Vector2int16 out of bounds");
    local v350 = Vector2int16.new(buffer.readi16(l__buffer_19, l__cursor_32), (buffer.readi16(l__buffer_19, l__cursor_32 + 2)));
    v347._cursor = v347._cursor + 4;
    return v350;
end;
v0.readVector3 = function(v351) --[[ Line: 1117 ]] --[[ Name: readVector3 ]]
    local l__buffer_20 = v351._buffer;
    local l__cursor_33 = v351._cursor;
    assert(buffer.len(l__buffer_20) >= l__cursor_33 + 12, "attempt to read Vector3 out of bounds");
    local v354 = Vector3.new(buffer.readf32(l__buffer_20, l__cursor_33), buffer.readf32(l__buffer_20, l__cursor_33 + 4), (buffer.readf32(l__buffer_20, l__cursor_33 + 8)));
    v351._cursor = v351._cursor + 8;
    return v354;
end;
v0.readVector3int16 = function(v355) --[[ Line: 1129 ]] --[[ Name: readVector3int16 ]]
    local l__buffer_21 = v355._buffer;
    local l__cursor_34 = v355._cursor;
    assert(buffer.len(l__buffer_21) >= l__cursor_34 + 6, "attempt to read Vector3int16 out of bounds");
    local v358 = Vector3int16.new(buffer.readi16(l__buffer_21, l__cursor_34), buffer.readi16(l__buffer_21, l__cursor_34 + 2), (buffer.readi16(l__buffer_21, l__cursor_34 + 4)));
    v355._cursor = v355._cursor + 6;
    return v358;
end;
return v0;