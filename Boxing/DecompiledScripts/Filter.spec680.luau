return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Filter);
    describe("Array/Filter", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return a blank table for no data", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({}, function() --[[ Line: 6 ]]
                return true;
            end);
            expect(next(v1)).never.to.be.ok();
        end);
        it("should return all items in order for true condition", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                3, 
                2, 
                1
            }, function() --[[ Line: 14 ]]
                return true;
            end);
            expect(v2[1]).to.equal(3);
            expect(v2[2]).to.equal(2);
            expect(v2[3]).to.equal(1);
        end);
        it("should return no items for false condition", function() --[[ Line: 23 ]]
            -- upvalues: v0 (ref)
            local v3 = v0({
                3, 
                2, 
                1
            }, function() --[[ Line: 24 ]]
                return false;
            end);
            expect(next(v3)).never.to.be.ok();
        end);
        it("should filter all items larger than some value in order", function() --[[ Line: 31 ]]
            -- upvalues: v0 (ref)
            local v5 = v0({
                8, 
                4, 
                2, 
                1
            }, function(v4) --[[ Line: 32 ]]
                return v4 >= 4;
            end);
            expect(v5[1]).to.equal(8);
            expect(v5[2]).to.equal(4);
            expect(v5[3]).never.to.be.ok();
        end);
        it("should pass the index in order", function() --[[ Line: 41 ]]
            -- upvalues: v0 (ref)
            v0({
                1, 
                2, 
                3, 
                4
            }, function(v6, v7) --[[ Line: 42 ]]
                expect(v7).to.equal(v6);
                return true;
            end);
        end);
    end);
end;