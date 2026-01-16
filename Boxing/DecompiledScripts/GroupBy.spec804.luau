return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.GroupBy);
    describe("Array/GroupBy", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return an empty array from an empty array", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({}, function() --[[ Line: 6 ]]

            end);
            expect(v1).to.be.ok();
            expect(#v1).to.equal(0);
        end);
        it("should correctly group by 1 category with 1 item", function() --[[ Line: 11 ]]
            -- upvalues: v0 (ref)
            local v2 = {
                {
                    Category = "X", 
                    Value = 1
                }
            };
            local v4 = v0(v2, function(v3) --[[ Line: 16 ]]
                return v3.Category;
            end);
            expect(v4).to.be.ok();
            expect(v4.X).to.be.ok();
            expect(#v4.X).to.equal(1);
            expect(v4.X[1]).to.equal(v2[1]);
        end);
        it("should correctly group by 1 category with 2 items", function() --[[ Line: 26 ]]
            -- upvalues: v0 (ref)
            local v5 = {
                {
                    Category = "X", 
                    Value = 1
                }, 
                {
                    Category = "X", 
                    Value = 2
                }
            };
            local v7 = v0(v5, function(v6) --[[ Line: 32 ]]
                return v6.Category;
            end);
            expect(v7).to.be.ok();
            expect(v7.X).to.be.ok();
            expect(#v7.X).to.equal(2);
            expect(v7.X[1]).to.equal(v5[1]);
            expect(v7.X[2]).to.equal(v5[2]);
        end);
        it("should correctly group by 2 categories with 4 items", function() --[[ Line: 43 ]]
            -- upvalues: v0 (ref)
            local v8 = {
                {
                    Category = "X", 
                    Value = 1
                }, 
                {
                    Category = "X", 
                    Value = 2
                }, 
                {
                    Category = "Y", 
                    Value = 3
                }, 
                {
                    Category = "Y", 
                    Value = 4
                }
            };
            local v10 = v0(v8, function(v9) --[[ Line: 51 ]]
                return v9.Category;
            end);
            expect(v10).to.be.ok();
            expect(v10.X).to.be.ok();
            expect(#v10.X).to.equal(2);
            expect(v10.X[1]).to.equal(v8[1]);
            expect(v10.X[2]).to.equal(v8[2]);
            expect(v10.Y).to.be.ok();
            expect(#v10.Y).to.equal(2);
            expect(v10.Y[1]).to.equal(v8[3]);
            expect(v10.Y[2]).to.equal(v8[4]);
        end);
        it("should create no output categorization given a nil category", function() --[[ Line: 66 ]]
            -- upvalues: v0 (ref)
            local v11 = {
                {
                    Category = "X", 
                    Value = 1
                }, 
                {
                    Category = nil, 
                    Value = 2
                }
            };
            local v13 = v0(v11, function(v12) --[[ Line: 72 ]]
                return v12.Category;
            end);
            expect(v13).to.be.ok();
            expect(v13.X).to.be.ok();
            expect(next(v13, "X")).never.to.be.ok();
        end);
    end);
end;