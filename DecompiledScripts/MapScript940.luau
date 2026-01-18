local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local function _(v8, v9, v10) --[[ Line: 12 ]] --[[ Name: Lerp ]]
    return v8 + (v9 - v8) * v10;
end;
repeat
    task.wait();
until l_LocalPlayer_0.Character;
local _ = l_LocalPlayer_0.PlayerGui:WaitForChild("LocalAssets", 300);
local l_LazyStorage_0 = require(l_ReplicatedFirst_0:WaitForChild("LazyStorage"));
local v14 = game:GetService("TextChatService"):WaitForChild("BubbleChatConfiguration", 30);
local l_MaxDistance_0 = v14.MaxDistance;
local l_MinimizeDistance_0 = v14.MinimizeDistance;
local v17 = game.Workspace:WaitForChild("Terrain", 30);
local l_TerrainSaveLoad_0 = require(l_ReplicatedStorage_0:WaitForChild("TerrainSaveLoad"));
local v19 = l_TerrainSaveLoad_0.Save();
local l_ExposureCompensation_0 = l_Lighting_0.ExposureCompensation;
workspace.Exposure.Value = l_ExposureCompensation_0;
local v21 = {};
for _, v23 in v17:GetChildren() do
    table.insert(v21, v23:Clone());
end;
local v24 = workspace:WaitForChild("States", 10):WaitForChild(l_LocalPlayer_0.Name, 10);
local v25 = v24:WaitForChild("CharacterData", 10);
local v26 = v24:WaitForChild("PlayerData", 10);
local l_Places_0 = require(l_ReplicatedFirst_0:WaitForChild("Places"));
if game.PlaceId ~= l_Places_0.Main then
    return warn("FINDME MapScript skipped due to not main place");
