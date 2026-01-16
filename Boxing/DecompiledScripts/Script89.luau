while script:IsDescendantOf(workspace) do
    if script.Parent:GetAttribute("VISIBLE") then
        script.Parent.Handle.Transparency = 0;
    end;
    task.wait();
end;