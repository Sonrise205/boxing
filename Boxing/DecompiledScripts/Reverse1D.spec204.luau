return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Reverse1D);
    describe("Array/Reverse1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return an empty array if passed an empty array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({});
            expect(next(v1)).never.to.be.ok();
        end);
        it("should return a one-item array from a one-item array", function() --[[ Line: 10 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                1
            });
            expect(v2[1]).to.equal(1);
        end);
        it("should swap two items in a two-item array", function() --[[ Line: 15 ]]
            -- upvalues: v0 (ref)
            local v3 = v0({
                1, 
                2
            });
            expect(v3[1]).to.equal(2);
            expect(v3[2]).to.equal(1);
        end);
        it("should swap items in an odd-number-of-items array", function() --[[ Line: 21 ]]
            -- upvalues: v0 (ref)
            local v4 = v0({
                1, 
                2, 
                3
            });
            expect(v4[1]).to.equal(3);
            expect(v4[2]).to.equal(2);
            expect(v4[3]).to.equal(1);
        end);
        it("should reverse 1000 items", function() --[[ Line: 28 ]]
            -- upvalues: v0 (ref)
            local v5 = {};
            for v6 = 1, 1000 do
                table.insert(v5, v6);
            end;
            v5 = v0(v5);
            for v7 = 1, 1000 do
                expect(v5[v7]).to.equal(1000 - v7 + 1);
            end;
        end);
    end);
end;