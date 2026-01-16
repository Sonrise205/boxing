return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.FromKeyValueArray);
    describe("Map/FromKeyValueArray", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return a blank map given an empty array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(next(v0({}))).never.to.be.ok();
        end);
        it("should create a map with one key-value pair", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({
                {
                    Key = "A", 
                    Value = 1
                }
            });
            expect(v1.A).to.equal(1);
        end);
        it("should create a map with key-value pairs", function() --[[ Line: 14 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                {
                    Key = "A", 
                    Value = 1
                }, 
                {
                    Key = "B", 
                    Value = 2
                }, 
                {
                    Key = "C", 
                    Value = 3
                }
            });
            expect(v2.A).to.equal(1);
            expect(v2.B).to.equal(2);
            expect(v2.C).to.equal(3);
        end);
    end);
end;