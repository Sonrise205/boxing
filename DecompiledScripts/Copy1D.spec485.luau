return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Copy1D);
    describe("Array/Copy1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should copy a blank table with no contents", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = {};
            local v2 = v0(v1);
            expect(v2).to.never.equal(v1);
            expect(next(v2)).to.never.be.ok();
        end);
        it("should copy the first element of an array", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            local v3 = {
                100
            };
            local v4 = v0(v3);
            expect(v4).never.to.equal(v3);
            expect(v4[1]).to.equal(v3[1]);
        end);
        it("should copy all elements of an array", function() --[[ Line: 21 ]]
            -- upvalues: v0 (ref)
            local v5 = {
                1, 
                2, 
                3, 
                4
            };
            local v6 = v0(v5);
            expect(v6).never.to.equal(v5);
            expect(v6[1]).to.equal(v5[1]);
            expect(v6[2]).to.equal(v5[2]);
            expect(v6[3]).to.equal(v5[3]);
            expect(v6[4]).to.equal(v5[4]);
        end);
    end);
end;