local l_TableUtil_0 = require(script.Parent.Parent:WaitForChild("TableUtil"));
local v1 = require(script.Parent);
local v2 = {};
local function v8(v3, v4, v5) --[[ Line: 6 ]] --[[ Name: TestInstance ]]
    -- upvalues: v1 (copy), l_TableUtil_0 (copy), v2 (copy)
    local v7 = v1.new({
        BatchDuration = 0, 
        DeferUserEvents = false, 
        GetBaseFields = function() --[[ Line: 10 ]] --[[ Name: GetBaseFields ]]
            return {};
        end, 
        GetBaseUserFields = function() --[[ Line: 11 ]] --[[ Name: GetBaseUserFields ]]
            return {};
        end, 
        ShouldRecordUserExperiment = v4 or function() --[[ Line: 12 ]]
            return true;
        end, 
        ShouldRecordServerExperiment = v5 or function() --[[ Line: 13 ]]
            return true;
        end, 
        UserExperimentResortControl = function() --[[ Line: 14 ]] --[[ Name: UserExperimentResortControl ]]
            return false;
        end, 
        ServerExperimentResortControl = function() --[[ Line: 15 ]] --[[ Name: ServerExperimentResortControl ]]
            return false;
        end, 
        UserExperiments = {
            TestExperiment = {
                Variations = {
                    Control = {
                        Probability = 0.5, 
                        Data = true
                    }, 
                    Variant1 = {
                        Probability = 0.5, 
                        Data = false
                    }
                }, 
                Concluded = false, 
                ID = 1
            }, 
            ConcludedExperiment = {
                Variations = {
                    Control = {
                        Probability = 0.5, 
                        Data = true
                    }, 
                    Variant1 = {
                        Probability = 0.5, 
                        Data = false
                    }
                }, 
                Conclusion = "Control", 
                Concluded = true, 
                ID = 1
            }, 
            ForceUserExperiment = {
                Variations = {
                    Control = {
                        Probability = 0.5, 
                        Data = true
                    }, 
                    Variant1 = {
                        Probability = 0.5, 
                        Data = false
                    }
                }, 
                ForceUsers = l_TableUtil_0.Array.Map1D({
                    1, 
                    2, 
                    3, 
                    4, 
                    5, 
                    6, 
                    7, 
                    8, 
                    9, 
                    10
                }, function(v6) --[[ Line: 62 ]]
                    return "Control", v6;
                end), 
                Concluded = false, 
                ID = 1
            }
        }, 
        ServerExperiments = {
            TestExperiment = {
                Variations = {
                    Control = {
                        Probability = 0.5, 
                        Data = true
                    }, 
                    Variant1 = {
                        Probability = 0.5, 
                        Data = false
                    }
                }, 
                Concluded = false, 
                ID = 1
            }, 
            ConcludedExperiment = {
                Variations = {
                    Control = {
                        Probability = 0.5, 
                        Data = true
                    }, 
                    Variant1 = {
                        Probability = 0.5, 
                        Data = false
                    }
                }, 
                Conclusion = "Control", 
                Concluded = true, 
                ID = 1
            }
        }, 
        ServerExperimentSeed = v3 or 0
    });
    table.insert(v2, v7);
    return v7;
