return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Sort);
    describe("Array/Sort", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return an empty array given an empty array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({});
            expect(next(v1)).to.equal(nil);
        end);
        it("should return a one-item array given a one-item array", function() --[[ Line: 10 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                1
            });
            expect(v2[1]).to.equal(1);
        end);
        it("should sort ascending given an ascending function", function() --[[ Line: 15 ]]
            -- upvalues: v0 (ref)
            local v5 = v0({
                4, 
                8, 
                1, 
                2
            }, function(v3, v4) --[[ Line: 16 ]]
                return v3 < v4;
            end);
            expect(v5[1]).to.equal(1);
            expect(v5[2]).to.equal(2);
            expect(v5[3]).to.equal(4);
            expect(v5[4]).to.equal(8);
        end);
        it("should sort descending given an ascending function", function() --[[ Line: 26 ]]
            -- upvalues: v0 (ref)
            local v8 = v0({
                4, 
                8, 
                1, 
                2
            }, function(v6, v7) --[[ Line: 27 ]]
                return v7 < v6;
            end);
            expect(v8[1]).to.equal(8);
            expect(v8[2]).to.equal(4);
            expect(v8[3]).to.equal(2);
            expect(v8[4]).to.equal(1);
        end);
    end);
end;