return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.FromValues);
    local v1 = require(script.Parent.Equals);
    describe("Set/Equals", function() --[[ Line: 5 ]]
        -- upvalues: v1 (copy), v0 (copy)
        it("should return true for two empty sets", function() --[[ Line: 6 ]]
            -- upvalues: v1 (ref), v0 (ref)
            expect(v1(v0({}), v0({}))).to.equal(true);
        end);
        it("should return false for two sets with different values", function() --[[ Line: 10 ]]
            -- upvalues: v1 (ref), v0 (ref)
            expect(v1(v0({
                1, 
                2, 
                3
            }), v0({
                4, 
                5, 
                6
            }))).to.equal(false);
        end);
        it("should return true for two sets with the same values", function() --[[ Line: 14 ]]
            -- upvalues: v1 (ref), v0 (ref)
            expect(v1(v0({
                1, 
                2, 
                3
            }), v0({
                1, 
                2, 
                3
            }))).to.equal(true);
            expect(v1(v0({
                1, 
                2, 
                3
            }), v0({
                3, 
                2, 
                1
            }))).to.equal(true);
        end);
        it("should return false for an intersection which is not equal to A or B", function() --[[ Line: 19 ]]
            -- upvalues: v1 (ref), v0 (ref)
            expect(v1(v0({
                1, 
                2, 
                3
            }), v0({
                2, 
                3, 
                4
            }))).to.equal(false);
            expect(v1(v0({
                1, 
                2, 
                3
            }), v0({
                1, 
                2, 
                4
            }))).to.equal(false);
        end);
    end);
end;