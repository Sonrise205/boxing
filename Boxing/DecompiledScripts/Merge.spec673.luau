return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Merge);
    describe("Map/Merge", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return the left table if the right is blank", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = {
                X = 1
            };
            expect(v0(v1, {})).to.equal(v1);
        end);
        it("should return the right table if the left is blank", function() --[[ Line: 12 ]]
            -- upvalues: v0 (ref)
            local v2 = {};
            local v3 = {
                X = 1
            };
            expect(v0(v2, v3)).to.equal(v3);
        end);
        it("should return a flat merge of two tables", function() --[[ Line: 19 ]]
            -- upvalues: v0 (ref)
            local v4 = {
                X = 1, 
                Y = 2
            };
            local v5 = {
                Z = 3, 
                W = 4
            };
            local v6 = v0(v4, v5);
            expect(v6).to.be.ok();
            expect(v6).to.never.equal(v4);
            expect(v6).to.never.equal(v5);
            expect(v6.X).to.equal(1);
            expect(v6.Y).to.equal(2);
            expect(v6.Z).to.equal(3);
            expect(v6.W).to.equal(4);
        end);
        it("should overwrite values in the left table with values from the right", function() --[[ Line: 33 ]]
            -- upvalues: v0 (ref)
            local v7 = {
                X = 1, 
                Y = 2
            };
            local v8 = {
                Y = 3, 
                Z = 4
            };
            local v9 = v0(v7, v8);
            expect(v9).to.be.ok();
            expect(v9).to.never.equal(v7);
            expect(v9).to.never.equal(v8);
            expect(v9.X).to.equal(1);
            expect(v9.Y).to.equal(3);
            expect(v9.Z).to.equal(4);
        end);
    end);
end;