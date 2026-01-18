return function() --[[ Line: 1 ]]
    local v0 = require(script.Parent.SelectWeighted1D);
    local v1 = {
        {
            ID = "P", 
            Weight = 10
        }, 
        {
            ID = "Q", 
            Weight = 10
        }, 
        {
            ID = "R", 
            Weight = 30
        }, 
        {
            ID = "S", 
            Weight = 5
        }, 
        {
            ID = "T", 
            Weight = 5
        }, 
        {
            ID = "U", 
            Weight = 15
        }, 
        {
            ID = "V", 
            Weight = 25
        }
    };
    describe("Array/SelectWeighted1D", function() --[[ Line: 14 ]]
        -- upvalues: v0 (copy), v1 (copy)
        it("should always select a weighted value", function() --[[ Line: 15 ]]
            -- upvalues: v0 (ref), v1 (ref)
            for _ = 1, 1000000 do
                expect(v0(v1, "Weight")).to.be.ok();
            end;
        end);
        it("should select the same weighted value with a seed", function() --[[ Line: 21 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v3 = nil;
            for _ = 1, 1000000 do
                local v5 = v0(v1, "Weight", 1);
                if v3 then
                    expect(v5).to.equal(v3);
                end;
                v3 = v5;
            end;
        end);
        it("should produce distributions similar to the weights", function() --[[ Line: 35 ]]
            -- upvalues: v0 (ref), v1 (ref)
            local v6 = {};
            for _ = 1, 1000000 do
                local v8 = v0(v1, "Weight");
                v6[v8.ID] = (v6[v8.ID] or 0) + 1;
            end;
            expect(v6.P).to.be.near(100000, 10000);
            expect(v6.Q).to.be.near(100000, 10000);
            expect(v6.R).to.be.near(300000, 30000);
            expect(v6.S).to.be.near(50000, 5000);
            expect(v6.T).to.be.near(50000, 5000);
            expect(v6.U).to.be.near(150000, 15000);
            expect(v6.V).to.be.near(250000, 25000);
        end);
    end);
end;