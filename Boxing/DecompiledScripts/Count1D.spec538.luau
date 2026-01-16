return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Count1D);
    describe("Map/Count1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("it should return 0 for an empty table", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(v0({})).to.equal(0);
        end);
        it("should return 1 for a single element table", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                A = 1
            })).to.equal(1);
        end);
        it("should return 2 for a 2 elements table", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                A = 1, 
                B = 2
            })).to.equal(2);
        end);
        it("should return 3 for a 3 elements table", function() --[[ Line: 17 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                A = 1, 
                B = 2, 
                C = 3
            })).to.equal(3);
        end);
    end);
end;