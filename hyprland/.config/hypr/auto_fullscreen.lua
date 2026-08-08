-- auto_fullscreen.lua
--
-- Automatically fullscreen the only tiled window on a workspace.
--
-- 1 window  -> fullscreen
-- 2+ windows -> normal tiled layout
--
-- Hyprland 0.55+

local function update_workspace(workspace)
    if workspace == nil then
        return
    end

    local windows = hl.get_workspace_windows(workspace)

    -- No windows: nothing to do
    if #windows == 0 then
        return
    end

    -- Exactly one window
    if #windows == 1 then
        hl.dispatch(
            hl.dsp.window.fullscreen({
                action = "set",
                mode = "fullscreen",
                window = windows[1],
            })
        )

        return
    end

    -- Two or more windows:
    -- make sure all windows in this workspace are not fullscreen.
    for _, window in ipairs(windows) do
        hl.dispatch(
            hl.dsp.window.fullscreen({
                action = "unset",
                window = window,
            })
        )
    end
end


-- Window opened
hl.on("window.open", function(window)
    update_workspace(window.workspace)
end)


-- Window closed
hl.on("window.close", function(window)
    update_workspace(window.workspace)
end)


-- Window moved to another workspace
hl.on("window.move_to_workspace", function(window, workspace)
    -- Update the destination workspace
    update_workspace(workspace)

    -- Update the current workspace too
    local active_workspace = hl.get_active_workspace()

    if active_workspace ~= nil then
        update_workspace(active_workspace)
    end
end)


-- User switched workspace
hl.on("workspace.active", function(workspace)
    update_workspace(workspace)
end)


-- Run once when the Lua file is loaded
update_workspace(hl.get_active_workspace())
