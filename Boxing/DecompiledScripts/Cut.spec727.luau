return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Cut);
    describe("Array/Cut", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return the first element given range 1, 1", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({
                1234
            }, 1, 1);
            expect(v1[1]).to.equal(1234);
        end);
        it("should return the middle two elements of a 4-item array given range 2, 3", function() --[[ Line: 10 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                1, 
                2, 
                3, 
                4
            }, 2, 3);
            expect(v2[1]).to.equal(2);
            expect(v2[2]).to.equal(3);
            expect(v2[3]).never.to.be.ok();
        end);
        it("should throw an error if either index is less than 1", function() --[[ Line: 17 ]]
            -- upvalues: v0 (ref)
            expect(function() --[[ Line: 18 ]]
                -- upvalues: v0 (ref)
                v0({}, 0, 1);
            end).to.throw();
            expect(function() --[[ Line: 22 ]]
                -- upvalues: v0 (ref)
                v0({}, 1, 0);
            end).to.throw();
        end);
        it("should throw an error if either index is greater than the array length", function() --[[ Line: 27 ]]
            -- upvalues: v0 (ref)
            expect(function() --[[ Line: 28 ]]
                -- upvalues: v0 (ref)
                v0({
                    1, 
                    2
                }, 1, 3);
            end).to.throw();
            expect(function() --[[ Line: 32 ]]
                -- upvalues: v0 (ref)
                v0({
                    1, 
                    2
                }, 3, 1);
            end).to.throw();
        end);
        it("should return the original array if the range is equivalent to the array's length", function() --[[ Line: 37 ]]
            -- upvalues: v0 (ref)
            local v3 = {
                1, 
                2, 
                3, 
                4
            };
            local v4 = v0(v3, 1, 4);
            expect(v4).to.equal(v3);
        end);
        it("should cut backwards", function() --[[ Line: 44 ]]
            -- upvalues: v0 (ref)
            local v5 = v0({
                1, 
                2, 
                3, 
                4
            }, 3, 1);
            expect(v5[1]).to.equal(3);
            expect(v5[2]).to.equal(2);
            expect(v5[3]).to.equal(1);
        end);
    end);
end;