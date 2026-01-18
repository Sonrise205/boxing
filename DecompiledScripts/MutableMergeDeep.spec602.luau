return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.MutableMergeDeep);
    describe("Map/MutableMergeDeep", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should not modify a blank table given a blank table to merge in", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = {};
            v0(v1, {});
            expect(next(v1)).never.to.be.ok();
        end);
        it("should flat modify a table given a single item table to merge in", function() --[[ Line: 11 ]]
            -- upvalues: v0 (ref)
            local v2 = {};
            v0(v2, {
                A = 1
            });
            expect(v2.A).to.equal(1);
        end);
        it("should flat modify a table given a multiple item table to merge in", function() --[[ Line: 17 ]]
            -- upvalues: v0 (ref)
            local v3 = {};
            v0(v3, {
                A = 1, 
                B = 2, 
                C = 3
            });
            expect(v3.A).to.equal(1);
            expect(v3.B).to.equal(2);
            expect(v3.C).to.equal(3);
        end);
        it("should overwrite former tables", function() --[[ Line: 25 ]]
            -- upvalues: v0 (ref)
            local v4 = {
                A = 1, 
                B = 2
            };
            v0(v4, {
                B = 3
            }, {
                B = 4
            });
            expect(v4.A).to.equal(1);
            expect(v4.B).to.equal(4);
        end);
        it("should merge tables recursively", function() --[[ Line: 32 ]]
            -- upvalues: v0 (ref)
            local v5 = {
                X = {}, 
                Y = {}
            };
            local v6 = {
                X = {
                    Value = 1
                }
            };
            local v7 = {
                Y = {
                    Value = 2
                }
            };
            v0(v5, v6, v7);
            expect(v5.X.Value).to.equal(1);
            expect(v5.Y.Value).to.equal(2);
            expect(v5.X).never.to.equal(v6.X);
            expect(v5.Y).never.to.equal(v7.Y);
        end);
    end);
end;