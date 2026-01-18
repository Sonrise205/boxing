return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.CloneDeep);
    local v1 = require(script.Parent.Equals);
    describe("Map/CloneDeep", function() --[[ Line: 5 ]]
        -- upvalues: v0 (copy), v1 (copy)
        it("it should copy a blank array into a new blank array", function() --[[ Line: 6 ]]
            -- upvalues: v0 (ref)
            local v2 = {};
            local v3 = v0(v2);
            expect(next(v3)).never.to.be.ok();
            expect(v2).never.to.equal(v3);
        end);
        it("should copy a single element", function() --[[ Line: 14 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v4 = {
                X = 1
            };
            local v5 = v0(v4);
            expect(v4).never.to.equal(v5);
            expect(v1(v4, v5)).to.equal(true);
        end);
        it("should copy a multiple elements", function() --[[ Line: 22 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v6 = {
                X = 1, 
                Y = 2, 
                Z = 3
            };
            local v7 = v0(v6);
            expect(v6).never.to.equal(v7);
            expect(v1(v6, v7)).to.equal(true);
        end);
        it("should copy a nested table", function() --[[ Line: 30 ]]
            -- upvalues: v0 (ref)
            local v8 = {
                X = 1, 
                Y = {
                    Z = 2, 
                    W = {
                        P = "Test"
                    }
                }
            };
            local v9 = v0(v8);
            expect(v8).never.to.equal(v9);
            expect(v9.X).to.equal(1);
            expect(v9.Y).to.be.ok();
            expect(v9.Y).never.to.equal(v8.Y);
            expect(v9.Y.Z).to.equal(2);
            expect(v9.Y.W).to.be.ok();
            expect(v9.Y.W).never.to.equal(v8.Y.W);
            expect(v9.Y.W.P).to.equal("Test");
        end);
    end);
end;