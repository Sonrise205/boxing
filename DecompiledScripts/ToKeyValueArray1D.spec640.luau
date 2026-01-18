return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.ToKeyValueArray1D);
    describe("Map/ToKeyValueArray1D", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return a blank array given an empty table", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(#v0({})).to.equal(0);
        end);
        it("should return a single key-value pair for a single item table", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({
                A = 1
            });
            expect(#v1).to.equal(1);
            expect(v1[1][1]).to.equal("A");
            expect(v1[1][2]).to.equal(1);
        end);
        it("should return a key-value pair for each item in the table", function() --[[ Line: 16 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                A = 1, 
                B = 2, 
                C = 3
            });
            expect(#v2).to.equal(3);
            local function v6(v3) --[[ Line: 20 ]] --[[ Name: ArrayItemSatisfies ]]
                -- upvalues: v2 (copy)
                for _, v5 in v2 do
                    if v3(v5) then
                        return true;
                    end;
                end;
            end;
            expect(v6(function(v7) --[[ Line: 28 ]]
                local v8 = false;
                if v7[1] == "A" then
                    v8 = v7[2] == 1;
                end;
                return v8;
            end)).to.equal(true);
            expect(v6(function(v9) --[[ Line: 32 ]]
                local v10 = false;
                if v9[1] == "B" then
                    v10 = v9[2] == 2;
                end;
                return v10;
            end)).to.equal(true);
            expect(v6(function(v11) --[[ Line: 36 ]]
                local v12 = false;
                if v11[1] == "C" then
                    v12 = v11[2] == 3;
                end;
                return v12;
            end)).to.equal(true);
        end);
    end);
end;