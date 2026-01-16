return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Outer);
    local v1 = require(script.Parent.FromValues);
    describe("Set/Outer", function() --[[ Line: 5 ]]
        -- upvalues: v0 (copy), v1 (copy)
        it("should return a blank set from two blank set inputs", function() --[[ Line: 6 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v2 = v0(v1({}), v1({}));
            expect(next(v2)).never.to.be.ok();
        end);
        it("should return the left items given a left set and a blank right set", function() --[[ Line: 11 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v3 = v0(v1({
                1, 
                2, 
                3
            }), v1({}));
            expect(v3[1]).to.be.ok();
            expect(v3[2]).to.be.ok();
            expect(v3[3]).to.be.ok();
        end);
        it("should return the right items given a blank left set and a right set", function() --[[ Line: 18 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v4 = v0(v1({}), v1({
                1, 
                2, 
                3
            }));
            expect(v4[1]).to.be.ok();
            expect(v4[2]).to.be.ok();
            expect(v4[3]).to.be.ok();
        end);
        it("should return the outer items without the intersections", function() --[[ Line: 25 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v5 = v0(v1({
                1, 
                2, 
                3, 
                4
            }), v1({
                3, 
                4, 
                5, 
                6
            }));
            expect(v5[1]).to.be.ok();
            expect(v5[2]).to.be.ok();
            expect(v5[3]).never.to.be.ok();
            expect(v5[4]).never.to.be.ok();
            expect(v5[5]).to.be.ok();
            expect(v5[6]).to.be.ok();
        end);
    end);
end;