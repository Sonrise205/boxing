return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.MutableBinaryInsert1D);
    describe("Array/MutableBinaryInsert1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should insert into the first index of an empty array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = {};
            v0(v1, 1);
            expect(v1[1]).to.equal(1);
        end);
        it("should insert into the first index of a one-item array", function() --[[ Line: 11 ]]
            -- upvalues: v0 (ref)
            local v2 = {
                2
            };
            v0(v2, 1);
            expect(v2[1]).to.equal(1);
            expect(v2[2]).to.equal(2);
        end);
        it("should insert into the second index of a one-item array", function() --[[ Line: 18 ]]
            -- upvalues: v0 (ref)
            local v3 = {
                1
            };
            v0(v3, 2);
            expect(v3[1]).to.equal(1);
            expect(v3[2]).to.equal(2);
        end);
        it("should insert into the first index of a two-item array", function() --[[ Line: 25 ]]
            -- upvalues: v0 (ref)
            local v4 = {
                3, 
                4
            };
            v0(v4, 1);
            expect(v4[1]).to.equal(1);
            expect(v4[2]).to.equal(3);
            expect(v4[3]).to.equal(4);
        end);
        it("should insert various random numbers, creating an ordered array", function() --[[ Line: 33 ]]
            -- upvalues: v0 (ref)
            local v5 = {};
            local v6 = Random.new();
            for _ = 1, 100 do
                v0(v5, v6:NextInteger(1, 10));
            end;
            for v8 = 2, #v5 do
                expect(v5[v8 - 1] <= v5[v8]).to.equal(true);
            end;
        end);
    end);
end;