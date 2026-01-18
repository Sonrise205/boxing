return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Changes);
    describe("Map/Changes", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("it should give no changes for two empty tables", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(next(v0({}, {}))).to.equal(nil);
        end);
        it("should give no changes for a created value", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            expect(next(v0({}, {
                A = 1
            }))).to.equal(nil);
        end);
        it("should give no changes for a removed value", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            expect(next(v0({
                A = 1
            }, {}))).to.equal(nil);
        end);
        it("should give no changes for an equal value", function() --[[ Line: 17 ]]
            -- upvalues: v0 (ref)
            expect(next(v0({
                A = 1
            }, {
                A = 1
            }))).to.equal(nil);
        end);
        it("should give changes for a changed value", function() --[[ Line: 21 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({
                A = 1
            }, {
                A = 2
            });
            expect(v1.A).to.be.ok();
            expect(v1.A).to.equal(2);
        end);
        it("should give changes for multiple changed values", function() --[[ Line: 27 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                A = 1, 
                B = 2
            }, {
                A = 2, 
                B = 3
            });
            expect(v2.A).to.equal(2);
            expect(v2.B).to.equal(3);
        end);
    end);
end;