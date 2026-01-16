local v0 = {};
local v1 = {};
for v2 = 1, 64 do
    v0[v2 - 1] = string.byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v2, v2);
    v1[string.byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v2, v2)] = v2 - 1;
end;
local v3 = {
    ["0"] = "0000", 
    ["1"] = "0001", 
    ["2"] = "0010", 
    ["3"] = "0011", 
    ["4"] = "0100", 
    ["5"] = "0101", 
    ["6"] = "0110", 
    ["7"] = "0111", 
    ["8"] = "1000", 
    ["9"] = "1001", 
    a = "1010", 
    b = "1011", 
    c = "1100", 
    d = "1101", 
    e = "1110", 
    f = "1111"
};
local v4 = {
    [0] = Vector3.new(1, 0, 0, 0), 
    [1] = Vector3.new(0, 1, 0, 0), 
    [2] = Vector3.new(0, 0, 1, 0), 
    [3] = Vector3.new(-1, 0, 0, 0), 
    [4] = Vector3.new(0, -1, 0, 0), 
    [5] = Vector3.new(0, 0, -1, 0)
};
local v5 = {
    [true] = 1, 
    [false] = 0
};
local v6 = {};
for v7 = 0, 255 do
    local l_v7_0 = v7;
    for _ = 1, 8 do
        local v10 = -bit32.band(l_v7_0, 1);
        l_v7_0 = bit32.bxor(bit32.rshift(l_v7_0, 1), (bit32.band(3988292384, v10)));
    end;
    v6[v7] = l_v7_0;
end;
local v11 = {};
for v12 = 0, 64 do
    v11[v12] = 2 ^ v12;
end;
local v13 = {};
for v14 = 0, 255 do
    v13[v14] = string.format("%02x", v14);
