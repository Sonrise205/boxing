return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Values1D);
    describe("Map/Values1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return a blank table given a blank table", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({});
            expect(v1).to.be.ok();
            expect(next(v1)).never.to.be.ok();
        end);
        it("should return one value given a one value table", function() --[[ Line: 11 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                A = 1000
            });
            expect(table.find(v2, 1000)).to.be.ok();
        end);
        it("should return multiple values given a multiple value table", function() --[[ Line: 16 ]]
            -- upvalues: v0 (ref)
            local v3 = v0({
                A = 1000, 
                B = 2000, 
                C = true
            });
            expect(table.find(v3, 1000)).to.be.ok();
            expect(table.find(v3, 2000)).to.be.ok();
            expect(table.find(v3, true)).to.be.ok();
        end);
    end);
end;