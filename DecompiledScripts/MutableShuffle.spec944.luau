return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.MutableShuffle);
    describe("Array/MutableShuffle", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should keep the first element in a one-item array in the same position", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = {
                1
            };
            v0(v1);
            expect(v1[1]).to.equal(1);
        end);
        it("should shuffle a ten-item array", function() --[[ Line: 11 ]]
            -- upvalues: v0 (ref)
            local v2 = {
                1, 
                2, 
                3, 
                4, 
                5, 
                6, 
                7, 
                8, 
                9, 
                10
            };
            v0(v2);
            local v3 = 0;
            for _, v5 in v2 do
                v3 = v3 + v5;
            end;
            expect(v3).to.equal(55);
            local v6 = 0;
            for v7 = 1, 10 do
                v6 = v6 + (v2[v7] == v7 and 1 or 0);
            end;
            expect(v6 < 10).to.equal(true);
        end);
    end);
end;