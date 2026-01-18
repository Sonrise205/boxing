local v0 = require(script.Parent);
local l_Insert_0 = require(script.Parent:FindFirstChild("Insert"));
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy), l_Insert_0 (copy)
    describe("Set/Insert", function() --[[ Line: 5 ]]
        -- upvalues: v0 (ref), l_Insert_0 (ref)
        it("should return the same set given a nil value", function() --[[ Line: 6 ]]
            -- upvalues: v0 (ref), l_Insert_0 (ref)
            local v2 = v0({});
            expect(l_Insert_0(v2, nil)).to.equal(v2);
            local v3 = v0({
                1, 
                2, 
                3
            });
            expect(l_Insert_0(v3, nil)).to.equal(v3);
        end);
        it("should return a new set with the given value", function() --[[ Line: 14 ]]
            -- upvalues: v0 (ref), l_Insert_0 (ref)
            local v4 = v0({});
            local v5 = l_Insert_0(v4, 1);
            expect(v5).never.to.equal(v4);
            expect(v5[1]).to.equal(true);
        end);
        it("should return the same set given a value already in the set", function() --[[ Line: 21 ]]
            -- upvalues: v0 (ref), l_Insert_0 (ref)
            local v6 = v0({
                1, 
                2, 
                3
            });
            expect(l_Insert_0(v6, 2)).to.equal(v6);
        end);
        it("should return a new set with the given value for a non-empty set", function() --[[ Line: 26 ]]
            -- upvalues: v0 (ref), l_Insert_0 (ref)
            local v7 = v0({
                1, 
                2, 
                3
            });
            local v8 = l_Insert_0(v7, 4);
            expect(v8).never.to.equal(v7);
            expect(v8[1]).to.equal(true);
            expect(v8[2]).to.equal(true);
            expect(v8[3]).to.equal(true);
            expect(v8[4]).to.equal(true);
        end);
    end);
end;