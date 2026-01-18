--!native
local l_RunService_0 = game:GetService("RunService");
local l_exp_0 = math.exp;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
local l_min_0 = math.min;
local l_max_0 = math.max;
local l_sqrt_0 = math.sqrt;
local l_atan2_0 = math.atan2;
local l_round_0 = math.round;
local _ = function(v9) --[[ Line: 53 ]] --[[ Name: magnitudeSq ]]
    local v10 = 0;
    for _, v12 in v9 do
        v10 = v10 + v12 ^ 2;
    end;
    return v10;
end;
local function _(v14, v15) --[[ Line: 61 ]] --[[ Name: distanceSq ]]
    local v16 = 0;
    for v17, v18 in v14 do
        v16 = v16 + (v15[v17] - v18) ^ 2;
    end;
    return v16;
end;
local v20 = {};
v20.__index = v20;
v20.new = function(v21, v22, v23, v24, v25) --[[ Line: 91 ]] --[[ Name: new ]]
    -- upvalues: v20 (copy)
    local v26 = v25.toIntermediate(v23);
    return (setmetatable({
        d = v21, 
        f = v22, 
        g = v26, 
        p = v26, 
        v = table.create(#v26, 0), 
        typedat = v25, 
        rawGoal = v24
    }, v20));
end;
v20.setGoal = function(v27, v28) --[[ Line: 107 ]] --[[ Name: setGoal ]]
    v27.rawGoal = v28;
    v27.g = v27.typedat.toIntermediate(v28);
end;
v20.setDampingRatio = function(v29, v30) --[[ Line: 112 ]] --[[ Name: setDampingRatio ]]
    v29.d = v30;
end;
v20.setFrequency = function(v31, v32) --[[ Line: 116 ]] --[[ Name: setFrequency ]]
    v31.f = v32;
end;
v20.canSleep = function(v33) --[[ Line: 120 ]] --[[ Name: canSleep ]]
    local l_v_0 = v33.v;
    local v35 = 0;
    for _, v37 in l_v_0 do
        v35 = v35 + v37 ^ 2;
    end;
    if v35 > 1.0E-4 then
        return false;
    else
        l_v_0 = v33.p;
        v35 = v33.g;
        local v38 = 0;
        for v39, v40 in l_v_0 do
            v38 = v38 + (v35[v39] - v40) ^ 2;
        end;
        if v38 > 6.781684027777778E-8 then
            return false;
        else
            return true;
        end;
    end;
end;
v20.step = function(v41, v42) --[[ Line: 132 ]] --[[ Name: step ]]
    -- upvalues: l_exp_0 (copy), l_sqrt_0 (copy), l_cos_0 (copy), l_sin_0 (copy)
    local l_d_0 = v41.d;
    local v44 = v41.f * 6.283185307179586;
    local l_g_0 = v41.g;
    local l_p_0 = v41.p;
    local l_v_1 = v41.v;
    if l_d_0 == 1 then
        local v48 = l_exp_0(-v44 * v42);
        local v49 = v42 * v48;
        local v50 = v48 + v49 * v44;
        local v51 = v48 - v49 * v44;
        local v52 = v49 * v44 * v44;
        for v53 = 1, #l_p_0 do
            local v54 = l_p_0[v53] - l_g_0[v53];
            l_p_0[v53] = v54 * v50 + l_v_1[v53] * v49 + l_g_0[v53];
            l_v_1[v53] = l_v_1[v53] * v51 - v54 * v52;
        end;
    elseif l_d_0 < 1 then
        local v55 = l_exp_0(-l_d_0 * v44 * v42);
        local v56 = l_sqrt_0(1 - l_d_0 * l_d_0);
        local v57 = l_cos_0(v42 * v44 * v56);
        local v58 = l_sin_0(v42 * v44 * v56);
        local v59 = nil;
        if v56 > 1.0E-5 then
            v59 = v58 / v56;
        else
            local v60 = v42 * v44;
            v59 = v60 + (v60 * v60 * (v56 * v56) * (v56 * v56) / 20 - v56 * v56) * (v60 * v60 * v60) / 6;
        end;
        local v61 = nil;
        if v44 * v56 > 1.0E-5 then
            v61 = v58 / (v44 * v56);
        else
            local v62 = v44 * v56;
            v61 = v42 + (v42 * v42 * (v62 * v62) * (v62 * v62) / 20 - v62 * v62) * (v42 * v42 * v42) / 6;
        end;
        for v63 = 1, #l_p_0 do
            local v64 = l_p_0[v63] - l_g_0[v63];
            l_p_0[v63] = (v64 * (v57 + v59 * l_d_0) + l_v_1[v63] * v61) * v55 + l_g_0[v63];
            l_v_1[v63] = (l_v_1[v63] * (v57 - v59 * l_d_0) - v64 * (v59 * v44)) * v55;
        end;
    else
        local v65 = l_sqrt_0(l_d_0 * l_d_0 - 1);
        local v66 = -v44 * (l_d_0 + v65);
        local v67 = -v44 * (l_d_0 - v65);
        local v68 = l_exp_0(v66 * v42);
        local v69 = l_exp_0(v67 * v42);
        for v70 = 1, #l_p_0 do
            local v71 = l_p_0[v70] - l_g_0[v70];
            local v72 = (l_v_1[v70] - v71 * v66) / (2 * v44 * v65);
            local v73 = v68 * (v71 - v72);
            l_p_0[v70] = v73 + v72 * v69 + l_g_0[v70];
            l_v_1[v70] = v73 * v66 + v72 * v69 * v67;
        end;
    end;
    return v41.typedat.fromIntermediate(v41.p);
end;
local v74 = {};
v74.__index = v74;
v74.new = function(v75, v76, v77, v78) --[[ Line: 248 ]] --[[ Name: new ]]
    -- upvalues: v74 (copy)
    return (setmetatable({
        d = v75, 
        f = v76, 
        g = v78:Orthonormalize(), 
        p = v77:Orthonormalize(), 
        v = Vector3.new(0, 0, 0, 0)
    }, v74));
end;
v74.setGoal = function(v79, v80) --[[ Line: 261 ]] --[[ Name: setGoal ]]
    v79.g = v80:Orthonormalize();
end;
v74.setDampingRatio = function(v81, v82) --[[ Line: 265 ]] --[[ Name: setDampingRatio ]]
    v81.d = v82;
end;
v74.setFrequency = function(v83, v84) --[[ Line: 269 ]] --[[ Name: setFrequency ]]
    v83.f = v84;
end;
local function v87(v85, v86) --[[ Line: 274 ]] --[[ Name: dot ]]
    return v85.X * v86.X + v85.Y * v86.Y + v85.Z * v86.Z;
end;
local function v95(v88, v89) --[[ Line: 278 ]] --[[ Name: areRotationsClose ]]
    local l_XVector_0 = v88.XVector;
    local l_XVector_1 = v89.XVector;
    local v92 = l_XVector_0.X * l_XVector_1.X + l_XVector_0.Y * l_XVector_1.Y + l_XVector_0.Z * l_XVector_1.Z;
    l_XVector_1 = v88.YVector;
    local l_YVector_0 = v89.YVector;
    l_XVector_0 = l_XVector_1.X * l_YVector_0.X + l_XVector_1.Y * l_YVector_0.Y + l_XVector_1.Z * l_YVector_0.Z;
    l_YVector_0 = v88.ZVector;
    local l_ZVector_0 = v89.ZVector;
    l_XVector_1 = l_YVector_0.X * l_ZVector_0.X + l_YVector_0.Y * l_ZVector_0.Y + l_YVector_0.Z * l_ZVector_0.Z;
    return v92 + l_XVector_0 + l_XVector_1 > 2.9999999695382584;
end;
local function v103(v96, v97) --[[ Line: 286 ]] --[[ Name: angleDiff ]]
    -- upvalues: l_max_0 (copy), l_sqrt_0 (copy), l_atan2_0 (copy)
    local l_XVector_2 = v96.XVector;
    local l_XVector_3 = v97.XVector;
    local v100 = l_XVector_2.X * l_XVector_3.X + l_XVector_2.Y * l_XVector_3.Y + l_XVector_2.Z * l_XVector_3.Z;
    l_XVector_3 = v96.YVector;
    local l_YVector_1 = v97.YVector;
    l_XVector_2 = l_XVector_3.X * l_YVector_1.X + l_XVector_3.Y * l_YVector_1.Y + l_XVector_3.Z * l_YVector_1.Z;
    l_YVector_1 = v96.ZVector;
    local l_ZVector_1 = v97.ZVector;
    l_XVector_3 = l_YVector_1.X * l_ZVector_1.X + l_YVector_1.Y * l_ZVector_1.Y + l_YVector_1.Z * l_ZVector_1.Z;
    l_YVector_1 = v100 + l_XVector_2 + l_XVector_3 - 1;
    return (l_atan2_0(l_sqrt_0((l_max_0(0, 1 - l_YVector_1 * l_YVector_1 * 0.25))), l_YVector_1 * 0.5));
end;
local function v117(v104, v105) --[[ Line: 295 ]] --[[ Name: fromAxisAngle ]]
    -- upvalues: l_cos_0 (copy), l_sin_0 (copy)
    local v106 = l_cos_0(v105);
    local v107 = l_sin_0(v105);
    local l_X_0 = v104.X;
    local l_Y_0 = v104.Y;
    local l_Z_0 = v104.Z;
    local v111 = l_X_0 * l_Y_0 * (1 - v106);
    local v112 = l_Y_0 * l_Z_0 * (1 - v106);
    local v113 = l_Z_0 * l_X_0 * (1 - v106);
    local v114 = Vector3.new(l_X_0 * l_X_0 * (1 - v106) + v106, v111 + l_Z_0 * v107, v113 - l_Y_0 * v107);
    local v115 = Vector3.new(v111 - l_Z_0 * v107, l_Y_0 * l_Y_0 * (1 - v106) + v106, v112 + l_X_0 * v107);
    local v116 = Vector3.new(v113 + l_Y_0 * v107, v112 - l_X_0 * v107, l_Z_0 * l_Z_0 * (1 - v106) + v106);
    return CFrame.fromMatrix(Vector3.new(0, 0, 0, 0), v114, v115, v116):Orthonormalize();
end;
local l_v117_0 = v117 --[[ copy: 16 -> 27 ]];
local function v123(v119, v120) --[[ Line: 311 ]] --[[ Name: rotateAxis ]]
    -- upvalues: l_v117_0 (copy)
    local l_identity_0 = CFrame.identity;
    local l_Magnitude_0 = v119.Magnitude;
    if l_Magnitude_0 > 1.0E-6 then
        l_identity_0 = l_v117_0(v119.Unit, l_Magnitude_0);
    end;
    return l_identity_0 * v120;
end;
local l_v103_0 = v103 --[[ copy: 15 -> 28 ]];
local function v129(v125, v126) --[[ Line: 321 ]] --[[ Name: axisAngleDiff ]]
    -- upvalues: l_v103_0 (copy)
    local v127 = (v125 * v126:Inverse()):ToAxisAngle();
    local v128 = l_v103_0(v125, v126);
    return v127.Unit * v128;
end;
v74.canSleep = function(v130) --[[ Line: 330 ]] --[[ Name: canSleep ]]
    local l_p_1 = v130.p;
    local l_g_1 = v130.g;
    local l_XVector_4 = l_p_1.XVector;
    local l_XVector_5 = l_g_1.XVector;
    local v135 = l_XVector_4.X * l_XVector_5.X + l_XVector_4.Y * l_XVector_5.Y + l_XVector_4.Z * l_XVector_5.Z;
    l_XVector_5 = l_p_1.YVector;
    local l_YVector_2 = l_g_1.YVector;
    l_XVector_4 = l_XVector_5.X * l_YVector_2.X + l_XVector_5.Y * l_YVector_2.Y + l_XVector_5.Z * l_YVector_2.Z;
    l_YVector_2 = l_p_1.ZVector;
    local l_ZVector_2 = l_g_1.ZVector;
    l_XVector_5 = l_YVector_2.X * l_ZVector_2.X + l_YVector_2.Y * l_ZVector_2.Y + l_YVector_2.Z * l_ZVector_2.Z;
    local v138 = v135 + l_XVector_4 + l_XVector_5 > 2.9999999695382584;
    l_p_1 = v130.v.Magnitude < 0.0017453292519943296;
    return v138 and l_p_1;
end;
v74.step = function(v139, v140) --[[ Line: 336 ]] --[[ Name: step ]]
    -- upvalues: l_v103_0 (copy), l_exp_0 (copy), l_v117_0 (copy), l_sqrt_0 (copy), l_cos_0 (copy), l_sin_0 (copy)
    local l_d_1 = v139.d;
    local v142 = v139.f * 6.283185307179586;
    local l_g_2 = v139.g;
    local l_p_2 = v139.p;
    local l_v_2 = v139.v;
    local v146 = (l_p_2 * l_g_2:Inverse()):ToAxisAngle();
    local v147 = l_v103_0(l_p_2, l_g_2);
    local v148 = v146.Unit * v147;
    v146 = l_exp_0(-l_d_1 * v142 * v140);
    v147 = nil;
    local v149 = nil;
    if l_d_1 == 1 then
        local v150 = (v148 * (1 + v142 * v140) + l_v_2 * v140) * v146;
        local l_identity_1 = CFrame.identity;
        local l_Magnitude_1 = v150.Magnitude;
        if l_Magnitude_1 > 1.0E-6 then
            l_identity_1 = l_v117_0(v150.Unit, l_Magnitude_1);
        end;
        v147 = l_identity_1 * l_g_2;
        v149 = (l_v_2 * (1 - v140 * v142) - v148 * (v140 * v142 * v142)) * v146;
    elseif l_d_1 < 1 then
        local v153 = l_sqrt_0(1 - l_d_1 * l_d_1);
        local v154 = l_cos_0(v140 * v142 * v153);
        local v155 = l_sin_0(v140 * v142 * v153);
        local v156 = v155 / (v142 * v153);
        local v157 = v155 / v153;
        local v158 = (v148 * (v154 + v157 * l_d_1) + l_v_2 * v156) * v146;
        local l_identity_2 = CFrame.identity;
        local l_Magnitude_2 = v158.Magnitude;
        if l_Magnitude_2 > 1.0E-6 then
            l_identity_2 = l_v117_0(v158.Unit, l_Magnitude_2);
        end;
        v147 = l_identity_2 * l_g_2;
        v149 = (l_v_2 * (v154 - v157 * l_d_1) - v148 * (v157 * v142)) * v146;
    else
        local v161 = l_sqrt_0(l_d_1 * l_d_1 - 1);
        local v162 = -v142 * (l_d_1 + v161);
        local v163 = -v142 * (l_d_1 - v161);
        local v164 = (l_v_2 - v148 * v162) / (2 * v142 * v161);
        local v165 = (v148 - v164) * l_exp_0(v162 * v140);
        local v166 = v164 * l_exp_0(v163 * v140);
        local v167 = v165 + v166;
        local l_identity_3 = CFrame.identity;
        local l_Magnitude_3 = v167.Magnitude;
        if l_Magnitude_3 > 1.0E-6 then
            l_identity_3 = l_v117_0(v167.Unit, l_Magnitude_3);
        end;
        v147 = l_identity_3 * l_g_2;
        v149 = v165 * v162 + v166 * v163;
    end;
    v139.p = v147;
    v139.v = v149;
    return v147;
end;
v87 = {
    springType = v20.new, 
    toIntermediate = function(v170) --[[ Line: 392 ]] --[[ Name: toIntermediate ]]
        return {
            v170.X, 
            v170.Y, 
            v170.Z
        };
    end, 
    fromIntermediate = function(v171) --[[ Line: 396 ]] --[[ Name: fromIntermediate ]]
        return (Vector3.new(v171[1], v171[2], v171[3]));
    end
};
v95 = {};
v95.__index = v95;
v95.new = function(v172, v173, v174, v175, _) --[[ Line: 406 ]] --[[ Name: new ]]
    -- upvalues: v20 (copy), v87 (copy), v74 (copy), v95 (copy)
    return (setmetatable({
        rawGoal = v175, 
        _position = v20.new(v172, v173, v174.Position, v175.Position, v87), 
        _rotation = v74.new(v172, v173, v174.Rotation, v175.Rotation)
    }, v95));
end;
v95.setGoal = function(v177, v178) --[[ Line: 423 ]] --[[ Name: setGoal ]]
    v177.rawGoal = v178;
    v177._position:setGoal(v178.Position);
    v177._rotation:setGoal(v178.Rotation);
end;
v95.setDampingRatio = function(v179, v180) --[[ Line: 429 ]] --[[ Name: setDampingRatio ]]
    v179._position.d = v180;
    v179._rotation.d = v180;
end;
v95.setFrequency = function(v181, v182) --[[ Line: 434 ]] --[[ Name: setFrequency ]]
    v181._position.f = v182;
    v181._rotation.f = v182;
end;
v95.canSleep = function(v183) --[[ Line: 439 ]] --[[ Name: canSleep ]]
    return v183._position:canSleep() and v183._rotation:canSleep();
end;
v95.step = function(v184, v185) --[[ Line: 443 ]] --[[ Name: step ]]
    local v186 = v184._position:step(v185);
    return v184._rotation:step(v185) + v186;
end;
v103 = nil;
v117 = nil;
v123 = function(v187) --[[ Line: 454 ]] --[[ Name: inverseGammaCorrectD65 ]]
    return v187 < 0.0404482362771076 and v187 / 12.92 or 0.87941546140213 * (v187 + 0.055) ^ 2.4;
end;
v129 = function(v188) --[[ Line: 458 ]] --[[ Name: gammaCorrectD65 ]]
    return v188 < 0.0031306684425 and 12.92 * v188 or 1.055 * v188 ^ 0.4166666666666667 - 0.055;
end;
v103 = function(v189) --[[ Line: 462 ]] --[[ Name: rgbToLuv ]]
    local l_R_0 = v189.R;
    local l_G_0 = v189.G;
    local l_B_0 = v189.B;
    local l_l_R_0_0 = l_R_0;
    l_R_0 = l_l_R_0_0 < 0.0404482362771076 and l_l_R_0_0 / 12.92 or 0.87941546140213 * (l_l_R_0_0 + 0.055) ^ 2.4;
    l_l_R_0_0 = l_G_0;
    l_G_0 = l_l_R_0_0 < 0.0404482362771076 and l_l_R_0_0 / 12.92 or 0.87941546140213 * (l_l_R_0_0 + 0.055) ^ 2.4;
    l_l_R_0_0 = l_B_0;
    l_B_0 = l_l_R_0_0 < 0.0404482362771076 and l_l_R_0_0 / 12.92 or 0.87941546140213 * (l_l_R_0_0 + 0.055) ^ 2.4;
    l_l_R_0_0 = 0.9257063972951867 * l_R_0 - 0.8333736323779866 * l_G_0 - 0.09209820666085898 * l_B_0;
    local v194 = 0.2125862307855956 * l_R_0 + 0.7151703037034108 * l_G_0 + 0.0722004986433362 * l_B_0;
    local v195 = 3.6590806972265884 * l_R_0 + 11.442689580057424 * l_G_0 + 4.114991502426484 * l_B_0;
    local v196 = v194 > 0.008856451679035631 and 116 * v194 ^ 0.3333333333333333 - 16 or 903.296296296296 * v194;
    local v197 = nil;
    local v198 = nil;
    if v195 > 1.0E-14 then
        v197 = v196 * l_l_R_0_0 / v195;
        v198 = v196 * (9 * v194 / v195 - 0.46832);
    else
        v197 = -0.19783 * v196;
        v198 = -0.46832 * v196;
    end;
    return {
        v196, 
        v197, 
        v198
    };
end;
v117 = function(v199) --[[ Line: 491 ]] --[[ Name: luvToRgb ]]
    -- upvalues: l_min_0 (copy)
    local v200 = v199[1];
    if v200 < 0.0197955 then
        return Color3.new(0, 0, 0);
    else
        local v201 = v199[2] / v200 + 0.19783;
        local v202 = v199[3] / v200 + 0.46832;
        local v203 = (v200 + 16) / 116;
        v203 = v203 > 0.20689655172413793 and v203 * v203 * v203 or v203 * 0.12841854934601665 - 0.01771290335807126;
        local v204 = v203 * v201 / v202;
        local v205 = v203 * ((3 - v201 * 0.75) / v202 - 5);
        local v206 = v204 * 7.2914074 - v203 * 1.537208 - v205 * 0.4986286;
        local v207 = v204 * -2.180094 + v203 * 1.8757561 + v205 * 0.0415175;
        local v208 = v204 * 0.1253477 - v203 * 0.2040211 + v205 * 1.0569959;
        if v206 < 0 and v206 < v207 and v206 < v208 then
            local v209 = 0;
            v207 = v207 - v206;
            v208 = v208 - v206;
            v206 = v209;
        elseif v207 < 0 and v207 < v208 then
            v206 = v206 - v207;
            local v210 = 0;
            v208 = v208 - v207;
            v207 = v210;
        elseif v208 < 0 then
            v206 = v206 - v208;
            v207 = v207 - v208;
            v208 = 0;
        end;
        local l_new_0 = Color3.new;
        local l_v206_0 = v206;
        local v213 = l_min_0(l_v206_0 < 0.0031306684425 and 12.92 * l_v206_0 or 1.055 * l_v206_0 ^ 0.4166666666666667 - 0.055, 1);
        local l_v207_0 = v207;
        local v215 = l_min_0(l_v207_0 < 0.0031306684425 and 12.92 * l_v207_0 or 1.055 * l_v207_0 ^ 0.4166666666666667 - 0.055, 1);
        local l_v208_0 = v208;
        return l_new_0(v213, v215, (l_min_0(l_v208_0 < 0.0031306684425 and 12.92 * l_v208_0 or 1.055 * l_v208_0 ^ 0.4166666666666667 - 0.055, 1)));
    end;
end;
v123 = {
    boolean = {
        springType = v20.new, 
        toIntermediate = function(v217) --[[ Line: 537 ]] --[[ Name: toIntermediate ]]
            return {
                v217 and 1 or 0
            };
        end, 
        fromIntermediate = function(v218) --[[ Line: 541 ]] --[[ Name: fromIntermediate ]]
            return v218[1] >= 0.5;
        end
    }, 
    number = {
        springType = v20.new, 
        toIntermediate = function(v219) --[[ Line: 549 ]] --[[ Name: toIntermediate ]]
            return {
                v219
            };
        end, 
        fromIntermediate = function(v220) --[[ Line: 553 ]] --[[ Name: fromIntermediate ]]
            return v220[1];
        end
    }, 
    NumberRange = {
        springType = v20.new, 
        toIntermediate = function(v221) --[[ Line: 561 ]] --[[ Name: toIntermediate ]]
            return {
                v221.Min, 
                v221.Max
            };
        end, 
        fromIntermediate = function(v222) --[[ Line: 565 ]] --[[ Name: fromIntermediate ]]
            return NumberRange.new(v222[1], v222[2]);
        end
    }, 
    UDim = {
        springType = v20.new, 
        toIntermediate = function(v223) --[[ Line: 573 ]] --[[ Name: toIntermediate ]]
            return {
                v223.Scale, 
                v223.Offset
            };
        end, 
        fromIntermediate = function(v224) --[[ Line: 577 ]] --[[ Name: fromIntermediate ]]
            -- upvalues: l_round_0 (copy)
            return UDim.new(v224[1], (l_round_0(v224[2])));
        end
    }, 
    UDim2 = {
        springType = v20.new, 
        toIntermediate = function(v225) --[[ Line: 585 ]] --[[ Name: toIntermediate ]]
            local l_X_1 = v225.X;
            local l_Y_1 = v225.Y;
            return {
                l_X_1.Scale, 
                l_X_1.Offset, 
                l_Y_1.Scale, 
                l_Y_1.Offset
            };
        end, 
        fromIntermediate = function(v228) --[[ Line: 591 ]] --[[ Name: fromIntermediate ]]
            -- upvalues: l_round_0 (copy)
            return UDim2.new(v228[1], l_round_0(v228[2]), v228[3], (l_round_0(v228[4])));
        end
    }, 
    Vector2 = {
        springType = v20.new, 
        toIntermediate = function(v229) --[[ Line: 599 ]] --[[ Name: toIntermediate ]]
            return {
                v229.X, 
                v229.Y
            };
        end, 
        fromIntermediate = function(v230) --[[ Line: 603 ]] --[[ Name: fromIntermediate ]]
            return Vector2.new(v230[1], v230[2]);
        end
    }, 
    Vector3 = v87, 
    Color3 = {
        springType = v20.new, 
        toIntermediate = v103, 
        fromIntermediate = v117
    }, 
    ColorSequence = {
        springType = v20.new, 
        toIntermediate = function(v231) --[[ Line: 620 ]] --[[ Name: toIntermediate ]]
            -- upvalues: v103 (ref)
            local l_Keypoints_0 = v231.Keypoints;
            local v233 = v103(l_Keypoints_0[1].Value);
            local v234 = v103(l_Keypoints_0[#l_Keypoints_0].Value);
            return {
                v233[1], 
                v233[2], 
                v233[3], 
                v234[1], 
                v234[2], 
                v234[3]
            };
        end, 
        fromIntermediate = function(v235) --[[ Line: 632 ]] --[[ Name: fromIntermediate ]]
            -- upvalues: v117 (ref)
            return ColorSequence.new(v117({
                v235[1], 
                v235[2], 
                v235[3]
            }), v117({
                v235[4], 
                v235[5], 
                v235[6]
            }));
        end
    }, 
    CFrame = {
        springType = v95.new, 
        toIntermediate = error, 
        fromIntermediate = error
    }
};
v129 = {
    Pivot = {
        class = "PVInstance", 
        get = function(v236) --[[ Line: 658 ]] --[[ Name: get ]]
            return v236:GetPivot();
        end, 
        set = function(v237, v238) --[[ Line: 661 ]] --[[ Name: set ]]
            v237:PivotTo(v238);
        end
    }, 
    Scale = {
        class = "Model", 
        get = function(v239) --[[ Line: 667 ]] --[[ Name: get ]]
            return v239:GetScale();
        end, 
        set = function(v240, v241) --[[ Line: 670 ]] --[[ Name: set ]]
            v240:ScaleTo((math.clamp(v241, 1.402E-45, 16777216)));
        end
    }
};
local function _(v242, v243) --[[ Line: 679 ]] --[[ Name: getProperty ]]
    -- upvalues: v129 (copy)
    local v244 = v129[v243];
    if v244 and v242:IsA(v244.class) then
        return v244.get(v242);
    else
        return v242[v243];
    end;
end;
local function _(v246, v247, v248) --[[ Line: 688 ]] --[[ Name: setProperty ]]
    -- upvalues: v129 (copy)
    local v249 = v129[v247];
    if v249 and v246:IsA(v249.class) then
        v249.set(v246, v248);
        return;
    else
        v246[v247] = v248;
        return;
    end;
end;
local v251 = {};
local v252 = {};
local v253 = {};
local function v267(v254, v255) --[[ Line: 702 ]] --[[ Name: processSprings ]]
    -- upvalues: v129 (copy), v253 (copy)
    for v256, v257 in v254 do
        for v258, v259 in v257 do
            if v259:canSleep() then
                v257[v258] = nil;
                local l_rawGoal_0 = v259.rawGoal;
                local v261 = v129[v258];
                if v261 and v256:IsA(v261.class) then
                    v261.set(v256, l_rawGoal_0);
                else
                    v256[v258] = l_rawGoal_0;
                end;
            else
                local v262 = v259:step(v255);
                local v263 = v129[v258];
                if v263 and v256:IsA(v263.class) then
                    v263.set(v256, v262);
                else
                    v256[v258] = v262;
                end;
            end;
        end;
        if not next(v257) then
            v254[v256] = nil;
            local v264 = v253[v256];
            if v264 then
                v253[v256] = nil;
                for _, v266 in v264 do
                    task.spawn(v266);
                end;
            end;
        end;
    end;
end;
l_RunService_0.PreSimulation:Connect(function(v268) --[[ Line: 731 ]]
    -- upvalues: v267 (copy), v251 (copy)
    v267(v251, v268);
end);
l_RunService_0.PostSimulation:Connect(function(v269) --[[ Line: 735 ]]
    -- upvalues: v267 (copy), v252 (copy)
    v267(v252, v269);
end);
local function _(v270, v271, v272, v273) --[[ Line: 739 ]] --[[ Name: assertType ]]
    if not v272:find((typeof(v273))) then
        error(("bad argument #%* to %* (%* expected, got %*)"):format(v270, v271, v272, (typeof(v273))), 3);
    end;
end;
local v292 = {
    target = function(v275, v276, v277, v278) --[[ Line: 748 ]] --[[ Name: target ]]
        -- upvalues: v252 (copy), v251 (copy), v129 (copy), v123 (copy)
        if not ("Instance"):find((typeof(v275))) then
            error(("bad argument #%* to spr.target (Instance expected, got %*)"):format(1, (typeof(v275))), 3);
        end;
        if not ("number"):find((typeof(v276))) then
            error(("bad argument #%* to spr.target (number expected, got %*)"):format(2, (typeof(v276))), 3);
        end;
        if not ("number"):find((typeof(v277))) then
            error(("bad argument #%* to spr.target (number expected, got %*)"):format(3, (typeof(v277))), 3);
        end;
        if not ("table"):find((typeof(v278))) then
            error(("bad argument #%* to spr.target (table expected, got %*)"):format(4, (typeof(v278))), 3);
        end;
        if v276 ~= v276 or v276 < 0 then
            error(("expected damping ratio >= 0; got %.2f"):format(v276), 2);
        end;
        if v277 ~= v277 or v277 < 0 then
            error(("expected undamped frequency >= 0; got %.2f"):format(v277), 2);
        end;
        local v279 = if v275:IsA("Camera") then v252 else v251;
        local v280 = v279[v275];
        if not v280 then
            v280 = {};
            v279[v275] = v280;
        end;
        for v281, v282 in v278 do
            local v283 = v129[v281];
            local v284 = if v283 and v275:IsA(v283.class) then v283.get(v275) else v275[v281];
            if typeof(v282) ~= typeof(v284) then
                error(("bad property %* to spr.target (%* expected, got %*)"):format(v281, typeof(v284), (typeof(v282))), 2);
            end;
            if v277 == 1e999 then
                v283 = v129[v281];
                if v283 and v275:IsA(v283.class) then
                    v283.set(v275, v282);
                else
                    v275[v281] = v282;
                end;
                v280[v281] = nil;
            else
                v283 = v280[v281];
                if not v283 then
                    local v285 = v123[typeof(v282)];
                    if not v285 then
                        error("unsupported type: " .. typeof(v282), 2);
                    end;
                    v283 = v285.springType(v276, v277, v284, v282, v285);
                    v280[v281] = v283;
                end;
                v283:setGoal(v282);
                v283:setDampingRatio(v276);
                v283:setFrequency(v277);
            end;
        end;
        if not next(v280) then
            v279[v275] = nil;
        end;
    end, 
    stop = function(v286, v287) --[[ Line: 807 ]] --[[ Name: stop ]]
        -- upvalues: v251 (copy), v252 (copy)
        if not ("Instance"):find((typeof(v286))) then
            error(("bad argument #%* to spr.stop (Instance expected, got %*)"):format(1, (typeof(v286))), 3);
        end;
        if not ("string|nil"):find((typeof(v287))) then
            error(("bad argument #%* to spr.stop (string|nil expected, got %*)"):format(2, (typeof(v287))), 3);
        end;
        if v287 then
            local v288 = v251[v286] or v252[v286];
            if v288 then
                v288[v287] = nil;
                return;
            end;
        else
            v251[v286] = nil;
            v252[v286] = nil;
        end;
    end, 
    completed = function(v289, v290) --[[ Line: 824 ]] --[[ Name: completed ]]
        -- upvalues: v253 (copy)
        if not ("Instance"):find((typeof(v289))) then
            error(("bad argument #%* to spr.completed (Instance expected, got %*)"):format(1, (typeof(v289))), 3);
        end;
        if not ("function"):find((typeof(v290))) then
            error(("bad argument #%* to spr.completed (function expected, got %*)"):format(2, (typeof(v290))), 3);
        end;
        local v291 = v253[v289];
        if v291 then
            table.insert(v291, v290);
            return;
        else
            v253[v289] = {
                v290
            };
            return;
        end;
    end
};
return table.freeze(v292);