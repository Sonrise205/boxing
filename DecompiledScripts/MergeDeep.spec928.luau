return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.MergeDeep);
    describe("Map/MergeDeep", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return the second table for two merged blank tables", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = {};
            local v2 = {};
            local v3 = v0(v1, v2);
            expect(v3).to.be.a("table");
            expect(next(v3)).to.equal(nil);
            expect(v2).to.equal(v3);
            local v4 = v0(v2, v1);
            expect(v4).to.be.a("table");
            expect(next(v4)).to.equal(nil);
            expect(v1).to.equal(v4);
        end);
        it("should merge some flat values in and return a new table", function() --[[ Line: 20 ]]
            -- upvalues: v0 (ref)
            local v5 = {
                A = 1, 
                B = 2
            };
            local v6 = {
                C = 3, 
                D = 4
            };
            local v7 = v0(v5, v6);
            expect(v7).to.be.a("table");
            expect(v7.A).to.equal(1);
            expect(v7.B).to.equal(2);
            expect(v7.C).to.equal(3);
            expect(v7.D).to.equal(4);
            expect(v5).never.to.equal(v7);
            expect(v6).never.to.equal(v7);
        end);
        it("should merge two nested values together and return create new tables for modified levels", function() --[[ Line: 40 ]]
            -- upvalues: v0 (ref)
            local v8 = {
                P = 1, 
                Q = {
                    R = 2
                }
            };
            local v9 = {
                Q = {
                    S = 3
                }
            };
            local v10 = v0(v8, v9);
            expect(v10).to.be.a("table");
            expect(v10.P).to.equal(1);
            expect(v10.Q).to.be.a("table");
            expect(v10.Q.R).to.equal(2);
            expect(v10.Q.S).to.equal(3);
            expect(v10.Q).never.to.equal(v8.Q);
            expect(v10.Q).never.to.equal(v9.Q);
            local v11 = v0(v9, v8);
            expect(v11).to.be.a("table");
            expect(v11.P).to.equal(1);
            expect(v11.Q).to.be.a("table");
            expect(v11.Q.R).to.equal(2);
            expect(v11.Q.S).to.equal(3);
            expect(v11.Q).never.to.equal(v8.Q);
            expect(v11.Q).never.to.equal(v9.Q);
        end);
        it("should keep unmodified sub-tables untouched", function() --[[ Line: 72 ]]
            -- upvalues: v0 (ref)
            local v12 = {
                A = {}, 
                B = {
                    Test = true
                }
            };
            local v13 = {
                B = {
                    C = {}
                }
            };
            local v14 = v0(v12, v13);
            expect(v14).to.be.a("table");
            expect(v14.A).to.equal(v12.A);
            expect(v14.B).to.be.a("table");
            expect(v14.B.Test).to.equal(true);
            expect(v14.B.C).to.be.a("table");
            expect(v14.B).never.to.equal(v12.B);
            expect(v14.B).never.to.equal(v13.B);
            expect(v14.B.C).to.equal(v13.B.C);
        end);
        it("should return the original table when both tables are the same", function() --[[ Line: 96 ]]
            -- upvalues: v0 (ref)
            local v15 = {
                P = true, 
                Q = true, 
                R = true
            };
            local v16 = v0(v15, v15);
            expect(v16).to.equal(v15);
            expect(v16).to.equal(v15);
        end);
    end);
end;