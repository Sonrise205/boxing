return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.MergeMany);
    describe("Map/MergeMany", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return a blank table for no inputs", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0();
            expect(next(v1)).never.to.be.ok();
        end);
        it("should return a blank table for one blank table input", function() --[[ Line: 10 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({});
            expect(next(v2)).never.to.be.ok();
        end);
        it("should return a blank table for multiple blank table inputs", function() --[[ Line: 15 ]]
            -- upvalues: v0 (ref)
            local v3 = v0({}, {}, {}, {});
            expect(next(v3)).never.to.be.ok();
        end);
        it("should merge two tables", function() --[[ Line: 20 ]]
            -- upvalues: v0 (ref)
            local v4 = v0({
                A = 1, 
                B = 2
            }, {
                C = 3
            });
            expect(v4.A).to.equal(1);
            expect(v4.B).to.equal(2);
            expect(v4.C).to.equal(3);
        end);
        it("should overwrite former tables", function() --[[ Line: 27 ]]
            -- upvalues: v0 (ref)
            local v5 = v0({
                A = 1, 
                B = 2
            }, {
                B = 3
            }, {
                B = 4
            });
            expect(v5.A).to.equal(1);
            expect(v5.B).to.equal(4);
        end);
        it("should merge several tables", function() --[[ Line: 33 ]]
            -- upvalues: v0 (ref)
            local v6 = v0({
                A = 1, 
                B = 2
            }, {
                C = 3
            }, {
                D = 4
            });
            expect(v6.A).to.equal(1);
            expect(v6.B).to.equal(2);
            expect(v6.C).to.equal(3);
            expect(v6.D).to.equal(4);
        end);
    end);
end;