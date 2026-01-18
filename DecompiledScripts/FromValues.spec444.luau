return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.FromValues);
    describe("Set/FromValues", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return an empty table given an empty table", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({});
            expect(next(v1)).never.to.be.ok();
        end);
        it("should return correctly for one item", function() --[[ Line: 10 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                A = "1234"
            });
            expect(v2["1234"]).to.be.ok();
        end);
        it("should return correctly for multiple items", function() --[[ Line: 15 ]]
            -- upvalues: v0 (ref)
            local v3 = v0({
                A = "1", 
                B = "2", 
                C = "3"
            });
            expect(v3["1"]).to.be.ok();
            expect(v3["2"]).to.be.ok();
            expect(v3["3"]).to.be.ok();
        end);
    end);
end;