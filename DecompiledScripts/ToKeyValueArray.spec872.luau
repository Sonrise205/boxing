return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.ToKeyValueArray);
    describe("Map/ToKeyValueArray", function() --[[ Line: 4 ]]
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
            expect(v1[1].Key).to.equal("A");
            expect(v1[1].Value).to.equal(1);
        end);
        it("should return a key-value pair for each item in the table", function() --[[ Line: 16 ]]
            -- upvalues: v0 (ref)
            local v2 = false;
            local v3 = false;
            local v4 = false;
            local v5 = v0({
                A = 1, 
                B = 2, 
                C = 3
            });
            expect(#v5).to.equal(3);
            local _ = function(v6) --[[ Line: 20 ]] --[[ Name: Satisfied ]]
                -- upvalues: v5 (copy)
                for _, v8 in v5 do
                    if v6(v8) then
                        return true;
                    end;
                end;
                return false;
            end;
            local l_expect_0 = expect;
            local function v13(v11) --[[ Line: 30 ]]
                local v12 = false;
                if v11.Key == "A" then
                    v12 = v11.Value == 1;
                end;
                return v12;
            end;
            local v14;
            for _, v16 in v5 do
                if v13(v16) then
                    v14 = true;
                    v2 = true;
                end;
                if v2 then
                    break;
                end;
            end;
            if not v2 then
                v14 = false;
            end;
            v2 = false;
            l_expect_0(v14).to.equal(true);
            l_expect_0 = expect;
            v13 = function(v17) --[[ Line: 34 ]]
                local v18 = false;
                if v17.Key == "B" then
                    v18 = v17.Value == 2;
                end;
                return v18;
            end;
            for _, v20 in v5 do
                if v13(v20) then
                    v14 = true;
                    v3 = true;
                end;
                if v3 then
                    break;
                end;
            end;
            if not v3 then
                v14 = false;
            end;
            v3 = false;
            l_expect_0(v14).to.equal(true);
            l_expect_0 = expect;
            v13 = function(v21) --[[ Line: 38 ]]
                local v22 = false;
                if v21.Key == "C" then
                    v22 = v21.Value == 3;
                end;
                return v22;
            end;
            for _, v24 in v5 do
                if v13(v24) then
                    v14 = true;
                    v4 = true;
                end;
                if v4 then
                    break;
                end;
            end;
            if not v4 then
                v14 = false;
            end;
            v4 = false;
            l_expect_0(v14).to.equal(true);
        end);
    end);
end;