end;
return function() --[[ Line: 112 ]]
    -- upvalues: v2 (copy), v8 (copy), l_TableUtil_0 (copy)
    afterEach(function() --[[ Line: 113 ]]
        -- upvalues: v2 (ref)
        for _, v10 in v2 do
            v10:Destroy();
        end;
        table.clear(v2);
    end);
    describe("UserJoined", function() --[[ Line: 121 ]]
        -- upvalues: v8 (ref)
        it("should accept integers and reject non-integers as the first arg", function() --[[ Line: 122 ]]
            -- upvalues: v8 (ref)
            local v11 = v8();
            expect(function() --[[ Line: 125 ]]
                -- upvalues: v11 (copy)
                v11:UserJoined(1);
            end).never.to.throw();
            expect(function() --[[ Line: 129 ]]
                -- upvalues: v11 (copy)
                v11:UserJoined("1");
            end).to.throw();
        end);
        it("should accept only a valid event data table as a second arg", function() --[[ Line: 134 ]]
            -- upvalues: v8 (ref)
            expect(function() --[[ Line: 135 ]]
                -- upvalues: v8 (ref)
                v8():UserJoined(1, {});
            end).never.to.throw();
            expect(function() --[[ Line: 140 ]]
                -- upvalues: v8 (ref)
                v8():UserJoined(1, {
                    X = 1
                });
            end).never.to.throw();
            expect(function() --[[ Line: 145 ]]
                -- upvalues: v8 (ref)
                v8():UserJoined(1, {
                    1
                });
            end).to.throw();
            expect(function() --[[ Line: 150 ]]
                -- upvalues: v8 (ref)
                v8():UserJoined(1, "1");
            end).to.throw();
        end);
    end);
    describe("UserLeft", function() --[[ Line: 157 ]]
        -- upvalues: v8 (ref)
        it("should accept integers and reject non-integers as the first arg", function() --[[ Line: 158 ]]
            -- upvalues: v8 (ref)
            local v12 = v8();
            v12:UserJoined(1);
            expect(function() --[[ Line: 162 ]]
                -- upvalues: v12 (copy)
                v12:UserLeft(1);
            end).never.to.throw();
            expect(function() --[[ Line: 166 ]]
                -- upvalues: v12 (copy)
                v12:UserLeft("1");
            end).to.throw();
        end);
        it("should throw when the given user has not joined", function() --[[ Line: 171 ]]
            -- upvalues: v8 (ref)
            local v13 = v8();
            expect(function() --[[ Line: 174 ]]
                -- upvalues: v13 (copy)
                v13:UserLeft(1);
            end).to.throw();
        end);
        it("should accept only a valid event data table as a second arg", function() --[[ Line: 179 ]]
            -- upvalues: v8 (ref)
            expect(function() --[[ Line: 180 ]]
                -- upvalues: v8 (ref)
                local v14 = v8();
                v14:UserJoined(1);
                v14:UserLeft(1, {});
            end).never.to.throw();
            expect(function() --[[ Line: 186 ]]
                -- upvalues: v8 (ref)
                local v15 = v8();
                v15:UserJoined(1);
                v15:UserLeft(1, {
                    X = 1
                });
            end).never.to.throw();
            expect(function() --[[ Line: 192 ]]
                -- upvalues: v8 (ref)
                local v16 = v8();
                v16:UserJoined(1);
                v16:UserLeft(1, {
                    1
                });
            end).to.throw();
            expect(function() --[[ Line: 198 ]]
                -- upvalues: v8 (ref)
                local v17 = v8();
                v17:UserJoined(1);
                v17:UserLeft(1, "1");
            end).to.throw();
        end);
    end);
    describe("LogEvent", function() --[[ Line: 206 ]]
        -- upvalues: v8 (ref)
        it("should accept strings and reject non-strings as the first arg", function() --[[ Line: 207 ]]
            -- upvalues: v8 (ref)
            local v18 = v8();
            expect(function() --[[ Line: 210 ]]
                -- upvalues: v18 (copy)
                v18:LogEvent("Test");
            end).never.to.throw();
            expect(function() --[[ Line: 214 ]]
                -- upvalues: v18 (copy)
                v18:LogEvent(1);
            end).to.throw();
        end);
        it("should accept tables and reject non-tables as the second arg", function() --[[ Line: 219 ]]
            -- upvalues: v8 (ref)
            local v19 = v8();
            expect(function() --[[ Line: 222 ]]
                -- upvalues: v19 (copy)
                v19:LogEvent("Test", {});
            end).never.to.throw();
            expect(function() --[[ Line: 226 ]]
                -- upvalues: v19 (copy)
                v19:LogEvent("Test", 1);
            end).to.throw();
        end);
    end);
    describe("LogEventWithProbability", function() --[[ Line: 232 ]]
        -- upvalues: v8 (ref)
        it("should accept a number between 0-1 and reject numbers outside this range for the first arg", function() --[[ Line: 233 ]]
            -- upvalues: v8 (ref)
            local v20 = v8();
            expect(function() --[[ Line: 236 ]]
                -- upvalues: v20 (copy)
                v20:LogEventWithProbability(0.5, "Test");
            end).never.to.throw();
            expect(function() --[[ Line: 240 ]]
                -- upvalues: v20 (copy)
                v20:LogEventWithProbability(0, "Test");
            end).never.to.throw();
            expect(function() --[[ Line: 244 ]]
                -- upvalues: v20 (copy)
                v20:LogEventWithProbability(1, "Test");
            end).never.to.throw();
            expect(function() --[[ Line: 248 ]]
                -- upvalues: v20 (copy)
                v20:LogEventWithProbability(-1, "Test");
            end).to.throw();
            expect(function() --[[ Line: 252 ]]
                -- upvalues: v20 (copy)
                v20:LogEventWithProbability(2, "Test");
            end).to.throw();
            expect(function() --[[ Line: 256 ]]
                -- upvalues: v20 (copy)
                v20:LogEventWithProbability("1", "Test");
            end).to.throw();
        end);
        it("should accept strings and reject non-strings as the second arg", function() --[[ Line: 261 ]]
            -- upvalues: v8 (ref)
            local v21 = v8();
            expect(function() --[[ Line: 264 ]]
                -- upvalues: v21 (copy)
                v21:LogEventWithProbability(0.5, "Test");
            end).never.to.throw();
            expect(function() --[[ Line: 268 ]]
                -- upvalues: v21 (copy)
                v21:LogEventWithProbability(0.5, 1);
            end).to.throw();
        end);
        it("should accept tables and reject non-tables as the third arg", function() --[[ Line: 273 ]]
            -- upvalues: v8 (ref)
            local v22 = v8();
            expect(function() --[[ Line: 276 ]]
                -- upvalues: v22 (copy)
                v22:LogEventWithProbability(0.5, "Test", {});
            end).never.to.throw();
            expect(function() --[[ Line: 280 ]]
                -- upvalues: v22 (copy)
                v22:LogEventWithProbability(0.5, "Test", 1);
            end).to.throw();
        end);
    end);
    describe("LogUserEvent", function() --[[ Line: 286 ]]
        -- upvalues: v8 (ref)
        it("should accept integers and reject non-integers as the first arg", function() --[[ Line: 287 ]]
            -- upvalues: v8 (ref)
            local v23 = v8();
            v23:UserJoined(1);
            expect(function() --[[ Line: 291 ]]
                -- upvalues: v23 (copy)
                v23:LogUserEvent(1, "PlayerTest");
            end).never.to.throw();
            expect(function() --[[ Line: 295 ]]
                -- upvalues: v23 (copy)
                v23:LogUserEvent(1.2, "PlayerTest");
            end).to.throw();
            expect(function() --[[ Line: 299 ]]
                -- upvalues: v23 (copy)
                v23:LogUserEvent("1", "PlayerTest");
            end).to.throw();
        end);
        it("should accept strings with a prefix of 'Player' and reject non-strings or strings without said prefix, as the second arg", function() --[[ Line: 304 ]]
            -- upvalues: v8 (ref)
            local v24 = v8();
            v24:UserJoined(1);
            expect(function() --[[ Line: 308 ]]
                -- upvalues: v24 (copy)
                v24:LogUserEvent(1, "PlayerTest");
            end).never.to.throw();
            expect(function() --[[ Line: 312 ]]
                -- upvalues: v24 (copy)
                v24:LogUserEvent(1, "Test");
            end).to.throw();
            expect(function() --[[ Line: 316 ]]
                -- upvalues: v24 (copy)
                v24:LogUserEvent(1, 1);
            end).to.throw();
        end);
        it("should accept tables and reject non-tables as the third arg", function() --[[ Line: 321 ]]
            -- upvalues: v8 (ref)
            local v25 = v8();
            v25:UserJoined(1);
            expect(function() --[[ Line: 325 ]]
                -- upvalues: v25 (copy)
                v25:LogUserEvent(1, "PlayerTest", {});
            end).never.to.throw();
            expect(function() --[[ Line: 329 ]]
                -- upvalues: v25 (copy)
                v25:LogUserEvent(1, "PlayerTest", 1);
            end).to.throw();
        end);
        it("should throw when the given user has not joined", function() --[[ Line: 334 ]]
            -- upvalues: v8 (ref)
            local v26 = v8();
            expect(function() --[[ Line: 337 ]]
                -- upvalues: v26 (copy)
                v26:LogUserEvent(1, "PlayerTest");
            end).to.throw();
            v26:UserJoined(1);
            expect(function() --[[ Line: 343 ]]
                -- upvalues: v26 (copy)
                v26:LogUserEvent(1, "PlayerTest");
            end).never.to.throw();
        end);
    end);
    describe("LogUserEventWithProbability", function() --[[ Line: 349 ]]
        -- upvalues: v8 (ref)
        it("should accept integers and reject non-integers as the first arg", function() --[[ Line: 350 ]]
            -- upvalues: v8 (ref)
            local v27 = v8();
            v27:UserJoined(1);
            expect(function() --[[ Line: 354 ]]
                -- upvalues: v27 (copy)
                v27:LogUserEventWithProbability(1, 0.5, "PlayerTest");
            end).never.to.throw();
            expect(function() --[[ Line: 358 ]]
                -- upvalues: v27 (copy)
                v27:LogUserEventWithProbability(1.2, 0.5, "PlayerTest");
            end).to.throw();
            expect(function() --[[ Line: 362 ]]
                -- upvalues: v27 (copy)
                v27:LogUserEventWithProbability("1", 0.5, "PlayerTest");
            end).to.throw();
        end);
        it("should accept numbers between 0-1 and reject numbers outside this range for the second arg", function() --[[ Line: 367 ]]
            -- upvalues: v8 (ref)
            local v28 = v8();
            v28:UserJoined(1);
            expect(function() --[[ Line: 371 ]]
                -- upvalues: v28 (copy)
                v28:LogUserEventWithProbability(1, 0.5, "PlayerTest");
            end).never.to.throw();
            expect(function() --[[ Line: 375 ]]
                -- upvalues: v28 (copy)
                v28:LogUserEventWithProbability(1, 0, "PlayerTest");
            end).never.to.throw();
            expect(function() --[[ Line: 379 ]]
                -- upvalues: v28 (copy)
                v28:LogUserEventWithProbability(1, 1, "PlayerTest");
            end).never.to.throw();
            expect(function() --[[ Line: 383 ]]
                -- upvalues: v28 (copy)
                v28:LogUserEventWithProbability(1, -1, "PlayerTest");
            end).to.throw();
            expect(function() --[[ Line: 387 ]]
                -- upvalues: v28 (copy)
                v28:LogUserEventWithProbability(1, 2, "PlayerTest");
            end).to.throw();
            expect(function() --[[ Line: 391 ]]
                -- upvalues: v28 (copy)
                v28:LogUserEventWithProbability(1, "1", "PlayerTest");
            end).to.throw();
        end);
        it("should accept strings with a prefix of 'Player' and reject non-strings or strings without said prefix, as the third arg", function() --[[ Line: 396 ]]
            -- upvalues: v8 (ref)
            local v29 = v8();
            v29:UserJoined(1);
            expect(function() --[[ Line: 400 ]]
                -- upvalues: v29 (copy)
                v29:LogUserEventWithProbability(1, 0.5, "PlayerTest");
            end).never.to.throw();
            expect(function() --[[ Line: 404 ]]
                -- upvalues: v29 (copy)
                v29:LogUserEventWithProbability(1, 0.5, "Test");
            end).to.throw();
            expect(function() --[[ Line: 408 ]]
                -- upvalues: v29 (copy)
                v29:LogUserEventWithProbability(1, 0.5, 1);
            end).to.throw();
        end);
        it("should accept tables and reject non-tables as the fourth arg", function() --[[ Line: 413 ]]
            -- upvalues: v8 (ref)
            local v30 = v8();
            v30:UserJoined(1);
            expect(function() --[[ Line: 417 ]]
                -- upvalues: v30 (copy)
                v30:LogUserEventWithProbability(1, 0.5, "PlayerTest", {});
            end).never.to.throw();
            expect(function() --[[ Line: 421 ]]
                -- upvalues: v30 (copy)
                v30:LogUserEventWithProbability(1, 0.5, "PlayerTest", 1);
            end).to.throw();
        end);
    end);
    describe("GetVariationForUser", function() --[[ Line: 427 ]]
        -- upvalues: v8 (ref)
        it("should accept integers and reject non-integers as the first arg", function() --[[ Line: 428 ]]
            -- upvalues: v8 (ref)
            local v31 = v8();
            v31:UserJoined(1);
            expect(function() --[[ Line: 432 ]]
                -- upvalues: v31 (copy)
                v31:GetVariationForUser(1, "TestExperiment");
            end).never.to.throw();
            expect(function() --[[ Line: 436 ]]
                -- upvalues: v31 (copy)
                v31:GetVariationForUser(1.2, "TestExperiment");
            end).to.throw();
            expect(function() --[[ Line: 440 ]]
                -- upvalues: v31 (copy)
                v31:GetVariationForUser("1", "TestExperiment");
            end).to.throw();
        end);
        it("should accept strings and reject non-strings as the second arg", function() --[[ Line: 445 ]]
            -- upvalues: v8 (ref)
            local v32 = v8();
            v32:UserJoined(1);
            expect(function() --[[ Line: 449 ]]
                -- upvalues: v32 (copy)
                v32:GetVariationForUser(1, "TestExperiment");
            end).never.to.throw();
            expect(function() --[[ Line: 453 ]]
                -- upvalues: v32 (copy)
                v32:GetVariationForUser(1, 1);
            end).to.throw();
        end);
        it("should return the same variation for the same player", function() --[[ Line: 458 ]]
            -- upvalues: v8 (ref)
            local v33 = v8();
            v33:UserJoined(12345);
            local l_v33_VariationForUser_0 = v33:GetVariationForUser(12345, "TestExperiment");
            for _ = 1, 1000 do
                expect(v33:GetVariationForUser(12345, "TestExperiment")).to.equal(l_v33_VariationForUser_0);
            end;
        end);
        it("should return the concluded variation for a concluded experiment", function() --[[ Line: 469 ]]
            -- upvalues: v8 (ref)
            local v36 = v8();
            v36:UserJoined(12345);
            local l_v36_VariationForUser_0 = v36:GetVariationForUser(12345, "ConcludedExperiment");
            for v38 = 1, 1000 do
                v36:UserJoined(v38);
                expect(v36:GetVariationForUser(v38, "ConcludedExperiment")).to.equal(l_v36_VariationForUser_0);
            end;
        end);
        it("should return the correct values for forced users", function() --[[ Line: 481 ]]
            -- upvalues: v8 (ref)
            local v39 = v8();
            v39:UserJoined(12345);
            local l_v39_VariationForUser_0 = v39:GetVariationForUser(12345, "ForceUserExperiment");
            for v41 = 1, 10 do
                v39:UserJoined(v41);
                expect(v39:GetVariationForUser(v41, "ForceUserExperiment")).to.equal(l_v39_VariationForUser_0);
            end;
        end);
        it("should throw when the user has not joined", function() --[[ Line: 493 ]]
            -- upvalues: v8 (ref)
            local v42 = v8();
            expect(function() --[[ Line: 496 ]]
                -- upvalues: v42 (copy)
                v42:GetVariationForUser(12345, "TestExperiment");
            end).to.throw();
            v42:UserJoined(12345);
            expect(function() --[[ Line: 502 ]]
                -- upvalues: v42 (copy)
                v42:GetVariationForUser(12345, "TestExperiment");
            end).never.to.throw();
        end);
        it("should push an ExperimentEnrolment event", function() --[[ Line: 507 ]]
            -- upvalues: v8 (ref)
            local v43 = v8();
            v43:UserJoined(12345);
            v43:GetVariationForUser(12345, "TestExperiment");
            local v44 = nil;
            v43.Events.OnEventBatch:Connect(function(v45) --[[ Line: 513 ]]
                -- upvalues: v44 (ref)
                v44 = v45;
            end);
            task.wait();
            expect(v44).to.be.ok();
            expect(v44[1]).to.be.ok();
            expect(v44[1].Event).to.equal("PlayerJoined");
            expect(v44[2]).to.be.ok();
            expect(v44[2].Event).to.equal("ExperimentEnrolment");
            expect(v44[2].ExperimentName).to.equal("TestExperiment");
            expect(v44[2].UserId).to.equal(12345);
            expect(v44[2].VariationName).to.equal("Control");
            expect(v44[3]).never.to.be.ok();
        end);
        it("should not push an ExperimentEnrolment event when ShouldRecordUserExperiment returns false", function() --[[ Line: 529 ]]
            -- upvalues: v8 (ref)
            local v46 = v8(nil, function() --[[ Line: 530 ]]
                return false;
            end);
            v46:UserJoined(12345);
            v46:GetVariationForUser(12345, "TestExperiment");
            local v47 = nil;
            v46.Events.OnEventBatch:Connect(function(v48) --[[ Line: 535 ]]
                -- upvalues: v47 (ref)
                v47 = v48;
            end);
            task.wait();
            expect(v47).to.be.ok();
            expect(v47[1]).to.be.ok();
            expect(v47[1].Event).to.equal("PlayerJoined");
            expect(v47[2]).never.to.be.ok();
        end);
    end);
    describe("GetVariationForServer", function() --[[ Line: 547 ]]
        -- upvalues: v8 (ref)
        it("should accept strings and reject non-strings as the first arg", function() --[[ Line: 548 ]]
            -- upvalues: v8 (ref)
            local v49 = v8();
            expect(function() --[[ Line: 551 ]]
                -- upvalues: v49 (copy)
                v49:GetVariationForServer("TestExperiment");
            end).never.to.throw();
            expect(function() --[[ Line: 555 ]]
                -- upvalues: v49 (copy)
                v49:GetVariationForServer(1);
            end).to.throw();
        end);
        it("should return the same variation for the same server", function() --[[ Line: 560 ]]
            -- upvalues: v8 (ref)
            local v50 = v8();
            local l_v50_VariationForServer_0 = v50:GetVariationForServer("TestExperiment");
            for _ = 1, 1000 do
                expect(v50:GetVariationForServer("TestExperiment")).to.equal(l_v50_VariationForServer_0);
            end;
        end);
        it("should return the same variation for a concluded experiment", function() --[[ Line: 569 ]]
            -- upvalues: v8 (ref)
            for v53 = 1, 1000 do
                local v54 = v8(v53);
                local l_v54_VariationForServer_0 = v54:GetVariationForServer("ConcludedExperiment");
                expect(v54:GetVariationForServer("ConcludedExperiment")).to.equal(l_v54_VariationForServer_0);
            end;
        end);
    end);
    describe("[Batching]", function() --[[ Line: 578 ]]
        -- upvalues: v8 (ref), l_TableUtil_0 (ref)
        it("should batch together 3 logs in the same frame and fire OnEventBatch", function() --[[ Line: 579 ]]
            -- upvalues: v8 (ref), l_TableUtil_0 (ref)
            local v56 = v8();
            v56:LogEvent("Test1", {});
            v56:LogEvent("Test2", {});
            v56:LogEvent("Test3", {});
            local v57 = nil;
            local v58 = nil;
            v58 = v56.Events.OnEventBatch:Connect(function(v59) --[[ Line: 587 ]]
                -- upvalues: v57 (ref)
                v57 = v59;
            end);
            task.wait();
            v58:Disconnect();
            local function _(v60) --[[ Line: 594 ]] --[[ Name: HasName ]]
                return function(v61) --[[ Line: 595 ]]
                    -- upvalues: v60 (copy)
                    return v61.Event == v60;
                end;
            end;
            expect(v57).to.be.ok();
            local l_expect_0 = expect;
            local l_SelectFirst1D_0 = l_TableUtil_0.Array.SelectFirst1D;
            local l_v57_0 = v57;
            local v66 = "Test1";
            local l_v66_0 = v66 --[[ copy: 11 -> 12 ]];
            l_expect_0(l_SelectFirst1D_0(l_v57_0, function(v68) --[[ Line: 595 ]]
                -- upvalues: l_v66_0 (copy)
                return v68.Event == l_v66_0;
            end)).to.be.ok();
            l_expect_0 = expect;
            l_SelectFirst1D_0 = l_TableUtil_0.Array.SelectFirst1D;
            l_v57_0 = v57;
            v66 = "Test2";
            local l_v66_1 = v66 --[[ copy: 11 -> 13 ]];
            l_expect_0(l_SelectFirst1D_0(l_v57_0, function(v70) --[[ Line: 595 ]]
                -- upvalues: l_v66_1 (copy)
                return v70.Event == l_v66_1;
            end)).to.be.ok();
            l_expect_0 = expect;
            l_SelectFirst1D_0 = l_TableUtil_0.Array.SelectFirst1D;
            l_v57_0 = v57;
            v66 = "Test3";
            l_expect_0(l_SelectFirst1D_0(l_v57_0, function(v71) --[[ Line: 595 ]]
                -- upvalues: v66 (copy)
                return v71.Event == v66;
            end)).to.be.ok();
        end);
        it("should not fire OnEventBatch when the log is empty", function() --[[ Line: 606 ]]
            -- upvalues: v8 (ref)
            local v72 = v8();
            local v73 = nil;
            local v74 = nil;
            v74 = v72.Events.OnEventBatch:Connect(function(v75) --[[ Line: 610 ]]
                -- upvalues: v73 (ref)
                v73 = v75;
            end);
            task.wait();
            task.wait();
            v74:Disconnect();
            expect(v73).never.to.be.ok();
        end);
    end);
end;