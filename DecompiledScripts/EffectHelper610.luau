local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
local l_AlignHelper_0 = require(l_Modules_0:WaitForChild("AlignHelper"));
local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
local l_UIHelper_0 = require(l_Modules_0:WaitForChild("UIHelper"));
local l_Styles_0 = require(l_Modules_0:WaitForChild("Styles"));
local l_Emotes_0 = require(l_Modules_0:WaitForChild("Emotes"));
local l_BubbleModule_0 = require(l_ReplicatedStorage_0:WaitForChild("BubbleModule"));
local l_Bezier_0 = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
local l_Places_0 = require(game.ReplicatedFirst:WaitForChild("Places"));
local l_CameraShaker_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
local l_camShake_0 = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
local l_NumberSequenceTween_0 = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
local _ = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules", 10):WaitForChild("EmoteHelper", 10));
local v23 = require(l_ReplicatedStorage_0.Modules.Cutscene.Utilities);
local l_RemoteEvents_0 = l_ReplicatedStorage_0:WaitForChild("RemoteEvents");
local l_Events_0 = l_ReplicatedStorage_0:FindFirstChild("Events");
local l_SimulateKnockbackBE_0 = l_RemoteEvents_0:WaitForChild("SimulateKnockbackBE");
local l_SetAngleBE_0 = l_RemoteEvents_0:WaitForChild("SetAngleBE");
local _ = require(l_Modules_0:WaitForChild("Promise"));
local _ = require(game:GetService("ReplicatedStorage"):WaitForChild("CommonUtilities"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
local l_Common_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
local v33 = {};
local v34 = Random.new();
local v35 = {};
local function v39(v36) --[[ Line: 48 ]] --[[ Name: CheckMode ]]
    for v37, _ in pairs(v36:GetAttributes()) do
        if string.find(v37, "Mode") then
            return true;
        end;
    end;
    return false;
end;
local _ = function() --[[ Line: 57 ]] --[[ Name: RestoreCachedAtmosphere ]]
    -- upvalues: l_Lighting_0 (copy)
    local l_CachedAtmosphere_0 = l_Lighting_0:FindFirstChild("CachedAtmosphere");
    if l_CachedAtmosphere_0 then
        for _, v42 in l_CachedAtmosphere_0:GetChildren() do
            v42.Parent = l_Lighting_0;
        end;
        l_CachedAtmosphere_0:Destroy();
    end;
end;
local function _(v44, v45, v46) --[[ Line: 67 ]] --[[ Name: Lerp ]]
    return v44 + (v45 - v44) * v46;
end;
local v48 = {};
v33.GetMapParams = function() --[[ Line: 71 ]] --[[ Name: GetMapParams ]]
    -- upvalues: l_Workspace_0 (copy)
    local v49 = RaycastParams.new();
    v49.FilterType = Enum.RaycastFilterType.Exclude;
    v49.FilterDescendantsInstances = {
        workspace.Debris, 
        l_Workspace_0.Live, 
        l_Workspace_0.Debris
    };
    return v49;
end;
v33.GetWeldCharacter = function(v50) --[[ Line: 79 ]] --[[ Name: GetWeldCharacter ]]
    local v51 = v50 and workspace.Welds:FindFirstChild(v50.Name);
    return v51 and v51:FindFirstChild("WeldCharacter") or v50;
end;
v33.ImpactCorrection = function() --[[ Line: 86 ]] --[[ Name: ImpactCorrection ]]
    -- upvalues: l_Lighting_0 (copy), l_TweenService_0 (copy)
    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
    l_ColorCorrection_0.Saturation = 0;
    l_ColorCorrection_0.Contrast = 0;
    l_ColorCorrection_0.Enabled = true;
    local v53 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
    l_TweenService_0:Create(l_ColorCorrection_0, v53, {
        Saturation = 0.1, 
        Contrast = 0.1
    }):Play();
    local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
    l_MenuBlur_0.Size = 0;
    l_MenuBlur_0.Enabled = true;
    local v55 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
    l_TweenService_0:Create(l_MenuBlur_0, v55, {
        Size = 10
    }):Play();
end;
v33.KnockdownCash = function(v56) --[[ Line: 103 ]] --[[ Name: KnockdownCash ]]
    -- upvalues: l_Common_0 (copy), l_LocalPlayer_0 (copy), l_TweenService_0 (copy), v33 (copy)
    local v57 = v56[2];
    local l_KnockdownCashFrame_0 = l_Common_0:FindFirstChild("KnockdownCashFrame");
    if not l_KnockdownCashFrame_0 then
        return;
    else
        local v59 = l_KnockdownCashFrame_0:Clone();
        local v60 = TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
        local v61 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In);
        local v62 = UDim2.new(-0.2, 0, 0, 0);
        v59.Position = v62;
        v59.Parent = l_Common_0;
        v59.Name = "Remove";
        v59.Visible = true;
        l_LocalPlayer_0:SetAttribute("HideSpecialFrame", true);
        task.wait(0.15);
        l_TweenService_0:Create(v59, v60, {
            Position = UDim2.new(0, 0, 0, 0)
        }):Play();
        task.wait(0.6);
        v33.CreateMoneyEffect({
            Amount = math.ceil(v57 / 6), 
            StartPosition = v59.MoneyOrigin.Position, 
            CashFrame = v59.CashFrame, 
            MoneyImage = v59.MoneyImage
        });
        l_TweenService_0:Create(v59, v61, {
            Position = v62
        }):Play();
        task.wait(0.35);
        l_LocalPlayer_0:SetAttribute("HideSpecialFrame", nil);
        task.wait(5);
        v59:Destroy();
        return;
    end;
end;
v33.KnockdownWalk = function(v63) --[[ Line: 150 ]] --[[ Name: KnockdownWalk ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_RayHelper_0 (copy)
    local l_Damager_0 = v63.Damager;
    local l_DamagerHumanoid_0 = v63.DamagerHumanoid;
    local l_LookVector_0 = v63.LookVector;
    if l_LocalPlayer_0.Character == l_Damager_0 then
        local v67 = l_Damager_0.PrimaryPart.Position + l_LookVector_0 * 15;
        local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
        local l_l_RayHelper_0_RayWithWhiteList_0, v70, _ = l_RayHelper_0:GetRayWithWhiteList(l_Damager_0.PrimaryPart.Position, v67, 15, l_l_RayHelper_0_EnvironmentWhitelist_0);
        if l_l_RayHelper_0_RayWithWhiteList_0 then
            v67 = v70 - l_LookVector_0 * 2.2;
        end;
        l_DamagerHumanoid_0:MoveTo(v67);
    end;
end;
v33.GetTeleportId = function(v72) --[[ Line: 171 ]] --[[ Name: GetTeleportId ]]
    -- upvalues: v48 (copy)
    return v48[v72];
end;
v33.UpdateTeleportId = function(v73) --[[ Line: 175 ]] --[[ Name: UpdateTeleportId ]]
    -- upvalues: v48 (copy), l_Workspace_0 (copy), v33 (copy)
    local v74 = tick();
    v48[v73] = v74;
    if v73.Parent ~= l_Workspace_0.Live then
        task.delay(5, function() --[[ Line: 181 ]]
            -- upvalues: v74 (copy), v48 (ref), v73 (copy)
            if v74 ~= v48[v73] then
                return;
            else
                v48[v73] = nil;
                return;
            end;
        end);
    end;
    return v33.GetTeleportId(v73);
end;
if l_RunService_0:IsClient() then
    l_Workspace_0.Live.ChildRemoved:Connect(function(v75) --[[ Line: 191 ]]
        -- upvalues: v48 (copy)
        v48[v75] = nil;
    end);
end;
v33.TeleportModel = function(v76) --[[ Line: 196 ]] --[[ Name: TeleportModel ]]
    -- upvalues: v48 (copy)
    local l_Character_0 = v76.Character;
    local l_TargetCFrame_0 = v76.TargetCFrame;
    local l_TeleportId_0 = v76.TeleportId;
    if l_TeleportId_0 == 0 then
        return;
    elseif v48[l_Character_0] ~= l_TeleportId_0 then
        return;
    elseif l_TargetCFrame_0 ~= l_TargetCFrame_0 then
        return;
    else
        l_Character_0:SetPrimaryPartCFrame(l_TargetCFrame_0);
        return;
    end;
end;
local l_Workspace_1 = game:GetService("Workspace");
v33.GetPartsToHide = function(v81, v82, v83) --[[ Line: 219 ]] --[[ Name: GetPartsToHide ]]
    -- upvalues: l_Workspace_1 (copy)
    local v84 = {};
    local v85 = {};
    v83 = v83 or 350;
    local v86 = {};
    local v87 = {};
    for _, v89 in ipairs(v82) do
        if typeof(v89) == "Instance" then
            v87[v89] = true;
        else
            v86[tostring(v89)] = true;
        end;
    end;
    local function _(v90) --[[ Line: 238 ]] --[[ Name: isBlacklisted ]]
        -- upvalues: v87 (copy), v86 (copy)
        if v87[v90] then
            return true;
        else
            local l_Parent_0 = v90.Parent;
            while true do
                if l_Parent_0 then
                    if v87[l_Parent_0] then
                        return true;
                    else
                        l_Parent_0 = l_Parent_0.Parent;
                    end;
                else
                    return v86[v90.Name] == true;
                end;
            end;
        end;
    end;
    for _, v94 in ipairs(l_Workspace_1:GetChildren()) do
        local v95;
        if v87[v94] then
            v95 = true;
        else
            local l_Parent_1 = v94.Parent;
            while true do
                if l_Parent_1 then
                    if v87[l_Parent_1] then
                        v95 = true;
                        break;
                    else
                        l_Parent_1 = l_Parent_1.Parent;
                    end;
                else
                    v95 = v86[v94.Name] == true;
                    break;
                end;
            end;
        end;
        if not v95 then
            if v94:IsA("BasePart") and v94.LocalTransparencyModifier < 1000 then
                table.insert(v84, v94);
            end;
            for _, v98 in ipairs(v94:GetDescendants()) do
                local v99;
                if v87[v98] then
                    v99 = true;
                else
                    local l_Parent_2 = v98.Parent;
                    while true do
                        if l_Parent_2 then
                            if v87[l_Parent_2] then
                                v99 = true;
                                break;
                            else
                                l_Parent_2 = l_Parent_2.Parent;
                            end;
                        else
                            v99 = v86[v98.Name] == true;
                            break;
                        end;
                    end;
                end;
                if not v99 then
                    if v98:IsA("BasePart") then
                        if v98.LocalTransparencyModifier < 1000 and (v98.Position - v81.PrimaryPart.Position).Magnitude <= v83 then
                            table.insert(v84, v98);
                        end;
                    elseif v98:IsA("Decal") then
                        if v98.LocalTransparencyModifier < 1 then
                            table.insert(v84, v98);
                        end;
                    elseif (v98:IsA("SurfaceGui") or v98:IsA("Beam") or v98:IsA("BillboardGui") or v98:IsA("ParticleEmitter")) and v98.Enabled then
                        table.insert(v85, v98);
                    end;
                end;
            end;
        end;
    end;
    return v84, v85;
end;
v33.GetAtmosphere = function() --[[ Line: 290 ]] --[[ Name: GetAtmosphere ]]
    -- upvalues: l_Lighting_0 (copy)
    local l_Atmosphere_0 = l_Lighting_0:FindFirstChildWhichIsA("Atmosphere");
    if not l_Atmosphere_0 then
        for _, v103 in l_Lighting_0:GetChildren() do
            if v103.Name == "CachedAtmosphere" then
                l_Atmosphere_0 = v103:FindFirstChildWhichIsA("Atmosphere");
                l_Atmosphere_0.Parent = l_Lighting_0;
                v103.Parent.CachedAtmosphere:Destroy();
                break;
            end;
        end;
    end;
    if not l_Atmosphere_0 and not l_Lighting_0:FindFirstChild("CachedAtmosphere") then
        l_Atmosphere_0 = Instance.new("Atmosphere");
        task.delay(30, function() --[[ Line: 312 ]]
            -- upvalues: l_Atmosphere_0 (ref)
            if l_Atmosphere_0 then
                l_Atmosphere_0:Destroy();
            end;
        end);
    end;
    return l_Atmosphere_0;
end;
local v104 = {};
l_Workspace_1.Live.ChildRemoved:Connect(function(v105) --[[ Line: 321 ]]
    -- upvalues: l_Workspace_1 (copy), v104 (copy)
    task.wait(0.1);
    if v105 and v105.Parent == l_Workspace_1.Live then
        return;
    else
        v104[v105] = nil;
        return;
    end;
end);
ResetCutsceneStatesForCharacter = function(v106) --[[ Line: 329 ]] --[[ Name: ResetCutsceneStatesForCharacter ]]
    -- upvalues: v33 (copy)
    if not v106 then
        return;
    else
        local v107 = GetOccupied(v106);
        if not v107 then
            return;
        else
            local v108 = GetCharacterData(v106);
            if not v108 then
                return;
            else
                for v109, v110 in {
                    Stunned = false, 
                    StopRotate = false, 
                    FaceAnyways = false, 
                    Target = Vector3.new()
                } do
                    local l_v107_FirstChild_0 = v107:FindFirstChild(v109);
                    if l_v107_FirstChild_0 then
                        l_v107_FirstChild_0.Value = v110;
                    end;
                end;
                for v112, v113 in {
                    CanWalk = true
                } do
                    local l_v108_FirstChild_0 = v108:FindFirstChild(v112);
                    if l_v108_FirstChild_0 then
                        l_v108_FirstChild_0.Value = v113;
                    end;
                end;
                if not v106:GetAttribute("CurrentEmote") then
                    v107.LerpMult.Value = 0;
                end;
                v106.PrimaryPart.Anchored = false;
                v33.SetTransparency(v106, 0);
                for _, v116 in v33.GetWeldCharacter(v106):GetDescendants() do
                    if v116.Name == "UnusualParticle" then
                        v116.Enabled = true;
                    end;
                end;
                return;
            end;
        end;
    end;
end;
ResetStatesAfterCutscene = function(v117) --[[ Line: 377 ]] --[[ Name: ResetStatesAfterCutscene ]]
    -- upvalues: v104 (copy), l_LocalPlayer_0 (copy), l_TweenService_0 (copy)
    local l_LocalId_0 = v117.LocalId;
    local l_Character_1 = v117.Character;
    local v120 = v104[l_Character_1] == l_LocalId_0;
    local v121 = l_LocalPlayer_0.Character == l_Character_1;
    if v117.ColorCorrection and v121 and v120 then
        l_TweenService_0:Create(v117.ColorCorrection, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), v117.DefaultColorSettings):Play();
    end;
    if l_Character_1 and v120 then
        ResetCutsceneStatesForCharacter(l_Character_1);
        v104[v117.Character] = nil;
    end;
end;
v33.Ultimate = function(v122) --[[ Line: 394 ]] --[[ Name: Ultimate ]]
    -- upvalues: l_Workspace_1 (copy), v104 (copy), l_Styles_0 (copy), v33 (copy), l_RunService_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy), l_Places_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_Assets_0 (copy), l_AnimHelper_0 (copy)
    local v123 = {
        TableName = v122[2], 
        Character = v122[3], 
        Victim = v122[4], 
        StartCFrame = v122[5], 
        VictimCFrame = v122[6]
    };
    if v123.Character.Parent ~= l_Workspace_1.Live then
        return;
    else
        local v124 = tick();
        v104[v123.Character] = v124;
        v104[v123.Victim] = v124;
        local v125 = l_Styles_0[GetPlayerData(v123.Character):FindFirstChild("Style").Value][v123.TableName];
        local v126 = v123.StartCFrame * (v125.StartOffset or CFrame.new());
        local v127 = v126 * (v125.Offset or CFrame.new());
        v123.StartCFrame = v126;
        v123.EndCFrame = v123.Character.PrimaryPart.CFrame;
        local l_Effect_0 = v125.Effect;
        if string.find(l_Effect_0, "Variant") then
            v123.IsVariant = true;
            l_Effect_0 = l_Effect_0:gsub("Variant", "");
        end;
        local l_FirstChild_0 = script.Ultimates:FindFirstChild(l_Effect_0);
        if not l_FirstChild_0 then
            return;
        else
            local _ = v33.UpdateTeleportId(v123.Victim);
            local _ = v33.UpdateTeleportId(v123.Character);
            v123.TeleportId = 0;
            v123.Offset = v125.Offset;
            if v125.CentreOffset then
                local l_Value_0 = GetCharacterData(v123.Character).Centre.Value;
                if l_Value_0 then
                    local l_Main_1 = l_Value_0.Parent.Parent.Hitboxes.Main;
                    local v134 = l_Main_1.Position.Y + l_Main_1.Size.Y / 2;
                    v126 = l_Value_0.CFrame * v125.CentreOffset * CFrame.new(0, v134 + 1.8, 0);
                    v127 = v126 * (v125.Offset or CFrame.new());
                end;
                v123.StartCFrame_Offset = v126;
                v123.VictimCFrame_Offset = v127;
            end;
            if v125.RenderSameCFrame then
                task.delay(v125.RenderSameCFrame, function() --[[ Line: 458 ]]
                    -- upvalues: v125 (copy), l_RunService_0 (ref), v123 (copy), v126 (ref)
                    if v125.RenderSameCFrame < 0 then
                        return;
                    else
                        local v135 = nil;
                        v135 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 462 ]]
                            -- upvalues: v123 (ref), v135 (ref), v126 (ref)
                            if not v123.Character or v123.Character.Parent ~= workspace.Live or not v123.Victim or v123.Victim.Parent ~= workspace.Live then
                                if v135 then
                                    v135:Disconnect();
                                end;
                                return;
                            else
                                v123.Character.PrimaryPart.Anchored = true;
                                v123.Victim.PrimaryPart.Anchored = true;
                                task.wait(0.016666666666666666);
                                v123.Character:PivotTo(v126);
                                v123.Victim:PivotTo(v126 * CFrame.new(0, 0, 0.01));
                                return;
                            end;
                        end);
                        task.wait(v125.RenderHoldTime or 1);
                        if v135 then
                            v135:Disconnect();
                        end;
                        return;
                    end;
                end);
            else
                task.delay(1, function() --[[ Line: 482 ]]
                    -- upvalues: l_Workspace_1 (ref), v123 (copy), v126 (ref), v127 (ref), v104 (ref), v124 (copy), l_SimulateKnockbackBE_0 (ref)
                    local l_l_Workspace_1_ServerTimeNow_0 = l_Workspace_1:GetServerTimeNow();
                    local v137 = {
                        Victim = v123.Character, 
                        LookVector = v126.LookVector, 
                        EndPosition = v126.Position, 
                        VictimPosition = v126.Position, 
                        StartTime = l_l_Workspace_1_ServerTimeNow_0, 
                        TargetTime = 0.016666666666666666, 
                        HitIndex = 10
                    };
                    local v138 = {
                        Victim = v123.Victim, 
                        LookVector = v127.LookVector, 
                        EndPosition = v127.Position, 
                        VictimPosition = v127.Position, 
                        StartTime = l_l_Workspace_1_ServerTimeNow_0, 
                        TargetTime = 0.016666666666666666, 
                        HitIndex = 10
                    };
                    local v139 = tick();
                    while true do
                        if tick() - v139 < 1.5 then
                            if v104[v123.Character] ~= v124 then
                                return;
                            else
                                l_SimulateKnockbackBE_0:Fire(v137);
                                task.wait(0.1);
                                if v104[v123.Victim] ~= v124 then
                                    return;
                                else
                                    l_SimulateKnockbackBE_0:Fire(v138);
                                    task.wait(0.1);
                                end;
                            end;
                        else
                            return;
                        end;
                    end;
                end);
            end;
            local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
            local v141 = {
                Brightness = l_ColorCorrection_1.Brightness, 
                Contrast = l_ColorCorrection_1.Contrast, 
                Saturation = l_ColorCorrection_1.Saturation
            };
            local v142 = GetPlayerData(v123.Character);
            local v143 = v142 and v142.UltimateSounds.Value;
            if v143 and string.len(v143) > 0 then
                local v144 = {};
                for v145 in v143:gmatch("(.-),") do
                    table.insert(v144, v145);
                end;
                local v146 = v144[math.random(1, #v144)];
                local v147 = l_SoundHelper_0:PlaySound({
                    Name = "Ultimate", 
                    SoundId = v146, 
                    Parent = v123.Character, 
                    Speed = 1, 
                    Volume = 0.25
                });
                local l_v147_0 = v147 --[[ copy: 20 -> 29 ]];
                task.delay(2, function() --[[ Line: 548 ]]
                    -- upvalues: l_v147_0 (copy), l_TweenService_0 (ref)
                    if not l_v147_0 then
                        return;
                    else
                        l_TweenService_0:Create(l_v147_0, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            Volume = 0
                        }):Play();
                        return;
                    end;
                end);
                local l_Value_1 = v142.UltimateImages.Value;
                if l_Value_1 and string.len(l_Value_1) > 0 and game.PlaceId ~= l_Places_0.Ranked and (not workspace.Settings.DisableImages.Value or v123.Character == l_LocalPlayer_0.Character) then
                    local v150 = {};
                    for v151 in l_Value_1:gmatch("(.-),") do
                        table.insert(v150, v151);
                    end;
                    local v152 = l_Common_0.FlashImage.Main:Clone();
                    v152.Name = "Remove";
                    v152.Image = "rbxassetid://" .. v150[math.random(1, #v150)];
                    v152.ImageTransparency = v123.Character == l_LocalPlayer_0.Character and 0.55 or 0.6;
                    v152.Parent = l_Common_0.FlashImage;
                    local l_v152_0 = v152 --[[ copy: 23 -> 30 ]];
                    task.delay(0.25, function() --[[ Line: 571 ]]
                        -- upvalues: l_TweenService_0 (ref), l_v152_0 (copy)
                        l_TweenService_0:Create(l_v152_0, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            ImageTransparency = 1
                        }):Play();
                        task.wait(2);
                        l_v152_0:Destroy();
                    end);
                end;
            else
                l_SoundHelper_0:PlaySound({
                    Name = "Ultimate", 
                    Parent = v123.Character.PrimaryPart
                });
                l_SoundHelper_0:PlaySound({
                    Name = "FlameHit1", 
                    Parent = v123.Character.PrimaryPart
                });
            end;
            local _ = l_Styles_0[v142.Style.Value];
            v123.Time = v125 and v125.Time;
            local v155 = {};
            local v156 = false;
            local v157 = GetCharacterData(v123.Character);
            local v158 = GetCharacterData(v123.Victim);
            local function v161() --[[ Line: 599 ]] --[[ Name: Reset ]]
                -- upvalues: v155 (copy), v156 (ref), v124 (copy), v123 (copy), l_ColorCorrection_1 (copy), v141 (copy)
                for _, v160 in v155 do
                    if v160 then
                        v160:Disconnect();
                    end;
                end;
                if v156 then
                    return;
                else
                    v156 = true;
                    task.wait(0.2);
                    ResetStatesAfterCutscene({
                        LocalId = v124, 
                        Character = v123.Character, 
                        ColorCorrection = l_ColorCorrection_1, 
                        DefaultColorSettings = v141
                    });
                    ResetStatesAfterCutscene({
                        LocalId = v124, 
                        Character = v123.Victim, 
                        ColorCorrection = l_ColorCorrection_1, 
                        DefaultColorSettings = v141
                    });
                    return;
                end;
            end;
            v155[#v155 + 1] = v157.Cutscene.Changed:Connect(function(v162) --[[ Line: 626 ]]
                -- upvalues: v161 (copy)
                if v162 then
                    return;
                else
                    v161();
                    return;
                end;
            end);
            v155[#v155 + 1] = v158.Cutscene.Changed:Connect(function(v163) --[[ Line: 631 ]]
                -- upvalues: v161 (copy)
                if v163 then
                    return;
                else
                    v161();
                    return;
                end;
            end);
            task.delay(1, function() --[[ Line: 636 ]]
                workspace:SetAttribute("CurrentCutscene", tick());
            end);
            for _, v165 in l_FirstChild_0:GetDescendants() do
                if v165:IsA("Sound") then
                    v165.SoundId = v165.StoredId.Value;
                end;
            end;
            local v166 = require(l_FirstChild_0);
            task.spawn(function() --[[ Line: 648 ]]
                -- upvalues: v166 (copy), l_Assets_0 (ref), l_AnimHelper_0 (ref)
                for v167, v168 in v166.Animations do
                    if string.find(v167, "Camera") then
                        local v169 = v166.CameraRig or l_Assets_0.Camera;
                        if not v169 then
                            --[[ close >= 5 ]]
                        else
                            v169 = v169:Clone();
                            v169:PivotTo(CFrame.new(0, -5000, 0));
                            if v169.PrimaryPart then
                                v169.PrimaryPart.Anchored = true;
                            end;
                            v169.Parent = workspace.Debris;
                            local v170 = nil;
                            for _, v172 in v169:GetDescendants() do
                                if v172:IsA("Animator") then
                                    v170 = v172;
                                    break;
                                end;
                            end;
                            if not v170 then
                                --[[ close >= 5 ]]
                            else
                                local v173 = {
                                    Animator = v170, 
                                    AnimId = v168
                                };
                                do
                                    local l_v169_0 = v169;
                                    task.spawn(function() --[[ Line: 677 ]]
                                        -- upvalues: l_AnimHelper_0 (ref), v173 (copy), l_v169_0 (ref)
                                        for _ = 1, 3 do
                                            l_AnimHelper_0:CreateAnim(v173);
                                            task.wait(0.1);
                                        end;
                                        task.wait(1);
                                        if l_v169_0 then
                                            l_v169_0:Destroy();
                                        end;
                                    end);
                                end;
                            end;
                        end;
                    else
                        local v176 = script.Dummy:Clone();
                        v176:PivotTo(CFrame.new(0, -5000, 0));
                        v176.PrimaryPart.Anchored = true;
                        v176.Parent = workspace.Debris;
                        local l_Humanoid_0 = v176:FindFirstChild("Humanoid");
                        local v178 = l_Humanoid_0:FindFirstChild("Animator") or l_Humanoid_0;
                        if v178 then
                            local v179 = {
                                Animator = v178, 
                                AnimId = v168, 
                                Priority = Enum.AnimationPriority.Action4, 
                                FadeIn = 0
                            };
                            task.spawn(function() --[[ Line: 703 ]]
                                -- upvalues: l_AnimHelper_0 (ref), v179 (copy), v176 (copy)
                                for _ = 1, 3 do
                                    l_AnimHelper_0:CreateAnim(v179);
                                    task.wait(0.1);
                                end;
                                task.wait(1);
                                if v176 then
                                    v176:Destroy();
                                end;
                            end);
                        end;
                    end;
                end;
            end);
            v166.Use(v123);
            workspace:SetAttribute("CurrentCutscene", nil);
            return;
        end;
    end;
end;
v33.GetEntranceMetadata = function(v181) --[[ Line: 721 ]] --[[ Name: GetEntranceMetadata ]]
    if not v181.Subeffect then
        return;
    else
        local l_FirstChild_1 = script.Entrances:FindFirstChild(v181.Subeffect);
        return l_FirstChild_1 and require(l_FirstChild_1).Metadata;
    end;
end;
v33.Entrance = function(v183) --[[ Line: 731 ]] --[[ Name: Entrance ]]
    if not v183.Subeffect then
        v183 = {
            Character = v183[2], 
            Target = v183[3], 
            IsInvolved = v183[4], 
            Subeffect = v183[5]
        };
    end;
    local l_Entrances_0 = script.Entrances;
    local v185 = l_Entrances_0:FindFirstChild(v183.Subeffect) or l_Entrances_0.RankedV1:FindFirstChild(v183.Subeffect);
    if not v185 then
        return;
    else
        workspace:SetAttribute("RingEntrance", tick());
        for _, v187 in v185:GetDescendants() do
            if v187:IsA("Sound") then
                v187.SoundId = v187.StoredId.Value;
            end;
        end;
        local v188 = require(v185);
        task.spawn(function() --[[ Line: 757 ]]
            -- upvalues: v188 (copy), v183 (ref)
            v188.Use(v183);
        end);
        print(v183.Subeffect);
        return v188;
    end;
end;
v33.HUDShakeS = function(v189) --[[ Line: 766 ]] --[[ Name: HUDShakeS ]]
    -- upvalues: v33 (copy)
    local v190 = {
        Scale = v189[2]
    };
    v33.HUDShake(v190);
end;
v33.HUDShake = function(v191) --[[ Line: 774 ]] --[[ Name: HUDShake ]]
    -- upvalues: l_Main_0 (copy), l_ReplicatedStorage_0 (copy)
    l_Main_0.MainFrame.ShakeEvent:Fire(v191);
    l_ReplicatedStorage_0.Events.GUIShake:Fire(v191);
end;
v33.CameraShakeS = function(v192) --[[ Line: 780 ]] --[[ Name: CameraShakeS ]]
    -- upvalues: v33 (copy)
    local v193 = {
        Fade = v192[2], 
        FoV = v192[3], 
        FoVMult = v192[4], 
        Preset = v192[5], 
        WaitTime = v192[6]
    };
    return v33.CameraShake(v193);
end;
local _ = require(l_ReplicatedStorage_0.Analytics);
local v195 = 1;
v33.CameraShake = function(v196) --[[ Line: 796 ]] --[[ Name: CameraShake ]]
    -- upvalues: v195 (ref), l_Workspace_1 (copy), l_camShake_0 (copy), l_CameraShaker_0 (copy)
    if not v196.Preset then
        return;
    else
        local v197 = v196.Priority or 1;
        if v197 < v195 then
            return;
        else
            v195 = v197;
            local l_FoV_0 = v196.FoV;
            if workspace:GetAttribute("NoSetFoV") then
                l_FoV_0 = nil;
            end;
            if l_FoV_0 then
                l_Workspace_1.FoVMult.Value = v196.FoVMult or 3;
                if workspace.FightCameraMode.Value ~= "" then
                    l_Workspace_1.CurrentCamera.FieldOfView = l_FoV_0 - (70 - workspace.CurrentCamera.FieldOfView);
                else
                    l_Workspace_1.CurrentCamera.FieldOfView = l_FoV_0;
                end;
            end;
            local v199 = l_camShake_0:ShakeSustain(l_CameraShaker_0.Presets[v196.Preset]);
            task.delay(v196 and v196.WaitTime or 0.1, function() --[[ Line: 821 ]]
                -- upvalues: v199 (copy), v196 (copy), v197 (copy), v195 (ref)
                v199:StartFadeOut(v196 and v196.Fade or 0.2);
                if v197 <= 1 then
                    return;
                else
                    task.wait(v196.Fade or 0.2);
                    v195 = 1;
                    return;
                end;
            end);
            return v199;
        end;
    end;
end;
GetCharacterData = function(v200) --[[ Line: 833 ]] --[[ Name: GetCharacterData ]]
    -- upvalues: l_Workspace_1 (copy)
    if not v200 then
        return;
    else
        local l_FirstChild_2 = l_Workspace_1:WaitForChild("States"):FindFirstChild(v200.Name);
        if not l_FirstChild_2 then
            return;
        else
            return l_FirstChild_2:FindFirstChild("CharacterData");
        end;
    end;
end;
GetPlayerData = function(v202) --[[ Line: 841 ]] --[[ Name: GetPlayerData ]]
    -- upvalues: l_Workspace_1 (copy)
    if not v202 then
        return;
    else
        local l_FirstChild_3 = l_Workspace_1:WaitForChild("States"):FindFirstChild(v202.Name);
        if not l_FirstChild_3 then
            return;
        else
            return l_FirstChild_3:FindFirstChild("PlayerData");
        end;
    end;
end;
GetOccupied = function(v204) --[[ Line: 849 ]] --[[ Name: GetOccupied ]]
    -- upvalues: l_Workspace_1 (copy)
    if not v204 then
        return;
    else
        local l_FirstChild_4 = l_Workspace_1:WaitForChild("States"):FindFirstChild(v204.Name);
        if not l_FirstChild_4 then
            return;
        else
            return l_FirstChild_4:FindFirstChild("Occupied");
        end;
    end;
end;
deepcopy = function(v206) --[[ Line: 857 ]] --[[ Name: deepcopy ]]
    local v207 = type(v206);
    local v208 = nil;
    if v207 == "table" then
        v208 = {};
        for v209, v210 in next, v206 do
            v208[deepcopy(v209)] = deepcopy(v210);
        end;
        setmetatable(v208, deepcopy((getmetatable(v206))));
        return v208;
    else
        return v206;
    end;
end;
v33.PlayAura = function(v211) --[[ Line: 872 ]] --[[ Name: PlayAura ]]
    local v212 = {
        Character = v211[2], 
        AuraName = v211[3]
    };
    local l_Character_2 = v212.Character;
    local l_script_FirstChild_0 = script:FindFirstChild(v212.AuraName);
    if not l_script_FirstChild_0 then
        return;
    else
        local v215 = {};
        local v216 = {
            "UpperTorso", 
            "LowerTorso", 
            "LeftHand", 
            "RightHand", 
            "LeftLowerArm", 
            "RightLowerArm"
        };
        for _, v218 in l_Character_2:GetChildren() do
            if table.find(v216, v218.Name) and v218:IsA("BasePart") and v218.Transparency ~= 1 then
                for _, v220 in l_script_FirstChild_0:GetChildren() do
                    if v220:IsA("ParticleEmitter") then
                        local v221 = v220:Clone();
                        v221.Enabled = false;
                        v221.Parent = v218;
                        v221:Emit(2);
                        table.insert(v215, v221);
                    end;
                end;
            end;
        end;
        task.wait(5);
        for _, v223 in v215 do
            v223:Destroy();
        end;
        return;
    end;
end;
EmitParticle = function(v224, v225) --[[ Line: 913 ]] --[[ Name: EmitParticle ]]
    task.delay(v224:GetAttribute("EmitDelay") or 0, function() --[[ Line: 914 ]]
        -- upvalues: v224 (copy), v225 (copy)
        v224:Emit(v224:GetAttribute("EmitCount") or 0);
        v224.Enabled = false;
        task.wait(v225 or 5);
        if v224 then
            v224:Destroy();
        end;
    end);
end;
v33.HawkAura = function(v226) --[[ Line: 923 ]] --[[ Name: HawkAura ]]
    -- upvalues: l_SoundHelper_0 (copy), v33 (copy)
    local v227 = v226[2];
    local v228 = v226[3];
    local v229 = nil;
    if v228 == "Hawk" then
        v229 = script.HawkAura;
        l_SoundHelper_0:PlaySound({
            Name = "Heartbeat", 
            Parent = v227.PrimaryPart
        });
    elseif v228 == "Hawk2" then
        v229 = script.Hawk2Aura;
        l_SoundHelper_0:PlaySound({
            Name = "Heartbeat2", 
            Parent = v227.PrimaryPart
        });
        l_SoundHelper_0:PlaySound({
            Name = "DeepImpact", 
            Parent = v227.PrimaryPart
        });
    elseif v228 == "Hawk3" then
        v229 = script.Hawk3Aura;
        l_SoundHelper_0:PlaySound({
            Name = "Heartbeat2", 
            Parent = v227.PrimaryPart
        });
        l_SoundHelper_0:PlaySound({
            Name = "DeepImpact", 
            Parent = v227.PrimaryPart
        });
        l_SoundHelper_0:PlaySound({
            Name = "Snarl", 
            Parent = v227.PrimaryPart
        });
    end;
    if not v229 then
        return;
    else
        for _, v231 in (v229:GetChildren()) do
            local v232 = v231:Clone();
            v232.Parent = v33.GetWeldCharacter(v227).PrimaryPart;
            if v232:IsA("ParticleEmitter") then
                EmitParticle(v232);
            elseif v232:IsA("Attachment") then
                for _, v234 in (v232:GetChildren()) do
                    EmitParticle(v234);
                end;
            end;
        end;
        return;
    end;
end;
v33.FreedomAura = function(v235) --[[ Line: 992 ]] --[[ Name: FreedomAura ]]
    -- upvalues: l_SoundHelper_0 (copy), v33 (copy)
    local v236 = v235[2];
    local v237 = v235[3];
    local l_FreedomAura_0 = script.FreedomAura;
    if not l_FreedomAura_0 then
        return;
    else
        local v239 = {
            Color3.fromRGB(91, 180, 49), 
            Color3.fromRGB(155, 206, 72)
        };
        if v237 == "Smash" then
            v239 = {
                Color3.fromRGB(206, 49, 49), 
                Color3.fromRGB(255, 24, 28)
            };
        elseif v237 == "Hitman" then
            v239 = {
                Color3.fromRGB(163, 54, 206), 
                Color3.fromRGB(114, 48, 206)
            };
        end;
        l_SoundHelper_0:PlaySound({
            Name = "FreedomSwitch", 
            Parent = v236.PrimaryPart
        });
        for _, v241 in (l_FreedomAura_0:GetChildren()) do
            local v242 = v241:Clone();
            v242.Parent = v33.GetWeldCharacter(v236).PrimaryPart;
            if v242:IsA("ParticleEmitter") then
                v242.Color = ColorSequence.new(v239[math.random(1, #v239)]);
                EmitParticle(v242);
            elseif v242:IsA("Attachment") then
                for _, v244 in (v242:GetChildren()) do
                    v244.Color = ColorSequence.new(v239[math.random(1, #v239)]);
                    EmitParticle(v244);
                end;
            end;
        end;
        return;
    end;
end;
v33.AttackTrail = function(v245) --[[ Line: 1035 ]] --[[ Name: AttackTrail ]]
    -- upvalues: l_Workspace_1 (copy), v33 (copy), l_TweenService_0 (copy)
    if not v245.TrailInfo then
        v245 = {
            Character = v245[2], 
            TrailInfo = {
                TrailName = v245[3], 
                TargetPart = v245[4], 
                DelayTime = v245[5], 
                HoldTime = v245[6], 
                TimeScale = v245[7]
            }
        };
    end;
    local l_FirstChild_5 = l_Workspace_1.Welds:FindFirstChild(v245.Character.Name);
    local v247 = l_FirstChild_5 and l_FirstChild_5:FindFirstChild("WeldCharacter") or v245.Character;
    if not v247 then
        return;
    elseif v245.Character.Parent ~= l_Workspace_1.Live then
        return;
    else
        local l_TrailInfo_0 = v245.TrailInfo;
        local l_HoldTime_0 = l_TrailInfo_0.HoldTime;
        local l_DelayTime_0 = l_TrailInfo_0.DelayTime;
        local l_TargetPart_0 = l_TrailInfo_0.TargetPart;
        if type(l_TargetPart_0) == "table" then
            for _, v253 in l_TargetPart_0 do
                task.defer(function() --[[ Line: 1063 ]]
                    -- upvalues: v245 (ref), v253 (copy), v33 (ref)
                    local v254 = deepcopy(v245);
                    v254.TrailInfo.TargetPart = v253;
                    v33.AttackTrail(v254);
                end);
            end;
            return;
        else
            local l_v247_FirstChild_0 = v247:FindFirstChild(l_TargetPart_0);
            if not l_v247_FirstChild_0 then
                return;
            else
                local v256 = l_TrailInfo_0.TrailName or "Default";
                local l_FirstChild_6 = script.Trails:FindFirstChild(v256);
                if not l_FirstChild_6 then
                    return;
                else
                    local v258 = l_FirstChild_6.Attachment0:Clone();
                    local v259 = l_FirstChild_6.Attachment1:Clone();
                    local l_ParticleAttach_0 = l_FirstChild_6:FindFirstChild("ParticleAttach");
                    if l_ParticleAttach_0 then
                        l_ParticleAttach_0 = l_ParticleAttach_0:Clone();
                        l_ParticleAttach_0.Parent = l_v247_FirstChild_0;
                        for _, v262 in l_ParticleAttach_0:GetChildren() do
                            v262:Emit(v262:GetAttribute("EmitCount"));
                        end;
                    end;
                    task.wait(l_DelayTime_0);
                    v258.Parent = l_v247_FirstChild_0;
                    v259.Parent = l_v247_FirstChild_0;
                    v258.Name = "FeintDelete";
                    v259.Name = "FeintDelete";
                    for _, v264 in v258:GetChildren() do
                        if v264:IsA("Trail") then
                            v264.Attachment0 = v258;
                            v264.Attachment1 = v259;
                            local v265 = v264.Lifetime * (l_TrailInfo_0.TimeScale or 1);
                            v264.Lifetime = 0;
                            l_TweenService_0:Create(v264, TweenInfo.new(l_HoldTime_0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Lifetime = v265
                            }):Play();
                        end;
                    end;
                    task.wait(l_HoldTime_0);
                    for _, v267 in v258:GetChildren() do
                        if v267:IsA("Trail") then
                            v267.Enabled = false;
                        end;
                    end;
                    if l_ParticleAttach_0 then
                        for _, v269 in l_ParticleAttach_0:GetChildren() do
                            v269.Enabled = false;
                        end;
                    end;
                    task.wait(3);
                    if l_ParticleAttach_0 then
                        l_ParticleAttach_0:Destroy();
                    end;
                    v258:Destroy();
                    v259:Destroy();
                    return;
                end;
            end;
        end;
    end;
end;
v33.HitMain = function(v270) --[[ Line: 1134 ]] --[[ Name: HitMain ]]
    -- upvalues: l_Workspace_1 (copy)
    local v271 = {
        Character = v270[2], 
        SetCFrame = v270[3], 
        Damager = v270[4], 
        TargetPart = v270[5]
    };
    local l_Character_3 = v271.Character;
    local l_SetCFrame_0 = v271.SetCFrame;
    local l_Damager_1 = v271.Damager;
    if l_Character_3.Parent ~= l_Workspace_1.Live then
        return;
    else
        local l_TargetPart_1 = v271.TargetPart;
        local v276 = "Right";
        if l_TargetPart_1 and string.find(l_TargetPart_1, "Left") then
            v276 = "Left";
        end;
        local l_FirstChild_7 = workspace.Welds:FindFirstChild(l_Damager_1.Name);
        local v278 = l_FirstChild_7 and l_FirstChild_7:FindFirstChild("WeldCharacter");
        local v279 = v278 and v278:FindFirstChild("GloveModel" .. v276);
        local v280 = v279 and v279:FindFirstChild("Effect");
        if v280 then
            v280 = script.Unusuals.HitMain:FindFirstChild(v280.Value);
        end;
        if not v280 then
            v280 = script.HitMain;
        end;
        v280 = v280:Clone();
        v280.CFrame = l_SetCFrame_0;
        v280.Name = l_Damager_1.Name .. "Hit";
        v280.Parent = l_Workspace_1.Debris;
        for _, v282 in v280.Particle:GetChildren() do
            v282.Enabled = false;
            v282:Emit(1);
        end;
        task.wait(5);
        v280:Destroy();
        return;
    end;
end;
v33.HeavyMain = function(v283) --[[ Line: 1186 ]] --[[ Name: HeavyMain ]]
    -- upvalues: l_Workspace_1 (copy)
    local v284 = {
        Character = v283[2], 
        SetCFrame = v283[3], 
        Damager = v283[4], 
        TargetPart = v283[5]
    };
    local l_Character_4 = v284.Character;
    local l_SetCFrame_1 = v284.SetCFrame;
    local l_Damager_2 = v284.Damager;
    if l_Character_4.Parent ~= l_Workspace_1.Live then
        return;
    else
        local l_TargetPart_2 = v284.TargetPart;
        local v289 = "Right";
        if l_TargetPart_2 and string.find(l_TargetPart_2, "Left") then
            v289 = "Left";
        end;
        local l_FirstChild_8 = workspace.Welds:FindFirstChild(l_Damager_2.Name);
        local v291 = l_FirstChild_8 and l_FirstChild_8:FindFirstChild("WeldCharacter");
        local v292 = v291 and v291:FindFirstChild("GloveModel" .. v289);
        local v293 = v292 and v292:FindFirstChild("Effect");
        if v293 then
            v293 = script.Unusuals.HeavyMain:FindFirstChild(v293.Value);
        end;
        if not v293 then
            v293 = script.HeavyMain;
        end;
        v293 = v293:Clone();
        v293.CFrame = l_SetCFrame_1;
        v293.Name = l_Damager_2.Name .. "Hit";
        v293.Parent = l_Workspace_1.Debris;
        for _, v295 in v293.Particle:GetChildren() do
            v295.Enabled = false;
            v295:Emit(v295:GetAttribute("EmitCount") or 1);
        end;
        if v293:FindFirstChild("Extra") then
            for _, v297 in v293.Extra:GetChildren() do
                v297.Enabled = false;
                task.delay(v297:GetAttribute("EmitDelay") or 0, function() --[[ Line: 1240 ]]
                    -- upvalues: v297 (copy)
                    v297:Emit(v297:GetAttribute("EmitCount"));
                end);
            end;
        end;
        task.wait(5);
        v293:Destroy();
        return;
    end;
end;
v33.GhostMain = function(v298) --[[ Line: 1250 ]] --[[ Name: GhostMain ]]
    -- upvalues: l_Workspace_1 (copy)
    local v299 = {
        Character = v298[2], 
        SetCFrame = v298[3]
    };
    local _ = v299.Character;
    local l_SetCFrame_2 = v299.SetCFrame;
    local v302 = script.GhostMain:Clone();
    v302.CFrame = l_SetCFrame_2;
    v302.Parent = l_Workspace_1.Debris;
    for _, v304 in v302.Particle:GetChildren() do
        v304.Enabled = false;
        task.delay(v304:GetAttribute("EmitDelay") or 0, function() --[[ Line: 1266 ]]
            -- upvalues: v304 (copy)
            v304:Emit(v304:GetAttribute("EmitCount"));
        end);
    end;
    for _, v306 in v302.Extra:GetChildren() do
        v306.Enabled = false;
        task.delay(v306:GetAttribute("EmitDelay") or 0, function() --[[ Line: 1274 ]]
            -- upvalues: v306 (copy)
            v306:Emit(v306:GetAttribute("EmitCount"));
        end);
    end;
    task.wait(5);
    v302:Destroy();
end;
v33.SmashPunch = function(v307) --[[ Line: 1283 ]] --[[ Name: SmashPunch ]]
    -- upvalues: l_Workspace_1 (copy)
    local v308 = {
        Character = v307[2], 
        EffectDelay = v307[3]
    };
    local l_Character_6 = v308.Character;
    local l_EffectDelay_0 = v308.EffectDelay;
    local v311 = GetCharacterData(l_Character_6);
    if not v311 then
        return;
    else
        local l_FirstChild_9 = l_Workspace_1.Welds:FindFirstChild(v308.Character.Name);
        local v313 = l_FirstChild_9 and l_FirstChild_9:FindFirstChild("WeldCharacter") or v308.Character;
        if not v313 then
            return;
        else
            local v314 = nil;
            local v315 = false;
            v314 = v311.Stunned.Changed:Connect(function(v316) --[[ Line: 1302 ]]
                -- upvalues: v315 (ref)
                if v316 then
                    v315 = true;
                end;
            end);
            task.wait(l_EffectDelay_0);
            v314:Disconnect();
            if v315 then
                return;
            else
                local v317 = script.SmashPunch:Clone();
                local l_Particle_0 = v317.Particle;
                l_Particle_0.Parent = v307.IsRight and v313.RightHand or v313.LeftHand;
                for _, v320 in l_Particle_0:GetChildren() do
                    v320.Enabled = false;
                    v320:Emit(v320:GetAttribute("EmitCount"));
                end;
                task.wait(5);
                v317:Destroy();
                return;
            end;
        end;
    end;
end;
v33.SmashPunchRight = function(v321) --[[ Line: 1328 ]] --[[ Name: SmashPunchRight ]]
    -- upvalues: v33 (copy)
    v321.IsRight = true;
    v33.SmashPunch(v321);
end;
v33.GhostJab = function(v322) --[[ Line: 1333 ]] --[[ Name: GhostJab ]]
    -- upvalues: l_Workspace_1 (copy), l_LocalPlayer_0 (copy)
    local v323 = {
        Character = v322[2], 
        EffectDelay = v322[3]
    };
    local l_Character_7 = v323.Character;
    local l_EffectDelay_1 = v323.EffectDelay;
    local v326 = GetCharacterData(l_Character_7);
    if not v326 then
        return;
    else
        local l_FirstChild_10 = l_Workspace_1.Welds:FindFirstChild(v323.Character.Name);
        local v328 = l_FirstChild_10 and l_FirstChild_10:FindFirstChild("WeldCharacter") or v323.Character;
        if not v328 then
            return;
        else
            local v329 = nil;
            local v330 = false;
            v329 = v326.Stunned.Changed:Connect(function(v331) --[[ Line: 1352 ]]
                -- upvalues: v330 (ref)
                if v331 then
                    v330 = true;
                end;
            end);
            if v323.Character ~= l_LocalPlayer_0.Character then
                l_EffectDelay_1 = l_EffectDelay_1 + 0.15;
            end;
            task.wait(l_EffectDelay_1);
            v329:Disconnect();
            if v330 then
                return;
            else
                local v332 = script.GhostJab:Clone();
                v332.Parent = game.Workspace.Debris;
                v332.CFrame = v328.LeftLowerArm.CFrame;
                for _, v334 in v332.Short:GetChildren() do
                    v334.Enabled = false;
                    v334:Emit(v334:GetAttribute("EmitCount"));
                end;
                for _, v336 in v332.Long:GetChildren() do
                    v336.Enabled = false;
                    v336:Emit(v336:GetAttribute("EmitCount"));
                end;
                task.wait(5);
                v332:Destroy();
                return;
            end;
        end;
    end;
end;
v33.GhostJabRightHand = function(v337) --[[ Line: 1385 ]] --[[ Name: GhostJabRightHand ]]
    -- upvalues: l_Workspace_1 (copy), l_LocalPlayer_0 (copy)
    local v338 = {
        Character = v337[2], 
        EffectDelay = v337[3]
    };
    local l_Character_8 = v338.Character;
    local l_EffectDelay_2 = v338.EffectDelay;
    local v341 = GetCharacterData(l_Character_8);
    if not v341 then
        return;
    else
        local l_FirstChild_11 = l_Workspace_1.Welds:FindFirstChild(v338.Character.Name);
        local v343 = l_FirstChild_11 and l_FirstChild_11:FindFirstChild("WeldCharacter") or v338.Character;
        if not v343 then
            return;
        else
            local v344 = nil;
            local v345 = false;
            v344 = v341.Stunned.Changed:Connect(function(v346) --[[ Line: 1404 ]]
                -- upvalues: v345 (ref)
                if v346 then
                    v345 = true;
                end;
            end);
            if v338.Character ~= l_LocalPlayer_0.Character then
                l_EffectDelay_2 = l_EffectDelay_2 + 0.15;
            end;
            task.wait(l_EffectDelay_2);
            v344:Disconnect();
            if v345 then
                return;
            else
                local v347 = script.GhostJab:Clone();
                v347.Parent = game.Workspace.Debris;
                v347.CFrame = v343.RightLowerArm.CFrame;
                for _, v349 in v347.Short:GetChildren() do
                    v349.Enabled = false;
                    v349:Emit(v349:GetAttribute("EmitCount"));
                end;
                for _, v351 in v347.Long:GetChildren() do
                    v351.Enabled = false;
                    v351:Emit(v351:GetAttribute("EmitCount"));
                end;
                task.wait(5);
                v347:Destroy();
                return;
            end;
        end;
    end;
end;
v33.BulletJab = function(v352) --[[ Line: 1439 ]] --[[ Name: BulletJab ]]
    -- upvalues: l_Workspace_1 (copy), l_LocalPlayer_0 (copy)
    local v353 = {
        Character = v352[2], 
        EffectDelay = v352[3]
    };
    local l_Character_9 = v353.Character;
    local l_EffectDelay_3 = v353.EffectDelay;
    local v356 = GetCharacterData(l_Character_9);
    if not v356 then
        return;
    else
        local l_FirstChild_12 = l_Workspace_1.Welds:FindFirstChild(v353.Character.Name);
        local v358 = l_FirstChild_12 and l_FirstChild_12:FindFirstChild("WeldCharacter") or v353.Character;
        if not v358 then
            return;
        else
            local v359 = nil;
            local v360 = false;
            v359 = v356.Stunned.Changed:Connect(function(v361) --[[ Line: 1458 ]]
                -- upvalues: v360 (ref)
                if v361 then
                    v360 = true;
                end;
            end);
            if v353.Character ~= l_LocalPlayer_0.Character then
                l_EffectDelay_3 = l_EffectDelay_3 + 0.1;
            end;
            task.wait(l_EffectDelay_3);
            v359:Disconnect();
            if v360 then
                return;
            else
                local v362 = script.BulletJab:Clone();
                v362.Parent = game.Workspace.Debris;
                v362.CFrame = v358.LeftLowerArm.CFrame * CFrame.new(0, -1, 0);
                for _, v364 in v362.Short:GetChildren() do
                    v364.Enabled = false;
                    v364:Emit(v364:GetAttribute("EmitCount"));
                end;
                for _, v366 in v362.Long:GetChildren() do
                    v366.Enabled = false;
                    v366:Emit(v366:GetAttribute("EmitCount"));
                end;
                task.wait(5);
                v362:Destroy();
                return;
            end;
        end;
    end;
end;
v33.Corkscrew = function(v367) --[[ Line: 1492 ]] --[[ Name: Corkscrew ]]
    -- upvalues: l_Workspace_1 (copy), l_SoundHelper_0 (copy), v33 (copy)
    local v368 = {
        Character = v367[2], 
        EffectDelay = v367[3]
    };
    local l_Character_10 = v368.Character;
    local l_EffectDelay_4 = v368.EffectDelay;
    local v371 = GetCharacterData(l_Character_10);
    if not v371 then
        return;
    else
        local l_FirstChild_13 = l_Workspace_1.Welds:FindFirstChild(v368.Character.Name);
        local v373 = l_FirstChild_13 and l_FirstChild_13:FindFirstChild("WeldCharacter") or v368.Character;
        if not v373 then
            return;
        else
            local v374 = nil;
            local v375 = false;
            v374 = v371.Stunned.Changed:Connect(function(v376) --[[ Line: 1511 ]]
                -- upvalues: v375 (ref)
                if v376 then
                    v375 = true;
                end;
            end);
            task.delay(l_EffectDelay_4 * 0.7, function() --[[ Line: 1517 ]]
                -- upvalues: v375 (ref), l_SoundHelper_0 (ref), v373 (copy)
                if v375 then
                    return;
                else
                    l_SoundHelper_0:PlaySound({
                        Name = "Corkscrew", 
                        Parent = v373.PrimaryPart, 
                        Speed = 1
                    });
                    return;
                end;
            end);
            task.wait(l_EffectDelay_4);
            v374:Disconnect();
            if v375 or v371.Stunned.Value then
                return;
            else
                local v377 = {};
                for _, v379 in script.Corkscrew:GetChildren() do
                    local v380 = v379:Clone();
                    v380.Parent = v33.GetWeldCharacter(v373).RightLowerArm;
                    table.insert(v377, v380);
                    task.delay(0.2, function() --[[ Line: 1539 ]]
                        -- upvalues: v380 (copy)
                        for _, v382 in v380:GetChildren() do
                            v382.Enabled = false;
                        end;
                    end);
                end;
                task.wait(5);
                for _, v384 in v377 do
                    v384:Destroy();
                end;
                return;
            end;
        end;
    end;
end;
v33.BlockMain = function(v385) --[[ Line: 1552 ]] --[[ Name: BlockMain ]]
    -- upvalues: l_Workspace_1 (copy)
    local v386 = {
        Character = v385[2], 
        SetCFrame = v385[3]
    };
    local l_Character_11 = v386.Character;
    local l_SetCFrame_3 = v386.SetCFrame;
    if l_Character_11.Parent ~= l_Workspace_1.Live then
        return;
    else
        local v389 = script.BlockMain:Clone();
        v389.CFrame = l_SetCFrame_3;
        v389.Parent = l_Workspace_1.Debris;
        for _, v391 in v389.Particle:GetChildren() do
            v391.Enabled = false;
            v391:Emit(v391:GetAttribute("EmitCount") or 1);
        end;
        task.wait(5);
        v389:Destroy();
        return;
    end;
end;
v33.BulletCounter = function(v392) --[[ Line: 1576 ]] --[[ Name: BulletCounter ]]
    -- upvalues: l_Workspace_1 (copy), l_SoundHelper_0 (copy)
    local v393 = {
        Character = v392[2], 
        SetCFrame = v392[3]
    };
    local _ = v393.Character;
    local l_SetCFrame_4 = v393.SetCFrame;
    local v396 = script.BulletCounter:Clone();
    v396.CFrame = l_SetCFrame_4;
    v396.Parent = l_Workspace_1.Debris;
    for _, v398 in v396.Particle:GetChildren() do
        v398.Enabled = false;
        v398:Emit(v398:GetAttribute("EmitCount") or 1);
    end;
    l_SoundHelper_0:PlaySound({
        Name = "StormBolt", 
        Parent = v396
    });
    task.wait(5);
    v396:Destroy();
end;
v33.IronFistLeft = function(v399) --[[ Line: 1603 ]] --[[ Name: IronFistLeft ]]
    -- upvalues: v33 (copy)
    local v400 = {
        Character = v399[2], 
        SetCFrame = v399[3]
    };
    local l_Character_13 = v400.Character;
    local _ = v400.SetCFrame;
    local v403 = script.IronFist.LeftFist:Clone();
    v403.Parent = v33.GetWeldCharacter(l_Character_13).UpperTorso;
    for _, v405 in v403:GetChildren() do
        v405.Enabled = false;
        v405:Emit(v405:GetAttribute("EmitCount") or 1);
    end;
    task.wait(5);
    v403:Destroy();
end;
v33.IronFistRight = function(v406) --[[ Line: 1624 ]] --[[ Name: IronFistRight ]]
    -- upvalues: v33 (copy)
    local v407 = {
        Character = v406[2], 
        SetCFrame = v406[3]
    };
    local l_Character_14 = v407.Character;
    local _ = v407.SetCFrame;
    local v410 = script.IronFist.RightFist:Clone();
    v410.Parent = v33.GetWeldCharacter(l_Character_14).UpperTorso;
    for _, v412 in v410:GetChildren() do
        v412.Enabled = false;
        v412:Emit(v412:GetAttribute("EmitCount") or 1);
    end;
    task.wait(5);
    v410:Destroy();
end;
v33.DashMain = function(v413) --[[ Line: 1645 ]] --[[ Name: DashMain ]]
    -- upvalues: l_LocalPlayer_0 (copy), v33 (copy), l_Styles_0 (copy), l_TweenService_0 (copy)
    local v414 = {
        Character = v413[2], 
        DashWindow = v413[3]
    };
    local v415 = {
        Step = 2, 
        MaxTime = (v414.DashWindow or 0.1) * 0.93, 
        DeleteDelay = 0.4, 
        AddTransparency = 0.97
    };
    local l_Character_15 = v414.Character;
    local v417 = 0.5;
    if l_LocalPlayer_0.Character ~= l_Character_15 then
        v415.AddTransparency = 0.96;
        v415.MaxTime = v415.MaxTime * 1.33;
        v417 = 0;
    end;
    v415.Character = l_Character_15;
    if v414.Character:GetAttribute("StartedStatic") then
        v415.Color = Color3.fromRGB(219, 72, 248);
    end;
    task.defer(function() --[[ Line: 1673 ]]
        -- upvalues: v33 (ref), v415 (copy)
        v33.AfterimageEffect(v415);
    end);
    local v418 = v33.GetWeldCharacter(v414.Character);
    if not v418 then
        return;
    else
        local v419 = GetPlayerData(v414.Character);
        if v419 then
            local v420 = l_Styles_0[v419.Style.Value];
            if v420 and v420.OnClientDash then
                local l_v420_0 = v420 --[[ copy: 7 -> 17 ]];
                task.spawn(function() --[[ Line: 1685 ]]
                    -- upvalues: l_v420_0 (copy), v414 (copy)
                    l_v420_0.OnClientDash({
                        Character = v414.Character
                    });
                end);
            end;
            local l_v420_1 = v420 --[[ copy: 7 -> 16 ]];
            task.defer(function() --[[ Line: 1692 ]]
                -- upvalues: l_v420_1 (copy), v33 (ref), v415 (copy)
                if l_v420_1 and l_v420_1.CoreInfo and l_v420_1.CoreInfo.IgnoreAfterimageOnDashes then
                    return;
                else
                    v33.AfterimageEffect(v415);
                    return;
                end;
            end);
        end;
        local v423 = l_LocalPlayer_0.Character and l_LocalPlayer_0.Character.PrimaryPart;
        local l_Magnitude_0 = (v418.PrimaryPart.Position - v423.Position).Magnitude;
        local v425 = v418 == l_LocalPlayer_0.Character;
        local v426 = false;
        if v418:GetAttribute("IsComet") then
            v426 = true;
        end;
        if not v426 then
            for _, v428 in v418:GetChildren() do
                if v428.Name == "DeleteHighlight" then
                    v428:Destroy();
                end;
            end;
            local v429 = script.DashHighlight:Clone();
            v429.Name = "DeleteHighlight";
            v429.Parent = v418;
            v429.Adornee = v414.Character;
            v429.FillTransparency = 0.85;
            v429.OutlineTransparency = 1;
            if v414.Character:GetAttribute("StartedStatic") then
                v429.OutlineColor = Color3.fromRGB(219, 72, 248);
                v429.FillColor = Color3.fromRGB(219, 72, 248);
            end;
            if l_Magnitude_0 < 10 then
                v429.DepthMode = "AlwaysOnTop";
            end;
            local v430 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
            l_TweenService_0:Create(v429, v430, {
                OutlineTransparency = v417, 
                FillTransparency = v425 and 0.85 or 0.6
            }):Play();
            local l_DashWindow_0 = v414.DashWindow;
            task.wait(l_DashWindow_0 * (v425 and 0.5 or 1.5));
            v430 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
            l_TweenService_0:Create(v429, v430, {
                OutlineTransparency = 1, 
                FillTransparency = 1
            }):Play();
            task.wait(0.5);
            if v429 then
                v429:Destroy();
            end;
        end;
        return;
    end;
end;
v33.DashHighlight = function(v432) --[[ Line: 1756 ]] --[[ Name: DashHighlight ]]
    -- upvalues: v33 (copy), l_LocalPlayer_0 (copy), l_TweenService_0 (copy)
    local v433 = {
        Character = v432[2]
    };
    local v434 = v33.GetWeldCharacter(v433.Character);
    if not v434 then
        return;
    else
        local l_DeleteHighlight_0 = v434:FindFirstChild("DeleteHighlight");
        if l_DeleteHighlight_0 then
            l_DeleteHighlight_0:Destroy();
        end;
        local v436 = script.DashHighlight:Clone();
        v436.Parent = v434;
        v436.Adornee = v433.Character;
        v436.FillTransparency = 1;
        v436.OutlineTransparency = 0.85;
        local v437 = l_LocalPlayer_0.Character and l_LocalPlayer_0.Character.PrimaryPart;
        if (v434.PrimaryPart.Position - v437.Position).Magnitude < 10 then
            v436.DepthMode = "AlwaysOnTop";
        end;
        local v438 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        l_TweenService_0:Create(v436, v438, {
            OutlineTransparency = 0, 
            FillTransparency = 0.3
        }):Play();
        task.wait(0.1);
        v438 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        l_TweenService_0:Create(v436, v438, {
            OutlineTransparency = 1, 
            FillTransparency = 1
        }):Play();
        task.wait(0.5);
        v436:Destroy();
        return;
    end;
end;
v33.RemoveHighlights = function(v439) --[[ Line: 1798 ]] --[[ Name: RemoveHighlights ]]
    -- upvalues: l_Workspace_1 (copy), l_TweenService_0 (copy)
    local v440 = {
        Character = v439[2]
    };
    local l_FirstChild_14 = l_Workspace_1.Welds:FindFirstChild(v440.Character.Name);
    local v442 = l_FirstChild_14 and l_FirstChild_14:FindFirstChild("WeldCharacter") or v440.Character;
    if not v442 then
        return;
    else
        for _, v444 in v442:GetChildren() do
            if v444:IsA("Highlight") then
                local v445 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                l_TweenService_0:Create(v444, v445, {
                    OutlineTransparency = 1, 
                    FillTransparency = 1
                }):Play();
                task.delay(2, function() --[[ Line: 1814 ]]
                    -- upvalues: v444 (copy)
                    if v444 then
                        v444:Destroy();
                    end;
                end);
            end;
        end;
        return;
    end;
end;
v33.StartupHighlight = function(v446) --[[ Line: 1820 ]] --[[ Name: StartupHighlight ]]
    -- upvalues: v33 (copy), l_Workspace_1 (copy), l_TweenService_0 (copy)
    local v447 = {
        Character = v446[2], 
        IsHeavy = v446[3], 
        IsCharge = v446[4], 
        IsUltimate = v446[5], 
        StartupScale = v446[6], 
        IsFeint = v446[7], 
        HoldIndefinitely = v446[8]
    };
    local v448 = v33.GetWeldCharacter(v447.Character);
    if not v448 then
        return;
    else
        local l_StartupHighlight_0 = script.StartupHighlight;
        if v447.IsUltimate then
            l_StartupHighlight_0 = script.UltimateHighlight;
            v447.IsHeavy = true;
        end;
        l_StartupHighlight_0 = l_StartupHighlight_0:Clone();
        for _, v451 in v448:GetChildren() do
            if v451:IsA("Highlight") then
                v451.Enabled = false;
            end;
        end;
        local l_Value_2 = l_Workspace_1.Settings.HighlightColor.Value;
        local v453 = Color3.fromRGB(l_Value_2.X, l_Value_2.Y, l_Value_2.Z);
        local l_IsFeint_0 = v447.IsFeint;
        if l_IsFeint_0 then
            local v455 = 255 - v453.R * 255;
            local v456 = 255 - v453.G * 255;
            local v457 = 255 - v453.B * 255;
            v453 = Color3.fromRGB(v455, v456, v457);
        end;
        if v453 ~= l_StartupHighlight_0.FillColor and not v447.IsUltimate then
            l_StartupHighlight_0.FillColor = v453;
            l_StartupHighlight_0.OutlineColor = v453;
        end;
        l_StartupHighlight_0.Parent = v448;
        l_StartupHighlight_0.Adornee = v447.Character;
        l_StartupHighlight_0.OutlineTransparency = 0.85;
        local v458 = 0.35;
        local v459 = v447.IsHeavy and 0.3 or 0.8;
        if l_IsFeint_0 then
            v459 = 0.5;
            v458 = v458 * 1.3;
        end;
        local v460 = 0;
        local l_StartupScale_0 = v447.StartupScale;
        if v448:GetAttribute("EyeDamage") then
            l_StartupScale_0 = 2;
        end;
        if l_StartupScale_0 then
            v460 = 0.8;
            v459 = v459 * l_StartupScale_0;
            if l_StartupScale_0 >= 2 then
                v459 = v459 * 1.5;
            end;
            v458 = v458 / l_StartupScale_0;
        end;
        local v462 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        l_TweenService_0:Create(l_StartupHighlight_0, v462, {
            OutlineTransparency = v460, 
            FillTransparency = v459
        }):Play();
        if v447.HoldIndefinitely then
            return l_StartupHighlight_0;
        else
            task.wait(0.1);
            v462 = TweenInfo.new(v458, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
            if v447.IsCharge then
                l_TweenService_0:Create(l_StartupHighlight_0, v462, {
                    OutlineTransparency = 0, 
                    FillTransparency = 0.7
                }):Play();
                local v463 = GetCharacterData(v447.Character);
                local v464 = v463 and v463:FindFirstChild("Stunned");
                if not v464 and l_StartupHighlight_0 then
                    l_StartupHighlight_0:Destroy();
                end;
                local v465 = nil;
                v465 = v464.Changed:Connect(function(v466) --[[ Line: 1924 ]]
                    -- upvalues: v465 (ref), l_StartupHighlight_0 (ref)
                    if not v466 then
                        return;
                    else
                        v465:Disconnect();
                        if l_StartupHighlight_0 then
                            l_StartupHighlight_0:Destroy();
                        end;
                        return;
                    end;
                end);
                task.delay(3, function() --[[ Line: 1931 ]]
                    -- upvalues: l_StartupHighlight_0 (ref), v465 (ref)
                    if l_StartupHighlight_0 then
                        l_StartupHighlight_0:Destroy();
                    end;
                    v465:Disconnect();
                end);
                return;
            else
                l_TweenService_0:Create(l_StartupHighlight_0, v462, {
                    OutlineTransparency = 1, 
                    FillTransparency = 1
                }):Play();
                task.wait(0.5);
                l_StartupHighlight_0:Destroy();
                return;
            end;
        end;
    end;
end;
v33.AfterimageEffect = function(v467) --[[ Line: 1945 ]] --[[ Name: AfterimageEffect ]]
    -- upvalues: l_Workspace_1 (copy), l_TweenService_0 (copy)
    local l_FirstChild_15 = l_Workspace_1.Welds:FindFirstChild(v467.Character.Name);
    local v469 = l_FirstChild_15 and l_FirstChild_15:FindFirstChild("WeldCharacter") or v467.Character;
    if not v469 then
        return;
    else
        local v470 = v467.Step or 0;
        local v471 = v467.MaxTime or 1;
        local v472 = v467.DeleteDelay or 0.1;
        local v473 = v467.AddTransparency or 0.5;
        local v474 = v467.Color or Color3.fromRGB(255, 255, 255);
        local _ = tick();
        local function v480() --[[ Line: 1958 ]] --[[ Name: Perform ]]
            -- upvalues: v469 (copy), v474 (copy), v473 (copy), l_Workspace_1 (ref), l_TweenService_0 (ref), v472 (copy)
            for _, v477 in pairs(v469:GetChildren()) do
                if v477:IsA("BasePart") and v477.Name ~= "HumanoidRootPart" and v477.Name ~= "Hitbox" then
                    local v478 = v477:Clone();
                    v478:ClearAllChildren();
                    if v477.Name == "Head" then
                        local l_SpecialMesh_0 = Instance.new("SpecialMesh");
                        l_SpecialMesh_0.MeshType = Enum.MeshType.Head;
                        l_SpecialMesh_0.Scale = Vector3.new(1.25, 1.25, 1.25, 0);
                        l_SpecialMesh_0.Parent = v478;
                    end;
                    v478.CFrame = v478.CFrame * CFrame.new(0, 0, -0.1);
                    v478.Material = "Neon";
                    v478.Color = v474;
                    v478.CanCollide = false;
                    v478.Anchored = true;
                    v478.Transparency = v473;
                    v478.Parent = l_Workspace_1.Debris;
                    l_TweenService_0:Create(v478, TweenInfo.new(v472), {
                        Transparency = 1
                    }):Play();
                    task.delay(v472, function() --[[ Line: 1985 ]]
                        -- upvalues: v478 (copy)
                        v478:Destroy();
                    end);
                end;
            end;
        end;
        local v481 = 0;
        local v482 = tick();
        while task.wait(0.016666666666666666) and v471 >= tick() - v482 do
            v481 = v481 + 1;
            if v481 % v470 == 0 then
                v480();
            end;
        end;
        return;
    end;
end;
local v483 = {
    [Enum.AnimationPriority.Core] = 1, 
    [Enum.AnimationPriority.Idle] = 2, 
    [Enum.AnimationPriority.Movement] = 3, 
    [Enum.AnimationPriority.Action] = 4, 
    [Enum.AnimationPriority.Action2] = 5, 
    [Enum.AnimationPriority.Action3] = 4, 
    [Enum.AnimationPriority.Action4] = 7
};
v33.SlowMo = function(v484) --[[ Line: 2030 ]] --[[ Name: SlowMo ]]
    -- upvalues: l_Workspace_1 (copy), l_Styles_0 (copy), v483 (copy), l_AnimHelper_0 (copy), l_LocalPlayer_0 (copy), l_AlignHelper_0 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy), l_Places_0 (copy), l_Common_0 (copy), l_Lighting_0 (copy), l_Main_0 (copy)
    local v485 = {
        Character = v484[2], 
        Victim = v484[3], 
        DashDirection = v484[4]
    };
    local l_Character_16 = v485.Character;
    local l_Victim_0 = v485.Victim;
    local l_FirstChild_16 = l_Workspace_1.States:FindFirstChild(l_Character_16.Name);
    local v489 = l_FirstChild_16 and l_FirstChild_16:FindFirstChild("CharacterData");
    local v490 = l_FirstChild_16 and l_FirstChild_16:FindFirstChild("PlayerData");
    local v491 = l_FirstChild_16 and l_FirstChild_16:FindFirstChild("Occupied");
    if not v489 or not v490 or not v491 then
        return;
    else
        local v492 = l_Victim_0.Name .. "Hit";
        for _, v494 in l_Workspace_1.Debris:GetChildren() do
            if v494.Name == v492 then
                v494:Destroy();
            end;
        end;
        local v495 = tick();
        l_Character_16:SetAttribute("LocalSlowMo", v495);
        v491.CanPunch.Value = false;
        task.delay(0.7, function() --[[ Line: 2059 ]]
            -- upvalues: v491 (copy), l_Character_16 (copy), v495 (copy)
            v491.CanPunch.Value = true;
            if l_Character_16:GetAttribute("LocalSlowMo") == v495 then
                l_Character_16:SetAttribute("LocalSlowMo", nil);
            end;
        end);
        v491.FaceAnyways.Value = true;
        local l_Humanoid_1 = l_Character_16:FindFirstChild("Humanoid");
        local v497 = l_Humanoid_1:FindFirstChild("Animator") or l_Humanoid_1;
        local v498 = 100;
        for _, v500 in (v497:GetPlayingAnimationTracks()) do
            if v500.Name == "Remove10" and v500.TimePosition < v498 then
                v498 = v500.TimePosition;
            end;
        end;
        local l_DashInfo_0 = l_Styles_0.Ippo.DashInfo;
        local l_DefaultInfo_0 = l_DashInfo_0.DefaultInfo;
        local l_Forward_0 = l_DashInfo_0.Forward;
        local function _(v504) --[[ Line: 2087 ]] --[[ Name: GetInfo ]]
            -- upvalues: l_Forward_0 (ref), l_DefaultInfo_0 (copy)
            return l_Forward_0[v504] or l_DefaultInfo_0[v504];
        end;
        for _, v507 in (v497:GetPlayingAnimationTracks()) do
            if v483[v507.Priority] >= 4 then
                v507:Stop(0.01);
            end;
        end;
        local v508 = {
            AnimId = 13633646038, 
            FadeIn = 0.05, 
            AnimSpeed = 0.2, 
            Priority = Enum.AnimationPriority.Action2, 
            Animator = v497, 
            Weight = 1000, 
            Name = "Server", 
            NameFade = 0.01
        };
        local v509 = l_Styles_0[v490.Style.Value].DashInfo[v485.DashDirection];
        local l_UseForSlowMo_0 = v509.UseForSlowMo;
        if v509.UseForSlowMoAnimOnly then
            v508.AnimId = v509.AnimId;
        end;
        if l_UseForSlowMo_0 then
            v508.AnimId = v509.AnimId;
            l_Forward_0 = v509;
        end;
        local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v508);
        l_l_AnimHelper_0_Anim_0.TimePosition = v498 == 100 and 0 or v498;
        task.delay(1, function() --[[ Line: 2126 ]]
            -- upvalues: l_l_AnimHelper_0_Anim_0 (copy)
            l_l_AnimHelper_0_Anim_0:AdjustSpeed(0.6000000000000001);
        end);
        local l_Humanoid_2 = l_Victim_0:FindFirstChild("Humanoid");
        for _, v514 in ((l_Humanoid_2:FindFirstChild("Animator") or l_Humanoid_2):GetPlayingAnimationTracks()) do
            if v514.Name == "Server" then
                local l_Speed_0 = v514.Speed;
                if l_Speed_0 <= 0.52 and l_Speed_0 >= 0.48 then
                    l_Speed_0 = 1.15;
                end;
                local v516 = l_Speed_0 * 0.2 * 0.33;
                do
                    local l_l_Speed_0_0 = l_Speed_0;
                    task.spawn(function() --[[ Line: 2145 ]]
                        -- upvalues: v514 (copy), v516 (copy), l_l_Speed_0_0 (ref)
                        local v518 = tick();
                        repeat
                            v514:AdjustSpeed(v516);
                            task.wait(0.1);
                        until tick() - v518 > 1;
                        v514:AdjustSpeed(l_l_Speed_0_0);
                    end);
                end;
            end;
        end;
        local l_Character_17 = l_LocalPlayer_0.Character;
        if l_Character_17 ~= l_Character_16 and l_Character_17 ~= l_Victim_0 then
            return;
        else
            if l_Character_17 == l_Character_16 and v484[4] ~= "Standing" then
                local l_FirstChild_17 = l_Workspace_1.Debris:FindFirstChild(l_Character_16.Name .. "TargetPart");
                local v521 = (l_Character_16.PrimaryPart.Position + l_FirstChild_17.Position) / 2;
                local v522 = {
                    KeepPos = true, 
                    SetPosition = v521, 
                    Responsiveness = l_Forward_0.Responsiveness or l_DefaultInfo_0.Responsiveness, 
                    Velocity = (l_Forward_0.Velocity or l_DefaultInfo_0.Velocity) * 0.2 * 0.2, 
                    MaxTime = (l_Forward_0.DashTime or l_DefaultInfo_0.DashTime) / 0.2, 
                    IgnoreStun = true, 
                    Priority = 2
                };
                local l_v522_0 = v522 --[[ copy: 33 -> 44 ]];
                task.defer(function() --[[ Line: 2175 ]]
                    -- upvalues: l_AlignHelper_0 (ref), l_v522_0 (copy)
                    l_AlignHelper_0:MoveAlignPosition(l_v522_0);
                end);
                task.delay(0.5, function() --[[ Line: 2179 ]]
                    -- upvalues: l_AlignHelper_0 (ref)
                    l_AlignHelper_0:SetPriority(1);
                end);
            elseif l_Character_17 == l_Victim_0 then
                local v524 = {
                    KeepPos = true, 
                    SetPosition = l_Victim_0.PrimaryPart.Position, 
                    Responsiveness = 0, 
                    Velocity = 0, 
                    MaxTime = (l_Forward_0.DashTime or l_DefaultInfo_0.DashTime) / 0.2, 
                    IgnoreStun = true, 
                    Priority = 2
                };
                local l_v524_0 = v524 --[[ copy: 31 -> 43 ]];
                task.defer(function() --[[ Line: 2193 ]]
                    -- upvalues: l_AlignHelper_0 (ref), l_v524_0 (copy)
                    l_AlignHelper_0:MoveAlignPosition(l_v524_0);
                end);
                task.delay(0.5, function() --[[ Line: 2197 ]]
                    -- upvalues: l_AlignHelper_0 (ref)
                    l_AlignHelper_0:SetPriority(1);
                end);
            end;
            local v526 = GetPlayerData(l_Character_16);
            local v527 = v526 and v526.PerfectSounds.Value;
            if v527 and string.len(v527) > 0 then
                local v528 = {};
                for v529 in v527:gmatch("(.-),") do
                    table.insert(v528, v529);
                end;
                local v530 = v528[math.random(1, #v528)];
                local v531 = l_SoundHelper_0:PlaySound({
                    Name = "SlowMo", 
                    SoundId = v530, 
                    Parent = l_Workspace_1.Debris, 
                    Speed = 1, 
                    Volume = 0.25
                });
                task.delay(2, function() --[[ Line: 2230 ]]
                    -- upvalues: v531 (copy), l_TweenService_0 (ref)
                    if not v531 then
                        return;
                    else
                        l_TweenService_0:Create(v531, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            Volume = 0
                        }):Play();
                        return;
                    end;
                end);
                local l_Value_3 = v526.PerfectImages.Value;
                if l_Value_3 and string.len(l_Value_3) > 0 and game.PlaceId ~= l_Places_0.Ranked and (not workspace.Settings.DisableImages.Value or l_Character_16 == l_Character_17) then
                    local v533 = {};
                    for v534 in l_Value_3:gmatch("(.-),") do
                        table.insert(v533, v534);
                    end;
                    local v535 = l_Common_0.FlashImage.Main:Clone();
                    v535.Name = "Remove";
                    v535.Image = "rbxassetid://" .. v533[math.random(1, #v533)];
                    v535.ImageTransparency = l_Character_16 == l_Character_17 and 0.6 or 0.75;
                    v535.Parent = l_Common_0.FlashImage;
                    local l_v535_0 = v535 --[[ copy: 38 -> 42 ]];
                    task.delay(0.25, function() --[[ Line: 2253 ]]
                        -- upvalues: l_TweenService_0 (ref), l_v535_0 (copy)
                        l_TweenService_0:Create(l_v535_0, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            ImageTransparency = 1
                        }):Play();
                        task.wait(2);
                        l_v535_0:Destroy();
                    end);
                end;
            else
                l_SoundHelper_0:PlaySound({
                    Name = "SlowMo", 
                    Parent = l_Character_17.PrimaryPart, 
                    Speed = 1
                });
            end;
            local v537 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
            local l_DepthOfField_0 = l_Lighting_0.DepthOfField;
            l_DepthOfField_0.FocusDistance = 90;
            l_TweenService_0:Create(l_DepthOfField_0, v537, {
                FocusDistance = 0
            }):Play();
            l_Workspace_1.FoVMult.Value = 1.5;
            if workspace.FightCameraMode.Value ~= "" then
                l_Workspace_1.CurrentCamera.FieldOfView = 57 - (70 - workspace.CurrentCamera.FieldOfView);
            else
                l_Workspace_1.CurrentCamera.FieldOfView = 57;
            end;
            local l_Image_0 = l_Main_0.SlowMoFrame.Image;
            local l_BackgroundTransparency_0 = l_Image_0.BackgroundTransparency;
            local l_ImageTransparency_0 = l_Image_0.ImageTransparency;
            l_Image_0.Visible = true;
            local v542 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v542, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
            }):Play();
            local v543 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
            l_TweenService_0:Create(l_Image_0, v543, {
                BackgroundTransparency = 1, 
                ImageTransparency = 1
            }):Play();
            local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
            l_ColorCorrectionEffect_0.Name = "SlowMoRemove";
            l_ColorCorrectionEffect_0.Parent = l_Lighting_0;
            l_ColorCorrectionEffect_0.Saturation = -1;
            l_ColorCorrectionEffect_0.Contrast = 0.2;
            l_ColorCorrectionEffect_0.TintColor = Color3.fromRGB(255, 255, 255);
            l_ColorCorrectionEffect_0.Enabled = true;
            task.wait(1);
            l_TweenService_0:Create(l_Lighting_0, v542, {
                ExposureCompensation = workspace.Exposure.Value
            }):Play();
            v491.FaceAnyways.Value = false;
            l_Image_0.Visible = false;
            l_Image_0.BackgroundTransparency = l_BackgroundTransparency_0;
            l_Image_0.ImageTransparency = l_ImageTransparency_0;
            l_TweenService_0:Create(l_ColorCorrectionEffect_0, v543, {
                Saturation = 0, 
                Contrast = 0
            }):Play();
            task.wait(0.5);
            l_ColorCorrectionEffect_0:Destroy();
            return;
        end;
    end;
end;
local v545 = 0;
local v546 = 0;
v33.StatusFrame = function(v547, v548, v549) --[[ Line: 2320 ]] --[[ Name: StatusFrame ]]
    -- upvalues: l_Common_0 (copy), v546 (ref), v545 (ref), l_TweenService_0 (copy)
    local v550 = v547 and "Victim" or "Player";
    local v551 = v548[v550]:Clone();
    v551.Parent = v548;
    if v549 and v549.ParentToCommon then
        v551.Parent = l_Common_0;
    end;
    v551.Visible = true;
    local l_Position_0 = v551.Position;
    if v547 then
        v551.Position = UDim2.new(l_Position_0.X.Scale, 0, l_Position_0.Y.Scale + v546 * 0.085);
        l_Position_0 = v551.Position;
    else
        v551.Position = UDim2.new(l_Position_0.X.Scale, 0, l_Position_0.Y.Scale + v545 * 0.085);
        l_Position_0 = v551.Position;
    end;
    if v547 then
        v546 = v546 + 1;
    else
        v545 = v545 + 1;
    end;
    if v550 == "Victim" then
        v551.Position = UDim2.new(1.1, 0, l_Position_0.Y.Scale, 0);
    else
        v551.Position = UDim2.new(-0.44, 0, l_Position_0.Y.Scale, 0);
    end;
    local l_Size_0 = v551.PinkGlow.Size;
    local l_Size_1 = v551.WhiteGlow.Size;
    v551.PinkGlow.Size = UDim2.new(l_Size_0.X.Scale, 0, 0, 0);
    v551.WhiteGlow.Size = UDim2.new(l_Size_1.X.Scale, 0, 0, 0);
    local v555 = TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
    l_TweenService_0:Create(v551, v555, {
        Position = l_Position_0
    }):Play();
    task.delay(0.39999999999999997, function() --[[ Line: 2362 ]]
        -- upvalues: l_TweenService_0 (ref), v551 (copy), l_Position_0 (ref), v550 (copy)
        local v556 = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        l_TweenService_0:Create(v551, v556, {
            Position = UDim2.new(l_Position_0.X.Scale + 0.025 * (v550 == "Victim" and -1 or 1), 0, l_Position_0.Y.Scale, 0)
        }):Play();
    end);
    task.delay(0.1, function() --[[ Line: 2367 ]]
        -- upvalues: l_TweenService_0 (ref), v551 (copy), l_Size_0 (copy), l_Size_1 (copy)
        local v557 = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        l_TweenService_0:Create(v551.PinkGlow, v557, {
            Size = l_Size_0
        }):Play();
        l_TweenService_0:Create(v551.WhiteGlow, v557, {
            Size = l_Size_1
        }):Play();
    end);
    local l_ProgressFrame_0 = v551:FindFirstChild("ProgressFrame");
    local v559 = v549 and v549.ProgressTime;
    local v560 = v549 and v549.SlowProgressTime or 0;
    if v559 then
        if l_ProgressFrame_0 then
            l_ProgressFrame_0.Bar.Size = UDim2.new(1, 0, 1, 0);
            l_TweenService_0:Create(l_ProgressFrame_0.Bar, TweenInfo.new(v559, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 0, 1, 0)
            }):Play();
        end;
        task.wait(v559 + v560 - 1);
    end;
    local v561 = 1;
    if v549 and v549.HoldTime then
        v561 = v549.HoldTime;
    end;
    task.wait(v561);
    local v562 = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
    l_TweenService_0:Create(v551.PinkGlow, v562, {
        ImageTransparency = 1
    }):Play();
    l_TweenService_0:Create(v551.WhiteGlow, v562, {
        ImageTransparency = 1
    }):Play();
    if l_ProgressFrame_0 then
        l_TweenService_0:Create(l_ProgressFrame_0, v562, {
            BackgroundTransparency = 1
        }):Play();
        l_TweenService_0:Create(l_ProgressFrame_0.Bar, v562, {
            BackgroundTransparency = 1
        }):Play();
    end;
    for v563 = 1, 40 do
        local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v563 / 40, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        v551.Main.UIGradient.Transparency = NumberSequence.new(l_l_TweenService_0_Value_0);
        v551.Stroke.UIGradient.Transparency = NumberSequence.new(l_l_TweenService_0_Value_0 * 1.1);
        if l_ProgressFrame_0 then
            l_ProgressFrame_0.UIStroke.Transparency = l_l_TweenService_0_Value_0;
        end;
        task.wait(0.016666666666666666);
    end;
    if v547 then
        v546 = v546 - 1;
    else
        v545 = v545 - 1;
    end;
    v551:Destroy();
end;
local v565 = 0;
v33.CounterEffect = function(v566) --[[ Line: 2428 ]] --[[ Name: CounterEffect ]]
    -- upvalues: l_LocalPlayer_0 (copy), v565 (ref), l_SoundHelper_0 (copy), l_TweenService_0 (copy), l_Places_0 (copy), l_Common_0 (copy), v33 (copy), l_Main_0 (copy)
    local v567 = v566[2];
    local _ = v567 and "Victim" or "Player";
    local l_Character_18 = l_LocalPlayer_0.Character;
    local v570 = GetOccupied(l_Character_18);
    local v571 = v567 and v570.LockedOn.Value or l_Character_18;
    local v572 = tick() - v565 < 0.3;
    v565 = tick();
    local v573 = GetPlayerData(v571);
    local v574 = v573 and v573.CounterSounds.Value;
    if v574 and string.len(v574) > 0 and (not workspace.Settings.DisableImages.Value or v571 == l_Character_18) then
        local v575 = {};
        for v576 in v574:gmatch("(.-),") do
            table.insert(v575, v576);
        end;
        local v577 = v575[math.random(1, #v575)];
        local v578 = l_SoundHelper_0:PlaySound({
            Name = "Counter", 
            SoundId = v577, 
            Parent = workspace.Debris, 
            Speed = 1, 
            Volume = 0.25
        });
        if v572 then
            v578.Volume = v578.Volume / 2;
        end;
        task.delay(1, function() --[[ Line: 2462 ]]
            -- upvalues: v578 (copy), l_TweenService_0 (ref)
            if not v578 then
                return;
            else
                l_TweenService_0:Create(v578, TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    Volume = 0
                }):Play();
                return;
            end;
        end);
        local l_Value_4 = v573.CounterImages.Value;
        if l_Value_4 and string.len(l_Value_4) > 0 and game.PlaceId ~= l_Places_0.Ranked then
            local v580 = {};
            for v581 in l_Value_4:gmatch("(.-),") do
                table.insert(v580, v581);
            end;
            local v582 = l_Common_0.FlashImage.Main:Clone();
            v582.Name = "Remove";
            v582.Image = "rbxassetid://" .. v580[math.random(1, #v580)];
            v582.ImageTransparency = l_Character_18 == v571 and 0.6 or 0.85;
            v582.Parent = l_Common_0.FlashImage;
            task.delay(0.1, function() --[[ Line: 2484 ]]
                -- upvalues: l_TweenService_0 (ref), v582 (copy)
                l_TweenService_0:Create(v582, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    ImageTransparency = 1
                }):Play();
                task.wait(2);
                v582:Destroy();
            end);
        end;
    else
        local v583 = l_SoundHelper_0:PlaySound({
            Name = "Counter", 
            Parent = l_Character_18.PrimaryPart, 
            Speed = 1
        });
        if v572 then
            v583.Volume = v583.Volume / 2;
        end;
    end;
    v33.StatusFrame(v567, l_Main_0.StatusFrame.CounterFrame);
end;
v33.BlockBreak = function(v584) --[[ Line: 2506 ]] --[[ Name: BlockBreak ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Workspace_1 (copy), l_Styles_0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_Main_0 (copy), v33 (copy)
    local v585 = {
        Character = v584[2], 
        Victim = v584[3]
    };
    local l_Character_19 = v585.Character;
    local l_Victim_1 = v585.Victim;
    local l_Character_20 = l_LocalPlayer_0.Character;
    local v589 = script.BlockBreak:Clone();
    v589.CFrame = l_Character_19.PrimaryPart.CFrame;
    v589.Parent = l_Workspace_1.Debris;
    for _, v591 in v589.Particle:GetChildren() do
        v591.Enabled = false;
        v591:Emit(v591:GetAttribute("EmitCount") or 1);
    end;
    task.delay(5, function() --[[ Line: 2526 ]]
        -- upvalues: v589 (copy)
        v589:Destroy();
    end);
    local l_Humanoid_3 = l_Character_19:FindFirstChild("Humanoid");
    local v593 = l_Humanoid_3:FindFirstChild("Animator") or l_Humanoid_3;
    local v594 = l_Styles_0[GetPlayerData(l_Character_19).Style.Value];
    local l_CoreInfo_0 = v594.CoreInfo;
    local l_Break_0 = v594.BlockAnimations.Break;
    local l_BlockBreakTime_0 = l_CoreInfo_0.BlockBreakTime;
    local v598 = {
        Priority = Enum.AnimationPriority.Action4, 
        Animator = v593, 
        AnimId = l_Break_0, 
        NameFade = 0.001, 
        FadeIn = 0.15, 
        Weight = 1000, 
        Name = "Remove", 
        Speed = 0.85, 
        StopInfo = {
            StopDelay = l_BlockBreakTime_0 - 0.5, 
            StopTime = 0.4
        }
    };
    l_AnimHelper_0:CreateAnim(v598);
    if l_Character_20 ~= l_Character_19 and l_Character_20 ~= l_Victim_1 then
        return;
    else
        local l_FirstChild_18 = l_Workspace_1.States:FindFirstChild(l_LocalPlayer_0.Name);
        local v600 = l_FirstChild_18 and l_FirstChild_18:FindFirstChild("Occupied");
        if (not v600 or v600.LockedOn.Value ~= l_Character_19) and v600.LockedOn.Value ~= l_Victim_1 and l_Character_20 ~= l_Character_19 then
            return;
        else
            if l_Character_20 == l_Character_19 then
                v600.Blocking.Value = false;
                local l_Humanoid_4 = l_Character_19:FindFirstChild("Humanoid");
                local v602 = l_Humanoid_4 and l_Humanoid_4:FindFirstChild("Animator");
                for _, v604 in (v602:GetPlayingAnimationTracks()) do
                    if v604.Name == "BlockClient" then
                        v604:Stop(0.01);
                    end;
                end;
            end;
            l_SoundHelper_0:PlaySound({
                Name = "BlockBreak", 
                Parent = l_Character_19.PrimaryPart, 
                Speed = 1
            });
            l_SoundHelper_0:PlaySound({
                Name = "GlassShatter", 
                Parent = l_Character_19.PrimaryPart, 
                Speed = 1
            });
            l_Workspace_1.FoVMult.Value = 1;
            if workspace.FightCameraMode.Value ~= "" then
                l_Workspace_1.CurrentCamera.FieldOfView = 62 - (70 - workspace.CurrentCamera.FieldOfView);
            else
                l_Workspace_1.CurrentCamera.FieldOfView = 62;
            end;
            if l_Character_20 == l_Character_19 then
                local l_ColorCorrection_2 = l_Lighting_0.ColorCorrection;
                l_ColorCorrection_2.Saturation = 0;
                l_ColorCorrection_2.Contrast = 0;
                l_ColorCorrection_2.Enabled = true;
                local v606 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                l_TweenService_0:Create(l_ColorCorrection_2, v606, {
                    Saturation = -0.5, 
                    Contrast = 0.25
                }):Play();
                local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                l_MenuBlur_1.Size = 0;
                l_MenuBlur_1.Enabled = true;
                local v608 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_MenuBlur_1, v608, {
                    Size = 24
                }):Play();
                local v609 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_TweenService_0:Create(l_Lighting_0, v609, {
                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                }):Play();
                task.delay(0.3, function() --[[ Line: 2626 ]]
                    -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v609 (copy)
                    l_TweenService_0:Create(l_Lighting_0, v609, {
                        ExposureCompensation = workspace.Exposure.Value
                    }):Play();
                end);
            end;
            l_Main_0.MainFrame.ShakeEvent:Fire({
                Scale = 8, 
                Damper = 0.0875
            });
            local v610 = l_Character_20 == l_Victim_1;
            v33.StatusFrame(v610, l_Main_0.StatusFrame.BlockBreakFrame);
            return;
        end;
    end;
end;
v33.StaminaBreak = function(v611) --[[ Line: 2642 ]] --[[ Name: StaminaBreak ]]
    -- upvalues: l_Workspace_1 (copy), l_LocalPlayer_0 (copy), l_Styles_0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_Main_0 (copy), v33 (copy)
    local v612 = {
        Character = v611[2], 
        Victim = v611[3]
    };
    local l_Character_21 = v612.Character;
    local l_Victim_2 = v612.Victim;
    local l_FirstChild_19 = l_Workspace_1.States:FindFirstChild(l_LocalPlayer_0.Name);
    local v616 = l_FirstChild_19 and l_FirstChild_19:FindFirstChild("Occupied");
    local l_Character_22 = l_LocalPlayer_0.Character;
    if l_Character_22 ~= l_Character_21 and l_Character_22 ~= l_Victim_2 then
        return;
    elseif (not v616 or v616.LockedOn.Value ~= l_Character_21) and v616.LockedOn.Value ~= l_Victim_2 and l_Character_22 ~= l_Character_21 then
        return;
    else
        task.delay(0.25, function() --[[ Line: 2663 ]]
            -- upvalues: l_Character_21 (copy), l_Styles_0 (ref), l_LocalPlayer_0 (ref), l_AnimHelper_0 (ref)
            local l_l_Character_21_Attribute_0 = l_Character_21:GetAttribute("SlowMo");
            local v619 = GetCharacterData(l_Character_21);
            local v620 = l_Styles_0[GetPlayerData(l_Character_21).Style.Value];
            if not v620 then
                return;
            else
                local l_CoreInfo_1 = v620.CoreInfo;
                local l_StaminaBreakAnimId_0 = l_CoreInfo_1.StaminaBreakAnimId;
                local v623 = l_CoreInfo_1.StaminaBreakTime + 0.25;
                if v619.Cutscene.Value or l_l_Character_21_Attribute_0 then
                    return;
                else
                    local l_Humanoid_5 = l_Character_21:FindFirstChild("Humanoid");
                    local v625 = l_Humanoid_5:FindFirstChild("Animator") or l_Humanoid_5;
                    local v626 = {
                        Priority = Enum.AnimationPriority.Action3, 
                        Animator = v625, 
                        AnimId = l_StaminaBreakAnimId_0, 
                        NameFade = 0.001, 
                        FadeIn = l_LocalPlayer_0.Character == l_Character_21 and 0.4 or 0.15, 
                        Weight = 1000, 
                        Name = "Remove", 
                        Speed = 1.5, 
                        StopInfo = {
                            StopDelay = v623 - 0.5, 
                            StopTime = 0.4
                        }
                    };
                    l_AnimHelper_0:CreateAnim(v626);
                    return;
                end;
            end;
        end);
        l_SoundHelper_0:PlaySound({
            Name = "StaminaBreak", 
            Parent = l_Character_21.PrimaryPart, 
            Speed = 1
        });
        l_Workspace_1.FoVMult.Value = 1;
        if workspace.FightCameraMode.Value ~= "" then
            l_Workspace_1.CurrentCamera.FieldOfView = 65 - (70 - workspace.CurrentCamera.FieldOfView);
        else
            l_Workspace_1.CurrentCamera.FieldOfView = 65;
        end;
        if l_Character_22 == l_Character_21 then
            local l_ColorCorrection_3 = l_Lighting_0.ColorCorrection;
            l_ColorCorrection_3.Saturation = 0;
            l_ColorCorrection_3.Contrast = 0;
            l_ColorCorrection_3.Enabled = true;
            local v628 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_3, v628, {
                Saturation = 0.05, 
                Contrast = 0.15
            }):Play();
            local v629 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v629, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.15
            }):Play();
            task.delay(0.3, function() --[[ Line: 2729 ]]
                -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v629 (copy)
                l_TweenService_0:Create(l_Lighting_0, v629, {
                    ExposureCompensation = workspace.Exposure.Value
                }):Play();
            end);
        end;
        l_Main_0.MainFrame.ShakeEvent:Fire({
            Scale = 8, 
            Damper = 0.0875
        });
        local v630 = l_Character_22 == l_Victim_2;
        v33.StatusFrame(v630, l_Main_0.StatusFrame.StaminaBreakFrame);
        return;
    end;
end;
v33.TripleText = function(v631) --[[ Line: 2745 ]] --[[ Name: TripleText ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_Image_1 = v631.Image;
    local l_Parent_3 = l_Image_1.Parent;
    local l_Size_2 = l_Image_1.Size;
    for _ = 1, v631.Amount or 3 do
        local v636 = l_Image_1:Clone();
        v636.Parent = l_Parent_3;
        local l_Size_3 = v636.Size;
        v636.Size = UDim2.new(l_Size_3.X.Scale * 3, 0, l_Size_3.Y.Scale * 3, 0);
        local v638 = v636:IsA("TextLabel");
        local v639 = {
            ImageTransparency = 0
        };
        if v638 then
            v639 = {
                TextTransparency = 0
            };
            v636.TextTransparency = 1;
        else
            v636.ImageTransparency = 1;
        end;
        v636.Visible = true;
        local v640 = TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        l_TweenService_0:Create(v636, v640, {
            Size = l_Size_2
        }):Play();
        local v641 = TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
        l_TweenService_0:Create(v636, v641, v639):Play();
        do
            local l_v639_0 = v639;
            task.defer(function() --[[ Line: 2776 ]]
                -- upvalues: v631 (copy), v638 (copy), l_v639_0 (ref), l_TweenService_0 (ref), v636 (copy)
                local v643 = v631 and v631.HoldTime or 1.3333333333333333;
                task.wait(v643);
                if v638 then
                    l_v639_0 = {
                        TextTransparency = 1
                    };
                else
                    l_v639_0 = {
                        ImageTransparency = 1
                    };
                end;
                local v644 = TweenInfo.new(v631.TweenSpeed or 0.4166666666666667, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
                l_TweenService_0:Create(v636, v644, l_v639_0):Play();
                task.wait(3);
                if v636 then
                    v636:Destroy();
                end;
            end);
            task.wait(0.08333333333333333);
        end;
    end;
end;
v33.DownCount = function(v645) --[[ Line: 2797 ]] --[[ Name: DownCount ]]
    -- upvalues: l_Assets_0 (copy), l_SoundHelper_0 (copy), l_Workspace_1 (copy), v33 (copy), l_Common_0 (copy), l_TweenService_0 (copy)
    local l_Character_23 = v645.Character;
    local v647 = v645.Name or "Default";
    local l_IsBillboard_0 = v645.IsBillboard;
    local v649 = l_Assets_0.DownFrames:FindFirstChild(v647 .. (l_IsBillboard_0 and "Billboard" or "")) or l_Assets_0.DownFrames:FindFirstChild("Default" .. (l_IsBillboard_0 and "Billboard" or ""));
    if not v649 then
        return;
    else
        v649 = v649:Clone();
        if l_IsBillboard_0 and v645.BillboardOffset then
            v649.ExtentsOffsetWorldSpace = v645.BillboardOffset;
        end;
        local v650 = nil;
        if not v645.Sound then
            v650 = l_SoundHelper_0:PlaySound({
                Name = "KnockdownCounter", 
                Parent = l_IsBillboard_0 and l_Character_23.PrimaryPart or l_Workspace_1.Debris, 
                Speed = 1
            });
        end;
        local l_v649_0 = v649;
        local l_Numbers_0 = l_v649_0:FindFirstChild("Numbers");
        if l_IsBillboard_0 then
            v649.Parent = v33.GetWeldCharacter(l_Character_23).PrimaryPart;
            l_Numbers_0 = l_v649_0.Main:FindFirstChild("Numbers");
        else
            l_v649_0.Parent = l_Common_0;
        end;
        task.wait(0.75);
        for v653 = 1, 10 do
            if l_Character_23:GetAttribute("GettingUp") or not l_Character_23:IsDescendantOf(l_Workspace_1) then
                if v650 then
                    l_TweenService_0:Create(v650, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Volume = 0
                    }):Play();
                end;
                task.delay(1, function() --[[ Line: 2845 ]]
                    -- upvalues: l_IsBillboard_0 (copy), v649 (ref)
                    if l_IsBillboard_0 then
                        v649:Destroy();
                    end;
                end);
                break;
            else
                local l_l_Numbers_0_FirstChild_0 = l_Numbers_0:FindFirstChild((tostring(v653)));
                if l_l_Numbers_0_FirstChild_0 then
                    l_l_Numbers_0_FirstChild_0 = l_l_Numbers_0_FirstChild_0:Clone();
                    local l_Size_4 = l_l_Numbers_0_FirstChild_0.Size;
                    l_l_Numbers_0_FirstChild_0.Parent = l_v649_0;
                    l_l_Numbers_0_FirstChild_0.Size = UDim2.new(l_Size_4.X.Scale * 5, 0, l_Size_4.Y.Scale * 5, 0);
                    l_l_Numbers_0_FirstChild_0.ImageTransparency = 1;
                    l_l_Numbers_0_FirstChild_0.Visible = true;
                    local v656 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                    l_TweenService_0:Create(l_l_Numbers_0_FirstChild_0, v656, {
                        Size = l_Size_4
                    }):Play();
                    local v657 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
                    l_TweenService_0:Create(l_l_Numbers_0_FirstChild_0, v657, {
                        ImageTransparency = 0
                    }):Play();
                    if v645.Sound then
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = l_IsBillboard_0 and l_Character_23.PrimaryPart or l_Workspace_1.Debris, 
                            DirectCopy = v645.Sound
                        });
                    end;
                    task.wait(0.3333333333333333);
                    local v658 = TweenInfo.new(0.4166666666666667, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
                    l_TweenService_0:Create(l_l_Numbers_0_FirstChild_0, v658, {
                        Size = UDim2.new(l_Size_4.X.Scale, 0, l_Size_4.Y.Scale, 0), 
                        ImageTransparency = 1
                    }):Play();
                    task.wait(0.6666666666666667);
                    if l_l_Numbers_0_FirstChild_0 then
                        l_l_Numbers_0_FirstChild_0:Destroy();
                    end;
                end;
            end;
        end;
        task.wait(5);
        l_v649_0:Destroy();
        return;
    end;
end;
v33.Knockdown = function(v659) --[[ Line: 2892 ]] --[[ Name: Knockdown ]]
    -- upvalues: l_Workspace_1 (copy), v33 (copy), v104 (copy)
    local v660 = {
        Subeffect = v659[2], 
        Damager = v659[4], 
        Character = v659[5], 
        StartPosition = v659[6], 
        LookVector = v659[7], 
        IsKO = v659[8], 
        RandomMult = v659[9], 
        HasReverseKnockdowns = v659[10], 
        OverrideBlob = v659[11]
    };
    if v660.Character.Parent ~= l_Workspace_1.Live then
        return;
    else
        if l_Workspace_1.Settings.PlayKnockdownOnSelf.Value then
            v660.Subeffect = v659[3];
        end;
        local l_Knockdowns_0 = script.Knockdowns;
        for _, v663 in {
            l_Knockdowns_0[v659[2]], 
            l_Knockdowns_0[v659[3]]
        } do
            for _, v665 in v663:GetDescendants() do
                if v665:IsA("Sound") then
                    v665.SoundId = v665.StoredId.Value;
                end;
            end;
        end;
        local v666 = require(l_Knockdowns_0[v659[2]]);
        local v667 = require(l_Knockdowns_0[v659[3]]);
        v660.TeleportId = v33.UpdateTeleportId(v660.Character);
        v660.ExtraTime = 0;
        local v668 = tick();
        v104[v660.Damager] = v668;
        v104[v660.Character] = v668;
        local v669 = {};
        local v670 = false;
        local v671 = GetCharacterData(v660.Damager);
        local v672 = GetCharacterData(v660.Character);
        local function v675() --[[ Line: 2942 ]] --[[ Name: Reset ]]
            -- upvalues: v669 (copy), v670 (ref), v668 (copy), v660 (copy)
            for _, v674 in v669 do
                if v674 then
                    v674:Disconnect();
                end;
            end;
            if v670 then
                return;
            else
                v670 = true;
                task.wait(0.2);
                ResetStatesAfterCutscene({
                    LocalId = v668, 
                    Character = v660.Damager
                });
                ResetStatesAfterCutscene({
                    LocalId = v668, 
                    Character = v660.Character
                });
                return;
            end;
        end;
        v669[#v669 + 1] = v671.Cutscene.Changed:Connect(function(v676) --[[ Line: 2963 ]]
            -- upvalues: v675 (copy)
            if v676 then
                return;
            else
                v675();
                return;
            end;
        end);
        v669[#v669 + 1] = v672.Cutscene.Changed:Connect(function(v677) --[[ Line: 2968 ]]
            -- upvalues: v675 (copy)
            if v677 then
                return;
            else
                v675();
                return;
            end;
        end);
        if l_Workspace_1.Settings.PlayKnockdownOnSelf.Value then
            if v660.HasReverseKnockdowns then
                v660.ExtraTime = math.max(v666.ServerDelayTime - v667.ServerDelayTime, 0);
            end;
            v667.Use(v660);
        else
            if v660.HasReverseKnockdowns then
                v660.ExtraTime = math.max(v667.ServerDelayTime - v666.ServerDelayTime, 0);
            end;
            v666.Use(v660);
        end;
        return;
    end;
end;
v33.CreateImpactFrame = function(v678) --[[ Line: 2988 ]] --[[ Name: CreateImpactFrame ]]
    -- upvalues: l_TweenService_0 (copy)
    local v679 = v678 and v678.Time or 0.075;
    local v680 = {};
    for _, v682 in game.Lighting:GetChildren() do
        if v682:IsA("ColorCorrectionEffect") and v682.Enabled == true then
            v682.Enabled = false;
            table.insert(v680, v682);
        end;
    end;
    local l_ColorCorrectionEffect_1 = Instance.new("ColorCorrectionEffect");
    l_ColorCorrectionEffect_1.Parent = game.Lighting;
    l_ColorCorrectionEffect_1.Saturation = -1;
    local v684 = TweenInfo.new(v679, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, true, 0);
    l_TweenService_0:Create(l_ColorCorrectionEffect_1, v684, {
        Contrast = 60, 
        Brightness = 5
    }):Play();
    task.wait(v679 * 2);
    l_ColorCorrectionEffect_1:Destroy();
    for _, v686 in v680 do
        v686.Enabled = true;
    end;
end;
v33.AngledTransition = function(v687) --[[ Line: 3019 ]] --[[ Name: AngledTransition ]]
    -- upvalues: l_Common_0 (copy), l_TweenService_0 (copy)
    local l_FadeTime_0 = v687.FadeTime;
    local l_HoldTime_1 = v687.HoldTime;
    local v690 = l_Common_0.Angled:Clone();
    v690.Parent = l_Common_0;
    v690.Visible = true;
    local l_Main_2 = v690.Main;
    local v692 = TweenInfo.new(l_FadeTime_0, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
    local _ = TweenInfo.new(l_FadeTime_0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    l_Main_2.Position = UDim2.new(-1, 0, -2, 0);
    l_TweenService_0:Create(l_Main_2, v692, {
        Position = UDim2.new(-0.5, 0, -0.5, 0)
    }):Play();
    task.wait(l_FadeTime_0 + l_HoldTime_1);
    l_TweenService_0:Create(l_Main_2, v692, {
        Position = UDim2.new(0, 0, 1.5, 0)
    }):Play();
    task.wait(l_FadeTime_0 + l_HoldTime_1);
    l_Main_2:Destroy();
end;
local l_Transitions_0 = require(l_Modules_0:WaitForChild("Transitions"));
v33.MainTransitionS = function(v695) --[[ Line: 3044 ]] --[[ Name: MainTransitionS ]]
    -- upvalues: l_Transitions_0 (copy)
    local v696 = {
        FadeTime = v695[2] or 0.5, 
        HoldTime = v695[3] or 0.2
    };
    l_Transitions_0.MainTransition(v696);
end;
v33.MainTransition = function(v697) --[[ Line: 3053 ]] --[[ Name: MainTransition ]]
    -- upvalues: l_Transitions_0 (copy)
    l_Transitions_0.MainTransition(v697);
end;
v33.FadeTransition = function(v698) --[[ Line: 3057 ]] --[[ Name: FadeTransition ]]
    -- upvalues: l_Transitions_0 (copy)
    l_Transitions_0.FadeTransition(v698);
end;
v33.FightTransition = function(v699) --[[ Line: 3061 ]] --[[ Name: FightTransition ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Workspace_1 (copy), l_Main_0 (copy), l_RunService_0 (copy), v33 (copy), l_TweenService_0 (copy), l_Events_0 (copy), l_Transitions_0 (copy), l_SetAngleBE_0 (copy), l_SoundHelper_0 (copy)
    local v700 = {
        Target = v699[2], 
        FadeTime = v699[3], 
        EndDelay = v699[4], 
        SpawnCFrame1 = v699[5], 
        SpawnCFrame2 = v699[6], 
        Character1 = v699[7], 
        Character2 = v699[8]
    };
    local v701 = GetCharacterData(l_LocalPlayer_0.Character);
    local v702 = v701 and v701.Opponent.Value;
    local l_FadeTime_1 = v700.FadeTime;
    local l_EndDelay_0 = v700.EndDelay;
    local l_Target_0 = v700.Target;
    local l_CameraSettings_0 = l_Workspace_1:FindFirstChild("CameraSettings");
    local l_CameraTarget_0 = l_CameraSettings_0.CameraTarget;
    local l_CameraMode_0 = l_CameraSettings_0.CameraMode;
    local l_Variant_0 = l_CameraSettings_0.Variant;
    local l_Vignette_0 = l_Main_0.DownFrame.Vignette;
    local v711 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local l_Character1_0 = v700.Character1;
    local l_Character2_0 = v700.Character2;
    local v714 = true;
    if l_LocalPlayer_0.Character ~= l_Character1_0 then
        v714 = l_LocalPlayer_0.Character == l_Character2_0;
    end;
    local _ = {
        "LeftFrame", 
        "RightFrame"
    };
    if v714 then
        l_RunService_0:UnbindFromRenderStep("SceneCamera");
        l_RunService_0:UnbindFromRenderStep("CutsceneCamera");
        task.defer(function() --[[ Line: 3102 ]]
            -- upvalues: v33 (ref), l_FadeTime_1 (copy)
            v33.MainTransition({
                FadeTime = l_FadeTime_1, 
                HoldTime = 0.75
            });
        end);
        l_TweenService_0:Create(l_Vignette_0, v711, {
            ImageTransparency = 0.6
        }):Play();
    end;
    task.wait(l_FadeTime_1);
    local function _(v716, v717) --[[ Line: 3116 ]] --[[ Name: SetAnchorRoot ]]
        if not v716 or not v716.PrimaryPart then
            return;
        else
            v716.PrimaryPart.Anchored = v717;
            return;
        end;
    end;
    if l_Character1_0 then
        v33.SetTransparency(l_Character1_0, 0);
    end;
    if l_Character2_0 then
        v33.SetTransparency(l_Character2_0, 0);
    end;
    if workspace.FFlags.Entrances.Value then
        if v714 then
            l_Main_0.Enabled = false;
        end;
        local v719 = false;
        local function v722() --[[ Line: 3136 ]] --[[ Name: ResetEntrances ]]
            -- upvalues: v719 (ref), v714 (copy), l_RunService_0 (ref), l_Main_0 (ref), l_Events_0 (ref), l_Character1_0 (copy), v33 (ref), l_Character2_0 (copy)
            if v719 then
                return;
            else
                v719 = true;
                if v714 then
                    l_RunService_0:UnbindFromRenderStep("RingEntrance");
                    l_Main_0.Enabled = true;
                    if v714 then
                        l_Events_0.RefreshMapLighting:Fire();
                    end;
                end;
                if l_Character1_0 then
                    local l_l_Character1_0_0 = l_Character1_0;
                    if l_l_Character1_0_0 and l_l_Character1_0_0.PrimaryPart then
                        l_l_Character1_0_0.PrimaryPart.Anchored = false;
                    end;
                    v33.SetTransparency(l_Character1_0, 0);
                end;
                if l_Character2_0 then
                    local l_l_Character2_0_0 = l_Character2_0;
                    if l_l_Character2_0_0 and l_l_Character2_0_0.PrimaryPart then
                        l_l_Character2_0_0.PrimaryPart.Anchored = false;
                    end;
                    v33.SetTransparency(l_Character2_0, 0);
                end;
                return;
            end;
        end;
        local v723 = {};
        local v724 = false;
        local function v727() --[[ Line: 3163 ]] --[[ Name: ResetTransition ]]
            -- upvalues: v724 (ref), v723 (copy), v722 (copy), v714 (copy), l_Transitions_0 (ref), l_Variant_0 (copy), l_CameraMode_0 (copy), l_CameraTarget_0 (copy)
            if v724 then
                return;
            else
                v724 = true;
                for _, v726 in v723 do
                    v726:Disconnect();
                end;
                v722();
                if not v714 then
                    return;
                else
                    l_Transitions_0.RemoveTransitionItems();
                    l_Variant_0.Value = "";
                    l_CameraMode_0.Value = "";
                    l_CameraTarget_0.Value = nil;
                    return;
                end;
            end;
        end;
        if l_Character1_0 then
            v723[#v723 + 1] = l_Character1_0.AncestryChanged:Connect(function() --[[ Line: 3182 ]]
                -- upvalues: v727 (copy)
                v727();
            end);
        end;
        if l_Character2_0 then
            v723[#v723 + 1] = l_Character2_0.AncestryChanged:Connect(function() --[[ Line: 3188 ]]
                -- upvalues: v727 (copy)
                v727();
            end);
        end;
        local function v728() --[[ Line: 3193 ]] --[[ Name: FinalTransition ]]
            -- upvalues: v722 (copy), v714 (copy), l_Variant_0 (copy), l_LocalPlayer_0 (ref), l_Character1_0 (copy), l_SetAngleBE_0 (ref), l_CameraTarget_0 (copy), l_Target_0 (copy), l_CameraMode_0 (copy), l_FadeTime_1 (copy), l_SoundHelper_0 (ref), l_Workspace_1 (ref), l_EndDelay_0 (copy), v724 (ref), v727 (copy), v702 (copy), l_TweenService_0 (ref), l_Vignette_0 (copy), v711 (copy), v33 (ref), l_Main_0 (ref)
            v722();
            if not v714 then
                return;
            else
                l_Variant_0.Value = l_LocalPlayer_0.Character == l_Character1_0 and "Reverse" or "";
                l_SetAngleBE_0:Fire(0);
                l_CameraTarget_0.Value = l_Target_0;
                l_CameraMode_0.Value = "StartFight";
                task.delay(l_FadeTime_1 * 0.95, function() --[[ Line: 3207 ]]
                    -- upvalues: l_SoundHelper_0 (ref), l_Workspace_1 (ref)
                    l_SoundHelper_0:PlaySound({
                        Name = "MatchGot", 
                        Parent = l_Workspace_1.Debris
                    });
                end);
                task.wait(l_EndDelay_0);
                v724 = false;
                v727();
                l_SoundHelper_0:PlaySound({
                    Name = "StartMatch", 
                    Parent = l_Workspace_1
                });
                l_SoundHelper_0:PlaySound({
                    Name = "Box", 
                    Parent = l_Workspace_1
                });
                if v702 and v702:GetAttribute("ActiveNPC") then
                    return;
                else
                    l_TweenService_0:Create(l_Vignette_0, v711, {
                        ImageTransparency = 1
                    }):Play();
                    task.delay(0.5, function() --[[ Line: 3233 ]]
                        -- upvalues: v33 (ref), l_Main_0 (ref)
                        v33.TripleText({
                            Image = l_Main_0.DownFrame.Fight, 
                            HoldTime = 1
                        });
                    end);
                    return;
                end;
            end;
        end;
        local v729 = GetPlayerData(l_Character1_0);
        local v730 = GetPlayerData(l_Character2_0);
        local v731 = v33.GetEntranceMetadata({
            Subeffect = v729.Entrance.Value
        });
        local v732 = v33.GetEntranceMetadata({
            Subeffect = v730.Entrance.Value
        });
        if v731 then
            local l_CharacterOffset_0 = v731.CharacterOffset;
            if l_CharacterOffset_0 then
                v700.SpawnCFrame1 = v700.SpawnCFrame1 * l_CharacterOffset_0;
            end;
        end;
        if v732 then
            local l_CharacterOffset_1 = v732.CharacterOffset;
            if l_CharacterOffset_1 then
                v700.SpawnCFrame2 = v700.SpawnCFrame2 * l_CharacterOffset_1;
            end;
        end;
        if l_Character1_0 and l_Character2_0 then
            local function v737() --[[ Line: 3270 ]] --[[ Name: TrySkip ]]
                -- upvalues: l_Character1_0 (copy), l_Character2_0 (copy), l_Events_0 (ref), v724 (ref), v728 (copy)
                local v735 = l_Character1_0 and l_Character1_0:GetAttribute("SkipEntrances");
                local v736 = l_Character2_0 and l_Character2_0:GetAttribute("SkipEntrances");
                if not v735 or not v736 then
                    return;
                else
                    l_Events_0.CleanupEntrances:Fire();
                    v724 = true;
                    task.delay(0.5, function() --[[ Line: 3281 ]]
                        -- upvalues: v728 (ref)
                        v728();
                    end);
                    return;
                end;
            end;
            v723[#v723 + 1] = l_Character1_0:GetAttributeChangedSignal("SkipEntrances"):Connect(function() --[[ Line: 3286 ]]
                -- upvalues: v737 (copy)
                v737();
            end);
            v723[#v723 + 1] = l_Character2_0:GetAttributeChangedSignal("SkipEntrances"):Connect(function() --[[ Line: 3290 ]]
                -- upvalues: v737 (copy)
                v737();
            end);
        end;
        task.spawn(function() --[[ Line: 3296 ]]
            -- upvalues: l_RunService_0 (ref), l_Character1_0 (copy), l_Character2_0 (copy), v700 (copy), v723 (copy)
            local v738 = nil;
            v738 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 3298 ]]
                -- upvalues: l_Character1_0 (ref), l_Character2_0 (ref), v700 (ref)
                local l_l_Character1_0_1 = l_Character1_0;
                if l_l_Character1_0_1 and l_l_Character1_0_1.PrimaryPart then
                    l_l_Character1_0_1.PrimaryPart.Anchored = true;
                end;
                l_l_Character1_0_1 = l_Character2_0;
                if l_l_Character1_0_1 and l_l_Character1_0_1.PrimaryPart then
                    l_l_Character1_0_1.PrimaryPart.Anchored = true;
                end;
                if l_Character1_0 then
                    l_Character1_0:PivotTo(v700.SpawnCFrame1);
                end;
                if l_Character2_0 then
                    l_Character2_0:PivotTo(v700.SpawnCFrame2);
                end;
            end);
            v723[#v723 + 1] = v738;
            task.wait(4);
            if v738 then
                v738:Disconnect();
            end;
        end);
        task.wait(0.2);
        if v724 then
            return;
        else
            v33.Entrance({
                Character = l_Character1_0, 
                Subeffect = v729.Entrance.Value, 
                IsInvolved = v714
            });
            v33.SetTransparency(l_Character1_0, 0);
            v33.SetTransparency(l_Character2_0, 1);
            if v731 then
                task.wait((v731.Time or 0) + 0.5);
                if v724 then
                    return;
                else
                    if v714 then
                        l_Events_0.RefreshMapLighting:Fire();
                    end;
                    task.wait(0.15);
                end;
            end;
            if v724 then
                return;
            else
                v33.SetTransparency(l_Character1_0, 1);
                v33.SetTransparency(l_Character2_0, 0);
                v33.Entrance({
                    Character = v700.Character2, 
                    Subeffect = v730.Entrance.Value, 
                    IsInvolved = v714
                });
                if v732 then
                    task.wait(v732.Time or 0);
                    task.wait(0.5);
                end;
                if v724 then
                    return;
                else
                    v728();
                    return;
                end;
            end;
        end;
    elseif not v714 then
        return;
    else
        l_Variant_0.Value = l_LocalPlayer_0.Character == v700.Character1 and "Reverse" or "";
        l_SetAngleBE_0:Fire(0);
        l_CameraTarget_0.Value = l_Target_0;
        l_CameraMode_0.Value = "StartFight";
        task.delay(l_FadeTime_1 * 0.95, function() --[[ Line: 3368 ]]
            -- upvalues: l_SoundHelper_0 (ref), l_Workspace_1 (ref)
            l_SoundHelper_0:PlaySound({
                Name = "MatchGot", 
                Parent = l_Workspace_1.Debris
            });
        end);
        l_Transitions_0.RemoveTransitionItems();
        task.wait(l_EndDelay_0);
        l_Variant_0.Value = "";
        l_CameraMode_0.Value = "";
        l_CameraTarget_0.Value = nil;
        l_SoundHelper_0:PlaySound({
            Name = "StartMatch", 
            Parent = l_Workspace_1
        });
        l_SoundHelper_0:PlaySound({
            Name = "Box", 
            Parent = l_Workspace_1
        });
        if v702 and v702:GetAttribute("ActiveNPC") then
            return;
        else
            l_TweenService_0:Create(l_Vignette_0, v711, {
                ImageTransparency = 1
            }):Play();
            task.delay(0.5, function() --[[ Line: 3395 ]]
                -- upvalues: v33 (ref), l_Main_0 (ref)
                v33.TripleText({
                    Image = l_Main_0.DownFrame.Fight, 
                    HoldTime = 1
                });
            end);
            return;
        end;
    end;
end;
local function _(v740) --[[ Line: 3403 ]] --[[ Name: ScaleToOffset ]]
    local l_ViewportSize_0 = workspace.Camera.ViewportSize;
    return {
        l_ViewportSize_0.X * v740[1], 
        l_ViewportSize_0.Y * v740[2]
    };
end;
local function _(v743) --[[ Line: 3408 ]] --[[ Name: OffsetToScale ]]
    local l_ViewportSize_1 = workspace.Camera.ViewportSize;
    return {
        v743[1] / l_ViewportSize_1.X, 
        v743[2] / l_ViewportSize_1.Y
    };
end;
v33.CreateMoneyEffect = function(v746) --[[ Line: 3413 ]] --[[ Name: CreateMoneyEffect ]]
    -- upvalues: l_Main_0 (copy), l_RunService_0 (copy), v34 (copy), l_Bezier_0 (copy), l_SoundHelper_0 (copy), l_Workspace_1 (copy), l_TweenService_0 (copy)
    local l_Amount_0 = v746.Amount;
    local v748 = v746.StartPosition or UDim2.new(0.5, 0, 0.5, 0);
    local v749 = v746.CashFrame or l_Main_0.LeftFrame.Container.CashFrame;
    local v750 = v746.MoneyImage or v749.Parent.Parent.MoneyImage;
    local l_Image_2 = v749.Image;
    local v752 = l_Image_2:Clone();
    v752.Parent = v749;
    local v753 = nil;
    local v754 = Vector3.new(v748.X.Scale, 0, v748.Y.Scale);
    local v755 = {
        l_Image_2.AbsoluteSize.X, 
        l_Image_2.AbsoluteSize.Y
    };
    local l_ViewportSize_2 = workspace.Camera.ViewportSize;
    local v757 = {
        v755[1] / l_ViewportSize_2.X, 
        v755[2] / l_ViewportSize_2.Y
    };
    l_ViewportSize_2 = {
        l_Image_2.AbsolutePosition.X, 
        l_Image_2.AbsolutePosition.Y + 60
    };
    local l_ViewportSize_3 = workspace.Camera.ViewportSize;
    v755 = {
        l_ViewportSize_2[1] / l_ViewportSize_3.X, 
        l_ViewportSize_2[2] / l_ViewportSize_3.Y
    };
    l_ViewportSize_2 = Vector3.new(v757[1] / 2 + v755[1], 0, v755[2]);
    l_ViewportSize_3 = {};
    local v759 = nil;
    v759 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 3436 ]]
        -- upvalues: l_ViewportSize_3 (ref)
        for _, v761 in l_ViewportSize_3 do
            local l_Image_3 = v761.Image;
            local l_Curve_0 = v761.Curve;
            local l_StartTime_0 = v761.StartTime;
            local l_AnimateTime_0 = v761.AnimateTime;
            local v766 = l_Curve_0:Get(math.clamp(tick() - l_StartTime_0, 0, l_AnimateTime_0) / l_AnimateTime_0);
            l_Image_3.Position = UDim2.new(v766.X, 0, v766.Z, 0);
        end;
    end);
    for v767 = 1, l_Amount_0 do
        local v768 = v750:Clone();
        v768.Size = UDim2.new(0, 0, 0, 0);
        v768.Parent = v750.Parent;
        v768.Visible = true;
        local v769 = v754 + Vector3.new(v34:NextNumber(-0.2, 0.2), 0, v34:NextNumber(-0.35, 0.35));
        local v770 = v34:NextNumber(1.3, 1.8);
        l_ViewportSize_3[v767] = {
            Image = v768, 
            Curve = l_Bezier_0.new(v754, v769, l_ViewportSize_2), 
            StartTime = tick(), 
            AnimateTime = v770
        };
        local v771 = v34:NextNumber(1.1, 1.4);
        if v767 % 3 == 0 then
            l_SoundHelper_0:PlaySound({
                Name = "Pop", 
                Parent = l_Workspace_1, 
                Speed = v34:NextNumber(0.2, 0.7)
            });
        end;
        task.defer(function() --[[ Line: 3479 ]]
            -- upvalues: l_TweenService_0 (ref), v768 (copy), v770 (copy), v750 (copy), v771 (copy), v767 (copy), l_SoundHelper_0 (ref), l_Workspace_1 (ref), v34 (ref), v753 (ref), v752 (copy), l_Image_2 (copy)
            l_TweenService_0:Create(v768, TweenInfo.new(v770 / 2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, v750.AbsoluteSize.X * v771, 0, v750.AbsoluteSize.Y * v771)
            }):Play();
            task.wait(v770 * 0.4);
            l_TweenService_0:Create(v768, TweenInfo.new(v770 / 2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, v750.AbsoluteSize.X * 0.9, 0, v750.AbsoluteSize.Y * 0.9)
            }):Play();
            task.wait(v770 * 0.5);
            l_TweenService_0:Create(v768, TweenInfo.new(v770 / 6, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0)
            }):Play();
            if v767 % 3 == 0 then
                l_SoundHelper_0:PlaySound({
                    Name = "Money", 
                    Parent = l_Workspace_1, 
                    Speed = v34:NextNumber(0.9, 1.1)
                });
                if v753 then
                    v753:Cancel();
                end;
                v752.Size = l_Image_2.Size;
                v753 = l_TweenService_0:Create(v752, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true), {
                    Size = UDim2.new(l_Image_2.Size.X.Scale * 1.2, 0, l_Image_2.Size.Y.Scale * 1.2, 0)
                }):Play();
            end;
        end);
        if v767 % 2 == 0 then
            l_RunService_0.RenderStepped:Wait();
        end;
    end;
    task.wait(2.5);
    v759:Disconnect();
    v752:Destroy();
    for _, v773 in l_ViewportSize_3 do
        local l_Image_4 = v773.Image;
        if l_Image_4 then
            l_Image_4:Destroy();
        end;
    end;
    l_ViewportSize_3 = nil;
end;
v33.CreateResultsGui = function(v775) --[[ Line: 3535 ]] --[[ Name: CreateResultsGui ]]
    -- upvalues: l_Main_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Workspace_1 (copy), l_LocalPlayer_0 (copy), l_RunService_0 (copy), v33 (copy)
    local v776 = {
        StatValues = v775[2]
    };
    local v777 = l_Main_0.Reward.Main:Clone();
    v777.Parent = l_Main_0.Reward;
    local l_Size_5 = v777.Size;
    v777.Size = UDim2.new(0, 0, 0, 0);
    v777.Visible = true;
    l_TweenService_0:Create(v777, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Size = l_Size_5
    }):Play();
    local l_Results_0 = v777.Results;
    local l_Bonus_0 = l_Results_0.Bonus;
    local v781 = #l_Bonus_0:GetChildren();
    local v782 = v776 and v776.StatValues or {};
    local v783 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    for v784 = 1, v781 do
        local l_l_Bonus_0_FirstChild_0 = l_Bonus_0:FindFirstChild(v784);
        if l_l_Bonus_0_FirstChild_0 then
            local l_Left_0 = l_l_Bonus_0_FirstChild_0.Left;
            local l_Right_0 = l_l_Bonus_0_FirstChild_0.Right;
            local v788 = l_l_Bonus_0_FirstChild_0:FindFirstChild("Stat") and l_l_Bonus_0_FirstChild_0.Stat.Value;
            if v788 then
                l_Right_0.Text = v782[v788] or 0;
                local l_Position_1 = l_Left_0.Position;
                local l_Position_2 = l_Right_0.Position;
                l_Left_0.Position = UDim2.new(l_Position_1.X.Scale - 2, 0, l_Position_1.Y.Scale, 0);
                l_Right_0.Position = UDim2.new(l_Position_2.X.Scale + 2, 0, l_Position_2.Y.Scale, 0);
                local v791 = (v784 - 1) * 0.15;
                task.delay(v791, function() --[[ Line: 3575 ]]
                    -- upvalues: l_TweenService_0 (ref), l_Left_0 (copy), v783 (copy), l_Position_1 (copy), l_Right_0 (copy), l_Position_2 (copy), l_SoundHelper_0 (ref), l_Workspace_1 (ref)
                    l_TweenService_0:Create(l_Left_0, v783, {
                        Position = l_Position_1
                    }):Play();
                    l_TweenService_0:Create(l_Right_0, v783, {
                        Position = l_Position_2
                    }):Play();
                    task.wait(0.3);
                    l_SoundHelper_0:PlaySound({
                        Name = "Bonus", 
                        Parent = l_Workspace_1
                    });
                end);
            end;
        end;
    end;
    local l_Earned_0 = l_Results_0.Earned;
    local l_Position_3 = l_Earned_0.Position;
    local l_Size_6 = l_Earned_0.Size;
    l_Earned_0.Position = UDim2.new(l_Position_3.X.Scale - 1, 0, l_Position_3.Y.Scale, 0);
    local v795 = {};
    local v796 = false;
    local function v800() --[[ Line: 3596 ]] --[[ Name: Close ]]
        -- upvalues: v796 (ref), v795 (copy), l_SoundHelper_0 (ref), l_Workspace_1 (ref), l_TweenService_0 (ref), v777 (copy)
        if v796 then
            return;
        else
            v796 = true;
            for _, v798 in v795 do
                v798:Disconnect();
            end;
            l_SoundHelper_0:PlaySound({
                Name = "Close", 
                Parent = l_Workspace_1
            });
            local v799 = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
            l_TweenService_0:Create(v777, v799, {
                Size = UDim2.new(v777.Size.X.Scale, 0, 0, 0)
            }):Play();
            task.wait(0.1);
            l_TweenService_0:Create(v777.UIStroke, v799, {
                Transparency = 1
            }):Play();
            l_TweenService_0:Create(v777, v799, {
                Size = UDim2.new(0, 0, 0, 0)
            }):Play();
            task.wait(0.1875);
            if v777 then
                v777:Destroy();
            end;
            return;
        end;
    end;
    v795[1] = GetCharacterData(l_LocalPlayer_0.Character).Opponent.Changed:Connect(function(v801) --[[ Line: 3624 ]]
        -- upvalues: v800 (copy)
        if not v801 then
            return;
        else
            v800();
            return;
        end;
    end);
    v795[2] = l_Workspace_1.CurrentMenu.Changed:Connect(function() --[[ Line: 3629 ]]
        -- upvalues: v800 (copy)
        v800();
    end);
    task.wait(0.3);
    l_TweenService_0:Create(l_Earned_0, v783, {
        Position = l_Position_3
    }):Play();
    local l_Earned_1 = l_Earned_0.Earned;
    local l_EarnedShadow_0 = l_Earned_0.EarnedShadow;
    l_Earned_0.Size = UDim2.new(l_Size_6.X.Scale * 0.7, 0, l_Size_6.Y.Scale * 0.7, 0);
    local l_Total_0 = v782.Total;
    local v805 = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In);
    l_TweenService_0:Create(l_Earned_0, v805, {
        Size = l_Size_6
    }):Play();
    local v806 = tick();
    local v807 = nil;
    v807 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 3651 ]]
        -- upvalues: v806 (copy), l_Total_0 (copy), l_TweenService_0 (ref), l_Earned_1 (copy), l_EarnedShadow_0 (copy)
        local v808 = math.clamp(tick() - v806, 0, 1) / 1;
        l_Earned_1.Text = "+$" .. math.floor(l_Total_0 * l_TweenService_0:GetValue(v808, Enum.EasingStyle.Quint, Enum.EasingDirection.In)) .. " CASH";
        l_EarnedShadow_0.Text = l_Earned_1.Text;
    end);
    task.delay(0.6, function() --[[ Line: 3660 ]]
        -- upvalues: l_TweenService_0 (ref), l_Earned_0 (copy)
        l_TweenService_0:Create(l_Earned_0.Glow, TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, true), {
            ImageTransparency = 0
        }):Play();
    end);
    task.wait(0.8);
    local v809 = false;
    task.delay(0.8, function() --[[ Line: 3668 ]]
        -- upvalues: v809 (ref), v807 (ref), l_Earned_1 (copy), l_Total_0 (copy), l_EarnedShadow_0 (copy)
        if v809 then
            return;
        else
            if v807 then
                v807:Disconnect();
            end;
            l_Earned_1.Text = "+$" .. l_Total_0 .. " CASH";
            l_EarnedShadow_0.Text = l_Earned_1.Text;
            return;
        end;
    end);
    local v810 = TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
    l_TweenService_0:Create(l_Earned_0, v810, {
        Size = UDim2.new(l_Size_6.X.Scale * 1.2, 0, l_Size_6.Y.Scale * 1.2, 0)
    }):Play();
    local v811 = GetPlayerData(l_LocalPlayer_0);
    local v812 = nil;
    local l_Value_5 = v811.Cash.Value;
    v812 = v811.Cash.Changed:Connect(function(v814) --[[ Line: 3684 ]]
        -- upvalues: v809 (ref), v807 (ref), l_RunService_0 (ref), l_Total_0 (copy), l_Value_5 (copy), l_TweenService_0 (ref), l_Earned_1 (copy), l_EarnedShadow_0 (copy)
        v809 = true;
        if v807 then
            v807:Disconnect();
        end;
        local v815 = tick();
        v807 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 3691 ]]
            -- upvalues: v815 (copy), l_Total_0 (ref), v814 (copy), l_Value_5 (ref), l_TweenService_0 (ref), l_Earned_1 (ref), l_EarnedShadow_0 (ref)
            local v816 = math.clamp(tick() - v815, 0, 3) / 3;
            local l_l_Total_0_0 = l_Total_0;
            local v818 = v814 - l_Value_5;
            local l_l_TweenService_0_Value_1 = l_TweenService_0:GetValue(v816, Enum.EasingStyle.Quint, Enum.EasingDirection.In);
            l_Earned_1.Text = "+$" .. math.floor(l_l_Total_0_0 + (v818 - l_l_Total_0_0) * l_l_TweenService_0_Value_1) .. " CASH";
            l_EarnedShadow_0.Text = l_Earned_1.Text;
        end);
        task.delay(2, function() --[[ Line: 3700 ]]
            -- upvalues: v807 (ref), l_Earned_1 (ref), v814 (copy), l_Value_5 (ref), l_EarnedShadow_0 (ref)
            if v807 then
                v807:Disconnect();
            end;
            l_Earned_1.Text = "+$" .. v814 - l_Value_5 .. " CASH";
            l_EarnedShadow_0.Text = l_Earned_1.Text;
        end);
    end);
    task.delay(4, function() --[[ Line: 3707 ]]
        -- upvalues: v812 (ref)
        if v812 then
            v812:Disconnect();
        end;
    end);
    l_SoundHelper_0:PlaySound({
        Name = "GetMoney", 
        Parent = l_Workspace_1
    });
    task.defer(function() --[[ Line: 3716 ]]
        -- upvalues: v33 (ref), l_Total_0 (copy), v777 (copy)
        task.wait(0.3);
        v33.CreateMoneyEffect({
            Amount = math.floor(l_Total_0 / 6), 
            StartPosition = v777.Parent.MoneyOrigin.Position
        });
    end);
    task.wait(0.2);
    v810 = TweenInfo.new(1.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
    l_TweenService_0:Create(l_Earned_0, v810, {
        Size = l_Size_6
    }):Play();
    local v820 = v775[3];
    if v820 then
        task.wait(0.8);
        v33.CreateCrateEffect(v820);
    end;
    v777.Top.ImageButton.MouseButton1Click:Connect(function() --[[ Line: 3740 ]]
        -- upvalues: v800 (copy)
        v800();
    end);
    task.delay(15, function() --[[ Line: 3744 ]]
        -- upvalues: v800 (copy)
        v800();
    end);
end;
v33.CreateRankedResultsGui = function(v821) --[[ Line: 3749 ]] --[[ Name: CreateRankedResultsGui ]]
    -- upvalues: v33 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), l_Workspace_1 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy)
    local v822 = v821[8];
    if v822 then
        v33.CreateCrateEffect(v822);
    end;
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.ResetOnSpawn = false;
    l_ScreenGui_0.IgnoreGuiInset = true;
    l_ScreenGui_0.Parent = l_LocalPlayer_0.PlayerGui;
    l_ScreenGui_0.DisplayOrder = 0;
    local l_Ranked_0 = l_Common_0.Ranked;
    l_Ranked_0.Parent = l_ScreenGui_0;
    l_Ranked_0.Visible = true;
    l_Workspace_1.VolumeMult.Value = 0;
    l_Workspace_1.VolumeMult.Changed:Connect(function() --[[ Line: 3766 ]]
        -- upvalues: l_Workspace_1 (ref)
        l_Workspace_1.VolumeMult.Value = 0;
    end);
    task.wait(0.2);
    local v825 = v821[2];
    local v826 = v821[3];
    local v827 = v821[4];
    local v828 = v821[5];
    local v829 = v821[6];
    local v830 = v821[7];
    local v831 = nil;
    local v832 = nil;
    if v825 then
        v831 = l_Ranked_0.Victory;
        v832 = script.WinTheme;
    else
        v831 = l_Ranked_0.Defeat;
        v832 = script.LossTheme;
    end;
    l_SoundHelper_0:PlaySound({
        Name = v825 and "Victory" or "Defeat", 
        Parent = l_Workspace_1
    });
    task.delay(1.5, function() --[[ Line: 3795 ]]
        -- upvalues: v832 (ref), l_Workspace_1 (ref)
        v832.Parent = l_Workspace_1;
        v832.SoundId = v832.StoredId.Value;
        v832:Play();
    end);
    local l_Main_3 = l_Ranked_0.Main;
    l_Main_3.Rating.Text = "RATING: " .. tostring(v826) .. " \226\134\146 " .. tostring(v827);
    if v830 < 5 then
        l_Main_3.Rating.Text = "PLACEMENT GAMES: " .. tostring(v830) .. "/" .. tostring(5);
    elseif v830 == 5 then
        l_Main_3.Rating.Text = "RATING ACHIEVED: " .. tostring(v827) .. "!";
    end;
    l_Main_3.Cash.Text = "CASH EARNED: $" .. tostring(v828);
    if v829 then
        l_Main_3.TierReward.Visible = true;
    end;
    local l_Position_4 = v831.Position;
    v831.Position = UDim2.new(l_Position_4.X.Scale, 0, -1, 0);
    local v835 = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
    local l_Position_5 = l_Main_3.Position;
    l_Main_3.Position = UDim2.new(l_Position_5.X.Scale, 0, 1, 0);
    l_TweenService_0:Create(l_Main_3, v835, {
        Position = l_Position_5
    }):Play();
    l_TweenService_0:Create(v831, v835, {
        Position = l_Position_4
    }):Play();
    v831.Visible = true;
    l_Main_3.Visible = true;
    l_Ranked_0.Fade.Visible = true;
    l_TweenService_0:Create(l_Ranked_0.Fade, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.4
    }):Play();
end;
local l_Gloves_0 = l_ReplicatedStorage_0:WaitForChild("Gloves");
local l_Crates_0 = l_Modules_0:WaitForChild("Crates");
local v839 = require(l_Crates_0);
local v840 = {
    Uncommon = Color3.fromRGB(132, 255, 38), 
    Rare = Color3.fromRGB(87, 140, 255), 
    Mythic = Color3.fromRGB(255, 107, 255), 
    Legendary = Color3.fromRGB(255, 255, 0)
};
formatNumberWithCommas = function(v841) --[[ Line: 3845 ]] --[[ Name: formatNumberWithCommas ]]
    local v842 = string.format("%d", v841);
    local v843, v844, v845 = string.match(v842, "^([^%d]*%d)(%d*)(.-)$");
    return v843 .. v844:reverse():gsub("(%d%d%d)", "%1,"):reverse() .. v845;
end;
local l_SpecialRewardHelper_0 = require(l_Modules_0:WaitForChild("SpecialRewardHelper"));
local function v878(v847) --[[ Line: 3852 ]] --[[ Name: GenerateRewardRows ]]
    -- upvalues: v34 (copy), l_SpecialRewardHelper_0 (copy), v840 (copy), l_Gloves_0 (copy)
    local l_MaxItems_0 = v847.MaxItems;
    local l_Container_0 = v847.Container;
    local l_RowTemplate_0 = v847.RowTemplate;
    local l_FinalIndex_0 = v847.FinalIndex;
    local l_Reward_0 = v847.Reward;
    local l_Metadata_0 = v847.Metadata;
    local l_LegendaryRarity_0 = v847.LegendaryRarity;
    local l_MythicRarity_0 = v847.MythicRarity;
    local l_RareRarity_0 = v847.RareRarity;
    local l_DropsByRarity_0 = v847.DropsByRarity;
    local l_Rates_0 = v847.Rates;
    local l_LuckyCrateRate_0 = v847.LuckyCrateRate;
    local l_IsMobile_0 = v847.IsMobile;
    local l_Special_0 = l_Metadata_0.Special;
    if l_Metadata_0.IsGloveCrate then
        l_Special_0 = false;
    end;
    for v862 = 1, l_MaxItems_0 do
        local v863 = nil;
        local v864 = nil;
        local v865 = l_Rates_0.Unusual * 2 * (workspace:GetAttribute("UnusualMult") or 1);
        if l_LuckyCrateRate_0 then
            v865 = v865 * (l_LuckyCrateRate_0 / 2);
        end;
        local v866 = v34:NextNumber(0, 100) <= v865;
        if l_Special_0 then
            if v862 == l_FinalIndex_0 then
                v864 = l_Reward_0;
                v863 = l_Reward_0.Rarity;
            else
                v864 = l_SpecialRewardHelper_0.GetRandomReward(l_Metadata_0);
                v863 = v864.Rarity;
            end;
        elseif v862 == l_FinalIndex_0 then
            v864 = l_Reward_0.Name;
        else
            local v867 = v862 == l_FinalIndex_0 and 1 or v34:NextNumber(0, 100);
            if l_LuckyCrateRate_0 and not v866 then
                v863 = "Mythic";
                if v867 <= 20 then
                    v863 = "Legendary";
                end;
            else
                v863 = "Uncommon";
                if v867 <= l_LegendaryRarity_0 then
                    v863 = "Legendary";
                elseif v867 <= l_MythicRarity_0 + l_LegendaryRarity_0 then
                    v863 = "Mythic";
                elseif v867 <= l_MythicRarity_0 + l_LegendaryRarity_0 + l_RareRarity_0 then
                    v863 = "Rare";
                end;
            end;
            if #l_DropsByRarity_0[v863] <= 0 then
                v863 = "Uncommon";
            end;
            local v868 = l_DropsByRarity_0[v863];
            if v868 then
                v864 = v868[v34:NextInteger(1, #v868)];
            else
                continue;
            end;
        end;
        if v862 == l_FinalIndex_0 then
            v866 = l_Reward_0.Unusual;
        end;
        local v869 = l_Special_0 and l_Container_0.BasicTemplate or l_Container_0.GloveTemplate;
        local v870 = nil;
        if type(v864) == "table" and v864.Type then
            v870 = l_Container_0.SpecialTemplates:FindFirstChild(v864.Type .. "Template");
        end;
        if v870 then
            v869 = v870;
        end;
        v869 = v869:Clone();
        v869.Name = v862;
        v869.LayoutOrder = v862;
        v869.Parent = l_RowTemplate_0;
        if l_IsMobile_0 then
            v869.Main.UIStroke.Thickness = 1.5;
        end;
        if v863 == "Legendary" then
            v869.Main.Glow.ImageTransparency = 0.15;
            v869.Main.UIStroke.Color = Color3.fromRGB(255, 229, 29);
            v869.Main.Glow.ImageColor3 = Color3.fromRGB(255, 229, 29);
        end;
        local v871 = 0;
        if l_Special_0 then
            v871 = v864.Chance or 0;
        elseif l_DropsByRarity_0 and l_DropsByRarity_0[v863] then
            v871 = l_Rates_0[v863] / #l_DropsByRarity_0[v863];
        end;
        if not v870 then
            if l_Special_0 then
                v869.Main.Background.ImageColor3 = v840[v863];
                v869.Main.Glow.ImageColor3 = v840[v863];
                local l_Top_0 = v869.Main.Top;
                local l_Bottom_0 = v869.Main.Bottom;
                l_Top_0.Default.Enabled = false;
                if v864.Type == "Cash" then
                    l_Top_0.Text = formatNumberWithCommas(v864.Amount);
                    l_Bottom_0.Text = "EXTRA CASH";
                    l_Top_0.Cash.Enabled = true;
                elseif v864.Type == "Spins" then
                    l_Top_0.Text = v864.Amount .. " STYLE";
                    l_Bottom_0.Text = "SPINS";
                    l_Top_0.Spins.Enabled = true;
                elseif v864.Type == "LuckySpins" then
                    l_Top_0.Text = v864.Amount .. " LUCKY";
                    l_Bottom_0.Text = "SPINS";
                    l_Top_0.Spins.Enabled = true;
                elseif v864.Type == "LuckyCrates" then
                    l_Top_0.Text = v864.Amount .. " LUCKY";
                    l_Bottom_0.Text = "CRATES";
                    l_Top_0.Spins.Enabled = true;
                elseif v864.Type == "Slot" then
                    l_Top_0.Text = "STYLE";
                    l_Bottom_0.Text = "SLOT";
                    l_Top_0.Default.Enabled = true;
                elseif v864.Type == "Emote" then
                    l_Top_0.Text = "EMOTE";
                    l_Bottom_0.Text = "SPIN";
                    l_Top_0.Default.Enabled = true;
                elseif string.find(v864.Type, "Shards") then
                    l_Top_0.Text = v864.Amount .. " SHINY";
                    l_Bottom_0.Text = "SHARDS";
                    l_Top_0.Spins.Enabled = true;
                end;
                local l_FirstChild_20 = v869.Main.Images:FindFirstChild(v864.Type);
                if l_FirstChild_20 then
                    l_FirstChild_20.Visible = true;
                end;
                if l_Bottom_0.Text == "SPINS" and v864.Amount <= 1 then
                    l_Bottom_0.Text = "SPIN";
                elseif l_Bottom_0.Text == "CRATES" and v864.Amount <= 1 then
                    l_Bottom_0.Text = "CRATE";
                end;
            else
                local l_l_Gloves_0_FirstChild_0 = l_Gloves_0:FindFirstChild(v864);
                if l_l_Gloves_0_FirstChild_0 then
                    l_l_Gloves_0_FirstChild_0 = l_l_Gloves_0_FirstChild_0:Clone();
                    l_l_Gloves_0_FirstChild_0.Parent = v869.Main.ViewportFrame;
                    local v876 = require(l_l_Gloves_0_FirstChild_0.Metadata);
                    if not v863 then
                        v863 = v876.Rarity;
                        l_Reward_0.Rarity = v863;
                        v871 = l_Rates_0[v863] / #l_DropsByRarity_0[v863];
                    end;
                    v869.Main.Background.ImageColor3 = v840[v863];
                    v869.Main.Glow.ImageColor3 = v840[v863];
                    v869.Main.GloveName.Text = v876.DisplayName;
                    if v866 then
                        v871 = v871 * (v865 / 200 / 2);
                        v869.Main.Glow.ImageColor3 = Color3.fromRGB(198, 55, 255);
                        v869.Main.UIStroke.Color = Color3.fromRGB(198, 55, 255);
                        v869.Main.Background.Visible = false;
                        v869.Main.Unusual.Visible = true;
                    end;
                else
                    continue;
                end;
            end;
        end;
        if v864.PercentText and v864.PercentText >= 0 then
            v871 = v864.PercentText;
        end;
        local v877 = tostring(v871);
        if math.ceil(v871) ~= v871 and not v866 then
            v877 = string.format("%.2f", v871);
        end;
        v869.Main.Percent.Text = v877 .. "%";
        v869.Visible = true;
    end;
end;
local function v902(v879) --[[ Line: 4071 ]] --[[ Name: GenerateEmoteRows ]]
    -- upvalues: l_Emotes_0 (copy), v840 (copy)
    local l_MaxItems_1 = v879.MaxItems;
    local l_FrameTemplate_0 = v879.FrameTemplate;
    local l_RowTemplate_1 = v879.RowTemplate;
    local l_FinalIndex_1 = v879.FinalIndex;
    local l_Reward_1 = v879.Reward;
    local l_IsMobile_1 = v879.IsMobile;
    local l_OwnedEmotes_0 = v879.OwnedEmotes;
    local v887 = {};
    for _, v889 in l_Emotes_0 do
        local l_Name_0 = v889.Metadata.Name;
        if not table.find(l_OwnedEmotes_0, l_Name_0) and not v889.Metadata.Unrollable then
            table.insert(v887, l_Name_0);
        end;
    end;
    table.insert(v887, l_Reward_1);
    for v891 = 1, l_MaxItems_1 do
        local v892 = l_FrameTemplate_0:Clone();
        v892.Name = v891;
        v892.LayoutOrder = v891;
        v892.Parent = l_RowTemplate_1;
        local v893 = nil;
        v893 = if v891 == l_FinalIndex_1 then l_Reward_1 else v887[math.random(1, #v887)];
        if l_IsMobile_1 then
            v892.Main.UIStroke.Thickness = 1.5;
        end;
        local l_Metadata_1 = l_Emotes_0[v893].Metadata;
        local v895 = l_Metadata_1.Rarity or "Uncommon";
        if v895 == "Legendary" then
            v892.Main.Glow.ImageTransparency = 0.15;
            v892.Main.UIStroke.Color = Color3.fromRGB(255, 229, 29);
            v892.Main.Glow.ImageColor3 = Color3.fromRGB(255, 229, 29);
        end;
        v892.Main.Background.ImageColor3 = v840[v895];
        v892.Main.Glow.ImageColor3 = v840[v895];
        local l_Top_1 = v892.Main.Top;
        local l_Bottom_1 = v892.Main.Bottom;
        local l_Centre_0 = v892.Main.Centre;
        l_Top_1.Visible = false;
        l_Bottom_1.Visible = false;
        l_Centre_0.Visible = true;
        l_Centre_0.Text = l_Metadata_1.DisplayName;
        local l_Emote_0 = v892.Main.Images:FindFirstChild("Emote");
        if l_Emote_0 then
            l_Emote_0.Visible = true;
        end;
        local v900 = 1 / #v887;
        local v901 = tostring(v900);
        if math.ceil(v900) ~= v900 then
            v901 = string.format("%.2f", v900);
        end;
        v892.Main.Percent.Text = v901 .. "%";
        v892.Main.Percent.Visible = false;
        v892.Visible = true;
    end;
end;
v33.CreateCrateEffect = function(v903) --[[ Line: 4148 ]] --[[ Name: CreateCrateEffect ]]
    -- upvalues: v839 (copy), l_Common_0 (copy), v902 (copy), l_Emotes_0 (copy), v878 (copy), v34 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Workspace_1 (copy), l_RunService_0 (copy), v840 (copy)
    local v904 = v903[2];
    local v905 = v903[3];
    local v906 = v903[4];
    local v907 = v903[5];
    local v908 = v839[v904];
    if v904 == "Emotes" then
        v908 = {};
    end;
    if not v908 then
        return;
    else
        for _, v910 in l_Common_0:GetChildren() do
            if v910.Name == "PromptRemove" then
                v910:Destroy();
            end;
        end;
        local v911 = l_Common_0.Crate:Clone();
        v911.Name = "CrateRemove";
        v911.Parent = l_Common_0;
        v911.Visible = true;
        local l_Blur_0 = v911.Blur;
        local l_Skip_0 = v911.Skip;
        local l_Container_1 = v911.Container;
        local l_Pointer_0 = l_Container_1.Pointer;
        local l_RowTemplate_2 = l_Container_1.RowTemplate;
        local v917 = 8;
        local l_UserInputService_0 = game:GetService("UserInputService");
        local v919 = l_UserInputService_0.TouchEnabled and not (l_UserInputService_0.MouseEnabled or l_UserInputService_0.KeyboardEnabled);
        l_RowTemplate_2.Visible = false;
        local v920 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
        if v904 == "Emotes" then
            v902({
                MaxItems = 75, 
                FrameTemplate = l_Container_1.BasicTemplate, 
                RowTemplate = l_RowTemplate_2, 
                FinalIndex = 64, 
                Reward = v905, 
                IsMobile = v919, 
                OwnedEmotes = v903[5]
            });
            local v921 = l_Emotes_0[v905].Metadata.Rarity or "Uncommon";
            v905 = {
                Name = v905, 
                Rarity = v921
            };
        else
            local _ = v908.Drops;
            local l_Rates_1 = v908.Rates;
            local l_DropsByRarity_1 = v908.DropsByRarity;
            local v925 = l_Rates_1.Legendary * 3;
            local v926 = l_Rates_1.Mythic * 2.5;
            local v927 = l_Rates_1.Rare * 1.5;
            if v907 then
                v925 = 20;
                v926 = 40;
                v927 = 40;
            end;
            v878({
                MaxItems = 75, 
                Container = l_Container_1, 
                RowTemplate = l_RowTemplate_2, 
                FinalIndex = 64, 
                Reward = v905, 
                Metadata = v908, 
                LegendaryRarity = v925, 
                MythicRarity = v926, 
                RareRarity = v927, 
                DropsByRarity = l_DropsByRarity_1, 
                Rates = l_Rates_1, 
                LuckyCrateRate = v907, 
                IsMobile = v919
            });
        end;
        l_RowTemplate_2.Visible = true;
        local v928 = v34:NextNumber(-0.45, 0.45);
        local l_BackgroundTransparency_1 = l_Blur_0.BackgroundTransparency;
        l_Blur_0.BackgroundTransparency = 1;
        l_TweenService_0:Create(l_Blur_0, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            BackgroundTransparency = l_BackgroundTransparency_1
        }):Play();
        if v908.Special then
            v917 = 5;
            l_SoundHelper_0:PlaySound({
                Name = "ChimeSFX", 
                Parent = l_Workspace_1.Debris
            });
            v911.Flash.Visible = true;
            local v930 = TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            l_TweenService_0:Create(v911.Flash, v930, {
                BackgroundTransparency = 0
            }):Play();
            task.delay(0.15, function() --[[ Line: 4260 ]]
                -- upvalues: l_TweenService_0 (ref), v911 (copy), v920 (copy)
                l_TweenService_0:Create(v911.Flash, v920, {
                    BackgroundTransparency = 1
                }):Play();
            end);
            v911.Container.Visible = false;
            task.wait(0.4);
            v911.Container.Visible = true;
            task.delay(0.1, function() --[[ Line: 4269 ]]
                -- upvalues: v908 (ref), l_SoundHelper_0 (ref), l_Workspace_1 (ref)
                if v908.Special then
                    l_SoundHelper_0:PlaySound({
                        Name = "SpecialCrate", 
                        Parent = l_Workspace_1.Debris
                    });
                    return;
                else
                    l_SoundHelper_0:PlaySound({
                        Name = "Achieved", 
                        Parent = l_Workspace_1.Debris
                    });
                    return;
                end;
            end);
        end;
        l_RowTemplate_2.Position = UDim2.new(12, 0, 0.5, 0);
        local v931 = l_TweenService_0:Create(l_RowTemplate_2, TweenInfo.new(v917, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, 0, 0.5, 0)
        });
        task.delay(v908.Special and 0.2 or 0, function() --[[ Line: 4287 ]]
            -- upvalues: v931 (copy)
            v931:Play();
        end);
        local v932 = false;
        local v933 = tick();
        if v906 then
            local l_Position_6 = l_Skip_0.Position;
            l_Skip_0.Position = UDim2.new(l_Skip_0.Position.X.Scale + 1, 0, l_Skip_0.Position.Y.Scale, 0);
            l_Skip_0.Visible = true;
            l_TweenService_0:Create(l_Skip_0, v920, {
                Position = l_Position_6
            }):Play();
            l_Skip_0.ButtonScript.Enabled = true;
            local v935 = false;
            do
                local l_v935_0 = v935;
                l_Skip_0.SkipCrate.Event:Connect(function() --[[ Line: 4304 ]]
                    -- upvalues: v933 (copy), v917 (ref), l_v935_0 (ref), l_TweenService_0 (ref), l_Skip_0 (copy), v911 (copy), v931 (copy), l_RowTemplate_2 (copy), v932 (ref)
                    if tick() - v933 > v917 - 1.5 then
                        return;
                    elseif l_v935_0 then
                        return;
                    else
                        l_v935_0 = true;
                        local v937 = TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                        l_TweenService_0:Create(l_Skip_0, v937, {
                            Position = UDim2.new(l_Skip_0.Position.X.Scale + 1, 0, l_Skip_0.Position.Y.Scale, 0)
                        }):Play();
                        v911.Flash.Visible = true;
                        l_TweenService_0:Create(v911.Flash, v937, {
                            BackgroundTransparency = 0
                        }):Play();
                        task.delay(0.15, function() --[[ Line: 4319 ]]
                            -- upvalues: l_TweenService_0 (ref), v911 (ref), v937 (copy)
                            l_TweenService_0:Create(v911.Flash, v937, {
                                BackgroundTransparency = 1
                            }):Play();
                        end);
                        v931:Pause();
                        l_RowTemplate_2.Position = UDim2.new(2, 0, 0.5, 0);
                        l_TweenService_0:Create(l_RowTemplate_2, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            Position = UDim2.new(0.5, 0, 0.5, 0)
                        }):Play();
                        task.wait(1);
                        v932 = true;
                        return;
                    end;
                end);
            end;
        end;
        local l_l_RowTemplate_2_FirstChild_0 = l_RowTemplate_2:FindFirstChild(64);
        l_SoundHelper_0:PlaySound({
            Name = "CrateTick", 
            Parent = l_Workspace_1
        });
        local l_Size_7 = l_Pointer_0.Size;
        local l_Position_7 = l_Pointer_0.Position;
        l_Pointer_0.Size = UDim2.new(0.01, 0, 0, 0);
        l_Pointer_0.Position = UDim2.new(0.5, 0, 1, 0);
        l_TweenService_0:Create(l_Pointer_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Size = l_Size_7, 
            Position = l_Position_7
        }):Play();
        local v941 = {};
        local v942 = nil;
        local v943 = 1;
        local v944 = nil;
        v944 = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 4353 ]]
            -- upvalues: l_Container_1 (copy), v941 (ref), l_RowTemplate_2 (copy), v928 (copy), l_TweenService_0 (ref), v943 (ref), v942 (ref), l_SoundHelper_0 (ref), l_Workspace_1 (ref)
            local l_X_0 = l_Container_1.AbsoluteSize.X;
            local v947 = l_X_0 * 0.0085;
            v941 = {};
            for v948, v949 in l_RowTemplate_2:GetChildren() do
                local v950 = (v949.AbsoluteSize.X + v947) * 64;
                v949.Position = UDim2.new(0, v947 * v948 + v948 * v949.AbsoluteSize.X - v950 + v928 * v949.AbsoluteSize.X);
                local v951 = math.abs(v949.AbsolutePosition.X - l_X_0 / 2 + v949.AbsoluteSize.X / 2);
                if l_X_0 < v951 then
                    v949.Main.Visible = false;
                else
                    v949.Main.Visible = true;
                    local v952 = v951 / l_X_0;
                    local v953 = 1 + -0.9 * l_TweenService_0:GetValue(v952, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
                    v949.Main.Size = UDim2.new(v953, 0, v953, 0);
                    table.insert(v941, {
                        v949, 
                        v952
                    });
                end;
            end;
            local v954 = l_X_0 * 2;
            local v955 = -1;
            local v956 = -1;
            for v957, v958 in v941 do
                local v959 = v958[2];
                if v959 < v954 then
                    v954 = v959;
                    v956 = v957;
                    v955 = tonumber(v958[1].Name);
                end;
            end;
            v943 = v943 + 1;
            if v942 ~= v955 then
                local v960 = 0 + 1 * (v955 / 59.2);
                l_SoundHelper_0:PlaySound({
                    Name = "CrateTick", 
                    Parent = l_Workspace_1, 
                    Speed = 5 + -4.15 * math.min(v960, 1)
                });
            end;
            v942 = v955;
            local v961 = 0;
            local v962 = 0;
            for v963 = v956, 1, -1 do
                local v964 = v941[v963][1];
                local v965 = (v964.AbsoluteSize.X - v964.Main.AbsoluteSize.X) / 2;
                if v963 == v956 then
                    v962 = v962 + 1;
                end;
                v964.Main.Position = UDim2.new(0.5, v965 + v961, 0.5, v965 * -4);
                v961 = v961 + v965 * 2;
            end;
            local v966 = 0;
            local v967 = 0;
            for v968 = v956 + 1, #v941 do
                local v969 = v941[v968];
                if v969 then
                    local v970 = v969[1];
                    v967 = v967 + 1;
                    local v971 = -(v970.AbsoluteSize.X - v970.Main.AbsoluteSize.X) / 2;
                    v970.Main.Position = UDim2.new(0.5, v971 + v966, 0.5, -v971 * -4);
                    v966 = v966 + v971 * 2;
                end;
            end;
        end);
        repeat
            task.wait();
        until tick() - v933 > v917 + 0.4 or v932;
        if v906 then
            local v972 = TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            l_TweenService_0:Create(l_Skip_0, v972, {
                Position = UDim2.new(l_Skip_0.Position.X.Scale + 1, 0, l_Skip_0.Position.Y.Scale, 0)
            }):Play();
        end;
        if v944 then
            v944:Disconnect();
        end;
        l_TweenService_0:Create(l_Pointer_0, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 0, 0, 0)
        }):Play();
        task.delay(0.2, function() --[[ Line: 4460 ]]
            -- upvalues: l_Pointer_0 (copy)
            l_Pointer_0:Destroy();
        end);
        task.delay(0.4, function() --[[ Line: 4464 ]]
            -- upvalues: l_SoundHelper_0 (ref), l_Workspace_1 (ref), v905 (ref)
            l_SoundHelper_0:PlaySound({
                Name = "EquipGloves", 
                Parent = l_Workspace_1.Debris, 
                Speed = 0.85, 
                Volume = 0.1
            });
            l_SoundHelper_0:PlaySound({
                Name = v905.Unusual and "Unusual" or v905.Rarity .. "Crate", 
                Parent = l_Workspace_1.Debris
            });
        end);
        for _, v974 in v941 do
            if v974 then
                local v975 = v974[1];
                if v975 == l_l_RowTemplate_2_FirstChild_0 then
                    l_l_RowTemplate_2_FirstChild_0.ZIndex = l_l_RowTemplate_2_FirstChild_0.ZIndex + 10;
                    l_l_RowTemplate_2_FirstChild_0.Glow.Visible = true;
                    if type(v905) == "table" then
                        if v905.Unusual then
                            l_l_RowTemplate_2_FirstChild_0.Glow.ImageColor3 = Color3.fromRGB(198, 55, 255);
                        elseif v905.Rarity ~= "Uncommon" then
                            l_l_RowTemplate_2_FirstChild_0.Glow.ImageColor3 = v840[v905.Rarity];
                        end;
                    end;
                    l_TweenService_0:Create(l_l_RowTemplate_2_FirstChild_0.Glow, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 0.3
                    }):Play();
                    l_TweenService_0:Create(l_l_RowTemplate_2_FirstChild_0.Main, TweenInfo.new(1.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Size = UDim2.new(1.2, 0, 1.2, 0), 
                        Position = UDim2.new(0.5, 0, 0.5, 0)
                    }):Play();
                    l_TweenService_0:Create(l_l_RowTemplate_2_FirstChild_0, TweenInfo.new(1.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Position = UDim2.new(0, 0, 0, 0)
                    }):Play();
                    task.delay(2.25, function() --[[ Line: 4500 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Workspace_1 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "CardFlip", 
                            Parent = l_Workspace_1, 
                            Volume = 0.1
                        });
                    end);
                else
                    l_SoundHelper_0:PlaySound({
                        Name = "CrateTick", 
                        Parent = l_Workspace_1, 
                        Volume = 0.1, 
                        Speed = 20
                    });
                    l_TweenService_0:Create(v975, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Position = UDim2.new(v975.Position.X.Scale, v975.Position.X.Offset, -4, 0)
                    }):Play();
                    task.wait(0.05555555555555556);
                end;
            end;
        end;
        task.wait((not v932 or v905.Unusual) and 1.6 or 0.6);
        v911.ImageButton:Destroy();
        l_TweenService_0:Create(l_l_RowTemplate_2_FirstChild_0.Glow, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ImageTransparency = 1
        }):Play();
        task.wait(0.2);
        l_TweenService_0:Create(l_l_RowTemplate_2_FirstChild_0, TweenInfo.new(0.9, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            Position = UDim2.new(l_l_RowTemplate_2_FirstChild_0.Position.X.Scale, l_l_RowTemplate_2_FirstChild_0.Position.X.Offset, -4, 0)
        }):Play();
        l_TweenService_0:Create(l_Blur_0, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1
        }):Play();
        task.defer(function() --[[ Line: 4531 ]]
            -- upvalues: v911 (copy)
            task.wait(3);
            v911:Destroy();
        end);
        return;
    end;
end;
local v976 = TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
v33.HideTeleportScreen = function() --[[ Line: 4538 ]] --[[ Name: HideTeleportScreen ]]
    -- upvalues: l_Common_0 (copy), l_TweenService_0 (copy), v976 (copy)
    local l_TeleportRemove_0 = l_Common_0:FindFirstChild("TeleportRemove");
    if not l_TeleportRemove_0 then
        return;
    else
        local l_Blur_1 = l_TeleportRemove_0.Blur;
        local _ = l_Blur_1.BackgroundTransparency;
        l_Blur_1.BackgroundTransparency = 1;
        l_TweenService_0:Create(l_Blur_1, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            BackgroundTransparency = 1
        }):Play();
        l_TweenService_0:Create(l_TeleportRemove_0.Bottom, v976, {
            Position = UDim2.new(l_TeleportRemove_0.Bottom.Position.X.Scale, 0, 2, 0)
        }):Play();
        l_TweenService_0:Create(l_TeleportRemove_0.Top, v976, {
            Position = UDim2.new(l_TeleportRemove_0.Top.Position.X.Scale, 0, -2, 0)
        }):Play();
        l_TeleportRemove_0.ImageButton.Visible = false;
        task.wait(20);
        l_TeleportRemove_0:Destroy();
        return;
    end;
end;
v33.ShowTeleportScreen = function() --[[ Line: 4556 ]] --[[ Name: ShowTeleportScreen ]]
    -- upvalues: l_Common_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Workspace_1 (copy), v976 (copy)
    local v980 = l_Common_0.Teleport:Clone();
    v980.Name = "TeleportRemove";
    v980.Parent = l_Common_0;
    local l_Blur_2 = v980.Blur;
    local l_BackgroundTransparency_3 = l_Blur_2.BackgroundTransparency;
    l_Blur_2.BackgroundTransparency = 1;
    l_TweenService_0:Create(l_Blur_2, TweenInfo.new(2.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        BackgroundTransparency = l_BackgroundTransparency_3
    }):Play();
    local v983 = {
        "JUST GIMME A SEC", 
        "HOPE YOU ENJOY!", 
        "PLEASE ENJOY THE GAME!", 
        "USE SECRET CODE: TELEPORT", 
        "TRYING MY BEST!", 
        "I BELIEVE IN YOU!", 
        "TIME TO BE THE BEST!", 
        "HI FROM DROWNINGSOME", 
        "NEVER GIVE UP", 
        "LET'S GO!!!", 
        "TO UNTITLED BOXING GAME", 
        "TO A LAND FAR, FAR AWAY", 
        "JOIN THE COMMUNITY!", 
        "LEAVE A LIKE!", 
        "PLEASE LEAVE A LIKE!", 
        "LEAVE A LIKE IF YOU CAN :)", 
        "LIKES HELP THE GAME!", 
        "FOR BETTER PING"
    };
    task.wait(0.25);
    l_SoundHelper_0:PlaySound({
        Name = "TeleportStart", 
        Parent = l_Workspace_1
    });
    local v984 = v983[math.random(1, #v983)];
    v980.Bottom.Text = v984;
    local l_Position_8 = v980.Top.Position;
    v980.Top.Position = UDim2.new(l_Position_8.X.Scale, 0, -1.5, 0);
    local l_Position_9 = v980.Bottom.Position;
    v980.Bottom.Position = UDim2.new(l_Position_9.X.Scale, 0, 1.5, 0);
    v980.Visible = true;
    l_TweenService_0:Create(v980.Bottom, v976, {
        Position = l_Position_9
    }):Play();
    l_TweenService_0:Create(v980.Top, v976, {
        Position = l_Position_8
    }):Play();
    for _ = 1, 16 do
        v980.Top.Text = "TELEPORTING";
        task.wait(0.3);
        v980.Top.Text = "TELEPORTING.";
        task.wait(0.3);
        v980.Top.Text = "TELEPORTING..";
        task.wait(0.3);
        v980.Top.Text = "TELEPORTING...";
    end;
end;
v33.CreatePingTeleportPrompt = function() --[[ Line: 4620 ]] --[[ Name: CreatePingTeleportPrompt ]]
    -- upvalues: l_UIHelper_0 (copy)
    l_UIHelper_0.CreatePingTeleportPrompt();
end;
v33.Shotgun = function(v988) --[[ Line: 4625 ]] --[[ Name: Shotgun ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_AnimHelper_0 (copy), v33 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), l_AlignHelper_0 (copy), v34 (copy), l_Workspace_1 (copy), l_CollectionService_0 (copy), l_SoundHelper_0 (copy), l_Bezier_0 (copy)
    local _ = v988[1];
    local v990 = v988[2];
    local v991 = v988[3];
    local v992 = v988[4];
    local l_Humanoid_6 = v990:FindFirstChild("Humanoid");
    local v994 = {
        Priority = Enum.AnimationPriority.Action3, 
        Animator = l_Humanoid_6:FindFirstChild("Animator"), 
        AnimId = 15466820415, 
        NameFade = 0.05, 
        FadeIn = 0.1, 
        Weight = 1000, 
        Name = "Server", 
        Speed = v991 / 0.16666666666666666
    };
    if v990 == l_LocalPlayer_0.Character then
        v994.Priority = Enum.AnimationPriority.Action3;
    end;
    if v992 > 2.5 then
        v994.Priority = Enum.AnimationPriority.Core;
    end;
    local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v994);
    local l_v990_Attribute_0 = v990:GetAttribute("LastDamaged");
    local v997 = script.Misc.ShotgunStart:Clone();
    v997.Parent = v33.GetWeldCharacter(v990).LeftHand;
    task.delay(0.1, function() --[[ Line: 4660 ]]
        -- upvalues: v997 (copy)
        for _, v999 in v997:GetChildren() do
            v999:Emit(1);
        end;
    end);
    local function v1008(v1000, v1001) --[[ Line: 4666 ]] --[[ Name: SetVisibility ]]
        -- upvalues: v990 (copy)
        for _, v1003 in v990:GetDescendants() do
            if v1003.Name == v1000 then
                if v1003:IsA("BasePart") then
                    if v1003.LocalTransparencyModifier < 1000 then
                        v1003.LocalTransparencyModifier = v1001;
                    else
                        continue;
                    end;
                end;
                for _, v1005 in v1003:GetDescendants() do
                    if v1005:IsA("BasePart") and v1005.LocalTransparencyModifier < 1000 then
                        v1005.LocalTransparencyModifier = v1001;
                    end;
                end;
            end;
        end;
        for _, _ in v990:GetDescendants() do

        end;
    end;
    local l_Shirt_0 = v990:FindFirstChildWhichIsA("Shirt");
    local v1010 = TweenInfo.new(0.371, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
    local v1011 = {};
    local v1012 = true;
    task.delay(0.5, function() --[[ Line: 4694 ]]
        -- upvalues: v1012 (ref)
        v1012 = false;
    end);
    local v1013 = nil;
    v1013 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 4699 ]]
        -- upvalues: v1011 (copy), l_TweenService_0 (ref), v1012 (ref), v990 (copy), l_LocalPlayer_0 (ref), l_AlignHelper_0 (ref)
        for _, v1015 in v1011 do
            local l_Curve_1 = v1015.Curve;
            local l_StartTime_1 = v1015.StartTime;
            local l_Arm_0 = v1015.Arm;
            local v1019 = math.clamp((tick() - l_StartTime_1) / 0.53, 0, 1);
            local l_l_TweenService_0_Value_2 = l_TweenService_0:GetValue(v1019, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
            l_Arm_0.CFrame = CFrame.lookAt(l_Curve_1:Get(l_l_TweenService_0_Value_2 - 0.01), l_Curve_1:Get(l_l_TweenService_0_Value_2)) * CFrame.Angles(1.5707963267948966, 0, 0);
            l_Arm_0.Size = Vector3.new(1, 2, 1, 0) + Vector3.new(0, -0.5, 0, 0) * l_l_TweenService_0_Value_2;
            if v1019 > 0.45 then
                l_Arm_0.Trail.Attachment0 = nil;
            end;
        end;
        if v1012 and v990 == l_LocalPlayer_0.Character then
            local v1021 = {
                KeepPos = true, 
                SetPosition = v990.PrimaryPart.Position, 
                Responsiveness = 200, 
                Velocity = 0, 
                MaxTime = 0.016666666666666666, 
                IgnoreStun = true
            };
            l_AlignHelper_0:MoveAlignPosition(v1021);
        end;
    end);
    local v1022 = 0;
    local l_FirstChild_21 = workspace.Welds:FindFirstChild(v990.Name);
    local v1024 = l_FirstChild_21 and l_FirstChild_21:FindFirstChild("WeldCharacter");
    local v1025 = v1024 and v1024:FindFirstChild("GloveModelLeft");
    local v1026 = v1025 and v1025:FindFirstChild("LeftLowerArm");
    local function v1046(v1027, v1028) --[[ Line: 4740 ]] --[[ Name: CreateBezierArm ]]
        -- upvalues: l_Shirt_0 (copy), v34 (ref), l_Workspace_1 (ref), v990 (copy), v1026 (copy), l_CollectionService_0 (ref), l_TweenService_0 (ref), v1010 (copy), l_LocalPlayer_0 (ref), v1022 (ref), v992 (copy), v33 (ref), l_SoundHelper_0 (ref), v1011 (copy), l_Bezier_0 (ref)
        local v1029 = script.BarrageArms:Clone();
        if l_Shirt_0 then
            l_Shirt_0:Clone().Parent = v1029;
        end;
        local v1030 = CFrame.new(v34:NextNumber(-2.1, 2.1), v34:NextNumber(-1.2, 2.3), 0);
        local v1031 = nil;
        if not v1027 then
            v1031 = v1029["Right Arm"];
            v1029["Left Arm"]:Destroy();
        else
            v1031 = v1029["Left Arm"];
            v1029["Right Arm"]:Destroy();
        end;
        v1031.CFrame = v1028;
        v1029.Parent = l_Workspace_1.Debris;
        v1031.Color = v990.LeftLowerArm.Color;
        local v1032 = nil;
        if v1026 then
            v1032 = v1026:Clone();
            v1032.Parent = v1031;
            for _, v1034 in v1032:GetDescendants() do
                if v1034:IsA("Weld") or v1034:IsA("ParticleEmitter") then
                    v1034:Destroy();
                end;
                if v1034:IsA("BasePart") then
                    for _, v1036 in l_CollectionService_0:GetTags(v1034) do
                        l_CollectionService_0:RemoveTag(v1034, v1036);
                    end;
                end;
            end;
            local l_Weld_0 = Instance.new("Weld");
            l_Weld_0.Name = "Delete";
            l_Weld_0.Parent = v1032.Middle;
            l_Weld_0.Part0 = v1032.Middle;
            l_Weld_0.Part1 = v1031;
            l_Weld_0.C0 = CFrame.new(0, 0.2, 0);
        end;
        task.delay(0.06, function() --[[ Line: 4788 ]]
            -- upvalues: l_TweenService_0 (ref), v1031 (ref), v1010 (ref), v1032 (ref)
            l_TweenService_0:Create(v1031, v1010, {
                Transparency = 1
            }):Play();
            if v1032 then
                for _, v1039 in v1032:GetDescendants() do
                    if v1039:IsA("BasePart") then
                        l_TweenService_0:Create(v1039, v1010, {
                            Transparency = 1
                        }):Play();
                    end;
                end;
            end;
        end);
        local l_Position_10 = (v1028 * CFrame.new(0, 0, 0)).Position;
        if v990 ~= l_LocalPlayer_0.Character then
            l_Position_10 = (v1028 * CFrame.new(0, 0, -0.75)).Position;
        end;
        local l_Position_11 = (v990.PrimaryPart.CFrame * CFrame.new(v34:NextNumber(-0.8, 0.8), v34:NextNumber(0.3, 1.2), -3.7)).Position;
        local l_Position_12 = (CFrame.lookAt((l_Position_10 + l_Position_11) / 2, l_Position_11) * v1030).Position;
        if v1022 % 4 == 0 and v990 == l_LocalPlayer_0.Character then
            task.defer(function() --[[ Line: 4808 ]]
                -- upvalues: l_Workspace_1 (ref), l_Position_10 (ref), l_Position_11 (copy), v992 (ref), v33 (ref)
                local v1043 = script.WindStartup:Clone();
                v1043.Parent = l_Workspace_1.Debris;
                v1043.CFrame = CFrame.lookAt(l_Position_10, l_Position_11) * CFrame.Angles(0, 1.5707963267948966, 0);
                v1043.Position = l_Position_11;
                for _, v1045 in v1043.Particle:GetChildren() do
                    v1045:Emit(1);
                end;
                if v992 < 2.5 then
                    v33.CameraShake({
                        Preset = "LightHit", 
                        WaitTime = 0.1, 
                        Fade = 0.1, 
                        FoV = 68, 
                        FoVMult = 3
                    });
                end;
                task.wait(5);
                v1043:Destroy();
            end);
        end;
        l_SoundHelper_0:PlaySound({
            Name = "Swing", 
            Parent = v990.PrimaryPart, 
            Speed = v34:NextNumber(0.9, 1.1), 
            Volume = 0.05
        });
        table.insert(v1011, {
            Curve = l_Bezier_0.new(l_Position_10, l_Position_12, l_Position_11), 
            StartTime = tick(), 
            Arm = v1031
        });
        v1022 = v1022 + 1;
    end;
    local v1047 = 20.7 * v988[5];
    if v988[1] == nil and v988[5] then
        v1047 = v988[5] * 2.3;
    end;
    local v1048 = {};
    local function v1050() --[[ Line: 4860 ]] --[[ Name: Perform ]]
        -- upvalues: v1008 (copy), v1047 (ref), v990 (copy), l_v990_Attribute_0 (copy), l_l_AnimHelper_0_Anim_1 (copy), v1046 (copy)
        v1008("LeftUpperArm", 1);
        v1008("LeftLowerArm", 1);
        v1008("LeftHand", 1);
        for _ = 1, v1047 do
            if v990:GetAttribute("LastDamaged") ~= l_v990_Attribute_0 then
                l_l_AnimHelper_0_Anim_1:Stop();
                v1008("LeftUpperArm", 0);
                v1008("LeftLowerArm", 0);
                v1008("LeftHand", 0);
                return;
            else
                v1046(true, v990.UpperTorso.CFrame * CFrame.new(-1, 0.4, 0.05));
                task.wait(0.05434782608695653);
            end;
        end;
    end;
    v1048[1] = l_l_AnimHelper_0_Anim_1:GetMarkerReachedSignal("Start"):Connect(function() --[[ Line: 4881 ]]
        -- upvalues: v988 (copy), v992 (copy), l_l_AnimHelper_0_Anim_1 (copy), v1050 (copy)
        if v988[1] then
            local v1051 = v992 / v988[5];
            local l_l_l_AnimHelper_0_Anim_1_0 = l_l_AnimHelper_0_Anim_1;
            l_l_l_AnimHelper_0_Anim_1_0.TimePosition = l_l_l_AnimHelper_0_Anim_1_0.TimePosition + (v1051 - v992);
        end;
        v1050();
    end);
    if v992 > 2.5 then
        task.delay(v991, function() --[[ Line: 4891 ]]
            -- upvalues: v1050 (copy)
            v1050();
        end);
    end;
    if v1026 then
        for _, v1054 in v1026:GetDescendants() do
            if v1054.Name == "UnusualParticle" then
                v1054.Enabled = false;
            end;
        end;
    end;
    task.delay(0.3333333333333333, function() --[[ Line: 4902 ]]
        -- upvalues: l_SoundHelper_0 (ref), v990 (copy)
        l_SoundHelper_0:PlaySound({
            Name = "ShotgunStart", 
            Parent = v990.PrimaryPart
        });
    end);
    task.wait(v991);
    l_l_AnimHelper_0_Anim_1:AdjustSpeed(1);
    v1012 = false;
    task.wait(v992);
    for _, v1056 in v1048 do
        v1056:Disconnect();
    end;
    v1008("LeftUpperArm", 0);
    v1008("LeftLowerArm", 0);
    v1008("LeftHand", 0);
    if v1026 then
        for _, v1058 in v1026:GetDescendants() do
            if v1058.Name == "UnusualParticle" then
                v1058.Enabled = true;
            end;
        end;
    end;
    task.wait(12);
    if v997 then
        v997:Destroy();
    end;
    if v1013 then
        v1013:Disconnect();
    end;
    for _, v1060 in v1011 do
        v1060.Arm.Parent:Destroy();
    end;
end;
v33.FullShotgun = function(v1061) --[[ Line: 4939 ]] --[[ Name: FullShotgun ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_AnimHelper_0 (copy), v33 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), l_AlignHelper_0 (copy), v34 (copy), l_Workspace_1 (copy), l_CollectionService_0 (copy), l_SoundHelper_0 (copy), l_Bezier_0 (copy)
    local v1062 = v1061[2];
    local v1063 = v1061[3];
    local v1064 = v1061[4];
    local l_Humanoid_7 = v1062:FindFirstChild("Humanoid");
    local v1066 = {
        Priority = Enum.AnimationPriority.Action3, 
        Animator = l_Humanoid_7:FindFirstChild("Animator"), 
        AnimId = 97709052430791, 
        NameFade = 0.05, 
        FadeIn = 0.1, 
        Weight = 1000, 
        Name = "Server", 
        Speed = v1063 / 0.3333333333333333
    };
    if v1062 == l_LocalPlayer_0.Character then
        v1066.Priority = Enum.AnimationPriority.Action3;
    end;
    if v1064 > 2.5 then
        v1066.Priority = Enum.AnimationPriority.Core;
    end;
    local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v1066);
    local l_v1062_Attribute_0 = v1062:GetAttribute("LastDamaged");
    local v1069 = script.Misc.ShotgunStart:Clone();
    v1069.Parent = v33.GetWeldCharacter(v1062).LeftHand;
    task.delay(0.1, function() --[[ Line: 4973 ]]
        -- upvalues: v1069 (copy)
        for _, v1071 in v1069:GetChildren() do
            v1071:Emit(1);
        end;
    end);
    local function v1080(v1072, v1073) --[[ Line: 4979 ]] --[[ Name: SetVisibility ]]
        -- upvalues: v1062 (copy)
        for _, v1075 in v1062:GetDescendants() do
            if v1075.Name == v1072 then
                if v1075:IsA("BasePart") then
                    if v1075.LocalTransparencyModifier < 1000 then
                        v1075.LocalTransparencyModifier = v1073;
                    else
                        continue;
                    end;
                end;
                for _, v1077 in v1075:GetDescendants() do
                    if v1077:IsA("BasePart") and v1077.LocalTransparencyModifier < 1000 then
                        v1077.LocalTransparencyModifier = v1073;
                    end;
                end;
            end;
        end;
        for _, _ in v1062:GetDescendants() do

        end;
    end;
    local l_Shirt_1 = v1062:FindFirstChildWhichIsA("Shirt");
    local v1082 = TweenInfo.new(0.47700000000000004, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v1083 = {};
    local v1084 = true;
    task.delay(0.5, function() --[[ Line: 5007 ]]
        -- upvalues: v1084 (ref)
        v1084 = false;
    end);
    local v1085 = nil;
    v1085 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 5012 ]]
        -- upvalues: v1083 (copy), l_TweenService_0 (ref), v1084 (ref), v1062 (copy), l_LocalPlayer_0 (ref), l_AlignHelper_0 (ref)
        for _, v1087 in v1083 do
            local l_Curve_2 = v1087.Curve;
            local l_StartTime_2 = v1087.StartTime;
            local l_Arm_1 = v1087.Arm;
            local v1091 = math.clamp((tick() - l_StartTime_2) / 0.53, 0, 1);
            local l_l_TweenService_0_Value_3 = l_TweenService_0:GetValue(v1091, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
            l_Arm_1.CFrame = CFrame.lookAt(l_Curve_2:Get(l_l_TweenService_0_Value_3 - 0.01), l_Curve_2:Get(l_l_TweenService_0_Value_3)) * CFrame.Angles(1.5707963267948966, 0, 0);
            l_Arm_1.Size = Vector3.new(1, 2, 1, 0) + Vector3.new(0, -0.5, 0, 0) * l_l_TweenService_0_Value_3;
            if v1091 > 0.45 then
                l_Arm_1.Trail.Attachment0 = nil;
            end;
        end;
        if v1084 and v1062 == l_LocalPlayer_0.Character then
            local v1093 = {
                KeepPos = true, 
                SetPosition = v1062.PrimaryPart.Position, 
                Responsiveness = 200, 
                Velocity = 0, 
                MaxTime = 0.016666666666666666, 
                IgnoreStun = true
            };
            l_AlignHelper_0:MoveAlignPosition(v1093);
        end;
    end);
    local v1094 = 0;
    local l_FirstChild_22 = workspace.Welds:FindFirstChild(v1062.Name);
    local v1096 = l_FirstChild_22 and l_FirstChild_22:FindFirstChild("WeldCharacter");
    local v1097 = v1096 and v1096:FindFirstChild("GloveModelLeft");
    local v1098 = v1097 and v1097:FindFirstChild("LeftLowerArm");
    local function v1118(v1099, v1100) --[[ Line: 5053 ]] --[[ Name: CreateBezierArm ]]
        -- upvalues: l_Shirt_1 (copy), v34 (ref), l_Workspace_1 (ref), v1062 (copy), v1098 (copy), l_CollectionService_0 (ref), l_TweenService_0 (ref), v1082 (copy), l_LocalPlayer_0 (ref), v1094 (ref), v1064 (copy), v33 (ref), l_SoundHelper_0 (ref), v1083 (copy), l_Bezier_0 (ref)
        local v1101 = script.BarrageArms:Clone();
        if l_Shirt_1 then
            l_Shirt_1:Clone().Parent = v1101;
        end;
        local v1102 = CFrame.new(v34:NextNumber(0.7, 3) * (v1099 and -1 or 1), v34:NextNumber(-2.5, 3.2), 0);
        local v1103 = nil;
        if not v1099 then
            v1103 = v1101["Right Arm"];
            v1101["Left Arm"]:Destroy();
        else
            v1103 = v1101["Left Arm"];
            v1101["Right Arm"]:Destroy();
        end;
        v1103.CFrame = v1100;
        v1101.Parent = l_Workspace_1.Debris;
        v1103.Color = v1062.LeftLowerArm.Color;
        local v1104 = nil;
        if v1098 then
            v1104 = v1098:Clone();
            v1104.Parent = v1103;
            for _, v1106 in v1104:GetDescendants() do
                if v1106:IsA("Weld") or v1106:IsA("ParticleEmitter") then
                    v1106:Destroy();
                end;
                if v1106:IsA("BasePart") then
                    for _, v1108 in l_CollectionService_0:GetTags(v1106) do
                        l_CollectionService_0:RemoveTag(v1106, v1108);
                    end;
                end;
            end;
            local l_Weld_1 = Instance.new("Weld");
            l_Weld_1.Name = "Delete";
            l_Weld_1.Parent = v1104.Middle;
            l_Weld_1.Part0 = v1104.Middle;
            l_Weld_1.Part1 = v1103;
            l_Weld_1.C0 = CFrame.new(0, 0.2, 0);
        end;
        task.delay(0.06, function() --[[ Line: 5101 ]]
            -- upvalues: l_TweenService_0 (ref), v1103 (ref), v1082 (ref), v1104 (ref)
            l_TweenService_0:Create(v1103, v1082, {
                Transparency = 1
            }):Play();
            if v1104 then
                for _, v1111 in v1104:GetDescendants() do
                    if v1111:IsA("BasePart") then
                        l_TweenService_0:Create(v1111, v1082, {
                            Transparency = 1
                        }):Play();
                    end;
                end;
            end;
        end);
        local l_Position_13 = (v1100 * CFrame.new(0, 0, 0)).Position;
        if v1062 ~= l_LocalPlayer_0.Character then
            l_Position_13 = (v1100 * CFrame.new(0, 0, -0.75)).Position;
        end;
        local l_Position_14 = (v1062.PrimaryPart.CFrame * CFrame.new(v34:NextNumber(0.4, 1.2) * (v1099 and -1 or 1), v34:NextNumber(0.3, 1.2), -3.7)).Position;
        local l_Position_15 = (CFrame.lookAt((l_Position_13 + l_Position_14) / 2, l_Position_14) * v1102).Position;
        if v1094 % 4 == 0 and v1062 == l_LocalPlayer_0.Character then
            task.defer(function() --[[ Line: 5121 ]]
                -- upvalues: l_Workspace_1 (ref), l_Position_13 (ref), l_Position_14 (copy), v1064 (ref), v33 (ref)
                local v1115 = script.WindStartup:Clone();
                v1115.Parent = l_Workspace_1.Debris;
                v1115.CFrame = CFrame.lookAt(l_Position_13, l_Position_14) * CFrame.Angles(0, 1.5707963267948966, 0);
                v1115.Position = l_Position_14;
                for _, v1117 in v1115.Particle:GetChildren() do
                    v1117:Emit(1);
                end;
                if v1064 < 2.5 then
                    v33.CameraShake({
                        Preset = "LightHit", 
                        WaitTime = 0.1, 
                        Fade = 0.1, 
                        FoV = 68, 
                        FoVMult = 3
                    });
                end;
                task.wait(5);
                v1115:Destroy();
            end);
        end;
        l_SoundHelper_0:PlaySound({
            Name = "Swing", 
            Parent = v1062.PrimaryPart, 
            Speed = v34:NextNumber(0.9, 1.1), 
            Volume = 0.05
        });
        table.insert(v1083, {
            Curve = l_Bezier_0.new(l_Position_13, l_Position_15, l_Position_14), 
            StartTime = tick(), 
            Arm = v1103
        });
        v1094 = v1094 + 1;
    end;
    local v1119 = 36 * v1061[5];
    if v1061[1] == nil and v1061[5] then
        v1119 = v1061[5] * 4;
    end;
    local v1120 = {};
    local function v1123() --[[ Line: 5173 ]] --[[ Name: Perform ]]
        -- upvalues: v1080 (copy), v1119 (ref), v1062 (copy), l_v1062_Attribute_0 (copy), l_l_AnimHelper_0_Anim_2 (copy), v1118 (copy)
        v1080("LeftUpperArm", 1);
        v1080("LeftLowerArm", 1);
        v1080("LeftHand", 1);
        v1080("RightUpperArm", 1);
        v1080("RightLowerArm", 1);
        v1080("RightHand", 1);
        for v1121 = 1, v1119 do
            if v1062:GetAttribute("LastDamaged") ~= l_v1062_Attribute_0 then
                l_l_AnimHelper_0_Anim_2:Stop();
                v1080("LeftUpperArm", 0);
                v1080("LeftLowerArm", 0);
                v1080("LeftHand", 0);
                v1080("RightUpperArm", 0);
                v1080("RightLowerArm", 0);
                v1080("RightHand", 0);
                return;
            else
                local v1122 = v1121 % 2 == 0;
                v1118(v1122, v1062.UpperTorso.CFrame * CFrame.new(v1122 and -0.8 or 0.8, 0.4, -0.65));
                task.wait(0.03125);
            end;
        end;
    end;
    v1120[1] = l_l_AnimHelper_0_Anim_2:GetMarkerReachedSignal("Start"):Connect(function() --[[ Line: 5203 ]]
        -- upvalues: v1061 (copy), v1064 (copy), l_l_AnimHelper_0_Anim_2 (copy), v1123 (copy)
        if v1061[1] then
            local v1124 = v1064 / v1061[5];
            local l_l_l_AnimHelper_0_Anim_2_0 = l_l_AnimHelper_0_Anim_2;
            l_l_l_AnimHelper_0_Anim_2_0.TimePosition = l_l_l_AnimHelper_0_Anim_2_0.TimePosition + (v1124 - v1064);
        end;
        v1123();
    end);
    if v1064 > 2.5 then
        task.delay(v1063, function() --[[ Line: 5213 ]]
            -- upvalues: v1123 (copy)
            v1123();
        end);
    end;
    if v1098 then
        for _, v1127 in v1098:GetDescendants() do
            if v1127.Name == "UnusualParticle" then
                v1127.Enabled = false;
            end;
        end;
    end;
    task.delay(0.3333333333333333, function() --[[ Line: 5224 ]]
        -- upvalues: l_SoundHelper_0 (ref), v1062 (copy)
        l_SoundHelper_0:PlaySound({
            Name = "ShotgunStart", 
            Parent = v1062.PrimaryPart
        });
    end);
    task.wait(v1063);
    l_l_AnimHelper_0_Anim_2:AdjustSpeed(1);
    v1084 = false;
    task.delay(v1064 - 0.3333333333333333, function() --[[ Line: 5236 ]]
        -- upvalues: v1080 (copy)
        v1080("LeftUpperArm", 0);
        v1080("LeftLowerArm", 0);
        v1080("LeftHand", 0);
        v1080("RightUpperArm", 0);
        v1080("RightLowerArm", 0);
        v1080("RightHand", 0);
    end);
    task.wait(v1064);
    task.spawn(function() --[[ Line: 5249 ]]
        -- upvalues: l_SoundHelper_0 (ref), v1062 (copy), v33 (ref)
        l_SoundHelper_0:PlaySound({
            Name = "FullBarrageDone", 
            Parent = v1062.PrimaryPart
        });
        for _, v1129 in (script.ShowoffBurst:GetChildren()) do
            local v1130 = v1129:Clone();
            v1130.Parent = v33.GetWeldCharacter(v1062).PrimaryPart;
            if v1130:IsA("ParticleEmitter") then
                EmitParticle(v1130);
            elseif v1130:IsA("Attachment") then
                for _, v1132 in (v1130:GetChildren()) do
                    EmitParticle(v1132);
                end;
            end;
        end;
    end);
    for _, v1134 in v1120 do
        v1134:Disconnect();
    end;
    if v1098 then
        for _, v1136 in v1098:GetDescendants() do
            if v1136.Name == "UnusualParticle" then
                v1136.Enabled = true;
            end;
        end;
    end;
    task.wait(12);
    if v1069 then
        v1069:Destroy();
    end;
    if v1085 then
        v1085:Disconnect();
    end;
    for _, v1138 in v1083 do
        v1138.Arm.Parent:Destroy();
    end;
end;
v33.UseEmote = function(v1139) --[[ Line: 5294 ]] --[[ Name: UseEmote ]]
    -- upvalues: l_Emotes_0 (copy)
    local v1140 = v1139[2];
    local v1141 = l_Emotes_0[v1139[3]];
    if not v1141 then
        return;
    else
        v1141.Use(v1140);
        return;
    end;
end;
v33.UseDualEmote = function(v1142) --[[ Line: 5304 ]] --[[ Name: UseDualEmote ]]
    -- upvalues: l_Emotes_0 (copy)
    local v1143 = l_Emotes_0[v1142[2]];
    if not v1143 then
        return;
    else
        v1143.Use(v1142[3], v1142[4], v1142[5]);
        return;
    end;
end;
v33.Charge = function(v1144) --[[ Line: 5313 ]] --[[ Name: Charge ]]
    -- upvalues: l_SoundHelper_0 (copy)
    local l_Character_24 = ({
        Character = v1144[2]
    }).Character;
    l_SoundHelper_0:PlaySound({
        Name = "Rustle5", 
        Parent = l_Character_24, 
        Volume = 2
    });
    local l_ChargeAura_0 = script.ChargeAura;
    local v1147 = {};
    local v1148 = {
        "Head", 
        "UpperTorso", 
        "LeftUpperArm", 
        "RightUpperArm", 
        "LeftLowerArm", 
        "RightLowerArm", 
        "RightUpperLeg", 
        "LeftUpperLeg", 
        "LeftLowerLeg", 
        "RightLowerLeg"
    };
    for _, v1150 in l_Character_24:GetChildren() do
        if table.find(v1148, v1150.Name) and v1150:IsA("BasePart") and v1150.Transparency ~= 1 then
            for _, v1152 in l_ChargeAura_0:GetChildren() do
                if v1152:IsA("ParticleEmitter") then
                    local v1153 = v1152:Clone();
                    v1153.Enabled = false;
                    v1153.Parent = v1150;
                    v1153:Emit(v1153.Rate);
                    table.insert(v1147, v1153);
                end;
            end;
        end;
    end;
    task.wait(5);
    for _, v1155 in v1147 do
        v1155:Destroy();
    end;
end;
v33.FeintEffect = function(v1156) --[[ Line: 5357 ]] --[[ Name: FeintEffect ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_SoundHelper_0 (copy), v34 (copy)
    local v1157 = v1156[1];
    local v1158 = l_LocalPlayer_0.Character == v1157;
    l_SoundHelper_0:PlaySound({
        Name = "FeintRustle", 
        Parent = v1157.PrimaryPart, 
        Speed = v34:NextNumber(1, 1.3)
    });
    l_SoundHelper_0:PlaySound({
        Name = "Feint", 
        Parent = v1157.PrimaryPart, 
        Speed = v34:NextNumber(0.9, 1.1)
    });
    l_SoundHelper_0:PlaySound({
        Name = "Feint2", 
        Parent = v1157.PrimaryPart, 
        Speed = v34:NextNumber(1.1, 1.5), 
        Volume = v1158 and 0.06 or 0.08
    });
end;
local v1159 = {
    [Enum.AnimationPriority.Core] = 1, 
    [Enum.AnimationPriority.Idle] = 2, 
    [Enum.AnimationPriority.Movement] = 3, 
    [Enum.AnimationPriority.Action] = 4, 
    [Enum.AnimationPriority.Action2] = 5, 
    [Enum.AnimationPriority.Action3] = 4, 
    [Enum.AnimationPriority.Action4] = 7
};
v33.RestoreCachedLighting = function(v1160) --[[ Line: 5392 ]] --[[ Name: RestoreCachedLighting ]]
    -- upvalues: l_TweenService_0 (copy), l_Lighting_0 (copy), l_Workspace_1 (copy), v33 (copy)
    local l_v1160_Attribute_0 = v1160:GetAttribute("CachedLighting");
    if v1160:GetAttribute("CustomCachedLighting") then
        l_v1160_Attribute_0 = v1160:GetAttribute("CustomCachedLighting");
    end;
    local v1162 = game:GetService("HttpService"):JSONDecode(l_v1160_Attribute_0);
    local v1163 = {
        Ambient = Color3.fromHex(v1162.Ambient), 
        ColorShift_Bottom = Color3.fromHex(v1162.ColorShift_Bottom), 
        ColorShift_Top = Color3.fromHex(v1162.ColorShift_Top), 
        OutdoorAmbient = Color3.fromHex(v1162.OutdoorAmbient), 
        Brightness = v1162.Brightness, 
        EnvironmentDiffuseScale = v1162.EnvironmentDiffuseScale, 
        EnvironmentSpecularScale = v1162.EnvironmentSpecularScale, 
        ShadowSoftness = v1162.ShadowSoftness, 
        ClockTime = v1162.ClockTime, 
        GeographicLatitude = v1162.GeographicLatitude, 
        ExposureCompensation = v1162.ExposureCompensation
    };
    l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v1163):Play();
    l_Workspace_1.Exposure.Value = v1162.ExposureCompensation;
    l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        ExposureCompensation = l_Workspace_1.Exposure.Value
    }):Play();
    v33.GetAtmosphere();
end;
v33.Chronos = function(v1164) --[[ Line: 5432 ]] --[[ Name: Chronos ]]
    -- upvalues: l_Workspace_1 (copy), l_LocalPlayer_0 (copy), v33 (copy), l_AnimHelper_0 (copy), v23 (copy), l_RunService_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), v35 (copy), l_SoundHelper_0 (copy), v39 (copy), l_Main_0 (copy), v1159 (copy), l_BubbleModule_0 (copy)
    local v1165 = v1164[2];
    local v1166 = v1164[3];
    local v1167 = GetPlayerData(v1165);
    local v1168 = GetPlayerData(v1166);
    local v1169 = GetCharacterData(v1165);
    local l_CurrentCamera_0 = l_Workspace_1.CurrentCamera;
    local l_ChronosParticles_0 = script.ChronosParticles;
    local v1172 = {};
    local v1173 = v1167.Style.Value == "ChronosFocus";
    local v1174 = v1167.Style.Value == "KilluaShinyFocus";
    local v1175 = true;
    if l_LocalPlayer_0.Character ~= v1165 then
        v1175 = l_LocalPlayer_0.Character == v1166;
    end;
    local v1176 = nil;
    local v1177 = nil;
    if v1174 then
        l_ChronosParticles_0 = script.KilluaParticles;
        v1176 = script.MainKilluaAura:Clone();
        v1176.Parent = v33.GetWeldCharacter(v1165).HumanoidRootPart;
        v1177 = script.KilluaFloorAura:Clone();
        v1177.Parent = workspace.Debris;
        v1177.CFrame = v1165.HumanoidRootPart.CFrame + Vector3.new(0, -2.9000000953674316, 0, 0);
        v1177.HumanoidRootPart.Part0 = v33.GetWeldCharacter(v1165).HumanoidRootPart;
        for _, v1179 in v1165:GetChildren() do
            if v1179:IsA("Accessory") and v1179.AccessoryType == Enum.AccessoryType.Hair or string.find(string.lower(v1179.Name), "hair") then
                local l_MeshPart_0 = v1179:FindFirstChildWhichIsA("MeshPart");
                table.insert(v1172, {
                    hair = v1179, 
                    texture = l_MeshPart_0.TextureID
                });
                l_MeshPart_0.TextureID = "";
                l_MeshPart_0.Color = Color3.fromRGB(100, 113, 150);
                l_MeshPart_0.Material = Enum.Material.Neon;
            end;
        end;
        local l_Humanoid_8 = v1165:FindFirstChild("Humanoid");
        local v1182 = l_Humanoid_8 and (l_Humanoid_8:FindFirstChild("Animator") or l_Humanoid_8);
        local v1183 = {
            Priority = Enum.AnimationPriority.Action2, 
            Animator = v1182, 
            AnimId = 95869055804462, 
            NameFade = 0.001, 
            FadeIn = 0.1, 
            Weight = 1000, 
            Name = "Remove", 
            AnimSpeed = 1, 
            Looped = false
        };
        local _ = l_AnimHelper_0:CreateAnim(v1183);
    end;
    l_ChronosParticles_0 = l_ChronosParticles_0:Clone();
    l_ChronosParticles_0.Parent = l_Workspace_1.Debris;
    v23.Emit(l_ChronosParticles_0);
    local v1185 = nil;
    v1185 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 5504 ]]
        -- upvalues: l_ChronosParticles_0 (ref), l_CurrentCamera_0 (copy)
        l_ChronosParticles_0.CFrame = l_CurrentCamera_0.CFrame * CFrame.new(0, 0, -2.8);
    end);
    warn(v1165.Name .. " went in focus");
    local l_KilluaFocusMode_0 = script.KilluaFocusMode;
    local l_FocusColorCorrection_0 = l_Lighting_0:FindFirstChild("FocusColorCorrection");
    if not l_FocusColorCorrection_0 then
        l_FocusColorCorrection_0 = Instance.new("ColorCorrectionEffect");
        l_FocusColorCorrection_0.Name = "FocusColorCorrection";
        l_FocusColorCorrection_0.Brightness = 0;
        l_FocusColorCorrection_0.Contrast = 0;
        l_FocusColorCorrection_0.Saturation = 0;
        l_FocusColorCorrection_0.Parent = l_Lighting_0;
    end;
    local _ = tick();
    local v1189 = {};
    local v1190 = nil;
    local v1191 = nil;
    local v1192 = nil;
    local v1193 = nil;
    local v1194 = nil;
    local v1195 = false;
    if v1174 or v1166 and v1168.Style.Value == "KilluaShinyFocus" then
        local l_CurrentCamera_1 = l_Workspace_1.CurrentCamera;
        if v1175 then
            v33.HUDShake({
                Scale = 10, 
                Damper = 0.09999999999999999
            });
            l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 60
            }):Play();
        end;
        local v1197 = nil;
        local v1198 = nil;
        local v1199 = nil;
        do
            local l_v1197_0, l_v1198_0, l_v1199_0 = v1197, v1198, v1199;
            if v1175 and ((l_Workspace_1:GetAttribute("KilluaChanges") or 0) <= 0 or v1165.Name == "PunchingGuy") then
                v1194 = l_KilluaFocusMode_0.Wind:Clone();
                v1194.Parent = workspace.Debris;
                for _, v1204 in v1194:GetDescendants() do
                    if v1204:IsA("Beam") then
                        v1204.TextureSpeed = 10;
                        l_TweenService_0:Create(v1204, TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            TextureSpeed = 0.1
                        }):Play();
                    end;
                end;
                for _, v1206 in v1194:GetDescendants() do
                    if v1206.Name == "Cut Smoke" then
                        v1206.TimeScale = 1;
                        l_TweenService_0:Create(v1206, TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            TimeScale = 0.04
                        }):Play();
                    end;
                end;
                task.spawn(function() --[[ Line: 5572 ]]
                    -- upvalues: v1165 (copy), v1194 (ref)
                    local v1207 = v1165.HumanoidRootPart.CFrame * CFrame.new(0, -3, 0);
                    while task.wait() and v1194 and v1194.Parent == workspace.Debris do
                        v1194:PivotTo(CFrame.lookAt(v1165.PrimaryPart.Position, v1165.PrimaryPart.Position + v1207.LookVector));
                    end;
                end);
                local l_HumanoidRootPart_0 = v1165:FindFirstChild("HumanoidRootPart");
                local v1209 = GetOccupied(v1165);
                local l_l_HumanoidRootPart_0_0 = l_HumanoidRootPart_0 --[[ copy: 29 -> 40 ]];
                local _ = task.spawn(function() --[[ Line: 5583 ]]
                    -- upvalues: v1195 (ref), v1209 (copy), l_l_HumanoidRootPart_0_0 (copy), v33 (ref), v1165 (copy)
                    while not v1195 do
                        if v1209.Dashing.Value then
                            task.wait(0.1);
                        else
                            if l_l_HumanoidRootPart_0_0.AssemblyLinearVelocity.Magnitude > 2.5 then
                                v33.AfterimageEffect({
                                    Character = v1165, 
                                    MaxTime = 0.25, 
                                    Step = 2, 
                                    DeleteDelay = 0.5, 
                                    AddTransparency = 0.92, 
                                    Color = Color3.fromRGB(99, 133, 255)
                                });
                            end;
                            task.wait(0.1);
                        end;
                    end;
                end);
                local v1212 = v33.GetAtmosphere();
                if v1212 then
                    local l_Folder_0 = Instance.new("Folder");
                    l_Folder_0.Name = "CachedAtmosphere";
                    l_Folder_0.Parent = l_Lighting_0;
                    v1212.Parent = l_Folder_0;
                end;
                v35[v1165.Name] = {
                    ModifiedLighting = {
                        ExposureCompensation = l_Workspace_1.Exposure.Value, 
                        Ambient = Color3.new(0, 0, 0), 
                        OutdoorAmbient = Color3.new(0, 0, 0), 
                        EnvironmentDiffuseScale = 0.1, 
                        EnvironmentSpecularScale = 0.4, 
                        Brightness = 0, 
                        FogColor = Color3.fromRGB(9, 9, 9), 
                        FogEnd = 100, 
                        FogStart = 0
                    }
                };
                game:GetService("SoundService").AmbientReverb = Enum.ReverbType.Bathroom;
                local v1214 = {};
                for _, v1216 in v1194:GetDescendants() do
                    if v1216:IsA("Beam") then
                        table.insert(v1214, v1216);
                    end;
                end;
                l_Lighting_0.FogColor = Color3.fromRGB(6, 28, 48);
                local l_v1214_0 = v1214 --[[ copy: 33 -> 41 ]];
                local _ = task.spawn(function() --[[ Line: 5643 ]]
                    -- upvalues: v1169 (copy), v1195 (ref), v1192 (ref), l_SoundHelper_0 (ref), l_v1214_0 (copy), v23 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), l_v1197_0 (ref), l_v1198_0 (ref), v33 (ref)
                    local v1218 = 0.1;
                    local v1219 = false;
                    local v1220 = false;
                    local function _() --[[ Line: 5658 ]] --[[ Name: GetHeartbeatTime ]]
                        -- upvalues: v1169 (ref)
                        return (math.max(0.1 - (1 - math.clamp(v1169.AbilityEnergy.Value / 100, 0, 1)) * -1.4, 0.1));
                    end;
                    while not v1195 do
                        v1192 = l_SoundHelper_0:PlaySound({
                            Name = "HeartBeatLoop", 
                            Parent = workspace.Debris, 
                            Looped = false
                        });
                        local v1222 = math.max(0.1 - (1 - math.clamp(v1169.AbilityEnergy.Value / 100, 0, 1)) * -1.4, 0.1);
                        if v1222 < 1.39 then
                            local v1223 = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1), 
                                NumberSequenceKeypoint.new(0.5, 0.7), 
                                NumberSequenceKeypoint.new(1, 1)
                            });
                            for _, v1225 in l_v1214_0 do
                                task.spawn(function() --[[ Line: 5689 ]]
                                    -- upvalues: v23 (ref), v1225 (copy), v1223 (copy)
                                    v23.TweenNumberSequence(v1225.Transparency, v1223, 50, 0.5, v1225, "Transparency", Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
                                end);
                            end;
                            for _, v1227 in l_v1214_0 do
                                v1227.TextureSpeed = math.clamp(v1218, 0.1, 3);
                                l_Lighting_0.FogColor = Color3.fromRGB(14, 68, 116);
                                local v1228 = math.clamp(v1218 - 0.2, 0.2, 0.5);
                                l_TweenService_0:Create(v1227, TweenInfo.new(0.6), {
                                    TextureSpeed = v1228
                                }):Play();
                                l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.2), {
                                    FogColor = Color3.fromRGB(8, 36, 61)
                                }):Play();
                                v1218 = v1218 + 0.02;
                            end;
                            if not v1219 and v1222 < 0.15 then
                                v1219 = true;
                                l_v1197_0 = l_SoundHelper_0:PlaySound({
                                    Name = "RiserSFX", 
                                    Parent = workspace.Debris, 
                                    Looped = false
                                });
                            end;
                            if not v1220 and v1222 < 0.5 then
                                v1220 = true;
                                l_v1198_0 = v33.CameraShake({
                                    Preset = "SmallVibration", 
                                    WaitTime = 1, 
                                    Fade = 0.8, 
                                    FoVMult = 2, 
                                    FoV = 68
                                });
                                v33.HUDShake({
                                    Scale = 10, 
                                    Damper = 0.07777777777777778
                                });
                            else
                                v33.CameraShake({
                                    Preset = "SmallVibration", 
                                    WaitTime = 0.3, 
                                    Fade = 0.8, 
                                    FoV = 68, 
                                    FoVMult = 7
                                });
                            end;
                        end;
                        task.wait(v1222);
                    end;
                end);
                local l_Volume_0 = v1192.Volume;
                local l_l_Volume_0_0 = l_Volume_0 --[[ copy: 35 -> 42 ]];
                v1189[#v1189 + 1] = v1169.Cutscene.Changed:Connect(function(v1232) --[[ Line: 5769 ]]
                    -- upvalues: l_TweenService_0 (ref), v1192 (ref), l_l_Volume_0_0 (copy)
                    l_TweenService_0:Create(v1192, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Volume = v1232 and 0 or l_l_Volume_0_0
                    }):Play();
                end);
                local v1233 = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                v1193 = l_KilluaFocusMode_0.Domain:Clone();
                v1193.Parent = workspace.Debris;
                local l_l_CurrentCamera_1_0 = l_CurrentCamera_1 --[[ copy: 25 -> 43 ]];
                v1189[#v1189 + 1] = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 5778 ]]
                    -- upvalues: v1193 (ref), l_l_CurrentCamera_1_0 (copy)
                    v1193.CFrame = l_l_CurrentCamera_1_0.CFrame;
                end);
                l_Lighting_0.FogEnd = 1000;
                l_Lighting_0.FogStart = 0;
                l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FogEnd = 100, 
                    FogStart = 0
                }):Play();
                l_TweenService_0:Create(l_Lighting_0, v1233, {
                    ExposureCompensation = v35[v1165.Name].ModifiedLighting.Brightness, 
                    Ambient = v35[v1165.Name].ModifiedLighting.Ambient, 
                    OutdoorAmbient = v35[v1165.Name].ModifiedLighting.OutdoorAmbient, 
                    EnvironmentDiffuseScale = v35[v1165.Name].ModifiedLighting.EnvironmentDiffuseScale, 
                    EnvironmentSpecularScale = v35[v1165.Name].ModifiedLighting.EnvironmentSpecularScale, 
                    Brightness = v35[v1165.Name].ModifiedLighting.Brightness
                }):Play();
            end;
            if v1175 then
                workspace:SetAttribute("KilluaChanges", (workspace:GetAttribute("KilluaChanges") or 0) + 1);
                l_v1199_0 = script.StarTrail.Trail:Clone();
                l_v1199_0.Parent = v1165.HumanoidRootPart;
                for _, v1236 in l_v1199_0:GetChildren() do
                    if v1236:IsA("Trail") then
                        v1236.Enabled = false;
                    end;
                end;
                v1190 = Instance.new("PointLight", v1165.HumanoidRootPart);
                v1190.Color = Color3.new(0.529412, 0.756863, 1);
                if v1166 then
                    v1191 = Instance.new("PointLight", v1166.HumanoidRootPart);
                    v1191.Color = Color3.new(0.529412, 0.756863, 1);
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "ElectricExplosion", 
                    Parent = v1165
                });
            end;
            local l_l_CurrentCamera_1_1 = l_CurrentCamera_1 --[[ copy: 25 -> 39 ]];
            local function v1245() --[[ Line: 5826 ]] --[[ Name: Reset ]]
                -- upvalues: v1195 (ref), v1189 (copy), l_v1199_0 (ref), l_v1198_0 (ref), v1175 (copy), l_v1197_0 (ref), v1193 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), v1166 (copy), v39 (ref), v35 (ref), l_Workspace_1 (ref), v33 (ref), v1165 (copy), l_l_CurrentCamera_1_1 (copy), v1190 (ref), v1191 (ref), l_SoundHelper_0 (ref), v1192 (ref)
                if v1195 then
                    return;
                else
                    for _, v1239 in v1189 do
                        v1239:Disconnect();
                    end;
                    if l_v1199_0 then
                        l_v1199_0:Destroy();
                    end;
                    v1195 = true;
                    if l_v1198_0 then
                        l_v1198_0:StartFadeOut(0.2);
                    end;
                    game:GetService("SoundService").AmbientReverb = Enum.ReverbType.NoReverb;
                    if v1175 then
                        workspace:SetAttribute("KilluaChanges", (workspace:GetAttribute("KilluaChanges") or 1) - 1);
                    end;
                    if l_v1197_0 then
                        l_v1197_0:Destroy();
                    end;
                    if v1175 and workspace:GetAttribute("KilluaChanges") == 0 then
                        local v1240 = false;
                        if v1193 then
                            v1193:Destroy();
                        end;
                        local l_FocusColorCorrection_1 = l_Lighting_0:FindFirstChild("FocusColorCorrection");
                        if l_FocusColorCorrection_1 then
                            l_TweenService_0:Create(l_FocusColorCorrection_1, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                Contrast = 0, 
                                Saturation = 0, 
                                TintColor = Color3.fromRGB(255, 255, 255)
                            }):Play();
                        end;
                        if v1166 and v39(v1166) and v35[v1166.Name] and next(v35[v1166.Name]) ~= nil then
                            l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v35[v1166.Name].ModifiedLighting):Play();
                            l_Workspace_1.Exposure.Value = v35[v1166.Name].ModifiedLighting.ExposureCompensation;
                            l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                ExposureCompensation = l_Workspace_1.Exposure.Value
                            }):Play();
                            v1240 = true;
                        end;
                        if not v1240 or not v1166 or v1166 and not v39(v1166) then
                            v33.RestoreCachedLighting(v1165);
                            v33.GetAtmosphere();
                        end;
                        v35[v1165.Name] = {};
                        if v1166 and not v35[v1166.Name] or v35[v1166.Name] and next(v35[v1166.Name]) == nil or not v1166 then
                            v33.GetAtmosphere();
                        end;
                        for _, v1243 in workspace.Debris:GetChildren() do
                            if v1243.Name == "Domain" and l_Lighting_0:FindFirstChildWhichIsA("Atmosphere") then
                                v1243:Destroy();
                            end;
                        end;
                    end;
                    if v1175 then
                        v33.HUDShake({
                            Scale = 10, 
                            Damper = 0.09999999999999999
                        });
                        task.defer(function() --[[ Line: 5911 ]]
                            -- upvalues: v33 (ref)
                            v33.CreateImpactFrame({
                                Time = 0.1
                            });
                        end);
                        if not v1165:GetAttribute("PerformingUltimate") then
                            task.spawn(function() --[[ Line: 5918 ]]
                                -- upvalues: v33 (ref)
                                v33.CameraShake({
                                    Preset = "HardHit", 
                                    WaitTime = 0.3, 
                                    Fade = 0.8, 
                                    FoVMult = 1
                                });
                            end);
                            l_TweenService_0:Create(l_l_CurrentCamera_1_1, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                FieldOfView = 75
                            }):Play();
                        end;
                    end;
                    if v1190 then
                        v1190:Destroy();
                    end;
                    if v1191 then
                        v1191:Destroy();
                    end;
                    l_SoundHelper_0:PlaySound({
                        Name = "DempseyStart", 
                        Parent = v1175 and workspace.Debris or v1165.PrimaryPart, 
                        Speed = 0.88
                    });
                    local v1244 = l_SoundHelper_0:PlaySound({
                        Name = "EndFocusKillua", 
                        Parent = v1175 and workspace.Debris or v1165
                    });
                    task.delay(0.8, function() --[[ Line: 5947 ]]
                        -- upvalues: v1192 (ref), l_TweenService_0 (ref), v1244 (copy)
                        if v1192 then
                            l_TweenService_0:Create(v1192, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                                Volume = 0
                            }):Play();
                        end;
                        l_TweenService_0:Create(v1244, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            Volume = 0
                        }):Play();
                        task.wait(2);
                        if v1192 then
                            v1192:Destroy();
                        end;
                    end);
                    return;
                end;
            end;
            v1189[#v1189 + 1] = v1165.AncestryChanged:Connect(function() --[[ Line: 5957 ]]
                -- upvalues: v1245 (copy)
                v1245();
            end);
            v1189[#v1189 + 1] = v1167.Style.Changed:Connect(function(_) --[[ Line: 5961 ]]
                -- upvalues: v1245 (copy)
                v1245();
            end);
            v1189[#v1189 + 1] = v1165:GetAttributeChangedSignal("KilluaFocusMode"):Connect(function() --[[ Line: 5965 ]]
                -- upvalues: v1245 (copy)
                v1245();
            end);
        end;
    end;
    local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
    local v1248 = l_Vignette_1:Clone();
    v1248.Parent = l_Vignette_1;
    local v1249 = l_LocalPlayer_0.Character == v1165;
    if v1168 and (v1168.Style.Value == "ChronosFocus" or v1168.Style.Value == "KilluaShinyFocus") and not v1249 then
        v1248.Parent = l_Workspace_1.Debris;
    end;
    l_TweenService_0:Create(v1248, TweenInfo.new(8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        ImageTransparency = 0.3
    }):Play();
    v1165:SetAttribute("CurrentEmote", nil);
    if v1166 then
        local l_Humanoid_9 = v1166:FindFirstChild("Humanoid");
        for _, v1252 in ((l_Humanoid_9:FindFirstChild("Animator") or l_Humanoid_9):GetPlayingAnimationTracks()) do
            if v1159[v1252.Priority] >= 4 then
                local l_speed_0 = v1252.speed;
                v1252:AdjustSpeed(l_speed_0 / 25);
                task.delay(1, function() --[[ Line: 5996 ]]
                    -- upvalues: v1252 (copy), l_speed_0 (copy)
                    v1252:AdjustSpeed(l_speed_0);
                end);
            end;
        end;
    end;
    task.defer(function() --[[ Line: 6002 ]]
        -- upvalues: v33 (ref)
        v33.CreateImpactFrame({
            Time = 0.1
        });
    end);
    task.defer(function() --[[ Line: 6008 ]]
        -- upvalues: l_BubbleModule_0 (ref), v1165 (copy)
        for _ = 1, 3 do
            l_BubbleModule_0.CreateBubble(v1165.PrimaryPart.CFrame, Vector3.new(5, 5, 5, 0), 0.6, Vector3.new(55, 55, 55, 0), 0.5);
            task.wait(0.15);
        end;
    end);
    task.defer(function() --[[ Line: 6015 ]]
        -- upvalues: v33 (ref)
        v33.CameraShake({
            Preset = "SuperHardHit", 
            WaitTime = 0.3, 
            Fade = 0.8
        });
    end);
    if v1173 then
        l_SoundHelper_0:PlaySound({
            Name = "TimeStop", 
            Parent = v1165.PrimaryPart
        });
    end;
    l_Workspace_1.FoVMult.Value = 2;
    l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        FieldOfView = 100
    }):Play();
    task.wait(0.3);
    for _, v1256 in l_ChronosParticles_0.Current:GetChildren() do
        v1256.Enabled = true;
    end;
    if v1175 and v1166 and v1168 then
        if v1249 and v1173 and v1168.Style.Value == "KilluaShinyFocus" then
            local v1257 = {
                Brightness = 0, 
                Contrast = 0, 
                Saturation = -0.5
            };
            l_TweenService_0:Create(l_FocusColorCorrection_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v1257):Play();
        elseif v1249 and v1174 and v1168.Style.Value == "ChronosFocus" then
            local v1258 = {
                Brightness = 0.1, 
                Contrast = 0, 
                Saturation = -0.1, 
                TintColor = Color3.fromRGB(255, 255, 255)
            };
            l_TweenService_0:Create(l_FocusColorCorrection_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v1258):Play();
        end;
        if v1249 and v1174 and v1168.Style.Value ~= "ChronosFocus" then
            local v1259 = {
                Brightness = 0.1, 
                Contrast = 0.2, 
                Saturation = -0.1, 
                TintColor = Color3.fromRGB(255, 255, 255)
            };
            l_TweenService_0:Create(l_FocusColorCorrection_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v1259):Play();
        end;
        if v1249 and v1174 and v1168.Style.Value == "KilluaShinyFocus" then
            local v1260 = {
                Brightness = 0.1, 
                Contrast = 0.2, 
                Saturation = -0.1, 
                TintColor = Color3.fromRGB(255, 255, 255)
            };
            l_TweenService_0:Create(l_FocusColorCorrection_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v1260):Play();
        end;
        if v1249 and v1173 and v1168.Style.Value ~= "KilluaShinyFocus" then
            local v1261 = {
                Brightness = 0.1, 
                Contrast = 0.2, 
                Saturation = -1.45, 
                TintColor = Color3.fromRGB(255, 255, 255)
            };
            l_TweenService_0:Create(l_FocusColorCorrection_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v1261):Play();
        end;
    end;
    if not v1175 then
        for _, v1263 in l_ChronosParticles_0.Current:GetChildren() do
            v1263.Enabled = false;
        end;
    end;
    local v1264 = nil;
    v1264 = v1167.Style.Changed:Connect(function(_) --[[ Line: 6111 ]]
        -- upvalues: v1264 (ref), v33 (ref), v1176 (ref), v1177 (ref), v1173 (copy), l_SoundHelper_0 (ref), v1165 (copy), l_Workspace_1 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (copy), v1248 (copy), l_FocusColorCorrection_0 (ref), l_ChronosParticles_0 (ref), v1172 (copy), v1194 (ref), v1185 (ref)
        if v1264 then
            v1264:Disconnect();
        end;
        task.defer(function() --[[ Line: 6114 ]]
            -- upvalues: v33 (ref)
            v33.CameraShake({
                Preset = "HardHit", 
                WaitTime = 0.3, 
                Fade = 0.3
            });
        end);
        if v1176 then
            v1176:Destroy();
        end;
        if v1177 then
            v1177:Destroy();
        end;
        if v1173 then
            l_SoundHelper_0:PlaySound({
                Name = "TimeStopEnd", 
                Parent = v1165.PrimaryPart
            });
        end;
        l_Workspace_1.FoVMult.Value = 0.5;
        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            FieldOfView = 65
        }):Play();
        l_TweenService_0:Create(v1248, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            ImageTransparency = 1
        }):Play();
        l_TweenService_0:Create(l_FocusColorCorrection_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Brightness = 0, 
            Contrast = 0, 
            Saturation = 0, 
            TintColor = Color3.fromRGB(255, 255, 255)
        }):Play();
        for _, v1267 in l_ChronosParticles_0.Current:GetChildren() do
            v1267.Enabled = false;
        end;
        for _, v1269 in v1172 do
            local l_hair_0 = v1269.hair;
            local l_texture_0 = v1269.texture;
            local l_MeshPart_1 = l_hair_0:FindFirstChildWhichIsA("MeshPart");
            if l_MeshPart_1 then
                l_MeshPart_1.TextureID = l_texture_0;
            end;
        end;
        if v1194 then
            v1194:Destroy();
        end;
        task.wait(1);
        l_Workspace_1.FoVMult.Value = 3;
        task.wait(4);
        v1185:Disconnect();
        v1264:Disconnect();
        v1248:Destroy();
        l_FocusColorCorrection_0:Destroy();
        l_ChronosParticles_0:Destroy();
    end);
end;
local v1273 = {};
v33.DempseyRoll = function(v1274) --[[ Line: 6180 ]] --[[ Name: DempseyRoll ]]
    -- upvalues: v1273 (copy), v33 (copy), l_LocalPlayer_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_AnimHelper_0 (copy), l_RunService_0 (copy), l_Workspace_1 (copy), l_Lighting_0 (copy)
    local v1275 = v1274[2];
    local v1276 = v1274[3];
    local v1277 = v1274[4];
    local v1278 = GetOccupied(v1275);
    local v1279 = GetCharacterData(v1275);
    local l_Humanoid_10 = v1275:FindFirstChild("Humanoid");
    local v1281 = l_Humanoid_10:FindFirstChild("Animator") or l_Humanoid_10;
    if v1273[v1275] then
        task.defer(function() --[[ Line: 6202 ]]
            -- upvalues: v33 (ref), v1275 (copy), v1276 (copy)
            v33.AfterimageEffect({
                Character = v1275, 
                MaxTime = v1276, 
                Step = 1, 
                DeleteDelay = 0.2, 
                AddTransparency = 0.95, 
                Color = Color3.fromRGB(78, 131, 255)
            });
        end);
        local l_Track_0 = v1273[v1275].Track;
        if not v1273[v1275].Updates then
            v1273[v1275].Updates = 0;
        end;
        local v1283 = v1273[v1275];
        v1283.Updates = v1283.Updates + 1;
        v1283 = v1273[v1275].Updates;
        local v1284 = math.min(v1283 / 4, 1);
        local v1285 = script.DempseyWind.Particle:Clone();
        v1285.Parent = v33.GetWeldCharacter(v1275).PrimaryPart;
        for _, v1287 in v1285:GetChildren() do
            v1287:Emit(v1287:GetAttribute("EmitCount"));
        end;
        task.delay(5, function() --[[ Line: 6233 ]]
            -- upvalues: v1285 (copy)
            v1285:Destroy();
        end);
        local v1288 = script.DashHighlight:Clone();
        v1288.Name = "DeleteHighlight";
        v1288.Parent = v33.GetWeldCharacter(v1275);
        v1288.Adornee = v1275;
        v1288.FillColor = Color3.fromRGB(44, 118, 255);
        v1288.OutlineColor = Color3.fromRGB(31, 87, 182);
        v1288.FillTransparency = 0.85;
        v1288.OutlineTransparency = 1;
        local v1289 = l_LocalPlayer_0.Character and l_LocalPlayer_0.Character.PrimaryPart;
        if (v1275.PrimaryPart.Position - v1289.Position).Magnitude < 10 then
            v1288.DepthMode = "AlwaysOnTop";
        end;
        local v1290 = v1275 == l_LocalPlayer_0.Character;
        local v1291 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
        l_TweenService_0:Create(v1288, v1291, {
            OutlineTransparency = 0.5, 
            FillTransparency = v1290 and 0.85 or 0.6
        }):Play();
        task.delay(0.1, function() --[[ Line: 6264 ]]
            -- upvalues: v1291 (ref), l_TweenService_0 (ref), v1288 (copy)
            v1291 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
            l_TweenService_0:Create(v1288, v1291, {
                OutlineTransparency = 1, 
                FillTransparency = 1
            }):Play();
            task.wait(0.5);
            if v1288 then
                v1288:Destroy();
            end;
        end);
        l_SoundHelper_0:PlaySound({
            Name = "Subwoofer", 
            Parent = v1275.PrimaryPart, 
            Volume = 0.2 + 0.39999999999999997 * v1284, 
            Speed = 0.5 + 0.5 * v1284
        });
        local l_Sound_0 = v1273[v1275].Sound;
        l_TweenService_0:Create(l_Sound_0, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Volume = 0.035 + 0.125 * v1284, 
            PlaybackSpeed = 0.7 + 0.30000000000000004 * v1284
        }):Play();
        l_Sound_0.EqualizerSoundEffect.LowGain = -20 + 30 * v1284;
        local v1293 = tick();
        local v1294 = v1273[v1275] and v1273[v1275].LastUpdate or 0;
        if tick() - v1294 < 0.3 then
            return;
        else
            v1273[v1275].LastUpdate = v1293;
            v1275:SetAttribute("DempseyCombo", v1283);
            if v1283 >= 3 then
                return;
            else
                local v1295 = 0.7 + 0.55 * v1284;
                local v1296 = 0.6 + 0.4 * v1284;
                for _ = 1, 4 do
                    if v1273[v1275] and v1273[v1275].LastUpdate == v1293 then
                        l_Track_0:AdjustSpeed(v1295);
                        l_Track_0:AdjustWeight(v1296, 0.1);
                        task.wait(0.1);
                    else
                        break;
                    end;
                end;
                return;
            end;
        end;
    else
        local v1298 = {
            Priority = Enum.AnimationPriority.Action2, 
            Animator = v1281, 
            AnimId = 17361664571, 
            NameFade = 0.001, 
            FadeIn = 0.7, 
            Weight = 0.6, 
            Name = "Dempsey", 
            AnimSpeed = 0.5, 
            Looped = true
        };
        local l_l_AnimHelper_0_Anim_4 = l_AnimHelper_0:CreateAnim(v1298);
        l_l_AnimHelper_0_Anim_4:AdjustWeight(0.6, 0.1);
        local v1300 = tick();
        local v1301 = v1275 == l_LocalPlayer_0.Character;
        v1275:SetAttribute("NoBlock", v1300);
        local v1302 = {};
        local v1303 = false;
        local v1304 = math.random(1, 1000);
        local function v1317(v1305, v1306) --[[ Line: 6344 ]] --[[ Name: Reset ]]
            -- upvalues: v1303 (ref), l_RunService_0 (ref), v1304 (copy), v1302 (copy), v1275 (copy), v1300 (copy), l_l_AnimHelper_0_Anim_4 (copy), v1281 (copy), l_AnimHelper_0 (ref), v1273 (ref), l_TweenService_0 (ref), v1301 (copy), v1279 (copy), v1278 (copy)
            local v1307 = false;
            if v1303 then
                return;
            else
                v1303 = true;
                l_RunService_0:UnbindFromRenderStep("DempseyRoll" .. v1304);
                for _, v1309 in v1302 do
                    v1309:Disconnect();
                end;
                v1275:SetAttribute("DempseyCombo", nil);
                if v1275:GetAttribute("NoDash") == v1300 then
                    v1275:SetAttribute("NoDash", nil);
                end;
                if v1275:GetAttribute("NoBlock") == v1300 then
                    v1275:SetAttribute("NoBlock", nil);
                end;
                l_l_AnimHelper_0_Anim_4.Looped = false;
                l_l_AnimHelper_0_Anim_4:Stop(0.1);
                local v1310 = {
                    Priority = Enum.AnimationPriority.Action2, 
                    Animator = v1281, 
                    AnimId = 13633646038, 
                    NameFade = 0.1, 
                    FadeIn = 0.1, 
                    Weight = 1000, 
                    Name = "Dempsey"
                };
                local l_l_AnimHelper_0_Anim_5 = l_AnimHelper_0:CreateAnim(v1310);
                if l_l_AnimHelper_0_Anim_5 then
                    l_l_AnimHelper_0_Anim_5:Stop(0.1);
                end;
                for _, v1313 in v1275:GetChildren() do
                    if v1313.Name == "DeleteHighlight" then
                        v1313:Destroy();
                    end;
                end;
                local l_Sound_1 = v1273[v1275].Sound;
                l_TweenService_0:Create(l_Sound_1, TweenInfo.new(v1305 and 0.7 or 4.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Volume = 0
                }):Play();
                task.delay(5, function() --[[ Line: 6393 ]]
                    -- upvalues: l_Sound_1 (copy)
                    if l_Sound_1 then
                        l_Sound_1:Destroy();
                    end;
                end);
                v1273[v1275] = nil;
                if v1301 then
                    v1279.AbilityEnergy.Value = 0;
                    local _ = game:GetService("ReplicatedFirst");
                    local v1316;
                    if game:GetService("RunService"):IsClient() then
                        v1316 = shared.BridgeNet2;
                        if not v1316 then
                            repeat
                                task.wait();
                            until shared.BridgeNet2;
                            v1316 = shared.BridgeNet2;
                            v1307 = v1316;
                        else
                            v1307 = true;
                        end;
                    end;
                    if not v1307 then
                        if not v1307 then
                            v1316 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
                        end;
                    end;
                    v1307 = false;
                    v1316.ReferenceBridge("DempseyStopped"):Fire(false);
                end;
                v1278.FaceAnyways.Value = false;
                if v1306 then
                    task.wait(1.5);
                end;
                if not v1275:GetAttribute("CurrentEmote") then
                    v1278.LerpMult.Value = 0;
                    v1278.SpeedMult.Value = 0;
                end;
                return;
            end;
        end;
        v1302[1] = v1275:GetAttributeChangedSignal("DempseyRolling"):Connect(function() --[[ Line: 6420 ]]
            -- upvalues: v1317 (copy)
            v1317(true);
        end);
        if not v1275:GetAttribute("LastDamaged") then
            v1275:SetAttribute("LastDamaged", 0);
        end;
        local l_v1275_Attribute_0 = v1275:GetAttribute("LastDamaged");
        local v1319 = nil;
        v1302[2] = v1275:GetAttributeChangedSignal("LastDamaged"):Connect(function() --[[ Line: 6432 ]]
            -- upvalues: v1275 (copy), l_v1275_Attribute_0 (ref), v1319 (ref), v1317 (copy)
            local l_v1275_Attribute_1 = v1275:GetAttribute("LastDamaged");
            if not l_v1275_Attribute_1 then
                return;
            elseif l_v1275_Attribute_1 < l_v1275_Attribute_0 then
                v1319 = tick();
                return;
            else
                l_v1275_Attribute_0 = l_v1275_Attribute_1;
                local l_v1319_0 = v1319;
                task.wait(0.3);
                if l_v1319_0 ~= v1319 then
                    return;
                else
                    v1317();
                    return;
                end;
            end;
        end);
        task.defer(function() --[[ Line: 6453 ]]
            -- upvalues: v1303 (ref), l_l_AnimHelper_0_Anim_4 (copy), v33 (ref), v1275 (copy)
            while not v1303 do
                local v1322 = (l_l_AnimHelper_0_Anim_4.Speed - 0.7) / 0.55;
                v33.AfterimageEffect({
                    Character = v1275, 
                    MaxTime = 0.2, 
                    Step = 2, 
                    DeleteDelay = 0.2 + 0.3 * v1322, 
                    AddTransparency = 0.99 + -0.025000000000000022 * v1322
                });
            end;
        end);
        l_RunService_0:BindToRenderStep("DempseyRoll" .. v1304, Enum.RenderPriority.Camera.Value + 2, function(_) --[[ Line: 6470 ]]
            -- upvalues: v1303 (ref), v1275 (copy), v1279 (copy), v1317 (copy), v1278 (copy), v1273 (ref), l_l_AnimHelper_0_Anim_4 (copy), l_Humanoid_10 (copy)
            if v1303 then
                return;
            elseif not v1275 or not v1279 or not v1279:FindFirstChild("Cutscene") or v1279.Cutscene.Value then
                v1317(true);
                return;
            elseif not v1279.Equipped.Value or v1279.Stamina.Value <= 1 then
                v1317();
                return;
            elseif v1278.Punching.Value then
                v1317();
                return;
            else
                local v1324 = tick() - v1273[v1275].LastUpdate;
                local v1325 = (l_l_AnimHelper_0_Anim_4.Speed - 0.7) / 0.55;
                v1278.LerpMult.Value = 1;
                local v1326 = v1273[v1275].Updates or 0;
                if v1324 < 0.1 and v1326 > 0 then
                    l_Humanoid_10.WalkSpeed = 17;
                    v1278.SpeedMult.Value = 0;
                else
                    l_Humanoid_10.WalkSpeed = 12;
                    v1278.SpeedMult.Value = 0.96 + -0.07999999999999996 * v1325;
                end;
                local l_l_Humanoid_10_0 = l_Humanoid_10;
                l_l_Humanoid_10_0.WalkSpeed = l_l_Humanoid_10_0.WalkSpeed * (1 + -1 * v1278.SpeedMult.Value);
                l_Humanoid_10:Move(v1275.PrimaryPart.CFrame.LookVector, false);
                l_l_Humanoid_10_0 = v1278.LockedOn.Value;
                if not l_l_Humanoid_10_0 then
                    return;
                elseif (v1275.PrimaryPart.Position - l_l_Humanoid_10_0.PrimaryPart.Position).Magnitude > 2.5 then
                    return;
                else
                    l_Humanoid_10:Move(Vector3.new(), false);
                    return;
                end;
            end;
        end);
        l_l_AnimHelper_0_Anim_4.Priority = Enum.AnimationPriority.Action2;
        v1302[3] = v1281.AnimationPlayed:Connect(function(v1328) --[[ Line: 6530 ]]
            -- upvalues: v1317 (copy)
            if v1328.Name ~= "Emote" then
                return;
            else
                v1317();
                return;
            end;
        end);
        local v1329 = l_SoundHelper_0:PlaySound({
            Name = "JetEngine", 
            Parent = v1275.PrimaryPart, 
            IgnoreDelete = true, 
            Volume = 0.035, 
            Speed = 0.7
        });
        v1329.TimePosition = 2.25;
        v1273[v1275] = {
            Track = l_l_AnimHelper_0_Anim_4, 
            LastUpdate = tick(), 
            StartTime = v1300, 
            Sound = v1329
        };
        l_SoundHelper_0:PlaySound({
            Name = "DempseyStart", 
            Parent = v1275.PrimaryPart
        });
        if l_LocalPlayer_0.Character ~= v1277 and not v1301 then
            return;
        else
            v1278.FaceAnyways.Value = true;
            l_Workspace_1.FoVMult.Value = 1;
            l_Workspace_1.CurrentCamera.FieldOfView = 65;
            local l_ColorCorrectionEffect_2 = Instance.new("ColorCorrectionEffect");
            l_ColorCorrectionEffect_2.Saturation = 0;
            l_ColorCorrectionEffect_2.Contrast = 0;
            l_ColorCorrectionEffect_2.Enabled = true;
            local v1331 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrectionEffect_2, v1331, {
                Saturation = 0.2, 
                Contrast = 0.5
            }):Play();
            local v1332 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v1332, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.15
            }):Play();
            task.delay(0.3, function() --[[ Line: 6577 ]]
                -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v1332 (copy)
                l_TweenService_0:Create(l_Lighting_0, v1332, {
                    ExposureCompensation = workspace.Exposure.Value
                }):Play();
            end);
            task.delay(2, function() --[[ Line: 6581 ]]
                -- upvalues: l_ColorCorrectionEffect_2 (copy)
                l_ColorCorrectionEffect_2:Destroy();
            end);
            return;
        end;
    end;
end;
v33.Hammer = function(v1333) --[[ Line: 6587 ]] --[[ Name: Hammer ]]
    -- upvalues: l_AnimHelper_0 (copy), l_LocalPlayer_0 (copy), l_Workspace_1 (copy), l_NumberSequenceTween_0 (copy), l_SoundHelper_0 (copy), v33 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy)
    local v1334 = v1333[2];
    local v1335 = v1333[3];
    local v1336 = v1333[4];
    local l_Humanoid_11 = v1335:FindFirstChild("Humanoid");
    local v1338 = l_Humanoid_11:FindFirstChild("Animator") or l_Humanoid_11;
    local v1339 = GetCharacterData(v1335);
    if v1339.Dashing.Value then
        return;
    else
        local v1340 = {
            AnimId = 17523810127, 
            FadeIn = 0.05, 
            AnimSpeed = 1, 
            Priority = Enum.AnimationPriority.Action2, 
            Animator = v1338, 
            Weight = 1000, 
            Name = "Server", 
            NameFade = 0.15
        };
        local l_l_AnimHelper_0_Anim_6 = l_AnimHelper_0:CreateAnim(v1340);
        local v1342 = l_LocalPlayer_0.Character == v1334;
        local v1343 = l_Workspace_1:GetServerTimeNow() - v1336;
        if v1342 then
            v1343 = v1343 - 0.06666666666666667;
        else
            task.wait(0.06666666666666667);
        end;
        l_l_AnimHelper_0_Anim_6.TimePosition = v1343;
        local l_Humanoid_12 = v1334:FindFirstChild("Humanoid");
        local v1345 = l_Humanoid_12:FindFirstChild("Animator") or l_Humanoid_12;
        local v1346 = {
            AnimId = 17522968535, 
            FadeIn = 0.05, 
            AnimSpeed = 1, 
            Priority = Enum.AnimationPriority.Action2, 
            Animator = v1345, 
            Weight = 1000, 
            Name = "Server", 
            NameFade = 0.15
        };
        l_AnimHelper_0:CreateAnim(v1346).TimePosition = l_l_AnimHelper_0_Anim_6.TimePosition;
        local v1347 = script.HammerWind:Clone();
        v1347.Parent = l_Workspace_1.Debris;
        v1347.CFrame = v1335.PrimaryPart.CFrame * CFrame.new(0, 0.9, 0);
        local v1350 = {
            [1] = v1339.Dashing.Changed:Connect(function() --[[ Line: 6643 ]]
                -- upvalues: v1347 (copy), l_NumberSequenceTween_0 (ref)
                for _, v1349 in v1347.Particle:GetChildren() do
                    l_NumberSequenceTween_0.Tween(v1349, 20, 1);
                end;
            end)
        };
        task.delay(0.5, function() --[[ Line: 6649 ]]
            -- upvalues: v1350 (copy)
            for _, v1352 in v1350 do
                if v1352 then
                    v1352:Disconnect();
                end;
            end;
        end);
        task.delay(0.16666666666666666 - v1343, function() --[[ Line: 6655 ]]
            -- upvalues: v1339 (copy), v1347 (copy)
            if v1339.Dashing.Value then
                return;
            else
                for _, v1354 in v1347.Particle:GetChildren() do
                    v1354:Emit(1);
                end;
                task.wait(5);
                v1347:Destroy();
                return;
            end;
        end);
        l_SoundHelper_0:PlaySound({
            Name = "Rustle1", 
            Parent = v1334, 
            Volume = 0.4, 
            Speed = 0.8
        });
        task.delay(0.21666666666666667 - v1343, function() --[[ Line: 6673 ]]
            -- upvalues: v1339 (copy), l_SoundHelper_0 (ref), v1334 (copy)
            if v1339.Dashing.Value then
                return;
            else
                l_SoundHelper_0:PlaySound({
                    Name = "Rustle5", 
                    Parent = v1334, 
                    Volume = 1.6
                });
                return;
            end;
        end);
        if not v1342 and l_LocalPlayer_0.Character ~= v1335 then
            return;
        else
            task.wait(0.08333333333333333 - v1343);
            if v1339.Dashing.Value then
                return;
            else
                l_Workspace_1.FoVMult.Value = 0.5;
                local l_CurrentCamera_2 = l_Workspace_1.CurrentCamera;
                task.defer(function() --[[ Line: 6691 ]]
                    -- upvalues: v33 (ref)
                    v33.CameraShake({
                        Preset = "LightHit", 
                        WaitTime = 0.3, 
                        Fade = 0.2
                    });
                end);
                task.wait(0.16666666666666666);
                if v1339.Dashing.Value then
                    return;
                else
                    local v1356 = l_TweenService_0:Create(l_CurrentCamera_2, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        FieldOfView = 60
                    });
                    v1356:Play();
                    task.defer(function() --[[ Line: 6705 ]]
                        -- upvalues: v33 (ref)
                        v33.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.1, 
                            Fade = 0.1
                        });
                    end);
                    local l_ColorCorrectionEffect_3 = Instance.new("ColorCorrectionEffect");
                    l_ColorCorrectionEffect_3.Saturation = 0;
                    l_ColorCorrectionEffect_3.Contrast = 0;
                    l_ColorCorrectionEffect_3.Enabled = true;
                    local v1358 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                    l_TweenService_0:Create(l_ColorCorrectionEffect_3, v1358, {
                        Saturation = 0.2, 
                        Contrast = 0.5
                    }):Play();
                    local v1359 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                    l_TweenService_0:Create(l_Lighting_0, v1359, {
                        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.15
                    }):Play();
                    task.wait(0.3333333333333333);
                    for _, v1361 in v1350 do
                        if v1361 then
                            v1361:Disconnect();
                        end;
                    end;
                    v1356:Cancel();
                    l_CurrentCamera_2.FieldOfView = 75;
                    return;
                end;
            end;
        end;
    end;
end;
v33.SetTransparency = function(v1362, v1363, v1364) --[[ Line: 6733 ]] --[[ Name: SetTransparency ]]
    -- upvalues: l_Workspace_1 (copy)
    if not v1362 or not v1362:IsA("Model") then
        return;
    else
        local l_v1362_Descendants_0 = v1362:GetDescendants();
        if v1364 == nil then
            v1364 = false;
        end;
        local l_FirstChild_23 = l_Workspace_1.Welds:FindFirstChild(v1362.Name);
        if l_FirstChild_23 then
            for _, v1368 in l_FirstChild_23:GetDescendants() do
                table.insert(l_v1362_Descendants_0, v1368);
            end;
        end;
        for _, v1370 in l_v1362_Descendants_0 do
            if v1370.Name == "UnusualParticle" then
                v1370.Enabled = v1363 == 0;
                if v1363 == 1 then
                    v1370:Clear();
                end;
            elseif v1370:IsA("ParticleEmitter") then
                if v1363 == 0 and v1370:GetAttribute("ST_WasEnabled") then
                    v1370.Enabled = v1370:GetAttribute("ST_WasEnabled");
                    v1370:SetAttribute("ST_WasEnabled", nil);
                elseif v1363 == 1 and not v1370:GetAttribute("ST_WasEnabled") then
                    v1370:SetAttribute("ST_WasEnabled", v1370.Enabled);
                    v1370.Enabled = false;
                end;
            elseif v1370:IsA("Trail") or v1370:IsA("Beam") and not v1364 then
                v1370.Enabled = v1363 == 0;
            end;
            if (v1370:IsA("BasePart") or v1370:IsA("Decal")) and v1370.LocalTransparencyModifier < 1000 then
                v1370.LocalTransparencyModifier = v1363;
            end;
        end;
        return;
    end;
end;
v33.TGESetTransparency = function(v1371, v1372) --[[ Line: 6779 ]] --[[ Name: TGESetTransparency ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_1 (copy)
    for _, v1374 in v1371:GetDescendants() do
        if v1374.Name == "UnusualParticle" then
            v1374.Enabled = v1372 == 0;
            if not v1374.Enabled then
                local l_Parent_4 = v1374.Parent;
                v1374.Parent = l_ReplicatedStorage_0;
                v1374.Parent = l_Parent_4;
            end;
        end;
        if (v1374:IsA("BasePart") or v1374:IsA("Decal")) and v1374.LocalTransparencyModifier < 1000 then
            v1374.LocalTransparencyModifier = v1372;
            if v1374.Name == "Handle" then
                if v1374.Parent.Name == "Third" then
                    v1374.Transparency = 1;
                else
                    local l_v1374_Attribute_0 = v1374:GetAttribute("StartTransparency");
                    if not l_v1374_Attribute_0 then
                        v1374:SetAttribute("StartTransparency", v1374.Transparency);
                        l_v1374_Attribute_0 = v1374.Transparency;
                    end;
                    if v1372 == 1 then
                        v1374.Transparency = 1;
                    elseif v1372 == 0 then
                        v1374.Transparency = l_v1374_Attribute_0;
                    end;
                end;
            end;
        end;
    end;
    local l_FirstChild_24 = l_Workspace_1.Welds:FindFirstChild(v1371.Name);
    if l_FirstChild_24 then
        for _, v1379 in l_FirstChild_24:GetDescendants() do
            if v1379.Name == "UnusualParticle" then
                v1379.Enabled = v1372 == 0;
                if not v1379.Enabled then
                    local l_Parent_5 = v1379.Parent;
                    v1379.Parent = l_ReplicatedStorage_0;
                    v1379.Parent = l_Parent_5;
                end;
            end;
            if (v1379:IsA("BasePart") or v1379:IsA("Decal")) and v1379.LocalTransparencyModifier < 1000 then
                v1379.LocalTransparencyModifier = v1372;
            end;
        end;
    end;
end;
v33.ReplicateMinigameData = function(v1381) --[[ Line: 6837 ]] --[[ Name: ReplicateMinigameData ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v1382 = v1381[2];
    local v1383 = v1382[1];
    local v1384 = v1382[2];
    local v1385 = v1382[3];
    local l_FirstChild_25 = l_LocalPlayer_0.PlayerGui:FindFirstChild(v1383.Name .. "FNF_Minigame");
    if not l_FirstChild_25 then
        return;
    else
        local l_Settings_0 = l_FirstChild_25.Settings;
        l_Settings_0.ScoreProgress.Value = v1384;
        l_Settings_0.Combo.Value = v1385;
        return;
    end;
end;
local v1388 = false;
v33.ReplicateQuickReload = function(v1389) --[[ Line: 6856 ]] --[[ Name: ReplicateQuickReload ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_SoundHelper_0 (copy), l_Workspace_1 (copy), v33 (copy), l_AnimHelper_0 (copy)
    local v1390 = false;
    local v1391 = v1389[2];
    local v1392 = v1389[3];
    local v1393 = GetPlayerData(v1391);
    if not v1393 then
        return;
    else
        local v1394 = v1393.Style.Value == "ShotgunProdigy";
        local v1395 = v1391 == l_LocalPlayer_0.Character;
        if v1395 then
            local _ = game:GetService("ReplicatedFirst");
            local v1397;
            if game:GetService("RunService"):IsClient() then
                v1397 = shared.BridgeNet2;
                if not v1397 then
                    repeat
                        task.wait();
                    until shared.BridgeNet2;
                    v1397 = shared.BridgeNet2;
                    v1390 = v1397;
                else
                    v1390 = true;
                end;
            end;
            if not v1390 then
                if not v1390 then
                    v1397 = require(game:GetService("ReplicatedFirst"):WaitForChild("BridgeNet2"));
                end;
            end;
            v1390 = false;
            local v1398 = v1397.ReferenceBridge("ReplicateQuickReload");
            local v1399 = v1397.ReferenceBridge("TryAbility");
            v1398:Fire(v1389);
            if v1392 ~= "Start" and v1392 ~= "Fail" then
                v1399:Fire(v1392);
            end;
        end;
        local function v1405(v1400) --[[ Line: 6883 ]] --[[ Name: Cleanup ]]
            for _, v1402 in v1400 do
                if v1402.Name == "ShotgunAura" then
                    v1402.Name = "NotShotgunAura";
                    v1402.Enabled = false;
                end;
            end;
            task.wait(5);
            for _, v1404 in v1400 do
                if v1404.Name == "ShotgunAura" or v1404.Name == "NotShotgunAura" then
                    v1404:Destroy();
                end;
            end;
        end;
        if v1392 == "Start" then
            l_SoundHelper_0:PlaySound({
                Name = "QuickReloadStart", 
                Parent = v1395 and l_Workspace_1.Debris or v1391.PrimaryPart
            });
            local v1406 = {};
            for _, v1408 in v1391:GetChildren() do
                if v1408:IsA("BasePart") and v1408.Name ~= "HumanoidRootPart" then
                    for _, v1410 in script.ShotgunAura:GetChildren() do
                        local v1411 = v1410:Clone();
                        v1411.Name = "ShotgunAura";
                        v1411.Parent = v1408;
                        table.insert(v1406, v1411);
                    end;
                end;
            end;
            if not v1395 then
                task.spawn(function() --[[ Line: 6918 ]]
                    -- upvalues: v1406 (ref), l_Workspace_1 (ref)
                    for _ = 1, 4.5, 0.7 do
                        for _, v1414 in v1406 do
                            if v1414.Name ~= "ShotgunAura" then
                                return;
                            else
                                v1414:Emit(v1414.Rate / (l_Workspace_1.Settings.PerformanceMode.Value and 0.9 or 1.5));
                            end;
                        end;
                        task.wait(0.7);
                    end;
                end);
            end;
            task.spawn(function() --[[ Line: 6932 ]]
                -- upvalues: v33 (ref), v1391 (copy)
                for _, v1416 in (script.ShotgunAuraBurst:GetChildren()) do
                    local v1417 = v1416:Clone();
                    v1417.Parent = v33.GetWeldCharacter(v1391).PrimaryPart;
                    if v1417:IsA("ParticleEmitter") then
                        EmitParticle(v1417);
                    elseif v1417:IsA("Attachment") then
                        for _, v1419 in (v1417:GetChildren()) do
                            EmitParticle(v1419);
                        end;
                    end;
                end;
            end);
            task.delay(5, function() --[[ Line: 6952 ]]
                -- upvalues: v1405 (copy), v1406 (ref)
                v1405(v1406);
                v1406 = {};
            end);
            return;
        else
            if v1392 == "Perfect" then
                l_SoundHelper_0:PlaySound({
                    Name = "QuickReloadTwo", 
                    Parent = v1395 and l_Workspace_1.Debris or v1391.PrimaryPart
                });
                if v1395 then
                    l_LocalPlayer_0:SetAttribute("AbilitySlowdown", 0);
                end;
            elseif v1392 == "Normal" then
                l_SoundHelper_0:PlaySound({
                    Name = "QuickReloadOne", 
                    Parent = v1395 and l_Workspace_1.Debris or v1391.PrimaryPart
                });
                if v1395 then
                    l_LocalPlayer_0:SetAttribute("AbilitySlowdown", 0);
                end;
                local l_Humanoid_13 = v1391:FindFirstChild("Humanoid");
                local v1421 = {
                    Priority = Enum.AnimationPriority.Action2, 
                    Animator = l_Humanoid_13:FindFirstChild("Animator"), 
                    AnimId = 100549864753834, 
                    NameFade = 0.05, 
                    FadeIn = 0.1, 
                    Weight = 1000, 
                    Name = "Server", 
                    Speed = 1.2
                };
                if v1391 == l_LocalPlayer_0.Character then
                    v1421.Priority = Enum.AnimationPriority.Action;
                end;
                l_AnimHelper_0:CreateAnim(v1421);
                task.spawn(function() --[[ Line: 6999 ]]
                    -- upvalues: v33 (ref), v1391 (copy)
                    for _, v1423 in (script.ProdigyBurst:GetChildren()) do
                        local v1424 = v1423:Clone();
                        v1424.Parent = v33.GetWeldCharacter(v1391).PrimaryPart;
                        if v1424:IsA("ParticleEmitter") then
                            EmitParticle(v1424);
                        elseif v1424:IsA("Attachment") then
                            for _, v1426 in (v1424:GetChildren()) do
                                EmitParticle(v1426);
                            end;
                        end;
                    end;
                end);
            else
                if v1395 then
                    l_SoundHelper_0:PlaySound({
                        Name = "QuickReloadFail", 
                        Parent = v1395 and l_Workspace_1.Debris or v1391.PrimaryPart
                    });
                end;
                if v1395 then
                    l_LocalPlayer_0:SetAttribute("AbilitySlowdown", 0.2);
                end;
            end;
            if v1389[4] or v1395 and v1392 == "Fail" and v1394 then
                l_SoundHelper_0:PlaySound({
                    Name = "QuickReloadFail", 
                    Parent = v1395 and l_Workspace_1.Debris or v1391.PrimaryPart
                });
                task.spawn(function() --[[ Line: 7037 ]]
                    -- upvalues: v33 (ref), v1391 (copy)
                    for _, v1428 in (script.ShowoffBurst:GetChildren()) do
                        local v1429 = v1428:Clone();
                        v1429.Parent = v33.GetWeldCharacter(v1391).PrimaryPart;
                        if v1429:IsA("ParticleEmitter") then
                            EmitParticle(v1429);
                        elseif v1429:IsA("Attachment") then
                            for _, v1431 in (v1429:GetChildren()) do
                                EmitParticle(v1431);
                            end;
                        end;
                    end;
                end);
            end;
            v1405(v1391:GetDescendants());
            return;
        end;
    end;
end;
v33.QuickReloadMinigame = function(_) --[[ Line: 7061 ]] --[[ Name: QuickReloadMinigame ]]
    -- upvalues: l_LocalPlayer_0 (copy), v1388 (ref), v33 (copy), l_Main_0 (copy), l_TweenService_0 (copy), v34 (copy), l_ReplicatedStorage_0 (copy)
    local v1433 = GetCharacterData(l_LocalPlayer_0.Character);
    if not v1433 then
        return;
    else
        local v1434 = GetOccupied(l_LocalPlayer_0.Character);
        if not v1434 then
            return;
        else
            local v1435 = GetPlayerData(l_LocalPlayer_0.Character);
            if not v1435 then
                return;
            else
                local v1436 = tick();
                v1388 = v1436;
                local l_UserInputService_1 = game:GetService("UserInputService");
                local v1438 = l_UserInputService_1.TouchEnabled and not (l_UserInputService_1.MouseEnabled or l_UserInputService_1.KeyboardEnabled);
                local l_FirstChild_26 = script.QuickReloadFrames:FindFirstChild(v1438 and "Mobile" or "Default");
                if not l_FirstChild_26 then
                    return;
                else
                    l_LocalPlayer_0:SetAttribute("AbilitySlowdown", 1);
                    l_FirstChild_26 = l_FirstChild_26:Clone();
                    local l_Main_4 = l_FirstChild_26.Main;
                    task.delay(6, function() --[[ Line: 7086 ]]
                        -- upvalues: l_FirstChild_26 (ref)
                        if l_FirstChild_26 then
                            l_FirstChild_26:Destroy();
                        end;
                    end);
                    task.spawn(function() --[[ Line: 7090 ]]
                        -- upvalues: v33 (ref), l_LocalPlayer_0 (ref)
                        v33.ReplicateQuickReload({
                            nil, 
                            l_LocalPlayer_0.Character, 
                            "Start"
                        });
                    end);
                    if v1438 then
                        l_FirstChild_26.Parent = l_Main_0.Controls.RightBottom;
                        local l_Size_8 = l_Main_4.Size;
                        l_Main_4.Size = UDim2.new(l_Size_8.X.Scale / 2, 0, 0, 0);
                        l_TweenService_0:Create(l_Main_4, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            Size = l_Size_8
                        }):Play();
                    else
                        l_FirstChild_26.Parent = l_Main_0.SpecialFrame.Generic.One;
                        local l_Position_16 = l_Main_4.Position;
                        l_Main_4.Position = UDim2.new(l_Position_16.X.Scale, 0, l_Position_16.Y.Scale + 5, 0);
                        l_TweenService_0:Create(l_Main_4, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            Position = l_Position_16
                        }):Play();
                    end;
                    for _, v1444 in l_FirstChild_26:GetDescendants() do
                        if v1444:IsA("UIStroke") and v1444.Name ~= "Ignore" then
                            local l_Thickness_0 = v1444.Thickness;
                            v1444.Thickness = 0;
                            l_TweenService_0:Create(v1444, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                Thickness = l_Thickness_0
                            }):Play();
                        end;
                    end;
                    local l_Marker_0 = l_Main_4.Marker;
                    local l_Size_9 = l_Marker_0.Size;
                    l_Marker_0.Size = UDim2.new(0, 0, 0, 0);
                    l_TweenService_0:Create(l_Marker_0, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Size = l_Size_9
                    }):Play();
                    l_Marker_0.Position = UDim2.new(0, 0, 0.5, 0);
                    local v1448 = l_TweenService_0:Create(l_Marker_0, TweenInfo.new(0.95, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true), {
                        Position = UDim2.new(1, 0, 0.5, 0)
                    });
                    v1448:Play();
                    local l_Scale_0 = l_Main_4.Window.Size.X.Scale;
                    l_Main_4.Window.Position = UDim2.new(v34:NextNumber(l_Scale_0, 1 - l_Scale_0, 0, 0, 0));
                    local l_Keybinds_0 = require(l_ReplicatedStorage_0:WaitForChild("Keybinds"));
                    local l_UseSpecial_0 = l_ReplicatedStorage_0:WaitForChild("MobileEvents"):WaitForChild("UseSpecial");
                    local v1452 = {};
                    local function v1459() --[[ Line: 7138 ]] --[[ Name: Reset ]]
                        -- upvalues: v1388 (ref), v1436 (copy), l_FirstChild_26 (ref), v1452 (copy), v33 (ref), l_LocalPlayer_0 (ref), v1438 (copy), l_Main_4 (copy), l_TweenService_0 (ref)
                        if v1388 ~= v1436 then
                            if l_FirstChild_26 then
                                l_FirstChild_26:Destroy();
                            end;
                            return;
                        else
                            v1388 = nil;
                            for _, v1454 in v1452 do
                                v1454:Disconnect();
                            end;
                            task.spawn(function() --[[ Line: 7150 ]]
                                -- upvalues: v33 (ref), l_LocalPlayer_0 (ref)
                                v33.ReplicateQuickReload({
                                    nil, 
                                    l_LocalPlayer_0.Character, 
                                    "Fail"
                                });
                            end);
                            l_LocalPlayer_0:SetAttribute("AbilitySlowdown", 0.2);
                            if v1438 then
                                local _ = l_Main_4.Size;
                                l_TweenService_0:Create(l_Main_4, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                    Size = UDim2.new(0, 0, 0, 0), 
                                    Rotation = -6
                                }):Play();
                                for _, v1457 in l_FirstChild_26:GetDescendants() do
                                    if v1457:IsA("UIStroke") then
                                        l_TweenService_0:Create(v1457, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                            Thickness = 0
                                        }):Play();
                                    end;
                                end;
                            else
                                local l_Position_17 = l_Main_4.Position;
                                l_TweenService_0:Create(l_Main_4, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                    Position = UDim2.new(l_Position_17.X.Scale, 0, l_Position_17.Y.Scale + 8, 0), 
                                    Rotation = 15
                                }):Play();
                            end;
                            task.wait(3);
                            l_FirstChild_26:Destroy();
                            return;
                        end;
                    end;
                    local v1460 = v1435.Style.Value == "ShotgunProdigy";
                    if v1460 then
                        l_Main_4.Window.BackgroundTransparency = 1;
                    end;
                    l_Main_4.Window.Size = UDim2.new(l_Main_4.Window.Size.X.Scale * 1, 0, l_Main_4.Window.Size.Y.Scale, 0);
                    local function v1484() --[[ Line: 7187 ]] --[[ Name: Reload ]]
                        -- upvalues: v1388 (ref), v1436 (copy), l_FirstChild_26 (ref), v1452 (copy), v1448 (copy), l_TweenService_0 (ref), l_Main_4 (copy), v1460 (copy), v1434 (copy), l_LocalPlayer_0 (ref), v33 (ref), v1438 (copy)
                        local v1461 = false;
                        if v1388 ~= v1436 then
                            if l_FirstChild_26 then
                                l_FirstChild_26:Destroy();
                            end;
                            return;
                        else
                            v1388 = nil;
                            for _, v1463 in v1452 do
                                v1463:Disconnect();
                            end;
                            v1448:Pause();
                            local v1464 = TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                            l_TweenService_0:Create(l_Main_4.Shine, v1464, {
                                BackgroundTransparency = 0.2
                            }):Play();
                            l_Main_4.Shine.UIGradient.Offset = Vector2.new(-1, 0);
                            l_TweenService_0:Create(l_Main_4.Shine.UIGradient, TweenInfo.new(1.2, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {
                                Offset = Vector2.new(2, 0)
                            }):Play();
                            local l_Window_0 = l_Main_4.Window;
                            local l_Perfect_0 = l_Window_0.Perfect;
                            local l_Main_5 = l_Main_4.Marker.Main;
                            local function _(v1468) --[[ Line: 7215 ]] --[[ Name: CheckMarkerIntersection ]]
                                -- upvalues: l_Main_5 (copy)
                                local l_X_1 = l_Main_5.AbsolutePosition.X;
                                local v1470 = l_Main_5.AbsoluteSize.X / 2;
                                local l_X_2 = v1468.AbsolutePosition.X;
                                local v1472 = l_X_1 + v1470;
                                local v1473 = l_X_2 + v1468.AbsoluteSize.X;
                                if l_X_2 < v1472 and v1472 < v1473 then
                                    return true;
                                else
                                    return false;
                                end;
                            end;
                            local l_X_3 = l_Main_5.AbsolutePosition.X;
                            local v1476 = l_Main_5.AbsoluteSize.X / 2;
                            local l_X_4 = l_Perfect_0.AbsolutePosition.X;
                            local v1478 = l_X_3 + v1476;
                            local v1479 = l_X_4 + l_Perfect_0.AbsoluteSize.X;
                            local v1480 = l_X_4 < v1478 and v1478 < v1479;
                            if not v1460 then
                                v1476 = l_Main_5.AbsolutePosition.X;
                                l_X_4 = l_Main_5.AbsoluteSize.X / 2;
                                v1478 = l_Window_0.AbsolutePosition.X;
                                v1479 = v1476 + l_X_4;
                                local v1481 = v1478 + l_Window_0.AbsoluteSize.X;
                                l_X_3 = v1478 < v1479 and v1479 < v1481;
                                v1461 = l_X_3;
                            end;
                            if not v1461 then
                                l_X_3 = false;
                            end;
                            v1461 = false;
                            if not v1460 then
                                if v1480 then
                                    l_X_3 = true;
                                    v1480 = false;
                                elseif l_X_3 then
                                    v1480 = true;
                                end;
                            end;
                            v1476 = function() --[[ Line: 7245 ]] --[[ Name: BufferCheck ]]
                                -- upvalues: v1434 (ref), l_LocalPlayer_0 (ref)
                                return v1434.CanPunch.Value and not v1434.Dashing.Value and not l_LocalPlayer_0.Character:GetAttribute("SlowMo");
                            end;
                            if not (v1434.CanPunch.Value and not v1434.Dashing.Value and not l_LocalPlayer_0.Character:GetAttribute("SlowMo")) then
                                l_X_4 = tick();
                                repeat
                                    task.wait(0.03333333333333333);
                                until v1434.CanPunch.Value and not v1434.Dashing.Value and not l_LocalPlayer_0.Character:GetAttribute("SlowMo") or tick() - l_X_4 > 4;
                            end;
                            task.spawn(function() --[[ Line: 7256 ]]
                                -- upvalues: v33 (ref), l_LocalPlayer_0 (ref), v1480 (ref), l_X_3 (ref)
                                v33.ReplicateQuickReload({
                                    nil, 
                                    l_LocalPlayer_0.Character, 
                                    v1480 and "Perfect" or l_X_3 and "Normal" or "Fail"
                                });
                            end);
                            task.wait(0.3);
                            if v1438 then
                                l_X_4 = l_Main_4.Size;
                                l_TweenService_0:Create(l_Main_4, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                    Size = UDim2.new(0, 0, 0, 0), 
                                    Rotation = -6
                                }):Play();
                                for _, v1483 in l_FirstChild_26:GetDescendants() do
                                    if v1483:IsA("UIStroke") then
                                        l_TweenService_0:Create(v1483, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                            Thickness = 0
                                        }):Play();
                                    end;
                                end;
                            else
                                l_X_4 = l_Main_4.Position;
                                l_TweenService_0:Create(l_Main_4, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                    Position = UDim2.new(l_X_4.X.Scale, 0, l_X_4.Y.Scale + 8, 0), 
                                    Rotation = 15
                                }):Play();
                            end;
                            l_TweenService_0:Create(l_Main_4.Shine, v1464, {
                                BackgroundTransparency = 0
                            }):Play();
                            task.wait(2);
                            l_FirstChild_26:Destroy();
                            return;
                        end;
                    end;
                    v1452[1] = l_UseSpecial_0.Event:Connect(function(v1485) --[[ Line: 7286 ]]
                        -- upvalues: v1484 (copy)
                        if v1485.PushDirection == "Up" then
                            return;
                        else
                            v1484();
                            return;
                        end;
                    end);
                    v1452[2] = l_UserInputService_1.InputBegan:Connect(function(v1486, _) --[[ Line: 7291 ]]
                        -- upvalues: l_Keybinds_0 (copy), v1484 (copy)
                        local _ = v1486.UserInputType;
                        local l_KeyCode_0 = v1486.KeyCode;
                        local v1490 = true;
                        if l_KeyCode_0 ~= l_Keybinds_0.GetKeybind("Special") then
                            v1490 = l_KeyCode_0 == l_Keybinds_0.GetGamepadBind("Special");
                        end;
                        if not v1490 then
                            return;
                        else
                            v1484();
                            return;
                        end;
                    end);
                    task.delay(4, function() --[[ Line: 7307 ]]
                        -- upvalues: v1459 (copy)
                        v1459();
                    end);
                    v1452[3] = v1433.Stunned.Changed:Connect(function(_) --[[ Line: 7311 ]]
                        -- upvalues: v1433 (copy), v1460 (copy), l_LocalPlayer_0 (ref), v1459 (copy)
                        task.wait();
                        if not v1433.Stunned.Value then
                            return;
                        else
                            if not v1460 then
                                task.wait(0.2);
                                if l_LocalPlayer_0.Character:GetAttribute("PerfectDodged") then
                                    return;
                                end;
                            end;
                            v1459();
                            return;
                        end;
                    end);
                    return;
                end;
            end;
        end;
    end;
end;
v33.AsuraCharacters = function(v1492) --[[ Line: 7330 ]] --[[ Name: AsuraCharacters ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_AnimHelper_0 (copy), l_ReplicatedStorage_0 (copy), l_Workspace_1 (copy), l_TweenService_0 (copy), v33 (copy), l_NumberSequenceTween_0 (copy), l_Styles_0 (copy)
    local v1493 = v1492[2];
    local v1494 = v1492[3];
    local v1495 = v1492[4];
    local _ = v1492[5];
    local v1497 = v1492[6];
    local v1498 = v1492[7];
    local v1499 = GetCharacterData(v1493);
    local v1500 = GetOccupied(v1493);
    local l_Humanoid_14 = v1493:FindFirstChild("Humanoid");
    local v1502 = {
        Priority = Enum.AnimationPriority.Action2, 
        Animator = l_Humanoid_14:FindFirstChild("Animator"), 
        AnimId = v1495 and 110060990068346 or 116088329993664, 
        NameFade = 0.05, 
        FadeIn = 0.1, 
        Weight = 1000, 
        Name = "Server", 
        Speed = 1
    };
    if v1493 == l_LocalPlayer_0.Character then
        v1502.Priority = Enum.AnimationPriority.Action;
    end;
    local _ = l_AnimHelper_0:CreateAnim(v1502);
    v1493.Archivable = true;
    local v1504 = v1493:Clone();
    v1493.Archivable = false;
    for _, v1506 in v1504:GetDescendants() do
        if v1506:IsA("BaseScript") or v1506:IsA("ParticleEmitter") or v1506:IsA("ForceField") or v1506:IsA("BillboardGui") or v1506:IsA("AlignPosition") then
            v1506:Destroy();
        end;
        if v1506:GetAttribute("GlovePart") then
            v1506:Destroy();
        end;
        if v1506:IsA("BasePart") then
            v1506.CollisionGroup = "None";
            v1506.CanCollide = false;
            v1506.Anchored = false;
            v1506.CanQuery = false;
            v1506.CanTouch = false;
        end;
        if v1506:IsA("MeshPart") then

        end;
        if v1506:IsA("SpecialMesh") then

        end;
    end;
    local v1507 = workspace.States:WaitForChild(v1493.Name, 10):WaitForChild("PlayerData", 10);
    l_ReplicatedStorage_0.Events.EquipGloves:Fire(v1504, v1507.Gloves.Value);
    for _, v1509 in v1504:GetDescendants() do
        if v1509:IsA("BasePart") then

        end;
    end;
    v1504.Humanoid.EvaluateStateMachine = false;
    local v1510 = v1504:Clone();
    v1504.Parent = workspace.Debris;
    v1510.Parent = workspace.Debris;
    local v1511 = {
        AnimId = 110060990068346, 
        FadeIn = 0.05, 
        AnimSpeed = v1498 and 0.1 or 1, 
        Priority = Enum.AnimationPriority.Action2, 
        Animator = v1504.Humanoid, 
        Weight = 1000, 
        Name = "Server", 
        NameFade = 0.01, 
        Looped = true
    };
    local l_l_AnimHelper_0_Anim_8 = l_AnimHelper_0:CreateAnim(v1511);
    v1511.AnimId = 116088329993664;
    v1511.Animator = v1510.Humanoid;
    local l_l_AnimHelper_0_Anim_9 = l_AnimHelper_0:CreateAnim(v1511);
    local l_Weld_2 = Instance.new("Weld");
    l_Weld_2.Parent = v1504.PrimaryPart;
    l_Weld_2.Part0 = v1504.PrimaryPart;
    local l_Weld_3 = Instance.new("Weld");
    l_Weld_3.Parent = v1510.PrimaryPart;
    l_Weld_3.Part0 = v1510.PrimaryPart;
    local v1516 = l_LocalPlayer_0.Character == v1493;
    local v1517 = v1493.PrimaryPart:Clone();
    v1517:ClearAllChildren();
    v1517.Anchored = false;
    v1517.Massless = true;
    v1517.CanCollide = false;
    v1517.CanTouch = false;
    v1517.CanQuery = false;
    v1517.Parent = l_Workspace_1.Debris;
    v1517.CollisionGroup = "None";
    v1517.CFrame = v1493.PrimaryPart.CFrame;
    local l_WeldConstraint_0 = Instance.new("WeldConstraint");
    l_WeldConstraint_0.Parent = v1517;
    l_WeldConstraint_0.Part1 = v1517;
    l_WeldConstraint_0.Part0 = v1493.PrimaryPart;
    v1517.CFrame = v1493.PrimaryPart.CFrame;
    l_Weld_2.Part1 = v1517;
    l_Weld_3.Part1 = v1517;
    if v1498 then
        v1517.Anchored = true;
        if l_WeldConstraint_0 then
            l_WeldConstraint_0:Destroy();
        end;
        v1517.CFrame = v1493.PrimaryPart.CFrame;
        v1517.CFrame = v1517.CFrame * CFrame.Angles(0, 0.5235987755982988, 0);
        l_Weld_2.C0 = l_Weld_2.C0 * (CFrame.new(-1, 0, 1) * CFrame.Angles(0.2617993877991494, 0.5235987755982988, 0));
        l_Weld_3.C0 = l_Weld_3.C0 * (CFrame.new(1, 0, 1) * CFrame.Angles(0.2617993877991494, -0.5235987755982988, 0));
    elseif v1516 then
        l_Weld_2.C0 = l_Weld_2.C0 * (CFrame.new(-0.15, 0, 1) * CFrame.Angles(0.2617993877991494, 0.5235987755982988, 0));
        l_Weld_3.C0 = l_Weld_3.C0 * (CFrame.new(0.5, 0, 1) * CFrame.Angles(0.2617993877991494, -0.5235987755982988, 0));
    else
        l_Weld_2.C0 = l_Weld_2.C0 * (CFrame.new(-0.1, 0, 1.2) * CFrame.Angles(0.2617993877991494, 0.5235987755982988, 0));
        l_Weld_3.C0 = l_Weld_3.C0 * (CFrame.new(0.1, 0, 1.2) * CFrame.Angles(0.2617993877991494, -0.5235987755982988, 0));
    end;
    for _, v1520 in v1504:GetDescendants() do
        if v1520:IsA("BasePart") and string.match(v1520.Name, "Left") then
            v1520.Transparency = 1;
        end;
    end;
    for _, v1522 in v1510:GetDescendants() do
        if v1522:IsA("BasePart") and string.match(v1522.Name, "Right") then
            v1522.Transparency = 1;
        end;
    end;
    local l_v1504_Descendants_0 = v1504:GetDescendants();
    for _, v1525 in v1510:GetDescendants() do
        if v1525:IsA("BasePart") or v1525:IsA("Decal") then
            table.insert(l_v1504_Descendants_0, v1525);
        end;
    end;
    for _, v1527 in l_v1504_Descendants_0 do
        if v1527:IsA("BasePart") then
            v1527.LocalTransparencyModifier = 1;
            v1527.Massless = true;
        end;
    end;
    local v1528 = false;
    task.delay(0.18333333333333332, function() --[[ Line: 7501 ]]
        -- upvalues: l_v1504_Descendants_0 (copy), l_TweenService_0 (ref), v1498 (copy), l_l_AnimHelper_0_Anim_8 (copy), l_l_AnimHelper_0_Anim_9 (copy), v1528 (ref), v1504 (copy), v1510 (copy), v1517 (copy)
        local v1529 = TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
        for _, v1531 in l_v1504_Descendants_0 do
            if v1531:IsA("BasePart") or v1531:IsA("Decal") then
                l_TweenService_0:Create(v1531, v1529, {
                    LocalTransparencyModifier = 0.2
                }):Play();
            end;
        end;
        task.wait(v1498 and 0.16666666666666666 or 0.5);
        local v1532 = TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
        l_l_AnimHelper_0_Anim_8:AdjustSpeed(v1498 and 0.1 or 0.5);
        l_l_AnimHelper_0_Anim_9:AdjustSpeed(v1498 and 0.1 or 0.5);
        for _, v1534 in l_v1504_Descendants_0 do
            if v1534:IsA("BasePart") or v1534:IsA("Decal") then
                l_TweenService_0:Create(v1534, v1532, {
                    LocalTransparencyModifier = 1
                }):Play();
            end;
        end;
        task.wait(5);
        v1528 = true;
        v1504:Destroy();
        v1510:Destroy();
        if v1517 then
            v1517:Destroy();
        end;
    end);
    local l_SwitchHitAura_0 = script.SwitchHitAura;
    local v1536 = {};
    for _, v1538 in {
        v1493, 
        v1504, 
        v1510
    } do
        for _, v1540 in v1538:GetChildren() do
            if v1540:IsA("BasePart") and v1540.Transparency ~= 1 then
                for _, v1542 in l_SwitchHitAura_0:GetChildren() do
                    if v1542:IsA("ParticleEmitter") then
                        local v1543 = v1542:Clone();
                        if v1538 == v1493 then
                            v1543.Enabled = true;
                            v1542.TimeScale = 1;
                        else
                            v1543.Enabled = false;
                            v1542.TimeScale = 1;
                        end;
                        v1543.Parent = v1540;
                        v1543:Emit(2);
                        table.insert(v1536, v1543);
                    end;
                end;
            end;
        end;
    end;
    if not v1498 then
        task.wait(0.08333333333333333);
    end;
    for _, v1545 in script.SwitchHitStart:GetChildren() do
        local v1546 = v1545:Clone();
        v1546.Parent = v33.GetWeldCharacter(v1493).PrimaryPart;
        for _, v1548 in v1546:GetChildren() do
            v1548.TimeScale = v1548.TimeScale * 0.85;
            if v1498 then
                v1548.TimeScale = v1548.TimeScale * 0.45;
            end;
            v1548:Emit(v1548:GetAttribute("EmitCount"));
        end;
        task.delay(5, function() --[[ Line: 7577 ]]
            -- upvalues: v1546 (copy)
            v1546:Destroy();
        end);
    end;
    local v1549 = script.SwitchHitBeam:Clone();
    v1549.Parent = workspace.Debris;
    local l_Weld_4 = Instance.new("Weld");
    l_Weld_4.Parent = v1549;
    l_Weld_4.Part0 = v1549;
    l_Weld_4.Part1 = v1493.PrimaryPart;
    task.delay(0.5, function() --[[ Line: 7590 ]]
        -- upvalues: v1549 (copy), l_NumberSequenceTween_0 (ref), v1536 (copy)
        for _, v1552 in v1549:GetDescendants() do
            if v1552:IsA("Beam") then
                l_NumberSequenceTween_0.Tween(v1552, 20, 1);
            end;
        end;
        task.wait(2);
        for _, v1554 in v1536 do
            v1554.Enabled = false;
        end;
        task.wait(2);
        v1549:Destroy();
        task.wait(5);
        for _, v1556 in v1536 do
            v1556:Destroy();
        end;
    end);
    local v1557 = {};
    local v1558 = TweenInfo.new(0.16666666666666666, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
    local function v1563() --[[ Line: 7613 ]] --[[ Name: CharacterReset ]]
        -- upvalues: v1557 (copy), v1528 (ref), l_v1504_Descendants_0 (copy), l_TweenService_0 (ref), v1558 (ref)
        for _, v1560 in v1557 do
            v1560:Disconnect();
        end;
        if v1528 then
            return;
        else
            for _, v1562 in l_v1504_Descendants_0 do
                if v1562:IsA("BasePart") or v1562:IsA("Decal") then
                    if v1562.Name == "Head" then
                        l_TweenService_0:Create(v1562, v1558, {
                            LocalTransparencyModifier = 1
                        }):Play();
                    else
                        l_TweenService_0:Create(v1562, TweenInfo.new(0.11666666666666667, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            LocalTransparencyModifier = 1
                        }):Play();
                    end;
                end;
            end;
            return;
        end;
    end;
    v1557[1] = v1499.Dashing.Changed:Connect(function(v1564) --[[ Line: 7631 ]]
        -- upvalues: v1563 (copy)
        if not v1564 then
            return;
        else
            v1563();
            return;
        end;
    end);
    v1557[2] = v1500.Dashing.Changed:Connect(function(v1565) --[[ Line: 7636 ]]
        -- upvalues: v1563 (copy)
        if not v1565 then
            return;
        else
            v1563();
            return;
        end;
    end);
    v1557[3] = v1500.Punching.Changed:Connect(function(v1566) --[[ Line: 7641 ]]
        -- upvalues: v1558 (ref), v1563 (copy)
        if not v1566 then
            return;
        else
            v1558 = TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            v1563();
            return;
        end;
    end);
    local l_Value_6 = v1499.Health.Value;
    v1557[4] = v1499.Health.Changed:Connect(function(v1568) --[[ Line: 7649 ]]
        -- upvalues: l_Value_6 (copy), v1558 (ref), v1563 (copy)
        if l_Value_6 <= v1568 then
            return;
        else
            v1558 = TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            v1563();
            return;
        end;
    end);
    if v1497 then
        local v1569 = l_Styles_0[GetPlayerData(v1494).Style.Value];
        if not v1569 then
            return;
        else
            local l_StaminaBreakAnimId_1 = v1569.CoreInfo.StaminaBreakAnimId;
            local l_Humanoid_15 = v1494:FindFirstChild("Humanoid");
            local _ = l_Humanoid_15:FindFirstChild("Animator") or l_Humanoid_15;
            local v1573 = {
                Priority = Enum.AnimationPriority.Action3, 
                Animator = l_Humanoid_15, 
                AnimId = l_StaminaBreakAnimId_1, 
                NameFade = 0.001, 
                FadeIn = 0.15, 
                Weight = 0.5, 
                Name = "Remove", 
                Speed = 0.8, 
                StopInfo = {
                    StopDelay = 0.3, 
                    StopTime = 0.3
                }
            };
            l_AnimHelper_0:CreateAnim(v1573):AdjustWeight(0.5, 0.05);
        end;
    end;
end;
v33.Asura = function(v1574) --[[ Line: 7689 ]] --[[ Name: Asura ]]
    -- upvalues: v33 (copy), l_LocalPlayer_0 (copy), l_Lighting_0 (copy), l_AlignHelper_0 (copy), l_Workspace_1 (copy), l_SoundHelper_0 (copy), l_RunService_0 (copy), l_Main_0 (copy), l_TweenService_0 (copy)
    local v1575 = v1574[2];
    local v1576 = v1574[3];
    local _ = v1574[4];
    local v1578 = v1574[5];
    local v1579 = v1574[6];
    local v1580 = GetCharacterData(v1575);
    local v1581 = GetOccupied(v1575);
    local v1582 = GetOccupied(v1576);
    v1580.CanWalk.Value = false;
    task.delay(0.9, function() --[[ Line: 7703 ]]
        -- upvalues: v1580 (copy)
        v1580.CanWalk.Value = true;
    end);
    v1575:SetAttribute("NoDash", true);
    v1581.CanPunch.Value = false;
    task.delay(0.5, function() --[[ Line: 7710 ]]
        -- upvalues: v1575 (copy), v1581 (copy)
        v1575:SetAttribute("NoDash", nil);
        v1581.CanPunch.Value = true;
    end);
    local l_Value_7 = v1580.Health.Value;
    v33.AsuraCharacters(v1574);
    if l_LocalPlayer_0.Character ~= v1575 and l_LocalPlayer_0.Character ~= v1576 then
        return;
    else
        task.defer(function() --[[ Line: 7723 ]]
            -- upvalues: v33 (ref)
            v33.CreateImpactFrame({
                Time = 0.08333333333333333
            });
        end);
        l_Lighting_0.ColorCorrection.Enabled = false;
        local v1584 = {
            KeepPos = true, 
            SetPosition = l_LocalPlayer_0.Character.PrimaryPart.Position, 
            Responsiveness = 0, 
            Velocity = 0, 
            MaxTime = 0, 
            IgnoreStun = true, 
            Priority = 3
        };
        task.defer(function() --[[ Line: 7742 ]]
            -- upvalues: l_AlignHelper_0 (ref), v1584 (copy)
            l_AlignHelper_0:MoveAlignPosition(v1584);
        end);
        task.delay(0.5, function() --[[ Line: 7746 ]]
            -- upvalues: l_AlignHelper_0 (ref)
            l_AlignHelper_0:SetPriority(1);
        end);
        local _ = l_Workspace_1.CurrentCamera;
        task.spawn(function() --[[ Line: 7752 ]]
            -- upvalues: v33 (ref)
            v33.CameraShake({
                Preset = "SuperHardHit", 
                WaitTime = 0.25, 
                Fade = 0.6, 
                FoV = 58, 
                FoVMult = 1, 
                Priority = 2
            });
        end);
        local v1586 = l_LocalPlayer_0.Character == v1575;
        local _ = l_SoundHelper_0:PlaySound({
            Name = "AsuraBurst", 
            Parent = v1586 and l_Workspace_1.Debris or v1575.PrimaryPart
        });
        if v1579 then
            return;
        else
            local v1588 = l_SoundHelper_0:PlaySound({
                Name = "AsuraStatic", 
                Parent = v1586 and l_Workspace_1.Debris or v1575.PrimaryPart, 
                Looped = true
            });
            local l_Volume_1 = v1588.Volume;
            local v1590 = script.StaticGui:Clone();
            v1590.Parent = l_LocalPlayer_0.PlayerGui;
            local l_PerlinNoise_0 = v1590.VideoTape.PerlinNoise;
            local l_TapeLines_0 = v1590.VideoTape.TapeLines;
            local l_ColorCorrectionEffect_4 = Instance.new("ColorCorrectionEffect");
            l_ColorCorrectionEffect_4.Brightness = 0;
            l_ColorCorrectionEffect_4.Contrast = 0;
            l_ColorCorrectionEffect_4.Saturation = 0;
            l_ColorCorrectionEffect_4.Parent = l_Lighting_0;
            local v1594 = "CoverScreen" .. tostring(math.random(1, 1000));
            local l_UserInputService_2 = game:GetService("UserInputService");
            if l_UserInputService_2.TouchEnabled then
                local _ = not (l_UserInputService_2.MouseEnabled or l_UserInputService_2.KeyboardEnabled);
            end;
            l_RunService_0:BindToRenderStep("CoverScreen", Enum.RenderPriority.Camera.Value + 25, function(_) --[[ Line: 7804 ]]
                -- upvalues: l_PerlinNoise_0 (copy), l_TapeLines_0 (copy)
                l_PerlinNoise_0.Position = UDim2.new(0.5, math.random(-250, 250), 0.5, math.random(-250, 250));
                local v1598 = tick() * 80 % 250;
                l_TapeLines_0.Position = UDim2.new(l_TapeLines_0.Position.X.Scale, 0, l_TapeLines_0.Position.Y.Scale, v1598);
            end);
            local v1599 = false;
            local v1600 = {};
            if v1582 then
                v1582.ReverseInputs.Value = true;
            end;
            task.spawn(function() --[[ Line: 7819 ]]
                -- upvalues: l_LocalPlayer_0 (ref), v1575 (copy), v33 (ref), l_Main_0 (ref)
                local v1601 = l_LocalPlayer_0.Character == v1575;
                v33.StatusFrame(v1601, l_Main_0.StatusFrame.ReversedInputsFrame, {
                    HoldTime = 3.5
                });
            end);
            local function v1609() --[[ Line: 7824 ]] --[[ Name: Reset ]]
                -- upvalues: v1599 (ref), v1600 (copy), v1582 (copy), l_LocalPlayer_0 (ref), v1575 (copy), v33 (ref), l_Main_0 (ref), l_SoundHelper_0 (ref), v1586 (copy), l_Workspace_1 (ref), v1590 (copy), l_TweenService_0 (ref), l_ColorCorrectionEffect_4 (copy), v1588 (copy), l_RunService_0 (ref), v1594 (copy)
                if v1599 then
                    return;
                else
                    v1599 = true;
                    for _, v1603 in v1600 do
                        v1603:Disconnect();
                    end;
                    if v1582 then
                        v1582.ReverseInputs.Value = false;
                    end;
                    task.spawn(function() --[[ Line: 7834 ]]
                        -- upvalues: l_LocalPlayer_0 (ref), v1575 (ref), v33 (ref), l_Main_0 (ref)
                        local v1604 = l_LocalPlayer_0.Character == v1575;
                        v33.StatusFrame(v1604, l_Main_0.StatusFrame.InputsRestoredFrame, {
                            HoldTime = 3.5
                        });
                    end);
                    task.spawn(function() --[[ Line: 7839 ]]
                        -- upvalues: v33 (ref)
                        v33.CameraShake({
                            Preset = "SuperHardHit", 
                            WaitTime = 0.2, 
                            Fade = 0.7, 
                            FoV = 60, 
                            FoVMult = 1, 
                            Priority = 2
                        });
                    end);
                    l_SoundHelper_0:PlaySound({
                        Name = "AsuraEnded", 
                        Parent = v1586 and l_Workspace_1.Debris or v1575.PrimaryPart
                    });
                    local v1605 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                    for _, v1607 in v1590:GetDescendants() do
                        if v1607:IsA("ImageLabel") then
                            l_TweenService_0:Create(v1607, v1605, {
                                ImageTransparency = 1
                            }):Play();
                        end;
                    end;
                    task.spawn(function() --[[ Line: 7864 ]]
                        -- upvalues: v1586 (ref), l_TweenService_0 (ref), l_ColorCorrectionEffect_4 (ref)
                        local v1608 = {
                            Brightness = 0, 
                            Contrast = 0.5, 
                            Saturation = -0.7
                        };
                        if v1586 then
                            v1608 = {
                                Brightness = 0, 
                                Contrast = 1, 
                                Saturation = -1
                            };
                        end;
                        l_TweenService_0:Create(l_ColorCorrectionEffect_4, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v1608):Play();
                        task.wait(0.2);
                        l_TweenService_0:Create(l_ColorCorrectionEffect_4, TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            Contrast = 0, 
                            Saturation = 0
                        }):Play();
                    end);
                    l_TweenService_0:Create(v1588, TweenInfo.new(7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Volume = 0
                    }):Play();
                    task.wait(5);
                    l_RunService_0:UnbindFromRenderStep(v1594);
                    l_ColorCorrectionEffect_4:Destroy();
                    v1590:Destroy();
                    task.wait(5);
                    if v1588 then
                        v1588:Destroy();
                    end;
                    return;
                end;
            end;
            v1600[1] = v1575:GetAttributeChangedSignal("StartedStatic"):Connect(function() --[[ Line: 7901 ]]
                -- upvalues: v1609 (copy)
                v1609();
            end);
            v1600[2] = v1575.AncestryChanged:Connect(function() --[[ Line: 7905 ]]
                -- upvalues: v1609 (copy)
                v1609();
            end);
            v1600[3] = v1580.Cutscene.Changed:Connect(function() --[[ Line: 7909 ]]
                -- upvalues: v1609 (copy)
                v1609();
            end);
            if v1576 then
                v1600[4] = v1576.AncestryChanged:Connect(function() --[[ Line: 7914 ]]
                    -- upvalues: v1609 (copy)
                    v1609();
                end);
            end;
            local v1610 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
            local v1611 = l_Value_7 - v1578;
            local v1612 = {
                Brightness = -0.05, 
                Contrast = 0.3, 
                Saturation = -0.25
            };
            local v1613 = {
                Brightness = 0, 
                Contrast = 0.1, 
                Saturation = -0.05
            };
            l_TweenService_0:Create(l_ColorCorrectionEffect_4, v1610, v1612):Play();
            local v1614 = {};
            for _, v1616 in v1590:GetDescendants() do
                if v1616:IsA("ImageLabel") then
                    v1614[v1616] = v1616.ImageTransparency;
                    v1616.ImageTransparency = 1;
                    local v1617 = v1614[v1616];
                    local v1618 = v1617 + (1 - v1617) * -0.2;
                    l_TweenService_0:Create(v1616, v1610, {
                        ImageTransparency = v1618
                    }):Play();
                end;
            end;
            local v1619 = 0;
            v1600[5] = v1580.Health.Changed:Connect(function(v1620) --[[ Line: 7953 ]]
                -- upvalues: v1619 (ref), v1611 (copy), v1578 (copy), v1575 (copy), l_LocalPlayer_0 (ref), v1590 (copy), l_ColorCorrectionEffect_4 (copy), l_TweenService_0 (ref), v1612 (copy), v1613 (copy), v1614 (copy), v1588 (copy), l_Volume_1 (copy)
                local v1621 = tick();
                if v1621 - v1619 < 0.15 then
                    return;
                else
                    v1619 = v1621;
                    local v1622 = (1 - math.clamp((v1620 - v1611) / v1578, 0, 1)) * 0.8;
                    local v1623 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                    if v1575 == l_LocalPlayer_0.Character then
                        if v1575:GetAttribute("InStatic") then
                            v1590.Enabled = false;
                            l_ColorCorrectionEffect_4.Enabled = false;
                        else
                            v1590.Enabled = true;
                            l_ColorCorrectionEffect_4.Enabled = true;
                        end;
                    end;
                    local l_l_TweenService_0_0 = l_TweenService_0;
                    local l_l_ColorCorrectionEffect_4_0 = l_ColorCorrectionEffect_4;
                    local l_v1623_0 = v1623;
                    local v1627 = {};
                    local l_Brightness_0 = v1612.Brightness;
                    v1627.Brightness = l_Brightness_0 + (v1613.Brightness - l_Brightness_0) * v1622;
                    l_Brightness_0 = v1612.Contrast;
                    v1627.Contrast = l_Brightness_0 + (v1613.Contrast - l_Brightness_0) * v1622;
                    l_Brightness_0 = v1612.Saturation;
                    v1627.Saturation = l_Brightness_0 + (v1613.Saturation - l_Brightness_0) * v1622;
                    l_l_TweenService_0_0:Create(l_l_ColorCorrectionEffect_4_0, l_v1623_0, v1627):Play();
                    for _, v1630 in v1590:GetDescendants() do
                        if v1630:IsA("ImageLabel") then
                            l_Brightness_0 = v1614[v1630];
                            local v1631 = -0.2 + 0.6000000000000001 * v1622;
                            local v1632 = l_Brightness_0 + (1 - l_Brightness_0) * v1631;
                            l_TweenService_0:Create(v1630, v1623, {
                                ImageTransparency = v1632
                            }):Play();
                        end;
                    end;
                    l_l_TweenService_0_0 = v1588;
                    l_l_ColorCorrectionEffect_4_0 = l_Volume_1;
                    l_l_TweenService_0_0.Volume = l_l_ColorCorrectionEffect_4_0 + (l_Volume_1 / 2 - l_l_ColorCorrectionEffect_4_0) * v1622;
                    return;
                end;
            end);
            return;
        end;
    end;
end;
v33.AppearanceSmoke = function(v1633) --[[ Line: 7991 ]] --[[ Name: AppearanceSmoke ]]
    -- upvalues: l_SoundHelper_0 (copy), v33 (copy)
    local v1634 = v1633[2];
    local v1635 = {};
    l_SoundHelper_0:PlaySound({
        Name = "CatalogPoof", 
        Parent = v1634.PrimaryPart
    });
    for _, v1637 in v1634:GetChildren() do
        if v1637:IsA("BasePart") then
            local v1638 = script.AppearanceSmoke.Smoke:Clone();
            v1638.Parent = v1637;
            v1638:Emit(2);
            table.insert(v1635, v1638);
            local v1639 = script.AppearanceSmoke.Smoke2:Clone();
            v1639.Parent = v1637;
            v1639:Emit(1);
            table.insert(v1635, v1639);
        end;
    end;
    local v1640 = GetCharacterData(v1634);
    local v1641 = nil;
    if v1640.Opponent.Value then
        v1641 = script.AppearanceBigSmoke.Attachment:Clone();
        v1641.Parent = v33.GetWeldCharacter(v1634).UpperTorso;
        for _, v1643 in v1641:GetDescendants() do
            if v1643:IsA("ParticleEmitter") then
                v1643.Enabled = false;
                v1643:Emit(v1643.Rate);
            end;
        end;
    end;
    task.delay(15, function() --[[ Line: 8029 ]]
        -- upvalues: v1635 (copy), v1641 (ref)
        for _, v1645 in v1635 do
            v1645:Destroy();
        end;
        task.wait(1);
        if v1641 then
            v1641:Destroy();
        end;
    end);
end;
local v1646 = l_Events_0 and l_Events_0:FindFirstChild("BasicMessage");
v33.MatchFound = function(_) --[[ Line: 8041 ]] --[[ Name: MatchFound ]]
    -- upvalues: l_Players_0 (copy), v1646 (copy)
    task.wait(0.2);
    if l_Players_0.LocalPlayer:GetAttribute("InRanked") then
        return;
    else
        v1646:Fire({
            Message = "Match found! Waiting for your opponent to load in...", 
            Color = Color3.fromRGB(255, 255, 255), 
            Sound = "Achieved", 
            IsRainbow = false, 
            HoldTime = 7
        });
        return;
    end;
end;
v33.PrintMMR = function(v1648) --[[ Line: 8060 ]] --[[ Name: PrintMMR ]]
    -- upvalues: l_LocalPlayer_0 (copy), v1646 (copy)
    local v1649 = v1648[2];
    local v1650 = v1648[3];
    local v1651 = v1648[4];
    local v1652 = v1648[5];
    local v1653 = v1648[6];
    local v1654 = l_LocalPlayer_0.Name .. " (LP: " .. math.floor(v1649.LP) .. " | RANK: " .. "<font color=\"" .. v1648[7] .. "\">" .. v1650.Rank .. " " .. v1650.Stars .. "</font>" .. ")";
    if v1649.Winstreak > 0 then
        v1654 = v1654 .. "\n" .. "<font color=\"#ffb145\">" .. "WINSTREAK: " .. v1649.Winstreak .. "</font>" .. " \240\159\148\165";
    end;
    task.wait(1);
    v1646:Fire({
        Message = v1654, 
        Color = Color3.fromRGB(255, 255, 255), 
        Sound = "CatalogInteract", 
        IsRainbow = false, 
        HoldTime = 12, 
        UseRichText = true
    });
    v1646:Fire({
        Message = "\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148 VS \226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148\226\128\148", 
        Color = Color3.fromRGB(255, 255, 255), 
        Sound = "CatalogInteract", 
        IsRainbow = false, 
        HoldTime = 12, 
        UseRichText = true
    });
    local v1655 = v1653.Name .. " (LP: " .. math.floor(v1651.LP) .. " | RANK: " .. "<font color=\"" .. v1648[8] .. "\">" .. v1652.Rank .. " " .. v1652.Stars .. "</font>" .. ")";
    if v1651.Winstreak > 0 then
        v1655 = v1655 .. "\n" .. "<font color=\"#ffb145\">" .. "WINSTREAK: " .. v1651.Winstreak .. "</font>" .. " \240\159\148\165";
    end;
    v1646:Fire({
        Message = v1655, 
        Color = Color3.fromRGB(255, 255, 255), 
        Sound = "CatalogInteract", 
        IsRainbow = false, 
        HoldTime = 12, 
        UseRichText = true
    });
end;
local function _(v1656) --[[ Line: 8125 ]] --[[ Name: rgb255RichText ]]
    local v1657 = v1656.R * 255;
    local v1658 = v1656.G * 255;
    local v1659 = v1656.B * 255;
    return string.format("rgb(%d, %d, %d)", v1657, v1658, v1659);
end;
v33.PrintEndMMR = function(v1661) --[[ Line: 8133 ]] --[[ Name: PrintEndMMR ]]
    -- upvalues: l_SoundHelper_0 (copy), l_Workspace_1 (copy), v1646 (copy)
    local v1662 = v1661[2];
    local v1663 = v1661[3];
    local v1664 = v1661[4];
    local v1665 = v1661[5];
    local v1666 = v1661[6];
    local v1667 = "[NEW RATING] LP: " .. math.floor(v1662.LP);
    local v1668 = "RankTestDefeat";
    local v1669 = math.floor((math.abs(v1662.LP - v1664)));
    if v1664 <= v1662.LP then
        v1667 = v1667 .. " (<font color=\"#2be05b\">+" .. v1669 .. "</font>)";
        if v1669 > 0 then
            v1668 = "RankTestVictory";
        end;
    else
        v1667 = v1667 .. " (<font color=\"#e02b37\">-" .. v1669 .. "</font>)";
    end;
    if v1665 then
        v1668 = "RankTestVictory";
    end;
    v1667 = v1667 .. " | RANK: " .. "<font color=\"" .. v1666 .. "\">" .. v1663.Rank .. " (" .. v1663.Stars .. ")" .. "</font>";
    if v1662.Winstreak > 0 then
        v1667 = v1667 .. "\n" .. "<font color=\"#ffb145\">" .. "WINSTREAK: " .. v1662.Winstreak .. "</font>" .. " \240\159\148\165";
    end;
    l_SoundHelper_0:PlaySound({
        Name = v1668, 
        Parent = l_Workspace_1.Debris
    });
    v1646:Fire({
        Message = v1667, 
        Color = Color3.fromRGB(255, 255, 255), 
        Sound = "CatalogInteract", 
        IsRainbow = false, 
        HoldTime = 8, 
        UseRichText = true
    });
end;
v33.TheGamesFightTransition = function(v1670) --[[ Line: 8180 ]] --[[ Name: TheGamesFightTransition ]]
    -- upvalues: l_LocalPlayer_0 (copy), v33 (copy), l_Common_0 (copy), l_Main_0 (copy)
    local v1671 = {
        Target = v1670[2], 
        Character = v1670[3], 
        Subeffect = v1670[4]
    };
    local l_Character_25 = l_LocalPlayer_0.Character;
    v33.SetTransparency(l_Character_25, 1);
    local _ = TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
    local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
    l_Common_0.QuestNPC.Visible = false;
    task.delay(0.1, function() --[[ Line: 8195 ]]
        -- upvalues: l_Main_0 (ref)
        for _, v1676 in l_Main_0:GetChildren() do
            if v1676:IsA("Frame") and v1676.Name ~= "DownFrame" then
                v1676.Position = UDim2.new(0, 0, 5, 0);
            end;
        end;
    end);
    v33.Entrance({
        Character = v1671.Character, 
        Target = v1671.Target, 
        Subeffect = v1671.Subeffect, 
        IsInvolved = true, 
        IsEvent = true
    });
    for _, v1678 in l_Main_0:GetChildren() do
        if v1678:IsA("Frame") then
            v1678.Position = UDim2.new(0, 0, 0, 0);
        end;
    end;
    l_Common_0.QuestNPC.Visible = true;
    v33.SetTransparency(l_Character_25, 0);
    v33.SetTransparency(v1671.Character, 0);
end;
v33.DodgeTutorial = function(v1679) --[[ Line: 8222 ]] --[[ Name: DodgeTutorial ]]
    -- upvalues: l_Styles_0 (copy), l_AnimHelper_0 (copy), l_TweenService_0 (copy), l_LocalPlayer_0 (copy), v33 (copy), l_SoundHelper_0 (copy), l_Lighting_0 (copy), l_Workspace_1 (copy), l_Main_0 (copy)
    local v1680 = v1679[2];
    local l_Style_0 = GetPlayerData(v1680).Style;
    local l_Humanoid_16 = v1680.Humanoid;
    local _ = l_Styles_0[l_Style_0.Value];
    local l_HeavyAttacks_0 = l_Styles_0[l_Style_0.Value].HeavyAttacks;
    local v1685 = l_HeavyAttacks_0[1];
    local v1686 = l_HeavyAttacks_0.DefaultPunchInfo or l_Styles_0[l_Style_0.Value].DefaultPunchInfo;
    local function _(v1687) --[[ Line: 8235 ]] --[[ Name: GetPunchInfo ]]
        -- upvalues: v1685 (copy), v1686 (copy)
        return v1685[v1687] or v1686[v1687];
    end;
    local v1689 = v1685.AnimSpeed or v1686.AnimSpeed;
    local v1690 = {
        Priority = Enum.AnimationPriority.Action3, 
        Animator = l_Humanoid_16:FindFirstChild("Animator"), 
        AnimId = v1685.AnimId or v1686.AnimId, 
        NameFade = 0.05, 
        FadeIn = 0.1, 
        Weight = 1000, 
        Name = "Server", 
        AnimSpeed = v1689
    };
    local l_l_AnimHelper_0_Anim_10 = l_AnimHelper_0:CreateAnim(v1690);
    local v1692 = (v1685.Startup or v1686.Startup) - 0.06666666666666667;
    local v1693 = math.ceil(v1692) * 60;
    local v1694 = false;
    task.defer(function() --[[ Line: 8259 ]]
        -- upvalues: v1693 (copy), v1694 (ref), l_l_AnimHelper_0_Anim_10 (copy), l_TweenService_0 (ref)
        for v1695 = 0, v1693 do
            if v1694 then
                return;
            else
                l_l_AnimHelper_0_Anim_10:AdjustSpeed((math.lerp(1, 0.01, l_TweenService_0:GetValue(v1695 / v1693, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out))));
                task.wait(0.016666666666666666);
            end;
        end;
    end);
    local l_Character_26 = l_LocalPlayer_0.Character;
    local l_Humanoid_17 = l_Character_26:FindFirstChild("Humanoid");
    local l_PlayingAnimationTracks_0 = (l_Humanoid_17:FindFirstChild("Animator") or l_Humanoid_17):GetPlayingAnimationTracks();
    for _, v1700 in l_PlayingAnimationTracks_0 do
        v1700:SetAttribute("StartSpeed", v1700.Speed);
        task.defer(function() --[[ Line: 8277 ]]
            -- upvalues: v1693 (copy), v1694 (ref), v1700 (copy), l_TweenService_0 (ref)
            for v1701 = 0, v1693 do
                if v1694 then
                    return;
                else
                    v1700:AdjustSpeed((math.lerp(1, 0.01, l_TweenService_0:GetValue(v1701 / v1693, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out))));
                    task.wait(0.016666666666666666);
                end;
            end;
        end);
    end;
    local v1702 = v33.StartupHighlight({
        "Liberia", 
        v1680, 
        true, 
        false, 
        false, 
        1, 
        false, 
        true
    });
    l_SoundHelper_0:PlaySound({
        Name = "CoolForLater", 
        Parent = l_Character_26.PrimaryPart, 
        Speed = 1
    });
    local v1703 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local l_DepthOfField_1 = l_Lighting_0.DepthOfField;
    l_DepthOfField_1.FocusDistance = 90;
    l_TweenService_0:Create(l_DepthOfField_1, v1703, {
        FocusDistance = 0
    }):Play();
    l_Workspace_1.FoVMult.Value = 0.5;
    l_Workspace_1.CurrentCamera.FieldOfView = 55;
    local _ = l_Main_0.SlowMoFrame;
    local v1706 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
    l_TweenService_0:Create(l_Lighting_0, v1706, {
        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
    }):Play();
    local v1707 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local l_ColorCorrectionEffect_5 = Instance.new("ColorCorrectionEffect");
    l_ColorCorrectionEffect_5.Brightness = 0;
    l_ColorCorrectionEffect_5.Saturation = -0.8;
    l_ColorCorrectionEffect_5.Contrast = 0.6;
    l_ColorCorrectionEffect_5.TintColor = Color3.fromRGB(255, 255, 255);
    l_ColorCorrectionEffect_5.Name = "Remove";
    l_ColorCorrectionEffect_5.Enabled = true;
    l_ColorCorrectionEffect_5.Parent = l_Lighting_0;
    repeat
        task.wait();
        if v1692 < l_l_AnimHelper_0_Anim_10.TimePosition then
            l_l_AnimHelper_0_Anim_10.TimePosition = v1692;
        end;
    until l_Character_26:GetAttribute("DashInvulnerable");
    v1694 = true;
    l_TweenService_0:Create(l_Lighting_0, v1706, {
        ExposureCompensation = workspace.Exposure.Value
    }):Play();
    l_TweenService_0:Create(l_ColorCorrectionEffect_5, v1707, {
        Saturation = 0, 
        Contrast = 0
    }):Play();
    l_l_AnimHelper_0_Anim_10:AdjustSpeed(v1689);
    for _, v1710 in l_PlayingAnimationTracks_0 do
        v1710:AdjustSpeed(v1710:GetAttribute("StartSpeed"));
    end;
    local v1711 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    l_TweenService_0:Create(v1702, v1711, {
        OutlineTransparency = 1, 
        FillTransparency = 1
    }):Play();
    task.wait(0.5);
    v1702:Destroy();
    l_ColorCorrectionEffect_5:Destroy();
end;
v33.DramaticDialog = function(v1712) --[[ Line: 8363 ]] --[[ Name: DramaticDialog ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_SoundHelper_0 (copy), l_Workspace_1 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy)
    local v1713 = {
        Character = v1712[2], 
        Message = v1712[3], 
        Color = v1712[4], 
        HoldDuration = v1712[5], 
        EndDuration = v1712[6], 
        Pivot = v1712[7]
    };
    local v1714 = script.DramaticDialog:Clone();
    v1714.Parent = l_LocalPlayer_0.PlayerGui;
    l_SoundHelper_0:PlaySound({
        Name = "DialogCute", 
        Parent = l_Workspace_1.Debris
    });
    v1713.GUI = v1714;
    local v1715 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
    l_TweenService_0:Create(l_Lighting_0, v1715, {
        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.5
    }):Play();
    local v1716 = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
    local l_ColorCorrectionEffect_6 = Instance.new("ColorCorrectionEffect");
    l_ColorCorrectionEffect_6.Brightness = 0;
    l_ColorCorrectionEffect_6.Saturation = -0.6;
    l_ColorCorrectionEffect_6.Contrast = 0.5;
    l_ColorCorrectionEffect_6.TintColor = Color3.fromRGB(157, 157, 157);
    l_ColorCorrectionEffect_6.Name = "Remove";
    l_ColorCorrectionEffect_6.Enabled = true;
    l_ColorCorrectionEffect_6.Parent = l_Lighting_0;
    if workspace.FightCameraMode.Value ~= "ProCamera" then
        l_Workspace_1.FoVMult.Value = 0.5;
        if not v1712[8] then
            l_Workspace_1.CurrentCamera.FieldOfView = 60;
        end;
    end;
    require(v1714.ViewportFrame).Began(v1713);
    l_TweenService_0:Create(l_Lighting_0, v1715, {
        ExposureCompensation = workspace.Exposure.Value
    }):Play();
    l_TweenService_0:Create(l_ColorCorrectionEffect_6, v1716, {
        Saturation = 0, 
        Contrast = 0, 
        TintColor = Color3.fromRGB(255, 255, 255)
    }):Play();
    task.wait(5);
    if l_ColorCorrectionEffect_6 then
        l_ColorCorrectionEffect_6:Destroy();
    end;
    v1714:Destroy();
end;
TitleDrop = function(v1718, v1719) --[[ Line: 8416 ]] --[[ Name: TitleDrop ]]
    -- upvalues: l_Players_0 (copy), l_Modules_0 (copy), l_SoundHelper_0 (copy), l_Workspace_1 (copy), l_TweenService_0 (copy)
    task.spawn(function() --[[ Line: 8417 ]]
        -- upvalues: l_Players_0 (ref), v1718 (copy), v1719 (copy), l_Modules_0 (ref), l_SoundHelper_0 (ref), l_Workspace_1 (ref), l_TweenService_0 (ref)
        local l_Common_1 = l_Players_0.LocalPlayer.PlayerGui:FindFirstChild("Common");
        if not l_Common_1 then
            return;
        else
            local v1721 = script.VoidMoves.TitleFrame:Clone();
            v1721.Name = "TitleDrop";
            v1721.TitleCopy.Text = v1718;
            v1721.SubtitleCopy.Text = v1719;
            local l_UserInputService_3 = game:GetService("UserInputService");
            if not l_UserInputService_3.KeyboardEnabled and l_UserInputService_3.TouchEnabled then
                v1721.Size = UDim2.new(1.15, 0, 1.15, 0);
            end;
            v1721.Title.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v1721.TitleCopy.Text .. "</stroke>";
            v1721.Subtitle.Text = "<stroke color=\"#000000\" joins=\"miter\" thickness=\"2\">" .. v1721.SubtitleCopy.Text .. "</stroke>";
            v1721.Vignette.ImageTransparency = 1;
            v1721.Parent = l_Common_1;
            local l_EffectHelper_0 = require(l_Modules_0:WaitForChild("EffectHelper"));
            task.delay(0.05, function() --[[ Line: 8444 ]]
                -- upvalues: l_EffectHelper_0 (copy), v1721 (copy)
                l_EffectHelper_0.TripleText({
                    Image = v1721.SubtitleCopy, 
                    HoldTime = 0.16666666666666666, 
                    Amount = 2
                });
            end);
            task.spawn(function() --[[ Line: 8452 ]]
                -- upvalues: l_EffectHelper_0 (copy), v1721 (copy)
                l_EffectHelper_0.TripleText({
                    Image = v1721.TitleCopy, 
                    HoldTime = 0.6666666666666666, 
                    Amount = 2
                });
            end);
            if v1718 == "RYUJIN" then
                l_SoundHelper_0:PlaySound({
                    Name = "SFX", 
                    Parent = l_Workspace_1, 
                    DirectCopy = script.VoidMoves.Laugh
                });
            end;
            local v1724 = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
            local v1725 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            local v1726 = TweenInfo.new(1.3333333333333333, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            local v1727 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
            local v1728 = TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
            l_TweenService_0:Create(v1721.Vignette, v1724, {
                ImageTransparency = 0.1
            }):Play();
            local l_ColorCorrectionEffect_7 = Instance.new("ColorCorrectionEffect");
            l_ColorCorrectionEffect_7.Brightness = 0;
            l_ColorCorrectionEffect_7.Contrast = 0;
            l_ColorCorrectionEffect_7.Saturation = 0;
            l_ColorCorrectionEffect_7.Parent = game.Lighting;
            workspace.FoVMult.Value = 0.1;
            l_TweenService_0:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 55
            }):Play();
            l_TweenService_0:Create(l_ColorCorrectionEffect_7, v1728, {
                Brightness = 0, 
                Contrast = 0.4, 
                Saturation = -0.9
            }):Play();
            task.wait(0.2);
            v1721.Badge.Position = UDim2.new(0.5, 0, 0.4, 0);
            v1721.Badge.Size = UDim2.new(1, 0, 1, 0);
            v1721.Badge.Rotation = 41;
            local l_Exponential_0 = Enum.EasingStyle.Exponential;
            local l_Out_0 = Enum.EasingDirection.Out;
            task.spawn(function() --[[ Line: 8502 ]]
                -- upvalues: v1721 (copy), l_TweenService_0 (ref), l_Exponential_0 (copy), l_Out_0 (copy)
                for _ = 1, 10 do
                    local v1733 = v1721.Badge:Clone();
                    v1733.Parent = v1721;
                    v1733.Position = v1733.Position;
                    l_TweenService_0:Create(v1733, TweenInfo.new(0.5, l_Exponential_0, l_Out_0), {
                        ImageTransparency = 1
                    }):Play();
                    task.wait(0.1);
                end;
            end);
            l_TweenService_0:Create(v1721.Badge, TweenInfo.new(0.5), {
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0.2, 0, 0.2, 0), 
                Rotation = 0
            }):Play();
            task.wait(0.45);
            v1721.Shine.ImageTransparency = 0.4;
            l_TweenService_0:Create(v1721.Shine, TweenInfo.new(3), {
                Position = UDim2.new(0.15, 0, -0.13, 0), 
                Size = UDim2.new(0.7, 0, 0.7, 0), 
                Rotation = 0, 
                ImageTransparency = 1
            }):Play();
            l_TweenService_0:Create(v1721.Badge, TweenInfo.new(2), {
                Position = UDim2.new(0.3, 0, 0.2, 0), 
                Size = UDim2.new(0.35, 0, 0.35, 0), 
                Rotation = 0
            }):Play();
            task.wait(1.9);
            l_TweenService_0:Create(v1721.Badge, TweenInfo.new(0.5), {
                Position = UDim2.new(0.349, 0, 0.233, 0), 
                Size = UDim2.new(0.3, 0, 0.3, 0), 
                Rotation = 0
            }):Play();
            task.spawn(function() --[[ Line: 8546 ]]
                -- upvalues: v1721 (copy), l_TweenService_0 (ref), l_Exponential_0 (copy), l_Out_0 (copy)
                for _ = 1, 10 do
                    local v1735 = v1721.Badge:Clone();
                    v1735.Parent = v1721;
                    v1735.Position = v1735.Position;
                    l_TweenService_0:Create(v1735, TweenInfo.new(0.5, l_Exponential_0, l_Out_0), {
                        ImageTransparency = 1
                    }):Play();
                    task.wait(0.1);
                end;
            end);
            v1721.Title.Text = v1721.TitleCopy.Text;
            v1721.Subtitle.Text = v1721.SubtitleCopy.Text;
            l_TweenService_0:Create(v1721.Vignette, v1724, {
                ImageTransparency = 1
            }):Play();
            l_TweenService_0:Create(v1721.Title, v1725, {
                TextTransparency = 1
            }):Play();
            l_TweenService_0:Create(v1721.Subtitle, v1725, {
                TextTransparency = 1
            }):Play();
            l_TweenService_0:Create(v1721.Shine, v1725, {
                ImageTransparency = 1
            }):Play();
            l_TweenService_0:Create(v1721.Badge, v1725, {
                ImageTransparency = 1
            }):Play();
            l_TweenService_0:Create(v1721, v1726, {
                Size = UDim2.new(3, 0, 3, 0)
            }):Play();
            task.wait(1);
            v1721.Name = "Remove";
            l_TweenService_0:Create(l_ColorCorrectionEffect_7, v1727, {
                Brightness = 0, 
                Contrast = 0, 
                Saturation = 0
            }):Play();
            task.wait(3);
            v1721:Destroy();
            l_ColorCorrectionEffect_7:Destroy();
            return;
        end;
    end);
end;
v33.VoidSamuraiEquip = function(v1736) --[[ Line: 8586 ]] --[[ Name: VoidSamuraiEquip ]]
    -- upvalues: l_LocalPlayer_0 (copy), v33 (copy), l_Players_0 (copy), l_Modules_0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_Workspace_1 (copy)
    local v1737 = v1736[2];
    local l_v1737_Attribute_0 = v1737:GetAttribute("IsBasicSamurai");
    local v1739 = GetCharacterData(l_LocalPlayer_0.Character);
    if not v1739 then
        return;
    else
        game:GetService("ContentProvider"):PreloadAsync(require(script.VoidMoves.Slash.ModuleScript));
        local l_Humanoid_18 = v1737:FindFirstChild("Humanoid");
        local _ = l_Humanoid_18:FindFirstChild("Animator") or l_Humanoid_18;
        local v1742 = {
            Priority = Enum.AnimationPriority.Action3, 
            Animator = l_Humanoid_18:FindFirstChild("Animator"), 
            AnimId = 116940990778112, 
            NameFade = 0.05, 
            FadeIn = 0.1, 
            Weight = 1000, 
            Name = "Server", 
            AnimSpeed = 1
        };
        local v1743 = v1737:GetAttribute("ActiveNPC") and not l_v1737_Attribute_0;
        if v1737:GetAttribute("ActiveNPC") then
            v33.SetTransparency(l_LocalPlayer_0.Character, 1);
            local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
            local l_FirstChild_27 = game.Workspace.States:FindFirstChild(l_LocalPlayer_1.Name);
            if l_FirstChild_27 then
                local _ = l_FirstChild_27:FindFirstChild("Occupied");
            end;
            local v1747 = l_FirstChild_27 and l_FirstChild_27:FindFirstChild("CharacterData");
            local l_CameraSettings_1 = workspace:FindFirstChild("CameraSettings");
            local l_CameraTarget_1 = l_CameraSettings_1.CameraTarget;
            local l_CameraMode_1 = l_CameraSettings_1.CameraMode;
            local l_Variant_1 = l_CameraSettings_1.Variant;
            v1747.Cutscene.Value = true;
            local v1752 = false;
            local l_v1747_0 = v1747 --[[ copy: 12 -> 27 ]];
            local l_l_Variant_1_0 = l_Variant_1 --[[ copy: 16 -> 28 ]];
            local l_l_CameraMode_1_0 = l_CameraMode_1 --[[ copy: 15 -> 29 ]];
            local l_l_CameraTarget_1_0 = l_CameraTarget_1 --[[ copy: 14 -> 30 ]];
            do
                local l_v1752_0 = v1752;
                task.spawn(function() --[[ Line: 8630 ]]
                    -- upvalues: l_v1752_0 (ref), l_v1747_0 (copy), l_l_Variant_1_0 (copy), l_l_CameraMode_1_0 (copy), l_l_CameraTarget_1_0 (copy), v1737 (copy)
                    while not l_v1752_0 do
                        l_v1747_0.Cutscene.Value = true;
                        l_l_Variant_1_0.Value = "Yeonsu";
                        l_l_CameraMode_1_0.Value = "Knockdown";
                        l_l_CameraTarget_1_0.Value = v1737;
                        task.wait(0.03333333333333333);
                    end;
                end);
                task.delay(v1743 and 5 or 2.5, function() --[[ Line: 8642 ]]
                    -- upvalues: l_v1752_0 (ref), l_v1747_0 (copy), v33 (ref), l_LocalPlayer_0 (ref), l_l_Variant_1_0 (copy), l_l_CameraMode_1_0 (copy), l_l_CameraTarget_1_0 (copy)
                    l_v1752_0 = true;
                    l_v1747_0.Cutscene.Value = false;
                    v33.SetTransparency(l_LocalPlayer_0.Character, 0);
                    l_l_Variant_1_0.Value = "";
                    l_l_CameraMode_1_0.Value = "";
                    l_l_CameraTarget_1_0.Value = nil;
                end);
            end;
        end;
        local v1758 = v1737 and workspace.Welds:FindFirstChild(v1737.Name);
        local v1759 = v1758 and v1758:WaitForChild("WeldCharacter", 10) or v1737;
        local v1760 = require(l_Modules_0.Cutscene.Utilities);
        local l_Katana_0 = v1759:FindFirstChild("Katana");
        local l_Sageo_0 = v1759:FindFirstChild("Sageo");
        if not l_Katana_0 or not l_Sageo_0 then
            return;
        else
            local l_l_AnimHelper_0_Anim_11 = l_AnimHelper_0:CreateAnim(v1742);
            if v1737 == l_LocalPlayer_0.Character then
                v1739.CanWalk.Value = false;
            end;
            task.wait(0.16666666666666666);
            if not l_v1737_Attribute_0 then
                v1760.Emit(l_Sageo_0.Attachment);
            end;
            l_Katana_0.Main.LocalTransparencyModifier = 1;
            l_Katana_0.Main.Transparency = 0;
            l_Sageo_0.Main.LocalTransparencyModifier = 1;
            l_Sageo_0.Main.Transparency = 0;
            local l_SamuraiFire_0 = script.VoidMoves.SamuraiFire;
            if v1737:GetAttribute("Raiden") then
                l_SamuraiFire_0 = script.VoidMoves.RaidenFire;
            elseif v1737:GetAttribute("Raven") then
                l_SamuraiFire_0 = script.VoidMoves.RavenFire;
            end;
            l_SamuraiFire_0 = l_SamuraiFire_0:Clone();
            task.delay(10, function() --[[ Line: 8690 ]]
                -- upvalues: l_SamuraiFire_0 (ref)
                l_SamuraiFire_0:Destroy();
            end);
            task.delay(0, function() --[[ Line: 8694 ]]
                -- upvalues: l_SoundHelper_0 (ref), v1737 (copy), v33 (ref), l_v1737_Attribute_0 (copy), l_SamuraiFire_0 (ref), v1760 (copy)
                l_SoundHelper_0:PlaySound({
                    Parent = v1737, 
                    Name = "VoidEquip"
                });
                task.wait(0.75);
                v33.VoidSamuraiTrail({
                    Character = v1737, 
                    TrailInfo = {
                        HoldTime = 1
                    }
                });
                l_SoundHelper_0:PlaySound({
                    Parent = v1737, 
                    Name = "SwordSlash"
                });
                l_SoundHelper_0:PlaySound({
                    Parent = v1737, 
                    Name = "VoidBurst"
                });
                if not l_v1737_Attribute_0 then
                    l_SamuraiFire_0.Parent = workspace.Debris;
                    local v1765 = workspace:Raycast(v1737.UpperTorso.Position, Vector3.new(-0, -10, -0, -0), v33.GetMapParams());
                    if v1765 then
                        local v1766 = v1760.GetRaySurface(v1765);
                        local l_CFrame_0 = v1737.HumanoidRootPart.CFrame;
                        l_SamuraiFire_0.CFrame = CFrame.new(v1766.Position + Vector3.new(0, 0.20000000298023224, 0, 0), l_CFrame_0 * CFrame.new(0, 0, -40000).Position);
                    end;
                    v1760.Emit(l_SamuraiFire_0);
                    task.delay(0.1, function() --[[ Line: 8731 ]]
                        -- upvalues: v1760 (ref), l_SamuraiFire_0 (ref)
                        task.spawn(v1760.Explode, l_SamuraiFire_0.Position, {
                            Rocks = 6, 
                            SizeMagnitude = 1, 
                            HorizontalVelocity = 40, 
                            VerticalVelocity = 60, 
                            Lifespan = 3, 
                            MaxDistance = 0.1, 
                            RaycastProperties = true
                        });
                    end);
                end;
            end);
            local v1768 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            local l_ColorCorrectionEffect_8 = Instance.new("ColorCorrectionEffect");
            l_ColorCorrectionEffect_8.TintColor = Color3.fromRGB(255, 255, 255);
            l_ColorCorrectionEffect_8.Brightness = 0;
            l_ColorCorrectionEffect_8.Name = "Remove";
            l_ColorCorrectionEffect_8.Enabled = true;
            l_ColorCorrectionEffect_8.Parent = l_Lighting_0;
            l_TweenService_0:Create(l_ColorCorrectionEffect_8, v1768, {
                Saturation = -0.1, 
                Contrast = 0.3, 
                TintColor = Color3.fromRGB(255, 255, 255)
            }):Play();
            l_Workspace_1.FoVMult.Value = 3;
            local l_CurrentCamera_4 = l_Workspace_1.CurrentCamera;
            l_TweenService_0:Create(l_CurrentCamera_4, TweenInfo.new(0.6666666666666666, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                FieldOfView = 55
            }):Play();
            local v1771 = {};
            if v1743 then
                task.delay(0.9166666666666666, function() --[[ Line: 8764 ]]
                    -- upvalues: l_SamuraiFire_0 (ref), v1771 (copy), l_l_AnimHelper_0_Anim_11 (copy), v1737 (copy), v1743 (copy)
                    if l_SamuraiFire_0 then
                        for _, v1773 in l_SamuraiFire_0:GetDescendants() do
                            if v1773:IsA("ParticleEmitter") then
                                v1773.TimeScale = v1773.TimeScale * 0.4;
                            end;
                        end;
                        for _, v1775 in v1771 do
                            if v1775:IsA("ParticleEmitter") then
                                v1775.TimeScale = v1775.TimeScale * 0.3;
                            end;
                        end;
                    end;
                    l_l_AnimHelper_0_Anim_11:AdjustSpeed(0.1);
                    local v1776 = "RYUJIN";
                    local v1777 = "The Void Samurai";
                    if v1737:GetAttribute("Raiden") then
                        v1776 = "RAIDEN";
                        v1777 = "Corrupted";
                    end;
                    if v1737:GetAttribute("Raven") then
                        v1776 = "RAVEN";
                        v1777 = "Corrupted";
                    end;
                    if v1743 then
                        TitleDrop(v1776, v1777);
                        task.wait(3);
                    else
                        task.wait(1.5);
                    end;
                    l_l_AnimHelper_0_Anim_11:AdjustSpeed(1);
                    for _, v1779 in l_SamuraiFire_0:GetDescendants() do
                        if v1779:IsA("ParticleEmitter") then
                            v1779.TimeScale = v1779.TimeScale * 10;
                        end;
                    end;
                    for _, v1781 in v1771 do
                        if v1781:IsA("ParticleEmitter") then
                            v1781.TimeScale = v1781.TimeScale * 10;
                        end;
                    end;
                end);
            end;
            task.delay(0.6666666666666666, function() --[[ Line: 8813 ]]
                -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_4 (copy), l_ColorCorrectionEffect_8 (copy), v1768 (copy), v33 (ref)
                l_TweenService_0:Create(l_CurrentCamera_4, TweenInfo.new(0.6666666666666666, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FieldOfView = 65
                }):Play();
                l_TweenService_0:Create(l_ColorCorrectionEffect_8, v1768, {
                    Saturation = 0, 
                    Contrast = 0, 
                    TintColor = Color3.fromRGB(255, 255, 255)
                }):Play();
                task.defer(function() --[[ Line: 8817 ]]
                    -- upvalues: v33 (ref)
                    v33.CameraShake({
                        Preset = "MedHit", 
                        WaitTime = 0.35, 
                        Fade = 0.8
                    });
                end);
                task.wait(5);
                if l_ColorCorrectionEffect_8 then
                    l_ColorCorrectionEffect_8:Destroy();
                end;
            end);
            if not l_v1737_Attribute_0 then
                for _, v1783 in script.VoidKatanaAura:GetChildren() do
                    local v1784 = v1783:Clone();
                    local v1785 = v1783:Clone();
                    v1784.Parent = l_Katana_0.Main;
                    v1785.Parent = l_Sageo_0.Main;
                    v1784:Emit(1);
                    v1785:Emit(2);
                    if v1737:GetAttribute("Raiden") then
                        v1784.Color = ColorSequence.new(Color3.fromRGB(200, 300, 1000));
                        v1785.Color = ColorSequence.new(Color3.fromRGB(200, 300, 1000));
                    elseif v1737:GetAttribute("Raven") then
                        v1784.Color = ColorSequence.new(Color3.fromRGB(455, 200, 446));
                        v1785.Color = ColorSequence.new(Color3.fromRGB(455, 200, 446));
                    end;
                    table.insert(v1771, v1784);
                    table.insert(v1771, v1785);
                end;
                task.delay(0.8, function() --[[ Line: 8852 ]]
                    -- upvalues: v1771 (copy)
                    for _, v1787 in v1771 do
                        v1787.LockedToPart = false;
                    end;
                    task.wait(0.1);
                    for _, v1789 in v1771 do
                        v1789.Enabled = false;
                    end;
                    task.wait(5);
                    for _, v1791 in v1771 do
                        v1791:Destroy();
                    end;
                end);
            end;
            local v1792 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            l_TweenService_0:Create(l_Katana_0.Main, v1792, {
                LocalTransparencyModifier = 0
            }):Play();
            l_TweenService_0:Create(l_Sageo_0.Main, v1792, {
                LocalTransparencyModifier = 0
            }):Play();
            if v1743 then
                task.wait(3);
            end;
            task.wait(1.3333333333333333);
            l_l_AnimHelper_0_Anim_11:Stop(0.8333333333333334);
            l_l_AnimHelper_0_Anim_11:AdjustWeight(0, 0.8333333333333334);
            task.wait(0.3333333333333333);
            if v1737 == l_LocalPlayer_0.Character then
                v1739.CanWalk.Value = true;
            end;
            return;
        end;
    end;
end;
v33.VoidSamuraiUnequip = function(v1793) --[[ Line: 8887 ]] --[[ Name: VoidSamuraiUnequip ]]
    -- upvalues: l_SoundHelper_0 (copy), l_TweenService_0 (copy)
    local v1794 = v1793[2];
    local v1795 = v1794 and workspace.Welds:FindFirstChild(v1794.Name);
    local v1796 = v1795 and v1795:WaitForChild("WeldCharacter", 10) or v1794;
    local l_Katana_1 = v1796:FindFirstChild("Katana");
    local l_Sageo_1 = v1796:FindFirstChild("Sageo");
    if not l_Katana_1 or not l_Sageo_1 then
        return;
    else
        l_Katana_1.Name = "Remove";
        l_Sageo_1.Name = "Remove";
        l_SoundHelper_0:PlaySound({
            Parent = v1794, 
            Name = "VoidUnequip"
        });
        local l_v1794_Attribute_0 = v1794:GetAttribute("Raiden");
        local v1800 = {};
        for _, v1802 in script.VoidKatanaAura:GetChildren() do
            local v1803 = v1802:Clone();
            local v1804 = v1802:Clone();
            v1803.Parent = l_Katana_1.Main;
            v1804.Parent = l_Sageo_1.Main;
            if l_v1794_Attribute_0 then
                v1803.Color = ColorSequence.new(Color3.fromRGB(43, 135, 255));
                v1804.Color = ColorSequence.new(Color3.fromRGB(43, 135, 255));
            end;
            v1803:Emit(1);
            v1804:Emit(2);
            table.insert(v1800, v1803);
            table.insert(v1800, v1804);
        end;
        task.delay(0.35, function() --[[ Line: 8930 ]]
            -- upvalues: v1800 (copy)
            for _, v1806 in v1800 do
                v1806.LockedToPart = false;
            end;
            task.wait(0.3);
            for _, v1808 in v1800 do
                v1808.Enabled = false;
            end;
            task.wait(5);
            for _, v1810 in v1800 do
                v1810:Destroy();
            end;
        end);
        local v1811 = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
        l_TweenService_0:Create(l_Katana_1.Main, v1811, {
            LocalTransparencyModifier = 1
        }):Play();
        l_TweenService_0:Create(l_Sageo_1.Main, v1811, {
            LocalTransparencyModifier = 1
        }):Play();
        return;
    end;
end;
local function _() --[[ Line: 8951 ]] --[[ Name: GetInterface ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    return l_LocalPlayer_0:GetAttribute("Interface");
end;
v33.VoidSamuraiTrail = function(v1813) --[[ Line: 8953 ]] --[[ Name: VoidSamuraiTrail ]]
    -- upvalues: l_Workspace_1 (copy), l_LocalPlayer_0 (copy), v23 (copy)
    local l_Character_27 = v1813.Character;
    local l_TrailInfo_1 = v1813.TrailInfo;
    local l_HoldTime_2 = l_TrailInfo_1.HoldTime;
    local v1817 = l_Character_27 and workspace.Welds:FindFirstChild(l_Character_27.Name);
    local v1818 = v1817 and v1817:WaitForChild("WeldCharacter", 10) or l_Character_27;
    if not v1818 then
        return;
    elseif v1813.Character.Parent ~= l_Workspace_1.Live then
        return;
    else
        local l_Katana_2 = v1818:FindFirstChild("Katana");
        local v1820 = l_Katana_2 and l_Katana_2:FindFirstChild("Main");
        if not l_Katana_2 then
            return;
        else
            local v1821 = tick();
            v1820:SetAttribute("CurrentId", v1821);
            for _, v1823 in v1820:GetChildren() do
                if v1823:IsA("Trail") then
                    v1823.Enabled = true;
                    if not v1823:GetAttribute("DefaultLifetime") then
                        v1823:SetAttribute("DefaultLifetime", v1823.Lifetime);
                    end;
                    v1823.Lifetime = v1823.Lifetime * (l_TrailInfo_1.Lifetime or 1);
                end;
            end;
            local l_l_Character_27_Attribute_0 = l_Character_27:GetAttribute("LastDamaged");
            local v1825 = l_LocalPlayer_0.Character == l_Character_27;
            local l_MeshOffset_0 = l_TrailInfo_1.MeshOffset;
            if l_MeshOffset_0 then
                local l_IsStartPunch_0 = l_TrailInfo_1.IsStartPunch;
                local v1828 = 0.03333333333333333;
                local v1829 = l_TrailInfo_1.FlipbookSpeed or 1;
                if v1825 then
                    v1829 = v1829 * (l_IsStartPunch_0 and 0.8 or 0.7);
                end;
                if not v1825 and l_IsStartPunch_0 then
                    v1828 = 0.1;
                end;
                do
                    local l_v1829_0 = v1829;
                    task.delay(l_TrailInfo_1.MeshDelay - v1828, function() --[[ Line: 9007 ]]
                        -- upvalues: l_l_Character_27_Attribute_0 (copy), l_Character_27 (copy), l_MeshOffset_0 (copy), l_TrailInfo_1 (copy), l_Workspace_1 (ref), v1825 (copy), l_v1829_0 (ref), l_IsStartPunch_0 (copy), v23 (ref)
                        if l_l_Character_27_Attribute_0 ~= l_Character_27:GetAttribute("LastDamaged") then
                            return;
                        else
                            local v1831 = script.VoidMoves.Slash:Clone();
                            v1831.CFrame = l_Character_27.PrimaryPart.CFrame * l_MeshOffset_0;
                            local l_MeshOrientation_0 = l_TrailInfo_1.MeshOrientation;
                            for _, v1834 in l_Workspace_1.Debris:GetChildren() do
                                if v1834.Name == l_Character_27.Name .. "Hit" then
                                    v1834:Destroy();
                                end;
                            end;
                            v1831.Orientation = v1831.Orientation + l_MeshOrientation_0;
                            v1831.Name = l_Character_27.Name .. "Hit";
                            v1831.Anchored = true;
                            v1831.Parent = l_Workspace_1.Debris;
                            if v1825 then
                                v1831.Decal.Transparency = 0.35;
                            else
                                l_v1829_0 = l_v1829_0 * (l_IsStartPunch_0 and 0.67 or 0.55);
                            end;
                            if l_Character_27:GetAttribute("IsBasicSamurai") then
                                v1831.Decal.Transparency = 0.95;
                                v1831.Decal.Color3 = Color3.fromRGB(255, 255, 255);
                            end;
                            if l_Character_27:GetAttribute("Raiden") then
                                v1831.Decal.Color3 = Color3.fromRGB(83, 232, 255);
                            elseif l_Character_27:GetAttribute("Raven") then
                                v1831.Decal.Color3 = Color3.fromRGB(255, 89, 241);
                            end;
                            task.defer(function() --[[ Line: 9042 ]]
                                -- upvalues: v23 (ref), v1831 (copy), l_v1829_0 (ref)
                                v23.PlayFlipbook(v1831, v1831.ModuleScript, l_v1829_0);
                                task.wait(1);
                                v1831:Destroy();
                            end);
                            return;
                        end;
                    end);
                end;
            end;
            task.delay(l_HoldTime_2, function() --[[ Line: 9051 ]]
                -- upvalues: v1820 (copy), v1821 (copy)
                if v1820:GetAttribute("CurrentId") ~= v1821 then
                    return;
                else
                    for _, v1836 in v1820:GetChildren() do
                        if v1836:IsA("Trail") then
                            v1836.Enabled = false;
                            v1836.Lifetime = v1836:GetAttribute("DefaultLifetime");
                        end;
                    end;
                    return;
                end;
            end);
            return;
        end;
    end;
end;
v33.VoidSlash = function(v1837) --[[ Line: 9063 ]] --[[ Name: VoidSlash ]]
    -- upvalues: l_Workspace_1 (copy)
    local v1838 = {
        Character = v1837[2], 
        SetCFrame = v1837[3], 
        Damager = v1837[4], 
        EffectInfo = v1837[5]
    };
    local _ = v1838.Character;
    local l_SetCFrame_7 = v1838.SetCFrame;
    local l_Damager_3 = v1838.Damager;
    local v1842 = (l_Damager_3:GetAttribute("IsBasicSamurai") and script.BasicVoidSlash or script.VoidSlash):Clone();
    v1842.CFrame = l_SetCFrame_7 * v1838.EffectInfo.AddCFrame;
    v1842.Name = l_Damager_3.Name .. "Hit";
    v1842.Parent = l_Workspace_1.Debris;
    local l_l_Damager_3_Attribute_0 = l_Damager_3:GetAttribute("Raiden");
    for _, v1845 in v1842:GetDescendants() do
        if v1845:IsA("ParticleEmitter") or v1845:IsA("Beam") or v1845:IsA("Trail") then
            v1845.Enabled = false;
            if l_l_Damager_3_Attribute_0 then
                v1845.Color = ColorSequence.new(Color3.fromRGB(43, 135, 255));
            end;
            task.delay(v1845:GetAttribute("EmitDelay"), function() --[[ Line: 9092 ]]
                -- upvalues: v1845 (copy)
                v1845:Emit(v1845:GetAttribute("EmitCount"));
            end);
            if v1845.Name == "StarMain" then
                v1845.Rotation = NumberRange.new(v1842.Orientation.Z);
            end;
        end;
    end;
    task.wait(5);
    v1842:Destroy();
end;
getXAndZPositions = function(v1846, v1847) --[[ Line: 9105 ]] --[[ Name: getXAndZPositions ]]
    return math.cos(v1846) * v1847, math.sin(v1846) * v1847;
end;
v33.CreateMoveTelegraph = function(v1848) --[[ Line: 9111 ]] --[[ Name: CreateMoveTelegraph ]]
    -- upvalues: l_TweenService_0 (copy), l_Players_0 (copy), l_LocalPlayer_0 (copy), l_RunService_0 (copy)
    local l_Position_18 = v1848.Position;
    local l_Timeout_0 = v1848.Timeout;
    local l_Size_11 = v1848.Size;
    local l_Alert_0 = script.Effects.Alert;
    local v1853 = script.Telegraph:Clone();
    local l_Particles_0 = v1853.Particles;
    local v1855 = l_Particles_0.Size.X / v1853.Size.X;
    local l_Transparency_0 = v1853.Transparency;
    v1853.Position = l_Position_18;
    v1853.Transparency = 1;
    local v1857 = Vector3.new(l_Size_11.X, 1, l_Size_11.Z);
    v1853.Size = Vector3.new(0, 1, 0, 0);
    l_Particles_0.Size = l_Size_11.X * v1855 * Vector3.new(1, 0, 1, 0);
    l_Particles_0.Position = v1853.Position + Vector3.new(0, 0.5, 0, 0);
    local v1858 = v1848.DefaultWidth or 30;
    local l_Folder_1 = Instance.new("Folder");
    l_Folder_1.Parent = v1853;
    l_Folder_1.Name = "Beams";
    local v1860 = nil;
    local v1861 = nil;
    local function _(v1862, v1863) --[[ Line: 9146 ]] --[[ Name: CreateBeam ]]
        -- upvalues: v1853 (copy), l_Folder_1 (copy), v1858 (copy)
        local v1864 = v1853.BaseBeam:Clone();
        v1864.Parent = l_Folder_1;
        v1864.Width0 = v1858;
        v1864.Width1 = v1858;
        v1864.TextureSpeed = 0.1;
        v1864.Attachment0 = v1862;
        v1864.Attachment1 = v1863;
    end;
    v1853.Parent = game.Workspace.Debris;
    for v1866 = 0, 29 do
        local l_Attachment_0 = Instance.new("Attachment");
        l_Attachment_0.Position = Vector3.new();
        l_Attachment_0.Parent = v1853;
        l_Attachment_0.Name = v1866;
        if v1860 then
            local l_v1860_0 = v1860;
            local v1869 = v1853.BaseBeam:Clone();
            v1869.Parent = l_Folder_1;
            v1869.Width0 = v1858;
            v1869.Width1 = v1858;
            v1869.TextureSpeed = 0.1;
            v1869.Attachment0 = l_Attachment_0;
            v1869.Attachment1 = l_v1860_0;
        else
            v1861 = l_Attachment_0;
        end;
        v1860 = l_Attachment_0;
    end;
    local l_v1861_0 = v1861;
    local l_v1860_1 = v1860;
    local v1872 = v1853.BaseBeam:Clone();
    v1872.Parent = l_Folder_1;
    v1872.Width0 = v1858;
    v1872.Width1 = v1858;
    v1872.TextureSpeed = 0.1;
    v1872.Attachment0 = l_v1861_0;
    v1872.Attachment1 = l_v1860_1;
    l_v1861_0 = 0.6;
    l_v1860_1 = TweenInfo.new(l_v1861_0, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
    l_TweenService_0:Create(v1853, l_v1860_1, {
        Size = v1857, 
        Transparency = l_Transparency_0
    }):Play();
    v1872 = v1853.BaseBeam.Brightness;
    local v1873 = 0.4;
    local v1874 = tick();
    local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
    local v1876 = l_LocalPlayer_2 and l_LocalPlayer_2.Character;
    local v1877 = l_Alert_0:Clone();
    v1877.Name = "ZanzokenIgnore";
    local l_ParticleEmitter_0 = v1877.ParticleEmitter;
    l_ParticleEmitter_0.Name = "ZanzokenIgnore";
    l_ParticleEmitter_0.Enabled = false;
    l_ParticleEmitter_0.Lifetime = NumberRange.new(0.2);
    v1877.Parent = v1876 and v1876.PrimaryPart;
    local v1879 = false;
    local v1880 = false;
    local l_Character_29 = l_LocalPlayer_0.Character;
    local v1882 = nil;
    v1882 = l_RunService_0.RenderStepped:Connect(function(v1883) --[[ Line: 9206 ]]
        -- upvalues: v1874 (ref), l_v1861_0 (ref), v1853 (copy), v1873 (ref), l_TweenService_0 (ref), v1858 (copy), v1872 (copy), l_Character_29 (copy), l_Size_11 (copy), v1879 (ref), l_ParticleEmitter_0 (copy), v1880 (ref), v1877 (copy), l_Folder_1 (copy)
        local v1884 = math.clamp((tick() - v1874) / l_v1861_0, 0, 1);
        for v1885 = 0, 29 do
            local v1886, v1887 = getXAndZPositions(0.20943951023931953 * (v1885 + 0.5), v1853.Size.Z / 2);
            local v1888 = Vector3.new(v1886, 0.5, v1887);
            local l_v1853_FirstChild_0 = v1853:FindFirstChild((tostring(v1885)));
            if l_v1853_FirstChild_0 then
                l_v1853_FirstChild_0.Position = v1888;
            end;
        end;
        local v1890 = math.clamp((tick() - v1874) / v1873, 0, 1);
        local l_l_TweenService_0_Value_4 = l_TweenService_0:GetValue(v1890, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local v1892 = v1883 * 6;
        local l_v1858_0 = v1858;
        local l_v1872_0 = v1872;
        if l_Character_29 and l_Character_29.PrimaryPart then
            local l_Position_19 = l_Character_29.PrimaryPart.Position;
            if (v1853.Position * Vector3.new(1, 0, 1, 0) - l_Position_19 * Vector3.new(1, 0, 1, 0)).Magnitude < l_Size_11.X / 2 and l_Size_11.Y / 2 > 10 then
                if not v1879 then
                    print("In EMIT");
                    l_ParticleEmitter_0:Emit(1);
                    task.defer(function() --[[ Line: 9240 ]]
                        -- upvalues: v1879 (ref), l_ParticleEmitter_0 (ref)
                        task.wait(0.1);
                        if not v1879 then
                            return;
                        else
                            l_ParticleEmitter_0.TimeScale = 0;
                            return;
                        end;
                    end);
                end;
                if not v1880 then
                    v1877.Detected.PlaybackSpeed = 1.4;
                end;
                local v1896 = l_Position_19.Y - v1853.Position.Y - v1853.Size.Y / 2;
                l_v1858_0 = v1858 + v1896 * 2;
                v1880 = true;
                v1879 = true;
                print("In Circle");
            end;
        end;
        if v1879 and l_v1858_0 == v1858 then
            l_ParticleEmitter_0.TimeScale = 1;
            v1879 = false;
        end;
        local l_v1872_1 = v1872;
        local v1898 = v1872 * 4;
        local v1899 = math.clamp((l_v1858_0 - v1858) / 200, 0, 1);
        local v1900 = l_v1872_1 + (v1898 - l_v1872_1) * v1899;
        if math.abs(l_v1872_0 / v1900) > 1.01 then
            l_v1872_1 = l_v1872_0;
            l_v1872_0 = l_v1872_1 + (v1900 - l_v1872_1) * v1892;
        end;
        for _, v1902 in l_Folder_1:GetChildren() do
            if v1884 < 1 then
                v1902.Transparency = NumberSequence.new(1 + -0.75 * l_l_TweenService_0_Value_4);
            end;
            local l_Width0_0 = v1902.Width0;
            v1902.Width0 = l_Width0_0 + (l_v1858_0 - l_Width0_0) * v1892;
            l_Width0_0 = v1902.Width0;
            v1902.Width1 = l_Width0_0 + (l_v1858_0 - l_Width0_0) * v1892;
            v1902.Brightness = l_v1872_0;
        end;
    end);
    local v1904 = false;
    local function v1914() --[[ Line: 9288 ]] --[[ Name: RemoveTelegraph ]]
        -- upvalues: v1904 (ref), v1882 (ref), v1874 (ref), l_ParticleEmitter_0 (copy), l_v1861_0 (ref), v1873 (ref), l_v1860_1 (ref), l_TweenService_0 (ref), v1853 (copy), v1857 (copy), l_RunService_0 (ref), l_Folder_1 (copy), v1877 (copy)
        if v1904 then
            return;
        else
            v1904 = true;
            if v1882 then
                v1882:Disconnect();
            end;
            v1874 = tick();
            l_ParticleEmitter_0.TimeScale = 1;
            l_v1861_0 = 1;
            v1873 = 1;
            l_v1860_1 = TweenInfo.new(l_v1861_0, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
            l_TweenService_0:Create(v1853, l_v1860_1, {
                Size = v1857 * Vector3.new(0, 1, 0, 0), 
                Transparency = 1
            }):Play();
            v1882 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 9302 ]]
                -- upvalues: v1853 (ref), v1874 (ref), v1873 (ref), l_TweenService_0 (ref), l_Folder_1 (ref)
                for v1905 = 0, 29 do
                    local v1906, v1907 = getXAndZPositions(0.20943951023931953 * (v1905 + 0.5), v1853.Size.Z / 2);
                    local v1908 = Vector3.new(v1906, 0.5, v1907);
                    local l_v1853_FirstChild_1 = v1853:FindFirstChild((tostring(v1905)));
                    if l_v1853_FirstChild_1 then
                        l_v1853_FirstChild_1.Position = v1908;
                    end;
                end;
                local v1910 = math.clamp((tick() - v1874) / v1873, 0, 1);
                local l_l_TweenService_0_Value_5 = l_TweenService_0:GetValue(v1910, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
                for _, v1913 in l_Folder_1:GetChildren() do
                    v1913.Transparency = NumberSequence.new(0.25 + 0.75 * l_l_TweenService_0_Value_5);
                end;
            end);
            task.wait(l_v1861_0);
            if v1882 then
                v1882:Disconnect();
            end;
            if v1877 then
                v1877:Destroy();
            end;
            if v1853 then
                v1853:Destroy();
            end;
            return;
        end;
    end;
    if not l_Timeout_0 then
        l_Timeout_0 = 20;
    end;
    task.defer(function() --[[ Line: 9331 ]]
        -- upvalues: l_Timeout_0 (ref), v1914 (copy)
        task.wait(l_Timeout_0);
        v1914();
    end);
    return v1914;
end;
v33.StartVoidMeteor = function(v1915) --[[ Line: 9339 ]] --[[ Name: StartVoidMeteor ]]
    -- upvalues: l_Lighting_0 (copy), l_TweenService_0 (copy), l_AnimHelper_0 (copy), l_Workspace_1 (copy), l_SoundHelper_0 (copy), v33 (copy), l_BubbleModule_0 (copy)
    local v1916 = {
        Character = v1915[2], 
        DamageDelay = v1915[3], 
        EndLag = v1915[4]
    };
    local l_Character_30 = v1916.Character;
    local l_Humanoid_19 = l_Character_30:FindFirstChild("Humanoid");
    local l_ColorCorrectionEffect_9 = Instance.new("ColorCorrectionEffect");
    l_ColorCorrectionEffect_9.Brightness = 0;
    l_ColorCorrectionEffect_9.Contrast = 0;
    l_ColorCorrectionEffect_9.Saturation = 0;
    l_ColorCorrectionEffect_9.Name = "Remove";
    l_ColorCorrectionEffect_9.Parent = l_Lighting_0;
    local v1920 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    l_TweenService_0:Create(l_ColorCorrectionEffect_9, v1920, {
        Saturation = -0.4, 
        Contrast = 0.65
    }):Play();
    task.delay(5, function() --[[ Line: 9359 ]]
        -- upvalues: l_ColorCorrectionEffect_9 (copy)
        if l_ColorCorrectionEffect_9 then
            l_ColorCorrectionEffect_9:Destroy();
        end;
    end);
    local v1921 = {
        Priority = Enum.AnimationPriority.Action, 
        Animator = l_Humanoid_19:FindFirstChild("Animator") or l_Humanoid_19, 
        AnimId = 106253752625292, 
        NameFade = 0.3, 
        FadeIn = 0.6, 
        Weight = 1000, 
        Name = "Server"
    };
    local _ = l_AnimHelper_0:CreateAnim(v1921);
    v1921.AnimId = 71355473770384;
    local _ = l_AnimHelper_0:CreateAnim(v1921);
    v1921.AnimId = 114684656904423;
    local _ = l_AnimHelper_0:CreateAnim(v1921);
    v1921.Priority = Enum.AnimationPriority.Action3;
    v1921.AnimId = 106253752625292;
    local _ = l_AnimHelper_0:CreateAnim(v1921);
    v1921.NameFade = 0.1;
    v1921.FadeIn = 0.1;
    local l_CurrentCamera_5 = l_Workspace_1.CurrentCamera;
    l_TweenService_0:Create(l_CurrentCamera_5, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        FieldOfView = 65
    }):Play();
    local v1927 = l_Character_30 and workspace.Welds:FindFirstChild(l_Character_30.Name);
    local v1928 = v1927 and v1927:WaitForChild("WeldCharacter", 10) or l_Character_30;
    local _ = v1928:FindFirstChild("Katana");
    local l_Sageo_2 = v1928:FindFirstChild("Sageo");
    if l_Sageo_2 then
        local v1931 = {};
        for _, v1933 in script.VoidKatanaAura:GetChildren() do
            local v1934 = v1933:Clone();
            if l_Character_30:GetAttribute("Raiden") then
                v1934.Color = ColorSequence.new(Color3.fromRGB(39, 89, 255));
            end;
            v1934.Parent = l_Sageo_2.Main;
            v1934:Emit(1);
            table.insert(v1931, v1934);
        end;
        task.delay(0.75, function() --[[ Line: 9413 ]]
            -- upvalues: v1931 (copy)
            for _, v1936 in v1931 do
                v1936.LockedToPart = false;
            end;
            task.wait(0.6666666666666666);
            for _, v1938 in v1931 do
                v1938.Enabled = false;
            end;
            task.wait(5);
            for _, v1940 in v1931 do
                v1940:Destroy();
            end;
        end);
    end;
    l_SoundHelper_0:PlaySound({
        Parent = l_Character_30, 
        Name = "VoidUnequip", 
        Volume = 0.2, 
        Speed = 0.7
    });
    task.defer(function() --[[ Line: 9437 ]]
        -- upvalues: v33 (ref)
        v33.CameraShake({
            Preset = "LightHit", 
            WaitTime = 2, 
            Fade = 3
        });
    end);
    task.delay(0.75, function() --[[ Line: 9445 ]]
        -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_5 (copy), l_ColorCorrectionEffect_9 (copy), v1920 (copy), v33 (ref)
        l_TweenService_0:Create(l_CurrentCamera_5, TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            FieldOfView = 60
        }):Play();
        l_TweenService_0:Create(l_ColorCorrectionEffect_9, v1920, {
            Saturation = -0.6, 
            Contrast = 0.8
        }):Play();
        task.defer(function() --[[ Line: 9449 ]]
            -- upvalues: v33 (ref)
            v33.CameraShake({
                Preset = "MediumHit", 
                WaitTime = 2, 
                Fade = 3
            });
        end);
    end);
    task.delay(v1916.DamageDelay - 0.48333333333333334, function() --[[ Line: 9458 ]]
        -- upvalues: v1921 (copy), l_AnimHelper_0 (ref), l_ColorCorrectionEffect_9 (copy), l_Character_30 (copy), l_Workspace_1 (ref), v33 (ref), l_BubbleModule_0 (ref), l_TweenService_0 (ref), l_CurrentCamera_5 (copy)
        v1921.AnimId = 71355473770384;
        local _ = l_AnimHelper_0:CreateAnim(v1921);
        task.wait(0.5166666666666667);
        if l_ColorCorrectionEffect_9 then
            l_ColorCorrectionEffect_9:Destroy();
        end;
        local v1942 = script.VoidMoves.MeteorSmoke:Clone();
        v1942.Position = l_Character_30.PrimaryPart.CFrame.Position - Vector3.new(0, 2.9100000858306885, 0, 0);
        v1942.Parent = l_Workspace_1.Debris;
        for _, v1944 in v1942:GetDescendants() do
            if v1944:IsA("ParticleEmitter") then
                v1944.Enabled = false;
                v1944:Emit(v1944.Rate);
            end;
        end;
        v33.HUDShake({
            Scale = 10, 
            Damper = 0.09999999999999999
        });
        task.defer(function() --[[ Line: 9480 ]]
            -- upvalues: v33 (ref)
            v33.CameraShake({
                Preset = "HardHitRoll", 
                WaitTime = 0.3, 
                Fade = 1.5
            });
        end);
        task.defer(function() --[[ Line: 9488 ]]
            -- upvalues: v33 (ref)
            v33.CreateImpactFrame({
                Time = 0.1
            });
        end);
        task.defer(function() --[[ Line: 9494 ]]
            -- upvalues: l_BubbleModule_0 (ref), l_Character_30 (ref)
            l_BubbleModule_0.CreateBubble(l_Character_30.PrimaryPart.CFrame, Vector3.new(5, 5, 5, 0), 0.6, Vector3.new(55, 55, 55, 0), 0.1);
        end);
        l_TweenService_0:Create(l_CurrentCamera_5, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            FieldOfView = 80
        }):Play();
        task.wait(5);
        if v1942 then
            v1942:Destroy();
        end;
    end);
    task.delay(v1916.EndLag - 0.8333333333333334, function() --[[ Line: 9504 ]]
        -- upvalues: v1921 (copy), l_AnimHelper_0 (ref)
        v1921.StopInfo = {
            StopDelay = 0.6666666666666666, 
            StopTime = 0.75
        };
        v1921.AnimId = 114684656904423;
        local _ = l_AnimHelper_0:CreateAnim(v1921);
    end);
end;
v33.VoidMeteor = function(v1946) --[[ Line: 9515 ]] --[[ Name: VoidMeteor ]]
    -- upvalues: v33 (copy), v34 (copy), l_Workspace_1 (copy), v23 (copy), l_SoundHelper_0 (copy), l_Modules_0 (copy), l_TweenService_0 (copy)
    local v1947 = {
        Character = v1946[2], 
        ExplodePosition = v1946[3], 
        ExplodeSize = v1946[4] - 0.3, 
        Timeout = v1946[5]
    };
    local l_Attribute_0 = v1947.Character:GetAttribute("Raiden");
    task.defer(function() --[[ Line: 9525 ]]
        -- upvalues: v33 (ref), v1947 (copy), v34 (ref), l_Workspace_1 (ref), l_Attribute_0 (copy), v23 (ref), l_SoundHelper_0 (ref), l_Modules_0 (ref), l_TweenService_0 (ref)
        v33.CreateMoveTelegraph({
            Size = Vector3.new(v1947.ExplodeSize, 1, v1947.ExplodeSize), 
            Position = v1947.ExplodePosition, 
            Timeout = v1947.Timeout, 
            DefaultWidth = 3
        });
        task.wait(v1947.Timeout - 0.1);
        local v1949 = script.VoidMoves.MeteorImpact:Clone();
        v1949.Position = v1947.ExplodePosition;
        v1949.CFrame = v1949.CFrame * CFrame.Angles(0, v34:NextNumber(0, 6.283185307179586, 0), 0);
        v1949.Size = v1949.Size * (Vector3.new(1, 1, 1, 0) * v34:NextNumber(0.9, 1.9));
        v1949.Parent = l_Workspace_1.Debris;
        if l_Attribute_0 then
            for _, v1951 in v1949:GetDescendants() do
                if v1951:IsA("ParticleEmitter") or v1951:IsA("Beam") or v1951:IsA("Trail") then
                    v1951.Color = ColorSequence.new(Color3.fromRGB(43, 135, 255));
                end;
                if v1951:IsA("Decal") then
                    v1951.Color3 = Color3.fromRGB(43, 135, 255);
                end;
            end;
        end;
        task.delay(0.1, function() --[[ Line: 9552 ]]
            -- upvalues: v23 (ref), v1949 (copy)
            task.spawn(v23.Explode, v1949.Position, {
                Rocks = 6, 
                SizeMagnitude = 1, 
                HorizontalVelocity = 40, 
                VerticalVelocity = 60, 
                Lifespan = 3, 
                MaxDistance = 0.1, 
                RaycastProperties = true
            });
        end);
        l_SoundHelper_0:PlaySound({
            Parent = v1949, 
            Name = "VoidEquip", 
            Volume = 0.07058823529411765, 
            Speed = v34:NextNumber(0.8, 1.2)
        });
        l_SoundHelper_0:PlaySound({
            Parent = v1949, 
            Name = "VoidGaster", 
            Volume = 0.11764705882352942, 
            Speed = v34:NextNumber(1, 1.2)
        });
        task.wait(0.1);
        require(l_Modules_0.Cutscene.Utilities).Emit(v1949);
        v33.HUDShake({
            Scale = 10, 
            Damper = 0.09999999999999999
        });
        task.defer(function() --[[ Line: 9588 ]]
            -- upvalues: v33 (ref)
            v33.CameraShake({
                Preset = "SuperHardHit", 
                WaitTime = 0.1, 
                Fade = 1.3
            });
        end);
        task.wait(3);
        l_TweenService_0:Create(v1949.Decal, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Transparency = 1
        }):Play();
        l_TweenService_0:Create(v1949.Decal1, TweenInfo.new(6.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Transparency = 1
        }):Play();
        l_TweenService_0:Create(v1949.Decal2, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Transparency = 1
        }):Play();
        task.wait(8);
        v1949:Destroy();
    end);
end;
v33.VoidSliceDamage = function(v1952) --[[ Line: 9607 ]] --[[ Name: VoidSliceDamage ]]
    -- upvalues: v33 (copy), l_SoundHelper_0 (copy), v34 (copy), l_AnimHelper_0 (copy), l_Workspace_1 (copy)
    local v1953 = v1952[2];
    local v1954 = v1952[3];
    local l_Humanoid_20 = v1953:FindFirstChild("Humanoid");
    local v1956 = l_Humanoid_20:FindFirstChild("Animator") or l_Humanoid_20;
    local v1957 = {
        Priority = Enum.AnimationPriority.Action3, 
        Animator = v1956, 
        AnimId = 13705365076, 
        NameFade = 0.001, 
        FadeIn = 0.15, 
        Weight = 1000, 
        Name = "Remove", 
        Speed = 0.7, 
        StopInfo = {
            StopDelay = 0.8, 
            StopTime = 0.8
        }
    };
    task.defer(function() --[[ Line: 9631 ]]
        -- upvalues: v33 (ref)
        v33.CameraShake({
            Preset = "HardHitRoll", 
            WaitTime = 0.1, 
            Fade = 1
        });
    end);
    task.defer(function() --[[ Line: 9639 ]]
        -- upvalues: l_SoundHelper_0 (ref), v1953 (copy), v34 (ref)
        for _ = 1, 14 do
            l_SoundHelper_0:PlaySound({
                Parent = v1953, 
                Name = "VoidSword", 
                Volume = 0.2, 
                Speed = v34:NextNumber(0.6, 1.2)
            });
            task.wait(0.065);
        end;
    end);
    task.defer(function() --[[ Line: 9652 ]]
        -- upvalues: l_AnimHelper_0 (ref), v1957 (copy)
        for _ = 1, 4 do
            l_AnimHelper_0:CreateAnim(v1957);
            task.wait(0.25);
        end;
    end);
    local v1960 = script.VoidMoves.MeteorDamage:Clone();
    v1960.CFrame = v1953.PrimaryPart.CFrame;
    v1960.Parent = l_Workspace_1.Debris;
    local l_v1954_Attribute_0 = v1954:GetAttribute("Raiden");
    for _, v1963 in v1960:GetDescendants() do
        if v1963:IsA("ParticleEmitter") then
            if l_v1954_Attribute_0 then
                v1963.Color = ColorSequence.new(Color3.fromRGB(43, 135, 255));
            end;
            v1963.Enabled = true;
            v1963.TimeScale = v1963.TimeScale * 0.6;
            v1963.ZOffset = v1963.ZOffset + 2;
        end;
    end;
    task.wait(0.9);
    for _, v1965 in v1960:GetDescendants() do
        if v1965:IsA("ParticleEmitter") then
            v1965.TimeScale = v1965.TimeScale * 0.5;
            v1965.Enabled = false;
        end;
    end;
    task.wait(5);
    v1960:Destroy();
end;
v33.VoidTenshoStart = function(v1966) --[[ Line: 9689 ]] --[[ Name: VoidTenshoStart ]]
    -- upvalues: l_Lighting_0 (copy), l_TweenService_0 (copy), l_AnimHelper_0 (copy), l_Workspace_1 (copy), l_SoundHelper_0 (copy), v33 (copy), l_LocalPlayer_0 (copy), l_RunService_0 (copy)
    local v1967 = {
        Character = v1966[2], 
        ServerTime = v1966[3], 
        TenshoDelay = v1966[4]
    };
    local l_Character_31 = v1967.Character;
    local l_Humanoid_21 = l_Character_31:FindFirstChild("Humanoid");
    local l_ColorCorrectionEffect_10 = Instance.new("ColorCorrectionEffect");
    l_ColorCorrectionEffect_10.Brightness = 0;
    l_ColorCorrectionEffect_10.Contrast = 0;
    l_ColorCorrectionEffect_10.Saturation = 0;
    l_ColorCorrectionEffect_10.Name = "VoidTensho";
    l_ColorCorrectionEffect_10.Parent = l_Lighting_0;
    local v1971 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    l_TweenService_0:Create(l_ColorCorrectionEffect_10, v1971, {
        Saturation = -0.4, 
        Contrast = 0.65
    }):Play();
    task.delay(5, function() --[[ Line: 9709 ]]
        -- upvalues: l_ColorCorrectionEffect_10 (copy)
        if l_ColorCorrectionEffect_10 then
            l_ColorCorrectionEffect_10:Destroy();
        end;
    end);
    local v1972 = {
        Priority = Enum.AnimationPriority.Action, 
        Animator = l_Humanoid_21:FindFirstChild("Animator") or l_Humanoid_21, 
        AnimId = 123895193387950, 
        NameFade = 0.3, 
        FadeIn = 0.6, 
        Weight = 1000, 
        Name = "Server"
    };
    local _ = l_AnimHelper_0:CreateAnim(v1972);
    v1972.AnimId = 76319591698283;
    local _ = l_AnimHelper_0:CreateAnim(v1972);
    v1972.AnimId = 101796330318767;
    local _ = l_AnimHelper_0:CreateAnim(v1972);
    v1972.Priority = Enum.AnimationPriority.Action3;
    v1972.AnimId = 123895193387950;
    local _ = l_AnimHelper_0:CreateAnim(v1972);
    v1972.NameFade = 0.1;
    v1972.FadeIn = 0.1;
    local l_CurrentCamera_6 = l_Workspace_1.CurrentCamera;
    l_TweenService_0:Create(l_CurrentCamera_6, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        FieldOfView = 65
    }):Play();
    local v1978 = l_Character_31 and workspace.Welds:FindFirstChild(l_Character_31.Name);
    local l_Katana_4 = (v1978 and v1978:WaitForChild("WeldCharacter", 10) or l_Character_31):FindFirstChild("Katana");
    local l_l_Character_31_Attribute_0 = l_Character_31:GetAttribute("Raiden");
    if l_Katana_4 then
        local v1981 = {};
        for _, v1983 in script.VoidKatanaAura:GetChildren() do
            local v1984 = v1983:Clone();
            if l_l_Character_31_Attribute_0 then
                v1984.Color = ColorSequence.new(Color3.fromRGB(43, 135, 255));
            end;
            v1984.Parent = l_Katana_4.Main;
            v1984:Emit(1);
            table.insert(v1981, v1984);
        end;
        local l_v1981_0 = v1981 --[[ copy: 16 -> 29 ]];
        task.delay(0.5, function() --[[ Line: 9763 ]]
            -- upvalues: l_v1981_0 (copy)
            for _, v1987 in l_v1981_0 do
                v1987.LockedToPart = false;
            end;
            task.wait(1);
            for _, v1989 in l_v1981_0 do
                v1989.Enabled = false;
            end;
            task.wait(5);
            for _, v1991 in l_v1981_0 do
                v1991:Destroy();
            end;
        end);
    end;
    l_SoundHelper_0:PlaySound({
        Parent = l_Character_31, 
        Name = "VoidUnequip", 
        Volume = 0.2, 
        Speed = 0.7
    });
    task.defer(function() --[[ Line: 9787 ]]
        -- upvalues: v33 (ref)
        v33.CameraShake({
            Preset = "LightHit", 
            WaitTime = 0.5, 
            Fade = 0.5
        });
    end);
    task.delay(0.75, function() --[[ Line: 9795 ]]
        -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_6 (copy), l_ColorCorrectionEffect_10 (copy), v1971 (copy), v33 (ref)
        l_TweenService_0:Create(l_CurrentCamera_6, TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            FieldOfView = 60
        }):Play();
        l_TweenService_0:Create(l_ColorCorrectionEffect_10, v1971, {
            Saturation = -0.6, 
            Contrast = 0.8
        }):Play();
        task.defer(function() --[[ Line: 9799 ]]
            -- upvalues: v33 (ref)
            v33.CameraShake({
                Preset = "Hawk3", 
                WaitTime = 0.5, 
                Fade = 0.5
            });
        end);
    end);
    local v1992 = CFrame.new(0, -l_Character_31.PrimaryPart.Size.Y * 1.2, 1.2) * CFrame.Angles(0, -1.5707963267948966, 0);
    local v1993 = script.VoidMoves.TenshoTelegraph:Clone();
    v1993.CFrame = l_Character_31.PrimaryPart.CFrame * v1992;
    v1993.Name = "TenshoTelegraph" .. l_Character_31.Name;
    v1993.Parent = l_Workspace_1.Debris;
    v1993["2"].Position = v1993["1"].Position;
    local v1994 = Vector3.new(-40, 0, v1993["2"].Position.Z);
    l_TweenService_0:Create(v1993["2"], TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Position = v1994
    }):Play();
    local l_Value_8 = GetCharacterData(l_Character_31).Opponent.Value;
    local _ = l_LocalPlayer_0.Character;
    l_RunService_0:BindToRenderStep("TenshoTelegraph" .. l_Character_31.Name, 1000, function(v1997) --[[ Line: 9825 ]]
        -- upvalues: l_Value_8 (copy), v1993 (copy), l_Character_31 (copy), v1992 (copy)
        if l_Value_8 then
            v1993.CFrame = CFrame.lookAt(l_Character_31.PrimaryPart.Position, l_Value_8.PrimaryPart.Position) * v1992;
            return;
        else
            v1993.CFrame = v1993.CFrame:Lerp(l_Character_31.PrimaryPart.CFrame * v1992, v1997 * 8);
            return;
        end;
    end);
    local v1998 = l_Workspace_1:GetServerTimeNow() - v1967.ServerTime;
    task.wait(v1967.TenshoDelay - v1998);
    if v1993 then
        for _, v2000 in v1993:GetDescendants() do
            if v2000:IsA("Beam") then
                local v2001 = l_TweenService_0:Create(v2000, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Width0 = 0, 
                    Width1 = 0
                });
                v2001:Play();
                v2001.Completed:Connect(function() --[[ Line: 9836 ]]
                    -- upvalues: v1993 (copy)
                    v1993:Destroy();
                end);
            end;
        end;
    end;
    task.delay(2, function() --[[ Line: 9838 ]]
        -- upvalues: v1993 (copy)
        if v1993 then
            v1993:Destroy();
        end;
    end);
    l_RunService_0:UnbindFromRenderStep("TenshoTelegraph" .. l_Character_31.Name);
end;
v33.VoidTensho = function(v2002) --[[ Line: 9845 ]] --[[ Name: VoidTensho ]]
    -- upvalues: l_Lighting_0 (copy), l_SoundHelper_0 (copy), l_AnimHelper_0 (copy), l_Workspace_1 (copy), v33 (copy), l_TweenService_0 (copy), l_RunService_0 (copy), v23 (copy)
    task.wait(0.2);
    local v2003 = {
        Character = v2002[2], 
        DamageDelay = v2002[3], 
        EndLag = v2002[4], 
        EndPosition = v2002[5], 
        TravelTime = v2002[6], 
        StartTime = v2002[7]
    };
    local l_Character_33 = v2003.Character;
    local l_Humanoid_22 = l_Character_33:FindFirstChild("Humanoid");
    for _, v2007 in l_Lighting_0:GetChildren() do
        if v2007.Name == "VoidTensho" then
            v2007:Destroy();
        end;
    end;
    local v2008 = {
        Priority = Enum.AnimationPriority.Action, 
        Animator = l_Humanoid_22:FindFirstChild("Animator") or l_Humanoid_22, 
        AnimId = 123895193387950, 
        NameFade = 0.1, 
        FadeIn = 0.1, 
        Weight = 1000, 
        Name = "Server"
    };
    l_SoundHelper_0:PlaySound({
        Parent = l_Character_33, 
        Name = "VoidEquip", 
        Volume = 0.2, 
        Speed = 0.7
    });
    task.delay(v2003.EndLag - 0.8333333333333334, function() --[[ Line: 9884 ]]
        -- upvalues: v2008 (copy), l_AnimHelper_0 (ref)
        v2008.StopInfo = {
            StopDelay = 0.6666666666666666, 
            StopTime = 0.75
        };
        v2008.AnimId = 101796330318767;
        local _ = l_AnimHelper_0:CreateAnim(v2008);
    end);
    v2008.AnimId = 76319591698283;
    local _ = l_AnimHelper_0:CreateAnim(v2008);
    local v2011 = script.VoidMoves.MeteorSmoke:Clone();
    v2011.Position = l_Character_33.PrimaryPart.CFrame.Position - Vector3.new(0, 2.9100000858306885, 0, 0);
    v2011.Parent = l_Workspace_1.Debris;
    task.delay(5, function() --[[ Line: 9901 ]]
        -- upvalues: v2011 (copy)
        if v2011 then
            v2011:Destroy();
        end;
    end);
    local l_l_Character_33_Attribute_0 = l_Character_33:GetAttribute("Raiden");
    for _, v2014 in v2011:GetDescendants() do
        if v2014:IsA("ParticleEmitter") then
            if l_l_Character_33_Attribute_0 then
                v2014.Color = ColorSequence.new(Color3.fromRGB(43, 135, 255));
            end;
            v2014.Enabled = false;
            v2014:Emit(v2014.Rate);
        end;
    end;
    v33.HUDShake({
        Scale = 10, 
        Damper = 0.09999999999999999
    });
    task.defer(function() --[[ Line: 9923 ]]
        -- upvalues: v33 (ref)
        v33.CameraShake({
            Preset = "SuperHardHit", 
            WaitTime = 0.2, 
            Fade = 1
        });
    end);
    task.defer(function() --[[ Line: 9931 ]]
        -- upvalues: v33 (ref)
        v33.CameraShake({
            Preset = "HardHitRoll", 
            WaitTime = 0.1, 
            Fade = 0.1
        });
    end);
    task.defer(function() --[[ Line: 9939 ]]
        -- upvalues: v33 (ref)
        v33.CreateImpactFrame({
            Time = 0.1
        });
    end);
    local l_CurrentCamera_7 = l_Workspace_1.CurrentCamera;
    l_TweenService_0:Create(l_CurrentCamera_7, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        FieldOfView = 75
    }):Play();
    task.defer(function() --[[ Line: 9948 ]]

    end);
    local v2016 = script.VoidMoves.VoidTensho:Clone();
    local v2017 = v2003.StartTime + 0.2;
    local v2018 = script.VoidMoves.SamuraiFire:Clone();
    v2018.Parent = workspace.Debris;
    local l_Position_20 = l_Character_33.PrimaryPart.CFrame.Position;
    local l_LookVector_1 = CFrame.lookAt(l_Position_20, v2003.EndPosition).LookVector;
    v2016.Parent = l_Workspace_1.Debris;
    if l_l_Character_33_Attribute_0 then
        for _, v2022 in v2016:GetDescendants() do
            if v2022:IsA("ParticleEmitter") or v2022:IsA("Beam") or v2022:IsA("Trail") then
                v2022.Color = ColorSequence.new(Color3.fromRGB(43, 135, 255));
            end;
        end;
    end;
    local l_CFrame_1 = l_Character_33.PrimaryPart.CFrame;
    local v2024 = nil;
    v2024 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 9975 ]]
        -- upvalues: l_Workspace_1 (ref), v2017 (copy), v2003 (copy), l_Position_20 (copy), l_CFrame_1 (ref), l_LookVector_1 (copy), v2016 (copy)
        local v2025 = math.clamp((l_Workspace_1:GetServerTimeNow() - v2017) / v2003.TravelTime, 0, 1);
        local l_l_Position_20_0 = l_Position_20;
        local v2027 = l_l_Position_20_0 + (v2003.EndPosition - l_l_Position_20_0) * v2025;
        l_CFrame_1 = CFrame.lookAt(v2027, v2027 + l_LookVector_1) * CFrame.new(0, -2.9, 1.5) * CFrame.Angles(0, -1.5707963267948966, 0);
        v2016:SetPrimaryPartCFrame(l_CFrame_1);
    end);
    task.defer(function() --[[ Line: 9983 ]]
        -- upvalues: v2016 (copy), v23 (ref)
        while v2016.Trail["Dark Shadow Fire"].Enabled do
            task.spawn(v23.Explode, v2016.Main.Position, {
                Rocks = 1, 
                SizeMagnitude = 1, 
                HorizontalVelocity = 30, 
                VerticalVelocity = 30, 
                Lifespan = 2, 
                MaxDistance = 1, 
                RaycastProperties = true
            });
            task.wait(0.05);
        end;
    end);
    task.wait(v2003.TravelTime - 0.1);
    if v2024 then
        v2024:Disconnect();
    end;
    if v2016 then
        for _, v2029 in (v2016:GetDescendants()) do
            if v2029:IsA("ParticleEmitter") then
                v2029.Enabled = false;
            end;
            if v2029:IsA("Beam") then
                v2029.Enabled = false;
            end;
        end;
    end;
    l_SoundHelper_0:PlaySound({
        Parent = l_Character_33, 
        Name = "VoidBurst"
    });
    v2018.CFrame = l_CFrame_1 * CFrame.new(0, -1.9, 0);
    for _, v2031 in v2018:GetDescendants() do
        if v2031:IsA("ParticleEmitter") and l_l_Character_33_Attribute_0 then
            v2031.Color = ColorSequence.new(Color3.fromRGB(43, 135, 255));
        end;
    end;
    task.delay(10, function() --[[ Line: 10031 ]]
        -- upvalues: v2018 (copy)
        v2018:Destroy();
    end);
    for _, v2033 in (v2018:GetDescendants()) do
        if v2033:IsA("ParticleEmitter") then
            v2033.TimeScale = v2033.TimeScale * 0.7;
        end;
    end;
    v23.Emit(v2018);
    task.spawn(v23.Explode, v2018.Position, {
        Rocks = 6, 
        SizeMagnitude = 1, 
        HorizontalVelocity = 40, 
        VerticalVelocity = 60, 
        Lifespan = 3, 
        MaxDistance = 1, 
        RaycastProperties = true
    });
    task.defer(function() --[[ Line: 10052 ]]

    end);
    task.defer(function() --[[ Line: 10056 ]]
        -- upvalues: v33 (ref)
        v33.CameraShake({
            Preset = "SuperHardHit", 
            WaitTime = 0.1, 
            Fade = 0.8
        });
    end);
    task.defer(function() --[[ Line: 10064 ]]
        -- upvalues: v33 (ref)
        v33.CameraShake({
            Preset = "HardHitRoll", 
            WaitTime = 0.1, 
            Fade = 0.3
        });
    end);
    task.wait(3);
    v2016:Destroy();
end;
v33.VoidSliceStart = function(v2034) --[[ Line: 10076 ]] --[[ Name: VoidSliceStart ]]
    -- upvalues: l_Lighting_0 (copy), l_TweenService_0 (copy), l_AnimHelper_0 (copy), l_Workspace_1 (copy), l_SoundHelper_0 (copy), v33 (copy), l_LocalPlayer_0 (copy)
    local l_Character_34 = ({
        Character = v2034[2]
    }).Character;
    local l_Humanoid_23 = l_Character_34:FindFirstChild("Humanoid");
    local l_ColorCorrectionEffect_11 = Instance.new("ColorCorrectionEffect");
    l_ColorCorrectionEffect_11.Brightness = 0;
    l_ColorCorrectionEffect_11.Contrast = 0;
    l_ColorCorrectionEffect_11.Saturation = 0;
    l_ColorCorrectionEffect_11.Name = "VoidTensho";
    l_ColorCorrectionEffect_11.Parent = l_Lighting_0;
    local v2038 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    l_TweenService_0:Create(l_ColorCorrectionEffect_11, v2038, {
        Saturation = -0.4, 
        Contrast = 0.65
    }):Play();
    task.delay(5, function() --[[ Line: 10094 ]]
        -- upvalues: l_ColorCorrectionEffect_11 (copy)
        if l_ColorCorrectionEffect_11 then
            l_ColorCorrectionEffect_11:Destroy();
        end;
    end);
    local v2039 = {
        Priority = Enum.AnimationPriority.Action, 
        Animator = l_Humanoid_23:FindFirstChild("Animator") or l_Humanoid_23, 
        AnimId = 79280404349017, 
        NameFade = 0.3, 
        FadeIn = 0.6, 
        Weight = 1000, 
        Name = "Server"
    };
    local _ = l_AnimHelper_0:CreateAnim(v2039);
    v2039.AnimId = 114714169089279;
    local _ = l_AnimHelper_0:CreateAnim(v2039);
    v2039.Priority = Enum.AnimationPriority.Action3;
    v2039.AnimId = 79280404349017;
    local _ = l_AnimHelper_0:CreateAnim(v2039);
    v2039.NameFade = 0.1;
    v2039.FadeIn = 0.1;
    local l_CurrentCamera_8 = l_Workspace_1.CurrentCamera;
    l_TweenService_0:Create(l_CurrentCamera_8, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        FieldOfView = 65
    }):Play();
    local v2044 = l_Character_34 and workspace.Welds:FindFirstChild(l_Character_34.Name);
    local l_Sageo_3 = (v2044 and v2044:WaitForChild("WeldCharacter", 10) or l_Character_34):FindFirstChild("Sageo");
    if l_Sageo_3 then
        local v2046 = {};
        for _, v2048 in script.VoidKatanaAura:GetChildren() do
            local v2049 = v2048:Clone();
            v2049.Parent = l_Sageo_3.Main;
            if l_Character_34:GetAttribute("Raiden") then
                v2049.Color = ColorSequence.new(Color3.fromRGB(39, 89, 255));
            end;
            v2049:Emit(1);
            table.insert(v2046, v2049);
        end;
        local l_v2046_0 = v2046 --[[ copy: 14 -> 22 ]];
        task.delay(0.5, function() --[[ Line: 10145 ]]
            -- upvalues: l_v2046_0 (copy)
            for _, v2052 in l_v2046_0 do
                v2052.LockedToPart = false;
            end;
            task.wait(1);
            for _, v2054 in l_v2046_0 do
                v2054.Enabled = false;
            end;
            task.wait(5);
            for _, v2056 in l_v2046_0 do
                v2056:Destroy();
            end;
        end);
    end;
    l_SoundHelper_0:PlaySound({
        Parent = l_Character_34, 
        Name = "VoidUnequip", 
        Volume = 0.2, 
        Speed = 0.7
    });
    task.defer(function() --[[ Line: 10169 ]]
        -- upvalues: v33 (ref)
        v33.CameraShake({
            Preset = "LightHit", 
            WaitTime = 0.5, 
            Fade = 0.5
        });
    end);
    task.delay(0.75, function() --[[ Line: 10177 ]]
        -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_8 (copy), l_ColorCorrectionEffect_11 (copy), v2038 (copy), v33 (ref)
        l_TweenService_0:Create(l_CurrentCamera_8, TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            FieldOfView = 60
        }):Play();
        l_TweenService_0:Create(l_ColorCorrectionEffect_11, v2038, {
            Saturation = -0.6, 
            Contrast = 0.8
        }):Play();
        task.defer(function() --[[ Line: 10181 ]]
            -- upvalues: v33 (ref)
            v33.CameraShake({
                Preset = "Hawk3", 
                WaitTime = 0.5, 
                Fade = 0.5
            });
        end);
    end);
    local v2057 = CFrame.new(0, -l_Character_34.PrimaryPart.Size.Y * 1.4, -2.2) * CFrame.Angles(0, -1.5707963267948966, 0);
    local l_Value_9 = GetOccupied(l_Character_34).Target.Value;
    local v2059 = script.VoidMoves.SliceTelegraph:Clone();
    v2059.CFrame = CFrame.new(l_Character_34.PrimaryPart.Position, l_Character_34.PrimaryPart.Position + l_Value_9) * v2057;
    v2059.Name = "SliceTelegraph" .. l_Character_34.Name;
    v2059.Parent = l_Workspace_1.Debris;
    v2059["2"].Position = v2059["1"].Position;
    local v2060 = Vector3.new(-32, 0, v2059["1"].Position.Z);
    l_TweenService_0:Create(v2059["2"], TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Position = v2060
    }):Play();
    local _ = GetCharacterData(l_Character_34).Opponent.Value;
    local _ = l_LocalPlayer_0.Character;
    task.delay(10, function() --[[ Line: 10236 ]]
        -- upvalues: v2059 (copy)
        if v2059 then
            v2059:Destroy();
        end;
    end);
end;
v33.VoidSlice = function(v2063) --[[ Line: 10241 ]] --[[ Name: VoidSlice ]]
    -- upvalues: l_Workspace_1 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), v33 (copy), v23 (copy), l_LocalPlayer_0 (copy)
    local v2064 = {
        Character = v2063[2], 
        SliceEndLag = v2063[3], 
        LookVector = v2063[4], 
        EndPosition = v2063[5], 
        DistanceMult = v2063[6]
    };
    local l_Character_36 = v2064.Character;
    local l_Humanoid_24 = l_Character_36:FindFirstChild("Humanoid");
    local l_FirstChild_28 = l_Workspace_1.Debris:FindFirstChild("SliceTelegraph" .. l_Character_36.Name);
    if l_FirstChild_28 then
        for _, v2069 in l_FirstChild_28:GetDescendants() do
            if v2069:IsA("Beam") then
                local v2070 = l_TweenService_0:Create(v2069, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Width0 = 0, 
                    Width1 = 0
                });
                v2070:Play();
                v2070.Completed:Connect(function() --[[ Line: 10254 ]]
                    -- upvalues: l_FirstChild_28 (copy)
                    l_FirstChild_28:Destroy();
                end);
            end;
        end;
    end;
    for _, v2072 in l_Lighting_0:GetChildren() do
        if v2072.Name == "VoidTensho" then
            v2072:Destroy();
        end;
    end;
    local v2073 = {
        Priority = Enum.AnimationPriority.Action, 
        Animator = l_Humanoid_24:FindFirstChild("Animator") or l_Humanoid_24, 
        AnimId = 114714169089279, 
        NameFade = 0.1, 
        FadeIn = 0.1, 
        Weight = 1000, 
        Name = "Server"
    };
    local _ = l_AnimHelper_0:CreateAnim(v2073);
    l_SoundHelper_0:PlaySound({
        Parent = l_Character_36, 
        Name = "VoidEquip", 
        Volume = 0.2, 
        Speed = 0.7
    });
    v33.HUDShake({
        Scale = 10, 
        Damper = 0.09999999999999999
    });
    task.defer(function() --[[ Line: 10286 ]]
        -- upvalues: v33 (ref)
        v33.CameraShake({
            Preset = "SuperHardHit", 
            WaitTime = 0.5, 
            Fade = 1.3
        });
    end);
    task.defer(function() --[[ Line: 10294 ]]
        -- upvalues: v33 (ref)
        v33.CameraShake({
            Preset = "HardHitRoll", 
            WaitTime = 0.1, 
            Fade = 0.6
        });
    end);
    local l_CurrentCamera_9 = l_Workspace_1.CurrentCamera;
    l_TweenService_0:Create(l_CurrentCamera_9, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        FieldOfView = 75
    }):Play();
    l_SoundHelper_0:PlaySound({
        Parent = l_Character_36, 
        Name = "VoidBurst"
    });
    local l_Magnitude_1 = (l_Character_36.PrimaryPart.Position - v2064.EndPosition).Magnitude;
    local v2077 = l_Magnitude_1 / v2064.DistanceMult - l_Magnitude_1 + 10;
    local v2078 = script.VoidMoves.SliceEffect:Clone();
    v2078.Parent = workspace.Debris;
    v2078.CFrame = l_Character_36.HumanoidRootPart.CFrame;
    game.Debris:AddItem(v2078, 2);
    local v2079 = script.VoidMoves.SliceMain:Clone();
    v2079.Parent = workspace.Debris;
    v2079:PivotTo(l_Character_36.HumanoidRootPart.CFrame * CFrame.new(0, -1.5, v2077));
    game.Debris:AddItem(v2079, 10);
    local l_l_Character_36_Attribute_0 = l_Character_36:GetAttribute("Raiden");
    for _, v2082 in v2079:GetDescendants() do
        if v2082:IsA("ParticleEmitter") or v2082:IsA("Beam") or v2082:IsA("Trail") then
            v2082.Enabled = false;
            if l_l_Character_36_Attribute_0 then
                v2082.Color = ColorSequence.new(Color3.fromRGB(43, 135, 255));
            end;
        end;
    end;
    local v2083 = {
        workspace.Live, 
        workspace.Debris
    };
    for _, v2085 in workspace.Rings:GetChildren() do
        local l_Hitboxes_0 = v2085:FindFirstChild("Hitboxes");
        if l_Hitboxes_0 then
            local l_Main_6 = l_Hitboxes_0:WaitForChild("Main");
            if l_Main_6 then
                table.insert(v2083, l_Main_6);
            end;
        end;
    end;
    local v2088 = RaycastParams.new();
    v2088.FilterDescendantsInstances = v2083;
    v2088.FilterType = Enum.RaycastFilterType.Exclude;
    v2088.IgnoreWater = true;
    local v2089 = workspace:Raycast(l_Character_36.HumanoidRootPart.Position, Vector3.new(-0, -10, -0, -0), v2088);
    local l_Value_11 = GetOccupied(l_Character_36).Target.Value;
    local _ = require(script.RockModule);
    if v2089 then
        local _ = CFrame.lookAt(v2078.RockStart.WorldPosition, v2078.RockStart.WorldPosition + l_Value_11) * CFrame.new(0, 0, 2);
        task.spawn(v23.Explode, v2078.Position, {
            Rocks = 6, 
            SizeMagnitude = 1, 
            HorizontalVelocity = 40, 
            VerticalVelocity = 60, 
            Lifespan = 3, 
            MaxDistance = 5, 
            RaycastProperties = true
        });
    end;
    if l_LocalPlayer_0.Character == l_Character_36 or l_Character_36:GetAttribute("ActiveNPC") then
        task.defer(function() --[[ Line: 10406 ]]
            -- upvalues: v2064 (copy), l_Character_36 (copy), l_Value_11 (copy)
            local v2093 = tick();
            local v2094 = 0.1 * v2064.DistanceMult;
            local v2095 = 0;
            while v2095 < 1 do
                v2095 = math.clamp((tick() - v2093) / v2094, 0, 1);
                local l_Position_21 = l_Character_36.HumanoidRootPart.Position;
                local v2097 = l_Position_21 + (v2064.EndPosition - l_Position_21) * v2095;
                l_Character_36:SetPrimaryPartCFrame(CFrame.lookAt(v2097, v2097 + l_Value_11));
                task.wait(0.016666666666666666);
            end;
        end);
    end;
    l_Character_36:SetPrimaryPartCFrame(CFrame.lookAt(v2064.EndPosition, v2064.EndPosition + l_Value_11));
    v23.Emit(v2079);
    local _ = GetOccupied(l_Character_36);
    task.wait(v2064.SliceEndLag);
    v2078.Anchored = true;
end;
v33.VoidTeleport = function(v2099) --[[ Line: 10434 ]] --[[ Name: VoidTeleport ]]
    -- upvalues: l_LocalPlayer_0 (copy), v33 (copy), v34 (copy), l_Bezier_0 (copy), l_RunService_0 (copy), l_TweenService_0 (copy)
    local v2100 = {
        Character = v2099[2], 
        EndPosition = v2099[3], 
        LookTarget = v2099[4]
    };
    local l_Character_37 = v2100.Character;
    local l_LookTarget_0 = v2100.LookTarget;
    local l_EndPosition_0 = v2100.EndPosition;
    if l_LocalPlayer_0.Character == l_Character_37 or l_Character_37:GetAttribute("ActiveNPC") then
        v33.SetTransparency(l_Character_37, 1);
        local v2104 = os.clock();
        local v2105 = CFrame.new(v34:NextNumber(-8.1, 8.1), v34:NextNumber(0, 0), 0);
        local _ = v34:NextInteger(0, 1) == 1;
        local l_Position_22 = l_Character_37.PrimaryPart.Position;
        local l_Position_23 = (CFrame.lookAt((l_Position_22 + l_EndPosition_0) / 2, l_EndPosition_0) * v2105).Position;
        local v2109 = l_Bezier_0.new(l_Position_22, l_Position_23, l_EndPosition_0);
        local v2110 = {};
        for _, v2112 in {
            l_Character_37:GetDescendants(), 
            v33.GetWeldCharacter(l_Character_37):GetDescendants()
        } do
            for _, v2114 in v2112 do
                if v2114:IsA("BasePart") then
                    v2110[v2114] = v2114.CollisionGroup;
                    v2114.CollisionGroup = "Fighting";
                end;
            end;
        end;
        l_RunService_0:BindToRenderStep("VoidTeleport", 1, function() --[[ Line: 10469 ]]
            -- upvalues: v2104 (copy), l_TweenService_0 (ref), v2109 (copy), l_Character_37 (copy), l_LookTarget_0 (copy)
            local v2115 = 0;
            v2115 = math.clamp((os.clock() - v2104) / 0.5, 0, 1);
            local l_l_TweenService_0_Value_6 = l_TweenService_0:GetValue(v2115, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
            local v2117 = CFrame.lookAt(v2109:Get(l_l_TweenService_0_Value_6 - 0.01), v2109:Get(l_l_TweenService_0_Value_6));
            l_Character_37:PivotTo(CFrame.lookAt(v2117.Position, l_LookTarget_0));
        end);
        task.wait(0.5);
        v33.SetTransparency(l_Character_37, 0);
        for v2118, v2119 in v2110 do
            v2118.CollisionGroup = v2119;
        end;
        l_RunService_0:UnbindFromRenderStep("VoidTeleport");
    end;
end;
v33.VoidTransition = function(v2120) --[[ Line: 10492 ]] --[[ Name: VoidTransition ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Lighting_0 (copy), l_Common_0 (copy), l_ReplicatedStorage_0 (copy), l_Workspace_1 (copy), l_Main_0 (copy), v33 (copy)
    local l_Character_38 = l_LocalPlayer_0.Character;
    local v2122 = v2120[2];
    local v2123 = TweenInfo.new(2.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In);
    l_TweenService_0:Create(workspace.CurrentCamera, v2123, {
        FieldOfView = 10
    }):Play();
    local _ = l_SoundHelper_0:PlaySound({
        Name = "Ultimate", 
        SoundId = 1841313956, 
        Parent = l_Character_38, 
        Speed = 1, 
        Volume = 1
    });
    local v2125 = Instance.new("BloomEffect", l_Lighting_0);
    v2125.Name = "Teleport";
    v2125.Intensity = 0;
    v2125.Size = 0;
    v2125.Threshold = 4;
    local v2126 = TweenInfo.new(1.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, true, 1.6);
    local _ = TweenInfo.new(6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Visible = true;
    l_Frame_0.Parent = l_Common_0;
    l_TweenService_0:Create(l_Frame_0, v2126, {
        BackgroundTransparency = 0
    }):Play();
    l_TweenService_0:Create(v2125, v2126, {
        Intensity = 5, 
        Size = 25, 
        Threshold = 0
    }):Play();
    l_TweenService_0:Create(l_Lighting_0, v2126, {
        ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.2
    }):Play();
    game.Debris:AddItem(v2125, 15);
    game.Debris:AddItem(l_Frame_0, 15);
    local v2129 = l_ReplicatedStorage_0.Maps:FindFirstChild("m_Void") or l_Workspace_1.MapCache:FindFirstChild("m_Void");
    if not v2129 then
        return;
    else
        v2129 = v2129:Clone();
        v2129.PrimaryPart = v2129.Ring.Keypoints.Centre;
        v2129:PivotTo(v2122);
        v2129.Parent = l_Workspace_1.Debris;
        v2129.Ring:Destroy();
        for _, v2131 in v2129:GetDescendants() do
            if v2131:IsA("ParticleEmitter") then
                v2131.Speed = NumberRange.new(130, 170);
                v2131.Lifetime = NumberRange.new(v2131.Lifetime.Min / 1.5, v2131.Lifetime.Max / 1.5);
                v2131:Emit(v2131.Rate * 4);
            end;
        end;
        task.wait(2.5);
        workspace.CurrentCamera.FieldOfView = 10;
        GetOccupied(l_LocalPlayer_0.Character).Equipped.Value = false;
        l_Main_0.Enabled = false;
        l_Common_0.Enabled = false;
        local v2132 = GetCharacterData(l_LocalPlayer_0.Character);
        local v2133 = nil;
        v2133 = v2132.Opponent.Changed:Connect(function(_) --[[ Line: 10566 ]]
            -- upvalues: v2133 (ref), l_Main_0 (ref), l_Common_0 (ref)
            v2133:Disconnect();
            l_Main_0.Enabled = true;
            l_Common_0.Enabled = true;
        end);
        task.defer(function() --[[ Line: 10573 ]]
            -- upvalues: v33 (ref)
            v33.CameraShake({
                Preset = "SuperHardHit", 
                WaitTime = 4, 
                Fade = 9
            });
        end);
        l_SoundHelper_0:PlaySound({
            Name = "SFX", 
            Parent = l_Workspace_1, 
            DirectCopy = script.VoidMoves.EnterTheVoid
        });
        task.wait(1);
        for _, v2136 in v2129:GetDescendants() do
            if v2136:IsA("ParticleEmitter") then
                v2136.Speed = NumberRange.new(3, 6);
                v2136.Lifetime = NumberRange.new(v2136.Lifetime.Min * 1.5, v2136.Lifetime.Max * 1.5);
            end;
        end;
        return;
    end;
end;
v33.GlassScreen = function() --[[ Line: 10595 ]] --[[ Name: GlassScreen ]]
    -- upvalues: l_TweenService_0 (copy)
    task.spawn(function() --[[ Line: 10596 ]]
        -- upvalues: l_TweenService_0 (ref)
        local v2137 = require(script.ScreenSpace);
        if not game.Players.LocalPlayer.Character then
            return;
        else
            local v2138 = v2137.ViewSizeX();
            local v2139 = v2137.ViewSizeY();
            local v2140 = Random.new();
            local v2141 = {};
            local v2142 = {};
            local v2143 = script.Glass:Clone();
            v2143.Parent = game.Workspace;
            local l_PrimaryPart_0 = v2143.PrimaryPart;
            for _, v2146 in v2143:GetChildren() do
                if v2146.Name ~= "Main" then
                    v2141[v2146] = Vector3.new(v2146.Position.X - l_PrimaryPart_0.Position.X, 0, l_PrimaryPart_0.Position.Y - v2146.Position.Y);
                    v2142[v2146] = Vector3.new(v2146.Size.X / l_PrimaryPart_0.Size.X, 0, v2146.Size.Z / l_PrimaryPart_0.Size.Z);
                end;
            end;
            local v2147 = v2137.ScreenWidthToWorldWidth(v2138, -5);
            local v2148 = v2137.ScreenHeightToWorldHeight(v2139, -5);
            local l_Size_12 = l_PrimaryPart_0.Size;
            v2143:SetPrimaryPartCFrame(workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -5) * CFrame.Angles(1.5707963267948966, 0, 0));
            v2143.PrimaryPart.Size = Vector3.new(v2147, 1, v2148);
            local l_Size_13 = l_PrimaryPart_0.Size;
            local v2151 = {};
            for _, v2153 in v2143:GetChildren() do
                if v2153.Name ~= "Main" then
                    v2153.Size = Vector3.new(v2147, 1, v2148) * v2142[v2153];
                    v2153.CFrame = l_PrimaryPart_0.CFrame * CFrame.new(Vector3.new(v2141[v2153].X, 0, -v2141[v2153].Z) * (l_Size_13 / l_Size_12));
                    v2151[v2153] = CFrame.Angles(v2140:NextNumber(-0.1, 0.1), v2140:NextNumber(-0.1, 0.1), v2140:NextNumber(-0.1, 0.1)) * CFrame.new((Vector3.new(v2140:NextNumber(-3, 3), v2140:NextNumber(-1, 1), (v2140:NextNumber(-3, 3)))));
                end;
            end;
            local v2154 = tick();
            while tick() - v2154 < 0.9 do
                v2143:SetPrimaryPartCFrame(workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -5) * CFrame.Angles(1.5707963267948966, 0, 0));
                for _, v2156 in v2143:GetChildren() do
                    if v2156.Name ~= "Main" then
                        local v2157 = l_PrimaryPart_0.CFrame * CFrame.new(Vector3.new(v2141[v2156].X, 0, -v2141[v2156].Z) * (l_Size_13 / l_Size_12));
                        local v2158 = math.min(1, (tick() - v2154) / 0.9);
                        v2156.CFrame = v2157:Lerp(v2157 * v2151[v2156], l_TweenService_0:GetValue(math.min(1, (tick() - v2154) / 1.8), Enum.EasingStyle.Quint, Enum.EasingDirection.Out));
                        v2156.Transparency = 0.1 + 0.9 * v2158;
                    end;
                end;
            end;
            task.wait(1);
            v2143:Destroy();
            return;
        end;
    end);
end;
v33.ChronosGenericEffect = function(_) --[[ Line: 10702 ]] --[[ Name: ChronosGenericEffect ]]
    -- upvalues: l_Workspace_1 (copy), l_RunService_0 (copy), l_Lighting_0 (copy), v33 (copy), l_TweenService_0 (copy)
    local l_CurrentCamera_10 = l_Workspace_1.CurrentCamera;
    local v2161 = script.EventStartFightParticles:Clone();
    v2161.Parent = l_Workspace_1.Debris;
    local v2162 = nil;
    v2162 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 10708 ]]
        -- upvalues: v2161 (copy), l_CurrentCamera_10 (copy)
        v2161.CFrame = l_CurrentCamera_10.CFrame * CFrame.new(0, 0, -2.8);
    end);
    task.delay(0.1, function() --[[ Line: 10712 ]]
        -- upvalues: v2161 (copy)
        for _, v2164 in v2161.Vortex:GetChildren() do
            v2164:Emit(v2164:GetAttribute("EmitCount"));
        end;
        for _, v2166 in v2161.Current:GetChildren() do
            v2166.Enabled = true;
        end;
    end);
    local l_ColorCorrectionEffect_12 = Instance.new("ColorCorrectionEffect");
    l_ColorCorrectionEffect_12.Brightness = 0;
    l_ColorCorrectionEffect_12.Contrast = 0;
    l_ColorCorrectionEffect_12.Saturation = 0;
    l_ColorCorrectionEffect_12.Parent = l_Lighting_0;
    task.defer(function() --[[ Line: 10728 ]]
        -- upvalues: v33 (ref)
        v33.CameraShake({
            Preset = "SuperHardHit", 
            WaitTime = 0.3, 
            Fade = 0.8
        });
    end);
    l_Workspace_1.FoVMult.Value = 2;
    l_TweenService_0:Create(l_CurrentCamera_10, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        FieldOfView = 70
    }):Play();
    l_TweenService_0:Create(l_ColorCorrectionEffect_12, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Brightness = 0, 
        Contrast = 2, 
        Saturation = -1
    }):Play();
    task.wait(0.3);
    l_TweenService_0:Create(l_ColorCorrectionEffect_12, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Brightness = 0, 
        Contrast = 0.2, 
        Saturation = -0.8
    }):Play();
    l_Workspace_1.FoVMult.Value = 0.5;
    l_TweenService_0:Create(l_CurrentCamera_10, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        FieldOfView = 65
    }):Play();
    l_TweenService_0:Create(l_ColorCorrectionEffect_12, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Brightness = 0, 
        Contrast = 0, 
        Saturation = 0
    }):Play();
    for _, v2169 in v2161.Current:GetChildren() do
        v2169.Enabled = false;
    end;
    task.wait(1);
    l_Workspace_1.FoVMult.Value = 3;
    task.wait(4);
    v2162:Disconnect();
    l_ColorCorrectionEffect_12:Destroy();
    v2161:Destroy();
end;
v33.JoeBurn = function(v2170) --[[ Line: 10780 ]] --[[ Name: JoeBurn ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_AnimHelper_0 (copy), v33 (copy), l_NumberSequenceTween_0 (copy), v23 (copy), l_SoundHelper_0 (copy), l_Workspace_1 (copy), l_TweenService_0 (copy), l_Lighting_0 (copy), v35 (copy), l_RunService_0 (copy), l_Styles_0 (copy), v39 (copy)
    local v2171 = v2170[2];
    local v2172 = v2170[3];
    if not v2171 then
        return;
    else
        local v2173 = true;
        if l_LocalPlayer_0.Character ~= v2171 then
            v2173 = l_LocalPlayer_0.Character == v2172;
        end;
        local l_Humanoid_25 = v2171:FindFirstChild("Humanoid");
        local v2175 = l_Humanoid_25:FindFirstChild("Animator") or l_Humanoid_25;
        local v2176 = {
            Priority = Enum.AnimationPriority.Action, 
            Animator = v2175, 
            AnimId = 128162064705511, 
            NameFade = 0.1, 
            FadeIn = 0.1, 
            Weight = 1000, 
            Name = "Remove", 
            Speed = 1.3, 
            StopInfo = {
                StopDelay = 0.25, 
                StopTime = 0.25
            }
        };
        local v2177 = GetCharacterData(v2171);
        if not v2177 then
            return;
        else
            v2177.CanWalk.Value = false;
            v2171:SetAttribute("JoeBurnTransition", true);
            task.delay(0.4, function() --[[ Line: 10821 ]]
                -- upvalues: v2177 (copy), v2171 (copy)
                v2177.CanWalk.Value = true;
                v2171:SetAttribute("JoeBurnTransition", nil);
            end);
            l_AnimHelper_0:CreateAnim(v2176);
            local l_JoeStyle_0 = script.JoeStyle;
            local l_Aura_0 = l_JoeStyle_0.Aura;
            local v2180 = {};
            for _, v2182 in v33.GetWeldCharacter(v2171):GetChildren() do
                if v2182.Name ~= "HumanoidRootPart" and (v2182:IsA("MeshPart") or v2182:IsA("BasePart")) then
                    for _, v2184 in l_Aura_0:GetChildren() do
                        if v2184:IsA("ParticleEmitter") then
                            local v2185 = v2184:Clone();
                            v2185.Name = "JoeParticle";
                            v2185.Parent = v2182;
                            l_NumberSequenceTween_0.Tween(v2185, 20, 0.25);
                            table.insert(v2180, v2185);
                        end;
                    end;
                end;
            end;
            local v2186 = l_JoeStyle_0.JoeBurnStart:Clone();
            local v2187 = v33.GetMapParams();
            v2186.Parent = workspace.Debris;
            game.Debris:AddItem(v2186, 8);
            local v2188 = workspace:Raycast(v2171.UpperTorso.Position, Vector3.new(-0, -10, -0, -0), v2187);
            if v2188 then
                local v2189 = v23.GetRaySurface(v2188);
                local l_CFrame_2 = v2171.HumanoidRootPart.CFrame;
                v2186.CFrame = CFrame.new(v2189.Position + Vector3.new(0, 0.10000000149011612, 0, 0), l_CFrame_2 * CFrame.new(0, 0, -40000).Position);
            end;
            v23.Emit(v2186);
            l_SoundHelper_0:PlaySound({
                Name = "JoeBurnStart", 
                Parent = v2173 and workspace.Debris or v2171
            });
            l_SoundHelper_0:PlaySound({
                Name = "JoeBurnExplosion", 
                Parent = v2173 and workspace.Debris or v2171
            });
            local l_CurrentCamera_11 = l_Workspace_1.CurrentCamera;
            if v2173 then
                v33.HUDShake({
                    Scale = 10, 
                    Damper = 0.09999999999999999
                });
                task.defer(function() --[[ Line: 10885 ]]
                    -- upvalues: v33 (ref)
                    v33.CreateImpactFrame({
                        Time = 0.1
                    });
                end);
                task.spawn(function() --[[ Line: 10891 ]]
                    -- upvalues: v33 (ref)
                    v33.CameraShake({
                        Preset = "SuperHardHit", 
                        WaitTime = 0.3, 
                        Fade = 0.9, 
                        FoVMult = 1
                    });
                end);
                l_TweenService_0:Create(l_CurrentCamera_11, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FieldOfView = 60
                }):Play();
                l_Workspace_1:SetAttribute("JoeBurnVolumeOverride", l_Workspace_1:GetAttribute("VolumeOverride"));
                if not v2171:GetAttribute("ActiveNPC") then
                    l_Workspace_1:SetAttribute("VolumeOverride", 0);
                end;
            end;
            local _ = tick();
            local v2193 = nil;
            local v2194 = {};
            local v2195 = nil;
            local v2196 = nil;
            local v2197 = nil;
            local v2198 = nil;
            if v2173 and (l_Workspace_1:GetAttribute("BurnChanges") or 0) <= 0 then
                v2197 = l_JoeStyle_0.JoeFloor:Clone();
                v2197.Parent = workspace.Debris;
                if v2177.Centre.Value then
                    v2197.Anchored = true;
                    v2197.CFrame = v2177.Centre.Value.CFrame * CFrame.new(0, -1, 0);
                else
                    v2197.CFrame = l_LocalPlayer_0.Character.PrimaryPart.CFrame + l_LocalPlayer_0.Character.PrimaryPart.CFrame.UpVector * -2.998;
                    v2197.Weld.Part1 = l_LocalPlayer_0.Character.PrimaryPart;
                end;
                for _, v2200 in v2197:GetDescendants() do
                    if v2200:IsA("ParticleEmitter") then
                        l_TweenService_0:Create(v2200, TweenInfo.new(2), {
                            TimeScale = 0.1
                        }):Play();
                    end;
                end;
                local v2201 = v33.GetAtmosphere();
                if v2201 then
                    local l_Folder_2 = Instance.new("Folder");
                    l_Folder_2.Name = "CachedAtmosphere";
                    l_Folder_2.Parent = l_Lighting_0;
                    v2201.Parent = l_Folder_2;
                end;
                v35[v2171.Name] = {
                    ModifiedLighting = {
                        ExposureCompensation = 0.6, 
                        Ambient = Color3.new(0, 0, 0), 
                        OutdoorAmbient = Color3.new(0.435294, 0.568627, 0.686275), 
                        EnvironmentDiffuseScale = 0.1, 
                        EnvironmentSpecularScale = 0.4, 
                        Brightness = 0, 
                        FogColor = Color3.fromRGB(0, 0, 0), 
                        FogEnd = 100, 
                        FogStart = 0
                    }
                };
                v2196 = l_SoundHelper_0:PlaySound({
                    Name = "FireMedLoop", 
                    Parent = workspace.Debris, 
                    Looped = true
                });
                local l_Volume_2 = v2196.Volume;
                v2194[#v2194 + 1] = v2177.Cutscene.Changed:Connect(function(v2204) --[[ Line: 10981 ]]
                    -- upvalues: l_TweenService_0 (ref), v2196 (ref), l_Volume_2 (copy)
                    l_TweenService_0:Create(v2196, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Volume = v2204 and 0 or l_Volume_2
                    }):Play();
                end);
                v2193 = l_JoeStyle_0.BurnVHS:Clone();
                v2193.Parent = l_LocalPlayer_0.PlayerGui;
                l_TweenService_0:Create(v2193.CanvasGroup, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    GroupTransparency = 0.33
                }):Play();
                local _ = task.defer(function() --[[ Line: 10989 ]]
                    -- upvalues: v2193 (ref), v2194 (copy), l_RunService_0 (ref)
                    local l_MainFrame_0 = v2193.CanvasGroup.MainFrame;
                    v2194[#v2194 + 1] = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 10991 ]]
                        -- upvalues: l_MainFrame_0 (copy)
                        if not l_MainFrame_0:FindFirstChild("Lines") then
                            return;
                        else
                            l_MainFrame_0.Lines.Position = UDim2.new(math.random(-1125, 125) / 1000, 0, 0, 0);
                            l_MainFrame_0.Static.Position = UDim2.new(-math.random(20, 80) / 100, 0, -math.random(20, 80) / 100, 0);
                            return;
                        end;
                    end);
                end);
                local v2207 = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                v2195 = l_JoeStyle_0.Domain:Clone();
                v2195.Parent = workspace.Debris;
                v2194[#v2194 + 1] = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 11006 ]]
                    -- upvalues: v2195 (ref), l_CurrentCamera_11 (copy)
                    v2195.CFrame = l_CurrentCamera_11.CFrame;
                end);
                l_Lighting_0.FogColor = Color3.fromRGB(0, 0, 0);
                l_Lighting_0.FogEnd = 1000;
                l_Lighting_0.FogStart = 0;
                l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    FogEnd = 100, 
                    FogStart = 0
                }):Play();
                local v2208 = l_Lighting_0:FindFirstChild("BurnColorCorrection") or Instance.new("ColorCorrectionEffect");
                v2208.Name = "BurnColorCorrection";
                v2208.Saturation = 0;
                v2208.Contrast = 0;
                v2208.Enabled = true;
                v2208.Parent = l_Lighting_0;
                l_TweenService_0:Create(v2208, v2207, {
                    Contrast = 0.1, 
                    Saturation = -0.35, 
                    TintColor = Color3.fromRGB(176, 221, 255)
                }):Play();
                l_Workspace_1.Exposure.Value = 0.6;
                l_TweenService_0:Create(l_Lighting_0, v2207, {
                    ExposureCompensation = l_Workspace_1.Exposure.Value, 
                    Ambient = Color3.new(0, 0, 0), 
                    OutdoorAmbient = Color3.new(0.435294, 0.568627, 0.686275), 
                    EnvironmentDiffuseScale = 0.1, 
                    EnvironmentSpecularScale = 0.4, 
                    Brightness = 0
                }):Play();
            end;
            if v2173 then
                workspace:SetAttribute("BurnChanges", (workspace:GetAttribute("BurnChanges") or 0) + 1);
                v2198 = Instance.new("PointLight", v2171.HumanoidRootPart);
                v2198.Color = Color3.new(0.529412, 0.756863, 1);
                local v2209 = GetCharacterData(v2172);
                local l_WearoutToDisableBackdash_0 = l_Styles_0.JoeBurn.WearoutInfo.WearoutToDisableBackdash;
                if v2209 then
                    local v2211 = false;
                    do
                        local l_v2211_0 = v2211;
                        v2194[#v2194 + 1] = v2209.Wearout.Changed:Connect(function(v2213) --[[ Line: 11056 ]]
                            -- upvalues: l_v2211_0 (ref), l_WearoutToDisableBackdash_0 (copy), l_JoeStyle_0 (copy), l_LocalPlayer_0 (ref), v2171 (copy)
                            if l_v2211_0 then
                                return;
                            elseif v2213 < l_WearoutToDisableBackdash_0 then
                                return;
                            else
                                l_v2211_0 = true;
                                local v2214 = l_JoeStyle_0.BackdashDisabled:Clone();
                                if l_LocalPlayer_0.Character == v2171 then
                                    v2214.Frame.BottomText.Text = "FOR YOUR ENEMY...";
                                end;
                                v2214.Parent = l_LocalPlayer_0.PlayerGui;
                                task.delay(6, function() --[[ Line: 11069 ]]
                                    -- upvalues: v2214 (copy)
                                    if v2214 then
                                        v2214:Destroy();
                                    end;
                                end);
                                return;
                            end;
                        end);
                    end;
                end;
            end;
            local function v2228() --[[ Line: 11076 ]] --[[ Name: Reset ]]
                -- upvalues: v2194 (copy), v2173 (copy), v2195 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), v2172 (copy), v39 (ref), v35 (ref), l_Workspace_1 (ref), v33 (ref), v2171 (copy), l_CurrentCamera_11 (copy), v2193 (ref), v2180 (copy), v2198 (ref), v2197 (ref), l_SoundHelper_0 (ref), v2196 (ref)
                for _, v2216 in v2194 do
                    v2216:Disconnect();
                end;
                if v2173 then
                    workspace:SetAttribute("BurnChanges", (workspace:GetAttribute("BurnChanges") or 1) - 1);
                end;
                if v2173 and workspace:GetAttribute("BurnChanges") == 0 then
                    local v2217 = false;
                    if v2195 then
                        v2195:Destroy();
                    end;
                    local l_BurnColorCorrection_0 = l_Lighting_0:FindFirstChild("BurnColorCorrection");
                    if l_BurnColorCorrection_0 then
                        l_TweenService_0:Create(l_BurnColorCorrection_0, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            Contrast = 0, 
                            Saturation = 0, 
                            TintColor = Color3.fromRGB(255, 255, 255)
                        }):Play();
                    end;
                    if v2172 and v39(v2172) and v35[v2172.Name] and next(v35[v2172.Name]) ~= nil then
                        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v35[v2172.Name].ModifiedLighting):Play();
                        l_Workspace_1.Exposure.Value = v35[v2172.Name].ModifiedLighting.ExposureCompensation;
                        l_TweenService_0:Create(l_Lighting_0, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            ExposureCompensation = l_Workspace_1.Exposure.Value
                        }):Play();
                        v2217 = true;
                    end;
                    if not v2217 or not v2172 or v2172 and not v39(v2172) then
                        v33.RestoreCachedLighting(v2171);
                        v33.GetAtmosphere();
                    end;
                    v35[v2171.Name] = {};
                    if v2172 and not v35[v2172.Name] or v35[v2172.Name] and next(v35[v2172.Name]) == nil or not v2172 then
                        v33.GetAtmosphere();
                    end;
                    for _, v2220 in workspace.Debris:GetChildren() do
                        if v2220.Name == "Domain" and l_Lighting_0:FindFirstChildWhichIsA("Atmosphere") then
                            v2220:Destroy();
                        end;
                    end;
                    l_Workspace_1:SetAttribute("VolumeOverride", l_Workspace_1:GetAttribute("JoeBurnVolumeOverride"));
                end;
                if v2173 then
                    v33.HUDShake({
                        Scale = 10, 
                        Damper = 0.09999999999999999
                    });
                    task.defer(function() --[[ Line: 11146 ]]
                        -- upvalues: v33 (ref)
                        v33.CreateImpactFrame({
                            Time = 0.1
                        });
                    end);
                    if not v2171:GetAttribute("PerformingUltimate") then
                        task.spawn(function() --[[ Line: 11153 ]]
                            -- upvalues: v33 (ref)
                            v33.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.3, 
                                Fade = 0.8, 
                                FoVMult = 1
                            });
                        end);
                        l_TweenService_0:Create(l_CurrentCamera_11, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            FieldOfView = 75
                        }):Play();
                    end;
                end;
                if v2193 then
                    l_TweenService_0:Create(v2193.CanvasGroup, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        GroupTransparency = 1
                    }):Play();
                    task.delay(3, function() --[[ Line: 11169 ]]
                        -- upvalues: v2193 (ref)
                        v2193:Destroy();
                    end);
                end;
                for _, v2222 in v2180 do
                    if v2222:IsA("ParticleEmitter") then
                        v2222.Enabled = false;
                    elseif v2222:IsA("BasePart") then
                        for _, v2224 in v2222:GetDescendants() do
                            if v2224:IsA("ParticleEmitter") then
                                v2224.TimeScale = 0.8;
                                v2224.Enabled = false;
                            end;
                        end;
                    end;
                end;
                if v2198 then
                    v2198:Destroy();
                end;
                if v2197 then
                    v2197:Destroy();
                end;
                task.delay(5, function() --[[ Line: 11191 ]]
                    -- upvalues: v2180 (ref)
                    for _, v2226 in v2180 do
                        v2226:Destroy();
                    end;
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "DempseyStart", 
                    Parent = v2173 and workspace.Debris or v2171.PrimaryPart, 
                    Speed = 0.88
                });
                local v2227 = l_SoundHelper_0:PlaySound({
                    Name = "JoeBurnEnd", 
                    Parent = v2173 and workspace.Debris or v2171
                });
                task.delay(0.8, function() --[[ Line: 11209 ]]
                    -- upvalues: v2196 (ref), l_TweenService_0 (ref), v2227 (copy)
                    if v2196 then
                        l_TweenService_0:Create(v2196, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            Volume = 0
                        }):Play();
                    end;
                    l_TweenService_0:Create(v2227, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        Volume = 0
                    }):Play();
                    task.wait(2);
                    if v2196 then
                        v2196:Destroy();
                    end;
                end);
            end;
            v2194[#v2194 + 1] = v2171:GetAttributeChangedSignal("BurnMode"):Connect(function() --[[ Line: 11218 ]]
                -- upvalues: v2228 (copy)
                v2228();
            end);
            v2194[#v2194 + 1] = v2171.AncestryChanged:Connect(function() --[[ Line: 11222 ]]
                -- upvalues: v2228 (copy)
                v2228();
            end);
            task.wait(5);
            v2186:Destroy();
            return;
        end;
    end;
end;
v33.CoyoteHeavy = function(v2229) --[[ Line: 11230 ]] --[[ Name: CoyoteHeavy ]]
    -- upvalues: l_Workspace_1 (copy), l_LocalPlayer_0 (copy), v33 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), v34 (copy)
    local v2230 = {
        Character = v2229[2], 
        EffectDelay = v2229[3], 
        ExtraEffect = v2229[4], 
        TargetModel = v2229[5]
    };
    local l_ExtraEffect_0 = v2230.ExtraEffect;
    local l_Character_39 = v2230.Character;
    local l_EffectDelay_5 = v2230.EffectDelay;
    local v2234 = GetCharacterData(l_Character_39);
    if not v2234 then
        return;
    else
        local l_FirstChild_29 = l_Workspace_1.Welds:FindFirstChild(v2230.Character.Name);
        local v2236 = l_FirstChild_29 and l_FirstChild_29:FindFirstChild("WeldCharacter") or v2230.Character;
        if not v2236 then
            return;
        else
            local l_v2236_FirstChild_0 = v2236:FindFirstChild(v2230.TargetModel);
            local v2238 = l_v2236_FirstChild_0 and l_v2236_FirstChild_0:FindFirstChild("End");
            if not v2238 then
                return;
            else
                local v2239 = nil;
                local v2240 = false;
                local l_Charge_0 = v2238.Charge;
                if l_ExtraEffect_0.IsMini then
                    l_Charge_0 = v2238.MiniCharge;
                end;
                l_Charge_0 = l_Charge_0:Clone();
                l_Charge_0.Parent = v2238;
                task.delay(l_EffectDelay_5 - 0.4, function() --[[ Line: 11265 ]]
                    -- upvalues: v2240 (ref), v2234 (copy), l_Charge_0 (ref)
                    if v2240 or v2234.Stunned.Value then
                        return;
                    else
                        for _, v2243 in l_Charge_0:GetChildren() do
                            v2243.Enabled = true;
                        end;
                        task.wait(0.3);
                        for _, v2245 in l_Charge_0:GetChildren() do
                            v2245.Enabled = false;
                        end;
                        task.wait(3);
                        if l_Charge_0 then
                            l_Charge_0:Destroy();
                        end;
                        return;
                    end;
                end);
                if v2230.Character ~= l_LocalPlayer_0.Character then
                    l_EffectDelay_5 = l_EffectDelay_5 + 0.1;
                end;
                local l_Part_0 = Instance.new("Part");
                l_Part_0.CanCollide = false;
                l_Part_0.CollisionGroup = "None";
                l_Part_0.Anchored = true;
                l_Part_0.Transparency = 1;
                l_Part_0.Size = Vector3.new(1, 1, 1, 0);
                l_Part_0.CFrame = v2236.PrimaryPart.CFrame;
                l_Part_0.CFrame = l_Part_0.CFrame * l_ExtraEffect_0.CFrameOffset;
                l_Part_0.Orientation = l_Part_0.Orientation + l_ExtraEffect_0.OrientationOffset;
                local _ = l_Part_0.CFrame;
                l_Part_0.CFrame = l_Part_0.CFrame * (CFrame.new(0, 0, l_ExtraEffect_0.IsMini and -2 or 0) * CFrame.Angles(0, -1.5707963267948966, 0));
                l_Part_0.Parent = l_Workspace_1.Debris;
                local l_CFrame_4 = l_Part_0.CFrame;
                l_Part_0.Anchored = false;
                local l_WeldConstraint_1 = Instance.new("WeldConstraint");
                l_WeldConstraint_1.Parent = l_Part_0;
                l_WeldConstraint_1.Part0 = l_Part_0;
                l_WeldConstraint_1.Part1 = v2236.PrimaryPart;
                l_Part_0.CFrame = l_CFrame_4;
                local l_Cero_0 = script.CoyoteStyle.Cero;
                if l_ExtraEffect_0.IsMini then

                end;
                l_Cero_0 = l_Cero_0:Clone();
                l_Cero_0.Name = v2230.Character.Name .. "Hit";
                local _ = function() --[[ Line: 11319 ]] --[[ Name: Terminate ]]
                    -- upvalues: v2240 (ref), l_Charge_0 (ref), l_Cero_0 (ref)
                    v2240 = true;
                    if l_Charge_0 then
                        for _, v2252 in l_Charge_0:GetChildren() do
                            v2252.Enabled = false;
                        end;
                    end;
                    if l_Cero_0 then
                        l_Cero_0:Destroy();
                    end;
                end;
                v2239 = v2234.Stunned.Changed:Connect(function(v2254) --[[ Line: 11331 ]]
                    -- upvalues: v2234 (copy), v2240 (ref), l_Charge_0 (ref), l_Cero_0 (ref)
                    task.wait();
                    if v2234.Stunned.Value ~= v2254 then
                        return;
                    else
                        if v2254 then
                            v2240 = true;
                            if l_Charge_0 then
                                for _, v2256 in l_Charge_0:GetChildren() do
                                    v2256.Enabled = false;
                                end;
                            end;
                            if l_Cero_0 then
                                l_Cero_0:Destroy();
                            end;
                        end;
                        return;
                    end;
                end);
                local v2257 = nil;
                local v2258 = l_LocalPlayer_0.Character == v2230.Character;
                v2257 = v2230.Character:GetAttributeChangedSignal((v2258 and "Local" or "") .. "IsFeinting"):Connect(function() --[[ Line: 11343 ]]
                    -- upvalues: v2230 (copy), v2258 (copy), v2240 (ref), l_Charge_0 (ref), l_Cero_0 (ref)
                    if not v2230.Character:GetAttribute((v2258 and "Local" or "") .. "IsFeinting") then
                        return;
                    else
                        if not v2230.Character:GetAttribute((v2258 and "Local" or "") .. "IsHeavy") then
                            v2240 = true;
                            if l_Charge_0 then
                                for _, v2260 in l_Charge_0:GetChildren() do
                                    v2260.Enabled = false;
                                end;
                            end;
                            if l_Cero_0 then
                                l_Cero_0:Destroy();
                            end;
                        end;
                        return;
                    end;
                end);
                task.delay(1, function() --[[ Line: 11354 ]]
                    -- upvalues: v2257 (ref)
                    v2257:Disconnect();
                end);
                local v2261 = nil;
                local v2262 = 0;
                local l_Character_40 = l_LocalPlayer_0.Character;
                local v2264 = GetOccupied(l_Character_40).LockedOn.Value == v2230.Character;
                v2261 = v2230.Character:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 11365 ]]
                    -- upvalues: l_ExtraEffect_0 (copy), v2264 (copy), v2230 (copy), v2262 (ref), v2240 (ref), v2234 (copy), v2261 (ref), l_Cero_0 (ref), v33 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), v2236 (copy), l_Workspace_1 (ref)
                    if l_ExtraEffect_0.IsMini then
                        return;
                    elseif v2264 then
                        return;
                    else
                        local v2265 = v2230.Character:GetAttribute("LastLanded") or 0;
                        if v2265 < v2262 or v2240 or v2234.Stunned.Value then
                            if v2261 then
                                v2261:Disconnect();
                            end;
                            if l_Cero_0 then
                                l_Cero_0:Destroy();
                            end;
                            return;
                        elseif v2262 > 0 then
                            return;
                        else
                            v2262 = v2265;
                            if not l_ExtraEffect_0.IsMini then
                                task.spawn(function() --[[ Line: 11387 ]]
                                    -- upvalues: v33 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref)
                                    task.spawn(function() --[[ Line: 11388 ]]
                                        -- upvalues: v33 (ref)
                                        v33.CameraShake({
                                            Preset = "MedHit", 
                                            WaitTime = 0.4, 
                                            Fade = 0.5, 
                                            FoV = 68, 
                                            FoVMult = 2
                                        });
                                    end);
                                    local l_ColorCorrection_4 = l_Lighting_0.ColorCorrection;
                                    l_ColorCorrection_4.Saturation = 0;
                                    l_ColorCorrection_4.Contrast = 0;
                                    l_ColorCorrection_4.Enabled = true;
                                    local v2267 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                                    l_TweenService_0:Create(l_ColorCorrection_4, v2267, {
                                        Saturation = 0.1, 
                                        Contrast = 0.1
                                    }):Play();
                                    local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                                    l_MenuBlur_2.Size = 0;
                                    l_MenuBlur_2.Enabled = true;
                                    local v2269 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                                    l_TweenService_0:Create(l_MenuBlur_2, v2269, {
                                        Size = 10
                                    }):Play();
                                end);
                            end;
                            l_Cero_0.CFrame = v2236.PrimaryPart.CFrame * l_ExtraEffect_0.CFrameOffset * CFrame.new(0, -0.3, -0.5);
                            local l_l_Cero_0_0 = l_Cero_0;
                            l_l_Cero_0_0.Orientation = l_l_Cero_0_0.Orientation + l_ExtraEffect_0.OrientationOffset;
                            l_l_Cero_0_0 = l_Cero_0;
                            l_l_Cero_0_0.CFrame = l_l_Cero_0_0.CFrame * CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0);
                            l_Cero_0.Parent = l_Workspace_1.Debris;
                            l_l_Cero_0_0 = l_Cero_0.CFrame;
                            l_Cero_0.Anchored = false;
                            local l_WeldConstraint_2 = Instance.new("WeldConstraint");
                            l_WeldConstraint_2.Parent = l_Cero_0;
                            l_WeldConstraint_2.Part0 = l_Cero_0;
                            l_WeldConstraint_2.Part1 = v2236.PrimaryPart;
                            l_Cero_0.CFrame = l_l_Cero_0_0;
                            local v2272 = 30;
                            local l_WorldPosition_0 = l_Cero_0.End.WorldPosition;
                            local l_End_0 = l_Cero_0.End;
                            l_End_0.Position = l_End_0.Position + Vector3.new(0, -1, 0, 0);
                            l_End_0 = l_Cero_0.End.WorldPosition;
                            l_Cero_0.End.WorldPosition = l_WorldPosition_0;
                            local v2275 = v33.GetMapParams();
                            local v2276 = workspace:Raycast(l_WorldPosition_0, CFrame.lookAt(l_WorldPosition_0, l_End_0).LookVector * 30, v2275);
                            if v2276 then
                                print(v2276.Instance);
                                print(v2276.Instance.Parent);
                            end;
                            v2272 = math.clamp(v2272, 5, 30);
                            l_TweenService_0:Create(l_Cero_0.End, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                Position = Vector3.new(0, -v2272, 0)
                            }):Play();
                            task.wait(v2272 / 30 * 0.1);
                            if not l_Cero_0 then
                                return;
                            else
                                for _, v2278 in l_Cero_0:GetDescendants() do
                                    if v2278:IsA("Beam") then
                                        l_TweenService_0:Create(v2278, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                            Width0 = 0, 
                                            Width1 = 0
                                        }):Play();
                                    end;
                                end;
                                task.wait(0.2);
                                if not l_Cero_0 then
                                    return;
                                else
                                    for _, v2280 in l_Cero_0:GetDescendants() do
                                        if v2280:IsA("ParticleEmitter") then
                                            v2280.Enabled = false;
                                        end;
                                    end;
                                    task.wait(0.2);
                                    if not l_Cero_0 then
                                        return;
                                    else
                                        for _, v2282 in l_Cero_0:GetDescendants() do
                                            if v2282:IsA("Beam") then
                                                v2282:Destroy();
                                            end;
                                        end;
                                        task.wait(2);
                                        if l_Cero_0 then
                                            l_Cero_0:Destroy();
                                        end;
                                        return;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end);
                task.delay(l_EffectDelay_5 + 0.5, function() --[[ Line: 11487 ]]
                    -- upvalues: v2261 (ref), l_Cero_0 (ref), l_Part_0 (copy)
                    if v2261 then
                        v2261:Disconnect();
                    end;
                    task.wait(5);
                    if l_Cero_0 then
                        l_Cero_0:Destroy();
                    end;
                    if l_Part_0 then
                        l_Part_0:Destroy();
                    end;
                end);
                task.wait(l_EffectDelay_5);
                v2239:Disconnect();
                if v2240 or v2234.Stunned.Value then
                    return;
                else
                    task.spawn(function() --[[ Line: 11500 ]]
                        -- upvalues: v2264 (copy), v2230 (copy), l_Character_40 (copy), v33 (ref)
                        if v2264 then
                            return;
                        elseif (v2230.Character.PrimaryPart.Position - l_Character_40.PrimaryPart.Position).Magnitude > 25 then
                            return;
                        else
                            v33.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.2, 
                                Fade = 0.2, 
                                FoV = 67, 
                                FoVMult = 3
                            });
                            return;
                        end;
                    end);
                    if l_ExtraEffect_0.IsMini then
                        l_SoundHelper_0:PlaySound({
                            Name = "CoyoteLight", 
                            Parent = v2230.Character, 
                            Speed = v34:NextNumber(0.9, 1.1)
                        });
                    else
                        l_SoundHelper_0:PlaySound({
                            Name = "CoyoteHeavy", 
                            Parent = v2230.Character, 
                            Speed = v34:NextNumber(0.9, 1.1)
                        });
                    end;
                    local v2283 = v2238.Fire:Clone();
                    v2283.Parent = l_Part_0;
                    task.spawn(function() --[[ Line: 11533 ]]
                        -- upvalues: v2283 (copy)
                        for _, v2285 in v2283:GetChildren() do
                            v2285.Enabled = true;
                            v2285.Rate = v2285.Rate * 2;
                        end;
                        task.wait(0.1);
                        for _, v2287 in v2283:GetChildren() do
                            v2287.Enabled = false;
                        end;
                    end);
                    return;
                end;
            end;
        end;
    end;
end;
v33.CoyoteHeavyLeft = function(v2288) --[[ Line: 11546 ]] --[[ Name: CoyoteHeavyLeft ]]
    -- upvalues: v33 (copy)
    table.insert(v2288, "LeftGun");
    v33.CoyoteHeavy(v2288);
end;
v33.CoyoteHeavyRight = function(v2289) --[[ Line: 11551 ]] --[[ Name: CoyoteHeavyRight ]]
    -- upvalues: v33 (copy)
    table.insert(v2289, "RightGun");
    v33.CoyoteHeavy(v2289);
end;
v33.GonHeavy = function(v2290) --[[ Line: 11556 ]] --[[ Name: GonHeavy ]]
    -- upvalues: l_Workspace_1 (copy), l_SoundHelper_0 (copy), v34 (copy), v23 (copy), v33 (copy), l_LocalPlayer_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy)
    local v2291 = {
        Character = v2290[2], 
        EffectDelay = v2290[3], 
        RockOrScissors = v2290[4].RockOrScissors
    };
    local _ = v2291.ExtraEffect;
    local l_Character_41 = v2291.Character;
    local v2294 = GetCharacterData(l_Character_41);
    if not v2294 then
        return;
    else
        local l_FirstChild_30 = l_Workspace_1.Welds:FindFirstChild(v2291.Character.Name);
        local v2296 = l_FirstChild_30 and l_FirstChild_30:FindFirstChild("WeldCharacter") or v2291.Character;
        if not v2296 then
            return;
        else
            local v2297 = nil;
            local v2298 = false;
            local l_RockOrScissors_0 = v2291.RockOrScissors;
            if v2298 or v2294.Stunned.Value then
                return;
            else
                local v2300 = nil;
                local _ = l_SoundHelper_0:PlaySound({
                    Name = "GonBurstBegin", 
                    Parent = v2291.Character, 
                    Speed = v34:NextNumber(0.9, 1.1), 
                    Volume = 0.5
                });
                if l_RockOrScissors_0 then
                    v2300 = script.GonScissors.ScissorsLeftHand:Clone();
                    v2300.Parent = v2296:FindFirstChild("LeftHand");
                    local _ = l_SoundHelper_0:PlaySound({
                        Name = "GonBurstBegin2", 
                        Parent = v2291.Character, 
                        Volume = 0.6
                    });
                    v23.Emit(v2300);
                else
                    v2300 = script.GonRock.Start:Clone();
                    l_SoundHelper_0:PlaySound({
                        Name = "GonCharge", 
                        Parent = v2291.Character, 
                        Speed = 0.9
                    });
                    v2300.Parent = v2296:FindFirstChild("RightHand");
                    v23.Emit(v2300.FirstEmit);
                    for _, v2304 in v2300.MainSucktion:GetChildren() do
                        v2304.Enabled = true;
                    end;
                end;
                game.Debris:AddItem(v2300, 3);
                v33.CameraShake({
                    Preset = "MedHit", 
                    WaitTime = 0.2, 
                    Fade = 0.2, 
                    FoV = 67, 
                    FoVMult = 3
                });
                v2297 = v2294.Stunned.Changed:Connect(function(v2305) --[[ Line: 11635 ]]
                    -- upvalues: v2294 (copy), v2298 (ref), v2300 (ref)
                    task.wait();
                    if v2294.Stunned.Value ~= v2305 then
                        return;
                    elseif v2305 then
                        v2298 = true;
                        v2300:Destroy();
                        return;
                    else
                        return;
                    end;
                end);
                local v2306 = nil;
                local v2307 = l_LocalPlayer_0.Character == v2291.Character;
                local _ = v2291.Character:GetAttribute("IsHeavy");
                v2306 = v2291.Character:GetAttributeChangedSignal((v2307 and "Local" or "") .. "IsFeinting"):Connect(function() --[[ Line: 11650 ]]
                    -- upvalues: v2291 (copy), v2307 (copy), v2298 (ref), v2300 (ref)
                    if not v2291.Character:GetAttribute((v2307 and "Local" or "") .. "IsFeinting") then
                        return;
                    else
                        if not v2291.Character:GetAttribute((v2307 and "Local" or "") .. "IsHeavy") then
                            v2298 = true;
                            if v2300 then
                                for _, v2310 in v2300:GetDescendants() do
                                    if v2310:IsA("ParticleEmitter") then
                                        v2310.Enabled = false;
                                    end;
                                end;
                            end;
                        end;
                        return;
                    end;
                end);
                task.delay(1, function() --[[ Line: 11668 ]]
                    -- upvalues: v2306 (ref)
                    v2306:Disconnect();
                end);
                local v2311 = nil;
                local v2312 = 0;
                local l_Character_42 = l_LocalPlayer_0.Character;
                local v2314 = GetOccupied(l_Character_42).LockedOn.Value == v2291.Character;
                v2311 = v2291.Character:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 11680 ]]
                    -- upvalues: v2314 (copy), v2291 (copy), v2312 (ref), v2298 (ref), v2294 (copy), v2311 (ref), v2300 (ref), v33 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref)
                    if v2314 then
                        return;
                    else
                        local v2315 = v2291.Character:GetAttribute("LastLanded") or 0;
                        if v2315 < v2312 or v2298 or v2294.Stunned.Value then
                            if v2311 then
                                v2311:Disconnect();
                            end;
                            v2300:Destroy();
                            return;
                        elseif v2312 > 0 then
                            return;
                        else
                            v2312 = v2315;
                            task.spawn(function() --[[ Line: 11698 ]]
                                -- upvalues: v33 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref)
                                task.spawn(function() --[[ Line: 11699 ]]
                                    -- upvalues: v33 (ref)
                                    v33.CameraShake({
                                        Preset = "MedHit", 
                                        WaitTime = 0.4, 
                                        Fade = 0.5, 
                                        FoV = 68, 
                                        FoVMult = 2
                                    });
                                end);
                                local l_ColorCorrection_5 = l_Lighting_0.ColorCorrection;
                                l_ColorCorrection_5.Saturation = 0;
                                l_ColorCorrection_5.Contrast = 0;
                                l_ColorCorrection_5.Enabled = true;
                                local v2317 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                                l_TweenService_0:Create(l_ColorCorrection_5, v2317, {
                                    Saturation = 0.1, 
                                    Contrast = 0.1
                                }):Play();
                                local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                                l_MenuBlur_3.Size = 0;
                                l_MenuBlur_3.Enabled = true;
                                local v2319 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                                l_TweenService_0:Create(l_MenuBlur_3, v2319, {
                                    Size = 10
                                }):Play();
                            end);
                            return;
                        end;
                    end;
                end);
                task.delay(v2291.EffectDelay + 0.3, function() --[[ Line: 11727 ]]
                    -- upvalues: l_RockOrScissors_0 (copy), v2300 (ref), l_TweenService_0 (ref), v2311 (ref)
                    if l_RockOrScissors_0 then
                        for _, v2321 in v2300:GetDescendants() do
                            if v2321:IsA("Beam") then
                                l_TweenService_0:Create(v2321, TweenInfo.new(0.3), {
                                    Width0 = 0, 
                                    Width1 = 0
                                }):Play();
                            end;
                            if v2321:IsA("ParticleEmitter") then
                                v2321.Enabled = false;
                            end;
                        end;
                    end;
                    if v2311 then
                        v2311:Disconnect();
                    end;
                end);
                task.wait(v2291.EffectDelay);
                if v2298 or v2294.Stunned.Value then
                    return;
                else
                    v2297:Disconnect();
                    if not l_RockOrScissors_0 then
                        for _, v2323 in v2300.MainSucktion:GetChildren() do
                            v2323.Enabled = false;
                        end;
                        v23.Emit(v2300.Emit);
                    end;
                    if l_RockOrScissors_0 then
                        local v2324 = script.GonScissors.Slash:Clone();
                        v2324.Parent = workspace.Debris;
                        v2324:PivotTo(v2296.HumanoidRootPart.CFrame);
                        v23.Emit(v2324);
                        v23.PlayFlipbook(v2324.GonSlash, v2324.GonSlash.ModuleScript, 0.56);
                        l_TweenService_0:Create(v2324.Wind.Start, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            CFrame = v2324.Wind.End.CFrame, 
                            Size = v2324.Wind.End.Size, 
                            Transparency = v2324.Wind.End.Transparency
                        }):Play();
                        v2324.Floor.CFrame = v2324.Floor2.CFrame;
                        game.Debris:AddItem(v2324, 6);
                    else
                        v2300:Destroy();
                        local v2325 = script.GonRock:Clone();
                        v2325.Parent = workspace.Debris;
                        v2325.CFrame = CFrame.new(v2296.UpperTorso.Position) * CFrame.Angles(v2296.HumanoidRootPart.CFrame:ToOrientation()) * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(-1, 1, 2);
                        v2325.Start:Destroy();
                        v23.Emit(v2325);
                        game.Debris:AddItem(v2325, 4);
                    end;
                    task.spawn(function() --[[ Line: 11783 ]]
                        -- upvalues: v2314 (copy), v2291 (copy), l_Character_42 (copy), v33 (ref)
                        if v2314 then
                            return;
                        elseif (v2291.Character.PrimaryPart.Position - l_Character_42.PrimaryPart.Position).Magnitude > 14 then
                            return;
                        else
                            v33.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.2, 
                                Fade = 0.2, 
                                FoV = 67, 
                                FoVMult = 3
                            });
                            return;
                        end;
                    end);
                    l_SoundHelper_0:PlaySound({
                        Name = "CoyoteLight", 
                        Parent = v2291.Character, 
                        Speed = v34:NextNumber(0.9, 1.1)
                    });
                    l_SoundHelper_0:PlaySound({
                        Name = "GonBurst", 
                        Parent = v2291.Character, 
                        Speed = v34:NextNumber(0.9, 1.1)
                    });
                    if l_RockOrScissors_0 then
                        l_SoundHelper_0:PlaySound({
                            Name = "ExplosionSlash", 
                            Parent = v2291.Character
                        });
                        l_SoundHelper_0:PlaySound({
                            Name = "ClothSlash", 
                            Parent = v2291.Character
                        });
                        l_SoundHelper_0:PlaySound({
                            Name = "FireSlash", 
                            Parent = v2291.Character
                        });
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
v33.KilluaHeavy = function(v2326) --[[ Line: 11830 ]] --[[ Name: KilluaHeavy ]]
    -- upvalues: l_Workspace_1 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy), v23 (copy), v33 (copy), l_LocalPlayer_0 (copy), l_Lighting_0 (copy), v34 (copy)
    local v2327 = {
        Character = v2326[2], 
        EffectDelay = v2326[3], 
        UppercutOrDownslam = v2326[4].UppercutOrDownslam, 
        ThirdM2 = v2326[4].ThirdM2
    };
    local _ = v2327.ExtraEffect;
    local l_Character_43 = v2327.Character;
    local v2330 = GetCharacterData(l_Character_43);
    if not v2330 then
        return;
    else
        local l_FirstChild_31 = l_Workspace_1.Welds:FindFirstChild(v2327.Character.Name);
        if not (l_FirstChild_31 and l_FirstChild_31:FindFirstChild("WeldCharacter") or v2327.Character) then
            return;
        else
            local v2332 = nil;
            local v2333 = false;
            local l_UppercutOrDownslam_0 = v2327.UppercutOrDownslam;
            if v2333 or v2330.Stunned.Value then
                return;
            else
                local v2335 = nil;
                local v2336 = l_SoundHelper_0:PlaySound({
                    Name = "KilluaBurstBegin", 
                    Parent = v2327.Character, 
                    Speed = 0.9, 
                    Volume = 0.5
                });
                l_TweenService_0:Create(v2336, TweenInfo.new(0.8), {
                    PlaybackSpeed = 1.5
                }):Play();
                if not l_UppercutOrDownslam_0 and v2327.ThirdM2 then
                    local v2337 = Instance.new("TremoloSoundEffect", v2336);
                    v2337.Frequency = 0;
                    l_TweenService_0:Create(v2337, TweenInfo.new(0.8), {
                        Frequency = 10
                    }):Play();
                end;
                v2335 = script.KilluaUppercut.Yoyo:Clone();
                v2335.Parent = workspace.Live:FindFirstChild(l_Character_43.Name):FindFirstChild("Yoyo").YoYo;
                if l_UppercutOrDownslam_0 then
                    local _ = l_SoundHelper_0:PlaySound({
                        Name = "KilluaBurstBegin2", 
                        Parent = v2327.Character, 
                        Volume = 0.6
                    });
                    v23.Emit(v2335);
                end;
                game.Debris:AddItem(v2335, 3);
                v33.CameraShake({
                    Preset = "MedHit", 
                    WaitTime = 0.2, 
                    Fade = 0.2, 
                    FoV = 67, 
                    FoVMult = 3
                });
                v2332 = v2330.Stunned.Changed:Connect(function(v2339) --[[ Line: 11901 ]]
                    -- upvalues: v2333 (ref), v2335 (ref), v2336 (copy)
                    if v2339 then
                        v2333 = true;
                        v2335:Destroy();
                        v2336:Destroy();
                        return;
                    else
                        return;
                    end;
                end);
                local v2340 = nil;
                local v2341 = 0;
                local l_Character_44 = l_LocalPlayer_0.Character;
                local v2343 = GetOccupied(l_Character_44).LockedOn.Value == v2327.Character;
                v2340 = v2327.Character:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 11918 ]]
                    -- upvalues: v2343 (copy), v2327 (copy), v2341 (ref), v2333 (ref), v2330 (copy), v2340 (ref), v2335 (ref), v2336 (copy), v33 (ref), l_Lighting_0 (ref), l_UppercutOrDownslam_0 (copy), l_Character_43 (copy), v23 (ref), l_SoundHelper_0 (ref), l_TweenService_0 (ref)
                    if v2343 then
                        return;
                    else
                        local v2344 = v2327.Character:GetAttribute("LastLanded") or 0;
                        if v2344 < v2341 or v2333 or v2330.Stunned.Value then
                            if v2340 then
                                v2340:Disconnect();
                            end;
                            v2335:Destroy();
                            v2336:Destroy();
                            return;
                        elseif v2341 > 0 then
                            return;
                        else
                            v2341 = v2344;
                            task.spawn(function() --[[ Line: 11936 ]]
                                -- upvalues: v33 (ref), l_Lighting_0 (ref), l_UppercutOrDownslam_0 (ref), v2327 (ref), v2341 (ref), l_Character_43 (ref), v23 (ref), l_SoundHelper_0 (ref), l_TweenService_0 (ref)
                                task.spawn(function() --[[ Line: 11937 ]]
                                    -- upvalues: v33 (ref)
                                    v33.CameraShake({
                                        Preset = "MedHit", 
                                        WaitTime = 0.4, 
                                        Fade = 0.5, 
                                        FoV = 68, 
                                        FoVMult = 2
                                    });
                                end);
                                local l_ColorCorrection_6 = l_Lighting_0.ColorCorrection;
                                l_ColorCorrection_6.Saturation = 0;
                                l_ColorCorrection_6.Contrast = 0;
                                l_ColorCorrection_6.Enabled = true;
                                local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                                l_MenuBlur_4.Size = 0;
                                l_MenuBlur_4.Enabled = true;
                                local v2347 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                                task.spawn(function() --[[ Line: 11959 ]]
                                    -- upvalues: l_UppercutOrDownslam_0 (ref), v2327 (ref), v2341 (ref), l_Character_43 (ref), v23 (ref), v2347 (ref), l_SoundHelper_0 (ref), v33 (ref)
                                    if l_UppercutOrDownslam_0 == nil and v2327.ThirdM2 and v2341 then
                                        local v2348 = script.Killua3rdM2:Clone();
                                        v2348.Parent = workspace.Debris;
                                        v2348.CFrame = CFrame.new(l_Character_43.UpperTorso.Position) * CFrame.Angles(l_Character_43.HumanoidRootPart.CFrame:ToOrientation()) * CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(-1, 1, 2);
                                        v23.Emit(v2348);
                                        game.Debris:AddItem(v2348, 20);
                                        v2347 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                                        l_SoundHelper_0:PlaySound({
                                            Name = "KilluaM2Explosion", 
                                            Parent = l_Character_43
                                        });
                                        v33.CameraShake({
                                            Preset = "MedHit", 
                                            WaitTime = 0.9, 
                                            Fade = 1, 
                                            FoV = 50, 
                                            FoVMult = 2
                                        });
                                    end;
                                end);
                                l_TweenService_0:Create(l_MenuBlur_4, v2347, {
                                    Size = 10
                                }):Play();
                            end);
                            return;
                        end;
                    end;
                end);
                task.delay(v2327.EffectDelay + 0.3, function() --[[ Line: 11991 ]]
                    -- upvalues: v2335 (ref), v2340 (ref)
                    if v2335 then
                        for _, v2350 in v2335:GetDescendants() do
                            if v2350:IsA("ParticleEmitter") then
                                v2350.Enabled = false;
                            end;
                        end;
                    end;
                    if v2340 then
                        v2340:Disconnect();
                    end;
                end);
                task.wait(v2327.EffectDelay);
                v2336:Destroy();
                if v2333 or v2330.Stunned.Value then
                    return;
                else
                    v2332:Disconnect();
                    if l_UppercutOrDownslam_0 then
                        local v2351 = script.KilluaUppercut.Slash:Clone();
                        v2351.Parent = workspace.Debris;
                        v2351:PivotTo(l_Character_43.HumanoidRootPart.CFrame);
                        v23.Emit(v2351);
                        v23.PlayFlipbook(v2351.KilluaSlash, v2351.KilluaSlash.ModuleScript, 0.56);
                        l_TweenService_0:Create(v2351.Wind.Start, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            CFrame = v2351.Wind.End.CFrame, 
                            Size = v2351.Wind.End.Size, 
                            Transparency = v2351.Wind.End.Transparency
                        }):Play();
                        v2351.Floor.CFrame = v2351.Floor2.CFrame;
                        game.Debris:AddItem(v2351, 6);
                    elseif not l_UppercutOrDownslam_0 and not v2327.ThirdM2 then
                        local v2352 = script.KilluaDownslam:Clone();
                        v2352.Parent = workspace.Debris;
                        v23.Emit(v2352);
                        game.Debris:AddItem(v2352, 6);
                        local v2353 = workspace:Raycast(l_Character_43.LowerTorso.Position, Vector3.new(-0, -10, -0, -0), v33.GetMapParams());
                        l_SoundHelper_0:PlaySound({
                            Name = "YoyoDownslam", 
                            Parent = l_Character_43
                        });
                        if v2353 then
                            local v2354 = v23.GetRaySurface(v2353);
                            local l_CFrame_5 = l_Character_43.HumanoidRootPart.CFrame;
                            v2352.CFrame = CFrame.new(v2354.Position, l_CFrame_5 * CFrame.new(0, 0, -40000).Position) + l_Character_43.HumanoidRootPart.CFrame.LookVector * 4;
                            l_TweenService_0:Create(v2352.Decal, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                Transparency = 1
                            }):Play();
                            l_TweenService_0:Create(v2352.Decal1, TweenInfo.new(5.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                Transparency = 1
                            }):Play();
                            l_TweenService_0:Create(v2352.Decal2, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                Transparency = 1
                            }):Play();
                        end;
                    end;
                    task.spawn(function() --[[ Line: 12051 ]]
                        -- upvalues: v2343 (copy), v2327 (copy), l_Character_44 (copy), v33 (ref)
                        if v2343 then
                            return;
                        elseif (v2327.Character.PrimaryPart.Position - l_Character_44.PrimaryPart.Position).Magnitude > 14 then
                            return;
                        else
                            v33.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.2, 
                                Fade = 0.2, 
                                FoV = 67, 
                                FoVMult = 3
                            });
                            return;
                        end;
                    end);
                    l_SoundHelper_0:PlaySound({
                        Name = "CoyoteLight", 
                        Parent = v2327.Character, 
                        Speed = v34:NextNumber(0.9, 1.1)
                    });
                    if l_UppercutOrDownslam_0 then
                        l_SoundHelper_0:PlaySound({
                            Name = "GonBurst", 
                            Parent = v2327.Character, 
                            Speed = v34:NextNumber(0.9, 1.1)
                        });
                        l_SoundHelper_0:PlaySound({
                            Name = "ExplosionSlash", 
                            Parent = v2327.Character
                        });
                        l_SoundHelper_0:PlaySound({
                            Name = "ClothSlash", 
                            Parent = v2327.Character
                        });
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
local v2356 = 0;
v33.KilluaM1 = function(v2357) --[[ Line: 12097 ]] --[[ Name: KilluaM1 ]]
    -- upvalues: l_Workspace_1 (copy), v2356 (ref), l_TweenService_0 (copy), v23 (copy)
    local v2358 = {
        Character = v2357[2], 
        MainInfo = v2357[4]
    };
    local _ = v2358.ExtraEffect;
    local l_Character_45 = v2358.Character;
    local v2361 = GetCharacterData(l_Character_45);
    if not v2361 then
        return;
    else
        local l_FirstChild_32 = l_Workspace_1.Welds:FindFirstChild(v2358.Character.Name);
        if not (l_FirstChild_32 and l_FirstChild_32:FindFirstChild("WeldCharacter") or v2358.Character) then
            return;
        else
            local l_MainInfo_0 = v2358.MainInfo;
            local l_FirstCFrame_0 = l_MainInfo_0.FirstCFrame;
            local l_LastCFrame_0 = l_MainInfo_0.LastCFrame;
            local l_DelayTime_1 = l_MainInfo_0.DelayTime;
            local v2367 = l_MainInfo_0.ParticleRotation or 0;
            task.wait(l_DelayTime_1);
            if v2361.Stunned.Value then
                return;
            else
                local l_Style_1 = GetPlayerData(v2358.Character):FindFirstChild("Style");
                if l_Style_1.Value ~= "KilluaShiny" and l_Style_1.Value ~= "KilluaShinyFocus" then
                    return;
                else
                    local l_Trail_0 = l_Character_45:FindFirstChild("Yoyo"):WaitForChild("YoYo")["1"].Trail;
                    v2356 = math.clamp(v2356 + 0.3, 0, 0.6);
                    l_Trail_0.Enabled = true;
                    task.spawn(function() --[[ Line: 12139 ]]
                        -- upvalues: v2356 (ref), l_Trail_0 (copy)
                        while true do
                            if v2356 > 0 then
                                v2356 = v2356 - 0.01;
                                v2356 = math.max(v2356, 0);
                                if v2356 == 0 then
                                    l_Trail_0.Enabled = false;
                                    return;
                                else
                                    task.wait(0.01);
                                end;
                            else
                                return;
                            end;
                        end;
                    end);
                    local v2370 = script.KilluaM1:Clone();
                    v2370.Parent = workspace.Debris;
                    v2370.CFrame = l_Character_45.HumanoidRootPart.CFrame;
                    game.Debris:AddItem(v2370, 1);
                    v2370.Main.CFrame = l_FirstCFrame_0;
                    if v2367 ~= 0 then
                        for _, v2372 in v2370.Main.Particles.Side:GetChildren() do
                            v2372.Rotation = NumberRange.new(v2367);
                        end;
                    end;
                    l_TweenService_0:Create(v2370.Main, TweenInfo.new(0.2), {
                        CFrame = l_LastCFrame_0
                    }):Play();
                    v23.Emit(v2370);
                    for _, v2374 in v2370.Main.S1:GetChildren() do
                        if v2374:IsA("Beam") then
                            v2374:SetAttribute("Width0", v2374.Width0);
                            v2374.Width0 = 0;
                            v2374:SetAttribute("Width1", v2374.Width1);
                            v2374.Width1 = 0;
                            v2374.TextureSpeed = 3;
                            l_TweenService_0:Create(v2374, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true), {
                                Width0 = v2374:GetAttribute("Width0"), 
                                Width1 = v2374:GetAttribute("Width1")
                            }):Play();
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
v33.PickAStyleBurst = function(v2375) --[[ Line: 12180 ]] --[[ Name: PickAStyleBurst ]]
    -- upvalues: l_Workspace_1 (copy), v33 (copy), l_SoundHelper_0 (copy)
    local v2376 = v2375[2];
    local v2377 = v2375[3];
    task.wait(1);
    local v2378 = l_Workspace_1:WaitForChild("StyleShop").Effects[v2377];
    local v2379 = {};
    local v2380 = v33.GetWeldCharacter(v2376);
    for _, v2382 in v2378:GetChildren() do
        local v2383 = v2382:Clone();
        v2383.Parent = v2380.PrimaryPart;
        table.insert(v2379, v2383);
    end;
    for _, v2385 in v2379 do
        if v2385:IsA("ParticleEmitter") then
            v2385:Emit(v2385:GetAttribute("EmitCount"));
        else
            for _, v2387 in v2385:GetChildren() do
                v2387:Emit(v2387:GetAttribute("EmitCount"));
            end;
        end;
    end;
    l_SoundHelper_0:PlaySound({
        Name = v2377, 
        Parent = v2376
    });
    v33.CameraShake({
        Preset = "HardHit", 
        WaitTime = 0.5, 
        Fade = 1
    });
    task.wait(3);
    for _, v2389 in v2379 do
        v2389:Destroy();
    end;
end;
v33.Baguette = function(v2390) --[[ Line: 12227 ]] --[[ Name: Baguette ]]
    -- upvalues: l_Workspace_1 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy)
    local v2391 = {
        Character = v2390[2], 
        EffectDelay = v2390[3]
    };
    local l_Character_46 = v2391.Character;
    local _ = v2391.EffectDelay;
    local v2394 = GetCharacterData(l_Character_46);
    if not v2394 then
        return;
    else
        local l_FirstChild_33 = l_Workspace_1.Welds:FindFirstChild(v2391.Character.Name);
        local v2396 = l_FirstChild_33 and l_FirstChild_33:FindFirstChild("WeldCharacter") or v2391.Character;
        if not v2396 then
            return;
        else
            local l_RightLowerArm_0 = v2396:FindFirstChild("RightLowerArm");
            if not l_RightLowerArm_0 then
                return;
            else
                local v2398 = script.Baguette:Clone();
                v2398.Parent = workspace.Debris;
                local l_Weld_5 = v2398.Weld;
                l_Weld_5.Parent = v2398;
                l_Weld_5.Part0 = l_RightLowerArm_0;
                l_Weld_5.Part1 = v2398;
                local l_Mesh_0 = v2398.Mesh;
                local l_Scale_1 = l_Mesh_0.Scale;
                l_Mesh_0.Scale = Vector3.new(0, 0, 0, 0);
                local v2402 = nil;
                local v2403 = false;
                local v2404 = false;
                local function v2407() --[[ Line: 12262 ]] --[[ Name: Reset ]]
                    -- upvalues: v2404 (ref), v2402 (ref), l_Weld_5 (copy), v2396 (copy), v2398 (copy), l_SoundHelper_0 (ref)
                    if v2404 then
                        return;
                    else
                        v2404 = true;
                        if v2402 then
                            v2402:Disconnect();
                        end;
                        l_Weld_5:Destroy();
                        local l_Position_24 = (v2396.PrimaryPart.CFrame * CFrame.new(-30, 40, -5)).Position;
                        v2398.AssemblyLinearVelocity = CFrame.lookAt(v2398.Position, l_Position_24).LookVector * 55;
                        v2398.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                        local _ = l_SoundHelper_0:PlaySound({
                            Parent = v2396.PrimaryPart, 
                            Name = "Fling", 
                            Speed = math.random(0.9, 1.1), 
                            Volume = 0.05
                        });
                        task.wait(0.5);
                        if v2398 then
                            v2398:Destroy();
                        end;
                        return;
                    end;
                end;
                v2402 = v2394.Stunned.Changed:Connect(function(v2408) --[[ Line: 12285 ]]
                    -- upvalues: v2394 (copy), v2403 (ref), v2407 (copy)
                    task.wait();
                    if v2394.Stunned.Value ~= v2408 then
                        return;
                    else
                        if v2408 then
                            v2403 = true;
                            v2407();
                        end;
                        return;
                    end;
                end);
                task.delay(0.08333333333333333, function() --[[ Line: 12295 ]]
                    -- upvalues: v2403 (ref), l_TweenService_0 (ref), l_Mesh_0 (copy), l_Scale_1 (copy)
                    if v2403 then
                        return;
                    else
                        l_TweenService_0:Create(l_Mesh_0, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Scale = l_Scale_1
                        }):Play();
                        return;
                    end;
                end);
                task.wait(0.6166666666666667);
                v2407();
                return;
            end;
        end;
    end;
end;
v33.GhostBaguette = function(v2409) --[[ Line: 12303 ]] --[[ Name: GhostBaguette ]]
    -- upvalues: l_Workspace_1 (copy), l_TweenService_0 (copy)
    local v2410 = {
        Character = v2409[2], 
        EffectDelay = v2409[3]
    };
    local l_Character_47 = v2410.Character;
    local _ = v2410.EffectDelay;
    local v2413 = GetCharacterData(l_Character_47);
    if not v2413 then
        return;
    else
        local l_FirstChild_34 = l_Workspace_1.Welds:FindFirstChild(v2410.Character.Name);
        local v2415 = l_FirstChild_34 and l_FirstChild_34:FindFirstChild("WeldCharacter") or l_Character_47;
        if not v2415 then
            return;
        else
            local l_RightLowerArm_1 = v2415:FindFirstChild("RightLowerArm");
            if not l_RightLowerArm_1 then
                return;
            else
                local v2417 = script.Baguette:Clone();
                v2417.Parent = workspace.Debris;
                local l_Weld_6 = v2417.Weld;
                l_Weld_6.Parent = v2417;
                l_Weld_6.Part0 = l_RightLowerArm_1;
                l_Weld_6.Part1 = v2417;
                local l_Mesh_1 = v2417.Mesh;
                local l_Scale_2 = l_Mesh_1.Scale;
                l_Mesh_1.Scale = Vector3.new(0, 0, 0, 0);
                local v2421 = nil;
                local v2422 = nil;
                local v2423 = false;
                local v2424 = false;
                local function v2426() --[[ Line: 12340 ]] --[[ Name: Reset ]]
                    -- upvalues: v2424 (ref), v2422 (ref), v2421 (ref), l_Weld_6 (copy), v2415 (copy), v2417 (copy)
                    if v2424 then
                        return;
                    else
                        v2424 = true;
                        if v2422 then
                            v2422:Disconnect();
                        end;
                        if v2421 then
                            v2421:Disconnect();
                        end;
                        l_Weld_6:Destroy();
                        local l_Position_25 = (v2415.PrimaryPart.CFrame * CFrame.new(-30, 40, -5)).Position;
                        v2417.AssemblyLinearVelocity = CFrame.lookAt(v2417.Position, l_Position_25).LookVector * 55;
                        v2417.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
                        task.wait(0.5);
                        if v2417 then
                            v2417:Destroy();
                        end;
                        return;
                    end;
                end;
                v2422 = v2413.Stunned.Changed:Connect(function(v2427) --[[ Line: 12364 ]]
                    -- upvalues: v2413 (copy), v2423 (ref), v2426 (copy)
                    task.wait();
                    if v2413.Stunned.Value ~= v2427 then
                        return;
                    else
                        if v2427 then
                            v2423 = true;
                            v2426();
                        end;
                        return;
                    end;
                end);
                v2421 = l_Character_47:GetAttributeChangedSignal("Charging"):Connect(function() --[[ Line: 12374 ]]
                    -- upvalues: l_Character_47 (copy), v2426 (copy)
                    if not l_Character_47:GetAttribute("Charging") then
                        v2426();
                    end;
                end);
                task.delay(0.08333333333333333, function() --[[ Line: 12380 ]]
                    -- upvalues: v2423 (ref), l_TweenService_0 (ref), l_Mesh_1 (copy), l_Scale_2 (copy)
                    if v2423 then
                        return;
                    else
                        l_TweenService_0:Create(l_Mesh_1, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Scale = l_Scale_2
                        }):Play();
                        return;
                    end;
                end);
                return;
            end;
        end;
    end;
end;
v33.ConmanHeavy = function(v2428) --[[ Line: 12386 ]] --[[ Name: ConmanHeavy ]]
    -- upvalues: l_Workspace_1 (copy), l_SoundHelper_0 (copy), v34 (copy), v23 (copy), v33 (copy), l_LocalPlayer_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy)
    local v2429 = {
        Character = v2428[2], 
        EffectDelay = v2428[3], 
        RockOrScissors = v2428[4].RockOrScissors
    };
    local _ = v2429.ExtraEffect;
    local l_Character_48 = v2429.Character;
    local v2432 = GetCharacterData(l_Character_48);
    if not v2432 then
        return;
    else
        local l_FirstChild_35 = l_Workspace_1.Welds:FindFirstChild(v2429.Character.Name);
        local v2434 = l_FirstChild_35 and l_FirstChild_35:FindFirstChild("WeldCharacter") or v2429.Character;
        if not v2434 then
            return;
        else
            local v2435 = nil;
            local v2436 = false;
            if v2436 or v2432.Stunned.Value then
                return;
            else
                local _ = l_SoundHelper_0:PlaySound({
                    Name = "GonBurstBegin", 
                    Parent = v2429.Character, 
                    Speed = v34:NextNumber(0.9, 1.1), 
                    Volume = 0.5
                });
                local v2438 = script.ConmanThrow:Clone();
                v2438.Parent = v2434.LowerTorso;
                v23.Emit(v2438.Emit);
                game.Debris:AddItem(v2438, 5);
                v33.CameraShake({
                    Preset = "MedHit", 
                    WaitTime = 0.2, 
                    Fade = 0.2, 
                    FoV = 67, 
                    FoVMult = 3
                });
                v2435 = v2432.Stunned.Changed:Connect(function(v2439) --[[ Line: 12436 ]]
                    -- upvalues: v2432 (copy), v2436 (ref), v2438 (copy)
                    task.wait();
                    if v2432.Stunned.Value ~= v2439 then
                        return;
                    elseif v2439 then
                        v2436 = true;
                        v2438:Destroy();
                        return;
                    else
                        return;
                    end;
                end);
                local v2440 = nil;
                local v2441 = l_LocalPlayer_0.Character == v2429.Character;
                local _ = v2429.Character:GetAttribute("IsHeavy");
                v2440 = v2429.Character:GetAttributeChangedSignal((v2441 and "Local" or "") .. "IsFeinting"):Connect(function() --[[ Line: 12452 ]]
                    -- upvalues: v2429 (copy), v2441 (copy), v2436 (ref), v2438 (copy)
                    if not v2429.Character:GetAttribute((v2441 and "Local" or "") .. "IsFeinting") then
                        return;
                    else
                        if not v2429.Character:GetAttribute((v2441 and "Local" or "") .. "IsHeavy") then
                            v2436 = true;
                            v2438:Destroy();
                        end;
                        return;
                    end;
                end);
                task.delay(1, function() --[[ Line: 12466 ]]
                    -- upvalues: v2440 (ref)
                    v2440:Disconnect();
                end);
                local v2443 = nil;
                local v2444 = 0;
                local l_Character_49 = l_LocalPlayer_0.Character;
                local v2446 = GetOccupied(l_Character_49).LockedOn.Value == v2429.Character;
                v2443 = v2429.Character:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 12478 ]]
                    -- upvalues: v2446 (copy), v2429 (copy), v2444 (ref), v2436 (ref), v2432 (copy), v2443 (ref), v2438 (copy), v33 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref)
                    if v2446 then
                        return;
                    else
                        local v2447 = v2429.Character:GetAttribute("LastLanded") or 0;
                        if v2447 < v2444 or v2436 or v2432.Stunned.Value then
                            if v2443 then
                                v2443:Disconnect();
                            end;
                            v2438:Destroy();
                            return;
                        elseif v2444 > 0 then
                            return;
                        else
                            v2444 = v2447;
                            task.spawn(function() --[[ Line: 12496 ]]
                                -- upvalues: v33 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref)
                                task.spawn(function() --[[ Line: 12497 ]]
                                    -- upvalues: v33 (ref)
                                    v33.CameraShake({
                                        Preset = "MedHit", 
                                        WaitTime = 0.4, 
                                        Fade = 0.5, 
                                        FoV = 68, 
                                        FoVMult = 2
                                    });
                                end);
                                local l_ColorCorrection_7 = l_Lighting_0.ColorCorrection;
                                l_ColorCorrection_7.Saturation = 0;
                                l_ColorCorrection_7.Contrast = 0;
                                l_ColorCorrection_7.Enabled = true;
                                local v2449 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                                l_TweenService_0:Create(l_ColorCorrection_7, v2449, {
                                    Saturation = 0.1, 
                                    Contrast = 0.1
                                }):Play();
                                local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
                                l_MenuBlur_5.Size = 0;
                                l_MenuBlur_5.Enabled = true;
                                local v2451 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                                l_TweenService_0:Create(l_MenuBlur_5, v2451, {
                                    Size = 10
                                }):Play();
                            end);
                            return;
                        end;
                    end;
                end);
                task.delay(v2429.EffectDelay + 0.3, function() --[[ Line: 12525 ]]
                    -- upvalues: v2443 (ref)
                    if v2443 then
                        v2443:Disconnect();
                    end;
                end);
                task.wait(v2429.EffectDelay);
                if v2436 or v2432.Stunned.Value then
                    return;
                else
                    v2435:Disconnect();
                    for _, v2453 in v2438:GetDescendants() do
                        if v2453:IsA("Attachment") and v2453.Name == "Enabled" then
                            for _, v2455 in v2453:GetChildren() do
                                if v2455:IsA("ParticleEmitter") then
                                    v2455.Enabled = false;
                                end;
                            end;
                        end;
                    end;
                    v23.Emit(v2438.OkActualMain);
                    task.spawn(function() --[[ Line: 12551 ]]
                        -- upvalues: v2446 (copy), v2429 (copy), l_Character_49 (copy), v33 (ref)
                        if v2446 then
                            return;
                        elseif (v2429.Character.PrimaryPart.Position - l_Character_49.PrimaryPart.Position).Magnitude > 14 then
                            return;
                        else
                            v33.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.2, 
                                Fade = 0.2, 
                                FoV = 67, 
                                FoVMult = 3
                            });
                            return;
                        end;
                    end);
                    l_SoundHelper_0:PlaySound({
                        Name = "CoyoteLight", 
                        Parent = v2429.Character, 
                        Speed = v34:NextNumber(0.9, 1.1)
                    });
                    return;
                end;
            end;
        end;
    end;
end;
v33.Nanomachines = function(v2456) --[[ Line: 12575 ]] --[[ Name: Nanomachines ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_SoundHelper_0 (copy), l_TweenService_0 (copy)
    local v2457 = v2456[2];
    local v2458 = v2457 and v2457.Character;
    if not v2458 then
        return;
    else
        local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("LocalAssets", 40);
        local v2460 = require(game:GetService("ReplicatedFirst"):WaitForChild("LazyStorage")):Get("a_Nanomachines");
        if not v2460 then
            return;
        else
            local v2461 = require(script.NanomachineUtil);
            local v2462 = v2461.new(l_LocalPlayer_0, GetCharacterData);
            v2462:InitNanomachines(v2460, v2458);
            local l_Nanomachines_0 = v2462.Nanomachines;
            local l_CachedFrames_0 = v2462.CachedFrames;
            local l_NanomachinesOverlay_0 = v2462.NanomachinesOverlay;
            local l_Style_2 = GetPlayerData(v2458):FindFirstChild("Style");
            local v2467 = GetCharacterData(v2458);
            local v2468 = {};
            local l_DefaultOverlayTransparencies_0 = v2462.DefaultOverlayTransparencies;
            local v2470 = 0;
            local v2471 = v2462:IsMobile();
            local v2472 = nil;
            local function v2475() --[[ Line: 12625 ]] --[[ Name: Cleanup ]]
                -- upvalues: v2468 (copy), l_Nanomachines_0 (copy), v2461 (copy), l_CachedFrames_0 (copy)
                for _, v2474 in v2468 do
                    v2474:Disconnect();
                end;
                if l_Nanomachines_0 then
                    l_Nanomachines_0:Destroy();
                end;
                if v2461 then
                    v2461:CancelAnimation();
                end;
                l_CachedFrames_0:SetAttribute("Usage", l_CachedFrames_0:GetAttribute("Usage") - 1);
                if l_CachedFrames_0:GetAttribute("Usage") <= 0 then
                    l_CachedFrames_0:Destroy();
                end;
            end;
            local function v2480() --[[ Line: 12639 ]] --[[ Name: SetCharacterConnections ]]
                -- upvalues: v2468 (copy), v2458 (ref), v2467 (copy), v2462 (copy), v2470 (ref), l_LocalPlayer_0 (ref), l_SoundHelper_0 (ref)
                v2468[#v2468 + 1] = v2458:GetAttributeChangedSignal("LastDamaged"):Connect(function() --[[ Line: 12640 ]]
                    -- upvalues: v2467 (ref), v2462 (ref)
                    if not v2467.Blocking.Value then
                        v2462:PlayFlipbook(v2462.CurrentFrame, 0, 60, tick());
                    end;
                end);
                v2468[#v2468 + 1] = v2458:GetAttributeChangedSignal("ForceNanomachines"):Connect(function() --[[ Line: 12647 ]]
                    -- upvalues: v2458 (ref), v2462 (ref)
                    local v2476 = v2458:GetAttribute("ForceNanomachines") or 0;
                    v2462:PlayFlipbook(v2462.CurrentFrame, v2476, 20, tick());
                end);
                v2468[#v2468 + 1] = v2458:GetAttributeChangedSignal("Punching"):Connect(function() --[[ Line: 12652 ]]
                    -- upvalues: v2458 (ref), v2470 (ref), v2462 (ref), l_LocalPlayer_0 (ref), l_SoundHelper_0 (ref)
                    if not v2458:GetAttribute("Punching") then
                        return;
                    else
                        task.wait(0.03333333333333333);
                        local l_v2458_Attribute_0 = v2458:GetAttribute("IsHeavy");
                        if v2458:GetAttribute("CurrentPunch") == 1 then
                            v2470 = 0;
                        end;
                        v2470 = v2470 + 1;
                        v2470 = math.min(v2470, 14);
                        local l_v2470_0 = v2470;
                        if l_v2458_Attribute_0 then
                            l_v2470_0 = 14;
                        end;
                        if v2462.CurrentFrame <= 5 and v2462:ShouldContinue(v2458, l_LocalPlayer_0.Character) == true then
                            l_SoundHelper_0:PlaySound({
                                Name = "NanomachinesAppear", 
                                Parent = v2458, 
                                Volume = 0.18
                            });
                        end;
                        local v2479 = tick();
                        v2462:PlayFlipbook(v2462.CurrentFrame, l_v2470_0, l_v2458_Attribute_0 and 40 or 20, v2479, function() --[[ Line: 12686 ]]
                            -- upvalues: l_v2458_Attribute_0 (copy), v2462 (ref), v2479 (copy), v2458 (ref), l_LocalPlayer_0 (ref), l_SoundHelper_0 (ref)
                            task.wait(l_v2458_Attribute_0 and 1.1 or 0.7);
                            if v2462.CurrentId ~= v2479 then
                                return;
                            else
                                v2462:PlayFlipbook(v2462.CurrentFrame, 0, 25, tick());
                                task.wait(0.1);
                                if v2462.CurrentId ~= v2479 then
                                    return;
                                else
                                    if v2462:ShouldContinue(v2458, l_LocalPlayer_0.Character) == true then
                                        l_SoundHelper_0:PlaySound({
                                            Name = "NanomachinesDisappear", 
                                            Parent = v2458, 
                                            Volume = 0.035
                                        });
                                    end;
                                    return;
                                end;
                            end;
                        end);
                        return;
                    end;
                end);
            end;
            v2480();
            v2468[#v2468 + 1] = workspace.Live.ChildAdded:Connect(function(v2481) --[[ Line: 12710 ]]
                -- upvalues: v2457 (copy), l_Style_2 (copy), v2458 (ref), v2462 (copy), v2460 (copy), v2480 (copy)
                if v2481.Name ~= v2457.Name then
                    return;
                elseif l_Style_2.Value ~= "NanomachinesShiny" then
                    return;
                else
                    v2458 = v2481;
                    v2462:InitNanomachines(v2460, v2458);
                    v2480();
                    return;
                end;
            end);
            v2468[#v2468 + 1] = l_Style_2.Changed:Connect(function() --[[ Line: 12719 ]]
                -- upvalues: v2475 (copy)
                v2475();
            end);
            v2468[#v2468 + 1] = v2457.AncestryChanged:Connect(function() --[[ Line: 12723 ]]
                -- upvalues: v2475 (copy)
                v2475();
            end);
            v2468[#v2468 + 1] = v2467.Opponent.Changed:Connect(function() --[[ Line: 12728 ]]
                -- upvalues: l_NanomachinesOverlay_0 (copy), l_LocalPlayer_0 (ref), v2457 (copy), v2467 (copy)
                local l_l_NanomachinesOverlay_0_0 = l_NanomachinesOverlay_0;
                local v2483 = true;
                if l_LocalPlayer_0 ~= v2457 then
                    v2483 = v2467.Opponent.Value == l_LocalPlayer_0.Character;
                end;
                l_l_NanomachinesOverlay_0_0.Visible = v2483;
            end);
            v2468[#v2468 + 1] = v2467.Blocking.Changed:Connect(function(v2484) --[[ Line: 12732 ]]
                -- upvalues: v2462 (copy), v2458 (ref), l_LocalPlayer_0 (ref), l_NanomachinesOverlay_0 (copy), l_DefaultOverlayTransparencies_0 (copy), v2471 (copy), v2457 (copy), v2467 (copy), l_TweenService_0 (ref), l_SoundHelper_0 (ref), v2472 (ref)
                v2462.CurrentId = tick();
                if v2462:ShouldContinue(v2458, l_LocalPlayer_0.Character) == true then
                    for _, v2486 in l_NanomachinesOverlay_0.Main:GetChildren() do
                        if v2486:IsA("ImageLabel") then
                            local v2487 = v2484 and l_DefaultOverlayTransparencies_0[v2486.Name] or 1;
                            if v2471 then
                                v2487 = v2487 * 0.8;
                                if v2486.Name == "Vignette" then
                                    v2487 = v2487 * 0.8;
                                end;
                            end;
                            if l_LocalPlayer_0 ~= v2457 and v2467.Opponent.Value ~= v2458 then
                                v2487 = 1;
                            end;
                            l_TweenService_0:Create(v2486, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                ImageTransparency = v2487
                            }):Play();
                        end;
                    end;
                end;
                if v2457 == l_LocalPlayer_0 then
                    if v2484 then
                        workspace:SetAttribute("DefaultFOV", 68.55);
                    elseif workspace:GetAttribute("DefaultFOV") == 68.55 then
                        workspace:SetAttribute("DefaultFOV", nil);
                    end;
                end;
                if v2484 then
                    print(v2458);
                    print(v2458.Parent);
                    if v2462:ShouldContinue(v2458, l_LocalPlayer_0.Character) == true then
                        l_SoundHelper_0:PlaySound({
                            Name = "NanomachinesAppear", 
                            Parent = v2458, 
                            Volume = 0.45
                        });
                    end;
                    v2462:PlayFlipbook(v2462.CurrentFrame, 20, 40, tick());
                    return;
                else
                    if v2462:ShouldContinue(v2458, l_LocalPlayer_0.Character) == true then
                        v2472 = l_SoundHelper_0:PlaySound({
                            Name = "NanomachinesDisappear", 
                            Parent = v2458, 
                            Volume = 0.045
                        });
                    end;
                    v2462:PlayFlipbook(v2462.CurrentFrame, 0, 40, tick());
                    return;
                end;
            end);
            return;
        end;
    end;
end;
v33.NanomachinesM2 = function(v2488) --[[ Line: 12798 ]] --[[ Name: NanomachinesM2 ]]
    -- upvalues: l_Workspace_1 (copy), l_LocalPlayer_0 (copy), v33 (copy), v23 (copy)
    local v2489 = {
        Character = v2488[2], 
        EffectDelay = v2488[3]
    };
    local l_Character_50 = v2489.Character;
    local v2491 = GetCharacterData(l_Character_50);
    if l_Character_50.Parent ~= l_Workspace_1.Live then
        return;
    else
        local v2492 = nil;
        local v2493 = nil;
        local v2494 = nil;
        local v2495 = 0;
        local v2496 = false;
        local v2497 = l_LocalPlayer_0.Character == v2489.Character;
        local _ = v2489.Character:GetAttribute("IsHeavy");
        local v2499 = GetOccupied(l_Character_50).LockedOn.Value == l_Character_50;
        if v2496 or v2491.Stunned.Value then
            return;
        else
            local v2500 = script.NanomachineM2:Clone();
            v2500.Parent = v33.GetWeldCharacter(l_Character_50).PrimaryPart;
            task.delay(3, function() --[[ Line: 12832 ]]
                -- upvalues: v2500 (copy)
                if v2500 then
                    v2500:Destroy();
                end;
            end);
            v2492 = v2491.Stunned.Changed:Connect(function(v2501) --[[ Line: 12839 ]]
                -- upvalues: v2491 (copy), v2496 (ref), v2500 (copy)
                task.wait();
                if v2491.Stunned.Value ~= v2501 then
                    return;
                elseif v2501 then
                    v2496 = true;
                    v2500:Destroy();
                    return;
                else
                    return;
                end;
            end);
            v2493 = v2489.Character:GetAttributeChangedSignal((v2497 and "Local" or "") .. "IsFeinting"):Connect(function() --[[ Line: 12851 ]]
                -- upvalues: v2489 (copy), v2497 (copy), v2496 (ref), v2500 (copy)
                if not v2489.Character:GetAttribute((v2497 and "Local" or "") .. "IsFeinting") then
                    return;
                else
                    if not v2489.Character:GetAttribute((v2497 and "Local" or "") .. "IsHeavy") then
                        v2496 = true;
                        v2500:Destroy();
                    end;
                    return;
                end;
            end);
            task.delay(1, function() --[[ Line: 12865 ]]
                -- upvalues: v2493 (ref)
                v2493:Disconnect();
            end);
            v2494 = v2489.Character:GetAttributeChangedSignal("LastLanded"):Connect(function() --[[ Line: 12869 ]]
                -- upvalues: v2499 (copy), v2489 (copy), v2495 (ref), v2496 (ref), v2491 (copy), v2494 (ref), v2500 (copy), v2497 (copy), v33 (ref), v23 (ref)
                if v2499 then
                    return;
                else
                    local v2502 = v2489.Character:GetAttribute("LastLanded") or 0;
                    if v2502 < v2495 or v2496 or v2491.Stunned.Value then
                        if v2494 then
                            v2494:Disconnect();
                        end;
                        v2500:Destroy();
                        return;
                    elseif v2495 > 0 then
                        return;
                    else
                        v2495 = v2502;
                        if v2497 or v2499 then
                            v33.ImpactCorrection();
                        end;
                        task.delay(v2489.EffectDelay, function() --[[ Line: 12891 ]]
                            -- upvalues: v23 (ref), v2500 (ref)
                            v23.Emit(v2500);
                        end);
                        return;
                    end;
                end;
            end);
            task.delay(v2489.EffectDelay + 0.5, function() --[[ Line: 12896 ]]
                -- upvalues: v2494 (ref)
                if v2494 then
                    v2494:Disconnect();
                end;
            end);
            return;
        end;
    end;
end;
local v2503 = require(script.Comet.Moviee_Libary:Clone());
local v2504 = v2503();
v33.CometAbility = function(v2505) --[[ Line: 12904 ]] --[[ Name: CometAbility ]]
    -- upvalues: l_Workspace_1 (copy), l_Players_0 (copy), v2503 (copy), v2504 (copy), l_LocalPlayer_0 (copy), l_SoundHelper_0 (copy), v33 (copy)
    local v2506 = {
        Character = v2505[2], 
        DistanceToTarget = v2505[3]
    };
    local l_Character_51 = v2506.Character;
    local l_FirstChild_36 = l_Workspace_1.States:FindFirstChild(l_Character_51.Name);
    local v2509 = l_FirstChild_36 and l_FirstChild_36.CharacterData.Opponent.Value or nil;
    local l_Character_52 = l_Players_0.LocalPlayer.Character;
    local v2511 = true;
    if l_Character_51 ~= l_Character_52 then
        v2511 = v2509 == l_Character_52;
    end;
    local v2512 = {};
    local function v2523(v2513, v2514) --[[ Line: 12919 ]] --[[ Name: PlayMeshes ]]
        -- upvalues: v2503 (ref), v2512 (copy), v2504 (ref)
        local v2515 = v2514 and v2514.scaleTO or false;
        local function v2520(v2516) --[[ Line: 12923 ]] --[[ Name: handleMesh ]]
            -- upvalues: v2503 (ref), v2512 (ref), v2504 (ref)
            if v2516:FindFirstChild("info") then
                v2503("MovieeTweenMethod")(v2516).play();
                if v2516:GetAttribute("Destroy") then
                    task.delay(v2516.info:GetAttribute("time"), v2516.Destroy, v2516);
                end;
            end;
            local l_v2516_Attribute_0 = v2516:GetAttribute("Flipbook");
            if l_v2516_Attribute_0 and v2516:FindFirstChild("tweeninfo") and v2512[l_v2516_Attribute_0] then
                local v2518 = v2512[l_v2516_Attribute_0];
                local v2519 = v2504.Utils:createinfo(v2516:FindFirstChild("tweeninfo")) or TweenInfo.new(0.5);
                v2504.TweenMeshFlipbook(v2516, v2518, v2519, function() --[[ Line: 12936 ]]
                    -- upvalues: v2516 (copy)
                    if v2516:GetAttribute("Destroy") then
                        v2516:Destroy();
                    end;
                end);
            end;
        end;
        if v2515 then
            v2504.Utils:scaleModel(v2513, v2515);
        end;
        v2504.Utils:FixMesh(v2513);
        if v2513:IsA("Model") then
            for _, v2522 in v2513:GetChildren() do
                v2520(v2522);
            end;
            return;
        else
            v2520(v2513);
            return;
        end;
    end;
    local function v2530(v2524) --[[ Line: 12959 ]] --[[ Name: PlayBeams ]]
        -- upvalues: v2503 (ref), v2504 (ref)
        for _, v2526 in v2524:GetDescendants() do
            if v2526:IsA("Beam") then
                if v2526:FindFirstChild("info") then
                    v2503("MovieeTweenMethod")(v2526).play();
                    if v2526:GetAttribute("Destroy") then
                        task.delay(v2526.info:GetAttribute("time"), v2526.Destroy, v2526);
                    end;
                else
                    continue;
                end;
            end;
            if v2526:IsA("CFrameValue") then
                local l_Parent_6 = v2526.Parent;
                local v2528 = v2504.Utils:createinfo(v2526:FindFirstChild("info")) or TweenInfo.new(0.5);
                local v2529 = {
                    CFrame = l_Parent_6:FindFirstChildOfClass("CFrameValue").Value
                };
                v2503("Services").ts:Create(l_Parent_6, v2528, v2529):Play();
            end;
        end;
    end;
    local v2531 = {
        shine = {
            FillTransparency = 0.5, 
            FillColor = Color3.fromRGB(0, 0, 0), 
            OutlineTransparency = 0.5, 
            OutlineColor = Color3.fromRGB(62, 171, 255), 
            Tween = {
                Info = TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0.25), 
                Goal = {
                    FillTransparency = 1, 
                    OutlineTransparency = 1
                }
            }
        }, 
        ezbro = {
            Repeat = {
                [1] = {
                    FillTransparency = 0.5, 
                    FillColor = Color3.fromRGB(0, 0, 0), 
                    OutlineTransparency = 0.5, 
                    OutlineColor = Color3.fromRGB(62, 171, 255), 
                    Tween = {
                        Info = TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0.01675), 
                        Goal = {
                            FillTransparency = 0, 
                            FillColor = Color3.fromRGB(255, 130, 180)
                        }
                    }
                }, 
                [2] = {
                    FillTransparency = 0.15, 
                    FillColor = Color3.fromRGB(255, 147, 199), 
                    Tween = {
                        Info = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
                        Goal = {
                            FillTransparency = 1, 
                            FillColor = Color3.fromRGB(255, 151, 215)
                        }
                    }
                }
            }
        }
    };
    local l__effect_0 = script.Comet._effect;
    local v2533 = v2506.Character == l_LocalPlayer_0.Character;
    local _ = l_SoundHelper_0:PlaySound({
        Name = "Supernova", 
        Parent = l_Character_51.PrimaryPart, 
        DirectCopy = l__effect_0.CometStart
    });
    local _ = l_SoundHelper_0:PlaySound({
        Name = "Supernova", 
        Parent = l_Character_51.PrimaryPart, 
        DirectCopy = l__effect_0.CometStart2
    });
    task.wait(0.08333333333333333);
    local v2536 = GetCharacterData(l_Character_51);
    if v2536.Stunned.Value and not l_Character_51:GetAttribute("Punching") then
        return;
    else
        local l_dash_0 = l__effect_0:FindFirstChild("dash");
        if l_dash_0 then
            task.delay(v2533 and 0 or 0.35, function() --[[ Line: 13051 ]]
                -- upvalues: v2536 (copy), l_Character_51 (copy), l_dash_0 (ref), v2506 (copy), v2533 (copy), v2504 (ref), v2523 (copy), v2503 (ref)
                if v2536.Stunned.Value and not l_Character_51:GetAttribute("Punching") then
                    return;
                else
                    l_dash_0 = l_dash_0:Clone();
                    l_dash_0.Parent = workspace.Debris;
                    local v2538 = 1.7 + 0.8 * (1 - math.clamp((v2506.DistanceToTarget - 5) / 11, 0, 1));
                    if not v2533 then
                        v2538 = 2.5;
                    end;
                    v2504.Utils:scaleModel(l_dash_0.Mesh, 0.7 / v2538, 0.8 / v2538);
                    v2504.AlignGroup(l_dash_0, l_Character_51.PrimaryPart.CFrame * CFrame.new(0, 0, v2533 and 0 or 15));
                    v2504.PlayAttachment(l_dash_0, 5);
                    v2523(l_dash_0.Mesh);
                    if l_dash_0:FindFirstChild("Light") then
                        for _, v2540 in l_dash_0.Light:GetChildren() do
                            if v2540:FindFirstChild("info") then
                                v2503("MovieeTweenMethod")(v2540).play();
                            end;
                        end;
                    end;
                    local _ = v2503("Utils"):delta_weld(function() --[[ Line: 13088 ]]
                        -- upvalues: l_Character_51 (ref)
                        return l_Character_51:GetPivot();
                    end, l_dash_0, CFrame.identity, 1);
                    return;
                end;
            end);
        end;
        if v2511 then
            v2504.ImpactFrames({
                Folder = script.Comet._effect.Flash, 
                DisableTween = false, 
                Blur = 5, 
                tweeninfo = v2504.Utils:createinfo(script.Comet._effect.Flash:FindFirstChild((tostring(1))):FindFirstChild("info"))
            });
        end;
        local l_charge_0 = l__effect_0:FindFirstChild("charge");
        if l_charge_0 then
            l_charge_0 = l_charge_0:Clone();
            l_charge_0.Parent = workspace.Debris;
            v2504.AlignGroup(l_charge_0, l_Character_51.PrimaryPart.CFrame * CFrame.new(0, 0, -2));
            v2504.PlayAttachment(l_charge_0, 5);
            v2530(l_charge_0);
            task.spawn(function() --[[ Line: 13114 ]]
                -- upvalues: l_charge_0 (ref), v2504 (ref)
                for _ = 1, 40 do
                    if l_charge_0.Parent then
                        local v2544 = l_charge_0.RightHand._ground["ss "];
                        local v2545 = v2504.Services.ts:Create(v2544, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
                            CFrame = v2544.CFrame * CFrame.Angles(0, -2.0943951023931953, 0)
                        });
                        v2545:Play();
                        v2545.Completed:Wait();
                    else
                        break;
                    end;
                end;
            end);
            if v2533 then
                local l_Highlight_0 = Instance.new("Highlight");
                l_Highlight_0.DepthMode = Enum.HighlightDepthMode.Occluded;
                l_Highlight_0.Parent = l_Character_51;
                game.Debris:AddItem(l_Highlight_0, 5);
                v2504.setHighlightTracker(l_Highlight_0, v2531.shine, false);
            end;
            local _ = v2503("Utils"):delta_weld(function() --[[ Line: 13137 ]]
                -- upvalues: l_Character_51 (copy)
                return CFrame.new(l_Character_51.LeftHand.Position);
            end, l_charge_0.RightHand, CFrame.identity, 1);
        end;
        if v2511 then
            task.delay(0.3333333333333333, function() --[[ Line: 13143 ]]
                -- upvalues: v33 (ref)
                v33.CameraShake({
                    Preset = "HardHit", 
                    WaitTime = 0.1, 
                    Fade = 0.3
                });
            end);
        end;
        return;
    end;
end;
v33.CometHit = function(v2548) --[[ Line: 13153 ]] --[[ Name: CometHit ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Workspace_1 (copy), l_SoundHelper_0 (copy), v2504 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy)
    local v2549 = {
        Character = v2548[2], 
        SetCFrame = v2548[3], 
        Damager = v2548[4], 
        TargetPart = v2548[5]
    };
    local l_Character_53 = v2549.Character;
    local l_SetCFrame_8 = v2549.SetCFrame;
    local l_Damager_4 = v2549.Damager;
    local v2553 = true;
    if l_LocalPlayer_0.Character ~= l_Character_53 then
        v2553 = l_LocalPlayer_0.Character == l_Damager_4;
    end;
    if l_Character_53.Parent ~= l_Workspace_1.Live then
        return;
    else
        l_SoundHelper_0:PlaySound({
            Name = "Supernova", 
            Parent = l_Character_53.PrimaryPart, 
            DirectCopy = script.Comet._effect.CometLanded
        }).TimePosition = 0.22;
        local l_TargetPart_3 = v2549.TargetPart;
        local v2555 = "Right";
        if l_TargetPart_3 and string.find(l_TargetPart_3, "Left") then
            v2555 = "Left";
        end;
        local l_FirstChild_37 = workspace.Welds:FindFirstChild(l_Damager_4.Name);
        if l_FirstChild_37 then
            local _ = l_FirstChild_37:FindFirstChild("WeldCharacter");
        end;
        local v2558 = script.Comet._effect.HitEffect:Clone();
        v2558.CFrame = l_SetCFrame_8;
        v2558.Name = l_Damager_4.Name .. "Hit";
        v2558.Parent = l_Workspace_1.Debris;
        v2504.PlayAttachment(v2558, 5);
        if l_LocalPlayer_0.Character == l_Character_53 or l_LocalPlayer_0.Character == l_Damager_4 then
            local l_ColorCorrection_8 = l_Lighting_0.ColorCorrection;
            l_ColorCorrection_8.Saturation = 0;
            l_ColorCorrection_8.Contrast = 0;
            l_ColorCorrection_8.Enabled = true;
            local v2560 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_8, v2560, {
                Saturation = -0.5, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_6 = l_Lighting_0.MenuBlur;
            l_MenuBlur_6.Size = 0;
            l_MenuBlur_6.Enabled = true;
            local v2562 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_6, v2562, {
                Size = 14
            }):Play();
            local v2563 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v2563, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.35
            }):Play();
            task.delay(0.3, function() --[[ Line: 13218 ]]
                -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v2563 (copy)
                l_TweenService_0:Create(l_Lighting_0, v2563, {
                    ExposureCompensation = workspace.Exposure.Value
                }):Play();
            end);
        end;
        if v2553 then
            v2504.ImpactFrames({
                Folder = script.Comet._effect.Flash, 
                DisableTween = false, 
                Blur = 5, 
                tweeninfo = v2504.Utils:createinfo(script.Comet._effect.Flash:FindFirstChild((tostring(1))):FindFirstChild("info"))
            });
        end;
        task.wait(5);
        v2558:Destroy();
        return;
    end;
end;
local v2564 = 0;
v33.EjectAbility = function(v2565) --[[ Line: 13238 ]] --[[ Name: EjectAbility ]]
    -- upvalues: l_Workspace_1 (copy), l_LocalPlayer_0 (copy), v2503 (copy), v2504 (copy), l_SoundHelper_0 (copy), v2564 (ref), l_Lighting_0 (copy), l_TweenService_0 (copy)
    local v2566 = {
        Character = v2565[2]
    };
    local l_Character_54 = v2566.Character;
    local l_FirstChild_38 = l_Workspace_1.States:FindFirstChild(l_Character_54.Name);
    local v2569 = l_FirstChild_38 and l_FirstChild_38.CharacterData.Opponent.Value or nil;
    local v2570 = true;
    if l_LocalPlayer_0.Character ~= l_Character_54 then
        v2570 = l_LocalPlayer_0.Character == v2569;
    end;
    local v2571 = {};
    local function v2582(v2572, v2573) --[[ Line: 13251 ]] --[[ Name: PlayMeshes ]]
        -- upvalues: v2503 (ref), v2571 (copy), v2504 (ref)
        local v2574 = v2573 and v2573.scaleTO or false;
        local function v2579(v2575) --[[ Line: 13255 ]] --[[ Name: handleMesh ]]
            -- upvalues: v2503 (ref), v2571 (ref), v2504 (ref)
            if v2575:FindFirstChild("info") then
                v2503("MovieeTweenMethod")(v2575).play();
                if v2575:GetAttribute("Destroy") then
                    task.delay(v2575.info:GetAttribute("time"), v2575.Destroy, v2575);
                end;
            end;
            local l_v2575_Attribute_0 = v2575:GetAttribute("Flipbook");
            if l_v2575_Attribute_0 and v2575:FindFirstChild("tweeninfo") and v2571[l_v2575_Attribute_0] then
                local v2577 = v2571[l_v2575_Attribute_0];
                local v2578 = v2504.Utils:createinfo(v2575:FindFirstChild("tweeninfo")) or TweenInfo.new(0.5);
                v2504.TweenMeshFlipbook(v2575, v2577, v2578, function() --[[ Line: 13268 ]]
                    -- upvalues: v2575 (copy)
                    if v2575:GetAttribute("Destroy") then
                        v2575:Destroy();
                    end;
                end);
            end;
        end;
        if v2574 then
            v2504.Utils:scaleModel(v2572, v2574);
        end;
        v2504.Utils:FixMesh(v2572);
        if v2572:IsA("Model") then
            for _, v2581 in v2572:GetChildren() do
                v2579(v2581);
            end;
            return;
        else
            v2579(v2572);
            return;
        end;
    end;
    local _ = function(v2583) --[[ Line: 13291 ]] --[[ Name: PlayBeams ]]
        -- upvalues: v2503 (ref), v2504 (ref)
        for _, v2585 in v2583:GetDescendants() do
            if v2585:IsA("Beam") then
                if v2585:FindFirstChild("info") then
                    v2503("MovieeTweenMethod")(v2585).play();
                    if v2585:GetAttribute("Destroy") then
                        task.delay(v2585.info:GetAttribute("time"), v2585.Destroy, v2585);
                    end;
                else
                    continue;
                end;
            end;
            if v2585:IsA("CFrameValue") then
                local l_Parent_7 = v2585.Parent;
                local v2587 = v2504.Utils:createinfo(v2585:FindFirstChild("info")) or TweenInfo.new(0.5);
                local v2588 = {
                    CFrame = l_Parent_7:FindFirstChildOfClass("CFrameValue").Value
                };
                v2503("Services").ts:Create(l_Parent_7, v2587, v2588):Play();
            end;
        end;
    end;
    local _ = {
        shine = {
            FillTransparency = 0.8, 
            FillColor = Color3.fromRGB(255, 255, 255), 
            OutlineTransparency = 1.5, 
            OutlineColor = Color3.fromRGB(255, 255, 255), 
            Tween = {
                Info = TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0.25), 
                Goal = {
                    FillTransparency = 1, 
                    OutlineTransparency = 1
                }
            }
        }
    };
    local l__effect_1 = script.Eject._effect;
    local v2592 = v2566.Character == l_LocalPlayer_0.Character;
    task.wait(0.08333333333333333);
    l_SoundHelper_0:PlaySound({
        Name = "Supernova", 
        Parent = l_Character_54.PrimaryPart, 
        DirectCopy = l__effect_1.EjectStart
    });
    if GetCharacterData(l_Character_54).Stunned.Value and not l_Character_54:GetAttribute("Punching") then
        return;
    else
        local l_start_0 = l__effect_1:FindFirstChild("start");
        if l_start_0 then
            l_start_0 = l_start_0:Clone();
            l_start_0.Parent = workspace.Debris;
            v2504.Utils:scaleModel(l_start_0.Mesh, 0.6692307692307692, 0.5153846153846154);
            v2504.AlignGroup(l_start_0, l_Character_54.PrimaryPart.CFrame);
            v2504.PlayAttachment(l_start_0, 7);
            v2582(l_start_0.Mesh);
        end;
        local l_v2564_0 = v2564;
        local v2595 = tick();
        repeat
            task.wait();
        until tick() - v2595 > 0.5 or l_v2564_0 ~= v2564;
        l_SoundHelper_0:PlaySound({
            Name = "Supernova", 
            Parent = l_Character_54.PrimaryPart, 
            DirectCopy = l__effect_1.EjectLanded
        }).TimePosition = 0.07;
        local l_punch_0 = l__effect_1:FindFirstChild("punch");
        if l_punch_0 then
            l_punch_0 = l_punch_0:Clone();
            l_punch_0.Parent = workspace.Debris;
            v2504.Utils:scaleModel(l_punch_0.Mesh, 0.6692307692307692, 1.4615384615384615);
            v2504.AlignGroup(l_punch_0, l_Character_54.PrimaryPart.CFrame * CFrame.new(0, -3, v2592 and 0 or 0));
            v2504.PlayAttachment(l_punch_0, 5);
            v2582(l_punch_0.Mesh);
            if l_punch_0:FindFirstChild("Light") then
                for _, v2598 in l_punch_0.Light:GetChildren() do
                    if v2598:FindFirstChild("info") then
                        v2503("MovieeTweenMethod")(v2598).play();
                    end;
                end;
            end;
        end;
        if l_LocalPlayer_0.Character == l_Character_54 then
            local l_ColorCorrection_9 = l_Lighting_0.ColorCorrection;
            l_ColorCorrection_9.Saturation = 0;
            l_ColorCorrection_9.Contrast = 0;
            l_ColorCorrection_9.Enabled = true;
            local v2600 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
            l_TweenService_0:Create(l_ColorCorrection_9, v2600, {
                Saturation = -0.5, 
                Contrast = 0.5
            }):Play();
            local l_MenuBlur_7 = l_Lighting_0.MenuBlur;
            l_MenuBlur_7.Size = 0;
            l_MenuBlur_7.Enabled = true;
            local v2602 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_MenuBlur_7, v2602, {
                Size = 20
            }):Play();
            local v2603 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
            l_TweenService_0:Create(l_Lighting_0, v2603, {
                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.35
            }):Play();
            task.delay(0.3, function() --[[ Line: 13415 ]]
                -- upvalues: l_TweenService_0 (ref), l_Lighting_0 (ref), v2603 (copy)
                l_TweenService_0:Create(l_Lighting_0, v2603, {
                    ExposureCompensation = workspace.Exposure.Value
                }):Play();
            end);
        end;
        if v2570 then
            v2504.ImpactFrames({
                Folder = script.Comet._effect.Flash, 
                DisableTween = false, 
                Blur = 5, 
                tweeninfo = v2504.Utils:createinfo(script.Comet._effect.Flash:FindFirstChild((tostring(1))):FindFirstChild("info"))
            });
        end;
        return;
    end;
end;
v33.EjectLanded = function(_) --[[ Line: 13431 ]] --[[ Name: EjectLanded ]]
    -- upvalues: v2564 (ref)
    v2564 = tick();
end;
v33.ReEntryAbility = function(v2605) --[[ Line: 13435 ]] --[[ Name: ReEntryAbility ]]
    -- upvalues: l_Workspace_1 (copy), l_LocalPlayer_0 (copy), v2503 (copy), v2504 (copy), l_SoundHelper_0 (copy), l_ReplicatedStorage_0 (copy)
    local v2606 = {
        Character = v2605[2], 
        DistanceToTarget = v2605[3]
    };
    local l_Character_55 = v2606.Character;
    local l_FirstChild_39 = l_Workspace_1.States:FindFirstChild(l_Character_55.Name);
    local v2609 = l_FirstChild_39 and l_FirstChild_39.CharacterData.Opponent.Value or nil;
    local v2610 = true;
    if l_LocalPlayer_0.Character ~= l_Character_55 then
        v2610 = l_LocalPlayer_0.Character == v2609;
    end;
    local v2611 = {};
    local function v2622(v2612, v2613) --[[ Line: 13449 ]] --[[ Name: PlayMeshes ]]
        -- upvalues: v2503 (ref), v2611 (copy), v2504 (ref)
        local v2614 = v2613 and v2613.scaleTO or false;
        local function v2619(v2615) --[[ Line: 13453 ]] --[[ Name: handleMesh ]]
            -- upvalues: v2503 (ref), v2611 (ref), v2504 (ref)
            if v2615:FindFirstChild("info") then
                v2503("MovieeTweenMethod")(v2615).play();
                if v2615:GetAttribute("Destroy") then
                    task.delay(v2615.info:GetAttribute("time"), v2615.Destroy, v2615);
                end;
            end;
            local l_v2615_Attribute_0 = v2615:GetAttribute("Flipbook");
            if l_v2615_Attribute_0 and v2615:FindFirstChild("tweeninfo") and v2611[l_v2615_Attribute_0] then
                local v2617 = v2611[l_v2615_Attribute_0];
                local v2618 = v2504.Utils:createinfo(v2615:FindFirstChild("tweeninfo")) or TweenInfo.new(0.5);
                v2504.TweenMeshFlipbook(v2615, v2617, v2618, function() --[[ Line: 13466 ]]
                    -- upvalues: v2615 (copy)
                    if v2615:GetAttribute("Destroy") then
                        v2615:Destroy();
                    end;
                end);
            end;
        end;
        if v2614 then
            v2504.Utils:scaleModel(v2612, v2614);
        end;
        v2504.Utils:FixMesh(v2612);
        if v2612:IsA("Model") then
            for _, v2621 in v2612:GetChildren() do
                v2619(v2621);
            end;
            return;
        else
            v2619(v2612);
            return;
        end;
    end;
    local _ = function(v2623) --[[ Line: 13489 ]] --[[ Name: PlayBeams ]]
        -- upvalues: v2503 (ref), v2504 (ref)
        for _, v2625 in v2623:GetDescendants() do
            if v2625:IsA("Beam") then
                if v2625:FindFirstChild("info") then
                    v2503("MovieeTweenMethod")(v2625).play();
                    if v2625:GetAttribute("Destroy") then
                        task.delay(v2625.info:GetAttribute("time"), v2625.Destroy, v2625);
                    end;
                else
                    continue;
                end;
            end;
            if v2625:IsA("CFrameValue") then
                local l_Parent_8 = v2625.Parent;
                local v2627 = v2504.Utils:createinfo(v2625:FindFirstChild("info")) or TweenInfo.new(0.5);
                local v2628 = {
                    CFrame = l_Parent_8:FindFirstChildOfClass("CFrameValue").Value
                };
                v2503("Services").ts:Create(l_Parent_8, v2627, v2628):Play();
            end;
        end;
    end;
    local l__effect_2 = script.Comet._effect;
    local _ = l_SoundHelper_0:PlaySound({
        Name = "Supernova", 
        Parent = l_Character_55.PrimaryPart, 
        DirectCopy = l__effect_2["Re-Entry"]
    });
    task.wait(0.08333333333333333);
    local v2632 = v2606.Character == l_LocalPlayer_0.Character;
    local l_reentry_0 = l__effect_2:FindFirstChild("reentry");
    if l_reentry_0 then
        l_reentry_0 = l_reentry_0:Clone();
        l_reentry_0.Parent = workspace.Debris;
        v2504.Utils:scaleModel(l_reentry_0.Mesh, 0.25925925925925924, 0.2962962962962963);
        v2504.AlignGroup(l_reentry_0, l_Character_55.PrimaryPart.CFrame * CFrame.new(0, 0, v2632 and 14 or 14));
        v2504.PlayAttachment(l_reentry_0, 5);
        v2622(l_reentry_0.Mesh);
        if l_reentry_0:FindFirstChild("Light") then
            for _, v2635 in l_reentry_0.Light:GetChildren() do
                if v2635:FindFirstChild("info") then
                    v2503("MovieeTweenMethod")(v2635).play();
                end;
            end;
        end;
        local _ = v2503("Utils"):delta_weld(function() --[[ Line: 13547 ]]
            -- upvalues: l_Character_55 (copy)
            return l_Character_55:GetPivot();
        end, l_reentry_0, CFrame.identity, 1);
    end;
    task.spawn(function() --[[ Line: 13552 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), l_Character_55 (copy)
        require(l_ReplicatedStorage_0.GarbageAfterimages)({
            Instance = l_Character_55, 
            ActiveTime = 0.3, 
            TimeBetweenImages = 0.05, 
            Transparency = 0.3, 
            FadeInTime = 0, 
            TimeBeforeFadeOut = 0, 
            FadeOutTime = 0.16666666666666666, 
            ImageColor = Color3.fromRGB(187, 199, 240)
        });
    end);
    task.wait(0.1);
    local l_burst_0 = l__effect_2:FindFirstChild("burst");
    if l_burst_0 then
        l_burst_0 = l_burst_0:Clone();
        l_burst_0.Parent = workspace.Debris;
        v2504.AlignGroup(l_burst_0, l_Character_55.PrimaryPart.CFrame * CFrame.new(0, 0, 0));
        v2504.PlayAttachment(l_burst_0, 5);
    end;
end;
v33.NanomachinesBlock = function(v2638) --[[ Line: 13578 ]] --[[ Name: NanomachinesBlock ]]
    -- upvalues: l_Workspace_1 (copy), l_SoundHelper_0 (copy), v34 (copy)
    local v2639 = {
        Character = v2638[2], 
        SetCFrame = v2638[3]
    };
    local l_Character_56 = v2639.Character;
    local l_SetCFrame_9 = v2639.SetCFrame;
    if l_Character_56.Parent ~= l_Workspace_1.Live then
        return;
    else
        l_SoundHelper_0:PlaySound({
            Name = "NanomachinesZap", 
            Parent = l_Character_56, 
            Speed = v34:NextNumber(1.15, 1.3)
        });
        local v2642 = script.NanomachinesBlock:Clone();
        v2642.CFrame = l_SetCFrame_9 * CFrame.new(v34:NextNumber(-1.3, 1.3), v34:NextNumber(-2, -0.25), 0);
        v2642.Parent = l_Workspace_1.Debris;
        for _, v2644 in v2642.Particle:GetChildren() do
            v2644.Enabled = false;
            v2644:Emit(v2644:GetAttribute("EmitCount") or 1);
        end;
        task.wait(5);
        v2642:Destroy();
        return;
    end;
end;
v33.ShinyCutscene = function(_) --[[ Line: 13608 ]] --[[ Name: ShinyCutscene ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_Players_0 (copy)
    l_ReplicatedStorage_0.Assets.GotShiny:Clone().Parent = l_Players_0.LocalPlayer.PlayerGui;
end;
return v33;