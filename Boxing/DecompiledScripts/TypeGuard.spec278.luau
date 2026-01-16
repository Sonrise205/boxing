local l_CollectionService_0 = game:GetService("CollectionService");
local function v1(...) --[[ Line: 6 ]] --[[ Name: anyfn ]]
    return {};
end;
it = it or v1;
expect = expect or v1;
describe = describe or v1;
return function() --[[ Line: 11 ]]
    -- upvalues: l_CollectionService_0 (copy)
    local v2 = require(script.Parent);
    describe("CreateTemplate", function() --[[ Line: 14 ]]
        -- upvalues: v2 (copy)
        it("should reject no Name given", function() --[[ Line: 15 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 16 ]]
                -- upvalues: v2 (ref)
                v2.CreateTemplate();
            end).to.throw();
        end);
        it("should reject incorrect types for Name", function() --[[ Line: 21 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 22 ]]
                -- upvalues: v2 (ref)
                v2.CreateTemplate(1);
            end).to.throw();
            expect(function() --[[ Line: 26 ]]
                -- upvalues: v2 (ref)
                v2.CreateTemplate({});
            end).to.throw();
            expect(function() --[[ Line: 30 ]]
                -- upvalues: v2 (ref)
                v2.CreateTemplate(true);
            end).to.throw();
            expect(function() --[[ Line: 34 ]]
                -- upvalues: v2 (ref)
                v2.CreateTemplate("Test");
            end).never.to.throw();
        end);
        it("should return a constructor function and a TypeChecker class for extension", function() --[[ Line: 39 ]]
            -- upvalues: v2 (ref)
            local v3, v4 = v2.CreateTemplate("Test");
            expect(v3).to.be.a("function");
            expect(v4).to.be.a("table");
            expect(v4._TC).to.equal(true);
        end);
    end);
    describe("[One-Time vs Multiple-Time Constraints]", function() --[[ Line: 47 ]]
        -- upvalues: v2 (copy)
        local v5 = v2.Number();
        it("should allow a >1 time constraint if instantiated more than once on a checker", function() --[[ Line: 50 ]]
            -- upvalues: v5 (copy)
            expect(function() --[[ Line: 51 ]]
                -- upvalues: v5 (ref)
                v5:IsAKeyIn({}):IsAKeyIn({});
            end).never.to.throw();
        end);
        it("should correctly assess a >1 time constraint when instantiated more than once on a checker", function() --[[ Line: 56 ]]
            -- upvalues: v5 (copy)
            local v6 = v5:IsAKeyIn({
                [123] = true, 
                [456] = true
            }):IsAKeyIn({
                [456] = true, 
                [789] = true
            });
            expect(v6:Check(123)).to.equal(false);
            expect(v6:Check(456)).to.equal(true);
            expect(v6:Check(789)).to.equal(false);
        end);
        it("should reject a 1 time constraint if instantiated more than once on a checker", function() --[[ Line: 63 ]]
            -- upvalues: v5 (copy)
            expect(function() --[[ Line: 64 ]]
                -- upvalues: v5 (ref)
                v5:GreaterThan(3):GreaterThan(5);
            end).to.throw();
        end);
    end);
    describe("Params", function() --[[ Line: 70 ]]
        -- upvalues: v2 (copy)
        it("should reject non-TypeChecker types", function() --[[ Line: 71 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 72 ]]
                -- upvalues: v2 (ref)
                v2.Params(1);
            end).to.throw();
            expect(function() --[[ Line: 76 ]]
                -- upvalues: v2 (ref)
                v2.Params({});
            end).to.throw();
            expect(function() --[[ Line: 80 ]]
                -- upvalues: v2 (ref)
                v2.Params(true);
            end).to.throw();
        end);
        it("should accept TypeChecker types", function() --[[ Line: 85 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 86 ]]
                -- upvalues: v2 (ref)
                v2.Params(v2.Number());
            end).never.to.throw();
            expect(function() --[[ Line: 90 ]]
                -- upvalues: v2 (ref)
                v2.Params(v2.String());
            end).never.to.throw();
            expect(function() --[[ Line: 94 ]]
                -- upvalues: v2 (ref)
                v2.Params(v2.Array());
            end).never.to.throw();
        end);
        it("should check one type", function() --[[ Line: 99 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 100 ]]
                -- upvalues: v2 (ref)
                v2.Params(v2.Number())(1);
            end).never.to.throw();
            expect(function() --[[ Line: 104 ]]
                -- upvalues: v2 (ref)
                v2.Params(v2.Number())("Test");
            end).to.throw();
        end);
        it("should check multiple types", function() --[[ Line: 109 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 110 ]]
                -- upvalues: v2 (ref)
                v2.Params(v2.Number(), v2.String())(1, "Test");
            end).never.to.throw();
            expect(function() --[[ Line: 114 ]]
                -- upvalues: v2 (ref)
                v2.Params(v2.Number(), v2.String())(1, 1);
            end).to.throw();
        end);
    end);
    describe("ParamsWithContext", function() --[[ Line: 120 ]]
        -- upvalues: v2 (copy)
        it("should reject non-TypeChecker types", function() --[[ Line: 121 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 122 ]]
                -- upvalues: v2 (ref)
                v2.ParamsWithContext(1);
            end).to.throw();
            expect(function() --[[ Line: 126 ]]
                -- upvalues: v2 (ref)
                v2.ParamsWithContext({});
            end).to.throw();
            expect(function() --[[ Line: 130 ]]
                -- upvalues: v2 (ref)
                v2.ParamsWithContext(true);
            end).to.throw();
        end);
        it("should accept TypeChecker types", function() --[[ Line: 135 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 136 ]]
                -- upvalues: v2 (ref)
                v2.ParamsWithContext(v2.Number());
            end).never.to.throw();
            expect(function() --[[ Line: 140 ]]
                -- upvalues: v2 (ref)
                v2.ParamsWithContext(v2.String());
            end).never.to.throw();
            expect(function() --[[ Line: 144 ]]
                -- upvalues: v2 (ref)
                v2.ParamsWithContext(v2.Array());
            end).never.to.throw();
        end);
        it("should check one type", function() --[[ Line: 149 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 150 ]]
                -- upvalues: v2 (ref)
                v2.ParamsWithContext(v2.Number())(nil, 1);
            end).never.to.throw();
            expect(function() --[[ Line: 154 ]]
                -- upvalues: v2 (ref)
                v2.ParamsWithContext(v2.Number())(nil, "Test");
            end).to.throw();
        end);
        it("should accept a context as first arg (or nil)", function() --[[ Line: 159 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 160 ]]
                -- upvalues: v2 (ref)
                v2.ParamsWithContext(v2.Number())("Test", 1);
            end).never.to.throw();
            expect(function() --[[ Line: 164 ]]
                -- upvalues: v2 (ref)
                v2.ParamsWithContext(v2.Number())(nil, 1);
            end).never.to.throw();
        end);
        it("should pass the context down", function() --[[ Line: 169 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 170 ]]
                -- upvalues: v2 (ref)
                v2.ParamsWithContext(v2.Number():Equals(function(v7) --[[ Line: 171 ]]
                    return v7.MustEqual;
                end))({
                    MustEqual = 1
                }, 1);
            end).never.to.throw();
        end);
        it("should check multiple types", function() --[[ Line: 177 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 178 ]]
                -- upvalues: v2 (ref)
                v2.ParamsWithContext(v2.Number(), v2.String())(nil, 1, "Test");
            end).never.to.throw();
            expect(function() --[[ Line: 182 ]]
                -- upvalues: v2 (ref)
                v2.ParamsWithContext(v2.Number(), v2.String())(nil, 1, 1);
            end).to.throw();
        end);
    end);
    describe("Variadic", function() --[[ Line: 188 ]]
        -- upvalues: v2 (copy)
        it("should reject non-TypeChecker types", function() --[[ Line: 189 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 190 ]]
                -- upvalues: v2 (ref)
                v2.Variadic(1);
            end).to.throw();
            expect(function() --[[ Line: 194 ]]
                -- upvalues: v2 (ref)
                v2.Variadic({});
            end).to.throw();
            expect(function() --[[ Line: 198 ]]
                -- upvalues: v2 (ref)
                v2.Variadic(true);
            end).to.throw();
        end);
        it("should accept TypeChecker types", function() --[[ Line: 203 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 204 ]]
                -- upvalues: v2 (ref)
                v2.Variadic(v2.Number());
            end).never.to.throw();
            expect(function() --[[ Line: 208 ]]
                -- upvalues: v2 (ref)
                v2.Variadic(v2.String());
            end).never.to.throw();
            expect(function() --[[ Line: 212 ]]
                -- upvalues: v2 (ref)
                v2.Variadic(v2.Array());
            end).never.to.throw();
        end);
        it("should check one type", function() --[[ Line: 217 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 218 ]]
                -- upvalues: v2 (ref)
                v2.Variadic(v2.Number())(1);
            end).never.to.throw();
            expect(function() --[[ Line: 222 ]]
                -- upvalues: v2 (ref)
                v2.Variadic(v2.Number())("Test");
            end).to.throw();
        end);
        it("should check multiple types", function() --[[ Line: 227 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 228 ]]
                -- upvalues: v2 (ref)
                v2.Variadic(v2.Number())(1, 1);
            end).never.to.throw();
            expect(function() --[[ Line: 232 ]]
                -- upvalues: v2 (ref)
                v2.Variadic(v2.Number())(1, "Test");
            end).to.throw();
        end);
    end);
    describe("VariadicWithContext", function() --[[ Line: 238 ]]
        -- upvalues: v2 (copy)
        it("should reject non-TypeChecker types", function() --[[ Line: 239 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 240 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext(1);
            end).to.throw();
            expect(function() --[[ Line: 244 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext({});
            end).to.throw();
            expect(function() --[[ Line: 248 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext(true);
            end).to.throw();
        end);
        it("should accept TypeChecker types", function() --[[ Line: 253 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 254 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext(v2.Number());
            end).never.to.throw();
            expect(function() --[[ Line: 258 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext(v2.String());
            end).never.to.throw();
            expect(function() --[[ Line: 262 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext(v2.Array());
            end).never.to.throw();
        end);
        it("should check one type", function() --[[ Line: 267 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 268 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext(v2.Number())(nil, 1);
            end).never.to.throw();
            expect(function() --[[ Line: 272 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext(v2.Number())(nil, "Test");
            end).to.throw();
        end);
        it("should accept a context as first arg (or nil)", function() --[[ Line: 277 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 278 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext(v2.Number())("Test", 1, 1, 1);
            end).never.to.throw();
            expect(function() --[[ Line: 282 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext(v2.Number())(nil, 1, 1, 1);
            end).never.to.throw();
        end);
        it("should pass the context down", function() --[[ Line: 287 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 288 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext(v2.Number():Equals(function(v8) --[[ Line: 289 ]]
                    return v8.MustEqual;
                end))({
                    MustEqual = 1
                }, 1, 1, 1);
            end).never.to.throw();
            expect(function() --[[ Line: 294 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext(v2.Number():Equals(function(v9) --[[ Line: 295 ]]
                    return v9.MustEqual;
                end))({
                    MustEqual = 1
                }, 1, 1, 2);
            end).to.throw();
        end);
        it("should check multiple types", function() --[[ Line: 301 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 302 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext(v2.Number())(nil, 1, 1);
            end).never.to.throw();
            expect(function() --[[ Line: 306 ]]
                -- upvalues: v2 (ref)
                v2.VariadicWithContext(v2.Number())(nil, 1, "Test");
            end).to.throw();
        end);
    end);
    describe("WrapFunctionParams", function() --[[ Line: 312 ]]
        -- upvalues: v2 (copy)
        it("should reject non functions as first arg", function() --[[ Line: 313 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 314 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionParams(1);
            end).to.throw();
            expect(function() --[[ Line: 318 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionParams({});
            end).to.throw();
            expect(function() --[[ Line: 322 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionParams(true);
            end).to.throw();
            expect(function() --[[ Line: 326 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionParams(function() --[[ Line: 327 ]]

                end);
            end).never.to.throw();
        end);
        it("should reject non-TypeChecker types", function() --[[ Line: 331 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 332 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionParams(function() --[[ Line: 333 ]]

                end, 1);
            end).to.throw();
            expect(function() --[[ Line: 336 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionParams(function() --[[ Line: 337 ]]

                end, {});
            end).to.throw();
            expect(function() --[[ Line: 340 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionParams(function() --[[ Line: 341 ]]

                end, true);
            end).to.throw();
        end);
        it("should accept TypeChecker types", function() --[[ Line: 345 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 346 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionParams(function() --[[ Line: 347 ]]

                end, v2.Number());
            end).never.to.throw();
            expect(function() --[[ Line: 350 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionParams(function() --[[ Line: 351 ]]

                end, v2.String());
            end).never.to.throw();
            expect(function() --[[ Line: 354 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionParams(function() --[[ Line: 355 ]]

                end, v2.Array());
            end).never.to.throw();
        end);
        it("should wrap a function", function() --[[ Line: 359 ]]
            -- upvalues: v2 (ref)
            local v13 = v2.WrapFunctionParams(function(_, _, _) --[[ Line: 360 ]] --[[ Name: TestFunction ]]

            end, v2.Number(), v2.String(), v2.Boolean());
            expect(v13).to.be.a("function");
            expect(function() --[[ Line: 365 ]]
                -- upvalues: v13 (copy)
                v13(1, "x", true);
            end).never.to.throw();
            expect(function() --[[ Line: 369 ]]
                -- upvalues: v13 (copy)
                v13(1, "x", "y");
            end).to.throw();
            expect(function() --[[ Line: 373 ]]
                -- upvalues: v13 (copy)
                v13(1, "x", true, "y");
            end).to.throw();
            expect(function() --[[ Line: 377 ]]
                -- upvalues: v13 (copy)
                v13("1", "x", true);
            end).to.throw();
        end);
    end);
    describe("WrapFunctionVariadic", function() --[[ Line: 383 ]]
        -- upvalues: v2 (copy)
        it("should reject non functions as first arg", function() --[[ Line: 384 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 385 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionVariadic(1);
            end).to.throw();
            expect(function() --[[ Line: 389 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionVariadic({});
            end).to.throw();
            expect(function() --[[ Line: 393 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionVariadic(true);
            end).to.throw();
            expect(function() --[[ Line: 397 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionVariadic(function() --[[ Line: 398 ]]

                end, v2.Number());
            end).never.to.throw();
        end);
        it("should reject non-TypeChecker types", function() --[[ Line: 402 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 403 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionVariadic(function() --[[ Line: 404 ]]

                end, 1);
            end).to.throw();
            expect(function() --[[ Line: 407 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionVariadic(function() --[[ Line: 408 ]]

                end, {});
            end).to.throw();
            expect(function() --[[ Line: 411 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionVariadic(function() --[[ Line: 412 ]]

                end, true);
            end).to.throw();
        end);
        it("should accept TypeChecker types", function() --[[ Line: 416 ]]
            -- upvalues: v2 (ref)
            expect(function() --[[ Line: 417 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionVariadic(function() --[[ Line: 418 ]]

                end, v2.Number());
            end).never.to.throw();
            expect(function() --[[ Line: 421 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionVariadic(function() --[[ Line: 422 ]]

                end, v2.String());
            end).never.to.throw();
            expect(function() --[[ Line: 425 ]]
                -- upvalues: v2 (ref)
                v2.WrapFunctionVariadic(function() --[[ Line: 426 ]]

                end, v2.Array());
            end).never.to.throw();
        end);
        it("should wrap a function", function() --[[ Line: 430 ]]
            -- upvalues: v2 (ref)
            local v15 = v2.WrapFunctionVariadic(function(_, ...) --[[ Line: 431 ]] --[[ Name: TestFunction ]]

            end, v2.Number());
            expect(v15).to.be.a("function");
            expect(function() --[[ Line: 436 ]]
                -- upvalues: v15 (copy)
                v15(1);
            end).never.to.throw();
            expect(function() --[[ Line: 440 ]]
                -- upvalues: v15 (copy)
                v15(1, "x");
            end).to.throw();
            expect(function() --[[ Line: 444 ]]
                -- upvalues: v15 (copy)
                v15(1, "x", true);
            end).to.throw();
            expect(function() --[[ Line: 448 ]]
                -- upvalues: v15 (copy)
                v15(9, 8, 7, 6, 5, 4, 3, 2, 1);
            end).never.to.throw();
        end);
    end);
    describe("TypeChecker", function() --[[ Line: 455 ]]
        -- upvalues: v2 (copy)
        describe("Optional", function() --[[ Line: 456 ]]
            -- upvalues: v2 (ref)
            it("should accept nil as a checked value", function() --[[ Line: 457 ]]
                -- upvalues: v2 (ref)
                expect(v2.Number():Optional():Check(nil)).to.equal(true);
            end);
            it("should accept the target constraint as a checked value if not nil", function() --[[ Line: 461 ]]
                -- upvalues: v2 (ref)
                expect(v2.Number():Optional():Check(1)).to.equal(true);
                expect(v2.Number():Optional():Check("Test")).to.equal(false);
            end);
        end);
        describe("Alias", function() --[[ Line: 467 ]]
            -- upvalues: v2 (ref)
            it("should reject non-string args", function() --[[ Line: 468 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 469 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Alias(1);
                end).to.throw();
                expect(function() --[[ Line: 473 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Alias({});
                end).to.throw();
                expect(function() --[[ Line: 477 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Alias(true);
                end).to.throw();
            end);
            it("should accept string args", function() --[[ Line: 482 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 483 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Alias("Test");
                end).never.to.throw();
            end);
            it("should give a fail string with the alias", function() --[[ Line: 488 ]]
                -- upvalues: v2 (ref)
                local _, v17 = v2.Number():Or(v2.Array()):Alias("TestAlias"):Check("Test");
                expect(v17).to.be.a("string");
                expect(v17:match("TestAlias")).to.be.ok();
            end);
        end);
        describe("Or", function() --[[ Line: 495 ]]
            -- upvalues: v2 (ref)
            it("should reject non-TypeChecker args", function() --[[ Line: 496 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 497 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Or(1);
                end).to.throw();
                expect(function() --[[ Line: 501 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Or({});
                end).to.throw();
                expect(function() --[[ Line: 505 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Or(true);
                end).to.throw();
            end);
            it("should accept TypeChecker args", function() --[[ Line: 510 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 511 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Or(v2.Number());
                end).never.to.throw();
                expect(function() --[[ Line: 515 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Or(v2.String());
                end).never.to.throw();
                expect(function() --[[ Line: 519 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Or(v2.Array());
                end).never.to.throw();
            end);
            it("should accept function args", function() --[[ Line: 524 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 525 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Or(function() --[[ Line: 526 ]]

                    end);
                end).never.to.throw();
            end);
            it("should accept inputs if they satisfy a TypeChecker in the or chain", function() --[[ Line: 530 ]]
                -- upvalues: v2 (ref)
                local v18 = v2.Number():Or(v2.Boolean());
                expect(v18:Check(1)).to.equal(true);
                expect(v18:Check(true)).to.equal(true);
                expect(v18:Check(false)).to.equal(true);
            end);
            it("should reject inputs if they do not satisfy a TypeChecker in the or chain", function() --[[ Line: 537 ]]
                -- upvalues: v2 (ref)
                local v19 = v2.Number():Or(v2.Boolean());
                expect(v19:Check("Test")).to.equal(false);
                expect(v19:Check({})).to.equal(false);
            end);
            it("should accept functional inputs if they return a TypeChecker which satisfies the or chain", function() --[[ Line: 543 ]]
                -- upvalues: v2 (ref)
                local v20 = v2.Number():Or(function() --[[ Line: 544 ]]
                    -- upvalues: v2 (ref)
                    return v2.Boolean();
                end);
                expect(v20:Check(1)).to.equal(true);
                expect(v20:Check(true)).to.equal(true);
                expect(v20:Check(false)).to.equal(true);
            end);
            it("should reject functional inputs if they return a TypeChecker which does not satisfy the or chain", function() --[[ Line: 550 ]]
                -- upvalues: v2 (ref)
                local v21 = v2.Number():Or(function() --[[ Line: 551 ]]
                    -- upvalues: v2 (ref)
                    return v2.Boolean();
                end);
                expect(v21:Check("Test")).to.equal(false);
                expect(v21:Check({})).to.equal(false);
            end);
        end);
        describe("And", function() --[[ Line: 557 ]]
            -- upvalues: v2 (ref)
            it("should reject non-TypeChecker args", function() --[[ Line: 558 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 559 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():And(1);
                end).to.throw();
                expect(function() --[[ Line: 563 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():And({});
                end).to.throw();
                expect(function() --[[ Line: 567 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():And(true);
                end).to.throw();
            end);
            it("should accept TypeChecker args", function() --[[ Line: 572 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 573 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():And(v2.Number());
                end).never.to.throw();
                expect(function() --[[ Line: 577 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():And(v2.String());
                end).never.to.throw();
                expect(function() --[[ Line: 581 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():And(v2.Array());
                end).never.to.throw();
            end);
            it("should reject inputs if they do not satisfy at least one TypeChecker in the and chain", function() --[[ Line: 586 ]]
                -- upvalues: v2 (ref)
                local v22 = v2.Number():And(v2.Boolean());
                expect(v22:Check(1)).to.equal(false);
                expect(v22:Check(true)).to.equal(false);
                expect(v22:Check(false)).to.equal(false);
            end);
            it("should accept inputs if they satisfy all TypeCheckers in the and chain and reject if they do not (for objects)", function() --[[ Line: 593 ]]
                -- upvalues: v2 (ref)
                local v23 = v2.Object():OfStructure({
                    X = v2.Number()
                }):And(v2.Object():OfStructure({
                    Y = v2.String()
                })):And(v2.Object():OfStructure({
                    Z = v2.Boolean()
                }));
                expect(v23:Check({
                    X = 1, 
                    Y = "A", 
                    Z = false
                })).to.equal(true);
                expect(v23:Check({
                    X = 1
                })).to.equal(false);
                expect(v23:Check({
                    X = 1, 
                    Y = "A", 
                    Z = {}
                })).to.equal(false);
            end);
            it("should accept inputs if they satisfy all TypeCheckers in the and chain and reject if they do not (for Instances)", function() --[[ Line: 603 ]]
                -- upvalues: v2 (ref)
                local v24 = v2.Instance():OfStructure({
                    Name = v2.String()
                }):And(v2.Instance():OfStructure({
                    SomeChild = v2.Instance()
                }));
                local l_Folder_0 = Instance.new("Folder");
                local l_Folder_1 = Instance.new("Folder");
                l_Folder_1.Name = "SomeChild";
                l_Folder_1.Parent = l_Folder_0;
                local l_Folder_2 = Instance.new("Folder");
                local l_Folder_3 = Instance.new("Folder");
                l_Folder_3.Name = "SomeChild2";
                l_Folder_3.Parent = l_Folder_2;
                expect(v24:Check(l_Folder_0)).to.equal(true);
                expect(v24:Check(l_Folder_2)).to.equal(false);
            end);
        end);
        describe("Check", function() --[[ Line: 624 ]]
            -- upvalues: v2 (ref)
            it("should return a true boolean and no string on success", function() --[[ Line: 625 ]]
                -- upvalues: v2 (ref)
                local v29, v30 = v2.Number():Check(1);
                expect(v29).to.be.a("boolean");
                expect(v29).to.equal(true);
                expect(v30).to.equal(nil);
            end);
            it("should return a false boolean and a fail string on failure", function() --[[ Line: 633 ]]
                -- upvalues: v2 (ref)
                local v31, v32 = v2.Number():Check("Test");
                expect(v31).to.be.a("boolean");
                expect(v31).to.equal(false);
                expect(v32).to.be.a("string");
                expect(v32).never.to.equal("");
            end);
        end);
        describe("Cached", function() --[[ Line: 643 ]]
            -- upvalues: v2 (ref)
            it("should cache results if Cached is used on simple types", function() --[[ Line: 644 ]]
                -- upvalues: v2 (ref)
                local v33 = v2.Number():Cached();
                expect(v33:Check(1)).to.equal(true);
                expect(v33:Check(1)).to.equal(true);
            end);
            it("should cache results if Cached is used on complex types", function() --[[ Line: 650 ]]
                -- upvalues: v2 (ref)
                local v34 = v2.Object():OfStructureStrict({
                    X = v2.Number()
                }):Cached();
                local v35 = {
                    X = 1
                };
                expect(v34:Check(v35)).to.equal(true);
                v35.Y = 2;
                expect(v34:Check(v35)).to.equal(true);
                expect(v34:Check({
                    X = 1
                })).to.equal(true);
            end);
        end);
        describe("AsPredicate", function() --[[ Line: 660 ]]
            -- upvalues: v2 (ref)
            it("should return a function", function() --[[ Line: 661 ]]
                -- upvalues: v2 (ref)
                expect(v2.Number():AsPredicate()).to.be.a("function");
            end);
            it("should call Check directly and pass a boolean & status string", function() --[[ Line: 665 ]]
                -- upvalues: v2 (ref)
                local v36 = v2.Number():AsPredicate();
                local v37, v38 = v36(1);
                expect(v37).to.be.a("boolean");
                expect(v37).to.equal(true);
                expect(v38).to.equal(nil);
                local v39, v40 = v36("Test");
                expect(v39).to.be.a("boolean");
                expect(v39).to.equal(false);
                expect(v40).to.be.a("string");
                expect(v40).never.to.equal("");
            end);
        end);
        describe("Assert", function() --[[ Line: 680 ]]
            -- upvalues: v2 (ref)
            it("should not throw when the type is satisfied", function() --[[ Line: 681 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 682 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Assert(1);
                end).never.to.throw();
            end);
            it("should throw when the type is unsatisfied, giving the status string", function() --[[ Line: 687 ]]
                -- upvalues: v2 (ref)
                local _, v42 = v2.Number():Check("Test");
                expect(function() --[[ Line: 691 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Assert("Test");
                end).to.throw(v42);
            end);
        end);
        describe("AsAssertion", function() --[[ Line: 697 ]]
            -- upvalues: v2 (ref)
            it("should return a function", function() --[[ Line: 698 ]]
                -- upvalues: v2 (ref)
                expect(v2.Number():AsAssertion()).to.be.a("function");
            end);
            it("should call Assert directly and pass a boolean & status string", function() --[[ Line: 702 ]]
                -- upvalues: v2 (ref)
                local _, v44 = v2.Number():Check(1);
                local v45 = v2.Number():AsAssertion();
                expect(function() --[[ Line: 708 ]]
                    -- upvalues: v45 (copy)
                    v45(1);
                end).never.to.throw();
                expect(function() --[[ Line: 712 ]]
                    -- upvalues: v45 (copy)
                    v45("Test");
                end).to.throw(v44);
            end);
        end);
        describe("Negate", function() --[[ Line: 718 ]]
            -- upvalues: v2 (ref)
            it("should throw an exception if there are no constraints", function() --[[ Line: 719 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 720 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():Negate();
                end).to.throw();
            end);
            it("should invert the result of the TypeChecker", function() --[[ Line: 725 ]]
                -- upvalues: v2 (ref)
                local v46 = v2.Number():Equals(5):Negate();
                expect(v46:Check(1)).to.equal(true);
                expect(v46:Check(5)).to.equal(false);
                expect(v46:Check(10)).to.equal(true);
            end);
            it("should invert only the last constraint", function() --[[ Line: 732 ]]
                -- upvalues: v2 (ref)
                local v47 = v2.Number():GreaterThan(1):Equals(10):Negate();
                expect(v47:Check(2)).to.equal(true);
                expect(v47:Check(10)).to.equal(false);
                expect(v47:Check(20)).to.equal(true);
            end);
        end);
        describe("WithContext", function() --[[ Line: 740 ]]
            -- upvalues: v2 (ref)
            it("should accept any value", function() --[[ Line: 741 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 742 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():WithContext("Test");
                end).never.to.throw();
                expect(function() --[[ Line: 746 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():WithContext(1);
                end).never.to.throw();
                expect(function() --[[ Line: 750 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():WithContext(true);
                end).never.to.throw();
                expect(function() --[[ Line: 754 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():WithContext(false);
                end).never.to.throw();
                expect(function() --[[ Line: 758 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():WithContext(nil);
                end).never.to.throw();
                expect(function() --[[ Line: 762 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():WithContext(Instance.new("Folder"));
                end).never.to.throw();
                expect(function() --[[ Line: 766 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():WithContext({
                        X = 1, 
                        Y = 2
                    });
                end).never.to.throw();
            end);
            it("should pass the context to constraints", function() --[[ Line: 771 ]]
                -- upvalues: v2 (ref)
                local v48 = false;
                local v50 = v2.Number():WithContext("Test"):Equals(function(v49) --[[ Line: 773 ]]
                    -- upvalues: v48 (ref)
                    v48 = true;
                    expect(v49).to.equal("Test");
                    return 1;
                end);
                expect(v50:Check(1)).to.equal(true);
                expect(v48).to.equal(true);
            end);
            it("should pass the root context down even if a new context is given mid-way", function() --[[ Line: 783 ]]
                -- upvalues: v2 (ref)
                local v51 = false;
                local v53 = v2.Object():WithContext("Test0"):OfStructure({
                    X = v2.Object():WithContext("Test1"):OfStructure({
                        Y = v2.Number():WithContext("Test2"):Equals(function(v52) --[[ Line: 787 ]]
                            -- upvalues: v51 (ref)
                            v51 = true;
                            expect(v52).to.equal("Test0");
                            return 1;
                        end)
                    })
                });
                expect(v53:Check({
                    X = {
                        Y = 1
                    }
                })).to.equal(true);
                expect(v51).to.equal(true);
            end);
        end);
        describe("FailMessage", function() --[[ Line: 804 ]]
            -- upvalues: v2 (ref)
            it("should reject non-string args", function() --[[ Line: 805 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 806 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():FailMessage(1);
                end).to.throw();
                expect(function() --[[ Line: 810 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():FailMessage(true);
                end).to.throw();
                expect(function() --[[ Line: 814 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():FailMessage(false);
                end).to.throw();
                expect(function() --[[ Line: 818 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():FailMessage(nil);
                end).to.throw();
                expect(function() --[[ Line: 822 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():FailMessage({});
                end).to.throw();
            end);
            it("should accept string args", function() --[[ Line: 827 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 828 ]]
                    -- upvalues: v2 (ref)
                    v2.Number():FailMessage("Test");
                end).never.to.throw();
            end);
            it("should enforce a custom fail message on failure", function() --[[ Line: 833 ]]
                -- upvalues: v2 (ref)
                local _, v55 = v2.Number():FailMessage("0123456789"):Check("Test");
                expect(v55).to.equal("0123456789");
            end);
            it("should work with Or calls", function() --[[ Line: 839 ]]
                -- upvalues: v2 (ref)
                local _, v57 = v2.Number():Or(v2.Array()):FailMessage("0123456789"):Check("Test");
                expect(v57).to.equal("0123456789");
            end);
            it("should work with And calls", function() --[[ Line: 845 ]]
                -- upvalues: v2 (ref)
                local _, v59 = v2.Number():And(v2.Array()):FailMessage("0123456789"):Check("Test");
                expect(v59).to.equal("0123456789");
            end);
            it("should work with Cached calls", function() --[[ Line: 851 ]]
                -- upvalues: v2 (ref)
                local v60 = v2.Number():Cached():FailMessage("0123456789");
                local _, v62 = v60:Check("Test");
                expect(v62).to.equal("0123456789");
                local _, v64 = v60:Check("Test");
                expect(v64).to.equal("0123456789");
            end);
            it("should still exist with subsequent constraint calls", function() --[[ Line: 861 ]]
                -- upvalues: v2 (ref)
                local _, v66 = v2.Number():FailMessage("0123456789"):RangeInclusive(0, 10):Decimal():Check(1000);
                expect(v66).to.equal("0123456789");
            end);
        end);
    end);
    describe("Number", function() --[[ Line: 869 ]]
        -- upvalues: v2 (copy)
        local v67 = v2.Number();
        describe("Init", function() --[[ Line: 872 ]]
            -- upvalues: v67 (copy)
            it("should reject non-numbers", function() --[[ Line: 873 ]]
                -- upvalues: v67 (ref)
                expect(v67:Check("Test")).to.equal(false);
                expect(v67:Check(true)).to.equal(false);
                expect(v67:Check(function() --[[ Line: 876 ]]

                end)).to.equal(false);
                expect(v67:Check(nil)).to.equal(false);
                expect(v67:Check({})).to.equal(false);
            end);
            it("should accept numbers", function() --[[ Line: 881 ]]
                -- upvalues: v67 (ref)
                expect(v67:Check(1)).to.equal(true);
                expect(v67:Check(1.1)).to.equal(true);
                expect(v67:Check(0)).to.equal(true);
                expect(v67:Check(-1)).to.equal(true);
                expect(v67:Check(-1.1)).to.equal(true);
            end);
        end);
        describe("Integer", function() --[[ Line: 890 ]]
            -- upvalues: v67 (copy)
            it("should reject non-integers", function() --[[ Line: 891 ]]
                -- upvalues: v67 (ref)
                expect(v67:Integer():Check(1.1)).to.equal(false);
            end);
            it("should accept integers", function() --[[ Line: 895 ]]
                -- upvalues: v67 (ref)
                expect(v67:Integer():Check(1)).to.equal(true);
            end);
            it("should accept negative integers", function() --[[ Line: 899 ]]
                -- upvalues: v67 (ref)
                expect(v67:Integer():Check(-1)).to.equal(true);
            end);
            it("should reject non-numbers", function() --[[ Line: 903 ]]
                -- upvalues: v67 (ref)
                expect(v67:Integer():Check("Test")).to.equal(false);
            end);
        end);
        describe("Decimal", function() --[[ Line: 908 ]]
            -- upvalues: v67 (copy)
            it("should reject non-decimals", function() --[[ Line: 909 ]]
                -- upvalues: v67 (ref)
                expect(v67:Decimal():Check(1)).to.equal(false);
            end);
            it("should accept decimals", function() --[[ Line: 913 ]]
                -- upvalues: v67 (ref)
                expect(v67:Decimal():Check(1.1)).to.equal(true);
            end);
            it("should accept negative decimals", function() --[[ Line: 917 ]]
                -- upvalues: v67 (ref)
                expect(v67:Decimal():Check(-1.1)).to.equal(true);
            end);
            it("should reject non-numbers", function() --[[ Line: 921 ]]
                -- upvalues: v67 (ref)
                expect(v67:Decimal():Check("Test")).to.equal(false);
            end);
        end);
        describe("RangeInclusive", function() --[[ Line: 926 ]]
            -- upvalues: v67 (copy)
            it("should reject non-numbers", function() --[[ Line: 927 ]]
                -- upvalues: v67 (ref)
                expect(v67:RangeInclusive(1, 2):Check("Test")).to.equal(false);
            end);
            it("should reject numbers outside of range", function() --[[ Line: 931 ]]
                -- upvalues: v67 (ref)
                local v68 = v67:RangeInclusive(1, 2);
                expect(v68:Check(0)).to.equal(false);
                expect(v68:Check(3)).to.equal(false);
                local v69 = v67:RangeInclusive(function() --[[ Line: 936 ]]
                    return 1;
                end, function() --[[ Line: 938 ]]
                    return 2;
                end);
                expect(v69:Check(0)).to.equal(false);
                expect(v69:Check(3)).to.equal(false);
            end);
            it("should accept numbers inside of range", function() --[[ Line: 945 ]]
                -- upvalues: v67 (ref)
                local v70 = v67:RangeInclusive(1, 2);
                expect(v70:Check(1)).to.equal(true);
                expect(v70:Check(2)).to.equal(true);
                local v71 = v67:RangeInclusive(function() --[[ Line: 950 ]]
                    return 1;
                end, function() --[[ Line: 952 ]]
                    return 2;
                end);
                expect(v71:Check(2)).to.equal(true);
            end);
            it("should accept numbers equal to the range bounds", function() --[[ Line: 958 ]]
                -- upvalues: v67 (ref)
                expect(v67:RangeInclusive(1, 2):Check(1)).to.equal(true);
                expect(v67:RangeInclusive(1, 2):Check(2)).to.equal(true);
                local v72 = v67:RangeInclusive(function() --[[ Line: 962 ]]
                    return 1;
                end, function() --[[ Line: 964 ]]
                    return 2;
                end);
                expect(v72:Check(1)).to.equal(true);
                expect(v72:Check(2)).to.equal(true);
            end);
        end);
        describe("RangeExclusive", function() --[[ Line: 972 ]]
            -- upvalues: v67 (copy)
            it("should reject non-numbers", function() --[[ Line: 973 ]]
                -- upvalues: v67 (ref)
                expect(v67:RangeExclusive(1, 2):Check("Test")).to.equal(false);
            end);
            it("should reject numbers outside of range", function() --[[ Line: 977 ]]
                -- upvalues: v67 (ref)
                expect(v67:RangeExclusive(1, 2):Check(0)).to.equal(false);
                expect(v67:RangeExclusive(1, 2):Check(3)).to.equal(false);
                local v73 = v67:RangeExclusive(function() --[[ Line: 981 ]]
                    return 1;
                end, function() --[[ Line: 983 ]]
                    return 2;
                end);
                expect(v73:Check(0)).to.equal(false);
                expect(v73:Check(3)).to.equal(false);
            end);
            it("should accept numbers inside of range", function() --[[ Line: 990 ]]
                -- upvalues: v67 (ref)
                expect(v67:RangeExclusive(1, 2):Check(1.1)).to.equal(true);
                expect(v67:RangeExclusive(1, 2):Check(1.9)).to.equal(true);
                local v74 = v67:RangeExclusive(function() --[[ Line: 994 ]]
                    return 1;
                end, function() --[[ Line: 996 ]]
                    return 2;
                end);
                expect(v74:Check(1.1)).to.equal(true);
                expect(v74:Check(1.9)).to.equal(true);
            end);
            it("should reject numbers equal to the range bounds", function() --[[ Line: 1003 ]]
                -- upvalues: v67 (ref)
                expect(v67:RangeExclusive(1, 2):Check(1)).to.equal(false);
                expect(v67:RangeExclusive(1, 2):Check(2)).to.equal(false);
                local v75 = v67:RangeExclusive(function() --[[ Line: 1007 ]]
                    return 1;
                end, function() --[[ Line: 1009 ]]
                    return 2;
                end);
                expect(v75:Check(1)).to.equal(false);
                expect(v75:Check(2)).to.equal(false);
            end);
        end);
        describe("Positive", function() --[[ Line: 1017 ]]
            -- upvalues: v67 (copy)
            it("should reject non-numbers", function() --[[ Line: 1018 ]]
                -- upvalues: v67 (ref)
                expect(v67:Positive():Check("Test")).to.equal(false);
            end);
            it("should reject negative numbers", function() --[[ Line: 1022 ]]
                -- upvalues: v67 (ref)
                expect(v67:Positive():Check(-1)).to.equal(false);
            end);
            it("should accept positive numbers", function() --[[ Line: 1026 ]]
                -- upvalues: v67 (ref)
                expect(v67:Positive():Check(0)).to.equal(true);
                expect(v67:Positive():Check(1)).to.equal(true);
            end);
        end);
        describe("Negative", function() --[[ Line: 1032 ]]
            -- upvalues: v67 (copy)
            it("should reject non-numbers", function() --[[ Line: 1033 ]]
                -- upvalues: v67 (ref)
                expect(v67:Negative():Check("Test")).to.equal(false);
            end);
            it("should reject positive numbers", function() --[[ Line: 1037 ]]
                -- upvalues: v67 (ref)
                expect(v67:Negative():Check(0)).to.equal(false);
                expect(v67:Negative():Check(1)).to.equal(false);
            end);
            it("should accept negative numbers", function() --[[ Line: 1042 ]]
                -- upvalues: v67 (ref)
                expect(v67:Negative():Check(-1)).to.equal(true);
            end);
        end);
        describe("Equals", function() --[[ Line: 1047 ]]
            -- upvalues: v67 (copy)
            it("should reject non equal inputs", function() --[[ Line: 1048 ]]
                -- upvalues: v67 (ref)
                expect(v67:Equals(1):Check(2)).to.equal(false);
                expect(v67:Equals(function() --[[ Line: 1050 ]]
                    return 1;
                end):Check(2)).to.equal(false);
            end);
            it("should accept equal inputs", function() --[[ Line: 1055 ]]
                -- upvalues: v67 (ref)
                expect(v67:Equals(1):Check(1)).to.equal(true);
                expect(v67:Equals(function() --[[ Line: 1057 ]]
                    return 1;
                end):Check(1)).to.equal(true);
            end);
        end);
        describe("GreaterThan", function() --[[ Line: 1063 ]]
            -- upvalues: v67 (copy)
            it("should reject numbers less than the first arg", function() --[[ Line: 1064 ]]
                -- upvalues: v67 (ref)
                expect(v67:GreaterThan(1):Check(0)).to.equal(false);
                expect(v67:GreaterThan(function() --[[ Line: 1066 ]]
                    return 1;
                end):Check(1)).to.equal(false);
            end);
            it("should accept numbers greater than the first arg", function() --[[ Line: 1071 ]]
                -- upvalues: v67 (ref)
                expect(v67:GreaterThan(1):Check(2)).to.equal(true);
                expect(v67:GreaterThan(function() --[[ Line: 1073 ]]
                    return 1;
                end):Check(2)).to.equal(true);
            end);
        end);
        describe("IsAKeyIn", function() --[[ Line: 1079 ]]
            -- upvalues: v67 (copy)
            it("should reject a non table as first arg", function() --[[ Line: 1080 ]]
                -- upvalues: v67 (ref)
                expect(function() --[[ Line: 1081 ]]
                    -- upvalues: v67 (ref)
                    v67:IsAKeyIn(1);
                end).to.throw();
                expect(function() --[[ Line: 1085 ]]
                    -- upvalues: v67 (ref)
                    v67:IsAKeyIn("Test");
                end).to.throw();
                expect(function() --[[ Line: 1089 ]]
                    -- upvalues: v67 (ref)
                    v67:IsAKeyIn(true);
                end).to.throw();
            end);
            it("should accept a table or function as first arg", function() --[[ Line: 1094 ]]
                -- upvalues: v67 (ref)
                expect(function() --[[ Line: 1095 ]]
                    -- upvalues: v67 (ref)
                    v67:IsAKeyIn({});
                end).never.to.throw();
                expect(function() --[[ Line: 1099 ]]
                    -- upvalues: v67 (ref)
                    v67:IsAKeyIn(function() --[[ Line: 1100 ]]

                    end);
                end).never.to.throw();
            end);
            it("should reject when the value does not exist as a key", function() --[[ Line: 1104 ]]
                -- upvalues: v67 (ref)
                expect(v67:IsAKeyIn({}):Check(123)).to.equal(false);
                expect(v67:IsAKeyIn(function() --[[ Line: 1106 ]]
                    return {};
                end):Check(123)).to.equal(false);
            end);
            it("should accept when the value does exist as a key", function() --[[ Line: 1111 ]]
                -- upvalues: v67 (ref)
                expect(v67:IsAKeyIn({
                    [123] = true
                }):Check(123)).to.equal(true);
                expect(v67:IsAKeyIn(function() --[[ Line: 1113 ]]
                    return {
                        [123] = true
                    };
                end):Check(123)).to.equal(true);
            end);
        end);
        describe("IsAValueIn", function() --[[ Line: 1119 ]]
            -- upvalues: v67 (copy)
            it("should reject a non table as first arg", function() --[[ Line: 1120 ]]
                -- upvalues: v67 (ref)
                expect(function() --[[ Line: 1121 ]]
                    -- upvalues: v67 (ref)
                    v67:IsAValueIn(1);
                end).to.throw();
                expect(function() --[[ Line: 1125 ]]
                    -- upvalues: v67 (ref)
                    v67:IsAValueIn("Test");
                end).to.throw();
                expect(function() --[[ Line: 1129 ]]
                    -- upvalues: v67 (ref)
                    v67:IsAValueIn(true);
                end).to.throw();
            end);
            it("should accept a table or function as first arg", function() --[[ Line: 1134 ]]
                -- upvalues: v67 (ref)
                expect(function() --[[ Line: 1135 ]]
                    -- upvalues: v67 (ref)
                    v67:IsAValueIn({});
                end).never.to.throw();
                expect(function() --[[ Line: 1139 ]]
                    -- upvalues: v67 (ref)
                    v67:IsAValueIn(function() --[[ Line: 1140 ]]

                    end);
                end).never.to.throw();
            end);
            it("should reject when the value does not exist in an array", function() --[[ Line: 1144 ]]
                -- upvalues: v67 (ref)
                expect(v67:IsAValueIn({}):Check(123)).to.equal(false);
                expect(v67:IsAValueIn(function() --[[ Line: 1146 ]]
                    return {};
                end):Check(123)).to.equal(false);
            end);
            it("should accept when the value exists in an array", function() --[[ Line: 1151 ]]
                -- upvalues: v67 (ref)
                expect(v67:IsAValueIn({
                    123
                }):Check(123)).to.equal(true);
                expect(v67:IsAValueIn(function() --[[ Line: 1153 ]]
                    return {
                        123
                    };
                end):Check(123)).to.equal(true);
            end);
        end);
        describe("IsNaN", function() --[[ Line: 1159 ]]
            -- upvalues: v67 (copy)
            it("should reject normal numbers", function() --[[ Line: 1160 ]]
                -- upvalues: v67 (ref)
                expect(v67:IsNaN():Check(1)).to.equal(false);
            end);
            it("should accept NaN", function() --[[ Line: 1164 ]]
                -- upvalues: v67 (ref)
                expect(v67:IsNaN():Check((0/0))).to.equal(true);
            end);
        end);
        describe("IsInfinite", function() --[[ Line: 1169 ]]
            -- upvalues: v67 (copy)
            it("should reject finite numbers", function() --[[ Line: 1170 ]]
                -- upvalues: v67 (ref)
                expect(v67:IsInfinite():Check(1)).to.equal(false);
            end);
            it("should accept infinite numbers", function() --[[ Line: 1174 ]]
                -- upvalues: v67 (ref)
                expect(v67:IsInfinite():Check(1e999)).to.equal(true);
                expect(v67:IsInfinite():Check(-1e999)).to.equal(true);
            end);
        end);
        describe("IsClose", function() --[[ Line: 1180 ]]
            -- upvalues: v67 (copy)
            it("should reject non-numbers", function() --[[ Line: 1181 ]]
                -- upvalues: v67 (ref)
                expect(v67:IsClose(1):Check("Test")).to.equal(false);
            end);
            it("should reject numbers that are not close", function() --[[ Line: 1185 ]]
                -- upvalues: v67 (ref)
                expect(v67:IsClose(1):Check(2)).to.equal(false);
                expect(v67:IsClose(function() --[[ Line: 1187 ]]
                    return 1;
                end):Check(2)).to.equal(false);
            end);
            it("should accept numbers in the default tolerance (0.00001)", function() --[[ Line: 1192 ]]
                -- upvalues: v67 (ref)
                expect(v67:IsClose(1):Check(1.000001)).to.equal(true);
                expect(v67:IsClose(function() --[[ Line: 1194 ]]
                    return 1;
                end):Check(1.000001)).to.equal(true);
            end);
            it("should accept a custom tolerance", function() --[[ Line: 1199 ]]
                -- upvalues: v67 (ref)
                expect(v67:IsClose(1, 0.5):Check(1.4)).to.equal(true);
                expect(v67:IsClose(function() --[[ Line: 1201 ]]
                    return 1;
                end, 0.5):Check(1.4)).to.equal(true);
            end);
        end);
    end);
    describe("Boolean", function() --[[ Line: 1208 ]]
        -- upvalues: v2 (copy)
        local v76 = v2.Boolean();
        describe("Init", function() --[[ Line: 1211 ]]
            -- upvalues: v76 (copy)
            it("should reject non-booleans", function() --[[ Line: 1212 ]]
                -- upvalues: v76 (ref)
                expect(v76:Check("Test")).to.equal(false);
                expect(v76:Check(1)).to.equal(false);
                expect(v76:Check(function() --[[ Line: 1215 ]]

                end)).to.equal(false);
                expect(v76:Check(nil)).to.equal(false);
                expect(v76:Check({})).to.equal(false);
            end);
            it("should accept booleans", function() --[[ Line: 1220 ]]
                -- upvalues: v76 (ref)
                expect(v76:Check(true)).to.equal(true);
                expect(v76:Check(false)).to.equal(true);
            end);
        end);
    end);
    describe("Instance", function() --[[ Line: 1227 ]]
        -- upvalues: v2 (copy), l_CollectionService_0 (ref)
        local v77 = v2.Instance();
        describe("Init", function() --[[ Line: 1230 ]]
            -- upvalues: v77 (copy), v2 (ref)
            it("should reject non-Instances", function() --[[ Line: 1231 ]]
                -- upvalues: v77 (ref)
                expect(v77:Check("Test")).to.equal(false);
                expect(v77:Check(1)).to.equal(false);
                expect(v77:Check(function() --[[ Line: 1234 ]]

                end)).to.equal(false);
                expect(v77:Check(nil)).to.equal(false);
                expect(v77:Check({})).to.equal(false);
            end);
            it("should accept Instances", function() --[[ Line: 1239 ]]
                -- upvalues: v77 (ref)
                expect(v77:Check(Instance.new("Model"))).to.equal(true);
            end);
            it("should use the IsA constraint as the initial constraint", function() --[[ Line: 1243 ]]
                -- upvalues: v2 (ref)
                local v78 = v2.Instance("Model");
                expect(v78:Check(Instance.new("Model"))).to.equal(true);
                expect(v78:Check(Instance.new("Part"))).to.equal(false);
            end);
            it("should use the IsA constraint + the OfStructure constraint if two values are passed", function() --[[ Line: 1250 ]]
                -- upvalues: v2 (ref)
                local v79 = v2.Instance("Model", {
                    Name = v2.String():Equals("TestName")
                });
                expect(v79:Check(Instance.new("Model"))).to.equal(false);
                local l_Model_0 = Instance.new("Model");
                l_Model_0.Name = "TestName";
                expect(v79:Check(l_Model_0)).to.equal(true);
            end);
        end);
        describe("IsA", function() --[[ Line: 1264 ]]
            -- upvalues: v77 (copy)
            it("should reject non-Instances", function() --[[ Line: 1265 ]]
                -- upvalues: v77 (ref)
                expect(v77:IsA("Folder"):Check("Folder")).to.equal(false);
                expect(v77:IsA("Folder"):Check(1)).to.equal(false);
                expect(v77:IsA("Folder"):Check(function() --[[ Line: 1268 ]]

                end)).to.equal(false);
                expect(v77:IsA("Folder"):Check(nil)).to.equal(false);
                expect(v77:IsA("Folder"):Check({})).to.equal(false);
            end);
            it("should accept Instances of the specified type string (or function returning type string)", function() --[[ Line: 1273 ]]
                -- upvalues: v77 (ref)
                expect(v77:IsA("Folder"):Check(Instance.new("Folder"))).to.equal(true);
                expect(v77:IsA(function() --[[ Line: 1275 ]]
                    return "Folder";
                end):Check(Instance.new("Folder"))).to.equal(true);
            end);
            it("should reject Instances of other classes", function() --[[ Line: 1280 ]]
                -- upvalues: v77 (ref)
                expect(v77:IsA("Folder"):Check(Instance.new("Part"))).to.equal(false);
                expect(v77:IsA(function() --[[ Line: 1282 ]]
                    return "Folder";
                end):Check(Instance.new("Part"))).to.equal(false);
            end);
        end);
        describe("OfStructure", function() --[[ Line: 1288 ]]
            -- upvalues: v77 (copy), v2 (ref)
            it("should reject non-Instances", function() --[[ Line: 1289 ]]
                -- upvalues: v77 (ref)
                expect(function() --[[ Line: 1290 ]]
                    -- upvalues: v77 (ref)
                    v77:OfStructure({
                        Test = "Test"
                    });
                end).to.throw();
                expect(function() --[[ Line: 1294 ]]
                    -- upvalues: v77 (ref)
                    v77:OfStructure({
                        Test = 1
                    });
                end).to.throw();
                expect(function() --[[ Line: 1298 ]]
                    -- upvalues: v77 (ref)
                    v77:OfStructure({
                        Test = function() --[[ Line: 1299 ]] --[[ Name: Test ]]

                        end
                    });
                end).to.throw();
            end);
            it("should accept a map of children and/or properties", function() --[[ Line: 1303 ]]
                -- upvalues: v77 (ref), v2 (ref)
                expect(function() --[[ Line: 1304 ]]
                    -- upvalues: v77 (ref), v2 (ref)
                    v77:OfStructure({
                        Test = v2.Instance("Folder"), 
                        Name = v2.String()
                    });
                end).to.never.throw();
            end);
            it("should reject Instances that do not match the structure", function() --[[ Line: 1312 ]]
                -- upvalues: v77 (ref), v2 (ref)
                expect(v77:OfStructure({
                    Test = v2.Instance("Folder"), 
                    Name = v2.String()
                }):Check(Instance.new("Folder"))).to.equal(false);
            end);
            it("should accept Instances that match the structure", function() --[[ Line: 1321 ]]
                -- upvalues: v77 (ref), v2 (ref)
                local l_Folder_4 = Instance.new("Folder");
                local l_Folder_5 = Instance.new("Folder");
                l_Folder_5.Name = "Test";
                l_Folder_5.Parent = l_Folder_4;
                expect(v77:OfStructure({
                    Test = v2.Instance("Folder"), 
                    Name = v2.String()
                }):Check(l_Folder_4)).to.equal(true);
            end);
            it("should reject Instances that do not match the structure recursively", function() --[[ Line: 1335 ]]
                -- upvalues: v77 (ref), v2 (ref)
                local l_Folder_6 = Instance.new("Folder");
                local l_Folder_7 = Instance.new("Folder");
                l_Folder_7.Name = "Test";
                l_Folder_7.Parent = l_Folder_6;
                local l_Part_0 = Instance.new("Part");
                l_Part_0.Name = "Test2";
                l_Part_0.Parent = l_Folder_7;
                expect(v77:OfStructure({
                    Test = v2.Instance("Folder"):OfStructure({
                        Test2 = v2.Instance():OfStructure({
                            Name = v2.String():Equals("Incorrect Name")
                        }), 
                        Name = v2.String():Equals("Test")
                    }), 
                    Name = v2.String():Equals("Folder")
                }):Check(l_Folder_7)).to.equal(false);
            end);
            it("should accept Instances that match the structure recursively", function() --[[ Line: 1357 ]]
                -- upvalues: v77 (ref), v2 (ref)
                local l_Folder_8 = Instance.new("Folder");
                local l_Folder_9 = Instance.new("Folder");
                l_Folder_9.Name = "Test";
                l_Folder_9.Parent = l_Folder_8;
                local l_Part_1 = Instance.new("Part");
                l_Part_1.Name = "Test2";
                l_Part_1.Parent = l_Folder_9;
                expect(v77:OfStructure({
                    Test = v2.Instance("Folder"):OfStructure({
                        Test2 = v2.Instance():OfStructure({
                            Name = v2.String():Equals("Test2")
                        }), 
                        Name = v2.String():Equals("Test")
                    }), 
                    Name = v2.String():Equals("Folder")
                }):Check(l_Folder_9)).to.equal(false);
            end);
        end);
        describe("OfStructureStrict (Strict + OfStructure)", function() --[[ Line: 1380 ]]
            -- upvalues: v77 (copy), v2 (ref)
            it("should reject extra flat children", function() --[[ Line: 1381 ]]
                -- upvalues: v77 (ref), v2 (ref)
                local l_Folder_10 = Instance.new("Folder");
                local l_Folder_11 = Instance.new("Folder");
                l_Folder_11.Name = "Test";
                l_Folder_11.Parent = l_Folder_10;
                local l_Folder_12 = Instance.new("Folder");
                l_Folder_12.Name = "Test2";
                l_Folder_12.Parent = l_Folder_10;
                expect(v77:OfStructureStrict({
                    Test = v2.Instance("Folder")
                }):Check(l_Folder_10)).to.equal(false);
                expect(v77:OfStructureStrict({
                    Test = v2.Instance("Folder"), 
                    Test2 = v2.Instance("Folder")
                }):Check(l_Folder_10)).to.equal(true);
            end);
            it("should reject extra children recursively", function() --[[ Line: 1404 ]]
                -- upvalues: v77 (ref), v2 (ref)
                local l_Folder_13 = Instance.new("Folder");
                local l_Folder_14 = Instance.new("Folder");
                l_Folder_14.Name = "Test";
                l_Folder_14.Parent = l_Folder_13;
                local l_Folder_15 = Instance.new("Folder");
                l_Folder_15.Name = "Test2";
                l_Folder_15.Parent = l_Folder_14;
                local l_Folder_16 = Instance.new("Folder");
                l_Folder_16.Name = "Test22";
                l_Folder_16.Parent = l_Folder_14;
                expect(v77:OfStructureStrict({
                    Test = v2.Instance("Folder"):OfStructureStrict({
                        Test2 = v2.Instance("Folder")
                    })
                }):Check(l_Folder_13)).to.equal(false);
                expect(v77:OfStructureStrict({
                    Test = v2.Instance("Folder"):OfStructureStrict({
                        Test2 = v2.Instance("Folder"), 
                        Test22 = v2.Instance("Folder")
                    })
                }):Check(l_Folder_13)).to.equal(true);
            end);
        end);
        describe("HasTag", function() --[[ Line: 1436 ]]
            -- upvalues: v77 (copy), l_CollectionService_0 (ref), v2 (ref)
            it("should reject non-Instances", function() --[[ Line: 1437 ]]
                -- upvalues: v77 (ref)
                expect(v77:HasTag("Test"):Check("Test")).to.equal(false);
                expect(v77:HasTag("Test"):Check(1)).to.equal(false);
                expect(v77:HasTag("Test"):Check(function() --[[ Line: 1440 ]]

                end)).to.equal(false);
                expect(v77:HasTag("Test"):Check(nil)).to.equal(false);
                expect(v77:HasTag("Test"):Check({})).to.equal(false);
            end);
            it("should accept Instances with the specified tag", function() --[[ Line: 1445 ]]
                -- upvalues: l_CollectionService_0 (ref), v2 (ref)
                local l_Folder_17 = Instance.new("Folder");
                l_CollectionService_0:AddTag(l_Folder_17, "TestTag");
                expect(v2.Instance():HasTag("TestTag"):Check(l_Folder_17)).to.equal(true);
                expect(v2.Instance():HasTag(function() --[[ Line: 1449 ]]
                    return "TestTag";
                end):Check(l_Folder_17)).to.equal(true);
            end);
            it("should reject Instances without the specified tag", function() --[[ Line: 1454 ]]
                -- upvalues: v2 (ref)
                local l_Folder_18 = Instance.new("Folder");
                expect(v2.Instance():HasTag("TestTag"):Check(l_Folder_18)).to.equal(false);
                expect(v2.Instance():HasTag(function() --[[ Line: 1457 ]]
                    return "TestTag";
                end):Check(l_Folder_18)).to.equal(false);
            end);
        end);
        describe("IsAncestorOf", function() --[[ Line: 1463 ]]
            -- upvalues: v77 (copy), v2 (ref)
            it("should reject non-Instances", function() --[[ Line: 1464 ]]
                -- upvalues: v77 (ref)
                expect(v77:IsAncestorOf(Instance.new("Folder")):Check("Test")).to.equal(false);
                expect(v77:IsAncestorOf(Instance.new("Folder")):Check(1)).to.equal(false);
                expect(v77:IsAncestorOf(Instance.new("Folder")):Check(function() --[[ Line: 1467 ]]

                end)).to.equal(false);
                expect(v77:IsAncestorOf(Instance.new("Folder")):Check(nil)).to.equal(false);
                expect(v77:IsAncestorOf(Instance.new("Folder")):Check({})).to.equal(false);
            end);
            it("should accept Instances that are ancestors of the specified Instance", function() --[[ Line: 1472 ]]
                -- upvalues: v2 (ref)
                local l_Folder_19 = Instance.new("Folder");
                local l_Folder_20 = Instance.new("Folder");
                l_Folder_20.Parent = l_Folder_19;
                local l_Folder_21 = Instance.new("Folder");
                l_Folder_21.Parent = l_Folder_20;
                expect(v2.Instance():IsAncestorOf(l_Folder_20):Check(l_Folder_19)).to.equal(true);
                expect(v2.Instance():IsAncestorOf(l_Folder_21):Check(l_Folder_19)).to.equal(true);
                expect(v2.Instance():IsAncestorOf(function() --[[ Line: 1482 ]]
                    -- upvalues: l_Folder_20 (copy)
                    return l_Folder_20;
                end):Check(l_Folder_19)).to.equal(true);
                expect(v2.Instance():IsAncestorOf(function() --[[ Line: 1485 ]]
                    -- upvalues: l_Folder_21 (copy)
                    return l_Folder_21;
                end):Check(l_Folder_19)).to.equal(true);
            end);
        end);
        describe("IsDescendantOf", function() --[[ Line: 1491 ]]
            -- upvalues: v77 (copy), v2 (ref)
            it("should reject non-Instances", function() --[[ Line: 1492 ]]
                -- upvalues: v77 (ref)
                expect(v77:IsDescendantOf(Instance.new("Folder")):Check("Test")).to.equal(false);
                expect(v77:IsDescendantOf(Instance.new("Folder")):Check(1)).to.equal(false);
                expect(v77:IsDescendantOf(Instance.new("Folder")):Check(function() --[[ Line: 1495 ]]

                end)).to.equal(false);
                expect(v77:IsDescendantOf(Instance.new("Folder")):Check(nil)).to.equal(false);
                expect(v77:IsDescendantOf(Instance.new("Folder")):Check({})).to.equal(false);
            end);
            it("should accept Instances that are descendants of the specified Instance", function() --[[ Line: 1500 ]]
                -- upvalues: v2 (ref)
                local l_Folder_22 = Instance.new("Folder");
                local l_Folder_23 = Instance.new("Folder");
                l_Folder_23.Parent = l_Folder_22;
                local l_Folder_24 = Instance.new("Folder");
                l_Folder_24.Parent = l_Folder_23;
                expect(v2.Instance():IsDescendantOf(l_Folder_22):Check(l_Folder_23)).to.equal(true);
                expect(v2.Instance():IsDescendantOf(l_Folder_22):Check(l_Folder_24)).to.equal(true);
                expect(v2.Instance():IsDescendantOf(function() --[[ Line: 1510 ]]
                    -- upvalues: l_Folder_22 (copy)
                    return l_Folder_22;
                end):Check(l_Folder_23)).to.equal(true);
                expect(v2.Instance():IsDescendantOf(function() --[[ Line: 1513 ]]
                    -- upvalues: l_Folder_22 (copy)
                    return l_Folder_22;
                end):Check(l_Folder_24)).to.equal(true);
            end);
        end);
        describe("HasAttribute", function() --[[ Line: 1519 ]]
            -- upvalues: v77 (copy), v2 (ref)
            it("should reject non-strings and non-functions as 1st param", function() --[[ Line: 1520 ]]
                -- upvalues: v77 (ref)
                expect(function() --[[ Line: 1521 ]]
                    -- upvalues: v77 (ref)
                    v77:HasAttribute(1);
                end).to.throw();
                expect(function() --[[ Line: 1525 ]]
                    -- upvalues: v77 (ref)
                    v77:HasAttribute(true);
                end).to.throw();
                expect(function() --[[ Line: 1529 ]]
                    -- upvalues: v77 (ref)
                    v77:HasAttribute(nil);
                end).to.throw();
            end);
            it("should accept a string a 1st param", function() --[[ Line: 1534 ]]
                -- upvalues: v77 (ref)
                expect(function() --[[ Line: 1535 ]]
                    -- upvalues: v77 (ref)
                    v77:HasAttribute("Test");
                end).never.to.throw();
            end);
            it("should reject non-Instances on check", function() --[[ Line: 1540 ]]
                -- upvalues: v77 (ref)
                expect(v77:HasAttribute("Test"):Check("Test")).to.equal(false);
                expect(v77:HasAttribute("Test"):Check(1)).to.equal(false);
                expect(v77:HasAttribute("Test"):Check(function() --[[ Line: 1543 ]]

                end)).to.equal(false);
                expect(v77:HasAttribute("Test"):Check(nil)).to.equal(false);
                expect(v77:HasAttribute("Test"):Check({})).to.equal(false);
            end);
            it("should accept Instances with the specified attribute", function() --[[ Line: 1548 ]]
                -- upvalues: v2 (ref)
                local l_Folder_25 = Instance.new("Folder");
                l_Folder_25:SetAttribute("TestAttribute", true);
                expect(v2.Instance():HasAttribute("TestAttribute"):Check(l_Folder_25)).to.equal(true);
                expect(v2.Instance():HasAttribute(function() --[[ Line: 1552 ]]
                    return "TestAttribute";
                end):Check(l_Folder_25)).to.equal(true);
            end);
            it("should reject Instances without the specified attribute", function() --[[ Line: 1557 ]]
                -- upvalues: v2 (ref)
                local l_Folder_26 = Instance.new("Folder");
                expect(v2.Instance():HasAttribute("TestAttribute"):Check(l_Folder_26)).to.equal(false);
                expect(v2.Instance():HasAttribute(function() --[[ Line: 1560 ]]
                    return "TestAttribute";
                end):Check(l_Folder_26)).to.equal(false);
            end);
        end);
        describe("CheckAttribute", function() --[[ Line: 1566 ]]
            -- upvalues: v77 (copy), v2 (ref)
            it("should reject non-strings and non-functions as 1st param", function() --[[ Line: 1567 ]]
                -- upvalues: v77 (ref)
                expect(function() --[[ Line: 1568 ]]
                    -- upvalues: v77 (ref)
                    v77:CheckAttribute(1);
                end).to.throw();
                expect(function() --[[ Line: 1572 ]]
                    -- upvalues: v77 (ref)
                    v77:CheckAttribute(true);
                end).to.throw();
                expect(function() --[[ Line: 1576 ]]
                    -- upvalues: v77 (ref)
                    v77:CheckAttribute(nil);
                end).to.throw();
            end);
            it("should reject non-TypeCheckers as 2nd param", function() --[[ Line: 1581 ]]
                -- upvalues: v77 (ref)
                expect(function() --[[ Line: 1582 ]]
                    -- upvalues: v77 (ref)
                    v77:CheckAttribute("Test", 1);
                end).to.throw();
                expect(function() --[[ Line: 1586 ]]
                    -- upvalues: v77 (ref)
                    v77:CheckAttribute("Test", true);
                end).to.throw();
                expect(function() --[[ Line: 1590 ]]
                    -- upvalues: v77 (ref)
                    v77:CheckAttribute("Test", function() --[[ Line: 1591 ]]

                    end);
                end).to.throw();
                expect(function() --[[ Line: 1594 ]]
                    -- upvalues: v77 (ref)
                    v77:CheckAttribute("Test", nil);
                end).to.throw();
            end);
            it("should accept a string & TypeChecker as params", function() --[[ Line: 1599 ]]
                -- upvalues: v77 (ref), v2 (ref)
                expect(function() --[[ Line: 1600 ]]
                    -- upvalues: v77 (ref), v2 (ref)
                    v77:CheckAttribute("Test", v2.Number());
                end).never.to.throw();
            end);
            it("should reject non-Instances on check", function() --[[ Line: 1605 ]]
                -- upvalues: v77 (ref), v2 (ref)
                expect(v77:CheckAttribute("Test", v2.String()):Check("Test")).to.equal(false);
                expect(v77:CheckAttribute("Test", v2.String()):Check(1)).to.equal(false);
                expect(v77:CheckAttribute("Test", v2.String()):Check(function() --[[ Line: 1608 ]]

                end)).to.equal(false);
                expect(v77:CheckAttribute("Test", v2.String()):Check(nil)).to.equal(false);
                expect(v77:CheckAttribute("Test", v2.String()):Check({})).to.equal(false);
            end);
            it("should accept Instances with the specified attribute", function() --[[ Line: 1613 ]]
                -- upvalues: v2 (ref)
                local l_Folder_27 = Instance.new("Folder");
                l_Folder_27:SetAttribute("TestAttribute", 123);
                expect(v2.Instance():CheckAttribute("TestAttribute", v2.Number()):Check(l_Folder_27)).to.equal(true);
                expect(v2.Instance():CheckAttribute(function() --[[ Line: 1617 ]]
                    return "TestAttribute";
                end, v2.Number()):Check(l_Folder_27)).to.equal(true);
            end);
            it("should reject Instances without the specified attribute", function() --[[ Line: 1622 ]]
                -- upvalues: v2 (ref)
                local l_Folder_28 = Instance.new("Folder");
                expect(v2.Instance():CheckAttribute("TestAttribute", v2.Number()):Check(l_Folder_28)).to.equal(false);
                expect(v2.Instance():CheckAttribute(function() --[[ Line: 1625 ]]
                    return "TestAttribute";
                end, v2.Number()):Check(l_Folder_28)).to.equal(false);
            end);
        end);
        describe("HasTags", function() --[[ Line: 1631 ]]
            -- upvalues: v77 (copy), l_CollectionService_0 (ref), v2 (ref)
            it("should reject non-string arrays as first arg", function() --[[ Line: 1632 ]]
                -- upvalues: v77 (ref)
                expect(function() --[[ Line: 1633 ]]
                    -- upvalues: v77 (ref)
                    v77:HasTags(1);
                end).to.throw();
                expect(function() --[[ Line: 1637 ]]
                    -- upvalues: v77 (ref)
                    v77:HasTags(true);
                end).to.throw();
                expect(function() --[[ Line: 1641 ]]
                    -- upvalues: v77 (ref)
                    v77:HasTags(nil);
                end).to.throw();
            end);
            it("should accept a string array as first arg", function() --[[ Line: 1646 ]]
                -- upvalues: v77 (ref)
                expect(function() --[[ Line: 1647 ]]
                    -- upvalues: v77 (ref)
                    v77:HasTags({
                        "Test"
                    });
                end).never.to.throw();
                expect(function() --[[ Line: 1651 ]]
                    -- upvalues: v77 (ref)
                    v77:HasTags({
                        "Test", 
                        "Test2"
                    });
                end).never.to.throw();
            end);
            it("should accept if all the tags are present", function() --[[ Line: 1656 ]]
                -- upvalues: l_CollectionService_0 (ref), v2 (ref)
                local l_Folder_29 = Instance.new("Folder");
                l_CollectionService_0:AddTag(l_Folder_29, "Test");
                l_CollectionService_0:AddTag(l_Folder_29, "Test2");
                expect(v2.Instance():HasTags({
                    "Test", 
                    "Test2"
                }):Check(l_Folder_29)).to.equal(true);
                expect(v2.Instance():HasTags(function() --[[ Line: 1661 ]]
                    return {
                        "Test", 
                        "Test2"
                    };
                end):Check(l_Folder_29)).to.equal(true);
            end);
            it("should reject if not all the tags are present", function() --[[ Line: 1666 ]]
                -- upvalues: l_CollectionService_0 (ref), v2 (ref)
                local l_Folder_30 = Instance.new("Folder");
                l_CollectionService_0:AddTag(l_Folder_30, "Test");
                expect(v2.Instance():HasTags({
                    "Test", 
                    "Test2"
                }):Check(l_Folder_30)).to.equal(false);
                expect(v2.Instance():HasTags(function() --[[ Line: 1670 ]]
                    return {
                        "Test", 
                        "Test2"
                    };
                end):Check(l_Folder_30)).to.equal(false);
            end);
            it("should reject if none of the tags are present", function() --[[ Line: 1675 ]]
                -- upvalues: v2 (ref)
                local l_Folder_31 = Instance.new("Folder");
                expect(v2.Instance():HasTags({
                    "Test", 
                    "Test2"
                }):Check(l_Folder_31)).to.equal(false);
                expect(v2.Instance():HasTags(function() --[[ Line: 1678 ]]
                    return {
                        "Test", 
                        "Test2"
                    };
                end):Check(l_Folder_31)).to.equal(false);
            end);
        end);
        describe("HasAttributes", function() --[[ Line: 1684 ]]
            -- upvalues: v77 (copy), v2 (ref)
            it("should reject non-string arrays as first arg", function() --[[ Line: 1685 ]]
                -- upvalues: v77 (ref)
                expect(function() --[[ Line: 1686 ]]
                    -- upvalues: v77 (ref)
                    v77:HasAttributes(1);
                end).to.throw();
                expect(function() --[[ Line: 1690 ]]
                    -- upvalues: v77 (ref)
                    v77:HasAttributes(true);
                end).to.throw();
                expect(function() --[[ Line: 1694 ]]
                    -- upvalues: v77 (ref)
                    v77:HasAttributes(nil);
                end).to.throw();
            end);
            it("should accept a string array as first arg", function() --[[ Line: 1699 ]]
                -- upvalues: v77 (ref)
                expect(function() --[[ Line: 1700 ]]
                    -- upvalues: v77 (ref)
                    v77:HasAttributes({
                        "Test"
                    });
                end).never.to.throw();
                expect(function() --[[ Line: 1704 ]]
                    -- upvalues: v77 (ref)
                    v77:HasAttributes({
                        "Test", 
                        "Test2"
                    });
                end).never.to.throw();
            end);
            it("should accept if all the attributes are present", function() --[[ Line: 1709 ]]
                -- upvalues: v2 (ref)
                local l_Folder_32 = Instance.new("Folder");
                l_Folder_32:SetAttribute("Test", true);
                l_Folder_32:SetAttribute("Test2", false);
                expect(v2.Instance():HasAttributes({
                    "Test", 
                    "Test2"
                }):Check(l_Folder_32)).to.equal(true);
                expect(v2.Instance():HasAttributes(function() --[[ Line: 1714 ]]
                    return {
                        "Test", 
                        "Test2"
                    };
                end):Check(l_Folder_32)).to.equal(true);
            end);
            it("should reject if not all the attributes are present", function() --[[ Line: 1719 ]]
                -- upvalues: v2 (ref)
                local l_Folder_33 = Instance.new("Folder");
                l_Folder_33:SetAttribute("Test", 123);
                expect(v2.Instance():HasAttributes({
                    "Test", 
                    "Test2"
                }):Check(l_Folder_33)).to.equal(false);
                expect(v2.Instance():HasAttributes(function() --[[ Line: 1723 ]]
                    return {
                        "Test", 
                        "Test2"
                    };
                end):Check(l_Folder_33)).to.equal(false);
            end);
            it("should reject if none of the attributes are present", function() --[[ Line: 1728 ]]
                -- upvalues: v2 (ref)
                local l_Folder_34 = Instance.new("Folder");
                expect(v2.Instance():HasAttributes({
                    "Test", 
                    "Test2"
                }):Check(l_Folder_34)).to.equal(false);
                expect(v2.Instance():HasAttributes(function() --[[ Line: 1731 ]]
                    return {
                        "Test", 
                        "Test2"
                    };
                end):Check(l_Folder_34)).to.equal(false);
            end);
        end);
        describe("CheckAttributes", function() --[[ Line: 1737 ]]
            -- upvalues: v77 (copy), v2 (ref)
            it("should reject non-tables as first arg", function() --[[ Line: 1738 ]]
                -- upvalues: v77 (ref)
                expect(function() --[[ Line: 1739 ]]
                    -- upvalues: v77 (ref)
                    v77:CheckAttributes(1);
                end).to.throw();
                expect(function() --[[ Line: 1743 ]]
                    -- upvalues: v77 (ref)
                    v77:CheckAttributes(true);
                end).to.throw();
                expect(function() --[[ Line: 1747 ]]
                    -- upvalues: v77 (ref)
                    v77:CheckAttributes(nil);
                end).to.throw();
            end);
            it("should reject tables with non-TypeCheckers as values or non-strings as keys", function() --[[ Line: 1752 ]]
                -- upvalues: v77 (ref), v2 (ref)
                expect(function() --[[ Line: 1753 ]]
                    -- upvalues: v77 (ref), v2 (ref)
                    v77:CheckAttributes({
                        v2.String()
                    });
                end).to.throw();
                expect(function() --[[ Line: 1757 ]]
                    -- upvalues: v77 (ref)
                    v77:CheckAttributes({
                        Test = "P"
                    });
                end).to.throw();
            end);
            it("should accept tables with TypeCheckers as values and strings as keys", function() --[[ Line: 1762 ]]
                -- upvalues: v77 (ref), v2 (ref)
                expect(function() --[[ Line: 1763 ]]
                    -- upvalues: v77 (ref), v2 (ref)
                    v77:CheckAttributes({
                        Test = v2.String()
                    });
                end).never.to.throw();
                expect(function() --[[ Line: 1767 ]]
                    -- upvalues: v77 (ref), v2 (ref)
                    v77:CheckAttributes({
                        P = v2.String(), 
                        Q = v2.Number()
                    });
                end).never.to.throw();
            end);
            it("should correctly check attribute types", function() --[[ Line: 1775 ]]
                -- upvalues: v77 (ref), v2 (ref)
                local l_Folder_35 = Instance.new("Folder");
                l_Folder_35:SetAttribute("Test", "Test");
                l_Folder_35:SetAttribute("Test2", 123);
                expect(v77:CheckAttributes({
                    Test = v2.String(), 
                    Test2 = v2.Number()
                }):Check(l_Folder_35)).to.equal(true);
                l_Folder_35:SetAttribute("Test2", "TestString");
                expect(v77:CheckAttributes({
                    Test = v2.String(), 
                    Test2 = v2.Number()
                }):Check(l_Folder_35)).to.equal(false);
                l_Folder_35:SetAttribute("Test2", nil);
                expect(v77:CheckAttributes({
                    Test = v2.String(), 
                    Test2 = v2.Number()
                }):Check(l_Folder_35)).to.equal(false);
            end);
        end);
    end);
    describe("String", function() --[[ Line: 1802 ]]
        -- upvalues: v2 (copy)
        local v115 = v2.String();
        describe("Init", function() --[[ Line: 1805 ]]
            -- upvalues: v115 (copy)
            it("should accept a string", function() --[[ Line: 1806 ]]
                -- upvalues: v115 (ref)
                expect(v115:Check("Test")).to.equal(true);
            end);
            it("should reject non-strings", function() --[[ Line: 1810 ]]
                -- upvalues: v115 (ref)
                expect(v115:Check(1)).to.equal(false);
                expect(v115:Check(function() --[[ Line: 1812 ]]

                end)).to.equal(false);
                expect(v115:Check(nil)).to.equal(false);
                expect(v115:Check({})).to.equal(false);
            end);
        end);
        describe("InitialConstraint", function() --[[ Line: 1818 ]]
            -- upvalues: v2 (ref)
            it("should check for str1 or str2 or etc.", function() --[[ Line: 1819 ]]
                -- upvalues: v2 (ref)
                local v116 = v2.String("X", "Y");
                expect(v116:Check("X")).to.equal(true);
                expect(v116:Check("Y")).to.equal(true);
                expect(v116:Check("Z")).to.equal(false);
            end);
        end);
        describe("MinLength", function() --[[ Line: 1827 ]]
            -- upvalues: v115 (copy)
            it("should reject strings shorter than the specified length", function() --[[ Line: 1828 ]]
                -- upvalues: v115 (ref)
                expect(v115:MinLength(5):Check("Test")).to.equal(false);
                expect(v115:MinLength(function() --[[ Line: 1830 ]]
                    return 5;
                end):Check("Test")).to.equal(false);
            end);
            it("should accept strings longer than the specified length", function() --[[ Line: 1835 ]]
                -- upvalues: v115 (ref)
                expect(v115:MinLength(5):Check("Test123")).to.equal(true);
                expect(v115:MinLength(function() --[[ Line: 1837 ]]
                    return 5;
                end):Check("Test123")).to.equal(true);
            end);
            it("should accept strings equal to the specified length", function() --[[ Line: 1842 ]]
                -- upvalues: v115 (ref)
                expect(v115:MinLength(5):Check("12345")).to.equal(true);
                expect(v115:MinLength(function() --[[ Line: 1844 ]]
                    return 5;
                end):Check("12345")).to.equal(true);
            end);
        end);
        describe("MaxLength", function() --[[ Line: 1850 ]]
            -- upvalues: v115 (copy)
            it("should reject strings longer than the specified length", function() --[[ Line: 1851 ]]
                -- upvalues: v115 (ref)
                expect(v115:MaxLength(5):Check("Test123")).to.equal(false);
                expect(v115:MaxLength(function() --[[ Line: 1853 ]]
                    return 5;
                end):Check("Test123")).to.equal(false);
            end);
            it("should accept strings shorter than the specified length", function() --[[ Line: 1858 ]]
                -- upvalues: v115 (ref)
                expect(v115:MaxLength(5):Check("Test")).to.equal(true);
                expect(v115:MaxLength(function() --[[ Line: 1860 ]]
                    return 5;
                end):Check("Test")).to.equal(true);
            end);
            it("should accept strings equal to the specified length", function() --[[ Line: 1865 ]]
                -- upvalues: v115 (ref)
                expect(v115:MaxLength(5):Check("12345")).to.equal(true);
                expect(v115:MaxLength(function() --[[ Line: 1867 ]]
                    return 5;
                end):Check("12345")).to.equal(true);
            end);
        end);
        describe("Pattern", function() --[[ Line: 1873 ]]
            -- upvalues: v115 (copy)
            it("should accept strings matching the specified pattern", function() --[[ Line: 1874 ]]
                -- upvalues: v115 (ref)
                expect(v115:Pattern("[0-9]+"):Check("34789275")).to.equal(true);
                expect(v115:Pattern(function() --[[ Line: 1876 ]]
                    return "[0-9]+";
                end):Check("34789275")).to.equal(true);
            end);
            it("should reject strings not matching the specified pattern", function() --[[ Line: 1881 ]]
                -- upvalues: v115 (ref)
                expect(v115:Pattern("[0-9]+"):Check("123h4")).to.equal(false);
                expect(v115:Pattern(function() --[[ Line: 1883 ]]
                    return "[0-9]+";
                end):Check("123h4")).to.equal(false);
            end);
        end);
        describe("Contains", function() --[[ Line: 1889 ]]
            -- upvalues: v115 (copy)
            it("should accept strings containing the specified substring", function() --[[ Line: 1890 ]]
                -- upvalues: v115 (ref)
                expect(v115:Contains("Test"):Check("------Test123")).to.equal(true);
                expect(v115:Contains(function() --[[ Line: 1892 ]]
                    return "Test";
                end):Check("------Test123")).to.equal(true);
            end);
            it("should reject strings not containing the specified substring", function() --[[ Line: 1897 ]]
                -- upvalues: v115 (ref)
                expect(v115:Contains("Test"):Check("asdfghjkl")).to.equal(false);
                expect(v115:Contains(function() --[[ Line: 1899 ]]
                    return "Test";
                end):Check("asdfghjkl")).to.equal(false);
            end);
        end);
    end);
    describe("Any", function() --[[ Line: 1906 ]]
        -- upvalues: v2 (copy)
        it("should reject nil values", function() --[[ Line: 1907 ]]
            -- upvalues: v2 (ref)
            expect(v2.Any():Check(nil)).to.equal(false);
        end);
        it("should accept any non-nil type", function() --[[ Line: 1911 ]]
            -- upvalues: v2 (ref)
            expect(v2.Any():Check(1)).to.equal(true);
            expect(v2.Any():Check("Test")).to.equal(true);
            expect(v2.Any():Check(function() --[[ Line: 1914 ]]

            end)).to.equal(true);
            expect(v2.Any():Check({})).to.equal(true);
            expect(v2.Any():Check(false)).to.equal(true);
        end);
    end);
    describe("Array", function() --[[ Line: 1920 ]]
        -- upvalues: v2 (copy)
        local v117 = v2.Array();
        describe("Init", function() --[[ Line: 1923 ]]
            -- upvalues: v117 (copy)
            it("should accept an array", function() --[[ Line: 1924 ]]
                -- upvalues: v117 (ref)
                expect(v117:Check({})).to.equal(true);
                expect(v117:Check({
                    1
                })).to.equal(true);
                expect(v117:Check({
                    1, 
                    2
                })).to.equal(true);
            end);
            it("should reject non-arrays", function() --[[ Line: 1930 ]]
                -- upvalues: v117 (ref)
                expect(v117:Check(1)).to.equal(false);
                expect(v117:Check(function() --[[ Line: 1932 ]]

                end)).to.equal(false);
                expect(v117:Check(nil)).to.equal(false);
                expect(v117:Check({
                    Test = true
                })).to.equal(false);
            end);
        end);
        describe("OfLength", function() --[[ Line: 1938 ]]
            -- upvalues: v117 (copy)
            it("should reject arrays shorter than the specified length", function() --[[ Line: 1939 ]]
                -- upvalues: v117 (ref)
                expect(v117:OfLength(5):Check({
                    1, 
                    2, 
                    3, 
                    4
                })).to.equal(false);
                expect(v117:OfLength(function() --[[ Line: 1941 ]]
                    return 5;
                end):Check({
                    1, 
                    2, 
                    3, 
                    4
                })).to.equal(false);
            end);
            it("should accept arrays longer than the specified length", function() --[[ Line: 1946 ]]
                -- upvalues: v117 (ref)
                expect(v117:OfLength(5):Check({
                    1, 
                    2, 
                    3, 
                    4, 
                    5
                })).to.equal(true);
                expect(v117:OfLength(function() --[[ Line: 1948 ]]
                    return 5;
                end):Check({
                    1, 
                    2, 
                    3, 
                    4, 
                    5
                })).to.equal(true);
            end);
            it("should reject arrays greater than the specified length", function() --[[ Line: 1953 ]]
                -- upvalues: v117 (ref)
                expect(v117:OfLength(5):Check({
                    1, 
                    2, 
                    3, 
                    4, 
                    5, 
                    6
                })).to.equal(false);
                expect(v117:OfLength(function() --[[ Line: 1955 ]]
                    return 5;
                end):Check({
                    1, 
                    2, 
                    3, 
                    4, 
                    5, 
                    6
                })).to.equal(false);
            end);
        end);
        describe("MinLength", function() --[[ Line: 1961 ]]
            -- upvalues: v117 (copy)
            it("should reject arrays shorter than the specified length", function() --[[ Line: 1962 ]]
                -- upvalues: v117 (ref)
                expect(v117:MinLength(5):Check({
                    1, 
                    2, 
                    3, 
                    4
                })).to.equal(false);
                expect(v117:MinLength(function() --[[ Line: 1964 ]]
                    return 5;
                end):Check({
                    1, 
                    2, 
                    3, 
                    4
                })).to.equal(false);
            end);
            it("should accept arrays equal to the specified length", function() --[[ Line: 1969 ]]
                -- upvalues: v117 (ref)
                expect(v117:MinLength(5):Check({
                    1, 
                    2, 
                    3, 
                    4, 
                    5
                })).to.equal(true);
                expect(v117:MinLength(function() --[[ Line: 1971 ]]
                    return 5;
                end):Check({
                    1, 
                    2, 
                    3, 
                    4, 
                    5
                })).to.equal(true);
            end);
            it("should accept arrays longer than the specified length", function() --[[ Line: 1976 ]]
                -- upvalues: v117 (ref)
                expect(v117:MinLength(5):Check({
                    1, 
                    2, 
                    3, 
                    4, 
                    5, 
                    6
                })).to.equal(true);
                expect(v117:MinLength(function() --[[ Line: 1978 ]]
                    return 5;
                end):Check({
                    1, 
                    2, 
                    3, 
                    4, 
                    5, 
                    6
                })).to.equal(true);
            end);
        end);
        describe("MaxLength", function() --[[ Line: 1984 ]]
            -- upvalues: v117 (copy)
            it("should reject arrays longer than the specified length", function() --[[ Line: 1985 ]]
                -- upvalues: v117 (ref)
                expect(v117:MaxLength(5):Check({
                    1, 
                    2, 
                    3, 
                    4, 
                    5, 
                    6
                })).to.equal(false);
                expect(v117:MaxLength(function() --[[ Line: 1987 ]]
                    return 5;
                end):Check({
                    1, 
                    2, 
                    3, 
                    4, 
                    5, 
                    6
                })).to.equal(false);
            end);
            it("should accept arrays equal to the specified length", function() --[[ Line: 1992 ]]
                -- upvalues: v117 (ref)
                expect(v117:MaxLength(5):Check({
                    1, 
                    2, 
                    3, 
                    4, 
                    5
                })).to.equal(true);
                expect(v117:MaxLength(function() --[[ Line: 1994 ]]
                    return 5;
                end):Check({
                    1, 
                    2, 
                    3, 
                    4, 
                    5
                })).to.equal(true);
            end);
            it("should accept arrays shorter than the specified length", function() --[[ Line: 1999 ]]
                -- upvalues: v117 (ref)
                expect(v117:MaxLength(5):Check({
                    1, 
                    2, 
                    3, 
                    4
                })).to.equal(true);
                expect(v117:MaxLength(function() --[[ Line: 2001 ]]
                    return 5;
                end):Check({
                    1, 
                    2, 
                    3, 
                    4
                })).to.equal(true);
            end);
        end);
        describe("Contains", function() --[[ Line: 2007 ]]
            -- upvalues: v117 (copy)
            it("should accept arrays containing the specified element", function() --[[ Line: 2008 ]]
                -- upvalues: v117 (ref)
                expect(v117:Contains(1):Check({
                    1, 
                    2, 
                    3, 
                    4
                })).to.equal(true);
                expect(v117:Contains(function() --[[ Line: 2010 ]]
                    return 1;
                end):Check({
                    1, 
                    2, 
                    3, 
                    4
                })).to.equal(true);
            end);
            it("should reject arrays not containing the specified element", function() --[[ Line: 2015 ]]
                -- upvalues: v117 (ref)
                expect(v117:Contains(1):Check({
                    2, 
                    3, 
                    4
                })).to.equal(false);
                expect(v117:Contains(function() --[[ Line: 2017 ]]
                    return 1;
                end):Check({
                    2, 
                    3, 
                    4
                })).to.equal(false);
            end);
        end);
        describe("OfType", function() --[[ Line: 2023 ]]
            -- upvalues: v117 (copy), v2 (ref)
            it("should accept arrays containing only the specified type", function() --[[ Line: 2024 ]]
                -- upvalues: v117 (ref), v2 (ref)
                expect(v117:OfType(v2.Number()):Check({
                    1, 
                    2, 
                    3, 
                    4
                })).to.equal(true);
            end);
            it("should reject arrays containing elements of other types", function() --[[ Line: 2028 ]]
                -- upvalues: v117 (ref), v2 (ref)
                expect(v117:OfType(v2.Number()):Check({
                    1, 
                    "Test", 
                    3, 
                    4
                })).to.equal(false);
            end);
        end);
        describe("OfStructure", function() --[[ Line: 2033 ]]
            -- upvalues: v117 (copy), v2 (ref)
            it("should throw for non TypeCheckers inside the template array", function() --[[ Line: 2034 ]]
                -- upvalues: v117 (ref)
                expect(function() --[[ Line: 2035 ]]
                    -- upvalues: v117 (ref)
                    v117:OfStructure({
                        1
                    });
                end).to.throw();
                expect(function() --[[ Line: 2039 ]]
                    -- upvalues: v117 (ref)
                    v117:OfStructure({
                        function() --[[ Line: 2040 ]]

                        end
                    });
                end).to.throw();
                expect(function() --[[ Line: 2043 ]]
                    -- upvalues: v117 (ref)
                    v117:OfStructure({
                        {}
                    });
                end).to.throw();
            end);
            it("should not throw for TypeCheckers inside the template array", function() --[[ Line: 2048 ]]
                -- upvalues: v117 (ref), v2 (ref)
                expect(function() --[[ Line: 2049 ]]
                    -- upvalues: v117 (ref), v2 (ref)
                    v117:OfStructure({
                        v2.Number()
                    });
                end).never.to.throw();
                expect(function() --[[ Line: 2053 ]]
                    -- upvalues: v117 (ref), v2 (ref)
                    v117:OfStructure({
                        v2.String()
                    });
                end).never.to.throw();
                expect(function() --[[ Line: 2057 ]]
                    -- upvalues: v117 (ref), v2 (ref)
                    v117:OfStructure({
                        v2.Array()
                    });
                end).never.to.throw();
            end);
            it("should accept arrays with additional contents", function() --[[ Line: 2062 ]]
                -- upvalues: v117 (ref), v2 (ref)
                expect(v117:OfStructure({
                    v2.Number(), 
                    v2.Number()
                }):Check({
                    1, 
                    2, 
                    3
                })).to.equal(true);
            end);
            it("should accept an array of a correct type (numerical)", function() --[[ Line: 2066 ]]
                -- upvalues: v117 (ref), v2 (ref)
                expect(v117:OfStructure({
                    v2.Number(), 
                    v2.Number(), 
                    v2.Number(), 
                    v2.Number()
                }):Check({
                    1, 
                    2, 
                    3, 
                    4
                })).to.equal(true);
            end);
            it("should reject an array of a incorrect type (numerical)", function() --[[ Line: 2073 ]]
                -- upvalues: v117 (ref), v2 (ref)
                expect(v117:OfStructure({
                    v2.Number(), 
                    v2.Number(), 
                    v2.Number(), 
                    v2.Number()
                }):Check({
                    1, 
                    2, 
                    "Test", 
                    4
                })).to.equal(false);
            end);
            it("should check recursively", function() --[[ Line: 2080 ]]
                -- upvalues: v117 (ref), v2 (ref)
                expect(v117:OfStructure({
                    [1] = v117:OfStructure({
                        v2.String()
                    }), 
                    [2] = v117:OfStructure({
                        v2.Boolean()
                    })
                }):Check({
                    {
                        "Test"
                    }, 
                    {
                        true
                    }
                })).to.equal(true);
            end);
        end);
        describe("OfStructureStrict (Strict + OfStructure)", function() --[[ Line: 2088 ]]
            -- upvalues: v117 (copy), v2 (ref)
            it("should reject arrays with additional contents", function() --[[ Line: 2089 ]]
                -- upvalues: v117 (ref), v2 (ref)
                local v118 = v117:OfStructureStrict({
                    v2.Number(), 
                    v2.Number()
                });
                expect(v118:Check({
                    1, 
                    2
                })).to.equal(true);
                expect(v118:Check({
                    1, 
                    2, 
                    3
                })).to.equal(false);
            end);
        end);
        describe("IsFrozen", function() --[[ Line: 2096 ]]
            -- upvalues: v117 (copy)
            it("should accept frozen arrays", function() --[[ Line: 2097 ]]
                -- upvalues: v117 (ref)
                local v119 = {
                    1, 
                    2, 
                    3
                };
                table.freeze(v119);
                expect(v117:IsFrozen():Check(v119)).to.equal(true);
            end);
            it("should reject non-frozen arrays", function() --[[ Line: 2103 ]]
                -- upvalues: v117 (ref)
                expect(v117:IsFrozen():Check({
                    1, 
                    2, 
                    3
                })).to.equal(false);
            end);
        end);
        describe("IsOrdered", function() --[[ Line: 2109 ]]
            -- upvalues: v117 (copy)
            it("should allow nil params", function() --[[ Line: 2110 ]]
                -- upvalues: v117 (ref)
                expect(function() --[[ Line: 2111 ]]
                    -- upvalues: v117 (ref)
                    v117:IsOrdered();
                end).never.to.throw();
            end);
            it("should accept params which are booleans only if not nil (for ascending & descending)", function() --[[ Line: 2116 ]]
                -- upvalues: v117 (ref)
                expect(function() --[[ Line: 2117 ]]
                    -- upvalues: v117 (ref)
                    v117:IsOrdered(true);
                    v117:IsOrdered(false);
                end).never.to.throw();
                expect(function() --[[ Line: 2122 ]]
                    -- upvalues: v117 (ref)
                    v117:IsOrdered(1);
                end).to.throw();
                expect(function() --[[ Line: 2126 ]]
                    -- upvalues: v117 (ref)
                    v117:IsOrdered({});
                end).to.throw();
            end);
            it("should accept single-item arrays", function() --[[ Line: 2131 ]]
                -- upvalues: v117 (ref)
                expect(v117:IsOrdered():Check({
                    1
                })).to.equal(true);
            end);
            it("should check if an array is ordered as descending", function() --[[ Line: 2135 ]]
                -- upvalues: v117 (ref)
                expect(v117:IsOrdered(true):Check({
                    3, 
                    2, 
                    1
                })).to.equal(true);
                expect(v117:IsOrdered(true):Check({
                    1, 
                    2, 
                    3
                })).to.equal(false);
                expect(v117:IsOrdered(function() --[[ Line: 2138 ]]
                    return true;
                end):Check({
                    3, 
                    2, 
                    1
                })).to.equal(true);
                expect(v117:IsOrdered(function() --[[ Line: 2141 ]]
                    return true;
                end):Check({
                    1, 
                    2, 
                    3
                })).to.equal(false);
            end);
            it("should check if an array is ordered as ascending", function() --[[ Line: 2146 ]]
                -- upvalues: v117 (ref)
                expect(v117:IsOrdered(false):Check({
                    1, 
                    2, 
                    3
                })).to.equal(true);
                expect(v117:IsOrdered(false):Check({
                    3, 
                    2, 
                    1
                })).to.equal(false);
                expect(v117:IsOrdered():Check({
                    1, 
                    2, 
                    3
                })).to.equal(true);
                expect(v117:IsOrdered():Check({
                    3, 
                    2, 
                    1
                })).to.equal(false);
                expect(v117:IsOrdered(function() --[[ Line: 2151 ]]
                    return false;
                end):Check({
                    1, 
                    2, 
                    3
                })).to.equal(true);
                expect(v117:IsOrdered(function() --[[ Line: 2154 ]]
                    return false;
                end):Check({
                    3, 
                    2, 
                    1
                })).to.equal(false);
            end);
            it("should reject non ordered arrays", function() --[[ Line: 2159 ]]
                -- upvalues: v117 (ref)
                expect(v117:IsOrdered(false):Check({
                    1, 
                    2, 
                    4, 
                    3
                })).to.equal(false);
                expect(v117:IsOrdered(true):Check({
                    1, 
                    2, 
                    4, 
                    3
                })).to.equal(false);
                expect(v117:IsOrdered(function() --[[ Line: 2162 ]]
                    return false;
                end):Check({
                    1, 
                    2, 
                    4, 
                    3
                })).to.equal(false);
                expect(v117:IsOrdered(function() --[[ Line: 2165 ]]
                    return true;
                end):Check({
                    1, 
                    2, 
                    4, 
                    3
                })).to.equal(false);
            end);
        end);
    end);
    describe("Nil", function() --[[ Line: 2172 ]]
        -- upvalues: v2 (copy)
        describe("Init", function() --[[ Line: 2173 ]]
            -- upvalues: v2 (ref)
            it("should accept nil", function() --[[ Line: 2174 ]]
                -- upvalues: v2 (ref)
                expect(v2.Nil():Check(nil)).to.equal(true);
            end);
            it("should reject non-nil", function() --[[ Line: 2178 ]]
                -- upvalues: v2 (ref)
                expect(v2.Nil():Check(1)).to.equal(false);
                expect(v2.Nil():Check(function() --[[ Line: 2180 ]]

                end)).to.equal(false);
                expect(v2.Nil():Check({})).to.equal(false);
                expect(v2.Nil():Check(false)).to.equal(false);
            end);
        end);
    end);
    describe("Enum", function() --[[ Line: 2187 ]]
        -- upvalues: v2 (copy)
        describe("Init", function() --[[ Line: 2188 ]]
            -- upvalues: v2 (ref)
            it("should throw given non-EnumItem, non-Enum values", function() --[[ Line: 2189 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 2190 ]]
                    -- upvalues: v2 (ref)
                    v2.Enum(1);
                end).to.throw();
                expect(function() --[[ Line: 2194 ]]
                    -- upvalues: v2 (ref)
                    v2.Enum(true);
                end).to.throw();
                expect(function() --[[ Line: 2198 ]]
                    -- upvalues: v2 (ref)
                    v2.Enum({});
                end).to.throw();
            end);
            it("should not throw given EnumItem or Enum (or function) values", function() --[[ Line: 2203 ]]
                -- upvalues: v2 (ref)
                expect(function() --[[ Line: 2204 ]]
                    -- upvalues: v2 (ref)
                    v2.Enum(Enum.AccessoryType);
                end).never.to.throw();
                expect(function() --[[ Line: 2208 ]]
                    -- upvalues: v2 (ref)
                    v2.Enum(Enum.AccessoryType.Shirt);
                end).never.to.throw();
                expect(function() --[[ Line: 2212 ]]
                    -- upvalues: v2 (ref)
                    v2.Enum(function() --[[ Line: 2213 ]]
                        return Enum.AccessoryType.Shirt;
                    end);
                end).never.to.throw();
            end);
        end);
        describe("IsA", function() --[[ Line: 2220 ]]
            -- upvalues: v2 (ref)
            it("should accept an Enum item if the respective EnumItem is a sub-item", function() --[[ Line: 2221 ]]
                -- upvalues: v2 (ref)
                expect(v2.Enum(Enum.AccessoryType):Check(Enum.AccessoryType.Shirt)).to.equal(true);
                expect(v2.Enum(function() --[[ Line: 2223 ]]
                    return Enum.AccessoryType;
                end):Check(Enum.AccessoryType.Shirt)).to.equal(true);
            end);
            it("should reject EnumItems which are not part of the Enum class", function() --[[ Line: 2228 ]]
                -- upvalues: v2 (ref)
                expect(v2.Enum(Enum.AccessoryType):Check(Enum.AlphaMode.Overlay)).to.equal(false);
                expect(v2.Enum(function() --[[ Line: 2230 ]]
                    return Enum.AccessoryType;
                end):Check(Enum.AlphaMode.Overlay)).to.equal(false);
            end);
            it("should accept EnumItems which are equal", function() --[[ Line: 2235 ]]
                -- upvalues: v2 (ref)
                expect(v2.Enum(Enum.AccessoryType.Face):Check(Enum.AccessoryType.Face)).to.equal(true);
                expect(v2.Enum(function() --[[ Line: 2237 ]]
                    return Enum.AccessoryType.Face;
                end):Check(Enum.AccessoryType.Face)).to.equal(true);
            end);
        end);
    end);
    describe("Thread", function() --[[ Line: 2244 ]]
        -- upvalues: v2 (copy)
        local v120 = v2.Thread();
        describe("Init", function() --[[ Line: 2247 ]]
            -- upvalues: v120 (copy)
            it("should reject non-thread values", function() --[[ Line: 2248 ]]
                -- upvalues: v120 (ref)
                expect(v120:Check(1)).to.equal(false);
                expect(v120:Check(function() --[[ Line: 2250 ]]

                end)).to.equal(false);
                expect(v120:Check({})).to.equal(false);
            end);
            it("should accept thread values", function() --[[ Line: 2254 ]]
                -- upvalues: v120 (ref)
                expect(v120:Check(coroutine.create(function() --[[ Line: 2255 ]]

                end))).to.equal(true);
            end);
        end);
        describe("HasStatus", function() --[[ Line: 2259 ]]
            -- upvalues: v120 (copy)
            it("should accept running threads given 'running'", function() --[[ Line: 2260 ]]
                -- upvalues: v120 (ref)
                local v121 = coroutine.running();
                expect(v120:HasStatus("suspended"):Check(v121)).to.equal(false);
                expect(v120:HasStatus("running"):Check(v121)).to.equal(true);
                expect(v120:HasStatus("normal"):Check(v121)).to.equal(false);
                expect(v120:HasStatus("dead"):Check(v121)).to.equal(false);
                expect(v120:HasStatus(function() --[[ Line: 2268 ]]
                    return "suspended";
                end):Check(v121)).to.equal(false);
                expect(v120:HasStatus(function() --[[ Line: 2269 ]]
                    return "running";
                end):Check(v121)).to.equal(true);
                expect(v120:HasStatus(function() --[[ Line: 2270 ]]
                    return "normal";
                end):Check(v121)).to.equal(false);
                expect(v120:HasStatus(function() --[[ Line: 2271 ]]
                    return "dead";
                end):Check(v121)).to.equal(false);
            end);
            it("should accept suspended threads given 'suspended'", function() --[[ Line: 2274 ]]
                -- upvalues: v120 (ref)
                local v122 = task.spawn(function() --[[ Line: 2275 ]]
                    task.wait(1);
                end);
                expect(v120:HasStatus("suspended"):Check(v122)).to.equal(true);
                expect(v120:HasStatus("running"):Check(v122)).to.equal(false);
                expect(v120:HasStatus("normal"):Check(v122)).to.equal(false);
                expect(v120:HasStatus("dead"):Check(v122)).to.equal(false);
                expect(v120:HasStatus(function() --[[ Line: 2284 ]]
                    return "suspended";
                end):Check(v122)).to.equal(true);
                expect(v120:HasStatus(function() --[[ Line: 2285 ]]
                    return "running";
                end):Check(v122)).to.equal(false);
                expect(v120:HasStatus(function() --[[ Line: 2286 ]]
                    return "normal";
                end):Check(v122)).to.equal(false);
                expect(v120:HasStatus(function() --[[ Line: 2287 ]]
                    return "dead";
                end):Check(v122)).to.equal(false);
            end);
            it("should accept threads given 'dead'", function() --[[ Line: 2290 ]]
                -- upvalues: v120 (ref)
                local v123 = task.spawn(function() --[[ Line: 2291 ]]

                end);
                expect(v120:HasStatus("suspended"):Check(v123)).to.equal(false);
                expect(v120:HasStatus("running"):Check(v123)).to.equal(false);
                expect(v120:HasStatus("normal"):Check(v123)).to.equal(false);
                expect(v120:HasStatus("dead"):Check(v123)).to.equal(true);
                expect(v120:HasStatus(function() --[[ Line: 2298 ]]
                    return "suspended";
                end):Check(v123)).to.equal(false);
                expect(v120:HasStatus(function() --[[ Line: 2299 ]]
                    return "running";
                end):Check(v123)).to.equal(false);
                expect(v120:HasStatus(function() --[[ Line: 2300 ]]
                    return "normal";
                end):Check(v123)).to.equal(false);
                expect(v120:HasStatus(function() --[[ Line: 2301 ]]
                    return "dead";
                end):Check(v123)).to.equal(true);
            end);
            it("should accept threads given 'normal'", function() --[[ Line: 2304 ]]
                -- upvalues: v120 (ref)
                local v124 = false;
                local v126 = coroutine.create(function(v125) --[[ Line: 2306 ]]
                    v125();
                end);
                task.spawn(function() --[[ Line: 2310 ]]
                    -- upvalues: v126 (copy), v120 (ref), v124 (ref)
                    local v127 = coroutine.running();
                    task.spawn(v126, function() --[[ Line: 2313 ]]
                        -- upvalues: v120 (ref), v127 (copy), v124 (ref)
                        expect(v120:HasStatus("suspended"):Check(v127)).to.equal(false);
                        expect(v120:HasStatus("running"):Check(v127)).to.equal(false);
                        expect(v120:HasStatus("normal"):Check(v127)).to.equal(true);
                        expect(v120:HasStatus("dead"):Check(v127)).to.equal(false);
                        expect(v120:HasStatus(function() --[[ Line: 2319 ]]
                            return "suspended";
                        end):Check(v127)).to.equal(false);
                        expect(v120:HasStatus(function() --[[ Line: 2320 ]]
                            return "running";
                        end):Check(v127)).to.equal(false);
                        expect(v120:HasStatus(function() --[[ Line: 2321 ]]
                            return "normal";
                        end):Check(v127)).to.equal(true);
                        expect(v120:HasStatus(function() --[[ Line: 2322 ]]
                            return "dead";
                        end):Check(v127)).to.equal(false);
                        v124 = true;
                    end);
                end);
                expect(v124).to.equal(true);
            end);
        end);
    end);
    describe("Object", function() --[[ Line: 2332 ]]
        -- upvalues: v2 (copy)
        local v128 = v2.Object();
        describe("Init", function() --[[ Line: 2335 ]]
            -- upvalues: v128 (copy)
            it("should reject non-object values", function() --[[ Line: 2336 ]]
                -- upvalues: v128 (ref)
                expect(v128:Check(1)).to.equal(false);
                expect(v128:Check(function() --[[ Line: 2338 ]]

                end)).to.equal(false);
                expect(v128:Check({
                    1
                })).to.equal(false);
            end);
            it("should accept object values", function() --[[ Line: 2342 ]]
                -- upvalues: v128 (ref)
                expect(v128:Check({})).to.equal(true);
                expect(v128:Check({
                    Test = 123
                })).to.equal(true);
                expect(v128:Check({
                    Test = false
                })).to.equal(true);
            end);
        end);
        describe("OfValueType", function() --[[ Line: 2349 ]]
            -- upvalues: v128 (copy), v2 (ref)
            it("should accept an object with the given value type", function() --[[ Line: 2350 ]]
                -- upvalues: v128 (ref), v2 (ref)
                expect(v128:OfValueType(v2.Number()):Check({
                    Test = 123
                })).to.equal(true);
                expect(v128:OfValueType(v2.Number()):Check({
                    Test = 123, 
                    Another = 987
                })).to.equal(true);
            end);
            it("should reject an object with a different value type", function() --[[ Line: 2355 ]]
                -- upvalues: v128 (ref), v2 (ref)
                expect(v128:OfValueType(v2.Number()):Check({
                    Test1 = 123, 
                    Test2 = "123"
                })).to.equal(false);
                expect(v128:OfValueType(v2.Number()):Check({
                    Test = "123", 
                    Another = "987"
                })).to.equal(false);
            end);
        end);
        describe("OfKeyType", function() --[[ Line: 2361 ]]
            -- upvalues: v128 (copy), v2 (ref)
            it("should accept an object with the given key type", function() --[[ Line: 2362 ]]
                -- upvalues: v128 (ref), v2 (ref)
                expect(v128:OfKeyType(v2.String()):Check({
                    Test = 123
                })).to.equal(true);
                expect(v128:OfKeyType(v2.String()):Check({
                    Test = 123, 
                    Another = 987
                })).to.equal(true);
            end);
            it("should reject an object with a different key type", function() --[[ Line: 2367 ]]
                -- upvalues: v128 (ref), v2 (ref)
                expect(v128:OfKeyType(v2.String()):Check({
                    [{}] = true
                })).to.equal(false);
                expect(v128:OfKeyType(v2.String()):Check({
                    [Instance.new("Part")] = true
                })).to.equal(false);
            end);
        end);
        describe("OfStructure", function() --[[ Line: 2373 ]]
            -- upvalues: v128 (copy), v2 (ref)
            it("should accept an object with the given structure", function() --[[ Line: 2374 ]]
                -- upvalues: v128 (ref), v2 (ref)
                expect(v128:OfStructure({
                    Test = v2.Number(), 
                    Another = v2.Boolean()
                }):Check({
                    Test = 123, 
                    Another = true
                })).to.equal(true);
            end);
            it("should reject an object with a different structure", function() --[[ Line: 2381 ]]
                -- upvalues: v128 (ref), v2 (ref)
                expect(v128:OfStructure({
                    Test = v2.Number(), 
                    Another = v2.Boolean()
                }):Check({
                    Test = 123, 
                    Another = "true"
                })).to.equal(false);
            end);
            it("should accept additional fields when not in strict mode", function() --[[ Line: 2388 ]]
                -- upvalues: v128 (ref), v2 (ref)
                expect(v128:OfStructure({
                    Test = v2.Number(), 
                    Another = v2.Boolean()
                }):Check({
                    Test = 123, 
                    Another = true, 
                    Test2 = "123"
                })).to.equal(true);
            end);
            it("should recurse given sub object TypeCheckers", function() --[[ Line: 2395 ]]
                -- upvalues: v128 (ref), v2 (ref)
                expect(v128:OfStructure({
                    Test = v2.Object({
                        Test = v2.Number(), 
                        Another = v2.Boolean()
                    })
                }):Check({
                    Test = {
                        Test = 123, 
                        Another = true
                    }
                })).to.equal(true);
            end);
        end);
        describe("OfStructureStrict (OfStructure + Strict)", function() --[[ Line: 2405 ]]
            -- upvalues: v128 (copy), v2 (ref)
            it("should accept an object with the given structure", function() --[[ Line: 2406 ]]
                -- upvalues: v128 (ref), v2 (ref)
                expect(v128:OfStructureStrict({
                    Test = v2.Number(), 
                    Another = v2.Boolean()
                }):Check({
                    Test = 123, 
                    Another = true
                })).to.equal(true);
            end);
            it("should reject an object with a different structure", function() --[[ Line: 2413 ]]
                -- upvalues: v128 (ref), v2 (ref)
                expect(v128:OfStructureStrict({
                    Test = v2.Number(), 
                    Another = v2.Boolean()
                }):Check({
                    Test = 123, 
                    Another = "true"
                })).to.equal(false);
            end);
            it("should reject additional fields when not in strict mode", function() --[[ Line: 2420 ]]
                -- upvalues: v128 (ref), v2 (ref)
                expect(v128:OfStructureStrict({
                    Test = v2.Number(), 
                    Another = v2.Boolean()
                }):Check({
                    Test = 123, 
                    Another = true, 
                    Test2 = "123"
                })).to.equal(false);
            end);
            it("should recurse given sub object TypeCheckers but not enforce strict recursively", function() --[[ Line: 2427 ]]
                -- upvalues: v128 (ref), v2 (ref)
                expect(v128:OfStructureStrict({
                    Test = v2.Object({
                        Test = v2.Number(), 
                        Another = v2.Boolean()
                    })
                }):Check({
                    Test = {
                        Test = 123, 
                        Another = true, 
                        Final = {}
                    }
                })).to.equal(true);
            end);
        end);
        describe("IsFrozen", function() --[[ Line: 2437 ]]
            -- upvalues: v128 (copy)
            it("should accept frozen objects", function() --[[ Line: 2438 ]]
                -- upvalues: v128 (ref)
                local v129 = {
                    X = 1, 
                    Y = 2, 
                    Z = 3
                };
                table.freeze(v129);
                expect(v128:IsFrozen():Check(v129)).to.equal(true);
            end);
            it("should reject non-frozen objects", function() --[[ Line: 2444 ]]
                -- upvalues: v128 (ref)
                local v130 = {
                    X = 1, 
                    Y = 2, 
                    Z = 3
                };
                expect(v128:IsFrozen():Check(v130)).to.equal(false);
            end);
        end);
        describe("CheckMetatable", function() --[[ Line: 2450 ]]
            -- upvalues: v128 (copy), v2 (ref)
            it("should reject non-TypeCheckers", function() --[[ Line: 2451 ]]
                -- upvalues: v128 (ref)
                expect(function() --[[ Line: 2452 ]]
                    -- upvalues: v128 (ref)
                    v128:CheckMetatable(1);
                end).to.throw();
                expect(function() --[[ Line: 2456 ]]
                    -- upvalues: v128 (ref)
                    v128:CheckMetatable(function() --[[ Line: 2457 ]]

                    end);
                end).to.throw();
                expect(function() --[[ Line: 2460 ]]
                    -- upvalues: v128 (ref)
                    v128:CheckMetatable({});
                end).to.throw();
                expect(function() --[[ Line: 2464 ]]
                    -- upvalues: v128 (ref)
                    v128:CheckMetatable(Instance.new("Part"));
                end).to.throw();
            end);
            it("should run the provided TypeChecker on the metatable", function() --[[ Line: 2469 ]]
                -- upvalues: v128 (ref), v2 (ref)
                local v131 = {};
                local v132 = {
                    __index = v131
                };
                setmetatable(v131, v132);
                expect(v128:CheckMetatable(v128:Equals(v132)):Check(v131)).to.equal(true);
                expect(v128:CheckMetatable(v2.Number()):Check(v131)).to.equal(false);
            end);
        end);
        describe("OfClass", function() --[[ Line: 2479 ]]
            -- upvalues: v128 (copy)
            it("should reject non-tables", function() --[[ Line: 2480 ]]
                -- upvalues: v128 (ref)
                expect(function() --[[ Line: 2481 ]]
                    -- upvalues: v128 (ref)
                    v128:CheckMetatable(1);
                end).to.throw();
                expect(function() --[[ Line: 2485 ]]
                    -- upvalues: v128 (ref)
                    v128:CheckMetatable(function() --[[ Line: 2486 ]]

                    end);
                end).to.throw();
                expect(function() --[[ Line: 2489 ]]
                    -- upvalues: v128 (ref)
                    v128:CheckMetatable(Instance.new("Part"));
                end).to.throw();
            end);
            it("should reject tables which are not intended to be an __index metatable", function() --[[ Line: 2494 ]]
                -- upvalues: v128 (ref)
                local v133 = {};
                expect(function() --[[ Line: 2497 ]]
                    -- upvalues: v128 (ref), v133 (copy)
                    v128:OfClass(v133);
                end).to.throw();
            end);
            it("should accept tables which are intended to be an __index metatable", function() --[[ Line: 2502 ]]
                -- upvalues: v128 (ref)
                local v134 = {
                    __index = {}
                };
                expect(function() --[[ Line: 2505 ]]
                    -- upvalues: v128 (ref), v134 (copy)
                    v128:OfClass(v134);
                end).never.to.throw();
            end);
            it("should accept tables with the metatable equivalent to the provided class", function() --[[ Line: 2510 ]]
                -- upvalues: v128 (ref)
                local v135 = {};
                v135.__index = v135;
                local v136 = setmetatable({}, v135);
                expect(v128:OfClass(v135):Check(v136)).to.equal(true);
            end);
            it("should reject tables with the metatable not equivalent to the provided class", function() --[[ Line: 2518 ]]
                -- upvalues: v128 (ref)
                local v137 = {};
                v137.__index = v137;
                local v138 = {};
                v138.__index = v138;
                local v139 = setmetatable({}, v137);
                expect(v128:OfClass(v138):Check(v139)).to.equal(false);
            end);
            it("should reject tables with no metatable", function() --[[ Line: 2529 ]]
                -- upvalues: v128 (ref)
                local v140 = {};
                v140.__index = v140;
                local v141 = {};
                v141.__index = v141;
                local v142 = setmetatable({}, v140);
                expect(v128:OfClass(v141):Check(v142)).to.equal(false);
            end);
        end);
        describe("FromTemplate", function() --[[ Line: 2541 ]]
            -- upvalues: v2 (ref)
            it("should generate from primitive types", function() --[[ Line: 2542 ]]
                -- upvalues: v2 (ref)
                local v143 = v2.FromTemplate("string");
                expect(v143:Check("Test")).to.equal(true);
                expect(v143:Check(123)).to.equal(false);
                v143 = v2.FromTemplate(1);
                expect(v143:Check(123)).to.equal(true);
                expect(v143:Check("Test")).to.equal(false);
                v143 = v2.FromTemplate(false);
                expect(v143:Check(true)).to.equal(true);
                expect(v143:Check("Test")).to.equal(false);
                v143 = v2.FromTemplate(function() --[[ Line: 2555 ]]

                end);
                expect(v143:Check(function() --[[ Line: 2556 ]]

                end)).to.equal(true);
                expect(v143:Check("Test")).to.equal(false);
                v143 = v2.FromTemplate(nil);
                expect(v143:Check(nil)).to.equal(true);
                expect(v143:Check("Test")).to.equal(false);
                v143 = v2.FromTemplate(newproxy(true));
                expect(v143:Check(newproxy(true))).to.equal(true);
                expect(v143:Check("Test")).to.equal(false);
                v143 = v2.FromTemplate(coroutine.create(function() --[[ Line: 2567 ]]

                end));
                expect(v143:Check(coroutine.create(function() --[[ Line: 2568 ]]

                end))).to.equal(true);
            end);
            it("should generate from Luau types", function() --[[ Line: 2571 ]]
                -- upvalues: v2 (ref)
                local v144 = v2.FromTemplate(Enum.KeyCode.A);
                expect(v144:Check(Enum.KeyCode.A)).to.equal(true);
                expect(v144:Check("Test")).to.equal(false);
                v144 = v2.FromTemplate(Color3.new(1, 1, 1));
                expect(v144:Check(Color3.new(0, 0, 0))).to.equal(true);
                expect(v144:Check("Test")).to.equal(false);
            end);
            it("should generate from Instances: flat", function() --[[ Line: 2581 ]]
                -- upvalues: v2 (ref)
                local l_Model_1 = Instance.new("Model");
                local l_Part_2 = Instance.new("Part");
                l_Part_2.Name = "Part1";
                l_Part_2.Parent = l_Model_1;
                local l_Part_3 = Instance.new("Part");
                l_Part_3.Name = "Part2";
                l_Part_3.Parent = l_Model_1;
                local v148 = v2.FromTemplate(l_Model_1);
                expect(v148:Check(Instance.new("Model"))).to.equal(false);
                expect(v148:Check(l_Model_1)).to.equal(true);
                expect(v148:Check("Test")).to.equal(false);
            end);
            it("should generate from Instances: deep", function() --[[ Line: 2596 ]]
                -- upvalues: v2 (ref)
                local l_Model_2 = Instance.new("Model");
                local l_Part_4 = Instance.new("Part");
                l_Part_4.Name = "Part1";
                l_Part_4.Parent = l_Model_2;
                local l_Part_5 = Instance.new("Part");
                l_Part_5.Name = "Part2";
                l_Part_5.Parent = l_Model_2;
                local l_Part_6 = Instance.new("Part");
                l_Part_6.Name = "Part2Part1";
                l_Part_6.Parent = l_Part_5;
                local v153 = v2.FromTemplate(l_Model_2);
                expect(v153:Check(Instance.new("Model"))).to.equal(false);
                expect(v153:Check(l_Model_2)).to.equal(true);
                expect(v153:Check("Test")).to.equal(false);
            end);
            it("should generate from arrays: single types", function() --[[ Line: 2614 ]]
                -- upvalues: v2 (ref)
                local v154 = v2.FromTemplate({
                    "Str1", 
                    "Str2", 
                    "Str3"
                });
                expect(v154:Check({
                    "Test"
                })).to.equal(true);
            end);
            it("should generate from arrays: multiple types", function() --[[ Line: 2619 ]]
                -- upvalues: v2 (ref)
                local v155 = v2.FromTemplate({
                    "Str1", 
                    1, 
                    false
                });
                expect(v155:Check({
                    "Test"
                })).to.equal(true);
                expect(v155:Check({
                    1
                })).to.equal(true);
                expect(v155:Check({
                    false
                })).to.equal(true);
                expect(v155:Check({
                    true
                })).to.equal(true);
            end);
            it("should generate from objects: flat", function() --[[ Line: 2627 ]]
                -- upvalues: v2 (ref)
                local v156 = v2.FromTemplate({});
                expect(v156:Check({})).to.equal(true);
                expect(v156:Check("Test")).to.equal(false);
                v156 = v2.FromTemplate({
                    Test = 1
                });
                expect(v156:Check({
                    Test = 1
                })).to.equal(true);
                expect(v156:Check({
                    Test = "1"
                })).to.equal(false);
            end);
            it("should generate strict objects: flat", function() --[[ Line: 2637 ]]
                -- upvalues: v2 (ref)
                local v157 = v2.FromTemplate({}, true);
                expect(v157:Check({})).to.equal(true);
                expect(v157:Check("Test")).to.equal(false);
                v157 = v2.FromTemplate({
                    Test = 1
                }, true);
                expect(v157:Check({
                    Test = 1
                })).to.equal(true);
                expect(v157:Check({
                    Test = "1"
                })).to.equal(false);
                expect(v157:Check({
                    Test = 1, 
                    Another = 2
                })).to.equal(false);
            end);
            it("should generate from objects: deep", function() --[[ Line: 2648 ]]
                -- upvalues: v2 (ref)
                local v158 = v2.FromTemplate({
                    Test = {
                        Test = 35454535
                    }
                });
                expect(v158:Check({
                    Test = {}
                })).to.equal(false);
                expect(v158:Check({
                    Test = {
                        Test = 1
                    }
                })).to.equal(true);
                expect(v158:Check({
                    Test = {
                        Test = "1"
                    }
                })).to.equal(false);
            end);
            it("should generate strict objects: deep", function() --[[ Line: 2655 ]]
                -- upvalues: v2 (ref)
                local v159 = v2.FromTemplate({
                    Test = {
                        Test = 1
                    }
                }, true);
                expect(v159:Check({
                    Test = {}
                })).to.equal(false);
                expect(v159:Check({
                    Test = {
                        Test = 1
                    }
                })).to.equal(true);
                expect(v159:Check({
                    Test = {
                        Test = "1"
                    }
                })).to.equal(false);
                expect(v159:Check({
                    Test = {
                        Test = 1, 
                        Another = 2
                    }
                })).to.equal(false);
            end);
        end);
    end);
end;