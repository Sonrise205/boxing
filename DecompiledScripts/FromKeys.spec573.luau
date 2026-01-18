return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.FromKeys);
    describe("Set/FromKeys", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return an empty table given an empty table", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({});
            expect(next(v1)).never.to.be.ok();
        end);
        it("should return correctly for one item", function() --[[ Line: 10 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                A = 1234
            });
            expect(v2.A).to.be.ok();
        end);
        it("should return correctly for multiple items", function() --[[ Line: 15 ]]
            -- upvalues: v0 (ref)
            local v3 = v0({
                A = 1, 
                B = 2, 
                C = 3
            });
            expect(v3.A).to.be.ok();
            expect(v3.B).to.be.ok();
            expect(v3.C).to.be.ok();
        end);
    end);
end;