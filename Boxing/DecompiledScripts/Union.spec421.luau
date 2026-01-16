return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Union);
    local v1 = require(script.Parent.FromValues);
    describe("Set/Union", function() --[[ Line: 5 ]]
        -- upvalues: v0 (copy), v1 (copy)
        it("should combine two empty sets into an empty set", function() --[[ Line: 6 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({}, {});
            expect(next(v2)).never.to.be.ok();
        end);
        it("should return A for A union B where B is empty", function() --[[ Line: 11 ]]
            -- upvalues: v1 (ref), v0 (ref)
            local v3 = v1({
                "x", 
                "y", 
                "z"
            });
            local v4 = v1({});
            expect(v0(v3, v4)).to.equal(v3);
        end);
        it("should return B for A union B where A is empty", function() --[[ Line: 18 ]]
            -- upvalues: v1 (ref), v0 (ref)
            local v5 = v1({});
            local v6 = v1({
                "x", 
                "y", 
                "z"
            });
            expect(v0(v5, v6)).to.equal(v6);
        end);
        it("should return an equal set for two equivalent sets", function() --[[ Line: 25 ]]
            -- upvalues: v1 (ref)
            local v7 = v1({
                "x", 
                "y", 
                "z"
            });
            local v8 = v1({
                "x", 
                "y", 
                "z"
            });
            for v9 in v7 do
                expect(v8[v9]).to.equal(v7[v9]);
            end;
            for v10 in v8 do
                expect(v7[v10]).to.equal(v8[v10]);
            end;
        end);
        it("should return a union of two sets", function() --[[ Line: 38 ]]
            -- upvalues: v1 (ref), v0 (ref)
            local v11 = v1({
                "X", 
                "Y", 
                "Z"
            });
            local v12 = v1({
                "P", 
                "Q", 
                "R"
            });
            local v13 = v0(v11, v12);
            expect(v13.X).to.be.ok();
            expect(v13.Y).to.be.ok();
            expect(v13.Z).to.be.ok();
            expect(v13.P).to.be.ok();
            expect(v13.Q).to.be.ok();
            expect(v13.R).to.be.ok();
        end);
    end);
end;