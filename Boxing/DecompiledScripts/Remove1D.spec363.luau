return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Remove1D);
    describe("Array/Remove1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return an empty array upon removing from an empty array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = {};
            local v2 = v0(v1);
            expect(next(v2)).to.equal(nil);
            expect(v1).never.to.equal(v2);
        end);
        it("should remove the last item in a two-item array", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            local v3 = v0({
                1, 
                2
            });
            expect(v3[1]).to.equal(1);
            expect(v3[2]).never.to.be.ok();
        end);
        it("should remove the last item multiple times", function() --[[ Line: 19 ]]
            -- upvalues: v0 (ref)
            local v4 = v0({
                1, 
                2, 
                3, 
                4
            });
            expect(v4[1]).to.equal(1);
            expect(v4[2]).to.equal(2);
            expect(v4[3]).to.equal(3);
            expect(v4[4]).never.to.be.ok();
            v4 = v0(v4);
            expect(v4[1]).to.equal(1);
            expect(v4[2]).to.equal(2);
            expect(v4[3]).never.to.be.ok();
            v4 = v0(v4);
            expect(v4[1]).to.equal(1);
            expect(v4[2]).never.to.be.ok();
            v4 = v0(v4);
            expect(v4[1]).never.to.be.ok();
        end);
        it("should remove an item in the middle", function() --[[ Line: 39 ]]
            -- upvalues: v0 (ref)
            local v5 = v0({
                1, 
                2, 
                3, 
                4
            }, 2);
            expect(v5[1]).to.equal(1);
            expect(v5[2]).to.equal(3);
            expect(v5[3]).to.equal(4);
        end);
    end);
end;