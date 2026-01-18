local v0 = require(script.Parent);
local l_Remove_0 = require(script.Parent:FindFirstChild("Remove"));
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy), l_Remove_0 (copy)
    describe("Set/Remove", function() --[[ Line: 5 ]]
        -- upvalues: v0 (ref), l_Remove_0 (ref)
        it("should return the same set given a nil value", function() --[[ Line: 6 ]]
            -- upvalues: v0 (ref), l_Remove_0 (ref)
            local v2 = v0({});
            expect(l_Remove_0(v2, nil)).to.equal(v2);
            local v3 = v0({
                1, 
                2, 
                3
            });
            expect(l_Remove_0(v3, nil)).to.equal(v3);
        end);
        it("should return the same empty set given a value and an empty set", function() --[[ Line: 14 ]]
            -- upvalues: v0 (ref), l_Remove_0 (ref)
            local v4 = v0({});
            expect(l_Remove_0(v4, 1)).to.equal(v4);
        end);
        it("should return the same set given a value not in the set", function() --[[ Line: 19 ]]
            -- upvalues: v0 (ref), l_Remove_0 (ref)
            local v5 = v0({
                1, 
                2, 
                3
            });
            expect(l_Remove_0(v5, 4)).to.equal(v5);
        end);
        it("should return a new set without the given value", function() --[[ Line: 24 ]]
            -- upvalues: v0 (ref), l_Remove_0 (ref)
            local v6 = v0({
                1, 
                2, 
                3
            });
            local v7 = l_Remove_0(v6, 2);
            expect(v7).never.to.equal(v6);
            expect(v7[1]).to.equal(true);
            expect(v7[2]).never.to.be.ok();
            expect(v7[3]).to.equal(true);
        end);
    end);
end;