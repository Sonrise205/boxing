return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Merge);
    describe("Array/Merge", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return the 1st array when the 2nd is empty", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = {
                1, 
                2, 
                3
            };
            local v2 = v0(v1, {});
            expect(v2).to.be.a("table");
            expect(v2).to.be.equal(v1);
        end);
        it("should return the 2nd array when the 1st is empty", function() --[[ Line: 14 ]]
            -- upvalues: v0 (ref)
            local v3 = {};
            local v4 = {
                1, 
                2, 
                3
            };
            local v5 = v0(v3, v4);
            expect(v5).to.be.a("table");
            expect(v5).to.be.equal(v4);
        end);
        it("should return a new array when both are non-empty", function() --[[ Line: 23 ]]
            -- upvalues: v0 (ref)
            local v6 = {
                1, 
                2, 
                3
            };
            local v7 = {
                4, 
                5, 
                6
            };
            local v8 = v0(v6, v7);
            expect(v8).to.be.a("table");
            expect(v8).to.never.be.equal(v6);
            expect(v8).to.never.be.equal(v7);
        end);
        it("should return a new array with the contents of both arrays", function() --[[ Line: 33 ]]
            -- upvalues: v0 (ref)
            local v9 = v0({
                1, 
                2, 
                3
            }, {
                4, 
                5, 
                6
            });
            expect(v9).to.be.a("table");
            expect(v9[1]).to.equal(1);
            expect(v9[2]).to.equal(2);
            expect(v9[3]).to.equal(3);
            expect(v9[4]).to.equal(4);
            expect(v9[5]).to.equal(5);
            expect(v9[6]).to.equal(6);
        end);
        it("should return the same array when both are the same", function() --[[ Line: 47 ]]
            -- upvalues: v0 (ref)
            local v10 = {
                1, 
                2, 
                3
            };
            local v11 = v0(v10, v10);
            expect(v11).to.be.a("table");
            expect(v11).to.be.equal(v10);
            expect(v11).to.be.equal(v10);
        end);
    end);
end;