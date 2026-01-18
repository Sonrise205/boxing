return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Filter);
    describe("Map/Filter", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return a blank table for no data", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({}, function() --[[ Line: 6 ]]
                return true;
            end);
            expect(next(v1)).never.to.be.ok();
        end);
        it("should return all items for true condition", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                A = 1, 
                B = 2, 
                C = 3
            }, function() --[[ Line: 14 ]]
                return true;
            end);
            expect(v2.A).to.equal(1);
            expect(v2.B).to.equal(2);
            expect(v2.C).to.equal(3);
        end);
        it("should return all items greater than 3", function() --[[ Line: 23 ]]
            -- upvalues: v0 (ref)
            local v4 = v0({
                A = 2, 
                B = 4, 
                C = 8
            }, function(v3) --[[ Line: 24 ]]
                return v3 > 3;
            end);
            expect(v4.A).never.to.be.ok();
            expect(v4.B).to.equal(4);
            expect(v4.C).to.equal(8);
        end);
        it("should pass the keys", function() --[[ Line: 33 ]]
            -- upvalues: v0 (ref)
            local v8 = v0({
                A = 2, 
                B = 4, 
                C = 8
            }, function(_, v6) --[[ Line: 34 ]]
                local v7 = true;
                if v6 ~= "A" then
                    v7 = v6 == "B";
                end;
                return v7;
            end);
            expect(v8.A).to.equal(2);
            expect(v8.B).to.equal(4);
            expect(v8.C).never.to.be.ok();
        end);
    end);
end;