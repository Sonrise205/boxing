return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.FoldLeft);
    describe("Array/FoldLeft", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should not call on an empty table", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = false;
            v0({}, function() --[[ Line: 8 ]]
                -- upvalues: v1 (ref)
                v1 = true;
            end, 1);
            expect(v1).to.equal(false);
        end);
        it("should return an initial value with no operations", function() --[[ Line: 15 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({}, function() --[[ Line: 16 ]]

            end, 1);
            expect(v2).to.equal(1);
        end);
        it("should call in order", function() --[[ Line: 21 ]]
            -- upvalues: v0 (ref)
            local v3 = {};
            v0({
                1, 
                2, 
                3, 
                4
            }, function(_, _, v6) --[[ Line: 24 ]]
                -- upvalues: v3 (copy)
                table.insert(v3, v6);
            end);
            for v7 = 1, 4 do
                expect(v3[v7]).to.equal(v7);
            end;
        end);
        it("should correctly give the size of the array", function() --[[ Line: 33 ]]
            -- upvalues: v0 (ref)
            v0({
                1, 
                2, 
                3, 
                4
            }, function(_, _, _, v11) --[[ Line: 34 ]]
                expect(v11).to.equal(4);
            end);
        end);
        it("should sum up some values with a sum function", function() --[[ Line: 39 ]]
            -- upvalues: v0 (ref)
            local v14 = v0({
                1, 
                2, 
                3, 
                4
            }, function(v12, v13) --[[ Line: 40 ]]
                return v12 + v13;
            end, 0);
            expect(v14).to.equal(10);
        end);
    end);
end;