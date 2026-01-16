return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.ToArray);
    local v1 = require(script.Parent);
    describe("Set/ToArray", function() --[[ Line: 5 ]]
        -- upvalues: v0 (copy), v1 (copy)
        it("should return a blank array from a blank set", function() --[[ Line: 6 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v2 = v0(v1({}));
            expect(v2).to.be.ok();
            expect(#v2).to.equal(0);
        end);
        it("should return an array with the same items as the set", function() --[[ Line: 12 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v3 = v0(v1({
                1, 
                2, 
                3
            }));
            expect(v3).to.be.ok();
            expect(#v3).to.equal(3);
            expect(v3[1]).to.equal(1);
            expect(v3[2]).to.equal(2);
            expect(v3[3]).to.equal(3);
        end);
    end);
end;