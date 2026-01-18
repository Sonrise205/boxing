local function v0(...) --[[ Line: 4 ]] --[[ Name: anyfn ]]
    return {};
end;
it = it or v0;
expect = expect or v0;
describe = describe or v0;
afterAll = afterAll or v0;
afterEach = afterEach or v0;
return function() --[[ Line: 11 ]]
    local l_CollectionService_0 = game:GetService("CollectionService");
    local l_Workspace_0 = game:GetService("Workspace");
    local v3 = require(script.Parent);
    local v4 = require(script.Parent.Parent.Async);
    local function v9() --[[ Line: 18 ]] --[[ Name: MakeClass ]]
        local v5 = {};
        v5.__index = v5;
        v5.Type = "Class";
        v5.new = function(v6) --[[ Line: 23 ]] --[[ Name: new ]]
            -- upvalues: v5 (copy)
            return (setmetatable({
                Root = v6
            }, v5));
        end;
        v5.Initial = function(_) --[[ Line: 29 ]] --[[ Name: Initial ]]

        end;
        v5.Destroy = function(_) --[[ Line: 30 ]] --[[ Name: Destroy ]]

        end;
        return v5;
    end;
    local function v15(v10, v11) --[[ Line: 35 ]] --[[ Name: MakeTestInstance ]]
        -- upvalues: l_CollectionService_0 (copy)
        local l_Model_0 = Instance.new("Model");
        for _, v14 in v10 do
            l_CollectionService_0:AddTag(l_Model_0, v14);
        end;
        l_Model_0.Parent = v11;
        return l_Model_0;
    end;
    local _ = function(v16) --[[ Line: 46 ]] --[[ Name: Count ]]
        local v17 = 0;
        for _ in v16 do
            v17 = v17 + 1;
        end;
        return v17;
    end;
    afterAll(function() --[[ Line: 56 ]]
        -- upvalues: l_Workspace_0 (copy)
        for _, v21 in l_Workspace_0:GetChildren() do
            if v21:IsA("Model") then
                v21:Destroy();
            end;
        end;
    end);
    describe("Rosyn.Register", function() --[[ Line: 66 ]]
        -- upvalues: v3 (copy), v9 (copy), v15 (copy), l_Workspace_0 (copy), l_CollectionService_0 (copy)
        it("should accept standard arguments", function() --[[ Line: 67 ]]
            -- upvalues: v3 (ref), v9 (ref)
            expect(function() --[[ Line: 68 ]]
                -- upvalues: v3 (ref), v9 (ref)
                v3.Register({
                    Components = v3.Setup.Tags({
                        ArgsTestTag1 = v9()
                    })
                });
            end).never.to.throw();
        end);
        it("should asynchronously register", function() --[[ Line: 77 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v22 = v9();
            local v23 = false;
            v22.Initial = function(v24) --[[ Line: 82 ]] --[[ Name: Initial ]]
                -- upvalues: v23 (ref)
                expect(v24.Root).to.never.equal(nil);
                v23 = true;
                task.wait(0.1);
            end;
            local v25 = v15({
                "AsyncTestTag1"
            }, l_Workspace_0);
            local v26 = false;
            task.spawn(function() --[[ Line: 91 ]]
                -- upvalues: v3 (ref), v22 (copy), v26 (ref)
                v3.Register({
                    Components = v3.Setup.Tags({
                        AsyncTestTag1 = v22
                    })
                });
                v26 = true;
            end);
            expect(v26).to.equal(true);
            expect(v23).to.equal(true);
            v25:Destroy();
        end);
        it("should accept and correctly register ancestor target given that filter", function() --[[ Line: 106 ]]
            -- upvalues: v9 (ref), v3 (ref), l_Workspace_0 (ref), v15 (ref)
            local v27 = false;
            local v28 = false;
            local v29 = v9();
            v29.Initial = function(_) --[[ Line: 112 ]] --[[ Name: Initial ]]
                -- upvalues: v27 (ref)
                v27 = true;
            end;
            local v31 = v9();
            v31.Initial = function(_) --[[ Line: 118 ]] --[[ Name: Initial ]]
                -- upvalues: v28 (ref)
                v28 = false;
            end;
            v3.Register({
                Components = v3.Setup.Tags({
                    AncestorTestTag1 = v29
                }), 
                Filter = function(v33) --[[ Line: 126 ]] --[[ Name: Filter ]]
                    -- upvalues: l_Workspace_0 (ref)
                    return v33:IsDescendantOf(l_Workspace_0);
                end
            });
            v3.Register({
                Components = v3.Setup.Tags({
                    AncestorTestTag2 = v31
                }), 
                Filter = function(v34) --[[ Line: 135 ]] --[[ Name: Filter ]]
                    return v34:IsDescendantOf(game:GetService("ReplicatedStorage"));
                end
            });
            v15({
                "AncestorTestTag1"
            }, l_Workspace_0):Destroy();
            v15({
                "AncestorTestTag2"
            }, l_Workspace_0):Destroy();
            expect(v27).to.equal(true);
            expect(v28).to.equal(false);
        end);
        it("should call destroy on objects when the associated Instance is removed", function() --[[ Line: 147 ]]
            -- upvalues: v9 (ref), v3 (ref), v15 (ref), l_Workspace_0 (ref)
            local v35 = false;
            local v36 = v9();
            v36.Destroy = function(_) --[[ Line: 151 ]] --[[ Name: Destroy ]]
                -- upvalues: v35 (ref)
                v35 = true;
            end;
            v3.Register({
                Components = v3.Setup.Tags({
                    DestroyTestTag1 = v36
                })
            });
            local v38 = v15({
                "DestroyTestTag1"
            }, l_Workspace_0);
            expect(v35).to.equal(false);
            v38:Destroy();
            expect(v35).to.equal(true);
        end);
        it("should allow multiple points of registration for the same tag", function() --[[ Line: 167 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v39 = v9();
            local v40 = v9();
            local v41 = v15({
                "MultiComponentOneTag"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    MultiComponentOneTag = v39
                })
            });
            v3.Register({
                Components = v3.Setup.Tags({
                    MultiComponentOneTag = v40
                })
            });
            expect(v3.GetComponent(v41, v39)).to.be.ok();
            expect(v3.GetComponent(v41, v40)).to.be.ok();
        end);
        it("should allow multiple tags on the same Instance", function() --[[ Line: 188 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v42 = v9();
            local v43 = v9();
            local v44 = v15({
                "MultiTag1", 
                "MultiTag2"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    MultiTag1 = v42
                })
            });
            v3.Register({
                Components = v3.Setup.Tags({
                    MultiTag2 = v43
                })
            });
            expect(v3.GetComponent(v44, v42)).to.be.ok();
            expect(v3.GetComponent(v44, v43)).to.be.ok();
        end);
        it("should accept a non-__index class", function() --[[ Line: 209 ]]
            -- upvalues: v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v45 = {
                new = function() --[[ Line: 212 ]] --[[ Name: new ]]
                    return {
                        X = 1
                    };
                end
            };
            local v46 = v15({
                "BlankTable"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    BlankTable = v45
                })
            });
            expect(v3.GetComponent(v46, v45)).to.be.ok();
            expect(v3.GetComponent(v46, v45).X).to.equal(1);
        end);
        it("should remove specific components for removal of tags, instead of all components", function() --[[ Line: 228 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref), l_CollectionService_0 (ref)
            local v47 = v9();
            local v48 = v9();
            local v49 = v15({
                "TagsSetup1"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    TagsSetup1 = v47, 
                    TagsSetup2 = v48
                })
            });
            expect(v3.GetComponent(v49, v47)).to.be.ok();
            expect(v3.GetComponent(v49, v48)).never.to.be.ok();
            l_CollectionService_0:AddTag(v49, "TagsSetup2");
            expect(v3.GetComponent(v49, v47)).to.be.ok();
            expect(v3.GetComponent(v49, v48)).to.be.ok();
            l_CollectionService_0:RemoveTag(v49, "TagsSetup1");
            expect(v3.GetComponent(v49, v47)).never.to.be.ok();
            expect(v3.GetComponent(v49, v48)).to.be.ok();
            l_CollectionService_0:RemoveTag(v49, "TagsSetup2");
            expect(v3.GetComponent(v49, v47)).never.to.be.ok();
            expect(v3.GetComponent(v49, v48)).never.to.be.ok();
        end);
        it("should only wrap Destroy once", function() --[[ Line: 254 ]]
            -- upvalues: v9 (ref), v3 (ref), v15 (ref), l_Workspace_0 (ref)
            local v50 = v9();
            v3.Register({
                Components = v3.Setup.Tags({
                    WrapDestroy1 = v50, 
                    WrapDestroy2 = v50
                })
            });
            local l_Destroy_0 = v50.Destroy;
            v15({
                "WrapDestroy1"
            }, l_Workspace_0);
            local l_Destroy_1 = v50.Destroy;
            expect(l_Destroy_0).never.to.equal(l_Destroy_1);
            v15({
                "WrapDestroy2"
            }, l_Workspace_0);
            expect(l_Destroy_1).to.equal(v50.Destroy);
        end);
        it("should only wrap Initial once", function() --[[ Line: 272 ]]
            -- upvalues: v9 (ref), v3 (ref), v15 (ref), l_Workspace_0 (ref)
            local v53 = v9();
            v3.Register({
                Components = v3.Setup.Tags({
                    WrapInitial1 = v53, 
                    WrapInitial2 = v53
                })
            });
            local l_Initial_0 = v53.Initial;
            v15({
                "WrapInitial1"
            }, l_Workspace_0);
            local l_Initial_1 = v53.Initial;
            expect(l_Initial_0).never.to.equal(l_Initial_1);
            v15({
                "WrapInitial2"
            }, l_Workspace_0);
            expect(l_Initial_1).to.equal(v53.Initial);
        end);
    end);
    describe("Rosyn.GetComponent", function() --[[ Line: 291 ]]
        -- upvalues: v9 (copy), v3 (copy), l_Workspace_0 (copy), v15 (copy)
        it("should return nil where no component present", function() --[[ Line: 292 ]]
            -- upvalues: v9 (ref), v3 (ref), l_Workspace_0 (ref)
            local v56 = v9();
            expect(v3.GetComponent(l_Workspace_0, v56)).never.to.be.ok();
        end);
        it("should return a component when component present", function() --[[ Line: 297 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v57 = v9();
            local v58 = v9();
            local v59 = v15({
                "GetComponent1"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    GetComponent1 = {
                        v57, 
                        v58
                    }
                })
            });
            expect(v3.GetComponent(v59, v57)).to.be.ok();
            expect(v3.GetComponent(v59, v58)).to.be.ok();
        end);
    end);
    describe("Rosyn.ExpectComponent", function() --[[ Line: 313 ]]
        -- upvalues: v9 (copy), v3 (copy), l_Workspace_0 (copy), v15 (copy)
        it("should throw an error where no component present", function() --[[ Line: 314 ]]
            -- upvalues: v9 (ref), v3 (ref), l_Workspace_0 (ref)
            local v60 = v9();
            expect(function() --[[ Line: 317 ]]
                -- upvalues: v3 (ref), l_Workspace_0 (ref), v60 (copy)
                v3.ExpectComponent(l_Workspace_0, v60);
            end).to.throw();
        end);
        it("should return a component when component present", function() --[[ Line: 322 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v61 = v9();
            local v62 = v9();
            local v63 = v15({
                "ExpectComponent1"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    ExpectComponent1 = {
                        v61, 
                        v62
                    }
                })
            });
            expect(v3.ExpectComponent(v63, v61)).to.be.ok();
            expect(v3.ExpectComponent(v63, v62)).to.be.ok();
        end);
    end);
    describe("Rosyn.AwaitComponentInit", function() --[[ Line: 338 ]]
        -- upvalues: v9 (copy), v15 (copy), l_Workspace_0 (copy), v3 (copy)
        it("should immediately return component when present", function() --[[ Line: 339 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v64 = v9();
            local v65 = v15({
                "AwaitComponentInit1"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    AwaitComponentInit1 = {
                        v64
                    }
                })
            });
            expect(v3.AwaitComponentInit(v65, v64)).to.be.ok();
        end);
        it("should await component", function() --[[ Line: 352 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v66 = v9();
            local v67 = v15({
                "AwaitComponentInit2"
            }, l_Workspace_0);
            task.delay(1, function() --[[ Line: 356 ]]
                -- upvalues: v3 (ref), v66 (copy)
                v3.Register({
                    Components = v3.Setup.Tags({
                        AwaitComponentInit2 = {
                            v66
                        }
                    })
                });
            end);
            local v68 = v3.AwaitComponentInit(v67, v66);
            expect(v68).to.be.ok();
        end);
        it("should timeout and throw an error", function() --[[ Line: 368 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v69 = v9();
            local v70 = v15({
                "AwaitComponentInit3"
            }, l_Workspace_0);
            local v71 = os.clock();
            expect(function() --[[ Line: 373 ]]
                -- upvalues: v3 (ref), v70 (copy), v69 (copy)
                v3.AwaitComponentInit(v70, v69, 0.2);
            end).to.throw();
            expect(os.clock() - v71 >= 0.2).to.equal(true);
        end);
        it("should timeout on Initial yield", function() --[[ Line: 380 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v72 = v9();
            local v73 = v15({
                "AwaitComponentInit4"
            }, l_Workspace_0);
            v72.Initial = function(_) --[[ Line: 384 ]] --[[ Name: Initial ]]
                task.wait(0.2);
            end;
            expect(function() --[[ Line: 388 ]]
                -- upvalues: v3 (ref), v73 (copy), v72 (copy)
                v3.AwaitComponentInit(v73, v72, 0.1);
            end).to.throw();
        end);
        it("should correctly wait for Initial", function() --[[ Line: 393 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v75 = v9();
            v75.Initial = function(_) --[[ Line: 396 ]] --[[ Name: Initial ]]
                task.wait(0.1);
            end;
            local v77 = v15({
                "AwaitComponentInit5"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    AwaitComponentInit5 = {
                        v75
                    }
                })
            });
            local v78 = false;
            task.spawn(function() --[[ Line: 410 ]]
                -- upvalues: v3 (ref), v77 (copy), v75 (copy), v78 (ref)
                v3.AwaitComponentInit(v77, v75, 1);
                v78 = true;
            end);
            expect(v78).to.equal(false);
            expect(v3.AwaitComponentInit(v77, v75, 5)).to.be.ok();
            expect(v3.AwaitComponentInit(v77, v75, 5)).to.equal(v3.GetComponent(v77, v75));
        end);
        it("should correctly wait for Initial in a chain", function() --[[ Line: 420 ]]
            -- upvalues: v15 (ref), l_Workspace_0 (ref), v9 (ref), v3 (ref)
            local v79 = v15({
                "AwaitComponentInit6"
            }, l_Workspace_0);
            local v80 = 0;
            local v81 = v9();
            v81.Initial = function(_) --[[ Line: 426 ]] --[[ Name: Initial ]]
                -- upvalues: v80 (ref)
                task.wait(0.1);
                v80 = v80 + 1;
            end;
            local v83 = v9();
            v83.Initial = function(_) --[[ Line: 433 ]] --[[ Name: Initial ]]
                -- upvalues: v3 (ref), v79 (copy), v81 (copy), v80 (ref)
                v3.AwaitComponentInit(v79, v81);
                task.wait(0.1);
                v80 = v80 + 1;
            end;
            local v85 = v9();
            v85.Initial = function(_) --[[ Line: 441 ]] --[[ Name: Initial ]]
                -- upvalues: v3 (ref), v79 (copy), v83 (copy), v80 (ref)
                v3.AwaitComponentInit(v79, v83);
                v80 = v80 + 1;
            end;
            v3.Register({
                Components = v3.Setup.Tags({
                    AwaitComponentInit6 = {
                        v81, 
                        v83, 
                        v85
                    }
                })
            });
            expect(v80).to.equal(0);
            task.wait(0.1);
            expect(v80).to.equal(1);
            task.wait(0.1);
            expect(v80).to.equal(3);
        end);
        it("should correctly wait for Initial in a chain with errors", function() --[[ Line: 459 ]]
            -- upvalues: v15 (ref), l_Workspace_0 (ref), v9 (ref), v3 (ref)
            local v87 = v15({
                "AwaitComponentInit7"
            }, l_Workspace_0);
            local v88 = 0;
            local v89 = v9();
            v89.Initial = function(_) --[[ Line: 465 ]] --[[ Name: Initial ]]
                -- upvalues: v88 (ref)
                task.wait(0.1);
                v88 = v88 + 1;
                error("Test");
            end;
            local v91 = v9();
            v91.Initial = function(_) --[[ Line: 473 ]] --[[ Name: Initial ]]
                -- upvalues: v88 (ref), v3 (ref), v87 (copy), v89 (copy)
                v88 = v88 + 1;
                v3.AwaitComponentInit(v87, v89);
                v88 = v88 + 1;
            end;
            local v93 = v9();
            v93.Initial = function(_) --[[ Line: 481 ]] --[[ Name: Initial ]]
                -- upvalues: v88 (ref), v3 (ref), v87 (copy), v91 (copy)
                v88 = v88 + 1;
                v3.AwaitComponentInit(v87, v91);
                v88 = v88 + 1;
            end;
            expect(v88).to.equal(0);
            v3.Register({
                Components = v3.Setup.Tags({
                    AwaitComponentInit7 = {
                        v89, 
                        v91, 
                        v93
                    }
                })
            });
            task.wait(0.1);
            expect(v88).to.equal(3);
        end);
        it("should respond to Initial timeouts correctly", function() --[[ Line: 499 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v95 = v9();
            v95.Options = {
                InitialTimeout = 0.1
            };
            v95.Initial = function(_) --[[ Line: 505 ]] --[[ Name: Initial ]]
                task.wait(0.2);
            end;
            local v97 = v15({
                "AwaitComponentInit8"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    AwaitComponentInit8 = {
                        v95
                    }
                })
            });
            expect(function() --[[ Line: 517 ]]
                -- upvalues: v3 (ref), v97 (copy), v95 (copy)
                v3.AwaitComponentInit(v97, v95, 0.2);
            end).to.throw();
        end);
    end);
    describe("Rosyn.GetComponentFromDescendant", function() --[[ Line: 523 ]]
        -- upvalues: v15 (copy), l_Workspace_0 (copy), v9 (copy), v3 (copy)
        it("should return nil where no component present", function() --[[ Line: 524 ]]
            -- upvalues: v15 (ref), l_Workspace_0 (ref), v9 (ref), v3 (ref)
            local v98 = v15({}, l_Workspace_0);
            local v99 = v9();
            expect(v3.GetComponentFromDescendant(v98, v99)).never.to.be.ok();
        end);
        it("should return a component when component present", function() --[[ Line: 530 ]]
            -- upvalues: v15 (ref), l_Workspace_0 (ref), v9 (ref), v3 (ref)
            local v100 = v15({
                "DescendantTest1"
            }, l_Workspace_0);
            local v101 = v15({}, v100);
            local v102 = v9();
            v3.Register({
                Components = v3.Setup.Tags({
                    DescendantTest1 = {
                        v102
                    }
                })
            });
            expect(v3.GetComponentFromDescendant(v100, v102)).to.be.ok();
            expect(v3.GetComponentFromDescendant(v101, v102)).to.be.ok();
        end);
    end);
    describe("Rosyn.GetInstancesOfClass", function() --[[ Line: 546 ]]
        -- upvalues: v9 (copy), v3 (copy), v15 (copy), l_Workspace_0 (copy)
        it("should obtain all Instances which have a specific component class", function() --[[ Line: 547 ]]
            -- upvalues: v9 (ref), v3 (ref), v15 (ref), l_Workspace_0 (ref)
            local v103 = {};
            local v104 = v9();
            v3.Register({
                Components = v3.Setup.Tags({
                    GetInstancesOfClass1 = {
                        v104
                    }
                })
            });
            for _ = 1, 5 do
                v103[v15({
                    "GetInstancesOfClass1"
                }, l_Workspace_0)] = true;
            end;
            local v106 = v3.GetInstancesOfClass(v104);
            local v107 = 0;
            for _ in v106 do
                v107 = v107 + 1;
            end;
            expect(v107 == 5).to.equal(true);
            for v109 in v106 do
                expect(v103[v109]).to.be.ok();
            end;
        end);
    end);
    describe("Rosyn.GetComponentsOfClass", function() --[[ Line: 572 ]]
        -- upvalues: v9 (copy), v3 (copy), v15 (copy), l_Workspace_0 (copy)
        it("should return components of a correct class", function() --[[ Line: 573 ]]
            -- upvalues: v9 (ref), v3 (ref), v15 (ref), l_Workspace_0 (ref)
            local v110 = {};
            local v111 = v9();
            v3.Register({
                Components = v3.Setup.Tags({
                    GetComponentsOfClass1 = {
                        v111
                    }
                })
            });
            for _ = 1, 5 do
                v110[v15({
                    "GetComponentsOfClass1"
                }, l_Workspace_0)] = true;
            end;
            local v113 = v3.GetComponentsOfClass(v111);
            local v114 = 0;
            for _ in v113 do
                v114 = v114 + 1;
            end;
            expect(v114 == 5).to.equal(true);
            for v116 in v113 do
                expect(v110[v116.Root]).to.be.ok();
            end;
        end);
    end);
    describe("Rosyn.GetComponentsFromInstance", function() --[[ Line: 598 ]]
        -- upvalues: v9 (copy), v15 (copy), l_Workspace_0 (copy), v3 (copy)
        it("should return the components on a given Instance", function() --[[ Line: 599 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v117 = v9();
            local v118 = v9();
            local v119 = v15({
                "GetComponentsFromInstance1", 
                "GetComponentsFromInstance2"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    GetComponentsFromInstance1 = {
                        v117
                    }
                })
            });
            v3.Register({
                Components = v3.Setup.Tags({
                    GetComponentsFromInstance2 = {
                        v118
                    }
                })
            });
            local v120 = v3.GetComponentsFromInstance(v119);
            local l_expect_0 = expect;
            local v122 = 0;
            for _ in v120 do
                v122 = v122 + 1;
            end;
            l_expect_0(v122 == 2).to.equal(true);
            expect(v120[v117]).to.be.ok();
            expect(v120[v117]).to.equal(v3.GetComponent(v119, v117));
            expect(v120[v118]).to.be.ok();
            expect(v120[v118]).to.equal(v3.GetComponent(v119, v118));
        end);
        it("should return the components on a given Instance, even if uninitialized", function() --[[ Line: 624 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v124 = v9();
            v124.Initial = function(_) --[[ Line: 627 ]] --[[ Name: Initial ]]
                task.wait(0.2);
            end;
            local v126 = v15({
                "GetComponentsFromInstance3"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    GetComponentsFromInstance3 = {
                        v124
                    }
                })
            });
            local v127 = v3.GetComponentsFromInstance(v126);
            local l_expect_1 = expect;
            local v129 = 0;
            for _ in v127 do
                v129 = v129 + 1;
            end;
            l_expect_1(v129 == 1).to.equal(true);
            expect(v127[v124]).to.be.ok();
            expect(v127[v124]).to.equal(v3.GetComponent(v126, v124));
        end);
    end);
    describe("Component.Initial", function() --[[ Line: 646 ]]
        -- upvalues: v9 (copy), v15 (copy), l_Workspace_0 (copy), v3 (copy), v4 (copy)
        it("should timeout the Initial thread times out, and terminate the thread", function() --[[ Line: 647 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v131 = v9();
            v131.Options = {
                InitialTimeout = 0.1
            };
            local v132 = nil;
            v131.Initial = function(_) --[[ Line: 655 ]] --[[ Name: Initial ]]
                -- upvalues: v132 (ref)
                v132 = coroutine.running();
                task.wait(1);
            end;
            local v134 = v15({
                "InitialTimeout1"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    InitialTimeout1 = {
                        v131
                    }
                })
            });
            task.wait(0.1);
            expect(coroutine.status(v132)).to.equal("dead");
            expect(function() --[[ Line: 671 ]]
                -- upvalues: v3 (ref), v134 (copy), v131 (copy)
                v3.AwaitComponentInit(v134, v131);
            end).to.throw("timed out");
        end);
        it("should throw an error if the component's Initial threw an error", function() --[[ Line: 676 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v135 = v9();
            v135.Initial = function(_) --[[ Line: 679 ]] --[[ Name: Initial ]]
                error("Test error");
            end;
            local v137 = v15({
                "InitialError1"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    InitialError1 = {
                        v135
                    }
                })
            });
            expect(function() --[[ Line: 691 ]]
                -- upvalues: v3 (ref), v137 (copy), v135 (copy)
                v3.AwaitComponentInit(v137, v135);
            end).to.throw("threw an error");
        end);
        it("should return the component if Initial completed successfully", function() --[[ Line: 696 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v138 = v9();
            v138.Initial = function(_) --[[ Line: 699 ]] --[[ Name: Initial ]]
                task.wait(0.1);
            end;
            local v140 = v15({
                "InitialSuccess1"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    InitialSuccess1 = {
                        v138
                    }
                })
            });
            local v141 = v3.AwaitComponentInit(v140, v138);
            expect(v141).to.be.ok();
            expect(v141).to.equal(v3.GetComponent(v140, v138));
        end);
        it("should timeout if the component was not added to the Instance on time", function() --[[ Line: 716 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v142 = v9();
            local v143 = v15({
                "InstanceTimeout1"
            }, l_Workspace_0);
            expect(function() --[[ Line: 720 ]]
                -- upvalues: v3 (ref), v143 (copy), v142 (copy)
                v3.AwaitComponentInit(v143, v142, 0.1);
            end).to.throw("on time");
        end);
        it("should throw an error if the component is removed while it is initializing", function() --[[ Line: 725 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v144 = v9();
            v144.Initial = function(_) --[[ Line: 728 ]] --[[ Name: Initial ]]
                task.wait(0.5);
            end;
            local v146 = v15({
                "InstanceRemoved1"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    InstanceRemoved1 = {
                        v144
                    }
                })
            });
            task.delay(0.1, function() --[[ Line: 740 ]]
                -- upvalues: v146 (copy)
                v146:Destroy();
            end);
            expect(function() --[[ Line: 744 ]]
                -- upvalues: v3 (ref), v146 (copy), v144 (copy)
                v3.AwaitComponentInit(v146, v144, 0.2);
            end).to.throw("removed");
        end);
        it("should throw an error if the Initial thread has already thrown", function() --[[ Line: 749 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v147 = v9();
            v147.Initial = function(_) --[[ Line: 752 ]] --[[ Name: Initial ]]
                error("Test error");
            end;
            local v149 = v15({
                "InitialError1"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    InitialError1 = {
                        v147
                    }
                })
            });
            task.wait();
            expect(function() --[[ Line: 766 ]]
                -- upvalues: v3 (ref), v149 (copy), v147 (copy)
                v3.AwaitComponentInit(v149, v147);
            end).to.throw("threw an error");
        end);
        it("should throw an error if the Initial thread has already timed out", function() --[[ Line: 771 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v150 = v9();
            v150.Options = {
                InitialTimeout = 0.1
            };
            v150.Initial = function(_) --[[ Line: 777 ]] --[[ Name: Initial ]]
                task.wait(0.5);
            end;
            local v152 = v15({
                "InitialError2"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    InitialError2 = {
                        v150
                    }
                })
            });
            task.wait(0.2);
            expect(function() --[[ Line: 791 ]]
                -- upvalues: v3 (ref), v152 (copy), v150 (copy)
                v3.AwaitComponentInit(v152, v150);
            end).to.throw("timed out");
        end);
        it("should not terminate all Async-spawned threads from the Initial thread on timeout", function() --[[ Line: 796 ]]
            -- upvalues: v9 (ref), v4 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v153 = v9();
            v153.Options = {
                InitialTimeout = 0
            };
            local v154 = nil;
            local v155 = nil;
            v153.Initial = function(_) --[[ Line: 805 ]] --[[ Name: Initial ]]
                -- upvalues: v4 (ref), v155 (ref), v154 (ref)
                v4.Spawn(function() --[[ Line: 806 ]]
                    -- upvalues: v155 (ref), v154 (ref)
                    v155 = coroutine.running();
                    v154 = 1;
                    task.wait();
                    task.wait();
                    v154 = 2;
                end);
            end;
            v15({
                "AsyncNoTerminate"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    AsyncNoTerminate = {
                        v153
                    }
                })
            });
            expect(v154).to.equal(1);
            expect(coroutine.status(v155)).to.equal("suspended");
            task.wait();
            task.wait();
            expect(v154).to.equal(2);
            expect(coroutine.status(v155)).to.equal("dead");
        end);
    end);
    describe("Component.Destroy", function() --[[ Line: 832 ]]
        -- upvalues: v9 (copy), v15 (copy), l_Workspace_0 (copy), v3 (copy), v4 (copy)
        it("should fire after Initial thread yielding", function() --[[ Line: 833 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v157 = false;
            local v158 = v9();
            v158.Initial = function(_) --[[ Line: 837 ]] --[[ Name: Initial ]]
                task.wait(0.2);
            end;
            v158.Destroy = function(_) --[[ Line: 841 ]] --[[ Name: Destroy ]]
                -- upvalues: v157 (ref)
                v157 = true;
            end;
            local v161 = v15({
                "DestroySequence1"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    DestroySequence1 = {
                        v158
                    }
                })
            });
            v161:Destroy();
            expect(v157).to.equal(false);
            task.wait(0.2);
            expect(v157).to.equal(true);
        end);
        it("should fire after Initial thread throwing", function() --[[ Line: 859 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v162 = false;
            local v163 = v9();
            v163.Initial = function(_) --[[ Line: 863 ]] --[[ Name: Initial ]]
                error("Test");
            end;
            v163.Destroy = function(_) --[[ Line: 867 ]] --[[ Name: Destroy ]]
                -- upvalues: v162 (ref)
                v162 = true;
            end;
            local v166 = v15({
                "DestroySequence2"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    DestroySequence2 = {
                        v163
                    }
                })
            });
            v166:Destroy();
            expect(v162).to.equal(true);
        end);
        it("should fire after Initial thread success", function() --[[ Line: 883 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v167 = false;
            local v168 = v9();
            v168.Initial = function(_) --[[ Line: 887 ]] --[[ Name: Initial ]]

            end;
            v168.Destroy = function(_) --[[ Line: 890 ]] --[[ Name: Destroy ]]
                -- upvalues: v167 (ref)
                v167 = true;
            end;
            local v171 = v15({
                "DestroySequence3"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    DestroySequence3 = {
                        v168
                    }
                })
            });
            v171:Destroy();
            expect(v167).to.equal(true);
        end);
        it("should terminate all Async-spawned threads from the Initial thread on destroy", function() --[[ Line: 906 ]]
            -- upvalues: v9 (ref), v4 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v172 = v9();
            local v173 = nil;
            local v174 = nil;
            v172.Initial = function(_) --[[ Line: 911 ]] --[[ Name: Initial ]]
                -- upvalues: v4 (ref), v174 (ref), v173 (ref)
                v4.Spawn(function() --[[ Line: 912 ]]
                    -- upvalues: v174 (ref), v173 (ref)
                    v174 = coroutine.running();
                    v173 = 1;
                    task.wait(0.1);
                    v173 = 2;
                end);
            end;
            local v176 = v15({
                "DestroyAsyncTerminate"
            }, l_Workspace_0);
            v3.Register({
                Components = v3.Setup.Tags({
                    DestroyAsyncTerminate = {
                        v172
                    }
                })
            });
            expect(v173).to.equal(1);
            expect(coroutine.status(v174)).to.equal("suspended");
            v176:Destroy();
            task.wait(0.1);
            expect(v173).to.equal(1);
            expect(coroutine.status(v174)).to.equal("dead");
        end);
    end);
    describe("Rosyn.Register + Children", function() --[[ Line: 937 ]]
        -- upvalues: v9 (copy), v15 (copy), l_Workspace_0 (copy), v3 (copy)
        it("should register components on children", function() --[[ Line: 938 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v177 = v9();
            local v178 = v15({}, l_Workspace_0);
            local v179 = v15({}, v178);
            v3.Register({
                Components = v3.Setup.Children(v178, v177)
            });
            expect(v3.GetComponent(v179, v177)).to.be.ok();
            local v180 = v15({}, v178);
            expect(v3.GetComponent(v180, v177)).to.be.ok();
        end);
        it("should call Destroy on destroyed Instances", function() --[[ Line: 953 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v181 = v9();
            local v182 = {};
            v181.Destroy = function(v183) --[[ Line: 957 ]] --[[ Name: Destroy ]]
                -- upvalues: v182 (copy)
                v182[v183.Root] = true;
            end;
            local v184 = v15({}, l_Workspace_0);
            local v185 = v15({}, v184);
            v3.Register({
                Components = v3.Setup.Children(v184, v181)
            });
            expect(v182[v185]).to.never.be.ok();
            v185:Destroy();
            expect(v182[v185]).to.be.ok();
            local v186 = v15({}, v184);
            expect(v182[v186]).to.never.be.ok();
            v184:Destroy();
            expect(v182[v186]).to.be.ok();
        end);
    end);
    describe("Rosyn.Register + Descendants", function() --[[ Line: 979 ]]
        -- upvalues: v9 (copy), v15 (copy), l_Workspace_0 (copy), v3 (copy)
        it("should register components on descendants", function() --[[ Line: 980 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v187 = v9();
            local v188 = v15({}, l_Workspace_0);
            local v189 = v15({}, v188);
            local v190 = v15({}, v189);
            v3.Register({
                Components = v3.Setup.Descendants(v188, v187)
            });
            expect(v3.GetComponent(v189, v187)).to.be.ok();
            expect(v3.GetComponent(v190, v187)).to.be.ok();
            local v191 = v15({}, v190);
            expect(v3.GetComponent(v191, v187)).to.be.ok();
        end);
        it("should call Destroy on destroyed Instances", function() --[[ Line: 997 ]]
            -- upvalues: v9 (ref), v15 (ref), l_Workspace_0 (ref), v3 (ref)
            local v192 = v9();
            local v193 = {};
            v192.Destroy = function(v194) --[[ Line: 1001 ]] --[[ Name: Destroy ]]
                -- upvalues: v193 (copy)
                v193[v194.Root] = true;
            end;
            local v195 = v15({}, l_Workspace_0);
            local v196 = v15({}, v195);
            local v197 = v15({}, v196);
            v3.Register({
                Components = v3.Setup.Descendants(v195, v192)
            });
            local v198 = v15({}, v197);
            expect(v193[v198]).to.never.be.ok();
            v198:Destroy();
            expect(v193[v198]).to.be.ok();
            expect(v193[v197]).to.never.be.ok();
            v197:Destroy();
            expect(v193[v197]).to.be.ok();
            expect(v193[v196]).to.never.be.ok();
            v196:Destroy();
            expect(v193[v196]).to.be.ok();
        end);
    end);
end;