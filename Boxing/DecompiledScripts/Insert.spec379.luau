return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Insert);
    describe("Array/Insert", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should insert an item in the first position in an empty array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({}, 1);
            expect(v1[1]).to.be.ok();
            expect(v1[1]).to.equal(1);
        end);
        it("should insert two items in order into an empty array", function() --[[ Line: 12 ]]
            -- upvalues: v0 (ref)
            local v2 = v0(v0({}, 1), 2);
            for v3 = 1, 2 do
                expect(v2[v3]).to.be.ok();
                expect(v2[v3]).to.equal(v3);
            end;
        end);
        it("should allow insertion at an inner index", function() --[[ Line: 22 ]]
            -- upvalues: v0 (ref)
            local v4 = v0({
                1, 
                2, 
                4, 
                5
            }, 3, 3);
            for v5 = 1, 5 do
                expect(v4[v5]).to.be.ok();
                expect(v4[v5]).to.equal(v5);
            end;
        end);
        it("should allow insertion at index 1", function() --[[ Line: 32 ]]
            -- upvalues: v0 (ref)
            local v6 = v0({
                2, 
                3
            }, 1, 1);
            for v7 = 1, 3 do
                expect(v6[v7]).to.be.ok();
                expect(v6[v7]).to.equal(v7);
            end;
        end);
        it("should disallow insertion at index length+2", function() --[[ Line: 42 ]]
            -- upvalues: v0 (ref)
            expect(function() --[[ Line: 43 ]]
                -- upvalues: v0 (ref)
                v0({
                    1, 
                    2
                }, 1000, 4, true);
            end).to.throw();
        end);
    end);
end;