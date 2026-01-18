return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.SelectFirst1D);
    describe("Array/SelectFirst1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should select nothing on an empty array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(v0({}, function() --[[ Line: 6 ]]

            end)).never.to.be.ok();
        end);
        it("should select the first item in an array for a return-true function", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                1
            }, function() --[[ Line: 10 ]]
                return true;
            end)).to.equal(1);
        end);
        it("should select the first item greater than some number", function() --[[ Line: 15 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                1, 
                2, 
                4, 
                8, 
                16, 
                32
            }, function(v1) --[[ Line: 16 ]]
                return v1 >= 8;
            end)).to.equal(8);
        end);
        it("should select the first index greater than some number", function() --[[ Line: 21 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                1, 
                2, 
                4, 
                8, 
                16, 
                32
            }, function(_, v3) --[[ Line: 22 ]]
                return v3 >= 3;
            end)).to.equal(4);
        end);
    end);
end;