return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.MutableUnresizable1D);
    describe("Map/MutableUnresizable1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should throw an error when attempting to write to non-existing keys", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = {
                X = 123
            };
            v0(v1);
            expect(function() --[[ Line: 9 ]]
                -- upvalues: v1 (copy)
                v1.A = 1;
            end).to.throw();
        end);
        it("should not throw an error when attempting to write to existing keys", function() --[[ Line: 14 ]]
            -- upvalues: v0 (ref)
            local v2 = {
                A = 1
            };
            v0(v2);
            expect(function() --[[ Line: 18 ]]
                -- upvalues: v2 (copy)
                v2.A = 2;
            end).never.to.throw();
        end);
    end);
end;