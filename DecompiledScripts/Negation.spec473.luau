return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Negation);
    local v1 = require(script.Parent.FromValues);
    describe("Set/Negation", function() --[[ Line: 5 ]]
        -- upvalues: v0 (copy), v1 (copy)
        it("should return a blank set from two blank set inputs", function() --[[ Line: 6 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v2 = v0(v1({}), v1({}));
            expect(next(v2)).never.to.be.ok();
        end);
        it("should remove the latter from the former with one item", function() --[[ Line: 11 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v3 = v0(v1({
                1
            }), v1({
                1
            }));
            expect(next(v3)).never.to.be.ok();
        end);
        it("should remove the latter from the former with multiple items", function() --[[ Line: 16 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v4 = v0(v1({
                1, 
                4, 
                8
            }), v1({
                4, 
                8, 
                1
            }));
            expect(next(v4)).never.to.be.ok();
        end);
        it("should remove the latter from the former with multiple items and leave non-negated present", function() --[[ Line: 21 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v5 = v0(v1({
                1, 
                4, 
                8, 
                2
            }), v1({
                4, 
                8, 
                1
            }));
            expect(v5[2]).to.be.ok();
        end);
    end);
end;