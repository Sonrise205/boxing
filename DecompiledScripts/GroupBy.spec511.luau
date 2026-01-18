return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.GroupBy);
    describe("Map/GroupBy", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should group all by a sample value", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = {
                X = {
                    ID = "P"
                }, 
                Y = {
                    ID = "Q"
                }, 
                Z = {
                    ID = "R"
                }
            };
            local v3 = v0(v1, function(_) --[[ Line: 12 ]]
                return "Group";
            end);
            expect(v3.Group).to.be.ok();
            expect(v3.Group.X.ID).to.equal("P");
            expect(v3.Group.Y.ID).to.equal("Q");
            expect(v3.Group.Z.ID).to.equal("R");
        end);
        it("should group by a category value", function() --[[ Line: 22 ]]
            -- upvalues: v0 (ref)
            local v4 = {
                Item1 = {
                    Category = "X"
                }, 
                Item2 = {
                    Category = "Y"
                }, 
                Item3 = {
                    Category = "X"
                }
            };
            local v6 = v0(v4, function(v5) --[[ Line: 29 ]]
                return v5.Category;
            end);
            expect(v6.X).to.be.ok();
            expect(v6.X.Item1.Category).to.equal("X");
            expect(v6.X.Item3.Category).to.equal("X");
            expect(v6.Y).to.be.ok();
            expect(v6.Y.Item2.Category).to.equal("Y");
        end);
        it("should create no output categorization given a nil category", function() --[[ Line: 40 ]]
            -- upvalues: v0 (ref)
            local v7 = {
                Item1 = {
                    Category = "X"
                }, 
                Item2 = {
                    Category = nil
                }
            };
            local v9 = v0(v7, function(v8) --[[ Line: 46 ]]
                return v8.Category;
            end);
            expect(v9.X).to.be.ok();
            expect(next(v9, "X")).never.to.be.ok();
        end);
    end);
end;