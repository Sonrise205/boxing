return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Creations1D);
    describe("Map/Creations1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("it should give no creations for two empty tables", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(next(v0({}, {}))).to.equal(nil);
        end);
        it("should give a creation for a created value", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({}, {
                A = 1
            });
            expect(v1.A).to.be.ok();
            expect(v1.A).to.equal(1);
        end);
        it("should give no creations for a removed value", function() --[[ Line: 15 ]]
            -- upvalues: v0 (ref)
            expect(next(v0({
                A = 1
            }, {}))).to.equal(nil);
        end);
        it("should give no creations for an equal value", function() --[[ Line: 19 ]]
            -- upvalues: v0 (ref)
            expect(next(v0({
                A = 1
            }, {
                A = 1
            }))).to.equal(nil);
        end);
        it("should give no creations for a changed value", function() --[[ Line: 23 ]]
            -- upvalues: v0 (ref)
            expect(next(v0({
                A = 1
            }, {
                A = 2
            }))).to.equal(nil);
        end);
        it("should give creations for multiple created values", function() --[[ Line: 27 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({}, {
                A = 1, 
                B = 2
            });
            expect(v2.A).to.be.ok();
            expect(v2.A).to.equal(1);
            expect(v2.B).to.be.ok();
            expect(v2.B).to.equal(2);
        end);
    end);
end;