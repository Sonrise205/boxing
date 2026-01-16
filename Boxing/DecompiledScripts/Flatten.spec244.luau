return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.Flatten);
    describe("Map/Flatten", function() --[[ Line: 4 ]]
        -- upvalues: v0 (copy)
        it("should return a blank table for no data", function() --[[ Line: 5 ]]
            -- upvalues: v0 (ref)
            local v1 = v0({});
            expect(next(v1)).never.to.be.ok();
        end);
        it("should return a blank table for a nested series of empty tables", function() --[[ Line: 10 ]]
            -- upvalues: v0 (ref)
            local v2 = v0({
                X = {
                    Y = {}
                }, 
                Z = {}
            });
            expect(next(v2)).never.to.be.ok();
        end);
        it("should return the same items given a flat map", function() --[[ Line: 15 ]]
            -- upvalues: v0 (ref)
            local v3 = v0({
                A = 1, 
                B = 2, 
                C = 3
            });
            expect(v3.A).to.equal(1);
            expect(v3.B).to.equal(2);
            expect(v3.C).to.equal(3);
            local v4 = 0;
            for _ in v3 do
                v4 = v4 + 1;
            end;
            expect(v4).to.equal(3);
        end);
        it("should return the primitive items given a nested map", function() --[[ Line: 30 ]]
            -- upvalues: v0 (ref)
            local v6 = v0({
                A = 1, 
                B = {
                    C = 2, 
                    D = 3
                }
            });
            expect(v6.A).to.equal(1);
            expect(v6.C).to.equal(2);
            expect(v6.D).to.equal(3);
            local v7 = 0;
            for _ in v6 do
                v7 = v7 + 1;
            end;
            expect(v7).to.equal(3);
        end);
        it("should return the primitive items given a deeply nested map", function() --[[ Line: 45 ]]
            -- upvalues: v0 (ref)
            local v9 = v0({
                A = 1, 
                B = {
                    C = 2, 
                    D = {
                        E = 3, 
                        F = 4
                    }
                }, 
                X = {}, 
                Y = {}
            });
            expect(v9.A).to.equal(1);
            expect(v9.C).to.equal(2);
            expect(v9.E).to.equal(3);
            expect(v9.F).to.equal(4);
            local v10 = 0;
            for _ in v9 do
                v10 = v10 + 1;
            end;
            expect(v10).to.equal(4);
        end);
        it("should return the primitive items given a deeply nested map with arrays", function() --[[ Line: 61 ]]
            -- upvalues: v0 (ref)
            local v12 = v0({
                A = 1, 
                B = {
                    C = 2, 
                    D = {
                        E = 3, 
                        F = 4
                    }
                }, 
                X = {}, 
                Y = {}, 
                Z = {
                    1, 
                    2, 
                    3, 
                    4
                }
            });
            expect(v12.A).to.equal(1);
            expect(v12.C).to.equal(2);
            expect(v12.E).to.equal(3);
            expect(v12.F).to.equal(4);
            expect(v12[1]).to.equal(1);
            expect(v12[2]).to.equal(2);
            expect(v12[3]).to.equal(3);
            expect(v12[4]).to.equal(4);
            local v13 = 0;
            for _ in v12 do
                v13 = v13 + 1;
            end;
            expect(v13).to.equal(8);
        end);
        it("should limit the depth given a 2nd argument", function() --[[ Line: 81 ]]
            -- upvalues: v0 (ref)
            local v15 = v0({
                P = 1, 
                Q = 2, 
                R = 3, 
                X = {
                    S = 4, 
                    T = 5, 
                    U = 6
                }
            }, 1);
            expect(v15.P).to.equal(1);
            expect(v15.Q).to.equal(2);
            expect(v15.R).to.equal(3);
            expect(v15.S).never.to.be.ok();
            expect(v15.T).never.to.be.ok();
            expect(v15.U).never.to.be.ok();
            v15 = v0({
                P = 1, 
                Q = 2, 
                R = 3, 
                X = {
                    S = 4, 
                    T = 5, 
                    U = 6
                }
            }, 2);
            expect(v15.P).to.equal(1);
            expect(v15.Q).to.equal(2);
            expect(v15.R).to.equal(3);
            expect(v15.S).to.equal(4);
            expect(v15.T).to.equal(5);
            expect(v15.U).to.equal(6);
        end);
    end);
end;