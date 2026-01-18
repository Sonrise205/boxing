return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.SelectRandom);
    describe("Array/SelectRandom", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return nil for an empty array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            expect(v0({})).to.equal(nil);
        end);
        it("should return the only item in a one-item array", function() --[[ Line: 9 ]]
            -- upvalues: v0 (ref)
            expect(v0({
                1
            })).to.equal(1);
        end);
        it("should return a random item in a two-item array", function() --[[ Line: 13 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({
                1, 
                2
            });
            local l_expect_0 = expect;
            local v3 = true;
            if v1 ~= 1 then
                v3 = v1 == 2;
            end;
            l_expect_0(v3).to.equal(true);
        end);
        it("should return a random item in a three-item array", function() --[[ Line: 19 ]]
            -- upvalues: v0 (ref)
            local v4 = v0({
                1, 
                2, 
                3
            });
            local l_expect_1 = expect;
            local v6 = true;
            if v4 ~= 1 then
                v6 = true;
                if v4 ~= 2 then
                    v6 = v4 == 3;
                end;
            end;
            l_expect_1(v6).to.equal(true);
        end);
        it("should accept a seed which selects the same item each time", function() --[[ Line: 25 ]]
            -- upvalues: v0 (ref)
            local v7 = {};
            for _ = 1, 10000 do
                table.insert(v7, math.random());
            end;
            local v9 = v0(v7, 1);
            local v10 = v0(v7, 1);
            local v11 = v0(v7, 1);
            local l_expect_2 = expect;
            local v13 = false;
            if v9 == v10 then
                v13 = v10 == v11;
            end;
            l_expect_2(v13).to.equal(true);
        end);
    end);
end;