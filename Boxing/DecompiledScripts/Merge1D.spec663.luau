return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Merge1D);
    describe("Array/Merge1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should merge two blank arrays into a blank array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({}, {});
            expect(next(v1)).to.never.be.ok();
        end);
        it("should merge more than two blank arrays into a blank array", function() --[[ Line: 10 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({}, {}, {}, {});
            expect(next(v2)).to.never.be.ok();
        end);
        it("should merge several one-item arrays into a final array, in order", function() --[[ Line: 15 ]]
            -- upvalues: v0 (ref)
            local v3 = v0({
                1
            }, {
                2
            }, {
                3
            }, {
                4
            });
            for v4 = 1, 4 do
                expect(v3[v4]).to.equal(v4);
            end;
        end);
        it("should merge several multiple-item arrays into a final array, in order", function() --[[ Line: 23 ]]
            -- upvalues: v0 (ref)
            local v5 = v0({
                1, 
                2, 
                3
            }, {
                4
            }, {
                5, 
                6
            }, {
                7, 
                8, 
                9, 
                10
            });
            for v6 = 1, 10 do
                expect(v5[v6]).to.equal(v6);
            end;
        end);
    end);
end;