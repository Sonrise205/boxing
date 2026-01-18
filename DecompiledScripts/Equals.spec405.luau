return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Equals);
    describe("Map/Equals", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("it should return true for two empty tables", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(v0({}, {})).to.equal(true);
        end);
        it("should return false for one item in X and none in Y", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                a = 1
            }, {})).to.equal(false);
        end);
        it("should return false for one item in Y and none in X", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            expect(v0({}, {
                a = 1
            })).to.equal(false);
        end);
        it("should return false for one item in X and one item in Y with different keys", function() --[[ Line: 17 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                a = 1
            }, {
                b = 1
            })).to.equal(false);
        end);
        it("should return false for one item in X and one item in Y with different values", function() --[[ Line: 21 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                a = 1
            }, {
                a = 2
            })).to.equal(false);
        end);
        it("should return true for one item in X and one item in Y with the same key and value", function() --[[ Line: 25 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                a = 1
            }, {
                a = 1
            })).to.equal(true);
        end);
        it("should return true for two items in X and two items in Y with the same keys and values", function() --[[ Line: 29 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                a = 1, 
                b = 2
            }, {
                a = 1, 
                b = 2
            })).to.equal(true);
        end);
    end);
end;