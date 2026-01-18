return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent);
    local v1 = require(script.Parent.IsSubset);
    describe("Set/IsSubset", function() --[[ Line: 5 ]]
        -- upvalues: v1 (copy), v0 (copy)
        it("should return true for two empty sets", function() --[[ Line: 6 ]]
            -- upvalues: v1 (ref), v0 (ref)
            expect(v1(v0({}), v0({}))).to.equal(true);
        end);
        it("should return false for a set and an empty set", function() --[[ Line: 10 ]]
            -- upvalues: v1 (ref), v0 (ref)
            expect(v1(v0({
                1, 
                2, 
                3
            }), v0({}))).to.equal(false);
        end);
        it("should return true for an empty set and a set", function() --[[ Line: 14 ]]
            -- upvalues: v1 (ref), v0 (ref)
            expect(v1(v0({}), v0({
                1, 
                2, 
                3
            }))).to.equal(true);
        end);
        it("should return true for a set and a subset", function() --[[ Line: 18 ]]
            -- upvalues: v1 (ref), v0 (ref)
            expect(v1(v0({
                1, 
                2
            }), v0({
                1, 
                2, 
                3
            }))).to.equal(true);
        end);
        it("should return false for a set and a non-subset", function() --[[ Line: 22 ]]
            -- upvalues: v1 (ref), v0 (ref)
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
        it("should return false for a set and a superset", function() --[[ Line: 26 ]]
            -- upvalues: v1 (ref), v0 (ref)
            expect(v1(v0({
                1, 
                2, 
                3, 
                4
            }), v0({
                1, 
                2, 
                3
            }))).to.equal(false);
        end);
        it("should return true for a set and itself", function() --[[ Line: 30 ]]
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
        end);
    end);
end;