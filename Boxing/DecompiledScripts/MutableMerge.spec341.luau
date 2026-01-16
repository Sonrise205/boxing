return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.MutableMerge);
    describe("Array/MutableMerge", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should not add anything to the array when the right-hand table is empty", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = {
                1, 
                2, 
                3
            };
            v0(v1, {});
            expect(v1[1]).to.equal(1);
            expect(v1[2]).to.equal(2);
            expect(v1[3]).to.equal(3);
            expect(v1[4]).to.equal(nil);
        end);
        it("should add the elements in the right-hand table to the end of the left-hand table", function() --[[ Line: 16 ]]
            -- upvalues: v0 (ref)
            local v2 = {
                1, 
                2, 
                3
            };
            v0(v2, {
                4, 
                5, 
                6
            });
            expect(v2[1]).to.equal(1);
            expect(v2[2]).to.equal(2);
            expect(v2[3]).to.equal(3);
            expect(v2[4]).to.equal(4);
            expect(v2[5]).to.equal(5);
            expect(v2[6]).to.equal(6);
            expect(v2[7]).to.equal(nil);
        end);
    end);
end;