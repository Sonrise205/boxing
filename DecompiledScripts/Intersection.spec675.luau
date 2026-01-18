return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Intersection);
    local v1 = require(script.Parent.FromValues);
    describe("Set/Intersection", function() --[[ Line: 5 ]]
        -- upvalues: v0 (copy), v1 (copy)
        it("should find no intersection with two empty sets", function() --[[ Line: 6 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({}, {});
            expect(next(v2)).never.to.be.ok();
        end);
        it("should find an intersection between one common element", function() --[[ Line: 11 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v3 = v0(v1({
                "A", 
                "B"
            }), v1({
                "A", 
                "C"
            }));
            expect(v3.A).to.be.ok();
            expect(v3.B).never.to.be.ok();
            expect(v3.C).never.to.be.ok();
        end);
        it("should find multiple intersecting elements", function() --[[ Line: 18 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v4 = v0(v1({
                "A", 
                "B", 
                "X"
            }), v1({
                "A", 
                "B", 
                "Y"
            }));
            expect(v4.A).to.be.ok();
            expect(v4.B).to.be.ok();
            expect(v4.X).never.to.be.ok();
            expect(v4.Y).never.to.be.ok();
        end);
    end);
end;