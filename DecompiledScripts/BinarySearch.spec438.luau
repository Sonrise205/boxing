return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.BinarySearch);
    describe("Array/BinarySearch", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return nothing for an empty array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(v0({}, 10));
        end);
        it("should return the first element of an array", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                10
            }, 10)).to.equal(1);
        end);
        it("should return the last element of an array", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                10, 
                20, 
                30, 
                40, 
                50
            }, 50)).to.equal(5);
        end);
        it("should return the middle element of an array", function() --[[ Line: 17 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                10, 
                20, 
                30, 
                40, 
                50
            }, 30)).to.equal(3);
        end);
        it("should return the closest element of an array given 'ReturnClosestIndex' arg", function() --[[ Line: 21 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                10, 
                20, 
                30, 
                40, 
                50
            }, 35, true)).to.equal(3);
        end);
        it("should return nil for a non-existent element of an array", function() --[[ Line: 25 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                10, 
                20, 
                30, 
                40, 
                50
            }, 35)).never.to.be.ok();
        end);
    end);
end;