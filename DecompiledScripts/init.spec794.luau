local function v0(...) --[[ Line: 4 ]] --[[ Name: anyfn ]]
    return {};
end;
it = it or v0;
expect = expect or v0;
describe = describe or v0;
return function() --[[ Line: 9 ]]
    local v1 = require(script.Parent);
    local function v4() --[[ Line: 12 ]] --[[ Name: GetTestClass ]]
        local v2 = {};
        v2.__index = v2;
        v2.new = function() --[[ Line: 16 ]] --[[ Name: new ]]
            -- upvalues: v2 (copy)
            return (setmetatable({}, v2));
        end;
        v2.Destroy = function(_) --[[ Line: 20 ]] --[[ Name: Destroy ]]

        end;
        return v2;
    end;
    describe("Cleaner.new", function() --[[ Line: 25 ]]
        -- upvalues: v1 (copy)
        it("should create a new Cleaner", function() --[[ Line: 26 ]]
            -- upvalues: v1 (ref)
            expect(v1.new()).never.to.equal(nil);
            expect(v1.new()).to.be.a("table");
        end);
    end);
    describe("Cleaner.Add", function() --[[ Line: 32 ]]
        -- upvalues: v1 (copy)
        it("should reject invalid objects", function() --[[ Line: 33 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 34 ]]
                -- upvalues: v1 (ref)
                v1.new():Add(1);
            end).to.throw();
            expect(function() --[[ Line: 38 ]]
                -- upvalues: v1 (ref)
                v1.new():Add("test");
            end).to.throw();
            expect(function() --[[ Line: 42 ]]
                -- upvalues: v1 (ref)
                v1.new():Add({});
            end).to.throw();
        end);
        it("should accept only valid CleanableObjects", function() --[[ Line: 47 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 48 ]]
                -- upvalues: v1 (ref)
                v1.new():Add(Instance.new("Part"));
            end).never.to.throw();
            expect(function() --[[ Line: 52 ]]
                -- upvalues: v1 (ref)
                local v5 = game.ChildAdded:Connect(function() --[[ Line: 53 ]]

                end);
                v1.new():Add(v5);
                v5:Disconnect();
            end).never.to.throw();
            expect(function() --[[ Line: 58 ]]
                -- upvalues: v1 (ref)
                v1.new():Add(v1.new());
            end).never.to.throw();
            expect(function() --[[ Line: 62 ]]
                -- upvalues: v1 (ref)
                v1.new():Add(coroutine.running());
            end).never.to.throw();
            expect(function() --[[ Line: 66 ]]
                -- upvalues: v1 (ref)
                v1.new():Add(function() --[[ Line: 67 ]]

                end);
            end).never.to.throw();
            expect(function() --[[ Line: 70 ]]
                -- upvalues: v1 (ref)
                v1.new():Add({
                    Destroy = function() --[[ Line: 72 ]] --[[ Name: Destroy ]]

                    end
                });
            end).never.to.throw();
            expect(function() --[[ Line: 76 ]]
                -- upvalues: v1 (ref)
                v1.new():Add({
                    Disconnect = function() --[[ Line: 78 ]] --[[ Name: Disconnect ]]

                    end
                });
            end).never.to.throw();
        end);
        it("should accept multiple CleanableObjects as args", function() --[[ Line: 83 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 84 ]]
                -- upvalues: v1 (ref)
                v1.new():Add({
                    Destroy = function() --[[ Line: 86 ]] --[[ Name: Destroy ]]

                    end
                }, {
                    Disconnect = function() --[[ Line: 88 ]] --[[ Name: Disconnect ]]

                    end
                });
            end).never.to.throw();
        end);
        it("should reject when Cleaner is passed itself", function() --[[ Line: 93 ]]
            -- upvalues: v1 (ref)
            local v6 = v1.new();
            expect(function() --[[ Line: 96 ]]
                -- upvalues: v6 (copy)
                v6:Add(v6);
            end).to.throw();
            expect(function() --[[ Line: 100 ]]
                -- upvalues: v6 (copy)
                v6:Add({
                    v6
                });
            end).to.throw();
            expect(function() --[[ Line: 104 ]]
                -- upvalues: v6 (copy)
                v6:Add({
                    game, 
                    v6
                });
            end).to.throw();
        end);
    end);
    describe("Cleaner.Clean", function() --[[ Line: 110 ]]
        -- upvalues: v1 (copy)
        it("should destroy Instances", function() --[[ Line: 111 ]]
            -- upvalues: v1 (ref)
            local l_Part_0 = Instance.new("Part");
            l_Part_0.Parent = game:GetService("Workspace");
            local v8 = v1.new();
            v8:Add(l_Part_0);
            v8:Clean();
            expect(l_Part_0.Parent).to.equal(nil);
        end);
        it("should clean up script signal connections", function() --[[ Line: 122 ]]
            -- upvalues: v1 (ref)
            local l_Part_1 = Instance.new("Part");
            local v10 = 0;
            local v11 = v1.new();
            v11:Add(l_Part_1.ChildAdded:Connect(function() --[[ Line: 127 ]]
                -- upvalues: v10 (ref)
                v10 = v10 + 1;
            end));
            Instance.new("Part", l_Part_1);
            v11:Clean();
            Instance.new("Part", l_Part_1);
            expect(v10).to.equal(1);
        end);
        it("should clean up other cleaners", function() --[[ Line: 137 ]]
            -- upvalues: v1 (ref)
            local v12 = false;
            local v13 = v1.new();
            local v14 = v1.new();
            v14:Add(function() --[[ Line: 142 ]]
                -- upvalues: v12 (ref)
                v12 = true;
            end);
            v13:Add(v14);
            v13:Clean();
            expect(v12).to.equal(true);
        end);
        it("should close coroutines", function() --[[ Line: 151 ]]
            -- upvalues: v1 (ref)
            local v15 = true;
            local v16 = nil;
            task.spawn(function() --[[ Line: 155 ]]
                -- upvalues: v16 (ref), v15 (ref)
                v16 = coroutine.running();
                task.wait();
                v15 = false;
            end);
            local v17 = v1.new();
            v17:Add(v16);
            v17:Clean();
            task.wait();
            expect(v15).to.equal(true);
        end);
        it("should call Destroy on custom objects", function() --[[ Line: 193 ]]
            -- upvalues: v1 (ref)
            local v18 = v1.new();
            local v19 = false;
            v18:Add({
                Destroy = function() --[[ Line: 198 ]] --[[ Name: Destroy ]]
                    -- upvalues: v19 (ref)
                    v19 = true;
                end
            });
            expect(v19).to.equal(false);
            v18:Clean();
            expect(v19).to.equal(true);
        end);
        it("should call Disconnect on custom signals", function() --[[ Line: 208 ]]
            -- upvalues: v1 (ref)
            local v20 = v1.new();
            local v21 = false;
            v20:Add({
                Disconnect = function() --[[ Line: 213 ]] --[[ Name: Disconnect ]]
                    -- upvalues: v21 (ref)
                    v21 = true;
                end
            });
            expect(v21).to.equal(false);
            v20:Clean();
            expect(v21).to.equal(true);
        end);
        it("should clean up with custom method support", function() --[[ Line: 223 ]]
            -- upvalues: v1 (ref)
            local v22 = v1.new();
            local v23 = false;
            local v28 = {
                Test = function(_, v25, v26, v27) --[[ Line: 228 ]] --[[ Name: Test ]]
                    -- upvalues: v23 (ref)
                    expect(v25).to.equal(1);
                    expect(v26).to.equal(2);
                    expect(v27).to.equal(3);
                    v23 = true;
                end
            };
            v22:Add(v22.CustomMethod(v28, "Test", 1, 2, 3));
            v22:Clean();
            expect(v23).to.equal(true);
        end);
    end);
    describe("Cleaner.Add, Cleaner.Clean", function() --[[ Line: 243 ]]
        -- upvalues: v1 (copy)
        it("should automatically clean for items added after", function() --[[ Line: 244 ]]
            -- upvalues: v1 (ref)
            local v29 = v1.new();
            local v30 = 0;
            v29:Add({
                Disconnect = function() --[[ Line: 249 ]] --[[ Name: Disconnect ]]
                    -- upvalues: v30 (ref)
                    v30 = v30 + 1;
                end
            });
            v29:Clean();
            v29:Add({
                Disconnect = function() --[[ Line: 257 ]] --[[ Name: Disconnect ]]
                    -- upvalues: v30 (ref)
                    v30 = v30 + 1;
                end
            });
            expect(v30).to.equal(2);
        end);
    end);
    describe("Cleaner.Spawn", function() --[[ Line: 266 ]]
        -- upvalues: v1 (copy)
        it("should spawn a function async", function() --[[ Line: 267 ]]
            -- upvalues: v1 (ref)
            local v31 = false;
            v1.new():Spawn(function() --[[ Line: 270 ]]
                -- upvalues: v31 (ref)
                v31 = true;
            end);
            expect(v31).to.equal(true);
        end);
        it("should terminate the spawned coroutine when Clean is called", function() --[[ Line: 277 ]]
            -- upvalues: v1 (ref)
            local v32 = v1.new();
            local v33 = false;
            v32:Spawn(function() --[[ Line: 281 ]]
                -- upvalues: v33 (ref)
                task.wait();
                v33 = true;
            end);
            v32:Clean();
            task.wait();
            expect(v33).to.equal(false);
        end);
    end);
    describe("Cleaner.Lock", function() --[[ Line: 292 ]]
        -- upvalues: v1 (copy)
        it("should throw with no object given", function() --[[ Line: 293 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 294 ]]
                -- upvalues: v1 (ref)
                v1.Lock();
            end).to.throw();
        end);
        it("should accept an object", function() --[[ Line: 299 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 300 ]]
                -- upvalues: v1 (ref)
                v1.Lock({});
            end).never.to.throw();
        end);
        it("should disallow reads on an object", function() --[[ Line: 305 ]]
            -- upvalues: v1 (ref)
            local v34 = {
                X = 1
            };
            v1.Lock(v34);
            expect(function() --[[ Line: 312 ]]
                -- upvalues: v34 (copy)
                local _ = v34.X;
            end).to.throw();
            expect(function() --[[ Line: 316 ]]
                -- upvalues: v34 (copy)
                local _ = v34.Y;
            end).to.throw();
        end);
        it("should disallow writes on an object", function() --[[ Line: 321 ]]
            -- upvalues: v1 (ref)
            local v37 = {
                X = 1
            };
            v1.Lock(v37);
            expect(function() --[[ Line: 328 ]]
                -- upvalues: v37 (copy)
                v37.X = 2;
            end).to.throw();
            expect(function() --[[ Line: 332 ]]
                -- upvalues: v37 (copy)
                v37.Y = 3;
            end).to.throw();
        end);
    end);
    describe("Cleaner.Wrap", function() --[[ Line: 338 ]]
        -- upvalues: v1 (copy), v4 (copy)
        it("should throw with no class given", function() --[[ Line: 339 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 340 ]]
                -- upvalues: v1 (ref)
                v1.Wrap();
            end).to.throw();
        end);
        it("should throw with an invalid class given", function() --[[ Line: 345 ]]
            -- upvalues: v1 (ref)
            expect(function() --[[ Line: 346 ]]
                -- upvalues: v1 (ref)
                v1.Wrap({
                    new = function() --[[ Line: 348 ]] --[[ Name: new ]]

                    end
                });
            end).to.throw();
            expect(function() --[[ Line: 352 ]]
                -- upvalues: v1 (ref)
                v1.Wrap({
                    __index = {}
                });
            end).to.throw();
        end);
        it("should accept a valid class", function() --[[ Line: 359 ]]
            -- upvalues: v4 (ref), v1 (ref)
            local v38 = v4();
            expect(function() --[[ Line: 362 ]]
                -- upvalues: v1 (ref), v38 (copy)
                v1.Wrap(v38);
            end).never.to.throw();
        end);
        it("should lock a destroyed object down", function() --[[ Line: 367 ]]
            -- upvalues: v4 (ref), v1 (ref)
            local v39 = v4();
            v1.Wrap(v39);
            expect(function() --[[ Line: 371 ]]
                -- upvalues: v39 (copy)
                local _ = v39.X;
            end).never.to.throw();
            expect(function() --[[ Line: 375 ]]
                -- upvalues: v39 (copy)
                v39.Y = 1;
            end).never.to.throw();
            v39:Destroy();
            expect(function() --[[ Line: 381 ]]
                -- upvalues: v39 (copy)
                local _ = v39.X;
            end).to.throw();
            expect(function() --[[ Line: 385 ]]
                -- upvalues: v39 (copy)
                v39.Y = 2;
            end).to.throw();
        end);
        it("should prevent multiple wraps", function() --[[ Line: 390 ]]
            -- upvalues: v4 (ref), v1 (ref)
            local v42 = v4();
            v1.Wrap(v42);
            expect(function() --[[ Line: 394 ]]
                -- upvalues: v1 (ref), v42 (copy)
                v1.Wrap(v42);
            end).to.throw();
        end);
        it("should work without Destroy being initially present", function() --[[ Line: 399 ]]
            -- upvalues: v4 (ref), v1 (ref)
            local v43 = v4();
            v1.Wrap(v43);
            expect(v43.Destroy).to.be.ok();
            local v44 = v4();
            local v45 = false;
            v44.Destroy = function(_) --[[ Line: 407 ]] --[[ Name: Destroy ]]
                -- upvalues: v45 (ref)
                v45 = true;
            end;
            v1.Wrap(v44);
            v44.new():Destroy();
            expect(v45).to.equal(true);
        end);
    end);
    describe("Cleaner.Wrap, Cleaner.IsWrapped", function() --[[ Line: 417 ]]
        -- upvalues: v4 (copy), v1 (copy)
        it("should detect when a class is wrapped", function() --[[ Line: 418 ]]
            -- upvalues: v4 (ref), v1 (ref)
            local v47 = v4();
            expect(v1.IsWrapped(v47)).to.equal(false);
            v1.Wrap(v47);
            expect(v1.IsWrapped(v47)).to.equal(true);
        end);
    end);
end;