end;
return function(v15) --[[ Line: 56 ]] --[[ Name: bitBuffer ]]
    -- upvalues: v13 (copy), v3 (copy), v0 (copy), v6 (copy), v11 (copy), v5 (copy), v1 (copy), v4 (copy)
    if v15 ~= nil then
        assert(type(v15) == "string", "argument to BitBuffer constructor must be either nil or a string");
    end;
    local v16 = 0;
    local v17 = {};
    local v18 = 0;
    local v19 = 0;
    local v20 = 0;
    local v21 = 0;
    local v22 = 1;
    if v15 then
        v19 = #v15;
        v20 = v19 * 8;
        v17 = table.create(#v15);
        for v23 = 1, v19 do
            v17[v23] = string.byte(v15, v23, v23);
        end;
    end;
    local function v27() --[[ Line: 87 ]] --[[ Name: dumpBinary ]]
        -- upvalues: v19 (ref), v17 (ref), v13 (ref), v3 (ref), v16 (ref)
        local v24 = table.create(v19);
        for v25, v26 in ipairs(v17) do
            v24[v25] = string.gsub(v13[v26], "%x", v3);
        end;
        if v16 ~= 0 then
            v24[v19] = string.sub(v24[v19], 1, v16);
        end;
        return table.concat(v24, " ");
    end;
    local function v31() --[[ Line: 103 ]] --[[ Name: dumpString ]]
        -- upvalues: v19 (ref), v17 (ref)
        local v28 = table.create((math.ceil(v19 / 4096)));
        local v29 = 1;
        for v30 = 1, v19, 4096 do
            v28[v29] = string.char(table.unpack(v17, v30, (math.min(v19, v30 + 4095))));
            v29 = v29 + 1;
        end;
        return table.concat(v28, "");
    end;
    local function v35() --[[ Line: 119 ]] --[[ Name: dumpHex ]]
        -- upvalues: v19 (ref), v17 (ref), v13 (ref)
        local v32 = table.create(v19);
        for v33, v34 in ipairs(v17) do
            v32[v33] = v13[v34];
        end;
        return table.concat(v32, "");
    end;
    local function v46() --[[ Line: 129 ]] --[[ Name: dumpBase64 ]]
        -- upvalues: v19 (ref), v17 (ref), v0 (ref)
        local v36 = table.create((math.ceil(v19 * 1.333)));
        local v37 = 1;
        for v38 = 1, v19, 3 do
            local v39 = v17[v38];
            local v40 = v17[v38 + 1];
            local v41 = v17[v38 + 2];
            local v42 = bit32.bor(bit32.lshift(v39, 16), bit32.lshift(v40 or 0, 8), v41 or 0);
            v36[v37] = v0[bit32.rshift(bit32.band(v42, 16515072), 18)];
            v36[v37 + 1] = v0[bit32.rshift(bit32.band(v42, 258048), 12)];
            v36[v37 + 2] = v40 and v0[bit32.rshift(bit32.band(v42, 4032), 6)] or 61;
            v36[v37 + 3] = v41 and v0[bit32.band(v42, 63)] or 61;
            v37 = v37 + 4;
        end;
        v37 = v37 - 1;
        local v43 = table.create((math.ceil(v37 / 4096)));
        local v44 = 1;
        for v45 = 1, v37, 4096 do
            v43[v44] = string.char(table.unpack(v36, v45, (math.min(v37, v45 + 4095))));
            v44 = v44 + 1;
        end;
        return table.concat(v43, "");
    end;
    local function v51(v47) --[[ Line: 163 ]] --[[ Name: exportChunk ]]
        -- upvalues: v19 (ref), v17 (ref)
        assert(type(v47) == "number", "argument #1 to BitBuffer.exportChunk should be a number");
        assert(v47 > 0, "argument #1 to BitBuffer.exportChunk should be above zero");
        assert(v47 % 1 == 0, "argument #1 to BitBuffer.exportChunk should be an integer");
        return coroutine.wrap(function() --[[ Line: 171 ]]
            -- upvalues: v47 (copy), v19 (ref), v17 (ref)
            local v48 = v47 - 1;
            for v49 = 1, v19, v47 do
                local v50 = string.char(table.unpack(v17, v49, (math.min(v19, v49 + v48))));
                coroutine.yield(v49, v50);
            end;
        end);
    end;
    local function v63(v52) --[[ Line: 181 ]] --[[ Name: exportBase64Chunk ]]
        -- upvalues: v19 (ref), v17 (ref), v0 (ref)
        v52 = v52 or 76;
        assert(type(v52) == "number", "argument #1 to BitBuffer.exportBase64Chunk should be a number");
        assert(v52 > 0, "argument #1 to BitBuffer.exportBase64Chunk should be above zero");
        assert(v52 % 1 == 0, "argument #1 to BitBuffer.exportBase64Chunk should be an integer");
        local v53 = table.create((math.ceil(v19 * 0.333)));
        local v54 = 1;
        for v55 = 1, v19, 3 do
            local v56 = v17[v55];
            local v57 = v17[v55 + 1];
            local v58 = v17[v55 + 2];
            local v59 = bit32.bor(bit32.lshift(v56, 16), bit32.lshift(v57 or 0, 8), v58 or 0);
            v53[v54] = v0[bit32.rshift(bit32.band(v59, 16515072), 18)];
            v53[v54 + 1] = v0[bit32.rshift(bit32.band(v59, 258048), 12)];
            v53[v54 + 2] = v57 and v0[bit32.rshift(bit32.band(v59, 4032), 6)] or 61;
            v53[v54 + 3] = v58 and v0[bit32.band(v59, 63)] or 61;
            v54 = v54 + 4;
        end;
        v54 = v54 - 1;
        return coroutine.wrap(function() --[[ Line: 203 ]]
            -- upvalues: v52 (ref), v54 (ref), v53 (copy)
            local v60 = v52 - 1;
            for v61 = 1, v54, v52 do
                local v62 = string.char(table.unpack(v53, v61, (math.min(v54, v61 + v60))));
                coroutine.yield(v62);
            end;
        end);
    end;
    local function v75(v64) --[[ Line: 212 ]] --[[ Name: exportHexChunk ]]
        -- upvalues: v19 (ref), v13 (ref), v17 (ref)
        assert(type(v64) == "number", "argument #1 to BitBuffer.exportHexChunk should be a number");
        assert(v64 > 0, "argument #1 to BitBuffer.exportHexChunk should be above zero");
        assert(v64 % 1 == 0, "argument #1 to BitBuffer.exportHexChunk should be an integer");
        local v65 = math.floor(v64 / 2);
        if v64 % 2 == 0 then
            return coroutine.wrap(function() --[[ Line: 220 ]]
                -- upvalues: v19 (ref), v65 (copy), v13 (ref), v17 (ref)
                local v66 = {};
                for v67 = 1, v19, v65 do
                    for v68 = 0, v65 - 1 do
                        v66[v68] = v13[v17[v67 + v68]];
                    end;
                    coroutine.yield(table.concat(v66, "", 0));
                end;
            end);
        else
            return coroutine.wrap(function() --[[ Line: 230 ]]
                -- upvalues: v19 (ref), v65 (copy), v13 (ref), v17 (ref)
                local v69 = {
                    [0] = ""
                };
                local v70 = "";
                local v71 = 1;
                while v71 <= v19 do
                    if v70 == "" then
                        v69[0] = "";
                        for v72 = 0, v65 - 1 do
                            v69[v72 + 1] = v13[v17[v71 + v72]];
                        end;
                        local v73 = v13[v17[v71 + v65]];
                        if v73 then
                            v69[v65 + 1] = string.sub(v73, 1, 1);
                            v70 = string.sub(v73, 2, 2);
                        end;
                        v71 = v71 + 1;
                    else
                        v69[0] = v70;
                        for v74 = 0, v65 - 1 do
                            v69[v74 + 1] = v13[v17[v71 + v74]];
                        end;
                        v69[v65 + 1] = "";
                        v70 = "";
                    end;
                    coroutine.yield(table.concat(v69, "", 0));
                    v71 = v71 + v65;
                end;
            end);
        end;
    end;
    local function v80() --[[ Line: 263 ]] --[[ Name: crc32 ]]
        -- upvalues: v17 (ref), v6 (ref)
        local v76 = 4294967295;
        for _, v78 in ipairs(v17) do
            local v79 = v6[bit32.band(bit32.bxor(v76, v78), 255)];
            v76 = bit32.bxor(bit32.rshift(v76, 8), v79);
        end;
        return bit32.bnot(v76) % 4294967295;
    end;
    local function v81() --[[ Line: 274 ]] --[[ Name: getLength ]]
        -- upvalues: v20 (ref)
        return v20;
    end;
    local function v82() --[[ Line: 278 ]] --[[ Name: getByteLength ]]
        -- upvalues: v19 (ref)
        return v19;
    end;
    local function v83() --[[ Line: 282 ]] --[[ Name: getPointer ]]
        -- upvalues: v21 (ref)
        return v21;
    end;
    local function v85(v84) --[[ Line: 287 ]] --[[ Name: setPointer ]]
        -- upvalues: v20 (ref), v21 (ref), v22 (ref)
        assert(type(v84) == "number", "argument #1 to BitBuffer.setPointer should be a number");
        assert(v84 >= 0, "argument #1 to BitBuffer.setPointer should be zero or higher");
        assert(v84 % 1 == 0, "argument #1 to BitBuffer.setPointer should be an integer");
        assert(v84 <= v20, "argument #1 to BitBuffer.setPointerByte should within range of the buffer");
        v21 = v84;
        v22 = math.floor(v84 / 8) + 1;
    end;
    local function v87(v86) --[[ Line: 297 ]] --[[ Name: setPointerFromEnd ]]
        -- upvalues: v20 (ref), v21 (ref), v22 (ref)
        assert(type(v86) == "number", "argument #1 to BitBuffer.setPointerFromEnd should be a number");
        assert(v86 >= 0, "argument #1 to BitBuffer.setPointerFromEnd should be zero or higher");
        assert(v86 % 1 == 0, "argument #1 to BitBuffer.setPointerFromEnd should be an integer");
        assert(v86 <= v20, "argument #1 to BitBuffer.setPointerFromEnd should within range of the buffer");
        v21 = v20 - v86;
        v22 = math.floor(v21 / 8 + 1);
    end;
    local function v88() --[[ Line: 307 ]] --[[ Name: getPointerByte ]]
        -- upvalues: v22 (ref)
        return v22;
    end;
    local function v90(v89) --[[ Line: 311 ]] --[[ Name: setPointerByte ]]
        -- upvalues: v19 (ref), v21 (ref), v22 (ref)
        assert(type(v89) == "number", "argument #1 to BitBuffer.setPointerByte should be a number");
        assert(v89 > 0, "argument #1 to BitBuffer.setPointerByte should be positive");
        assert(v89 % 1 == 0, "argument #1 to BitBuffer.setPointerByte should be an integer");
        assert(v89 <= v19, "argument #1 to BitBuffer.setPointerByte should be within range of the buffer");
        v21 = v89 * 8;
        v22 = v89;
    end;
    local function v92(v91) --[[ Line: 321 ]] --[[ Name: setPointerByteFromEnd ]]
        -- upvalues: v19 (ref), v22 (ref), v21 (ref)
        assert(type(v91) == "number", "argument #1 to BitBuffer.setPointerByteFromEnd should be a number");
        assert(v91 >= 0, "argument #1 to BitBuffer.setPointerByteFromEnd should be zero or higher");
        assert(v91 % 1 == 0, "argument #1 to BitBuffer.setPointerByteFromEnd should be an integer");
        assert(v91 <= v19, "argument #1 to BitBuffer.setPointerByteFromEnd should be within range of the buffer");
        v22 = v19 - v91;
        v21 = v22 * 8;
    end;
    local function v93() --[[ Line: 331 ]] --[[ Name: isFinished ]]
        -- upvalues: v21 (ref), v20 (ref)
        return v21 == v20;
    end;
    local function v99(...) --[[ Line: 335 ]] --[[ Name: writeBits ]]
        -- upvalues: v20 (ref), v16 (ref), v19 (ref), v18 (ref), v11 (ref), v17 (ref)
        local v94 = select("#", ...);
        if v94 == 0 then
            return;
        else
            v20 = v20 + v94;
            local v95 = table.pack(...);
            for _, v97 in ipairs(v95) do
                local v98 = true;
                if v97 ~= 1 then
                    v98 = v97 == 0;
                end;
                assert(v98, "arguments to BitBuffer.writeBits should be either 1 or 0");
                if v16 == 0 then
                    v19 = v19 + 1;
                end;
                v18 = v18 + (v97 == 1 and v11[7 - v16] or 0);
                v16 = v16 + 1;
                if v16 == 8 then
                    v16 = 0;
                    v17[v19] = v18;
                    v18 = 0;
                end;
            end;
            if v16 ~= 0 then
                v17[v19] = v18;
            end;
            return;
        end;
    end;
    local function v103(v100) --[[ Line: 365 ]] --[[ Name: writeByte ]]
        -- upvalues: v16 (ref), v19 (ref), v17 (ref), v18 (ref), v20 (ref)
        assert(type(v100) == "number", "argument #1 to BitBuffer.writeByte should be a number");
        local v101 = false;
        if v100 >= 0 then
            v101 = v100 <= 255;
        end;
        assert(v101, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
        assert(v100 % 1 == 0, "argument #1 to BitBuffer.writeByte should be an integer");
        if v16 == 0 then
            v19 = v19 + 1;
            v17[v19] = v100;
        else
            local v102 = bit32.rshift(v100, v16);
            v17[v19] = v18 + v102;
            v19 = v19 + 1;
            v18 = bit32.band(bit32.lshift(v100, 8 - v16), 255);
            v17[v19] = v18;
        end;
        v20 = v20 + 8;
    end;
    local function v117(v104, v105) --[[ Line: 385 ]] --[[ Name: writeUnsigned ]]
        -- upvalues: v11 (ref), v103 (copy), v5 (ref), v99 (copy)
        assert(type(v104) == "number", "argument #1 to BitBuffer.writeUnsigned should be a number");
        local v106 = false;
        if v104 >= 1 then
            v106 = v104 <= 64;
        end;
        assert(v106, "argument #1 to BitBuffer.writeUnsigned should be in the range [1, 64]");
        assert(v104 % 1 == 0, "argument #1 to BitBuffer.writeUnsigned should be an integer");
        assert(type(v105) == "number", "argument #2 to BitBuffer.writeUnsigned should be a number");
        v106 = false;
        if v105 >= 0 then
            v106 = v105 <= v11[v104] - 1;
        end;
        assert(v106, "argument #2 to BitBuffer.writeUnsigned is out of range");
        assert(v105 % 1 == 0, "argument #2 to BitBuffer.writeUnsigned should be an integer");
        local v107 = math.floor(v104 / 8);
        v106 = v104 % 8;
        local v108 = table.create(v106);
        if v104 <= 32 then
            local l_v104_0 = v104;
            for _ = 1, v107 do
                l_v104_0 = l_v104_0 - 8;
                v103((bit32.extract(v105, l_v104_0, 8)));
            end;
            for v111 = v106 - 1, 0, -1 do
                v108[v106 - v111] = v5[bit32.btest(v105, v11[v111])];
            end;
            v99(table.unpack(v108));
            return;
        else
            local v112 = v105 % 4294967296;
            local v113 = math.floor(v105 / 4294967296);
            local v114 = v104 - 32;
            for _ = 1, v107 - 4 do
                v114 = v114 - 8;
                v103((bit32.extract(v113, v114, 8)));
            end;
            for v116 = v106 - 1, 0, -1 do
                v108[v106 - v116] = v5[bit32.btest(v113, v11[v116])];
            end;
            v99(table.unpack(v108));
            v103((bit32.extract(v112, 24, 8)));
            v103((bit32.extract(v112, 16, 8)));
            v103((bit32.extract(v112, 8, 8)));
            v103((bit32.extract(v112, 0, 8)));
            return;
        end;
    end;
    local function v121(v118, v119) --[[ Line: 438 ]] --[[ Name: writeSigned ]]
        -- upvalues: v11 (ref), v99 (copy), v117 (copy)
        assert(type(v118) == "number", "argument #1 to BitBuffer.writeSigned should be a number");
        local v120 = false;
        if v118 >= 2 then
            v120 = v118 <= 64;
        end;
        assert(v120, "argument #1 to BitBuffer.writeSigned should be in the range [2, 64]");
        assert(v118 % 1 == 0, "argument #1 to BitBuffer.writeSigned should be an integer");
        assert(type(v119) == "number", "argument #2 to BitBuffer.writeSigned should be a number");
        v120 = false;
        if -v11[v118 - 1] <= v119 then
            v120 = v119 <= v11[v118 - 1] - 1;
        end;
        assert(v120, "argument #2 to BitBuffer.writeSigned is out of range");
        assert(v119 % 1 == 0, "argument #2 to BitBuffer.writeSigned should be an integer");
        if v119 >= 0 then
            v99(0);
            v117(v118 - 1, v119);
            return;
        else
            v99(1);
            v117(v118 - 1, v11[v118 - 1] + v119);
            return;
        end;
    end;
    local function v129(v122, v123, v124) --[[ Line: 463 ]] --[[ Name: writeFloat ]]
        -- upvalues: v11 (ref), v99 (copy), v5 (ref), v117 (copy)
        assert(type(v122) == "number", "argument #1 to BitBuffer.writeFloat should be a number");
        local v125 = false;
        if v122 >= 1 then
            v125 = v122 <= 64;
        end;
        assert(v125, "argument #1 to BitBuffer.writeFloat should be in the range [1, 64]");
        assert(v122 % 1 == 0, "argument #1 to BitBuffer.writeFloat should be an integer");
        assert(type(v123) == "number", "argument #2 to BitBuffer.writeFloat should be a number");
        v125 = false;
        if v123 >= 1 then
            v125 = v123 <= 64;
        end;
        assert(v125, "argument #2 to BitBuffer.writeFloat should be in the range [1, 64]");
        assert(v123 % 1 == 0, "argument #2 to BitBuffer.writeFloat should be an integer");
        assert(type(v124) == "number", "argument #3 to BitBuffer.writeFloat should be a number");
        local v126 = v11[v122 - 1] - 1;
        v125 = v124 < 0;
        v124 = math.abs(v124);
        local v127, v128 = math.frexp(v124);
        if v124 == 1e999 then
            v99(v5[v125]);
            v117(v122, v11[v122] - 1);
            v117(v123, 0);
            return;
        elseif v124 ~= v124 then
            v99(v5[v125]);
            v117(v122, v11[v122] - 1);
            v117(v123, 10);
            return;
        elseif v124 == 0 then
            v117(v122 + v123 + 1, 0);
            return;
        elseif v128 + v126 <= 1 then
            v127 = math.floor(v127 * v11[v123] + 0.5);
            v99(v5[v125]);
            v117(v122, 0);
            v117(v123, v127);
            return;
        else
            v127 = math.floor((v127 - 0.5) * 2 * v11[v123] + 0.5);
            v99(v5[v125]);
            v117(v122, v128 + v126 - 1);
            v117(v123, v127);
            return;
        end;
    end;
    local function v137(v130) --[[ Line: 567 ]] --[[ Name: writeBase64 ]]
        -- upvalues: v1 (ref), v103 (copy)
        assert(type(v130) == "string", "argument #1 to BitBuffer.writeBase64 should be a string");
        assert(not string.find(v130, "[^%w%+/=]"), "argument #1 to BitBuffer.writeBase64 should only contain valid base64 characters");
        for v131 = 1, #v130, 4 do
            local v132, v133, v134, v135 = string.byte(v130, v131, v131 + 3);
            v132 = v1[v132];
            v133 = v1[v133];
            v134 = v1[v134];
            v135 = v1[v135];
            local v136 = bit32.bor(bit32.lshift(v132, 18), bit32.lshift(v133, 12), bit32.lshift(v134 or 0, 6), v135 or 0);
            v103((bit32.rshift(v136, 16)));
            if v134 then
                v103((bit32.band(bit32.rshift(v136, 8), 255)));
                if v135 then
                    v103((bit32.band(v136, 255)));
                else
                    break;
                end;
            else
                break;
            end;
        end;
    end;
    local function v143(v138) --[[ Line: 596 ]] --[[ Name: writeString ]]
        -- upvalues: v11 (ref), v103 (copy), v99 (copy)
        assert(type(v138) == "string", "argument #1 to BitBuffer.writeString  should be a string");
        local v139 = #v138;
        assert(true, "argument #1 to BitBuffer.writeUnsigned should be a number");
        assert(true, "argument #1 to BitBuffer.writeUnsigned should be in the range [1, 64]");
        assert(true, "argument #1 to BitBuffer.writeUnsigned should be an integer");
        assert(type(v139) == "number", "argument #2 to BitBuffer.writeUnsigned should be a number");
        local v140 = false;
        if v139 >= 0 then
            v140 = v139 <= v11[24] - 1;
        end;
        assert(v140, "argument #2 to BitBuffer.writeUnsigned is out of range");
        assert(v139 % 1 == 0, "argument #2 to BitBuffer.writeUnsigned should be an integer");
        local v141 = table.create(0);
        v140 = 24 - 8;
        v103((bit32.extract(v139, v140, 8)));
        v140 = v140 - 8;
        v103((bit32.extract(v139, v140, 8)));
        v140 = v140 - 8;
        v103((bit32.extract(v139, v140, 8)));
        v99(table.unpack(v141));
        for v142 = 1, #v138 do
            v103(string.byte(v138, v142, v142));
        end;
    end;
    local function v147(v144) --[[ Line: 612 ]] --[[ Name: writeTerminatedString ]]
        -- upvalues: v103 (copy), v16 (ref), v19 (ref), v17 (ref), v18 (ref), v20 (ref)
        assert(type(v144) == "string", "argument #1 to BitBuffer.writeTerminatedString should be a string");
        for v145 = 1, #v144 do
            v103(string.byte(v144, v145, v145));
        end;
        assert(true, "argument #1 to BitBuffer.writeByte should be a number");
        assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
        assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
        if v16 == 0 then
            v19 = v19 + 1;
            v17[v19] = 0;
        else
            local v146 = bit32.rshift(0, v16);
            v17[v19] = v18 + v146;
            v19 = v19 + 1;
            v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
            v17[v19] = v18;
        end;
        v20 = v20 + 8;
    end;
    local function v150(v148) --[[ Line: 624 ]] --[[ Name: writeSetLengthString ]]
        -- upvalues: v103 (copy)
        assert(type(v148) == "string", "argument #1 to BitBuffer.writeSetLengthString should be a string");
        for v149 = 1, #v148 do
            v103(string.byte(v148, v149, v149));
        end;
    end;
    local function v154(...) --[[ Line: 635 ]] --[[ Name: writeField ]]
        -- upvalues: v117 (copy)
        local v151 = 0;
        local v152 = table.pack(...);
        for v153 = 1, v152.n do
            v151 = v151 * 2;
            if v152[v153] then
                v151 = v151 + 1;
            end;
        end;
        v117(v152.n, v151);
    end;
    local function v157(v155) --[[ Line: 656 ]] --[[ Name: writeUInt8 ]]
        -- upvalues: v103 (copy)
        assert(type(v155) == "number", "argument #1 to BitBuffer.writeUInt8 should be a number");
        local v156 = false;
        if v155 >= 0 then
            v156 = v155 <= 255;
        end;
        assert(v156, "argument #1 to BitBuffer.writeUInt8 should be in the range [0, 255]");
        assert(v155 % 1 == 0, "argument #1 to BitBuffer.writeUInt8 should be an integer");
        v103(v155);
    end;
    local function v160(v158) --[[ Line: 664 ]] --[[ Name: writeUInt16 ]]
        -- upvalues: v103 (copy)
        assert(type(v158) == "number", "argument #1 to BitBuffer.writeUInt16 should be a number");
        local v159 = false;
        if v158 >= 0 then
            v159 = v158 <= 65535;
        end;
        assert(v159, "argument #1 to BitBuffer.writeInt16 should be in the range [0, 65535]");
        assert(v158 % 1 == 0, "argument #1 to BitBuffer.writeUInt16 should be an integer");
        v103((bit32.rshift(v158, 8)));
        v103((bit32.band(v158, 255)));
    end;
    local function v163(v161) --[[ Line: 673 ]] --[[ Name: writeUInt32 ]]
        -- upvalues: v103 (copy)
        assert(type(v161) == "number", "argument #1 to BitBuffer.writeUInt32 should be a number");
        local v162 = false;
        if v161 >= 0 then
            v162 = v161 <= 4294967295;
        end;
        assert(v162, "argument #1 to BitBuffer.writeUInt32 should be in the range [0, 4294967295]");
        assert(v161 % 1 == 0, "argument #1 to BitBuffer.writeUInt32 should be an integer");
        v103((bit32.rshift(v161, 24)));
        v103((bit32.band(bit32.rshift(v161, 16), 255)));
        v103((bit32.band(bit32.rshift(v161, 8), 255)));
        v103((bit32.band(v161, 255)));
    end;
    local function v166(v164) --[[ Line: 687 ]] --[[ Name: writeInt8 ]]
        -- upvalues: v103 (copy)
        assert(type(v164) == "number", "argument #1 to BitBuffer.writeInt8 should be a number");
        local v165 = false;
        if v164 >= -128 then
            v165 = v164 <= 127;
        end;
        assert(v165, "argument #1 to BitBuffer.writeInt8 should be in the range [-128, 127]");
        assert(v164 % 1 == 0, "argument #1 to BitBuffer.writeInt8 should be an integer");
        if v164 < 0 then
            v164 = 128 + v164 + 128;
        end;
        v103(v164);
    end;
    local function v169(v167) --[[ Line: 699 ]] --[[ Name: writeInt16 ]]
        -- upvalues: v103 (copy)
        assert(type(v167) == "number", "argument #1 to BitBuffer.writeInt16 should be a number");
        local v168 = false;
        if v167 >= -32768 then
            v168 = v167 <= 32767;
        end;
        assert(v168, "argument #1 to BitBuffer.writeInt16 should be in the range [-32768, 32767]");
        assert(v167 % 1 == 0, "argument #1 to BitBuffer.writeInt16 should be an integer");
        if v167 < 0 then
            v167 = 32768 + v167 + 32768;
        end;
        v103((bit32.rshift(v167, 8)));
        v103((bit32.band(v167, 255)));
    end;
    local function v172(v170) --[[ Line: 712 ]] --[[ Name: writeInt32 ]]
        -- upvalues: v103 (copy)
        assert(type(v170) == "number", "argument #1 to BitBuffer.writeInt32 should be a number");
        local v171 = false;
        if v170 >= -2147483648 then
            v171 = v170 <= 2147483647;
        end;
        assert(v171, "argument #1 to BitBuffer.writeInt32 should be in the range [-2147483648, 2147483647]");
        assert(v170 % 1 == 0, "argument #1 to BitBuffer.writeInt32 should be an integer");
        if v170 < 0 then
            v170 = 2147483648 + v170 + 2147483648;
        end;
        v103((bit32.rshift(v170, 24)));
        v103((bit32.band(bit32.rshift(v170, 16), 255)));
        v103((bit32.band(bit32.rshift(v170, 8), 255)));
        v103((bit32.band(v170, 255)));
    end;
    local function v184(v173) --[[ Line: 730 ]] --[[ Name: writeFloat16 ]]
        -- upvalues: v16 (ref), v19 (ref), v17 (ref), v18 (ref), v20 (ref), v103 (copy)
        assert(type(v173) == "number", "argument #1 to BitBuffer.writeFloat16 should be a number");
        local v174 = v173 < 0;
        v173 = math.abs(v173);
        local v175, v176 = math.frexp(v173);
        if v173 == 1e999 then
            if v174 then
                assert(true, "argument #1 to BitBuffer.writeByte should be a number");
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
                if v16 == 0 then
                    v19 = v19 + 1;
                    v17[v19] = 252;
                else
                    local v177 = bit32.rshift(252, v16);
                    v17[v19] = v18 + v177;
                    v19 = v19 + 1;
                    v18 = bit32.band(bit32.lshift(252, 8 - v16), 255);
                    v17[v19] = v18;
                end;
                v20 = v20 + 8;
            else
                assert(true, "argument #1 to BitBuffer.writeByte should be a number");
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
                if v16 == 0 then
                    v19 = v19 + 1;
                    v17[v19] = 124;
                else
                    local v178 = bit32.rshift(124, v16);
                    v17[v19] = v18 + v178;
                    v19 = v19 + 1;
                    v18 = bit32.band(bit32.lshift(124, 8 - v16), 255);
                    v17[v19] = v18;
                end;
                v20 = v20 + 8;
            end;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v179 = bit32.rshift(0, v16);
                v17[v19] = v18 + v179;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            return;
        elseif v173 ~= v173 then
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 127;
            else
                local v180 = bit32.rshift(127, v16);
                v17[v19] = v18 + v180;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(127, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 255;
            else
                local v181 = bit32.rshift(255, v16);
                v17[v19] = v18 + v181;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(255, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            return;
        elseif v173 == 0 then
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v182 = bit32.rshift(0, v16);
                v17[v19] = v18 + v182;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v183 = bit32.rshift(0, v16);
                v17[v19] = v18 + v183;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            return;
        elseif v176 + 15 <= 1 then
            v175 = math.floor(v175 * 1024 + 0.5);
            if v174 then
                v103(bit32.rshift(v175, 8) + 128);
            else
                v103((bit32.rshift(v175, 8)));
            end;
            v103((bit32.band(v175, 255)));
            return;
        else
            v175 = math.floor((v175 - 0.5) * 2048 + 0.5);
            if v174 then
                v103(bit32.lshift(v176 + 14, 2) + 128 + bit32.rshift(v175, 8));
            else
                v103(bit32.lshift(v176 + 14, 2) + bit32.rshift(v175, 8));
            end;
            v103((bit32.band(v175, 255)));
            return;
        end;
    end;
    local function v204(v185) --[[ Line: 777 ]] --[[ Name: writeFloat32 ]]
        -- upvalues: v16 (ref), v19 (ref), v17 (ref), v18 (ref), v20 (ref), v103 (copy)
        assert(type(v185) == "number", "argument #1 to BitBuffer.writeFloat32 should be a number");
        local v186 = v185 < 0;
        v185 = math.abs(v185);
        local v187, v188 = math.frexp(v185);
        if v185 == 1e999 then
            if v186 then
                assert(true, "argument #1 to BitBuffer.writeByte should be a number");
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
                if v16 == 0 then
                    v19 = v19 + 1;
                    v17[v19] = 255;
                else
                    local v189 = bit32.rshift(255, v16);
                    v17[v19] = v18 + v189;
                    v19 = v19 + 1;
                    v18 = bit32.band(bit32.lshift(255, 8 - v16), 255);
                    v17[v19] = v18;
                end;
                v20 = v20 + 8;
            else
                assert(true, "argument #1 to BitBuffer.writeByte should be a number");
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
                if v16 == 0 then
                    v19 = v19 + 1;
                    v17[v19] = 127;
                else
                    local v190 = bit32.rshift(127, v16);
                    v17[v19] = v18 + v190;
                    v19 = v19 + 1;
                    v18 = bit32.band(bit32.lshift(127, 8 - v16), 255);
                    v17[v19] = v18;
                end;
                v20 = v20 + 8;
            end;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 128;
            else
                local v191 = bit32.rshift(128, v16);
                v17[v19] = v18 + v191;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(128, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v192 = bit32.rshift(0, v16);
                v17[v19] = v18 + v192;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v193 = bit32.rshift(0, v16);
                v17[v19] = v18 + v193;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            return;
        elseif v185 ~= v185 then
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 127;
            else
                local v194 = bit32.rshift(127, v16);
                v17[v19] = v18 + v194;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(127, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 255;
            else
                local v195 = bit32.rshift(255, v16);
                v17[v19] = v18 + v195;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(255, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 255;
            else
                local v196 = bit32.rshift(255, v16);
                v17[v19] = v18 + v196;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(255, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 255;
            else
                local v197 = bit32.rshift(255, v16);
                v17[v19] = v18 + v197;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(255, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            return;
        elseif v185 == 0 then
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v198 = bit32.rshift(0, v16);
                v17[v19] = v18 + v198;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v199 = bit32.rshift(0, v16);
                v17[v19] = v18 + v199;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v200 = bit32.rshift(0, v16);
                v17[v19] = v18 + v200;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v201 = bit32.rshift(0, v16);
                v17[v19] = v18 + v201;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            return;
        elseif v188 + 127 <= 1 then
            v187 = math.floor(v187 * 8388608 + 0.5);
            if v186 then
                assert(true, "argument #1 to BitBuffer.writeByte should be a number");
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
                if v16 == 0 then
                    v19 = v19 + 1;
                    v17[v19] = 128;
                else
                    local v202 = bit32.rshift(128, v16);
                    v17[v19] = v18 + v202;
                    v19 = v19 + 1;
                    v18 = bit32.band(bit32.lshift(128, 8 - v16), 255);
                    v17[v19] = v18;
                end;
                v20 = v20 + 8;
            else
                assert(true, "argument #1 to BitBuffer.writeByte should be a number");
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
                if v16 == 0 then
                    v19 = v19 + 1;
                    v17[v19] = 0;
                else
                    local v203 = bit32.rshift(0, v16);
                    v17[v19] = v18 + v203;
                    v19 = v19 + 1;
                    v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                    v17[v19] = v18;
                end;
                v20 = v20 + 8;
            end;
            v103((bit32.rshift(v187, 16)));
            v103((bit32.band(bit32.rshift(v187, 8), 255)));
            v103((bit32.band(v187, 255)));
            return;
        else
            v187 = math.floor((v187 - 0.5) * 16777216 + 0.5);
            if v186 then
                v103(bit32.rshift(v188 + 126, 1) + 128);
            else
                v103((bit32.rshift(v188 + 126, 1)));
            end;
            v103(bit32.band(bit32.lshift(v188 + 126, 7), 255) + bit32.rshift(v187, 16));
            v103((bit32.band(bit32.rshift(v187, 8), 255)));
            v103((bit32.band(v187, 255)));
            return;
        end;
    end;
    local function v233(v205) --[[ Line: 834 ]] --[[ Name: writeFloat64 ]]
        -- upvalues: v16 (ref), v19 (ref), v17 (ref), v18 (ref), v20 (ref), v103 (copy)
        assert(type(v205) == "number", "argument #1 to BitBuffer.writeFloat64 should be a number");
        local v206 = v205 < 0;
        v205 = math.abs(v205);
        local v207, v208 = math.frexp(v205);
        if v205 == 1e999 then
            if v206 then
                assert(true, "argument #1 to BitBuffer.writeByte should be a number");
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
                if v16 == 0 then
                    v19 = v19 + 1;
                    v17[v19] = 255;
                else
                    local v209 = bit32.rshift(255, v16);
                    v17[v19] = v18 + v209;
                    v19 = v19 + 1;
                    v18 = bit32.band(bit32.lshift(255, 8 - v16), 255);
                    v17[v19] = v18;
                end;
                v20 = v20 + 8;
            else
                assert(true, "argument #1 to BitBuffer.writeByte should be a number");
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
                if v16 == 0 then
                    v19 = v19 + 1;
                    v17[v19] = 127;
                else
                    local v210 = bit32.rshift(127, v16);
                    v17[v19] = v18 + v210;
                    v19 = v19 + 1;
                    v18 = bit32.band(bit32.lshift(127, 8 - v16), 255);
                    v17[v19] = v18;
                end;
                v20 = v20 + 8;
            end;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 240;
            else
                local v211 = bit32.rshift(240, v16);
                v17[v19] = v18 + v211;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(240, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v212 = bit32.rshift(0, v16);
                v17[v19] = v18 + v212;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v213 = bit32.rshift(0, v16);
                v17[v19] = v18 + v213;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v214 = bit32.rshift(0, v16);
                v17[v19] = v18 + v214;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v215 = bit32.rshift(0, v16);
                v17[v19] = v18 + v215;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v216 = bit32.rshift(0, v16);
                v17[v19] = v18 + v216;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v217 = bit32.rshift(0, v16);
                v17[v19] = v18 + v217;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            return;
        elseif v205 ~= v205 then
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 127;
            else
                local v218 = bit32.rshift(127, v16);
                v17[v19] = v18 + v218;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(127, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 255;
            else
                local v219 = bit32.rshift(255, v16);
                v17[v19] = v18 + v219;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(255, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 255;
            else
                local v220 = bit32.rshift(255, v16);
                v17[v19] = v18 + v220;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(255, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 255;
            else
                local v221 = bit32.rshift(255, v16);
                v17[v19] = v18 + v221;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(255, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 255;
            else
                local v222 = bit32.rshift(255, v16);
                v17[v19] = v18 + v222;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(255, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 255;
            else
                local v223 = bit32.rshift(255, v16);
                v17[v19] = v18 + v223;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(255, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 255;
            else
                local v224 = bit32.rshift(255, v16);
                v17[v19] = v18 + v224;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(255, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 255;
            else
                local v225 = bit32.rshift(255, v16);
                v17[v19] = v18 + v225;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(255, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            return;
        elseif v205 == 0 then
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v226 = bit32.rshift(0, v16);
                v17[v19] = v18 + v226;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            return;
        elseif v208 + 1023 <= 1 then
            v207 = math.floor(v207 * 4.503599627370496E15 + 0.5);
            if v206 then
                assert(true, "argument #1 to BitBuffer.writeByte should be a number");
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
                if v16 == 0 then
                    v19 = v19 + 1;
                    v17[v19] = 128;
                else
                    local v227 = bit32.rshift(128, v16);
                    v17[v19] = v18 + v227;
                    v19 = v19 + 1;
                    v18 = bit32.band(bit32.lshift(128, 8 - v16), 255);
                    v17[v19] = v18;
                end;
                v20 = v20 + 8;
            else
                assert(true, "argument #1 to BitBuffer.writeByte should be a number");
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
                if v16 == 0 then
                    v19 = v19 + 1;
                    v17[v19] = 0;
                else
                    local v228 = bit32.rshift(0, v16);
                    v17[v19] = v18 + v228;
                    v19 = v19 + 1;
                    v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                    v17[v19] = v18;
                end;
                v20 = v20 + 8;
            end;
            local v229 = v207 % 4294967296;
            local v230 = math.floor(v207 / 4294967296);
            v103((bit32.rshift(v230, 16)));
            v103((bit32.band(bit32.rshift(v230, 8), 255)));
            v103((bit32.band(v230, 255)));
            v103((bit32.rshift(v229, 24)));
            v103((bit32.band(bit32.rshift(v229, 16), 255)));
            v103((bit32.band(bit32.rshift(v229, 8), 255)));
            v103((bit32.band(v229, 255)));
            return;
        else
            v207 = math.floor((v207 - 0.5) * 9.007199254740992E15 + 0.5);
            if v206 then
                v103(bit32.rshift(v208 + 1022, 4) + 128);
            else
                v103((bit32.rshift(v208 + 1022, 4)));
            end;
            local v231 = v207 % 4294967296;
            local v232 = math.floor(v207 / 4294967296);
            v103(bit32.band(bit32.lshift(v208 + 1022, 4), 255) + bit32.rshift(v232, 16));
            v103((bit32.band(bit32.rshift(v232, 8), 255)));
            v103((bit32.band(v232, 255)));
            v103((bit32.rshift(v231, 24)));
            v103((bit32.band(bit32.rshift(v231, 16), 255)));
            v103((bit32.band(bit32.rshift(v231, 8), 255)));
            v103((bit32.band(v231, 255)));
            return;
        end;
    end;
    local function v237(v234) --[[ Line: 919 ]] --[[ Name: writeBrickColor ]]
        -- upvalues: v103 (copy)
        assert(typeof(v234) == "BrickColor", "argument #1 to BitBuffer.writeBrickColor should be a BrickColor");
        local l_Number_0 = v234.Number;
        assert(type(l_Number_0) == "number", "argument #1 to BitBuffer.writeUInt16 should be a number");
        local v236 = false;
        if l_Number_0 >= 0 then
            v236 = l_Number_0 <= 65535;
        end;
        assert(v236, "argument #1 to BitBuffer.writeInt16 should be in the range [0, 65535]");
        assert(l_Number_0 % 1 == 0, "argument #1 to BitBuffer.writeUInt16 should be an integer");
        v103((bit32.rshift(l_Number_0, 8)));
        v103((bit32.band(l_Number_0, 255)));
    end;
    local function v239(v238) --[[ Line: 925 ]] --[[ Name: writeColor3 ]]
        -- upvalues: v103 (copy)
        assert(typeof(v238) == "Color3", "argument #1 to BitBuffer.writeColor3 should be a Color3");
        v103((math.floor(v238.R * 255 + 0.5)));
        v103((math.floor(v238.G * 255 + 0.5)));
        v103((math.floor(v238.B * 255 + 0.5)));
    end;
    local function v263(v240) --[[ Line: 933 ]] --[[ Name: writeCFrame ]]
        -- upvalues: v4 (ref), v103 (copy), v204 (copy), v16 (ref), v19 (ref), v17 (ref), v18 (ref), v20 (ref)
        assert(typeof(v240) == "CFrame", "argument #1 to BitBuffer.writeCFrame should be a CFrame");
        local l_UpVector_0 = v240.UpVector;
        local l_RightVector_0 = v240.RightVector;
        local v243 = math.abs((l_RightVector_0:Dot((Vector3.new(1, 1, 1, 0)))));
        local v244 = math.abs((l_UpVector_0:Dot((Vector3.new(1, 1, 1, 0)))));
        if (not (math.abs(1 - v243) >= 1.0E-5) or v243 == 0) and (math.abs(1 - v244) < 1.0E-5 or v244 == 0) then
            local l_Position_0 = v240.Position;
            local v246 = nil;
            local v247 = nil;
            for v248 = 0, 5 do
                local v249 = v4[v248];
                if 1 - v249:Dot(l_RightVector_0) < 1.0E-5 then
                    v246 = v248;
                end;
                if 1 - v249:Dot(l_UpVector_0) < 1.0E-5 then
                    v247 = v248;
                end;
            end;
            v103(v246 * 6 + v247);
            v204(l_Position_0.X);
            v204(l_Position_0.Y);
            v204(l_Position_0.Z);
            return;
        else
            assert(true, "argument #1 to BitBuffer.writeByte should be a number");
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]");
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer");
            if v16 == 0 then
                v19 = v19 + 1;
                v17[v19] = 0;
            else
                local v250 = bit32.rshift(0, v16);
                v17[v19] = v18 + v250;
                v19 = v19 + 1;
                v18 = bit32.band(bit32.lshift(0, 8 - v16), 255);
                v17[v19] = v18;
            end;
            v20 = v20 + 8;
            local l_v240_Components_0, v252, v253, v254, v255, v256, v257, v258, v259, v260, v261, v262 = v240:GetComponents();
            v204(l_v240_Components_0);
            v204(v252);
            v204(v253);
            v204(v254);
            v204(v255);
            v204(v256);
            v204(v257);
            v204(v258);
            v204(v259);
            v204(v260);
            v204(v261);
            v204(v262);
            return;
        end;
    end;
    local function v265(v264) --[[ Line: 997 ]] --[[ Name: writeVector3 ]]
        -- upvalues: v204 (copy)
        assert(typeof(v264) == "Vector3", "argument #1 to BitBuffer.writeVector3 should be a Vector3");
        v204(v264.X);
        v204(v264.Y);
        v204(v264.Z);
    end;
    local function v267(v266) --[[ Line: 1005 ]] --[[ Name: writeVector2 ]]
        -- upvalues: v204 (copy)
        assert(typeof(v266) == "Vector2", "argument #1 to BitBuffer.writeVector2 should be a Vector2");
        v204(v266.X);
        v204(v266.Y);
    end;
    local function v269(v268) --[[ Line: 1012 ]] --[[ Name: writeUDim2 ]]
        -- upvalues: v204 (copy), v172 (copy)
        assert(typeof(v268) == "UDim2", "argument #1 to BitBuffer.writeUDim2 should be a UDim2");
        v204(v268.X.Scale);
        v172(v268.X.Offset);
        v204(v268.Y.Scale);
        v172(v268.Y.Offset);
    end;
    local function v271(v270) --[[ Line: 1021 ]] --[[ Name: writeUDim ]]
        -- upvalues: v204 (copy), v172 (copy)
        assert(typeof(v270) == "UDim", "argument #1 to BitBuffer.writeUDim should be a UDim");
        v204(v270.Scale);
        v172(v270.Offset);
    end;
    local function v273(v272) --[[ Line: 1028 ]] --[[ Name: writeRay ]]
        -- upvalues: v204 (copy)
        assert(typeof(v272) == "Ray", "argument #1 to BitBuffer.writeRay should be a Ray");
        v204(v272.Origin.X);
        v204(v272.Origin.Y);
        v204(v272.Origin.Z);
        v204(v272.Direction.X);
        v204(v272.Direction.Y);
        v204(v272.Direction.Z);
    end;
    local function v275(v274) --[[ Line: 1040 ]] --[[ Name: writeRect ]]
        -- upvalues: v204 (copy)
        assert(typeof(v274) == "Rect", "argument #1 to BitBuffer.writeRect should be a Rect");
        v204(v274.Min.X);
        v204(v274.Min.Y);
        v204(v274.Max.X);
        v204(v274.Max.Y);
    end;
    local function v279(v276) --[[ Line: 1050 ]] --[[ Name: writeRegion3 ]]
        -- upvalues: v204 (copy)
        assert(typeof(v276) == "Region3", "argument #1 to BitBuffer.writeRegion3 should be a Region3");
        local v277 = v276.CFrame.Position - v276.Size / 2;
        local v278 = v276.CFrame.Position + v276.Size / 2;
        v204(v277.X);
        v204(v277.Y);
        v204(v277.Z);
        v204(v278.X);
        v204(v278.Y);
        v204(v278.Z);
    end;
    local function v283(v280) --[[ Line: 1065 ]] --[[ Name: writeEnum ]]
        -- upvalues: v147 (copy), v103 (copy)
        assert(typeof(v280) == "EnumItem", "argument #1 to BitBuffer.writeEnum should be an EnumItem");
        v147((tostring(v280.EnumType)));
        local l_Value_0 = v280.Value;
        assert(type(l_Value_0) == "number", "argument #1 to BitBuffer.writeUInt16 should be a number");
        local v282 = false;
        if l_Value_0 >= 0 then
            v282 = l_Value_0 <= 65535;
        end;
        assert(v282, "argument #1 to BitBuffer.writeInt16 should be in the range [0, 65535]");
        assert(l_Value_0 % 1 == 0, "argument #1 to BitBuffer.writeUInt16 should be an integer");
        v103((bit32.rshift(l_Value_0, 8)));
        v103((bit32.band(l_Value_0, 255)));
    end;
    local function v285(v284) --[[ Line: 1073 ]] --[[ Name: writeNumberRange ]]
        -- upvalues: v204 (copy)
        assert(typeof(v284) == "NumberRange", "argument #1 to BitBuffer.writeNumberRange should be a NumberRange");
        v204(v284.Min);
        v204(v284.Max);
    end;
    local function v289(v286) --[[ Line: 1080 ]] --[[ Name: writeNumberSequence ]]
        -- upvalues: v163 (copy), v204 (copy)
        assert(typeof(v286) == "NumberSequence", "argument #1 to BitBuffer.writeNumberSequence should be a NumberSequence");
        v163(#v286.Keypoints);
        for _, v288 in ipairs(v286.Keypoints) do
            v204(v288.Time);
            v204(v288.Value);
            v204(v288.Envelope);
        end;
    end;
    local function v294(v290) --[[ Line: 1094 ]] --[[ Name: writeColorSequence ]]
        -- upvalues: v163 (copy), v204 (copy), v103 (copy)
        assert(typeof(v290) == "ColorSequence", "argument #1 to BitBuffer.writeColorSequence should be a ColorSequence");
        v163(#v290.Keypoints);
        for _, v292 in ipairs(v290.Keypoints) do
            local l_Value_1 = v292.Value;
            v204(v292.Time);
            v103((math.floor(l_Value_1.R * 255 + 0.5)));
            v103((math.floor(l_Value_1.G * 255 + 0.5)));
            v103((math.floor(l_Value_1.B * 255 + 0.5)));
        end;
    end;
    local function v300(v295) --[[ Line: 1112 ]] --[[ Name: readBits ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref), v11 (ref), v5 (ref)
        assert(type(v295) == "number", "argument #1 to BitBuffer.readBits should be a number");
        assert(v295 > 0, "argument #1 to BitBuffer.readBits should be greater than zero");
        assert(v295 % 1 == 0, "argument #1 to BitBuffer.readBits should be an integer");
        assert(v21 + v295 <= v20, "BitBuffer.readBits cannot read past the end of the stream");
        local v296 = table.create(v295);
        local v297 = v17[v22];
        local v298 = v21 % 8;
        for v299 = 1, v295 do
            v296[v299] = v5[bit32.btest(v297, v11[7 - v298])];
            v298 = v298 + 1;
            if v298 == 8 then
                v22 = v22 + 1;
                v297 = v17[v22];
                v298 = 0;
            end;
        end;
        v21 = v21 + v295;
        return v296;
    end;
    local function v303() --[[ Line: 1140 ]] --[[ Name: readByte ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v301 = v21 % 8;
        local v302 = v17[v22];
        v21 = v21 + 8;
        if v301 == 0 then
            v22 = v22 + 1;
            return v302;
        else
            v22 = v22 + 1;
            return bit32.band(bit32.lshift(v302, v301), 255) + bit32.rshift(v17[v22], 8 - v301);
        end;
    end;
    local function v314(v304) --[[ Line: 1158 ]] --[[ Name: readUnsigned ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref), v300 (copy)
        assert(type(v304) == "number", "argument #1 to BitBuffer.readUnsigned should be a number");
        local v305 = false;
        if v304 >= 1 then
            v305 = v304 <= 64;
        end;
        assert(v305, "argument #1 to BitBuffer.readUnsigned should be in the range [1, 64]");
        assert(v304 % 1 == 0, "argument #1 to BitBuffer.readUnsigned should be an integer");
        assert(v21 + v304 <= v20, "BitBuffer.readUnsigned cannot read past the end of the stream");
        local v306 = math.floor(v304 / 8);
        v305 = v304 % 8;
        local v307 = 0;
        for _ = 1, v306 do
            v307 = v307 * 256;
            assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
            local v309 = v21 % 8;
            local v310 = v17[v22];
            v21 = v21 + 8;
            local v311;
            if v309 == 0 then
                v22 = v22 + 1;
                v311 = v310;
            else
                v22 = v22 + 1;
                v311 = bit32.band(bit32.lshift(v310, v309), 255) + bit32.rshift(v17[v22], 8 - v309);
            end;
            v307 = v307 + v311;
        end;
        if v305 ~= 0 then
            for _, v313 in ipairs((v300(v304 % 8))) do
                v307 = v307 * 2 + v313;
            end;
        end;
        return v307;
    end;
    local function v321(v315) --[[ Line: 1186 ]] --[[ Name: readSigned ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref), v11 (ref), v5 (ref), v314 (copy)
        assert(type(v315) == "number", "argument #1 to BitBuffer.readSigned should be a number");
        local v316 = false;
        if v315 >= 2 then
            v316 = v315 <= 64;
        end;
        assert(v316, "argument #1 to BitBuffer.readSigned should be in the range [2, 64]");
        assert(v315 % 1 == 0, "argument #1 to BitBuffer.readSigned should be an integer");
        assert(v21 + 8 <= v20, "BitBuffer.readSigned cannot read past the end of the stream");
        assert(true, "argument #1 to BitBuffer.readBits should be a number");
        assert(true, "argument #1 to BitBuffer.readBits should be greater than zero");
        assert(true, "argument #1 to BitBuffer.readBits should be an integer");
        assert(v21 + 1 <= v20, "BitBuffer.readBits cannot read past the end of the stream");
        local v317 = table.create(1);
        local v318 = v17[v22];
        local v319 = v21 % 8;
        v317[1] = v5[bit32.btest(v318, v11[7 - v319])];
        if v319 + 1 == 8 then
            v22 = v22 + 1;
            v318 = v17[v22];
            v319 = 0;
        end;
        v21 = v21 + 1;
        local v320 = v317[1];
        v316 = v314(v315 - 1);
        if v320 == 0 then
            return v316;
        else
            return v316 - v11[v315 - 1];
        end;
    end;
    local function v330(v322, v323) --[[ Line: 1205 ]] --[[ Name: readFloat ]]
        -- upvalues: v21 (ref), v20 (ref), v11 (ref), v17 (ref), v22 (ref), v5 (ref), v314 (copy)
        assert(type(v322) == "number", "argument #1 to BitBuffer.readFloat should be a number");
        local v324 = false;
        if v322 >= 1 then
            v324 = v322 <= 64;
        end;
        assert(v324, "argument #1 to BitBuffer.readFloat should be in the range [1, 64]");
        assert(v322 % 1 == 0, "argument #1 to BitBuffer.readFloat should be an integer");
        assert(type(v323) == "number", "argument #2 to BitBuffer.readFloat should be a number");
        v324 = false;
        if v323 >= 1 then
            v324 = v323 <= 64;
        end;
        assert(v324, "argument #2 to BitBuffer.readFloat should be in the range [1, 64]");
        assert(v323 % 1 == 0, "argument #2 to BitBuffer.readFloat should be an integer");
        assert(v21 + v322 + v323 + 1 <= v20, "BitBuffer.readFloat cannot read past the end of the stream");
        local v325 = v11[v322 - 1] - 1;
        assert(true, "argument #1 to BitBuffer.readBits should be a number");
        assert(true, "argument #1 to BitBuffer.readBits should be greater than zero");
        assert(true, "argument #1 to BitBuffer.readBits should be an integer");
        assert(v21 + 1 <= v20, "BitBuffer.readBits cannot read past the end of the stream");
        local v326 = table.create(1);
        local v327 = v17[v22];
        local v328 = v21 % 8;
        v326[1] = v5[bit32.btest(v327, v11[7 - v328])];
        if v328 + 1 == 8 then
            v22 = v22 + 1;
            v327 = v17[v22];
            v328 = 0;
        end;
        v21 = v21 + 1;
        v324 = v326[1];
        local v329 = v314(v322);
        v326 = v314(v323);
        if v329 == v11[v322] - 1 then
            if v326 ~= 0 then
                return (0/0);
            elseif v324 == 0 then
                return 1e999;
            else
                return -1e999;
            end;
        elseif v329 == 0 then
            if v326 == 0 then
                return 0;
            else
                v326 = v326 / v11[v323];
                return v324 == 1 and -math.ldexp(v326, -v325 + 1) or math.ldexp(v326, -v325 + 1);
            end;
        else
            v326 = v326 / v11[v323] + 1;
            return v324 == 1 and -math.ldexp(v326, v329 - v325) or math.ldexp(v326, v329 - v325);
        end;
    end;
    local function v341() --[[ Line: 1262 ]] --[[ Name: readString ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(v21 + 24 <= v20, "BitBuffer.readString cannot read past the end of the stream");
        assert(true, "argument #1 to BitBuffer.readUnsigned should be a number");
        assert(true, "argument #1 to BitBuffer.readUnsigned should be in the range [1, 64]");
        assert(true, "argument #1 to BitBuffer.readUnsigned should be an integer");
        assert(v21 + 24 <= v20, "BitBuffer.readUnsigned cannot read past the end of the stream");
        local v331 = 0 * 256;
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v332 = v21 % 8;
        local v333 = v17[v22];
        v21 = v21 + 8;
        local v334;
        if v332 == 0 then
            v22 = v22 + 1;
            v334 = v333;
        else
            v22 = v22 + 1;
            v334 = bit32.band(bit32.lshift(v333, v332), 255) + bit32.rshift(v17[v22], 8 - v332);
        end;
        v331 = (v331 + v334) * 256;
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v332 = v21 % 8;
        v333 = v17[v22];
        v21 = v21 + 8;
        if v332 == 0 then
            v22 = v22 + 1;
            v334 = v333;
        else
            v22 = v22 + 1;
            v334 = bit32.band(bit32.lshift(v333, v332), 255) + bit32.rshift(v17[v22], 8 - v332);
        end;
        v331 = (v331 + v334) * 256;
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v332 = v21 % 8;
        v333 = v17[v22];
        v21 = v21 + 8;
        if v332 == 0 then
            v22 = v22 + 1;
            v334 = v333;
        else
            v22 = v22 + 1;
            v334 = bit32.band(bit32.lshift(v333, v332), 255) + bit32.rshift(v17[v22], 8 - v332);
        end;
        local v335 = v331 + v334;
        assert(v21 + v335 * 8 <= v20, "BitBuffer.readString cannot read past the end of the stream");
        v331 = table.create(v335);
        for v336 = 1, v335 do
            assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
            local v337 = v21 % 8;
            local v338 = v17[v22];
            v21 = v21 + 8;
            local v339;
            if v337 == 0 then
                v22 = v22 + 1;
                v339 = v338;
            else
                v22 = v22 + 1;
                v339 = bit32.band(bit32.lshift(v338, v337), 255) + bit32.rshift(v17[v22], 8 - v337);
            end;
            v331[v336] = v339;
        end;
        v334 = table.create((math.ceil(v335 / 4096)));
        v332 = 1;
        for v340 = 1, v335, 4096 do
            v334[v332] = string.char(table.unpack(v331, v340, (math.min(v335, v340 + 4095))));
            v332 = v332 + 1;
        end;
        return table.concat(v334);
    end;
    local function v350() --[[ Line: 1286 ]] --[[ Name: readTerminatedString ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        local v342 = {};
        local v343 = 0;
        while true do
            assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
            local v344 = v21 % 8;
            local v345 = v17[v22];
            v21 = v21 + 8;
            local v346;
            if v344 == 0 then
                v22 = v22 + 1;
                v346 = v345;
            else
                v22 = v22 + 1;
                v346 = bit32.band(bit32.lshift(v345, v344), 255) + bit32.rshift(v17[v22], 8 - v344);
            end;
            if not v346 then
                error("BitBuffer.readTerminatedString cannot read past the end of the stream", 2);
                continue;
            end;
            if v346 ~= 0 then
                v343 = v343 + 1;
                v342[v343] = v346;
            else
                break;
            end;
        end;
        local v347 = table.create((math.ceil(v343 / 4096)));
        local v348 = 1;
        for v349 = 1, v343, 4096 do
            v347[v348] = string.char(table.unpack(v342, v349, (math.min(v343, v349 + 4095))));
            v348 = v348 + 1;
        end;
        return table.concat(v347);
    end;
    local function v360(v351) --[[ Line: 1313 ]] --[[ Name: readSetLengthString ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(type(v351) == "number", "argument #1 to BitBuffer.readSetLengthString should be a number");
        assert(v351 >= 0, "argument #1 to BitBuffer.readSetLengthString should be zero or higher.");
        assert(v351 % 1 == 0, "argument #1 to BitBuffer.readSetLengthString should be an integer");
        assert(v21 + v351 * 8 <= v20, "BitBuffer.readSetLengthString cannot read past the end of the stream");
        local v352 = table.create(v351);
        for v353 = 1, v351 do
            assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
            local v354 = v21 % 8;
            local v355 = v17[v22];
            v21 = v21 + 8;
            local v356;
            if v354 == 0 then
                v22 = v22 + 1;
                v356 = v355;
            else
                v22 = v22 + 1;
                v356 = bit32.band(bit32.lshift(v355, v354), 255) + bit32.rshift(v17[v22], 8 - v354);
            end;
            v352[v353] = v356;
        end;
        local v357 = table.create((math.ceil(v351 / 4096)));
        local v358 = 1;
        for v359 = 1, v351, 4096 do
            v357[v358] = string.char(table.unpack(v352, v359, (math.min(v351, v359 + 4095))));
            v358 = v358 + 1;
        end;
        return table.concat(v357);
    end;
    local function v365(v361) --[[ Line: 1340 ]] --[[ Name: readField ]]
        -- upvalues: v21 (ref), v20 (ref), v314 (copy)
        assert(type(v361) == "number", "argument #1 to BitBuffer.readField should be a number");
        assert(v361 > 0, "argument #1 to BitBuffer.readField should be above 0");
        assert(v361 % 1 == 0, "argument #1 to BitBuffer.readField should be an integer");
        assert(v21 + v361 <= v20, "BitBuffer.readField cannot read past the end of the stream");
        local v362 = v314(v361);
        local v363 = table.create(v361);
        for v364 = v361, 1, -1 do
            v363[v364] = v362 % 2 == 1;
            v362 = math.floor(v362 / 2);
        end;
        return v363;
    end;
    local function v368() --[[ Line: 1361 ]] --[[ Name: readUInt8 ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(v21 + 8 <= v20, "BitBuffer.readUInt8 cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v366 = v21 % 8;
        local v367 = v17[v22];
        v21 = v21 + 8;
        if v366 == 0 then
            v22 = v22 + 1;
            return v367;
        else
            v22 = v22 + 1;
            return bit32.band(bit32.lshift(v367, v366), 255) + bit32.rshift(v17[v22], 8 - v366);
        end;
    end;
    local function v373() --[[ Line: 1367 ]] --[[ Name: readUInt16 ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(v21 + 16 <= v20, "BitBuffer.readUInt16 cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v369 = v21 % 8;
        local v370 = v17[v22];
        v21 = v21 + 8;
        local v371;
        if v369 == 0 then
            v22 = v22 + 1;
            v371 = v370;
        else
            v22 = v22 + 1;
            v371 = bit32.band(bit32.lshift(v370, v369), 255) + bit32.rshift(v17[v22], 8 - v369);
        end;
        local v372 = bit32.lshift(v371, 8);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v369 = v21 % 8;
        v370 = v17[v22];
        v21 = v21 + 8;
        if v369 == 0 then
            v22 = v22 + 1;
            v371 = v370;
        else
            v22 = v22 + 1;
            v371 = bit32.band(bit32.lshift(v370, v369), 255) + bit32.rshift(v17[v22], 8 - v369);
        end;
        return v372 + v371;
    end;
    local function v381() --[[ Line: 1373 ]] --[[ Name: readUInt32 ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(v21 + 32 <= v20, "BitBuffer.readUInt32 cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v374 = v21 % 8;
        local v375 = v17[v22];
        v21 = v21 + 8;
        local v376;
        if v374 == 0 then
            v22 = v22 + 1;
            v376 = v375;
        else
            v22 = v22 + 1;
            v376 = bit32.band(bit32.lshift(v375, v374), 255) + bit32.rshift(v17[v22], 8 - v374);
        end;
        local v377 = bit32.lshift(v376, 24);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v375 = v21 % 8;
        local v378 = v17[v22];
        v21 = v21 + 8;
        if v375 == 0 then
            v22 = v22 + 1;
            v374 = v378;
        else
            v22 = v22 + 1;
            v374 = bit32.band(bit32.lshift(v378, v375), 255) + bit32.rshift(v17[v22], 8 - v375);
        end;
        local v379 = v377 + bit32.lshift(v374, 16);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v374 = v21 % 8;
        v375 = v17[v22];
        v21 = v21 + 8;
        if v374 == 0 then
            v22 = v22 + 1;
            v376 = v375;
        else
            v22 = v22 + 1;
            v376 = bit32.band(bit32.lshift(v375, v374), 255) + bit32.rshift(v17[v22], 8 - v374);
        end;
        local v380 = v379 + bit32.lshift(v376, 8);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v377 = v21 % 8;
        v376 = v17[v22];
        v21 = v21 + 8;
        if v377 == 0 then
            v22 = v22 + 1;
            v379 = v376;
        else
            v22 = v22 + 1;
            v379 = bit32.band(bit32.lshift(v376, v377), 255) + bit32.rshift(v17[v22], 8 - v377);
        end;
        return v380 + v379;
    end;
    local function v385() --[[ Line: 1379 ]] --[[ Name: readInt8 ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(v21 + 8 <= v20, "BitBuffer.readInt8 cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v382 = v21 % 8;
        local v383 = v17[v22];
        v21 = v21 + 8;
        local v384;
        if v382 == 0 then
            v22 = v22 + 1;
            v384 = v383;
        else
            v22 = v22 + 1;
            v384 = bit32.band(bit32.lshift(v383, v382), 255) + bit32.rshift(v17[v22], 8 - v382);
        end;
        v382 = bit32.btest(v384, 128);
        v384 = bit32.band(v384, 127);
        if v382 then
            return v384 - 128;
        else
            return v384;
        end;
    end;
    local function v391() --[[ Line: 1393 ]] --[[ Name: readInt16 ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(v21 + 16 <= v20, "BitBuffer.readInt16 cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v386 = v21 % 8;
        local v387 = v17[v22];
        v21 = v21 + 8;
        local v388;
        if v386 == 0 then
            v22 = v22 + 1;
            v388 = v387;
        else
            v22 = v22 + 1;
            v388 = bit32.band(bit32.lshift(v387, v386), 255) + bit32.rshift(v17[v22], 8 - v386);
        end;
        local v389 = bit32.lshift(v388, 8);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v386 = v21 % 8;
        v387 = v17[v22];
        v21 = v21 + 8;
        if v386 == 0 then
            v22 = v22 + 1;
            v388 = v387;
        else
            v22 = v22 + 1;
            v388 = bit32.band(bit32.lshift(v387, v386), 255) + bit32.rshift(v17[v22], 8 - v386);
        end;
        local v390 = v389 + v388;
        v389 = bit32.btest(v390, 32768);
        v390 = bit32.band(v390, 32767);
        if v389 then
            return v390 - 32768;
        else
            return v390;
        end;
    end;
    local function v400() --[[ Line: 1407 ]] --[[ Name: readInt32 ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(v21 + 32 <= v20, "BitBuffer.readInt32 cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v392 = v21 % 8;
        local v393 = v17[v22];
        v21 = v21 + 8;
        local v394;
        if v392 == 0 then
            v22 = v22 + 1;
            v394 = v393;
        else
            v22 = v22 + 1;
            v394 = bit32.band(bit32.lshift(v393, v392), 255) + bit32.rshift(v17[v22], 8 - v392);
        end;
        local v395 = bit32.lshift(v394, 24);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v393 = v21 % 8;
        local v396 = v17[v22];
        v21 = v21 + 8;
        if v393 == 0 then
            v22 = v22 + 1;
            v392 = v396;
        else
            v22 = v22 + 1;
            v392 = bit32.band(bit32.lshift(v396, v393), 255) + bit32.rshift(v17[v22], 8 - v393);
        end;
        local v397 = v395 + bit32.lshift(v392, 16);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v392 = v21 % 8;
        v393 = v17[v22];
        v21 = v21 + 8;
        if v392 == 0 then
            v22 = v22 + 1;
            v394 = v393;
        else
            v22 = v22 + 1;
            v394 = bit32.band(bit32.lshift(v393, v392), 255) + bit32.rshift(v17[v22], 8 - v392);
        end;
        local v398 = v397 + bit32.lshift(v394, 8);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v395 = v21 % 8;
        v394 = v17[v22];
        v21 = v21 + 8;
        if v395 == 0 then
            v22 = v22 + 1;
            v397 = v394;
        else
            v22 = v22 + 1;
            v397 = bit32.band(bit32.lshift(v394, v395), 255) + bit32.rshift(v17[v22], 8 - v395);
        end;
        local v399 = v398 + v397;
        v398 = bit32.btest(v399, 2147483648);
        v399 = bit32.band(v399, 2147483647);
        if v398 then
            return v399 - 2147483648;
        else
            return v399;
        end;
    end;
    local function v409() --[[ Line: 1421 ]] --[[ Name: readFloat16 ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(v21 + 16 <= v20, "BitBuffer.readFloat16 cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v401 = v21 % 8;
        local v402 = v17[v22];
        v21 = v21 + 8;
        local v403;
        if v401 == 0 then
            v22 = v22 + 1;
            v403 = v402;
        else
            v22 = v22 + 1;
            v403 = bit32.band(bit32.lshift(v402, v401), 255) + bit32.rshift(v17[v22], 8 - v401);
        end;
        v401 = bit32.btest(v403, 128);
        v402 = bit32.rshift(bit32.band(v403, 127), 2);
        local v404 = bit32.lshift(bit32.band(v403, 3), 8);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v405 = v21 % 8;
        local v406 = v17[v22];
        v21 = v21 + 8;
        local v407;
        if v405 == 0 then
            v22 = v22 + 1;
            v407 = v406;
        else
            v22 = v22 + 1;
            v407 = bit32.band(bit32.lshift(v406, v405), 255) + bit32.rshift(v17[v22], 8 - v405);
        end;
        local v408 = v404 + v407;
        if v402 == 31 then
            if v408 ~= 0 then
                return (0/0);
            elseif v401 then
                return -1e999;
            else
                return 1e999;
            end;
        elseif v402 == 0 then
            if v408 == 0 then
                return 0;
            else
                return v401 and -math.ldexp(v408 / 1024, -14) or math.ldexp(v408 / 1024, -14);
            end;
        else
            v408 = v408 / 1024 + 1;
            return v401 and -math.ldexp(v408, v402 - 15) or math.ldexp(v408, v402 - 15);
        end;
    end;
    local function v421() --[[ Line: 1448 ]] --[[ Name: readFloat32 ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(v21 + 32 <= v20, "BitBuffer.readFloat32 cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v410 = v21 % 8;
        local v411 = v17[v22];
        v21 = v21 + 8;
        local v412;
        if v410 == 0 then
            v22 = v22 + 1;
            v412 = v411;
        else
            v22 = v22 + 1;
            v412 = bit32.band(bit32.lshift(v411, v410), 255) + bit32.rshift(v17[v22], 8 - v410);
        end;
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v411 = v21 % 8;
        local v413 = v17[v22];
        v21 = v21 + 8;
        if v411 == 0 then
            v22 = v22 + 1;
            v410 = v413;
        else
            v22 = v22 + 1;
            v410 = bit32.band(bit32.lshift(v413, v411), 255) + bit32.rshift(v17[v22], 8 - v411);
        end;
        v411 = bit32.btest(v412, 128);
        v413 = bit32.band(bit32.lshift(v412, 1), 255) + bit32.rshift(v410, 7);
        local v414 = bit32.lshift(bit32.band(v410, 127), 16);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v415 = v21 % 8;
        local v416 = v17[v22];
        v21 = v21 + 8;
        local v417;
        if v415 == 0 then
            v22 = v22 + 1;
            v417 = v416;
        else
            v22 = v22 + 1;
            v417 = bit32.band(bit32.lshift(v416, v415), 255) + bit32.rshift(v17[v22], 8 - v415);
        end;
        local v418 = v414 + bit32.lshift(v417, 8);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v417 = v21 % 8;
        v415 = v17[v22];
        v21 = v21 + 8;
        local v419;
        if v417 == 0 then
            v22 = v22 + 1;
            v419 = v415;
        else
            v22 = v22 + 1;
            v419 = bit32.band(bit32.lshift(v415, v417), 255) + bit32.rshift(v17[v22], 8 - v417);
        end;
        local v420 = v418 + bit32.lshift(v419, 0);
        if v413 == 255 then
            if v420 ~= 0 then
                return (0/0);
            elseif v411 then
                return -1e999;
            else
                return 1e999;
            end;
        elseif v413 == 0 then
            if v420 == 0 then
                return 0;
            else
                return v411 and -math.ldexp(v420 / 8388608, -126) or math.ldexp(v420 / 8388608, -126);
            end;
        else
            v420 = v420 / 8388608 + 1;
            return v411 and -math.ldexp(v420, v413 - 127) or math.ldexp(v420, v413 - 127);
        end;
    end;
    local function v435() --[[ Line: 1479 ]] --[[ Name: readFloat64 ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(v21 + 64 <= v20, "BitBuffer.readFloat64 cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v422 = v21 % 8;
        local v423 = v17[v22];
        v21 = v21 + 8;
        local v424;
        if v422 == 0 then
            v22 = v22 + 1;
            v424 = v423;
        else
            v22 = v22 + 1;
            v424 = bit32.band(bit32.lshift(v423, v422), 255) + bit32.rshift(v17[v22], 8 - v422);
        end;
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v423 = v21 % 8;
        local v425 = v17[v22];
        v21 = v21 + 8;
        if v423 == 0 then
            v22 = v22 + 1;
            v422 = v425;
        else
            v22 = v22 + 1;
            v422 = bit32.band(bit32.lshift(v425, v423), 255) + bit32.rshift(v17[v22], 8 - v423);
        end;
        v423 = bit32.btest(v424, 128);
        v425 = bit32.lshift(bit32.band(v424, 127), 4) + bit32.rshift(v422, 4);
        local v426 = bit32.lshift(bit32.band(v422, 15), 16);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v427 = v21 % 8;
        local v428 = v17[v22];
        v21 = v21 + 8;
        local v429;
        if v427 == 0 then
            v22 = v22 + 1;
            v429 = v428;
        else
            v22 = v22 + 1;
            v429 = bit32.band(bit32.lshift(v428, v427), 255) + bit32.rshift(v17[v22], 8 - v427);
        end;
        local v430 = v426 + bit32.lshift(v429, 8);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v431 = v21 % 8;
        v429 = v17[v22];
        v21 = v21 + 8;
        if v431 == 0 then
            v22 = v22 + 1;
            v426 = v429;
        else
            v22 = v22 + 1;
            v426 = bit32.band(bit32.lshift(v429, v431), 255) + bit32.rshift(v17[v22], 8 - v431);
        end;
        local v432 = v430 + v426;
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v428 = v21 % 8;
        local v433 = v17[v22];
        v21 = v21 + 8;
        if v428 == 0 then
            v22 = v22 + 1;
            v427 = v433;
        else
            v22 = v22 + 1;
            v427 = bit32.band(bit32.lshift(v433, v428), 255) + bit32.rshift(v17[v22], 8 - v428);
        end;
        v429 = bit32.lshift(v427, 24);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v433 = v21 % 8;
        local v434 = v17[v22];
        v21 = v21 + 8;
        if v433 == 0 then
            v22 = v22 + 1;
            v428 = v434;
        else
            v22 = v22 + 1;
            v428 = bit32.band(bit32.lshift(v434, v433), 255) + bit32.rshift(v17[v22], 8 - v433);
        end;
        v431 = v429 + bit32.lshift(v428, 16);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v428 = v21 % 8;
        v433 = v17[v22];
        v21 = v21 + 8;
        if v428 == 0 then
            v22 = v22 + 1;
            v427 = v433;
        else
            v22 = v22 + 1;
            v427 = bit32.band(bit32.lshift(v433, v428), 255) + bit32.rshift(v17[v22], 8 - v428);
        end;
        v426 = v431 + bit32.lshift(v427, 8);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v429 = v21 % 8;
        v427 = v17[v22];
        v21 = v21 + 8;
        if v429 == 0 then
            v22 = v22 + 1;
            v431 = v427;
        else
            v22 = v22 + 1;
            v431 = bit32.band(bit32.lshift(v427, v429), 255) + bit32.rshift(v17[v22], 8 - v429);
        end;
        v430 = v426 + v431;
        v426 = v432 * 4294967296 + v430;
        if v425 == 2047 then
            if v426 ~= 0 then
                return (0/0);
            elseif v423 then
                return -1e999;
            else
                return 1e999;
            end;
        elseif v425 == 0 then
            if v426 == 0 then
                return 0;
            else
                return v423 and -math.ldexp(v426 / 4.503599627370496E15, -1022) or math.ldexp(v426 / 4.503599627370496E15, -1022);
            end;
        else
            v426 = v426 / 4.503599627370496E15 + 1;
            return v423 and -math.ldexp(v426, v425 - 1023) or math.ldexp(v426, v425 - 1023);
        end;
    end;
    local function v441() --[[ Line: 1520 ]] --[[ Name: readBrickColor ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(v21 + 16 <= v20, "BitBuffer.readBrickColor cannot read past the end of the stream");
        local l_new_0 = BrickColor.new;
        assert(v21 + 16 <= v20, "BitBuffer.readUInt16 cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v437 = v21 % 8;
        local v438 = v17[v22];
        v21 = v21 + 8;
        local v439;
        if v437 == 0 then
            v22 = v22 + 1;
            v439 = v438;
        else
            v22 = v22 + 1;
            v439 = bit32.band(bit32.lshift(v438, v437), 255) + bit32.rshift(v17[v22], 8 - v437);
        end;
        local v440 = bit32.lshift(v439, 8);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v437 = v21 % 8;
        v438 = v17[v22];
        v21 = v21 + 8;
        if v437 == 0 then
            v22 = v22 + 1;
            v439 = v438;
        else
            v22 = v22 + 1;
            v439 = bit32.band(bit32.lshift(v438, v437), 255) + bit32.rshift(v17[v22], 8 - v437);
        end;
        return l_new_0(v440 + v439);
    end;
    local function v448() --[[ Line: 1526 ]] --[[ Name: readColor3 ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref)
        assert(v21 + 24 <= v20, "BitBuffer.readColor3 cannot read past the end of the stream");
        local l_fromRGB_0 = Color3.fromRGB;
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v443 = v21 % 8;
        local v444 = v17[v22];
        v21 = v21 + 8;
        local v445;
        if v443 == 0 then
            v22 = v22 + 1;
            v445 = v444;
        else
            v22 = v22 + 1;
            v445 = bit32.band(bit32.lshift(v444, v443), 255) + bit32.rshift(v17[v22], 8 - v443);
        end;
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v444 = v21 % 8;
        local v446 = v17[v22];
        v21 = v21 + 8;
        if v444 == 0 then
            v22 = v22 + 1;
            v443 = v446;
        else
            v22 = v22 + 1;
            v443 = bit32.band(bit32.lshift(v446, v444), 255) + bit32.rshift(v17[v22], 8 - v444);
        end;
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v446 = v21 % 8;
        local v447 = v17[v22];
        v21 = v21 + 8;
        if v446 == 0 then
            v22 = v22 + 1;
            v444 = v447;
        else
            v22 = v22 + 1;
            v444 = bit32.band(bit32.lshift(v447, v446), 255) + bit32.rshift(v17[v22], 8 - v446);
        end;
        return l_fromRGB_0(v445, v443, v444);
    end;
    local function v453() --[[ Line: 1532 ]] --[[ Name: readCFrame ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref), v421 (copy), v4 (ref)
        assert(v21 + 8 <= v20, "BitBuffer.readCFrame cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v449 = v21 % 8;
        local v450 = v17[v22];
        v21 = v21 + 8;
        local v451;
        if v449 == 0 then
            v22 = v22 + 1;
            v451 = v450;
        else
            v22 = v22 + 1;
            v451 = bit32.band(bit32.lshift(v450, v449), 255) + bit32.rshift(v17[v22], 8 - v449);
        end;
        if v451 == 0 then
            assert(v21 + 384 <= v20, "BitBuffer.readCFrame cannot read past the end of the stream");
            return CFrame.new(v421(), v421(), v421(), v421(), v421(), v421(), v421(), v421(), v421(), v421(), v421(), (v421()));
        else
            assert(v21 + 96 <= v20, "BitBuffer.readCFrame cannot read past the end of the stream");
            v449 = v4[math.floor(v451 / 6)];
            v450 = v4[v451 % 6];
            local v452 = v449:Cross(v450);
            return CFrame.new(v421(), v421(), v421(), v449.X, v450.X, v452.X, v449.Y, v450.Y, v452.Y, v449.Z, v450.Z, v452.Z);
        end;
    end;
    local function v454() --[[ Line: 1565 ]] --[[ Name: readVector3 ]]
        -- upvalues: v21 (ref), v20 (ref), v421 (copy)
        assert(v21 + 96 <= v20, "BitBuffer.readVector3 cannot read past the end of the stream");
        return (Vector3.new(v421(), v421(), (v421())));
    end;
    local function v455() --[[ Line: 1571 ]] --[[ Name: readVector2 ]]
        -- upvalues: v21 (ref), v20 (ref), v421 (copy)
        assert(v21 + 64 <= v20, "BitBuffer.readVector2 cannot read past the end of the stream");
        return Vector2.new(v421(), (v421()));
    end;
    local function v456() --[[ Line: 1577 ]] --[[ Name: readUDim2 ]]
        -- upvalues: v21 (ref), v20 (ref), v421 (copy), v400 (copy)
        assert(v21 + 128 <= v20, "BitBuffer.readUDim2 cannot read past the end of the stream");
        return UDim2.new(v421(), v400(), v421(), (v400()));
    end;
    local function v457() --[[ Line: 1583 ]] --[[ Name: readUDim ]]
        -- upvalues: v21 (ref), v20 (ref), v421 (copy), v400 (copy)
        assert(v21 + 64 <= v20, "BitBuffer.readUDim cannot read past the end of the stream");
        return UDim.new(v421(), (v400()));
    end;
    local function v458() --[[ Line: 1589 ]] --[[ Name: readRay ]]
        -- upvalues: v21 (ref), v20 (ref), v421 (copy)
        assert(v21 + 192 <= v20, "BitBuffer.readRay cannot read past the end of the stream");
        return Ray.new(Vector3.new(v421(), v421(), (v421())), (Vector3.new(v421(), v421(), (v421()))));
    end;
    local function v459() --[[ Line: 1598 ]] --[[ Name: readRect ]]
        -- upvalues: v21 (ref), v20 (ref), v421 (copy)
        assert(v21 + 128 <= v20, "BitBuffer.readRect cannot read past the end of the stream");
        return Rect.new(v421(), v421(), v421(), (v421()));
    end;
    local function v460() --[[ Line: 1604 ]] --[[ Name: readRegion3 ]]
        -- upvalues: v21 (ref), v20 (ref), v421 (copy)
        assert(v21 + 192 <= v20, "BitBuffer.readRegion3 cannot read past the end of the stream");
        return Region3.new(Vector3.new(v421(), v421(), (v421())), (Vector3.new(v421(), v421(), (v421()))));
    end;
    local function v469() --[[ Line: 1613 ]] --[[ Name: readEnum ]]
        -- upvalues: v21 (ref), v20 (ref), v350 (copy), v17 (ref), v22 (ref)
        assert(v21 + 8 <= v20, "BitBuffer.readEnum cannot read past the end of the stream");
        local v461 = v350();
        assert(v21 + 16 <= v20, "BitBuffer.readEnum cannot read past the end of the stream");
        assert(v21 + 16 <= v20, "BitBuffer.readUInt16 cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v462 = v21 % 8;
        local v463 = v17[v22];
        v21 = v21 + 8;
        local v464;
        if v462 == 0 then
            v22 = v22 + 1;
            v464 = v463;
        else
            v22 = v22 + 1;
            v464 = bit32.band(bit32.lshift(v463, v462), 255) + bit32.rshift(v17[v22], 8 - v462);
        end;
        local v465 = bit32.lshift(v464, 8);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v462 = v21 % 8;
        v463 = v17[v22];
        v21 = v21 + 8;
        if v462 == 0 then
            v22 = v22 + 1;
            v464 = v463;
        else
            v22 = v22 + 1;
            v464 = bit32.band(bit32.lshift(v463, v462), 255) + bit32.rshift(v17[v22], 8 - v462);
        end;
        local v466 = v465 + v464;
        for _, v468 in ipairs(Enum[v461]:GetEnumItems()) do
            if v468.Value == v466 then
                return v468;
            end;
        end;
        error("BitBuffer.readEnum could not get value: `" .. tostring(v466) .. "` is not a valid member of `" .. v461 .. "`", 2);
    end;
    local function v470() --[[ Line: 1640 ]] --[[ Name: readNumberRange ]]
        -- upvalues: v21 (ref), v20 (ref), v421 (copy)
        assert(v21 + 64 <= v20, "BitBuffer.readNumberRange cannot read past the end of the stream");
        return NumberRange.new(v421(), (v421()));
    end;
    local function v480() --[[ Line: 1646 ]] --[[ Name: readNumberSequence ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref), v421 (copy)
        assert(v21 + 32 <= v20, "BitBuffer.readNumberSequence cannot read past the end of the stream");
        assert(v21 + 32 <= v20, "BitBuffer.readUInt32 cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v471 = v21 % 8;
        local v472 = v17[v22];
        v21 = v21 + 8;
        local v473;
        if v471 == 0 then
            v22 = v22 + 1;
            v473 = v472;
        else
            v22 = v22 + 1;
            v473 = bit32.band(bit32.lshift(v472, v471), 255) + bit32.rshift(v17[v22], 8 - v471);
        end;
        local v474 = bit32.lshift(v473, 24);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v472 = v21 % 8;
        local v475 = v17[v22];
        v21 = v21 + 8;
        if v472 == 0 then
            v22 = v22 + 1;
            v471 = v475;
        else
            v22 = v22 + 1;
            v471 = bit32.band(bit32.lshift(v475, v472), 255) + bit32.rshift(v17[v22], 8 - v472);
        end;
        local v476 = v474 + bit32.lshift(v471, 16);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v471 = v21 % 8;
        v472 = v17[v22];
        v21 = v21 + 8;
        if v471 == 0 then
            v22 = v22 + 1;
            v473 = v472;
        else
            v22 = v22 + 1;
            v473 = bit32.band(bit32.lshift(v472, v471), 255) + bit32.rshift(v17[v22], 8 - v471);
        end;
        local v477 = v476 + bit32.lshift(v473, 8);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v474 = v21 % 8;
        v473 = v17[v22];
        v21 = v21 + 8;
        if v474 == 0 then
            v22 = v22 + 1;
            v476 = v473;
        else
            v22 = v22 + 1;
            v476 = bit32.band(bit32.lshift(v473, v474), 255) + bit32.rshift(v17[v22], 8 - v474);
        end;
        local v478 = v477 + v476;
        assert(v21 + v478 * 96, "BitBuffer.readColorSequence cannot read past the end of the stream");
        v477 = table.create(v478);
        for v479 = 1, v478 do
            v471 = v421();
            v472 = v421();
            v475 = v421();
            if v472 < 0 then
                v475 = nil;
            end;
            v477[v479] = NumberSequenceKeypoint.new(v471, v472, v475);
        end;
        return NumberSequence.new(v477);
    end;
    local function v495() --[[ Line: 1673 ]] --[[ Name: readColorSequence ]]
        -- upvalues: v21 (ref), v20 (ref), v17 (ref), v22 (ref), v421 (copy)
        assert(v21 + 32 <= v20, "BitBuffer.readColorSequence cannot read past the end of the stream");
        assert(v21 + 32 <= v20, "BitBuffer.readUInt32 cannot read past the end of the stream");
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        local v481 = v21 % 8;
        local v482 = v17[v22];
        v21 = v21 + 8;
        local v483;
        if v481 == 0 then
            v22 = v22 + 1;
            v483 = v482;
        else
            v22 = v22 + 1;
            v483 = bit32.band(bit32.lshift(v482, v481), 255) + bit32.rshift(v17[v22], 8 - v481);
        end;
        local v484 = bit32.lshift(v483, 24);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v482 = v21 % 8;
        local v485 = v17[v22];
        v21 = v21 + 8;
        if v482 == 0 then
            v22 = v22 + 1;
            v481 = v485;
        else
            v22 = v22 + 1;
            v481 = bit32.band(bit32.lshift(v485, v482), 255) + bit32.rshift(v17[v22], 8 - v482);
        end;
        local v486 = v484 + bit32.lshift(v481, 16);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v481 = v21 % 8;
        v482 = v17[v22];
        v21 = v21 + 8;
        if v481 == 0 then
            v22 = v22 + 1;
            v483 = v482;
        else
            v22 = v22 + 1;
            v483 = bit32.band(bit32.lshift(v482, v481), 255) + bit32.rshift(v17[v22], 8 - v481);
        end;
        local v487 = v486 + bit32.lshift(v483, 8);
        assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
        v484 = v21 % 8;
        v483 = v17[v22];
        v21 = v21 + 8;
        if v484 == 0 then
            v22 = v22 + 1;
            v486 = v483;
        else
            v22 = v22 + 1;
            v486 = bit32.band(bit32.lshift(v483, v484), 255) + bit32.rshift(v17[v22], 8 - v484);
        end;
        local v488 = v487 + v486;
        assert(v21 + v488 * 56, "BitBuffer.readColorSequence cannot read past the end of the stream");
        v487 = table.create(v488);
        for v489 = 1, v488 do
            v481 = ColorSequenceKeypoint.new;
            v482 = v421();
            v485 = Color3.fromRGB;
            assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
            local v490 = v21 % 8;
            local v491 = v17[v22];
            v21 = v21 + 8;
            local v492;
            if v490 == 0 then
                v22 = v22 + 1;
                v492 = v491;
            else
                v22 = v22 + 1;
                v492 = bit32.band(bit32.lshift(v491, v490), 255) + bit32.rshift(v17[v22], 8 - v490);
            end;
            assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
            v491 = v21 % 8;
            local v493 = v17[v22];
            v21 = v21 + 8;
            if v491 == 0 then
                v22 = v22 + 1;
                v490 = v493;
            else
                v22 = v22 + 1;
                v490 = bit32.band(bit32.lshift(v493, v491), 255) + bit32.rshift(v17[v22], 8 - v491);
            end;
            assert(v21 + 8 <= v20, "BitBuffer.readByte cannot read past the end of the stream");
            v493 = v21 % 8;
            local v494 = v17[v22];
            v21 = v21 + 8;
            if v493 == 0 then
                v22 = v22 + 1;
                v491 = v494;
            else
                v22 = v22 + 1;
                v491 = bit32.band(bit32.lshift(v494, v493), 255) + bit32.rshift(v17[v22], 8 - v493);
            end;
            v487[v489] = v481(v482, v485(v492, v490, v491));
        end;
        return ColorSequence.new(v487);
    end;
    return {
        dumpBinary = v27, 
        dumpString = v31, 
        dumpHex = v35, 
        dumpBase64 = v46, 
        exportChunk = v51, 
        exportBase64Chunk = v63, 
        exportHexChunk = v75, 
        crc32 = v80, 
        getLength = v81, 
        getByteLength = v82, 
        getPointer = v83, 
        setPointer = v85, 
        setPointerFromEnd = v87, 
        getPointerByte = v88, 
        setPointerByte = v90, 
        setPointerByteFromEnd = v92, 
        isFinished = v93, 
        writeBits = v99, 
        writeByte = v103, 
        writeUnsigned = v117, 
        writeSigned = v121, 
        writeFloat = v129, 
        writeBase64 = v137, 
        writeString = v143, 
        writeTerminatedString = v147, 
        writeSetLengthString = v150, 
        writeField = v154, 
        writeUInt8 = v157, 
        writeUInt16 = v160, 
        writeUInt32 = v163, 
        writeInt8 = v166, 
        writeInt16 = v169, 
        writeInt32 = v172, 
        writeFloat16 = v184, 
        writeFloat32 = v204, 
        writeFloat64 = v233, 
        writeBrickColor = v237, 
        writeColor3 = v239, 
        writeCFrame = v263, 
        writeVector3 = v265, 
        writeVector2 = v267, 
        writeUDim2 = v269, 
        writeUDim = v271, 
        writeRay = v273, 
        writeRect = v275, 
        writeRegion3 = v279, 
        writeEnum = v283, 
        writeNumberRange = v285, 
        writeNumberSequence = v289, 
        writeColorSequence = v294, 
        readBits = v300, 
        readByte = v303, 
        readUnsigned = v314, 
        readSigned = v321, 
        readFloat = v330, 
        readString = v341, 
        readTerminatedString = v350, 
        readSetLengthString = v360, 
        readField = v365, 
        readUInt8 = v368, 
        readUInt16 = v373, 
        readUInt32 = v381, 
        readInt8 = v385, 
        readInt16 = v391, 
        readInt32 = v400, 
        readFloat16 = v409, 
        readFloat32 = v421, 
        readFloat64 = v435, 
        readBrickColor = v441, 
        readColor3 = v448, 
        readCFrame = v453, 
        readVector3 = v454, 
        readVector2 = v455, 
        readUDim2 = v456, 
        readUDim = v457, 
        readRay = v458, 
        readRect = v459, 
        readRegion3 = v460, 
        readEnum = v469, 
        readNumberRange = v470, 
        readNumberSequence = v480, 
        readColorSequence = v495
    };
end;