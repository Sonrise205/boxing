return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Map);
    describe("Map/Map", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return a blank array if passed in a blank array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v3 = v0({}, function(v1, v2) --[[ Line: 6 ]]
                return v2, v1;
            end);
            expect(next(v3)).to.equal(nil);
        end);
        it("should return all items given a return-same-value function", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            local v5 = v0({
                A = 1, 
                B = 2
            }, function(v4) --[[ Line: 14 ]]
                return v4;
            end);
            expect(v5.A).to.equal(1);
            expect(v5.B).to.equal(2);
        end);
        it("should pass in keys and allow for custom keys", function() --[[ Line: 22 ]]
            -- upvalues: v0 (ref)
            local v8 = v0({
                A = 1, 
                B = 2
            }, function(v6, v7) --[[ Line: 23 ]]
                return v6, v7:lower();
            end);
            expect(v8.a).to.equal(1);
            expect(v8.b).to.equal(2);
            expect(v8.A).never.to.be.ok();
            expect(v8.B).never.to.be.ok();
        end);
    end);
end;