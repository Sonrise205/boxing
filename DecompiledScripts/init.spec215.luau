local function v0(...) --[[ Line: 4 ]] --[[ Name: anyfn ]]
    return {};
end;
it = it or v0;
expect = expect or v0;
describe = describe or v0;
return function() --[[ Line: 9 ]]
    local v1 = require(script.Parent);
    v1.SetErrorReporter(nil);
    describe("Count", function() --[[ Line: 13 ]]
        -- upvalues: v1 (copy)
        it("should return 0 when no threads are running", function() --[[ Line: 14 ]]
            -- upvalues: v1 (ref)
            expect(v1.Count()).to.equal(0);
        end);
        it("should return 3 for 2 spawned threads (given existence of parent thread too)", function() --[[ Line: 18 ]]
            -- upvalues: v1 (ref)
            v1.Spawn(function() --[[ Line: 19 ]]

            end);
            v1.Spawn(function() --[[ Line: 20 ]]

            end);
            expect(v1.Count()).to.equal(3);
        end);
    end);
    describe("OnFinish", function() --[[ Line: 25 ]]
        -- upvalues: v1 (copy)
        it("should reject non-functions as first arg", function() --[[ Line: 26 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 27 ]]
                -- upvalues: v1 (ref)
                v1.OnFinish(1);
            end).to.throw();
            expect(function() --[[ Line: 31 ]]
                -- upvalues: v1 (ref)
                v1.OnFinish("test");
            end).to.throw();
            expect(function() --[[ Line: 35 ]]
                -- upvalues: v1 (ref)
                v1.OnFinish({});
            end).to.throw();
        end);
        it("should throw when called in a non Async-created thread", function() --[[ Line: 40 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 41 ]]
                -- upvalues: v1 (ref)
                v1.OnFinish(function() --[[ Line: 42 ]]

                end);
            end).to.throw();
        end);
        it("should accept functions as first arg when called in an Async-created thread", function() --[[ Line: 46 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 47 ]]
                -- upvalues: v1 (ref)
                v1.Spawn(function() --[[ Line: 48 ]]
                    -- upvalues: v1 (ref)
                    v1.OnFinish(function() --[[ Line: 49 ]]

                    end);
                end);
            end).never.to.throw();
        end);
    end);
    describe("Spawn", function() --[[ Line: 55 ]]
        -- upvalues: v1 (copy)
        it("should reject non-functions as first arg", function() --[[ Line: 56 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 57 ]]
                -- upvalues: v1 (ref)
                v1.Spawn(1);
            end).to.throw();
            expect(function() --[[ Line: 61 ]]
                -- upvalues: v1 (ref)
                v1.Spawn("test");
            end).to.throw();
            expect(function() --[[ Line: 65 ]]
                -- upvalues: v1 (ref)
                v1.Spawn({});
            end).to.throw();
        end);
        it("should accept functions as first arg", function() --[[ Line: 70 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 71 ]]
                -- upvalues: v1 (ref)
                v1.Spawn(function() --[[ Line: 72 ]]

                end);
            end).never.to.throw();
        end);
        it("should immediately run functions", function() --[[ Line: 76 ]]
            -- upvalues: v1 (ref)
            local v2 = false;
            v1.Spawn(function() --[[ Line: 79 ]]
                -- upvalues: v2 (ref)
                v2 = true;
            end);
            expect(v2).to.equal(true);
        end);
        it("should return a thread", function() --[[ Line: 86 ]]
            -- upvalues: v1 (ref)
            expect(v1.Spawn(function() --[[ Line: 87 ]]

            end)).to.be.a("thread");
        end);
        it("should pass all args in order", function() --[[ Line: 90 ]]
            -- upvalues: v1 (ref)
            local v3 = nil;
            v1.Spawn(function(...) --[[ Line: 93 ]]
                -- upvalues: v3 (ref)
                v3 = {
                    ...
                };
            end, 1, 2, 3);
            expect(v3[1]).to.equal(1);
            expect(v3[2]).to.equal(2);
            expect(v3[3]).to.equal(3);
        end);
        it("should call OnFinish with whatever returns from a regularly terminating thread", function() --[[ Line: 102 ]]
            -- upvalues: v1 (ref)
            local v4 = nil;
            local v5 = nil;
            v1.Spawn(function() --[[ Line: 105 ]]
                -- upvalues: v1 (ref), v4 (ref), v5 (ref)
                v1.OnFinish(function(v6, v7) --[[ Line: 106 ]]
                    -- upvalues: v4 (ref), v5 (ref)
                    v4 = v6;
                    v5 = v7;
                end);
                return true, "Test";
            end);
            expect(v4).to.equal(true);
            expect(v5).to.equal("Test");
        end);
        it("should call OnFinish if the thread yields", function() --[[ Line: 118 ]]
            -- upvalues: v1 (ref)
            local v8 = nil;
            local v9 = nil;
            v1.Spawn(function() --[[ Line: 121 ]]
                -- upvalues: v1 (ref), v8 (ref), v9 (ref)
                v1.OnFinish(function(v10, v11) --[[ Line: 122 ]]
                    -- upvalues: v8 (ref), v9 (ref)
                    v8 = v10;
                    v9 = v11;
                end);
                task.wait();
                return true, "Test";
            end);
            expect(v8).to.equal(nil);
            expect(v9).to.equal(nil);
            task.wait();
            expect(v8).to.equal(true);
            expect(v9).to.equal("Test");
        end);
        it("should call OnFinish if the thread errors", function() --[[ Line: 138 ]]
            -- upvalues: v1 (ref)
            local v12 = nil;
            local v13 = nil;
            v1.Spawn(function() --[[ Line: 141 ]]
                -- upvalues: v1 (ref), v12 (ref), v13 (ref)
                v1.OnFinish(function(v14, v15) --[[ Line: 142 ]]
                    -- upvalues: v12 (ref), v13 (ref)
                    v12 = v14;
                    v13 = v15;
                end);
                error("/Test/");
            end);
            expect(v12).to.equal(false);
            expect(v13:match("/Test/")).to.be.ok();
        end);
        it("should call OnFinish if the thread errors and yields", function() --[[ Line: 154 ]]
            -- upvalues: v1 (ref)
            local v16 = nil;
            local v17 = nil;
            v1.Spawn(function() --[[ Line: 157 ]]
                -- upvalues: v1 (ref), v16 (ref), v17 (ref)
                v1.OnFinish(function(v18, v19) --[[ Line: 158 ]]
                    -- upvalues: v16 (ref), v17 (ref)
                    v16 = v18;
                    v17 = v19;
                end);
                task.wait();
                error("/Test/");
            end);
            expect(v16).to.equal(nil);
            expect(v17).to.equal(nil);
            task.wait();
            expect(v16).to.equal(false);
            expect(v17:match("/Test/")).to.be.ok();
        end);
        it("should terminate yielded sub-threads and call OnFinish when cancelled externally", function() --[[ Line: 174 ]]
            -- upvalues: v1 (ref)
            local v20 = false;
            local v21 = false;
            local v22 = false;
            local v23 = false;
            local v24 = v1.Spawn(function() --[[ Line: 181 ]]
                -- upvalues: v1 (ref), v20 (ref), v21 (ref), v23 (ref), v22 (ref)
                v1.OnFinish(function() --[[ Line: 182 ]]
                    -- upvalues: v20 (ref)
                    v20 = true;
                end);
                v1.Spawn(function() --[[ Line: 186 ]]
                    -- upvalues: v1 (ref), v21 (ref), v23 (ref)
                    v1.OnFinish(function() --[[ Line: 187 ]]
                        -- upvalues: v21 (ref)
                        v21 = true;
                    end);
                    task.wait();
                    v23 = true;
                end);
                v22 = true;
            end);
            expect(v20).to.equal(true);
            expect(v22).to.equal(true);
            expect(v21).to.equal(false);
            expect(v23).to.equal(false);
            v1.Cancel(v24);
            expect(v20).to.equal(true);
            expect(v22).to.equal(true);
            expect(v21).to.equal(true);
            expect(v23).to.equal(false);
        end);
        it("should never terminate yielded sub-threads if the parent thread is resolved", function() --[[ Line: 213 ]]
            -- upvalues: v1 (ref)
            local v25 = false;
            local v26 = false;
            local v27 = false;
            local v28 = false;
            local v29 = v1.Spawn(function() --[[ Line: 220 ]]
                -- upvalues: v1 (ref), v25 (ref), v26 (ref), v28 (ref), v27 (ref)
                v1.OnFinish(function() --[[ Line: 221 ]]
                    -- upvalues: v25 (ref)
                    v25 = true;
                end);
                v1.Spawn(function() --[[ Line: 225 ]]
                    -- upvalues: v1 (ref), v26 (ref), v28 (ref)
                    v1.OnFinish(function() --[[ Line: 226 ]]
                        -- upvalues: v26 (ref)
                        v26 = true;
                    end);
                    task.wait();
                    v28 = true;
                end);
                v27 = true;
            end);
            expect(v25).to.equal(true);
            expect(v27).to.equal(true);
            expect(v26).to.equal(false);
            expect(v28).to.equal(false);
            v1.Cancel(v29);
            expect(v25).to.equal(true);
            expect(v27).to.equal(true);
            expect(v26).to.equal(true);
            expect(v28).to.equal(false);
        end);
    end);
    describe("SpawnTimed", function() --[[ Line: 253 ]]
        -- upvalues: v1 (copy)
        it("should accept a function as first arg and reject non-functions", function() --[[ Line: 254 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 255 ]]
                -- upvalues: v1 (ref)
                v1.SpawnTimed(1);
            end).to.throw();
            expect(function() --[[ Line: 259 ]]
                -- upvalues: v1 (ref)
                v1.SpawnTimed("test");
            end).to.throw();
            expect(function() --[[ Line: 263 ]]
                -- upvalues: v1 (ref)
                v1.SpawnTimed({});
            end).to.throw();
            expect(function() --[[ Line: 267 ]]
                -- upvalues: v1 (ref)
                v1.SpawnTimed(function() --[[ Line: 268 ]]

                end);
            end).never.to.throw();
        end);
    end);
    describe("Delay", function() --[[ Line: 277 ]]
        -- upvalues: v1 (copy)
        it("should reject non-numbers as first arg", function() --[[ Line: 278 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 279 ]]
                -- upvalues: v1 (ref)
                v1.Delay("test");
            end).to.throw();
            expect(function() --[[ Line: 283 ]]
                -- upvalues: v1 (ref)
                v1.Delay({});
            end).to.throw();
            expect(function() --[[ Line: 287 ]]
                -- upvalues: v1 (ref)
                v1.Delay(function() --[[ Line: 288 ]]

                end);
            end).to.throw();
        end);
        it("should reject non-functions as second arg", function() --[[ Line: 292 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 293 ]]
                -- upvalues: v1 (ref)
                v1.Delay(1, 1);
            end).to.throw();
            expect(function() --[[ Line: 297 ]]
                -- upvalues: v1 (ref)
                v1.Delay(1, "test");
            end).to.throw();
            expect(function() --[[ Line: 301 ]]
                -- upvalues: v1 (ref)
                v1.Delay(1, {});
            end).to.throw();
        end);
        it("should accept a number as first arg & a function as second arg", function() --[[ Line: 306 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 307 ]]
                -- upvalues: v1 (ref)
                v1.Delay(1, function() --[[ Line: 308 ]]

                end);
            end).never.to.throw();
        end);
        it("should return a thread", function() --[[ Line: 312 ]]
            -- upvalues: v1 (ref)
            expect(v1.Delay(1, function() --[[ Line: 313 ]]

            end)).to.be.a("thread");
        end);
        it("should delay for the specified amount of time", function() --[[ Line: 316 ]]
            -- upvalues: v1 (ref)
            local v30 = false;
            v1.Delay(1, function() --[[ Line: 319 ]]
                -- upvalues: v30 (ref)
                v30 = true;
            end);
            expect(v30).to.equal(false);
            task.wait(1);
            expect(v30).to.equal(true);
        end);
    end);
    describe("Defer", function() --[[ Line: 329 ]]
        -- upvalues: v1 (copy)
        it("should reject non-functions as first arg", function() --[[ Line: 330 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 331 ]]
                -- upvalues: v1 (ref)
                v1.Defer(1);
            end).to.throw();
            expect(function() --[[ Line: 335 ]]
                -- upvalues: v1 (ref)
                v1.Defer("test");
            end).to.throw();
            expect(function() --[[ Line: 339 ]]
                -- upvalues: v1 (ref)
                v1.Defer({});
            end).to.throw();
        end);
        it("should accept functions as first arg", function() --[[ Line: 344 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 345 ]]
                -- upvalues: v1 (ref)
                v1.Defer(function() --[[ Line: 346 ]]

                end);
            end).never.to.throw();
        end);
        it("should return a thread", function() --[[ Line: 350 ]]
            -- upvalues: v1 (ref)
            expect(v1.Defer(function() --[[ Line: 351 ]]

            end)).to.be.a("thread");
        end);
        it("should defer the function", function() --[[ Line: 354 ]]
            -- upvalues: v1 (ref)
            local v31 = false;
            v1.Defer(function() --[[ Line: 357 ]]
                -- upvalues: v31 (ref)
                v31 = true;
            end);
            expect(v31).to.equal(false);
            task.wait();
            expect(v31).to.equal(true);
        end);
    end);
    describe("Finish Rules", function() --[[ Line: 367 ]]
        -- upvalues: v1 (copy)
        it("should disallow cancellation & resolution from the same thread", function() --[[ Line: 368 ]]
            -- upvalues: v1 (ref)
            local v32 = false;
            v1.Spawn(function() --[[ Line: 371 ]]
                -- upvalues: v1 (ref), v32 (ref)
                v1.Cancel(coroutine.running());
                v32 = true;
            end);
            expect(v32).to.equal(false);
            local v33 = false;
            v1.Spawn(function() --[[ Line: 380 ]]
                -- upvalues: v1 (ref), v33 (ref)
                v1.Resolve(coroutine.running());
                v33 = true;
            end);
            expect(v33).to.equal(false);
        end);
        it("should disallow cancellation & resolution from a sub-thread", function() --[[ Line: 388 ]]
            -- upvalues: v1 (ref)
            local v34 = false;
            v1.Spawn(function() --[[ Line: 391 ]]
                -- upvalues: v1 (ref), v34 (ref)
                local v35 = coroutine.running();
                v1.Spawn(function() --[[ Line: 394 ]]
                    -- upvalues: v1 (ref), v35 (copy), v34 (ref)
                    v1.Cancel(v35);
                    v34 = true;
                end);
            end);
            expect(v34).to.equal(false);
            local v36 = false;
            v1.Spawn(function() --[[ Line: 404 ]]
                -- upvalues: v1 (ref), v36 (ref)
                local v37 = coroutine.running();
                v1.Spawn(function() --[[ Line: 407 ]]
                    -- upvalues: v1 (ref), v37 (copy), v36 (ref)
                    v1.Resolve(v37);
                    v36 = true;
                end);
            end);
            expect(v36).to.equal(false);
        end);
    end);
    describe("Cancel", function() --[[ Line: 417 ]]
        -- upvalues: v1 (copy)
        it("should reject non-threads as first arg", function() --[[ Line: 418 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 419 ]]
                -- upvalues: v1 (ref)
                v1.Cancel(1);
            end).to.throw();
            expect(function() --[[ Line: 423 ]]
                -- upvalues: v1 (ref)
                v1.Cancel("test");
            end).to.throw();
            expect(function() --[[ Line: 427 ]]
                -- upvalues: v1 (ref)
                v1.Cancel({});
            end).to.throw();
            expect(function() --[[ Line: 431 ]]
                -- upvalues: v1 (ref)
                v1.Cancel(function() --[[ Line: 432 ]]

                end);
            end).to.throw();
        end);
        it("should accept threads as first arg", function() --[[ Line: 436 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 437 ]]
                -- upvalues: v1 (ref)
                v1.Cancel(v1.Spawn(function() --[[ Line: 438 ]]

                end));
            end).never.to.throw();
        end);
        it("should cancel a yielding thread", function() --[[ Line: 442 ]]
            -- upvalues: v1 (ref)
            local v38 = false;
            local v39 = v1.Spawn(function() --[[ Line: 445 ]]
                -- upvalues: v38 (ref)
                task.wait();
                v38 = true;
            end);
            v1.Cancel(v39);
            expect(v38).to.equal(false);
            task.wait();
            task.wait();
            expect(v38).to.equal(false);
        end);
        it("should cancel the thread with OnFinish, passing false & extra args", function() --[[ Line: 458 ]]
            -- upvalues: v1 (ref)
            v1.Spawn(function() --[[ Line: 459 ]]
                -- upvalues: v1 (ref)
                local v40 = nil;
                local v41 = nil;
                local v44 = v1.Spawn(function() --[[ Line: 462 ]]
                    -- upvalues: v1 (ref), v40 (ref), v41 (ref)
                    v1.OnFinish(function(v42, v43) --[[ Line: 463 ]]
                        -- upvalues: v40 (ref), v41 (ref)
                        v40 = v42;
                        v41 = v43;
                    end);
                    task.wait();
                    return "Success";
                end);
                expect(v40).to.equal(nil);
                expect(v41).to.equal(nil);
                v1.Cancel(v44, "CustomFail");
                expect(v40).to.equal(false);
                expect(v41).to.equal("CustomFail");
                task.wait();
                expect(v40).to.equal(false);
                expect(v41).to.equal("CustomFail");
            end);
        end);
        it("should cancel all sub-threads", function() --[[ Line: 483 ]]
            -- upvalues: v1 (ref)
            local v45 = nil;
            local v46 = nil;
            local v49 = v1.Spawn(function() --[[ Line: 486 ]]
                -- upvalues: v1 (ref), v45 (ref), v46 (ref)
                v1.OnFinish(function(v47) --[[ Line: 487 ]]
                    -- upvalues: v45 (ref)
                    v45 = v47;
                end);
                v1.Spawn(function() --[[ Line: 491 ]]
                    -- upvalues: v1 (ref), v46 (ref)
                    v1.OnFinish(function(v48) --[[ Line: 492 ]]
                        -- upvalues: v46 (ref)
                        v46 = v48;
                    end);
                    task.wait(0.1);
                end);
            end);
            expect(v45).to.equal(true);
            expect(v46).to.equal(nil);
            v1.Cancel(v49);
            expect(v45).to.equal(true);
            expect(v46).to.equal(false);
            task.wait(0.1);
            expect(v45).to.equal(true);
            expect(v46).to.equal(false);
        end);
        it("should only cancel or resolve a thread and sub-threads once", function() --[[ Line: 514 ]]
            -- upvalues: v1 (ref)
            local v50 = nil;
            local v51 = nil;
            local v54 = v1.Spawn(function() --[[ Line: 517 ]]
                -- upvalues: v1 (ref), v50 (ref), v51 (ref)
                v1.OnFinish(function(v52) --[[ Line: 518 ]]
                    -- upvalues: v50 (ref)
                    v50 = v52;
                end);
                v1.Spawn(function() --[[ Line: 522 ]]
                    -- upvalues: v1 (ref), v51 (ref)
                    v1.OnFinish(function(v53) --[[ Line: 523 ]]
                        -- upvalues: v51 (ref)
                        v51 = v53;
                    end);
                    task.wait(0.1);
                end);
                task.wait(0.1);
            end);
            expect(v50).to.equal(nil);
            expect(v51).to.equal(nil);
            v1.Cancel(v54);
            expect(v50).to.equal(false);
            expect(v51).to.equal(false);
            v1.Resolve(v54);
            expect(v50).to.equal(false);
            expect(v51).to.equal(false);
        end);
    end);
    describe("CancelRoot", function() --[[ Line: 548 ]]
        -- upvalues: v1 (copy)
        it("should only cancel the top-level thread and not its descendants", function() --[[ Line: 549 ]]
            -- upvalues: v1 (ref)
            local v55 = nil;
            local v56 = v1.Spawn(function() --[[ Line: 551 ]]
                -- upvalues: v55 (ref), v1 (ref)
                v55 = v1.Spawn(function() --[[ Line: 552 ]]
                    task.wait(0.1);
                end);
            end);
            v1.CancelRoot(v56);
            expect(v55).to.be.ok();
            expect(coroutine.status(v55)).to.equal("suspended");
        end);
    end);
    describe("Resolve", function() --[[ Line: 564 ]]
        -- upvalues: v1 (copy)
        it("should reject non-threads as first arg", function() --[[ Line: 565 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 566 ]]
                -- upvalues: v1 (ref)
                v1.Resolve(1);
            end).to.throw();
            expect(function() --[[ Line: 570 ]]
                -- upvalues: v1 (ref)
                v1.Resolve("test");
            end).to.throw();
            expect(function() --[[ Line: 574 ]]
                -- upvalues: v1 (ref)
                v1.Resolve({});
            end).to.throw();
            expect(function() --[[ Line: 578 ]]
                -- upvalues: v1 (ref)
                v1.Resolve(function() --[[ Line: 579 ]]

                end);
            end).to.throw();
        end);
        it("should accept threads as first arg", function() --[[ Line: 583 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 584 ]]
                -- upvalues: v1 (ref)
                v1.Resolve(v1.Spawn(function() --[[ Line: 585 ]]

                end));
            end).never.to.throw();
        end);
        it("should finish a yielding thread", function() --[[ Line: 589 ]]
            -- upvalues: v1 (ref)
            local v57 = false;
            local v58 = v1.Spawn(function() --[[ Line: 592 ]]
                -- upvalues: v57 (ref)
                task.wait();
                v57 = true;
            end);
            v1.Resolve(v58);
            expect(v57).to.equal(false);
            task.wait();
            task.wait();
            expect(v57).to.equal(false);
        end);
        it("should finish the thread with OnFinish, passing true & extra args", function() --[[ Line: 605 ]]
            -- upvalues: v1 (ref)
            v1.Spawn(function() --[[ Line: 606 ]]
                -- upvalues: v1 (ref)
                local v59 = nil;
                local v60 = nil;
                local v63 = v1.Spawn(function() --[[ Line: 609 ]]
                    -- upvalues: v1 (ref), v59 (ref), v60 (ref)
                    v1.OnFinish(function(v61, v62) --[[ Line: 610 ]]
                        -- upvalues: v59 (ref), v60 (ref)
                        v59 = v61;
                        v60 = v62;
                    end);
                    task.wait();
                    return "Success";
                end);
                expect(v59).to.equal(nil);
                expect(v60).to.equal(nil);
                v1.Resolve(v63, "CustomSuccess");
                expect(v59).to.equal(true);
                expect(v60).to.equal("CustomSuccess");
                task.wait();
                expect(v59).to.equal(true);
                expect(v60).to.equal("CustomSuccess");
            end);
        end);
        it("should recursively terminate threads", function() --[[ Line: 630 ]]
            -- upvalues: v1 (ref)
            local v64 = table.create(2);
            v1.Defer(function() --[[ Line: 633 ]]
                -- upvalues: v1 (ref), v64 (copy)
                v1.OnFinish(function(v65, v66) --[[ Line: 634 ]]
                    -- upvalues: v64 (ref)
                    v64[1] = {
                        v65, 
                        v66
                    };
                end);
                v1.Spawn(function() --[[ Line: 638 ]]
                    -- upvalues: v1 (ref), v64 (ref)
                    task.wait();
                    v1.OnFinish(function(v67, v68) --[[ Line: 641 ]]
                        -- upvalues: v64 (ref)
                        v64[2] = {
                            v67, 
                            v68
                        };
                    end);
                end);
            end);
            expect(v64[1]).to.equal(nil);
            expect(v64[2]).to.equal(nil);
        end);
    end);
    describe("ResolveRoot", function() --[[ Line: 652 ]]
        -- upvalues: v1 (copy)
        it("should only resolve the top-level thread and not its descendants", function() --[[ Line: 653 ]]
            -- upvalues: v1 (ref)
            local v69 = nil;
            local v70 = v1.Spawn(function() --[[ Line: 655 ]]
                -- upvalues: v69 (ref), v1 (ref)
                v69 = v1.Spawn(function() --[[ Line: 656 ]]
                    task.wait(0.1);
                end);
            end);
            v1.ResolveRoot(v70);
            expect(v69).to.be.ok();
            expect(coroutine.status(v69)).to.equal("suspended");
        end);
    end);
    describe("Await", function() --[[ Line: 668 ]]
        -- upvalues: v1 (copy)
        it("should reject non-threads as first arg", function() --[[ Line: 669 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 670 ]]
                -- upvalues: v1 (ref)
                v1.Await(1);
            end).to.throw();
            expect(function() --[[ Line: 674 ]]
                -- upvalues: v1 (ref)
                v1.Await("test");
            end).to.throw();
            expect(function() --[[ Line: 678 ]]
                -- upvalues: v1 (ref)
                v1.Await({});
            end).to.throw();
            expect(function() --[[ Line: 682 ]]
                -- upvalues: v1 (ref)
                v1.Await(function() --[[ Line: 683 ]]

                end);
            end).to.throw();
        end);
        it("should accept threads as first arg", function() --[[ Line: 687 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 688 ]]
                -- upvalues: v1 (ref)
                v1.Await(v1.Spawn(function() --[[ Line: 689 ]]

                end));
            end).never.to.throw();
        end);
        it("should return for immediate execution threads", function() --[[ Line: 693 ]]
            -- upvalues: v1 (ref)
            local v71, v72 = v1.Await(v1.Spawn(function() --[[ Line: 694 ]]
                return true, "Success";
            end));
            expect(v71).to.equal(true);
            expect(v72).to.equal("Success");
        end);
        it("should return for yielding threads", function() --[[ Line: 702 ]]
            -- upvalues: v1 (ref)
            local v73, v74 = v1.Await(v1.Spawn(function() --[[ Line: 703 ]]
                task.wait();
                return true, "Success";
            end));
            expect(v73).to.equal(true);
            expect(v74).to.equal("Success");
        end);
        it("should return nil for timeout and not cancel the thread", function() --[[ Line: 712 ]]
            -- upvalues: v1 (ref)
            local v75 = false;
            local v76, v77 = v1.Await(v1.Spawn(function() --[[ Line: 715 ]]
                -- upvalues: v75 (ref)
                task.wait(0.2);
                v75 = true;
            end), 0.1);
            expect(v76).to.equal(false);
            expect(v77).to.equal("TIMEOUT");
            task.wait(0.1);
            expect(v75).to.equal(true);
        end);
    end);
    describe("AwaitAll", function() --[[ Line: 729 ]]
        -- upvalues: v1 (copy)
        it("should reject non-tables as first arg", function() --[[ Line: 730 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 731 ]]
                -- upvalues: v1 (ref)
                v1.AwaitAll(1);
            end).to.throw();
            expect(function() --[[ Line: 735 ]]
                -- upvalues: v1 (ref)
                v1.AwaitAll("test");
            end).to.throw();
            expect(function() --[[ Line: 739 ]]
                -- upvalues: v1 (ref)
                v1.AwaitAll(v1.Spawn(function() --[[ Line: 740 ]]

                end));
            end).to.throw();
            expect(function() --[[ Line: 743 ]]
                -- upvalues: v1 (ref)
                v1.AwaitAll(function() --[[ Line: 744 ]]

                end);
            end).to.throw();
        end);
        it("should accept non-empty tables as first arg", function() --[[ Line: 748 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 749 ]]
                -- upvalues: v1 (ref)
                v1.AwaitAll({});
            end).to.throw();
            expect(function() --[[ Line: 753 ]]
                -- upvalues: v1 (ref)
                v1.AwaitAll({
                    v1.Spawn(function() --[[ Line: 754 ]]

                    end)
                });
            end).never.to.throw();
        end);
        it("should return a table of results given one thread", function() --[[ Line: 758 ]]
            -- upvalues: v1 (ref)
            local v78 = v1.AwaitAll({
                v1.Spawn(function() --[[ Line: 760 ]]
                    return true, "Success";
                end)
            });
            expect(v78).to.be.ok();
            expect(v78).to.be.a("table");
            expect(v78[1]).to.be.ok();
            expect(v78[1]).to.be.a("table");
            expect(v78[1][1]).to.equal(true);
            expect(v78[1][2]).to.equal("Success");
        end);
        it("should return a table of results given multiple threads", function() --[[ Line: 773 ]]
            -- upvalues: v1 (ref)
            local v79 = v1.AwaitAll({
                v1.Spawn(function() --[[ Line: 775 ]]
                    return true, "Success";
                end), 
                v1.Spawn(function() --[[ Line: 778 ]]
                    return false, "Failure";
                end)
            });
            expect(v79).to.be.ok();
            expect(v79).to.be.a("table");
            expect(v79[1]).to.be.ok();
            expect(v79[1]).to.be.a("table");
            expect(v79[1][1]).to.equal(true);
            expect(v79[1][2]).to.equal("Success");
            expect(v79[2]).to.be.ok();
            expect(v79[2]).to.be.a("table");
            expect(v79[2][1]).to.equal(false);
            expect(v79[2][2]).to.equal("Failure");
        end);
        it("should return a table of results for multiple yielding threads and wait for all of them", function() --[[ Line: 795 ]]
            -- upvalues: v1 (ref)
            local v80 = 0;
            local v81 = v1.AwaitAll({
                v1.Spawn(function() --[[ Line: 799 ]]
                    -- upvalues: v80 (ref)
                    task.wait();
                    v80 = v80 + 1;
                    return true, "Success";
                end), 
                v1.Spawn(function() --[[ Line: 804 ]]
                    -- upvalues: v80 (ref)
                    task.wait();
                    v80 = v80 + 1;
                    return false, "Failure";
                end), 
                v1.Spawn(function() --[[ Line: 809 ]]
                    -- upvalues: v80 (ref)
                    task.wait(0.1);
                    v80 = v80 + 1;
                end)
            });
            expect(v80).to.equal(3);
            expect(v81).to.be.ok();
            expect(v81).to.be.a("table");
            expect(v81[1]).to.be.ok();
            expect(v81[1]).to.be.a("table");
            expect(v81[1][1]).to.equal(true);
            expect(v81[1][2]).to.equal("Success");
            expect(v81[2]).to.be.ok();
            expect(v81[2]).to.be.a("table");
            expect(v81[2][1]).to.equal(false);
            expect(v81[2][2]).to.equal("Failure");
        end);
    end);
    describe("AwaitFirst", function() --[[ Line: 830 ]]
        -- upvalues: v1 (copy)
        it("should reject non-tables as first arg", function() --[[ Line: 831 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 832 ]]
                -- upvalues: v1 (ref)
                v1.AwaitFirst(1);
            end).to.throw();
            expect(function() --[[ Line: 836 ]]
                -- upvalues: v1 (ref)
                v1.AwaitFirst("test");
            end).to.throw();
            expect(function() --[[ Line: 840 ]]
                -- upvalues: v1 (ref)
                v1.AwaitFirst(v1.Spawn(function() --[[ Line: 841 ]]

                end));
            end).to.throw();
            expect(function() --[[ Line: 844 ]]
                -- upvalues: v1 (ref)
                v1.AwaitFirst(function() --[[ Line: 845 ]]

                end);
            end).to.throw();
        end);
        it("should accept non-empty tables as first arg", function() --[[ Line: 849 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 850 ]]
                -- upvalues: v1 (ref)
                v1.AwaitFirst({});
            end).to.throw();
            expect(function() --[[ Line: 854 ]]
                -- upvalues: v1 (ref)
                v1.AwaitFirst({
                    v1.Spawn(function() --[[ Line: 856 ]]

                    end)
                });
            end).never.to.throw();
        end);
        it("should return the results of a thread", function() --[[ Line: 861 ]]
            -- upvalues: v1 (ref)
            local v82, v83 = v1.AwaitFirst({
                v1.Spawn(function() --[[ Line: 863 ]]
                    return true, "Success";
                end)
            });
            expect(v82).to.equal(true);
            expect(v83).to.equal("Success");
        end);
        it("should return the results of the first thread given immediate execution", function() --[[ Line: 872 ]]
            -- upvalues: v1 (ref)
            local v84, v85 = v1.AwaitFirst({
                v1.Spawn(function() --[[ Line: 874 ]]
                    return true, "Success";
                end), 
                v1.Spawn(function() --[[ Line: 877 ]]
                    return false, "Failure";
                end)
            });
            expect(v84).to.equal(true);
            expect(v85).to.equal("Success");
        end);
        it("should return the first thread to finish", function() --[[ Line: 886 ]]
            -- upvalues: v1 (ref)
            local v86, v87 = v1.AwaitFirst({
                v1.Spawn(function() --[[ Line: 888 ]]
                    task.wait(0.3);
                    return true, "Success";
                end), 
                v1.Spawn(function() --[[ Line: 892 ]]
                    task.wait();
                    return false, "Failure";
                end)
            });
            expect(v86).to.equal(false);
            expect(v87).to.equal("Failure");
        end);
        it("should return failure and timeout code given a timeout", function() --[[ Line: 902 ]]
            -- upvalues: v1 (ref)
            local v88, v89 = v1.AwaitFirst({
                v1.Spawn(function() --[[ Line: 904 ]]
                    task.wait(0.2);
                end)
            }, 0.1);
            expect(v88).to.equal(false);
            expect(v89).to.equal("TIMEOUT");
        end);
    end);
    describe("Timer", function() --[[ Line: 914 ]]
        -- upvalues: v1 (copy)
        it("should only accept a number & function as first 2 args", function() --[[ Line: 915 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 916 ]]
                -- upvalues: v1 (ref)
                v1.Timer(1);
            end).to.throw();
            expect(function() --[[ Line: 920 ]]
                -- upvalues: v1 (ref)
                v1.Timer(1, "test");
            end).to.throw();
            expect(function() --[[ Line: 924 ]]
                -- upvalues: v1 (ref)
                v1.Timer(1, 1);
            end).to.throw();
            expect(function() --[[ Line: 928 ]]
                -- upvalues: v1 (ref)
                v1.Timer(1, {});
            end).to.throw();
            expect(function() --[[ Line: 932 ]]
                -- upvalues: v1 (ref)
                v1.Timer("test", function() --[[ Line: 933 ]]

                end);
            end).to.throw();
            expect(function() --[[ Line: 936 ]]
                -- upvalues: v1 (ref)
                v1.Timer({}, function() --[[ Line: 937 ]]

                end);
            end).to.throw();
            expect(function() --[[ Line: 940 ]]
                -- upvalues: v1 (ref)
                v1.Timer(function() --[[ Line: 941 ]]

                end, function() --[[ Line: 941 ]]

                end)();
            end).to.throw();
        end);
        it("should accept an optional third argument as an optional string", function() --[[ Line: 945 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 946 ]]
                -- upvalues: v1 (ref)
                v1.Timer(1, function() --[[ Line: 947 ]]

                end, 1);
            end).to.throw();
            expect(function() --[[ Line: 950 ]]
                -- upvalues: v1 (ref)
                v1.Timer(1, function() --[[ Line: 951 ]]

                end, "test")();
            end).never.to.throw();
        end);
        it("should activate twice per second for 0.5s interval", function() --[[ Line: 955 ]]
            -- upvalues: v1 (ref)
            local v90 = 0;
            local v91 = v1.Timer(0.5, function() --[[ Line: 958 ]]
                -- upvalues: v90 (ref)
                v90 = v90 + 1;
            end);
            task.wait(1);
            v91();
            expect(v90).to.equal(2);
        end);
        it("should activate thrice per second for 1/3s interval", function() --[[ Line: 968 ]]
            -- upvalues: v1 (ref)
            local v92 = 0;
            local v93 = v1.Timer(0.3333333333333333, function() --[[ Line: 971 ]]
                -- upvalues: v92 (ref)
                v92 = v92 + 1;
            end);
            task.wait(1);
            v93();
            expect(v92).to.equal(3);
        end);
        it("should stop activating when cancelled", function() --[[ Line: 981 ]]
            -- upvalues: v1 (ref)
            local v94 = 0;
            local v95 = v1.Timer(0.1, function() --[[ Line: 984 ]]
                -- upvalues: v94 (ref)
                v94 = v94 + 1;
            end);
            task.wait(0.2);
            v95();
            task.wait(0.2);
            expect(v94).to.equal(2);
        end);
    end);
    describe("TimerAsync", function() --[[ Line: 996 ]]
        -- upvalues: v1 (copy)
        it("should only accept a number & function as first 2 args", function() --[[ Line: 997 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 998 ]]
                -- upvalues: v1 (ref)
                v1.TimerAsync(1);
            end).to.throw();
            expect(function() --[[ Line: 1002 ]]
                -- upvalues: v1 (ref)
                v1.TimerAsync(1, "test");
            end).to.throw();
            expect(function() --[[ Line: 1006 ]]
                -- upvalues: v1 (ref)
                v1.TimerAsync(1, 1);
            end).to.throw();
            expect(function() --[[ Line: 1010 ]]
                -- upvalues: v1 (ref)
                v1.TimerAsync(1, {});
            end).to.throw();
            expect(function() --[[ Line: 1014 ]]
                -- upvalues: v1 (ref)
                v1.TimerAsync("test", function() --[[ Line: 1015 ]]

                end);
            end).to.throw();
            expect(function() --[[ Line: 1018 ]]
                -- upvalues: v1 (ref)
                v1.TimerAsync({}, function() --[[ Line: 1019 ]]

                end);
            end).to.throw();
            expect(function() --[[ Line: 1022 ]]
                -- upvalues: v1 (ref)
                v1.TimerAsync(function() --[[ Line: 1023 ]]

                end, function() --[[ Line: 1023 ]]

                end);
            end).to.throw();
            expect(function() --[[ Line: 1026 ]]
                -- upvalues: v1 (ref)
                v1.TimerAsync(1, function() --[[ Line: 1027 ]]

                end)();
            end).never.to.throw();
        end);
        it("should accept an optional third argument as an optional string", function() --[[ Line: 1031 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 1032 ]]
                -- upvalues: v1 (ref)
                v1.TimerAsync(1, function() --[[ Line: 1033 ]]

                end, 1);
            end).to.throw();
            expect(function() --[[ Line: 1036 ]]
                -- upvalues: v1 (ref)
                v1.TimerAsync(1, function() --[[ Line: 1037 ]]

                end, "test")();
            end).never.to.throw();
        end);
        it("should not block for yielding threads", function() --[[ Line: 1041 ]]
            -- upvalues: v1 (ref)
            local v96 = 0;
            local v97 = v1.TimerAsync(0, function() --[[ Line: 1043 ]]
                -- upvalues: v96 (ref)
                task.wait(0.1);
                v96 = v96 + 1;
            end);
            expect(v96).to.equal(0);
            task.wait();
            task.wait();
            task.wait(0.1);
            v97();
            expect(v96).to.equal(3);
        end);
        it("should pass difference in time as first arg", function() --[[ Line: 1056 ]]
            -- upvalues: v1 (ref)
            local v98 = 0;
            local v100 = v1.TimerAsync(0, function(v99) --[[ Line: 1058 ]]
                -- upvalues: v98 (ref)
                v98 = v98 + 1;
                expect(v99).to.be.a("number");
            end);
            task.wait();
            v100();
            expect(v98).to.equal(2);
        end);
        it("should pass difference in time as first arg for UseTaskSpawn", function() --[[ Line: 1068 ]]
            -- upvalues: v1 (ref)
            local v101 = 0;
            local v103 = v1.TimerAsync(0, function(v102) --[[ Line: 1070 ]]
                -- upvalues: v101 (ref)
                v101 = v101 + 1;
                expect(v102).to.be.a("number");
            end, nil, true);
            task.wait();
            v103();
            expect(v101).to.equal(2);
        end);
    end);
    describe("Parent", function() --[[ Line: 1081 ]]
        -- upvalues: v1 (copy)
        it("should accept a thread or nil as the first arg only", function() --[[ Line: 1082 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 1083 ]]
                -- upvalues: v1 (ref)
                v1.Parent(1);
            end).to.throw();
            expect(function() --[[ Line: 1087 ]]
                -- upvalues: v1 (ref)
                v1.Parent("test");
            end).to.throw();
            expect(function() --[[ Line: 1091 ]]
                -- upvalues: v1 (ref)
                v1.Parent({});
            end).to.throw();
            expect(function() --[[ Line: 1095 ]]
                -- upvalues: v1 (ref)
                v1.Spawn(function() --[[ Line: 1096 ]]
                    -- upvalues: v1 (ref)
                    v1.Parent();
                end);
            end).never.to.throw();
            expect(function() --[[ Line: 1101 ]]
                -- upvalues: v1 (ref)
                v1.Parent(v1.Spawn(function() --[[ Line: 1102 ]]

                end));
            end).never.to.throw();
        end);
        it("should throw for non Async-spawned threads given no args", function() --[[ Line: 1106 ]]
            -- upvalues: v1 (ref)
            task.spawn(function() --[[ Line: 1107 ]]
                -- upvalues: v1 (ref)
                expect(function() --[[ Line: 1108 ]]
                    -- upvalues: v1 (ref)
                    v1.Parent();
                end).to.throw();
            end);
        end);
        it("should return the parent thread given one Spawn call", function() --[[ Line: 1114 ]]
            -- upvalues: v1 (ref)
            local v104 = coroutine.running();
            local v105 = nil;
            v1.Spawn(function() --[[ Line: 1118 ]]
                -- upvalues: v105 (ref), v1 (ref)
                v105 = v1.Parent();
            end);
            expect(v105).to.equal(v104);
        end);
        it("should return the parent thread given two Spawn calls", function() --[[ Line: 1125 ]]
            -- upvalues: v1 (ref)
            local v106 = nil;
            local v107 = nil;
            v1.Spawn(function() --[[ Line: 1129 ]]
                -- upvalues: v106 (ref), v1 (ref), v107 (ref)
                v106 = coroutine.running();
                v1.Spawn(function() --[[ Line: 1132 ]]
                    -- upvalues: v107 (ref), v1 (ref)
                    v107 = v1.Parent();
                end);
            end);
            expect(v107).to.equal(v106);
        end);
    end);
    describe("GetMetadata", function() --[[ Line: 1141 ]]
        -- upvalues: v1 (copy)
        it("should accept a thread or nil as the first arg only", function() --[[ Line: 1142 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 1143 ]]
                -- upvalues: v1 (ref)
                v1.GetMetadata(1);
            end).to.throw();
            expect(function() --[[ Line: 1147 ]]
                -- upvalues: v1 (ref)
                v1.GetMetadata("test");
            end).to.throw();
            expect(function() --[[ Line: 1151 ]]
                -- upvalues: v1 (ref)
                v1.GetMetadata({});
            end).to.throw();
            expect(function() --[[ Line: 1155 ]]
                -- upvalues: v1 (ref)
                v1.GetMetadata();
            end).never.to.throw();
            expect(function() --[[ Line: 1159 ]]
                -- upvalues: v1 (ref)
                v1.GetMetadata(v1.Spawn(function() --[[ Line: 1160 ]]

                end));
            end).never.to.throw();
        end);
        it("should return a table of metadata or throw if the thread is not spawned through Async", function() --[[ Line: 1164 ]]
            -- upvalues: v1 (ref)
            task.spawn(function() --[[ Line: 1165 ]]
                -- upvalues: v1 (ref)
                expect(function() --[[ Line: 1166 ]]
                    -- upvalues: v1 (ref)
                    v1.GetMetadata();
                end).to.throw();
            end);
            v1.Spawn(function() --[[ Line: 1171 ]]
                -- upvalues: v1 (ref)
                expect(v1.GetMetadata()).to.be.a("table");
            end);
            expect(v1.GetMetadata(v1.Spawn(function() --[[ Line: 1175 ]]

            end))).to.be.a("table");
        end);
    end);
    describe("Results", function() --[[ Line: 1179 ]]
        -- upvalues: v1 (copy)
        it("should accept a thread as the first arg only", function() --[[ Line: 1180 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 1181 ]]
                -- upvalues: v1 (ref)
                v1.Results(1);
            end).to.throw();
            expect(function() --[[ Line: 1185 ]]
                -- upvalues: v1 (ref)
                v1.Results("test");
            end).to.throw();
            expect(function() --[[ Line: 1189 ]]
                -- upvalues: v1 (ref)
                v1.Results({});
            end).to.throw();
            expect(function() --[[ Line: 1193 ]]
                -- upvalues: v1 (ref)
                v1.Results();
            end).to.throw();
            expect(function() --[[ Line: 1197 ]]
                -- upvalues: v1 (ref)
                v1.Results(v1.Spawn(function() --[[ Line: 1198 ]]

                end));
            end).never.to.throw();
        end);
        it("should return a table of results if the thread has finished", function() --[[ Line: 1202 ]]
            -- upvalues: v1 (ref)
            local v108 = v1.Spawn(function() --[[ Line: 1203 ]]
                return true, 123;
            end);
            local v109, v110 = v1.Results(v108);
            expect(v109).to.equal(true);
            expect(v110).to.equal(123);
        end);
        it("should return nil if the thread has not finished", function() --[[ Line: 1212 ]]
            -- upvalues: v1 (ref)
            local v111 = v1.Spawn(function() --[[ Line: 1213 ]]
                task.wait(1);
                return true, 123;
            end);
            expect(v1.Results(v111)).to.equal(nil);
        end);
    end);
end;