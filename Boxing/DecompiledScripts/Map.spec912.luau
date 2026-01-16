return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Map);
    describe("Array/Map", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return a blank array if passed in a blank array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v3 = v0({}, function(v1, v2) --[[ Line: 6 ]]
                return v2, v1;
            end);
            expect(next(v3)).to.equal(nil);
        end);
        it("should return all items in an array with a function passing back the same value, in order", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            local v5 = v0({
                1, 
                2, 
                3, 
                4
            }, function(v4) --[[ Line: 14 ]]
                return v4;
            end);
            for v6 = 1, 4 do
                expect(v5[v6]).to.equal(v6);
            end;
        end);
        it("should double all items in an array with a double function, in order", function() --[[ Line: 23 ]]
            -- upvalues: v0 (ref)
            local v8 = v0({
                1, 
                2, 
                3, 
                4
            }, function(v7) --[[ Line: 24 ]]
                return v7 * 2;
            end);
            for v9 = 1, 4 do
                expect(v8[v9]).to.equal(v9 * 2);
            end;
        end);
        it("should ignore nil returns from the operation function", function() --[[ Line: 33 ]]
            -- upvalues: v0 (ref)
            local v11 = v0({
                1, 
                2, 
                3, 
                4
            }, function(v10) --[[ Line: 34 ]]
                if v10 < 3 then
                    return nil;
                else
                    return v10;
                end;
            end);
            expect(v11[1]).to.equal(3);
            expect(v11[2]).to.equal(4);
            expect(v11[3]).never.to.be.ok();
        end);
        it("should send the index to the operation function", function() --[[ Line: 47 ]]
            -- upvalues: v0 (ref)
            v0({
                2, 
                4, 
                6, 
                8
            }, function(v12, v13) --[[ Line: 48 ]]
                expect(v12 / 2).to.equal(v13);
            end);
        end);
    end);
end;