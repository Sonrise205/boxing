local v0 = {};
for _, v2 in game.Selection:Get()[1]:GetChildren() do
    local l_Name_0 = v2.Name;
    if l_Name_0 ~= "init" and not l_Name_0:match("%.spec") and not l_Name_0:match("%_") then
        table.insert(v0, (("%* = require(script:WaitForChild(\"%*\"));"):format(l_Name_0, l_Name_0)));
    end;
end;
table.sort(v0);
print(table.concat(v0, "\n"));