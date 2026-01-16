return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Keys);
    describe("Map/Keys", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return a blank table given a blank table", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({});
            expect(v1).to.be.ok();
            expect(next(v1)).never.to.be.ok();
        end);
        it("should return one key given a one key table", function() --[[ Line: 11 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                A = 1000
            });
            expect(table.find(v2, "A")).to.be.ok();
        end);
        it("should return multiple keys given a multiple key table", function() --[[ Line: 16 ]]
            -- upvalues: v0 (ref)
            local v3 = v0({
                A = 1000, 
                B = 2000, 
                C = true
            });
            expect(table.find(v3, "A")).to.be.ok();
            expect(table.find(v3, "B")).to.be.ok();
            expect(table.find(v3, "C")).to.be.ok();
        end);
    end);
end;