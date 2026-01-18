return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Shuffle);
    describe("Array/Shuffle", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return an empty array given an empty array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({});
            expect(next(v1)).never.to.be.ok();
        end);
        it("should return a one-item array given a one-item array", function() --[[ Line: 10 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                1
            });
            expect(v2[1]).to.equal(1);
        end);
        it("should shuffle items given a seed", function() --[[ Line: 15 ]]
            -- upvalues: v0 (ref)
            local v3 = {
                1, 
                2, 
                3, 
                4, 
                5, 
                6, 
                7, 
                8, 
                9, 
                10
            };
            local v4 = v0(v3, 100);
            local v5 = v0(v3, 100);
            local v6 = 0;
            local v7 = 0;
            local v8 = 0;
            local v9 = false;
            local v10 = false;
            for v11 = 1, #v4 do
                v6 = v6 + v3[v11];
                v7 = v7 + v4[v11];
                v8 = v8 + v5[v11];
                v9 = v9 or v4[v11] ~= v3[v11];
                v10 = v10 or v5[v11] ~= v3[v11];
                expect(v4[v11]).to.equal(v5[v11]);
            end;
            expect(v6).to.equal(v7);
            expect(v7).to.equal(v8);
            expect(v9).to.equal(true);
            expect(v10).to.equal(true);
        end);
    end);
end;