local v0 = require(script.Parent.CameraShakeInstance);
local v37 = {
    HardHitRoll = function() --[[ Line: 25 ]] --[[ Name: HardHitRoll ]]
        -- upvalues: v0 (copy)
        local v1 = v0.new(12, 4, 0, 1.5);
        v1.PositionInfluence = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896, 0);
        v1.RotationInfluence = Vector3.new(4.5, 1.0499999523162842, 1.0499999523162842, 0);
        return v1;
    end, 
    Knockdown = function() --[[ Line: 32 ]] --[[ Name: Knockdown ]]
        -- upvalues: v0 (copy)
        local v2 = v0.new(7, 10, 0, 1.5);
        v2.PositionInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
        v2.RotationInfluence = Vector3.new(2.25, 0.5249999761581421, 0.5249999761581421, 0);
        return v2;
    end, 
    SuperHardHit = function() --[[ Line: 39 ]] --[[ Name: SuperHardHit ]]
        -- upvalues: v0 (copy)
        local v3 = v0.new(9, 11, 0, 1.5);
        v3.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v3.RotationInfluence = Vector3.new(1.5, 0.3499999940395355, 0.3499999940395355, 0);
        return v3;
    end, 
    HardHit2 = function() --[[ Line: 46 ]] --[[ Name: HardHit2 ]]
        -- upvalues: v0 (copy)
        local v4 = v0.new(8, 8, 0, 1.5);
        v4.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v4.RotationInfluence = Vector3.new(1.5, 0.3499999940395355, 0.3499999940395355, 0);
        return v4;
    end, 
    MedHit2 = function() --[[ Line: 53 ]] --[[ Name: MedHit2 ]]
        -- upvalues: v0 (copy)
        local v5 = v0.new(5, 4, 0, 0.1);
        v5.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v5.RotationInfluence = Vector3.new(1.5, 0.3499999940395355, 0.3499999940395355, 0);
        return v5;
    end, 
    HardHit = function() --[[ Line: 60 ]] --[[ Name: HardHit ]]
        -- upvalues: v0 (copy)
        local v6 = v0.new(7, 10, 0, 1.5);
        v6.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v6.RotationInfluence = Vector3.new(1.5, 0.3499999940395355, 0.3499999940395355, 0);
        return v6;
    end, 
    MedHit = function() --[[ Line: 67 ]] --[[ Name: MedHit ]]
        -- upvalues: v0 (copy)
        local v7 = v0.new(5, 7, 0, 1.5);
        v7.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v7.RotationInfluence = Vector3.new(1.5, 0.3499999940395355, 0.3499999940395355, 0);
        return v7;
    end, 
    MediumHit = function() --[[ Line: 74 ]] --[[ Name: MediumHit ]]
        -- upvalues: v0 (copy)
        local v8 = v0.new(4, 6, 0, 1.5);
        v8.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v8.RotationInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        return v8;
    end, 
    Hawk3 = function() --[[ Line: 81 ]] --[[ Name: Hawk3 ]]
        -- upvalues: v0 (copy)
        local v9 = v0.new(4.5, 4, 0, 0.1);
        v9.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v9.RotationInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        return v9;
    end, 
    Hawk2 = function() --[[ Line: 88 ]] --[[ Name: Hawk2 ]]
        -- upvalues: v0 (copy)
        local v10 = v0.new(3.25, 4, 0, 0.1);
        v10.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v10.RotationInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        return v10;
    end, 
    LightHit = function() --[[ Line: 97 ]] --[[ Name: LightHit ]]
        -- upvalues: v0 (copy)
        local v11 = v0.new(2, 4, 0, 0.1);
        v11.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v11.RotationInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        return v11;
    end, 
    SuperLight = function() --[[ Line: 104 ]] --[[ Name: SuperLight ]]
        -- upvalues: v0 (copy)
        local v12 = v0.new(2, 4, 0, 0.1);
        v12.PositionInfluence = Vector3.new(0.07999999821186066, 0.07999999821186066, 0.07999999821186066, 0);
        v12.RotationInfluence = Vector3.new(0.07999999821186066, 0.07999999821186066, 0.07999999821186066, 0);
        return v12;
    end, 
    ApeMain = function() --[[ Line: 113 ]] --[[ Name: ApeMain ]]
        -- upvalues: v0 (copy)
        local v13 = v0.new(5, 10, 0, 1.5);
        v13.PositionInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
        v13.RotationInfluence = Vector3.new(2.25, 0.5249999761581421, 0.5249999761581421, 0);
        return v13;
    end, 
    Stomp = function() --[[ Line: 122 ]] --[[ Name: Stomp ]]
        -- upvalues: v0 (copy)
        local v14 = v0.new(6, 4, 0, 0.1);
        v14.PositionInfluence = Vector3.new(0.0833333283662796, 0.0833333283662796, 0.0833333283662796, 0);
        v14.RotationInfluence = Vector3.new(0.0833333283662796, 0.0833333283662796, 0.0833333283662796, 0);
        return v14;
    end, 
    PunchBasic = function() --[[ Line: 131 ]] --[[ Name: PunchBasic ]]
        -- upvalues: v0 (copy)
        local v15 = v0.new(10, 1, 0.1, 0.1);
        v15.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v15.RotationInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        return v15;
    end, 
    Bump = function() --[[ Line: 141 ]] --[[ Name: Bump ]]
        -- upvalues: v0 (copy)
        local v16 = v0.new(2.5, 4, 0.1, 0.75);
        v16.PositionInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
        v16.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v16;
    end, 
    Bomb = function() --[[ Line: 150 ]] --[[ Name: Bomb ]]
        -- upvalues: v0 (copy)
        local v17 = v0.new(4, 8, 0, 1.5);
        v17.PositionInfluence = Vector3.new(0.22727271914482117, 0.22727271914482117, 0.22727271914482117, 0);
        v17.RotationInfluence = Vector3.new(1.8181817531585693, 0.9090908765792847, 0.9090908765792847, 0);
        return v17;
    end, 
    LessBomb = function() --[[ Line: 159 ]] --[[ Name: LessBomb ]]
        -- upvalues: v0 (copy)
        local v18 = v0.new(3.5, 7, 0, 1.5);
        v18.PositionInfluence = Vector3.new(0.1666666716337204, 0.1666666716337204, 0.1666666716337204, 0);
        v18.RotationInfluence = Vector3.new(1.3333333730697632, 0.6666666865348816, 0.6666666865348816, 0);
        return v18;
    end, 
    Explosion = function() --[[ Line: 168 ]] --[[ Name: Explosion ]]
        -- upvalues: v0 (copy)
        local v19 = v0.new(5, 10, 0, 1.5);
        v19.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v19.RotationInfluence = Vector3.new(4, 1, 1, 0);
        return v19;
    end, 
    RoshiWave = function() --[[ Line: 177 ]] --[[ Name: RoshiWave ]]
        -- upvalues: v0 (copy)
        local v20 = v0.new(15, 15, 0, 1.5);
        v20.PositionInfluence = Vector3.new(1, 1, 1, 0);
        v20.RotationInfluence = Vector3.new(4, 2, 2, 0);
        return v20;
    end, 
    Earthquake = function() --[[ Line: 186 ]] --[[ Name: Earthquake ]]
        -- upvalues: v0 (copy)
        local v21 = v0.new(0.6, 3.5, 2, 10);
        v21.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v21.RotationInfluence = Vector3.new(1, 1, 4, 0);
        return v21;
    end, 
    BadTrip = function() --[[ Line: 195 ]] --[[ Name: BadTrip ]]
        -- upvalues: v0 (copy)
        local v22 = v0.new(10, 0.15, 5, 10);
        v22.PositionInfluence = Vector3.new(0, 0, 0.15000000596046448, 0);
        v22.RotationInfluence = Vector3.new(2, 1, 4, 0);
        return v22;
    end, 
    Dizzy = function() --[[ Line: 204 ]] --[[ Name: Dizzy ]]
        -- upvalues: v0 (copy)
        local v23 = v0.new(4.5, 0.15, 5, 10);
        v23.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v23.RotationInfluence = Vector3.new(1.5, 1, 1, 0);
        return v23;
    end, 
    HandheldCamera = function() --[[ Line: 213 ]] --[[ Name: HandheldCamera ]]
        -- upvalues: v0 (copy)
        local v24 = v0.new(1, 0.25, 5, 10);
        v24.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v24.RotationInfluence = Vector3.new(1, 0.5, 0.5, 0);
        return v24;
    end, 
    Vibration = function() --[[ Line: 222 ]] --[[ Name: Vibration ]]
        -- upvalues: v0 (copy)
        local v25 = v0.new(0.5, 5, 0, 1);
        v25.PositionInfluence = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0);
        v25.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v25;
    end, 
    SmallVibration = function() --[[ Line: 231 ]] --[[ Name: SmallVibration ]]
        -- upvalues: v0 (copy)
        local v26 = v0.new(0.25, 2.5, 0, 1);
        v26.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v26.RotationInfluence = Vector3.new(0.5, 0.5, 0.5, 0);
        return v26;
    end, 
    RoughDriving = function() --[[ Line: 241 ]] --[[ Name: RoughDriving ]]
        -- upvalues: v0 (copy)
        local v27 = v0.new(1, 2, 1, 1);
        v27.PositionInfluence = Vector3.new(0, 0, 0, 0);
        v27.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v27;
    end, 
    WaveBlast = function() --[[ Line: 250 ]] --[[ Name: WaveBlast ]]
        -- upvalues: v0 (copy)
        local v28 = v0.new(3, 7, 0, 1);
        v28.PositionInfluence = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0);
        v28.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v28;
    end, 
    HugeBomb = function() --[[ Line: 257 ]] --[[ Name: HugeBomb ]]
        -- upvalues: v0 (copy)
        local v29 = v0.new(2, 6, 0, 1);
        v29.PositionInfluence = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0);
        v29.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v29;
    end, 
    SSJ = function() --[[ Line: 266 ]] --[[ Name: SSJ ]]
        -- upvalues: v0 (copy)
        local v30 = v0.new(0.6, 7, 2, 10);
        v30.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v30.RotationInfluence = Vector3.new(1, 1, 4, 0);
        return v30;
    end, 
    Frieza = function() --[[ Line: 273 ]] --[[ Name: Frieza ]]
        -- upvalues: v0 (copy)
        local v31 = v0.new(0.6, 3.5, 2, 10);
        v31.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v31.RotationInfluence = Vector3.new(1, 1, 4, 0);
        return v31;
    end, 
    NormalHit = function() --[[ Line: 282 ]] --[[ Name: NormalHit ]]
        -- upvalues: v0 (copy)
        local v32 = v0.new(0.5, 5, 0, 1);
        v32.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v32.RotationInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        return v32;
    end, 
    ChargeKi = function() --[[ Line: 291 ]] --[[ Name: ChargeKi ]]
        -- upvalues: v0 (copy)
        local v33 = v0.new(1, 6, 0, 1);
        v33.PositionInfluence = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0);
        v33.RotationInfluence = Vector3.new(1, 1, 1, 0);
        return v33;
    end, 
    ChargeDish = function() --[[ Line: 300 ]] --[[ Name: ChargeDish ]]
        -- upvalues: v0 (copy)
        local v34 = v0.new(2, 4, 0, 1);
        v34.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v34.RotationInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        return v34;
    end, 
    KiBurst = function() --[[ Line: 309 ]] --[[ Name: KiBurst ]]
        -- upvalues: v0 (copy)
        local v35 = v0.new(10, 7, 0, 2);
        v35.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
        v35.RotationInfluence = Vector3.new(2, 2, 2, 0);
        return v35;
    end, 
    KiWave = function() --[[ Line: 318 ]] --[[ Name: KiWave ]]
        -- upvalues: v0 (copy)
        local v36 = v0.new(30, 15, 0, 2);
        v36.PositionInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        v36.RotationInfluence = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
        return v36;
    end
};
return (setmetatable({}, {
    __index = function(_, v39) --[[ Line: 328 ]] --[[ Name: __index ]]
        -- upvalues: v37 (copy)
        local v40 = v37[v39];
        if type(v40) == "function" then
            return v40();
        else
            error("No preset found with index \"" .. v39 .. "\"");
            return;
        end;
    end
}));