else
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "LightingStorage";
    l_Folder_0.Parent = l_ServerStorage_0;
    local _ = require(l_ReplicatedStorage_0:WaitForChild("CommonUtilities"));
    local l_Events_0 = l_ReplicatedStorage_0:WaitForChild("Events");
    local v31 = l_Lighting_0.Skybox:Clone();
    local v32 = l_Lighting_0.DefaultAtmosphere:Clone();
    local function v33(v34, v35) --[[ Line: 55 ]] --[[ Name: ConvertToEnum ]]
        -- upvalues: v33 (copy)
        for v36, v37 in v35 do
            if typeof(v37) == "table" then
                v33(v34, v37);
            elseif typeof(v37) == "string" and v34[v37] then
                v35[v36] = v34[v37];
            end;
        end;
    end;
    local function _(v38, v39) --[[ Line: 65 ]] --[[ Name: LoadTerrainProperty ]]
        local l_v38_FirstChild_0 = v38:FindFirstChild(v39);
        if l_v38_FirstChild_0 then
            workspace.Terrain[v39] = l_v38_FirstChild_0.Value;
        end;
    end;
    local function _(v42, v43) --[[ Line: 72 ]] --[[ Name: AttemptSetMaterialColor ]]
        return pcall(function() --[[ Line: 73 ]]
            -- upvalues: v42 (copy), v43 (copy)
            workspace.Terrain:SetMaterialColor(v42, v43);
        end);
    end;
    local v45 = {
        Ambient = l_Lighting_0.Ambient, 
        Brightness = l_Lighting_0.Brightness, 
        ColorShift_Bottom = l_Lighting_0.ColorShift_Bottom, 
        ColorShift_Top = l_Lighting_0.ColorShift_Top, 
        EnvironmentDiffuseScale = l_Lighting_0.EnvironmentDiffuseScale, 
        EnvironmentSpecularScale = l_Lighting_0.EnvironmentSpecularScale, 
        OutdoorAmbient = l_Lighting_0.OutdoorAmbient, 
        ShadowSoftness = l_Lighting_0.ShadowSoftness, 
        ClockTime = l_Lighting_0.ClockTime, 
        GeographicLatitude = l_Lighting_0.GeographicLatitude, 
        ExposureCompensation = l_ExposureCompensation_0
    };
    local v46 = false;
    local v47 = {
        "Live", 
        "Welds", 
        "MapCache", 
        "Debris"
    };
    local v48 = false;
    local v49 = {};
    local v50 = {};
    local v51 = {};
    local v52 = {};
    local v53 = {};
    local v54 = nil;
    local function _(v55, v56, v57) --[[ Line: 109 ]] --[[ Name: CheckPointInArea ]]
        local v58 = v55 - v56;
        local v59 = math.abs(v58.X);
        local v60 = math.abs(v58.Z);
        local v61 = false;
        if v59 < v57.X / 2 then
            v61 = v60 < v57.Z / 2;
        end;
        return v61;
    end;
    workspace.Rings.ChildAdded:Connect(function(v63) --[[ Line: 116 ]]
        for _, v65 in v63:GetDescendants() do
            if v65:IsA("BasePart") then
                v65.LocalTransparencyModifier = v65.LocalTransparencyModifier + 1000;
            end;
        end;
    end);
    local function v79(v66) --[[ Line: 124 ]] --[[ Name: SetPlayerShadows ]]
        -- upvalues: v51 (copy)
        if not v66 then
            for _, v68 in workspace.Live:GetDescendants() do
                if v68:IsA("BasePart") then
                    v68.CastShadow = false;
                end;
            end;
            for _, v70 in workspace.Welds:GetDescendants() do
                if v70:IsA("BasePart") then
                    v70.CastShadow = false;
                end;
            end;
            v51[1] = workspace.Live.DescendantAdded:Connect(function(v71) --[[ Line: 141 ]]
                if v71:IsA("BasePart") then
                    v71.CastShadow = false;
                end;
            end);
            v51[2] = workspace.Welds.DescendantAdded:Connect(function(v72) --[[ Line: 147 ]]
                if v72:IsA("BasePart") then
                    v72.CastShadow = false;
                end;
            end);
            return;
        else
            for _, v74 in v51 do
                v74:Disconnect();
            end;
            if workspace.Settings.PerformanceMode.Value then
                return;
            else
                for _, v76 in workspace.Live:GetDescendants() do
                    if v76:IsA("BasePart") then
                        v76.CastShadow = true;
                    end;
                end;
                for _, v78 in workspace.Welds:GetDescendants() do
                    if v78:IsA("BasePart") then
                        v78.CastShadow = true;
                    end;
                end;
                return;
            end;
        end;
    end;
    local _ = l_ReplicatedStorage_0:WaitForChild("Assets", 10):WaitForChild("Nametag", 10);
    local function v86(v81, v82, _) --[[ Line: 177 ]] --[[ Name: SetLocalTransparency ]]
        for _, v85 in v81:GetDescendants() do
            if v85:IsA("BasePart") or v85:IsA("Decal") then
                v85.LocalTransparencyModifier = v82;
            end;
        end;
    end;
    local v87 = {};
    ClearTerrain = function() --[[ Line: 190 ]] --[[ Name: ClearTerrain ]]
        for _, v89 in game.Workspace.Terrain:GetChildren() do
            if v89:IsA("Clouds") then
                v89.Enabled = false;
            else
                v89:Destroy();
            end;
        end;
    end;
    local l_ServerStorage_1 = game:GetService("ServerStorage");
    local l_HiddenStorage_0 = l_ServerStorage_1:WaitForChild("HiddenStorage");
    local l_WeldStorage_0 = l_ServerStorage_1:WaitForChild("WeldStorage");
    local _ = require(l_ReplicatedStorage_0:WaitForChild("Modules", 10):WaitForChild("EmoteHelper", 10));
    local v94 = require(l_ReplicatedStorage_0:WaitForChild("Modules", 10):WaitForChild("Transitions", 10));
    local v95 = {};
    CreateBaseMapCopy = function() --[[ Line: 211 ]] --[[ Name: CreateBaseMapCopy ]]
        -- upvalues: l_LocalPlayer_0 (copy)
        local v96 = {
            "Base", 
            "Rings", 
            "Misc", 
            "Leaderboards"
        };
        local l_Model_0 = Instance.new("Model");
        local l_Model_1 = Instance.new("Model");
        l_Model_1.Parent = l_Model_0;
        l_Model_1.Name = "Geometry";
        local l_Model_2 = Instance.new("Model");
        l_Model_2.Parent = l_Model_0;
        l_Model_2.Name = "Ring";
        for _, v101 in workspace:GetChildren() do
            if table.find(v96, v101.Name) then
                v101:Clone().Parent = l_Model_1;
            end;
        end;
        local v102 = nil;
        for _, v104 in workspace:WaitForChild("Rings", 10):GetChildren() do
            if v104:GetAttribute("RingId") == l_LocalPlayer_0:GetAttribute("RingId") then
                v102 = v104:Clone();
                break;
            end;
        end;
        for _, v106 in l_Model_1:GetDescendants() do
            if v106:IsA("BasePart") then
                v106.Anchored = true;
                v106.CanCollide = false;
            end;
        end;
        v102.Hitboxes:Clone().Parent = l_Model_2;
        local v107 = v102.Keypoints:Clone();
        v107.Parent = l_Model_2;
        l_Model_0.PrimaryPart = v107.Centre;
        l_Model_0:PivotTo(l_Model_0:GetPivot() * CFrame.new(0, -1000000, 0));
        l_Model_0.Name = "m_BaseMap";
        l_Model_0.Parent = workspace.MapCache;
        return l_Model_0;
    end;
    local v108 = {};
    local function v127(v109) --[[ Line: 265 ]] --[[ Name: SetMapLighting ]]
        -- upvalues: v108 (copy), l_Lighting_0 (copy), v79 (copy), l_ExposureCompensation_0 (copy), v31 (copy), v32 (copy), v50 (ref), v45 (copy)
        if workspace:GetAttribute("IgnoreSetLighting") then
            return;
        else
            if not v109 then
                v109 = v108;
            end;
            local l_Settings_0 = v109.Settings;
            local l_MapModel_0 = v109.MapModel;
            local l_LightingFolder_0 = v109.LightingFolder;
            if l_Settings_0 then
                local v113 = l_Settings_0.Lighting or {};
                for v114, v115 in v113 do
                    l_Lighting_0[v114] = v115;
                end;
                if l_Settings_0.PlayerShadowsDisabled then
                    v79(false);
                end;
                if l_MapModel_0 then
                    v113 = l_MapModel_0.PrimaryPart.Orientation.Y - l_MapModel_0.Ring.Hitboxes.Main.Orientation.Y;
                    local l_Lighting_1 = game.Lighting;
                    l_Lighting_1.GeographicLatitude = l_Lighting_1.GeographicLatitude + v113;
                end;
                workspace.Exposure.Value = l_Lighting_0.ExposureCompensation or l_ExposureCompensation_0;
            end;
            for _, v118 in l_Lighting_0:GetChildren() do
                if v118:IsA("Sky") or v118:IsA("Atmosphere") or v118.Name == "MapRemove" then
                    v118:Destroy();
                end;
            end;
            local v119 = v31:Clone();
            local v120 = v32:Clone();
            if l_LightingFolder_0 then
                v119 = l_LightingFolder_0:FindFirstChild("Skybox");
                v120 = l_LightingFolder_0:FindFirstChild("DefaultAtmosphere");
                for _, v122 in l_LightingFolder_0:GetChildren() do
                    if v122:IsA("ModuleScript") or v122:IsA("Atmosphere") or v122:IsA("Sky") then
                        --[[ close >= 10 ]]
                    else
                        v122 = v122:Clone();
                        local l_l_Lighting_0_FirstChild_0 = l_Lighting_0:FindFirstChild(v122.Name);
                        if l_l_Lighting_0_FirstChild_0 then
                            l_l_Lighting_0_FirstChild_0.Enabled = false;
                            table.insert(v50, l_l_Lighting_0_FirstChild_0);
                        end;
                        v122.Name = "MapRemove";
                        v122.Parent = l_Lighting_0;
                        do
                            local l_v122_0 = v122;
                            task.delay(1, function() --[[ Line: 320 ]]
                                -- upvalues: l_v122_0 (ref)
                                if l_v122_0 then
                                    l_v122_0.Enabled = true;
                                end;
                            end);
                        end;
                    end;
                end;
            else
                for v125, v126 in v45 do
                    l_Lighting_0[v125] = v126;
                end;
                workspace.Exposure.Value = l_ExposureCompensation_0;
            end;
            l_Lighting_0.ExposureCompensation = workspace.Exposure.Value;
            if v119 then
                v119:Clone().Parent = l_Lighting_0;
            end;
            if v120 then
                v120 = v120:Clone();
                task.delay(0.016666666666666666, function() --[[ Line: 342 ]]
                    -- upvalues: v120 (ref), l_Lighting_0 (ref)
                    v120.Parent = l_Lighting_0;
                end);
            end;
            return;
        end;
    end;
    l_Events_0.RefreshMapLighting.Event:Connect(function() --[[ Line: 348 ]]
        -- upvalues: v127 (copy)
        v127();
    end);
    l_Events_0.SetDefaultMapLighting.Event:Connect(function() --[[ Line: 352 ]]
        -- upvalues: v127 (copy)
        v127({});
    end);
    InitMap = function(v128, v129, v130) --[[ Line: 357 ]] --[[ Name: InitMap ]]
        -- upvalues: v46 (ref), v94 (copy), v54 (ref), v25 (copy), l_LocalPlayer_0 (copy), v26 (copy), l_ReplicatedStorage_0 (copy), l_LazyStorage_0 (copy), v108 (copy), l_Lighting_0 (copy), v47 (copy), v49 (ref), v50 (ref), l_CollectionService_0 (copy), v53 (copy), l_RunService_0 (copy), v95 (copy), v48 (ref), v17 (copy), v33 (copy), v127 (copy)
        if v46 then
            return;
        else
            v46 = true;
            if v129 then
                local v131 = {
                    FadeTime = 0.65, 
                    HoldTime = 0.65, 
                    IgnoreSound = true
                };
                task.spawn(function() --[[ Line: 368 ]]
                    -- upvalues: v94 (ref), v131 (copy)
                    v94.FadeTransition(v131);
                end);
                task.wait(v131.FadeTime);
            end;
            local l_Parent_0 = v128.Parent.Parent;
            local l_Hitboxes_0 = l_Parent_0:FindFirstChild("Hitboxes");
            local v134 = l_Hitboxes_0 and l_Hitboxes_0:FindFirstChild("Main");
            local v135 = tick();
            v54 = v135;
            local l_Value_0 = v25.Opponent.Value;
            local v137 = l_Value_0 and l_Value_0:GetAttribute("ActiveNPC");
            task.defer(function() --[[ Line: 388 ]]
                -- upvalues: v129 (copy), v134 (copy), v128 (copy), l_LocalPlayer_0 (ref), v54 (ref), v135 (copy), v137 (copy), l_Value_0 (copy)
                if v129 then
                    return;
                else
                    local v138 = RaycastParams.new();
                    v138.FilterDescendantsInstances = {
                        v134
                    };
                    v138.FilterType = Enum.RaycastFilterType.Include;
                    local function v140(v139) --[[ Line: 395 ]] --[[ Name: RaycastAttempt ]]
                        -- upvalues: v138 (copy), v128 (ref)
                        if not workspace:Raycast(v139.PrimaryPart.Position, Vector3.new(0, -v139.PrimaryPart.Size.Y - 5, 0), v138) then
                            v139:PivotTo(v128.CFrame * CFrame.new(0, 3, 0));
                        end;
                    end;
                    while true do
                        if task.wait(3) then
                            local l_Character_0 = l_LocalPlayer_0.Character;
                            if not l_Character_0 or v54 ~= v135 then
                                return;
                            else
                                v140(l_Character_0);
                                if v137 and l_Value_0 then
                                    v140(l_Value_0);
                                end;
                            end;
                        else
                            return;
                        end;
                    end;
                end;
            end);
            local l_Value_1 = v26.Map.Value;
            if v137 then
                local l_NPCs_0 = l_ReplicatedStorage_0.NPCs;
                if l_NPCs_0:FindFirstChild(v137) then
                    local v144 = workspace.States[l_Value_0.Name];
                    local _ = v144.CharacterData;
                    local l_PlayerData_0 = v144.PlayerData;
                    local v147 = l_NPCs_0[v137];
                    workspace.Settings.PerformanceMode.Value = false;
                    l_PlayerData_0.Map.Value = v147.PlayerData.Map.Value;
                end;
            end;
            if v129 then
                l_Value_1 = v129;
            end;
            local v148 = workspace.MapCache:FindFirstChild("m_" .. l_Value_1) or l_LazyStorage_0:Get("m_" .. l_Value_1);
            if l_Value_1 == "BaseMap" then
                v148 = CreateBaseMapCopy();
            end;
            v108.MapModel = v148;
            if not v148 then
                return;
            else
                for _, v150 in l_Lighting_0:GetChildren() do
                    if v150.Name == "DefaultAdd" then
                        v150.Enabled = false;
                    end;
                end;
                local l_SpectateRemove_0 = v148:FindFirstChild("SpectateRemove");
                if l_SpectateRemove_0 and v129 then
                    l_SpectateRemove_0:Destroy();
                end;
                task.spawn(function() --[[ Line: 459 ]]
                    -- upvalues: v47 (ref), v49 (ref), v50 (ref)
                    for _, v153 in workspace:GetChildren() do
                        if not table.find(v47, v153.Name) then
                            if v153:IsA("BasePart") then
                                v153.LocalTransparencyModifier = v153.LocalTransparencyModifier + 1000;
                                table.insert(v49, v153);
                            end;
                            for _, v155 in v153:GetDescendants() do
                                if v155:IsA("BasePart") or v155:IsA("Decal") then
                                    v155.LocalTransparencyModifier = v155.LocalTransparencyModifier + 1000;
                                    table.insert(v49, v155);
                                elseif (v155:IsA("Beam") or v155:IsA("SurfaceGui") or v155:IsA("BillboardGui") or v155:IsA("ParticleEmitter")) and v155.Enabled then
                                    v155.Enabled = false;
                                    table.insert(v50, v155);
                                end;
                            end;
                        end;
                    end;
                end);
                for _, v157 in l_CollectionService_0:GetTagged("WorkspaceGuis") do
                    v157.Enabled = false;
                end;
                v148.Parent = workspace;
                v148.PrimaryPart = v148.Ring.Hitboxes.Main;
                v148:PivotTo(v148:GetPivot() * CFrame.new(0, 1000000, 0));
                v148:PivotTo(CFrame.lookAt(v134.CFrame.Position, v134.CFrame.Position + v148.Ring.Hitboxes.Main.CFrame.LookVector));
                l_CollectionService_0:AddTag(v148, "Map");
                local l_CharacterData_1 = workspace.States[l_LocalPlayer_0.Name].CharacterData;
                local l_Bounds_0 = v148.Ring:FindFirstChild("Bounds");
                if l_Bounds_0 then
                    for _, v161 in l_Bounds_0:GetDescendants() do
                        if v161:IsA("Beam") then
                            v161.Enabled = v129 == nil;
                        end;
                    end;
                    if not v129 then
                        local v162 = {};
                        for _, v164 in l_Bounds_0:GetDescendants() do
                            if v164:IsA("Beam") then
                                table.insert(v162, v164);
                            end;
                        end;
                        local l_v162_0 = v162 --[[ copy: 15 -> 49 ]];
                        v53[#v53 + 1] = l_RunService_0.Heartbeat:Connect(function(v166) --[[ Line: 518 ]]
                            -- upvalues: l_LocalPlayer_0 (ref), v128 (copy), v135 (copy), l_CharacterData_1 (copy), l_v162_0 (copy)
                            local v167 = l_LocalPlayer_0.Character and l_LocalPlayer_0.Character.PrimaryPart;
                            if not v167 then
                                return;
                            else
                                local v168 = math.clamp(((v167.Position - v128.Position).Magnitude - 12) / 4, 0, 1) * 1.5;
                                if tick() - v135 < 5 then
                                    v168 = 0;
                                end;
                                if l_CharacterData_1.Cutscene.Value then
                                    v168 = 0;
                                end;
                                for _, v170 in l_v162_0 do
                                    local l_Brightness_0 = v170.Brightness;
                                    local l_v168_0 = v168;
                                    local v173 = v166 * 8;
                                    v170.Brightness = l_Brightness_0 + (l_v168_0 - l_Brightness_0) * v173;
                                end;
                                return;
                            end;
                        end);
                    end;
                end;
                local function _() --[[ Line: 545 ]] --[[ Name: HideScoreboard ]]
                    -- upvalues: v128 (copy)
                    local l_Parent_1 = v128.Parent.Parent;
                    local l_BoolValue_0 = Instance.new("BoolValue");
                    l_BoolValue_0.Name = "HideScoreboard";
                    l_BoolValue_0.Parent = l_Parent_1;
                end;
                local l_Lighting_2 = v148:FindFirstChild("Lighting");
                v108.LightingFolder = l_Lighting_2;
                local v178 = l_Lighting_2 and l_Lighting_2:FindFirstChild("Settings");
                if v178 then
                    local v179 = require(v178);
                    v108.Settings = v179;
                    if v179.HideScoreboard ~= false then
                        local l_Parent_2 = v128.Parent.Parent;
                        local l_BoolValue_1 = Instance.new("BoolValue");
                        l_BoolValue_1.Name = "HideScoreboard";
                        l_BoolValue_1.Parent = l_Parent_2;
                    end;
                    if v179.HideOthers and not v129 then
                        l_LocalPlayer_0:SetAttribute("ForceHideOthers", true);
                        workspace.Settings.HideOthers.Value = not workspace.Settings.HideOthers.Value;
                        workspace.Settings.HideOthers.Value = not workspace.Settings.HideOthers.Value;
                    end;
                    if not v179.KeepOrientation then
                        v148:PivotTo(v134.CFrame);
                    end;
                    workspace.FightCameraOffset.Value = v179.FightCFrameOffset or CFrame.new();
                    workspace.InFocusRadius.Value = v179.FocusRadius or 30;
                    local l_v179_0 = v179 --[[ copy: 18 -> 47 ]];
                    task.delay(1, function() --[[ Line: 581 ]]
                        -- upvalues: l_v179_0 (copy)
                        workspace.InFocusRadius.Value = l_v179_0.FocusRadius or 30;
                    end);
                    if v179.OnLoaded then
                        local l_v179_1 = v179 --[[ copy: 18 -> 48 ]];
                        task.defer(function() --[[ Line: 586 ]]
                            -- upvalues: l_v179_1 (copy), l_CharacterData_1 (copy), v129 (copy)
                            l_v179_1.OnLoaded({
                                CharacterData = l_CharacterData_1, 
                                OverrideName = v129
                            });
                        end);
                    end;
                    if v179.EmitParticlesAtStart then
                        for _, v185 in v148:GetDescendants() do
                            if v185:IsA("ParticleEmitter") then
                                v185:Emit(v185.Rate);
                            end;
                        end;
                    end;
                else
                    local l_Parent_3 = v128.Parent.Parent;
                    local l_BoolValue_2 = Instance.new("BoolValue");
                    l_BoolValue_2.Name = "HideScoreboard";
                    l_BoolValue_2.Parent = l_Parent_3;
                end;
                local l_MapMusic_0 = v148:FindFirstChild("MapMusic");
                if l_MapMusic_0 then
                    l_MapMusic_0:Clone().Parent = workspace;
                end;
                local l_PlayerBounds_0 = v148:FindFirstChild("PlayerBounds");
                if l_PlayerBounds_0 then
                    l_PlayerBounds_0 = l_PlayerBounds_0:GetChildren();
                    local v190 = workspace.Base.Position.Y + workspace.Base.Size.Y / 2;
                    local _ = v134.Position.Y + v134.Size.Y / 2;
                    local v192 = l_PlayerBounds_0[1];
                    local v193 = v192.Position.Y + v192.Size.Y / 2 - v190;
                    local l_SpectateBounds_0 = l_Parent_0:FindFirstChild("SpectateBounds");
                    if l_SpectateBounds_0 then
                        l_PlayerBounds_0 = l_SpectateBounds_0:GetChildren();
                    end;
                    local v195 = {};
                    local l_v195_0 = v195 --[[ copy: 26 -> 44 ]];
                    local l_v193_0 = v193 --[[ copy: 24 -> 45 ]];
                    local l_v190_0 = v190 --[[ copy: 20 -> 46 ]];
                    v53[#v53 + 1] = l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 641 ]]
                        -- upvalues: l_v195_0 (copy), l_v193_0 (copy), l_v190_0 (copy), l_LocalPlayer_0 (ref), l_CollectionService_0 (ref), v95 (ref)
                        for _, v201 in l_v195_0 do
                            if v201.Active ~= false then
                                local l_Root_0 = v201.Root;
                                local l_Character_1 = v201.Character;
                                if l_Root_0 and l_Character_1 and l_Character_1.PrimaryPart then
                                    local v204 = CFrame.new(0, l_v193_0, 0);
                                    local v205 = l_v190_0 + l_Character_1.PrimaryPart.Size.Y;
                                    l_Root_0.C0 = v204 * CFrame.new(0, v205 - l_Character_1.PrimaryPart.Position.Y, 0);
                                end;
                                if v201.Humanoid and l_LocalPlayer_0.Character and l_LocalPlayer_0.Character.PrimaryPart then
                                    workspace.CameraOffset.Value = Vector3.new(0, l_Root_0.C0.Position.Y + l_LocalPlayer_0.Character.PrimaryPart.Size.Y / 2, 0);
                                    for _, v207 in l_CollectionService_0:GetTagged("SpectateC0") do
                                        if not v95[v207] then
                                            v95[v207] = v207.C0;
                                        end;
                                        v207.C0 = v95[v207] * CFrame.new(0, (l_Root_0.C0.Position.Y + l_LocalPlayer_0.Character.PrimaryPart.Size.Y / 2) * (v207.Name == "Reverse" and -1 or 1), 0);
                                    end;
                                end;
                            end;
                        end;
                    end);
                    task.defer(function() --[[ Line: 674 ]]
                        -- upvalues: l_LocalPlayer_0 (ref), v130 (ref), l_v195_0 (copy), l_PlayerBounds_0 (ref), v54 (ref), v135 (copy)
                        local l_Occupied_0 = workspace.States[l_LocalPlayer_0.Name].Occupied;
                        local l_LockedOn_0 = l_Occupied_0.LockedOn;
                        if not v130 then
                            task.wait(0.5);
                            v130 = {};
                            table.insert(v130, l_LockedOn_0.Value);
                            table.insert(v130, l_LocalPlayer_0.Character);
                        else
                            local l_Root_1 = l_LocalPlayer_0.Character.LowerTorso:FindFirstChild("Root");
                            local l_Humanoid_0 = l_LocalPlayer_0.Character:FindFirstChild("Humanoid");
                            l_v195_0[l_LocalPlayer_0.Character] = {
                                Root = l_Root_1, 
                                Character = l_LocalPlayer_0.Character, 
                                Humanoid = l_Humanoid_0
                            };
                            if l_Humanoid_0 then
                                l_Humanoid_0.CameraOffset = Vector3.new(0, l_Root_1.C0.Position.Y + l_LocalPlayer_0.Character.PrimaryPart.Size.Y / 2, 0);
                                workspace.CameraOffset.Value = l_Humanoid_0.CameraOffset;
                            end;
                            l_Occupied_0.Spectating.Value = true;
                        end;
                        local function v226(v212) --[[ Line: 707 ]] --[[ Name: PerformCheck ]]
                            -- upvalues: v130 (ref), l_LocalPlayer_0 (ref), l_PlayerBounds_0 (ref), l_v195_0 (ref)
                            if table.find(v130, v212) then
                                return;
                            elseif v212 == l_LocalPlayer_0.Character then
                                return;
                            else
                                local l_PrimaryPart_0 = v212.PrimaryPart;
                                if not l_PrimaryPart_0 then
                                    return;
                                else
                                    local v214 = v212 and v212:FindFirstChild("LowerTorso") and v212.LowerTorso:FindFirstChild("Root");
                                    if not v214 then
                                        return;
                                    else
                                        local v215 = false;
                                        for _, v217 in l_PlayerBounds_0 do
                                            local l_Position_0 = l_PrimaryPart_0.Position;
                                            local l_Position_1 = v217.Position;
                                            local l_Size_0 = v217.Size;
                                            local v221 = l_Position_0 - l_Position_1;
                                            local v222 = math.abs(v221.X);
                                            local v223 = math.abs(v221.Z);
                                            local v224 = false;
                                            if v222 < l_Size_0.X / 2 then
                                                v224 = v223 < l_Size_0.Z / 2;
                                            end;
                                            if v224 then
                                                v215 = true;
                                                break;
                                            end;
                                        end;
                                        if not l_v195_0[v212] then
                                            local v225 = {
                                                Active = true, 
                                                Root = v214, 
                                                Character = v212
                                            };
                                            if v212 == l_LocalPlayer_0.Character then
                                                v225.Humanoid = v212:FindFirstChild("Humanoid");
                                            end;
                                            l_v195_0[v212] = v225;
                                        end;
                                        if v215 then
                                            l_v195_0[v212].Active = true;
                                            return;
                                        else
                                            l_v195_0[v212].Active = false;
                                            if v214 then
                                                v214.C0 = CFrame.new(0, 1000000, 0);
                                            end;
                                            return;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        for _, v228 in workspace.Live:GetChildren() do
                            v226(v228);
                        end;
                        while v54 == v135 do
                            for _, v230 in workspace.Live:GetChildren() do
                                v226(v230);
                            end;
                            task.wait(0.25);
                        end;
                    end);
                end;
                ClearTerrain();
                local l_Terrain_0 = v148:FindFirstChild("Terrain");
                if l_Terrain_0 then
                    v48 = "Children";
                    for _, v233 in l_Terrain_0:GetChildren() do
                        local v234 = v233:Clone();
                        v234.Parent = v17;
                        if v234:IsA("ModuleScript") then
                            v48 = "All";
                            local v235 = require(v234.RegionData);
                            local _ = v235.CFrame;
                            local _ = v235.Size;
                            local function _(v238) --[[ Line: 945 ]] --[[ Name: GetBlockPosition ]]
                                return (Vector3.new(math.floor(v238.X / 4) * 4, math.floor(v238.Y / 4) * 4, math.floor(v238.Z / 4) * 4));
                            end;
                            local v240 = v148.PrimaryPart.Position - v128.Position;
                            local v241 = Vector3.new(math.floor(v240.X / 4) * 4, math.floor(v240.Y / 4) * 4, math.floor(v240.Z / 4) * 4) + Vector3.new(0, 4, 0, 0);
                            v241 = v241 - Vector3.new(0, v241.Y, 0);
                            local v242 = require(v234.RegionData);
                            v240 = require(v234);
                            if v240 == "Water" then
                                game.Workspace.Terrain:FillBlock(v128.CFrame * v242.Offset, v242.Size, Enum.Material.Water);
                            else
                                local v243 = game.HttpService:JSONDecode(v240);
                                v33(Enum.Material, v243.materials);
                                local v244 = v242[1] + v241;
                                local v245 = v242[2] + v241;
                                game.Workspace.Terrain:WriteVoxels(Region3.new(v244, v245), 4, v243.materials, v243.occupancy);
                            end;
                            local l_WaterProperties_0 = v234:FindFirstChild("WaterProperties");
                            if l_WaterProperties_0 then
                                local l_WaterColor_0 = l_WaterProperties_0:FindFirstChild("WaterColor");
                                if l_WaterColor_0 then
                                    workspace.Terrain.WaterColor = l_WaterColor_0.Value;
                                end;
                                l_WaterColor_0 = l_WaterProperties_0:FindFirstChild("WaterReflectance");
                                if l_WaterColor_0 then
                                    workspace.Terrain.WaterReflectance = l_WaterColor_0.Value;
                                end;
                                l_WaterColor_0 = l_WaterProperties_0:FindFirstChild("WaterTransparency");
                                if l_WaterColor_0 then
                                    workspace.Terrain.WaterTransparency = l_WaterColor_0.Value;
                                end;
                                l_WaterColor_0 = l_WaterProperties_0:FindFirstChild("WaterWaveSize");
                                if l_WaterColor_0 then
                                    workspace.Terrain.WaterWaveSize = l_WaterColor_0.Value;
                                end;
                                l_WaterColor_0 = l_WaterProperties_0:FindFirstChild("WaterWaveSpeed");
                                if l_WaterColor_0 then
                                    workspace.Terrain.WaterWaveSpeed = l_WaterColor_0.Value;
                                end;
                            end;
                            local l_MaterialColors_0 = v234:FindFirstChild("MaterialColors");
                            if l_MaterialColors_0 then
                                for _, v250 in Enum.Material:GetEnumItems() do
                                    local l_l_MaterialColors_0_FirstChild_0 = l_MaterialColors_0:FindFirstChild(v250.Name);
                                    if l_l_MaterialColors_0_FirstChild_0 then
                                        local l_Value_2 = l_l_MaterialColors_0_FirstChild_0.Value;
                                        local _ = pcall(function() --[[ Line: 73 ]]
                                            -- upvalues: v250 (copy), l_Value_2 (copy)
                                            workspace.Terrain:SetMaterialColor(v250, l_Value_2);
                                        end);
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                v127();
                return;
            end;
        end;
    end;
    ResetMap = function(v254) --[[ Line: 994 ]] --[[ Name: ResetMap ]]
        -- upvalues: v54 (ref), l_LocalPlayer_0 (copy), v46 (ref), v94 (copy), v108 (copy), l_ExposureCompensation_0 (copy), l_Lighting_0 (copy), v53 (copy), v48 (ref), v21 (copy), v17 (copy), l_TerrainSaveLoad_0 (copy), v19 (copy), l_CollectionService_0 (copy), v49 (ref), v50 (ref), l_HiddenStorage_0 (copy), l_WeldStorage_0 (copy), v87 (ref), v14 (copy), l_MaxDistance_0 (copy), l_MinimizeDistance_0 (copy), v51 (copy), v79 (copy), v52 (copy), v45 (copy), l_Folder_0 (copy), v86 (copy), v95 (copy), v127 (copy)
        v54 = tick();
        if l_LocalPlayer_0:GetAttribute("KeepMapsLoaded") then
            return;
        elseif not v46 then
            return;
        else
            if v254 then
                task.wait(v254);
            else
                local v255 = {
                    FadeTime = 0.65, 
                    HoldTime = 0.65, 
                    IgnoreSound = true
                };
                local l_v255_0 = v255 --[[ copy: 2 -> 18 ]];
                task.spawn(function() --[[ Line: 1011 ]]
                    -- upvalues: v94 (ref), l_v255_0 (copy)
                    v94.FadeTransition(l_v255_0);
                end);
                task.wait(v255.FadeTime);
            end;
            for v257, _ in v108 do
                v108[v257] = nil;
            end;
            v46 = false;
            workspace.Exposure.Value = l_ExposureCompensation_0;
            l_Lighting_0.ExposureCompensation = l_ExposureCompensation_0;
            for _, v260 in v53 do
                v260:Disconnect();
            end;
            ClearTerrain();
            if v48 then
                for _, v262 in v21 do
                    v262:Clone().Parent = v17;
                end;
                if v48 == "All" then
                    l_TerrainSaveLoad_0.Load(v19);
                end;
            end;
            workspace.FightCameraOffset.Value = CFrame.new();
            workspace.InFocusRadius.Value = 0;
            local l_DepthOfField_0 = l_Lighting_0:FindFirstChild("DepthOfField");
            if l_DepthOfField_0 then
                l_DepthOfField_0.Enabled = false;
            end;
            for _, v265 in workspace:GetChildren() do
                if v265.Name == "MapMusic" then
                    v265:Destroy();
                end;
                if string.find(v265.Name, "m_") then
                    v265.Parent = workspace.MapCache;
                    v265:PivotTo(v265:GetPivot() * CFrame.new(0, -1000000, 0));
                end;
            end;
            for _, v267 in l_CollectionService_0:GetTagged("WorkspaceGuis") do
                v267.Enabled = true;
            end;
            for _, v269 in v49 do
                v269.LocalTransparencyModifier = v269.LocalTransparencyModifier - 1000;
            end;
            for _, v271 in v50 do
                v271.Enabled = true;
            end;
            for _, v273 in l_HiddenStorage_0:GetChildren() do
                v273.Parent = workspace.Live;
                for _, v275 in v273:GetChildren() do
                    if v275:IsA("BasePart") then
                        v275.Anchored = false;
                    end;
                end;
            end;
            for _, v277 in l_WeldStorage_0:GetChildren() do
                v277.Parent = workspace.Welds;
            end;
            v49 = {};
            v50 = {};
            v87 = {};
            v14.MaxDistance = l_MaxDistance_0;
            v14.MinimizeDistance = l_MinimizeDistance_0;
            if #v51 > 0 then
                v79(true);
            end;
            for _, v279 in v52 do
                v279.Enabled = true;
            end;
            for v280, v281 in v45 do
                l_Lighting_0[v280] = v281;
            end;
            if v45.TimeOfDay then
                l_Lighting_0.TimeOfDay = v45.TimeOfDay;
            end;
            local l_DefaultAtmosphere_0 = l_Folder_0:FindFirstChild("DefaultAtmosphere");
            if l_DefaultAtmosphere_0 then
                local l_DefaultAtmosphere_1 = l_Lighting_0:FindFirstChildWhichIsA("DefaultAtmosphere");
                if l_DefaultAtmosphere_1 then
                    l_DefaultAtmosphere_1:Destroy();
                end;
                task.delay(0.016666666666666666, function() --[[ Line: 1119 ]]
                    -- upvalues: l_DefaultAtmosphere_0 (copy), l_Lighting_0 (ref)
                    l_DefaultAtmosphere_0.Parent = l_Lighting_0;
                end);
            end;
            local l_Skybox_0 = l_Folder_0:FindFirstChild("Skybox");
            if l_Skybox_0 then
                local l_Skybox_1 = l_Lighting_0:FindFirstChild("Skybox");
                if l_Skybox_1 then
                    l_Skybox_1:Destroy();
                end;
                task.defer(function() --[[ Line: 1129 ]]
                    -- upvalues: l_Skybox_0 (copy), l_Lighting_0 (ref)
                    l_Skybox_0.Parent = l_Lighting_0;
                end);
            end;
            for _, v287 in l_Lighting_0:GetChildren() do
                if v287.Name == "DefaultAdd" then
                    v287.Enabled = true;
                end;
                if v287.Name == "MapRemove" then
                    v287:Destroy();
                end;
            end;
            if l_LocalPlayer_0:GetAttribute("ForceHideOthers") then
                l_LocalPlayer_0:SetAttribute("ForceHideOthers", nil);
                workspace.Settings.HideOthers.Value = not workspace.Settings.HideOthers.Value;
                workspace.Settings.HideOthers.Value = not workspace.Settings.HideOthers.Value;
            end;
            workspace.States[l_LocalPlayer_0.Name].Occupied.Spectating.Value = false;
            local l_Humanoid_1 = l_LocalPlayer_0.Character:FindFirstChild("Humanoid");
            if l_Humanoid_1 then
                l_Humanoid_1.CameraOffset = Vector3.new();
                workspace.CameraOffset.Value = Vector3.new();
            end;
            for _, v290 in workspace.Live:GetChildren() do
                local l_PrimaryPart_1 = v290.PrimaryPart;
                local v292 = l_PrimaryPart_1 and v290:FindFirstChild("LowerTorso") and v290.LowerTorso:FindFirstChild("Root");
                if v292 then
                    v292.C0 = CFrame.new(0, -l_PrimaryPart_1.Size.Y / 2, 0);
                end;
                local l_FirstChild_0 = workspace.Welds:FindFirstChild(v290.Name);
                task.defer(function() --[[ Line: 1168 ]]
                    -- upvalues: v86 (ref), v290 (copy), l_FirstChild_0 (copy)
                    v86(v290, 0, false);
                    if l_FirstChild_0 then
                        v86(l_FirstChild_0, 0, false);
                    end;
                end);
                local v294 = l_FirstChild_0 and l_FirstChild_0:FindFirstChild("WeldCharacter");
                if v294 then
                    local l_HumanoidRootPart_0 = v294:FindFirstChild("HumanoidRootPart");
                    local v296 = l_HumanoidRootPart_0 and l_HumanoidRootPart_0:FindFirstChildWhichIsA("Weld");
                    if v296 then
                        v296.C0 = CFrame.new(0, 0, 0);
                    end;
                end;
            end;
            for _, v298 in l_CollectionService_0:GetTagged("SpectateC0") do
                if v95[v298] then
                    v298.C0 = v95[v298];
                end;
            end;
            v127({});
            return;
        end;
    end;
    v25.Centre.Changed:Connect(function(v299) --[[ Line: 1194 ]]
        if v299 then
            InitMap(v299);
            return;
        else
            ResetMap(0.7);
            return;
        end;
    end);
    LoadMap = function() --[[ Line: 1202 ]] --[[ Name: LoadMap ]]
        -- upvalues: v26 (copy), l_LazyStorage_0 (copy)
        if v26.Map.Value == "Default" then
            return;
        elseif workspace.MapCache:FindFirstChild("m_" .. v26.Map.Value) then
            return;
        else
            l_LazyStorage_0:Get("m_" .. v26.Map.Value);
            return;
        end;
    end;
    v26.Map.Changed:Connect(function() --[[ Line: 1209 ]]
        LoadMap();
    end);
    LoadMap();
    local v300 = game.Workspace:WaitForChild("Rings", 10);
    local v301 = game.Workspace.States:WaitForChild(l_LocalPlayer_0.Name, 10):WaitForChild("CharacterData", 10);
    local v302 = {};
    for _, v304 in v300:GetChildren() do
        local l_SpectateBounds_1 = v304:FindFirstChild("SpectateBounds");
        if l_SpectateBounds_1 then
            for _, v307 in l_SpectateBounds_1:GetChildren() do
                table.insert(v302, {
                    v307, 
                    v304, 
                    v304:FindFirstChild("Keypoints") and v304.Keypoints.Centre
                });
            end;
        end;
    end;
    local v308 = {
        "Default", 
        "Optimized"
    };
    task.spawn(function() --[[ Line: 1236 ]]
        -- upvalues: v301 (copy), l_LocalPlayer_0 (copy), v302 (copy), v46 (ref), v308 (copy), v53 (copy)
        while true do
            task.wait(0.05);
            if not v301.Opponent.Value then
                local l_Character_2 = l_LocalPlayer_0.Character;
                local v310 = l_Character_2 and l_Character_2.PrimaryPart;
                if v310 then
                    local v311 = false;
                    for _, v313 in v302 do
                        local v314 = v313[1];
                        local l_Position_2 = v310.Position;
                        local l_Position_3 = v314.Position;
                        local l_Size_2 = v314.Size;
                        local v318 = l_Position_2 - l_Position_3;
                        local v319 = math.abs(v318.X);
                        local v320 = math.abs(v318.Z);
                        local v321 = false;
                        if v319 < l_Size_2.X / 2 then
                            v321 = v320 < l_Size_2.Z / 2;
                        end;
                        if v321 then
                            v311 = v313;
                            break;
                        end;
                    end;
                    if v311 and not v301.Cutscene.Value then
                        if not v46 and l_LocalPlayer_0.Character:FindFirstChild("Humanoid"):GetState() ~= Enum.HumanoidStateType.Freefall then
                            local _ = v311[2];
                            local v323 = v311[3];
                            local v324 = {};
                            local v325 = {};
                            for _, v327 in workspace.Live:GetChildren() do
                                if not v327:FindFirstChild("Ignore") then
                                    local l_FirstChild_1 = game.Workspace.States:FindFirstChild(v327.Name);
                                    local v329 = l_FirstChild_1 and l_FirstChild_1:FindFirstChild("CharacterData");
                                    local v330 = v329 and v329:FindFirstChild("Centre");
                                    if v330 and v330.Value == v323 then
                                        table.insert(v325, v330);
                                        table.insert(v324, v327);
                                    end;
                                end;
                            end;
                            if #v324 == 2 then
                                local v331 = v324[1];
                                local v332 = v324[2];
                                local l_FirstChild_2 = game.Workspace.States:FindFirstChild(v331.Name);
                                local l_FirstChild_3 = game.Workspace.States:FindFirstChild(v332.Name);
                                if l_FirstChild_2 and l_FirstChild_3 then
                                    local l_PlayerData_1 = l_FirstChild_2:FindFirstChild("PlayerData");
                                    local l_PlayerData_2 = l_FirstChild_3:FindFirstChild("PlayerData");
                                    if l_PlayerData_1 and l_PlayerData_2 then
                                        local l_Value_3 = l_PlayerData_1.Map.Value;
                                        local l_Value_4 = l_PlayerData_2.Map.Value;
                                        local v339 = "Default";
                                        v339 = if table.find(v308, l_Value_3) then l_Value_4 else if table.find(v308, l_Value_4) then l_Value_3 else if l_PlayerData_1.Knockdowns.Value < l_PlayerData_2.Knockdowns.Value then l_Value_4 else l_Value_3;
                                        if v339 ~= "Default" and v339 ~= "Optimized" then
                                            for _, v341 in v325 do
                                                v53[#v53 + 1] = v341.Changed:Connect(function(v342) --[[ Line: 1337 ]]
                                                    if v342 == nil then
                                                        ResetMap();
                                                    end;
                                                end);
                                            end;
                                            InitMap(v323, v339, v324);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    elseif v46 then
                        ResetMap();
                    end;
                end;
            end;
        end;
    end);
    for _, v344 in v300:GetChildren() do
        local l_SpectateVisual_0 = v344:FindFirstChild("SpectateVisual");
        if l_SpectateVisual_0 then
            local l_Pad1_0 = v344:FindFirstChild("Pad1");
            local l_Pad2_0 = v344:FindFirstChild("Pad2");
            if l_Pad1_0 and l_Pad2_0 then
                local l_l_SpectateVisual_0_Pivot_0 = l_SpectateVisual_0:GetPivot();
                local v349 = l_l_SpectateVisual_0_Pivot_0 * CFrame.new(0, -100000, 0);
                local v350 = CFrame.new(0, -6, 0);
                l_SpectateVisual_0:PivotTo(v349);
                local function v354(v351) --[[ Line: 1372 ]] --[[ Name: GetPadName ]]
                    local l_TextLabel_0 = v351:FindFirstChild("Name").SurfaceGui.Frame.TextLabel;
                    local v353 = tick();
                    repeat
                        task.wait();
                    until l_TextLabel_0.Text ~= "EMPTY" or tick() - v353 > 0;
                    return v351:FindFirstChild("Name").SurfaceGui.Frame.TextLabel.Text;
                end;
                local function _(v355) --[[ Line: 1381 ]] --[[ Name: GetMapValue ]]
                    local l_FirstChild_4 = game.Workspace.States:FindFirstChild(v355);
                    local v357 = l_FirstChild_4 and l_FirstChild_4:FindFirstChild("PlayerData");
                    if not v357 then
                        return "Default";
                    else
                        return v357.Map.Value;
                    end;
                end;
                local v359 = false;
                local v360 = nil;
                do
                    local l_v359_0, l_v360_0 = v359, v360;
                    local function v375() --[[ Line: 1393 ]] --[[ Name: Changed ]]
                        -- upvalues: l_Pad1_0 (copy), l_Pad2_0 (copy), v354 (copy), v308 (copy), l_v359_0 (ref), l_v360_0 (ref), l_l_SpectateVisual_0_Pivot_0 (copy), v350 (copy), l_SpectateVisual_0 (copy), v349 (copy), l_TweenService_0 (copy)
                        local v363 = false;
                        if l_Pad1_0.IsActive.Value and l_Pad2_0.IsActive.Value then
                            local v364 = v354(l_Pad1_0);
                            local l_FirstChild_5 = game.Workspace.States:FindFirstChild(v364);
                            local v366 = l_FirstChild_5 and l_FirstChild_5:FindFirstChild("PlayerData");
                            local v367 = not v366 and "Default" or v366.Map.Value;
                            l_FirstChild_5 = v354(l_Pad2_0);
                            v366 = game.Workspace.States:FindFirstChild(l_FirstChild_5);
                            local v368 = v366 and v366:FindFirstChild("PlayerData");
                            v364 = not v368 and "Default" or v368.Map.Value;
                            if not table.find(v308, v367) or not table.find(v308, v364) then
                                v363 = true;
                            end;
                        end;
                        if l_v359_0 ~= v363 then
                            local v369 = tick();
                            l_v360_0 = v369;
                            task.defer(function() --[[ Line: 1409 ]]
                                -- upvalues: v363 (ref), l_l_SpectateVisual_0_Pivot_0 (ref), v350 (ref), l_SpectateVisual_0 (ref), v349 (ref), v369 (copy), l_v360_0 (ref), l_TweenService_0 (ref)
                                local v370 = v363 and l_l_SpectateVisual_0_Pivot_0 * v350 or l_l_SpectateVisual_0_Pivot_0;
                                local v371 = v363 and l_l_SpectateVisual_0_Pivot_0 or l_l_SpectateVisual_0_Pivot_0 * v350;
                                local l_l_SpectateVisual_0_Pivot_1 = l_SpectateVisual_0:GetPivot();
                                if l_l_SpectateVisual_0_Pivot_1 ~= l_l_SpectateVisual_0_Pivot_0 and l_l_SpectateVisual_0_Pivot_1 ~= v349 then
                                    v370 = l_l_SpectateVisual_0_Pivot_1;
                                end;
                                for v373 = 1, 65 do
                                    if v369 ~= l_v360_0 then
                                        return;
                                    else
                                        local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v373 / 65, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out);
                                        l_SpectateVisual_0:PivotTo(v370:Lerp(v371, l_l_TweenService_0_Value_0));
                                        task.wait(0.016666666666666666);
                                    end;
                                end;
                                if v369 ~= l_v360_0 then
                                    return;
                                else
                                    l_SpectateVisual_0:PivotTo(v363 and l_l_SpectateVisual_0_Pivot_0 or v349);
                                    return;
                                end;
                            end);
                        end;
                        l_v359_0 = v363;
                    end;
                    l_Pad1_0.IsActive.Changed:Connect(function(_) --[[ Line: 1436 ]]
                        -- upvalues: v375 (copy)
                        v375();
                    end);
                    l_Pad2_0.IsActive.Changed:Connect(function(_) --[[ Line: 1440 ]]
                        -- upvalues: v375 (copy)
                        v375();
                    end);
                    v375();
                end;
            end;
        end;
    end;
    return;
end;