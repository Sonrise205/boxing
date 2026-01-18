return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.IsMixed1D);
    describe("Map/IsMixed1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return false a blank table", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(v0({})).to.equal(false);
        end);
        it("should return false for a table with a single key-value", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                A = 1
            })).to.equal(false);
        end);
        it("should return false for a table with multiple key-values", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                A = 1, 
                B = 2, 
                C = 3
            })).to.equal(false);
        end);
        it("should return true for a mixed table", function() --[[ Line: 17 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                1, 
                2, 
                3; 
                A = 1, 
                B = 2, 
                C = 3
            })).to.equal(true);
        end);
        it("should return false for an array", function() --[[ Line: 21 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                1, 
                2, 
                3
            })).to.equal(false);
        end);
    end);
end;