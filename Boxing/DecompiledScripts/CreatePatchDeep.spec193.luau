return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.CreatePatchDeep);
    describe("Map/CreatePatchDeep", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return a blank table for no data", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(next(v0({}, {}))).never.to.be.ok();
        end);
        it("should apply all new items in a flat table", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({}, {
                X = 1, 
                Y = 2, 
                Z = 3
            });
            expect(v1.X).to.equal(1);
            expect(v1.Y).to.equal(2);
            expect(v1.Z).to.equal(3);
            local v2 = 0;
            for _ in v1 do
                v2 = v2 + 1;
            end;
            expect(v2).to.equal(3);
        end);
        it("should not overwrite existing items in a flat table but apply new", function() --[[ Line: 29 ]]
            -- upvalues: v0 (ref)
            local v4 = v0({
                X = 20
            }, {
                X = 1, 
                Y = 2, 
                Z = 3
            });
            expect(v4.Y).to.equal(2);
            expect(v4.Z).to.equal(3);
            local v5 = 0;
            for _ in v4 do
                v5 = v5 + 1;
            end;
            expect(v5).to.equal(2);
        end);
        it("should apply all new items in a nested table", function() --[[ Line: 50 ]]
            -- upvalues: v0 (ref)
            local v7 = v0({}, {
                X = {
                    Y = {
                        Z = 1
                    }
                }
            });
            expect(v7.X.Y.Z).to.equal(1);
        end);
        it("should not overwrite existing items in a nested table but apply new", function() --[[ Line: 62 ]]
            -- upvalues: v0 (ref)
            local v8 = v0({
                X = {
                    Y = {
                        Z = 20
                    }
                }
            }, {
                X = {
                    Y = {
                        Z = 1, 
                        H = 200
                    }
                }
            });
            expect(v8.X.Y.Z).to.equal(nil);
            expect(v8.X.Y.H).to.equal(200);
        end);
    end);
end;