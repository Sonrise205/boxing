return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.IsArray);
    describe("Array/IsArray", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return false for an empty array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(v0({})).to.equal(false);
        end);
        it("should return true for a one-item array", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                1
            })).to.equal(true);
        end);
        it("should return true for a two-item array", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                1, 
                2
            })).to.equal(true);
        end);
        it("should return true for a two-item array with a string key", function() --[[ Line: 17 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                1, 
                2; 
                X = 3
            })).to.equal(true);
        end);
    end);
end;