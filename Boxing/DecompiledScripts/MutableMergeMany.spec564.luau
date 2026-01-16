return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.MutableMergeMany);
    describe("Array/MutableMergeMany", function() --[[ Line: 4 ]]
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
        it("should merge one right-hand array into the left-hand array", function() --[[ Line: 16 ]]
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
        it("should merge multiple right-hand arrays into the left-hand array", function() --[[ Line: 30 ]]
            -- upvalues: v0 (ref)
            local v3 = {
                1, 
                2, 
                3
            };
            v0(v3, {
                4, 
                5, 
                6
            }, {
                7, 
                8, 
                9
            });
            expect(v3[1]).to.equal(1);
            expect(v3[2]).to.equal(2);
            expect(v3[3]).to.equal(3);
            expect(v3[4]).to.equal(4);
            expect(v3[5]).to.equal(5);
            expect(v3[6]).to.equal(6);
            expect(v3[7]).to.equal(7);
            expect(v3[8]).to.equal(8);
            expect(v3[9]).to.equal(9);
            expect(v3[10]).to.equal(nil);
        end);
    end);
end;