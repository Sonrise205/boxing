local v0 = require(script.Parent.CameraShakeInstance);
local v38 = {
    Anticipate = function() --[[ Line: 22 ]] --[[ Name: Anticipate ]]
        -- upvalues: v0 (copy)
        local v1 = v0.new(3, 5, 1.5, 0.1);
        v1.PositionInfluence = Vector3.new(0.02500000037252903, 0.02500000037252903, 0.02500000037252903, 0);
        v1.RotationInfluence = Vector3.new(3, 1.149999976158142, 1.149999976158142, 0);
        return v1;
    end, 
    Anticipate2 = function() --[[ Line: 29 ]] --[[ Name: Anticipate2 ]]
        -- upvalues: v0 (copy)
        local v2 = v0.new(4, 7, 1.5, 2.001);
        v2.PositionInfluence = Vector3.new(0.02500000037252903, 0.02500000037252903, 0.02500000037252903, 0);
        v2.RotationInfluence = Vector3.new(3, 1.149999976158142, 1.149999976158142, 0);
        return v2;
    end, 
    M1 = function() --[[ Line: 37 ]] --[[ Name: M1 ]]
        -- upvalues: v0 (copy)
        local v3 = v0.new(1.25, 2, 0.05, 0.405);
        v3.PositionInfluence = Vector3.new(0.004999999888241291, 0.004999999888241291, 0.004999999888241291, 0);
        v3.RotationInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        return v3;
    end, 
    Bump1 = function() --[[ Line: 44 ]] --[[ Name: Bump1 ]]
        -- upvalues: v0 (copy)
        local v4 = v0.new(2, 4, 0.1, 0.75);
        v4.PositionInfluence = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
        v4.RotationInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        return v4;
    end, 
    Bump0 = function() --[[ Line: 51 ]] --[[ Name: Bump0 ]]
        -- upvalues: v0 (copy)
        local v5 = v0.new(2.5, 4, 0.1, 0.75);
        v5.PositionInfluence = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
        v5.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v5;
    end, 
    Bump = function() --[[ Line: 58 ]] --[[ Name: Bump ]]
        -- upvalues: v0 (copy)
        local v6 = v0.new(2.5, 4, 0.1, 0.75);
        v6.PositionInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
        v6.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v6;
    end, 
    Bump2 = function() --[[ Line: 65 ]] --[[ Name: Bump2 ]]
        -- upvalues: v0 (copy)
        local v7 = v0.new(2.5, 4, 0.1, 0.75);
        v7.PositionInfluence = Vector3.new(0.3499999940395355, 0.3499999940395355, 0.3499999940395355, 0);
        v7.RotationInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        return v7;
    end, 
    Bump001 = function() --[[ Line: 72 ]] --[[ Name: Bump001 ]]
        -- upvalues: v0 (copy)
        local v8 = v0.new(1.67, 7, 0.05, 0.25);
        v8.PositionInfluence = Vector3.new(0.014999999664723873, 0.014999999664723873, 0.014999999664723873, 0);
        v8.RotationInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        return v8;
    end, 
    Bump01 = function() --[[ Line: 79 ]] --[[ Name: Bump01 ]]
        -- upvalues: v0 (copy)
        local v9 = v0.new(1.67, 7, 0.5, 0.5);
        v9.PositionInfluence = Vector3.new(0.014999999664723873, 0.014999999664723873, 0.014999999664723873, 0);
        v9.RotationInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        return v9;
    end, 
    Bump02 = function() --[[ Line: 86 ]] --[[ Name: Bump02 ]]
        -- upvalues: v0 (copy)
        local v10 = v0.new(2.5, 8, 0.75, 0.1);
        v10.PositionInfluence = Vector3.new(0.3499999940395355, 0.3499999940395355, 0.3499999940395355, 0);
        v10.RotationInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        return v10;
    end, 
    Bump3 = function() --[[ Line: 93 ]] --[[ Name: Bump3 ]]
        -- upvalues: v0 (copy)
        local v11 = v0.new(2.5, 10, 0.1, 0.75);
        v11.PositionInfluence = Vector3.new(0.3499999940395355, 0.3499999940395355, 0.3499999940395355, 0);
        v11.RotationInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        return v11;
    end, 
    Bump4 = function() --[[ Line: 100 ]] --[[ Name: Bump4 ]]
        -- upvalues: v0 (copy)
        local v12 = v0.new(2, 5, 0, 1);
        v12.PositionInfluence = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0);
        v12.RotationInfluence = Vector3.new(3, 1, 1, 0);
        return v12;
    end, 
    M2 = function() --[[ Line: 107 ]] --[[ Name: M2 ]]
        -- upvalues: v0 (copy)
        local v13 = v0.new(2, 5, 0.5, 0.75);
        v13.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v13.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v13;
    end, 
    DownSlam = function() --[[ Line: 114 ]] --[[ Name: DownSlam ]]
        -- upvalues: v0 (copy)
        local v14 = v0.new(2, 5, 0.5, 0.75);
        v14.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v14.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v14;
    end, 
    UpperCut = function() --[[ Line: 121 ]] --[[ Name: UpperCut ]]
        -- upvalues: v0 (copy)
        local v15 = v0.new(2, 5, 0.5, 0.75);
        v15.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v15.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v15;
    end, 
    Shake = function() --[[ Line: 128 ]] --[[ Name: Shake ]]
        -- upvalues: v0 (copy)
        local v16 = v0.new(2.5, 5, 0.1, 0.75);
        v16.PositionInfluence = Vector3.new(0.4000000059604645, 0.46000000834465027, 0.46000000834465027, 0);
        v16.RotationInfluence = Vector3.new(1, 1.5, 1.5, 0);
        return v16;
    end, 
    ShootRevl = function() --[[ Line: 135 ]] --[[ Name: ShootRevl ]]
        -- upvalues: v0 (copy)
        local v17 = v0.new(8.5, 15, 0.0075, 0.25);
        v17.PositionInfluence = Vector3.new(0.4000000059604645, 0.46000000834465027, 0.46000000834465027, 0);
        v17.RotationInfluence = Vector3.new(1, 1.5, 1.5, 0);
        return v17;
    end, 
    Shake2 = function() --[[ Line: 142 ]] --[[ Name: Shake2 ]]
        -- upvalues: v0 (copy)
        local v18 = v0.new(3, 8, 0, 1.15);
        v18.PositionInfluence = Vector3.new(0.44999998807907104, 0.36000001430511475, 0.30000001192092896, 0);
        v18.RotationInfluence = Vector3.new(1, 0.5, 0.5, 0);
        return v18;
    end, 
    SmallUpShake = function() --[[ Line: 149 ]] --[[ Name: SmallUpShake ]]
        -- upvalues: v0 (copy)
        local v19 = v0.new(2.5, 10, 0.1, 0.75);
        v19.PositionInfluence = Vector3.new(0, 0.15000000596046448, 0, 0);
        v19.RotationInfluence = Vector3.new(0, 0.15000000596046448, 0, 0);
        return v19;
    end, 
    MedUpShake = function() --[[ Line: 156 ]] --[[ Name: MedUpShake ]]
        -- upvalues: v0 (copy)
        local v20 = v0.new(2.5, 15, 0.1, 0.75);
        v20.PositionInfluence = Vector3.new(0.25, 0.5, 0.25, 0);
        v20.RotationInfluence = Vector3.new(0.25, 0.5, 0.25, 0);
        return v20;
    end, 
    BigBump = function() --[[ Line: 164 ]] --[[ Name: BigBump ]]
        -- upvalues: v0 (copy)
        local v21 = v0.new(2.5, 4, 0.1, 0.75);
        v21.PositionInfluence = Vector3.new(0.800000011920929, 0.800000011920929, 0.800000011920929, 0);
        v21.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v21;
    end, 
    SmallBump = function() --[[ Line: 171 ]] --[[ Name: SmallBump ]]
        -- upvalues: v0 (copy)
        local v22 = v0.new(2.5, 4, 0.1, 0.75);
        v22.PositionInfluence = Vector3.new(0.009999999776482582, 0.009999999776482582, 0.009999999776482582, 0);
        v22.RotationInfluence = Vector3.new(0.5, 0.5, 0.5, 0);
        return v22;
    end, 
    SmallestBump = function() --[[ Line: 178 ]] --[[ Name: SmallestBump ]]
        -- upvalues: v0 (copy)
        local v23 = v0.new(1.25, 2, 0.05, 0.405);
        v23.PositionInfluence = Vector3.new(0.004999999888241291, 0.004999999888241291, 0.004999999888241291, 0);
        v23.RotationInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        return v23;
    end, 
    Loop = function() --[[ Line: 185 ]] --[[ Name: Loop ]]
        -- upvalues: v0 (copy)
        local v24 = v0.new(0.5, 1, 0.05, 0.35);
        v24.PositionInfluence = Vector3.new(0.009999999776482582, 0.009999999776482582, 0.009999999776482582, 0);
        v24.RotationInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        return v24;
    end, 
    Explosion = function() --[[ Line: 194 ]] --[[ Name: Explosion ]]
        -- upvalues: v0 (copy)
        local v25 = v0.new(5, 10, 0, 1.5);
        v25.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v25.RotationInfluence = Vector3.new(4, 1, 1, 0);
        return v25;
    end, 
    BumpRemaked = function() --[[ Line: 201 ]] --[[ Name: BumpRemaked ]]
        -- upvalues: v0 (copy)
        local v26 = v0.new(2, 5, 0, 1);
        v26.PositionInfluence = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0);
        v26.RotationInfluence = Vector3.new(3, 1, 1, 0);
        return v26;
    end, 
    BigExplosion = function() --[[ Line: 208 ]] --[[ Name: BigExplosion ]]
        -- upvalues: v0 (copy)
        local v27 = v0.new(20, 40, 0, 2);
        v27.PositionInfluence = Vector3.new(0.550000011920929, 0.550000011920929, 0.550000011920929, 0);
        v27.RotationInfluence = Vector3.new(5, 2, 2, 0);
        return v27;
    end, 
    ReallyBigExplosion = function() --[[ Line: 215 ]] --[[ Name: ReallyBigExplosion ]]
        -- upvalues: v0 (copy)
        local v28 = v0.new(30, 50, 0, 1.5);
        v28.PositionInfluence = Vector3.new(1, 1, 1, 0);
        v28.RotationInfluence = Vector3.new(5, 2, 2, 0);
        return v28;
    end, 
    SmallExplosion = function() --[[ Line: 222 ]] --[[ Name: SmallExplosion ]]
        -- upvalues: v0 (copy)
        local v29 = v0.new(5, 10, 0, 1.5);
        v29.PositionInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
        v29.RotationInfluence = Vector3.new(4, 1, 1, 0);
        return v29;
    end, 
    SmallerExplosion = function() --[[ Line: 229 ]] --[[ Name: SmallerExplosion ]]
        -- upvalues: v0 (copy)
        local v30 = v0.new(5, 12, 0, 1.15);
        v30.PositionInfluence = Vector3.new(0.125, 0.125, 0.125, 0);
        v30.RotationInfluence = Vector3.new(3, 1.5, 1.5, 0);
        return v30;
    end, 
    White_Cero_Explosion = function() --[[ Line: 236 ]] --[[ Name: White_Cero_Explosion ]]
        -- upvalues: v0 (copy)
        local v31 = v0.new(3, 9, 0, 2.15);
        v31.PositionInfluence = Vector3.new(0.02500000037252903, 0.02500000037252903, 0.02500000037252903, 0);
        v31.RotationInfluence = Vector3.new(3, 1.149999976158142, 1.149999976158142, 0);
        return v31;
    end, 
    ExplosionNormal = function() --[[ Line: 244 ]] --[[ Name: ExplosionNormal ]]
        -- upvalues: v0 (copy)
        local v32 = v0.new(5, 10, 0, 1.5);
        v32.PositionInfluence = Vector3.new(3, 3, 3, 0);
        v32.RotationInfluence = Vector3.new(4, 1, 1, 0);
        return v32;
    end, 
    Earthquake = function() --[[ Line: 252 ]] --[[ Name: Earthquake ]]
        -- upvalues: v0 (copy)
        local v33 = v0.new(0.6, 3.5, 2, 10);
        v33.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v33.RotationInfluence = Vector3.new(1, 1, 4, 0);
        return v33;
    end, 
    BadTrip = function() --[[ Line: 262 ]] --[[ Name: BadTrip ]]
        -- upvalues: v0 (copy)
        local v34 = v0.new(10, 0.15, 5, 10);
        v34.PositionInfluence = Vector3.new(0, 0, 0.15000000596046448, 0);
        v34.RotationInfluence = Vector3.new(2, 1, 4, 0);
        return v34;
    end, 
    HandheldCamera = function() --[[ Line: 272 ]] --[[ Name: HandheldCamera ]]
        -- upvalues: v0 (copy)
        local v35 = v0.new(1, 0.25, 5, 10);
        v35.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v35.RotationInfluence = Vector3.new(1, 0.5, 0.5, 0);
        return v35;
    end, 
    Vibration = function() --[[ Line: 282 ]] --[[ Name: Vibration ]]
        -- upvalues: v0 (copy)
        local v36 = v0.new(0.4, 20, 2, 2);
        v36.PositionInfluence = Vector3.new(0, 0.15000000596046448, 0, 0);
        v36.RotationInfluence = Vector3.new(1.25, 0, 4, 0);
        return v36;
    end, 
    RoughDriving = function() --[[ Line: 292 ]] --[[ Name: RoughDriving ]]
        -- upvalues: v0 (copy)
        local v37 = v0.new(1, 2, 1, 1);
        v37.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v37.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v37;
    end
};
return (setmetatable({}, {
    __index = function(_, v40) --[[ Line: 303 ]] --[[ Name: __index ]]
        -- upvalues: v38 (copy)
        local v41 = v38[v40];
        if type(v41) == "function" then
            return v41();
        else
            error("No preset found with index \"" .. v40 .. "\"");
            return;
        end;
    end
}));