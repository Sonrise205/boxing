return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.IsOrdered1D);
    describe("Array/IsOrdered1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return true for an empty array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(v0({})).to.equal(true);
        end);
        it("should return true for a one-item array", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                1
            })).to.equal(true);
        end);
        it("should return true for an ascending ordered five-item array", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                1, 
                2, 
                3, 
                4, 
                5
            })).to.equal(true);
        end);
        it("should return true for a descending ordered five-item array", function() --[[ Line: 17 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                5, 
                4, 
                3, 
                2, 
                1
            })).to.equal(true);
        end);
        it("should return true for an ascending ordered three-item array given ascending is specified", function() --[[ Line: 21 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                1, 
                2, 
                3
            }, true)).to.equal(true);
        end);
        it("should return false for an ascending ordered three-item array given descending is specified", function() --[[ Line: 25 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                1, 
                2, 
                3
            }, false)).to.equal(false);
        end);
        it("should return true for a descending ordered three-item array given descending is specified", function() --[[ Line: 29 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                3, 
                2, 
                1
            }, false)).to.equal(true);
        end);
        it("should return false for a descending ordered three-item array given ascending is specified", function() --[[ Line: 33 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                3, 
                2, 
                1
            }, true)).to.equal(false);
        end);
    end);
end;