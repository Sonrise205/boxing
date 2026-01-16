return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.InverseKeysValues);
    describe("Map/InverseKeysValues", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return a blank table for no data", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(next(v0({}))).never.to.be.ok();
        end);
        it("should return a single flipped key-value pair for a single item table", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({
                X = "Y"
            });
            expect(v1.Y).to.equal("X");
            expect(v1.X).never.to.be.ok();
        end);
        it("should return a flipped key-value pair for each item in the table", function() --[[ Line: 16 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                A = "P", 
                B = "Q", 
                C = "R"
            });
            expect(v2.P).to.equal("A");
            expect(v2.Q).to.equal("B");
            expect(v2.R).to.equal("C");
            expect(v2.A).never.to.be.ok();
            expect(v2.B).never.to.be.ok();
            expect(v2.C).never.to.be.ok();
        end);
    end);
end;