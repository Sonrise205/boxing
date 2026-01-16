local v0 = {
    DelayTime = 5.116666666666666, 
    ServerDelayTime = 9.5, 
    RandomTime = 0, 
    Metadata = {
        DisplayName = "RITUAL", 
        GlowColor = Color3.fromRGB(255, 223, 96), 
        Price = 99999
    }, 
    ExtraEndTime = 2, 
    OverrideBlob = true, 
    UpdateAppearanceDelay = 1, 
    Animations = {
        Megumi = 18505979327, 
        Mahoraga = 18506027603, 
        Camera = 18508118316, 
        Getup = 18506030901, 
        CameraKO = 18521729434, 
        KO = 18506035372
    }
};
local l_RunService_0 = game:GetService("RunService");
if l_RunService_0:IsServer() then
    return v0;
else
    local l_Players_0 = game:GetService("Players");
    local l_Lighting_0 = game:GetService("Lighting");
    local l_Workspace_0 = game:GetService("Workspace");
    local l_TweenService_0 = game:GetService("TweenService");
    local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
    local l_Modules_0 = l_ReplicatedStorage_0:WaitForChild("Modules");
    local _ = require(l_Modules_0:WaitForChild("AlignHelper"));
    local l_SoundHelper_0 = require(l_Modules_0:WaitForChild("SoundHelper"));
    local l_AnimHelper_0 = require(l_Modules_0:WaitForChild("AnimHelper"));
    local _ = require(l_Modules_0:WaitForChild("Styles"));
    local _ = require(l_ReplicatedStorage_0:WaitForChild("Bezier"));
    local l_RayHelper_0 = require(l_Modules_0:WaitForChild("RayHelper"));
    local l_Assets_0 = l_ReplicatedStorage_0:WaitForChild("Assets");
    local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraShaker"));
    local _ = require(l_ReplicatedStorage_0:WaitForChild("CameraSetup")).camShake;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_Main_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main");
    local l_Common_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Common");
    local l_SimulateKnockbackBE_0 = l_ReplicatedStorage_0:WaitForChild("RemoteEvents"):WaitForChild("SimulateKnockbackBE");
    local l_Parent_0 = script.Parent.Parent;
    local v22 = require(l_Parent_0);
    local _ = Random.new();
    local _ = require(l_ReplicatedStorage_0:WaitForChild("Modules", 10):WaitForChild("EmoteHelper", 10));
    local function _(v25, v26, v27) --[[ Line: 70 ]] --[[ Name: Lerp ]]
        return v25 + (v26 - v25) * v27;
    end;
    local _ = require(l_ReplicatedStorage_0:WaitForChild("NumberSequenceTween"));
    local l_Catalog_0 = l_ReplicatedStorage_0:WaitForChild("Catalog");
    local l_SearchHelper_0 = require(l_Catalog_0:WaitForChild("SearchHelper"));
    local function v42(v32, v33) --[[ Line: 77 ]] --[[ Name: SetTransparency ]]
        -- upvalues: l_ReplicatedStorage_0 (copy), l_Workspace_0 (copy)
        for _, v35 in v32:GetDescendants() do
            if v35.Name == "UnusualParticle" then
                v35.Enabled = v33 == 0;
                if not v35.Enabled then
                    local l_Parent_1 = v35.Parent;
                    v35.Parent = l_ReplicatedStorage_0;
                    v35.Parent = l_Parent_1;
                end;
            end;
            if (v35:IsA("BasePart") or v35:IsA("Decal")) and v35.LocalTransparencyModifier < 1000 then
                v35.LocalTransparencyModifier = v33;
                if v35.Name == "Handle" then
                    if v35.Parent.Name == "Third" then
                        v35.Transparency = 1;
                    else
                        local l_v35_Attribute_0 = v35:GetAttribute("StartTransparency");
                        if not l_v35_Attribute_0 then
                            v35:SetAttribute("StartTransparency", v35.Transparency);
                            l_v35_Attribute_0 = v35.Transparency;
                        end;
                        if v33 == 1 then
                            v35.Transparency = 1;
                        elseif v33 == 0 then
                            v35.Transparency = l_v35_Attribute_0;
                        end;
                    end;
                end;
            end;
        end;
        local l_FirstChild_0 = l_Workspace_0.Welds:FindFirstChild(v32.Name);
        if l_FirstChild_0 then
            for _, v40 in l_FirstChild_0:GetDescendants() do
                if v40.Name == "UnusualParticle" then
                    v40.Enabled = v33 == 0;
                    if not v40.Enabled then
                        local l_Parent_2 = v40.Parent;
                        v40.Parent = l_ReplicatedStorage_0;
                        v40.Parent = l_Parent_2;
                    end;
                end;
                if (v40:IsA("BasePart") or v40:IsA("Decal")) and v40.LocalTransparencyModifier < 1000 then
                    v40.LocalTransparencyModifier = v33;
                end;
            end;
        end;
    end;
    weldAttachments = function(v43, v44) --[[ Line: 135 ]] --[[ Name: weldAttachments ]]
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Part0 = v43.Parent;
        l_Weld_0.Part1 = v44.Parent;
        l_Weld_0.C0 = v43.CFrame;
        l_Weld_0.C1 = v44.CFrame;
        l_Weld_0.Parent = v43.Parent;
        return l_Weld_0;
    end;
    local function _(v46, v47, v48, v49, v50, v51) --[[ Line: 145 ]] --[[ Name: buildWeld ]]
        local l_Weld_1 = Instance.new("Weld");
        l_Weld_1.Name = v46;
        l_Weld_1.Part0 = v48;
        l_Weld_1.Part1 = v49;
        l_Weld_1.C0 = v50;
        l_Weld_1.C1 = v51;
        l_Weld_1.Parent = v47;
        return l_Weld_1;
    end;
    local function v54(v55, v56) --[[ Line: 156 ]] --[[ Name: findFirstMatchingAttachment ]]
        -- upvalues: v54 (copy)
        for _, v58 in pairs(v55:GetChildren()) do
            if v58:IsA("Attachment") and v58.Name == v56 then
                return v58;
            elseif not v58:IsA("Accoutrement") and not v58:IsA("Tool") then
                local v59 = v54(v58, v56);
                if v59 then
                    return v59;
                end;
            end;
        end;
    end;
    addAccoutrement = function(v60, v61) --[[ Line: 169 ]] --[[ Name: addAccoutrement ]]
        -- upvalues: v54 (copy)
        v61.Parent = v60;
        local l_Handle_0 = v61:FindFirstChild("Handle");
        if l_Handle_0 then
            local l_Attachment_0 = l_Handle_0:FindFirstChildOfClass("Attachment");
            if l_Attachment_0 then
                local v64 = v54(v60, l_Attachment_0.Name);
                if v64 then
                    weldAttachments(v64, l_Attachment_0);
                    return;
                end;
            else
                local l_Head_0 = v60:FindFirstChild("Head");
                if l_Head_0 then
                    local v66 = CFrame.new(0, 0.5, 0);
                    local l_AttachmentPoint_0 = v61.AttachmentPoint;
                    local l_Weld_2 = Instance.new("Weld");
                    l_Weld_2.Name = "HeadWeld";
                    l_Weld_2.Part0 = l_Head_0;
                    l_Weld_2.Part1 = l_Handle_0;
                    l_Weld_2.C0 = v66;
                    l_Weld_2.C1 = l_AttachmentPoint_0;
                    l_Weld_2.Parent = l_Head_0;
                end;
            end;
        end;
    end;
    v0.Main = function(v69) --[[ Line: 190 ]] --[[ Name: Main ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), v22 (copy), l_ReplicatedStorage_0 (copy), l_SearchHelper_0 (copy), v42 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_SimulateKnockbackBE_0 (copy), l_Main_0 (copy), l_RunService_0 (copy)
        local v70 = tick();
        local l_Character_0 = v69.Character;
        local l_Damager_0 = v69.Damager;
        local l_StartPosition_0 = v69.StartPosition;
        local l_LookVector_0 = v69.LookVector;
        local l_FirstChild_1 = l_Workspace_0.States:FindFirstChild(l_Character_0.Name);
        local l_CharacterData_0 = l_FirstChild_1:FindFirstChild("CharacterData");
        local l_PlayerData_0 = l_FirstChild_1:FindFirstChild("PlayerData");
        local l_Occupied_0 = l_FirstChild_1:FindFirstChild("Occupied");
        if not l_CharacterData_0 or not l_PlayerData_0 or not l_Occupied_0 then
            return;
        else
            local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(l_Character_0);
            local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
            local v81 = l_Humanoid_0 and l_Humanoid_0:FindFirstChild("Animator");
            local l_Humanoid_1 = l_Damager_0:FindFirstChild("Humanoid");
            local v83 = l_Humanoid_1 and l_Humanoid_1:FindFirstChild("Animator");
            if not v81 or not v83 then
                return;
            else
                local v84 = l_Assets_0.DownFrames.Default:Clone();
                local v85 = l_LocalPlayer_0.Character == l_Character_0;
                local v86 = v85 or l_LocalPlayer_0.Character == l_Damager_0;
                if v86 then
                    v84.Parent = l_Common_0;
                end;
                l_Damager_0:SetAttribute("CurrentEmote", nil);
                task.wait(0.03333333333333333);
                l_Character_0.Archivable = true;
                local v87 = l_Character_0:Clone();
                l_Character_0.Archivable = false;
                v87.Parent = l_Workspace_0.Debris;
                for _, v89 in v87:GetDescendants() do
                    if v89:IsA("BaseScript") or v89:IsA("ParticleEmitter") or v89:IsA("ForceField") or v89:IsA("BillboardGui") then
                        v89:Destroy();
                    end;
                    if v89:GetAttribute("GlovePart") then
                        v89:Destroy();
                    end;
                end;
                local l_Nametag_0 = l_Character_0.Head:FindFirstChild("Nametag");
                local v91 = nil;
                if l_Nametag_0 then
                    v91 = l_Nametag_0.Enabled;
                    l_Nametag_0.Enabled = false;
                end;
                local v92 = v22.GetWeldCharacter(l_Character_0);
                if v92 then
                    local v93 = workspace.States:WaitForChild(l_Character_0.Name, 10):WaitForChild("PlayerData", 10);
                    l_ReplicatedStorage_0.Events.EquipGloves:Fire(v87, v93.Gloves.Value);
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = true;
                    v87.PrimaryPart.Anchored = true;
                    local v94 = CFrame.lookAt(l_Character_0.PrimaryPart.Position, l_Damager_0.PrimaryPart.Position).LookVector * Vector3.new(1, 0, 1, 0);
                    if v94.Magnitude > 0.1 then
                        l_Character_0:PivotTo(CFrame.new(l_Character_0.PrimaryPart.Position, l_Character_0.PrimaryPart.Position + v94));
                    end;
                    v87:PivotTo(l_Character_0.PrimaryPart.CFrame);
                end;
                local l_Folder_0 = Instance.new("Folder");
                l_Folder_0.Parent = v92.PrimaryPart;
                if not l_Character_0:GetAttribute("ActiveNPC") then
                    for _, v97 in l_Character_0:GetChildren() do
                        if v97:IsA("Accessory") or v97:IsA("BodyColors") or v97:IsA("Shirt") or v97:IsA("Pants") then
                            v97.Parent = l_Folder_0;
                            if v97:IsA("Accessory") then
                                for _, v99 in v97:GetDescendants() do
                                    if v99:IsA("ParticleEmitter") then
                                        v99.Enabled = false;
                                    end;
                                    if v99:IsA("BasePart") then
                                        v99.LocalTransparencyModifier = 1;
                                        if v99.Transparency == 0 then
                                            v99.Transparency = 1;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                if l_Workspace_0.Settings.PlayKnockdownOnSelf.Value then
                    v69.OverrideBlob = nil;
                end;
                task.delay(0.1, function() --[[ Line: 299 ]]
                    -- upvalues: l_Character_0 (copy), l_Folder_0 (copy)
                    for _, v101 in l_Character_0:GetDescendants() do
                        if v101.Name ~= script.Name and v101.Parent.Name ~= script.Name and not v101:IsDescendantOf(l_Folder_0) and v101:IsA("ParticleEmitter") then
                            v101:Destroy();
                        end;
                    end;
                end);
                local l_Mahoraga_0 = script.Mahoraga;
                if v69.OverrideBlob then
                    l_Mahoraga_0 = l_Mahoraga_0:Clone();
                    task.delay(30, function() --[[ Line: 315 ]]
                        -- upvalues: l_Mahoraga_0 (ref), l_Folder_0 (copy)
                        if l_Mahoraga_0 then
                            l_Mahoraga_0:Destroy();
                        end;
                        if l_Folder_0 then
                            l_Folder_0:Destroy();
                        end;
                    end);
                    l_SearchHelper_0.WriteBlobToDescription(l_Mahoraga_0.Humanoid.HumanoidDescription, v69.OverrideBlob);
                    l_SearchHelper_0.UpdateModelAppearance(l_Mahoraga_0);
                elseif l_Character_0:GetAttribute("ActiveNPC") then
                    for _, v104 in l_Character_0:GetChildren() do
                        if v104:IsA("Shirt") or v104:IsA("Pants") then
                            v104:Destroy();
                        end;
                    end;
                    for _, v106 in l_Character_0.Clothing:GetDescendants() do
                        if v106.Name == "Second" then
                            v106.Parent = l_Character_0;
                        end;
                    end;
                    for _, v108 in l_Character_0:GetChildren() do
                        if v108.Name == "First" then
                            v108:Destroy();
                        elseif v108:IsA("Accessory") and v108:FindFirstChild("Handle") then
                            v108.Handle.Transparency = v108.Name == "Second" and 0 or 1;
                        end;
                    end;
                else
                    for _, v110 in l_Mahoraga_0:GetChildren() do
                        if v110:IsA("Accessory") or v110:IsA("BodyColors") or v110:IsA("Shirt") or v110:IsA("Pants") then
                            v110 = v110:Clone();
                            v110.Name = "Mahoraga";
                            v110.Parent = l_Character_0;
                            if v110:IsA("Accessory") then
                                addAccoutrement(l_Character_0, v110);
                            end;
                        end;
                    end;
                end;
                for _, v112 in l_Mahoraga_0:GetDescendants() do
                    if v112:IsA("BasePart") then
                        v112.CollisionGroup = "None";
                    end;
                end;
                local v113 = nil;
                local v114 = true;
                if v69.OverrideBlob then
                    task.delay(8, function() --[[ Line: 368 ]]
                        -- upvalues: v114 (ref)
                        v114 = nil;
                    end);
                    task.spawn(function() --[[ Line: 372 ]]
                        -- upvalues: v42 (ref), l_Character_0 (copy), v114 (ref)
                        v42(l_Character_0, 1);
                        while task.wait(0.03333333333333333) and v114 do
                            v42(l_Character_0, 1);
                        end;
                    end);
                elseif not l_Character_0:GetAttribute("ActiveNPC") then
                    v113 = l_Mahoraga_0.Head.WheelPart:Clone();
                    local v115 = l_Mahoraga_0.Head.Wheel:Clone();
                    v113.Parent = v92:FindFirstChild("Head") or v92.PrimaryPart;
                    v115.Parent = v92:FindFirstChild("Head") or v92.PrimaryPart;
                    v115.Part0 = l_Character_0.Head;
                    v115.Part1 = v113;
                    v42(l_Character_0, 1);
                elseif l_Character_0:GetAttribute("ActiveNPC") then
                    v42(l_Character_0, 1);
                end;
                l_Character_0:SetAttribute("Mahoraga", true);
                local l_FirstChild_2 = l_Workspace_0.States:FindFirstChild(l_Character_0.Name);
                local v117 = l_FirstChild_2 and l_FirstChild_2:FindFirstChild("CharacterData");
                if v117 then
                    local v118 = false;
                    local v119 = {};
                    do
                        local l_v118_0 = v118;
                        local function v127() --[[ Line: 404 ]] --[[ Name: ResetAppearance ]]
                            -- upvalues: l_v118_0 (ref), l_Character_0 (copy), v113 (ref), v69 (copy), l_Folder_0 (copy)
                            if l_v118_0 then
                                return;
                            else
                                l_v118_0 = true;
                                l_Character_0:SetAttribute("Mahoraga", nil);
                                for _, v122 in l_Character_0:GetChildren() do
                                    if v122.Name == "Mahoraga" then
                                        v122:Destroy();
                                    end;
                                end;
                                if v113 then
                                    v113:Destroy();
                                end;
                                if v69.OverrideBlob then
                                    return;
                                else
                                    for _, v124 in l_Folder_0:GetChildren() do
                                        if v124:IsA("Accessory") or v124:IsA("BodyColors") or v124:IsA("Shirt") or v124:IsA("Pants") then
                                            v124.Parent = l_Character_0;
                                            if v124:IsA("Accessory") then
                                                for _, v126 in v124:GetDescendants() do
                                                    if v126:IsA("ParticleEmitter") then
                                                        v126.Enabled = true;
                                                    end;
                                                    if v126:IsA("BasePart") then
                                                        v126.LocalTransparencyModifier = 0;
                                                        if v126.Transparency == 1 then
                                                            v126.Transparency = 0;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                    return;
                                end;
                            end;
                        end;
                        local l_v119_0 = v119 --[[ copy: 29 -> 78 ]];
                        v119[1] = l_Humanoid_0.Died:Connect(function() --[[ Line: 444 ]]
                            -- upvalues: l_v118_0 (ref), l_v119_0 (copy)
                            l_v118_0 = true;
                            for _, v130 in l_v119_0 do
                                v130:Disconnect();
                            end;
                        end);
                        local l_v127_0 = v127 --[[ copy: 30 -> 79 ]];
                        v119[2] = v92.ChildAdded:Connect(function(v132) --[[ Line: 452 ]]
                            -- upvalues: l_v127_0 (copy), l_v119_0 (copy)
                            if v132.Name ~= "ResetAppearance" then
                                return;
                            else
                                l_v127_0();
                                for _, v134 in l_v119_0 do
                                    v134:Disconnect();
                                end;
                                return;
                            end;
                        end);
                        v119[3] = v117.Opponent.Changed:Connect(function() --[[ Line: 462 ]]
                            -- upvalues: l_v127_0 (copy), l_v119_0 (copy)
                            task.wait(0.4);
                            l_v127_0();
                            for _, v136 in l_v119_0 do
                                v136:Disconnect();
                            end;
                        end);
                    end;
                end;
                local v137 = 0.1;
                local l_l_RayHelper_0_EnvironmentWhitelist_0 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_0, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_0, l_StartPosition_0 - l_LookVector_0, v137 + 0, l_l_RayHelper_0_EnvironmentWhitelist_0);
                local v142 = l_StartPosition_0 - l_LookVector_0 * v137;
                if l_l_RayHelper_0_RayWithWhiteList_0 then
                    v142 = l_StartPosition_0 - l_LookVector_0 * 0.1;
                end;
                local v143 = v0.ServerDelayTime / (v0.ServerDelayTime + v69.ExtraTime);
                local v144 = 0.25 * v143;
                local v145 = 1 * v143;
                local v146 = 0.25 / v144;
                local v147 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v148 = {};
                for _, v150 in l_Character_0:GetChildren() do
                    if v150:IsA("BasePart") and v150 ~= l_Character_0.PrimaryPart then
                        v148[v150] = v150.CollisionGroup;
                        v150.CollisionGroup = "None";
                    end;
                end;
                for _, v152 in (v83:GetPlayingAnimationTracks()) do
                    if v152.Priority == Enum.AnimationPriority.Action or v152.Priority == Enum.AnimationPriority.Action2 or v152.Priority == Enum.AnimationPriority.Action3 then
                        local l_Speed_0 = v152.Speed;
                        v152:AdjustSpeed(l_Speed_0 / 3);
                        task.delay(v146, function() --[[ Line: 510 ]]
                            -- upvalues: v152 (copy), l_Speed_0 (copy)
                            if not v152 then
                                return;
                            else
                                v152:AdjustSpeed(l_Speed_0);
                                return;
                            end;
                        end);
                    end;
                end;
                local v154 = l_Assets_0.Camera:Clone();
                v154.Parent = l_Workspace_0.Debris;
                v154:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 0, 0) * CFrame.new(0, 0, 0));
                v154.Head.Transparency = 1;
                local v155 = {
                    AnimId = v0.Animations.Mahoraga, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = v144, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v81, 
                    Weight = 1000, 
                    Looped = false, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_0 = l_AnimHelper_0:CreateAnim(v155);
                v155.AnimId = v0.Animations.Megumi;
                v155.Animator = v87.Humanoid:FindFirstChild("Animator") or v87.Humanoid;
                local l_l_AnimHelper_0_Anim_1 = l_AnimHelper_0:CreateAnim(v155);
                v155.AnimId = v0.Animations.Camera;
                v155.Animator = v154.AnimationController;
                local l_l_AnimHelper_0_Anim_2 = l_AnimHelper_0:CreateAnim(v155);
                local l_PrimaryPart_0 = l_Character_0.PrimaryPart;
                local l_CFrame_0 = l_PrimaryPart_0.CFrame;
                local _ = l_Workspace_0:GetServerTimeNow();
                local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
                l_ColorCorrectionEffect_0.Parent = l_Lighting_0;
                local v163 = {};
                local v164 = {};
                local _ = {
                    "Live", 
                    "Welds", 
                    "Debris", 
                    "Base"
                };
                if v86 then

                end;
                local v166 = v22.GetAtmosphere();
                local v167 = {
                    Density = v166.Density, 
                    Color = v166.Color, 
                    Haze = v166.Haze, 
                    Glare = v166.Glare, 
                    Decay = v166.Decay
                };
                local v168 = {
                    Density = 0.5, 
                    Color = Color3.fromRGB(0, 0, 0), 
                    Decay = Color3.fromRGB(0, 0, 0), 
                    Haze = 20, 
                    Glare = 0.4
                };
                local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
                local v170 = {};
                local v171 = script.Particles.UpperTorso.Embers:Clone();
                v171.Name = script.Name;
                v171.Parent = v92.UpperTorso;
                local v172 = script.Particles.Head:Clone();
                v172.Name = script.Name;
                v172.Parent = v92:FindFirstChild("Head") or v92.PrimaryPart;
                table.insert(v170, v171);
                table.insert(v170, v172);
                local v173 = script.Knockdown:Clone();
                v173.CFrame = CFrame.lookAt(l_CFrame_0.Position, v142);
                v173.Position = v173.Position + Vector3.new(0, 0.75, 0, 0);
                v173.Parent = l_Workspace_0.Debris;
                for _, v175 in v173.Particle:GetChildren() do
                    v175.Enabled = false;
                    v175:Emit(v175:GetAttribute("EmitCount"));
                end;
                task.delay(5, function() --[[ Line: 604 ]]
                    -- upvalues: v173 (copy)
                    v173:Destroy();
                end);
                task.defer(function() --[[ Line: 608 ]]
                    -- upvalues: v86 (copy), l_ColorCorrectionEffect_0 (copy), l_TweenService_0 (ref), l_Lighting_0 (ref)
                    if not v86 then
                        return;
                    else
                        l_ColorCorrectionEffect_0.Saturation = 0;
                        l_ColorCorrectionEffect_0.Contrast = 0;
                        l_ColorCorrectionEffect_0.Enabled = true;
                        local v176 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrectionEffect_0, v176, {
                            Saturation = -0.5, 
                            Contrast = 1
                        }):Play();
                        local l_MenuBlur_0 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_0.Size = 0;
                        l_MenuBlur_0.Enabled = true;
                        local v178 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_0, v178, {
                            Size = 12
                        }):Play();
                        local v179 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v179, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                        return;
                    end;
                end);
                local v180 = {};
                v180[#v180 + 1] = l_l_AnimHelper_0_Anim_0:GetMarkerReachedSignal("Start"):Connect(function() --[[ Line: 630 ]]
                    -- upvalues: v86 (copy), l_TweenService_0 (ref), l_ColorCorrectionEffect_0 (copy), v145 (copy), v22 (ref), v164 (copy), v163 (copy), v166 (copy), v168 (copy), v167 (copy), l_Character_0 (copy), v87 (copy), v92 (copy), v114 (ref), v42 (ref), l_Mahoraga_0 (ref), l_Workspace_0 (ref), l_CurrentCamera_0 (copy), l_SoundHelper_0 (ref), l_LookVector_0 (copy), v142 (ref), l_PrimaryPart_0 (copy), l_SimulateKnockbackBE_0 (ref), l_Nametag_0 (copy), v91 (ref), v171 (copy), v172 (copy)
                    task.defer(function() --[[ Line: 632 ]]
                        -- upvalues: v86 (ref), l_TweenService_0 (ref), l_ColorCorrectionEffect_0 (ref), v145 (ref)
                        if not v86 then
                            return;
                        else
                            l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(1 / v145, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                Brightness = -0.1, 
                                Contrast = 0.6, 
                                Saturation = -0.5
                            }):Play();
                            task.wait(2.2666666666666666 / v145);
                            l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(1.25 / v145, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Brightness = 0, 
                                Contrast = 0, 
                                Saturation = 0
                            }):Play();
                            task.wait(5);
                            l_ColorCorrectionEffect_0:Destroy();
                            return;
                        end;
                    end);
                    task.defer(function() --[[ Line: 653 ]]
                        -- upvalues: v86 (ref), v145 (ref), v22 (ref), v164 (ref), l_TweenService_0 (ref), v163 (ref), v166 (ref), v168 (ref), v167 (ref)
                        if not v86 then
                            return;
                        else
                            task.wait(0.21666666666666667 / v145);
                            task.defer(function() --[[ Line: 658 ]]
                                -- upvalues: v22 (ref)
                                v22.CameraShake({
                                    Preset = "MedHit", 
                                    WaitTime = 0.2, 
                                    Fade = 1
                                });
                            end);
                            task.defer(function() --[[ Line: 666 ]]
                                -- upvalues: v22 (ref)
                                v22.CameraShake({
                                    Preset = "SuperLight", 
                                    WaitTime = 0.1, 
                                    Fade = 2
                                });
                            end);
                            task.defer(function() --[[ Line: 674 ]]
                                -- upvalues: v164 (ref), l_TweenService_0 (ref), v163 (ref)
                                for _, v182 in v164 do
                                    v182.Enabled = false;
                                end;
                                task.defer(function() --[[ Line: 680 ]]
                                    -- upvalues: l_TweenService_0 (ref), v163 (ref)
                                    for v183 = 1, 15 do
                                        local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v183 / 15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                                        for _, v186 in v163 do
                                            if v186.LocalTransparencyModifier < 1000 then
                                                v186.LocalTransparencyModifier = l_l_TweenService_0_Value_0;
                                            end;
                                        end;
                                        task.wait(0.03333333333333333);
                                    end;
                                end);
                            end);
                            l_TweenService_0:Create(v166, TweenInfo.new(1 / v145, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v168):Play();
                            task.wait(2.1166666666666667 / v145);
                            l_TweenService_0:Create(v166, TweenInfo.new(1.25 / v145, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v167):Play();
                            task.defer(function() --[[ Line: 700 ]]
                                -- upvalues: l_TweenService_0 (ref), v163 (ref), v164 (ref)
                                for v187 = 1, 8 do
                                    local l_l_TweenService_0_Value_1 = l_TweenService_0:GetValue(v187 / 8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                                    for _, v190 in v163 do
                                        if v190.LocalTransparencyModifier < 1000 then
                                            v190.LocalTransparencyModifier = 1 - l_l_TweenService_0_Value_1;
                                        end;
                                    end;
                                    task.wait(0.03333333333333333);
                                end;
                                for _, v192 in v164 do
                                    v192.Enabled = true;
                                end;
                            end);
                            return;
                        end;
                    end);
                    task.defer(function() --[[ Line: 720 ]]
                        -- upvalues: l_Character_0 (ref), v87 (ref), v92 (ref), l_TweenService_0 (ref), v145 (ref), v114 (ref), v42 (ref), l_Mahoraga_0 (ref)
                        l_Character_0:PivotTo(v87.PrimaryPart.CFrame);
                        local l_Highlight_0 = Instance.new("Highlight");
                        l_Highlight_0.OutlineTransparency = 1;
                        l_Highlight_0.FillTransparency = 0.6;
                        l_Highlight_0.FillColor = Color3.fromRGB(73, 73, 73);
                        l_Highlight_0.DepthMode = Enum.HighlightDepthMode.Occluded;
                        l_Highlight_0.Parent = v92;
                        l_Highlight_0.Adornee = l_Character_0;
                        l_TweenService_0:Create(l_Highlight_0, TweenInfo.new(0.45 / v145, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            FillColor = Color3.fromRGB(255, 255, 255), 
                            FillTransparency = 0
                        }):Play();
                        task.defer(function() --[[ Line: 736 ]]
                            -- upvalues: v145 (ref), l_TweenService_0 (ref), l_Highlight_0 (copy)
                            task.wait(0.75 / v145);
                            l_TweenService_0:Create(l_Highlight_0, TweenInfo.new(0.9 / v145, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                FillTransparency = 1
                            }):Play();
                            task.wait(4);
                            l_Highlight_0:Destroy();
                        end);
                        task.wait(0.13333333333333333 / v145);
                        v114 = nil;
                        v42(l_Character_0, 0);
                        local v194 = {};
                        for _, v196 in l_Mahoraga_0:WaitForChild("HumanoidRootPart", 10):Clone():GetChildren() do
                            v196.Parent = l_Character_0.PrimaryPart;
                            table.insert(v194, v196);
                        end;
                        l_Character_0.PrimaryPart.String1.Attachment1 = l_Character_0.LowerTorso.RightHipRigAttachment;
                        l_Character_0.PrimaryPart.String2.Attachment1 = l_Character_0.Head.HatAttachment;
                        l_Character_0.PrimaryPart.String3.Attachment1 = l_Character_0.UpperTorso.WaistRigAttachment;
                        l_Character_0.PrimaryPart.String4.Attachment1 = l_Character_0.LeftLowerLeg.LeftAnkleRigAttachment;
                        l_Character_0.PrimaryPart.String5.Attachment1 = l_Character_0.LeftLowerArm.LeftElbowRigAttachment;
                        l_Character_0.PrimaryPart.String6.Attachment1 = l_Character_0.LowerTorso.RootRigAttachment;
                        l_Character_0.PrimaryPart.String7.Attachment1 = l_Character_0.RightLowerLeg.RightKneeRigAttachment;
                        for v197 = 1, 9 do
                            for _, v199 in v194 do
                                if v199:IsA("Beam") then
                                    local l_l_TweenService_0_Value_2 = l_TweenService_0:GetValue(math.clamp(v197 / 9, 0, 1), Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                                    v199.Transparency = NumberSequence.new(1 + -1 * l_l_TweenService_0_Value_2);
                                end;
                            end;
                            task.wait(0.016666666666666666 / v145);
                        end;
                        task.wait(0.9 / v145);
                        for v201 = 1, 96 do
                            for _, v203 in v194 do
                                if v203:IsA("Beam") then
                                    local l_l_TweenService_0_Value_3 = l_TweenService_0:GetValue(math.clamp(v201 / 96, 0, 1), Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                                    v203.Transparency = NumberSequence.new(0 + 1 * l_l_TweenService_0_Value_3);
                                end;
                            end;
                            task.wait(0.016666666666666666 / v145);
                        end;
                        task.wait(5);
                        for _, v206 in v194 do
                            v206:Destroy();
                        end;
                    end);
                    task.defer(function() --[[ Line: 798 ]]
                        -- upvalues: v145 (ref), l_Workspace_0 (ref), l_Character_0 (ref), l_TweenService_0 (ref)
                        task.wait(0.016666666666666666 / v145);
                        local v207 = script.Lights:Clone();
                        v207.Parent = l_Workspace_0.Debris;
                        v207:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.new(0, 2, 0));
                        local l_Light1_0 = v207.MLight.Light1;
                        local l_Light2_0 = v207.MeguLight.Light2;
                        l_TweenService_0:Create(l_Light1_0, TweenInfo.new(0.21666666666666667 / v145, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Brightness = 1.9, 
                            Range = 8
                        }):Play();
                        l_TweenService_0:Create(l_Light2_0, TweenInfo.new(0.21666666666666667 / v145, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Brightness = 1.9, 
                            Range = 8
                        }):Play();
                        task.wait(2.2666666666666666 / v145);
                        l_TweenService_0:Create(l_Light1_0, TweenInfo.new(1 / v145, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
                            Brightness = 0, 
                            Range = 0
                        }):Play();
                        l_TweenService_0:Create(l_Light2_0, TweenInfo.new(1 / v145, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
                            Brightness = 0, 
                            Range = 0
                        }):Play();
                        task.wait(5);
                        v207:Destroy();
                    end);
                    task.defer(function() --[[ Line: 834 ]]
                        -- upvalues: v86 (ref), v145 (ref), l_TweenService_0 (ref), l_CurrentCamera_0 (ref), v22 (ref)
                        if not v86 then
                            return;
                        else
                            task.wait(0.13333333333333333 / v145);
                            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.38333333333333336 / v145, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                FieldOfView = 20
                            }):Play();
                            task.wait(2.6333333333333333 / v145);
                            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(3.6 / v145, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                                FieldOfView = 60
                            }):Play();
                            v22.CameraShake({
                                Preset = "LightHit", 
                                WaitTime = 2, 
                                Fade = 2
                            });
                            return;
                        end;
                    end);
                    task.defer(function() --[[ Line: 850 ]]
                        -- upvalues: v145 (ref), l_SoundHelper_0 (ref), v86 (ref), l_Workspace_0 (ref), l_Character_0 (ref), v22 (ref), v87 (ref), l_LookVector_0 (ref), v142 (ref), l_PrimaryPart_0 (ref), l_SimulateKnockbackBE_0 (ref), l_Nametag_0 (ref), v91 (ref)
                        task.wait(3.933333333333333 / v145 - 0.27 / v145);
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v86 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                            DirectCopy = script.Sounds.MahoragaHit
                        });
                        task.wait(0.27);
                        task.defer(function() --[[ Line: 861 ]]
                            -- upvalues: v86 (ref), v22 (ref)
                            if not v86 then
                                return;
                            else
                                v22.HUDShake({
                                    Scale = 20, 
                                    Damper = 0.09999999999999999
                                });
                                task.defer(function() --[[ Line: 869 ]]
                                    -- upvalues: v22 (ref)
                                    v22.CameraShake({
                                        Preset = "Knockdown", 
                                        WaitTime = 0.5, 
                                        Fade = 2, 
                                        FoV = 55, 
                                        FoVMult = 1
                                    });
                                end);
                                v22.CreateImpactFrame({
                                    Time = 0.06
                                });
                                return;
                            end;
                        end);
                        local l_l_Workspace_0_ServerTimeNow_1 = l_Workspace_0:GetServerTimeNow();
                        local v211 = {
                            Victim = v87, 
                            LookVector = l_LookVector_0, 
                            EndPosition = v142 - v87.PrimaryPart.CFrame.RightVector * 10, 
                            VictimPosition = l_PrimaryPart_0.Position, 
                            TargetVector = v142, 
                            StartTime = l_l_Workspace_0_ServerTimeNow_1, 
                            TargetTime = 0.08333333333333333, 
                            HitIndex = 3
                        };
                        l_SimulateKnockbackBE_0:Fire(v211);
                        task.wait(0.1 / v145);
                        v87:Destroy();
                        if l_Nametag_0 and not l_Workspace_0.Settings.HideNametags.Value then
                            l_Nametag_0.Enabled = v91;
                        end;
                    end);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v86 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Rustle1
                    });
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v86 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Emerge
                    });
                    task.defer(function() --[[ Line: 921 ]]
                        -- upvalues: v145 (ref), v171 (ref), l_SoundHelper_0 (ref), v86 (ref), l_Workspace_0 (ref), l_Character_0 (ref), v172 (ref)
                        task.wait(0.1 / v145);
                        v171.Enabled = true;
                        task.wait(0.18333333333333332 / v145);
                        v171:Emit(50);
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v86 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                            DirectCopy = script.Sounds.Rustle2
                        });
                        task.wait(0.4666666666666667 / v145);
                        v172.Mouth:Emit(25);
                        task.wait(0.1 / v145);
                        v172.Steam:Emit(35);
                        task.wait(0.25 / v145);
                        v172.Steam:Emit(35);
                        task.wait(0.25 / v145);
                        v172.Steam:Emit(35);
                        task.wait(0.8833333333333333 / v145);
                        v171.Enabled = false;
                    end);
                end);
                if v86 then
                    task.defer(function() --[[ Line: 953 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.3, 
                            Fade = 3
                        });
                    end);
                end;
                task.delay(1.5, function() --[[ Line: 962 ]]
                    -- upvalues: l_SoundHelper_0 (ref), v86 (copy), l_Workspace_0 (ref), l_Character_0 (copy), l_TweenService_0 (ref)
                    local v212 = l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v86 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Theme
                    });
                    local l_Volume_0 = v212.Volume;
                    v212.Volume = 0;
                    v212.TimePosition = 0;
                    l_TweenService_0:Create(v212, TweenInfo.new(4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                        Volume = l_Volume_0
                    }):Play();
                end);
                task.delay(v146, function() --[[ Line: 976 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_0 (copy), v145 (copy), l_l_AnimHelper_0_Anim_1 (copy), l_l_AnimHelper_0_Anim_2 (copy), l_SoundHelper_0 (ref), v86 (copy), l_Workspace_0 (ref), l_Character_0 (copy), v87 (copy), l_LookVector_0 (copy), v22 (ref)
                    l_l_AnimHelper_0_Anim_0:AdjustSpeed(v145);
                    l_l_AnimHelper_0_Anim_1:AdjustSpeed(v145);
                    l_l_AnimHelper_0_Anim_2:AdjustSpeed(v145);
                    l_l_AnimHelper_0_Anim_0.TimePosition = l_l_AnimHelper_0_Anim_1.TimePosition;
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v86 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Land1
                    });
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v86 and l_Workspace_0.Debris or l_Character_0.PrimaryPart, 
                        DirectCopy = script.Sounds.Metal2
                    });
                    local v214 = script.FallSmoke:Clone();
                    v214.Position = (CFrame.lookAt(v87.UpperTorso.Position, v87.UpperTorso.Position + l_LookVector_0) * CFrame.new(0, 0, 0)).Position - Vector3.new(0, 2.5999999046325684, 0, 0);
                    v214.Parent = l_Workspace_0.Debris;
                    for _, v216 in v214.Particle:GetChildren() do
                        v216.Enabled = false;
                        v216:Emit(v216:GetAttribute("EmitCount"));
                    end;
                    if v86 then
                        v22.HUDShake({
                            Scale = 10, 
                            Damper = 0.09999999999999999
                        });
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.4, 
                            Fade = 2.5
                        });
                    end;
                    task.wait(5);
                    v214:Destroy();
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_0.PrimaryPart
                });
                if l_Occupied_0 and l_LocalPlayer_0.Character == l_Character_0 then
                    l_Occupied_0.Target.Value = l_LookVector_0;
                    l_Occupied_0.LockedOn.Value = l_Damager_0;
                end;
                local l_CameraSettings_0 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_0.CameraTarget;
                local l_CameraMode_0 = l_CameraSettings_0.CameraMode;
                local l_Variant_0 = l_CameraSettings_0.Variant;
                local l_Vignette_0 = l_Main_0.DownFrame.Vignette;
                local v222 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v85 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Vignette_0, v222, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v85 then
                    l_Occupied_0.LerpMult.Value = 0.1;
                end;
                if v86 then
                    task.delay(0.3333333333333333 / v145, function() --[[ Line: 1048 ]]
                        -- upvalues: v154 (copy), l_Character_0 (copy), l_CameraMode_0 (copy), l_CurrentCamera_0 (copy), l_TweenService_0 (ref), v145 (copy), l_RunService_0 (ref), v42 (ref), l_Damager_0 (copy), l_Vignette_0 (copy), v222 (copy), l_LocalPlayer_0 (ref), v22 (ref), l_Humanoid_1 (copy), l_LookVector_0 (copy)
                        v154:PivotTo(l_Character_0.PrimaryPart.CFrame * CFrame.Angles(0, 0, 0) * CFrame.new(0, 0, 0));
                        l_CameraMode_0.Value = "Cutscene";
                        l_CurrentCamera_0.FieldOfView = 35;
                        l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5833333333333334 / v145, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                            FieldOfView = 30
                        }):Play();
                        task.delay(0.5833333333333334 / v145, function() --[[ Line: 1056 ]]
                            -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_0 (ref), v145 (ref)
                            l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.7833333333333333 / v145, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                FieldOfView = 22
                            }):Play();
                        end);
                        l_RunService_0:BindToRenderStep("CameraRig", Enum.RenderPriority.Camera.Value + 6, function(_) --[[ Line: 1060 ]]
                            -- upvalues: v154 (ref), l_CurrentCamera_0 (ref)
                            if not v154 then
                                return;
                            else
                                l_CurrentCamera_0.CFrame = v154.Head.CFrame;
                                return;
                            end;
                        end);
                        v42(l_Damager_0, 1);
                        l_TweenService_0:Create(l_Vignette_0, v222, {
                            ImageTransparency = 0.2
                        }):Play();
                        if l_LocalPlayer_0.Character == l_Damager_0 then
                            v22.KnockdownWalk({
                                Damager = l_Damager_0, 
                                DamagerHumanoid = l_Humanoid_1, 
                                LookVector = l_LookVector_0
                            });
                        end;
                    end);
                end;
                task.wait(v146);
                local _ = {};
                task.wait(0.8333333333333334 / v145);
                local v225 = v0.DelayTime - l_Workspace_0.Ping.Value / 2 - v69.RandomMult * v0.RandomTime + v69.ExtraTime;
                if v86 then
                    local v226 = v225 - 5.25 - v69.ExtraTime;
                    local l_v226_0 = v226 --[[ copy: 70 -> 77 ]];
                    task.defer(function() --[[ Line: 1101 ]]
                        -- upvalues: l_v226_0 (copy), v22 (ref), v69 (copy)
                        task.wait(l_v226_0);
                        v22.CameraShake({
                            Preset = "SuperLight", 
                            WaitTime = 6 + v69.ExtraTime, 
                            Fade = 2
                        });
                    end);
                end;
                task.delay(v225, function() --[[ Line: 1112 ]]
                    -- upvalues: l_Character_0 (copy)
                    l_Character_0:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_0:SetAttribute("GettingUp", nil);
                end);
                local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                l_Damager_0:SetAttribute("CurrentEmote", nil);
                local v229 = tick();
                repeat
                    task.wait(0.1);
                until l_Character_0:GetAttribute("GettingUp") or not l_Character_0:IsDescendantOf(l_Workspace_0) or tick() - v229 > 15;
                task.delay(0.25 / v145, function() --[[ Line: 1128 ]]
                    -- upvalues: l_Lighting_0 (ref), l_l_Players_0_PlayerFromCharacter_0 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v22 (ref), l_TweenService_0 (ref)
                    local l_ColorCorrection_0 = l_Lighting_0.ColorCorrection;
                    if l_l_Players_0_PlayerFromCharacter_0 or l_LocalPlayer_0.Character == l_Damager_0 then
                        task.defer(function() --[[ Line: 1132 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "Knockdown", 
                                WaitTime = 0.35, 
                                Fade = 1, 
                                FoV = 55, 
                                FoVMult = 1
                            });
                        end);
                        v22.HUDShake({
                            Scale = 20, 
                            Damper = 0.09999999999999999
                        });
                        l_ColorCorrection_0.Saturation = 0;
                        l_ColorCorrection_0.Contrast = 0;
                        l_ColorCorrection_0.Enabled = true;
                        local v231 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrection_0, v231, {
                            Saturation = -1, 
                            Contrast = 0.5
                        }):Play();
                        local l_MenuBlur_1 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_1.Size = 0;
                        l_MenuBlur_1.Enabled = true;
                        local v233 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_1, v233, {
                            Size = 10
                        }):Play();
                        local v234 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v234, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                    end;
                    task.wait(0.7);
                end);
                task.delay(0.25, function() --[[ Line: 1169 ]]
                    -- upvalues: v85 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), v42 (ref), l_TweenService_0 (ref), l_Vignette_0 (copy), v222 (copy), l_CameraMode_0 (copy), l_Variant_0 (copy), l_RunService_0 (ref), v154 (copy)
                    if v85 or l_LocalPlayer_0.Character == l_Damager_0 then
                        v42(l_Damager_0, 0);
                        l_TweenService_0:Create(l_Vignette_0, v222, {
                            ImageTransparency = 1
                        }):Play();
                        task.defer(function() --[[ Line: 1174 ]]
                            -- upvalues: l_CameraMode_0 (ref), l_Variant_0 (ref), l_RunService_0 (ref)
                            l_CameraMode_0.Value = "";
                            l_Variant_0.Value = "";
                            l_RunService_0:UnbindFromRenderStep("CameraRig");
                        end);
                    end;
                    if v154 then
                        v154:Destroy();
                    end;
                end);
                l_SoundHelper_0:PlaySound({
                    Name = "GetUpCheer", 
                    Parent = l_Workspace_0.Debris
                });
                task.delay(0.44999999999999996, function() --[[ Line: 1194 ]]
                    -- upvalues: v70 (copy), l_SoundHelper_0 (ref), l_Character_0 (copy), v85 (copy), l_LocalPlayer_0 (ref), l_Damager_0 (copy), l_Workspace_0 (ref), v22 (ref), v84 (copy)
                    print(v70 - tick());
                    l_SoundHelper_0:PlaySound({
                        Name = "BoxLayer", 
                        Parent = l_Character_0.PrimaryPart
                    });
                    task.wait(0.2);
                    if v85 or l_LocalPlayer_0.Character == l_Damager_0 then
                        l_SoundHelper_0:PlaySound({
                            Name = "Box", 
                            Parent = l_Workspace_0.Debris
                        });
                    end;
                    task.wait(0.9);
                    if v85 or l_LocalPlayer_0.Character == l_Damager_0 then
                        v22.TripleText({
                            Image = v84.Box, 
                            HoldTime = 0.6666666666666666
                        });
                        v22.CameraShake({
                            Preset = "MedHit", 
                            WaitTime = 0.1, 
                            Fade = 0.5
                        });
                    end;
                end);
                if l_Occupied_0 and l_Occupied_0:FindFirstChild("Target") then
                    l_Occupied_0.Target.Value = Vector3.new();
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "Rustle3", 
                    Parent = l_Character_0.PrimaryPart, 
                    Volume = 1
                });
                task.wait(1.25);
                if v85 or l_LocalPlayer_0.Character == l_Damager_0 then
                    l_TweenService_0:Create(l_Lighting_0, v147, {
                        ExposureCompensation = l_Workspace_0.Exposure.Value
                    }):Play();
                end;
                if v85 then
                    l_Occupied_0.LerpMult.Value = 0;
                end;
                if v85 or l_LocalPlayer_0.Character == l_Damager_0 then
                    local l_ColorCorrection_1 = l_Lighting_0.ColorCorrection;
                    local v236 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_1, v236, {
                        Saturation = 0, 
                        Contrast = 0
                    }):Play();
                end;
                if l_Damager_0 and l_Damager_0.PrimaryPart then
                    l_Damager_0.PrimaryPart.Anchored = false;
                end;
                if l_Character_0 and l_Character_0.PrimaryPart then
                    l_Character_0.PrimaryPart.Anchored = false;
                end;
                for v237, v238 in v148 do
                    v237.CollisionGroup = v238;
                end;
                for _, v240 in v180 do
                    v240:Disconnect();
                end;
                task.wait(5);
                for _, v242 in v170 do
                    v242:Destroy();
                end;
                l_l_AnimHelper_0_Anim_1:Stop(0);
                l_l_AnimHelper_0_Anim_0:Stop(0);
                if v84 then
                    v84:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.Getup = function(v243) --[[ Line: 1276 ]] --[[ Name: Getup ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), v22 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_SoundHelper_0 (copy), l_Main_0 (copy), v42 (copy)
        local v244 = tick();
        local l_Character_1 = v243.Character;
        local l_Damager_1 = v243.Damager;
        local l_StartPosition_1 = v243.StartPosition;
        local l_LookVector_1 = v243.LookVector;
        local l_FirstChild_3 = l_Workspace_0.States:FindFirstChild(l_Character_1.Name);
        local l_CharacterData_1 = l_FirstChild_3:FindFirstChild("CharacterData");
        local l_PlayerData_1 = l_FirstChild_3:FindFirstChild("PlayerData");
        local l_Occupied_1 = l_FirstChild_3:FindFirstChild("Occupied");
        if not l_CharacterData_1 or not l_PlayerData_1 or not l_Occupied_1 then
            return;
        else
            local l_l_Players_0_PlayerFromCharacter_1 = l_Players_0:GetPlayerFromCharacter(l_Character_1);
            local l_Humanoid_2 = l_Character_1:FindFirstChild("Humanoid");
            local v255 = l_Humanoid_2 and l_Humanoid_2:FindFirstChild("Animator");
            local l_Humanoid_3 = l_Damager_1:FindFirstChild("Humanoid");
            local v257 = l_Humanoid_3 and l_Humanoid_3:FindFirstChild("Animator");
            if not v255 or not v257 then
                return;
            else
                local v258 = l_Assets_0.DownFrames.Default:Clone();
                local v259 = l_LocalPlayer_0.Character == l_Character_1;
                local v260 = v259 or l_LocalPlayer_0.Character == l_Damager_1;
                if v260 then
                    v258.Parent = l_Common_0;
                end;
                local v261 = v22.GetWeldCharacter(l_Character_1);
                local v262 = 0.1;
                local l_l_RayHelper_0_EnvironmentWhitelist_1 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_1, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_1, l_StartPosition_1 - l_LookVector_1, v262 + 0, l_l_RayHelper_0_EnvironmentWhitelist_1);
                local v267 = l_StartPosition_1 - l_LookVector_1 * v262;
                if l_l_RayHelper_0_RayWithWhiteList_1 then
                    v267 = l_StartPosition_1 - l_LookVector_1 * 0.1;
                end;
                local v268 = v0.ServerDelayTime / (v0.ServerDelayTime + v243.ExtraTime);
                local v269 = 0.1 * v268;
                local v270 = 0.8 * v268;
                local v271 = 0.25 / v269;
                local v272 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v273 = {};
                for _, v275 in l_Character_1:GetDescendants() do
                    if v275:IsA("BasePart") and v275 ~= l_Character_1.PrimaryPart then
                        v273[v275] = v275.CollisionGroup;
                        v275.CollisionGroup = "None";
                    end;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = true;
                end;
                for _, v277 in (v257:GetPlayingAnimationTracks()) do
                    if v277.Priority == Enum.AnimationPriority.Action or v277.Priority == Enum.AnimationPriority.Action2 or v277.Priority == Enum.AnimationPriority.Action3 then
                        local l_Speed_1 = v277.Speed;
                        v277:AdjustSpeed(l_Speed_1 / 3);
                        task.delay(v271, function() --[[ Line: 1348 ]]
                            -- upvalues: v277 (copy), l_Speed_1 (copy)
                            if not v277 then
                                return;
                            else
                                v277:AdjustSpeed(l_Speed_1);
                                return;
                            end;
                        end);
                    end;
                end;
                local v279 = {
                    AnimId = v0.Animations.Getup, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = v269, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = v255, 
                    Weight = 1000, 
                    Looped = false, 
                    Name = "Knockdown", 
                    StopInfo = {
                        StopDelay = v271 + 6.666666666666667 - 0.2, 
                        StopTime = 1, 
                        Weight = 1
                    }
                };
                local l_l_AnimHelper_0_Anim_3 = l_AnimHelper_0:CreateAnim(v279);
                local l_PrimaryPart_1 = l_Character_1.PrimaryPart;
                local _ = l_PrimaryPart_1.CFrame;
                local l_l_Workspace_0_ServerTimeNow_2 = l_Workspace_0:GetServerTimeNow();
                local _ = {
                    Victim = l_Character_1, 
                    LookVector = l_LookVector_1, 
                    EndPosition = v267 + Vector3.new(0, 0.800000011920929, 0, 0), 
                    VictimPosition = l_PrimaryPart_1.Position, 
                    TargetVector = v267 - v267, 
                    StartTime = l_l_Workspace_0_ServerTimeNow_2, 
                    TargetTime = 0.25, 
                    HitIndex = 3
                };
                local v285 = {};
                local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                local v287 = {};
                local v288 = script.Particles.UpperTorso.Embers:Clone();
                v288.Name = script.Name;
                v288.Parent = v261.UpperTorso;
                local v289 = script.Particles.Head:Clone();
                v289.Name = script.Name;
                v289.Parent = v261:FindFirstChild("Head") or v261.PrimaryPart;
                table.insert(v287, v288);
                table.insert(v287, v289);
                local l_CameraSettings_1 = l_Workspace_0:FindFirstChild("CameraSettings");
                local l_CameraTarget_1 = l_CameraSettings_1.CameraTarget;
                local l_CameraMode_1 = l_CameraSettings_1.CameraMode;
                local l_Variant_1 = l_CameraSettings_1.Variant;
                local l_ColorCorrectionEffect_1 = Instance.new("ColorCorrectionEffect");
                l_ColorCorrectionEffect_1.Parent = l_Lighting_0;
                v285[#v285 + 1] = l_l_AnimHelper_0_Anim_3:GetMarkerReachedSignal("Start"):Connect(function() --[[ Line: 1416 ]]
                    -- upvalues: v261 (copy), l_Character_1 (copy), v260 (copy), l_TweenService_0 (ref), l_ColorCorrectionEffect_1 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), v270 (copy), v267 (ref), l_LookVector_1 (copy), v22 (ref), l_CurrentCamera_1 (copy), l_Lighting_0 (ref), v288 (copy), v289 (copy)
                    local l_Highlight_1 = Instance.new("Highlight");
                    l_Highlight_1.OutlineTransparency = 1;
                    l_Highlight_1.FillTransparency = 0;
                    l_Highlight_1.FillColor = Color3.fromRGB(255, 255, 255);
                    l_Highlight_1.DepthMode = Enum.HighlightDepthMode.Occluded;
                    l_Highlight_1.Parent = v261;
                    l_Highlight_1.Adornee = l_Character_1;
                    if v260 then
                        l_TweenService_0:Create(l_ColorCorrectionEffect_1, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            Brightness = -0.1, 
                            Contrast = 0.6, 
                            Saturation = -0.5
                        }):Play();
                    end;
                    task.delay(0.16666666666666666, function() --[[ Line: 1433 ]]
                        -- upvalues: l_SoundHelper_0 (ref), v260 (ref), l_Workspace_0 (ref), l_Character_1 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v260 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                            DirectCopy = script.Sounds.Adaptation
                        });
                    end);
                    task.delay(1, function() --[[ Line: 1441 ]]
                        -- upvalues: v260 (ref), l_TweenService_0 (ref), l_ColorCorrectionEffect_1 (ref), l_Character_1 (ref)
                        if v260 then
                            l_TweenService_0:Create(l_ColorCorrectionEffect_1, TweenInfo.new(9, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Brightness = 0, 
                                Contrast = 0, 
                                Saturation = 0
                            }):Play();
                        end;
                        task.wait(0.16666666666666666);
                        local l_Wheel_0 = l_Character_1.Head:FindFirstChild("Wheel");
                        if not l_Wheel_0 then
                            return;
                        else
                            local v297 = l_Wheel_0.C1 * CFrame.Angles(0, 3.141592653589793, 0);
                            l_TweenService_0:Create(l_Wheel_0, TweenInfo.new(0.75, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
                                C1 = v297
                            }):Play();
                            return;
                        end;
                    end);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v260 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Magic
                    });
                    task.delay(0.6333333333333333 / v270, function() --[[ Line: 1465 ]]
                        -- upvalues: l_SoundHelper_0 (ref), v260 (ref), l_Workspace_0 (ref), l_Character_1 (ref), v267 (ref), l_LookVector_1 (ref)
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v260 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                            DirectCopy = script.Sounds.Land1
                        });
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v260 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                            DirectCopy = script.Sounds.Metal2
                        });
                        local v298 = script.FallSmoke2:Clone();
                        v298.Position = (CFrame.lookAt(v267, v267 + l_LookVector_1) * CFrame.new(0, 0, 4.7)).Position - Vector3.new(0, 2.5, 0, 0);
                        v298.Parent = l_Workspace_0.Debris;
                        for _, v300 in v298:GetDescendants() do
                            if v300:IsA("ParticleEmitter") then
                                v300.Enabled = false;
                                v300:Emit(v300.Rate);
                            end;
                        end;
                        task.wait(5);
                        v298:Destroy();
                    end);
                    task.defer(function() --[[ Line: 1492 ]]
                        -- upvalues: v270 (ref), v260 (ref), v22 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_1 (ref)
                        task.wait(2.05 / v270);
                        for _, v302 in {
                            0, 
                            32, 
                            28, 
                            32, 
                            28
                        } do
                            task.wait(v302 / 60 / v270);
                            task.defer(function() --[[ Line: 1500 ]]
                                -- upvalues: v260 (ref), v22 (ref)
                                if not v260 then
                                    return;
                                else
                                    v22.CameraShake({
                                        Preset = "MedHit", 
                                        WaitTime = 0.1, 
                                        Fade = 0.2
                                    });
                                    return;
                                end;
                            end);
                            l_SoundHelper_0:PlaySound({
                                Name = "Knockdown", 
                                Parent = v260 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                                DirectCopy = script.Sounds.Steps
                            });
                        end;
                    end);
                    task.defer(function() --[[ Line: 1518 ]]
                        -- upvalues: v260 (ref), v22 (ref), l_TweenService_0 (ref), l_CurrentCamera_1 (ref), v270 (ref)
                        if v260 then
                            task.defer(function() --[[ Line: 1520 ]]
                                -- upvalues: v22 (ref)
                                v22.CreateImpactFrame({
                                    Time = 0.06
                                });
                            end);
                            l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(0.16666666666666666, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                FieldOfView = 70
                            }):Play();
                            task.wait(0.16666666666666666 / v270);
                            l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                FieldOfView = 45
                            }):Play();
                            task.wait(1.7333333333333334 / v270);
                            l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                                FieldOfView = 70
                            }):Play();
                            v22.CameraShake({
                                Preset = "SuperLight", 
                                WaitTime = 2.2, 
                                Fade = 2
                            });
                        end;
                    end);
                    l_TweenService_0:Create(l_Highlight_1, TweenInfo.new(0.36666666666666664, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                        FillTransparency = 1
                    }):Play();
                    task.defer(function() --[[ Line: 1550 ]]
                        -- upvalues: v260 (ref), v22 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref)
                        if not v260 then
                            return;
                        else
                            v22.HUDShake({
                                Scale = 20, 
                                Damper = 0.09999999999999999
                            });
                            local l_ColorCorrection_2 = l_Lighting_0.ColorCorrection;
                            l_ColorCorrection_2.Saturation = 0;
                            l_ColorCorrection_2.Contrast = 0;
                            l_ColorCorrection_2.Enabled = true;
                            local v304 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                            l_TweenService_0:Create(l_ColorCorrection_2, v304, {
                                Saturation = -0.5, 
                                Contrast = 0.5
                            }):Play();
                            local l_MenuBlur_2 = l_Lighting_0.MenuBlur;
                            l_MenuBlur_2.Size = 0;
                            l_MenuBlur_2.Enabled = true;
                            local v306 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_MenuBlur_2, v306, {
                                Size = 10
                            }):Play();
                            local v307 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                            l_TweenService_0:Create(l_Lighting_0, v307, {
                                ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                            }):Play();
                            v22.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.3, 
                                Fade = 0.3
                            });
                            return;
                        end;
                    end);
                    v288:Emit(35);
                    task.wait(1.5 / v270);
                    task.wait(2.566666666666667 / v270);
                    l_TweenService_0:Create(l_CurrentCamera_1, TweenInfo.new(3.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        FieldOfView = 60
                    }):Play();
                    task.wait(0.5 / v270);
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v260 and l_Workspace_0.Debris or l_Character_1.PrimaryPart, 
                        DirectCopy = script.Sounds.Growl
                    });
                    v289.Breath:Emit(25);
                    task.defer(function() --[[ Line: 1599 ]]
                        -- upvalues: v260 (ref), v22 (ref)
                        if not v260 then
                            return;
                        else
                            v22.CameraShake({
                                Preset = "HardHit", 
                                WaitTime = 0.1, 
                                Fade = 0.8
                            });
                            return;
                        end;
                    end);
                    l_Highlight_1:Destroy();
                end);
                if v260 then
                    task.defer(function() --[[ Line: 1613 ]]
                        -- upvalues: v22 (ref)
                        v22.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.3, 
                            Fade = 3
                        });
                    end);
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_1.PrimaryPart
                });
                if l_Occupied_1 and l_LocalPlayer_0.Character == l_Character_1 then
                    l_Occupied_1.Target.Value = l_LookVector_1;
                    l_Occupied_1.LockedOn.Value = l_Damager_1;
                end;
                local l_Vignette_1 = l_Main_0.DownFrame.Vignette;
                local v309 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                if v259 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Vignette_1, v309, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v259 then
                    l_Occupied_1.LerpMult.Value = 0.1;
                end;
                local _ = {};
                local v311 = v0.DelayTime - l_Workspace_0.Ping.Value / 2 - v243.RandomMult * v0.RandomTime + v243.ExtraTime;
                task.delay(v311, function() --[[ Line: 1650 ]]
                    -- upvalues: l_Character_1 (copy)
                    l_Character_1:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_1:SetAttribute("GettingUp", nil);
                end);
                local _ = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                task.delay(0.8333333333333334, function() --[[ Line: 1659 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_3 (copy), v270 (copy)
                    l_l_AnimHelper_0_Anim_3:AdjustSpeed(v270);
                end);
                if v260 then
                    task.delay(0.8333333333333334, function() --[[ Line: 1664 ]]
                        -- upvalues: l_Variant_1 (copy), l_CameraMode_1 (copy), l_CameraTarget_1 (copy), l_Character_1 (copy), l_CurrentCamera_1 (copy), v42 (ref), l_Damager_1 (copy), l_TweenService_0 (ref), l_Vignette_1 (copy), v309 (copy), l_Lighting_0 (ref), l_LocalPlayer_0 (ref), v22 (ref), l_Humanoid_3 (copy), l_LookVector_1 (copy)
                        l_Variant_1.Value = "Mahoraga";
                        l_CameraMode_1.Value = "Knockdown";
                        l_CameraTarget_1.Value = l_Character_1;
                        l_CurrentCamera_1.FieldOfView = 70;
                        v42(l_Damager_1, 1);
                        l_TweenService_0:Create(l_Vignette_1, v309, {
                            ImageTransparency = 0.2
                        }):Play();
                        l_Lighting_0.ColorCorrection.Enabled = true;
                        if l_LocalPlayer_0.Character == l_Damager_1 then
                            v22.KnockdownWalk({
                                Damager = l_Damager_1, 
                                DamagerHumanoid = l_Humanoid_3, 
                                LookVector = l_LookVector_1
                            });
                        end;
                    end);
                end;
                l_Damager_1:SetAttribute("CurrentEmote", nil);
                local v313 = tick();
                repeat
                    task.wait(0.1);
                until l_Character_1:GetAttribute("GettingUp") or not l_Character_1:IsDescendantOf(l_Workspace_0) or tick() - v313 > 15;
                task.wait(1.9);
                task.delay(0.25, function() --[[ Line: 1697 ]]
                    -- upvalues: l_Lighting_0 (ref), l_l_Players_0_PlayerFromCharacter_1 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), v22 (ref), l_TweenService_0 (ref)
                    local l_ColorCorrection_3 = l_Lighting_0.ColorCorrection;
                    if l_l_Players_0_PlayerFromCharacter_1 or l_LocalPlayer_0.Character == l_Damager_1 then
                        task.defer(function() --[[ Line: 1701 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "Knockdown", 
                                WaitTime = 0.35, 
                                Fade = 1, 
                                FoV = 55, 
                                FoVMult = 1
                            });
                        end);
                        v22.HUDShake({
                            Scale = 20, 
                            Damper = 0.09999999999999999
                        });
                        l_ColorCorrection_3.Saturation = 0;
                        l_ColorCorrection_3.Contrast = 0;
                        l_ColorCorrection_3.Enabled = true;
                        local v315 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        l_TweenService_0:Create(l_ColorCorrection_3, v315, {
                            Saturation = -1, 
                            Contrast = 0.5
                        }):Play();
                        local l_MenuBlur_3 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_3.Size = 0;
                        l_MenuBlur_3.Enabled = true;
                        local v317 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_3, v317, {
                            Size = 10
                        }):Play();
                        local v318 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v318, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                    end;
                    task.wait(0.7);
                end);
                local l_l_Character_1_Attribute_0 = l_Character_1:GetAttribute("ActiveNPC");
                if v259 or l_LocalPlayer_0.Character == l_Damager_1 and not l_l_Character_1_Attribute_0 then
                    v42(l_Damager_1, 0);
                    l_TweenService_0:Create(l_Vignette_1, v309, {
                        ImageTransparency = 1
                    }):Play();
                    task.defer(function() --[[ Line: 1743 ]]
                        -- upvalues: l_CameraMode_1 (copy), l_Variant_1 (copy)
                        l_CameraMode_1.Value = "";
                        l_Variant_1.Value = "";
                    end);
                end;
                if not l_l_Character_1_Attribute_0 then
                    l_SoundHelper_0:PlaySound({
                        Name = "GetUpCheer", 
                        Parent = l_Workspace_0.Debris
                    });
                end;
                if not l_l_Character_1_Attribute_0 then
                    task.delay(1.05, function() --[[ Line: 1759 ]]
                        -- upvalues: v244 (copy), l_SoundHelper_0 (ref), l_Character_1 (copy), v259 (copy), l_LocalPlayer_0 (ref), l_Damager_1 (copy), l_Workspace_0 (ref), v22 (ref), v258 (copy)
                        print(v244 - tick());
                        l_SoundHelper_0:PlaySound({
                            Name = "BoxLayer", 
                            Parent = l_Character_1.PrimaryPart
                        });
                        task.wait(0.2);
                        if v259 or l_LocalPlayer_0.Character == l_Damager_1 then
                            l_SoundHelper_0:PlaySound({
                                Name = "Box", 
                                Parent = l_Workspace_0.Debris
                            });
                        end;
                        task.wait(0.9);
                        if v259 or l_LocalPlayer_0.Character == l_Damager_1 then
                            v22.TripleText({
                                Image = v258.Box, 
                                HoldTime = 0.6666666666666666
                            });
                            v22.CameraShake({
                                Preset = "MedHit", 
                                WaitTime = 0.1, 
                                Fade = 0.5
                            });
                        end;
                    end);
                end;
                if l_Occupied_1 and l_Occupied_1:FindFirstChild("Target") then
                    l_Occupied_1.Target.Value = Vector3.new();
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "Rustle3", 
                    Parent = l_Character_1.PrimaryPart, 
                    Volume = 1
                });
                task.wait(1.25);
                if v259 or l_LocalPlayer_0.Character == l_Damager_1 then
                    l_TweenService_0:Create(l_Lighting_0, v272, {
                        ExposureCompensation = l_Workspace_0.Exposure.Value
                    }):Play();
                end;
                if v259 then
                    l_Occupied_1.LerpMult.Value = 0;
                end;
                if v259 or l_LocalPlayer_0.Character == l_Damager_1 then
                    local l_ColorCorrection_4 = l_Lighting_0.ColorCorrection;
                    local v321 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                    l_TweenService_0:Create(l_ColorCorrection_4, v321, {
                        Saturation = 0, 
                        Contrast = 0
                    }):Play();
                end;
                if l_Damager_1 and l_Damager_1.PrimaryPart then
                    l_Damager_1.PrimaryPart.Anchored = false;
                end;
                if l_Character_1 and l_Character_1.PrimaryPart then
                    l_Character_1.PrimaryPart.Anchored = false;
                end;
                for v322, v323 in v273 do
                    v322.CollisionGroup = v323;
                end;
                for _, v325 in v285 do
                    v325:Disconnect();
                end;
                task.wait(5);
                if l_ColorCorrectionEffect_1 then
                    l_ColorCorrectionEffect_1:Destroy();
                end;
                for _, v327 in v287 do
                    v327:Destroy();
                end;
                l_l_AnimHelper_0_Anim_3:Stop(0);
                if v258 then
                    v258:Destroy();
                end;
                return;
            end;
        end;
    end;
    v0.KO = function(v328) --[[ Line: 1843 ]] --[[ Name: KO ]]
        -- upvalues: l_Workspace_0 (copy), l_Players_0 (copy), l_Assets_0 (copy), l_LocalPlayer_0 (copy), l_Common_0 (copy), v22 (copy), l_RayHelper_0 (copy), v0 (copy), l_AnimHelper_0 (copy), l_SoundHelper_0 (copy), l_Lighting_0 (copy), l_TweenService_0 (copy), l_Main_0 (copy), l_RunService_0 (copy), v42 (copy)
        local l_Character_2 = v328.Character;
        local l_Damager_2 = v328.Damager;
        local l_StartPosition_2 = v328.StartPosition;
        local l_LookVector_2 = v328.LookVector;
        local l_FirstChild_4 = l_Workspace_0.States:FindFirstChild(l_Character_2.Name);
        local l_CharacterData_2 = l_FirstChild_4:FindFirstChild("CharacterData");
        local l_PlayerData_2 = l_FirstChild_4:FindFirstChild("PlayerData");
        local l_Occupied_2 = l_FirstChild_4:FindFirstChild("Occupied");
        if not l_CharacterData_2 or not l_PlayerData_2 or not l_Occupied_2 then
            return;
        else
            local _ = l_Players_0:GetPlayerFromCharacter(l_Character_2);
            local l_Humanoid_4 = l_Character_2:FindFirstChild("Humanoid");
            local v339 = l_Humanoid_4 and l_Humanoid_4:FindFirstChild("Animator");
            local l_Humanoid_5 = l_Damager_2:FindFirstChild("Humanoid");
            local v341 = l_Humanoid_5 and l_Humanoid_5:FindFirstChild("Animator");
            if not v339 or not v341 then
                return;
            else
                local v342 = l_Assets_0.DownFrames.Default:Clone();
                local v343 = l_LocalPlayer_0.Character == l_Character_2;
                if v343 or l_LocalPlayer_0.Character == l_Damager_2 then
                    v342.Parent = l_Common_0;
                end;
                local v344 = v22.GetWeldCharacter(l_Character_2);
                local v345 = 0.1;
                local l_l_RayHelper_0_EnvironmentWhitelist_2 = l_RayHelper_0:GetEnvironmentWhitelist();
                local l_l_RayHelper_0_RayWithWhiteList_2, _, _ = l_RayHelper_0:GetRayWithWhiteList(l_StartPosition_2, l_StartPosition_2 - l_LookVector_2, v345 + 0, l_l_RayHelper_0_EnvironmentWhitelist_2);
                local v350 = l_StartPosition_2 - l_LookVector_2 * v345;
                if l_l_RayHelper_0_RayWithWhiteList_2 then
                    v350 = l_StartPosition_2 - l_LookVector_2 * 0.1;
                end;
                local v351 = {};
                for _, v353 in l_Character_2:GetChildren() do
                    if v353:IsA("BasePart") and v353 ~= l_Character_2.PrimaryPart then
                        v351[v353] = v353.CollisionGroup;
                        v353.CollisionGroup = "None";
                    end;
                end;
                if not l_Character_2 or l_Character_2.PrimaryPart then

                end;
                for _, v355 in (v341:GetPlayingAnimationTracks()) do
                    if v355.Priority ~= Enum.AnimationPriority.Idle then
                        v355:AdjustSpeed(v355.Speed / 3);
                    end;
                end;
                local v356 = l_Assets_0.Camera:Clone();
                v356.Parent = l_Workspace_0.Debris;
                v356:PivotTo(l_Character_2.PrimaryPart.CFrame * CFrame.Angles(0, 0, 0) * CFrame.new(0, 0, 0));
                v356.Head.Transparency = 1;
                local v357 = {
                    AnimId = v0.Animations.KO, 
                    FadeIn = 0.05, 
                    NameFade = 0.1, 
                    AnimSpeed = 0.085, 
                    Priority = Enum.AnimationPriority.Action4, 
                    Animator = l_Humanoid_4, 
                    Weight = 10000, 
                    Name = "Knockdown"
                };
                local l_l_AnimHelper_0_Anim_4 = l_AnimHelper_0:CreateAnim(v357);
                v357.AnimId = v0.Animations.CameraKO;
                v357.Animator = v356.AnimationController;
                local l_l_AnimHelper_0_Anim_5 = l_AnimHelper_0:CreateAnim(v357);
                l_SoundHelper_0:PlaySound({
                    Name = "KnockdownPunch", 
                    Parent = l_Damager_2.PrimaryPart
                });
                local v360 = v343 or l_LocalPlayer_0.Character == l_Damager_2;
                task.delay(0.1, function() --[[ Line: 1943 ]]
                    -- upvalues: v360 (copy), v22 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref)
                    if not v360 then
                        return;
                    else
                        task.defer(function() --[[ Line: 1946 ]]
                            -- upvalues: v22 (ref)
                            v22.CameraShake({
                                Preset = "Knockdown", 
                                WaitTime = 0.5, 
                                Fade = 2
                            });
                        end);
                        local l_ColorCorrection_5 = l_Lighting_0.ColorCorrection;
                        l_ColorCorrection_5.Saturation = 0;
                        l_ColorCorrection_5.Contrast = 0;
                        l_ColorCorrection_5.Enabled = true;
                        local _ = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                        local l_MenuBlur_4 = l_Lighting_0.MenuBlur;
                        l_MenuBlur_4.Size = 0;
                        l_MenuBlur_4.Enabled = true;
                        local v364 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_MenuBlur_4, v364, {
                            Size = 30
                        }):Play();
                        local v365 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                        l_TweenService_0:Create(l_Lighting_0, v365, {
                            ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                        }):Play();
                        v22.CreateImpactFrame({
                            Time = 0.06
                        });
                        return;
                    end;
                end);
                task.delay(1.96078431372549, function() --[[ Line: 1976 ]]
                    -- upvalues: l_l_AnimHelper_0_Anim_4 (copy), l_l_AnimHelper_0_Anim_5 (copy)
                    l_l_AnimHelper_0_Anim_4:AdjustSpeed(0.72);
                    l_l_AnimHelper_0_Anim_5:AdjustSpeed(0.72);
                end);
                if v343 or l_LocalPlayer_0.Character == l_Damager_2 then
                    task.delay(0.8333333333333334, function() --[[ Line: 1982 ]]
                        -- upvalues: l_SoundHelper_0 (ref), l_Character_2 (copy)
                        l_SoundHelper_0:PlaySound({
                            Name = "Rustle3", 
                            Parent = l_Character_2.PrimaryPart, 
                            Volume = 2
                        });
                        task.wait(0.4666666666666667);
                        l_SoundHelper_0:PlaySound({
                            Name = "FeintRustle", 
                            Parent = l_Character_2.PrimaryPart, 
                            Volume = 0.3, 
                            Speed = 0.7
                        });
                    end);
                end;
                local l_PrimaryPart_2 = l_Character_2.PrimaryPart;
                local l_CFrame_2 = l_PrimaryPart_2.CFrame;
                l_PrimaryPart_2.Anchored = true;
                if l_Occupied_2 and l_LocalPlayer_0.Character == l_Character_2 then
                    l_Occupied_2.Target.Value = l_LookVector_2;
                    l_Occupied_2.LockedOn.Value = l_Damager_2;
                end;
                local l_CameraSettings_2 = l_Workspace_0:FindFirstChild("CameraSettings");
                local _ = l_CameraSettings_2.CameraTarget;
                local _ = l_CameraSettings_2.CameraMode;
                local l_Variant_2 = l_CameraSettings_2.Variant;
                local l_CameraMode_3 = l_Workspace_0:FindFirstChild("CameraSettings").CameraMode;
                local l_Vignette_2 = l_Main_0.DownFrame.Vignette;
                local v374 = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                local v375 = l_LocalPlayer_0.Character == l_Character_2;
                if v375 or l_LocalPlayer_0.Character == l_Damager_2 then
                    l_TweenService_0:Create(l_Vignette_2, v374, {
                        ImageTransparency = 0.2
                    }):Play();
                end;
                if v375 then
                    l_Occupied_2.LerpMult.Value = 0.1;
                end;
                local _ = {
                    HoldTime = 1.5
                };
                local v377 = script.Knockdown:Clone();
                v377.CFrame = CFrame.lookAt(l_CFrame_2.Position, v350);
                v377.Position = v377.Position + Vector3.new(0, 0.75, 0, 0);
                v377.Parent = l_Workspace_0.Debris;
                for _, v379 in v377.Particle:GetChildren() do
                    v379.Enabled = false;
                    v379:Emit(v379:GetAttribute("EmitCount"));
                end;
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = v360 and l_Workspace_0.Debris or l_Character_2.PrimaryPart, 
                    DirectCopy = script.Sounds.Punch
                });
                local l_CurrentCamera_2 = game.Workspace.CurrentCamera;
                local l_ColorCorrectionEffect_2 = Instance.new("ColorCorrectionEffect");
                l_ColorCorrectionEffect_2.Parent = l_Lighting_0;
                local v382 = v22.GetAtmosphere();
                local v383 = {
                    Density = v382.Density, 
                    Color = v382.Color, 
                    Haze = v382.Haze, 
                    Glare = v382.Glare, 
                    Decay = v382.Decay
                };
                local v384 = {
                    Density = 0.5, 
                    Color = Color3.fromRGB(0, 0, 0), 
                    Decay = Color3.fromRGB(0, 0, 0), 
                    Haze = 20, 
                    Glare = 0.4
                };
                local v385 = {};
                local v386 = script.Particles.Explosion:Clone();
                v386.Parent = v344.UpperTorso;
                local v387 = script.Particles.Fire1:Clone();
                v387.Parent = v344.UpperTorso;
                local v388 = script.Particles.Fire2:Clone();
                v388.Parent = v344.UpperTorso;
                table.insert(v385, v386);
                table.insert(v385, v387);
                table.insert(v385, v388);
                for _, v390 in v386:GetChildren() do
                    v390:Emit(v390:GetAttribute("EmitCount"));
                end;
                task.defer(function() --[[ Line: 2091 ]]
                    -- upvalues: v360 (copy), v22 (ref)
                    if not v360 then
                        return;
                    else
                        v22.CameraShake({
                            Preset = "LightHit", 
                            WaitTime = 4.5, 
                            Fade = 4
                        });
                        return;
                    end;
                end);
                local v391 = script.Particles.Head:Clone();
                v391.Name = script.Name;
                v391.Parent = v344:FindFirstChild("Head") or v344.PrimaryPart;
                table.insert(v385, v391);
                task.delay(2.9793028322440085, function() --[[ Line: 2107 ]]
                    -- upvalues: l_SoundHelper_0 (ref), v360 (copy), l_Workspace_0 (ref), l_Character_2 (copy), v391 (copy)
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v360 and l_Workspace_0.Debris or l_Character_2.PrimaryPart, 
                        DirectCopy = script.Sounds.Growl
                    });
                    v391.Breath:Emit(25);
                end);
                task.delay(2.5394880174291936, function() --[[ Line: 2117 ]]
                    -- upvalues: v360 (copy), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_2 (copy), l_LookVector_2 (copy), v22 (ref)
                    if not v360 then
                        return;
                    else
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v360 and l_Workspace_0.Debris or l_Character_2.PrimaryPart, 
                            DirectCopy = script.Sounds.Land1
                        });
                        l_SoundHelper_0:PlaySound({
                            Name = "Knockdown", 
                            Parent = v360 and l_Workspace_0.Debris or l_Character_2.PrimaryPart, 
                            DirectCopy = script.Sounds.Metal2
                        });
                        local v392 = script.FallSmoke:Clone();
                        v392.Position = CFrame.lookAt(l_Character_2.UpperTorso.Position, l_Character_2.UpperTorso.Position + l_LookVector_2).Position - Vector3.new(0, 2, 0, 0);
                        v392.Parent = l_Workspace_0.Debris;
                        for _, v394 in v392.Particle:GetChildren() do
                            v394.Enabled = false;
                            v394:Emit(v394:GetAttribute("EmitCount"));
                        end;
                        v22.CameraShake({
                            Preset = "HardHit", 
                            WaitTime = 0.3, 
                            Fade = 1
                        });
                        task.wait(5);
                        v392:Destroy();
                        return;
                    end;
                end);
                v387.TimeScale = 0.1;
                v388.TimeScale = 0.1;
                v387.Enabled = true;
                v388.Enabled = true;
                l_SoundHelper_0:PlaySound({
                    Name = "Knockdown", 
                    Parent = v360 and l_Workspace_0.Debris or l_Character_2.PrimaryPart, 
                    DirectCopy = script.Sounds.Fire1
                });
                task.delay(1.96078431372549, function() --[[ Line: 2164 ]]
                    -- upvalues: v387 (copy), v388 (copy), l_SoundHelper_0 (ref), v360 (copy), l_Workspace_0 (ref), l_Character_2 (copy), v385 (copy)
                    v387.TimeScale = 1;
                    v388.TimeScale = 1;
                    l_SoundHelper_0:PlaySound({
                        Name = "Knockdown", 
                        Parent = v360 and l_Workspace_0.Debris or l_Character_2.PrimaryPart, 
                        DirectCopy = script.Sounds.Fire2
                    });
                    task.wait(1.3888888888888888);
                    task.wait(0.3472222222222222);
                    task.wait(2.0833333333333335);
                    v387.Enabled = false;
                    v388.Enabled = false;
                    task.wait(0.1851851851851852);
                    v387:Emit(15);
                    v388:Emit(3);
                    task.wait(0.39351851851851855);
                    v387.TimeScale = 0.6;
                    v388.TimeScale = 0.6;
                    for _, v396 in l_Character_2:GetChildren() do
                        if v396:IsA("BasePart") then
                            local v397 = script.Effects.Smoke:Clone();
                            v397.Parent = v396;
                            v397:Emit(2);
                            table.insert(v385, v397);
                            local v398 = script.Effects.Smoke2:Clone();
                            v398.Parent = v396;
                            v398:Emit(1);
                            table.insert(v385, v398);
                        end;
                    end;
                end);
                if v360 then
                    l_TweenService_0:Create(v382, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), v384):Play();
                    task.delay(0.16666666666666666, function() --[[ Line: 2209 ]]
                        -- upvalues: l_TweenService_0 (ref), l_ColorCorrectionEffect_2 (copy)
                        l_TweenService_0:Create(l_ColorCorrectionEffect_2, TweenInfo.new(0.3333333333333333, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                            Brightness = 0.7
                        }):Play();
                        l_TweenService_0:Create(l_ColorCorrectionEffect_2, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Contrast = 0.4, 
                            Saturation = 0.6
                        }):Play();
                    end);
                    task.delay(1.96078431372549, function() --[[ Line: 2220 ]]
                        -- upvalues: l_TweenService_0 (ref), l_ColorCorrectionEffect_2 (copy)
                        l_TweenService_0:Create(l_ColorCorrectionEffect_2, TweenInfo.new(0.46296296296296297, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            TintColor = Color3.fromRGB(255, 141, 88), 
                            Brightness = -0.2
                        }):Play();
                        task.wait(0.46296296296296297);
                        l_TweenService_0:Create(l_ColorCorrectionEffect_2, TweenInfo.new(0.46296296296296297, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            TintColor = Color3.fromRGB(255, 141, 88), 
                            Brightness = 0
                        }):Play();
                    end);
                    task.delay(5.664488017429194, function() --[[ Line: 2233 ]]
                        -- upvalues: l_TweenService_0 (ref), l_ColorCorrectionEffect_2 (copy), v360 (copy), v22 (ref), l_Lighting_0 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_2 (copy), v350 (ref), l_LookVector_2 (copy)
                        l_TweenService_0:Create(l_ColorCorrectionEffect_2, TweenInfo.new(0.5787037037037037, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                            Brightness = 0.7
                        }):Play();
                        task.wait(0.5787037037037037);
                        task.defer(function() --[[ Line: 2240 ]]
                            -- upvalues: v360 (ref), v22 (ref), l_Lighting_0 (ref), l_TweenService_0 (ref), l_SoundHelper_0 (ref), l_Workspace_0 (ref), l_Character_2 (ref), v350 (ref), l_LookVector_2 (ref)
                            if not v360 then
                                return;
                            else
                                v22.HUDShake({
                                    Scale = 20, 
                                    Damper = 0.09999999999999999
                                });
                                local l_ColorCorrection_6 = l_Lighting_0.ColorCorrection;
                                l_ColorCorrection_6.Saturation = 0;
                                l_ColorCorrection_6.Contrast = 0;
                                l_ColorCorrection_6.Enabled = true;
                                local v400 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true);
                                l_TweenService_0:Create(l_ColorCorrection_6, v400, {
                                    Saturation = -0.5, 
                                    Contrast = 0.5
                                }):Play();
                                local l_MenuBlur_5 = l_Lighting_0.MenuBlur;
                                l_MenuBlur_5.Size = 0;
                                l_MenuBlur_5.Enabled = true;
                                local v402 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                                l_TweenService_0:Create(l_MenuBlur_5, v402, {
                                    Size = 10
                                }):Play();
                                local v403 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true);
                                l_TweenService_0:Create(l_Lighting_0, v403, {
                                    ExposureCompensation = l_Lighting_0.ExposureCompensation + 0.25
                                }):Play();
                                l_SoundHelper_0:PlaySound({
                                    Name = "Knockdown", 
                                    Parent = v360 and l_Workspace_0.Debris or l_Character_2.PrimaryPart, 
                                    DirectCopy = script.Sounds.Land1
                                });
                                l_SoundHelper_0:PlaySound({
                                    Name = "Knockdown", 
                                    Parent = v360 and l_Workspace_0.Debris or l_Character_2.PrimaryPart, 
                                    DirectCopy = script.Sounds.Metal2
                                });
                                local v404 = script.FallSmoke2:Clone();
                                v404.Position = (CFrame.lookAt(v350, v350 + l_LookVector_2) * CFrame.new(0, 0, 4.7)).Position - Vector3.new(0, 2.5, 0, 0);
                                v404.Parent = l_Workspace_0.Debris;
                                for _, v406 in v404:GetDescendants() do
                                    if v406:IsA("ParticleEmitter") then
                                        v406.Enabled = false;
                                        v406:Emit(v406.Rate);
                                    end;
                                end;
                                v22.CameraShake({
                                    Preset = "SuperHardHit", 
                                    WaitTime = 0.3, 
                                    Fade = 2
                                });
                                task.wait(5);
                                v404:Destroy();
                                return;
                            end;
                        end);
                        l_TweenService_0:Create(l_ColorCorrectionEffect_2, TweenInfo.new(0.46296296296296297, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            Brightness = 0
                        }):Play();
                    end);
                end;
                if v360 then
                    task.delay(0.16666666666666666, function() --[[ Line: 2306 ]]
                        -- upvalues: v356 (copy), l_Character_2 (copy), l_CameraMode_3 (copy), l_CurrentCamera_2 (copy), l_TweenService_0 (ref), l_RunService_0 (ref), v42 (ref), l_Damager_2 (copy), l_Vignette_2 (copy), v374 (copy)
                        v356:PivotTo(l_Character_2.PrimaryPart.CFrame * CFrame.Angles(0, 0, 0) * CFrame.new(0, 0, 0));
                        l_CameraMode_3.Value = "Cutscene";
                        l_CurrentCamera_2.FieldOfView = 35;
                        l_TweenService_0:Create(l_CurrentCamera_2, TweenInfo.new(2.6783769063180825, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                            FieldOfView = 25
                        }):Play();
                        task.delay(2.6783769063180825, function() --[[ Line: 2315 ]]
                            -- upvalues: l_TweenService_0 (ref), l_CurrentCamera_2 (ref)
                            l_TweenService_0:Create(l_CurrentCamera_2, TweenInfo.new(4.791666666666667, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                                FieldOfView = 65
                            }):Play();
                        end);
                        l_RunService_0:BindToRenderStep("CameraRig", Enum.RenderPriority.Camera.Value + 6, function(_) --[[ Line: 2319 ]]
                            -- upvalues: v356 (ref), l_CurrentCamera_2 (ref)
                            if not v356 then
                                return;
                            else
                                l_CurrentCamera_2.CFrame = v356.Head.CFrame;
                                return;
                            end;
                        end);
                        v42(l_Damager_2, 1);
                        l_TweenService_0:Create(l_Vignette_2, v374, {
                            ImageTransparency = 0.2
                        }):Play();
                    end);
                end;
                task.wait(2.1922657952069713);
                task.delay(v0.DelayTime - l_Workspace_0.Ping.Value / 2, function() --[[ Line: 2332 ]]
                    -- upvalues: l_Character_2 (copy)
                    l_Character_2:SetAttribute("GettingUp", true);
                    task.wait(2);
                    l_Character_2:SetAttribute("GettingUp", nil);
                end);
                if l_Occupied_2 and l_Occupied_2:FindFirstChild("Target") then
                    l_Occupied_2.Target.Value = Vector3.new();
                end;
                task.wait(2.5);
                local v408 = false;
                local function v417() --[[ Line: 2344 ]] --[[ Name: Reset ]]
                    -- upvalues: v408 (ref), v360 (copy), l_TweenService_0 (ref), l_Vignette_2 (copy), v374 (copy), l_CameraMode_3 (copy), l_Variant_2 (copy), l_RunService_0 (ref), v356 (copy), v22 (ref), l_Character_2 (copy), v382 (copy), v383 (copy), v42 (ref), l_Damager_2 (copy), l_ColorCorrectionEffect_2 (copy), v385 (copy), l_Occupied_2 (copy), v375 (copy), l_LocalPlayer_0 (ref), l_Lighting_0 (ref), v377 (copy), v351 (copy), l_l_AnimHelper_0_Anim_4 (copy), v342 (copy)
                    if v408 then
                        return;
                    else
                        v408 = true;
                        if v360 then
                            l_TweenService_0:Create(l_Vignette_2, v374, {
                                ImageTransparency = 1
                            }):Play();
                            task.defer(function() --[[ Line: 2351 ]]
                                -- upvalues: l_CameraMode_3 (ref), l_Variant_2 (ref), l_RunService_0 (ref)
                                l_CameraMode_3.Value = "";
                                l_Variant_2.Value = "";
                                l_RunService_0:UnbindFromRenderStep("CameraRig");
                            end);
                        end;
                        if v356 then
                            v356:Destroy();
                        end;
                        local v409 = v22.GetWeldCharacter(l_Character_2);
                        local l_StringValue_0 = Instance.new("StringValue");
                        l_StringValue_0.Name = "ResetAppearance";
                        l_StringValue_0.Parent = v409;
                        task.delay(1, function() --[[ Line: 2366 ]]
                            -- upvalues: l_StringValue_0 (copy)
                            l_StringValue_0:Destroy();
                        end);
                        l_TweenService_0:Create(v382, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v383):Play();
                        v42(l_Damager_2, 0);
                        if l_ColorCorrectionEffect_2 then
                            l_ColorCorrectionEffect_2:Destroy();
                        end;
                        for _, v412 in v385 do
                            v412:Destroy();
                        end;
                        if l_Occupied_2 and l_Occupied_2:FindFirstChild("Target") then
                            l_Occupied_2.Target.Value = Vector3.new();
                        end;
                        if v375 then
                            l_Occupied_2.LerpMult.Value = 0;
                        end;
                        if v375 or l_LocalPlayer_0.Character == l_Damager_2 then
                            local l_ColorCorrection_7 = l_Lighting_0.ColorCorrection;
                            local v414 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0);
                            l_TweenService_0:Create(l_ColorCorrection_7, v414, {
                                Saturation = 0, 
                                Contrast = 0
                            }):Play();
                        end;
                        if v377 then
                            v377:Destroy();
                        end;
                        if l_Damager_2 and l_Damager_2.PrimaryPart then
                            l_Damager_2.PrimaryPart.Anchored = false;
                        end;
                        if l_Character_2 and l_Character_2.PrimaryPart then
                            l_Character_2.PrimaryPart.Anchored = false;
                        end;
                        for v415, v416 in v351 do
                            v415.CollisionGroup = v416;
                        end;
                        l_l_AnimHelper_0_Anim_4:Stop(0);
                        if v342 then
                            v342:Destroy();
                        end;
                        if v375 or l_LocalPlayer_0.Character == l_Damager_2 then
                            l_TweenService_0:Create(l_Vignette_2, v374, {
                                ImageTransparency = 1
                            }):Play();
                        end;
                        if v342 then
                            v342:Destroy();
                        end;
                        return;
                    end;
                end;
                local v418 = nil;
                if l_CharacterData_2 and l_CharacterData_2:FindFirstChild("Cutscene") then
                    v418 = l_CharacterData_2.Cutscene.Changed:Connect(function() --[[ Line: 2419 ]]
                        -- upvalues: v418 (ref), v417 (copy)
                        if v418 then
                            v418:Disconnect();
                        end;
                        task.wait(0.28);
                        v417();
                    end);
                end;
                task.wait(8);
                v417();
                return;
            end;
        end;
    end;
    v0.Use = function(v419) --[[ Line: 2430 ]] --[[ Name: Use ]]
        -- upvalues: v0 (copy)
        local l_Character_3 = v419.Character;
        local _ = v419.Damager;
        if v419.IsKO then
            v0.KO(v419);
            return;
        elseif l_Character_3:GetAttribute("Mahoraga") then
            v0.Getup(v419);
            return;
        else
            v0.Main(v419);
            return;
        end;
    end;
    return v0;
end;