local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedFirst_0.Places);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v6 = l_Workspace_0.States:WaitForChild(l_LocalPlayer_0.Name);
local v7 = require(l_ReplicatedFirst_0.Cleaner);
local v8 = nil;
local v9 = nil;
local l_Centre_0 = v6.CharacterData.Centre;
local v11 = require(l_ReplicatedStorage_0.Modules.SoundHelper);
local function v22() --[[ Line: 19 ]] --[[ Name: StartCommentary ]]
    -- upvalues: v9 (ref), v8 (ref), v7 (copy), l_Workspace_0 (copy), l_ReplicatedStorage_0 (copy), l_LocalPlayer_0 (copy), v11 (copy)
    if not v9 then
        return;
    else
        if v8 then
            v8:Clean();
            v8 = nil;
        end;
        v8 = v7.new();
        local l_MatchCommentator_0 = l_Workspace_0.Settings.MatchCommentator;
        local l_CurrentLine_0 = v9.Commentary.CurrentLine;
        local v14 = false;
        v8:Add(l_CurrentLine_0.Changed:Connect(function() --[[ Line: 36 ]]
            -- upvalues: v14 (ref), l_ReplicatedStorage_0 (ref), l_MatchCommentator_0 (copy), l_CurrentLine_0 (copy), l_LocalPlayer_0 (ref), v11 (ref)
            if v14 then
                return;
            else
                local l_FirstChild_0 = l_ReplicatedStorage_0.Modules.Commentators:FindFirstChild(l_MatchCommentator_0.Value);
                if not l_FirstChild_0 then
                    return;
                else
                    local v16, v17 = string.match(l_CurrentLine_0.Value, "(.+)|(.+)");
                    local v18 = require(l_FirstChild_0);
                    if not v18 then
                        return;
                    else
                        local v19 = v18[v16 == l_LocalPlayer_0.Name and "You" or "Target"];
                        if not v19 then
                            return;
                        else
                            local v20 = v19[v17];
                            if v20 then
                                v14 = true;
                                task.delay(math.random(5, 10), function() --[[ Line: 70 ]]
                                    -- upvalues: v14 (ref)
                                    v14 = false;
                                end);
                                local v21 = typeof(v20) == "table" and v20[math.random(#v20)] or v20;
                                v11:PlaySound({
                                    SoundId = v21, 
                                    MinDist = 10, 
                                    Volume = 2, 
                                    Parent = workspace.Debris, 
                                    Name = "Commentary"
                                });
                            end;
                            return;
                        end;
                    end;
                end;
            end;
        end));
        return;
    end;
end;
local function v24() --[[ Line: 87 ]] --[[ Name: UpdateRing ]]
    -- upvalues: l_Centre_0 (copy), v8 (ref), v9 (ref), v22 (copy)
    if not l_Centre_0.Value then
        if v8 then
            v8:Clean();
            v8 = nil;
        end;
        v9 = nil;
        return;
    else
        local l_FirstAncestorWhichIsA_0 = l_Centre_0.Value:FindFirstAncestorWhichIsA("Model");
        if l_FirstAncestorWhichIsA_0 and l_FirstAncestorWhichIsA_0:FindFirstChild("Commentary") then
            v9 = l_FirstAncestorWhichIsA_0;
            v22();
        end;
        return;
    end;
end;
l_Centre_0.Changed:Connect(v24);
if not l_Centre_0.Value then
    if v8 then
        v8:Clean();
        v8 = nil;
    end;
    v9 = nil;
else
    local l_FirstAncestorWhichIsA_1 = l_Centre_0.Value:FindFirstAncestorWhichIsA("Model");
    if l_FirstAncestorWhichIsA_1 and l_FirstAncestorWhichIsA_1:FindFirstChild("Commentary") then
        v9 = l_FirstAncestorWhichIsA_1;
        v22();
    end;
end;