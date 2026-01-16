return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.MutableLockdown1D);
    describe("Map/MutableLockdown1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should throw an error when attempting to index existing keys", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = {
                X = 123
            };
            v0(v1);
            expect(function() --[[ Line: 9 ]]
                -- upvalues: v1 (copy)
                local _ = v1.X;
            end).to.throw();
        end);
        it("should throw an error when attempting to index existing non-existing keys", function() --[[ Line: 14 ]]
            -- upvalues: v0 (ref)
            local v3 = {
                X = 123
            };
            v0(v3);
            expect(function() --[[ Line: 18 ]]
                -- upvalues: v3 (copy)
                local _ = v3.Y;
            end).to.throw();
        end);
        it("should throw an error when attempting to write to existing keys", function() --[[ Line: 23 ]]
            -- upvalues: v0 (ref)
            local v5 = {
                A = 1
            };
            v0(v5);
            expect(function() --[[ Line: 27 ]]
                -- upvalues: v5 (copy)
                v5.A = 2;
            end).to.throw();
        end);
        it("should throw an error when attempting to write to non-existing keys", function() --[[ Line: 32 ]]
            -- upvalues: v0 (ref)
            local v6 = {
                X = 123
            };
            v0(v6);
            expect(function() --[[ Line: 36 ]]
                -- upvalues: v6 (copy)
                v6.A = 1;
            end).to.throw();
        end);
    end);
end;