local function v0(...) --[[ Line: 4 ]] --[[ Name: anyfn ]]
    return {};
end;
it = it or v0;
expect = expect or v0;
describe = describe or v0;
return function() --[[ Line: 9 ]]
    local v1 = require(script.Parent);
    describe("XSignal.new", function() --[[ Line: 12 ]]
        -- upvalues: v1 (copy)
        it("should construct", function() --[[ Line: 13 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 14 ]]
                -- upvalues: v1 (ref)
                v1.new();
            end).never.to.throw();
        end);
        it("should reject non-function types as first arg", function() --[[ Line: 19 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 20 ]]
                -- upvalues: v1 (ref)
                v1.new(1);
            end).to.throw();
        end);
        it("should accept a function as first arg", function() --[[ Line: 25 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 26 ]]
                -- upvalues: v1 (ref)
                v1.new(function() --[[ Line: 27 ]]

                end);
            end).never.to.throw();
        end);
        it("should accept a validator function", function() --[[ Line: 31 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 32 ]]
                -- upvalues: v1 (ref)
                v1.new(function(v2, v3) --[[ Line: 33 ]]
                    local v4 = false;
                    if typeof(v2) == "number" then
                        v4 = true;
                        if v3 ~= nil then
                            v4 = typeof(v3) == "string";
                        end;
                    end;
                    assert(v4, "Type mismatch");
                end);
            end).never.to.throw();
        end);
    end);
    describe("XSignal.fromExtension", function() --[[ Line: 40 ]]
        -- upvalues: v1 (copy)
        it("should throw when no XSignals to extend are passed", function() --[[ Line: 41 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 42 ]]
                -- upvalues: v1 (ref)
                v1.fromExtension();
            end).to.throw();
            expect(function() --[[ Line: 46 ]]
                -- upvalues: v1 (ref)
                v1.fromExtension({});
            end).to.throw();
        end);
        it("should create a new XSignal which replicates firing from a single XSignal", function() --[[ Line: 51 ]]
            -- upvalues: v1 (ref)
            local v5 = {};
            local v6 = v1.new();
            local v7 = v1.fromExtension({
                v6
            });
            local v8 = nil;
            v7:Connect(function(...) --[[ Line: 58 ]]
                -- upvalues: v8 (ref)
                v8 = {
                    ...
                };
            end);
            v6:Fire(1, v5);
            expect(v8).to.be.ok();
            expect(v8).to.be.a("table");
            expect(v8[1]).to.equal(1);
            expect(v8[2]).to.equal(v5);
        end);
        it("should create a new XSignal which replicates firing from multiple XSignals", function() --[[ Line: 70 ]]
            -- upvalues: v1 (ref)
            local v9 = {};
            local v10 = {};
            local v11 = v1.new();
            local v12 = v1.new();
            local v13 = v1.fromExtension({
                v11, 
                v12
            });
            local v14 = nil;
            v13:Connect(function(...) --[[ Line: 81 ]]
                -- upvalues: v14 (ref)
                v14 = {
                    ...
                };
            end);
            v11:Fire(1, v9);
            expect(v14).to.be.ok();
            expect(v14).to.be.a("table");
            expect(v14[1]).to.equal(1);
            expect(v14[2]).to.equal(v9);
            v11:Fire(2, v10);
            expect(v14).to.be.ok();
            expect(v14).to.be.a("table");
            expect(v14[1]).to.equal(2);
            expect(v14[2]).to.equal(v10);
        end);
    end);
    describe("XSignal.Connect", function() --[[ Line: 99 ]]
        -- upvalues: v1 (copy)
        it("should throw when not given a function", function() --[[ Line: 100 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 101 ]]
                -- upvalues: v1 (ref)
                v1.new():Connect(1);
            end).to.throw();
        end);
        it("should accept a callback", function() --[[ Line: 106 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 107 ]]
                -- upvalues: v1 (ref)
                v1.new():Connect(function() --[[ Line: 108 ]]

                end);
            end).never.to.throw();
        end);
        it("should accept multiple callbacks", function() --[[ Line: 112 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 113 ]]
                -- upvalues: v1 (ref)
                local v15 = v1.new();
                v15:Connect(function() --[[ Line: 115 ]]

                end);
                v15:Connect(function() --[[ Line: 116 ]]

                end);
                v15:Connect(function() --[[ Line: 117 ]]

                end);
            end).never.to.throw();
        end);
        it("should allow disconnection", function() --[[ Line: 121 ]]
            -- upvalues: v1 (ref)
            local v16 = v1.new();
            local v17 = v16:Connect(function() --[[ Line: 124 ]]

            end);
            local v18 = v16:Connect(function() --[[ Line: 125 ]]

            end);
            local v19 = v16:Connect(function() --[[ Line: 126 ]]

            end);
            expect(v17.Disconnect).to.be.a("function");
            expect(v18.Disconnect).to.be.a("function");
            expect(v19.Disconnect).to.be.a("function");
            expect(function() --[[ Line: 132 ]]
                -- upvalues: v17 (copy), v18 (copy), v19 (copy)
                v17:Disconnect();
                v18:Disconnect();
                v19:Disconnect();
            end).never.to.throw();
        end);
    end);
    describe("XSignal.Connect + Immediate", function() --[[ Line: 141 ]]
        -- upvalues: v1 (copy)
        it("should immediately fire for new connections using callback (in order)", function() --[[ Line: 142 ]]
            -- upvalues: v1 (ref)
            local v21 = v1.new(nil, function(v20) --[[ Line: 143 ]]
                v20(1, 2);
                v20(3, 4);
                v20(5, 6);
            end);
            local v22 = {};
            v21:Connect(function(v23, v24) --[[ Line: 151 ]]
                -- upvalues: v22 (copy)
                table.insert(v22, v23);
                table.insert(v22, v24);
            end);
            expect(table.concat(v22)).to.equal("123456");
        end);
        it("should not fire disconnected connections for immediates with delays", function() --[[ Line: 159 ]]
            -- upvalues: v1 (ref)
            local v26 = v1.new(nil, function(v25) --[[ Line: 160 ]]
                v25(1, 2);
                task.wait(0.1);
                v25(3, 4);
            end);
            local v27 = {};
            v26:Connect(function(v28, v29) --[[ Line: 168 ]]
                -- upvalues: v27 (copy)
                table.insert(v27, v28);
                table.insert(v27, v29);
            end):Disconnect();
            expect(table.concat(v27)).to.equal("12");
            task.wait(0.1);
            expect(table.concat(v27)).to.equal("12");
        end);
        it("should apply a validator to immediates", function() --[[ Line: 180 ]]
            -- upvalues: v1 (ref)
            local v34 = v1.new(function(v30, v31) --[[ Line: 181 ]]
                local v32 = false;
                if typeof(v30) == "number" then
                    v32 = typeof(v31) == "number";
                end;
                assert(v32, "Type mismatch");
            end, function(v33) --[[ Line: 183 ]]
                v33(1, "H");
            end);
            local v35 = {};
            v34:Connect(function(v36, v37) --[[ Line: 189 ]]
                -- upvalues: v35 (copy)
                table.insert(v35, v36);
                table.insert(v35, v37);
            end);
            expect(table.concat(v35)).to.equal("");
        end);
    end);
    describe("XSignal.Once", function() --[[ Line: 198 ]]
        -- upvalues: v1 (copy)
        it("should reject incorrect type args", function() --[[ Line: 199 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 200 ]]
                -- upvalues: v1 (ref)
                v1.new():Once(1);
            end).to.throw();
        end);
        it("should accept correct arg type", function() --[[ Line: 205 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 206 ]]
                -- upvalues: v1 (ref)
                v1.new():Once(function() --[[ Line: 207 ]]

                end);
            end).never.to.throw();
        end);
        it("should only fire once & return the passed values", function() --[[ Line: 211 ]]
            -- upvalues: v1 (ref)
            local v38 = v1.new();
            local v39 = 0;
            local v40 = nil;
            local v41 = nil;
            v38:Once(function(v42, v43) --[[ Line: 217 ]]
                -- upvalues: v39 (ref), v40 (ref), v41 (ref)
                v39 = v39 + 1;
                v40 = v42;
                v41 = v43;
            end);
            expect(v39).to.equal(0);
            expect(v40).to.equal(nil);
            expect(v41).to.equal(nil);
            v38:Fire(10, 20);
            expect(v39).to.equal(1);
            expect(v40).to.equal(10);
            expect(v41).to.equal(20);
            v38:Fire(30, 40);
            expect(v39).to.equal(1);
            expect(v40).to.equal(10);
            expect(v41).to.equal(20);
        end);
        it("should return a connection & allow disconnection", function() --[[ Line: 236 ]]
            -- upvalues: v1 (ref)
            local v44 = v1.new();
            local v45 = 0;
            local v46 = v44:Once(function() --[[ Line: 241 ]]
                -- upvalues: v45 (ref)
                v45 = v45 + 1;
            end);
            expect(v46).to.be.ok();
            v46:Disconnect();
            expect(v45).to.equal(0);
            v44:Fire();
            expect(v45).to.equal(0);
        end);
    end);
    describe("XSignal.Once + Immediate", function() --[[ Line: 252 ]]
        -- upvalues: v1 (copy)
        it("should immediately fire, only once", function() --[[ Line: 253 ]]
            -- upvalues: v1 (ref)
            local v48 = v1.fromImmediate(function(v47) --[[ Line: 254 ]]
                v47(1, 2);
                v47(3, 4);
                v47(5, 6);
            end);
            local v49 = {};
            v48:Once(function(v50, v51) --[[ Line: 262 ]]
                -- upvalues: v49 (copy)
                table.insert(v49, v50);
                table.insert(v49, v51);
            end);
            expect(#v49).to.equal(2);
            expect(v49[1]).to.be.a("number");
            expect(v49[1]).to.equal(1);
            expect(v49[2]).to.be.a("number");
            expect(v49[2]).to.equal(2);
        end);
        it("should fire with delays, only once", function() --[[ Line: 274 ]]
            -- upvalues: v1 (ref)
            local v53 = v1.fromImmediate(function(v52) --[[ Line: 275 ]]
                task.wait(0.1);
                v52(1, 2);
                task.wait(0.1);
                v52(3, 4);
                task.wait(0.1);
                v52(5, 6);
            end);
            local v54 = {};
            v53:Once(function(v55, v56) --[[ Line: 286 ]]
                -- upvalues: v54 (copy)
                table.insert(v54, v55);
                table.insert(v54, v56);
            end);
            expect(#v54).to.equal(0);
            task.wait(0.1);
            expect(#v54).to.equal(2);
            expect(v54[1]).to.be.a("number");
            expect(v54[1]).to.equal(1);
            expect(v54[2]).to.be.a("number");
            expect(v54[2]).to.equal(2);
            task.wait(0.1);
            expect(#v54).to.equal(2);
        end);
    end);
    describe("XSignal.Fire", function() --[[ Line: 307 ]]
        -- upvalues: v1 (copy)
        it("should execute a connection", function() --[[ Line: 308 ]]
            -- upvalues: v1 (ref)
            local v57 = v1.new();
            local v58 = 0;
            v57:Connect(function() --[[ Line: 312 ]]
                -- upvalues: v58 (ref)
                v58 = v58 + 1;
            end);
            expect(v58).to.equal(0);
            v57:Fire();
            expect(v58).to.equal(1);
        end);
        it("should execute multiple connections", function() --[[ Line: 321 ]]
            -- upvalues: v1 (ref)
            local v59 = v1.new();
            local v60 = 0;
            v59:Connect(function() --[[ Line: 325 ]]
                -- upvalues: v60 (ref)
                v60 = v60 + 1;
            end);
            v59:Connect(function() --[[ Line: 329 ]]
                -- upvalues: v60 (ref)
                v60 = v60 + 1;
            end);
            v59:Connect(function() --[[ Line: 333 ]]
                -- upvalues: v60 (ref)
                v60 = v60 + 1;
            end);
            expect(v60).to.equal(0);
            v59:Fire();
            expect(v60).to.equal(3);
        end);
        it("should execute multiple connections async", function() --[[ Line: 342 ]]
            -- upvalues: v1 (ref)
            local v61 = v1.new();
            local v62 = 0;
            v61:Connect(function() --[[ Line: 346 ]]
                -- upvalues: v62 (ref)
                task.wait(0.1);
                v62 = v62 + 1;
            end);
            v61:Connect(function() --[[ Line: 351 ]]
                -- upvalues: v62 (ref)
                task.wait(0.1);
                v62 = v62 + 1;
            end);
            expect(v62).to.equal(0);
            v61:Fire();
            expect(v62).to.equal(0);
            task.wait(0.1);
            expect(v62).to.equal(2);
        end);
        it("should pass primitive data types", function() --[[ Line: 363 ]]
            -- upvalues: v1 (ref)
            local v63 = v1.new();
            v63:Connect(function(v64, v65, v66) --[[ Line: 366 ]]
                expect(v64).to.equal(1);
                expect(v65).to.equal("s");
                expect(v66).to.equal(true);
            end);
            v63:Fire(1, "s", true);
        end);
        it("should pass objects", function() --[[ Line: 375 ]]
            -- upvalues: v1 (ref)
            local v67 = v1.new();
            local v68 = {};
            local v69 = {};
            v67:Connect(function(v70, v71) --[[ Line: 380 ]]
                -- upvalues: v68 (copy), v69 (copy)
                expect(v70).to.equal(v68);
                expect(v71).to.equal(v69);
            end);
            v67:Fire(v68, v69);
        end);
        it("should not execute disconnected connections", function() --[[ Line: 388 ]]
            -- upvalues: v1 (ref)
            local v72 = v1.new();
            local v73 = 0;
            v72:Connect(function() --[[ Line: 392 ]]
                -- upvalues: v73 (ref)
                v73 = v73 + 1;
            end);
            v72:Connect(function() --[[ Line: 396 ]]
                -- upvalues: v73 (ref)
                v73 = v73 + 1;
            end);
            v72:Connect(function() --[[ Line: 400 ]]
                -- upvalues: v73 (ref)
                v73 = v73 + 1;
            end):Disconnect();
            v72:Fire();
            expect(v73).to.equal(2);
        end);
        it("should execute the validator before firing & pass all params", function() --[[ Line: 408 ]]
            -- upvalues: v1 (ref)
            local v77 = v1.new(function(v74, v75) --[[ Line: 409 ]]
                local v76 = false;
                if typeof(v74) == "number" then
                    v76 = true;
                    if v75 ~= nil then
                        v76 = typeof(v75) == "string";
                    end;
                end;
                assert(v76, "Type mismatch");
            end);
            expect(function() --[[ Line: 413 ]]
                -- upvalues: v77 (copy)
                v77:Fire(1, "");
            end).never.to.throw();
            expect(function() --[[ Line: 417 ]]
                -- upvalues: v77 (copy)
                v77:Fire(2);
            end).never.to.throw();
            expect(function() --[[ Line: 421 ]]
                -- upvalues: v77 (copy)
                v77:Fire();
            end).to.throw();
            expect(function() --[[ Line: 425 ]]
                -- upvalues: v77 (copy)
                v77:Fire("");
            end).to.throw();
        end);
    end);
    describe("XSignal.Wait", function() --[[ Line: 431 ]]
        -- upvalues: v1 (copy)
        it("should yield until the XSignal is fired", function() --[[ Line: 432 ]]
            -- upvalues: v1 (ref)
            local v78 = v1.new();
            task.delay(0.1, function() --[[ Line: 435 ]]
                -- upvalues: v78 (copy)
                v78:Fire();
            end);
            v78:Wait();
        end);
        it("should timeout and pass nil if no error is desired", function() --[[ Line: 442 ]]
            -- upvalues: v1 (ref)
            local v79 = v1.new();
            expect(v79:Wait(0.1)).to.equal(nil);
        end);
        it("should timeout and throw if an error is desired", function() --[[ Line: 447 ]]
            -- upvalues: v1 (ref)
            local v80 = v1.new();
            expect(pcall(function() --[[ Line: 450 ]]
                -- upvalues: v80 (copy)
                v80:Wait(0.1, true);
            end)).to.equal(false);
        end);
        it("should return the data passed to the XSignal", function() --[[ Line: 455 ]]
            -- upvalues: v1 (ref)
            local v81 = v1.new();
            local v82 = {};
            task.defer(function() --[[ Line: 459 ]]
                -- upvalues: v81 (copy), v82 (copy)
                v81:Fire(1, v82);
            end);
            local v83, v84 = v81:Wait();
            expect(v83).to.equal(1);
            expect(v84).to.equal(v82);
        end);
        it("should return immediately with Immediate", function() --[[ Line: 468 ]]
            -- upvalues: v1 (ref)
            local v85 = {};
            local v87, v88 = v1.new(nil, function(v86) --[[ Line: 470 ]]
                -- upvalues: v85 (copy)
                v86(3210, v85);
            end):Wait(0.1, true);
            expect(v87).to.equal(3210);
            expect(v88).to.equal(v85);
        end);
    end);
    describe("XSignal.Wait + Immediate", function() --[[ Line: 480 ]]
        -- upvalues: v1 (copy)
        it("should return immediately with Immediate", function() --[[ Line: 481 ]]
            -- upvalues: v1 (ref)
            local v89 = {};
            local v91, v92 = v1.fromImmediate(function(v90) --[[ Line: 483 ]]
                -- upvalues: v89 (copy)
                v90(8, v89);
            end):Wait(0.1, true);
            expect(v91).to.equal(8);
            expect(v92).to.equal(v89);
        end);
        it("should timeout if the Immediate takes too long", function() --[[ Line: 492 ]]
            -- upvalues: v1 (ref)
            local v93 = {};
            local v95, v96 = v1.fromImmediate(function(v94) --[[ Line: 494 ]]
                -- upvalues: v93 (copy)
                task.wait(0.1);
                v94(8, v93);
            end):Wait(0.01);
            expect(v95).to.equal(nil);
            expect(v96).to.equal(nil);
        end);
    end);
    describe("XSignal.WaitIndefinite", function() --[[ Line: 505 ]]
        -- upvalues: v1 (copy)
        it("should yield until the XSignal is fired", function() --[[ Line: 506 ]]
            -- upvalues: v1 (ref)
            local v97 = v1.new();
            task.delay(0.1, function() --[[ Line: 509 ]]
                -- upvalues: v97 (copy)
                v97:Fire();
            end);
            v97:WaitIndefinite();
        end);
        it("should return the data passed to the XSignal", function() --[[ Line: 516 ]]
            -- upvalues: v1 (ref)
            local v98 = v1.new();
            local v99 = {};
            task.defer(function() --[[ Line: 520 ]]
                -- upvalues: v98 (copy), v99 (copy)
                v98:Fire(1, v99);
            end);
            local v100, v101 = v98:WaitIndefinite();
            expect(v100).to.equal(1);
            expect(v101).to.equal(v99);
        end);
    end);
    describe("XSignal.CollectFull", function() --[[ Line: 530 ]]
        -- upvalues: v1 (copy)
        it("should reject non-numbers as the Count param", function() --[[ Line: 531 ]]
            -- upvalues: v1 (ref)
            local v102 = v1.new();
            expect(function() --[[ Line: 534 ]]
                -- upvalues: v102 (copy)
                v102:CollectFull("1");
            end).to.throw();
            expect(function() --[[ Line: 538 ]]
                -- upvalues: v102 (copy)
                v102:CollectFull({});
            end).to.throw();
            expect(function() --[[ Line: 542 ]]
                -- upvalues: v102 (copy)
                task.defer(function() --[[ Line: 543 ]]
                    -- upvalues: v102 (ref)
                    v102:Fire();
                end);
                v102:CollectFull(1);
            end).never.to.throw();
        end);
        it("should return a table with a single item for Count = 1", function() --[[ Line: 548 ]]
            -- upvalues: v1 (ref)
            local v103 = v1.new();
            task.defer(function() --[[ Line: 551 ]]
                -- upvalues: v103 (copy)
                v103:Fire(1);
            end);
            local v104 = v103:CollectFull(1);
            expect(v104).to.be.a("table");
            expect(#v104).to.equal(1);
            expect(v104[1]).to.be.a("table");
            expect(v104[1][1]).to.be.a("number");
            expect(v104[1][1]).to.equal(1);
            expect(v104[2]).to.equal(nil);
        end);
        it("should return a table with three items for Count = 3", function() --[[ Line: 564 ]]
            -- upvalues: v1 (ref)
            local v105 = v1.new();
            task.defer(function() --[[ Line: 567 ]]
                -- upvalues: v105 (copy)
                v105:Fire(1);
                v105:Fire(2);
                v105:Fire(3);
            end);
            local v106 = v105:CollectFull(3);
            expect(v106).to.be.a("table");
            expect(#v106).to.equal(3);
            expect(v106[1]).to.be.a("table");
            expect(v106[1][1]).to.be.a("number");
            expect(v106[1][1]).to.equal(1);
            expect(v106[2]).to.be.a("table");
            expect(v106[2][1]).to.be.a("number");
            expect(v106[2][1]).to.equal(2);
            expect(v106[3]).to.be.a("table");
            expect(v106[3][1]).to.be.a("number");
            expect(v106[3][1]).to.equal(3);
            expect(v106[4]).to.equal(nil);
        end);
        it("should timeout and pass nil if no error is desired", function() --[[ Line: 588 ]]
            -- upvalues: v1 (ref)
            local v107 = v1.new():CollectFull(3, 0.1);
            expect(v107).to.be.a("table");
            expect(#v107).to.equal(0);
        end);
    end);
    describe("XSignal.Collect", function() --[[ Line: 596 ]]
        -- upvalues: v1 (copy)
        it("should reject non-numbers as the Count param", function() --[[ Line: 597 ]]
            -- upvalues: v1 (ref)
            local v108 = v1.new();
            expect(function() --[[ Line: 600 ]]
                -- upvalues: v108 (copy)
                v108:Collect("1");
            end).to.throw();
            expect(function() --[[ Line: 604 ]]
                -- upvalues: v108 (copy)
                v108:Collect({});
            end).to.throw();
            expect(function() --[[ Line: 608 ]]
                -- upvalues: v108 (copy)
                task.defer(function() --[[ Line: 609 ]]
                    -- upvalues: v108 (ref)
                    v108:Fire();
                end);
                v108:Collect(1);
            end).never.to.throw();
        end);
        it("should return a table with a single item for Count = 1", function() --[[ Line: 614 ]]
            -- upvalues: v1 (ref)
            local v109 = v1.new();
            task.defer(function() --[[ Line: 617 ]]
                -- upvalues: v109 (copy)
                v109:Fire(1);
            end);
            local v110 = v109:Collect(1);
            expect(v110).to.be.a("table");
            expect(#v110).to.equal(1);
            expect(v110[1]).to.be.a("number");
            expect(v110[1]).to.equal(1);
            expect(v110[2]).to.equal(nil);
        end);
        it("should return a table with three items for Count = 3", function() --[[ Line: 629 ]]
            -- upvalues: v1 (ref)
            local v111 = v1.new();
            task.defer(function() --[[ Line: 632 ]]
                -- upvalues: v111 (copy)
                v111:Fire(1);
                v111:Fire(2);
                v111:Fire(3);
            end);
            local v112 = v111:Collect(3);
            expect(v112).to.be.a("table");
            expect(#v112).to.equal(3);
            expect(v112[1]).to.be.a("number");
            expect(v112[1]).to.equal(1);
            expect(v112[2]).to.be.a("number");
            expect(v112[2]).to.equal(2);
            expect(v112[3]).to.be.a("number");
            expect(v112[3]).to.equal(3);
            expect(v112[4]).to.equal(nil);
        end);
        it("should timeout and pass nil if no error is desired", function() --[[ Line: 650 ]]
            -- upvalues: v1 (ref)
            local v113 = v1.new():Collect(3, 0.1);
            expect(v113).to.be.a("table");
            expect(#v113).to.equal(0);
        end);
    end);
    describe("XSignal.CollectFull + Immediate", function() --[[ Line: 658 ]]
        -- upvalues: v1 (copy)
        it("should immediately return a table with a single item for Count = 1", function() --[[ Line: 659 ]]
            -- upvalues: v1 (ref)
            local v115 = v1.fromImmediate(function(v114) --[[ Line: 660 ]]
                v114(1);
            end):CollectFull(1);
            expect(v115).to.be.a("table");
            expect(#v115).to.equal(1);
            expect(v115[1]).to.be.a("table");
            expect(v115[1][1]).to.be.a("number");
            expect(v115[1][1]).to.equal(1);
            expect(v115[2]).to.equal(nil);
        end);
        it("should immediately return a table with three items for Count = 3", function() --[[ Line: 673 ]]
            -- upvalues: v1 (ref)
            local v117 = v1.fromImmediate(function(v116) --[[ Line: 674 ]]
                v116(1);
                v116(2);
                v116(3);
            end):CollectFull(3);
            expect(v117).to.be.a("table");
            expect(#v117).to.equal(3);
            expect(v117[1]).to.be.a("table");
            expect(v117[1][1]).to.be.a("number");
            expect(v117[1][1]).to.equal(1);
            expect(v117[2]).to.be.a("table");
            expect(v117[2][1]).to.be.a("number");
            expect(v117[2][1]).to.equal(2);
            expect(v117[3]).to.be.a("table");
            expect(v117[3][1]).to.be.a("number");
            expect(v117[3][1]).to.equal(3);
            expect(v117[4]).to.equal(nil);
        end);
        it("should handle delays between items", function() --[[ Line: 695 ]]
            -- upvalues: v1 (ref)
            local v119 = v1.fromImmediate(function(v118) --[[ Line: 696 ]]
                v118(1);
                task.wait(0.1);
                v118(2);
                task.wait(0.1);
                v118(3);
            end);
            local v120 = nil;
            task.spawn(function() --[[ Line: 706 ]]
                -- upvalues: v120 (ref), v119 (copy)
                v120 = v119:CollectFull(3);
            end);
            expect(v120).to.equal(nil);
            task.wait(0.3);
            expect(v120).to.be.a("table");
            expect(#v120).to.equal(3);
            expect(v120[1]).to.be.a("table");
            expect(v120[1][1]).to.be.a("number");
            expect(v120[1][1]).to.equal(1);
            expect(v120[2]).to.be.a("table");
            expect(v120[2][1]).to.be.a("number");
            expect(v120[2][1]).to.equal(2);
            expect(v120[3]).to.be.a("table");
            expect(v120[3][1]).to.be.a("number");
            expect(v120[3][1]).to.equal(3);
            expect(v120[4]).to.equal(nil);
        end);
        it("should only fill up the table until timeout is reached", function() --[[ Line: 727 ]]
            -- upvalues: v1 (ref)
            local v122 = v1.fromImmediate(function(v121) --[[ Line: 728 ]]
                v121(1);
                task.wait(0.1);
                v121(2);
                task.wait(0.1);
                v121(3);
            end):CollectFull(3, 0.15);
            expect(v122).to.be.a("table");
            expect(#v122).to.equal(2);
            expect(v122[1]).to.be.a("table");
            expect(v122[1][1]).to.be.a("number");
            expect(v122[1][1]).to.equal(1);
            expect(v122[2]).to.be.a("table");
            expect(v122[2][1]).to.be.a("number");
            expect(v122[2][1]).to.equal(2);
            expect(v122[3]).to.equal(nil);
        end);
    end);
    describe("XSignal.DisconnectAll", function() --[[ Line: 749 ]]
        -- upvalues: v1 (copy)
        it("should wipe all connections", function() --[[ Line: 750 ]]
            -- upvalues: v1 (ref)
            local v123 = v1.new();
            local v124 = 0;
            v123:Connect(function() --[[ Line: 754 ]]
                -- upvalues: v124 (ref)
                v124 = v124 + 1;
            end);
            v123:Connect(function() --[[ Line: 758 ]]
                -- upvalues: v124 (ref)
                v124 = v124 + 1;
            end);
            v123:Connect(function() --[[ Line: 762 ]]
                -- upvalues: v124 (ref)
                v124 = v124 + 1;
            end);
            expect(v124).to.equal(0);
            v123:DisconnectAll();
            v123:Fire();
            expect(v124).to.equal(0);
        end);
        it("should not error on multiple disconnections", function() --[[ Line: 772 ]]
            -- upvalues: v1 (ref)
            local v125 = v1.new();
            local v126 = v125:Connect(function() --[[ Line: 774 ]]

            end);
            v125:DisconnectAll();
            expect(function() --[[ Line: 777 ]]
                -- upvalues: v126 (copy)
                v126:Disconnect();
            end).never.to.throw();
        end);
        it("should not reconnect the whole chain when Reconnect is called, and should set Connected = false", function() --[[ Line: 782 ]]
            -- upvalues: v1 (ref)
            local v127 = v1.new();
            local v128 = 0;
            local v129 = v127:Connect(function() --[[ Line: 786 ]]
                -- upvalues: v128 (ref)
                v128 = v128 + 1;
            end);
            local v130 = v127:Connect(function() --[[ Line: 790 ]]
                -- upvalues: v128 (ref)
                v128 = v128 + 1;
            end);
            local v131 = v127:Connect(function() --[[ Line: 794 ]]
                -- upvalues: v128 (ref)
                v128 = v128 + 1;
            end);
            expect(v128).to.equal(0);
            v127:Fire();
            expect(v128).to.equal(3);
            v127:DisconnectAll();
            v127:Fire();
            expect(v128).to.equal(3);
            v128 = 0;
            v129:Reconnect();
            v127:Fire();
            expect(v128).to.equal(1);
            v128 = 0;
            v131:Reconnect();
            v127:Fire();
            expect(v128).to.equal(2);
            v128 = 0;
            v130:Reconnect();
            v127:Fire();
            expect(v128).to.equal(3);
        end);
    end);
    describe("XSignal.AwaitFirst", function() --[[ Line: 822 ]]
        -- upvalues: v1 (copy)
        it("should throw for incorrect args", function() --[[ Line: 823 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 824 ]]
                -- upvalues: v1 (ref)
                v1.AwaitFirst();
            end).to.throw();
            expect(function() --[[ Line: 828 ]]
                -- upvalues: v1 (ref)
                v1.AwaitFirst({});
            end).to.throw();
            expect(function() --[[ Line: 832 ]]
                -- upvalues: v1 (ref)
                v1.AwaitFirst({
                    v1.new()
                }, "");
            end).to.throw();
            expect(function() --[[ Line: 836 ]]
                -- upvalues: v1 (ref)
                v1.AwaitFirst({
                    v1.new()
                }, 0.1, "");
            end).to.throw();
        end);
        it("should timeout and pass nil if no error is desired", function() --[[ Line: 841 ]]
            -- upvalues: v1 (ref)
            expect(v1.AwaitFirst({
                v1.new()
            }, 0.1)).to.equal(nil);
        end);
        it("should timeout and throw if an error is desired", function() --[[ Line: 845 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 846 ]]
                -- upvalues: v1 (ref)
                v1.AwaitFirst({
                    v1.new()
                }, 0.1, true);
            end).to.throw();
        end);
        it("should resume a coroutine with the first XSignal to fire", function() --[[ Line: 851 ]]
            -- upvalues: v1 (ref)
            local v132 = v1.new();
            local v133 = v1.new();
            task.delay(0.1, function() --[[ Line: 855 ]]
                -- upvalues: v132 (copy)
                v132:Fire();
            end);
            v1.AwaitFirst({
                v132, 
                v133
            });
            task.delay(0.1, function() --[[ Line: 861 ]]
                -- upvalues: v133 (copy)
                v133:Fire();
            end);
            v1.AwaitFirst({
                v132, 
                v133
            });
        end);
        it("should return the standard 'Wait' data passed from the wrapped XSignal", function() --[[ Line: 868 ]]
            -- upvalues: v1 (ref)
            local v134 = {};
            local v135 = v1.new();
            local v136 = v1.new();
            task.delay(0.1, function() --[[ Line: 873 ]]
                -- upvalues: v135 (copy), v134 (copy)
                v135:Fire(1, v134);
            end);
            local v137, v138 = v1.AwaitFirst({
                v135, 
                v136
            });
            expect(v137).to.equal(1);
            expect(v138).to.equal(v134);
        end);
    end);
    describe("XSignal.AwaitFirst + Immediate", function() --[[ Line: 883 ]]
        -- upvalues: v1 (copy)
        it("should await the first of three Immediate XSignals", function() --[[ Line: 884 ]]
            -- upvalues: v1 (ref)
            local v140 = v1.fromImmediate(function(v139) --[[ Line: 885 ]]
                v139(1);
            end);
            local v142 = v1.fromImmediate(function(v141) --[[ Line: 888 ]]
                v141(2);
            end);
            local v144 = v1.fromImmediate(function(v143) --[[ Line: 891 ]]
                v143(3);
            end);
            expect(v1.AwaitFirst({
                v140, 
                v142, 
                v144
            })).to.equal(1);
        end);
        it("should await and only return the first value of the first Immediate XSignal", function() --[[ Line: 898 ]]
            -- upvalues: v1 (ref)
            local v146 = v1.fromImmediate(function(v145) --[[ Line: 899 ]]
                v145(1);
                v145(2);
            end);
            local v148 = v1.fromImmediate(function(v147) --[[ Line: 903 ]]
                v147(3);
                v147(4);
            end);
            expect(v1.AwaitFirst({
                v146, 
                v148
            })).to.equal(1);
        end);
        it("should await with a timeout and return nil", function() --[[ Line: 911 ]]
            -- upvalues: v1 (ref)
            local v150 = v1.fromImmediate(function(v149) --[[ Line: 912 ]]
                task.wait(0.1);
                v149(1);
            end);
            local v152 = v1.fromImmediate(function(v151) --[[ Line: 916 ]]
                task.wait(0.1);
                v151(2);
            end);
            expect(v1.AwaitFirst({
                v150, 
                v152
            }, 0.05)).to.equal(nil);
        end);
        it("should handle yielding Immediate functions", function() --[[ Line: 924 ]]
            -- upvalues: v1 (ref)
            local v154 = v1.fromImmediate(function(v153) --[[ Line: 925 ]]
                task.wait(0.2);
                v153(1);
            end);
            local v156 = v1.fromImmediate(function(v155) --[[ Line: 929 ]]
                task.wait(0.1);
                v155(2);
            end);
            expect(v1.AwaitFirst({
                v154, 
                v156
            })).to.equal(2);
        end);
    end);
    describe("XSignal.AwaitAllFull", function() --[[ Line: 938 ]]
        -- upvalues: v1 (copy)
        it("should throw for incorrect args", function() --[[ Line: 939 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 940 ]]
                -- upvalues: v1 (ref)
                v1.AwaitAllFull();
            end).to.throw();
            expect(function() --[[ Line: 944 ]]
                -- upvalues: v1 (ref)
                v1.AwaitAllFull({});
            end).to.throw();
            expect(function() --[[ Line: 948 ]]
                -- upvalues: v1 (ref)
                v1.AwaitAllFull({
                    v1.new()
                }, "");
            end).to.throw();
            expect(function() --[[ Line: 952 ]]
                -- upvalues: v1 (ref)
                v1.AwaitAllFull({
                    v1.new()
                }, 0.1, "");
            end).to.throw();
        end);
        it("should timeout and pass a blank array if no error is desired", function() --[[ Line: 957 ]]
            -- upvalues: v1 (ref)
            expect(next(v1.AwaitAllFull({
                v1.new()
            }, 0.1))).to.equal(nil);
        end);
        it("should timeout and throw if an error is desired", function() --[[ Line: 961 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 962 ]]
                -- upvalues: v1 (ref)
                v1.AwaitAllFull({
                    v1.new()
                }, 0.1, true);
            end).to.throw();
        end);
        it("should await all XSignals, not just one", function() --[[ Line: 967 ]]
            -- upvalues: v1 (ref)
            local v157 = v1.new();
            local v158 = v1.new();
            local v159 = coroutine.running();
            task.delay(0.1, function() --[[ Line: 972 ]]
                -- upvalues: v157 (copy), v159 (copy), v158 (copy)
                v157:Fire();
                expect(coroutine.status(v159)).to.equal("suspended");
                task.wait(0.1);
                v158:Fire();
            end);
            v1.AwaitAllFull({
                v157, 
                v158
            });
        end);
        it("should return the standard 'Wait' data passed from the wrapped XSignals, in a two-dimensional array format, in the order they were passed into the function", function() --[[ Line: 983 ]]
            -- upvalues: v1 (ref)
            local v160 = {};
            local v161 = v1.new();
            local v162 = v1.new();
            local v163 = coroutine.running();
            task.delay(0.1, function() --[[ Line: 989 ]]
                -- upvalues: v161 (copy), v160 (copy), v163 (copy), v162 (copy)
                v161:Fire(1, v160);
                expect(coroutine.status(v163)).to.equal("suspended");
                task.wait(0.1);
                v162:Fire(2, v160);
            end);
            local v164 = v1.AwaitAllFull({
                v161, 
                v162
            });
            expect(v164).to.be.ok();
            expect(v164).to.be.a("table");
            expect(v164[1]).to.be.ok();
            expect(v164[1]).to.be.a("table");
            expect(v164[1][1]).to.equal(1);
            expect(v164[1][2]).to.equal(v160);
            expect(v164[2]).to.be.ok();
            expect(v164[2]).to.be.a("table");
            expect(v164[2][1]).to.equal(2);
            expect(v164[2][2]).to.equal(v160);
        end);
    end);
    describe("XSignal.AwaitAll", function() --[[ Line: 1011 ]]
        -- upvalues: v1 (copy)
        it("should return the standard 'Wait' data passed from the wrapped XSignals, in a one-dimensional array format, in the order they were passed into the function", function() --[[ Line: 1012 ]]
            -- upvalues: v1 (ref)
            local v165 = {};
            local v166 = v1.new();
            local v167 = v1.new();
            local v168 = coroutine.running();
            task.delay(0.1, function() --[[ Line: 1018 ]]
                -- upvalues: v166 (copy), v165 (copy), v168 (copy), v167 (copy)
                v166:Fire(1, v165);
                expect(coroutine.status(v168)).to.equal("suspended");
                task.wait(0.1);
                v167:Fire(2, v165);
            end);
            local v169 = v1.AwaitAll({
                v166, 
                v167
            });
            expect(v169).to.be.ok();
            expect(v169).to.be.a("table");
            expect(v169[1]).to.be.ok();
            expect(v169[1]).to.be.a("number");
            expect(v169[1]).to.equal(1);
            expect(v169[2]).to.be.ok();
            expect(v169[2]).to.be.a("number");
            expect(v169[2]).to.equal(2);
        end);
    end);
    describe("XSignal.AwaitAll + Immediate", function() --[[ Line: 1038 ]]
        -- upvalues: v1 (copy)
        it("should return with no delay given an Immediate function", function() --[[ Line: 1039 ]]
            -- upvalues: v1 (ref)
            local v171 = v1.fromImmediate(function(v170) --[[ Line: 1040 ]]
                v170(1);
            end);
            local v173 = v1.fromImmediate(function(v172) --[[ Line: 1043 ]]
                v172(2);
            end);
            local v174 = nil;
            task.spawn(function() --[[ Line: 1049 ]]
                -- upvalues: v174 (ref), v1 (ref), v171 (copy), v173 (copy)
                v174 = v1.AwaitAll({
                    v171, 
                    v173
                });
            end);
            expect(v174).to.be.ok();
            expect(v174).to.be.a("table");
            expect(v174[1]).to.be.ok();
            expect(v174[1]).to.be.a("number");
            expect(v174[1]).to.equal(1);
            expect(v174[2]).to.be.ok();
            expect(v174[2]).to.be.a("number");
            expect(v174[2]).to.equal(2);
        end);
        it("should return only the first value for multiple Immediate returns", function() --[[ Line: 1063 ]]
            -- upvalues: v1 (ref)
            local v176 = v1.fromImmediate(function(v175) --[[ Line: 1064 ]]
                v175(1);
                v175(2);
            end);
            local v178 = v1.fromImmediate(function(v177) --[[ Line: 1068 ]]
                v177(3);
                v177(4);
            end);
            local v179 = nil;
            task.spawn(function() --[[ Line: 1075 ]]
                -- upvalues: v179 (ref), v1 (ref), v176 (copy), v178 (copy)
                v179 = v1.AwaitAll({
                    v176, 
                    v178
                });
            end);
            expect(v179).to.be.ok();
            expect(v179).to.be.a("table");
            expect(v179[1]).to.be.ok();
            expect(v179[1]).to.be.a("number");
            expect(v179[1]).to.equal(1);
            expect(v179[2]).to.be.ok();
            expect(v179[2]).to.be.a("number");
            expect(v179[2]).to.equal(3);
        end);
    end);
end;